> Histórico: anterior al pedido de entrada tipográfica y sintonización principal. Versión vigente: [STORYBOARD-V2.md](STORYBOARD-V2.md). La variante 1 ya está elegida.

# Storyboard de la variante 1 recomendada

**Propuesta del agente; variante no aprobada por el usuario.** [Esquema visual](visuales/storyboard-variante-1.png). Cinco momentos, un solo pico: la apertura del frente que hace continuar la luz del objeto en el entorno.

## Convenciones

`p` es el progreso normalizado del recorrido narrativo, de 0 a 1. Los rangos siguientes especifican orden y reparto del gesto, no segundos de reproducción. El tamaño total de scroll se ajustará en la prueba para permitir leer sin tramos vacíos; estimación inicial: unas 4–5 alturas de viewport para la experiencia completa, sin convertirla en cuota.

Unidad `W`: ancho del cuerpo de la radio. Frente hacia `+Z`. Cuerpo de proporción aproximada 1W × 0,42W × 0,22W. Referencia inicial de cámara: perspectiva moderada, FOV nominal 35°, azimut 22°, elevación 10°. Son valores de partida de dirección, no parámetros validados ni código.

Las perillas pertenecen al frente y giran sobre su eje local. Aguja y escala pertenecen al vidrio. El panel frontal y el vidrio se separan como grupos coherentes, no dejando controles suspendidos en el aire. No se escala de forma distinta cada eje para simular volumen.

Orden inicial propuesto sobre Z: cuerpo hasta z=0; anclaje del vidrio en z=0,012W; anclaje del frente en z=0,024W. Para la apertura se usa un mismo parámetro monótono u: desplazamiento del vidrio 0,04W·u y del frente 0,08W·u. Así el frente siempre queda por delante y la distancia entre anclajes crece desde 0,012W. En el regreso se conserva esa relación. El modelo deberá resolver espesores y volúmenes salientes dentro de esa holgura; los anclajes no sustituyen la comprobación de intersecciones de la geometría completa. En móvil se reducen a la mitad ambos desplazamientos, conservando el orden.

## 1 — Aparición, p=0–0,16

**Qué ve:** título GTA VI a la izquierda y radio completa en tres cuartos a la derecha, con canto superior y lateral claros. Paisaje costero bajo y reflejo cálido contenido en el vidrio.

**Radio, piezas y cámara:** la radio está ensamblada y apoyada; cámara casi quieta, con aproximación máxima del 3% respecto de la apertura. La presencia física procede del modelado y la luz, no de una rotación automática perpetua.

**Entorno:** cielo oscuro cálido, luz ámbar lateral y relleno neutro frío para conservar detalle. El reflejo del vidrio coincide en dirección con el horizonte. Sin bloom general ni oleaje que compita con la lectura.

**Texto/acción:** «GTA VI», «La ciudad está en la señal.» y «Ver tráiler oficial». Se reserva una región estable; el objeto no tapa título ni botón. Nombre del proyecto pequeño en cabecera.

**Activación y regreso:** desde el inicio del recorrido, `p` aumenta la aproximación; al regresar a cero recupera el encuadre de entrada, sin reproducir una introducción temporizada ni ocultar el CTA.

**Móvil:** título y acción arriba, radio entera debajo. Azimut aproximadamente 14°, sin viaje lateral. Conservar el dial y el espesor aun reduciendo el detalle ambiental.

## 2 — Sintonía, p=0,16–0,34

**Qué ve:** el objeto gana algo de tamaño y el dial se vuelve el detalle focal, sin perder la forma completa del cuerpo.

**Radio, piezas y cámara:** la perilla de sintonía gira hasta unos 70° sobre su propio eje; la aguja recorre un tramo de la escala. La cámara se aproxima hasta un 12% respecto de la distancia inicial y reduce el azimut de 22° a 12°. No gira toda la radio para simular el giro de la perilla.

**Entorno:** una franja de luz avanza por el vidrio en coordinación con la aguja. El horizonte pasa de bajo contraste a una línea reconocible. El cambio de reflejo sigue la orientación del objeto y la iluminación.

**Texto/acción:** «Vice City. Leonida.» fuera del dial; una sola línea, estable durante el intervalo útil. El titular anterior se retira antes, sin dos bloques superpuestos ni letras desarmándose.

**Activación y regreso:** las pistas se gobiernan por `p`; al volver, perilla, aguja, reflejo y cámara retornan juntos. No hay clic que dispare un loop ni una frecuencia oficial atribuida al juego.

**Móvil:** aproximación máxima del 6%, giro de perilla legible y órbita menor. Texto en una zona superior fija; evitar que el acercamiento recorte el cuerpo.

## 3 — Apertura, p=0,34–0,56 — prueba representativa

**Qué ve:** aparece una rendija física entre frente y cuerpo. Se distingue el borde del vidrio y una cavidad con luz, antes de que el paisaje gane amplitud.

**Radio, piezas y cámara:** el frente con sus controles se desplaza hasta `0,08W` en +Z; el vidrio, hasta `0,04W`. El cuerpo conserva su anclaje al suelo. La cámara cruza suavemente del azimut 12° a −12°, mostrando el canto opuesto; la distancia vuelve a alrededor del 95% de la inicial para dejar aire. El giro de sintonía completa unos 100°. Las holguras exactas dependen del futuro modelo.

**Entorno:** la misma banda que recorría el dial se ensancha a través de la abertura y coincide con el horizonte. Una parte del fondo se revela detrás de la radio; el brillo de cantos y vidrio acompaña ese cambio. No salen tornillos, partículas ni circuitos hacia el visitante.

**Texto/acción:** «Una ciudad. Muchas señales.» en región despejada; evitar texto entre capas. Mantener margen de seguridad en todos los estados intermedios, no solo en el pico.

**Activación y regreso:** el aumento de `p` separa primero el frente y luego deja crecer el espacio visible; las pistas se solapan con una intención común. Al disminuir, el horizonte se contrae y las piezas se reúnen sobre sus ejes sin teletransportarse. El contenido no espera a una animación temporal independiente.

**Móvil:** frente hasta `0,04W` y vidrio `0,02W`, con ligera proyección vertical para hacer legible el hueco. Órbita de unos 8° en total en vez de cruzar 24°. No añadir un diorama pequeño ni esconder el cuerpo detrás del panel.

## 4 — Entorno, p=0,56–0,82

**Qué ve:** la costa ocupa más fondo, con planos de cielo y silueta separados; la radio sigue entera y grande en la parte baja. El lugar se vuelve el contexto de la señal, no una segunda escena desconectada.

**Radio, piezas y cámara:** el frente reduce su separación aproximadamente a `0,03W` y el vidrio vuelve hacia el cuerpo. La cámara abre el encuadre hasta alrededor del 115% de la distancia inicial y se desplaza lateralmente de manera contenida. No hay vuelo a través del aparato ni un giro de 360°.

**Entorno:** el horizonte toma anchura y profundidad; el color cálido cede algo a un azul nocturno, conservando continuidad de la fuente de luz. El entorno y las reflexiones de metal/vidrio usan el mismo estado de iluminación. Los planos lejanos se desplazan menos que el objeto.

**Texto/acción:** «Jason y Lucia.» y «Una historia que seguir.» en un solo bloque breve. Nombres verificados previamente; la frase no inventa una sinopsis. El material oficial queda accesible mediante el CTA general.

**Activación y regreso:** el mismo `p` abre cámara, reduce separación y extiende fondo. En retroceso se recupera la abertura del momento 3 mientras el paisaje vuelve a encuadrarse. No encadenar un segundo pico ni un montaje de clips.

**Móvil:** la expansión sucede detrás y por encima del objeto, no hacia los laterales de la pantalla. Texto arriba, radio ocupando casi todo el ancho útil, sin fondo brillante bajo la lectura.

## 5 — Resolución, p=0,82–1

**Qué ve:** radio recompuesta, luz estable y una composición de cierre distinta de la apertura: objeto más frontal y bajo, espacio claro para actuar.

**Radio, piezas y cámara:** frente y vidrio vuelven a su posición de ensamblaje; cámara se asienta cerca de un azimut de 16° y distancia inicial. La aguja permanece en su posición resuelta; no rebota ni inicia un giro por tiempo.

**Entorno:** la costa se aquieta; el reflejo mantiene volumen y dirección, sin desvanecer la escena a vacío. No se agota el interés convirtiendo el final en un pie de página sin contenido.

**Texto/acción:** «GTA VI» y «Ver tráiler oficial»; enlace a la fuente oficial y nota pequeña de concepto independiente. Contraste y posición del botón estables. No se necesita completar el recorrido para usar esa acción.

**Activación y regreso:** el final de `p` completa el ensamblaje y detiene el movimiento estructural. Al volver a 0,82 se abre progresivamente el estado anterior, sin reiniciar ni descargar la escena.

**Móvil:** CTA en un bloque HTML propio, por fuera del área del objeto; la radio no ocupa toda la altura de lectura. El último estado no fuerza un pin largo para pulsar el botón.

## Tres sistemas distintos de movimiento

| Sistema | Qué controla | Regla propuesta |
|---|---|---|
| Ligado al scroll | Cámara, dial, aguja, separación, horizonte, iluminación narrativa y ventanas de contenido | Función única de p; detener scroll detiene estos cambios; ida y vuelta equivalentes |
| Ambiental temporal | Variación muy tenue de luz en cielo o reflejo lejano | Opcional, ciclo lento de 10–14 s; sin viaje de cámara ni movimiento de piezas. Pausable; apagado fuera de vista y con movimiento reducido |
| Puntero | Respuesta óptica mínima de cámara o highlight | Solo puntero fino; hasta ±1,5° y fuera del pico de apertura. No altera p, dial ni estado del fondo. Sin pointer lock/capture |

La luz estructural de la abertura no es ambiente: debe detenerse con el scroll. El puntero no es necesario para descubrir contenido. Durante mediciones de reversibilidad se fija el ambiente y se centra/desactiva el puntero, para comparar el mismo estado.

## Curvas y transiciones

Progreso narrativo directamente vinculado a scroll; una eventual suavización debe ser pequeña y acotada, propuesta inicial ≤150 ms, con recuperación al soltar. No apilar inercia de scroll, resorte de cámara y scrub largo. Cámara y piezas usan curvas monótonas sin rebote ni overshoot que haga atravesar la carcasa. Iluminación y oclusión se mantienen continuas al invertir dirección.

Texto: transición local de opacidad de 120–180 ms solo cuando ayude a la lectura; sin parallax, zoom o rotación de párrafos. Los mensajes esenciales también existen en la estructura de lectura. Anclas, foco de teclado y movimiento reducido pueden saltar directamente a estados estables.
