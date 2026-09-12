import { assertionRoles, groupAssertions, renderExpression, routeHref } from './render.js';
import { collectDiagnostics, mappingRowsOf, splitMappingRows } from './diagnostics.js';

const roles = { predicate: 'Predicate', argument: 'Argument', nested: 'Nested head' };
const propertyValue = (item, name) => item[name] ?? item.properties?.find(property => property.name === name)?.value;

/**
 * Shared assertion markup for both layouts, term/MT/detail pages and query proofs.
 * All source, property, diagnostic, context and mapping content delegates to the
 * application's existing renderers. Callbacks return DOM nodes (or null).
 */
export function createAssertionView({
  document: doc = globalThis.document,
  sourceLink, propertyList, diagnosticsPanel, mtLink, mappingLink,
  renderRuleUtility, renderProof,
} = {}) {
  for (const [name, callback] of Object.entries({ sourceLink, propertyList, diagnosticsPanel, mtLink, mappingLink })) {
    if (typeof callback !== 'function') throw new TypeError(`createAssertionView requires ${name}.`);
  }
  const el = (tag, className, ...children) => {
    const result = doc.createElement(tag);
    if (className) result.className = className;
    for (const child of children.flat(Infinity)) {
      if (child !== null && child !== undefined && child !== false) result.append(child);
    }
    return result;
  };
  const field = (name, ...children) => {
    const result = el('div', `assertion-field assertion-field-${name}`, ...children);
    result.dataset.field = name;
    return result;
  };
  const reference = id => {
    const result = el(id ? 'a' : 'span', 'assertion-ball');
    const label = id ? `Properties and full details for assertion ${id}` : 'Assertion details unavailable';
    result.setAttribute('aria-label', label);
    result.title = label;
    if (id) result.href = routeHref('assertion', { id });
    const ball = el('span', 'assertion-ball-mark');
    ball.setAttribute('aria-hidden', 'true');
    result.append(ball);
    return result;
  };
  const idLink = id => {
    const link = el('a', 'assertion-id', id);
    link.href = routeHref('assertion', { id });
    return link;
  };
  const disclosure = (label, render, { open = false, className = 'assertion-properties' } = {}) => {
    const details = el('details', className, el('summary', null, label));
    let populated = false;
    const populate = () => {
      if (populated || !details.open) return;
      const rendered = render();
      if (rendered) details.append(rendered);
      populated = true;
    };
    details.addEventListener('toggle', populate);
    details.open = open;
    populate();
    return details;
  };
  const metadata = item => {
    const properties = Array.isArray(item.properties) ? item.properties : [];
    const ordinary = [], large = [];
    for (const property of properties) {
      let length = 0;
      try { length = JSON.stringify(property.value)?.length ?? 0; } catch { length = 2000; }
      (length > 1200 || (Array.isArray(property.value) && property.value.length > 16) ? large : ordinary).push(property);
    }
    return el('div', 'assertion-metadata',
      ordinary.length > 0 && propertyList(ordinary, { context: item }),
      large.map(property => disclosure(`${property.name} · expand stored value`,
        () => propertyList([property], { context: item }))));
  };
  const utilityView = detail => {
    if (!detail) return null;
    const scope = detail.scope === 'query' ? 'query' : 'cumulative';
    const rows = detail.items ?? (scope === 'query' ? detail.rules : null);
    if (!Array.isArray(rows) || (!rows.length && !detail.scope)) return null;
    const metric = (row, key) => Number.isFinite(row[key]) && row[key] >= 0 ? row[key] : 'Unavailable';
    const labels = [
      ['calls', 'Calls after head and microtheory entry'],
      ['results', 'Successful body results'],
      ['productiveCalls', 'Calls producing a local result'],
      ['exhaustedCalls', 'Exhausted calls'],
      ['cutCalls', 'Cut calls'],
      ['interruptedCalls', 'Interrupted calls'],
      ['zeroResultExhaustedCalls', 'Exhausted calls with no result'],
      ['answersHelped', scope === 'query' ? 'Unique returned answers helped in this query' : 'Unique returned answers helped (per-query distinct, summed across queries)'],
      ['proofOccurrences', 'Returned proof occurrences'],
      ['resultsPerCall', 'Results per call (yield may exceed 1)'],
      ['productiveCallFraction', 'Fraction of calls producing a local result'],
      ...(scope === 'cumulative' ? [['queriesObserved', 'Queries observed'], ['partialQueries', 'Partial queries']] : []),
    ];
    const states = { current: 'Matches loaded snapshot', prior_generation: 'Matching content · prior generation',
      unknown_generation: 'Matching content · generation unrecorded', stale: 'Historical content · no matching loaded rule' };
    const content = el('section', 'rule-utility-detail', el('h3', null, scope === 'query' ? 'Observed rule utility · this query' : 'Observed rule utility · cumulative'),
      el('p', 'muted', 'Execution observations only—not native truth/confidence, configured Cyc utility, inference ordering, or pruning. A local result does not necessarily help a returned answer. Inclusive costs are non-additive across nested rules.'));
    content.dataset.utilityScope = scope;
    if (scope === 'query') {
      content.append(propertyList([
        { name: 'Query snapshot generation', value: detail.generation ?? 'Unavailable' },
        { name: 'Query completion', value: detail.outcome ?? 'Unavailable' },
        { name: 'Coverage', value: detail.coverage ?? 'Unavailable' },
        ...(detail.returnedAnswers !== undefined ? [{ name: 'Answers actually returned', value: metric(detail, 'returnedAnswers') }] : []),
      ]));
      if (detail.perspective === 'proof_step') content.append(el('p', 'muted',
        'These are totals for this rule across the whole query, not measurements of this individual proof step.'));
      if (detail.queryCost) content.append(disclosure('Whole-query measured cost',
        () => propertyList(Object.entries(detail.queryCost).map(([name, value]) => ({ name, value })))));
    } else if (detail.generation !== undefined) {
      content.append(el('p', 'muted', `Read against loaded generation ${detail.generation}. “Matches” refers to the loaded rule, not an unchecked source file on disk.`));
    }
    if (!rows.length) content.append(el('p', 'muted', scope === 'query'
      ? 'No executable rule applications were observed in this query. Facts and static implications do not acquire invented rule-usage counts.'
      : detail.eligibility === 'not_executable'
        ? 'This assertion is not an executable <=== rule. No rule-usage measurements apply.'
        : 'No executable-rule observations are available for this selection.'));
    if (Number.isSafeInteger(detail.total) && detail.total > rows.length) {
      content.append(el('p', 'muted', `${rows.length} of ${detail.total} observation records returned.`));
    }
    for (const row of rows) {
      const label = `${row.id ? `${row.id} · ` : ''}${scope === 'query' ? 'Query snapshot' : states[row.identityState] ?? 'Observation record'}${Number.isSafeInteger(row.generation) ? ` · generation ${row.generation}` : ''} · ${row.observed === true ? 'observed' : 'unobserved'}`;
      content.append(disclosure(label, () => {
        const values = el('div', null);
        if (row.id) values.append(el('p', null, 'Stable assertion occurrence: ', row.identityState === 'stale'
          ? row.id : idLink(row.id)));
        if (row.classicSTV) {
          const view = row.classicSTV;
          values.append(el('section', 'rule-classic-stv', el('h4', null, 'Classic STV-style usefulness · optional display'),
            el('p', 'muted', 'Separate from native truth/confidence and configured Cyc utility. This display never affects inference. Correlated and partial observations are not calibrated probabilities.'),
            view.available === true ? propertyList([
              { name: 'Usefulness strength', value: metric(view, 'strength') },
              { name: 'Evidence confidence', value: metric(view, 'confidence') },
              { name: 'Confidence constant K', value: metric(view, 'k') },
            ]) : el('p', 'muted', 'Unavailable: no comparable application trials. No strength/confidence pair is fabricated.')));
        }
        if (row.observed !== true) values.append(el('p', 'muted', 'No execution observations are available. Unobserved measures are unknown, not zero.'));
        else {
          const properties = labels.map(([key, name]) => ({ name, value: metric(row, key) }));
          const cost = row.inclusiveCost ?? {};
          properties.push(
            { name: 'Inclusive active wall time (seconds)', value: metric(cost, 'wallSeconds') },
            { name: 'Inclusive thread CPU time (seconds)', value: metric(cost, 'cpuSeconds') },
            { name: 'Inclusive inferences', value: metric(cost, 'inferences') },
            { name: 'Observation coverage', value: row.coverage ?? detail.coverage ?? 'Unavailable' });
          for (const [key, name] of [['firstObserved', 'First observed'], ['lastObserved', 'Last observed']]) {
            if (row[key] !== null && row[key] !== undefined) properties.push({ name, value: row[key] });
          }
          values.append(propertyList(properties));
          const evidence = row.applicationEvidence;
          values.append(disclosure('Comparable application evidence', () => evidence ? el('div', null,
            el('p', 'muted', 'Each application is counted once. Positive means participation in a returned proof; negative requires full query and application exhaustion. Partial or interrupted noncontributors stay unknown.'),
            propertyList([
              { name: 'Positive applications', value: metric(evidence, 'positiveApplications') },
              { name: 'Negative applications', value: metric(evidence, 'negativeApplications') },
              { name: 'Unknown applications', value: metric(evidence, 'unknownApplications') },
              { name: 'Comparable trials', value: metric(evidence, 'trials') },
              { name: 'Evidence coverage', value: evidence.coverage ?? 'Unavailable' },
            ])) : el('p', 'muted', 'Per-application attribution is unavailable for these observations. Raw calls and answer counts are not substituted.')));
        }
        const provenance = row.provenance;
        if (provenance?.source) values.append(el('p', null, 'Matching loaded source: ',
          sourceLink(provenance.source, provenance.line)), el('p', 'muted', provenance.note));
        const freshness = row.sourceFreshness;
        const freshnessLabels = {
          matches_loaded_source: 'Source bytes matched the loaded source hash when checked.',
          changed_since_load: 'Source bytes have changed since loading. Observations still describe the loaded snapshot.',
          missing: 'The source file is missing; loaded observations are retained.',
          not_checked: 'Source freshness has not been verified.',
          unavailable: 'Source freshness or historical location is unavailable.',
        };
        if (freshness) values.append(el('p', 'muted', freshnessLabels[freshness.state] ?? 'Source freshness unavailable.',
          freshness.reason ? ` (${String(freshness.reason).replaceAll('_', ' ')})` : ''));
        if (row.contentHash) values.append(disclosure('Observed content identity',
          () => propertyList([
            { name: 'Semantic rule + microtheory hash', value: row.contentHash },
            ...(provenance?.loadedSourceHash ? [{ name: 'Matching loaded source hash', value: provenance.loadedSourceHash }] : []),
          ])));
        return values;
      }, { open: rows.length === 1 }));
    }
    if (detail.measurement || detail.lifetime) content.append(disclosure('Measurement scope and limitations',
      () => propertyList([
        ...(detail.measurement ? [{ name: 'Measurement', value: detail.measurement }] : []),
        ...(detail.lifetime ? [{ name: 'Lifetime', value: detail.lifetime }] : []),
      ])));
    return content;
  };

  function utilityPanel({ id, generation, loadPage, signal }) {
    const body = el('div', 'rule-utility-body');
    const status = el('p', 'muted', 'Reading cumulative observations…');
    status.setAttribute('role', 'status');
    const classic = el('input', null);
    classic.type = 'checkbox';
    const option = el('label', 'presentation-choice', classic, 'Show Classic STV-style usefulness (not native truth/confidence)');
    const refresh = el('button', 'text-button', 'Refresh observations');
    refresh.type = 'button';
    const previous = el('button', 'text-button', 'Previous records');
    const next = el('button', 'text-button', 'Next records');
    previous.type = next.type = 'button';
    const paging = el('div', 'pagination', previous, next);
    const panel = el('section', 'rule-utility-panel', el('h2', null, 'Rule execution observations'), option, refresh, status, body, paging);
    let offset = 0, renderedOffset = 0, controller, total = 0;
    const limit = 10;
    const read = async () => {
      if (signal?.aborted) return;
      controller?.abort();
      const request = new AbortController();
      controller = request;
      panel.setAttribute('aria-busy', 'true');
      previous.disabled = next.disabled = refresh.disabled = true;
      status.textContent = 'Reading cumulative observations…';
      try {
        if (!Number.isSafeInteger(generation) || generation < 0) throw new Error('The assertion response has no snapshot generation. Reload assertion detail before inspecting observations.');
        const data = await loadPage({ id, generation, offset, limit, classic_stv: classic.checked, check_source: true }, { signal: request.signal });
        if (request.signal.aborted || signal?.aborted || controller !== request) return;
        if (data.generation !== generation) throw Object.assign(new Error('The knowledge-base generation changed. Reopen this assertion.'), { code: 'generation_conflict' });
        if (!Array.isArray(data.items)) throw new Error('The observation response is incomplete. Retry the read.');
        total = Number.isSafeInteger(data.total) ? data.total : 0;
        renderedOffset = offset;
        body.replaceChildren(utilityView(data));
        status.textContent = total ? `Records ${offset + 1}–${Math.min(offset + limit, total)} of ${total}. Cumulative since the stated telemetry lifetime began.` : 'Read complete. No applicable execution records.';
      } catch (error) {
        if (request.signal.aborted || signal?.aborted || controller !== request) return;
        offset = renderedOffset;
        status.textContent = `Rule observations unavailable: ${error.message}`;
        if (error.code === 'generation_conflict') {
          const reopen = el('a', null, 'Reload assertion detail for the new generation');
          reopen.href = routeHref('assertion', { id, utilityRefresh: String(Date.now()) });
          body.replaceChildren(reopen);
        }
      } finally {
        if (controller === request) {
          panel.setAttribute('aria-busy', 'false');
          refresh.disabled = false;
          previous.disabled = offset === 0;
          next.disabled = offset + limit >= total;
          paging.hidden = total <= limit;
        }
      }
    };
    signal?.addEventListener('abort', () => controller?.abort(), { once: true });
    classic.addEventListener('change', () => { offset = 0; read(); });
    refresh.addEventListener('click', read);
    previous.addEventListener('click', () => { offset = Math.max(0, offset - limit); read(); });
    next.addEventListener('click', () => { offset += limit; read(); });
    read();
    return panel;
  }

  function card(item, { detail = false, term, showMT = true, proofStep = false } = {}) {
    const article = el('article', 'assertion-card assertion-view');
    article.dataset.detail = String(detail);
    if (item.id) article.dataset.assertionId = String(item.id);
    article.append(el('div', 'assertion-primary',
      reference(item.id), renderExpression(item.expression, { document: doc })));
    if (item.id) article.append(field('id', idLink(item.id)));
    const labels = [];
    if (item.kind) labels.push(item.kind === 'rule' ? 'Rule' : item.kind === 'fact' ? 'Fact' : String(item.kind));
    if (Number.isSafeInteger(item.predicate?.arity)) labels.push(`Arity ${item.predicate.arity}`);
    if (term) labels.push(...assertionRoles(item.expression, term).map(role => roles[role] ?? role));
    if (labels.length) article.append(field('kind', el('span', 'role-labels', labels.join(' · '))));
    if (showMT && item.mt) article.append(field('mt', 'Microtheory: ', mtLink(item.mt, item.mtExpression)));
    if (item.source) article.append(field('source', sourceLink(item.source, item.line, undefined, item.column)));
    const strength = ['strength', 'monotonicity', 'direction'].flatMap(name => {
      const value = propertyValue(item, name);
      return value === undefined ? [] : [{ name, value }];
    });
    if (strength.length) article.append(field('strength', propertyList(strength, { context: item })));

    const diagnostics = collectDiagnostics(item);
    const blocking = diagnostics.filter(entry => entry.severity === 'error');
    const secondary = diagnostics.filter(entry => entry.severity !== 'error');
    if (blocking.length) {
      const errors = el('div', 'assertion-blocking-errors', diagnosticsPanel(item, { entries: blocking }));
      errors.dataset.blocking = 'true';
      errors.setAttribute('role', 'alert');
      article.append(errors);
    }
    if (secondary.length) article.append(field('diagnostics', diagnosticsPanel(item, { entries: secondary })));

    const mapping = splitMappingRows(mappingRowsOf(item));
    const provenance = field('properties');
    if (detail) {
      provenance.append(propertyList([{ name: 'Original variable names', value: item.names ?? [] }], { context: item }));
    }
    if (mapping.ids.length) provenance.append(el('p', 'mapping-references', 'Applied mapping IDs, in order: ',
      mapping.ids.flatMap((id, index) => [index ? ', ' : '', mappingLink(id)])));
    if (mapping.other.length) provenance.append(disclosure('Other mapping annotations',
      () => propertyList([{ name: 'mapping_annotations', value: mapping.other }], { context: item })));
    if (item.properties?.length) provenance.append(disclosure(`Assertion properties (${item.properties.length})`,
      () => metadata(item), { open: detail }));
    if (provenance.childNodes.length) article.append(provenance);
    if (proofStep && Number.isFinite(item.before) && Number.isFinite(item.after)) {
      article.append(field('proof', el('span', 'muted', `Bound slots ${item.before} → ${item.after}`)));
    }
    if (item.proof?.length) article.append(field('proof', disclosure(`${item.proof.length} successful proof steps`,
      () => renderProof ? renderProof(item.proof, item) : proof(item.proof))));
    const utility = renderRuleUtility ? renderRuleUtility(item) : utilityView(item.ruleUtility);
    if (utility) article.append(field('ruleUtility', utility));
    return article;
  }

  function groups(items, { offset = 0, term, detail = false } = {}) {
    const container = el('div', 'assertion-groups shared-assertion-groups');
    container.dataset.detail = String(detail);
    groupAssertions(items).forEach((group, index) => {
      const section = el('section', 'assertion-group');
      section.dataset.collapsed = 'false';
      const toggle = el('button', 'mt-collapse', '−');
      toggle.type = 'button';
      toggle.setAttribute('aria-expanded', 'true');
      toggle.setAttribute('aria-label', 'Collapse this microtheory block');
      toggle.addEventListener('click', () => {
        const expanded = toggle.getAttribute('aria-expanded') !== 'true';
        toggle.setAttribute('aria-expanded', String(expanded));
        toggle.setAttribute('aria-label', `${expanded ? 'Collapse' : 'Expand'} this microtheory block`);
        toggle.textContent = expanded ? '−' : '+';
        section.dataset.collapsed = String(!expanded);
      });
      const header = el('div', 'assertion-group-heading', toggle,
        el('span', 'context-label', 'Microtheory: '), mtLink(group.mt, group.mtExpression),
        el('span', 'muted block-count', `${group.items.length} on this page${index === 0 && offset > 0 ? ' · continued view' : ''}`));
      header.dataset.field = 'mt';
      const body = el('div', 'assertion-group-items', group.items.map(item => card(item, { term, detail, showMT: false })));
      section.append(header, body);
      container.append(section);
    });
    return container;
  }

  function proof(steps, { utilityReport } = {}) {
    const observations = new Map((utilityReport?.rules ?? []).map(row => [row.id, row]));
    return el('ol', 'shared-proof-steps', steps.map(step => {
      const row = step.kind === 'rule' ? observations.get(step.id) : null;
      const item = row ? { ...step, ruleUtility: {
        scope: 'query', perspective: 'proof_step', generation: utilityReport.generation,
        outcome: utilityReport.outcome, coverage: utilityReport.coverage,
        measurement: utilityReport.measurement, items: [row],
      } } : step;
      return el('li', null, card(item, { proofStep: true }));
    }));
  }

  return { card, groups, proof, ruleUtility: utilityView, utilityPanel,
    proofStep: (step, options = {}) => card(step, { ...options, proofStep: true }) };
}
