import { renderExpression, routeHref, symbolLabel } from './render.js';

export const TERM_GROUPS = Object.freeze([
  ['predicates', 'Predicates'], ['functions', 'Functions'], ['collections', 'Collections'],
  ['microtheories', 'Microtheories'], ['the_word', '*-TheWord'], ['do_invocations', 'doInvocations'],
  ['individuals', 'Individuals'], ['unclassified', 'Unclassified'], ['external_symbols', 'External Symbols'],
]);
export const DEFAULT_TERM_GROUPS = Object.freeze(Object.fromEntries(TERM_GROUPS.map(([key]) => [key, key !== 'external_symbols'])));
export function normalizeTermGroups(input, previous = DEFAULT_TERM_GROUPS) {
  return Object.fromEntries(TERM_GROUPS.map(([key]) => [key, typeof input?.[key] === 'boolean' ? input[key] : previous?.[key] ?? DEFAULT_TERM_GROUPS[key]]));
}
export function selectedTermGroups(params, preferences) {
  if (!params.has('types')) return normalizeTermGroups(preferences);
  const names = params.get('types').split(',');
  const known = new Set(TERM_GROUPS.map(([key]) => key));
  if (names.some(name => name !== 'none' && !known.has(name))) throw new Error('Unknown term category in this URL.');
  return Object.fromEntries(TERM_GROUPS.map(([key]) => [key, names.includes(key)]));
}

export async function renderTermCategories(host, route, signal) {
  const { api, element: el, heading, link, presentation } = host;
  const selected = selectedTermGroups(route.params, presentation.get().termGroups);
  const groups = TERM_GROUPS.filter(([key]) => selected[key]);
  const params = Object.fromEntries(route.params), q = params.q ?? '';
  const types = groups.map(([key]) => key).join(',') || 'none';
  if (!route.params.has('types')) {
    params.types = types;
    history.replaceState(null, '', routeHref('search', params));
  }
  const limit = Math.min(route.limit, 100);
  const requests = groups.map(([group]) => ({ group, offset: Number(params[`offset_${group}`]) || 0, limit }));
  const data = await api('terms/sections', {}, { method: 'POST', body: { filters: { q, scope: 'all' }, requests }, signal });
  const input = el('input', { type: 'search', name: 'q', value: q, 'aria-label': 'Search semantic terms' });
  const search = el('form', { className: 'search-form', onsubmit: event => {
    event.preventDefault(); location.hash = routeHref('search', { q: input.value.trim(), types });
  } }, input, el('button', { className: 'button', type: 'submit' }, 'Search'));
  const choices = el('fieldset', { className: 'term-type-choices' }, el('legend', {}, 'Term categories'));
  const counts = new Map((data.groupCounts ?? []).map(item => [item.key, item.total]));
  for (const [key, label] of TERM_GROUPS) {
    const check = el('input', { type: 'checkbox', name: `type-${key}`, checked: selected[key], onchange: () => {
      selected[key] = check.checked;
      presentation.set({ termGroups: selected });
      location.hash = routeHref('search', { q, types: TERM_GROUPS.filter(([name]) => selected[name]).map(([name]) => name).join(',') || 'none' });
    } });
    choices.append(el('label', {}, check, `${label} (${counts.get(key) ?? 'unknown'})`));
  }
  const reset = el('button', { type: 'button', className: 'text-button', onclick: () => {
    presentation.set({ termGroups: DEFAULT_TERM_GROUPS });
    location.hash = routeHref('search', { q, types: TERM_GROUPS.filter(([key]) => DEFAULT_TERM_GROUPS[key]).map(([key]) => key).join(',') });
  } }, 'Reset category selection');
  choices.append(reset);
  const panel = el('div', {}, heading('Term search', 'Every matching category is retained. These are loaded-data roles and type evidence, not invented local implementations.'),
    search, choices,
    el('p', { className: 'muted' }, `${data.total} distinct matching identities; ${data.displayedDistinctTotal} shown across category pages. Group counts overlap and must not be summed. Coverage: loaded/indexed active generation only.`));
  if (!groups.length) panel.append(el('p', { className: 'empty-state' }, 'No categories selected. Select a category to show results.'));
  const sections = data.sections ?? [];
  const showSection = section => {
    const block = el('section', { className: 'term-category-section', 'data-category': section.group },
      el('h2', {}, `${section.label} (${section.total})`));
    if (!section.items.length) block.append(el('p', { className: 'muted' }, 'No matching entries in this category.'));
    else {
      const rows = section.items.map(item => {
        const evidence = el('details', {}, el('summary', {}, item.externalMethod ? 'External method reference' : 'Category evidence'),
          el('p', {}, (item.groups ?? []).join(', ')),
          host.propertyList((item.memberships ?? []).map(member => ({ name: member.group ?? member.key ?? 'Membership', value: member }))));
        const name = item.atomicity === 'non_atomic' ? renderExpression(item.expression)
          : link(item.label ?? symbolLabel(item.identity), 'term', { term: item.identity });
        return el('tr', {},
          el('td', {}, name, item.mt && el('div', {}, link('Microtheory view', 'microtheory', { mt: item.mt }), ` · ${item.contextAssertionCount} context assertions`)),
          el('td', {}, String(item.semanticAssertionCount ?? item.count ?? 0)), el('td', {}, evidence));
      });
      block.append(el('table', { className: 'data-table' },
        el('thead', {}, el('tr', {}, el('th', {}, 'Term'), el('th', {}, 'Semantic assertions'), el('th', {}, 'Evidence'))),
        el('tbody', {}, rows)));
    }
    const paramsFor = offset => ({ ...params, types, [`offset_${section.group}`]: offset, limit });
    const controls = el('nav', { className: 'pagination', 'aria-label': `${section.label} pages` },
      el('span', {}, `${section.total ? section.offset + 1 : 0}–${Math.min(section.total, section.offset + section.items.length)} of ${section.total}`));
    if (section.offset) controls.append(link('Previous', 'search', paramsFor(Math.max(0, section.offset - section.limit)), 'button secondary'));
    if (section.offset + section.limit < section.total) controls.append(link('Next', 'search', paramsFor(section.offset + section.limit), 'button secondary'));
    block.append(controls); panel.append(block);
  };
  sections.filter(section => section.group !== 'external_symbols').forEach(showSection);
  panel.append(el('section', { className: 'nat-search-entry' }, el('h2', {}, 'Non-atomic terms'),
    el('p', { className: 'muted' }, 'Full term identities, type categories and independent NART/NAUT reification evidence.'),
    link('Browse non-atomic terms by category', 'nats', { q }, 'button secondary')));
  sections.filter(section => section.group === 'external_symbols').forEach(showSection);
  return panel;
}
