import test from 'node:test';
import assert from 'node:assert/strict';
import { collectDiagnostics, diagnosticCounts, diagnosticMessages, diagnosticProperty, mappingRowsOf, splitMappingRows } from '../web/diagnostics.js';

const markers = [
  { type: 'note', message: 'Approved genFormat list retained.' },
  { type: 'warnings', message: 'Unexpected source form; review its location.' },
  { type: 'errors', message: 'Source compilation failed; repair before retrying.' },
];

test('mapping IDs keep order and multiplicity; all three marker objects are diagnostics, not IDs', () => {
  const rows = ['instance-isa', ...markers, 'instance-isa', 'class-collection'];
  const parsed = splitMappingRows(rows);
  assert.deepEqual(parsed.ids, ['instance-isa', 'instance-isa', 'class-collection']);
  assert.deepEqual(parsed.markers, markers);
  assert.deepEqual(parsed.other, []);
  const entries = collectDiagnostics({ mappingRows: rows });
  assert.deepEqual(entries.map(entry => entry.severity), ['note', 'warning', 'error']);
  assert.deepEqual(diagnosticCounts(entries), { note: 1, warning: 1, error: 1 });
  assert.ok(entries.every(entry => entry.origins.length === 1 && entry.origins[0] === 'mappingRows'));
});

test('first-class diagnostic properties exist independently of mapping rows', () => {
  const record = { mappingRows: [], properties: [
    { name: 'notices', value: ['Independent notice'] },
    { name: 'warnings', value: ['Independent warning'] },
    { name: 'errors', value: ['Independent error'] },
  ] };
  const before = JSON.stringify(record);
  const entries = collectDiagnostics(record);
  assert.deepEqual(diagnosticCounts(entries), { note: 1, warning: 1, error: 1 });
  assert.deepEqual(entries.map(entry => entry.origins), [['property:errors'], ['property:warnings'], ['property:notices']]);
  assert.equal(JSON.stringify(record), before);
});

test('property copies and discovery markers merge visually without inventing stored facts', () => {
  const record = { source: 'KBs/a.krf', line: 12, mappingRows: markers,
    properties: [
      { name: 'notices', value: [markers[0].message] },
      { name: 'warnings', value: [markers[1].message] },
      { name: 'errors', value: [markers[2].message] },
    ],
    notices: [markers[0].message], warnings: [markers[1].message], errors: [markers[2].message],
  };
  const original = JSON.stringify(record);
  const entries = collectDiagnostics(record);
  assert.equal(entries.length, 3);
  assert.ok(entries.every(entry => entry.source === record.source && entry.line === 12));
  assert.ok(entries.every(entry => entry.origins.length === 2 && entry.origins.includes('mappingRows')));
  assert.equal(JSON.stringify(record), original);
  assert.equal(Object.hasOwn({ mappingRows: markers }, 'notices'), false);
});

test('latest explicit properties override DTO aliases, including explicit empty arrays', () => {
  const record = {
    mappingRows: [markers[1]],
    warnings: ['Stale DTO copy'],
    properties: [{ name: 'warnings', value: [] }, { name: 'notices', value: ['Current note'] }],
    notices: ['Stale notice'],
  };
  const entries = collectDiagnostics(record);
  assert.deepEqual(entries.map(entry => entry.message), ['Current note', markers[1].message]);
  assert.deepEqual(entries[1].origins, ['mappingRows']);
  assert.deepEqual(collectDiagnostics(record, { includeRows: false }).map(entry => entry.severity), ['note']);
  assert.deepEqual(record.properties[0].value, []);
});

test('DTO diagnostic arrays remain available when properties are not duplicated', () => {
  const entries = collectDiagnostics({ notices: ['A'], warnings: ['B'], errors: ['C'], mappingRows: [] });
  assert.deepEqual(diagnosticCounts(entries), { note: 1, warning: 1, error: 1 });
  assert.ok(entries.every(entry => entry.origins[0].startsWith('field:')));
});

test('notes never contribute warning counts, even in a legacy status warning container', () => {
  const status = { notices: [markers[0].message], warnings: [markers[0], markers[1]], errors: [markers[2].message], mappingRows: [{ type: 'errors', message: 'Not a status fact' }] };
  const entries = collectDiagnostics(status, { status: true, includeRows: false });
  assert.deepEqual(diagnosticCounts(entries), { note: 1, warning: 1, error: 1 });
  assert.equal(entries.filter(entry => entry.message === markers[0].message).length, 1);
  assert.ok(!entries.some(entry => entry.message === 'Not a status fact'));
  assert.deepEqual(diagnosticCounts(collectDiagnostics({ notices: ['Approved doAnnounce list handling.'] })), { note: 1, warning: 0, error: 0 });
});

test('distinct severity or source occurrences are not incorrectly deduplicated', () => {
  const entries = collectDiagnostics({
    notices: ['Same message'],
    warnings: [{ message: 'Same message', source: 'KBs/a.krf', line: 1 }, { message: 'Same message', source: 'KBs/a.krf', line: 2 }],
    mappingRows: [{ type: 'errors', message: 'Same message' }],
  });
  assert.equal(entries.length, 4);
  assert.deepEqual(diagnosticCounts(entries), { note: 1, warning: 2, error: 1 });
});

test('diagnostic locations preserve columns and distinguish separate occurrences on one line', () => {
  const record = { source: 'KBs/a.krf', line: 13, column: 17, errors: ['Failure'],
    mappingRows: [{ type: 'errors', message: 'Failure' }, { type: 'errors', message: 'Failure', column: 18 }] };
  const entries = collectDiagnostics(record);
  assert.equal(entries.length, 2);
  assert.deepEqual(entries.map(entry => entry.column), [17, 18]);
  assert.deepEqual(entries[0].origins, ['field:errors', 'mappingRows']);
});

test('unknown mapping annotations stay inert and malformed types cannot become mapping IDs', () => {
  const other = { type: 'constructor', message: '<script>not executable</script>' };
  const parsed = splitMappingRows([other, null, 42]);
  assert.deepEqual(parsed.ids, []);
  assert.deepEqual(parsed.markers, []);
  assert.deepEqual(parsed.other, [other, null, 42]);
  assert.equal(collectDiagnostics({ warnings: [other] }, { status: true })[0].severity, 'warning');
  assert.equal(diagnosticProperty('constructor'), false);
});

test('mapping property compatibility and empty metadata do not fabricate notices', () => {
  const record = { properties: [{ name: 'mapping_rows', value: ['instance-isa', markers[0]] }] };
  assert.deepEqual(mappingRowsOf(record), ['instance-isa', markers[0]]);
  assert.deepEqual(mappingRowsOf({ ...record, mappingRows: [] }), []);
  assert.deepEqual(collectDiagnostics({ mappingRows: [], properties: [{ name: 'notices', value: [] }] }), []);
  assert.deepEqual(diagnosticMessages([]), []);
  assert.deepEqual(diagnosticMessages(null), []);
});
