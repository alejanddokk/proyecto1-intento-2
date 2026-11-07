# Storyboard vigente: entrada preparada y sintonización reversible

2026-11-05. Variante 1 elegida. Sustituye al storyboard de apertura de carcasa. **Especificación, no implementación ni prueba de animación.** [Diagrama](visuales/storyboard-secuencia-v2.png).

## Dos relojes con un punto de unión

La entrada depende del estado de recursos; su transición usa un progreso temporal `q`. El recorrido posterior depende del progreso de scroll `p`. Solo un controlador escribe el estado presentado de título, cámara, radio, aguja, perilla y entorno.

Estados: preparación → transición de entrada → portada/scroll; cualquier fallo permite una salida estática. Invariante de unión: **el estado final de q=1 es exactamente el estado p=0**. El primer estado de scroll se inicializa antes de ceder el control; después se retira el controlador temporal. No hay dos timelines compitiendo ni reinicio visible de cámara/exposición.

Título: un solo H1 HTML, con el estilo tipográfico elegido. Su posición natural de destino es la de portada. Durante la entrada se transforma ese mismo elemento hasta el centro; después se mueve hacia su destino usando medidas reales. No intercambiarlo por una copia ni animar letras de manera independiente. Al terminar se retira la transformación conservando el mismo rectángulo visual. Ante resize, reencauzar desde el rectángulo actual al nuevo destino; no volver al centro.

## Parámetros de dirección, todavía no validados

Radio: proporciones y silueta del concepto aprobado, cuerpo ancho con volumen, frontal y vidrio cerrados; perilla sobre eje local y aguja sobre su guía. Los valores siguientes son objetivos de encuadre, no planos mecánicos ni medidas del modelo final. Campo de visión nominal 35°, sin zoom de lente ni distorsión para fingir profundidad.

| Estado | Título | Cámara: azimut / elevación / distancia relativa | Radio proyectada | Perilla / aguja | Entorno y luz |
|---|---|---|---|---|---|
| Preparación | Centro 50%/50%, ancho objetivo 60% | Estado A preparado, sin mostrarse incompleto | No visible | 0° / 22% de guía | Fondo sólido de paleta; primer frame completo oculto detrás |
| Entrada q 0→1 | Centro → margen 72 px, arriba ≈120 px; ancho ≈35% al final | Llega a 22° / 10° / 1,00 | Aparece hasta ≈68% del ancho, centro ≈62%/68% | 0° / 22% | Se revela A con iluminación cálida y reflejo coherente |
| Portada p 0→0,12 | Posición de referencia estable | 22° / 10° / 1,00 | Completa, apoyo visible | 0° / 22% | A estable |
| Sintonía p 0,12→0,60 | Zona de lectura estable; frase de lugar | 22°→14° / 10°→12° / 1,00→0,93 | ≈68→72% del ancho; sin invadir texto | 0→110° / 22→78% | Geometría/profundidad A→B, luz cálida→azul nocturna, reflejos acompasados |
| Descubrimiento p 0,60→0,86 | Texto de historia fuera del objeto | 14°→8° / 12°→14° / 0,93→1,08; target más alto | Baja en pantalla, centro Y ≈68→84%; B gana espacio | 110° / 78%, estables | B se revela en amplitud; misma luz y suelo de apoyo |
| Resolución p 0,86→1 | CTA estable; no vuelve al centro | 8°→12° / 14°→10° / 1,08 | Centro Y ≈78%, ancho ≈60–62%, encuadre resuelto | 110° / 78% | B estable, detalles legibles, sin desvanecer a vacío |

El porcentaje de aguja indica posición dentro de una guía visual original, no una frecuencia o emisora oficial. En móvil se compone desde cero: el descenso y la órbita son menores; no reutilizar coordenadas desktop sin ajuste.

## 1 — Entrada y carga

**Visitante:** fondo oscuro limpio y GTA VI grande centrado con la tipografía de la variante aprobada; acceso discreto al contenido sin animación.

**Título/cámara/radio:** el H1 ya existe. Se preparan cámara A, geometría, materiales y primer frame válido sin enseñar cargas parciales, luces ausentes o piezas faltantes. Perilla en 0° y aguja al 22%. La radio no sustituye su geometría por el recorte de la imagen aprobada.

**Fondo y luz:** color sólido de la paleta de A. Escena A lista detrás; el cuerpo no aparece hasta que esté completo. Sin loops de partículas, indicadores inventados ni tiempo mínimo de exposición del título.

**Texto/acción:** GTA VI y enlace discreto para continuar sin animación/tráiler. Fallo: texto factual y reintento explícito; nunca pantalla vacía.

**Activación/reversión:** disponibilidad efectiva de esenciales dispara entrada, si el usuario sigue al principio y no pidió omitirla. No depende de scroll y no se rebobina al subir. Assets ya preparados: continuar inmediatamente. Error o espera real excesiva: salida estática según UX-UI-V2.md.

**Móvil:** título centrado de ancho ≈80% sin recorte; fondo simple. No realizar más descargas por aumentar el DPR.

## 2 — Transición a portada

**Visitante:** el mismo título se desplaza y reduce hasta arriba a la izquierda; la costa y la radio adquieren presencia por etapas.

**Título/cámara/radio:** transición artística propuesta de unos 720 ms, sin espera previa añadida. Primer tramo: empieza el viaje del título. Después aparece el horizonte y se eleva la iluminación de una radio ya completa. Finalmente quedan legibles materiales y controles. No ejecutar un giro de 360° ni deformar el aparato.

**Fondo y luz:** A se revela primero en profundidad; luz cálida descubre canto, metal y vidrio, conservando la dirección de reflejos. Evitar una radio semitransparente: revelar con exposición/luz y una cobertura de entrada coordinada, no una colección de piezas cargándose.

**Texto/acción:** la frase y CTA alcanzan visibilidad cuando el título ha despejado su zona. No animar simultáneamente nombre, párrafo, navegación, cámara y todas las piezas. El enlace de acceso sigue disponible.

**Activación/reversión:** `q` nace del evento de preparación; no del porcentaje descargado. Al terminar q=1, la escena ya coincide con p=0. Subir luego no vuelve a lanzar la entrada. Ver reglas de interrupción abajo.

**Móvil:** destino del H1 x=24 px, y≈76–88 px; ancho adaptado y radio debajo. Desplazamiento menor; transición propuesta ≤500 ms, o directa con movimiento reducido.

## 3 — Portada estable

**Visitante:** composición reconocible de la imagen aprobada, con playa al atardecer, radio protagonista, título y CTA legibles.

**Título/cámara/radio:** cámara y cuerpo quietos en su encuadre de referencia. Materiales y volumen resuelven la presencia; perilla y aguja esperan el gesto del visitante.

**Fondo y luz:** ambiente A estable, sin luz que cambie sola para adelantar la sintonía. Sombras/reflejos de contacto consistentes.

**Texto/acción:** GTA VI, «La ciudad está en la señal.» y «Ver tráiler oficial». Acceso directo a Mundo/Historia.

**Activación/reversión:** p=0–0,12 reserva reconocimiento espacial durante el primer tramo de desplazamiento natural, sin temporizador de permanencia, bloqueo de rueda ni recorrido vacío artificial. No avanzar solo. En el regreso se alcanza esta portada, no el cartel de carga.

**Móvil:** título y botón arriba; radio entera con espacio de al menos 24 px respecto de la lectura. El rango de reconocimiento se ajusta para no imponer un scroll largo en 360×640.

## 4 — Sintonización mediante scroll: transformación principal

**Visitante:** el gesto mecánico de la radio parece encontrar otro ambiente. La composición cambia en profundidad, perspectivas del lugar y respuesta de materiales, no solo de tono.

**Título/cámara/radio:** la perilla gira hasta 110° y la aguja va del 22 al 78% de su guía con una sola sintonía normalizada. La cámara aproxima de forma moderada y muestra más canto; carcasa, vidrio y frontal permanecen ensamblados. La silueta del aparato no cambia de modelo entre estados.

**Fondo y luz:** arena y costa de A ceden a planos de avenida costera de B mediante continuidad de horizonte y apoyo. La fuente cálida pierde protagonismo, aparecen luces lejanas frías/contenidas y el vidrio refleja el nuevo entorno. Cada plano aporta escala y parallax según su profundidad; no son copias de una foto a distintas velocidades.

**Texto/acción:** «Vice City. Leonida.» en área estable; una sola frase contextual. El brillo del dial y del paisaje no atraviesa el texto.

**Activación/reversión:** p=0,12–0,60 controla por una única función perilla, aguja, cámara, contribución A/B y luces. Detener scroll congela esas pistas; bajar y subir recupera estados equivalentes. La sintonía se completa antes de pasar al descubrimiento.

**Móvil:** acercamiento máximo inicial propuesto 4–6%, órbita reducida y B se revela sobre el objeto. Mantener visibles guía y perilla durante el giro; sin mover el texto junto a la radio.

## 5 — Descubrimiento de otra escena

**Visitante:** la radio baja en el encuadre, dejando un espacio mayor para el nuevo fondo. Parte suficiente del objeto mantiene la conexión con la portada.

**Título/cámara/radio:** reencuadre suave mediante target de cámara más alto y apertura de distancia, con unos pocos grados de orientación. El aparato conserva apoyo; no se hunde en el suelo ni se convierte en una imagen plana arrastrada hacia abajo. La perilla y la aguja mantienen la sintonía alcanzada.

**Fondo y luz:** B queda reconocible por su perspectiva y planos propios; se conserva el vínculo entre iluminación del ambiente y reflejos. No nuevo destello, glitch o segunda transformación mecánica competidora.

**Texto/acción:** «Jason y Lucia.» y una línea breve de contexto ya acordado, con acceso al tráiler. No inventar sinopsis, fechas o ubicaciones oficiales nuevas.

**Activación/reversión:** p=0,60–0,86. En retroceso, primero se recupera el encuadre de sintonía conservando B; al entrar de nuevo en p<0,60 se vuelve de B hacia A. Se conserva el mismo orden espacial.

**Móvil:** descenso menor, con al menos 65% de la silueta reconocible y controles clave todavía identificables. Ganar fondo por arriba en lugar de ampliar un panorama fuera de pantalla.

## 6 — Resolución

**Visitante:** encuadre estable en B, radio todavía reconocible y contenido/CTA sin competencia visual.

**Título/cámara/radio:** final suave de reencuadre, sin vuelta al título centrado ni desmontaje. Perilla y aguja quietas. Recuperar una silueta completa o casi completa según composición final.

**Fondo y luz:** detener toda transformación narrativa. Conservar detalle en metal y vidrio; el final no se disuelve en negro ni inicia un video o audio automático.

**Texto/acción:** «Ver tráiler oficial», navegación útil y nota de concepto independiente. El CTA no exige completar la experiencia para existir.

**Activación/reversión:** p=0,86–1. Al subir se retorna al descubrimiento y después a la sintonía, sin repetir preparación ni entrada temporal.

**Móvil:** acción en bloque HTML libre del objeto. Fondo y radio no ocupan una altura adicional vacía que obligue a desplazarse para pulsar el botón.

## Interrupciones, visitas posteriores y conexión sin saltos

- Si se hace scroll antes de terminar la preparación, priorizar contenido estático y no lanzar una introducción tardía. No cancelar la rueda ni acumular desplazamiento que después salte de golpe.
- Durante la entrada, una intención de scroll o navegación cancela la parte ornamental. Tomar la pose y rectángulo actuales como origen y conectar de forma continua, en un máximo propuesto de 180 ms, con la pose correspondiente al scroll real. Un solo controlador mezcla esa unión; no reinicia el título ni obliga a volver al principio. Si el área ya salió de vista, resolver fuera de pantalla.
- Anclas, historial y restauración de scroll inicial mayor que cero omiten el cartel centrado. Preparar el estado correspondiente detrás de un poster válido y ceder cuando coincida; no mostrar p=0 durante un frame antes de aplicar la restauración.
- Guardar en la sesión de la pestaña que la entrada se completó u omitió. No repetirla en navegación interna, recarga/restauración de esa sesión o bfcache. Si ese almacenamiento no está disponible, priorizar omitir antes que insistir en una introducción larga.
- Resolver entrada omitida, ancla y restauración antes de la primera pintura del título cuando sea posible. Una visita posterior no debe mostrar un flash del cartel centrado antes de adoptar el destino de portada; ante incertidumbre, usar el estado estático de destino.
- El estado de disponibilidad no reacciona a cada resize ni a volver de una pestaña oculta. Invalidar callbacks de cargas canceladas para impedir que una llegada tardía reinicie la entrada.
- Si cambia a movimiento reducido durante la secuencia, cancelar suavizados y ambiente, presentar una composición estable y conservar foco/posición de lectura. Fallo de renderer: cambiar a poster/contenido sin borrar navegación.

## Sistemas y restricciones

| Sistema | Propiedades | Control |
|---|---|---|
| Preparación | Disponibilidad de modelo/materiales/entornos/frame | Eventos reales; sin porcentaje ficticio |
| Entrada temporal | Mismo H1, cobertura y revelación de luz | q, una sola vez; p aún no escribe sobre la escena |
| Scroll | Cámara, perilla, aguja, profundidad A/B, luz y reflejos | p; funciones reversibles, sin rebotes ni inercia larga |
| Ambiente | Ninguno necesario para la base | Apagado; una mejora futura tendría pausa y no movería piezas |
| Puntero | Ninguno necesario para la base | Apagado; no sustituye scroll ni requiere captura del cursor |

Suavizado eventual de scroll ≤100–150 ms como punto de partida, sin combinarlo con otro smooth-scroll global. Textos quietos y transiciones de opacidad discretas solo cuando ayudan a leer. La separación de carcasa está fuera de esta coreografía y no es un criterio de aceptación de la prueba.
