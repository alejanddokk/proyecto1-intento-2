// Diagnóstico de herramientas. No instala dependencias ni crea una aplicación.
const fs = require('node:fs');
const path = require('node:path');
const { createRequire } = require('node:module');
const { execFileSync } = require('node:child_process');

const roots = [
  path.resolve(__dirname, '..', 'node_modules'),
  path.resolve(path.dirname(process.execPath), '..', 'node_modules'),
];
let failures = 0;
function report(status, check, detail) {
  console.log(JSON.stringify({ status, check, detail }));
  if (status === 'FAIL') failures += 1;
}
function dependency(name) {
  for (const root of roots) {
    const manifest = path.join(root, name, 'package.json');
    if (fs.existsSync(manifest)) {
      const meta = JSON.parse(fs.readFileSync(manifest, 'utf8'));
      return { meta, manifest, require: createRequire(manifest) };
    }
  }
  throw new Error(`${name}: no encontrado localmente ni en el runtime de Node`);
}
async function check(name, action) {
  try { await action(); } catch (error) { report('FAIL', name, error.message); }
}

(async () => {
  await check('Node', () => {
    const [major, minor] = process.versions.node.split('.').map(Number);
    if (!(major > 22 || (major === 22 && minor >= 12))) {
      throw new Error('Este proyecto recomienda Node 22.12+; revalidar requisitos al instalar Vite.');
    }
    report('PASS', 'Node', { version: process.version, path: process.execPath });
  });
  await check('Git', () => report('PASS', 'Git', execFileSync('git', ['--version'], { encoding: 'utf8', windowsHide: true, timeout: 10000 }).trim()));
  await check('pnpm', () => {
    const pkg = dependency('pnpm');
    const bin = typeof pkg.meta.bin === 'string' ? pkg.meta.bin : pkg.meta.bin.pnpm;
    const version = execFileSync(process.execPath, [path.resolve(path.dirname(pkg.manifest), bin), '--version'], { encoding: 'utf8', windowsHide: true, timeout: 15000 }).trim();
    report('PASS', 'pnpm', version);
  });
  await check('Sharp', async () => {
    const pkg = dependency('sharp');
    const sharp = pkg.require('sharp');
    for (const format of ['webp', 'avif']) {
      const buffer = await sharp({ create: { width: 8, height: 8, channels: 4, background: { r: 10, g: 20, b: 30, alpha: 1 } } })[format]().toBuffer();
      const meta = await sharp(buffer).metadata();
      if (meta.width !== 8 || meta.height !== 8) throw new Error(`Conversión inválida: ${format}`);
      report('PASS', `Sharp ${format}`, { version: pkg.meta.version, bytes: buffer.length });
    }
  });
  await check('Playwright', async () => {
    const pkg = dependency('playwright');
    const { chromium } = pkg.require('playwright');
    report('PASS', 'Playwright', pkg.meta.version);
    if (!process.argv.includes('--browser')) {
      report('SKIP', 'Chrome/WebGL2', 'Ejecutar con --browser para comprobarlos.');
      return;
    }
    const browser = await chromium.launch({ channel: 'chrome', headless: true, timeout: 30000 });
    try {
      const context = await browser.newContext({ viewport: { width: 1440, height: 900 } });
      await context.addInitScript(() => {
        Element.prototype.requestPointerLock = () => {};
        Element.prototype.setPointerCapture = () => {};
      });
      const page = await context.newPage();
      // newPage ya contiene about:blank; no hace falta otra navegación.
      report('PASS', 'Chrome desktop', { version: browser.version(), viewport: page.viewportSize() });
      await page.setViewportSize({ width: 390, height: 844 });
      await page.emulateMedia({ reducedMotion: 'reduce' });
      const capabilities = await page.evaluate(() => {
        const canvas = document.createElement('canvas');
        const gl = canvas.getContext('webgl2');
        const webgl2 = Boolean(gl);
        if (gl) gl.getExtension('WEBGL_lose_context')?.loseContext();
        return { width: innerWidth, height: innerHeight, reducedMotion: matchMedia('(prefers-reduced-motion: reduce)').matches, webgl2 };
      });
      if (capabilities.width !== 390 || capabilities.height !== 844 || !capabilities.reducedMotion || !capabilities.webgl2) {
        throw new Error(JSON.stringify(capabilities));
      }
      report('PASS', 'Chrome mobile/reduced-motion/WebGL2', capabilities);
    } finally { await browser.close(); }
  });
  process.exitCode = failures ? 1 : 0;
})().catch(error => { report('FAIL', 'diagnóstico', error.message); process.exitCode = 1; });
