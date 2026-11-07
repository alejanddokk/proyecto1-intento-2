# Plan y aceptación

## Etapa 1: preparación

| ID | Tarea | Depende de | Aceptación | Estado |
|---|---|---|---|---|
| P01 | Revisar repositorio e instrucciones | — | Identificar archivos, Git y trabajo previo | Hecha |
| P02 | Inventariar y verificar herramientas | P01 | Versiones y comprobaciones reales registradas | Hecha |
| P03 | Seleccionar stack y skills | P02 | Función definida, fuentes y diferidos documentados | Hecha |
| P04 | Dejar instrucciones y utilidades | P03 | AGENTS.md, diagnóstico y acceso a pnpm funcionales | Hecha |
| P05 | Cerrar preparación | P04 | Informe, pendientes y ausencia de código de aplicación | Hecha |

## Etapa 2: investigación comparativa autorizada el 2026-11-05

| ID | Tarea | Depende de | Aceptación | Estado |
|---|---|---|---|---|
| R01 | Analizar referencias reales actuales | Preparación, pedido de investigación | Siete referencias directas; observación separada de descripción; procedencia y límites | Hecha |
| R02 | Presentar tres direcciones distintas | R01 | Concepto, objeto, cuatro momentos, contenido, móvil, recursos y viabilidad por opción | Hecha |
| R03 | Recomendar y comparar sin elegir por el usuario | R02 | Recomendación de opción 1, comparación y posibles combinaciones | Hecha |
| C01 | Elección creativa del usuario | R03 | Frecuencia VI, dirección 3, elegida explícitamente | Hecha |

Entregables históricos en `docs/investigacion/`. Dirección elegida posteriormente: Frecuencia VI. No hay aplicación, prototipos ni assets finales. Las capturas son evidencia de sitios ajenos.

## Etapa 3: UX/UI y movimiento de Frecuencia VI

| ID | Tarea | Aceptación | Estado |
|---|---|---|---|
| F01 | Completar observación temporal | OB–4 muestreado con scroll fijo y GSAP accionado y medido en ida/vuelta; fuente e hipótesis separadas | Hecha |
| F02 | Desarrollar dos variantes | Radio grande en ambas, composiciones y tratamiento del objeto distintos; conceptos estáticos identificados | Hecha |
| F03 | Especificar UX/UI y cinco momentos | Seis campos por momento, móvil, movimiento reducido, no-WebGL y sistemas separados | Hecha como propuesta |
| F04 | Definir prueba y recursos | Volumen, transformación, coordinación, reversibilidad y QA con aceptación observable | Hecha como especificación; prueba no ejecutada |
| F05 | Revisar calidad | Lectura visual y revisión independiente de consistencia; corregir orden de capas | Hecha; QA de aplicación pendiente |
| C02 | Elegir variante | Usuario eligió explícitamente 1 Señal de Leonida | Hecha |

La etapa anterior queda como antecedente. C02 está hecha por decisión explícita del usuario. La entrega vigente sigue en `docs/frecuencia-vi/`, con versiones V2 de UX/UI, storyboard y prueba. La implementación requiere la siguiente indicación del usuario.

## Etapa 4: recursos y secuencia elegida

| ID | Tarea | Aceptación | Estado |
|---|---|---|---|
| M01 | Diagnosticar memoria antes de otra sesión pesada | Procesos y métricas separados, inventario de pestañas, límites de atribución | Hecha; ver informe RAM |
| M02 | Contener y comparar | Sin sesiones pesadas/parallel, solo limpieza de recursos propios seguros, muestras antes/después | Hecha; sin atribución de fuga |
| S01 | Registrar variante 1 y entrada tipográfica | Mismo H1: centro → portada; carga real, interrupciones y visitas posteriores definidos | Hecha como especificación |
| S02 | Actualizar sintonía como transformación central | Seis momentos, estados de título/cámara/radio/perilla/aguja/fondo/luz; carcasa cerrada | Hecha como especificación |
| S03 | Definir acceso móvil/reducido/fallos | Composición propia y contenido accesible sin WebGL/carga completa | Hecha como especificación |
| S04 | Planear prueba mínima de título + A/B | Criterios verificables antes de extender la landing | Hecha; no implementada |

## Próximas etapas

Estas tareas describen el trabajo futuro; no autorizan iniciarlo ahora.

| ID | Tarea | Depende de | Criterio de aceptación |
|---|---|---|---|
| D01 | Investigar lanzamiento y referencias actuales | Pedido de investigación | Cumplida en R01; revalidar hechos cambiantes al incorporar contenido |
| D02 | Definir objetivo, contenido, recursos y dirección | D01, C01, C02 | Variante 1 elegida; UX/UI actualizado en UX-UI-V2.md |
| D03 | Precisar la secuencia elegida y sus presupuestos | D02 | Seis momentos en STORYBOARD-V2.md, contención de RAM y prueba de entrada/sintonía especificadas; validación funcional pendiente |
| I01 | Inicializar stack local con versiones fijadas | Autorización de desarrollo, D03 | Manifest, un lockfile, instalación reproducible, servidor local, imports y build comprobados |
| I02 | Implementar una sección representativa | I01 | Objeto visible, fondo sincronizado, HTML accesible, carga/error/fallback y móvil funcionando |
| I03 | Completar contenido e interacciones | I02 | Enlaces y controles reales, recursos optimizados y sin placeholders engañosos |
| Q01 | Verificación visual, funcional y rendimiento | I03 | Matriz de controles inferior con evidencia y limitaciones |
| Q02 | Entrega local | Q01 | Build verificable, documentación y lista de pendientes; publicación solo cuando el usuario la autorice |

Cada tarea en curso debe registrar responsable, archivos afectados y resultado de sus verificaciones. Delegar solo unidades independientes con criterios claros; evitar edición simultánea sobre los mismos archivos.

## Criterios para considerar terminada la landing

- Tema GTA 6 reconocible y datos contrastados en fuentes oficiales al incorporar contenido. Ningún dato de fecha, plataforma o precio inventado. Procedencia, licencia y atribución de cada recurso registradas.
- Objeto 3D presente y correctamente encuadrado; cambio de aspecto, posición o transformación coordinado con el fondo al avanzar y retroceder el scroll. Comprobar inicio, 25%, 50%, 75%, final y estados intermedios críticos sin saltos o vacíos involuntarios.
- Revisar capturas a 1440×900, 1024×768, 768×1024 y 390×844; añadir 360 px y orientación horizontal para detectar recortes. Sin desborde horizontal ni texto tapado. Móvil con composición adaptada, no mera reducción del escritorio.
- `prefers-reduced-motion` activo desde la carga y al cambiar la preferencia: composición estable, sin parallax ni desplazamientos de cámara innecesarios. Controles para detener movimiento automático cuando corresponda.
- HTML semántico, encabezados coherentes, foco visible, navegación por teclado, zoom 200%, contraste y controles táctiles suficientes. Información y acciones esenciales disponibles sin canvas, WebGL o video. Probar errores de carga, red lenta y fallos de reproducción.
- Build de producción correcto; cero errores no resueltos de consola, imports, red o recursos. Enlaces y acciones comprobados sobre el build servido por HTTP local.
- Auditar accesibilidad automáticamente y manualmente; resolver hallazgos graves. Registrar lectores de pantalla o dispositivos que no se pudieron probar, sin darles aprobación implícita.
- Objetivos iniciales a validar contra dispositivos y recursos elegidos: LCP ≤2,5 s, CLS ≤0,1, INP ≤200 ms. Las pruebas de laboratorio previas a publicar son aproximaciones; INP de campo queda sin verificar hasta disponer de datos reales. Definir peso máximo de assets en D03 y medir transferencias reales.
- Objetivo de animación: 60 fps en escritorio de referencia y experiencia utilizable en móvil de referencia, con degradación por resolución/calidad cuando haga falta. Registrar hardware, viewport, DPR, método y frames; WebGL headless no demuestra rendimiento de GPU móvil.
- Revisar resize, ocultar/restaurar pestaña y reinicialización: sin bucles duplicados, listeners sobrantes ni crecimiento sostenido de recursos. Liberar geometrías, materiales y texturas de la escena que se posean.
- Entregar capturas e informe con PASS/FAIL/no ejecutado, comandos reproducibles y pendientes. No usar una puntuación de Lighthouse como única prueba de calidad.
