import test from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { fileURLToPath } from 'node:url';
import { assertionMarker } from '../web/assertion-markers.js';

const symbol = value => ({ type: 'symbol', value: `x_${value}` });
const app = (head, ...args) => ({ type: 'application', head: symbol(head), args });
const strength = value => [{ name: 'monotonicity', value }];

test('strength balls ignore numeric TVA confidence, utility and fallback origin', () => {
  assert.equal(assertionMarker({ properties: strength(':MONOTONIC'), confidence: 0, utility: 0 }).kind, 'monotonic');
  assert.equal(assertionMarker({ properties: strength(':DEFAULT'), confidence: 1, origin: 'Atom' }).kind, 'default');
  assert.equal(assertionMarker({ origin: 'Default', strength: 0.7 }).kind, 'unknown');
});

test('negative status wins without losing strength or executable-rule information', () => {
  const marker = assertionMarker({ kind: 'rule', properties: [...strength(':MONOTONIC'), { name: 'truth', value: ':FALSE' }] });
  assert.equal(marker.kind, 'false');
  assert.equal(marker.rule, true);
  assert.match(marker.description, /MONOTONIC/);
  assert.equal(assertionMarker({ kind: 'rule', properties: strength(':DEFAULT') }).kind, 'default');
});

test('only canonical outer negation or compact false evidence marks a negative', () => {
  assert.equal(assertionMarker({ source: 'KBs/a.krf', expression: app('not', app('p', symbol('A'))) }).kind, 'false');
  assert.equal(assertionMarker({ source: 'KBs/a.krf', expression: app('implies', app('not', app('p')), app('q')) }).kind, 'unknown');
  assert.equal(assertionMarker({ source: 'KBs/a.metta', expression: app('not', app('p')) }).kind, 'unknown');
  assert.equal(assertionMarker({ properties: [{ name: 'cyc::original-tv', value: ':FALSE-DEF' }] }).kind, 'false');
});
test('missing-category policy colors only an initialized effective category, with negative precedence', () => {
  const strengthCategory = { status: 'initialized', summary: { value: ':DEFAULT' }, reason: 'global_missing_strength' };
  assert.equal(assertionMarker({ strengthCategory }).kind, 'default');
  assert.match(assertionMarker({ strengthCategory }).description, /global Missing assertion strength/);
  assert.equal(assertionMarker({ strengthCategory, expression: app('not', symbol('A')) }).kind, 'false');
  assert.equal(assertionMarker({ strengthCategory: { status: 'invalid', reason: 'invalid_source_strength' } }).kind, 'unknown');
});

test('all 71 converted FALSE-DEF occurrences retain red markers from the existing read-only cache', {
  skip: !process.env.POWDER_MARKER_CACHE,
}, () => {
  const script = fileURLToPath(new URL('./marker_cache_records.pl', import.meta.url));
  const result = spawnSync('swipl', ['-q', '-s', script, '--', process.env.POWDER_MARKER_CACHE], { encoding: 'utf8', maxBuffer: 8 * 1024 * 1024 });
  assert.equal(result.status, 0, result.stderr);
  const { items } = JSON.parse(result.stdout);
  assert.equal(items.length, 71);
  assert.equal(new Set(items.map(item => item.id)).size, 71);
  for (const item of items) {
    assert.equal(item.expression.head.value, 'x_not', item.id);
    const marker = assertionMarker(item);
    assert.equal(marker.kind, 'false', item.id);
    assert.match(marker.description, /Declared strength: DEFAULT/);
  }
});
