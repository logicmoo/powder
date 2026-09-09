import test from 'node:test';
import assert from 'node:assert/strict';
import { mkdtempSync, mkdirSync, writeFileSync, readFileSync, statSync, rmSync } from 'node:fs';
import { join, relative } from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawnSync } from 'node:child_process';

test('root and KBs invocations reuse the same companions and occurrence IDs', () => {
  const root = fileURLToPath(new URL('../../../', import.meta.url));
  const artifacts = fileURLToPath(new URL('./artifacts/', import.meta.url));
  mkdirSync(artifacts, { recursive: true });
  const directory = mkdtempSync(join(artifacts, 'cwd-'));
  const source = join(directory, 'SameSource.krf');
  writeFileSync(source, '(in-microtheory TestMt)\n(p A)\n(p A)\n');
  const cli = join(root, 'prolog', 'ow_dr', 'compile_kb.pl');
  const state = join(directory, 'state');
  const run = cwd => spawnSync('swipl', [
    relative(cwd, cli), '--', '--no-progress', `--state-dir=${state}`,
    relative(cwd, source),
  ], { cwd, encoding: 'utf8', timeout: 30000 });
  try {
    const first = run(root);
    assert.equal(first.status, 0, first.stderr);
    assert.match(first.stderr, /generated=1 cache-hit=0/);
    const companions = [`${source}.pl`, `${source}.index.pl`];
    const before = companions.map(path => ({ bytes: readFileSync(path), modified: statSync(path).mtimeMs }));
    const second = run(join(root, 'KBs'));
    assert.equal(second.status, 0, second.stderr);
    assert.match(second.stderr, /generated=0 cache-hit=1/);
    companions.forEach((path, i) => {
      assert.deepEqual(readFileSync(path), before[i].bytes);
      assert.equal(statSync(path).mtimeMs, before[i].modified);
    });
    const ids = [...before[0].bytes.toString('utf8').matchAll(/x_cid\((a[0-9a-f]+)\)/gu)].map(match => match[1]);
    assert.equal(ids.length, 2);
    assert.notEqual(ids[0], ids[1]);
  } finally {
    rmSync(directory, { recursive: true, force: true });
  }
});
