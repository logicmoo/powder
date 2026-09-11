import test from 'node:test';
import assert from 'node:assert/strict';
import { assertionRoles, contextExpression, contextInputText, contextLabel, expressionText, expressionTokens, groupAssertions, renderExpression, routeHref, symbolLabel } from '../web/render.js';

const symbol = value => ({ type: 'symbol', value: `x_${value}` });
const variable = value => ({ type: 'variable', value });
const application = (head, ...args) => ({ type: 'application', head: typeof head === 'string' ? symbol(head) : head, args });

test('nested formulas use two spaces and attach final closing parentheses', () => {
  const ast = application('implies',
    application('and', application('isa', variable('?X'), symbol('Human')), application('relatedTo', variable('?X'), variable('?Y'))),
    application('isa', variable('?Y'), symbol('Thing')));
  assert.equal(expressionText(ast), '(implies\n  (and\n    (isa ?X Human)\n    (relatedTo ?X ?Y))\n  (isa ?Y Thing))');
  assert.ok(!expressionText(ast).split('\n').some(line => /^\s*\)+$/u.test(line)));
});

test('all semantic heads and nested symbols link to their canonical term', () => {
  const ast = application('isa', application('SomeFn', symbol('A&B?#')), symbol('Dog'));
  const tokens = expressionTokens(ast).filter(token => token.href);
  assert.deepEqual(tokens.map(token => token.text), ['isa', 'SomeFn', 'A&B?#', 'Dog']);
  assert.deepEqual(tokens.map(token => new URLSearchParams(token.href.split('?')[1]).get('term')),
    ['x_isa', 'x_SomeFn', 'x_A&B?#', 'x_Dog']);
  assert.equal(symbolLabel('x_FooMt'), 'FooMt');
  assert.equal(symbolLabel('ordinary'), 'ordinary');
});

test('variable spellings, row identity, numbers and strings are not links', () => {
  const ast = application('p', variable('?X'), variable('??'), variable('??Foo-Bar'), variable('@ROW'), variable('$x'),
    { type: 'number', value: 1.5 }, { type: 'string', value: 'A "quote"\n<script>&' });
  assert.equal(expressionText(ast), '(p ?X ?? ??Foo-Bar @ROW $x 1.5 "A \\"quote\\"\\n<script>&")');
  assert.equal(expressionTokens(ast).filter(token => token.href).length, 1);
});

test('quoted symbols remain readable and do not inject physical newlines', () => {
  assert.equal(expressionText(symbol('A B\nC|D')), '|A B\\nC\\|D|');
});

test('MeTTa list and map structure is distinct without exposing dict tags', () => {
  const pairs = [{ key: symbol('a'), value: symbol('b') }, { key: symbol('c'), value: symbol('d') }];
  const map = { type: 'map', entries: pairs };
  const list = { type: 'list', items: pairs.map(entry => application(entry.key, entry.value)) };
  assert.equal(expressionText(map, { pretty: false }), '((a b) (c d))');
  assert.equal(expressionText(list, { pretty: false }), '([] (a b) (c d))');
  assert.equal(expressionText({ type: 'list', items: [] }), '([])');
  assert.equal(expressionText({ type: 'value', value: map }, { pretty: false }), '((a b) (c d))');
  assert.ok(!expressionText(map).includes('metta_map'));
});

test('an empty MeTTa expression is distinct from an explicit empty list', () => {
  assert.equal(expressionText({ type: 'empty' }), '()');
  assert.equal(expressionText({ type: 'list', items: [] }), '([])');
  assert.equal(expressionText({ type: 'execute', value: { type: 'empty' } }), '!()');
});

test('MeTTa equations and type data render distinctly from Cyc equality', () => {
  const equation = application('metta=', application('f', variable('$x')), variable('$x'));
  assert.equal(expressionText(equation, { pretty: false }), '(metta= (f $x) $x)');
  assert.equal(expressionTokens(equation).find(token => token.text === 'metta=').href,
    routeHref('term', { term: 'x_metta=' }));
  assert.equal(expressionText(application('equals', symbol('a'), symbol('b'))), '(equals a b)');
  assert.equal(expressionText(application(':', symbol('s'), symbol('TypeName'))), '(: s TypeName)');
  assert.equal(expressionText(application(':', symbol('s'), application('->', symbol('Atom'), symbol('Atom'))),
    { pretty: false }), '(: s (-> Atom Atom))');
});

test('compound and variable predicate positions render their source applications', () => {
  assert.equal(expressionText(application(variable('?P'), symbol('a')), { pretty: false }), '(?P a)');
  assert.equal(expressionText(application(application('a', symbol('b')), application('c', symbol('d'))), { pretty: false }), '((a b) (c d))');
});

test('data execution markers and executable rules retain exact syntax', () => {
  assert.equal(expressionText({ type: 'execute', value: application('f', variable('$x')) }), '!(f $x)');
  const rule = application('<===', application('grandparent', variable('?X'), variable('?Y')),
    application('parent', variable('?X'), variable('?Z')), application('parent', variable('?Z'), variable('?Y')));
  assert.equal(expressionText(rule), '(<===\n  (grandparent ?X ?Y)\n  (parent ?X ?Z)\n  (parent ?Z ?Y))');
  assert.equal(expressionText(application('<==', symbol('a'))), '(<== a)');
  assert.ok(!expressionText(rule).includes('cid'));
});

test('adjacent MT blocks preserve source ordering, including repeated contexts', () => {
  const assertions = [
    { id: 'a1', mt: 'x_A', line: 10 }, { id: 'a2', mt: 'x_A', line: 11 },
    { id: 'a3', mt: 'x_B', line: 12 }, { id: 'a4', mt: 'x_A', line: 13 },
  ];
  const result = groupAssertions(assertions);
  assert.deepEqual(result.map(group => [group.mt, group.items.map(item => item.id)]),
    [['x_A', ['a1', 'a2']], ['x_B', ['a3']], ['x_A', ['a4']]]);
  assert.deepEqual(groupAssertions(assertions.slice(1)).map(group => group.items[0].id), ['a2', 'a3', 'a4']);
  assert.deepEqual(groupAssertions([]), []);
});

test('compound MT keys group opaquely while labels use structured expressions', () => {
  const first = "mt:x_CommonsenseMicrostoryMtFn('x_ViolentImpact-Harm')";
  const second = "mt:x_CommonsenseMicrostoryMtFn('x_ThermalImpact-Harm')";
  const expression = application('CommonsenseMicrostoryMtFn', symbol('ViolentImpact-Harm'));
  const otherExpression = application('CommonsenseMicrostoryMtFn', symbol('ThermalImpact-Harm'));
  const items = [
    { id: 'a1', mt: first, mtExpression: expression },
    { id: 'a2', mt: first, mtExpression: expression },
    { id: 'a3', mt: second, mtExpression: otherExpression },
    { id: 'a4', mt: first, mtExpression: expression },
  ];
  const groups = groupAssertions(items);
  assert.deepEqual(groups.map(group => group.mt), [first, second, first]);
  assert.equal(groups[0].mtExpression, expression);
  assert.equal(groups[1].mtExpression, otherExpression);
  assert.equal(contextLabel(first, expression), '(CommonsenseMicrostoryMtFn ViolentImpact-Harm)');
  assert.equal(contextInputText(first, expression), '(CommonsenseMicrostoryMtFn ViolentImpact-Harm)');
  assert.deepEqual(expressionTokens(expression).filter(token => token.href).map(token => token.text),
    ['CommonsenseMicrostoryMtFn', 'ViolentImpact-Harm']);
  assert.equal(new URLSearchParams(routeHref('microtheory', { mt: first }).split('?')[1]).get('mt'), first);
  assert.ok(!contextLabel(first, expression).includes('mt:'));
  assert.ok(!contextLabel(first, expression).includes('[]'));
});

test('missing compound AST never exposes encoded Prolog while atomic MT fallback remains usable', () => {
  const compound = "mt:x_ContextFn('x_X')";
  assert.equal(contextExpression(compound), null);
  assert.equal(contextLabel(compound), 'Compound microtheory');
  assert.equal(contextInputText(compound), '');
  assert.deepEqual(contextExpression('x_tinyKB'), symbol('tinyKB'));
  assert.equal(contextLabel('x_tinyKB'), 'tinyKB');
  assert.equal(contextInputText('x_tinyKB'), 'tinyKB');
});

test('distinct opaque MT identities never merge even if supplied labels are identical', () => {
  const expression = application('ContextFn', symbol('Example'));
  const keys = ["mt:x_ContextFn(x_Example)", "mt:'x_ContextFn'(x_Example)"];
  const groups = groupAssertions(keys.map((mt, index) => ({ id: `a${index}`, mt, mtExpression: expression })));
  assert.equal(groups.length, 2);
  assert.equal(groups[0].mt, keys[0]);
  assert.equal(groups[1].mt, keys[1]);
});

test('term roles distinguish outer heads, arguments and nested heads', () => {
  const ast = application('p', symbol('p'), application('p', symbol('x')));
  assert.deepEqual(assertionRoles(ast, 'x_p'), ['predicate', 'argument', 'nested']);
  assert.deepEqual(assertionRoles(ast, 'x_x'), ['argument']);
  assert.deepEqual(assertionRoles(ast, 'x_missing'), []);
});

test('route encoding keeps HTML and URL metacharacters inert', () => {
  const value = 'x_"><script> & # ?';
  const href = routeHref('term', { term: value });
  assert.ok(href.startsWith('#/term?'));
  assert.ok(!href.includes('<script>'));
  assert.equal(new URLSearchParams(href.slice(href.indexOf('?') + 1)).get('term'), value);
});

test('DOM rendering only creates safe nodes; it never assigns HTML', () => {
  class FakeNode {
    constructor(tag) { this.tag = tag; this.children = []; this.textContent = ''; }
    append(...nodes) { this.children.push(...nodes); }
    set innerHTML(_value) { throw new Error('HTML injection attempted'); }
  }
  const document = {
    createElement: tag => new FakeNode(tag),
    createTextNode: value => ({ tag: '#text', textContent: value }),
  };
  const root = renderExpression(application('p', symbol('<img src=x onerror=alert(1)>'), {
    type: 'string', value: '</code><script>alert(1)</script>',
  }), { document });
  const walk = node => [node, ...(node.children ?? []).flatMap(walk)];
  const nodes = walk(root);
  assert.deepEqual([...new Set(nodes.map(node => node.tag))].sort(), ['#text', 'a', 'code', 'pre', 'span']);
  const malicious = nodes.find(node => node.textContent.includes('<img'));
  assert.equal(malicious.tag, 'a');
  assert.ok(malicious.href.startsWith('#/term?'));
});
