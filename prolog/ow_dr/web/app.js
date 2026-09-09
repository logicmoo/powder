import { assertionRoles, contextExpression, contextInputText, contextLabel, expressionText, groupAssertions, renderExpression, routeHref, symbolLabel } from './render.js';
import { APIError, SourceSelection, VersionTracker, apiErrorSummary, canonicalPath, compilationIssues, contextRequestValue, fileMeasure, normalizeContextInput, pageRange, parseRoute, positiveInteger, requestJSON } from './model.js';
import { collectDiagnostics, diagnosticCounts, diagnosticMessages, diagnosticProperty, mappingRowsOf, splitMappingRows } from './diagnostics.js';

const $ = selector => document.querySelector(selector);
const content = $('#content');
const APP_NAME = 'OpenWorld Defeasible Reasoner';
const number = value => new Intl.NumberFormat().format(Number(value) || 0);
const state = {
  status: null, catalog: null, selection: null, expanded: new Set(['KBs']),
  knownSources: new Set(), knownMappings: null, contexts: new Map(),
  mutation: false, routeController: null, queryController: null, view: 0,
  query: { query: '', mt: '', limit: 50, timeout: 3 },
};

function element(tag, attributes = {}, ...children) {
  const node = document.createElement(tag);
  for (const [key, value] of Object.entries(attributes)) {
    if (value === undefined || value === null) continue;
    if (key.startsWith('on')) node.addEventListener(key.slice(2).toLowerCase(), value);
    else if (key === 'className') node.className = value;
    else if (key === 'text') node.textContent = value;
    else if (['value', 'checked', 'selected', 'disabled', 'hidden', 'open', 'textContent', 'htmlFor'].includes(key)) node[key] = value;
    else node.setAttribute(key, String(value));
  }
  for (const child of children.flat(Infinity)) {
    if (child !== undefined && child !== null && child !== false) node.append(child instanceof Node ? child : document.createTextNode(String(child)));
  }
  return node;
}

function link(label, route, params, className) {
  return element('a', { href: routeHref(route, params), className }, label);
}

function button(label, action, className = 'button') {
  return element('button', { type: 'button', className, onclick: action }, label);
}

function heading(title, description, action) {
  return element('header', { className: 'page-heading' },
    element('div', {}, element('h1', {}, title), description && element('p', { className: 'lead' }, description)), action);
}

function empty(title, description, action) {
  return element('div', { className: 'empty-state' },
    element('h2', {}, title), element('p', {}, description), action);
}

function api(path, params = {}, options = {}) {
  const query = new URLSearchParams();
  for (const [key, value] of Object.entries(params)) {
    if (value !== undefined && value !== null && value !== '') query.set(key, String(value));
  }
  return requestJSON(`/api/${path}${query.size ? `?${query}` : ''}`, options);
}

function showNotice(message, isError = false) {
  const target = $('#notice');
  target.replaceChildren(element('div', { className: 'notice-content' }, message),
    button('Dismiss', () => { target.hidden = true; }, 'text-button'));
  target.className = `notice${isError ? ' error-notice' : ''}`;
  target.setAttribute('role', isError ? 'alert' : 'status');
  target.hidden = false;
}

function errorPanel(error, retry = renderRoute) {
  return element('section', { className: `error-panel${error.code === 'busy' ? ' busy-panel' : ''}`, role: error.code === 'busy' ? 'status' : 'alert' },
    element('h2', {}, error.code === 'busy' ? 'Source update deferred' : 'The request could not be completed'),
    requestErrorDetails(error),
    error.code && element('code', { className: 'error-code' }, error.code),
    button('Try again', retry));
}

function requestErrorDetails(error, { preserveSelection = false } = {}) {
  const report = element('div', { className: 'request-error-details' },
    element('p', { className: 'failure-summary' }, apiErrorSummary(error)),
    preserveSelection && element('p', { className: 'state-protection' },
      'The active KB was not replaced by this request. Your draft selection is unchanged.'));
  const countLabels = { failed: 'failed', busy: 'busy', generated: 'generated', cacheHits: 'cache hits' };
  const counts = Object.entries(countLabels).filter(([key]) => Number.isSafeInteger(error.counts?.[key]) && error.counts[key] >= 0);
  if (counts.length) {
    report.append(element('div', { className: 'failure-counts', 'aria-label': 'Compilation counts' },
      counts.map(([key, label]) => element('span', { 'data-count': key }, `${number(error.counts[key])} ${label}`))));
  }
  const issues = compilationIssues(error);
  if (issues.length) {
    report.append(element('details', { className: 'compile-issues', open: issues.length <= 3 },
      element('summary', {}, `Review ${number(issues.length)} source ${issues.length === 1 ? 'issue' : 'issues'}`),
      element('ul', { className: 'compile-issue-list', 'aria-label': 'Failed or busy sources' }, issues.map(issue => {
        const busy = issue.status === 'busy';
        const message = typeof issue.message === 'string' ? issue.message : 'Inspect the source diagnostics before retrying.';
        const line = positiveInteger(issue.line, undefined, Number.MAX_SAFE_INTEGER, 1);
        const column = positiveInteger(issue.column, undefined, Number.MAX_SAFE_INTEGER, 1);
        const location = `${issue.source || 'Unknown source'}${line ? `:${line}${column ? `:${column}` : ''}` : ''}`;
        const supplemental = collectDiagnostics(issue).filter(entry => entry.message !== message || entry.severity !== (busy ? 'warning' : 'error'));
        const reference = sourceLink(issue.source, line, location, column);
        if (reference.tagName === 'A') reference.addEventListener('click', () => { reference.closest('.compile-issues').open = false; });
        return element('li', { className: 'compile-issue', 'data-status': issue.status ?? 'failed' },
          element('div', { className: 'compile-issue-heading' },
            element('span', { className: `badge diagnostic-badge ${busy ? 'warning' : 'error'}` }, busy ? 'Busy' : 'Failed'),
            reference),
          element('p', { className: 'compile-issue-message' }, message),
          diagnosticsPanel(issue, { entries: supplemental, showOrigins: false }));
      }))));
  }
  return report;
}

function displayProperty(value) {
  if (value === null) return 'null';
  if (typeof value === 'object') return JSON.stringify(value, null, 2);
  return String(value ?? '');
}

function propertyList(properties, { context } = {}) {
  const list = element('dl', { className: 'properties' });
  for (const property of properties ?? []) {
    let value;
    if (context && diagnosticProperty(property.name)) {
      const count = diagnosticMessages(property.value).length;
      const label = count === 1 ? property.name.slice(0, -1) : property.name;
      value = element('span', { className: 'diagnostic-property-summary' }, `${number(count)} stored ${label}${count ? ' · shown in diagnostics' : ''}`);
    } else if (context && property.name === 'mapping_rows') {
      const rows = splitMappingRows(Array.isArray(property.value) ? property.value : []);
      value = element('span', {}, `${number(rows.ids.length)} mapping IDs · ${number(rows.markers.length)} diagnostic markers${rows.other.length ? ` · ${number(rows.other.length)} other annotations` : ''}`);
    } else if (property.name === 'microtheory' && context) value = mtLink(context.mt, context.mtExpression);
    else value = property.value?.type ? renderExpression(property.value) : element('pre', {}, displayProperty(property.value));
    list.append(element('dt', {}, property.name),
      element('dd', {}, value));
  }
  return list;
}

function sourceLink(path, line = 1, label, column) {
  const normalized = canonicalPath(path);
  const safeLine = positiveInteger(line, 1, Number.MAX_SAFE_INTEGER, 1);
  const safeColumn = positiveInteger(column, undefined, Number.MAX_SAFE_INTEGER, 1);
  const text = label ?? `${path || 'Unknown source'}:${safeLine}${safeColumn ? `:${safeColumn}` : ''}`;
  return normalized && state.knownSources.has(normalized)
    ? link(text, 'source', { path: normalized, line: safeLine, column: safeColumn }, 'source-link')
    : element('span', { className: 'muted' }, text);
}

function rememberContext(mt, expression) {
  if (!mt) return null;
  const known = expression ?? state.contexts.get(mt);
  state.contexts.set(mt, known);
  return known;
}

function mtName(mt, supplied) {
  const expression = contextExpression(mt, supplied ?? state.contexts.get(mt));
  return expression ? renderExpression(expression, { inline: true, pretty: false })
    : element('span', { className: 'muted' }, contextLabel(mt));
}

function mtLink(mt, supplied) {
  if (!mt) return element('span', { className: 'muted' }, 'Unspecified microtheory');
  const expression = rememberContext(mt, supplied);
  const navigation = link('Browse context', 'microtheory', { mt }, 'mt-link');
  navigation.setAttribute('aria-label', `Browse microtheory ${contextLabel(mt, expression)}`);
  return element('span', { className: 'mt-reference' }, mtName(mt, expression), navigation);
}

function mappingLink(id) {
  return typeof id === 'string' && state.knownMappings?.has(id)
    ? link(id, 'mappings', { row: id }, 'mapping-link')
    : element('span', {}, displayProperty(id));
}

function diagnosticSummary(entries) {
  const counts = diagnosticCounts(entries);
  return ['error', 'warning', 'note'].filter(level => counts[level])
    .map(level => `${number(counts[level])} ${level}${counts[level] === 1 ? '' : 's'}`).join(' · ');
}

function diagnosticsPanel(record, { status = false, entries: supplied, showOrigins = true } = {}) {
  const entries = supplied ?? collectDiagnostics(record, { includeRows: !status, status });
  if (!entries.length) return null;
  const labels = { note: 'Note', warning: 'Warning', error: 'Error' };
  const list = element('ul', { className: 'diagnostic-list' }, entries.map(entry => {
    const stored = [...new Set(entry.origins.filter(origin => origin !== 'mappingRows').map(origin => origin.split(':')[1]))];
    const origins = [stored.length ? `Stored ${stored.join(', ')}` : '', entry.origins.includes('mappingRows') ? 'Mapping discovery' : ''].filter(Boolean).join(' · ');
    return element('li', { className: `diagnostic diagnostic-${entry.severity}`, 'data-severity': entry.severity },
      element('div', { className: 'diagnostic-message-row' },
        element('span', { className: `badge diagnostic-badge ${entry.severity}` }, labels[entry.severity]),
        element('p', { className: 'diagnostic-message' }, entry.message)),
      element('div', { className: 'diagnostic-provenance' },
        entry.source ? sourceLink(entry.source, entry.line, `${entry.severity === 'note' ? 'Source' : 'Review source'}: ${entry.source}${entry.line ? `:${entry.line}${entry.column ? `:${entry.column}` : ''}` : ''}`, entry.column) : null,
        !status && showOrigins && element('span', { className: 'muted' }, origins)));
  }));
  if (status) {
    return element('details', { className: 'status-diagnostics', open: entries.some(entry => entry.severity === 'error') },
      element('summary', {}, `Compiler diagnostics · ${diagnosticSummary(entries)}`), list);
  }
  return element('section', { className: 'assertion-diagnostics', 'aria-label': 'Assertion diagnostics' },
    element('h3', { className: 'diagnostic-summary' }, diagnosticSummary(entries)), list);
}

function assertionCard(assertion, term) {
  const mapping = splitMappingRows(mappingRowsOf(assertion));
  const roles = term ? assertionRoles(assertion.expression, term) : [];
  const labels = { predicate: 'Predicate', argument: 'Argument', nested: 'Nested head' };
  const footer = element('footer', { className: 'assertion-footer' },
    sourceLink(assertion.source, assertion.line),
    link(assertion.id, 'assertion', { id: assertion.id }, 'assertion-id'),
    assertion.predicate && element('span', { className: 'muted', title: 'Semantic argument count; microtheory is metadata' },
      `Arity ${assertion.predicate.arity}`));
  if (mapping.ids.length) {
    footer.append(element('span', { className: 'mapping-references' }, 'Mappings: ',
      mapping.ids.flatMap((id, index) => [index ? ', ' : '', mappingLink(id)])));
  }
  const card = element('article', { className: 'assertion-card' },
    roles.length > 0 && element('div', { className: 'role-labels' }, roles.map(role => element('span', {}, labels[role]))),
    renderExpression(assertion.expression), diagnosticsPanel(assertion), footer);
  if (mapping.other.length) {
    card.append(element('details', { className: 'assertion-properties' },
      element('summary', {}, 'Other mapping annotations'),
      element('pre', { className: 'mapping-annotations' }, displayProperty(mapping.other))));
  }
  if (assertion.properties?.length) {
    card.append(element('details', { className: 'assertion-properties' },
      element('summary', {}, `Assertion properties (${assertion.properties.length})`), propertyList(assertion.properties, { context: assertion })));
  }
  return card;
}

function assertionGroups(items, { offset = 0, term } = {}) {
  const container = element('div', { className: 'assertion-groups' });
  groupAssertions(items).forEach((group, index) => {
    const details = element('details', { className: 'mt-block', open: true });
    const contextLink = mtLink(group.mt, group.mtExpression);
    contextLink.addEventListener('click', event => event.stopPropagation());
    details.append(
      element('summary', {}, element('span', { className: 'context-label' }, 'Microtheory'),
        contextLink, element('span', { className: 'muted block-count' },
          `${number(group.items.length)} on this page${index === 0 && offset > 0 ? ' · continued view' : ''}`)),
      ...group.items.map(assertion => assertionCard(assertion, term)));
    container.append(details);
  });
  return container;
}

function updateRoute(values = {}, { replace = false } = {}) {
  const route = parseRoute(location.hash);
  const params = Object.fromEntries(route.params);
  for (const [key, value] of Object.entries(values)) {
    if (value === undefined || value === null || value === '') delete params[key];
    else params[key] = value;
  }
  const next = routeHref(route.name, params);
  if (replace) history.replaceState(null, '', next);
  else if (location.hash === next) renderRoute();
  else location.hash = next;
}

function pagination(data, route) {
  const total = positiveInteger(data.total, 0);
  const offset = positiveInteger(data.offset, route.offset);
  const limit = positiveInteger(data.limit, route.limit, 100, 1);
  const range = pageRange(total, offset, limit);
  const controls = element('nav', { className: 'pagination', 'aria-label': 'Results pages' });
  const params = Object.fromEntries(route.params);
  controls.append(element('span', { className: 'result-count', 'aria-live': 'polite' },
    `${number(range.start)}–${number(range.end)} of ${number(total)}`));
  const actions = element('div', { className: 'page-actions' });
  if (range.hasPrevious) actions.append(link('Previous', route.name, { ...params, offset: range.previous, limit }, 'button secondary'));
  else actions.append(element('button', { className: 'button secondary', disabled: true }, 'Previous'));
  if (range.hasNext) actions.append(link('Next', route.name, { ...params, offset: range.next, limit }, 'button secondary'));
  else actions.append(element('button', { className: 'button secondary', disabled: true }, 'Next'));
  controls.append(actions);
  return controls;
}

function searchForm(routeName, q = '', placeholder = 'Name, symbol, or fragment', label = 'Search terms') {
  const input = element('input', { type: 'search', name: 'q', value: q, placeholder, 'aria-label': label });
  return element('form', {
    className: 'search-form', role: 'search', onsubmit: event => {
      event.preventDefault();
      const next = routeHref(routeName, { q: input.value.trim() });
      if (location.hash === next) renderRoute();
      else location.hash = next;
    },
  }, input, element('button', { type: 'submit', className: 'button' }, 'Search'));
}

function setStatus(status) {
  if (state.status && status.generation < state.status.generation) return;
  state.status = status;
  for (const file of status.files ?? []) {
    const path = canonicalPath(file.path);
    if (path) state.knownSources.add(path);
  }
  $('#generation-state').textContent = `Generation ${status.generation} · ${number(status.counts?.assertions)} assertions`;
  $('#loaded-count').textContent = `${number(status.files?.length)} loaded ${status.files?.length === 1 ? 'source' : 'sources'}`;
}

function rememberCatalog(catalog) {
  state.catalog = catalog;
  const visit = nodes => {
    for (const node of nodes ?? []) {
      const path = canonicalPath(node.path);
      if (node.type === 'file' && path) state.knownSources.add(path);
      visit(node.children);
    }
  };
  visit(catalog.nodes);
}

async function ensureContext(signal) {
  if (state.status) return;
  setStatus(await api('status', {}, { signal }));
}

async function ensureMappingIds(signal) {
  if (state.knownMappings) return;
  const ids = new Set();
  let offset = 0;
  let total;
  do {
    const page = await api('mappings', { offset, limit: 100 }, { signal });
    for (const row of page.items ?? []) ids.add(row.id);
    const size = page.items?.length ?? 0;
    if (!size) break;
    offset += size;
    total = page.total;
  } while (offset < total);
  state.knownMappings = ids;
}

function loadedFiles(files, { compact = false } = {}) {
  if (!files?.length) return empty('No sources loaded', 'An empty KB is valid. Select sources when you are ready.', link('Choose KB Sources', 'sources', {}, 'button'));
  const list = element('ul', { className: `loaded-files${compact ? ' compact' : ''}` });
  for (const file of files) {
    const remove = button('×', () => unloadSource(file), 'unload-button');
    remove.setAttribute('aria-label', `Unload ${file.path} from memory`);
    remove.title = 'Unload from memory; source and caches are kept';
    remove.dataset.mutation = '';
    remove.disabled = state.mutation;
    list.append(element('li', {},
      element('div', { className: 'file-information' },
        sourceLink(file.path, 1, file.path),
        element('span', { className: 'file-measure' }, `${fileMeasure(file)} · ${number(file.count)} assertions`)),
      remove));
  }
  return list;
}

function termList(items, predicates = false) {
  return element('ul', { className: 'ranked-list' }, (items ?? []).map(item =>
    element('li', {}, link(symbolLabel(item.term), 'term', { term: item.term }),
      element('span', { className: 'rank-detail' }, predicates ? `/${item.arity} · ${number(item.count)}` : number(item.count)))));
}

async function overview(_route, signal) {
  const [terms, predicates] = await Promise.all([
    api('search', { limit: 8 }, { signal }), api('predicates', { limit: 8 }, { signal }),
  ]);
  const status = state.status;
  const stats = element('dl', { className: 'statistics' });
  const rows = [
    ['Assertions', 'assertions', 'predicates'], ['Semantic terms', 'terms', 'search'],
    ['Predicate signatures', 'predicates', 'predicates'], ['Microtheories', 'microtheories', 'microtheories'],
  ];
  for (const [label, key, destination] of rows) {
    stats.append(element('div', {}, element('dt', {}, label),
      element('dd', {}, link(number(status.counts?.[key]), destination))));
  }
  const panel = element('div', {},
    heading('Knowledge overview', 'Follow a term, inspect its assertions, and trace every claim to its source.'),
    searchForm('search', '', 'Search the active knowledge base…'),
    stats, diagnosticsPanel(status, { status: true }));
  if (!status.files?.length) {
    panel.append(loadedFiles([]));
    return panel;
  }
  panel.append(element('div', { className: 'overview-columns' },
    element('section', {}, element('div', { className: 'section-heading' }, element('h2', {}, 'Indexed vocabulary'), link('All terms', 'search')),
      element('p', { className: 'muted' }, 'Semantic occurrences only; context metadata is excluded.'), termList(terms.items),
      element('div', { className: 'section-heading' }, element('h2', {}, 'Predicates'), link('All signatures', 'predicates')), termList(predicates.items, true)),
    element('section', {}, element('div', { className: 'section-heading' }, element('h2', {}, 'Loaded sources'), link('Manage sources', 'sources')), loadedFiles(status.files, { compact: true }),
      element('div', { className: 'query-invitation' }, element('h2', {}, 'Ask within a context'),
        element('p', {}, 'Facts and executable rules are scoped to one microtheory per solution. Ordinary implications remain formulas.'),
        link('Open query console', 'query', {}, 'button secondary')))));
  if (status.timing && Object.keys(status.timing).length) {
    panel.append(element('details', { className: 'timing' },
      element('summary', {}, 'Loading and cache diagnostics'),
      propertyList(Object.entries(status.timing).map(([name, value]) => ({ name, value })))));
  }
  return panel;
}

async function searchPage(route, signal) {
  const isPredicates = route.name === 'predicates';
  const q = route.params.get('q') ?? '';
  const data = await api(isPredicates ? 'predicates' : 'search', { q, offset: route.offset, limit: route.limit }, { signal });
  const panel = element('div', {},
    heading(isPredicates ? 'Predicate catalog' : 'Term search',
      isPredicates ? 'Actual semantic arities, without synthetic context arguments.' : 'Search constants and nested predicate or function heads in the active KB.'),
    searchForm(route.name, q, isPredicates ? 'Filter predicate names…' : 'Filter semantic terms…', isPredicates ? 'Search predicates' : 'Search terms'));
  if (data.items?.length) {
    const table = element('table', { className: 'data-table' },
      element('thead', {}, element('tr', {}, element('th', { scope: 'col' }, isPredicates ? 'Predicate' : 'Term'),
        isPredicates && element('th', { scope: 'col' }, 'Arity'), element('th', { scope: 'col', className: 'numeric' }, 'Assertions'))),
      element('tbody', {}, data.items.map(item => element('tr', {},
        element('td', {}, link(symbolLabel(item.term), 'term', { term: item.term }, 'term-name')),
        isPredicates && element('td', {}, item.arity), element('td', { className: 'numeric' }, number(item.count))))));
    panel.append(element('div', { className: 'table-scroll' }, table));
  } else panel.append(empty('No matching results', q ? 'Try a shorter name or clear the search.' : 'Load a source to populate the semantic indexes.',
    q ? link('Clear search', route.name, {}, 'button secondary') : link('Choose KB Sources', 'sources', {}, 'button')));
  panel.append(pagination(data, route));
  return panel;
}

async function termPage(route, signal) {
  const isMT = route.name === 'microtheory';
  const value = route.params.get(isMT ? 'mt' : 'term');
  if (!value) throw new APIError(`Choose a ${isMT ? 'microtheory' : 'term'} to browse.`, 'missing_parameter');
  const [data] = await Promise.all([
    api(isMT ? 'microtheory' : 'term', { [isMT ? 'mt' : 'term']: value, offset: route.offset, limit: route.limit }, { signal }),
    ensureMappingIds(signal).catch(error => { if (error.name === 'AbortError') throw error; }),
  ]);
  const contextKey = isMT ? data.mt ?? value : null;
  if (isMT) {
    rememberContext(contextKey, data.mtExpression);
    route.params.set('mt', contextKey);
  }
  const title = isMT ? mtName(contextKey, data.mtExpression) : symbolLabel(value);
  const panel = element('div', {},
    heading(title, isMT ? 'Assertions in this microtheory, in source order.' : 'Assertions containing this semantic term. Follow a symbol to continue exploring.',
      isMT ? link('Query this context', 'query', { mt: contextKey }, 'button secondary') : null));
  if (data.expression) panel.append(renderExpression(data.expression));
  let items = data.items ?? [];
  if (!isMT) {
    const role = route.params.get('role') ?? 'all';
    const roleFilter = selectField('Role on this page', 'role', role,
      [['all', 'All roles'], ['predicate', 'Top-level predicate'], ['argument', 'Argument'], ['nested', 'Nested predicate / function head']],
      event => updateRoute({ role: event.target.value }));
    panel.append(element('div', { className: 'role-toolbar' }, roleFilter,
      element('span', { className: 'muted' }, 'Role filters apply to this page; pagination counts all occurrences.')));
    if (role !== 'all') items = items.filter(item => assertionRoles(item.expression, value).includes(role));
  }
  panel.append(items.length
    ? assertionGroups(items, { offset: route.offset, term: isMT ? undefined : value })
    : empty('No assertions on this page', isMT ? 'This microtheory has no assertions at the current offset.' : 'Try another role or page, or load a source containing this term.'),
  pagination(data, route));
  return panel;
}

function contextForm() {
  const input = element('input', { type: 'text', name: 'mt', placeholder: 'Name or (MicrotheoryFn Argument)', required: true, list: 'context-names', 'aria-label': 'Microtheory name or S-expression' });
  return element('form', { className: 'search-form', onsubmit: event => {
    event.preventDefault();
    const name = normalizeContextInput(input.value);
    if (name) location.hash = routeHref('microtheory', { mt: name });
  } }, input, contextSuggestions(), element('button', { type: 'submit', className: 'button' }, 'Open microtheory'));
}

function contextSuggestions() {
  return element('datalist', { id: 'context-names' },
    [...state.contexts.keys()].filter(mt => !mt.startsWith('mt:')).sort().map(mt => element('option', { value: symbolLabel(mt) })));
}

function microtheoriesPage() {
  return element('div', {}, heading('Microtheories', 'Context is assertion metadata, not an extra argument. No context inheritance is assumed.'),
    contextForm(),
    state.contexts.size
      ? element('section', {}, element('h2', {}, 'Recently encountered contexts'),
        element('ul', { className: 'context-list' }, [...state.contexts].sort(([a], [b]) => a.localeCompare(b)).map(([mt, expression]) => element('li', {}, mtLink(mt, expression)))))
      : empty('Open a context by name', 'Or follow a microtheory link above any group of assertions. These pages include its full paginated assertion list.'),
    element('p', { className: 'muted' }, `${number(state.status?.counts?.microtheories)} microtheories are currently indexed.`));
}

async function assertionPage(route, signal) {
  const id = route.params.get('id');
  if (!id) throw new APIError('An assertion ID is required.', 'missing_parameter');
  const [assertion] = await Promise.all([
    api('assertion', { id }, { signal }),
    ensureMappingIds(signal).catch(error => { if (error.name === 'AbortError') throw error; }),
  ]);
  const mapping = splitMappingRows(mappingRowsOf(assertion));
  return element('div', {},
    heading('Assertion detail', id, copyButton('Copy expression', expressionText(assertion.expression))),
    assertionGroups([assertion]),
    element('section', { className: 'provenance-section' }, element('h2', {}, 'Source provenance'),
      propertyList([
        { name: 'Assertion ID', value: assertion.id },
        { name: 'Original variable names', value: assertion.names ?? [] },
      ]),
      element('p', {}, 'Original source: ', sourceLink(assertion.source, assertion.line)),
      mapping.ids.length ? element('p', {}, 'Applied mapping IDs, in order: ',
        mapping.ids.flatMap((row, index) => [index ? ', ' : '', mappingLink(row)])) : element('p', { className: 'muted' }, 'No mapping-table rows applied.'),
      mapping.markers.length > 0 && element('p', { className: 'muted' }, `${number(mapping.markers.length)} mapping diagnostic markers are shown with the assertion diagnostics above; they are not mapping-table IDs.`)));
}

async function sourcePage(route, signal) {
  const path = canonicalPath(route.params.get('path'));
  if (!path || !state.knownSources.has(path)) throw new APIError('This path is not in the authorized KB source catalog.', 'source_not_authorized');
  const line = positiveInteger(route.params.get('line'), 1, Number.MAX_SAFE_INTEGER, 1);
  const data = await api('source', { path, line }, { signal });
  const start = positiveInteger(data.start, 1, Number.MAX_SAFE_INTEGER, 1);
  const target = positiveInteger(data.line, line, Number.MAX_SAFE_INTEGER, 1);
  const column = positiveInteger(route.params.get('column'), undefined, Number.MAX_SAFE_INTEGER, 1);
  const lines = element('ol', { className: 'source-lines', start });
  (data.lines ?? []).forEach((text, index) => {
    const current = start + index;
    lines.append(element('li', { className: current === target ? 'highlighted-line' : '', 'aria-current': current === target ? 'location' : null },
      link(String(current), 'source', { path, line: current }, 'line-number'),
      element('code', {}, text || ' ')));
  });
  return element('div', {}, heading(path, `Read-only source excerpt · line ${target}${column ? `, column ${column}` : ''}`),
    element('p', { className: 'muted' }, 'Source files cannot be edited from the browser. Use the offline compiler’s explicit editor repair mode.'),
    lines,
    element('nav', { className: 'pagination', 'aria-label': 'Source excerpt navigation' },
      link('Earlier lines', 'source', { path, line: Math.max(1, start - 10) }, 'button secondary'),
      link('Later lines', 'source', { path, line: start + (data.lines?.length || 1) }, 'button secondary')));
}

function setMutation(value) {
  state.mutation = value;
  for (const control of document.querySelectorAll('[data-mutation]')) control.disabled = value;
}

async function mutateSource(path, body, successMessage) {
  if (state.mutation) return false;
  setMutation(true);
  showNotice('Updating the active knowledge base. The previous generation remains available until this succeeds.');
  try {
    const status = await api(path, {}, { method: 'POST', body });
    setStatus(status);
    if (state.selection) state.selection.reset((status.files ?? []).map(file => file.path), status.generation);
    showNotice(successMessage);
    return true;
  } catch (error) {
    if (error.status === 409) {
      try { setStatus(await api('status')); } catch { /* Keep the last confirmed generation if refresh also fails. */ }
    }
    showNotice(requestErrorDetails(error, { preserveSelection: true }), error.code !== 'busy');
    if (error.code === 'busy') $('#notice').className = 'notice busy-notice';
    return false;
  } finally {
    setMutation(false);
  }
}

async function unloadSource(file) {
  if (state.mutation) return;
  const success = await mutateSource('kb/unload', { path: file.path, generation: state.status.generation },
    `Unloaded ${file.path} from memory. Source files and caches are unchanged.`);
  if (success) await renderRoute();
}

async function sourcesPage(_route, signal) {
  const [catalog, status] = await Promise.all([
    api('kb/catalog', {}, { signal }), api('status', {}, { signal }),
  ]);
  setStatus(status);
  rememberCatalog(catalog);
  if (!state.selection || !state.selection.dirty) {
    state.selection = new SourceSelection(catalog.nodes, catalog.active, catalog.generation);
  } else {
    const previous = state.selection;
    const updated = new SourceSelection(catalog.nodes, [...previous.active], previous.generation);
    for (const path of updated.files) {
      if (updated.selected.has(path) !== previous.selected.has(path)) updated.setSelected(path, previous.selected.has(path));
    }
    state.selection = updated;
  }
  const model = state.selection;
  const checkboxes = new Map();
  const counts = new Map();
  const draftCount = element('span', { className: 'draft-count', 'aria-live': 'polite' });
  const statusNote = element('p', { className: 'muted draft-note' });
  const updateDraft = () => {
    draftCount.textContent = `${number(model.selected.size)} of ${number(model.files.length)} files selected${model.dirty ? ' · unsaved selection' : ''}`;
    statusNote.textContent = `Selection generation ${model.generation}. ${model.dirty ? 'Load applies this exact file list; unselected descendants stay excluded.' : 'Select files to replace the active source set. Loading zero files is allowed.'}`;
  };
  const updateControls = paths => {
    for (const path of paths) {
      const value = model.state(path);
      const checkbox = checkboxes.get(path);
      if (checkbox) {
        checkbox.checked = value.checked;
        checkbox.indeterminate = value.indeterminate;
        checkbox.disabled = state.mutation || value.disabled;
        checkbox.setAttribute('aria-checked', value.indeterminate ? 'mixed' : String(value.checked));
      }
      if (counts.has(path)) counts.get(path).textContent = `${number(value.selected)}/${number(value.total)}`;
    }
    updateDraft();
  };
  let nextID = 0;
  const buildNode = path => {
    const record = model.records.get(path);
    const id = `source-node-${nextID++}`;
    const checkbox = element('input', { type: 'checkbox', id, 'data-mutation': '',
      'aria-label': `Select ${record.type === 'directory' ? 'all supported files in ' : ''}${path}`,
      onchange: () => updateControls(model.setSelected(path, !model.state(path).checked)),
    });
    checkboxes.set(path, checkbox);
    const label = element('label', { htmlFor: id }, record.name || path.split('/').at(-1));
    const item = element('li', { className: `source-node ${record.type}` });
    const row = element('div', { className: 'source-row' });
    if (record.type === 'directory') {
      const expanded = state.expanded.has(path);
      const children = element('ul', { id: `${id}-children`, hidden: !expanded },
        record.children.map(buildNode));
      const expand = button(expanded ? '−' : '+', () => {
        const open = children.hidden;
        children.hidden = !open;
        expand.textContent = open ? '−' : '+';
        expand.setAttribute('aria-expanded', String(open));
        expand.setAttribute('aria-label', `${open ? 'Collapse' : 'Expand'} ${path}`);
        if (open) state.expanded.add(path);
        else state.expanded.delete(path);
      }, 'expand-button');
      expand.setAttribute('aria-expanded', String(expanded));
      expand.setAttribute('aria-controls', children.id);
      expand.setAttribute('aria-label', `${expanded ? 'Collapse' : 'Expand'} ${path}`);
      const count = element('span', { className: 'directory-count' });
      counts.set(path, count);
      row.append(expand, checkbox, label, count);
      item.append(row, children);
    } else {
      row.append(element('span', { className: 'tree-spacer', 'aria-hidden': 'true' }, '·'),
        checkbox, label, element('span', { className: 'file-measure' }, fileMeasure(record)));
      item.append(row);
    }
    return item;
  };
  const tree = element('ul', { className: 'source-tree', 'aria-label': 'Supported original sources under KBs' }, model.roots.map(buildNode));
  updateControls(model.records.keys());
  const load = button('Load selected sources', async () => {
    const successful = await mutateSource('kb/load',
      { files: model.selectedFiles(), generation: model.generation },
      'The selected sources are now active.');
    if (successful) await renderRoute();
    else updateControls(model.records.keys());
  });
  load.dataset.mutation = '';
  load.disabled = state.mutation;
  const reset = button('Reset selection', () => {
    model.reset((state.status.files ?? []).map(file => file.path), state.status.generation);
    updateControls(model.records.keys());
  }, 'button secondary');
  reset.dataset.mutation = '';
  reset.disabled = state.mutation;
  return element('div', {},
    heading('KB Sources', 'Choose original sources from the repository’s KBs directory. Loading and unloading never deletes files.'),
    element('section', { className: 'source-selection' }, element('h2', {}, 'Source selection'),
      element('div', { className: 'source-actions' }, load, reset, draftCount), statusNote,
      model.files.length ? tree : empty('No supported sources found', 'Place the original KIF, KRF, or MeTTa corpus under KBs. Generated companions are intentionally hidden.')),
    element('section', { className: 'loaded-section' }, element('h2', {}, 'Currently loaded'),
      loadedFiles(state.status.files)));
}

function selectField(label, name, value, options, onChange) {
  const select = element('select', { name, onchange: onChange },
    options.map(([optionValue, text]) => element('option', { value: optionValue, selected: optionValue === value }, text)));
  return element('label', { className: 'field' }, element('span', {}, label), select);
}

function inputField(label, input) {
  return element('label', { className: 'field' }, element('span', {}, label), input);
}

function queryResults(data) {
  const solutions = data.solutions ?? [];
  if (!solutions.length) return empty('No solutions', 'No matching proof was found within the selected context and limits. Ordinary implications are not executable rules.');
  const results = element('div', { className: 'query-solutions' },
    element('h2', {}, `${number(solutions.length)} ${solutions.length === 1 ? 'solution' : 'solutions'}`),
    data.truncated && element('p', { className: 'muted' }, 'The result limit was reached. Narrow your query or increase the limit.'));
  solutions.forEach((solution, index) => {
    const bindings = solution.bindings ?? [];
    const body = element('section', { className: 'solution' },
      element('h3', {}, `Solution ${index + 1}`, element('span', { className: 'solution-context' }, ' in ', mtLink(solution.mt, solution.mtExpression))));
    if (bindings.length) {
      body.append(element('dl', { className: 'bindings' }, bindings.flatMap(binding => [
        element('dt', {}, binding.name), element('dd', {}, renderExpression(binding.value)),
      ])));
    } else body.append(element('p', { className: 'muted' }, 'Ground query succeeded; no variable bindings.'));
    const proof = solution.proof ?? [];
    body.append(element('details', { className: 'proof', open: true },
      element('summary', {}, `${proof.length} successful proof ${proof.length === 1 ? 'step' : 'steps'}`),
      element('ol', {}, proof.map(step => element('li', {},
        element('div', { className: 'proof-heading' },
          element('span', { className: 'badge' }, step.kind === 'rule' ? 'Rule' : 'Fact'),
          link(step.id, 'assertion', { id: step.id }, 'assertion-id'),
          Number.isFinite(step.before) && Number.isFinite(step.after)
            ? element('span', { className: 'muted' }, `Bound slots ${step.before} → ${step.after}`) : null),
        renderExpression(step.expression))))));
    results.append(body);
  });
  return results;
}

async function queryPage(route, signal) {
  const values = { ...state.query };
  for (const key of ['query', 'mt', 'limit', 'timeout']) {
    if (route.params.has(key)) values[key] = route.params.get(key);
  }
  if (values.mt?.startsWith('mt:') && !state.contexts.get(values.mt)) {
    const context = await api('microtheory', { mt: values.mt, limit: 1 }, { signal });
    rememberContext(values.mt, context.mtExpression ?? context.items?.[0]?.mtExpression);
  }
  const initialContext = { key: values.mt ?? '', display: contextInputText(values.mt, state.contexts.get(values.mt)) };
  let contextEdited = false;
  const query = element('textarea', {
    name: 'query', rows: 5, required: true, value: values.query,
    spellcheck: false, placeholder: '(isa ?X Dog)', 'aria-describedby': 'query-help',
  });
  const mt = element('input', { name: 'mt', type: 'text', value: initialContext.display, list: 'context-names',
    placeholder: values.mt?.startsWith('mt:') && !initialContext.display ? 'Selected compound microtheory' : 'All contexts, independently',
    'aria-describedby': 'context-input-help' });
  const limit = element('input', { name: 'limit', type: 'number', min: 1, max: 100, step: 1, required: true, value: positiveInteger(values.limit, 50, 100, 1) });
  const timeout = element('input', { name: 'timeout', type: 'number', min: 1, max: 30, step: 1, required: true, value: positiveInteger(values.timeout, 3, 30, 1) });
  const results = element('div', { className: 'query-results', 'aria-live': 'polite' });
  const run = element('button', { type: 'submit', className: 'button' }, 'Run query');
  const cancel = button('Cancel query', () => state.queryController?.abort(), 'button secondary');
  cancel.hidden = true;
  const selectedContext = element('div', { className: 'selected-context' });
  if (values.mt?.startsWith('mt:')) selectedContext.append(mtLink(values.mt));
  const currentContext = () => contextRequestValue(initialContext, mt.value, contextEdited);
  const saveDraft = () => {
    state.query = { query: query.value, mt: currentContext(), limit: limit.value, timeout: timeout.value };
  };
  mt.addEventListener('input', () => { contextEdited = true; selectedContext.replaceChildren(); });
  const clearContext = button('Clear context', () => {
    contextEdited = true;
    mt.value = '';
    selectedContext.replaceChildren();
    saveDraft();
    mt.focus();
  }, 'text-button');
  for (const input of [query, mt, limit, timeout]) input.addEventListener('input', saveDraft);
  const form = element('form', { className: 'query-form', onsubmit: async event => {
    event.preventDefault();
    if (state.queryController || !query.value.trim()) return;
    saveDraft();
    const body = {
      query: query.value.trim(), mt: currentContext(),
      limit: positiveInteger(limit.value, 50, 100, 1), timeout: positiveInteger(timeout.value, 3, 30, 1),
    };
    updateRoute({ ...body }, { replace: true });
    const controller = new AbortController();
    state.queryController = controller;
    run.disabled = true;
    cancel.hidden = false;
    results.setAttribute('aria-busy', 'true');
    results.replaceChildren(element('p', { className: 'loading', role: 'status' }, 'Searching for bounded, context-isolated proofs…'));
    try {
      const data = await api('query', {}, { method: 'POST', body, signal: controller.signal });
      if (!controller.signal.aborted) results.replaceChildren(queryResults(data));
    } catch (error) {
      results.replaceChildren(error.name === 'AbortError'
        ? element('p', { className: 'muted' }, 'Query cancelled. Server-side execution remains bounded by the time limit.')
        : errorPanel(error, () => form.requestSubmit()));
    } finally {
      if (state.queryController === controller) state.queryController = null;
      run.disabled = false;
      cancel.hidden = true;
      results.setAttribute('aria-busy', 'false');
    }
  } },
  inputField('S-expression query', query),
  element('p', { className: 'muted', id: 'query-help' }, 'Only registered KB predicates and supported logical forms are dispatched. A blank context runs whole-query solutions independently by microtheory.'),
  element('div', { className: 'query-options' },
    inputField('Microtheory (optional)', mt), contextSuggestions(),
    inputField('Maximum results', limit), inputField('Time limit (seconds)', timeout)),
  element('div', { className: 'context-input-help', id: 'context-input-help' },
    element('span', { className: 'muted' }, 'Enter an atomic name or a source S-expression such as (MicrotheoryFn Argument).'),
    clearContext),
  selectedContext,
  element('div', { className: 'form-actions' }, run, cancel));
  return element('div', {}, heading('Query console', 'Ask the active knowledge base and inspect the successful proof, not failed branches.'),
    form, results,
    element('details', { className: 'query-help' },
      element('summary', {}, 'Query semantics'),
      element('p', {}, 'Facts use their own microtheory. Executable <=== rules run ordered bodies within that same context. <== and ordinary implication are assertion data, not commands.'),
      element('p', {}, 'No filesystem, process, administrative, or MeTTa execution is available through this console. Bound-slot counts are diagnostics, not proof-pruning conditions.')));
}

function copyButton(label, value) {
  return button(label, async event => {
    const control = event.currentTarget;
    try {
      if (navigator.clipboard?.writeText) await navigator.clipboard.writeText(value);
      else {
        const input = element('textarea', { className: 'clipboard-input', value, 'aria-label': 'Text to copy' });
        document.body.append(input);
        input.select();
        let copied;
        try { copied = document.execCommand('copy'); }
        finally { input.remove(); control.focus(); }
        if (!copied) throw new Error('Clipboard is not available');
      }
      control.textContent = 'Copied';
      setTimeout(() => { if (control.isConnected) control.textContent = label; }, 1600);
    } catch {
      showNotice('Clipboard access was denied. Select the visible text and copy it with your keyboard.', true);
    }
  }, 'copy-button');
}

function mappingCell(label, content) {
  return element('td', { 'data-label': label }, content);
}

function mappedSymbol(text, term) {
  return term ? link(text, 'term', { term }) : element('span', {}, text);
}

async function mappingsPage(route, signal) {
  const params = route.params;
  const selectedRow = params.get('row');
  const query = params.get('q') ?? '';
  const filters = ['category', 'equivalence', 'confidence', 'basis'];
  const request = { q: selectedRow || query, offset: selectedRow ? 0 : route.offset, limit: selectedRow ? 100 : route.limit };
  for (const field of filters) request[field] = selectedRow ? '' : params.get(field);
  let data = await api('mappings', request, { signal });
  if (selectedRow && !data.items?.some(row => row.id === selectedRow)) {
    let offset = 0;
    let total;
    do {
      const page = await api('mappings', { offset, limit: 100 }, { signal });
      const match = page.items?.find(row => row.id === selectedRow);
      if (match) { data = { items: [match], total: 1, offset: 0, limit: 1 }; break; }
      const size = page.items?.length || 0;
      if (!size) break;
      offset += size;
      total = page.total;
    } while (offset < total);
  }
  if (selectedRow) data = { ...data, items: (data.items ?? []).filter(row => row.id === selectedRow) };
  const input = element('input', { type: 'search', name: 'q', value: query, placeholder: 'Symbols, conversion, notes, or provenance', 'aria-label': 'Search mapping table' });
  const search = element('form', { className: 'mapping-filters', role: 'search', onsubmit: event => {
    event.preventDefault();
    const values = Object.fromEntries(new FormData(search));
    location.hash = routeHref('mappings', values);
  } }, element('div', { className: 'search-form' }, input, element('button', { type: 'submit', className: 'button' }, 'Search mappings')));
  const selects = element('div', { className: 'filter-grid' });
  const options = {
    category: [['', 'All categories'], ...['class', 'predicate', 'transform', 'logical', 'operator'].map(item => [item, item])],
    equivalence: [['', 'All relationships'], ['exact', 'Exact'], ['close', 'Close / approximate'], ['broader', 'Target broader'], ['narrower', 'Target narrower'], ['transform', 'Transform']],
    confidence: [['', 'All confidence levels'], ['high', 'High'], ['medium', 'Medium'], ['low', 'Low']],
    basis: [['', 'Evidence and guesses'], ['evidence', 'Evidence'], ['guess', 'Curated guess']],
  };
  const labels = { category: 'Category', equivalence: 'Relationship', confidence: 'Confidence', basis: 'Basis' };
  for (const field of filters) {
    selects.append(selectField(labels[field], field, params.get(field) ?? '', options[field], () => search.requestSubmit()));
  }
  search.append(selects);
  const panel = element('div', {},
    heading('SUMO → CycL mappings', 'The Markdown table is the compiler’s sole mapping source. Search conversion rules and their review provenance.'),
    element('p', { className: 'mapping-policy' },
      element('strong', {}, 'Curated guesses are proposals, not authoritative ontology equivalences. '),
      'KIF applies the eligible rows. KRF and MeTTa never receive SUMO mappings. “Broader” and “narrower” describe the CycL target.'),
    search,
    selectedRow && element('div', { className: 'row-focus' }, `Mapping row: ${selectedRow}`, link('Show all mappings', 'mappings')));
  if (data.items?.length) {
    const table = element('table', { className: 'mapping-table data-table' },
      element('caption', { className: 'visually-hidden' }, 'Executable SUMO-to-CycL conversion policy'),
      element('thead', {}, element('tr', {}, ['SUMO → CycL', 'Conversion', 'Assessment', 'Notes / provenance'].map(label => element('th', { scope: 'col' }, label)))),
      element('tbody', {}, data.items.map(row => {
        const assessment = row.equivalence === 'close' ? 'Close / approximate' : row.equivalence === 'broader' ? 'Target broader' : row.equivalence === 'narrower' ? 'Target narrower' : row.equivalence;
        return element('tr', { id: `mapping-${row.id}`, className: row.id === selectedRow ? 'selected-mapping' : '' },
          mappingCell('SUMO → CycL', [
            link(row.id, 'mappings', { row: row.id }, 'mapping-id'),
            element('div', { className: 'mapped-symbol' }, mappedSymbol(row.sumo, row.sourceTerm), copyButton('Copy SUMO', row.sumo)),
            element('span', { className: 'conversion-arrow', 'aria-label': 'maps to' }, '→'),
            element('div', { className: 'mapped-symbol' }, mappedSymbol(row.cycl, row.targetTerm), copyButton('Copy CycL', row.cycl)),
          ]),
          mappingCell('Conversion', element('code', { className: 'conversion-code' }, row.conversion)),
          mappingCell('Assessment', [
            element('span', { className: `badge ${row.basis === 'guess' ? 'guess' : 'evidence'}` }, row.basis === 'guess' ? 'Curated guess' : 'Evidence'),
            element('span', { className: 'assessment-line' }, assessment),
            element('span', { className: 'muted assessment-line' }, `${row.confidence} confidence · ${row.category}`),
          ]),
          mappingCell('Notes / provenance', element('p', {}, row.notes)));
      })));
    panel.append(element('div', { className: 'mapping-table-wrapper' }, table));
  } else panel.append(empty('No matching mapping rows', 'Clear a filter or search a SUMO symbol, CycL symbol, or note.',
    link('Clear filters', 'mappings', {}, 'button secondary')));
  if (!selectedRow) panel.append(pagination(data, route));
  return panel;
}

const pages = {
  overview, search: searchPage, predicates: searchPage, term: termPage,
  microtheory: termPage, microtheories: microtheoriesPage,
  assertion: assertionPage, source: sourcePage, sources: sourcesPage,
  query: queryPage, mappings: mappingsPage,
};

async function renderRoute() {
  const view = ++state.view;
  state.routeController?.abort();
  state.queryController?.abort();
  state.queryController = null;
  const controller = new AbortController();
  state.routeController = controller;
  const route = parseRoute(location.hash);
  const navRoute = { term: 'search', assertion: 'search', source: 'sources', microtheory: 'microtheories' }[route.name] ?? route.name;
  for (const anchor of document.querySelectorAll('#navigation a')) {
    if (anchor.dataset.route === navRoute) anchor.setAttribute('aria-current', 'page');
    else anchor.removeAttribute('aria-current');
  }
  content.setAttribute('aria-busy', 'true');
  content.replaceChildren(element('div', { className: 'loading', role: 'status' }, 'Loading…'));
  try {
    await ensureContext(controller.signal);
    const page = pages[route.name];
    const result = page
      ? await page(route, controller.signal)
      : empty('Page not found', 'This browser route is not recognized.', link('Return to overview', 'overview', {}, 'button'));
    if (view !== state.view) return;
    content.replaceChildren(result);
    document.title = `${content.querySelector('h1')?.textContent ?? 'Browse'} · ${APP_NAME}`;
  } catch (error) {
    if (view !== state.view || error.name === 'AbortError') return;
    content.replaceChildren(errorPanel(error));
    document.title = `Request error · ${APP_NAME}`;
  } finally {
    if (view === state.view) {
      content.setAttribute('aria-busy', 'false');
      content.focus({ preventScroll: true });
    }
  }
}

function startLiveReload() {
  const tracker = new VersionTracker();
  let timer;
  let controller;
  let disposed = false;
  const target = $('#live-state');
  const schedule = delay => {
    clearTimeout(timer);
    if (!document.hidden && !disposed) timer = setTimeout(poll, delay);
  };
  const poll = async () => {
    if (document.hidden || controller || disposed) return;
    const requestController = new AbortController();
    controller = requestController;
    const timeout = setTimeout(() => requestController.abort(), 5000);
    try {
      const result = await api('version', {}, { signal: requestController.signal });
      if (tracker.observe(result.version)) {
        location.reload();
        return;
      }
      target.textContent = 'Interface live refresh enabled';
      target.title = 'Web assets and mappings refresh automatically. Prolog changes require an explicit server restart.';
    } catch (error) {
      if (!document.hidden) target.textContent = 'Live refresh reconnecting…';
    } finally {
      clearTimeout(timeout);
      controller = null;
      schedule(4000);
    }
  };
  document.addEventListener('visibilitychange', () => {
    clearTimeout(timer);
    if (document.hidden) controller?.abort();
    else schedule(0);
  });
  window.addEventListener('pagehide', () => { disposed = true; clearTimeout(timer); controller?.abort(); });
  window.addEventListener('pageshow', event => { if (event.persisted) { disposed = false; schedule(0); } });
  schedule(0);
}

window.addEventListener('hashchange', renderRoute);
$('.skip-link').addEventListener('click', event => { event.preventDefault(); content.focus(); });
renderRoute();
startLiveReload();
