# Próxima prueba pequeña: título y una sintonización A/B

**Plan; ejecución e implementación todavía no autorizadas.** Sustituye a la prueba anterior de apertura del frente. No construir la landing completa para validar esta unidad.

## Alcance mínimo

Un H1 real, una radio 3D propia fiel a la silueta elegida, perilla y aguja independientes, dos ambientes simplificados originales y un CTA HTML. Entrada preparada → transición del mismo título → portada A → sintonización completa A/B → regreso. Sin carcasa abierta, circuitos, video, audio, partículas o interfaces de catálogo.

Producir primero la geometría con volumen y los materiales visibles necesarios para esa fidelidad. No sustituirla por el mockup completo o un aparato genérico. El paisaje B puede tener pocas geometrías y capas, pero debe distinguirse de A por composición/profundidad, no solo por color. La imagen conceptual sigue siendo referencia, no un asset de la aplicación.

## Criterios observables de aceptación

1. **Mismo título:** medir su rectángulo al final de la entrada y en el primer estado p=0; diferencia objetivo ≤1 CSS px sin salto de fuente, doble H1, cambio de baseline ni aparición de otro título. Capturar la unión en una grabación breve o muestreo de frames, no solo los extremos.
2. **Carga real:** probar caché fría/caliente, un recurso retrasado, error del modelo, error de tipografía y falta de WebGL. Sin mínimo de carga añadido ni porcentajes inventados. El acceso al contenido siempre funciona; ningún callback tardío inicia la intro después de omitirla.
3. **Interrupción:** scroll a mitad de entrada, enlace Mundo, regreso por historial y restauración a mitad del recorrido. Sin trap de scroll, deuda acumulada, reinicio ni un frame del estado incorrecto. Verificar la unión corta desde la pose presentada, no desde la pose inicial.
4. **Portada fiel:** radio grande con cantos, vidrio, metal y controles legibles; composición, playa, reflejos cálidos y título superior izquierdo comparados con la imagen aprobada al mismo encuadre. Se requiere volumen real y al menos dos cambios de oclusión durante el pequeño viaje de cámara.
5. **Sintonía completa:** recorrer u=0, 0,25, 0,50, 0,75, 1 y volver. Registrar perilla, posición de aguja, cámara, mezcla/planos A/B y luz. En el mismo u, tolerancia inicial de transformación ≤0,5% del ancho del cuerpo y ≤0,5°; puntos de referencia proyectados ≤2 CSS px, con ambiente/puntero apagados. Estos límites son objetivos, no mediciones actuales.
6. **Transformación del entorno:** A y B se distinguen por elementos y perspectiva. Radio, vidrio y metal reflejan el ambiente presentado, sin reflejo de playa al mostrar la calle ni salto de horizonte/contacto. Detener scroll por 3 s detiene todas las pistas estructurales.
7. **Descubrimiento acotado:** verificar al menos la salida del tramo A/B hacia el reencuadre que baja la radio, conservando apoyo y parte identificable del objeto. No hace falta producir toda la historia para probar esa continuidad.
8. **Lectura y móvil:** 1024×768 y 390×844 para la prueba inicial; añadir 360×640 al detectar recorte o al cierre móvil. Texto fuera de la silueta y luces, CTA accesible, sin scroll horizontal. Movimiento reducido y versión estática mantienen estructura y navegación.
9. **Limpieza y respuesta:** una escena/canvas, detener render al ocultar o salir de vista, eliminar listeners y liberar recursos propios en error/salida. Medir al entrar, tras estabilizar y después de cerrar el recurso temporal. Una subida aislada de RAM no demuestra fuga; buscar crecimiento sostenido después de ciclos equivalentes.

## Operación con memoria acotada

Antes de ejecutar la futura prueba, repetir solo el diagnóstico acotado. Con el equipo actual, menos de 512 MiB de RAM física disponible es una señal operativa para no abrir una sesión 3D pesada; no es un umbral científico de rendimiento. Si persiste, posponer la prueba y continuar con trabajo documental, sin cerrar procesos personales o desconocidos.

Una única sesión de navegador, una pestaña propia y `try/finally` para cerrarla también ante fallos. No lanzar simultáneamente generación, capturas, grabación y agentes adicionales. Empezar con ventana de 1024 px y DPR 1; usar una grabación corta o pocos frames por pregunta, sin producir a la vez GIFs y todas las resoluciones. No repetir un control exitoso sin cambio que lo justifique.

Presupuesto inicial propuesto para el contenido de la prueba: una radio detallada de manera eficiente, objetivo ≤60k triángulos y ≤30 draw calls; una sola escena y dos ambientes base de baja resolución residentes para retroceder sin recarga visible. Evitar duplicar texturas, mapas de sombras grandes y render targets sin función. Las texturas de detalle se difieren. Estos objetivos no son mediciones ni permiten degradar la silueta aprobada.

Conservar HTML/CSS/JavaScript, Vite, GSAP/ScrollTrigger y Three.js previstos. No instalar ahora ni añadir frameworks, física o proveedor de generación. El diagnóstico de RAM de la aplicación de trabajo no es un benchmark de esta futura landing.

## Recursos pendientes

| Recurso | Trabajo necesario |
|---|---|
| Radio propia | Modelado fiel al concepto, biseles/espesor, materiales y grupos de perilla/aguja; sin interior innecesario |
| Ambientes A y B | Playa al atardecer y avenida costera nocturna original, continuidad de horizonte, planos y apoyo |
| Reflejos e iluminación | Dos estados coherentes de entorno, interpolación sin recompilar materiales por frame |
| Tipografía | Fuente crítica local/subconjunto y fallback estable; preservar licencia |
| Posters | Estados derivados de la futura escena para desktop/móvil; alternativa sólida si tampoco cargan |
| Registro de recursos propios | Propietario, creación, PID/contexto/pestaña cuando corresponda, momento de cierre y limpieza en fallo |

La siguiente tarea recomendada será implementar solo esta prueba cuando el usuario lo indique y haya margen de memoria, antes de extender el relato completo.
