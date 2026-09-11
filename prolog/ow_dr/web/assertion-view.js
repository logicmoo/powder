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
    if (!Array.isArray(detail?.items) || !detail.items.length) return null;
    const metric = (row, key) => Number.isFinite(row[key]) && row[key] >= 0 ? row[key] : 'Unavailable';
    const labels = [
      ['calls', 'Calls after head and microtheory entry'],
      ['results', 'Successful body results'],
      ['productiveCalls', 'Calls producing a result'],
      ['exhaustedCalls', 'Exhausted calls'],
      ['cutCalls', 'Cut calls'],
      ['interruptedCalls', 'Interrupted calls'],
      ['zeroResultExhaustedCalls', 'Exhausted calls with no result'],
      ['answersHelped', 'Unique returned answers helped (per-query distinct, summed across queries)'],
      ['proofOccurrences', 'Returned proof occurrences'],
      ['resultsPerCall', 'Results per call (yield may exceed 1)'],
      ['productiveCallFraction', 'Fraction of calls producing a result'],
      ['queriesObserved', 'Queries observed'],
      ['partialQueries', 'Partial queries'],
    ];
    const states = { current: 'Current content', prior_generation: 'Prior generation', stale: 'Stale source content' };
    const content = el('section', 'rule-utility-detail', el('h3', null, 'Observed rule utility'),
      el('p', 'muted', 'Execution observations only—not confidence, truth, ranking, or pruning rules. Inclusive costs are non-additive across nested rules.'));
    if (Number.isSafeInteger(detail.total) && detail.total > detail.items.length) {
      content.append(el('p', 'muted', `${detail.items.length} of ${detail.total} observation records returned.`));
    }
    for (const row of detail.items) {
      const label = `${states[row.identityState] ?? 'Observation record'}${Number.isSafeInteger(row.generation) ? ` · generation ${row.generation}` : ''} · ${row.observed === true ? 'observed' : 'unobserved'}`;
      content.append(disclosure(label, () => {
        if (row.observed !== true) return el('p', 'muted', 'No execution observations are available. Unobserved measures are unknown, not zero.');
        const properties = labels.map(([key, name]) => ({ name, value: metric(row, key) }));
        const cost = row.inclusiveCost ?? {};
        properties.push(
          { name: 'Inclusive active wall time (seconds)', value: metric(cost, 'wallSeconds') },
          { name: 'Inclusive thread CPU time (seconds)', value: metric(cost, 'cpuSeconds') },
          { name: 'Inclusive inferences', value: metric(cost, 'inferences') },
          { name: 'Observation coverage', value: row.coverage ?? 'Unavailable' });
        for (const [key, name] of [['firstObserved', 'First observed'], ['lastObserved', 'Last observed']]) {
          if (row[key] !== null && row[key] !== undefined) properties.push({ name, value: row[key] });
        }
        const values = el('div', null, propertyList(properties));
        if (row.contentHash) values.append(disclosure('Observed content identity',
          () => propertyList([{ name: 'Content hash', value: row.contentHash }])));
        return values;
      }, { open: detail.items.length === 1 }));
    }
    if (detail.measurement || detail.lifetime) content.append(disclosure('Measurement scope and limitations',
      () => propertyList([
        ...(detail.measurement ? [{ name: 'Measurement', value: detail.measurement }] : []),
        ...(detail.lifetime ? [{ name: 'Lifetime', value: detail.lifetime }] : []),
      ])));
    return content;
  };

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

  function proof(steps) {
    return el('ol', 'shared-proof-steps', steps.map(step => el('li', null, card(step, { proofStep: true }))));
  }

  return { card, groups, proof, ruleUtility: utilityView,
    proofStep: (step, options = {}) => card(step, { ...options, proofStep: true }) };
}
