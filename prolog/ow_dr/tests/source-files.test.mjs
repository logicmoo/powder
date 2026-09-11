import test from 'node:test';
import assert from 'node:assert/strict';
import { FileMetadata, SourceSelection, recordedFileMT, sourceFileRecord, sourceFileStates } from '../web/model.js';
import { fileBadgeDescriptions } from '../web/source-files.js';

const first = 'KBs/group/first.kif', later = 'KBs/group/nested/later.metta';
const startup = { known: true, paths: [first], evidence: 'initial_successful_load' };
const file = (path, extra = {}) => ({ path, type: 'file', ...extra });

test('one source model separates startup, active membership, artifacts and draft selection', () => {
  const metadata = new FileMetadata();
  metadata.status({ generation: 1, startup, files: [file(first, { sizeBytes: 20 })] });
  assert.equal(metadata.get(first).startup, true);
  assert.equal(metadata.get(first).loaded, true);
  assert.equal(metadata.get(first).cached, null);
  metadata.information({ generation: 1, startup, items: [file(first, {
    sizeBytes: 0, states: { cached: false, indexed: true }, diagnostics: { warnings: 2, errors: 0 },
  })] });
  metadata.status({ generation: 2, files: [file(later)] });
  assert.equal(metadata.get(first).startup, true);
  assert.equal(metadata.get(first).loaded, false);
  assert.equal(metadata.get(later).startup, false);
  assert.equal(metadata.get(later).loaded, true);
  metadata.status({ generation: 3, files: [] });
  assert.equal(metadata.get(first).startup, true);
  assert.equal(metadata.get(first).loaded, false);
  assert.equal(metadata.get(first).sizeBytes, 0);
  assert.equal(metadata.get(first).indexed, true);
  assert.equal(metadata.information({ generation: 2, items: [file(first)] }), false);
});

test('unknown values stay unknown and zero is a valid recorded size or count', () => {
  const unknown = fileBadgeDescriptions(sourceFileRecord({ states: { cached: 'true' }, sizeBytes: -1,
    diagnostics: { warnings: '0', errors: null } }));
  assert.equal(unknown.length, 7);
  assert.equal(unknown.find(badge => badge.key === 'warnings').text, 'Warnings: unknown');
  assert.equal(unknown.find(badge => badge.key === 'sizeBytes').text, 'Size: unknown');
  const zero = fileBadgeDescriptions(sourceFileRecord({ sizeBytes: 0, diagnostics: { warnings: 0, errors: 0 } }));
  assert.equal(zero.find(badge => badge.key === 'sizeBytes').text, 'Size: 0 B');
  assert.equal(zero.find(badge => badge.key === 'errors').text, 'Errors: 0');
  const metadata = new FileMetadata();
  metadata.status({ generation: 1, files: [] });
  assert.equal(metadata.get(first).startup, null);
  assert.equal(metadata.get(null).loaded, null);
});

test('directory coverage is all descendants with explicit partial sums, never checkbox selection', () => {
  const metadata = new FileMetadata();
  metadata.status({ generation: 1, startup, files: [file(later)] });
  const nodes = [{ path: 'KBs/group', type: 'directory', children: [
    file(first, { states: { cached: true, indexed: false }, sizeBytes: 1024, diagnostics: { warnings: 4, errors: 0 } }),
    { path: 'KBs/group/nested', type: 'directory', children: [file(later)] },
  ] }];
  metadata.catalog({ nodes, startup });
  const selection = new SourceSelection(nodes, [], 1);
  const before = sourceFileStates(selection, [later], metadata);
  const directory = before.get('KBs/group');
  assert.equal(directory.coverage.total, 2);
  assert.equal(directory.coverage.startup, 1);
  assert.equal(directory.coverage.loaded, 1);
  assert.equal(directory.coverage.warnings, 4);
  assert.equal(directory.coverage.warningsUnknown, 1);
  assert.equal(directory.coverage.sizeBytesUnknown, 1);
  assert.match(fileBadgeDescriptions(directory).find(badge => badge.key === 'warnings').text, /≥ 4.*1 unknown/);
  selection.setSelected('KBs/group', true);
  assert.deepEqual(sourceFileStates(selection, [later], metadata), before);
});

test('failed metadata requests preserve recorded values and require explicit retry', () => {
  const metadata = new FileMetadata();
  metadata.status({ generation: 1, files: [file(first, { diagnostics: { warnings: 7, errors: 2 } })] });
  metadata.fail([first], 'read failed');
  assert.equal(metadata.get(first).warnings, 7);
  assert.equal(metadata.get(first).errors, 2);
  assert.equal(metadata.needsInformation(first), false);
  metadata.retry(first);
  assert.equal(metadata.needsInformation(first), true);
});

test('file metadata retention is bounded without forgetting startup or active membership', () => {
  const metadata = new FileMetadata({ limit: 2 });
  metadata.status({ generation: 1, startup, files: [file(first)] });
  metadata.merge(file(later));
  metadata.merge(file('KBs/third.krf'));
  assert.equal(metadata.records.size, 2);
  assert.equal(metadata.get(first).startup, true);
  assert.equal(metadata.get(first).loaded, true);
  assert.equal(metadata.needsInformation(first), true);
});

test('reported operation diagnostics are consistent until a successful explicit load supersedes them', () => {
  const metadata = new FileMetadata();
  metadata.status({ generation: 1, files: [file(first)] });
  metadata.operation([{ source: first, status: 'failed', warnings: [], errors: ['Recorded source failure'] }]);
  metadata.information({ generation: 1, items: [file(first, { diagnostics: { warnings: 0, errors: 0 } })] });
  assert.equal(metadata.get(first).errors, 1);
  assert.equal(metadata.get(first).warnings, 0);
  assert.equal(metadata.get(first).loaded, true);
  metadata.clearOperations([first]);
  assert.equal(metadata.get(first).errors, 0);
});

test('configured startup is authoritative and unavailable configuration is not replaced by loaded state', () => {
  const metadata = new FileMetadata();
  metadata.status({ generation: 1, startup: { known: true, paths: [later], evidence: 'configured_startup' }, files: [file(first)] });
  assert.equal(metadata.get(first).startup, false);
  assert.equal(metadata.get(later).startup, true);
  assert.match(fileBadgeDescriptions(metadata.get(later))[0].title, /configured next-startup/);
  metadata.status({ generation: 1, startup: { known: false, evidence: 'configuration_unavailable' }, files: [file(first)] });
  assert.equal(metadata.get(first).startup, null);
  assert.equal(metadata.get(first).loaded, true);
});

test('late catalog replies cannot restore the former SUMO startup after a configured KRF default changes', () => {
  const metadata = new FileMetadata();
  const previous = 'KBs/sumo/tinyKB.kif', configured = 'KBs/tinyKB.krf', override = 'KBs/override.meld';
  const initial = { known: true, paths: [previous], evidence: 'initial_successful_load' };
  metadata.status({ generation: 1, startup: initial, files: [file(previous)] });
  metadata.status({ generation: 2, files: [file(override)],
    startup: { known: true, paths: [configured], evidence: 'configured_startup', initial } });
  metadata.catalog({ generation: 1, startup: initial, nodes: [file(previous)] });
  metadata.status({ generation: 1, startup: initial, files: [file(previous)] });
  assert.equal(metadata.information({ generation: 1, startup: initial, items: [] }), false);
  assert.equal(metadata.get(previous).startup, false);
  assert.equal(metadata.get(configured).startup, true);
  assert.equal(metadata.get(configured).startupEvidence, 'configured_startup');
  assert.equal(metadata.get(configured).loaded, false);
  assert.equal(metadata.get(override).startup, false);
  assert.equal(metadata.get(override).loaded, true);
});

test('file-implied MT requires actual positive cached content, never a candidate or empty declaration', () => {
  const record = { dependencies: { status: 'partial',
    impliedMT: { candidate: 'x_FileMt', status: 'present', scope: 'cached_assertion_contexts', contentAssertions: 2 } } };
  assert.equal(recordedFileMT(record).candidate, 'x_FileMt');
  for (const bad of [
    { status: 'unknown', contentAssertions: null }, { status: 'missing', contentAssertions: 0 },
    { status: 'present', contentAssertions: 0 }, { scope: 'filename_fallback' },
  ]) assert.equal(recordedFileMT({ dependencies: { ...record.dependencies,
    impliedMT: { ...record.dependencies.impliedMT, ...bad } } }), null);
  assert.equal(recordedFileMT({ dependencies: { ...record.dependencies, status: 'unavailable' } }), null);
  assert.equal(recordedFileMT({}), null);
});
