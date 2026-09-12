import test from 'node:test';
import assert from 'node:assert/strict';
import { dependencyFilters, dependencyPolicyDraft, dependencyReason, dependencyCheckLabels, dependencyNextOffset, dependencyReportDraft } from '../web/dependency-resolution.js';

test('URL filters retain availability and deterministic pagination', () => {
  assert.deepEqual(dependencyFilters(new URLSearchParams('kind=collection_root&scope=unloaded&offset=25')), {
    offset: 25, limit: 25, kind: 'collection_root', scope: 'unloaded',
  });
  for (const value of ['-1', 'NaN', '1.5', 'Infinity']) {
    assert.equal(dependencyFilters(new URLSearchParams({ offset: value })).offset, 0);
  }
});
test('policy draft keeps explicit exemptions and treats patterns as literal data', () => {
  const rules = [{ kind: 'comment', enabled: false, severity: 'info',
    ignoreTerms: 'x_A\nx_B', ignoreMts: 'mt:x_MtFn(x_a)', exemptTypes: 'x_ExternalSymbol',
    patterns: 'prefix:x_Test\nexact:nat:x_Fn(x_arg)' }];
  const draft = dependencyPolicyDraft(rules);
  assert.deepEqual(draft.rules[0].patterns, [
    { mode: 'prefix', value: 'x_Test' }, { mode: 'exact', value: 'nat:x_Fn(x_arg)' },
  ]);
  assert.equal(draft.rules[0].enabled, false);
  assert.deepEqual(draft.rules[0].ignoreMts, ['mt:x_MtFn(x_a)']);
  assert.equal(rules[0].ignoreTerms, 'x_A\nx_B');
});
test('regular expressions and unbounded patterns are not accepted', () => {
  for (const patterns of ['regex:.*', 'prefix:', 'prefix:' + 'a'.repeat(129), 'arbitrary code']) {
    assert.throws(() => dependencyPolicyDraft([{ kind: 'comment', patterns }]));
  }
});
test('incomplete evidence and foreign contexts never sound like definite missing information', () => {
  assert.match(dependencyReason('no_evidence_in_bounded_analysis'), /not proof of absence/u);
  assert.match(dependencyReason({ availability: 'evidence_only_in_other_microtheories' }), /not treated as visible/u);
  assert.match(dependencyReason('unknown'), /before deciding/u);
});
test('all policy check names have task-oriented labels', () => {
  assert.equal(Object.keys(dependencyCheckLabels).length, 6);
  assert.equal(dependencyCheckLabels.microtheory_declaration, 'Microtheory declaration in BaseKB');
});
test('next slice uses the recorded cursor rather than a local page counter', () => {
  assert.equal(dependencyNextOffset({ scope: { selection: { nextOffset: 120 } } }), 120);
  for (const nextOffset of [null, undefined, -1, 490, '20']) {
    assert.equal(dependencyNextOffset({ scope: { selection: { nextOffset } } }), null);
  }
});
test('reopened report restores its selected roots, term, and policy rather than the loaded default', () => {
  const policy = { rules: [{ kind: 'comment', enabled: false, severity: 'info',
    ignoreTerms: ['x_A'], ignoreMts: [], exemptTypes: [], patterns: [{ mode: 'prefix', value: 'x_Test' }] }] };
  const draft = dependencyReportDraft({ scope: { mt: 'x_BaseKB', kind: 'selected',
    roots: ['KBs/a.krf', 'KBs/b.krf'], selection: { kind: 'single_term', term: 'x_ExampleFn' } }, policy });
  assert.equal(draft.roots, 'KBs/a.krf\nKBs/b.krf');
  assert.equal(draft.term, 'x_ExampleFn');
  assert.deepEqual(dependencyPolicyDraft(draft.policyRows), policy);
});
test('loaded report roots remain a loaded-manifest selection, not an explicit source request', () => {
  const draft = dependencyReportDraft({ scope: { mt: 'x_BaseKB', kind: 'loaded', roots: ['KBs/a.krf'],
    selection: { kind: 'in_use_slice' } }, policy: { rules: [] } });
  assert.equal(draft.roots, '');
  assert.equal(draft.term, '');
  assert.equal(dependencyReportDraft({ scope: {} }), null);
});
