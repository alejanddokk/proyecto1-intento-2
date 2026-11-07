# Movimiento: observado, medido, código e hipótesis

Investigación complementaria del 2026-11-05. Resuelve el pendiente específico de animación del estudio anterior; no repite su lista general de referencias. Se usó el navegador integrado de Codex mediante CUA. No se automatizó Figma ni se creó una escena propia.

## Conclusión

OB–4 demuestra presentación volumétrica por un video temporal. La demo pública de GSAP demuestra coordinación reversible por scroll con mediciones. Ninguna de estas observaciones prueba todavía una radio 3D propia con frente separable y entorno coordinado. Esa combinación es nuestra propuesta y requiere la prueba futura especificada en PRUEBA-Y-RECURSOS.md.

## M1 — OB–4 en movimiento

[Página](https://teenage.engineering/products/ob-4). Se abrió la referencia existente, primero en la composición móvil del navegador y después en escritorio para observar su presentación de producto. No se alteraron controles de audio ni se compró nada.

**Observado:** con el video visible y la página detenida, cambian el punto de vista y la escala del aparato: vista frontal cercana, controles vistos desde arriba y posterior encuadre de tres cuartos más abierto. Los reflejos permiten leer superficies y cantos. Se observó el movimiento mediante una secuencia temporal de diez muestras, no a partir de una captura aislada.

**Medido:** scroll constante en `y=1890` CSS px; diez muestras durante 8,240 s de reloj. El video visible pasó de 1,267012 s a 8,925188 s, con `paused=false` y `readyState=4`. Esto demuestra avance temporal con scroll quieto en el tramo observado. No es una medición de fps, precisión de seeking ni benchmark de decodificación.

Cada lectura del DOM se tomó inmediatamente antes de solicitar su captura; no se afirma sincronización exacta entre el tiempo del medio leído y el frame que devuelve la captura.

**Implementación expuesta en el DOM:** el medio observado es un elemento de video, con envoltorio de reproductor y URL `blob:`. Es evidencia del mecanismo de presentación en ese tramo; no identifica el software con que se produjo la imagen ni permite afirmar que sea un modelo WebGL manipulable. No se obtuvo su código fuente privado ni se resolvió el origen del stream.

**Hipótesis descartada:** no usar este tramo como prueba de que un dial avance con scroll o de que el visitante pueda separar piezas. No se observó eso. La descripción del producto sobre interfaz mecánica no constituye una demostración de interacción en la web.

**Qué se adapta:** transitar de una lectura frontal a otra donde los cantos, controles y reflejos revelan volumen. Se propone hacerlo con una radio original y una fuente de progreso por scroll, que es un mecanismo diferente al video observado.

Evidencia: [muestreo temporal animado](evidencia/ob4-tiempo.gif), [registro original](evidencia/ob4-tiempo.json), cuadros `ob4-tiempo-00` a `09`. El GIF reproduce las muestras con sus intervalos aproximados, sin interpolar frames; no es una grabación continua de alta frecuencia ni un recurso de la landing.

## M2 — GSAP Scrub Animations

[Demo y código público](https://codepen.io/GreenSock/pen/WNvVOWw). [Vista ejecutada](https://codepen.io/GreenSock/fullpage/WNvVOWw), redirigida a cdpn.io. La página mostró un aviso de contexto de CodePen y el ejemplo dentro de un iframe; el ejemplo renderizó y se pudo accionar sin ingresar datos ni eludir avisos de seguridad.

**Observado:** la sección permanece fija mientras una línea crece, el párrafo cambia escala/inclinación/opacidad y el fondo pasa de oscuro a verde. Al invertir la rueda, esos cambios se deshacen juntos. Se accionó una secuencia de nueve posiciones y se capturó cada una, con registro de entrada y estados DOM; no se deduce la reversibilidad únicamente por parecido entre imágenes.

**Medido en el iframe:**

| Scroll Y | Escala X de línea | Fondo RGB | Recorrido |
|---|---|---|---|
| 2560 | 0 | 14, 16, 15 | Inicio |
| 2720 | 0,25 | 25, 83, 27 | Avance |
| 2880 | 0,50 | 34, 131, 36 | Avance |
| 3040 | 0,75 | 38, 159, 41 | Avance |
| 3200 | 1 | 40, 169, 43 | Final |
| 3040 | 0,75 | 38, 159, 41 | Regreso |
| 2880 | 0,50 | 34, 131, 36 | Regreso |
| 2720 | 0,25 | 25, 83, 27 | Regreso |
| 2560 | 0 | 14, 16, 15 | Regreso |

Las cadenas de transformación del párrafo, transformación de la línea y color coinciden exactamente en las parejas de igual posición registradas. El viewport exterior fue 1280×720; el área del iframe de la demo midió aproximadamente 1280×640. Esto verifica esos estados muestreados, no todos los puntos continuos ni latencia o fps.

**Código encontrado:** el JS público del Pen crea una timeline para `.plain`, activa scrub y pin y define un recorrido equivalente a una altura de viewport. Las pistas de párrafo, línea y fondo comienzan en el mismo punto de timeline. El párrafo utiliza una curva distinta a la escala lineal de la línea; compartir progreso no implica que cada propiedad cambie linealmente. Coincide con los estados observados. Se consultó la fuente pública, no se inspeccionó memoria privada del motor.

**Qué se adapta:** una sola fuente de progreso para las pistas de cámara, piezas, luz, entorno y contenido. El ejemplo es 2D; no aporta modelo, volumen físico ni solución de reflejos para nuestra radio.

Evidencia: [muestreo reversible animado](evidencia/gsap-recorrido.gif), [registro original](evidencia/gsap-recorrido.json), [resumen calculado](evidencia/resumen-mediciones.json). No se reutilizó el código del Pen en una aplicación. Sus condiciones y las del motor son independientes y se revisarán si se incorpora material, no por estar expuesto públicamente.

## M3 — Three.js, articulaciones: observación inconclusa

[Demo](https://threejs.org/examples/webgl_loader_collada_kinematics.html), [fuente pública](https://raw.githubusercontent.com/mrdoob/three.js/dev/examples/webgl_loader_collada_kinematics.html).

Se llegó a ver el robot articulado en 3D, pero la captura de la secuencia y la recuperación del navegador agotaron su tiempo de ejecución. Solo quedó un cuadro guardado. **No se declara estudiada su animación ni medida su fluidez.** La cifra de fps que presenta la propia demo no es una medición independiente de esta investigación.

La fuente sí permite leer que cambia articulaciones con interpolación temporal y límites de cada unión, y que la cámara orbita en función del reloj. Esa lectura respalda una referencia técnica de ejes y jerarquías; no transforma la visita fallida en evidencia visual de movimiento ni demuestra scroll.

## Reglas de transferencia al proyecto

1. Los reflejos de OB–4 y la reversibilidad de GSAP son observaciones diferentes; no afirmar que se comprobó una radio 3D interactiva con scroll.
2. El frente, vidrio, perillas y cuerpo deben tener padres/ejes coherentes; la separación propuesta no está tomada de una animación observada del OB–4.
3. Las imágenes generadas en `visuales/` prueban únicamente una intención de apariencia. No demuestran profundidad renderizada en navegador, iluminación dinámica ni transformación física.
4. Las medidas de esta investigación pertenecen a las referencias. Los presupuestos de rendimiento y aceptación de Frecuencia VI son objetivos pendientes, no resultados.
