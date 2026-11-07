> Histórico: anterior al pedido de entrada tipográfica y sintonización principal. Versión vigente: [UX-UI-V2.md](UX-UI-V2.md). La variante 1 ya está elegida.

# UX/UI de Frecuencia VI

## Alcance y responsabilidades

El usuario eligió Frecuencia VI, la dirección 3 del estudio anterior. Esta etapa desarrolla UX/UI y especificación de movimiento, sin landing, prototipo funcional ni código de aplicación. El usuario aún no aprobó ninguna de las dos variantes de este documento.

- **Dirección principal:** Product Design, skills index, user-context, get-context e ideate. Se usó el brief existente sin volver a preguntar decisiones técnicas. El preflight no encontró un user-context.md global; el contexto vigente procede del repositorio y del usuario. Se generaron dos imágenes, según el número solicitado por el usuario, no tres.
- **Apoyo para movimiento:** scroll-craft, especialmente profundidad, arco emocional y cierre resuelto. No se importó su engine ni se ejecutó generación externa.
- **Viabilidad 3D:** threejs-web y documentación pública. Se especifican piezas, ejes, iluminación y fallbacks; no se prueba todavía una escena propia.
- **Revisión final:** principios de emil-design-eng para propósito, legibilidad, interrupción y respuesta contenida; revisión visual de las imágenes y de la especificación registrada en REVISION.md. No se presenta como auditoría de una aplicación inexistente.
- Figma excluido. Sin instalaciones, servidores, suscripciones ni publicación. Las imágenes se hicieron con la herramienta integrada, sin CLI/API externa ni credenciales nuevas.

## Objetivo y acción principal

Presentar una interpretación editorial breve del universo de GTA VI y despertar interés por su material oficial. **Acción principal: Ver tráiler oficial**, inicialmente hacia [Media de Rockstar](https://www.rockstargames.com/VI/media). La acción está disponible desde la apertura; no exige completar la animación.

No se vende una radio. No hay precio, variantes de producto, ficha técnica, carrito, reproducción musical ni emisoras inventadas. La radio es el mecanismo narrativo: al sintonizar y abrirse, modifica la profundidad, la luz y el encuadre del entorno.

Los nombres y el marco Vice City/Leonida y Jason/Lucia proceden de la investigación oficial ya realizada. Las frases creativas son nuestras; la radio, su apertura y la escena ambiental no son objetos, mecánicas o imágenes confirmadas del juego. No se agrega fecha de lanzamiento ni se repite la investigación general.

## Contenido mínimo

| Momento | Mensaje visible propuesto | Función |
|---|---|---|
| Apertura | GTA VI / La ciudad está en la señal. / Ver tráiler oficial | Identificar inmediatamente juego y acción |
| Lugar | Vice City. Leonida. | Anclar el ambiente al universo verificado |
| Apertura de la radio | Una ciudad. Muchas señales. | Dar significado a la transformación, sin explicar ingeniería |
| Historia | Jason y Lucia. / Una historia que seguir. | Introducir a los protagonistas sin inventar argumento |
| Cierre | GTA VI / Ver tráiler oficial | Resolver con una acción clara |

Un solo bloque corto y un foco visual por momento. No duplicar el titular principal en varias capas ni usar párrafos en movimiento. Las frases son copy propuesto pendiente de la elección creativa, no citas de Rockstar.

## Variante 1 — Señal de Leonida

**Recomendada.** Radio grande, cerrada en la apertura, vista en tres cuartos en un ambiente costero oscuro. El paisaje aparece primero como reflejo y como horizonte bajo; la sintonía y la separación del frente hacen que ese ambiente se expanda. La radio mantiene presencia mientras el mundo gana escala.

**Composición:** a 1440×900, márgenes laterales de 72 px, cabecera de 80 px; texto en el tercio izquierdo y radio ocupando aproximadamente 65–70% del ancho, en la mitad inferior y derecha. No recortar controles ni perder el canto derecho. La altura visible del objeto ronda 45–55% del viewport. El paisaje es secundario al comienzo. Se conserva una zona de texto independiente de reflejos y siluetas.

**Jerarquía:** Frecuencia VI como nombre pequeño del proyecto; GTA VI como identificador dominante; una frase; CTA. El tamaño de GTA VI es propio de un cartel de lanzamiento, no de la marca de una radio. No se dibuja un logotipo alternativo que se presente como oficial.

**Apariencia física:** caja baja y ancha de grafito, laterales de aluminio cepillado, vidrio ahumado con escala discreta, rejilla rectangular y dos controles de distinta importancia. Relieves, pequeños biseles, contacto con suelo y roughness diferenciada. No copiar asa, carcasa ni distribución del OB–4. Sin gran halo luminoso ni un conjunto de tornillos o piezas sueltas como decoración.

**Función narrativa:** una línea luminosa atraviesa el dial, se convierte en reflejo sobre el vidrio y continúa en el horizonte. Luego el frente y el vidrio se separan sobre el eje del cuerpo, abriendo espacio y luz. La transformación va de detalle físico a entorno, no de color A a color B.

**Ritmo:** reconocimiento → curiosidad → descubrimiento → contexto → decisión. Un solo pico, la apertura del frente coordinada con la expansión del horizonte. La escena se recompone antes del cierre.

**Limitación:** necesita un entorno coherente con las reflexiones y un modelo con espesores reales. La imagen conceptual no resuelve la unión, las holguras ni el comportamiento de materiales; serán trabajo de producción y prueba.

Imagen: [concepto 1](visuales/variante-1-senal-de-leonida.png).

## Variante 2 — Ciudad en capas

Radio grande en vista superior oblicua sobre una superficie clara. Tres planos alineados —cuerpo, vidrio y frente— construyen la profundidad. La tipografía comparte protagonismo con esa anatomía y una franja de luz atraviesa el conjunto.

**Composición:** a 1440×900, márgenes de 48 px, GTA VI en el tercio superior; el objeto cruza en diagonal el centro y ocupa aproximadamente 70–80% del ancho. El CTA se apoya en una franja inferior estable, fuera de las sombras. No hay paisaje fotográfico de fondo. La luz y las sombras proyectadas establecen altura y posición.

**Tratamiento del objeto:** aluminio claro, frente esmaltado marfil, vidrio oscuro y una indicación cálida del interior. Se muestra la estructura antes; el scroll ordena o despliega sus planos. Máximo tres capas, sin reconstruir un circuito electrónico detallado ni separar cada tornillo. Las perillas pertenecen al frente; no flotan por separado.

**Ritmo:** cartel → anatomía contenida → luz que atraviesa → reunión de las piezas → cierre. Puede leerse en capítulos cortos con pausas; la experiencia no depende de una travesía por un paisaje.

**Limitación:** el render generado revela más componentes y marcas FM/AM de los que requiere el diseño. Esos detalles son exploratorios y no se elevan a especificación. En producción se simplificarían escala y electrónica; no representan emisoras oficiales. El subtítulo de variante “Ciudad en capas” tampoco es contenido obligatorio de la landing.

**Viabilidad:** necesita buena oclusión y sombras, pero menos composición ambiental que la 1. Es más editorial; exige más cuidado para que la anatomía no haga parecer la página un catálogo de electrónica.

Imagen: [concepto 2](visuales/variante-2-ciudad-en-capas.png).

## Comparación y recomendación

| Aspecto | 1. Señal de Leonida | 2. Ciudad en capas |
|---|---|---|
| Primer encuentro | Radio cerrada en un lugar | Radio abierta sobre una superficie |
| Encuadre | Tres cuartos bajo, mayor sensación cinematográfica | Superior oblicuo, mayor claridad anatómica |
| Fondo | Costa y luz con profundidad | Plano editorial y sombras |
| Transformación principal | El reflejo y la abertura revelan el entorno | Las capas se separan y se ordenan |
| Vínculo con GTA VI | Ambiente, título y contenido desde el inicio | Depende más del título y el contenido |
| Riesgo | Integración de luz y paisaje | Lectura de producto o catálogo |
| Estado | Recomendada por el agente; no aprobada | Alternativa propuesta; no aprobada |

Se recomienda 1 por la continuidad entre radio y lugar: permite que el objeto sea protagonista sin desplazar el tema hacia sus especificaciones. La variante 2 ofrece una composición distinta y una lectura más precisa de capas, pero comunica más fácilmente una pieza de hardware.

## Sistema visual propuesto

Tipografías: **Barlow Condensed 700/800** para títulos, **Inter 400/500/600** para texto y controles. Son una selección para producción; no se afirma que las imágenes generadas reproduzcan exactamente esas fuentes. [OFL de Barlow Condensed](https://raw.githubusercontent.com/google/fonts/main/ofl/barlowcondensed/OFL.txt), [OFL de Inter](https://raw.githubusercontent.com/google/fonts/main/ofl/inter/OFL.txt) consultadas; conservar sus archivos de licencia al incorporarlas. Todavía no se descargaron.

| Uso | Escritorio | Móvil |
|---|---|---|
| GTA VI | 160–240 px según encuadre | 80–100 px, sin recortar letras |
| Frase principal | 32–36 px | 24–28 px |
| Título de momento | 40–56 px | 30–36 px |
| Cuerpo | 18 px, interlínea 1,5 | 16–18 px, interlínea 1,5 |
| Navegación / CTA | 16 px, área mínima 44 px de alto | 16 px, área mínima 44×44 px |

Para variante 1: fondo base `#211B29`, texto `#F5EBDD`, CTA coral `#FF796B` con texto `#171219`, luz ámbar `#DDA46E`. Para variante 2: base marfil `#F3E7D7`, texto `#171411`, metal claro y una franja coral/violeta localizada. Valores de partida de la especificación, no mediciones de los renders.

Escala de espacios: 8, 16, 24, 40, 64, 96 px; cuerpo de texto máximo 44 caracteres por línea. Separación entre texto y silueta del objeto: al menos 32 px en escritorio y 24 px en móvil. Contraste a verificar sobre cada estado compuesto: 4,5:1 para cuerpo y controles, 3:1 para titulares grandes. Mantener oscuro el entorno de lectura; no corregir todo con una capa negra a pantalla completa.

## Navegación y controles

Cabecera con nombre del proyecto y enlaces **Mundo** e **Historia**. El CTA se muestra en apertura y cierre. Los enlaces saltan a contenido semántico; no exigen arrastre, sonido ni manipular perillas. Al navegar con teclado, conservar foco y una posición de lectura útil, sin coreografía de entrada forzada.

Las perillas 3D son parte de la narración ligada al scroll, no falsos botones de reproducción. No cursor de mano, foco ni estados activos que sugieran funciones inexistentes. El puntero solo permite una respuesta óptica opcional y muy leve, explicada en STORYBOARD.md.

Si existe ambiente automático continuo, ofrecer control real **Pausar ambiente / Reanudar ambiente**. Sin reproducción de audio. No contadores, indicadores de frecuencia ficticia, flechas de scroll ni múltiples CTA competidores.

## Móvil, movimiento reducido y ausencia de WebGL

Composición propia a 390×844 y control adicional a 360×640: márgenes 24 px, cabecera compacta, título y CTA arriba; radio debajo, completa y ocupando 88–94% del ancho disponible, con profundidad suficiente. Una única línea de lugar en cada momento; no apoyar el texto sobre el dial.

La separación de capas se reduce y se orienta ligeramente hacia arriba para leerse en vertical. Se limita la órbita y el horizonte se eleva detrás de la radio, sin encogerla a un icono. El cierre deja el CTA fuera de la zona de render, no una barra flotante que tape el objeto.

Con movimiento reducido: poster coherente de la radio cerrada; se suprimen órbita, separación, parallax y ambiente automático. Mundo e Historia se leen como bloques normales y el CTA sigue disponible. Al cambiar la preferencia, estabilizar la escena y conservar foco y posición de lectura útil.

Sin WebGL, con JavaScript fallido o ante error de assets: mismo contenido HTML, poster por composición y navegación normal. El texto esencial no vive en texturas ni desaparece por no cargar una escena. No conservar grandes espacios de scroll fijado sin animación.
