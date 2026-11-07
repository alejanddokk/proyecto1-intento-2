# Referencias reales y evidencia

Consulta: 2026-11-05. Son sitios accesibles en la fecha de investigación; no se afirma que todos hayan sido lanzados recientemente. Capturas propias de sitios ajenos, para análisis. No son diseños de intento 2 ni recursos autorizados automáticamente para su futura landing.

## Método y límites

Lectura de páginas públicas con web y observación con Chrome headless/Playwright a 1280×800. Se muestrearon apertura, desplazamiento y regreso; no se grabaron videos ni se verificó fluidez en un teléfono real. El desplazamiento programático no equivale a recorrer todas las animaciones de cada sitio. En Lusion se añadió entrada de rueda porque la altura del documento observada era de una pantalla.

Los archivos `capturas/*.json` guardan URL, título, fecha, viewport, recuento de medios y notas. Que exista un canvas no prueba que una imagen concreta sea 3D; que exista un video no prueba que se reproduzca o siga al scroll. Las conclusiones visuales siguientes se basan en imágenes inspeccionadas y se distinguen de los textos de los autores.

La captura nativa inicial sin acceso de red quedó invalidada por `ERR_NETWORK_ACCESS_DENIED`. Se repitió con acceso de red permitido a las páginas públicas. Una captura mediante la herramienta de navegador también agotó su tiempo de espera. No se interpretaron esas fallas como comportamiento del diseño. Se conservaron algunos cuadros de carga para registrar límites; no son los seleccionados como referencia visual.

## R1 — Grand Theft Auto VI, Rockstar Games

URL directa: https://www.rockstargames.com/VI

**Observado:** portada en mosaico con marca central, contorno oscuro y botón rosa como foco de acción. Tras el desplazamiento se vio una ilustración amplia de los protagonistas con automóvil, sol y palmeras. El regreso mostró otra vez la composición de portada. La primera captura en frío solo mostró el fondo antes de cargar.

**Aporta:** jerarquía de marca, oposición entre fondo oscuro y tonos de atardecer, profundidad por superposición y transición entre portada y escena. Adaptar el principio de una imagen dominante y un CTA claro; crear una composición propia y más contenida. No copiar el mosaico ni trasladar sus assets sin revisar condiciones.

**No comprobado:** mecánica exacta de la transición, fluidez, sincronización cuadro a cuadro o que sus ilustraciones sean objetos 3D en tiempo real.

Evidencia: [portada cargada](capturas/01-rockstar-regreso.jpg), [estado desplazado](capturas/01-rockstar-scroll.jpg). Procedencia visual: Rockstar Games.

**Hechos para las propuestas:** [Only in Leonida](https://www.rockstargames.com/VI/only-in-leonida) identifica Jason Duval, Lucia Caminos y Vice City dentro de Leonida. [Media](https://www.rockstargames.com/VI/media) ofrece trailers, clips, imágenes y artwork para consultar y compartir. No se infiere de ello una licencia abierta para recortar, separar capas, extraer modelos o redistribuir material modificado. No se incorpora una fecha de lanzamiento al brief.

## R2 — Lusion

URL directa: https://lusion.co/

**Observado:** una vez terminada la carga, tipografía negra de tamaño grande sobre fondo muy claro y una ventana amplia con piezas volumétricas azules, blancas y negras, solapadas y con respuesta de materiales. Menú y contacto compactos. Las primeras muestras mostraron el cargador y una transición geométrica de entrada.

**Aporta:** separación entre texto estable y un campo visual con profundidad; materiales que hacen reconocible un volumen sin llenar el resto de la página. Útil para el relieve de la postal y la radio. No trasladar su acumulación de piezas a GTA 6: conservar un solo objeto focal.

**Fuente del autor:** su página declara trabajo de storytelling 3D y experiencias interactivas. Esto respalda la especialidad del estudio, no demuestra la técnica de cada cuadro.

**Límite:** el cargador invadió parte de las muestras de rueda. No atribuir a esas capturas una secuencia completa objeto/fondo ligada al scroll ni una medición de su rendimiento.

Evidencia: [composición cargada](capturas/02-lusion-vuelta.jpg). Procedencia: Lusion.

## R3 — AirPods Pro, Apple

URL directa: https://www.apple.com/airpods-pro/

**Observado:** apertura con video de una persona y formas translúcidas, texto de alta escala, fondo claro y control visible de pausa. En el desplazamiento, la navegación pasa a una barra del producto y aparece un módulo de contenido audiovisual con indicadores y pausa. El video de apertura estaba reproduciéndose en la muestra del DOM.

**Aporta:** jerarquía tipográfica, concentración de movimiento en un área, pausa visible y continuidad entre material visual y contenido. La postal puede adoptar su separación entre mensaje y escena; la carretera, su control explícito del video; la radio, su economía de presentación de un objeto.

**No comprobado:** que los renders sean WebGL ni que el video observado avance por scroll. El módulo observado tiene dinámica propia de reproducción/carrusel: no presentarlo como demostración de seeking reversible.

Evidencia: [entrada](capturas/03-apple-inicio.jpg), [módulo tras scroll](capturas/03-apple-scroll.jpg), [título rodeado por formas translúcidas a 3500 px](capturas/03-apple-y3500.jpg), [contenido de producto a 5500 px](capturas/03-apple-y5500.jpg). Las muestras profundas muestran cambios de composición, sin certificar una relación cuadro a cuadro entre video y scroll. Procedencia: Apple.

## R4 — Cyberpunk 2077

URL directa: https://www.cyberpunk.net/us/en/

**Observado:** contraste amarillo/negro, tipografía condensada de gran peso, imagen dominante de personajes y navegación persistente. Las primeras capturas estaban tapadas parcialmente por consentimiento; se hizo una segunda visita usando solo cookies necesarias.

**Aporta:** identidad reconocible con una superficie cromática y una voz tipográfica consistente. Para la radio, adaptar la contundencia gráfica y la organización de información. Su abundancia de módulos y adornos no es el objetivo minimalista de este proyecto.

**No comprobado:** una coreografía 3D de objeto y fondo ni reproducción del video detectado; en la primera muestra ese video estaba pausado. Es referencia de tipografía y contraste, no evidencia de scroll 3D.

Evidencia seleccionada: [apertura sin diálogo](capturas/04-cyberpunk-listo.jpg), [contenido desplazado](capturas/04-cyberpunk-rueda.jpg). La captura con diálogo se conserva como muestra inicial. Procedencia: CD PROJEKT RED.

## R5 — Death Stranding 2, Kojima Productions

URL directa: https://www.kojimaproductions.jp/en/death-stranding-2

**Observado:** imagen cinematográfica a gran escala con rostro y objeto físico integrados en la composición, título fino y espaciado, navegación superior y acceso a medios debajo. Tras scroll se vio un tráiler de YouTube con miniaturas y una franja de contenido posterior.

**Aporta:** tensión entre un detalle humano y una máquina, tipografía silenciosa sobre una escena fuerte y separación clara entre portada y reproducción bajo demanda. Para la carretera, un encuadre corto puede sugerir una historia sin fabricar una ciudad completa.

**No comprobado:** objeto WebGL, fondo sincronizado al scroll o reproducción del tráiler. No se abrió el video. Es una referencia de composición y navegación de medios.

Evidencia: [entrada](capturas/05-kojima-inicio.jpg), [medios](capturas/05-kojima-scroll.jpg). Procedencia: Kojima Productions.

## R6 — Bruno Simon

URL directa: https://bruno-simon.com/

**Observado:** un indicador de carga se transformó en una escena tridimensional compacta con automóvil, suelo, banco, árbol y luz cálida. El scroll normal no reveló una página vertical en esta muestra.

**Descrito por el autor:** el sitio invita a conducir para explorar y documenta Three.js, controles y opciones de calidad. No se recorrió el mundo ni se probó conducción, controles táctiles o calidad en móvil.

**Aporta:** escala legible y relación física entre automóvil, suelo y luz. Para la opción de carretera, las ruedas deben seguir apoyadas y los reflejos compartir el ambiente. Tomar ese criterio; no trasladar un minijuego ni esta estética de diorama al proyecto.

**Límite:** no es una referencia de navegación por scroll. Su navegación libre sería una carga innecesaria para una primera landing.

Evidencia: [escena inicial cargada](capturas/06-bruno-regreso.jpg). Procedencia: Bruno Simon. Aunque el autor enlaza código con licencia MIT, no se reutilizó código ni assets; cualquier reutilización futura exige comprobar el archivo y la licencia concretos.

## R7 — OB–4, Teenage Engineering

URL directa: https://teenage.engineering/products/ob-4

**Observado:** apertura oscura con una imagen grande del aparato visto desde arriba, texto fino y mucho espacio alrededor. El plano superior permite reconocer pocos controles físicos. Una muestra más abajo quedó en carga, por lo que no se usa como evidencia de una transición terminada.

**Descrito por el autor:** radio/altavoz con interfaz mecánica mínima, perilla y carrete motorizados. No se observó ni probó el movimiento físico de esos controles.

**Aporta:** una referencia concreta para que el dial de la opción 3 sea un objeto físico comprensible con pocos controles. La conexión entre gesto y función interesa más que agregar decoraciones musicales.

**No observado:** giro interactivo, relación del dial con scroll ni coreografía objeto/fondo. No afirmar que la web use un objeto 3D interactivo. No copiar la carcasa ni el diseño industrial del OB–4.

Evidencia: [apertura](capturas/07-ob4-y0.jpg). Procedencia: Teenage Engineering.

## Síntesis aplicable

La propuesta propia combina identidad GTA verificada con principios concretos: jerarquía de R1, escenario visual delimitado de R2, controles y legibilidad de R3, concentración cromática de R4, encuadre narrativo de R5, coherencia física de R6 y gesto mecánico simple de R7. Ninguno se presenta como plantilla ni como prueba de que una futura implementación ya funciona.
