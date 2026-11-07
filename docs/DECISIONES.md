# Registro de decisiones y verificaciones

## 2026-11-05 — preparación inicial

- Se incorporó la temática GTA 6 solicitada en el chat a las instrucciones persistentes. El adjunto repetía el alcance de preparación; no se inició el diseño ni la aplicación.
- Repositorio inicial: solo `.git`, rama master sin commits; sin remoto. No se sobrescribió trabajo previo.
- Se reutiliza Node 24.22.1 y pnpm 11.25.0 incluidos. npm no estaba expuesto como comando. No se modificó PATH ni se instaló un segundo gestor.
- Stack futuro recomendado: HTML/CSS/JavaScript + Vite, GSAP/ScrollTrigger y Three.js. Diferidos hasta autorizar desarrollo, para fijar versiones y probarlos con la aplicación. React/TypeScript no tienen justificación todavía.
- Se revisó el catálogo de skills y plugins. Figma/GitHub no están instalados; Claude no apareció en la búsqueda realizada. No se conectaron proveedores ni se inspeccionaron credenciales.
- Herramientas nuevas instaladas: ninguna. Se agregaron documentación, `.gitignore`, un wrapper de pnpm y un diagnóstico reutilizable. No se creó package.json ni código de aplicación.

### Comprobaciones realizadas

- Node y Git: comandos de versión correctos.
- pnpm incluido: ejecución CLI correcta, 11.25.0.
- Sharp 0.35.5: codificación y lectura en memoria de WebP y AVIF de 8×8 px correctas. No se generaron recursos creativos.
- Playwright 1.62.1: lanzó Chrome 156.0.8078.80 headless en página vacía, viewport 1440×900; cambió a 390×844; `prefers-reduced-motion: reduce` y contexto WebGL2 disponibles. Cerró el navegador creado. Esto comprueba capacidades del entorno, no una landing.
- Verificación final: `node tools/check-environment.cjs --browser` terminó con código 0 y todos los controles PASS; `tools/pnpm.ps1 --version` devolvió 11.25.0. Sintaxis JavaScript, enlaces locales de documentación y espacios finales comprobados sin errores. El diagnóstico usa la página vacía que crea Playwright, sin una navegación adicional innecesaria.
- Edge: archivo presente; ejecución no comprobada. FFmpeg, ffprobe y Blender: no encontrados como comandos. Python: alias detectado, runtime no validado.

### Pendientes

- Esperar la indicación del usuario para comenzar diseño/desarrollo.
- Al diseñar: investigar datos oficiales GTA 6 y referencias actuales; definir contenido, recursos autorizados, objeto/fondo, estructura, presupuestos y acción principal. No se fijaron fecha de lanzamiento, escenas, paleta ni assets en esta preparación.
- Al desarrollar: validar registro de paquetes y versiones concretas; crear manifest/lockfile; instalar Vite, GSAP y Three.js; probar imports y build. Declarar tooling local necesario para portabilidad.
- Añadir FFmpeg/ffprobe, Blender, glTF Transform o axe solo cuando una tarea justifique cada uno. Sus pipelines no fueron probados.
- QA de página, rendimiento, Safari/iOS, Android real y lectores de pantalla: no ejecutados, porque todavía no hay aplicación.

## 2026-11-05 — investigación y propuestas de primera edición

- El usuario autorizó investigación visual y comparación creativa, manteniendo la prohibición de implementar y generar recursos finales. Se actualizó AGENTS.md para reflejar el alcance nuevo.
- Se aplicó scroll-craft con sus referencias de estructura, emoción, profundidad y evidencia. Se compararon tres estructuras propias en vez de cambiar únicamente colores de una misma escena.
- Se consultaron siete sitios: Rockstar GTA VI, Lusion, Apple AirPods Pro, Cyberpunk, Kojima Death Stranding 2, Bruno Simon y Teenage Engineering OB–4. Las observaciones y sus límites están en REFERENCIAS.md.
- Se capturaron páginas públicas con Chrome headless. Las capturas son investigación de sitios ajenos, no diseños propios ni assets de la futura landing. Las muestras de carga y consentimientos se distinguen de las seleccionadas.
- La primera pasada nativa encontró una restricción de red; se repitió con acceso de red permitido. Hubo timeouts al capturar Lusion, por lo que no se declara verificada una coreografía completa de ese sitio. No se hicieron transacciones, logins ni envío de datos.
- Rockstar oficial verificó el marco de Vice City/Leonida y Jason/Lucia; no se necesita incorporar fecha de lanzamiento. El material de Media es consultable, pero la disponibilidad no se convierte en autorización para modificar recursos.
- Tres propuestas: **1 Postal de Leonida**, **2 Última salida**, **3 Frecuencia VI**. Se recomienda 1 por su relación entre identidad, impacto y alcance, sin marcarla como elegida. Se propone un CTA común al tráiler oficial.
- Decisión técnica: conservar el stack previsto y una sola fuente de progreso para coordinar objeto/fondo; no sumar motores, frameworks ni dependencias durante investigación. Video con seeking se limita a la opción 2 y requiere validación móvil futura.
- No se instaló nada ni se generaron modelos, videos, imágenes finales, prototipos o código de aplicación. Se incorporaron documentos, capturas y metadatos de investigación. No hay evidencia de rendimiento de las propuestas porque no se han implementado.
- Pendiente del usuario: elegir 1, 2, 3 o combinación. D02/D03 no se consideran aprobadas ni completas por presentar alternativas; implementación y publicación siguen fuera de esta etapa.

## 2026-11-05 — Frecuencia VI elegida; UX/UI y coreografía

- El usuario eligió Frecuencia VI y corrigió el énfasis: radio protagonista con volumen y movimiento elaborado, no radio pequeña con dial y fondo cromático. Se conserva el estudio anterior como historial.
- Se usó Product Design 0.1.56 para contexto e ideación, scroll-craft para narrativa y profundidad, y criterios de emil-design-eng para calidad. No se usó Figma. El preflight global no encontró user-context.md; el brief procede de los documentos del proyecto y del pedido vigente.
- Se observó OB–4 en una secuencia de diez muestras: scroll quieto y video avanzando. Se accionó GSAP Scrub Animations en nueve posiciones con ida/vuelta, comprobando igualdad de matrices y fondo en posiciones equivalentes. Se relacionó ese comportamiento con su JS público. No se confunde el video de OB–4 ni esa demo 2D con prueba de nuestra radio 3D.
- Una observación 3D adicional de Three.js quedó inconclusa por timeouts del navegador; solo un cuadro persistido, sin medición de movimiento o rendimiento. Se documentó el límite. Algunas llamadas locales también demoraron; no se afirmó guardar documentación antes de comprobar su existencia.
- Se generaron dos conceptos estáticos con la herramienta integrada y referencias adjuntas: 1 Señal de Leonida, 2 Ciudad en capas. Se copiaron al proyecto. Son apariencia exploratoria, no assets finales ni animación comprobada. No se activó un proveedor externo, CLI de generación, suscripción o publicación.
- Recomendación del agente: variante 1 por su continuidad entre radio y ambiente GTA VI. Ninguna variante aprobada por el usuario. La variante 2 se mantiene como alternativa real de composición superior oblicua y capas.
- Entregables en docs/frecuencia-vi/: UX/UI, storyboard de cinco momentos, evidencia/mediciones, prueba representativa y recursos, revisión y prompts. Separación explícita de scroll, ambiente y puntero; composición móvil, movimiento reducido y acceso sin WebGL.
- Revisión independiente: se corrigió el orden inicial Z del frente/vidrio y se fijó una relación de apertura que conserva las capas. Falta validar geometría real.
- Se mantuvo el stack previsto, sin instalarlo. No se escribió código de aplicación, se creó un servidor ni se programó un prototipo. Las utilidades ejecutadas solo prepararon documentos y evidencia estática/temporal de referencias.
- Pendientes: C02, elección entre variantes 1 y 2; producción del modelo, materiales, entorno y posters; futura prueba de apertura; implementación únicamente tras la siguiente indicación del usuario.

## 2026-11-05 — Variante 1 confirmada, entrada y control de RAM

- El usuario eligió explícitamente variante 1 Señal de Leonida. La referencia original se conserva y su SHA-256 queda registrado; no se generaron otras direcciones o imágenes.
- Se priorizó RAM antes de otra carga pesada. Lecturas reproducibles: RAM visible 3182,80 MiB; disponible 161,71 → 160,82 MiB. Presión persistente; sin fuga o causalidad demostrada. Las muestras y limitaciones están en DIAGNOSTICO-RAM.md.
- Se verificó navegador integrado/MCP Apps sin pestañas. No se encontraron recursos de navegador o servidores propios para cerrar. Se reseteó solo el contexto CUA de inventario; no se terminaron procesos desconocidos. El WebView2 surgido al final era hijo de un PID identificado como SearchApp y se conservó.
- Medidas: sin imágenes nuevas, referencias reabiertas, sesiones 3D, servidores ni agentes paralelos; diagrama pequeño y utilidades efímeras. Se agregó resource-audit.ps1, de lectura y persistencia de métricas acotadas.
- UX/UI V2: preparación real, GTA VI centrado, mismo H1 hacia portada, reconocimiento, sintonía A/B por perilla y aguja, radio que baja para descubrir B y resolución. El final de la entrada coincide con p=0; se especifican interrupciones, historial y visitas posteriores sin reiniciar la intro.
- La apertura protagonista de carcasa queda retirada. Carcasa cerrada en coreografía base y prueba mínima. Una separación futura sería opcional y subordinada a la sintonización, no al relato de circuitos.
- La nueva prueba mínima validará transición del título y una sintonía completa entre playa al atardecer y avenida costera nocturna, con volumen real, luz/reflejos coherentes, reversibilidad y fallbacks. Está planificada, no implementada.
- Se conservan los documentos originales como antecedentes con enlaces a versiones V2, y el índice anterior como README-ETAPA-UX-INICIAL.md. Actualizados AGENTS, README, tareas y entorno. No hay landing, prototipo funcional, modelos ni videos finales.
- Siguiente paso recomendado: la prueba pequeña, únicamente tras nueva indicación del usuario y con margen de memoria suficiente. Mientras persista presión, no abrir otra sesión pesada para comprobar lo ya documentado.
