import { assertionRoles, contextExpression, contextInputText, contextLabel, expressionText, groupAssertions, renderExpression, routeHref, symbolLabel } from './render.js';
import { APIError, SourceSelection, VersionTracker, apiErrorSummary, canonicalPath, compilationIssues, contextRequestValue, fileMeasure, mergeStartupSources, normalizeContextInput, pageRange, parseRoute, positiveInteger, requestJSON } from './model.js';
import { collectDiagnostics, diagnosticCounts, diagnosticMessages, diagnosticProperty, mappingRowsOf, splitMappingRows } from './diagnostics.js';
import { DEFAULT_SETTINGS, MAXIMUMS, loadSettings, saveSettings } from './settings.js';
import { apiPath } from './paths.js';

const $ = selector => document.querySelector(selector);
const content = $('#content');
const APP_NAME = 'powder';
const number = value => new Intl.NumberFormat().format(Number(value) || 0);
const state = {
  status: null, catalog: null, selection: null, expanded: new Set(['KBs']),
  knownSources: new Set(), knownMappings: null, contexts: new Map(),
  mutation: false, codeReloading: false, sourceTasks: new Map(), refreshSources: null,
  routeController: null, queryController: null, view: 0,
  settings: { ...DEFAULT_SETTINGS },
  query: { query: '', mt: '', limit: DEFAULT_SETTINGS.queryLimit, timeout: 3 },
  refreshQuestions: null,
  queryJobId: null,
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
  return requestJSON(`${apiPath(path)}${query.size ? `?${query}` : ''}`, options);
}

async function localAdmin(path, body) {
  const { token } = await api('prolog/access');
  return api(path, {}, { method: 'POST', body, headers: { 'X-Powder-Local-Token': token } });
}

async function awaitTask(accepted, { signal, onUpdate, onPollError } = {}) {
  if (!accepted?.accepted) return accepted;
  const id = accepted.jobId;
  const abort = () => { localAdmin('tasks/cancel', { id }).catch(error => showNotice(`Cancellation could not be confirmed: ${error.message}`, true)); };
  if (signal?.aborted) { abort(); throw new DOMException('Cancelled', 'AbortError'); }
  signal?.addEventListener('abort', abort, { once: true });
  try {
    for (;;) {
      let task;
      try { task = await api('tasks/detail', { id }, { signal }); }
      catch (error) {
        if (!onPollError || (error.code !== 'connection_failed' && !(error.status >= 500))) throw error;
        onPollError(error);
        await new Promise(resolve => setTimeout(resolve, 1000));
        continue;
      }
      onUpdate?.(task);
      if (task.state === 'succeeded') return task.result;
      if (['failed', 'cancelled'].includes(task.state)) {
        if (task.result?.mode === 'prolog') {
          throw new APIError(task.result.exception?.message ?? 'Prolog task failed.', 'prolog_exception', 422, { execution: task.result });
        }
        throw new APIError(task.error?.message ?? `Task ${task.state}.`, `task_${task.state}`, 422, task.error);
      }
      await new Promise(resolve => setTimeout(resolve, 250));
      if (signal?.aborted) throw new DOMException('Cancelled', 'AbortError');
    }
  } finally {
    signal?.removeEventListener('abort', abort);
  }
}

function showNotice(message, isError = false) {
  const target = $('#notice');
  delete target.dataset.taskId;
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
    else if (context?.contributions?.length > 1 && ['source_file', 'source_line', 'kb_names'].includes(property.name)) {
      value = element('span', { className: 'muted' }, 'See the associated source contributions below.');
    }
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
  if (assertion.sameForm?.length) card.append(element('div', { className: 'same-form-links' },
    'Same form in other microtheories: ',
    assertion.sameForm.flatMap((id, index) => [index ? ', ' : '', link(id, 'assertion', { id })])));
  if (assertion.contributions?.length) card.append(element('details', { className: 'source-contributions' },
    element('summary', {}, `${number(assertion.contributions.length)} source ${assertion.contributions.length === 1 ? 'contribution' : 'contributions'}`),
    assertion.contributions.map(item => element('section', {},
      element('p', {}, sourceLink(item.source, item.line), ' · ', element('code', {}, item.sourceId)),
      element('p', {}, mtLink(item.mt, item.mtExpression)),
      propertyList(item.properties)))));
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
  const limit = positiveInteger(data.limit, route.limit, MAXIMUMS.pageSize, 1);
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
  if (state.status && status.generation < state.status.generation) return false;
  if (state.status && status.generation !== state.status.generation) state.contexts.clear();
  state.status = status;
  if (state.selection && status.generation > state.selection.generation) {
    const preserveDraft = state.selection.dirty || [...state.sourceTasks.values()].some(task => task.path === 'kb/load');
    state.selection.updateActive((status.files ?? []).map(file => file.path), status.generation, preserveDraft);
  }
  for (const file of status.files ?? []) {
    const path = canonicalPath(file.path);
    if (path) state.knownSources.add(path);
  }
  $('#generation-state').textContent = `Generation ${status.generation} · ${number(status.counts?.assertions)} assertions`;
  $('#loaded-count').textContent = `${number(status.files?.length)} loaded ${status.files?.length === 1 ? 'source' : 'sources'}`;
  return true;
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
    const page = await api('mappings', { offset, limit: state.settings.pageSize }, { signal });
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
  if (status.startup) panel.append(element('section', { className: 'startup-status', role: 'status' },
    element('h2', {}, `Startup load: ${status.startup.state}`),
    status.startup.error?.message && element('p', {}, status.startup.error.message),
    link('Inspect requested tasks and startup settings', 'settings')));
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

async function microtheoryDirectory(route, signal) {
  try {
    const data = await api('microtheories', {}, { signal });
    if (!Array.isArray(data.items) || data.items.length !== data.total) {
      throw new APIError('The server did not return the complete microtheory list.', 'incomplete_context_list');
    }
    const collator = new Intl.Collator('en', { numeric: true, sensitivity: 'base' });
    const contexts = data.items.map(item => ({ ...item, label: contextLabel(item.mt, item.mtExpression) }))
      .sort((a, b) => collator.compare(a.label, b.label) || (a.mt < b.mt ? -1 : a.mt > b.mt ? 1 : 0));
    for (const item of contexts) rememberContext(item.mt, item.mtExpression);
    return element('section', { className: 'microtheory-directory', 'aria-label': 'All indexed microtheories', 'data-generation': data.generation },
      element('h2', {}, `All indexed microtheories (${number(data.total)})`),
      contexts.length ? element('ul', { className: 'context-list' }, contexts.map(item => {
        const reference = mtLink(item.mt, item.mtExpression);
        const selected = item.mt === route.params.get('mt');
        if (selected) reference.querySelector('.mt-link').setAttribute('aria-current', 'page');
        return element('li', { className: selected ? 'selected-context' : '', 'data-mt': item.mt }, reference,
          element('span', { className: 'context-count' }, `${number(item.count)} assertions`));
      })) : empty('No microtheories loaded', 'Load KB Sources to populate the context list.',
        link('Choose KB Sources', 'sources', {}, 'button secondary')));
  } catch (error) {
    if (error.name === 'AbortError') throw error;
    return element('section', { className: 'microtheory-directory', 'aria-label': 'All indexed microtheories' },
      element('h2', {}, 'All indexed microtheories'), errorPanel(error));
  }
}

async function microtheoriesPage(route, signal) {
  const directory = await microtheoryDirectory(route, signal);
  return element('div', {}, heading('Microtheories', 'Choose any indexed context below. No context inheritance is assumed.'),
    contextForm(), directory);
}

async function microtheoryPage(route, signal) {
  const [directory, detail] = await Promise.all([
    microtheoryDirectory(route, signal),
    termPage(route, signal).catch(error => {
      if (error.name === 'AbortError') throw error;
      return element('div', {}, heading('Microtheories', 'Choose another context below.'), errorPanel(error));
    }),
  ]);
  const before = detail.children[1] ?? null;
  detail.insertBefore(contextForm(), before);
  detail.insertBefore(directory, before);
  return detail;
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
  for (const control of document.querySelectorAll('[data-mutation]')) {
    control.disabled = value || control.dataset.mutationDisabled === 'true';
  }
}

async function refreshPublishedView() {
  if (state.refreshSources) state.refreshSources();
  else if (state.refreshQuestions) await state.refreshQuestions();
  else if (parseRoute(location.hash).name !== 'settings') await renderRoute();
}

function sourceTaskNotice(id, message, isError = false) {
  showNotice(element('div', {}, message, element('p', {}, `Loader task ${id}. `,
    link('View task in Tasks', 'settings', { task: id }))), isError);
  $('#notice').dataset.taskId = id;
}

async function sourceUpdateError(error, id) {
  let refreshError;
  if (error.status === 409 || error.code === 'stale_generation') {
    try { setStatus(await api('status')); await refreshPublishedView(); }
    catch (failure) { refreshError = failure; }
  }
  const details = requestErrorDetails(error, { preserveSelection: true });
  if (refreshError) {
    details.append(element('p', { className: 'status-refresh-error' },
      `Refreshing the active KB after this failure also failed: ${apiErrorSummary(refreshError)} The last confirmed status is shown. Reopen KB Sources to refresh it before submitting another change.`));
  }
  if (id) sourceTaskNotice(id, details, error.code !== 'busy');
  else showNotice(details, error.code !== 'busy');
  if (error.code === 'busy') $('#notice').className = 'notice busy-notice';
}

async function trackSourceTask(accepted, path, successMessage) {
  const id = accepted.jobId;
  state.sourceTasks.set(id, { path });
  const updateNotice = message => {
    if ($('#notice').dataset.taskId === id && !$('#notice').hidden) sourceTaskNotice(id, message);
  };
  try {
    const status = await awaitTask(accepted, {
      onUpdate: task => {
        if (!['queued', 'running'].includes(task.state)) return;
        const progress = task.progress ?? {};
        const source = progress.currentPath || progress.source;
        updateNotice(`Loader task ${task.state}: ${progress.phase ?? task.label}${source ? ` — ${source}` : ''}. The previous KB remains active until publication succeeds. You can keep editing your draft or leave this page.`);
      },
      onPollError: () => updateNotice('Task tracking is reconnecting. The accepted job is still tracked in Tasks; do not resubmit it.'),
    });
    const current = setStatus(status);
    sourceTaskNotice(id, current ? successMessage
      : `Published generation ${status.generation}. Generation ${state.status.generation} is now active.`);
    if (current) await refreshPublishedView();
  } catch (error) {
    await sourceUpdateError(error, id);
  } finally {
    state.sourceTasks.delete(id);
  }
}

async function mutateSource(path, body, successMessage) {
  if (state.mutation) return false;
  setMutation(true);
  showNotice('Submitting the source request. The active KB and your draft stay unchanged until publication succeeds.');
  try {
    const accepted = await api(path, {}, { method: 'POST', body });
    if (accepted?.accepted) {
      sourceTaskNotice(accepted.jobId, 'Source request queued. The active KB and your draft are unchanged until publication. You can keep editing or leave this page.');
      void trackSourceTask(accepted, path, successMessage);
    } else {
      setStatus(accepted);
      showNotice(successMessage);
      await refreshPublishedView();
    }
    return true;
  } catch (error) {
    await sourceUpdateError(error);
    return false;
  } finally {
    setMutation(false);
  }
}

async function unloadSource(file) {
  if (state.mutation) return;
  await mutateSource('kb/unload', { path: file.path, generation: state.status.generation },
    `Unloaded ${file.path} from memory. Source files and caches are unchanged.`);
}

async function sourcesPage(_route, signal) {
  const [catalog, status] = await Promise.all([
    api('kb/catalog', {}, { signal }), api('status', {}, { signal }),
  ]);
  setStatus(status);
  rememberCatalog(catalog);
  if (!state.selection || !state.selection.dirty) {
    state.selection = new SourceSelection(catalog.nodes, (state.status.files ?? []).map(file => file.path), state.status.generation);
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
    statusNote.textContent = `Selection generation ${model.generation}. Queue submits this exact file list; unselected descendants stay excluded. Changes remain a draft until the task publishes. Loading zero files is allowed.`;
  };
  const updateControls = paths => {
    for (const path of paths) {
      const value = model.state(path);
      const checkbox = checkboxes.get(path);
      if (checkbox) {
        checkbox.checked = value.checked;
        checkbox.indeterminate = value.indeterminate;
        checkbox.disabled = state.mutation || value.disabled;
        checkbox.dataset.mutationDisabled = String(value.disabled);
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
  const load = button('Queue Selected for Loading', async () => {
    await mutateSource('kb/load',
      { files: model.selectedFiles(), generation: model.generation },
      'The selected sources are now active.');
    updateControls(model.records.keys());
  });
  load.dataset.mutation = '';
  load.disabled = state.mutation;
  const reset = button('Reset selection', () => {
    model.reset((state.status.files ?? []).map(file => file.path), state.status.generation);
    updateControls(model.records.keys());
  }, 'button secondary');
  reset.dataset.mutation = '';
  reset.disabled = state.mutation;
  const loaded = element('div', {}, loadedFiles(state.status.files));
  state.refreshSources = () => {
    if (signal.aborted) return;
    updateControls(model.records.keys());
    loaded.replaceChildren(loadedFiles(state.status.files));
  };
  return element('div', {},
    heading('KB Sources', 'Choose original sources from the repository’s KBs directory. Loading and unloading never deletes files.'),
    element('section', { className: 'source-selection' }, element('h2', {}, 'Source selection'),
      element('div', { className: 'source-actions' }, load, reset, draftCount), statusNote,
      element('p', { className: 'muted' }, 'Accepted requests continue in the background. ', link('Track or cancel them in Tasks', 'settings')),
      model.files.length ? tree : empty('No supported sources found', 'Place the original KIF, KRF, or MeTTa corpus under KBs. Generated companions are intentionally hidden.')),
    element('section', { className: 'loaded-section' }, element('h2', {}, 'Currently loaded'),
      loaded));
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
        renderExpression(step.expression),
        step.contributions?.length ? element('details', {}, element('summary', {}, 'Supporting source contributions'),
          step.contributions.map(item => element('div', {}, sourceLink(item.source,item.line),
            ' · ',element('code',{},item.sourceId),propertyList(item.properties)))) : null)))));
    results.append(body);
  });
  return results;
}

function prologResults(data) {
  const failed = ['exception', 'timeout', 'cancelled'].includes(data.status);
  const titles = { success: 'Prolog succeeded', failure: 'Prolog failed (false)',
    limit: 'Prolog result limit reached', exception: 'Prolog raised an exception', timeout: 'Prolog timed out', cancelled: 'Prolog cancelled' };
  const panel = element('section', { className: `prolog-results${failed ? ' error-panel' : ''}`, role: failed ? 'alert' : 'status' },
    element('h2', {}, titles[data.status] ?? data.status),
    element('p', { className: 'muted' }, 'Executed in powder_console. Side effects are not rolled back, including on failure, cancellation, or exceptions.'));
  if (data.exception) panel.append(element('pre', { className: 'prolog-output' }, data.exception.term));
  for (const [label, output] of [['Output', data.output], ['Error output', data.errorOutput]]) {
    if (output) panel.append(element('h3', {}, label), element('pre', { className: 'prolog-output' }, output));
  }
  for (const [index, solution] of (data.solutions ?? []).entries()) {
    panel.append(element('h3', {}, `Solution ${index + 1}`),
      solution.bindings.length ? element('dl', { className: 'bindings' }, solution.bindings.flatMap(binding => [
        element('dt', {}, binding.name), element('dd', {}, element('code', {}, binding.value)),
      ])) : element('p', {}, 'true'));
  }
  return panel;
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
  let initialContext = { key: values.mt ?? '', display: contextInputText(values.mt, state.contexts.get(values.mt)) };
  let contextEdited = false;
  const query = element('textarea', {
    name: 'query', rows: 5, required: true, value: values.query,
    spellcheck: false, placeholder: '(isa ?X Dog)', 'aria-describedby': 'query-help',
  });
  const mt = element('input', { name: 'mt', type: 'text', value: initialContext.display, list: 'context-names',
    placeholder: values.mt?.startsWith('mt:') && !initialContext.display ? 'Selected compound microtheory' : 'All contexts, independently',
    'aria-describedby': 'context-input-help' });
  const limit = element('input', { name: 'limit', type: 'number', min: 1, max: MAXIMUMS.queryLimit, step: 1, required: true, value: positiveInteger(values.limit, state.settings.queryLimit, MAXIMUMS.queryLimit, 1) });
  const timeout = element('input', { name: 'timeout', type: 'number', min: 1, max: 30, step: 1, required: true, value: positiveInteger(values.timeout, 3, 30, 1) });
  const results = element('div', { className: 'query-results', 'aria-live': 'polite' });
  const run = element('button', { type: 'submit', className: 'button' }, 'Run query');
  const runProlog = element('button', { type: 'submit', className: 'button secondary', 'data-query-mode': 'prolog' }, 'Run Prolog');
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
    const prolog = event.submitter?.dataset.queryMode === 'prolog';
    saveDraft();
    const body = {
      query: query.value.trim(), mt: currentContext(),
      limit: positiveInteger(limit.value, state.settings.queryLimit, MAXIMUMS.queryLimit, 1), timeout: positiveInteger(timeout.value, 3, 30, 1),
    };
    updateRoute({ ...body }, { replace: true });
    const controller = new AbortController();
    state.queryController = controller;
    run.disabled = true;
    runProlog.disabled = true;
    cancel.hidden = false;
    results.setAttribute('aria-busy', 'true');
    results.replaceChildren(element('p', { className: 'loading', role: 'status' },
      prolog ? 'Running full Prolog in the local server process…' : 'Searching for bounded, context-isolated proofs…'));
    try {
      let token;
      if (prolog) token = (await api('prolog/access', {}, { signal: controller.signal })).token;
      const accepted = await api(prolog ? 'prolog/query' : 'query', {}, { method: 'POST', body,
        headers: prolog ? { 'X-Powder-Local-Token': token } : {} });
      state.queryJobId = accepted.jobId ?? null;
      const data = await awaitTask(accepted, { signal: controller.signal, onUpdate: task => {
        results.replaceChildren(element('p', { className: 'loading', role: 'status' },
          `Inference task ${task.id}: ${task.state}.`));
      } });
      if (!controller.signal.aborted) results.replaceChildren(prolog ? prologResults(data) : queryResults(data));
    } catch (error) {
      results.replaceChildren(error.name === 'AbortError'
        ? element('p', { className: 'muted' }, 'Stopped waiting for the query. Server execution remains time-bounded; any Prolog side effects are not rolled back.')
        : error.execution ? prologResults(error.execution) : errorPanel(error, () => form.requestSubmit(prolog ? runProlog : run)));
    } finally {
      if (state.queryController === controller) state.queryController = null;
      state.queryJobId = null;
      run.disabled = false;
      runProlog.disabled = false;
      cancel.hidden = true;
      results.setAttribute('aria-busy', 'false');
    }
  } },
  inputField('KB S-expression or Prolog goal', query),
  element('p', { className: 'muted', id: 'query-help' }, 'Only registered KB predicates and supported logical forms are dispatched. A blank context runs whole-query solutions independently by microtheory.'),
  element('div', { className: 'query-options' },
    inputField('Microtheory (optional)', mt), contextSuggestions(),
    inputField('Maximum results', limit), inputField('Time limit (seconds)', timeout)),
  element('div', { className: 'context-input-help', id: 'context-input-help' },
    element('span', { className: 'muted' }, 'Enter an atomic name or a source S-expression such as (MicrotheoryFn Argument).'),
    clearContext),
  selectedContext,
  element('div', { className: 'prolog-warning' }, element('strong', {}, 'Run Prolog grants full local-process access. '),
    'Built-ins and side effects can modify files, application state, or stop the server. Only run code you trust. ',
    'Unqualified goals run in powder_console, where user assertions persist. Qualify user: or an application module explicitly when needed. ',
    'Select a microtheory to call current-generation x_ KB predicates. Without one, ordinary Prolog goals still run once. Interactive input is EOF.'),
  element('div', { className: 'form-actions' }, run, runProlog, cancel));
  const questionPicker = storedQuestionPicker(signal, item => {
    query.value = item.prolog;
    rememberContext(item.mt, item.mtExpression);
    initialContext = { key: item.mt, display: contextInputText(item.mt, item.mtExpression) };
    mt.value = initialContext.display;
    contextEdited = false;
    selectedContext.replaceChildren(mtLink(item.mt, item.mtExpression));
    saveDraft();
    query.focus();
  });
  return element('div', {}, heading('Query console', 'Ask the active knowledge base and inspect the successful proof, not failed branches.'),
    questionPicker, form, results,
    element('details', { className: 'query-help' },
      element('summary', {}, 'Query semantics'),
      element('p', {}, 'Facts use their own microtheory. Executable <=== rules run ordered bodies within that same context. <== and ordinary implication are assertion data, not commands.'),
      element('p', {}, 'Run query uses the restricted KB dispatcher. Run Prolog is a separate, explicit trusted-local capability with side effects. Loading KBs or selecting a saved question never runs its code.')));
}

function storedQuestionPicker(signal, selectQuestion) {
  let questions = [];
  let refreshVersion = 0;
  const select = element('select', { name: 'storedQuestion', disabled: true, 'aria-label': 'Stored test question' });
  const search = element('input', { type: 'search', name: 'questionSearch', placeholder: 'Filter identifier, question or source', 'aria-label': 'Filter stored test questions' });
  const stateText = element('p', { className: 'muted', role: 'status' }, 'Loading stored test questions…');
  const provenance = element('div', { className: 'question-provenance' });
  const render = () => {
    const filter = search.value.trim().toLowerCase();
    const matching = questions.filter(item => `${item.identifier} ${item.question} ${item.source} ${item.prolog}`.toLowerCase().includes(filter));
    select.replaceChildren(element('option', { value: '' }, 'Select a question to populate the Prolog editor'),
      ...matching.map(item => element('option', { value: item.id },
        `${item.identifier}: ${item.question} — ${contextLabel(item.mt, item.mtExpression)} — ${item.source}:${item.line}`)));
    select.disabled = !matching.length;
    stateText.textContent = questions.length ? `${number(matching.length)} of ${number(questions.length)} loaded test questions. Selection does not execute code.`
      : 'No test_Qs questions are loaded. Load a question source from KB Sources to list its assertions.';
  };
  search.addEventListener('input', render);
  select.addEventListener('change', () => {
    const item = questions.find(question => question.id === select.value);
    if (!item) return;
    selectQuestion(item);
    provenance.replaceChildren(element('p', {}, item.question),
      element('p', {}, mtLink(item.mt, item.mtExpression), ' · ', sourceLink(item.source, item.line)),
      element('p', { className: 'muted' }, (item.variables ?? []).map(pair => `${pair.prolog} = ${pair.source}`).join(', ')),
      element('p', { className: 'muted' }, 'The owning context is selected; change it if the question needs another data context. Conjunction/disjunction become Prolog controls; other formula heads remain KB predicates.'));
  });
  const refresh = async () => {
    const version = ++refreshVersion;
    select.disabled = true;
    stateText.setAttribute('role', 'status');
    stateText.textContent = 'Loading stored test questions…';
    try {
      const all = [];
      let offset = 0, generation;
      do {
        const page = await api('test-questions', { offset, limit: state.settings.pageSize }, { signal });
        if (generation !== undefined && page.generation !== generation) throw new APIError('The active generation changed while listing questions. Refresh the list.', 'generation_changed');
        generation = page.generation;
        if (!Number.isSafeInteger(page.total) || page.total < 0 || !Array.isArray(page.items)
          || (!page.items.length && offset < page.total)) throw new APIError('The server returned an incomplete question list.', 'incomplete_question_list');
        all.push(...page.items); offset += page.items.length;
        if (offset >= page.total) break;
      } while (!signal.aborted);
      if (signal.aborted || version !== refreshVersion) return;
      questions = all;
      render();
    } catch (error) {
      if (error.name === 'AbortError' || version !== refreshVersion) return;
      questions = [];
      select.replaceChildren(element('option', {}, 'Question list unavailable'));
      stateText.setAttribute('role', 'alert');
      stateText.textContent = error.message;
    }
  };
  state.refreshQuestions = refresh;
  refresh();
  return element('section', { className: 'stored-questions', 'aria-label': 'Stored test questions' },
    element('h2', {}, 'Stored test questions'), search, select, stateText,
    button('Refresh questions', refresh, 'button secondary'), provenance);
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
  const request = { q: selectedRow || query, offset: selectedRow ? 0 : route.offset, limit: selectedRow ? state.settings.pageSize : route.limit };
  for (const field of filters) request[field] = selectedRow ? '' : params.get(field);
  let data = await api('mappings', request, { signal });
  if (selectedRow && !data.items?.some(row => row.id === selectedRow)) {
    let offset = 0;
    let total;
    do {
      const page = await api('mappings', { offset, limit: state.settings.pageSize }, { signal });
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

function settingsPage(_route, signal) {
  const inputs = {};
  const feedback = element('div', { className: 'settings-feedback', 'aria-live': 'polite' });
  const apply = values => {
    try {
      state.settings = saveSettings(localStorage, values);
      state.query.limit = state.settings.queryLimit;
      for (const key of Object.keys(inputs)) inputs[key].value = state.settings[key];
      feedback.setAttribute('role', 'status');
      feedback.replaceChildren(element('p', {}, 'Settings saved for this browser. New requests use these limits.'));
    } catch (error) {
      feedback.setAttribute('role', 'alert');
      feedback.replaceChildren(element('p', { className: 'error-panel' }, `Settings were not saved: ${error.message}`));
    }
  };
  const fields = [['pageSize', 'Results per page'], ['queryLimit', 'Maximum query results']].map(([key, label]) => {
    const input = element('input', { type: 'number', name: key, min: 1, max: MAXIMUMS[key], step: 1, required: true, value: state.settings[key] });
    inputs[key] = input;
    return inputField(`${label} (1–${MAXIMUMS[key]})`, input);
  });
  return element('div', {}, heading('Settings', 'Persisted preferences for this browser; changing them does not reload KB sources.'),
    element('form', { className: 'settings-form', novalidate: true, onsubmit: event => {
      event.preventDefault();
      apply(Object.fromEntries(Object.entries(inputs).map(([key, input]) => [key, input.value])));
    } }, fields, element('div', { className: 'form-actions' },
      element('button', { type: 'submit', className: 'button' }, 'Save settings'),
      button('Restore defaults', () => apply(DEFAULT_SETTINGS), 'button secondary')), feedback),
    element('p', { className: 'muted' }, 'Page size applies to terms, predicates, assertions and mappings. Explicit URL limits still override defaults. Query timeouts remain unchanged. All microtheories are always listed, without a cap.'),
    applicationReloadControls(), serverSettingsPanel(signal));
}

function serverSettingsPanel(signal) {
  const panel = element('section', { className: 'server-settings' });
  const startup = element('section', { className: 'startup-settings' },
    element('h2', {}, 'Next server startup'),
    element('p', {}, 'This ordered source list and these pool profiles are saved on the server. Saving does not load files, restart, or resize the running server.'));
  const contents = element('div', { className: 'startup-settings-fields', role: 'status' }, 'Loading saved server settings…');
  const profileSlot = element('div');
  startup.append(contents);
  const form = element('form', { className: 'server-settings-form' },
    profileSlot, tasksPanel(signal), startup);
  panel.append(form);
  const load = async () => {
    try {
      const config = await api('server/settings', {}, { signal });
      const configured = element('input', { type: 'checkbox', checked: config.startupConfigured });
      const rows = element('ol', { className: 'startup-source-list' });
      const addRow = value => {
        const input = element('input', { type: 'text', value, placeholder: 'KBs\\tinyKB.kif or an absolute source path', 'aria-label': 'Startup source path' });
        const row = element('li', {}, input,
          button('Up', () => { if (row.previousElementSibling) rows.insertBefore(row, row.previousElementSibling); }, 'button secondary'),
          button('Down', () => { if (row.nextElementSibling) rows.insertBefore(row.nextElementSibling, row); }, 'button secondary'),
          button('Remove', () => row.remove(), 'button secondary'));
        rows.append(row);
      };
      for (const file of config.startupFiles) addRow(file);
      const fields = {};
      const profiles = element('div', { className: 'pool-settings' },
        ['loader', 'inference', 'http'].map(pool => element('fieldset', {},
          element('legend', {}, `${pool === 'http' ? 'HTTP (server-wide)' : pool} pool`),
          ['start', 'max', 'spare'].map(key => {
            const input = element('input', { type: 'number', name: `server_${pool}_${key}`, min: key === 'spare' ? 0 : 1, max: 128, step: 1, required: true, value: config.pools[pool][key] });
            fields[`${pool}.${key}`] = input;
            return inputField({ start: 'Startup threads', max: 'Maximum threads', spare: 'Preferred idle reserve' }[key], input);
          }))));
      const feedback = element('div', { 'aria-live': 'polite' });
      const save = element('button', { type: 'submit', className: 'button' }, 'Save next-start settings');
      const selectAll = button('Select All Files', async () => {
        selectAll.disabled = true;
        feedback.setAttribute('role', 'status');
        feedback.replaceChildren(element('p', {}, 'Discovering all KB source files…'));
        try {
          const catalog = await api('kb/catalog', { canonical: true }, { signal });
          const selected = mergeStartupSources(Array.from(rows.querySelectorAll('input'), input => input.value), catalog);
          rows.replaceChildren(); for (const path of selected) addRow(path);
          configured.checked = true;
          feedback.replaceChildren(element('p', {}, `${number(selected.length)} startup entries selected. This draft has not been saved or loaded.`));
        } catch (error) {
          if (error.name !== 'AbortError') {
            feedback.setAttribute('role', 'alert');
            feedback.replaceChildren(element('p', { className: 'error-panel' }, error.message));
          }
        } finally { selectAll.disabled = false; }
      }, 'button secondary');
      form.onsubmit = async event => {
        event.preventDefault();
        save.disabled = true;
        try {
          const pools = Object.fromEntries(['loader', 'inference', 'http'].map(pool => [pool,
            Object.fromEntries(['start', 'max', 'spare'].map(key => [key, Number(fields[`${pool}.${key}`].value)]))]));
          for (const profile of Object.values(pools)) {
            if (!Number.isInteger(profile.start) || !Number.isInteger(profile.max) || !Number.isInteger(profile.spare)
              || profile.start < 1 || profile.max > 128 || profile.start > profile.max || profile.spare < 0 || profile.spare > profile.max) {
              throw new Error('Pool profiles require 1 ≤ startup ≤ maximum ≤ 128 and 0 ≤ spare ≤ maximum.');
            }
          }
          const startupFiles = Array.from(rows.querySelectorAll('input')).map(input => input.value.trim());
          if (startupFiles.some(path => !path)) throw new Error('Enter a source path or remove the empty startup row.');
          const saved = await localAdmin('server/settings/save', { revision: config.revision,
            settings: { startupConfigured: configured.checked, startupFiles, pools } });
          config.revision = saved.revision;
          rows.replaceChildren(); for (const file of saved.startupFiles) addRow(file);
          feedback.setAttribute('role', 'status');
          feedback.replaceChildren(element('p', {}, 'Saved for the next server start. No files were loaded and no running pools were resized.'),
            ...(saved.issues ?? []).map(issue => element('p', {}, `${issue.path ?? ''} ${issue.message}`)));
        } catch (error) {
          feedback.setAttribute('role', 'alert');
          feedback.replaceChildren(element('p', { className: 'error-panel' }, error.message));
        } finally { save.disabled = false; }
      };
      profileSlot.replaceChildren(profiles);
      contents.replaceChildren(...(config.issues ?? []).map(issue => element('p', { role: 'alert' }, issue.message)),
      element('label', { className: 'field' }, element('span', {}, configured, ' Use the saved source list on server startup')),
      element('p', { className: 'muted' }, 'Unchecked preserves the default initial KB. Checked with an empty list loads no KB. Explicit command-line sources always take precedence.'),
      rows, button('Add source', () => addRow(''), 'button secondary'), selectAll,
      button('Use currently loaded sources', () => { rows.replaceChildren(); for (const file of state.status?.files ?? []) addRow(file.path); configured.checked = true; }, 'button secondary'),
      save, feedback);
    } catch (error) {
      if (error.name !== 'AbortError') contents.replaceChildren(errorPanel(error, load));
    }
  };
  load();
  return panel;
}

function tasksPanel(signal) {
  const panel = element('section', { className: 'tasks-panel' }, element('h2', {}, 'Tasks and worker pools'));
  const content = element('div', { role: 'status' }, 'Loading requested tasks…');
  const requestedTask = parseRoute(location.hash).params.get('task');
  let focusedTask = false;
  let timer;
  const stamp = value => value === null || value === undefined ? '—' : new Date(value * 1000).toLocaleString();
  const refresh = async () => {
    clearTimeout(timer);
    if (signal.aborted) return;
    if (document.hidden) { timer = setTimeout(refresh, 1000); return; }
    try {
      const data = await api('tasks', {}, { signal });
      const pools = element('div', { className: 'worker-pool-list' });
      for (const pool of data.pools ?? []) {
        const profile = pool.profile;
        const name = pool.pool === 'http' ? 'HTTP server-wide pool' : `${pool.pool} pool`;
        const section = element('section', { 'data-pool': pool.pool },
          element('h3', {}, name),
          element('p', {}, `Actual ${pool.total} · busy ${pool.busy} · idle ${pool.idle} · queued ${pool.queued}`),
          element('p', { className: 'muted' }, profile
            ? `Running profile: startup ${profile.start}, maximum ${profile.max}, spare ${profile.spare}`
            : pool.pool === 'http' ? 'This listener predates pool configuration. Restart normally to apply a saved profile.'
              : 'This pool has not been initialized. Restart the server once to create its workers.'),
          pool.statisticsBasis && element('p', { className: 'muted' }, pool.statisticsBasis),
          pool.sparePolicy && element('p', { className: 'muted' }, pool.sparePolicy));
        if (pool.pool !== 'http') {
          const tasks = (data.tasks ?? []).filter(task => task.pool === pool.pool);
          section.append(element('h4', {}, 'Requested tasks'),
            tasks.length ? element('ul', { className: 'requested-tasks' }, tasks.map(task => {
              const source = task.progress?.currentPath || task.progress?.source;
              const item = element('li', { 'data-task-id': task.id, 'data-state': task.state },
                element('strong', {}, `${task.label}: ${task.state}`),
                element('code', {}, task.id),
                element('p', { className: 'muted' }, `Requested ${stamp(task.createdAt)} · started ${stamp(task.startedAt)} · finished ${stamp(task.finishedAt)}`),
                element('p', {}, `${task.progress?.phase ?? ''}${source ? ` — ${source}` : ''}`),
                task.progress?.totalFiles ? element('p', {}, `${task.progress.completedFiles ?? 0}/${task.progress.totalFiles} files`) : null,
                task.files?.length ? element('details', {}, element('summary', {}, `${task.files.length} selected files/paths`),
                  element('pre', { className: 'prolog-output' }, task.files.join('\n'))) : null,
                task.error ? requestErrorDetails(new APIError(task.error.message, 'task_failed', 422, task.error)) : null,
                task.resultCount !== undefined && element('p', {}, `${task.resultCount} solutions returned`),
                task.resultGeneration !== undefined && element('p', {}, `Published generation ${task.resultGeneration}`));
              if (task.id === requestedTask) {
                item.setAttribute('tabindex', '-1');
                item.setAttribute('aria-current', 'true');
              }
              if (task.cancelable && ['queued', 'running'].includes(task.state)) {
                item.append(button('Cancel task', async event => {
                  event.currentTarget.disabled = true;
                  try { await localAdmin('tasks/cancel', { id: task.id }); await refresh(); }
                  catch (error) { showNotice(error.message, true); }
                }, 'button secondary'));
              }
              return item;
            })) : element('p', { className: 'muted' }, 'No requested tasks in this pool.'));
        }
        pools.append(section);
      }
      content.replaceChildren(pools,
        ...(data.serviceErrors ?? []).map(error => element('p', { role: 'alert' }, `${error.pool}: ${error.message}`)),
        element('p', { className: 'muted' }, `All active/queued tasks and the latest ${data.completedHistoryLimit} completed tasks are retained. ${data.persistence}`));
      if (!focusedTask && requestedTask) {
        const selected = [...content.querySelectorAll('[data-task-id]')].find(item => item.dataset.taskId === requestedTask);
        if (selected) {
          selected.focus({ preventScroll: true });
          selected.scrollIntoView({ block: 'nearest' });
          focusedTask = true;
        }
      }
    } catch (error) {
      if (error.name !== 'AbortError') content.replaceChildren(errorPanel(error, refresh));
    } finally {
      if (!signal.aborted) timer = setTimeout(refresh, 1000);
    }
  };
  panel.append(button('Refresh tasks', refresh, 'button secondary'), content);
  signal.addEventListener('abort', () => clearTimeout(timer), { once: true });
  refresh();
  return panel;
}

function applicationReloadControls() {
  const feedback = element('div', { className: 'reload-feedback', 'aria-live': 'polite' });
  const reload = button('Reload changed files', async () => {
    if (state.codeReloading) return;
    setCodeReloading(true);
    feedback.setAttribute('role', 'status');
    feedback.replaceChildren(element('p', {}, 'Reloading changed Prolog application code…'));
    try {
      const result = await api('app/reload', {}, { method: 'POST', body: {} });
      feedback.replaceChildren(element('p', {}, result.message),
        result.reloaded?.length ? element('ul', {}, result.reloaded.map(file => element('li', {}, file))) : null,
        result.warnings?.length ? element('ul', {}, result.warnings.map(warning => element('li', {}, `${warning.source}: ${warning.message}`))) : null);
    } catch (error) {
      feedback.setAttribute('role', 'alert');
      feedback.replaceChildren(requestErrorDetails(error));
    } finally {
      setCodeReloading(false);
    }
  });
  reload.dataset.codeReload = '';
  reload.disabled = state.codeReloading;
  return element('section', { className: 'application-reload' }, element('h2', {}, 'Prolog application code'),
    element('p', {}, 'Reload only changed, already loaded application modules, including while source tasks are running. This does not recompile KBs, reload source data, or reset settings and draft selections.'),
    element('p', { className: 'muted' }, 'If code reload fails, some modules may already have changed; SWI-Prolog cannot roll those changes back automatically.'),
    reload, feedback);
}

function setCodeReloading(value) {
  state.codeReloading = value;
  for (const control of document.querySelectorAll('[data-code-reload]')) control.disabled = value;
}

const pages = {
  overview, search: searchPage, predicates: searchPage, term: termPage,
  microtheory: microtheoryPage, microtheories: microtheoriesPage,
  assertion: assertionPage, source: sourcePage, sources: sourcesPage,
  query: queryPage, mappings: mappingsPage, settings: settingsPage,
};

async function renderRoute() {
  const view = ++state.view;
  state.routeController?.abort();
  state.queryController?.abort();
  state.queryController = null;
  state.refreshQuestions = null;
  state.refreshSources = null;
  const controller = new AbortController();
  state.routeController = controller;
  const route = parseRoute(location.hash, state.settings);
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
      {
        const status = await api('status', {}, { signal: requestController.signal });
        if (status.generation !== state.status?.generation || status.startup?.state !== state.status?.startup?.state) {
          if (setStatus(status)) await refreshPublishedView();
        }
      }
      target.textContent = 'Interface live refresh enabled';
      target.title = 'Web assets and mappings refresh automatically. Use Settings to reload changed Prolog application code.';
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
try {
  state.settings = loadSettings(localStorage);
  state.query.limit = state.settings.queryLimit;
} catch (error) {
  showNotice(`Saved settings could not be loaded: ${error.message}. Default limits are active; repair or reset them on Settings.`, true);
}
renderRoute();
startLiveReload();
