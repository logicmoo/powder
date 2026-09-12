import { createTVAClient, createTVAInspector, renderAssertionPrior, renderAssertionPriorInline } from './native-tva.js';
import { colorAssertionBalls } from './assertion-markers.js';

/** Shared, viewport-bounded host bridge; native records and source interpretation stay separate. */
export function createAnnotationHost({ api, presentation, reference, sourceLink, getGeneration, document: doc = globalThis.document }) {
  const client = createTVAClient({
    fetchSummaries: (body, options) => api('tva/summary', {}, { ...options, method: 'POST', body }),
    fetchDetail: (body, options) => api('tva/detail', {}, { ...options, method: 'POST', body }),
  });
  const records = new Set();
  let revision = null, generation = null, controller, scheduled = false, epoch = 0;
  const wanted = record => record.assertion;
  const observer = typeof IntersectionObserver === 'function' ? new IntersectionObserver(entries => {
    for (const entry of entries) {
      const record = entry.target.annotationRecord;
      if (!record) continue;
      record.visible = entry.isIntersecting;
      record.inspector.setVisible(record.visible);
      record.nativeDetails?.setVisible(record.visible && record.node.querySelector('[data-field="properties"] > details')?.open);
    }
    schedule();
  }, { rootMargin: '120px' }) : null;
  const element = (tag, className, text) => {
    const node = doc.createElement(tag);
    if (className) node.className = className;
    if (text !== undefined) node.textContent = text;
    return node;
  };
  function effectiveValue(value, label) {
    const row = element('p', 'assertion-interpretation-value');
    row.append(`${label}: `);
    if (value?.status === 'initialized' && value.summary && Object.hasOwn(value.summary, 'value')) {
      row.append(String(value.summary.value), ` · ${value.origin === 'atom' ? 'Atom override' : value.origin === 'source' ? 'Source assertion' : value.origin === 'mt' ? 'Mt' : 'Global'}: `,
        reference({ key: value.supplier, expression: value.supplierExpression, kind: 'supplier' }));
    } else row.append(value?.status ?? 'Unavailable', value?.reason ? ` (${value.reason})` : '');
    return row;
  }
  function showInterpretation(record, data) {
    if (revision === null) revision = data.revision;
    if (generation === null) generation = data.generation;
    record.mapping.replaceChildren(
      effectiveValue(data.strengthCategory, 'Effective strength category'),
      effectiveValue(data.mappedStrength, 'Mapped source strength (display only)'),
      effectiveValue(data.direction, 'Effective assertion direction'));
    record.prior.replaceChildren(renderAssertionPrior(data, { document: doc, reference, sourceLink }));
    record.priorInline.replaceChildren(renderAssertionPriorInline(data, { document: doc }));
    updatePriorVisibility(record);
    if (record.data) colorAssertionBalls(record.node, [{ ...record.data, strengthCategory: data.strengthCategory }]);
    record.revision = data.revision;
    record.generation = data.generation;
    record.readContext = data.context;
  }
  function updatePriorVisibility(record) {
    if (!record.assertion) return;
    const preferences = presentation.get();
    record.priorInline.hidden = record.detail || preferences.fields?.assertionPrior === true
      || !Object.values(preferences.tvaFamilies ?? {}).some(Boolean);
  }
  function pendingPrior(record) {
    if (!record.assertion) return;
    for (const field of [record.prior, record.priorInline]) {
      field.replaceChildren(element('p', 'muted', 'Configured asserted-formula prior loading…'));
    }
  }
  function schedule() {
    if (scheduled) return;
    scheduled = true;
    queueMicrotask(refreshInterpretations);
  }
  async function refreshInterpretations() {
    scheduled = false;
    if (doc.hidden) return;
    const pending = [...records].filter(record => record.assertion && record.node.isConnected && record.visible && wanted(record)
      && (record.revision === undefined || record.revision !== revision || record.generation !== generation || record.readContext !== record.context));
    if (!pending.length) return;
    controller?.abort();
    controller = new AbortController();
    const request = controller, current = ++epoch;
    const groups = new Map();
    for (const record of pending) {
      if (!groups.has(record.context)) groups.set(record.context, []);
      groups.get(record.context).push(record);
    }
    for (const [context, group] of groups) {
      for (let start = 0; start < group.length; start += 200) {
        const batch = group.slice(start, start + 200);
        try {
          const reply = await api('tva/interpretations', {}, {
            method: 'POST', body: { entities: [...new Set(batch.map(record => record.entity))], context },
            signal: request.signal,
          });
          if (current !== epoch || request.signal.aborted) return;
          if (reply.generation !== getGeneration()) throw new Error('Knowledge generation changed; refresh this view.');
          if (revision !== null && reply.revision !== revision) throw new Error('Annotation settings changed; refresh this view.');
          const values = new Map(reply.items.map(item => [item.entity, item]));
          for (const record of batch) {
            if (!records.has(record) || record.context !== context) continue;
            const value = values.get(record.entity);
            if (!value) throw new Error('Assertion interpretation is unavailable, not Uninitialized.');
            showInterpretation(record, value);
          }
        } catch (error) {
          if (error.name === 'AbortError' || current !== epoch) return;
          for (const record of batch) {
            record.mapping.replaceChildren(element('p', 'statistics-error', error.message));
            record.prior.replaceChildren(element('p', 'statistics-error', error.message));
            record.priorInline.replaceChildren(element('p', 'statistics-error', error.message));
          }
        }
      }
    }
  }
  function attach(node, entity, { context = null, assertion = false, detail = false, signal, inline = true, visible, data } = {}) {
    const initiallyVisible = visible ?? (!observer || !assertion);
    const inspector = createTVAInspector({ client, target: entity, currentMt: context, presentation,
      document: doc, signal, reference, visible: initiallyVisible, inline });
    node.append(inspector);
    const record = { node, entity, context, assertion, detail, inspector, visible: initiallyVisible, data };
    if (assertion) {
      record.mapping = element('div', 'assertion-field assertion-interpretation');
      record.mapping.dataset.field = 'strength';
      record.prior = element('div', 'assertion-field assertion-prior');
      record.prior.dataset.field = 'assertionPrior';
      record.priorInline = element('div', 'assertion-prior-inline');
      node.append(record.priorInline, record.mapping, record.prior);
      pendingPrior(record);
      updatePriorVisibility(record);
    }
    node.annotationRecord = record;
    records.add(record);
    if (assertion) observer?.observe(node);
    let nativeDetails;
    const properties = assertion ? node.querySelector('[data-field="properties"] > details') : null;
    const toggleProperties = () => nativeDetails?.setVisible(properties.open && record.visible);
    if (properties) {
      nativeDetails = createTVAInspector({ client, target: entity, currentMt: context, presentation,
        document: doc, signal, reference, visible: false });
      properties.append(nativeDetails);
      properties.addEventListener('toggle', toggleProperties);
      record.nativeDetails = nativeDetails;
    }
    const dispose = () => {
      inspector.dispose(); observer?.unobserve(node); records.delete(record);
      nativeDetails?.dispose(); properties?.removeEventListener('toggle', toggleProperties);
      if (node.annotationRecord === record) delete node.annotationRecord;
    };
    signal?.addEventListener('abort', dispose, { once: true });
    if (signal?.aborted) dispose();
    schedule();
    return { dispose, setVisible(value) {
      record.visible = value; inspector.setVisible(value); toggleProperties(); schedule();
    }, setContext(context) {
      record.context = context; record.revision = undefined;
      pendingPrior(record);
      inspector.setContext(context); nativeDetails?.setContext(context); schedule();
    } };
  }
  function invalidate(next = {}) {
    revision = Object.hasOwn(next, 'revision') ? next.revision : null;
    generation = Object.hasOwn(next, 'generation') ? next.generation : getGeneration();
    epoch++; controller?.abort();
    client.invalidate({ revision, generation });
    for (const record of records) { record.revision = undefined; pendingPrior(record); }
    schedule();
  }
  const unsubscribe = presentation.subscribe(() => {
    for (const record of records) updatePriorVisibility(record);
    schedule();
  }, { immediate: false });
  doc.addEventListener('visibilitychange', schedule);
  return {
    attach, invalidate, client,
    active: () => [...records].some(record => record.node.isConnected && record.visible
      && (Object.values(presentation.get().tvaFamilies ?? {}).some(Boolean) || record.assertion && wanted(record))),
    setContext(context) {
      epoch++; controller?.abort();
      for (const record of records) {
        record.context = context; record.revision = undefined;
        pendingPrior(record);
        record.inspector.setContext(context);
        record.nativeDetails?.setContext(context);
      }
      schedule();
    },
    dispose() {
      epoch++; controller?.abort(); observer?.disconnect(); unsubscribe(); client.dispose();
      for (const record of records) record.inspector.dispose();
      records.clear(); doc.removeEventListener('visibilitychange', schedule);
    },
  };
}
