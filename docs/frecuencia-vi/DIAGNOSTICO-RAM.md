# Diagnóstico acotado de RAM del entorno de trabajo

2026-11-05, America/Buenos_Aires. **Presión de memoria comprobada; causa del aumento durante peticiones no atribuida y fuga no demostrada.** La futura landing no existe: no se midió su rendimiento.

## Qué se midió

Lectura local de Win32_OperatingSystem y Win32_Process mediante CIM; contadores adicionales de memoria, clasificación por nombre/rol/parentesco sin guardar comandos completos, y puertos de escucha de runtimes Node/Python. La primera consulta CIM dentro del sandbox dio acceso denegado: sus ceros/vacíos no se trataron como muestra. Se repitió con permiso de lectura, sin terminación de procesos.

- RAM física visible para Windows: **3182,80 MiB**, aproximadamente 3,11 GiB. No equivale a verificar la RAM instalada del equipo físico.
- Muestra reproducible antes: **17:20:03**. Disponible: **161,71 MiB**.
- Muestra después del trabajo principal: **17:32:25**. Disponible: **160,82 MiB**. Diferencia: **-0,89 MiB**; prácticamente sin recuperación global de margen.
- Commit del sistema: 4912,50 → 4949,40 MiB. Commit es memoria comprometida con respaldo; no representa por sí solo RAM física residente.
- Una sonda preliminar anterior, a las 17:17, mostró 211,9 MiB disponibles. No se usa como denominador de la comparación reproducible, ni demuestra la causa de las variaciones.

Datos originales: [antes.json](diagnostico-ram/antes.json), [despues.json](diagnostico-ram/despues.json), [comparación](diagnostico-ram/comparacion.json). Unidad MiB = 2^20 bytes. Los snapshots contienen PID/PPID, creación y métricas; no líneas de comandos completas ni URLs de navegación.

## Procesos y grupos

| Grupo | Cantidad antes → después | Working set sumado, MiB | Commit privado, MiB |
|---|---|---|---|
| Aplicación de escritorio y subprocesos | 15 → 15 | 1289,25 → 1274,35 | 1861,60 → 1871,53 |
| Helpers de runtime CUA, propiedad individual no establecida | 9 → 7 | 253,44 → 87,70 | 298,14 → 76,09 |
| Agente y hosts de herramientas | 9 → 4 | 393,33 → 267,65 | 241,84 → 217,37 |
| Otros runtimes Node, sin atribución de proyecto | 3 → 3 | 98,91 → 83,02 | 220,73 → 220,73 |
| WebView2 aparecido en la muestra final | 0 → 6 | 0,00 → 227,49 | 0,00 → 212,55 |

No sumar estas cifras como si fueran RAM física única: el working set incluye páginas compartidas que se pueden contar varias veces. El commit privado tampoco es RAM residente. Los contadores se obtuvieron secuencialmente, no de forma atómica.

La aplicación tiene 15 procesos en ambas muestras. En la final se distinguieron: proceso principal, 7 renderers, GPU, 4 procesos utility y 2 crash handlers. Working set final aproximado: principal 231,35 MiB, renderers 856,98 MiB, GPU 71,91 MiB y auxiliares 114,11 MiB. No se pudo asociar cada renderer a una pestaña, chat o función: no se atribuye todo al proyecto.

Los contadores suplementarios de working set privado de la cohorte de escritorio pasaron de 916,69 a 904,41 MiB, mientras su commit privado subió ligeramente. No es prueba de fuga ni de liberación definitiva de heap. Para los procesos WebView2 nuevos, el contador privado resultó muy bajo frente a las otras métricas; no se usa para atribuirles un consumo físico preciso.

La agrupación `external-browser` del JSON final incluye seis `msedgewebview2.exe`, creados durante el intervalo. El PPID del proceso raíz fue 3452; una consulta dirigida identificó ese PID como **SearchApp**. No es una sesión de prueba que se haya abierto para este proyecto. Se mantuvo intacto. La utilidad se ajustó después para nombrar por separado WebView2 en futuras lecturas; los JSON originales no se reescribieron.

## Recursos abiertos, propiedad y medidas aplicadas

- Inventario CUA del chat: navegador integrado sin pestañas y MCP Apps sin pestañas. No se abrió ni recargó una referencia. Chrome y Edge independientes no aparecieron en la muestra inicial; el WebView2 posterior se distingue del navegador integrado y no se cerró.
- No se encontraron puertos de escucha en los runtimes Node/Python muestreados. No equivale a descartar cualquier servidor del sistema, pero no hay un servidor de landing identificado para cerrar.
- Había hosts/REPLs CUA y Node, pero su nombre, antigüedad o ruta no prueban propiedad individual del proyecto. **No se mató ningún proceso.** No se tocó aplicación principal, procesos de búsqueda, otros proyectos ni pestañas personales.
- Se reinició mediante la API oficial únicamente el contexto CUA usado para este inventario. La llamada confirmó el reset. La cohorte CUA bajó de 9 a 7 procesos y su commit de 298,14 a 76,09 MiB; la coincidencia temporal no permite atribuir cada salida o byte exclusivamente a esa acción, porque los hosts también gestionan sus ciclos de vida.
- No hubo generación de imágenes, browser externo nuevo, sesión 3D, servidor, grabación ni agentes paralelos. Se reutilizaron las evidencias, las fuentes, el concepto elegido y las bibliotecas ya disponibles. Un único diagrama de 1600×1080 explicó la secuencia, sin volver a cargar todas las referencias.
- Las utilidades de diagnóstico y diagrama terminaron; no se dejaron procesos propios de monitorización o servidores. No se promete limpiar runtimes de origen incierto.

## Conclusión y límites

La presión global **persiste**. La bajada de una cohorte de helpers no produjo una recuperación global clara de RAM disponible; durante el intervalo también aparecieron otros procesos y Windows gestiona memoria/paginación. No hay un experimento aislado que atribuya el aumento observado por el usuario a Product Design, ImageGen, un navegador, una herramienta concreta o un proyecto.

Dos muestras no demuestran una fuga. Faltan una serie temporal de una carga reproducible, atribución de renderers a funciones y, solo si se justifica y existe margen, perfilado de memoria de un proceso concreto. No se realizaron heap dumps, captura continua ni una nueva carga pesada para forzar el problema.

La medida inmediata controlable es mantener el flujo contenido: una tarea, una sesión/pestaña propia como máximo cuando sea imprescindible, evidencia existente, viewport/DPR bajos y captura breve, limpieza por ID con propiedad establecida en `finally`, sin generación/capturas paralelas. En esta máquina, <512 MiB libres es una señal operativa para **posponer la futura prueba 3D**, no un umbral de calidad de la landing ni autorización para cerrar aplicaciones ajenas.

## Repetir solo cuando haya una nueva pregunta

Desde PowerShell, `tools/resource-audit.ps1 -Label <etiqueta-nueva>`. Requiere acceso de lectura CIM; si falla, informar el límite en vez de concluir que no hay procesos. La utilidad no cierra nada. Usar etiquetas nuevas para preservar muestras, comparar las mismas unidades y anotar qué se ejecutó entre ambas. No repetir el inventario solo para buscar una cifra más favorable.
