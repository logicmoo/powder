import test from 'node:test';
import assert from 'node:assert/strict';
import { durationText, timelineModel } from '../web/agent-timeline.js';

test('recorded failed requests never keep a running elapsed interval', () => {
  const data = { status: 'failed', events: [
    { kind: 'turn_started', at: 100 },
    { kind: 'turn_failed', at: 112.5, detail: { code: 'llm_model_unavailable' } },
  ] };
  const model = timelineModel(data, [], 2000);
  assert.equal(model.totalMs, 12500);
  assert.equal(model.current, null);
  assert.match(model.steps[0].label, /no completion POST/);
});
test('measured phases display endpoint wait without inventing generation', () => {
  const model = timelineModel({ status: 'running', timing: { phase: 'http', totalMs: 1800,
    steps: [{ name: 'preparing', elapsedMs: 300, status: 'completed' },
      { name: 'http', elapsedMs: 1500, status: 'running' }] } });
  assert.equal(model.current, 'Waiting for emullm endpoint');
  assert.equal(model.steps[1].milliseconds, 1500);
  assert.equal(model.totalMs, 1800);
});
test('browser submissions and unavailable backend details remain explicit', () => {
  const client = [{ label: 'Submit message to powder', elapsedMs: 25, status: 'completed' }];
  const model = timelineModel({ status: 'running', events: [{ kind: 'turn_started', at: 100 }] }, client, 110);
  assert.equal(model.steps[0].source, 'browser request');
  assert.equal(model.steps[1].milliseconds, 10000);
  assert.match(model.note, /unavailable/);
  assert.equal(durationText(1250), '1.3s');
  assert.equal(durationText(null), 'not measured');
});
test('live backend DTO shows every measured stage and advances only its current operation', () => {
  const data = { status: 'running', activeTurn: 'r1', timing: { supported: true, last: null,
    current: { runId: 'r1', status: 'running', live: true, complete: false, elapsedMs: 1000,
      steps: [{ operation: 'request_encoding', durationMs: 20, kind: 'interval' },
        { operation: 'http_dispatch', durationMs: 0, kind: 'instant' }],
      currentStep: { operation: 'endpoint_wait', elapsedMs: 980 } } } };
  const result = timelineModel(data, [], 0, 500);
  assert.equal(result.totalMs, 1500);
  assert.equal(result.steps[0].milliseconds, 20);
  assert.equal(result.steps[2].milliseconds, 1480);
  assert.equal(result.current, 'Waiting for emullm endpoint');
  data.timing.current.status = 'failed'; data.timing.current.live = false;
  assert.equal(timelineModel(data, [], 0, 90000).totalMs, 1000);
});
test('an older terminal trace never replaces the active request timeline', () => {
  const result = timelineModel({ status: 'running', activeTurn: 'new', events: [{ kind: 'turn_started', at: 100 }],
    timing: { current: null, last: { runId: 'old', status: 'ready', steps: [], elapsedMs: 2 } } }, [], 105);
  assert.equal(result.totalMs, 5000);
  assert.match(result.note, /unavailable/);
});
