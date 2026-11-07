# Usa pnpm local o el incluido con Node, sin modificar instalaciones globales.
$ErrorActionPreference = 'Stop'
$taskNode = (Get-Command node -CommandType Application -ErrorAction Stop).Source
$taskRoots = @(
    (Join-Path $PSScriptRoot '..\node_modules'),
    (Join-Path (Split-Path (Split-Path $taskNode -Parent) -Parent) 'node_modules')
)
foreach ($taskRoot in $taskRoots) {
    $taskManifest = Join-Path $taskRoot 'pnpm\package.json'
    if (Test-Path -LiteralPath $taskManifest) {
        $taskPackage = Get-Content -LiteralPath $taskManifest -Raw | ConvertFrom-Json
        $taskEntry = Join-Path (Split-Path $taskManifest -Parent) $taskPackage.bin.pnpm
        if (Test-Path -LiteralPath $taskEntry) {
            & $taskNode $taskEntry @args
            exit $LASTEXITCODE
        }
    }
}
throw 'No se encontró pnpm local ni en el runtime. Consultar docs/ENTORNO.md antes de instalar.'
