# Señal de Leonida: dirección aprobada y UX/UI vigente

2026-11-05. El usuario eligió **variante 1 — Señal de Leonida**. [Referencia de apariencia aprobada](visuales/variante-1-senal-de-leonida.png). No hay otra elección de variante pendiente. La implementación continúa sin autorización.

## Fidelidad y responsabilidades

Product Design mantiene la fidelidad al objetivo y al contexto ya definido; no se relanza ideate ni se genera otra imagen. Scroll-craft orienta continuidad espacial y ritmo; Three.js y GSAP aportan criterios de piezas, cámara y progreso. Se reutiliza la investigación temporal de referencias ya guardada, sin reabrirlas. No hay workflows de construcción, Figma, dependencias nuevas ni subagentes en paralelo.

Conservar de la imagen: radio oscura grande, cuerpo bajo y ancho, vidrio ahumado, laterales metálicos, dos controles de jerarquía desigual, reflejos cálidos, playa al atardecer, título grande arriba a la izquierda y composición de pocos elementos. El modelo futuro será propio y ajustado a esa silueta. Un modelo genérico o una foto trasladada no satisfacen el diseño.

La referencia completa se usa para comparación, no como textura de fondo que incluya título, interfaz y radio. El título y los controles de navegación son HTML; la radio tiene geometría real, espesor y materiales; perilla y aguja son piezas independientes. El entorno tiene profundidad y encuadre propios. La carcasa permanece cerrada: no se requiere producir circuitos ni interior para la primera prueba.

## Objetivo, jerarquía y acción

Despertar interés por GTA VI mediante una breve experiencia de sintonización y conducir a **Ver tráiler oficial**. Se conserva el destino oficial ya investigado, [Media de Rockstar](https://www.rockstargames.com/VI/media); revalidarlo al incorporar el enlace a una aplicación. No se agregan fechas, plataformas, emisoras ni otros datos nuevos del juego.

Entrada: GTA VI centrado, fondo ciruela oscuro y acceso discreto al contenido sin animación. Portada: GTA VI arriba a la izquierda, «La ciudad está en la señal.», CTA coral y radio grande abajo a la derecha. Cabecera: Frecuencia VI, Mundo e Historia. Una sola frase contextual visible por momento, sin multiplicar paneles ni titulares que viajen con cada pieza.

Se mantienen la receta Barlow Condensed 700/800 + Inter, fondo `#211B29`, texto `#F5EBDD`, coral `#FF796B`, metal grafito y luz ámbar. Márgenes de referencia de 72 px en escritorio y 24 px en móvil. Son valores de especificación; la fidelidad final requiere comparar el render con la imagen aprobada. Las fuentes y posters finales todavía no están producidos/incorporados.

## Carga que permite continuar

El H1 y el acceso al contenido oficial existen desde el HTML inicial. Sin porcentajes, espera mínima, bloqueo del teclado ni audio. Si los recursos ya están listos, iniciar inmediatamente la transición artística; no mantener el cartel para aparentar una carga.

Recursos esenciales: geometría de la radio, materiales y texturas base, entornos A y B de baja resolución, tipografía crítica o fallback estabilizado, y un primer frame correcto de A preparado detrás de la entrada. Se pueden diferir detalle fino y texturas de mayor resolución. La portada no espera todas las calidades opcionales.

Fijar la tipografía usada por el H1 antes de moverlo: subconjunto crítico local de la fuente elegida o fallback de métricas estables. Una fuente que llegue tarde no debe cambiar el tamaño durante la transición. Sin fuente crítica disponible, conservar el fallback en esa visita o elegir la presentación estática; no ocultar el título indefinidamente.

Presupuesto inicial de espera real: si a los 6 s no hay una escena base válida, ofrecer la presentación estática y un reintento explícito. Ese límite libera la espera, no es un tiempo mínimo. El enlace al tráiler y Continuar sin animación están disponibles antes. Los errores definitivos pasan directamente al contenido estático, sin esperar ese plazo.

## Dos ambientes, una misma continuidad

**A:** playa al atardecer, fiel a la apariencia aprobada: horizonte cálido, siluetas de palmeras y superficie oscura de apoyo de la radio.

**B:** interpretación creativa de una avenida costera al anochecer, con perspectiva de calle, pocas fachadas y luces lejanas. No se afirma que sea una localización oficial concreta del juego. Cambian la estructura y profundidad visibles, no solamente el color de A.

La perilla y la aguja hacen avanzar una única sintonía. Cambian el encuadre, la separación aparente entre planos del paisaje, la contribución de A/B, las luces y el entorno reflejado sobre metal/vidrio. Una transición contenida de luz enmascara el cambio de paisaje, manteniendo suelo de apoyo y horizonte compatibles. No aplicar dos filtros de color a una misma fotografía ni hacer pasar una máscara 2D por geometría de la radio.

Después de sintonizar, el reencuadre hace que la radio baje en pantalla y cambie levemente de orientación. Se logra mediante cámara y geometría dentro de la escena, conservando contacto con el soporte; no hundiendo el objeto en el suelo ni trasladando una captura completa. Sigue visible una porción reconocible del aparato que conecta los momentos.

## Móvil y acceso alternativo

Diseño de referencia: 390×844, con comprobación compacta a 360×640. H1 en la parte superior después de la entrada; frase y CTA fuera de la silueta; radio completa debajo, ocupando 88–94% del ancho útil en portada. Sin desplazamiento horizontal, control obligatorio por arrastre o radio convertida en un icono.

Reducir el acercamiento y la órbita; para descubrir B, ampliar el fondo sobre la radio y limitar su descenso. Mantener al menos 65% de su silueta en ese momento, con vidrio y uno de los controles reconocibles. El CTA final tiene espacio HTML propio.

Con movimiento reducido: ir directamente a la composición final de portada, sin viaje del título, órbita ni sintonía automática. Mundo e Historia se leen en flujo normal con imágenes estáticas por ambiente, si están disponibles. Sin WebGL, fallo del modelo o JavaScript: mismo contenido y acciones, poster coherente producido desde la futura escena. Si tampoco carga el poster, fondo sólido con título y contenido, sin espacios de scroll vacíos ni una pantalla de carga atrapada.

El poster final no es el mockup completo presentado como experiencia 3D. La imagen aprobada permanece como referencia de comparación, no como sustitución del modelo.

## Movimiento secundario

Para la prueba y primera edición, **ambiente temporal y parallax de puntero apagados por defecto**. El mundo ya se transforma mediante scroll; no hacen falta loops para demostrar elaboración. Una mejora ambiental posterior sería tenue, pausable y sin mover perilla/aguja. No debe cambiar las condiciones del recorrido reversible ni disparar audio.

Separación de carcasa: recurso opcional no incluido en la secuencia ni en la prueba mínima; solo incorporable si mejora la sintonización sin alterar silueta, lectura o continuidad. La antigua apertura protagonista queda retirada.
