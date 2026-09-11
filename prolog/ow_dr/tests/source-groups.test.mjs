import test from 'node:test';
import assert from 'node:assert/strict';
import { SourceSelection, canonicalPath, supportedSource, visibleSourceFiles, visibleSourceDirectories } from '../web/model.js';

const file = path => ({ type: 'file', path });
const directory = (path, children = []) => ({ type: 'directory', path, children });
const mixed = 'KBs/freecivai/flat-files';
const locals = Array.from({ length: 26 }, (_, index) => `${mixed}/local-${index}.krf`);
const subdirs = Array.from({ length: 3 }, (_, index) => `${mixed}/sub-${index}`);
const nested = subdirs.map(path => `${path}/nested.krf`);
function fixture(active = []) {
  const children = [];
  locals.forEach((path, index) => {
    if (index < 3) children.push(directory(subdirs[index], [file(nested[index])]));
    children.push(file(path));
  });
  return new SourceSelection([directory(mixed, children)], active, 7);
}

test('mixed-directory groups partition direct files and subdirectories without synthetic paths', () => {
  const model = fixture();
  const [directories, local] = model.groupsFor(mixed);
  assert.deepEqual([directories.kind, local.kind], ['subdirectories', 'local-files']);
  assert.deepEqual([directories.label, local.label], ['Subdirectories', 'Local files']);
  assert.equal(directories.total, 3);
  assert.equal(local.total, 26);
  assert.deepEqual(directories.children, subdirs);
  assert.deepEqual(local.children, locals);
  assert.deepEqual(model.groupFiles(local.key), locals);
  assert.deepEqual(model.groupFiles(directories.key), nested);
  assert.deepEqual(new Set([...model.groupFiles(local.key), ...model.groupFiles(directories.key)]), new Set(model.files));
  assert.equal(model.filesFor(mixed).length, 29);
  for (const group of model.groups.values()) {
    assert.equal(canonicalPath(group.key), null);
    assert.equal(model.records.has(group.key), false);
    assert.equal(model.files.includes(group.key), false);
    assert.deepEqual(model.setSelected(group.key, true), []);
  }
  assert.deepEqual(model.groupsFor(mixed).map(group => group.key), fixture().groupsFor(mixed).map(group => group.key));
});

test('group tri-state and selection are independent and remain exact after reset', () => {
  const model = fixture([locals[0], nested[0]]);
  const [directories, local] = model.groupsFor(mixed);
  assert.deepEqual(model.groupState(local.key), { checked: false, indeterminate: true, disabled: false, selected: 1, total: 26 });
  const changes = model.setGroupSelected(local.key);
  assert.ok(changes.every(path => canonicalPath(path)));
  assert.equal(model.groupState(local.key).checked, true);
  assert.equal(model.groupState(directories.key).selected, 1);
  assert.equal(model.state(mixed).selected, 27);
  model.setGroupSelected(directories.key, false);
  assert.deepEqual(model.selectedFiles(), locals);
  assert.deepEqual(model.groupFiles(directories.key, { selectedOnly: true }), []);
  model.setSelected(mixed, true);
  model.setSelected(locals[4], false);
  assert.equal(model.groupState(directories.key).checked, true);
  assert.equal(model.groupState(local.key).selected, 25);
  assert.equal(model.state(mixed).selected, 28);
  assert.ok(model.selectedFiles().every(supportedSource));
  assert.deepEqual([...model.active], [locals[0], nested[0]]);
  model.reset([nested[2]], 8);
  assert.equal(model.groupState(local.key).selected, 0);
  assert.equal(model.groupState(directories.key).selected, 1);
  assert.equal(model.dirty, false);
  assert.deepEqual(model.selectedFiles(mixed), [nested[2]]);
});

test('each group collapses independently without hiding or selecting its sibling', () => {
  const model = fixture([locals[0], nested[0]]);
  const [directories, local] = model.groupsFor(mixed);
  const expanded = new Set([mixed, ...subdirs]);
  assert.equal(visibleSourceFiles(model, expanded).length, 29);
  assert.deepEqual(visibleSourceFiles(model, expanded, new Set([local.key])), nested);
  assert.deepEqual(visibleSourceFiles(model, expanded, new Set([directories.key])), locals);
  assert.deepEqual(visibleSourceDirectories(model, expanded, new Set([directories.key])), [mixed]);
  assert.deepEqual(visibleSourceDirectories(model, expanded, new Set([local.key])), [mixed, ...subdirs]);
  assert.deepEqual(visibleSourceFiles(model, expanded, new Set([local.key, directories.key])), []);
  assert.deepEqual(visibleSourceFiles(model, new Set(), new Set()), []);
  assert.deepEqual(model.selectedFiles(), [nested[0], locals[0]]);
  assert.equal(model.dirty, false);
});

test('non-mixed directories stay ungrouped and empty subdirectory groups remain visible but disabled', () => {
  const model = new SourceSelection([
    directory('KBs/files', [file('KBs/files/a.krf')]),
    directory('KBs/directories', [directory('KBs/directories/empty')]),
    directory('KBs/mixed', [directory('KBs/mixed/empty'), file('KBs/mixed/a.krf')]),
  ]);
  assert.deepEqual(model.groupsFor('KBs/files'), []);
  assert.deepEqual(model.groupsFor('KBs/directories'), []);
  assert.deepEqual(model.groupsFor('KBs/directories/empty'), []);
  const [group] = model.groupsFor('KBs/mixed');
  assert.equal(model.groupState(group.key).disabled, true);
  assert.equal(group.children.length, 1);
  assert.deepEqual(model.groupFiles(group.key), []);
});

test('the real KBs root can group a catalog forest without inserting virtual records', () => {
  const model = new SourceSelection([directory('KBs/sub', [file('KBs/sub/a.krf')]), file('KBs/tinyKB.krf')]);
  const [directories, local] = model.groupsFor('KBs');
  assert.equal(model.records.has('KBs'), false);
  assert.deepEqual(model.roots, ['KBs/sub', 'KBs/tinyKB.krf']);
  model.setGroupSelected(local.key, true);
  assert.equal(model.groupState(local.key).selected, 1);
  model.setSelected('KBs/sub/a.krf', true);
  assert.equal(model.groupState(directories.key).selected, 1);
  model.setSelected('KBs', false);
  assert.equal(model.groupState(local.key).selected, 0);
  assert.equal(model.groupState(directories.key).selected, 0);
  assert.deepEqual(visibleSourceFiles(model, new Set(['KBs/sub']), new Set([directories.key])), ['KBs/tinyKB.krf']);
  assert.deepEqual(visibleSourceDirectories(model, new Set(['KBs/sub']), new Set([directories.key])), []);
});

test('DFS ranges restrict file-set reads to the requested group, not the whole tree', () => {
  const many = Array.from({ length: 10000 }, (_, index) => file(`KBs/large/nested/${index}.krf`));
  const model = new SourceSelection([directory('KBs/large',
    [file('KBs/large/one.krf'), directory('KBs/large/nested', many), file('KBs/large/two.krf')])]);
  const local = model.groupsFor('KBs/large')[1];
  let reads = 0;
  model.files = new Proxy(model.files, { get(target, property, receiver) {
    if (/^\d+$/u.test(String(property))) reads++;
    return Reflect.get(target, property, receiver);
  } });
  assert.deepEqual(model.groupFiles(local.key), ['KBs/large/one.krf', 'KBs/large/two.krf']);
  assert.equal(reads, 2);
  reads = 0;
  assert.equal(model.groupState(local.key).total, 2);
  assert.equal(reads, 0);
  assert.deepEqual(model.filesFor('KBs/large/nested/400.krf'), ['KBs/large/nested/400.krf']);
  assert.equal(reads, 1);
});

test('a nested file cannot masquerade as an immediate local child', () => {
  const model = new SourceSelection([directory('KBs/parent',
    [file('KBs/parent/unrepresented/child.krf'), directory('KBs/parent/empty'), file('KBs/parent/local.krf')])]);
  assert.equal(model.records.has('KBs/parent/unrepresented/child.krf'), false);
  assert.deepEqual(model.groupFiles(model.groupsFor('KBs/parent')[1].key), ['KBs/parent/local.krf']);
});
