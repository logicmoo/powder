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
