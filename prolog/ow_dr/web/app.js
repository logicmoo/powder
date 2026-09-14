import { assertionRoles, contextExpression, contextInputText, contextLabel, expressionText, renderExpression, routeHref, symbolLabel } from './render.js';
import { APIError, FileMetadata, SourceSelection, VersionTracker, apiErrorSummary, canonicalPath, compilationIssues, contextRequestValue, directoryStatisticsText, hierarchyExpansionBlock, normalizeContextInput, pageRange, parseRoute, positiveInteger, requestJSON, sourceFileStates, sourceStatisticsStamp, sourceStatisticsText, visibleSourceDirectories, visibleSourceFiles } from './model.js';
import { collectDiagnostics, diagnosticCounts, diagnosticMessages, diagnosticProperty, mappingRowsOf, splitMappingRows } from './diagnostics.js';
import { DEFAULT_SETTINGS, MAXIMUMS, loadSettings, saveSettings } from './settings.js';
import { apiPath } from './paths.js';
import { renderFileBadges, renderSourceFile } from './source-files.js';
import { renderDecodedText } from './decoded-text.js';
import { createPresentationStore, renderUISettings } from './presentation.js';
import { createClassicLayout } from './classic-layout.js';
import { createAssertionView } from './assertion-view.js';
import { filterContextItems, pageTermNavigation, termContextModel } from './term-context.js';
import { colorAssertionBalls } from './assertion-markers.js';
import { createAnnotationHost } from './annotation-host.js';
import { renderTVASettings, renderAssertionAnnotationEditor } from './native-tva.js';
import { loadedMTTree } from './mt-inheritance.js';
import { createTermFileContext } from './term-file-context.js';
import { AGENT_ROLES, createAgentWorkspace } from './agents.js';

const $ = selector => document.querySelector(selector);
const content = $('#content');
const APP_NAME = 'powder';
const number = value => new Intl.NumberFormat().format(Number(value) || 0);
const state = {
  status: null, catalog: null, selection: null, expanded: new Set(['KBs']),
  knownSources: new Set(), knownMappings: null, contexts: new Map(),
  mutation: false, routeController: null, queryController: null, view: 0,
  literalQuery: null,
  settings: { ...DEFAULT_SETTINGS },
  query: { query: '', mt: '', limit: DEFAULT_SETTINGS.queryLimit, timeout: 3 },
  fileMetadata: new FileMetadata(), fileViews: new Map(),
  startupPending: new Set(), fileLoads: new Map(), collapsedGroups: new Set(),
};
let fileInformationTimer, fileInformationBusy = false;
const presentation = createPresentationStore({ onError: error => showNotice(`Display preferences could not be saved: ${error.message}`, true) });
const classicLayout = createClassicLayout({ content, presentation, header: $('.workspace-header'), status: $('.workspace-footer'), mtLink });
const assertionView = createAssertionView({ sourceLink, propertyList, diagnosticsPanel, mtLink, mappingLink });
const annotations = createAnnotationHost({ api, presentation, reference: nativeReference, sourceLink,
  getGeneration: () => state.status?.generation });
let annotationRevision = null;
let sourceEditor, sourceOpenCount = 0, acceptedRoute = location.hash, pendingInterfaceReload = false;
let agentWorkspace, agentStatusRequest;
const pendingJobs = new Set();

function nativeReference({ key, expression, kind }) {
  if (key === null) return element('span', { className: 'muted' }, kind === 'context' ? 'No current MT (MT fallback skipped)' : 'Supplier unavailable');
  if (key === 'default') return link('default', 'ui-settings');
  if (kind === 'context') return mtLink(key, expression);
  if (/^a[0-9a-f]+$/u.test(key)) return link(key, 'assertion', { id: key });
  return expression ? element('span', {}, renderExpression(expression, { inline: true, pretty: false }),
    link('Inspect', 'term', { term: key }, 'text-button')) : link(symbolLabel(key), 'term', { term: key });
}

function annotationContext(route = parseRoute(location.hash)) {
  if (route.params.has('annotationMt')) return route.params.get('annotationMt') || null;
  return route.params.get('mt') || null;
}

function annotateCards(container, items, { detail = false, context = annotationContext() } = {}) {
  const data = new Map(items.map(item => [String(item.id), item]));
  for (const card of container.querySelectorAll('.assertion-view')) {
    const item = data.get(card.dataset.assertionId);
    if (!item) continue;
    const ball = card.querySelector('.assertion-ball');
    if (ball && context) ball.href = routeHref('assertion', { id: item.id, mt: context });
    annotations.attach(card, item.id, { context, assertion: true, detail, data: item, signal: state.routeController?.signal });
  }
  return container;
}

function annotationContextControl(route, signal, onContext) {
  const selected = annotationContext(route);
  let request = 0;
  const select = element('select', { name: 'annotation-context', 'aria-label': 'Current MT for native annotations',
    onchange: async () => {
      const value = select.value || null;
      const current = ++request;
      try { await onContext?.(value); }
      catch (error) { select.value = annotationContext() ?? ''; feedback.textContent = error.message; return; }
      if (current !== request || signal.aborted) return;
      const params = Object.fromEntries(parseRoute(location.hash).params);
      params.annotationMt = value ?? '';
      const query = new URLSearchParams(params);
      history.pushState(null, '', `#/${route.name}?${query}`);
      annotations.setContext(value);
    } }, element('option', { value: '', selected: selected === null }, 'No current MT — use Atom then Default'));
  if (selected) select.append(element('option', { value: selected, selected: true }, contextLabel(selected, state.contexts.get(selected))));
  const feedback = element('span', { className: 'muted' });
  api('microtheories', {}, { signal }).then(data => {
    if (signal.aborted) return;
    const keys = new Set([...select.options].map(option => option.value));
    for (const mt of data.items) {
      rememberContext(mt.mt, mt.mtExpression);
      if (!keys.has(mt.mt)) select.append(element('option', { value: mt.mt }, contextLabel(mt.mt, mt.mtExpression)));
    }
  }).catch(error => { if (error.name !== 'AbortError') feedback.textContent = `MT choices unavailable: ${error.message}`; });
  return element('details', { className: 'annotation-context-control' },
    element('summary', {}, 'Annotation context'),
    element('label', { className: 'field' }, 'Current MT for native annotations and source interpretation', select),
    element('p', { className: 'muted' }, 'Changing this context does not select or load KB sources, run inference, or change the selected term.'), feedback);
}

function updateClassicContext(panel, route) {
  const context = panel.contextualData;
  if (panel.classList.contains('agents-workspace')) {
    classicLayout.setContext({
      title: 'Agents', coverage: 'page',
      description: 'Independent conversations and permissions. Selecting a role submits no work.',
      sections: [{ title: 'Four text roles', items: AGENT_ROLES.map(role => ({
        label: `${role.label} - ${role.type}`, href: routeHref('agents', { agent: role.id }),
      })) }],
    });
  } else if (panel.catalogContext) {
    classicLayout.setContext(panel.catalogContext);
  } else if (context?.term) {
    const model = termContextModel(route, context.data, context.term);
    classicLayout.setContext(model);
    addLiteralQueryActions(model);
  } else {
    const entries = [...panel.querySelectorAll('h2, h3')].map(node => ({
      label: node.textContent, onSelect: () => { node.scrollIntoView({ block: 'start' }); node.tabIndex = -1; node.focus({ preventScroll: true }); },
    }));
    classicLayout.setContext({
      title: panel.querySelector('h1')?.textContent ?? 'Context index', coverage: 'page',
      sections: [{ title: 'On this page', items: entries }],
      emptyMessage: 'No sections in the current view.',
    });
  }
  const selectedTerm = panel.catalogTerm ?? context?.term ?? context?.mt;
  if (selectedTerm) {
    const fileContext = createTermFileContext({
      api, element, link, button,
      file: (item, href) => {
        const path = canonicalPath(item.source);
        const label = () => element('a', { href, className: 'source-link', title: item.source,
          'aria-label': `View occurrences in ${item.source}` }, item.source.split('/').at(-1));
        return sourceFileDisplay(path, label, { compact: true, displayPath: item.source });
      },
    }, { term: selectedTerm, route, signal: state.routeController.signal });
    classicLayout.index.append(fileContext);
  }
  classicLayout.resize();
}

function addLiteralQueryActions(model) {
  const actions = new Map();
  const visit = item => {
    if (item.querySpecs) actions.set(item.href, item.querySpecs);
    (item.children ?? []).forEach(visit);
  };
  model.sections.forEach(section => section.items.forEach(visit));
  for (const anchor of classicLayout.index.querySelectorAll('a[href]')) {
    const specs = actions.get(anchor.getAttribute('href'));
    if (!specs) continue;
    if (!specs.length) {
      const unavailable = element('span', { className: 'literal-query-unavailable',
        title: 'No literal query: this term occurs only inside the argument, or no supported direct argument/arity is recorded.' }, 'Ask unavailable');
      anchor.parentNode.append(unavailable);
    }
    for (const spec of specs) {
      const query = expressionText(spec.expression, { pretty: false });
      const run = button('+', event => {
        event.preventDefault(); event.stopPropagation();
        runLiteralQuery(spec);
      }, 'literal-query-button');
      run.title = `Run ${query}${spec.mt ? ` in ${contextLabel(spec.mt, state.contexts.get(spec.mt))}` : ' independently in each microtheory'}. Includes asserted and derivable answers; likelihood of additional answers is unknown.`;
      run.setAttribute('aria-label', `Run bounded query ${query}`);
      anchor.parentNode.append(run);
    }
  }
}
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

function showNotice(message, isError = false) {
  const target = $('#notice');
  target.replaceChildren(element('div', { className: 'notice-content' }, typeof message === 'string' ? renderDecodedText(message) : message),
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
    element('p', { className: 'failure-summary' }, renderDecodedText(apiErrorSummary(error))),
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
    state.fileMetadata.operation(issues);
    queueMicrotask(refreshFileDisplays);
  }
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
        reference.addEventListener('click', event => {
          if (event.target.closest('a.source-link')) reference.closest('.compile-issues').open = false;
        });
        return element('li', { className: 'compile-issue', 'data-status': issue.status ?? 'failed' },
          element('div', { className: 'compile-issue-heading' },
            element('span', { className: `badge diagnostic-badge ${busy ? 'warning' : 'error'}` }, busy ? 'Busy' : 'Failed'),
            reference),
          element('p', { className: 'compile-issue-message' }, renderDecodedText(message)),
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

function propertyValue(value) {
  if (typeof value === 'string') return renderDecodedText(value);
  if (value?.type && ['symbol', 'variable', 'number', 'string', 'application', 'list', 'map', 'value', 'execute', 'empty'].includes(value.type)) return renderExpression(value);
  if (Array.isArray(value)) return value.length ? element('ul', { className: 'property-values' }, value.map(part => element('li', {}, propertyValue(part)))) : element('span', {}, '[]');
  if (value && typeof value === 'object') return propertyList(Object.entries(value).map(([name, part]) => ({ name, value: part })));
  return element('span', {}, displayProperty(value));
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
    else if (['source_file', 'source', 'originalSource', 'file'].includes(property.name) && typeof property.value === 'string'
      && /\.(?:kif|krf|meld|metta)$/iu.test(property.value)) value = sourceLink(property.value, context?.line);
    else value = propertyValue(property.value);
    list.append(element('dt', {}, property.name),
      element('dd', {}, value));
  }
  return list;
}

function sourceLink(path, line = 1, label, column, { compact = true } = {}) {
  const normalized = canonicalPath(path);
  const safeLine = positiveInteger(line, 1, Number.MAX_SAFE_INTEGER, 1);
  const safeColumn = positiveInteger(column, undefined, Number.MAX_SAFE_INTEGER, 1);
  const text = label ?? `${path || 'Unknown source'}:${safeLine}${safeColumn ? `:${safeColumn}` : ''}`;
  const name = () => normalized && state.knownSources.has(normalized)
    ? link(text, 'source', { path: normalized, line: safeLine, column: safeColumn }, 'source-link')
    : element('span', { className: 'muted' }, text);
  const original = typeof path === 'string' ? path : label;
  if (typeof original !== 'string' || !/\.(?:kif|krf|meld|metta)(?::\d+(?::\d+)?)?$/i.test(original)) return name();
  return sourceFileDisplay(normalized, name, { compact, displayPath: original });
}

function sourceFileDisplay(path, label, options = {}) {
  const view = renderSourceFile(path, label, state.fileMetadata, { ...options, element,
    changed: scheduleFileInformation,
    properties: sourceFileProperties,
    renderMT: mtLink,
    enableStartup, startupPending: file => state.startupPending.has(file),
    loadNow: loadFileNow, loadState: file => state.fileLoads.get(file),
    retry: file => { state.fileMetadata.retry(file); scheduleFileInformation(); } });
  state.fileViews.set(view.node, { ...view, path });
  scheduleFileInformation();
  return view.node;
}

async function loadFileNow(path) {
  const previous = state.fileLoads.get(path);
  if (previous && !['failed', 'cancelled'].includes(previous.state)) return;
  state.fileLoads.set(path, { state: 'queuing' }); refreshFileDisplays();
  try {
    setStatus(await api('status'));
    if (state.fileMetadata.get(path).loaded === true) {
      state.fileLoads.delete(path);
      showNotice(`${path} is already loaded. Startup selection is unchanged.`);
      return;
    }
    const job = await api('kb/file-load', {}, { method: 'POST', body: { path, generation: state.status.generation } });
    state.fileLoads.set(path, { state: 'queued', jobId: job.jobId });
    pendingJobs.add(job.jobId);
    showNotice(element('span', {}, `Whole-file loading queued for ${path}. Other loaded sources and startup selection are kept. `,
      link('View task', 'task', { id: job.jobId })));
  } catch (error) {
    state.fileLoads.set(path, { state: 'failed', message: error.message });
    showNotice(requestErrorDetails(error, { preserveSelection: true }), true);
  } finally { refreshFileDisplays(); }
}

function finishFileLoad(path, job) {
  if (job.state !== 'succeeded') {
    state.fileLoads.set(path, { state: job.state, message: job.error?.message ?? job.state });
    showNotice(`${path}: ${job.error?.message ?? job.state}. Activate Load now to retry.`, true);
    return;
  }
  state.fileLoads.delete(path);
  state.fileMetadata.clearOperations([path]);
  const route = parseRoute(location.hash);
  const loaded = state.fileMetadata.get(path).loaded === true;
  const view = route.params.has('term')
    ? link('View loaded occurrences', 'definitions', { ...Object.fromEntries(route.params), source: path, scope: 'loaded', offset: 0 })
    : link('View loaded sources', 'sources');
  showNotice(element('span', {}, loaded
    ? `${path} loaded successfully. Startup selection is unchanged. `
    : `${path} finished loading, but a later source update has removed it. `,
  route.params.get('scope') === 'unloaded' ? 'The Unloaded filter excludes loaded files. ' : '', view));
}

async function enableStartup(path) {
  if (state.startupPending.has(path)) return;
  state.startupPending.add(path); refreshFileDisplays();
  try {
    const current = await api('kb/startup');
    const result = await api('kb/startup/add', {}, { method: 'POST', body: { path, revision: current.revision } });
    state.fileMetadata.rememberStartup(result.startup);
    if (state.status) state.status = { ...state.status, startup: result.startup };
    showNotice(`${path} will load at next startup. The current KB is unchanged.`);
  } catch (error) {
    showNotice(`Startup selection was not changed: ${error.message}`, true);
  } finally {
    state.startupPending.delete(path); refreshFileDisplays();
  }
}
function sourceFileProperties(path, target, refresh) {
  if (!path) {
    target.append(element('p', { className: 'muted' },
      'This reference cannot be resolved inside the authorized KB source catalog. No source or cache was read.'));
    return;
  }
  const own = target.closest('.source-file-display');
  for (let parent = own?.parentElement?.closest('.source-file-display'); parent;
    parent = parent.parentElement?.closest('.source-file-display')) {
    if (parent.dataset.sourceFile === path) {
      target.append(element('p', { className: 'muted' }, 'This source’s Properties are already open above.'),
        button('Focus existing Properties', () => parent.querySelector(':scope > .source-properties-button').focus(), 'text-button'));
      return;
    }
  }
  target.append(fileDependencies(path));
  target.append(sourceStatisticsDetails(path, state.routeController?.signal, snapshot => {
    state.fileMetadata.statistics(path, snapshot); refresh();
  }));
}

function fileDependencies(path) {
  const summary = element('div', { className: 'dependency-summary' });
  const tabs = element('nav', { className: 'statistics-tabs', 'aria-label': 'Dependency evidence sections' });
  const body = element('div', { className: 'dependency-results' });
  const panel = element('section', { className: 'file-dependencies', 'aria-label': 'Cache-only dependency evidence' },
    element('h3', {}, 'Cache-only dependency evidence'),
    element('p', { className: 'muted' }, 'Ordinary facts do not define predicates. Semantic rule heads and declaration subjects are separate local providers. Outbound means references without a recorded named local provider—not globally missing. This is static evidence; only <=== is executable at runtime.'),
    element('p', { className: 'muted' }, 'On-demand reads are limited to a 64 MiB data cache and 15 seconds of analysis. Source text is not read, compiled or loaded.'),
    summary, tabs, body, button('Refresh dependency evidence', () => load('summary', 0), 'text-button'));
  const sections = [
    ['summary', 'Coverage'], ['defined', 'Rule-defined symbols'], ['declared', 'Declared symbols'],
    ['outbound_predicates', 'Outbound predicates/functions'], ['provided_mts', 'Content MTs'],
    ['referenced_mts', 'Referenced MTs'], ['outbound_mts', 'Outbound MTs'],
    ['predicate_references', 'All predicate/function references'], ['unresolved', 'Unresolved positions'],
  ];
  let request = 0, dialect;
  const count = value => Number.isSafeInteger(value) && value >= 0 ? number(value) : 'unknown';
  function evidence(row) {
    const location = `${row.path ?? row.recordedPath ?? 'Unresolved source'}${Number.isSafeInteger(row.line) && row.line > 0 ? `:${row.line}` : ''}`;
    return element('li', {},
      sourceLink(row.path, row.line ?? 1, location),
      element('span', { className: 'muted' }, [row.id, row.role, row.polarity, row.kind].filter(Boolean).join(' · ')),
      row.variableNames?.length && element('span', { className: 'muted' },
        `Variables: ${row.variableNames.join(', ')}${row.variableNameCount > row.variableNames.length ? ' (sample)' : ''}`),
      row.canonical && element('code', { className: 'dependency-preview' }, row.canonical));
  }
  function rowView(row, section) {
    if (section === 'unresolved') return evidence(row);
    const name = row.symbol ? statisticsSymbol(row.symbol, dialect) : mtLink(row.key, row.mtExpression);
    const detail = element('div');
    const samples = element('details', { className: 'dependency-evidence' },
      element('summary', {}, `${count(row.evidenceCount)} recorded evidence occurrences · ${row.evidence?.length ?? 0} samples`), detail);
    let shown = false;
    samples.addEventListener('toggle', () => {
      if (samples.open && !shown) { shown = true; detail.append(element('ul', {}, (row.evidence ?? []).map(evidence))); }
    });
    return element('li', {}, name,
      row.arities && element('span', { className: 'muted' },
        `Arities: ${row.arities.length ? row.arities.map(arity => arity === null ? 'unknown' : arity).join(', ') : 'unknown'}${row.arityCount > row.arities.length ? ` (${row.arityCount} total; sample shown)` : ''}`),
      row.polarities?.length && element('span', { className: 'badge' }, row.polarities.join(', ')),
      samples);
  }
  async function load(section, offset) {
    const current = ++request;
    panel.setAttribute('aria-busy', 'true');
    body.replaceChildren(element('p', { className: 'muted' }, 'Reading existing cache evidence… Source compilation and loading are not requested.'));
    try {
      const data = await api('kb/dependencies', { path, section, offset, limit: 25 }, { signal: state.routeController?.signal });
      if (current !== request) return;
      const snapshot = data.summary;
      if (snapshot?.schema !== 'powder.file-dependencies.v1') throw new APIError('Unsupported dependency evidence response.', 'invalid_response');
      dialect = snapshot.dialect;
      if (!state.fileMetadata.dependencies(path, snapshot, data.generation)) throw new APIError('The active generation changed while evidence was read. Refresh to retry.', 'generation_changed');
      for (const [node, view] of state.fileViews) if (node.isConnected && view.path === path) view.refresh();
      const implied = snapshot.impliedMT;
      summary.replaceChildren(element('p', { className: 'dependency-state', 'data-state': snapshot.status },
        `Recorded snapshot: ${snapshot.status}. Unknown coverage is not an empty set.`),
      element('ul', { className: 'statistics-notes' }, (snapshot.reasons ?? []).map(reason => element('li', {}, reason.message))),
      element('p', { className: 'muted' },
        `File-implied MT content: ${implied?.status === 'present' ? `${count(implied.contentAssertions)} recorded assertions` :
          implied?.status === 'missing' ? 'no recorded content context' : 'unknown'}. A filename alone is not content evidence.`));
      tabs.replaceChildren(...sections.map(([key, label]) => {
        const control = button(key === 'summary' ? label : `${label}: ${count(snapshot.counts?.[key])}`, () => load(key, 0), 'button secondary');
        control.setAttribute('aria-pressed', String(key === section));
        control.disabled = key !== 'summary' && !Number.isSafeInteger(snapshot.counts?.[key]);
        return control;
      }));
      if (section === 'summary') {
        body.replaceChildren(propertyList(Object.entries(snapshot.coverage ?? {}).map(([name, value]) => ({ name, value }))));
      } else {
        body.replaceChildren(element('ul', { className: 'dependency-rows', 'data-section': section },
          (data.items ?? []).map(row => rowView(row, section))));
        if (!data.items?.length) body.append(element('p', { className: 'muted' },
          data.total === null ? 'This evidence is unavailable, not zero.' : 'No named entries are recorded on this page. See the coverage limitations above.'));
        if (Number.isSafeInteger(data.total)) {
          const range = pageRange(data.total, offset, 25);
          const previous = button('Previous evidence', () => load(section, range.previous), 'button secondary');
          const next = button('Next evidence', () => load(section, range.next), 'button secondary');
          previous.disabled = !range.hasPrevious; next.disabled = !range.hasNext;
          body.append(element('nav', { className: 'pagination', 'aria-label': 'Dependency pagination' },
            element('span', {}, `${number(range.start)}–${number(range.end)} of ${number(data.total)}`), previous, next));
        }
      }
    } catch (error) {
      if (current !== request) return;
      body.replaceChildren(element('p', { className: 'statistics-error', role: 'status' },
        error.name === 'AbortError' ? 'Reading was cancelled. Refresh to retry.' : error.message));
    } finally { if (current === request) panel.setAttribute('aria-busy', 'false'); }
  }
  load('summary', 0);
  return panel;
}

function scheduleFileInformation() {
  if (!fileInformationTimer && !fileInformationBusy) fileInformationTimer = setTimeout(hydrateFileInformation, 0);
}

function refreshFileDisplays() {
  for (const [node, view] of state.fileViews) {
    if (!node.isConnected && !sourceEditor?.element.contains(node)) state.fileViews.delete(node);
    else view.refresh();
  }
  if (state.selection) {
    const values = sourceFileStates(state.selection, (state.status?.files ?? []).map(file => file.path), state.fileMetadata);
    for (const node of document.querySelectorAll('[data-directory-states-path]')) {
      const path = node.dataset.directoryStatesPath;
      if (values.has(path)) node.replaceWith(renderFileBadges(path, values.get(path), element));
    }
  }
}

function runLiteralQuery(spec) {
  state.literalQuery = { query: expressionText(spec.expression, { pretty: false }), mt: spec.mt || '', limit: spec.limit || 20, timeout: spec.timeout || 3 };
  const target = routeHref('query', state.literalQuery);
  if (location.hash === target) renderRoute(); else location.hash = target;
}

async function hydrateFileInformation() {
  fileInformationTimer = null;
  if (fileInformationBusy) return;
  const pending = new Set();
  for (const [node, view] of state.fileViews) {
    if (!node.isConnected) { if (!sourceEditor?.element.contains(node)) state.fileViews.delete(node); continue; }
    if (!view.path || !/\.(?:kif|krf|meld|metta)$/i.test(view.path) ||
      !state.fileMetadata.needsInformation(view.path) ||
      (!view.requested() && state.knownSources.has(view.path)) || !node.getClientRects().length) continue;
    const rect = node.getBoundingClientRect();
    if (rect.bottom >= 0 && rect.top < window.innerHeight) pending.add(view.path);
    if (pending.size === 16) break;
  }
  if (!pending.size) return;
  const paths = [...pending];
  fileInformationBusy = true;
  try {
    const reply = await api('kb/file-info', { paths: JSON.stringify(paths) });
    if (reply.generation > (state.status?.generation ?? -1)) setStatus(await api('status'));
    if (!state.fileMetadata.information(reply)) throw new Error('The KB changed while file states were read. Retry for the current generation.');
    const received = new Set();
    for (const file of reply.items ?? []) {
      const path = canonicalPath(file.path);
      if (path) { state.knownSources.add(path); received.add(path); }
    }
    state.fileMetadata.fail(paths.filter(path => !received.has(path)), 'The server returned no file metadata.');
  } catch (error) {
    state.fileMetadata.fail(paths, error.message);
  } finally {
    fileInformationBusy = false;
    refreshFileDisplays();
    scheduleFileInformation();
  }
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
        element('p', { className: 'diagnostic-message' }, renderDecodedText(entry.message))),
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

function assertionGroups(items, options = {}) {
  return annotateCards(colorAssertionBalls(assertionView.groups(items, options), items), items, options);
}

async function annotateAssertions(items, signal, generation) {
  if (!items.length || items.every(item => typeof item.available === 'boolean')) return items;
  const reply = await api('assertions/annotations', {}, { method: 'POST', body: { ids: items.map(item => item.id) }, signal });
  if (Number.isSafeInteger(generation) && reply.generation !== generation) throw new APIError('The loaded generation changed while term links were indexed. Refresh this view.', 'generation_changed');
  const byId = new Map(reply.items.map(item => [item.id, item]));
  return items.map(item => {
    const annotated = byId.get(item.id);
    if (!annotated?.available) return item;
    return { ...item, expression: annotated.expression, mtExpression: annotated.mtExpression };
  });
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
  if (state.status && status.generation < state.status.generation) return;
  const changed = !state.status || status.generation !== state.status.generation;
  if (changed) state.contexts.clear();
  state.status = status;
  if (changed) annotations.invalidate({ generation: status.generation });
  state.fileMetadata.status(status);
  if (changed) window.dispatchEvent(new CustomEvent('powder-generation-change', { detail: { generation: status.generation } }));
  for (const file of status.files ?? []) {
    const path = canonicalPath(file.path);
    if (path) state.knownSources.add(path);
  }
  $('#generation-state').textContent = `Generation ${status.generation} · ${number(status.counts?.assertions)} assertions`;
  $('#loaded-count').textContent = `${number(status.files?.length)} loaded ${status.files?.length === 1 ? 'source' : 'sources'}`;
}

function rememberCatalog(catalog) {
  state.catalog = catalog;
  state.fileMetadata.catalog(catalog);
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
        sourceLink(file.path, 1, file.path, undefined, { compact: false }),
        Number.isSafeInteger(file.count) && element('span', { className: 'file-measure' }, `${number(file.count)} assertions`)),
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
    link('Search all indexed files and definitions', 'catalog', {}, 'button secondary'),
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
  if (!isPredicates) {
    const { renderTermCategories } = await import('./term-categories.js');
    return renderTermCategories({ api, element, heading, link, presentation, propertyList }, route, signal);
  }
  const q = route.params.get('q') ?? '';
  const data = await api(isPredicates ? 'predicates' : 'search', { q, offset: route.offset, limit: route.limit }, { signal });
  const panel = element('div', {},
    heading(isPredicates ? 'Predicate catalog' : 'Term search',
      isPredicates ? 'Actual semantic arities, without synthetic context arguments.' : 'Search constants and nested predicate or function heads in the active KB.'),
    searchForm(route.name, q, isPredicates ? 'Filter predicate names…' : 'Filter semantic terms…', isPredicates ? 'Search predicates' : 'Search terms'));
  panel.append(link('Search predicates across all indexed files', 'catalog', { q, group: 'predicates' }, 'button secondary'));
  if (data.items?.length) {
    const table = element('table', { className: 'data-table' },
      element('thead', {}, element('tr', {}, element('th', { scope: 'col' }, isPredicates ? 'Predicate' : 'Term'),
        isPredicates && element('th', { scope: 'col' }, 'Arity'), element('th', { scope: 'col', className: 'numeric' }, 'Assertions'))),
      element('tbody', {}, data.items.map(item => element('tr', {},
        element('td', {}, link(symbolLabel(item.term), 'term', { term: item.term }, 'term-name'),
          element('div', {}, link('Definitional Info', 'definitions', { term: item.term }))),
        isPredicates && element('td', {}, item.arity), element('td', { className: 'numeric' }, number(item.count))))));
    panel.append(element('div', { className: 'table-scroll' }, table));
  } else panel.append(empty('No matching results', q ? 'Try a shorter name or clear the search.' : 'Load a source to populate the semantic indexes.',
    q ? link('Clear search', route.name, {}, 'button secondary') : link('Choose KB Sources', 'sources', {}, 'button')));
  panel.append(pagination(data, route));
  if (!isPredicates) panel.append(element('section', { className: 'nat-search-entry' },
    element('h2', {}, 'Non-atomic terms'),
    element('p', { className: 'muted' }, 'Browse complete NART/NAUT candidates by constructor, actual type evidence and reification status. Unknown status is retained.'),
    link('Browse non-atomic terms by category', 'nats', { q }, 'button secondary')));
  return panel;
}

async function natsPage(route, signal) {
  const { renderNatBrowser } = await import('./nat-browser.js');
  return renderNatBrowser({ api, element, heading, link, button, pagination }, route, signal);
}

async function termPage(route, signal) {
  if (route.name === 'term' && route.params.get('section') === 'definition') {
    return catalogPage({ ...route, name: 'definitions' }, signal);
  }
  const isMT = route.name === 'microtheory';
  let value = route.params.get(isMT ? 'mt' : 'term');
  if (!value) throw new APIError(`Choose a ${isMT ? 'microtheory' : 'term'} to browse.`, 'missing_parameter');
  const filters = isMT ? {} : Object.fromEntries(['section', 'arg', 'predicate', 'mt', 'source'].map(key => [key, route.params.get(key)]));
  const [data] = await Promise.all([
    api(isMT ? 'microtheory' : 'term', { [isMT ? 'mt' : 'term']: value, offset: route.offset, limit: route.limit, ...filters }, { signal }),
    ensureMappingIds(signal).catch(error => { if (error.name === 'AbortError') throw error; }),
  ]);
  if (!isMT && data.resolvedAs === 'microtheory') {
    const params = new URLSearchParams({ mt: data.mt, limit: String(route.limit), offset: String(route.offset) });
    const resolved = { ...route, name: 'microtheory', params };
    history.replaceState(null, '', routeHref('microtheory', Object.fromEntries(params)));
    const panel = await microtheoryPage(resolved, signal);
    panel.resolvedRoute = resolved;
    return panel;
  }
  if (!isMT && typeof data.term === 'string' && data.term.startsWith('nat:')) {
    value = data.term;
    route.params.set('term', value);
    history.replaceState(null, '', routeHref(route.name, Object.fromEntries(route.params)));
  }
  const contextKey = isMT ? data.mt ?? value : null;
  if (isMT) {
    rememberContext(contextKey, data.mtExpression);
    route.params.set('mt', contextKey);
  }
  const title = isMT ? mtName(contextKey, data.mtExpression)
    : data.expression ? renderExpression(data.expression, { inline: true, pretty: false }) : symbolLabel(value);
  const panel = element('div', {},
    heading(title, isMT ? 'Assertions in this microtheory, in source order.' : 'Assertions containing this semantic term. Follow a symbol to continue exploring.',
      isMT ? link('Query this context', 'query', { mt: contextKey }, 'button secondary')
        : link('Definitional Info · all files', 'definitions', { term: value }, 'button secondary')));
  panel.append(annotationContextControl(route, signal));
  const termAnnotations = element('div', { className: 'term-native-annotations' });
  panel.append(termAnnotations);
  annotations.attach(termAnnotations, isMT ? contextKey : value, { context: annotationContext(route), signal });
  panel.contextualData = { route, data, term: isMT ? null : value, mt: contextKey };
  if (!isMT && data.navigation?.occurrences) panel.append(termOccurrencesPanel(value, data.navigation.occurrences));
  if (data.known === false) panel.append(element('p', { className: 'term-evidence-note', role: 'status' }, data.message));
  if (data.termInfo) panel.append(natTypeInformation(data.termInfo), termEvidencePanel(data.termInfo, value));
  const itemsWithLinks = await annotateAssertions(data.items ?? [], signal, data.generation);
  let items = itemsWithLinks;
  let displayedData = data;
  if (!isMT) {
    if (!data.navigation) {
      items = filterContextItems(items, value, route.params);
      if ((data.offset ?? 0) === 0 && data.total === data.items.length) displayedData = { ...data, total: items.length };
    }
    if (route.params.get('viewpoint') === '1') panel.append(viewpointControls(route, data, value));
    if (route.params.get('section') === 'definition') panel.append(element('p', { className: 'muted definition-help' },
      'Definitional Info is where this term is used as an argument of schema relations, such as argIsa or arity, not where it is applied as a predicate. These are stored assertions, not inferred definitions.'));
    const role = route.params.get('role') ?? 'all';
    const roleFilter = selectField('Role on this page', 'role', role,
      [['all', 'All roles'], ['predicate', 'Top-level predicate'], ['argument', 'Argument'], ['nested', 'Nested predicate / function head']],
      event => updateRoute({ role: event.target.value }));
    panel.append(element('div', { className: 'role-toolbar', 'data-viewpoint': String(route.params.get('viewpoint') === '1') }, roleFilter,
      element('span', { className: 'muted' }, 'Role filters apply to this page; pagination counts all occurrences.')));
    if (role !== 'all') items = items.filter(item => assertionRoles(item.expression, value).includes(role));
    if (Object.values(filters).some(value => value && value !== 'all' && value !== '0')) {
      panel.append(element('div', { className: 'context-filter-status' },
        element('span', {}, `${number(displayedData.total)} matching assertions${!data.navigation && displayedData === data ? ' (page coverage)' : ''}`),
        link('Clear viewpoint filters', 'term', { term: value }, 'text-button')));
    }
  }
  panel.append(items.length
    ? assertionGroups(items, { offset: route.offset, term: isMT ? undefined : value })
    : empty('No assertions on this page', isMT ? 'This microtheory has no assertions at the current offset.' : 'Try another role or page, or load a source containing this term.'),
  pagination(displayedData, route));
  if (isMT || (!data.termInfo && data.total > 0)) {
    const evidence = element('div', { className: 'term-evidence-host', 'aria-busy': 'true' }, element('p', { className: 'muted' }, 'Reading loaded term evidence...'));
    panel.append(evidence);
    api('term/info', { term: isMT ? contextKey : value }, { signal }).then(info => {
      if (signal.aborted) return;
      if (isMT && info.nat?.expression) {
        rememberContext(contextKey, info.nat.expression);
        panel.querySelector('h1').replaceChildren(renderExpression(info.nat.expression, { inline: true, pretty: false }));
      }
      evidence.replaceChildren(...[
        natTypeInformation(info), termEvidencePanel(info, isMT ? info.term.identity : value),
        isMT ? termOccurrencesPanel(info.term.identity, info.occurrences) : null,
      ].filter(Boolean));
    }).catch(error => {
      if (error.name !== 'AbortError') evidence.replaceChildren(element('p', { className: 'statistics-error', role: 'status' }, `Term evidence unavailable: ${error.message}`));
    }).finally(() => evidence.setAttribute('aria-busy', 'false'));
  }
  return panel;
}

function natTypeInformation(info) {
  const nat = info.nat;
  if (!nat) return null;
  const vocabulary = new Map((info.representationVocabulary ?? []).map(item => [item.term, item.available]));
  const representationLink = name => vocabulary.get(name) ? link(symbolLabel(name), 'term', { term: name }) : element('span', {}, symbolLabel(name));
  const kinds = nat.representation?.kinds ?? [];
  const representation = nat.representation?.status === 'unknown' ? 'Unknown: no recognized reification export'
    : kinds.map(kind => kind === 'nart' ? 'Reified (NART) export' : 'Unreified (NAUT) export').join(' / ');
  const panel = element('section', { className: 'nat-type-information' },
    element('h2', {}, 'Inferred isa / type evidence'),
    element('p', { className: 'muted' }, 'No additional isa inference was run to build this index. Representation, asserted types and constructor constraints are distinguished below; none is a rule-utility score.'),
    element('p', {}, 'Term representation: ', representationLink('x_CycLNonAtomicTerm'),
      ' (indexed denoting application, not an isa assertion about the denoted object).'),
    element('p', {}, 'Reification: ', representation,
      kinds.includes('nart') && element('span', {}, ' · ', representationLink('x_CycLNonAtomicReifiedTerm'))),
    element('ul', { className: 'nat-type-evidence' }, (nat.typeConstraints ?? []).map(type => {
      const relations = (type.predicates ?? []).map(predicate => ({
        x_isa: 'asserted isa', x_resultIsa: 'constructor resultIsa', x_resultGenl: 'constructor resultGenl (not isa)',
      })[predicate] ?? symbolLabel(predicate));
      return element('li', {},
        type.available ? link(type.label, 'term', { term: type.identity }) : element('span', {}, type.label),
        element('span', { className: 'muted' }, ` · ${relations.join(', ')}`),
        element('details', {}, element('summary', {}, `${type.evidenceCount} evidence records`),
          element('ul', {}, (type.evidence ?? []).map(evidence => element('li', {},
            link(evidence.assertionId, 'assertion', { id: evidence.assertionId }), ' ',
            sourceLink(evidence.source, evidence.line, evidence.source), ' ', mtLink(evidence.mt))))));
    })));
  if (!nat.typeConstraints?.length) panel.append(element('p', { className: 'muted' }, 'No positive whole-term isa or constructor type constraint is recorded.'));
  panel.append(link('Explore categories and full type facets', 'nats', { q: nat.identity, match: 'exact' }),
    button('Ask for isa types', () => runLiteralQuery({
      expression: { type: 'application', head: { type: 'symbol', value: 'x_isa' }, args: [nat.expression, { type: 'variable', value: '?TYPE' }] },
      mt: '', limit: 20, timeout: 3,
    }), 'button secondary'));
  return panel;
}

function termEvidencePanel(info, term) {
  const detail = element('details', { className: 'term-occurrences' },
    element('summary', {}, 'Term evidence and context roles'),
    element('p', { className: 'muted' }, 'Observed loaded-data positions, not a claim of inferred truth or a locally implemented method. Reification is unknown unless supported by explicit evidence.'),
    element('p', {}, `Semantic mentions: ${number(info.totals?.semantic)}; assertions using this exact term as their context: ${number(info.totals?.context)}.`),
    element('p', {}, 'Recorded roles: ', (info.term?.roles ?? []).join(', ')),
    element('ul', {}, (info.evidence ?? []).map(evidence => element('li', {},
      link(evidence.assertionId, 'assertion', { id: evidence.assertionId }), ' ',
      sourceLink(evidence.source, evidence.line, evidence.source), ' ',
      element('span', { className: 'muted' }, evidence.role)))));
  const keys = info.term?.contextKeys ?? [];
  if (keys.length) detail.append(element('p', {}, 'Observed microtheory positions: ',
    keys.map(key => mtLink(key, info.term?.expression))));
  if (info.term?.roles?.includes('constructor_symbol')) detail.append(link('Browse complete terms with this constructor', 'nats', { constructor: info.term.identity }));
  detail.dataset.term = term;
  return detail;
}

function termOccurrencesPanel(term, occurrences) {
  const contexts = occurrences.microtheories ?? [];
  const files = occurrences.sources ?? [];
  return element('details', { className: 'term-occurrences' },
    element('summary', {}, `Occurs in ${number(contexts.length)} microtheories and ${number(files.length)} source files`),
    element('p', { className: 'muted' }, `${number(occurrences.assertions)} distinct assertions mentioning this exact term in the loaded KB, before page and viewpoint filters. Context-only membership and unloaded corpus inventory are not included.`),
    element('h2', {}, 'Microtheories'),
    element('ul', {}, contexts.map(context => element('li', {},
      mtLink(context.mt, context.mtExpression), ' ',
      link(`${number(context.count)} assertions mentioning this term`, 'term', { term, mt: context.mt, view: 'references' })))),
    element('h2', {}, 'Original source files'),
    element('ul', {}, files.map(file => element('li', {},
      sourceLink(file.source, file.firstLine || 1, file.source), ' ',
      link(`${number(file.count)} assertions`, 'term', { term, source: file.source, view: 'references' }),
      element('span', { className: 'occurrence-evidence' }, ' Evidence: ',
        (file.evidence ?? []).flatMap((entry, index) => [index ? ', ' : '', link(entry.id, 'assertion', { id: entry.id })]))))));
}

function viewpointControls(route, data, term) {
  const index = data.navigation ?? pageTermNavigation(term, data.items ?? []);
  const contexts = new Map();
  for (const predicate of index.predicates) for (const context of predicate.microtheories) contexts.set(context.mt, context);
  const change = key => event => updateRoute({ [key]: event.target.value, offset: 0 });
  return element('section', { className: 'viewpoint-controls', 'aria-label': 'Viewpoint filters' },
    element('h2', {}, 'Viewpoint Filters'),
    element('p', { className: 'muted' }, 'Filter stored assertions, not inferred answers. These controls do not execute a query.'),
    element('div', { className: 'filter-grid' },
      selectField('Assertion section', 'section', route.params.get('section') || 'all',
        index.sections.map(section => [section.key, section.label]), change('section')),
      selectField('Argument position', 'arg', route.params.get('arg') || '0',
        [['0', 'Any position'], ...index.arguments.map(argument => [String(argument.position), `Arg ${argument.position}`])], change('arg')),
      selectField('Predicate', 'predicate', route.params.get('predicate') || '',
        [['', 'Any predicate'], ...index.predicates.map(predicate => [predicate.term, symbolLabel(predicate.term)])], change('predicate')),
      selectField('Microtheory', 'mt', route.params.get('mt') || '',
        [['', 'Any microtheory'], ...[...contexts.values()].map(context => [context.mt, contextLabel(context.mt, context.mtExpression)])], change('mt'))));
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
    [...state.contexts.keys()].sort().map(mt => element('option', { value: contextInputText(mt, state.contexts.get(mt)) })));
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
          element('span', { className: 'context-count' }, `${number(item.count)} context assertions${item.referencedOnly ? ' · referenced/declared only' : ''}`));
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
    contextForm(), loadedMTTree({ api, element, link, mtLink, sourceLink }, signal), directory);
}

function recordedMicrotheoryPanel(key, signal) {
  const panel = element('section', { className: 'mt-inventory', 'aria-label': 'Recorded inheritance and inventory' },
    element('h2', {}, 'Recorded inheritance & inventory'),
    element('p', { className: 'muted' }, 'Explore saved genlMt relationships and the files behind each MT. This tree does not enable runtime inheritance or load any source.'));
  let expandedCount = 0;
  const nodeRequests = new WeakMap();
  const count = value => Number.isSafeInteger(value) && value >= 0 ? number(value) : 'unavailable';
  const reference = row => row.mtExpression ? mtLink(row.mt, row.mtExpression)
    : link(typeof row.label === 'string' ? row.label : contextLabel(row.mt), 'microtheory', { mt: row.mt }, 'mt-link');
  const load = (mt, section, offset = 0) => api('microtheory/statistics', { mt, section, offset, limit: 25 }, { signal });
  const failure = (target, error, retry) => {
    if (error.name !== 'AbortError') target.replaceChildren(
      element('p', { className: 'statistics-error', role: 'alert' }, error.message), button('Retry statistics', retry, 'text-button'));
  };
  function pager(data, change) {
    if (!Number.isSafeInteger(data.total)) return null;
    const range = pageRange(data.total, data.offset, data.limit);
    const previous = button('Previous', () => change(range.previous), 'button secondary');
    const next = button('Next', () => change(range.next), 'button secondary');
    previous.disabled = !range.hasPrevious; next.disabled = !range.hasNext;
    return element('nav', { className: 'pagination', 'aria-label': 'Recorded inventory pagination' },
      element('span', {}, `${number(range.start)}–${number(range.end)} of ${number(data.total)}`), previous, next);
  }
  function snapshotFiles(row) {
    const roles = { content: 'Content contributor', referenced_only: 'Referenced only — no content',
      declaration_only: 'Declaration only — no content', reference_unclassified: 'Reference recorded — content coverage unknown' };
    return element('li', { 'data-file-role': row.role },
      sourceLink(row.path, row.line ?? 1, row.path ?? row.recordedPath),
      element('span', { className: 'badge source-role-badge' }, roles[row.role] ?? 'Unclassified file'),
      row.role === 'content' && element('span', { className: 'muted' }, `${count(row.assertionCount)} assertions`));
  }
  function relationRow(row) {
    return element('li', {},
      statisticsSymbol(row.predicate),
      element('span', { className: 'muted' }, row.position === 'asArg1' ? '(this MT, other)' : '(other, this MT)'),
      reference(row), element('span', { className: 'muted' }, `${count(row.supportCount)} supports`),
      (row.evidence ?? []).map(evidence => sourceLink(evidence.path, evidence.line ?? 1, evidence.path ?? evidence.recordedPath)));
  }
  function inventorySection(mt, section, label) {
    const target = element('div', { className: 'mt-inventory-section-body' });
    const disclosure = element('details', { className: 'mt-inventory-section', 'data-section': section },
      element('summary', {}, label), target);
    let loaded = false, sequence = 0;
    async function show(offset = 0) {
      const current = ++sequence;
      target.setAttribute('aria-busy', 'true');
      target.replaceChildren(element('p', { className: 'muted' }, 'Reading recorded inventory…'));
      try {
        const data = await load(mt, section, offset);
        if (signal.aborted || current !== sequence) return;
        if (!Array.isArray(data.items)) throw new APIError('This inventory section was not returned.');
        let catalogWarning = null;
        if (['files', 'relations'].includes(section) && !state.catalog) {
          try { rememberCatalog(await api('kb/catalog', {}, { signal })); }
          catch (error) {
            if (error.name === 'AbortError') throw error;
            catalogWarning = 'Source catalog unavailable; unresolved source paths are shown as text.';
          }
        }
        if (signal.aborted || current !== sequence) return;
        const rows = data.items.map(row => section === 'files' ? snapshotFiles(row) : section === 'relations' ? relationRow(row)
          : statisticsPredicate(row, row.dialect, offset => api('microtheory/statistics/arities',
            { mt, symbol: row.name, offset, limit: 25 }, { signal }), signal));
        target.replaceChildren(rows.length ? element('ul', { className: 'statistics-rows' }, rows)
          : element('p', { className: 'muted' }, data.total === null ? 'Coverage is unavailable, not zero.' : 'No entries were recorded on this page.'),
        pager(data, show));
        if (catalogWarning) target.append(element('p', { className: 'muted' }, catalogWarning));
        if (['missing', 'unavailable'].includes(data.summary?.state)) target.append(
          element('p', { className: 'muted' }, data.summary.messages?.[0]), button('Retry section', () => show(offset), 'text-button'));
        loaded = true;
      } catch (error) { failure(target, error, () => show(offset)); }
      finally { if (current === sequence) target.setAttribute('aria-busy', 'false'); }
    }
    disclosure.addEventListener('toggle', () => { if (disclosure.open && !loaded) show(); });
    return disclosure;
  }
  function neighbor(row, ancestors) {
    const branch = element('div', { className: 'mt-inventory-branch', hidden: true });
    const item = element('li', { className: 'mt-inventory-neighbor', 'data-recorded-mt': row.mt });
    let started = false;
    const blocked = hierarchyExpansionBlock(row.mt, ancestors, expandedCount);
    const expand = button('+', () => {
      const open = branch.hidden;
      branch.hidden = !open; expand.textContent = open ? '−' : '+';
      expand.setAttribute('aria-expanded', String(open));
      if (open && !started) {
        const reason = hierarchyExpansionBlock(row.mt, ancestors, expandedCount);
        if (reason) branch.replaceChildren(element('p', { className: 'muted' }, reason));
        else { started = true; expandedCount++; showNode(row.mt, branch, ancestors); }
      }
    }, 'expand-button');
    expand.setAttribute('aria-expanded', 'false');
    expand.setAttribute('aria-label', `Expand recorded MT ${row.label ?? contextLabel(row.mt)}`);
    expand.disabled = Boolean(blocked) || row.catalogued === false;
    item.append(element('div', { className: 'mt-inventory-neighbor-row' }, expand, reference(row),
      element('span', { className: 'muted' }, `${count(row.assertionCount)} catalogued assertions · ${count(row.supportCount)} supports`)),
    blocked && element('p', { className: 'muted cycle-notice' }, blocked),
    row.catalogued === false && element('p', { className: 'muted' }, 'No snapshot catalog entry for this MT.'), branch);
    return item;
  }
  function hierarchyGroup(mt, section, data, ancestors) {
    const target = element('div', { className: 'mt-inventory-direction', 'data-direction': section });
    const label = section === 'parents' ? 'Recorded parents · genlMt(this MT, parent)' : 'Recorded children · genlMt(child, this MT)';
    let sequence = 0;
    const draw = page => {
      target.replaceChildren(element('h3', {}, label),
        page.items?.length ? element('ul', { className: 'mt-inventory-neighbors' }, page.items.map(row => neighbor(row, ancestors)))
          : element('p', { className: 'muted' }, page.total === null ? 'Hierarchy coverage unavailable.' : 'No relationships recorded.'),
        pager(page, async function changePage(offset) {
          const current = ++sequence;
          target.setAttribute('aria-busy', 'true');
          try { const result = await load(mt, section, offset); if (!signal.aborted && sequence === current) draw(result); }
          catch (error) { failure(target, error, () => changePage(offset)); }
          finally { if (sequence === current) target.setAttribute('aria-busy', 'false'); }
        }));
    };
    draw(data);
    return target;
  }
  async function showNode(mt, target, ancestors) {
    const token = Symbol();
    nodeRequests.set(target, token);
    target.setAttribute('aria-busy', 'true');
    target.replaceChildren(element('p', { className: 'muted' }, 'Reading recorded MT statistics…'));
    try {
      const data = await load(mt, 'overview');
      if (signal.aborted || nodeRequests.get(target) !== token) return;
      if (!data.summary || !data.parents || !data.children) throw new APIError('The recorded MT statistics response is incomplete.');
      const summary = data.summary, counts = summary.counts ?? {};
      const modified = typeof summary.inventoryModified === 'number' ? new Date(summary.inventoryModified * 1000).toLocaleString() : 'unavailable';
      target.replaceChildren(element('div', { className: 'mt-inventory-node-summary' }, reference(summary),
        element('p', {}, `${count(counts.assertions)} assertions · ${count(counts.predicateFunctions)} predicates/functions · ${count(counts.contentFiles)} content files · ${count(counts.referencedOnlyFiles)} referenced-only files`),
        element('p', { className: 'statistics-stamp' }, `${sourceStatisticsStamp(summary)} · Inventory file modified: ${modified}`)));
      if (!ancestors.length || ['missing', 'unavailable', 'partial'].includes(summary.state)) target.append(
        element('ul', { className: 'statistics-notes' }, (summary.messages ?? []).map(message => element('li', {}, message))));
      if (['missing', 'unavailable'].includes(summary.state)) {
        target.append(button('Retry MT statistics', () => showNode(mt, target, ancestors), 'text-button'));
        return;
      }
      target.append(inventorySection(mt, 'files', 'Files contributing content or references'),
        inventorySection(mt, 'predicates', 'Recorded predicates/functions'),
        inventorySection(mt, 'relations', 'Recorded MT relations and evidence'),
        hierarchyGroup(mt, 'parents', data.parents, [...ancestors, mt]),
        hierarchyGroup(mt, 'children', data.children, [...ancestors, mt]));
    } catch (error) { if (nodeRequests.get(target) === token) failure(target, error, () => showNode(mt, target, ancestors)); }
    finally { if (nodeRequests.get(target) === token) target.setAttribute('aria-busy', 'false'); }
  }
  const root = element('div', { className: 'mt-inventory-tree', 'data-recorded-mt': key });
  const refresh = () => { expandedCount = 1; showNode(key, root, []); };
  panel.append(button('Refresh recorded tree', refresh, 'text-button'), root);
  refresh();
  return panel;
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
  detail.insertBefore(recordedMicrotheoryPanel(route.params.get('mt'), signal), directory);
  detail.insertBefore(loadedMTTree({ api, element, link, mtLink, sourceLink }, signal, route.params.get('mt')), directory);
  return detail;
}

async function assertionPage(route, signal) {
  const id = route.params.get('id');
  if (!id) throw new APIError('An assertion ID is required.', 'missing_parameter');
  const [original] = await Promise.all([
    api('assertion', { id }, { signal }),
    ensureMappingIds(signal).catch(error => { if (error.name === 'AbortError') throw error; }),
  ]);
  const [assertion] = await annotateAssertions([original], signal);
  const mapping = splitMappingRows(mappingRowsOf(assertion));
  const editor = renderAssertionAnnotationEditor({
    entity: id, initialContext: annotationContext(route), signal, reference: nativeReference,
    readAssertion: (body, options) => api('tva/assertion', {}, { ...options, method: 'POST', body }),
    saveAssertion: (body, options) => api('tva/assertion/save', {}, { ...options, method: 'POST', body }),
    onSaved: reply => {
      annotationRevision = reply.revision;
      annotations.invalidate({ revision: reply.revision, generation: reply.generation });
    },
  });
  return element('div', {},
    heading('Assertion detail', id, copyButton('Copy expression', expressionText(assertion.expression))),
    annotationContextControl(route, signal, context => editor.setContext(context)),
    assertionGroups([assertion], { detail: true }),
    assertionView.utilityPanel({ id, generation: original.generation, signal,
      loadPage: (params, options) => api('rule-utility', params, options) }),
    editor,
    compiledClausePanel(assertion.id, original.generation, signal),
    element('section', { className: 'provenance-section' }, element('h2', {}, 'Source provenance'),
      propertyList([
        { name: 'Assertion ID', value: assertion.id },
        { name: 'Original variable names', value: assertion.names ?? [] },
      ]),
      element('div', {}, 'Original source: ', sourceLink(assertion.source, assertion.line)),
      mapping.ids.length ? element('p', {}, 'Applied mapping IDs, in order: ',
        mapping.ids.flatMap((row, index) => [index ? ', ' : '', mappingLink(row)])) : element('p', { className: 'muted' }, 'No mapping-table rows applied.'),
      mapping.markers.length > 0 && element('p', { className: 'muted' }, `${number(mapping.markers.length)} mapping diagnostic markers are shown with the assertion diagnostics above; they are not mapping-table IDs.`)));
}

function compiledClausePanel(id, generation, signal) {
  const body = element('div', { 'aria-busy': 'true' }, element('p', { className: 'muted' }, 'Reading the active native clause...'));
  const section = element('section', { className: 'compiled-prolog-section' }, element('h2', {}, 'Compiled Prolog'), body);
  api('assertion/compiled', { id, generation }, { signal }).then(data => {
    if (signal.aborted) return;
    body.replaceChildren(
      element('p', { className: 'muted' }, 'Current native clause, including its module-qualified x_cid guard. Computed on demand; not an original import payload or retained metadata copy.'),
      element('pre', { className: 'compiled-prolog' }, element('code', {}, data.clause)),
      copyButton('Copy compiled Prolog', data.clause));
  }).catch(error => {
    if (error.name !== 'AbortError') body.replaceChildren(element('p', { className: 'statistics-error', role: 'status' }, `Compiled clause unavailable: ${error.message}`));
  }).finally(() => body.setAttribute('aria-busy', 'false'));
  return section;
}

async function sourcePage(route, signal) {
  const path = canonicalPath(route.params.get('path'));
  if (!path) throw new APIError('This path is not in the authorized KB source catalog.', 'source_not_authorized');
  const line = positiveInteger(route.params.get('line'), 1, Number.MAX_SAFE_INTEGER, 1);
  if (!sourceEditor) {
    const { createSourceEditorWorkspace } = await import('./source-editor.js');
    sourceEditor = createSourceEditorWorkspace({
      read: path => api('source/editor', { path }),
      save: body => api('source/editor', {}, { method: 'POST', body }),
      renderFileRef: (path, label) => { state.knownSources.add(path); return sourceLink(path, 1, label); },
      onOpen: opened => {
        if (!sourceOpenCount && parseRoute(location.hash).name === 'source') {
          history.replaceState(null, '', routeHref('source', { path: opened }));
          acceptedRoute = location.hash;
        }
      },
      onSaved: (saved, result) => {
        state.fileMetadata.records.delete(saved);
        refreshFileDisplays(); scheduleFileInformation();
        showNotice(result.unchanged ? 'Source unchanged.' : 'Source saved. Loaded KB and generation are unchanged; reload separately.');
      },
    });
  }
  const host = element('div', { className: 'source-workspace-host' });
  const page = element('div', {}, heading('Source workspace', 'CodeMirror · Common Lisp colorization · Save writes only this file; loading is a separate action.'), host);
  sourceEditor.mount(host);
  sourceOpenCount++;
  try { await sourceEditor.open(path, { line }); } finally { sourceOpenCount--; }
  return page;
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
    state.fileMetadata.clearOperations(body.files ?? []);
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

function statisticsSymbol(name, dialect) {
  if (typeof name !== 'string') return element('span', {}, 'Unknown symbol');
  const label = dialect === 'metta' && ['=', 'x_='].includes(name) ? 'metta=' : symbolLabel(name);
  return name.startsWith('x_') ? link(label, 'term', { term: name }) : element('span', {}, label);
}

function statisticsPredicate(item, dialect, loadArities, signal) {
  const count = value => Number.isSafeInteger(value) && value >= 0 ? number(value) : 'unknown';
  const arity = value => value === null ? 'unknown arity' : count(value);
  const occurrences = row => `${count(row.headOccurrenceCount)} head occurrences · ${count(row.declarationReferenceCount)} declaration references`;
  const arities = Array.isArray(item.arities) ? item.arities : [item.arity];
  const more = Number.isSafeInteger(item.arityCount) && item.arityCount > arities.length
    ? `, +${number(item.arityCount - arities.length)} more` : '';
  const row = element('li', { 'data-statistics-symbol': item.name },
    statisticsSymbol(item.name, dialect),
    element('span', { className: 'muted' }, `Arity ${arities.map(arity).join(', ')}${more}`),
    element('span', { className: 'muted' }, occurrences(item)),
    item.mt && mtLink(item.mt));
  if (!Number.isSafeInteger(item.arityBreakdownTotal)) return row;
  const body = element('div');
  const disclosure = element('details', { className: 'statistics-arity-breakdown' },
    element('summary', {}, `Arity breakdown (${number(item.arityBreakdownTotal)} recorded rows)`), body);
  let loaded = false, sequence = 0;
  async function show(offset = 0) {
    const current = ++sequence;
    body.setAttribute('aria-busy', 'true');
    body.replaceChildren(element('p', { className: 'muted' }, 'Reading arity occurrences…'));
    try {
      const data = await loadArities(offset);
      if (signal.aborted || current !== sequence) return;
      if (!Array.isArray(data.items) || data.items.length > 25 || !Number.isSafeInteger(data.total)) {
        throw new APIError(data.summary?.messages?.[0] ?? 'Arity coverage is unavailable, not zero.');
      }
      const range = pageRange(data.total, offset, 25);
      const previous = button('Previous arities', () => show(range.previous), 'button secondary');
      const next = button('Next arities', () => show(range.next), 'button secondary');
      previous.disabled = !range.hasPrevious; next.disabled = !range.hasNext;
      body.replaceChildren(element('ul', { className: 'statistics-arity-rows' }, data.items.map(part =>
        element('li', {}, element('span', {}, `Arity ${arity(part.arity)}`),
          element('span', { className: 'muted' }, occurrences(part)), part.mt && mtLink(part.mt)))),
      element('nav', { className: 'statistics-arity-pagination', 'aria-label': `Arity records for ${symbolLabel(item.name)}` },
        element('span', { className: 'muted' }, `${number(range.start)}–${number(range.end)} of ${number(data.total)} recorded rows`),
        previous, next));
      loaded = true;
    } catch (error) {
      if (signal.aborted || current !== sequence || error.name === 'AbortError') return;
      body.replaceChildren(errorPanel(error), button('Retry arity breakdown', () => show(offset), 'text-button'));
    } finally {
      if (current === sequence) body.setAttribute('aria-busy', 'false');
    }
  }
  disclosure.addEventListener('toggle', () => { if (disclosure.open && !loaded) show(); });
  row.append(disclosure);
  return row;
}

function sourceStatisticsDetails(path, signal, onSummary) {
  const body = element('div', { className: 'source-statistics-detail' });
  const details = element('details', { className: 'source-statistics-disclosure' },
    element('summary', { 'aria-label': `Statistics details for ${path}` }, 'Details'), body);
  let section = 'content', mt = '', offset = 0, request = 0, loaded = false;
  const choose = (next, context = '', start = 0) => {
    section = next; mt = context; offset = start;
    refresh();
  };
  async function refresh() {
    const current = ++request;
    body.setAttribute('aria-busy', 'true');
    body.replaceChildren(element('p', { className: 'muted' }, 'Reading recorded statistics…'));
    try {
      const data = await api('kb/statistics/detail', { path, section, mt, offset, limit: 50 }, { signal });
      if (signal.aborted || current !== request) return;
      if (!data.summary || !Array.isArray(data.items)) throw new APIError('The statistics response is incomplete.');
      onSummary(data.summary);
      const summary = data.summary;
      const header = element('div', {},
        element('p', { className: 'statistics-stamp' }, sourceStatisticsStamp(summary)),
        element('p', {}, sourceStatisticsText(summary)),
        element('ul', { className: 'statistics-notes' }, (summary.messages ?? []).map(message => element('li', {}, message))));
      const sections = [['content', 'MTs with content'], ['references', 'Referenced MTs'], ['predicates', 'Predicates/functions']];
      const navigation = element('div', { className: 'statistics-tabs', role: 'group', 'aria-label': `Statistics view for ${path}` },
        sections.map(([key, label]) => {
          const control = button(label, () => choose(key), 'button secondary');
          control.setAttribute('aria-pressed', String(key === section));
          return control;
        }));
      const countText = value => Number.isSafeInteger(value) && value >= 0 ? number(value) : 'unknown';
      const rows = element('ul', { className: 'statistics-rows' }, data.items.map(item => {
        if (section === 'predicates') {
          const context = mt;
          return statisticsPredicate(item, summary.dialect, offset => api('kb/statistics/arities',
            { path, symbol: item.name, mt: context, offset, limit: 25 }, { signal }), signal);
        }
        return element('li', {}, mtLink(item.key),
          element('span', { className: 'muted' }, section === 'content'
            ? `${countText(item.assertionCount)} assertions · ${countText(item.predicateFunctions)} recorded predicates/functions`
            : `${countText(item.relationEndpointOccurrences)} recorded relation endpoint occurrences`),
          section === 'content' && button('Show predicates/functions', () => choose('predicates', item.key), 'text-button'));
      }));
      body.replaceChildren(header, navigation);
      if (mt) body.append(element('p', {}, 'In ', mtName(mt),
        button('Show all content MTs', () => choose('predicates'), 'text-button')));
      if (data.items.length) body.append(rows);
      else body.append(element('p', { className: 'muted' }, data.total === null
        ? 'This statistics section is unavailable, not empty.'
        : 'No entries were recorded in this section on this page.'));
      if (Number.isSafeInteger(data.total)) {
        const range = pageRange(data.total, offset, 50);
        const previous = button('Previous', () => choose(section, mt, range.previous), 'button secondary');
        const next = button('Next', () => choose(section, mt, range.next), 'button secondary');
        previous.disabled = !range.hasPrevious; next.disabled = !range.hasNext;
        body.append(element('nav', { className: 'pagination', 'aria-label': `Statistics pages for ${path}` },
          element('span', {}, `${number(range.start)}–${number(range.end)} of ${number(data.total)}`), previous, next));
      }
      body.append(element('p', { className: 'muted' }, 'Term and MT links browse the active KB only. Reading statistics does not load this file.'),
        button('Refresh statistics', refresh, 'text-button'));
      loaded = true;
    } catch (error) {
      if (error.name === 'AbortError' || current !== request) return;
      body.replaceChildren(element('p', { className: 'statistics-error', role: 'alert' }, error.message),
        button('Retry details', refresh, 'text-button'));
    } finally {
      if (current === request) body.setAttribute('aria-busy', 'false');
    }
  }
  details.addEventListener('toggle', () => { if (details.open && !loaded) refresh(); });
  return details;
}

function sourceStateBadges(path, states) {
  return renderFileBadges(path, states, element);
}

async function sourcePacksPage(route, signal) {
  const { sourcePacksPage: renderPacks } = await import('./source-packs.js');
  return renderPacks({
    api, element, button, link, heading, errorPanel,
    file: path => sourceLink(path, 1, path, null, { compact: false }),
    symbol: name => statisticsSymbol(name), mt: key => mtLink(key),
    draftFiles: () => route.params.has('root') ? [route.params.get('root')] : state.selection?.selectedFiles() ?? [],
    generation: () => state.status.generation,
    isBusy: () => state.mutation, setBusy: setMutation,
    refreshFiles: () => queueMicrotask(() => { refreshFileDisplays(); scheduleFileInformation(); }),
    refreshStatus: async () => { try { setStatus(await api('status')); } catch { /* Keep the last confirmed snapshot. */ } },
    loaded: status => {
      state.fileMetadata.clearOperations((status.files ?? []).map(file => file.path));
      setStatus(status);
      state.selection?.reset((status.files ?? []).map(file => file.path), status.generation);
      refreshFileDisplays();
    },
    rememberId: id => history.replaceState(null, '', routeHref('packs', { id })),
    reload: renderRoute,
  }, route, signal);
}

async function catalogPage(route, signal) {
  const views = await import('./catalog-index.js');
  if (!state.catalog) rememberCatalog(await api('kb/catalog', {}, { signal }));
  const host = {
    api, element, heading, link, pagination,
    file: (path, line = 1) => sourceLink(path, line, path, null, { compact: false }),
    assertions: (items, options) => annotateCards(
      colorAssertionBalls(assertionView.groups(items, options), items),
      items.filter(item => item.loaded), options),
  };
  const render = route.name === 'definitions' ? views.catalogTermPage
    : route.name === 'catalog-assertion' ? views.catalogAssertionPage : views.catalogSearchPage;
  return render(host, route, signal);
}

async function sourcesPage(_route, signal) {
  const [catalog, status] = await Promise.all([
    api('kb/catalog', {}, { signal }), api('status', {}, { signal }),
  ]);
  setStatus(status);
  if (state.status.generation < catalog.generation) setStatus(await api('status', {}, { signal }));
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
  const fileStates = sourceFileStates(model, state.status.files.map(file => file.path), state.fileMetadata);
  const checkboxes = new Map();
  const groupChecks = new Map(), groupCounts = new Map();
  const counts = new Map();
  const statisticsRows = new Map(), snapshots = new Map();
  const directoryRows = new Map(), directorySnapshots = new Map();
  let statisticsBusy = false;
  let directoryBusy = false;
  let directoryTurn = 0;
  function showDirectoryStatistics(path, data) {
    directorySnapshots.set(path, data);
    const target = directoryRows.get(path);
    const coverage = data.coverage ?? {};
    const metric = key => Number.isSafeInteger(coverage[key]) ? number(coverage[key]) : '?';
    const status = data.error ? 'Interrupted' : !data.done ? 'Collecting' : data.state === 'snapshot' ? 'Complete snapshot coverage' : 'Partial snapshot coverage';
    const retry = button('Refresh directory statistics', () => {
      directorySnapshots.delete(path); fetchVisibleDirectoryStatistics();
    }, 'text-button');
    retry.setAttribute('aria-label', `Refresh directory statistics for ${path}`);
    const dates = [data.oldestSnapshotAt, data.newestSnapshotAt].filter(value => typeof value === 'number' && Number.isFinite(value));
    const span = [...new Set(dates)].map(value => new Date(value * 1000).toLocaleString()).join(' – ') || 'unavailable';
    target.dataset.state = data.state;
    target.replaceChildren(element('div', { className: 'statistics-counts' }, directoryStatisticsText(data)),
      element('div', { className: 'statistics-stamp' }, `${status} · ${metric('processedFiles')}/${metric('totalFiles')} descendant files · independent of selection`),
      element('details', { className: 'directory-statistics-coverage' },
        element('summary', {}, 'Coverage'),
        element('p', {}, `${metric('snapshotFiles')} complete · ${metric('missingFiles')} missing · ${metric('partialFiles')} partial · ${metric('staleFiles')} stale · ${metric('unavailableFiles')} unavailable`),
        element('p', {}, `Known counts: assertions ${metric('assertionFiles')}; content MTs ${metric('contentMTFiles')}; referenced MTs ${metric('referenceMTFiles')}; predicate/function symbols ${metric('predicateFiles')} files.`),
        element('p', {}, `Snapshot dates: ${span}`),
        coverage.manifestChanged && element('p', { className: 'statistics-error' }, 'Directory contents changed during aggregation. Refresh for a new manifest.'),
        (data.messages ?? []).map(message => element('p', { className: 'muted' }, message))),
      data.error && element('p', { className: 'statistics-error', role: 'alert' }, data.error),
      data.done && retry);
  }
  async function fetchVisibleDirectoryStatistics() {
    if (directoryBusy || signal.aborted) return;
    directoryBusy = true;
    try {
      while (!signal.aborted) {
        const unfinished = visibleSourceDirectories(model, state.expanded, state.collapsedGroups).filter(candidate => !directorySnapshots.get(candidate)?.done && directoryRows.has(candidate));
        const active = unfinished.filter(candidate => directorySnapshots.get(candidate)?.token);
        const waiting = unfinished.find(candidate => !directorySnapshots.get(candidate)?.token);
        const candidates = active.length < 3 && waiting ? [...active, waiting] : active;
        const path = candidates.length ? candidates[directoryTurn++ % candidates.length] : null;
        if (!path) break;
        const previous = directorySnapshots.get(path);
        if (!previous) directoryRows.get(path).textContent = 'Aggregating all descendant inventories…';
        try {
          const data = await api('kb/statistics/directory', { path, token: previous?.token }, { signal });
          if (signal.aborted) return;
          if (data.path !== path || typeof data.done !== 'boolean' || typeof data.token !== 'string' || !data.token || !data.coverage || !data.counts) {
            throw new APIError('The directory statistics response is incomplete.');
          }
          showDirectoryStatistics(path, data);
        } catch (error) {
          if (error.name === 'AbortError') return;
          showDirectoryStatistics(path, { ...previous, state: 'partial', done: true, error: error.message });
        }
      }
    } finally { directoryBusy = false; }
  }
  function showStatistics(path, snapshot) {
    state.fileMetadata.statistics(path, snapshot);
    const target = statisticsRows.get(path);
    if (!target) return;
    snapshots.set(path, snapshot);
    target.dataset.state = snapshot.state;
    const retry = button('Retry statistics', () => { snapshots.delete(path); fetchVisibleStatistics(); }, 'text-button');
    retry.setAttribute('aria-label', `Retry statistics for ${path}`);
    target.replaceChildren(element('span', { className: 'statistics-counts' }, sourceStatisticsText(snapshot)),
      element('span', { className: 'statistics-stamp' }, sourceStatisticsStamp(snapshot)));
    if (['missing', 'unavailable'].includes(snapshot.state)) target.append(
      element('span', {}, snapshot.messages?.[0] ?? 'This file’s statistics could not be read.'), retry);
  }
  async function fetchVisibleStatistics() {
    if (statisticsBusy || signal.aborted) return;
    statisticsBusy = true;
    try {
      while (!signal.aborted) {
        const paths = visibleSourceFiles(model, state.expanded, state.collapsedGroups).filter(path => !snapshots.has(path)).slice(0, 16);
        if (!paths.length) break;
        for (const path of paths) statisticsRows.get(path).textContent = 'Reading statistics…';
        try {
          const data = await api('kb/statistics', { paths: JSON.stringify(paths) }, { signal });
          if (signal.aborted) return;
          const returned = new Map((data.items ?? []).map(item => [item.path, item]));
          for (const path of paths) showStatistics(path, returned.get(path) ?? {
            state: 'unavailable', messages: ['The server did not return statistics for this file.'],
          });
        } catch (error) {
          if (error.name === 'AbortError') return;
          for (const path of paths) showStatistics(path, { state: 'unavailable', messages: [error.message] });
        }
      }
    } finally { statisticsBusy = false; }
  }
  const draftCount = element('span', { className: 'draft-count', 'aria-live': 'polite' });
  const statusNote = element('p', { className: 'muted draft-note' });
  const selectedTotals = element('div', { className: 'selected-statistics', 'aria-live': 'polite' });
  let selectedTimer, selectedSequence = 0;
  async function aggregateSet(paths, scope, target, current = () => true) {
    let token = '';
    try {
      do {
        const data = await api('kb/statistics/selected', {}, { method: 'POST', body: { paths, scope, token }, signal });
        if (!current() || signal.aborted) return;
        target.replaceChildren(element('strong', {}, scope === 'selected-files' ? 'Selected files: ' : 'Group totals: '),
          document.createTextNode(directoryStatisticsText(data)),
          element('span', { className: 'muted' }, ` · ${data.coverage.processedFiles}/${data.coverage.totalFiles} files · ${data.done ? data.state : 'collecting'}`));
        token = data.token;
        if (data.done) break;
      } while (true);
    } catch (error) {
      if (current() && error.name !== 'AbortError') target.textContent = `Statistics unavailable: ${error.message}`;
    }
  }
  const updateDraft = () => {
    draftCount.textContent = `${number(model.selected.size)} of ${number(model.files.length)} files selected${model.dirty ? ' · unsaved selection' : ''}`;
    statusNote.textContent = `Selection generation ${model.generation}. ${model.dirty ? 'Load applies this exact file list; unselected descendants stay excluded.' : 'Select files to replace the active source set. Loading zero files is allowed.'}`;
    clearTimeout(selectedTimer);
    const current = ++selectedSequence;
    selectedTimer = setTimeout(() => aggregateSet(model.selectedFiles(), 'selected-files', selectedTotals, () => current === selectedSequence), 200);
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
    for (const [key, checkbox] of groupChecks) {
      const value = model.groupState(key);
      checkbox.checked = value.checked; checkbox.indeterminate = value.indeterminate;
      checkbox.disabled = state.mutation || value.disabled;
      checkbox.setAttribute('aria-checked', value.indeterminate ? 'mixed' : String(value.checked));
      groupCounts.get(key).textContent = `${value.selected}/${value.total}`;
    }
    updateDraft();
  };
  let nextID = 0;
  const buildGroup = group => {
    const id = `source-group-${nextID++}`;
    const count = element('span', { className: 'directory-count' });
    const checkbox = element('input', { type: 'checkbox', id, 'data-mutation': '', 'aria-label': `Select ${group.label} in ${group.directory}`,
      onchange: () => updateControls(model.setGroupSelected(group.key)) });
    groupChecks.set(group.key, checkbox); groupCounts.set(group.key, count);
    const children = element('ul', { hidden: state.collapsedGroups.has(group.key), id: `${id}-children` }, group.children.map(buildNode));
    const expand = button(children.hidden ? '+' : '−', () => {
      children.hidden = !children.hidden;
      if (children.hidden) state.collapsedGroups.add(group.key); else state.collapsedGroups.delete(group.key);
      expand.textContent = children.hidden ? '+' : '−'; expand.setAttribute('aria-expanded', String(!children.hidden));
      fetchVisibleStatistics(); fetchVisibleDirectoryStatistics(); scheduleFileInformation();
    }, 'expand-button');
    expand.setAttribute('aria-label', `Expand or collapse ${group.label} in ${group.directory}`);
    expand.setAttribute('aria-expanded', String(!children.hidden));
    expand.setAttribute('aria-controls', children.id);
    const totals = element('div', { className: 'source-statistics' });
    return element('li', { className: 'source-node virtual-group', 'data-source-group': group.key },
      element('div', { className: 'source-row' }, expand, checkbox, element('label', { htmlFor: id }, group.label), count,
        button('Group totals', () => aggregateSet(model.groupFiles(group.key), group.key, totals), 'text-button')),
      totals, children);
  };
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
      const groups = model.groupsFor(path);
      const children = element('ul', { id: `${id}-children`, hidden: !expanded },
        groups.length ? groups.map(buildGroup) : record.children.map(buildNode));
      const expand = button(expanded ? '−' : '+', () => {
        const open = children.hidden;
        children.hidden = !open;
        expand.textContent = open ? '−' : '+';
        expand.setAttribute('aria-expanded', String(open));
        expand.setAttribute('aria-label', `${open ? 'Collapse' : 'Expand'} ${path}`);
        if (open) state.expanded.add(path);
        else state.expanded.delete(path);
        if (open) { fetchVisibleStatistics(); fetchVisibleDirectoryStatistics(); scheduleFileInformation(); }
      }, 'expand-button');
      expand.setAttribute('aria-expanded', String(expanded));
      expand.setAttribute('aria-controls', children.id);
      expand.setAttribute('aria-label', `${expanded ? 'Collapse' : 'Expand'} ${path}`);
      const count = element('span', { className: 'directory-count' });
      counts.set(path, count);
      row.append(expand, checkbox, label, count, sourceStateBadges(path, fileStates.get(path)));
      const aggregate = element('div', { className: 'source-statistics directory-statistics', 'data-directory-statistics-path': path },
        'Directory totals load when this folder is visible, even while collapsed.');
      directoryRows.set(path, aggregate);
      item.append(row, aggregate, children);
    } else {
      row.append(element('span', { className: 'tree-spacer', 'aria-hidden': 'true' }, '·'),
        checkbox, sourceFileDisplay(path, label));
      const statistics = element('div', { className: 'source-statistics-summary', 'data-statistics-path': path },
        'Statistics load when this folder is expanded.');
      statisticsRows.set(path, statistics);
      item.append(row, element('div', { className: 'source-statistics' }, statistics,
        sourceStatisticsDetails(path, signal, snapshot => showStatistics(path, snapshot))));
    }
    return item;
  };
  const rootGroups = model.implicitRoot ? model.groupsFor('KBs') : [];
  const tree = element('ul', { className: 'source-tree', 'aria-label': 'Supported original sources under KBs' }, rootGroups.length ? rootGroups.map(buildGroup) : model.roots.map(buildNode));
  queueMicrotask(fetchVisibleStatistics);
  queueMicrotask(fetchVisibleDirectoryStatistics);
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
  const queue = button('Queue Selected for Loading', async () => {
    if (state.mutation) return;
    setMutation(true);
    try {
      const job = await api('kb/queue', {}, { method: 'POST', body: { files: model.selectedFiles(), generation: model.generation } });
      pendingJobs.add(job.jobId);
      showNotice(element('span', {}, 'Loading queued. You can leave this page. ', link('View task', 'task', { id: job.jobId })));
    } catch (error) { showNotice(requestErrorDetails(error, { preserveSelection: true }), true); }
    finally { setMutation(false); }
  });
  const index = button('Queue selected for indexing', async () => {
    try {
      const job = await api('kb/index', {}, { method: 'POST', body: { files: model.selectedFiles() } });
      pendingJobs.add(job.jobId); showNotice(element('span', {}, 'Indexing queued. ', link('View task', 'task', { id: job.jobId })));
    } catch (error) { showNotice(error.message, true); }
  }, 'button secondary');
  const reset = button('Reset selection', () => {
    model.reset((state.status.files ?? []).map(file => file.path), state.status.generation);
    updateControls(model.records.keys());
  }, 'button secondary');
  reset.dataset.mutation = '';
  reset.disabled = state.mutation;
  const refreshStates = button('Refresh file states', () => renderRoute(), 'button secondary');
  refreshStates.disabled = state.mutation;
  refreshStates.dataset.mutation = '';
  const observedAt = catalog.fileStates?.observedAt;
  const observation = typeof observedAt === 'number' && Number.isFinite(observedAt)
    ? ` Last check: ${new Date(observedAt * 1000).toLocaleString()}.` : '';
  const probeLimit = catalog.fileStates?.artifactProbeLimit;
  const probeNote = Number.isSafeInteger(probeLimit) && model.files.length > probeLimit
    ? ` Artifact checks cover at most ${number(probeLimit)} files per refresh; unprobed states remain unknown.` : '';
  return element('div', {},
    heading('KB Sources', 'Choose original sources from the repository’s KBs directory. Loading and unloading never deletes files.',
      link('Source Packs', 'packs', {}, 'button secondary')),
    element('section', { className: 'source-selection' }, element('h2', {}, 'Source selection'),
      element('div', { className: 'source-actions' }, queue, load, index, reset, refreshStates, draftCount), statusNote, selectedTotals,
      element('p', { className: 'muted file-state-explanation' },
        `Each badge is independent. Cached and Indexed show artifact presence only—not freshness or validity. Load at startup follows the server’s reported startup selection; Loaded now follows the active manifest, not checkbox selection. Warnings and Errors count recorded entries only; missing coverage stays unknown. Size describes the original source, not its caches. Statistics snapshot staleness is separate.${observation}${probeNote}`),
      element('p', { className: 'muted statistics-explanation' },
        'All-files directory totals and Selected-files totals are separate. These are recorded inventory snapshots, not live counts. MTs and predicate/function symbols are deduplicated unions, not sums of per-file distinct counts.'),
      model.files.length ? tree : empty('No supported sources found', 'Place the original KIF, KRF, or MeTTa corpus under KBs. Generated companions are intentionally hidden.')),
    element('section', { className: 'loaded-section' }, element('h2', {}, 'Currently loaded'),
      loadedFiles(state.status.files, { fileStates })));
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
  const utility = data.utility ? assertionView.ruleUtility({ ...data.utility, scope: 'query' }) : null;
  if (!solutions.length) return element('div', {},
    empty('No solutions', 'No matching proof was found within the selected context and limits. Ordinary implications are not executable rules.'), utility);
  const results = element('div', { className: 'query-solutions' },
    element('h2', {}, `${number(solutions.length)} ${solutions.length === 1 ? 'solution' : 'solutions'}`),
    data.truncated && element('p', { className: 'muted' }, 'The result limit was reached. Narrow your query or increase the limit.'),
    utility);
  solutions.forEach((solution, index) => {
    const bindings = solution.bindings ?? [];
    const body = element('section', { className: 'solution' },
      element('h3', {}, `Solution ${index + 1}`, element('span', { className: 'solution-context', 'data-solution-field': 'mt' }, ' in ', mtLink(solution.mt, solution.mtExpression))));
    if (bindings.length) {
      body.append(element('dl', { className: 'bindings' }, bindings.flatMap(binding => [
        element('dt', {}, binding.name), element('dd', {}, renderExpression(binding.value)),
      ])));
    } else body.append(element('p', { className: 'muted' }, 'Ground query succeeded; no variable bindings.'));
    const proof = solution.proof ?? [];
    body.append(element('details', { className: 'proof', open: presentation.get().fields.proof },
      element('summary', {}, `${proof.length} successful proof ${proof.length === 1 ? 'step' : 'steps'}`),
      annotateCards(colorAssertionBalls(assertionView.proof(proof, { utilityReport: data.utility }), proof), proof, { context: solution.mt })));
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
  const limit = element('input', { name: 'limit', type: 'number', min: 1, max: MAXIMUMS.queryLimit, step: 1, required: true, value: positiveInteger(values.limit, state.settings.queryLimit, MAXIMUMS.queryLimit, 1) });
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
      limit: positiveInteger(limit.value, state.settings.queryLimit, MAXIMUMS.queryLimit, 1), timeout: positiveInteger(timeout.value, 3, 30, 1),
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
          mappingCell('Notes / provenance', element('p', {}, renderDecodedText(row.notes))));
      })));
    panel.append(element('div', { className: 'mapping-table-wrapper' }, table));
  } else panel.append(empty('No matching mapping rows', 'Clear a filter or search a SUMO symbol, CycL symbol, or note.',
    link('Clear filters', 'mappings', {}, 'button secondary')));
  if (!selectedRow) panel.append(pagination(data, route));
  return panel;
}

async function settingsPage(_route, signal) {
  const { renderCheckpointSettings } = await import('./checkpoints.js');
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
  return element('div', {}, heading('Settings', 'Browser preferences, saved application states and application controls.'),
    element('form', { className: 'settings-form', novalidate: true, onsubmit: event => {
      event.preventDefault();
      apply(Object.fromEntries(Object.entries(inputs).map(([key, input]) => [key, input.value])));
    } }, fields, element('div', { className: 'form-actions' },
      element('button', { type: 'submit', className: 'button' }, 'Save settings'),
      button('Restore defaults', () => apply(DEFAULT_SETTINGS), 'button secondary')), feedback),
    element('p', { className: 'muted' }, 'Page size applies to terms, predicates, assertions and mappings. Explicit URL limits still override defaults. Query timeouts remain unchanged. All microtheories are always listed, without a cap.'),
    renderCheckpointSettings({ api, signal }),
    element('section', { className: 'settings-section' }, element('h2', {}, 'Task pools'),
      link('Worker profiles and task contents', 'tasks', {}, 'button secondary')),
    element('section', { className: 'settings-section' }, element('h2', {}, 'SUMO → CycL mappings'),
      element('p', { className: 'muted' }, 'Read the existing Markdown-backed mapping policy. Opening it changes no mappings or knowledge.'),
      link('Browse SUMO → CycL mappings', 'mappings', {}, 'button secondary')),
    applicationReloadControls());
}

async function tasksPage(route, signal) {
  const { renderTaskPools } = await import('./task-pools.js');
  return renderTaskPools({ api, element, button, link, heading, sourceLink, propertyList, pagination,
    refreshStatus: async () => setStatus(await api('status', {}, { signal })) }, route, signal);
}
async function taskPage(route, signal) {
  const { renderTaskDetail } = await import('./task-pools.js');
  return renderTaskDetail({ api, element, button, link, heading, sourceLink, propertyList, pagination, reload: renderRoute }, route, signal);
}

function applicationReloadControls() {
  const feedback = element('div', { className: 'reload-feedback', 'aria-live': 'polite' });
  const reload = button('Reload changed files', async () => {
    if (state.mutation) return;
    setMutation(true);
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
      setMutation(false);
    }
  });
  reload.dataset.mutation = '';
  reload.disabled = state.mutation;
  return element('section', { className: 'application-reload' }, element('h2', {}, 'Prolog application code'),
    element('p', {}, 'Reload only changed, already loaded application modules. This does not recompile KBs, reload source data, or reset settings and draft selections.'),
    element('p', { className: 'muted' }, 'If code reload fails, some modules may already have changed; SWI-Prolog cannot roll those changes back automatically.'),
    reload, feedback);
}

const pages = {
  overview, search: searchPage, predicates: searchPage, term: termPage, nats: natsPage,
  catalog: catalogPage, definitions: catalogPage, 'catalog-assertion': catalogPage,
  microtheory: microtheoryPage, microtheories: microtheoriesPage,
  assertion: assertionPage, source: sourcePage, sources: sourcesPage, packs: sourcePacksPage,
  query: queryPage, mappings: mappingsPage, settings: settingsPage,
  tasks: tasksPage, task: taskPage,
  agents: agentsPage,
  'ui-settings': uiSettingsPage,
};

function agentsPage(route) {
  agentWorkspace ??= createAgentWorkspace({ api, element, button, heading });
  agentWorkspace.activate(route);
  if (!state.status && !agentStatusRequest) {
    agentStatusRequest = api('status').then(setStatus).catch(error => {
      $('#generation-state').textContent = `KB status unavailable: ${error.message}`;
      $('#loaded-count').textContent = 'KB Sources';
    }).finally(() => { agentStatusRequest = null; });
  }
  return agentWorkspace.element;
}

function replacePage(node) {
  const retained = agentWorkspace?.element;
  for (const child of [...content.childNodes]) {
    if (child !== retained) child.remove();
  }
  if (retained) retained.hidden = node !== retained;
  if (node !== retained) content.prepend(node);
  else if (retained.parentNode !== content) content.append(retained);
}

function uiSettingsPage(_route, signal) {
  const page = renderUISettings(presentation, { signal });
  let contexts;
  page.append(renderTVASettings({
    signal, reference: nativeReference, sourceLink,
    readSettings: ({ context }, options) => api('tva/settings', { context }, options),
    saveSettings: (body, options) => api('tva/settings/save', {}, { ...options, method: 'POST', body }),
    readPairs: ({ context }, options) => api('tva/pairs', { context }, options),
    savePair: (body, options) => api('tva/pairs/save', {}, { ...options, method: 'POST', body }),
    fetchDetail: (body, options) => api('tva/detail', {}, { ...options, method: 'POST', body }),
    resetDefaults: (body, options) => api('tva/reset', {}, { ...options, method: 'POST', body }),
    listMicrotheories: async ({ offset, limit }, options) => {
      contexts ??= await api('microtheories', {}, options);
      return { items: contexts.items.slice(offset, offset + limit).map(item => ({ key: item.mt, expression: item.mtExpression })), total: contexts.total };
    },
    onSaved: reply => {
      annotationRevision = reply.revision;
      annotations.invalidate({ revision: reply.revision, generation: state.status?.generation });
    },
  }));
  return page;
}

async function renderRoute() {
  const requestedRoute = location.hash;
  if (sourceEditor?.hasDirty() && parseRoute(acceptedRoute).name === 'source' && parseRoute(requestedRoute).name !== 'source') {
    if (!await sourceEditor.guardNavigation()) { history.replaceState(null, '', acceptedRoute); return; }
  }
  acceptedRoute = requestedRoute;
  const view = ++state.view;
  state.routeController?.abort();
  state.queryController?.abort();
  state.queryController = null;
  const controller = new AbortController();
  state.routeController = controller;
  const route = parseRoute(location.hash, state.settings);
  agentWorkspace?.deactivate();
  const navRoute = { term: 'search', nats: 'search', assertion: 'search', source: 'sources', microtheory: 'microtheories', task: 'tasks', mappings: 'settings' }[route.name] ?? route.name;
  for (const anchor of document.querySelectorAll('#navigation a')) {
    if (anchor.dataset.route === navRoute) anchor.setAttribute('aria-current', 'page');
    else anchor.removeAttribute('aria-current');
  }
  content.setAttribute('aria-busy', 'true');
  replacePage(element('div', { className: 'loading', role: 'status' }, 'Loading…'));
  try {
    // Agent recovery must not depend on a successful KB/catalog status read.
    if (route.name !== 'agents') await ensureContext(controller.signal);
    const page = pages[route.name];
    const result = page
      ? await page(route, controller.signal)
      : empty('Page not found', 'This browser route is not recognized.', link('Return to overview', 'overview', {}, 'button'));
    if (view !== state.view) return;
    replacePage(result);
    const displayedRoute = result.resolvedRoute ?? route;
    if (result.resolvedRoute) {
      for (const anchor of document.querySelectorAll('#navigation a')) {
        if (anchor.dataset.route === 'microtheories') anchor.setAttribute('aria-current', 'page');
        else anchor.removeAttribute('aria-current');
      }
    }
    updateClassicContext(result, displayedRoute);
    if (route.name === 'query' && state.literalQuery) {
      const pending = state.literalQuery;
      state.literalQuery = null;
      if (route.params.get('query') === pending.query && (route.params.get('mt') || '') === pending.mt) {
        result.querySelector('.query-form').requestSubmit();
      }
    }
    refreshFileDisplays();
    scheduleFileInformation();
    document.title = `${result.querySelector('h1')?.textContent ?? 'Browse'} · ${APP_NAME}`;
  } catch (error) {
    if (view !== state.view || error.name === 'AbortError') return;
    replacePage(errorPanel(error));
    classicLayout.setContext({ title: 'Context index', coverage: 'unavailable', emptyMessage: error.message });
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
        pendingInterfaceReload = true;
      }
      if (pendingInterfaceReload) {
        if (!sourceEditor?.hasDirty()) { location.reload(); return; }
        target.textContent = 'Interface update waiting for source edits to be saved or discarded.';
      }
      if (pendingJobs.size) {
        const completed = [];
        for (const id of [...pendingJobs].slice(0, 10)) {
          const job = await api('tasks/result', { id }, { signal: requestController.signal, allowErrorResult: true });
          const entry = [...state.fileLoads].find(([, load]) => load.jobId === id);
          if (['succeeded', 'failed', 'cancelled'].includes(job.state)) completed.push({ id, job, path: entry?.[0] });
          else if (entry) state.fileLoads.set(entry[0], { state: job.state, jobId: id });
        }
        // Confirm active membership before showing success or discarding a tracked job.
        setStatus(await api('status', {}, { signal: requestController.signal }));
        for (const { id, job, path } of completed) {
          pendingJobs.delete(id);
          if (path) finishFileLoad(path, job);
          else if (job.state !== 'succeeded') showNotice(`Task ${id}: ${job.error?.message ?? job.state}`, true);
        }
        refreshFileDisplays(); scheduleFileInformation();
      }
      if (annotations.active()) {
        const native = await api('tva/status', {}, { signal: requestController.signal });
        if (native.revision !== annotationRevision) {
          annotationRevision = native.revision;
          annotations.invalidate({ revision: native.revision, generation: state.status?.generation });
        }
      }
      if (['microtheory', 'microtheories'].includes(parseRoute(location.hash).name)) {
        const status = await api('status', {}, { signal: requestController.signal });
        if (status.generation !== state.status?.generation) {
          setStatus(status);
          await renderRoute();
        }
      }
      if (!pendingInterfaceReload) target.textContent = 'Interface live refresh enabled';
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
window.addEventListener('scroll', scheduleFileInformation, { passive: true, capture: true });
window.addEventListener('resize', scheduleFileInformation, { passive: true });
$('.skip-link').addEventListener('click', event => { event.preventDefault(); content.focus(); });
try {
  state.settings = loadSettings(localStorage);
  state.query.limit = state.settings.queryLimit;
} catch (error) {
  showNotice(`Saved settings could not be loaded: ${error.message}. Default limits are active; repair or reset them on Settings.`, true);
}
renderRoute();
startLiveReload();
