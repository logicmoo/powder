export function durationText(milliseconds) {
  if (!Number.isFinite(milliseconds)) return 'not measured';
  const seconds = Math.max(0, milliseconds) / 1000;
  if (seconds < 60) return `${seconds.toFixed(1)}s`;
  return `${Math.floor(seconds / 60)}m ${(seconds % 60).toFixed(1)}s`;
}

const phaseLabels = {
  accepted: 'Request accepted',
  preparing: 'Preparing the request',
  preparation: 'Preparing the request',
  http: 'Waiting for emullm endpoint',
  endpoint_wait: 'Waiting for emullm endpoint',
  validating: 'Validating the received reply',
  validation: 'Validating the received reply',
  tool: 'Executing a validated tool',
  persistence: 'Saving the conversation result',
  persisting: 'Saving the conversation result',
};

export function timelineModel(conversation, clientSteps = [], now = Date.now() / 1000) {
  const client = clientSteps.map(step => ({
    label: step.label, status: step.status, milliseconds: step.elapsedMs,
    source: 'browser request',
  }));
  const timing = conversation?.timing;
  if (Array.isArray(timing?.steps)) {
    const server = timing.steps.slice(-64).map(step => ({
      label: step.label ?? phaseLabels[step.name ?? step.phase] ?? step.name ?? step.phase ?? 'Observed operation',
      status: step.status ?? step.state ?? 'recorded',
      milliseconds: step.elapsedMs ?? step.durationMs,
      source: step.source ?? 'powder',
    }));
    return { steps: [...client, ...server], status: timing.status ?? conversation.status,
      totalMs: timing.totalMs ?? timing.elapsedMs,
      current: phaseLabels[timing.phase] ?? timing.phase ?? null,
      note: 'Measured request stages. Endpoint waiting does not establish that a model is generating.' };
  }
  const events = conversation?.events ?? [];
  const start = events.findLastIndex(event => event.kind === 'turn_started' && Number.isFinite(event.at));
  if (start < 0) return { steps: client, status: client.some(step => step.status === 'running') ? 'submitting' : 'ready',
    totalMs: client.length ? client.reduce((sum, step) => sum + (step.milliseconds ?? 0), 0) : null,
    current: null, note: 'Browser request timings only. No model timing has been reported.' };
  const tail = events.slice(start), accepted = tail[0];
  const terminal = tail.find(event => ['turn_completed', 'turn_failed', 'interrupted', 'closed', 'local_mutation_boundary'].includes(event.kind));
  const completedAt = Number.isFinite(terminal?.at) ? terminal.at : null;
  const last = completedAt ?? (conversation.status === 'running' ? now : null);
  const failedCatalog = terminal?.kind === 'turn_failed' && terminal.detail?.code === 'llm_model_unavailable';
  const server = [{
    label: failedCatalog ? 'Legacy catalog check / local preparation (no completion POST)'
      : 'Backend work (individual stages were not recorded)',
    status: terminal?.kind === 'turn_failed' ? 'failed' : terminal ? 'completed' : conversation.status,
    milliseconds: last === null ? null : Math.max(0, last - accepted.at) * 1000,
    source: 'recorded turn events',
  }];
  return { steps: [...client, ...server], status: conversation.status,
    totalMs: last === null ? null : Math.max(0, last - accepted.at) * 1000,
    current: conversation.status === 'running' ? 'Awaiting measured backend progress' : null,
    note: failedCatalog ? 'This old request was rejected locally before model generation.'
      : 'Detailed backend/provider stages are unavailable for this recorded turn; no generation phase is inferred.' };
}

export function renderRequestTimeline(element, model) {
  const node = element('section', { className: 'llm-request-timeline', 'aria-label': 'Request step timings' },
    element('h3', {}, 'Request timing'),
    element('p', { className: 'llm-timeline-summary', role: 'timer', 'aria-live': 'off' },
      `${model.current ?? model.status ?? 'Request'} · Total: ${durationText(model.totalMs)}`),
    element('ol', {}, model.steps.map(step => element('li', {},
      element('span', {}, step.label), element('strong', {}, durationText(step.milliseconds)),
      element('span', { className: 'muted' }, `${step.status} · ${step.source}`)))),
    element('p', { className: 'muted' }, model.note));
  node.hidden = model.steps.length === 0;
  return node;
}
