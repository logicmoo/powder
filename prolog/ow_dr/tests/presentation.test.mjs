import test from 'node:test';
import assert from 'node:assert/strict';
import {
  ASSERTION_FIELDS, DEFAULT_PRESENTATION, LEGACY_PRESENTATION_KEY, PRESENTATION_KEY,
  applyPresentation, createPresentationStore, loadPresentation, normalizePresentation,
} from '../web/presentation.js';
import { DEFAULT_SETTINGS, SETTINGS_KEY } from '../web/settings.js';
import { assertionRoles, expressionText, expressionTokens, routeHref } from '../web/render.js';
import { termContextModel } from '../web/classic-layout.js';
import { filterContextItems, pageTermNavigation, termContextModel as legacyTermContextModel } from '../web/term-context.js';

const symbol = value => ({ type: 'symbol', value: `x_${value}` });
const application = (head, ...args) => ({ type: 'application', head: symbol(head), args });
const storage = () => {
  const data = new Map();
  return { data, getItem: key => data.get(key) ?? null, setItem: (key, value) => data.set(key, value) };
};
const root = () => ({
  values: {}, classes: new Set(), variables: {},
  setAttribute(name, value) { this.values[name] = value; },
  get classList() { return { toggle: (name, active) => active ? this.classes.add(name) : this.classes.delete(name) }; },
  get style() { return { setProperty: (name, value) => { this.variables[name] = value; } }; },
});

test('presentation is Classic and dense by default with only expression/ball, no secondary fields', () => {
  assert.equal(DEFAULT_PRESENTATION.classic, true);
  assert.equal(DEFAULT_PRESENTATION.density, 'dense');
  assert.equal(DEFAULT_PRESENTATION.split, 30);
  assert.equal(Object.keys(ASSERTION_FIELDS).length, 10);
  assert.equal(DEFAULT_PRESENTATION.tvaFamilies.opencog, false);
  assert.equal(DEFAULT_PRESENTATION.termGroups.external_symbols, false);
  assert(Object.values(DEFAULT_PRESENTATION.fields).every(value => value === false));
  const host = root();
  applyPresentation(host, DEFAULT_PRESENTATION);
  assert.equal(host.values['data-field-source'], 'false');
  assert.equal(host.values['data-field-ruleutility'], 'false');
  assert.equal(host.variables['--classic-index-size'], '30%');
});

test('versioned validation preserves known choices and drops invalid/unknown values', () => {
  const valid = normalizePresentation({
    version: 900, classic: true, density: 'comfortable', split: 36,
    fields: { source: true, id: false, properties: true, secret: true },
    unknownServerAction: 'reload',
  });
  assert.equal(valid.version, 2);
  assert.equal(valid.classic, true);
  assert.equal(valid.fields.source, true);
  assert.equal(valid.fields.properties, true);
  assert.equal('secret' in valid.fields, false);
  assert.equal('unknownServerAction' in valid, false);
  const invalid = normalizePresentation({ classic: 'true', density: 'huge', split: NaN, fields: { source: 1 } });
  assert.deepEqual(invalid, DEFAULT_PRESENTATION);
  assert.equal(normalizePresentation({ split: 500 }).split, 30);
  assert.equal(normalizePresentation({ split: -1 }).split, 30);
  assert.deepEqual(normalizePresentation([]), DEFAULT_PRESENTATION);
});

test('partial updates preserve every other choice, snapshots are independent, reset keeps old settings', () => {
  const disk = storage();
  disk.setItem(SETTINGS_KEY, JSON.stringify({ ...DEFAULT_SETTINGS, pageSize: 12 }));
  const before = disk.getItem(SETTINGS_KEY);
  const host = root();
  const presentation = createPresentationStore({ storage: disk, root: host, window: null });
  const changes = [];
  const unsubscribe = presentation.subscribe(value => changes.push(value));
  presentation.set({ classic: true, density: 'comfortable', fields: { source: true, proof: true } });
  presentation.set({ fields: { id: true } });
  assert.equal(presentation.get().fields.source, true);
  assert.equal(presentation.get().fields.proof, true);
  assert.equal(host.classes.has('classic-mode'), true);
  const copy = presentation.get();
  copy.fields.source = false;
  assert.equal(presentation.get().fields.source, true);
  assert.equal(loadPresentation(disk).classic, true);
  presentation.reset();
  assert.deepEqual(presentation.get(), DEFAULT_PRESENTATION);
  assert.equal(disk.getItem(SETTINGS_KEY), before);
  assert.equal(host.classes.has('classic-mode'), true);
  assert.equal(changes.length, 4);
  unsubscribe();
  presentation.destroy();
});

test('legacy false is not an opt-out, but explicit current/legacy false survives reloads and field edits', () => {
  const disk = storage();
  disk.setItem(LEGACY_PRESENTATION_KEY, JSON.stringify({ version: 1, classic: false, density: 'comfortable', fields: { source: true } }));
  let loaded = loadPresentation(disk);
  assert.equal(loaded.classic, true);
  assert.equal(loaded.classicExplicit, false);
  assert.equal(loaded.density, 'comfortable');
  assert.equal(loaded.fields.source, true);
  const presentation = createPresentationStore({ storage: disk, root: root(), window: null });
  presentation.set({ classic: false });
  presentation.set({ fields: { proof: true } });
  loaded = loadPresentation(disk);
  assert.equal(loaded.classic, false);
  assert.equal(loaded.classicExplicit, true);
  assert.equal(loaded.fields.source, true);
  assert.equal(loaded.fields.proof, true);
  presentation.reset();
  assert.equal(loadPresentation(disk).classic, true);
  assert.equal(loadPresentation(disk).classicExplicit, false);
  presentation.destroy();
  disk.data.delete(PRESENTATION_KEY);
  disk.setItem(LEGACY_PRESENTATION_KEY, JSON.stringify({ classic: false, classicExplicit: true }));
  assert.equal(loadPresentation(disk).classic, false);
  disk.setItem(PRESENTATION_KEY, JSON.stringify({ version: 2, classic: false }));
  assert.equal(loadPresentation(disk).classic, false);
});

test('malformed storage and storage rejection do not break in-memory presentation', () => {
  const disk = storage();
  disk.setItem(PRESENTATION_KEY, '{"classic":');
  assert.deepEqual(loadPresentation(disk), DEFAULT_PRESENTATION);
  const errors = [];
  const denied = { getItem() { throw Error('denied'); }, setItem() { throw Error('denied'); } };
  const presentation = createPresentationStore({ storage: denied, root: root(), window: null, onError: error => errors.push(error.message) });
  let persisted = true;
  presentation.subscribe((_preferences, state) => { persisted = state.persistent; });
  assert.equal(persisted, false);
  presentation.set({ classic: true });
  assert.equal(presentation.get().classic, true);
  assert.equal(persisted, false);
  assert.deepEqual(errors, ['denied']);
  presentation.destroy();
});

test('cross-tab storage changes update attributes without invoking any route callback', () => {
  const listeners = new Map();
  const win = {
    addEventListener: (name, callback) => listeners.set(name, callback),
    removeEventListener: name => listeners.delete(name),
  };
  const disk = storage(), host = root();
  const presentation = createPresentationStore({ storage: disk, root: host, window: win });
  disk.setItem(PRESENTATION_KEY, JSON.stringify({ classic: true, fields: { mt: true } }));
  listeners.get('storage')({ key: PRESENTATION_KEY, storageArea: disk });
  assert.equal(host.classes.has('classic-mode'), true);
  assert.equal(host.values['data-field-mt'], 'true');
  presentation.destroy();
  assert.equal(listeners.size, 0);
});

test('only explicitly annotated NAT applications link their opening parenthesis', () => {
  const identity = 'nat:x_Constructor(\'x_Case\',x_Nested("quoted \\\" text"),42)';
  const nat = { ...application('Constructor', symbol('Case'), application('Nested', { type: 'string', value: 'quoted " text' }), { type: 'number', value: 42 }), natKey: identity };
  const asserted = application('isa', nat, symbol('Thing'));
  const before = expressionText(asserted);
  const tokens = expressionTokens(asserted);
  const full = tokens.filter(token => token.kind === 'nat');
  assert.equal(full.length, 1);
  assert.equal(full[0].text, '(');
  assert.equal(new URLSearchParams(full[0].href.split('?')[1]).get('term'), identity);
  assert.equal(tokens.find(token => token.text === 'Constructor').href, routeHref('term', { term: 'x_Constructor' }));
  assert.notEqual(full[0].href, tokens.find(token => token.text === 'Constructor').href);
  assert.equal(tokens[0].kind, 'text');
  assert.deepEqual(assertionRoles(asserted, identity), ['argument']);
  assert.equal(expressionText(asserted), before);
  delete nat.natKey;
  assert.equal(expressionText(asserted), before);
  assert.equal(expressionTokens(asserted).some(token => token.kind === 'nat'), false);
});

test('logical formulas, Fn suffix, variable/compound heads and string spelling do not imply a NAT', () => {
  for (const expression of [
    application('implies', application('p', symbol('A')), application('q', symbol('A'))),
    application('RandomFn', symbol('A')),
    { type: 'application', head: { type: 'variable', value: '?P' }, args: [symbol('A')] },
    { type: 'application', head: application('a', symbol('b')), args: [application('c', symbol('d'))] },
    application('comment', { type: 'string', value: '(SomeFn #$Term) <script>' }),
    { ...application('OtherFn', symbol('A')), natKey: '' },
    { ...application('formula', symbol('A')), denotesNat: false, natKey: 'nat:NotDenoting' },
  ]) assert.equal(expressionTokens(expression).some(token => token.kind === 'nat'), false);
  const annotated = { ...application('Constructor', symbol('Case')), termKey: 'nat:OpaqueCase' };
  assert.equal(expressionTokens(annotated)[0].termKey, 'nat:OpaqueCase');
});

test('Classic term index uses actual section/argument/predicate/MT counts and exact filter routes', () => {
  const labels = ['Documentation', 'Definitional Info', 'Lexical Info', 'Applicable Relations',
    'All Asserted Knowledge', 'All KB Assertions', 'All GAFs'];
  const context = 'mt:x_ExampleContext("Case \\" quoted")';
  const nav = {
    sections: labels.map((label, n) => ({ key: `section-${n}`, label, count: n })),
    arguments: [{ position: 1, count: 15, predicates: [{ term: 'x_isa', count: 5,
      microtheories: [{ mt: context, count: 3, mtExpression: application('ExampleContext', { type: 'string', value: 'Case " quoted' }) }] }] },
    { position: 2, count: 0, predicates: [] }],
  };
  const model = termContextModel({ term: 'x_ActionModelMtFn', nav,
    filters: { arg: '1', predicate: 'x_isa', mt: context } });
  assert.equal(model.title, 'Index');
  assert.equal(model.current.label, 'ActionModelMtFn');
  assert.equal(model.coverage, 'page');
  assert.equal(model.sections[0].items[0].label, 'Viewpoint Filters');
  assert.deepEqual(model.sections[1].items.map(item => item.label), labels);
  assert.equal(model.sections[1].items[0].count, 0);
  assert.equal(model.sections[1].items[0].href, routeHref('term', { term: 'x_ActionModelMtFn', section: 'section-0' }));
  const argument = model.sections[2].items[0];
  assert.equal(argument.expandable, true);
  assert.equal(argument.expanded, true);
  assert.equal(argument.count, 15);
  assert.equal(argument.children[0].count, 5);
  assert.equal(argument.children[0].expanded, true);
  const mt = argument.children[0].children[0];
  assert.equal(mt.count, 3);
  assert.equal(mt.selected, true);
  assert.deepEqual(Object.fromEntries(new URLSearchParams(mt.href.split('?')[1])),
    { term: 'x_ActionModelMtFn', arg: '1', predicate: 'x_isa', mt: context });
  assert.equal(model.sections[2].items[1].count, 0);
  assert.equal(termContextModel({ term: 'x_T', nav, coverage: 'complete' }).coverage, 'complete');
  assert.equal(termContextModel({ term: 'x_T', nav: { ...nav, coverage: 'loaded_term_assertions' } }).coverage, 'complete');
  assert.equal(termContextModel({ term: 'x_T', nav: null }).coverage, 'page');
});

test('legacy page fallback produces actual complete one-assertion counts and real empty filters', () => {
  const term = 'x_ActionModelMtFn';
  const item = { id: 'a1', mt: 'x_ExampleMt',
    expression: application('comment', { type: 'symbol', value: term }, { type: 'string', value: 'Synthetic documentation' }) };
  const nav = pageTermNavigation(term, [item]);
  assert.equal(nav.total, 1);
  const counts = Object.fromEntries(nav.sections.map(section => [section.key, section.count]));
  assert.equal(counts.documentation, 1);
  assert.equal(counts.definition, 0);
  assert.equal(counts.lexical, 0);
  assert.equal(counts.all, 1);
  assert.equal(counts.gafs, 1);
  assert.equal(nav.arguments[0].position, 1);
  assert.equal(nav.arguments[0].predicates[0].term, 'x_comment');
  assert.equal(nav.arguments[0].predicates[0].microtheories[0].count, 1);
  const route = { limit: 50, params: new URLSearchParams({ term }) };
  assert.equal(legacyTermContextModel(route, { total: 1, offset: 0, items: [item] }, term).coverage, 'complete');
  assert.equal(legacyTermContextModel(route, { total: 90, offset: 0, items: [item] }, term).coverage, 'page');
  assert.deepEqual(filterContextItems([item], term, new URLSearchParams({ section: 'definition' })), []);
  assert.deepEqual(filterContextItems([item], term, new URLSearchParams({ section: 'documentation', arg: '1', predicate: 'x_comment', mt: 'x_ExampleMt' })), [item]);
  assert.deepEqual(filterContextItems([item], term, new URLSearchParams({ arg: '2' })), []);
  assert.deepEqual(filterContextItems([item], term, new URLSearchParams({ mt: 'x_OtherMt' })), []);
});
