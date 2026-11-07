> Histórico: anterior al pedido de entrada tipográfica y sintonización principal. Versión vigente: [PRUEBA-Y-RECURSOS-V2.md](PRUEBA-Y-RECURSOS-V2.md). La variante 1 ya está elegida.

# Prueba futura y recursos por producir

## Unidad representativa: apertura del frente

Se propone validar el momento 3, incluyendo su llegada desde la sintonía y su salida hacia el entorno (`p=0,28–0,64`). **No se programó.** Debe ser suficiente para decidir si la idea completa tiene calidad, antes de producir toda la landing.

Contenido de esa futura prueba: radio propia con cuerpo, frente y vidrio separados; perilla y aguja; fondo sencillo con horizonte y luz coordinada; una línea de texto y CTA HTML; poster y estados de error. No necesita una ciudad completa, sonido ni videos.

## Aceptación verificable

1. **Volumen real:** al menos dos relaciones de oclusión cambian durante la órbita; se ven espesor de carcasa y canto de vidrio; los reflejos se desplazan de acuerdo con orientación y luz. Una imagen plana inclinada no cumple.
2. **Transformación física:** frente y vidrio se separan sobre el eje definido, con controles unidos a sus padres; sin atravesar el cuerpo, sombras flotantes ni piezas que aparezcan de golpe. La cavidad visible debe existir o estar resuelta para el rango completo de cámara.
3. **Coordinación:** aguja, banda de luz, abertura y horizonte alcanzan un alineamiento identificable cerca del pico. En cinco posiciones p prefijadas, registrar valores de esas pistas y captura. No basta con que todo se mueva al mismo tiempo sin relación espacial.
4. **Reversibilidad:** recorrer 0,28 → 0,37 → 0,46 → 0,55 → 0,64 y vuelta, después de estabilizar cualquier suavizado. Con ambiente y puntero desactivados, tolerancia inicial de posición ≤0,5% de W, ángulo ≤0,5° y proyección de puntos de referencia ≤2 CSS px al regresar a la misma p. Ajustar tolerancias solo con justificación, no para esconder errores.
5. **Separación de sistemas:** al detener scroll por al menos 3 s, cámara, piezas y horizonte quedan fijos. Si el ambiente está activo, solo continúa esa pista. Mover el puntero no cambia dial, p ni estado narrativo. Pausar ambiente funciona.
6. **Lectura:** título y CTA completos en apertura; texto del momento fuera de la silueta, las piezas y los reflejos fuertes en todas las muestras intermedias. Contraste mínimo objetivo 4,5:1 en cuerpo/controles y 3:1 en texto grande.
7. **Móvil propio:** 390×844 y 360×640, además de horizontal. Radio completa y grande, apertura legible, CTA alcanzable y sin desborde. Probar un teléfono real después del headless; una emulación no valida GPU ni scroll táctil reales.
8. **Fallos y preferencias:** movimiento reducido, no-WebGL y error de un asset conservan contenido, enlaces, foco y poster coherente. Sin pinning vacío. Cambiar preferencia en vivo no deja piezas separadas ni contenido oculto.
9. **Respuesta y coste:** objetivo inicial de 60 fps en equipo de referencia y experiencia móvil estable con degradación de resolución/calidad. Medir tiempo de frame y percentiles con hardware, DPR y método; no confundir captura de pantalla o contador de una referencia con benchmark propio.
10. **Carga y recursos:** consola y red sin errores no resueltos; pausa fuera de vista; recursos sin crecimiento sostenido tras tres reinicializaciones. Registrar el build y assets exactos de la prueba antes de ampliar alcance.

La comparación numérica confirma trayectoria y sincronización; la inspección de frames y una grabación de la prueba confirman composición y comportamiento. La sensación del gesto exige verlo en movimiento, incluyendo inversiones rápidas. Ninguna de esas pruebas puede darse por aprobada con las imágenes conceptuales.

## Recursos necesarios

| Recurso | Estado actual | Trabajo posterior |
|---|---|---|
| Modelo propio de radio | No producido; las imágenes son referencias de apariencia | Modelar cuerpo con cavidad, biseles, vidrio, frente, perillas y aguja; jerarquías y pivotes definidos |
| Materiales | Intención definida | Metal cepillado con roughness, plástico grafito, vidrio ahumado, perforación optimizada; evitar modelar cada microperforación si no aporta a la escala |
| Entorno | Concepto visual, no asset final | Composición costera original en pocas capas y entorno de reflexión congruente; no extraer capas de material Rockstar sin autorización |
| Iluminación | Secuencia especificada | Fuente cálida narrativa, relleno y reflexión de baja resolución; ajustar exposición para legibilidad |
| Tipografías | Barlow Condensed e Inter propuestas; OFL consultadas | Seleccionar pesos y subconjuntos WOFF2; conservar licencias |
| Posters | No producidos | Derivar de la escena final en escritorio y móvil, radio ensamblada y CTA/contexto en HTML |
| Contenido | Copy mínimo propuesto | Revisar tras elegir variante, enlazar el tráiler oficial vigente sin inventar fecha o gameplay |
| Evidencia y conceptos | Disponibles en esta carpeta | Mantenerlos como referencia, no exportarlos como assets de producción |

Presupuestos iniciales de ingeniería para la prueba, sujetos a medición: una escena/canvas, DPR máximo propuesto 1,5 en escritorio y 1–1,25 en móvil; modelo ≤80k triángulos y objetivo ≤40 draw calls; texturas y entorno comprimidos, carga visual inicial objetivo ≤3 MB y ampliación diferida. No son resultados obtenidos ni requisitos que justifiquen degradar el aspecto sin revisar el dispositivo real.

## Decisiones técnicas

Conservar HTML/CSS/JavaScript, Vite, GSAP/ScrollTrigger y Three.js según el plan existente. No instalar ni inicializar todavía. Cámara, piezas y luz dependerán de una sola fuente de progreso; HTML para lectura y acciones; CSS para estados simples. Sin motor de física, WebGPU obligatorio, audio ni proveedor externo de generación.

Para la variante 1 propuesta se prefiere entorno animado por capas y luz a video ligado al scroll: permite coordinar reflejos y transformaciones sin añadir dependencia de seeking. El video del OB–4 sirve de referencia física, no obliga a usar su técnica. La variante 2 también puede funcionar sin video.

La prueba en navegador resolverá volumen renderizado, recorrido, continuidad, legibilidad, reversibilidad, respuesta y coste. No podrá resolver por sí sola derechos de assets, calidad de todos los teléfonos, accesibilidad de todos los lectores de pantalla ni métricas de campo de un sitio no publicado.
