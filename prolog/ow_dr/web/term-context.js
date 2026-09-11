import { contextLabel, routeHref, symbolLabel } from './render.js';

const sectionLabels = [
  ['documentation', 'Documentation'], ['definition', 'Definitional Info'],
  ['lexical', 'Lexical Info'], ['relations', 'Applicable Relations'],
  ['all', 'All Asserted Knowledge'], ['assertions', 'All KB Assertions'], ['gafs', 'All GAFs'],
];
const documentation = new Set(['x_comment', 'x_documentation', 'x_genGloss']);
const definition = new Set(['x_isa', 'x_instance', 'x_genls', 'x_subclass', 'x_genlPreds', 'x_arity', 'x_argIsa', 'x_argGenl', 'x_resultIsa', 'x_resultGenl', 'x_genlMt']);
const lexical = new Set(['x_genPhrase', 'x_genTemplate', 'x_termStrings', 'x_prettyString', 'x_prettyName', 'x_nameString', 'x_synonymousExternalConcept', 'x_denotation', 'x_lex']);
const logical = new Set(['x_<===', 'x_<==', 'x_=>', 'x_<=>', 'x_implies', 'x_equiv', 'x_and', 'x_or', 'x_not', 'x_forAll', 'x_forall', 'x_exists', 'x_thereExists']);
const head = item => item.expression?.head?.type === 'symbol' ? item.expression.head.value : null;
const children = node => node?.type === 'application' ? [node.head, ...(node.args ?? [])]
  : node?.type === 'list' ? node.items ?? [] : node?.type === 'map' ? (node.entries ?? []).flatMap(entry => [entry.key, entry.value])
    : ['value', 'execute'].includes(node?.type) ? [node.value] : [];
const has = (node, predicate) => Boolean(node && (predicate(node) || children(node).some(child => has(child, predicate))));
const contains = (node, term) => has(node, part => part.type === 'symbol' && part.value === term);

export function inContextSection(item, section) {
  const predicate = head(item);
  switch (section) {
    case 'all': case 'assertions': return true;
    case 'documentation': return documentation.has(predicate);
    case 'definition': return definition.has(predicate);
    case 'lexical': return lexical.has(predicate);
    case 'relations': return Boolean(predicate) && !documentation.has(predicate) && !lexical.has(predicate) && !logical.has(predicate);
    case 'gafs': return Boolean(predicate) && !logical.has(predicate) && !has(item.expression, node => node.type === 'variable');
    default: return false;
  }
}

// Compatibility with an already-running server: only the returned page is used.
// The integrated server supplies the complete, pre-pagination index instead.
export function filterContextItems(items, term, params) {
  const section = params.get('section') || 'all';
  const arg = Number(params.get('arg') || 0);
  const predicate = params.get('predicate');
  const mt = params.get('mt');
  return items.filter(item => inContextSection(item, section)
    && (!arg || contains(item.expression?.args?.[arg - 1], term))
    && (!predicate || head(item) === predicate) && (!mt || item.mt === mt));
}

function predicateGroups(items) {
  const predicates = new Map();
  for (const item of items) {
    const name = head(item);
    if (!name) continue;
    if (!predicates.has(name)) predicates.set(name, { term: name, count: 0, contexts: new Map() });
    const predicate = predicates.get(name);
    predicate.count++;
    if (!predicate.contexts.has(item.mt)) predicate.contexts.set(item.mt, { mt: item.mt, mtExpression: item.mtExpression, count: 0 });
    predicate.contexts.get(item.mt).count++;
  }
  return [...predicates.values()].sort((a, b) => a.term.localeCompare(b.term)).map(({ contexts, ...predicate }) =>
    ({ ...predicate, microtheories: [...contexts.values()].sort((a, b) => a.mt.localeCompare(b.mt)) }));
}

export function literalQuerySpec(term, predicate, position, shape, mt = '') {
  if (!term?.startsWith('x_') || !predicate?.startsWith('x_') || !Number.isSafeInteger(position)
    || !Number.isSafeInteger(shape?.arity) || position < 1 || position > shape.arity
    || shape.directCount < 1 || (mt && !shape.contexts?.includes(mt))) return null;
  return {
    expression: { type: 'application', head: { type: 'symbol', value: predicate },
      args: Array.from({ length: shape.arity }, (_, index) => index + 1 === position
        ? { type: 'symbol', value: term } : { type: 'variable', value: `?ARG${index + 1}` }) },
    mt, limit: 20, timeout: 3,
  };
}

export function pageTermNavigation(term, items) {
  const argumentsByPosition = new Map();
  for (const item of items) {
    (item.expression?.args ?? []).forEach((argument, index) => {
      if (!contains(argument, term)) return;
      if (!argumentsByPosition.has(index + 1)) argumentsByPosition.set(index + 1, []);
      argumentsByPosition.get(index + 1).push(item);
    });
  }
  return {
    total: items.length,
    sections: sectionLabels.map(([key, label]) => ({ key, label, count: items.filter(item => inContextSection(item, key)).length })),
    arguments: [...argumentsByPosition].sort(([a], [b]) => a - b).map(([position, members]) =>
      ({ position, count: members.length, predicates: predicateGroups(members).map(predicate => {
        const found = members.filter(item => head(item) === predicate.term);
        const arities = [...new Set(found.map(item => item.expression.args.length))].sort((a, b) => a - b);
        return { ...predicate, queryShapes: arities.map(arity => {
          const direct = found.filter(item => item.expression.args.length === arity
            && item.expression.args[position - 1]?.type === 'symbol' && item.expression.args[position - 1].value === term);
          return { arity, directCount: direct.length, contexts: [...new Set(direct.map(item => item.mt))] };
        }) };
      }) })),
    predicates: predicateGroups(items),
  };
}

export function termContextModel(route, data, term) {
  const navigation = data.navigation ?? pageTermNavigation(term, data.items ?? []);
  const complete = Boolean(data.navigation) || ((data.offset ?? 0) === 0 && data.total === (data.items?.length ?? 0));
  const href = filters => routeHref('term', { term, limit: route.limit, ...filters });
  const contexts = (predicate, arg) => (predicate.microtheories ?? []).map(context => ({
    label: contextLabel(context.mt, context.mtExpression), count: context.count,
    href: href({ arg, predicate: predicate.term, mt: context.mt }),
    selected: route.params.get('mt') === context.mt && route.params.get('predicate') === predicate.term,
    querySpecs: arg ? (predicate.queryShapes ?? []).map(shape => literalQuerySpec(term, predicate.term, arg, shape, context.mt)).filter(Boolean) : undefined,
  }));
  const predicates = (groups, arg) => groups.map(predicate => ({
    label: symbolLabel(predicate.term), count: predicate.count,
    href: href({ arg, predicate: predicate.term }), children: contexts(predicate, arg),
    selected: route.params.get('predicate') === predicate.term && !route.params.get('mt'),
    querySpecs: arg ? (predicate.queryShapes ?? []).map(shape => literalQuerySpec(term, predicate.term, arg, shape)).filter(Boolean) : undefined,
  }));
  return {
    title: symbolLabel(term), coverage: complete ? 'complete' : 'page',
    shown: data.items?.length ?? 0, total: data.navigation?.total ?? data.total,
    description: complete ? 'Filters apply to this term’s loaded assertions. Argument groups include nested occurrences.'
      : 'Counts and filters cover this page only until the complete server index is available.',
    sections: [
      { title: 'Index', items: [{ label: 'Index', href: href({}) }, { label: 'Viewpoint Filters', href: href({ viewpoint: 1 }) }] },
      { title: 'Term information', items: sectionLabels.slice(0, 4).map(([key, label]) => ({
        label, count: navigation.sections.find(section => section.key === key)?.count,
        href: href({ section: key }), selected: route.params.get('section') === key,
      })) },
      { title: 'Asserted knowledge', items: sectionLabels.slice(4).map(([key, label]) => ({
        label, count: navigation.sections.find(section => section.key === key)?.count,
        href: href({ section: key }), selected: (route.params.get('section') || 'all') === key,
      })) },
      { title: 'Argument positions', items: navigation.arguments.map(argument => ({
        label: `Arg ${argument.position}`, count: argument.count, href: href({ arg: argument.position }),
        children: predicates(argument.predicates, argument.position),
      })) },
      { title: 'Predicates and microtheories', items: predicates(navigation.predicates) },
    ],
  };
}
