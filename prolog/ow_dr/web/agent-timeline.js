export function durationText(milliseconds) {
  if (!Number.isFinite(milliseconds)) return 'not measured';
  const seconds = Math.max(0, milliseconds) / 1000;
  if (seconds < 60) return `${seconds.toFixed(1)}s`;
  return `${Math.floor(seconds / 60)}m ${(seconds % 60).toFixed(1)}s`;
}

const phaseLabels = {
  admission: 'Admitting the request',
  disclosure_validation: 'Checking the selected disclosure grant',
  request_preparation: 'Preparing the completion request',
  admission_persistence: 'Saving the accepted message',
  worker_wait: 'Waiting for powder execution',
  context_preparation: 'Preparing the permitted context',
  outgoing_validation: 'Validating the outgoing request',
  request_encoding: 'Encoding the completion request',
  http_dispatch: 'Dispatch HTTP request',
  response_read: 'Reading the endpoint response',
  response_decode: 'Decoding the endpoint response',
  reply_validation: 'Validating the reply',
  reply_persistence: 'Saving the received reply',
  tool_validation: 'Validating the requested tool',
  tool_reservation: 'Reserving the tool call',
  tool_execution: 'Executing the validated tool',
  tool_receipt_persistence: 'Saving the tool receipt',
  tool_history_persistence: 'Saving tool history',
  terminal_persistence: 'Saving the final outcome',
  context_cleanup: 'Releasing request context',
  cancellation: 'Interrupting host work',
  queue_wait: 'Waiting in the message queue',
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

export function timelineModel(conversation, clientSteps = [], now = Date.now() / 1000, sinceObservationMs = 0) {
  const client = clientSteps.map(step => ({
    label: step.label, status: step.status, milliseconds: step.elapsedMs,
    source: 'browser request',
  }));
  const container = conversation?.timing;
  const events = conversation?.events ?? [];
  const targetRun = conversation?.activeTurn ?? events.findLast(event => event.kind === 'turn_started')?.detail?.run;
  const timing = container?.current ?? (container?.last && (!targetRun || container.last.runId === targetRun) ? container.last : null)
    ?? (Array.isArray(container?.steps) ? container : null);
  if (Array.isArray(timing?.steps)) {
    const live = timing.live === true;
    const advance = live ? Math.max(0, sinceObservationMs) : 0;
    const label = step => step.label ?? phaseLabels[step.operation ?? step.name ?? step.phase]
      ?? step.operation ?? step.name ?? step.phase ?? 'Observed operation';
    const server = timing.steps.slice(0, 512).map(step => ({
      label: label(step),
      status: step.status ?? step.state ?? (step.kind === 'instant' ? 'observed' : 'finished'),
      milliseconds: step.elapsedMs ?? step.durationMs,
      source: step.source ?? 'powder',
    }));
    if (timing.currentStep) server.push({
      label: label(timing.currentStep), status: live ? 'in progress' : 'checkpoint incomplete',
      milliseconds: Number.isFinite(timing.currentStep.elapsedMs) ? timing.currentStep.elapsedMs + advance : null,
      source: live ? 'powder (last observed operation)' : 'saved checkpoint',
    });
    const total = timing.totalMs ?? timing.elapsedMs;
    return { steps: [...client, ...server], status: timing.status ?? conversation.status,
      totalMs: Number.isFinite(total) ? total + advance : null,
      current: timing.currentStep && live ? label(timing.currentStep) : phaseLabels[timing.phase] ?? timing.phase ?? null,
      note: `${timing.truncated ? 'Trace reached its recorded step limit. ' : ''}${timing.complete === false && !live ? 'Saved timing checkpoint is incomplete. ' : ''}Powder total is measured from admission (including measured queue wait). Browser/server intervals overlap; do not add them. Endpoint waiting does not establish model generation or worker startup.` };
  }
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
