import { build } from 'esbuild';
import { readFile, writeFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const root = dirname(fileURLToPath(import.meta.url));
await build({
  entryPoints: [join(root, 'codemirror-entry.js')], outfile: join(root, 'codemirror.bundle.js'),
  bundle: true, format: 'esm', platform: 'browser', target: 'es2022', minify: true,
  legalComments: 'eof', banner: { js: '/* CodeMirror 6 — offline bundle. Versions and MIT licenses: codemirror.LICENSE.txt. */' },
});
const lock = JSON.parse(await readFile(join(root, 'package-lock.json'), 'utf8'));
const licenses = [];
for (const [path, info] of Object.entries(lock.packages)) {
  if (!path || path.includes('esbuild')) continue;
  const name = path.replace(/^node_modules\//, '');
  const license = await readFile(join(root, path, 'LICENSE'), 'utf8');
  licenses.push(`${name}@${info.version}\n${info.resolved}\n${info.integrity}\n\n${license}`);
}
await writeFile(join(root, 'codemirror.LICENSE.txt'), licenses.join('\n\n----------------------------------------\n\n'));
