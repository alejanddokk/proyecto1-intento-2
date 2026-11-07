# intento 2

Preparación de una futura landing sobre el lanzamiento de **GTA 6**.

**Estado al 5 de noviembre de 2026:** **Frecuencia VI, variante 1 — Señal de Leonida** elegida por el usuario. Diagnóstico de RAM y storyboard actualizado de seis momentos: entrada tipográfica preparada, portada, sintonización reversible del entorno y resolución. Apertura de carcasa fuera del núcleo. Implementación pendiente de la siguiente indicación del usuario; no hay aplicación ni prototipo funcional.

- [Entrega vigente: Frecuencia VI](docs/frecuencia-vi/README.md)
- [Diagnóstico de RAM y medidas de contención](docs/frecuencia-vi/DIAGNOSTICO-RAM.md)
- [UX/UI vigente](docs/frecuencia-vi/UX-UI-V2.md)
- [Storyboard y coreografía vigentes](docs/frecuencia-vi/STORYBOARD-V2.md)
- [Evidencia temporal y mediciones](docs/frecuencia-vi/EVIDENCIA-MOVIMIENTO.md)
- [Prueba futura pequeña y recursos](docs/frecuencia-vi/PRUEBA-Y-RECURSOS-V2.md)

- [Antecedente: tres direcciones investigadas](docs/investigacion/PROPUESTAS.md)
- [Siete referencias y evidencia visual](docs/investigacion/REFERENCIAS.md)
- [Brief de investigación y límites](docs/investigacion/BRIEF.md)

- [Entorno, herramientas, skills e integraciones](docs/ENTORNO.md)
- [Tareas, dependencias y aceptación](docs/TAREAS.md)
- [Decisiones y comprobaciones](docs/DECISIONES.md)
- [Instrucciones para futuras sesiones](AGENTS.md)

## Comprobar el entorno

Desde PowerShell en esta carpeta:

```powershell
node tools/check-environment.cjs
node tools/check-environment.cjs --browser
.\tools\pnpm.ps1 --version
```

La segunda comprobación abre un Chrome headless independiente, usa una página vacía y lo cierra. Comprueba viewport móvil, movimiento reducido y disponibilidad de WebGL2; no mide el rendimiento de una landing.

Durante presión de memoria o trabajo documental no ejecutar esa comprobación de navegador por rutina. El diagnóstico acotado es `tools/resource-audit.ps1 -Label <etiqueta>`; guarda JSON sin cerrar procesos ni persistir comandos completos.

`tools/pnpm.ps1` aprovecha el gestor incluido con el runtime de Node de Codex, sin cambiar el PATH ni instalar otro gestor. Los scripts buscan primero dependencias locales y después las del runtime; un cambio de instalación puede requerir revisar las rutas. En otro equipo, proveer Node, Git y pnpm y repetir la comprobación.

Todavía no hay `package.json`, lockfile, servidor de aplicación ni build. Se crearán al autorizar el desarrollo. Las herramientas de video y edición de modelos se incorporarán cuando los recursos elegidos las requieran.
