import { renderExpression, routeHref } from './render.js';
import { packRootPaths } from './source-packs.js';

export const dependencyCheckLabels = Object.freeze({
  definition: 'Definition or declaration',
  function_result_isa: 'Function result type',
  collection_root: 'Collection path to Thing',
  microtheory_declaration: 'Microtheory declaration in BaseKB',
  microtheory_attachment: 'Microtheory connections',
  comment: 'Comment',
});
const statuses = {
  loaded_available: 'Available in loaded knowledge',
  exists_unloaded_source: 'Available in an unloaded source',
  missing_complete_catalog: 'Missing in complete, fresh evidence',
  external_implementation_required: 'External implementation requires verification',
  indeterminate: 'Not established',
  standalone_reference: 'Explicit standalone reference',
  loaded_or_catalog_evidence: 'Explicit context connection',
  detached: 'No context connection found',
  exempt: 'Exempt',
};
const reasons = {
  positive_visible_evidence: 'Positive evidence in the required assertion context.',
  evidence_only_in_other_microtheories: 'Evidence exists only in other microtheories. It is not treated as visible here.',
  no_evidence_in_bounded_analysis: 'No matching evidence was found within this report’s limits. This is not proof of absence.',
  positive_genls_path: 'A positive genls path reaches Thing without crossing assertion contexts.',
  no_positive_genls_path_in_explicit_mt: 'No positive genls path to Thing was established in this microtheory.',
  no_visible_inheritance_edge_standalone_may_be_intentional: 'No visible inheritance edge was found. A standalone context can be intentional.',
  explicit_cross_context_reference: 'An explicit ist reference records cross-context use. This may explain a standalone microtheory.',
  thing_is_root: 'Thing is the root and needs no further genls path.',
  explicit_genlMt_edge: 'An explicit genlMt edge is recorded. The runtime does not inherit facts along it.',
  explicit_external_symbol_type_host_implementation_not_verified: 'The ontology identifies an external symbol. Its host implementation was not verified.',
  explicit_foreign_reference_not_an_implemented_call: 'An explicit foreign-function reference is recorded. It is data, not proof that the host can execute it.',
  conflicting_source_revisions: 'Loaded knowledge and catalog evidence disagree about a source revision. Refresh the report after resolving the conflict.',
};
export function dependencyReason(why) {
  const code = typeof why === 'string' ? why : why?.availability ?? why?.reason;
  return reasons[code] ?? 'Inspect the recorded evidence and coverage before deciding whether information is missing.';
}
export function dependencyFilters(params) {
  const result = { offset: 0, limit: 25 };
  for (const key of ['kind', 'severity', 'scope', 'disposition']) {
    const value = params.get(key);
    if (value) result[key] = value;
  }
  const offset = Number(params.get('offset') ?? 0);
  if (Number.isSafeInteger(offset) && offset >= 0) result.offset = offset;
  return result;
}
export function dependencyNextOffset(report) {
  const offset = report?.scope?.selection?.nextOffset;
  return Number.isSafeInteger(offset) && offset >= 0 && offset <= 480 ? offset : null;
}
function policyEditorRows(policy) {
  return (policy?.rules ?? []).map(rule => ({
    ...rule, ignoreTerms: rule.ignoreTerms.join('\n'), ignoreMts: rule.ignoreMts.join('\n'),
    exemptTypes: rule.exemptTypes.join('\n'), patterns: rule.patterns.map(p => `${p.mode}:${p.value}`).join('\n'),
  }));
}
export function dependencyReportDraft(report) {
  if (!report?.scope || !report?.policy) return null;
  const { scope } = report;
  return {
    mt: scope.mt, term: scope.selection?.kind === 'single_term' ? scope.selection.term ?? '' : '',
    roots: scope.kind === 'selected' ? scope.roots.join('\n') : '',
    policyRows: policyEditorRows(report.policy),
  };
}
export function dependencyPolicyDraft(rows) {
  const values = input => String(input ?? '').split(/\r?\n/u).map(s => s.trim()).filter(Boolean);
  return { rules: rows.map(row => ({
    kind: row.kind, enabled: row.enabled, severity: row.severity,
    ignoreTerms: values(row.ignoreTerms), ignoreMts: values(row.ignoreMts), exemptTypes: values(row.exemptTypes),
    patterns: values(row.patterns).map(line => {
      const colon = line.indexOf(':'), mode = line.slice(0, colon), value = line.slice(colon + 1);
      if (colon < 1 || !['exact', 'prefix', 'suffix'].includes(mode) || !value || value.length > 128) {
        throw new Error('Patterns must be exact:value, prefix:value, or suffix:value, with a literal value up to 128 characters.');
      }
      return { mode, value };
    }),
  })) };
}

/** Host contract: incumbent element/button/link/heading/errorPanel, api,
 * sourceLink and mtLink. No route, menu, native mutation or loading is installed. */
export async function dependencyResolutionPage(env, route, signal) {
  const { api, element: el, button, link, heading, errorPanel, sourceLink, mtLink } = env;
  const capabilities = await api('dependencies/capabilities', {}, { signal });
  const page = el('div', { className: 'source-packs dependency-resolution' });
  const feedback = el('p', { className: 'pack-feedback', role: 'status', 'aria-live': 'polite' });
  const errors = el('div'), results = el('section', { className: 'pack-section', 'aria-label': 'Dependency findings' });
  const filters = dependencyFilters(route.params);
  let id = route.params.get('report'), job = null, report = null, polling = null, pending = false, requestSerial = 0, stale = false;
  let termOffset = 0, draftDirty = false, draftVersion = 0, restoreDraft = !!id;
  const field = (label, input) => el('label', { className: 'field' }, el('span', {}, label), input);
  const mt = el('input', { value: route.params.get('mt') ?? env.currentMt?.() ?? '', required: true,
    placeholder: 'x_BaseKB or a canonical compound MT key', maxlength: 4096 });
  const term = el('input', { value: route.params.get('term') ?? '', maxlength: 4096,
    placeholder: 'Leave empty to inspect a bounded slice of terms in use' });
  const roots = el('textarea', { rows: 3, placeholder: 'Optional concrete KBs source paths, one per line' });
  const policyRows = policyEditorRows(capabilities.defaultPolicy), policyControls = new Map();
  function changedDraft() { draftDirty = true; draftVersion++; controls(); }
  function restoreReportDraft() {
    if (!restoreDraft || !report) return;
    restoreDraft = false;
    if (draftDirty) return;
    const draft = dependencyReportDraft(report);
    if (!draft) { draftDirty = true; return; }
    mt.value = draft.mt; term.value = draft.term; roots.value = draft.roots;
    for (const saved of draft.policyRows) {
      const rule = policyRows.find(candidate => candidate.kind === saved.kind);
      const inputs = policyControls.get(saved.kind);
      if (!rule || !inputs) continue;
      Object.assign(rule, saved);
      inputs.enabled.checked = saved.enabled; inputs.severity.value = saved.severity;
      for (const key of ['ignoreTerms', 'ignoreMts', 'exemptTypes', 'patterns']) inputs[key].value = saved[key];
    }
  }
  function updateURL() {
    const values = { report: id, mt: mt.value.trim(), term: term.value.trim(), ...filters };
    for (const key of Object.keys(values)) if (values[key] === 'all') delete values[key];
    if (env.rememberRoute) env.rememberRoute(values);
    else globalThis.history?.replaceState(null, '', routeHref('dependency-resolution', values));
  }
  function reportFailure(error) {
    if (signal?.aborted || error.name === 'AbortError') return;
    errors.replaceChildren(errorPanel(error));
    feedback.textContent = 'The request failed. Existing knowledge and policy remain unchanged.';
  }
  function controls() {
    analyze.disabled = pending || job?.state === 'running' || !mt.value.trim();
    cancel.disabled = pending || job?.state !== 'running';
    nextSlice.disabled = pending || job?.state === 'running' || draftDirty || stale
      || dependencyNextOffset(report) === null || !!term.value.trim();
    nextSlice.title = draftDirty ? 'Analyze again from the beginning after changing scope or policy.' : '';
  }
  function evidenceView(evidence, depth = 0) {
    return el('li', {},
      evidence.loaded ? link(evidence.id, 'assertion', { id: evidence.id }) : el('code', {}, evidence.id),
      ' · ', sourceLink(evidence.source, evidence.line ?? 1, evidence.line == null ? evidence.source : undefined),
      el('div', { className: 'muted' },
        evidence.loaded ? 'Loaded · ' : 'Unloaded · ', mtLink(evidence.mt, evidence.mtExpression)),
      evidence.originalSource && evidence.originalSource !== evidence.source
        ? el('p', { className: 'muted' }, `Original recorded source: ${evidence.originalSource}`) : null,
      evidence.polarity === 'negative' ? el('p', { className: 'muted' }, 'Negative static conclusion; not a positive fact.') : null,
      evidence.kind ? el('p', { className: 'muted' }, evidence.kind.replaceAll('_', ' ')) : null,
      depth < 2 && evidence.support?.length
        ? el('details', {}, el('summary', {}, `Supporting assertions (${evidence.support.length})`),
          el('ul', { className: 'pack-rows' }, evidence.support.map(e => evidenceView(e, depth + 1)))) : null);
  }
  function findingView(item) {
    const node = el('li', {},
      el('div', { className: 'source-actions' }, renderExpression(item.expression, { inline: true }),
        el('strong', {}, statuses[item.status] ?? item.status)),
      el('p', { className: 'muted' }, `${dependencyCheckLabels[item.kind] ?? item.kind} · ${item.severity}`
        + (item.disposition === 'suppressed' ? ' · suppressed by policy' : '')),
      el('p', {}, dependencyReason(item.why)),
      el('p', { className: 'muted' }, 'Report context: ', mtLink(item.mt, item.mtExpression)));
    if (item.why?.declarationContext) node.append(el('p', { className: 'muted' }, 'Declaration evidence must be asserted in BaseKB, regardless of filename.'));
    if (item.evidence?.length) node.append(el('details', {}, el('summary', {},
      `Evidence (${item.evidence.length}${item.evidenceTruncated ? ` of ${item.evidenceCount}` : ''})`),
    el('ul', { className: 'pack-rows' }, item.evidence.map(e => evidenceView(e)))));
    if (item.why?.separateConstraints?.length) node.append(el('p', { className: 'muted' },
      `${item.why.separateConstraints.length} other return constraints were recorded separately; resultGenl and conditional constraints are not assumed to supply resultIsa.`));
    return node;
  }
  function drawResults() {
    results.replaceChildren(el('h2', {}, 'Findings'));
    if (!report) {
      results.append(el('div', { className: 'empty-state' }, el('h3', {}, job?.state === 'running' ? 'Reading bounded evidence' : 'Choose a microtheory to begin'),
        el('p', {}, 'Inspect one term, or a small slice of terms in use. No sources are loaded, declarations created, or rule bodies executed.')));
      controls(); return;
    }
    const revision = report.scope.catalogRevision;
    const identity = el('details', {}, el('summary', {}, 'Report identity'));
    for (const [label, value] of [['Catalog revision', revision], ['Taxonomy revision', report.scope.taxonomyRevision],
      ['Policy revision', report.policyRevision]]) {
      identity.append(field(label, el('input', { readOnly: true, value: value ?? 'unavailable' })));
    }
    results.append(el('p', {}, `Generation ${report.scope.generation} · ${report.terms} terms analyzed · ${report.total} matching findings`),
      el('p', { className: 'muted' }, `Catalog revision: ${revision ? revision.slice(0, 12) + '…' : 'unavailable'}`), identity,
      el('p', { className: 'muted' }, 'Coverage is bounded. “Not established” must not be read as “missing.” Static definitions do not prove executable availability.'));
    if (stale) results.append(el('p', {}, 'The knowledge generation or indexed evidence changed. Analyze again before relying on this snapshot.'));
    if (['not_established_in_loaded_roots', 'not_established_in_selected_roots'].includes(report.scope.selection?.inUse)) {
      results.append(el('p', { className: 'muted' }, 'This term was not established as used in the chosen roots within this report’s bounds.'));
    }
    if (report.items.length) results.append(el('ul', { className: 'pack-rows' }, report.items.map(findingView)));
    else results.append(el('div', { className: 'empty-state' }, el('h3', {}, 'No findings in this view'),
      el('p', {}, report.terms ? 'Change the filters to inspect other checks.' : 'No in-use terms were returned within this report’s bounds. Narrow the scope or inspect a term directly.'),
      link('Review KB Sources', 'sources')));
    const previous = button('Previous findings', () => changePage(-25), 'button secondary');
    const next = button('Next findings', () => changePage(25), 'button secondary');
    previous.disabled = pending || filters.offset === 0;
    next.disabled = pending || filters.offset + 25 >= report.total;
    results.append(el('div', { className: 'source-actions' }, previous,
      el('span', { className: 'muted' }, `${report.total ? filters.offset + 1 : 0}–${Math.min(filters.offset + 25, report.total)} of ${report.total}`), next));
    controls();
  }
  async function refresh() {
    if (!id || signal?.aborted) return;
    const serial = ++requestSerial;
    try {
      const reply = await api('dependencies/report', { id, ...filters }, { signal });
      if (serial !== requestSerial || signal?.aborted) return;
      job = reply.job; report = reply.report; stale = reply.stale === true;
      restoreReportDraft();
      feedback.textContent = job.state === 'running' ? `Analyzing… ${job.completedTerms} terms complete.`
        : `${job.state.replaceAll('_', ' ')} · ${job.completedTerms} terms complete. Knowledge unchanged.`;
      if (job.error) errors.replaceChildren(errorPanel(new Error(job.error.message)));
      drawResults();
      if (job.state === 'running') polling = setTimeout(refresh, 1000);
    } catch (error) { reportFailure(error); controls(); }
  }
  async function start() {
    if (pending || job?.state === 'running') return;
    pending = true; controls(); errors.replaceChildren(); clearTimeout(polling);
    const submittedVersion = draftVersion;
    try {
      const selected = packRootPaths(roots.value, { allowEmpty: true });
      if (selected.length > 16) throw new Error('Select at most 16 sources for one bounded report.');
      const reply = await api('dependencies/reports', {}, { method: 'POST', signal,
        body: { mt: mt.value.trim(), term: term.value.trim(), roots: selected, termOffset,
          termLimit: 10, seconds: 60, policy: dependencyPolicyDraft(policyRows) } });
      id = reply.job.id; job = reply.job; report = reply.report; filters.offset = 0;
      draftDirty = draftVersion !== submittedVersion; restoreDraft = false; stale = reply.stale === true;
      updateURL(); drawResults(); await refresh();
    } catch (error) { reportFailure(error); }
    finally { pending = false; controls(); }
  }
  async function changePage(delta) {
    filters.offset = Math.max(0, filters.offset + delta); updateURL();
    clearTimeout(polling); await refresh();
  }
  const analyze = button('Analyze read-only', () => { termOffset = 0; start(); });
  const cancel = button('Cancel analysis', async () => {
    clearTimeout(polling);
    try { await api('dependencies/cancel', {}, { method: 'POST', signal, body: { id } }); await refresh(); }
    catch (error) { reportFailure(error); }
  }, 'button secondary');
  const nextSlice = button('Analyze next term slice', () => { termOffset = dependencyNextOffset(report); start(); }, 'button secondary');
  for (const input of [mt, term, roots]) input.addEventListener('input', changedDraft);
  for (const input of [mt, term]) input.addEventListener('keydown', event => {
    if (event.key === 'Enter' && !analyze.disabled) { event.preventDefault(); termOffset = 0; start(); }
  });
  const filterControls = el('div', { className: 'source-actions' });
  for (const [key, label, choices] of [
    ['kind', 'Check', Object.entries(dependencyCheckLabels)],
    ['severity', 'Severity', ['info', 'warning', 'error'].map(x => [x, x])],
    ['scope', 'Availability', [['loaded', 'Loaded'], ['unloaded', 'Unloaded'], ['unresolved', 'Unresolved']]],
    ['disposition', 'Policy', [['active', 'Active'], ['suppressed', 'Suppressed']]],
  ]) {
    const select = el('select', { onchange: () => {
      filters[key] = select.value; filters.offset = 0; updateURL(); clearTimeout(polling); refresh();
    } }, el('option', { value: 'all' }, 'All'), choices.map(([value, text]) => el('option', { value }, text)));
    select.value = filters[key] ?? 'all'; filterControls.append(field(label, select));
  }
  const policyEditor = el('details', { className: 'pack-section' }, el('summary', {}, 'Missing-information policy draft'),
    el('p', {}, 'These settings apply only to this analysis. Persistent policy editing requires an authenticated KEE save operation, which is not registered.'));
  for (const rule of policyRows) {
    const enabled = el('input', { type: 'checkbox', checked: rule.enabled,
      onchange: () => { rule.enabled = enabled.checked; changedDraft(); } });
    const severity = el('select', { 'aria-label': `Severity for ${dependencyCheckLabels[rule.kind]}`,
      onchange: () => { rule.severity = severity.value; changedDraft(); } },
    ['info', 'warning', 'error'].map(value => el('option', { value }, value)));
    severity.value = rule.severity;
    const inputs = { enabled, severity }; policyControls.set(rule.kind, inputs);
    const exemptions = el('details', {}, el('summary', {}, 'Exemptions and literal patterns'));
    for (const [key, label] of [['ignoreTerms', 'Canonical terms, one per line'], ['ignoreMts', 'Canonical microtheories, one per line'],
      ['exemptTypes', 'Explicit types, one per line'], ['patterns', 'Patterns: exact:value, prefix:value or suffix:value']]) {
      const input = el('textarea', { value: rule[key], rows: 2, oninput: () => { rule[key] = input.value; changedDraft(); } });
      inputs[key] = input;
      exemptions.append(field(label, input));
    }
    policyEditor.append(el('section', { className: 'pack-subsection' },
      el('div', { className: 'source-actions' }, el('label', {}, enabled, ` ${dependencyCheckLabels[rule.kind]}`), severity), exemptions));
  }
  page.append(heading('Dependency Resolution', 'Inspect definitions, return types, collection roots and microtheory evidence without changing knowledge.'),
    el('section', { className: 'pack-section' }, field('Current microtheory (required)', mt), field('Term (optional)', term),
      el('details', {}, el('summary', {}, 'Analyze selected source roots instead'), field('Concrete source paths', roots)),
      el('div', { className: 'source-actions' }, analyze, cancel, nextSlice)),
    policyEditor, feedback, errors, filterControls, results);
  signal?.addEventListener('abort', () => { clearTimeout(polling); requestSerial++; }, { once: true });
  drawResults();
  if (id) await refresh();
  return page;
}
