import test from 'node:test';
import assert from 'node:assert/strict';
import { packRootPaths, packChoiceRows, packLoadEnabled } from '../web/source-packs.js';

test('pack roots are concrete, deduplicated originals with Windows separators accepted', () => {
  assert.deepEqual(packRootPaths(' KBs\\a.krf \nKBs/a.krf\nKBs/b.meld\nKBs/c.metta'), ['KBs/a.krf', 'KBs/b.meld', 'KBs/c.metta']);
  assert.deepEqual(packRootPaths('', { allowEmpty: true }), []);
  for (const input of ['', 'KBs', 'KBs/dir', 'KBs/../private.krf', 'KBs/a.kif.inventory.json', 'tmp/KBs/a.krf.data', 'kbs/a.krf']) {
    assert.throws(() => packRootPaths(input));
  }
  assert.throws(() => packRootPaths(Array.from({ length: 1025 }, (_, index) => `KBs/${index}.krf`).join('\n')));
});

test('provider choices preserve explicit declines and multiple selected providers', () => {
  const choices = new Map([['x_z', []], ['x_p', ['KBs/b.krf', 'KBs/a.krf', 'KBs/a.krf']]]);
  assert.deepEqual(packChoiceRows(choices), [
    { symbol: 'x_p', files: ['KBs/a.krf', 'KBs/b.krf'] }, { symbol: 'x_z', files: [] },
  ]);
  assert.equal(choices.get('x_p').length, 3, 'normalization does not mutate the draft');
});

test('only saved ready compositions can load, never previews, edits or concurrent actions', () => {
  const saved = { resolution: { ready: true } };
  assert.equal(packLoadEnabled(saved, null, false, false), true);
  assert.equal(packLoadEnabled(saved, { ready: true }, false, false), false);
  assert.equal(packLoadEnabled(saved, null, true, false), false);
  assert.equal(packLoadEnabled(saved, null, false, true), false);
  assert.equal(packLoadEnabled({ resolution: { ready: false } }, null, false, false), false);
  assert.equal(packLoadEnabled(null, null, false, false), false);
});
