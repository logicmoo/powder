import test from 'node:test';
import assert from 'node:assert/strict';
import { mkdtempSync, mkdirSync, writeFileSync, symlinkSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawnSync } from 'node:child_process';

const script = fileURLToPath(new URL('../windows_catalog.ps1', import.meta.url));
const windows = process.platform === 'win32';
function invoke(root, mode, paths = []) {
  return spawnSync('powershell', ['-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'Bypass', '-File', script,
    '-Root', root, '-Mode', mode], { input: JSON.stringify(paths), encoding: 'utf8' });
}

test('Windows native catalog rejects junctions and transports literal paths', { skip: !windows }, () => {
  const base = mkdtempSync(join(tmpdir(), 'ow catalog '));
  const root = join(base, 'KBs'), outside = join(base, 'outside');
  mkdirSync(root); mkdirSync(outside);
  const original = join(root, "literal ' $name.kif");
  writeFileSync(original, '(isa a b)');
  writeFileSync(join(root, 'cache.kif.pl'), 'must not be cataloged');
  writeFileSync(join(outside, 'escape.krf'), '(isa private outside)');
  symlinkSync(outside, join(root, 'linked'), 'junction');
  try {
    const catalog = invoke(root, 'catalog');
    assert.equal(catalog.status, 0, catalog.stderr);
    const rows = JSON.parse(catalog.stdout);
    assert.deepEqual(rows.map(row => resolve(row.path)), [resolve(original)]);
    assert.equal(invoke(root, 'authorize', [original]).status, 0);
    assert.notEqual(invoke(root, 'authorize', [join(root, 'linked', 'escape.krf')]).status, 0);
    assert.notEqual(invoke(root, 'authorize', [join(outside, 'escape.krf')]).status, 0);
    assert.notEqual(invoke(root, 'authorize', [join(root, 'cache.kif.pl')]).status, 0);
  } finally {
    rmSync(join(root, 'linked'));
    rmSync(base, { recursive: true });
  }
});
