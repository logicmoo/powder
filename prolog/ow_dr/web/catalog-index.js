import { expressionText, groupAssertions, renderExpression, routeHref } from './render.js';

export const CATALOG_SCOPES = Object.freeze([
  ['all', 'All indexed files'], ['loaded', 'Loaded files'], ['unloaded', 'Unloaded files'],
]);
export const CATALOG_GROUPS = Object.freeze([
  ['all', 'All categories'], ['predicates', 'Predicates'], ['functions', 'Functions'],
  ['collections', 'Collections'], ['microtheories', 'Microtheories'],
  ['do_invocations', 'doInvocations'],
  ['external_symbols', 'External symbols'], ['typed_other', 'Other recorded types'],
  ['unclassified', 'Unclassified'],
]);
export function catalogParameters(route, term = false) {
  const params = route.params;
  const result = { scope: params.get('scope') || 'all', offset: route.offset, limit: Math.min(100, route.limit) };
  if (!CATALOG_SCOPES.some(([key]) => key === result.scope)) throw new Error('Unknown catalog file scope.');
  if (term) Object.assign(result, { term: params.get('term') || '', facet: params.get('facet') || 'definition',
    source: params.get('source') || '', mt: params.get('mt') || '' });
  else Object.assign(result, { q: params.get('q') || '', group: params.get('group') === 'individuals'
    ? 'typed_other' : params.get('group') || 'all' });
  return result;
}
export function catalogCoverageText(coverage) {
  const fresh = Number.isSafeInteger(coverage?.freshFiles) ? coverage.freshFiles : '?';
  const expected = Number.isSafeInteger(coverage?.expectedFiles) ? coverage.expectedFiles : '?';
  return `${fresh} of ${expected} eligible source files verified in this snapshot. ${coverage?.complete === true
    ? 'Complete file coverage.' : 'Incomplete coverage: missing or deferred files are not empty files.'}`;
}
export function catalogAssertionHref(item, term) {
  return item.loaded ? routeHref('assertion', { id: item.id })
    : routeHref('catalog-assertion', { term, source: item.source, id: item.id });
}
export function catalogJobText(label, job = {}) {
  return `${label}: ${job.state ?? 'not started'}; phase ${job.phase ?? 'not started'}; ${job.completed ?? '?'} of ${job.total ?? '?'} files processed.`;
}
export function catalogContextHref(mt, scope = 'all') {
  return routeHref('definitions', { term: mt, facet: 'context', scope });
}

function filters(host, route, values, fields) {
  const { element: el } = host;
  return el('div', { className: 'filter-bar' }, fields.map(([key, label, options]) =>
    el('label', { className: 'field' }, label,
      el('select', { name: key, 'aria-label': label, value: values[key], onchange: event => {
        location.hash = routeHref(route.name, { ...Object.fromEntries(route.params), [key]: event.target.value, offset: 0 });
      } }, options.map(([value, text]) => el('option', { value, selected: value === values[key] }, text))))));
}
function coveragePanel(host, data) {
  const { element: el, file } = host;
  const coverage = data.coverage ?? data;
  return el('section', { className: 'term-occurrences', 'aria-label': 'Catalog coverage' },
    el('p', { className: coverage.complete ? 'muted' : 'statistics-error' }, catalogCoverageText(coverage)),
    data.providerCoverage === 'pending' && el('p', { className: 'muted' },
      'Term membership and definition browsing are available. SourcePack provider enrichment is still pending.'),
    data.verifiedAt && el('p', { className: 'muted' }, `Verified ${new Date(data.verifiedAt * 1000).toLocaleString()}. Source detail is checked again when read.`),
    coverage.issues?.length > 0 && el('details', {}, el('summary', {}, `Files needing attention (${coverage.issues.length})`),
      el('ul', {}, coverage.issues.map(issue => el('li', {}, file(issue.path), ` · ${issue.status}: ${issue.message}`)))));
}
async function available(host, signal, page) {
  const status = await host.api('catalog/status', {}, { signal });
  if (status.projection?.available) return true;
  page.append(coveragePanel(host, status),
    host.element('p', { className: 'empty-state', role: 'status' },
      'The query catalog has not been published yet. Indexing does not load files into the active KB.'),
    host.element('p', { className: 'muted' }, catalogJobText('Source catalog', status.progress)),
    host.element('p', { className: 'muted' }, catalogJobText('Query publication', status.projectionProgress)),
    status.progress?.error && host.element('p', { className: 'statistics-error', role: 'alert' }, status.progress.error.message),
    status.projectionProgress?.error && host.element('p', { className: 'statistics-error', role: 'alert' }, status.projectionProgress.error.message),
    host.element('p', { className: 'muted' }, 'This external process is tracked separately from the app file-task queue. A saved count does not mean a worker is still running.'),
    host.link('Task progress', 'tasks', {}, 'button secondary'));
  return false;
}

export async function catalogSearchPage(host, route, signal) {
  const { api, element: el, heading, link, pagination } = host;
  const params = catalogParameters(route);
  const page = el('div', { className: 'catalog-index' },
    heading('All-file term index', 'Find terms and their defining assertions, including sources that have never been loaded.'));
  const input = el('input', { type: 'search', name: 'q', value: params.q, 'aria-label': 'Search all indexed terms' });
  page.append(el('form', { className: 'search-form', onsubmit: event => {
    event.preventDefault(); location.hash = routeHref('catalog', { ...params, q: input.value.trim(), offset: 0 });
  } }, input, el('button', { type: 'submit', className: 'button' }, 'Search')),
  filters(host, route, params, [['scope', 'Files', CATALOG_SCOPES], ['group', 'Category', CATALOG_GROUPS]]));
  if (!await available(host, signal, page)) return page;
  const data = await api('catalog/search', params, { signal });
  page.append(coveragePanel(host, data));
  if (!data.items.length) page.append(el('p', { className: 'empty-state' }, 'No indexed terms match these filters.'));
  else page.append(el('div', { className: 'table-scroll' },
    el('table', { className: 'data-table' },
      el('thead', {}, el('tr', {}, ['Term', 'Kinds / recorded types', 'Files / assertions', 'Definition evidence'].map(text => el('th', { scope: 'col' }, text)))),
      el('tbody', {}, data.items.map(item => el('tr', {},
        el('td', {}, renderExpression(item.expression)),
        el('td', {}, item.groups.join(', '),
          el('div', { className: 'muted' }, (item.typeEntries ?? []).flatMap((type, index) =>
            [index ? ', ' : '', renderExpression(type.expression, { inline: true })]))),
        el('td', {}, `${item.files} files; ${item.sentences} assertions; ${item.occurrences} occurrences`),
        el('td', {}, link(`Definitional Info (${item.definitions})`, 'definitions', { term: item.term, scope: params.scope }),
          el('div', {}, link('All occurrences', 'definitions', { term: item.term, facet: 'semantic', scope: params.scope })))))))));
  page.append(pagination(data, route),
    el('p', { className: 'muted' }, 'Categories retain multiple memberships and unknowns. Recorded types use catalog-wide evidence, even when occurrences are filtered to loaded files. Detailed type-support links are pending. Type declarations and static definitions do not establish an executable implementation.'));
  return page;
}

function catalogCards(host, items, term, { detail = false, offset = 0, scope = 'all' } = {}) {
  const cards = host.assertions(items, { term, detail, offset });
  const groups = groupAssertions(items);
  for (const [index, header] of [...cards.querySelectorAll('.assertion-group-heading')].entries()) {
    const mt = groups[index]?.mt;
    if (mt) header.append(host.element('a', { href: catalogContextHref(mt, scope) }, 'All indexed MT assertions'));
  }
  const byId = new Map(items.map(item => [String(item.id), item]));
  for (const card of cards.querySelectorAll('.assertion-view')) {
    const item = byId.get(card.dataset.assertionId);
    if (!item) continue;
    for (const anchor of card.querySelectorAll('.assertion-ball, .assertion-id')) anchor.href = catalogAssertionHref(item, term);
    card.prepend(host.element('p', { className: 'muted' },
      item.loaded ? 'Loaded source · catalog evidence' : 'Unloaded source · catalog evidence',
      ' · ', host.file(item.source, item.line)));
    if (item.positions?.length) card.append(host.element('details', { className: 'catalog-positions' },
      host.element('summary', {}, `Matching structural positions (${item.positions.length})`),
      host.element('ul', {}, item.positions.map(path => host.element('li', {},
        host.element('code', {}, JSON.stringify(path)))))));
  }
  return cards;
}

export async function catalogTermPage(host, route, signal) {
  const { api, element: el, heading, link, pagination, file } = host;
  const params = catalogParameters(route, true);
  const page = el('div', { className: 'catalog-index' },
    heading('Definitional Info', 'Recorded type and schema assertions about the selected term, across indexed original files. No KB load is performed.'));
  if (!await available(host, signal, page)) return page;
  const data = await api('catalog/term', params, { signal });
  page.catalogContext = {
    title: expressionText(data.expression, { pretty: false }),
    description: 'All-file catalog evidence. Loaded state is separate from file coverage.',
    sections: [
      { title: 'Term information', items: [
        { label: 'Definitional Info', href: routeHref('definitions', { term: data.term }) },
        { label: 'All occurrences', href: routeHref('definitions', { term: data.term, facet: 'semantic' }) },
      ] },
      { title: 'Original files', items: data.files.map(entry => ({
        label: `${entry.source} · ${entry.loaded ? 'Loaded' : 'Unloaded'}`, count: entry.sentences,
        href: routeHref('definitions', { ...params, source: entry.source, offset: 0 }),
      })) },
    ],
  };
  page.append(renderExpression(data.expression),
    filters(host, route, params, [['scope', 'Files', CATALOG_SCOPES],
      ['facet', 'Evidence', [['definition', 'Definitional Info'], ['semantic', 'All semantic occurrences'], ['context', 'Context membership']]]]),
    coveragePanel(host, data),
    el('p', {}, `${data.total} distinct assertions; ${data.occurrences} matching positions. Counts include all filtered pages.`));
  if (params.source || params.mt) page.append(link('Clear source and MT filters', route.name,
    { ...Object.fromEntries(route.params), source: '', mt: '', offset: 0 }, 'text-button'));
  if (data.files.length) page.append(el('details', {}, el('summary', {}, `Original files (${data.files.length})`),
    el('ul', {}, data.files.map(entry => el('li', {}, file(entry.source),
      el('span', { className: 'badge' }, entry.loaded ? 'Loaded' : 'Unloaded'),
      ` ${entry.sentences} assertions · `,
      link('Filter to file', route.name, { ...params, source: entry.source, offset: 0 }),
      ' · ', link('Plan load with dependencies', 'packs', { root: entry.source }))))));
  if (data.items.length) page.append(catalogCards(host, data.items, data.term, { offset: params.offset, scope: params.scope }));
  else page.append(el('p', { className: 'empty-state' }, 'No matching assertions in this indexed snapshot. Incomplete file coverage is not proof that definitions are absent.'));
  page.append(pagination(data, route),
    el('p', { className: 'muted' }, 'Schema targets use declared argument roles, not mention-only matches. MetaRelation taxonomy evidence is not MT inheritance or permission to execute source rules.'));
  return page;
}

export async function catalogAssertionPage(host, route, signal) {
  const term = route.params.get('term');
  const item = await host.api('catalog/assertion', {
    term, source: route.params.get('source'), id: route.params.get('id'),
  }, { signal });
  return host.element('div', { className: 'catalog-index' },
    host.heading('Catalog assertion', 'Read-only original-file evidence. Loading a provider is a separate, explicit action.'),
    catalogCards(host, [item], term, { detail: true }),
    host.link('Definitional Info', 'definitions', { term }),
    ' · ', host.link('Plan load with dependencies', 'packs', { root: item.source }));
}
