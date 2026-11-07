# Entorno y selección de herramientas

## Control de recursos de la etapa elegida

2026-11-05: el diagnóstico acotado encontró presión de RAM del entorno de trabajo; ver [informe](frecuencia-vi/DIAGNOSTICO-RAM.md). Se agregó `tools/resource-audit.ps1`, utilidad de lectura de procesos/contadores y puertos locales de runtimes, sin terminación de procesos ni comandos completos guardados. No se instalaron herramientas, se abrieron referencias ni se relanzó la comprobación de navegador. Se reutilizaron Pillow y documentación existentes para un diagrama pequeño. Este diagnóstico no mide el rendimiento de una landing.

## Actualización de la etapa UX/UI

2026-11-05: Product Design 0.1.56 instalado y usado (index, user-context, get-context, ideate). El preflight se ejecutó con el Python incluido en `dependencies/python/python.exe` del runtime; no encontró contexto global guardado. Esto amplía la auditoría inicial, que solo había encontrado el alias de Python en PATH. Pillow del runtime permitió preparar diagramas y muestreos de evidencia, sin instalar paquetes. La investigación nueva usó el navegador integrado mediante CUA. Figma queda explícitamente fuera del flujo. No se instalaron dependencias de aplicación.

La auditoría inicial siguiente se conserva como registro de su momento.

Auditoría: 2026-11-05, America/Buenos_Aires. Windows x64. Carpeta inicialmente vacía salvo `.git`; rama `master`, sin commits y sin remotos. No había código, manifest ni instrucciones AGENTS.md en los ancestros inspeccionados.

## Herramientas encontradas

| Herramienta | Estado observado | Función y decisión |
|---|---|---|
| Node.js | v24.22.1, ejecutable funcional | Runtime de desarrollo. Reutilizar el incluido en Codex. |
| Git | 2.56.0.windows.2, funcional | Control de versiones local. No se configuraron identidad, remoto ni commits. |
| pnpm | 11.25.0, CLI comprobado | Único gestor elegido. Incluido en el runtime; wrapper local para invocarlo. |
| npm | No expuesto como comando en esta sesión | No hace falta instalarlo porque pnpm funciona. |
| Playwright | 1.62.1, biblioteca incluida | Automatización visual, viewport y preferencias de medios. Se comprobó con Chrome. |
| Chrome | 156.0.8078.80, headless comprobado | Navegador para QA y WebGL2. Sin descargar otro Chromium. |
| Edge | Ejecutable presente en ubicación estándar | Alternativa para QA; no se ejecutó. |
| Sharp | 0.35.5, WebP y AVIF comprobados | Redimensionamiento, compresión y metadatos de imágenes. |
| live-server | 1.2.2, paquete incluido | No seleccionado: Vite cubrirá servidor y build; no se lanzó. |
| ripgrep | Comando disponible | Búsqueda de archivos y texto. |
| Python | Solo alias de WindowsApps encontrado | No se considera instalación funcional verificada ni requisito de este stack. |
| FFmpeg / ffprobe / Blender | Sin comandos en PATH | Diferir hasta conocer necesidades de video y modelos. No implica que estén ausentes de todo el equipo. |
| Extensiones de VS Code | Sin inventario verificable en la ruta estándar | No se instaló un editor ni extensiones por defecto. |

**Instalaciones nuevas: ninguna.** Las herramientas necesarias para esta preparación ya existían. Se agregaron dos utilidades del entorno y documentación; no se modificaron instalaciones globales ni el PATH.

Las bibliotecas incluidas están bajo el `node_modules` hermano del directorio `bin` de Node. Esa es una capacidad de esta instalación, no una dependencia portable del futuro sitio. Al desarrollar, declarar las dependencias de la aplicación y pruebas en su propio manifest y lockfile.

## Stack recomendado para cuando se autorice el desarrollo

| Necesidad | Selección | Motivo / alternativa |
|---|---|---|
| Página | HTML + CSS + JavaScript modular | Base suficiente para una landing; sin React por defecto. TypeScript si la lógica compartida lo justifica. |
| Servidor y build | Vite, dependencia local de desarrollo | Módulos y empaquetado; Node actual cumple el mínimo documentado. No ejecutar scaffolding en etapa 1. |
| Secuencia del scroll | GSAP + ScrollTrigger | Una timeline para objeto, cámara y fondo. ScrollTrigger pertenece a `gsap`, no instalar otro paquete del mismo nombre. |
| Microinteracciones | CSS transitions; WAAPI si necesita control | Evitar otra librería para fades y estados simples. |
| Escena 3D | Three.js con WebGLRenderer | Control de objeto, cámara, materiales y luces. WebGPU y motores más grandes no tienen justificación inicial. |
| Imágenes | Sharp | Ya funciona; exportar variantes por tamaño, con transparencia donde corresponda. |
| Modelos | glTF/GLB; evaluar glTF Transform al tener un modelo | Optimizar geometrías/texturas según mediciones; no instalar compresores sin insumos. Blender solo si hay que editar o producir modelos. |
| Video | FFmpeg + ffprobe cuando se elija usar video | Comprobar formatos, filtros, tamaño, seeking y poster. Un fondo animado puede evitar esta dependencia. |
| Pruebas | Playwright; @playwright/test local al desarrollar | Capturas, errores de red/consola, responsive y estados de scroll. El runner todavía no está instalado en este proyecto. |
| Accesibilidad | Comprobación manual + axe cuando haya DOM | Teclado, foco, zoom, HTML equivalente al canvas, preferencias de movimiento. Automatización no reemplaza lector de pantalla. |
| Rendimiento | Chrome DevTools y Lighthouse | CPU, red, frames, carga y memoria. CLI local solo si se necesita repetibilidad. No se midió una página inexistente. |

No se instalaron Vite, GSAP ni Three.js todavía. Antes de hacerlo: consultar documentación oficial actual y metadatos del registro, elegir versiones compatibles, verificar licencias, instalar con versiones directas exactas y conservar el lockfile. Comprobar imports, build y ejecución real. No hay prueba todavía de descarga de paquetes, acceso al registro ni compatibilidad conjunta de versiones concretas.

Alternativas evaluadas: CSS/WAAPI cubren movimiento sencillo, pero la coordinación entre DOM y propiedades 3D favorece una timeline. Motion no aporta una necesidad adicional por ahora. Babylon.js sería una alternativa para una aplicación 3D más amplia; este brief no lo requiere. No añadir smooth scrolling personalizado por defecto.

## Skills disponibles y convivencia

Se revisaron las guías de `design-taste-frontend`, `impeccable`, `scroll-craft`, `animate`, GSAP core/ScrollTrigger y las de Three.js para arquitectura, rendimiento, accesibilidad y testing. El catálogo también ofrece GSAP timeline/performance/plugins, Three.js shaders, review-animations, emil-design-eng y frontend-design-direction. No se instalaron skills duplicadas.

La dirección futura propuesta es `scroll-craft` para narrativa y capas; GSAP y Three.js para implementación; `impeccable` para revisión. `design-taste-frontend` se mantiene como alternativa de construcción y fuente de controles, sin superponer su sistema completo. Tiene prescripciones de paleta, estructura y scripts que pueden entrar en conflicto con el brief: resolverlo antes de activar el flujo. `animate` guía microinteracciones y no sustituye el motor de la secuencia de scroll.

Evaluar una skill no equivale a ejecutar su workflow. En esta etapa no se crearon briefs de escenas, sistemas visuales, assets, páginas ni configuraciones de generación. Los scripts de scroll-craft que esperan Bash, FFmpeg y KIE necesitan una revisión específica de Windows y recursos antes de usarse.

## Plugins e integraciones

- Existen herramientas de navegador Playwright, computer-use, búsqueda web e image generation en esta sesión. Se dispone además de Sites y herramientas de documentos, hojas y presentaciones; no son necesarias para esta preparación de un repositorio local. No se activó hosting.
- Una búsqueda del catálogo de plugins por `Claude Figma GitHub` devolvió **Figma**, **GitHub** y **Product Design**, todos con `installed: false`. Que aparezcan en el catálogo no significa que haya cuenta vinculada o acceso a datos.
- GitHub sería útil para remoto, PR y CI; Figma para colaboración de diseño. Quedan opcionales, sin instalar ni conectar: requieren conexión/cuenta y solo se evaluarán al existir una tarea concreta. Git local no los necesita.
- La búsqueda no devolvió una integración con Claude. No se verificó un CLI ni credenciales de ese proveedor; no afirmar disponibilidad ni ausencia absoluta a partir del catálogo. No hace falta para la organización propuesta.
- La generación de scroll-craft por KIE usa un proveedor externo. No se inspeccionaron secretos ni se probaron credenciales; no se ejecutará sin resolver cuenta, autorización y posible coste. Priorizar recursos propios/autorizados cuando existan.

No se requieren cuentas nuevas para comenzar el desarrollo local con el stack propuesto.

## Fuentes oficiales consultadas

Consultadas el 2026-11-05; volver a comprobar al instalar:

- [Vite: guía y requisitos de Node](https://vite.dev/guide/)
- [GSAP: instalación y registro de plugins](https://gsap.com/docs/v3/Installation/)
- [ScrollTrigger: secuencias ligadas al scroll](https://gsap.com/docs/v3/Plugins/ScrollTrigger/)
- [Three.js: documentación oficial](https://threejs.org/docs/) — el índice fue accesible; la antigua URL directa del capítulo de instalación devolvió error. Revalidar el capítulo/API de la versión elegida antes de instalar.
- [pnpm: instalación de dependencias y lockfile](https://pnpm.io/cli/install)
- [Playwright: instalación y plataformas](https://playwright.dev/docs/intro)
- [Sharp: documentación](https://sharp.pixelplumbing.com/)
- [Lighthouse: auditorías](https://developer.chrome.com/docs/lighthouse/overview/)
