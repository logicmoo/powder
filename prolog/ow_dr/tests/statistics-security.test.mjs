import test from 'node:test';
import assert from 'node:assert/strict';
import { mkdirSync, writeFileSync, symlinkSync, rmSync } from 'node:fs';
import { join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { spawnSync } from 'node:child_process';

const here = fileURLToPath(new URL('.', import.meta.url));
const script = fileURLToPath(new URL('../windows_catalog.ps1', import.meta.url));
test('statistics authorize concrete originals and adjacent sidecars in one native batch', { skip: process.platform !== 'win32' }, () => {
  const base = join(here, `.statistics-security-${process.pid}-${Date.now()}`);
  const root = join(base, 'KBs'), outside = join(base, 'outside');
  const cache = join(base, 'tmp', 'KBs');
  mkdirSync(root, { recursive: true }); mkdirSync(outside);
  const safe = join(root, 'safe.kif'), missing = join(root, 'missing.metta'), unsafe = join(root, 'unsafe.meld');
  const invoke = (paths, mode = 'statistics') => spawnSync('powershell', ['-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'Bypass',
    '-File', script, '-Root', root, '-Mode', mode, ...(mode === 'artifacts' ? ['-CacheRoot', cache] : [])],
  { input: JSON.stringify(paths), encoding: 'utf8' });
  try {
    for (const path of [safe, missing, unsafe]) writeFileSync(path, '(inert fixture)');
    const authorized = invoke([safe, missing], 'authorize');
    assert.equal(authorized.status, 0, authorized.stderr);
    assert.deepEqual(JSON.parse(authorized.stdout), [safe, missing]);
    const oneSource = invoke([safe], 'authorize');
    assert.equal(oneSource.status, 0, oneSource.stderr);
    assert.deepEqual(JSON.parse(oneSource.stdout), [safe]);
    const noSources = invoke([], 'authorize');
    assert.equal(noSources.status, 0, noSources.stderr);
    assert.deepEqual(JSON.parse(noSources.stdout), []);
    assert.notEqual(invoke([[safe, missing]], 'authorize').status, 0);
    writeFileSync(`${safe}.inventory.json`, '{"schema":"fixture"}');
    symlinkSync(outside, `${unsafe}.inventory.json`, 'junction');
    mkdirSync(cache, { recursive: true });
    writeFileSync(join(cache, 'safe.kif.data'), 'deliberately invalid cache: presence is not validity');
    writeFileSync(join(cache, 'missing.metta.index.data'), 'inert index presence fixture');
    symlinkSync(outside, join(cache, 'unsafe.meld.data'), 'junction');
    const artifacts = source => ({ source, data: join(cache, `${source.split('\\').at(-1)}.data`),
      index: join(cache, `${source.split('\\').at(-1)}.index.data`) });
    const artifactResult = invoke([safe, missing, unsafe].map(artifacts), 'artifacts');
    assert.equal(artifactResult.status, 0, artifactResult.stderr);
    assert.deepEqual(JSON.parse(artifactResult.stdout).map(({ cached, indexed }) => [cached, indexed]),
      [[true, false], [false, true], [null, false]]);
    const escapedArtifact = invoke([{ ...artifacts(safe), data: join(outside, 'private.data') }], 'artifacts');
    assert.equal(escapedArtifact.status, 0, escapedArtifact.stderr);
    assert.equal(JSON.parse(escapedArtifact.stdout)[0].cached, null);
    rmSync(join(cache, 'unsafe.meld.data'));
    rmSync(join(base, 'tmp'), { recursive: true });
    mkdirSync(join(outside, 'KBs'));
    writeFileSync(join(outside, 'KBs', 'safe.kif.data'), 'must not be followed through tmp junction');
    symlinkSync(outside, join(base, 'tmp'), 'junction');
    const escapedCacheRoot = invoke([artifacts(safe)], 'artifacts');
    assert.equal(escapedCacheRoot.status, 0, escapedCacheRoot.stderr);
    assert.equal(JSON.parse(escapedCacheRoot.stdout)[0].cached, null);
    rmSync(join(base, 'tmp'));
    const result = invoke([safe, missing, unsafe]);
    assert.equal(result.status, 0, result.stderr);
    assert.deepEqual(JSON.parse(result.stdout).map(row => row.availability), ['available', 'missing', 'unsafe']);
    assert.notEqual(invoke([`${safe}.inventory.json`]).status, 0);
    writeFileSync(join(outside, 'private.krf'), '(private)');
    symlinkSync(outside, join(root, 'escape'), 'junction');
    assert.notEqual(invoke([join(root, 'escape', 'private.krf')]).status, 0);
    const directory = invoke([root], 'directory_statistics');
    assert.equal(directory.status, 0, directory.stderr);
    assert.equal(JSON.parse(directory.stdout).length, 3);
    assert.notEqual(invoke([root, outside], 'directory_statistics').status, 0);
    assert.notEqual(invoke([join(root, 'escape')], 'directory_statistics').status, 0);
    assert.notEqual(invoke([outside], 'directory_statistics').status, 0);
    const mt = join(root, 'microtheory');
    mkdirSync(mt);
    writeFileSync(join(mt, '_catalog.json'), '{}');
    symlinkSync(outside, join(mt, 'unsafe.json'), 'junction');
    const mtResult = invoke([join(mt, '_catalog.json'), join(mt, 'unsafe.json')], 'mt_statistics');
    assert.equal(mtResult.status, 0, mtResult.stderr);
    assert.deepEqual(JSON.parse(mtResult.stdout).map(row => row.availability), ['available', 'unsafe']);
    assert.notEqual(invoke([join(outside, 'private.json')], 'mt_statistics').status, 0);
    rmSync(join(mt, 'unsafe.json'));
    rmSync(mt, { recursive: true });
    writeFileSync(join(outside, 'private.json'), '{}');
    symlinkSync(outside, mt, 'junction');
    const escapedDirectory = invoke([join(mt, 'private.json')], 'mt_statistics');
    assert.equal(escapedDirectory.status, 0, escapedDirectory.stderr);
    assert.equal(JSON.parse(escapedDirectory.stdout)[0].availability, 'unsafe');
    rmSync(mt);
  } finally {
    rmSync(`${unsafe}.inventory.json`, { force: true });
    rmSync(join(root, 'escape'), { force: true });
    rmSync(base, { recursive: true, force: true });
  }
});
