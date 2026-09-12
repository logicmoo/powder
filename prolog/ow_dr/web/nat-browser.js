import { renderExpression, routeHref } from './render.js';

export async function renderNatBrowser(host, route, signal) {
  const { api, element: el, heading, link, button, pagination } = host;
  const params = Object.fromEntries(route.params);
  const limit = Math.min(route.limit || 25, 100);
  const filters = Object.fromEntries(['q', 'constructor', 'type', 'category', 'representation'].map(key => [key, params[key] || '']));
  filters.match = params.match || 'substring';
  if (!filters.representation) filters.representation = 'all';
  const facet = params.facet;
  const data = await api(facet ? 'nats/facets' : 'nats', { ...filters, facet, offset: route.offset, limit }, { signal });
  const panel = el('div', {},
    heading(facet ? `Non-atomic term ${facet}` : 'Non-atomic terms',
      'Complete grounded terms, not constructor names. Type evidence and NART/NAUT reification are separate facets.'),
    el('p', { className: 'muted' }, 'Counts are distinct terms in the loaded generation. A term can belong to several categories; category counts must not be summed. No source is loaded and no inference is run by these filters.'));
  const search = el('input', { name: 'q', type: 'search', value: filters.q, 'aria-label': 'Search complete non-atomic terms', placeholder: 'Full term, constructor, or type' });
  const form = el('form', { className: 'search-form', onsubmit: event => {
    event.preventDefault();
    location.hash = routeHref('nats', { ...params, q: search.value, match: undefined, offset: 0 });
  } }, search, el('button', { type: 'submit', className: 'button' }, 'Search non-atomic terms'));
  panel.append(form);
  if (facet) {
    const facetKey = { representations: 'representation', categories: 'category', types: 'type', constructors: 'constructor' }[facet];
    panel.append(link('Back to matching non-atomic terms', 'nats', { ...params, facet: undefined, offset: 0 }),
      el('ul', { className: 'nat-facet-list' }, data.items.map(item => el('li', {},
        link(item.label ?? item.key, 'nats', { ...params, facet: undefined, [facetKey]: item.key, offset: 0 }),
        ` (${item.count})`))), pagination(data, { ...route, limit }));
    return panel;
  }
  const controls = el('div', { className: 'filter-grid' });
  for (const [key, label, plural] of [['constructor', 'Constructor', 'constructors'], ['type', 'Type constraint', 'types'], ['category', 'Category', 'categories']]) {
    const choices = data.facets?.[plural]?.items ?? [];
    const select = el('select', { name: key, onchange: event => {
      location.hash = routeHref('nats', { ...params, [key]: event.target.value, offset: 0 });
    } }, el('option', { value: '', selected: !filters[key] }, `All ${plural}`),
    filters[key] && !choices.some(choice => choice.key === filters[key]) && el('option', { value: filters[key], selected: true }, `Selected ${label.toLowerCase()}`),
    choices.map(choice => el('option', { value: choice.key, selected: choice.key === filters[key] }, `${choice.label ?? choice.key} (${choice.count})`)));
    controls.append(el('label', { className: 'field' }, label, select,
      link(`Browse all ${plural}`, 'nats', { ...params, facet: plural, offset: 0 }, 'text-button')));
  }
  controls.append(el('label', { className: 'field' }, 'Reification evidence',
    el('select', { name: 'representation', onchange: event => {
      location.hash = routeHref('nats', { ...params, representation: event.target.value, offset: 0 });
    } }, [['all', 'All evidence states'], ['unknown', 'Unknown'], ['nart', 'Reified (NART) export'], ['naut', 'Unreified (NAUT) export'], ['conflicting', 'Conflicting exports']].map(([value, label]) =>
      el('option', { value, selected: filters.representation === value }, label)))));
  panel.append(controls, link('Clear non-atomic filters', 'nats', {}, 'text-button'),
    el('p', { className: 'muted' }, `${data.total} matching complete terms; ${data.overallTotal} indexed non-atomic terms in this generation.`));
  panel.append(renderNatRows(host, data.items));
  if (!data.items.length) panel.append(el('p', { className: 'empty-state' }, 'No non-atomic terms match these filters. Unknown reification does not mean unreified.'));
  panel.append(pagination(data, { ...route, limit }));
  const categories = data.facets?.categories;
  if (categories?.items?.length) {
    const groups = el('section', { className: 'nat-categories' }, el('h2', {}, 'Browse by category'));
    for (const category of categories.items) {
      const body = el('div');
      const group = el('details', {}, el('summary', {}, `${category.label} (${category.count})`), body);
      let loaded = false;
      const load = async () => {
        if (loaded || !group.open) return;
        loaded = true;
        body.replaceChildren(el('p', { className: 'muted' }, 'Reading matching terms...'));
        try {
          const page = await api('nats', { ...filters, category: category.key, limit: 10 }, { signal });
          if (signal.aborted) return;
          body.replaceChildren(renderNatRows(host, page.items),
            link(`Open all ${page.total} terms in this category`, 'nats', { ...filters, category: category.key }));
        } catch (error) {
          loaded = false;
          if (error.name !== 'AbortError') body.replaceChildren(el('p', { className: 'statistics-error', role: 'alert' }, error.message), button('Retry category', load));
        }
      };
      group.addEventListener('toggle', load);
      groups.append(group);
    }
    if (categories.total > categories.items.length) groups.append(link('More categories', 'nats', { ...params, facet: 'categories', offset: categories.items.length }));
    panel.append(groups);
  }
  return panel;
}

function renderNatRows({ element: el, link }, items) {
  return el('ul', { className: 'nat-results' }, items.map(item => el('li', {},
    renderExpression(item.expression),
    el('div', { className: 'nat-row-details' },
      link('Term properties and references', 'term', { term: item.identity, view: 'references' }),
      link('Definitional Info · all files', 'definitions', { term: item.identity }),
      item.constructor.key && link('Same constructor', 'nats', { constructor: item.constructor.key }),
      el('span', { className: 'muted' }, `${item.count} assertion occurrences; reification ${item.representation.status}`)),
    el('div', { className: 'nat-type-labels' }, (item.categories ?? []).map(category =>
      link(category.label, 'nats', { category: category.key }))))));
}
