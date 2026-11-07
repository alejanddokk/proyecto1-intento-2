# Diagnostico acotado, de solo lectura sobre procesos; no finaliza recursos.
param(
    [Parameter(Mandatory=$true)][ValidatePattern('^[a-zA-Z0-9_-]+$')][string]$Label
)
$ErrorActionPreference = 'Stop'
$taskRoot = Split-Path $PSScriptRoot -Parent
$taskOutput = Join-Path $taskRoot 'docs\frecuencia-vi\diagnostico-ram'
New-Item -ItemType Directory -Path $taskOutput -Force | Out-Null
$taskLimits = [System.Collections.Generic.List[string]]::new()
$taskOS = $null
$taskPerf = $null
$taskPrivateWS = @{}
$taskProcesses = @()
try {
    $taskOS = Get-CimInstance Win32_OperatingSystem
    $taskProcesses = @(Get-CimInstance Win32_Process)
} catch {
    throw 'CIM no accesible. No interpretar valores vacios como cero; usar Get-Process como evidencia parcial o ejecutar con el permiso de lectura apropiado.'
}
try {
    $taskPerf = Get-CimInstance Win32_PerfFormattedData_PerfOS_Memory
    foreach ($taskCounter in (Get-CimInstance Win32_PerfFormattedData_PerfProc_Process)) {
        if ($taskCounter.IDProcess -gt 0) {
            $taskPrivateWS[[int]$taskCounter.IDProcess] = [double]$taskCounter.WorkingSetPrivate
        }
    }
} catch { $taskLimits.Add('Contadores privados/commit del sistema no disponibles; se conservan metricas Win32_Process.') }
$taskRelevant = @($taskProcesses | Where-Object {
    $_.Name -match '^(ChatGPT|Codex|codex.*|chrome|msedge|msedgewebview2|node|node_repl|python|pythonw|pwsh|powershell|cmd|ffmpeg)\.exe$'
})
$taskRows = foreach ($taskProcess in $taskRelevant) {
    $taskCommand = [string]$taskProcess.CommandLine
    $taskName = [string]$taskProcess.Name
    $taskBrowser = $taskName -match '^(ChatGPT|chrome|msedge|msedgewebview2)\.exe$'
    $taskKind = 'main-or-cli'
    if ($taskBrowser -and $taskCommand -match '--type=([^\s"]+)') { $taskKind = $Matches[1] }
    $taskGroup = if ($taskName -eq 'ChatGPT.exe') { 'desktop-app' }
        elseif ($taskName -match '^codex') { 'agent-and-tool-hosts' }
        elseif ($taskName -match '^msedgewebview2') { 'webview2-unattributed' }
        elseif ($taskName -match '^(chrome|msedge)') { 'external-browser' }
        elseif ([string]$taskProcess.ExecutablePath -match 'cua_node') { 'cua-runtime-helper' }
        elseif ($taskName -match '^(node|node_repl)') { 'node-runtime-unattributed' }
        elseif ($taskName -match '^python') { 'python-unattributed' }
        else { 'shell-or-other' }
    $taskPrivate = if ($taskPrivateWS.ContainsKey([int]$taskProcess.ProcessId)) {
        [math]::Round($taskPrivateWS[[int]$taskProcess.ProcessId]/1MB,2)
    } else { $null }
    [pscustomobject]@{
        pid=[int]$taskProcess.ProcessId; ppid=[int]$taskProcess.ParentProcessId
        name=$taskName; group=$taskGroup; kind=$taskKind
        createdUtc=if($taskProcess.CreationDate){$taskProcess.CreationDate.ToUniversalTime().ToString('o')}else{$null}
        workingSetMiB=[math]::Round([double]$taskProcess.WorkingSetSize/1MB,2)
        privateWorkingSetMiB=$taskPrivate
        privateCommitMiB=[math]::Round([double]$taskProcess.PrivatePageCount/1MB,2)
        projectPathMentioned=$taskCommand.Contains($taskRoot)
        automationHint=($taskBrowser -and $taskCommand -match 'headless|remote-debugging|playwright')
        projectOwnership='not-established'
    }
}
$taskGroups = foreach ($taskGroup in ($taskRows | Group-Object group)) {
    [pscustomobject]@{
        group=$taskGroup.Name; processes=$taskGroup.Count
        summedWorkingSetMiB=[math]::Round(($taskGroup.Group | Measure-Object workingSetMiB -Sum).Sum,2)
        privateWorkingSetMiB=if(@($taskGroup.Group | Where-Object { $null -ne $_.privateWorkingSetMiB }).Count -eq $taskGroup.Count){[math]::Round(($taskGroup.Group | Measure-Object privateWorkingSetMiB -Sum).Sum,2)}else{$null}
        privateCommitMiB=[math]::Round(($taskGroup.Group | Measure-Object privateCommitMiB -Sum).Sum,2)
    }
}
$taskListeners = @()
try {
    $taskNodeIds=@($taskRows | Where-Object { $_.name -match '^(node|python)' } | Select-Object -ExpandProperty pid)
    if (Get-Command Get-NetTCPConnection -ErrorAction SilentlyContinue) {
        $taskListeners=@(Get-NetTCPConnection -State Listen -ErrorAction Stop | Where-Object {
            $_.OwningProcess -in $taskNodeIds
        } | Select-Object @{n='pid';e={[int]$_.OwningProcess}},LocalAddress,LocalPort)
    } else { $taskLimits.Add('Inventario de puertos de escucha no disponible.') }
} catch { $taskLimits.Add('No se pudo consultar puertos de escucha. No se descartan servidores por este metodo.') }
$taskLimits.Add('Los procesos de renderizado integrados no se asignan a pestañas por PID. Los helpers no tienen propiedad de proyecto demostrada.')
$taskLimits.Add('Working set sumado puede contar paginas compartidas varias veces; private commit no equivale a RAM fisica residente. Contadores tomados en instantes ligeramente distintos.')
$taskResult=[pscustomobject]@{
    label=$Label; timestampUtc=(Get-Date).ToUniversalTime().ToString('o')
    totalPhysicalMiB=[math]::Round([double]$taskOS.TotalVisibleMemorySize/1024,2)
    availablePhysicalMiB=[math]::Round([double]$taskOS.FreePhysicalMemory/1024,2)
    systemCommittedMiB=if($taskPerf){[math]::Round([double]$taskPerf.CommittedBytes/1MB,2)}else{$null}
    systemCommitLimitMiB=if($taskPerf){[math]::Round([double]$taskPerf.CommitLimit/1MB,2)}else{$null}
    groups=@($taskGroups); processes=@($taskRows | Sort-Object workingSetMiB -Descending)
    runtimeListeningPorts=$taskListeners; limitations=@($taskLimits)
    actions='Read-only. No process terminated. No full command line or browsing URL persisted.'
}
$taskResult | ConvertTo-Json -Depth 6 | Set-Content -LiteralPath (Join-Path $taskOutput ($Label+'.json')) -Encoding utf8
[pscustomobject]@{label=$Label;timestampUtc=$taskResult.timestampUtc;totalPhysicalMiB=$taskResult.totalPhysicalMiB;availablePhysicalMiB=$taskResult.availablePhysicalMiB;systemCommittedMiB=$taskResult.systemCommittedMiB;groups=$taskResult.groups;listeners=$taskListeners;limitations=$taskResult.limitations} | ConvertTo-Json -Depth 5
