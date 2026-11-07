# intento 2 — instrucciones de trabajo

## Alcance autorizado

Actualización 2026-11-05: el usuario eligió **Frecuencia VI, variante 1 — Señal de Leonida**, en `docs/frecuencia-vi/visuales/variante-1-senal-de-leonida.png`. Mantener su apariencia, radio oscura protagonista, volumen y materiales, playa al atardecer, reflejos cálidos y título superior izquierdo. Estado vigente en `docs/frecuencia-vi/README.md`, `UX-UI-V2.md`, `STORYBOARD-V2.md` y `PRUEBA-Y-RECURSOS-V2.md`. Entrada: preparación real, GTA VI centrado y transición del mismo título a portada; después scroll reversible. La perilla y aguja sintonizan el entorno, luces y reflejos; la radio baja/reencuadra para descubrir otro fondo. La apertura de carcasa deja de ser protagonista y queda como recurso secundario opcional, fuera de la prueba mínima. No volver a pedir elegir variantes ni generar otras direcciones.

Alcance actual: diagnóstico acotado de RAM, UX/UI y especificación; utilidades y diagramas permitidos. No programar landing ni prototipo funcional, no producir modelos/videos finales ni generar imágenes nuevas si el material existente y diagramas bastan. Product Design mantiene fidelidad; scroll-craft apoya movimiento; criterios Three.js/GSAP resuelven arquitectura futura. Figma excluido. Implementación pendiente de la siguiente indicación del usuario. Conservar los archivos anteriores como antecedentes, sin confundirlos con el estado vigente.

La etapa 1 comprende únicamente preparación del entorno y documentación. Está terminada cuando las herramientas necesarias ahora funcionan y los pendientes están registrados. Detenerse allí: esperar indicación del usuario antes de diseñar o escribir la landing, componentes, prototipos o código de aplicación. Los scripts de `tools/` son utilidades del entorno.

Temática confirmada: lanzamiento de Grand Theft Auto VI (GTA 6). Mantenerla en las próximas etapas. Verificar fechas, plataformas, anuncios y enlaces en Rockstar Games al incorporar contenido; no fijar una fecha ni crear una cuenta regresiva a partir de recuerdos. No presentar el proyecto como oficial sin autorización que lo respalde.

No contratar servicios, activar suscripciones, gastar créditos, publicar ni enviar mensajes. Las instalaciones gratuitas pertinentes y los cambios locales reversibles están autorizados dentro de la etapa vigente. Si una herramienta requiere una cuenta, credenciales, un pago o permisos adicionales sin autorización, registrar el requisito como pendiente.

## Inicio de cada sesión

1. Leer este archivo, `README.md`, `docs/ENTORNO.md`, `docs/TAREAS.md`, las últimas entradas de `docs/DECISIONES.md` y `docs/frecuencia-vi/README.md`. Las propuestas anteriores son históricas.
2. Revisar `git status --short --branch`, archivos existentes y cualquier instrucción anidada. Preservar cambios previos del usuario. No crear commits, alterar remotos ni cambiar configuraciones globales como parte de una revisión rutinaria.
3. Ejecutar `node tools/check-environment.cjs` si cambiaron el equipo o las herramientas; agregar `--browser` cuando corresponda comprobar navegador y WebGL. Revisar las salidas reales, no asumir que una herramienta anunciada funciona.
4. Elegir una tarea autorizada y registrar dependencias, aceptación y verificación. No iniciar una etapa bloqueada por la autorización del usuario.

## Selección de skills

Las skills son guías; las instrucciones del usuario prevalecen. Leer el SKILL.md de cada skill que se aplique e informar su primer uso. El inventario y los roles están en `docs/ENTORNO.md`.

- La dirección principal de diseño actual es Product Design. Usar `scroll-craft` como apoyo para relato, profundidad y coreografía, sin superponer otro sistema completo de construcción. Sus requisitos de generación externa no autorizan gasto ni cuentas nuevas.
- Evaluar `design-taste-frontend` antes de construir: aporta composición y validadores, pero no imponer su plantilla, selección aleatoria, prohibiciones cromáticas o ritmo por pantalla contra el brief de GTA 6. No activar dos sistemas de construcción completos sobre la misma página. Si se elige otro flujo principal, registrar la decisión.
- `impeccable`: revisión de jerarquía, responsive, accesibilidad y acabado; ejecutar su preparación cuando se aplique, sin crear contexto visual ficticio en esta etapa.
- `animate`: microinteracciones. CSS para efectos simples. La secuencia coordinada de objeto y fondo se resuelve con `gsap-core`, `gsap-timeline` y `gsap-scrolltrigger`; `gsap-performance` para optimización. Evitar motores paralelos sobre las mismas propiedades.
- `threejs-web`: arquitectura 3D; sumar `threejs-accessibility`, `threejs-performance` y `threejs-testing` según la tarea. `threejs-shaders` solo si un efecto concreto lo necesita.
- `review-animations` para revisión de movimiento existente; `emil-design-eng` y `frontend-design-direction` como consultas puntuales, evitando otra dirección visual competidora.

## Trabajo y decisiones

### Contención y diagnóstico de recursos

- Antes de otra sesión pesada, consultar `docs/frecuencia-vi/DIAGNOSTICO-RAM.md`. Usar `tools/resource-audit.ps1 -Label <etiqueta>` para una lectura acotada; CIM puede requerir permiso de lectura fuera del sandbox. Un fallo de acceso no significa memoria cero. No guardar comandos completos, URLs privadas ni secretos.
- Comparar working set privado, commit privado y RAM disponible por separado. El working set sumado puede duplicar páginas compartidas. No declarar una fuga ni culpar una herramienta con solo dos muestras o por memoria ocupada.
- Mantener una tarea y una sesión de navegador como máximo; no ejecutar generación, grabación/capturas y agentes paralelos durante presión de memoria. En la máquina medida, <512 MiB disponibles es una señal operativa para posponer una sesión 3D pesada, no una métrica de la futura landing.
- Reutilizar evidencia y no abrir referencias/checks exitosos sin una nueva pregunta. En trabajo documental no ejecutar `check-environment.cjs --browser` como rutina. Limitar captura, viewport y DPR al mínimo útil.
- Registrar IDs y propiedad de recursos creados; cerrar pestañas/contextos propios en `finally`, también al fallar. No matar procesos por nombre, antigüedad o ruta de runtime. No cerrar aplicación principal, pestañas personales, otros proyectos o helpers de origen incierto.
- Si no se puede atribuir el consumo, dejarlo explícito y aplicar las medidas controlables. El consumo de herramientas actuales se trata separado del rendimiento de la landing, todavía inexistente.

Mantener una sola tarea principal en curso. Dividirla en entregables verificables. Se permite delegar tareas independientes si aporta valor, con responsables y archivos distintos; revisar el resultado integrado. No es necesario usar otros proveedores de IA.

Consultar documentación oficial actual antes de instalar. Verificar versiones, requisitos, licencia y dependencias existentes. Usar un único gestor de paquetes: pnpm. Al comenzar el desarrollo, fijar versiones directas y conservar `pnpm-lock.yaml`; reponer con `install --frozen-lockfile`. No agregar dependencias ni frameworks sin una función definida.

Registrar decisiones, comprobaciones y pendientes con fecha local en `docs/DECISIONES.md` y actualizar `docs/TAREAS.md`. Diferenciar comprobado, recomendado y no ejecutado. No prometer vigilancia permanente ni tareas en segundo plano.

## Requisitos para el desarrollo futuro

HTML semántico, CSS y JavaScript como base; Vite para desarrollo y build. React y TypeScript requieren una ventaja concreta documentada. Como mínimo, un objeto 3D coordinado con el fondo mediante scroll; diseñar una composición móvil propia y una alternativa con movimiento reducido. El contenido y las acciones esenciales deben funcionar sin WebGL ni video.

Antes de incorporar recursos, registrar procedencia, licencia y atribución. No copiar sitios completos ni asumir que un recurso público permite redistribución. Revisar referencias actuales cuando comience el diseño. Aplicar los criterios de aceptación de `docs/TAREAS.md` y reportar las comprobaciones que no se pudieron ejecutar.
