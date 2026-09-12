import test from 'node:test';
import assert from 'node:assert/strict';
import { filterContextItems, literalQuerySpec, pageTermNavigation, termContextModel } from '../web/term-context.js';
import { assertionMarker } from '../web/assertion-markers.js';

const symbol = value => ({ type: 'symbol', value: `x_${value}` });
const application = (name, ...args) => ({ type: 'application', head: symbol(name), args });
const items = [
  { id: 'a1', mt: 'x_BaseKB', expression: application('genlMt', application('LearnedKnowledgeMtFn', symbol('Freeciv-TheGame')), application('ActionModelMtFn', symbol('Freeciv-TheGame'))) },
  { id: 'a2', mt: 'x_DocMt', expression: application('comment', symbol('ActionModelMtFn'), { type: 'string', value: 'Line one\n\tLine two' }) },
];
const route = params => ({ name: 'term', limit: 40, params: new URLSearchParams(params) });
test('context counts index nested constructor positions and real MT evidence', () => {
  const index = pageTermNavigation('x_ActionModelMtFn', items);
  assert.equal(index.total, 2);
  assert.equal(index.sections.find(section => section.key === 'documentation').count, 1);
  assert.deepEqual(index.arguments.map(arg => [arg.position, arg.count]), [[1, 1], [2, 1]]);
  assert.equal(index.arguments[1].predicates[0].microtheories[0].mt, 'x_BaseKB');
});
test('section, argument, predicate and MT links filter real assertions', () => {
  assert.deepEqual(filterContextItems(items, 'x_ActionModelMtFn', new URLSearchParams('arg=2&predicate=x_genlMt&mt=x_BaseKB')).map(item => item.id), ['a1']);
  assert.deepEqual(filterContextItems(items, 'x_ActionModelMtFn', new URLSearchParams('section=lexical')), []);
  assert.deepEqual(filterContextItems(items, 'x_ActionModelMtFn', new URLSearchParams('section=documentation')).map(item => item.id), ['a2']);
});
test('context links preserve term identity, use filters rather than a different term and label coverage', () => {
  const model = termContextModel(route('term=x_ActionModelMtFn'), { items, total: 8, offset: 0 }, 'x_ActionModelMtFn');
  assert.equal(model.coverage, 'page');
  const arg = model.sections.find(section => section.title === 'Argument positions').items[1];
  const context = arg.children[0].children[0];
  assert.match(context.href, /term=x_ActionModelMtFn/);
  assert.match(context.href, /predicate=x_genlMt/);
  assert.match(context.href, /mt=x_BaseKB/);
  assert.equal(termContextModel(route(''), { items, total: 2, offset: 0 }, 'x_ActionModelMtFn').coverage, 'complete');
  assert.match(model.sections[0].items[1].href, /viewpoint=1/);
});
test('server pre-pagination index takes precedence over partial page counts', () => {
  const navigation = pageTermNavigation('x_ActionModelMtFn', items);
  const model = termContextModel(route(''), { navigation, items: [items[0]], total: 1 }, 'x_ActionModelMtFn');
  assert.equal(model.coverage, 'complete');
  assert.equal(model.total, 2);
  assert.equal(model.sections[1].items[0].count, 1);
});
test('literal queries use observed direct slots, fresh other variables and explicit context', () => {
  const shape = { arity: 3, directCount: 1, contexts: ['x_BaseKB'] };
  const query = literalQuerySpec('x_Dog', 'x_isa', 1, shape, 'x_BaseKB');
  assert.deepEqual(query.expression.args, [symbol('Dog'), { type: 'variable', value: '?ARG2' }, { type: 'variable', value: '?ARG3' }]);
  assert.equal(query.mt, 'x_BaseKB');
  assert.equal(literalQuerySpec('x_Dog', 'x_isa', 1, shape, 'x_UnobservedMt'), null);
  assert.equal(literalQuerySpec('x_Dog', 'x_isa', 4, shape), null);
  const nested = pageTermNavigation('x_ActionModelMtFn', items).arguments[1].predicates[0].queryShapes[0];
  assert.equal(nested.directCount, 0);
  assert.equal(literalQuerySpec('x_ActionModelMtFn', 'x_genlMt', 2, nested), null);
});
test('ball colors describe actual metadata rather than implying formula execution or utility', () => {
  assert.equal(assertionMarker({ kind: 'fact', properties: [{ name: 'direction', value: ':FORWARD' }] }).kind, 'unknown');
  assert.equal(assertionMarker({ kind: 'rule' }).rule, true);
  assert.equal(assertionMarker({ properties: [{ name: 'monotonicity', value: ':MONOTONIC' }] }).kind, 'monotonic');
  assert.equal(assertionMarker({ properties: [{ name: 'truth', value: ':FALSE' }] }).kind, 'false');
  assert.equal(assertionMarker({ properties: [{ name: 'truth', value: ':FALSE' }, { name: 'truth', value: ':TRUE' }] }).kind, 'unknown');
  assert.equal(assertionMarker({ expression: application('not', symbol('A')) }).kind, 'false');
  assert.equal(assertionMarker({ expression: application('implies', application('not', symbol('A')), symbol('B')) }).kind, 'unknown');
  assert.equal(assertionMarker({ source: 'KBs/data.metta', expression: application('not', symbol('A')) }).kind, 'unknown');
  const negative = assertionMarker({ expression: application('not', symbol('A')), properties: [
    { name: 'monotonicity', value: ':DEFAULT' }, { name: 'cyc::original-tv', value: ':FALSE-DEF' },
  ] });
  assert.equal(negative.kind, 'false');
  assert.match(negative.description, /Declared strength: DEFAULT/);
  const rule = assertionMarker({ kind: 'rule', properties: [{ name: 'monotonicity', value: ':MONOTONIC' }] });
  assert.equal(rule.kind, 'monotonic');
  assert.equal(rule.rule, true);
});
test('definition navigation follows the selected schema argument, not uses or nested mentions', () => {
  const rows = [
    application('arity', symbol('P'), { type: 'number', value: 2 }),
    application('argIsa', symbol('P'), { type: 'number', value: 1 }, symbol('Dog')),
    application('arg2Isa', symbol('P'), symbol('Dog')),
    application('P', symbol('Fido'), symbol('Rover')),
    application('argIsa', symbol('Other'), { type: 'number', value: 1 }, symbol('P')),
    application('genlMt', application('MtFn', symbol('P')), symbol('BaseKB')),
  ].map((expression, id) => ({ expression, id, mt: 'x_BaseKB' }));
  assert.equal(pageTermNavigation('x_P', rows).sections.find(section => section.key === 'definition').count, 3);
  assert.deepEqual(filterContextItems(rows, 'x_P', new URLSearchParams('section=definition')).map(row => row.id), [0, 1, 2]);
  assert.deepEqual(filterContextItems(rows, 'x_argIsa', new URLSearchParams('section=definition')), []);
});
