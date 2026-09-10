import test from 'node:test';
import assert from 'node:assert/strict';
import { createServer } from 'node:http';
import { readFile, writeFile } from 'node:fs/promises';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';
import { launchChromium } from './chromium.mjs';
import { APP_BASE, apiPath } from '../web/paths.js';

const here = dirname(fileURLToPath(import.meta.url));
const browser = process.env.LOGOS_CHROME;
const symbol = value => ({ type: 'symbol', value: `x_${value}` });
const variable = value => ({ type: 'variable', value });
const app = (name, ...args) => ({ type: 'application', head: symbol(name), args });

test('real browser exercises the API contract, source transactions, rendering and mobile layout', { skip: !browser, timeout: 60000 }, async () => {
  let browserSession;
  let server;
  let generation = 1;
  let active = ['KBs/alpha/a.kif', 'KBs/tinyKB.kif'];
  let failNextLoad = false;
  let failContextList = false;
  let failCodeReload = false;
  let compilerDiagnostics = {};
  const requests = [];
  const apiRequests = name => requests.filter(request => request.path === apiPath(name));
  let serverConfig = { startupConfigured: false, startupFiles: [], revision: 'fixture-0', issues: [],
    pools: Object.fromEntries(['loader', 'inference', 'http'].map(name => [name, { start: 5, max: 10, spare: 2 }])) };
  const jobs = new Map();
  const acceptJob = (pool, label, files, work) => {
    const id = `task-${jobs.size + 1}`;
    jobs.set(id, { id, pool, label, files, work, polls: 0, state: 'queued', createdAt: Date.now() / 1000,
      startedAt: null, finishedAt: null, cancelable: true, progress: { phase: 'queued' } });
    return { accepted: true, jobId: id, pool, state: 'queued' };
  };
  const publicJob = job => {
    const { work, polls, ...publicData } = job;
    return publicData;
  };
  const file = path => ({ type: 'file', name: path.split('/').at(-1), path, lineCount: 40, sizeBytes: 1200, count: 3 });
  const expression = app('implies', app('and', app('isa', variable('?X'), symbol('Dog')), app('relatedTo', variable('?X'), symbol('Fido'))), app('isa', variable('?X'), symbol('Animal')));
  const assertions = ['x_A', 'x_B', 'x_A'].map((mt, index) => ({
    id: `a60a241820224${index}`, expression, mt, source: 'KBs/alpha/a.kif', line: 10 + index, names: ['?X'],
    properties: [{ name: 'direction', value: ':FORWARD' }], mappingRows: ['instance-isa'], predicate: { term: 'x_implies', arity: 2 },
  }));
  const compoundA = "mt:x_CommonsenseMicrostoryMtFn('x_ViolentImpact-Harm')";
  const compoundB = "mt:x_CommonsenseMicrostoryMtFn('x_ThermalImpact-Harm')";
  const compoundC = "mt:x_ContextFn('x_A & B',x_nested(x_C))";
  const sourceA = '(CommonsenseMicrostoryMtFn ViolentImpact-Harm)';
  const sourceB = '(CommonsenseMicrostoryMtFn ThermalImpact-Harm)';
  const mtExpressions = new Map([
    [compoundA, app('CommonsenseMicrostoryMtFn', symbol('ViolentImpact-Harm'))],
    [compoundB, app('CommonsenseMicrostoryMtFn', symbol('ThermalImpact-Harm'))],
    [compoundC, app('ContextFn', symbol('A & B'), app('nested', symbol('C')))],
  ]);
  const normalizedMT = value => value === sourceA ? compoundA : value === sourceB ? compoundB : value;
  const storedQuestions = Array.from({ length: 405 }, (_, index) => ({
    id: `question-${index}`, identifier: `TQ${index}`, question: `Stored question ${index}`,
    prolog: 'member(V1, [one,two]).', mt: compoundA, mtExpression: mtExpressions.get(compoundA),
    source: 'KBs/alpha/a.kif', line: 10, variables: [{ prolog: 'V1', source: '?X' }],
  }));
  const allContexts = [
    ...['x_B', 'x_A'].map(mt => ({ mt, mtExpression: { type: 'symbol', value: mt }, count: 2 })),
    ...[...mtExpressions].map(([mt, mtExpression]) => ({ mt, mtExpression, count: 1 })),
    ...Array.from({ length: 401 }, (_, i) => ({ mt: `x_Unseen${i}Mt`, mtExpression: symbol(`Unseen${i}Mt`), count: 1 })),
  ];
  const compoundAssertions = [compoundA, compoundB, compoundA].map((mt, index) => ({
    ...assertions[index], id: `a60a241820225${index}`, mt, mtExpression: mtExpressions.get(mt),
    properties: [{ name: 'microtheory', value: mt }],
  }));
  const diagnosticMarkers = [
    { type: 'note', message: 'Approved genFormat list retained as data.' },
    { type: 'warnings', message: 'Unexpected list form; review the source.' },
    { type: 'errors', message: 'Compilation error recorded for review.' },
  ];
  const diagnosticRows = ['instance-isa', ...diagnosticMarkers, 'instance-isa'];
  const diagnosticAssertions = [
    { ...assertions[0], id: 'a60a2418202260', mappingRows: diagnosticRows,
      notices: ['Stale alias must not win'],
      properties: [
        { name: 'notices', value: [diagnosticMarkers[0].message] },
        { name: 'warnings', value: [diagnosticMarkers[1].message] },
        { name: 'errors', value: [diagnosticMarkers[2].message] },
        { name: 'mapping_rows', value: diagnosticRows },
      ] },
    { ...assertions[0], id: 'a60a2418202261', mappingRows: [], properties: [
      { name: 'notices', value: ['Property-only notice'] },
      { name: 'warnings', value: ['Property-only warning'] },
      { name: 'errors', value: ['Property-only error'] },
    ] },
  ];
  const allAssertions = [...assertions, ...compoundAssertions, ...diagnosticAssertions];
  const mappings = Array.from({ length: 405 }, (_, index) => ({
    id: index === 0 ? 'instance-isa' : `row-${index}`, sumo: index === 0 ? 'instance' : `Source${index}`,
    cycl: '#$isa', conversion: 'rename(isa,2)', category: 'predicate', equivalence: 'close',
    confidence: 'medium', basis: index === 54 ? 'evidence' : 'guess', notes: 'Curated test fixture, not corpus evidence.',
    targetTerm: 'x_isa',
  }));
  const status = () => ({ generation, files: active.map(file), counts: { assertions: active.length * 3, terms: active.length ? 6 : 0, predicates: active.length ? 2 : 0, microtheories: active.length ? 2 : 0 }, warnings: [], timing: { generated: 2, cacheHits: 0 }, ...compilerDiagnostics });
  const page = (items, url) => {
    const offset = Number(url.searchParams.get('offset') || 0);
    const limit = Number(url.searchParams.get('limit') || 50);
    return { items: items.slice(offset, offset + limit), total: items.length, offset, limit };
  };
  try {
    server = createServer(async (request, response) => {
      try {
        const url = new URL(request.url, 'http://localhost');
        let body;
        if (request.method === 'POST') {
          const chunks = [];
          for await (const chunk of request) chunks.push(chunk);
          body = JSON.parse(Buffer.concat(chunks).toString());
        }
        requests.push({ path: url.pathname, params: Object.fromEntries(url.searchParams), body,
          token: request.headers['x-powder-local-token'] });
        const json = (value, code = 200) => {
          response.writeHead(code, { 'Content-Type': 'application/json', 'Cache-Control': 'no-store' });
          response.end(JSON.stringify(value));
        };
        const mountedPath = url.pathname.startsWith(APP_BASE) ? `/${url.pathname.slice(APP_BASE.length)}` : null;
        switch (mountedPath) {
          case '/api/status': return json(status());
          case '/api/kb/catalog': return json({ root: 'KBs', generation, active, nodes: [
            { type: 'directory', path: 'KBs/alpha', name: 'alpha', children: [file('KBs/alpha/a.kif'), file('KBs/alpha/b.krf'), file('KBs/alpha/c.metta')] },
            file('KBs/tinyKB.kif'),
          ] });
          case '/api/search': return json(page(active.length ? [{ term: 'x_Dog', count: 3 }, { term: 'x_Animal', count: 2 }] : [], url));
          case '/api/predicates': return json(page(active.length ? [{ term: 'x_isa', count: 3, arity: 2 }] : [], url));
          case '/api/term': {
            const term = url.searchParams.get('term');
            return json({ term, ...page(term === 'x_compoundDemo' ? compoundAssertions : term === 'x_diagnosticsDemo' ? diagnosticAssertions : assertions, url) });
          }
          case '/api/microtheory': {
            const mt = normalizedMT(url.searchParams.get('mt'));
            return json({ mt, mtExpression: mtExpressions.get(mt), ...page(allAssertions.filter(item => item.mt === mt), url) });
          }
          case '/api/microtheories':
            return failContextList ? json({ error: { code: 'catalog_failed', message: 'Context list unavailable' } }, 503)
              : json({ generation, items: active.length ? allContexts : [], total: active.length ? allContexts.length : 0 });
          case '/api/assertion': return json(allAssertions.find(item => item.id === url.searchParams.get('id')) ?? assertions[0]);
          case '/api/source': {
            const line = Number(url.searchParams.get('line') || 10);
            return json({ path: url.searchParams.get('path'), line, start: Math.max(1, line - 1), lines: ['; test fixture', '(isa Fido Dog)', '(isa Dog Animal)'] });
          }
          case '/api/mappings': {
            const filtered = mappings.filter(row => ['basis', 'confidence', 'category', 'equivalence'].every(key => !url.searchParams.get(key) || row[key] === url.searchParams.get(key))
              && (!url.searchParams.get('q') || JSON.stringify(row).includes(url.searchParams.get('q'))));
            return json(page(filtered, url));
          }
          case '/api/version': return json({ version: 'fixture-v1' });
          case '/api/server/settings': return json(serverConfig);
          case '/api/server/settings/save':
            serverConfig = { ...body.settings, revision: `fixture-${Date.now()}`, issues: [] };
            return json(serverConfig);
          case '/api/tasks': return json({
            tasks: [...jobs.values()].map(publicJob), completedHistoryLimit: 100, persistence: 'Transient task history.',
            pools: ['loader', 'inference', 'http'].map(pool => ({ pool, profile: { start: 5, max: 10, spare: 2 },
              total: 5, busy: 0, idle: 5, queued: [...jobs.values()].filter(job => job.pool === pool && job.state === 'queued').length })),
          });
          case '/api/tasks/detail': {
            const job = jobs.get(url.searchParams.get('id'));
            if (!job) return json({ error: { code: 'not_found', message: 'No task' } }, 404);
            if (job.state === 'queued') { job.state = 'running'; job.startedAt = Date.now() / 1000; job.progress = { phase: 'running' }; }
            else if (job.state === 'running') {
              Object.assign(job, job.work()); job.work = null;
              job.state = job.error || ['exception', 'timeout'].includes(job.result?.status) ? 'failed' : 'succeeded';
              job.finishedAt = Date.now() / 1000; job.cancelable = false;
            }
            return json(publicJob(job));
          }
          case '/api/tasks/cancel': {
            const job = jobs.get(body.id);
            if (job && ['queued', 'running'].includes(job.state)) {
              job.state = 'cancelled'; job.finishedAt = Date.now() / 1000; job.cancelable = false;
            }
            return json(publicJob(job));
          }
          case '/api/test-questions': return json({ generation, ...page(active.length ? storedQuestions : [], url) });
          case '/api/prolog/access': return json({ token: 'fixture-local-token' });
          case '/api/prolog/query': {
            const execution = { mode: 'prolog', status: 'success', generation, mt: body.mt,
              output: 'captured output', errorOutput: '', exception: null,
              solutions: [{ bindings: [{ name: 'V1', value: 'one' }] }] };
            return json(acceptJob('inference', 'Prolog query', [], () => ({ result: body.query.includes('throw')
              ? { ...execution, status: 'exception', exception: { term: 'test_exception', message: 'test exception' } }
              : execution })), 202);
          }
          case '/api/app/reload':
            await new Promise(resolve => setTimeout(resolve, 40));
            if (failCodeReload) return json({ error: { code: 'application_reload_failed',
              message: 'Some application code changed; reload failed and cannot be rolled back.',
              issues: [{ source: 'prolog/ow_dr/kb_example.pl', status: 'failed', message: 'Syntax error' }] } }, 500);
            return json({ count: 1, reloaded: ['prolog/ow_dr/kb_example.pl'], warnings: [], generation,
              message: 'Reloaded 1 changed Prolog application file. KB generation and sources are unchanged.' });
          case '/api/query': {
            const contexts = body.query === '(compoundQuery ?X)' && !body.mt ? [compoundA, compoundB] : [normalizedMT(body.mt) || 'x_A'];
            return json(acceptJob('inference', 'KB inference', [], () => ({ result: { solutions: contexts.map(mt => ({
              mt, mtExpression: mtExpressions.get(mt), bindings: [{ name: '?X', value: symbol('Fido') }],
              proof: [{ id: assertions[0].id, kind: 'fact', before: 0, after: 1, expression: app('isa', symbol('Fido'), symbol('Dog')) }],
            })) } })), 202);
          }
          case '/api/kb/load':
            if (failNextLoad) {
              const error = typeof failNextLoad === 'object' ? failNextLoad : { code: 'compile_failed', message: 'Fixture compile failure' };
              failNextLoad = false;
              return json(acceptJob('loader', 'Load sources', body.files, () => ({ error })), 202);
            }
            if (body.generation !== generation) return json({ error: { code: 'stale_generation', message: 'Stale generation' } }, 409);
            return json(acceptJob('loader', 'Load sources', body.files, () => {
              active = body.files; generation++; return { result: status() };
            }), 202);
          case '/api/kb/unload':
            if (body.generation !== generation) return json({ error: { code: 'stale_generation', message: 'Stale generation' } }, 409);
            return json(acceptJob('loader', 'Unload source', [body.path], () => {
              active = active.filter(path => path !== body.path); generation++; return { result: status() };
            }), 202);
          default: {
            const asset = mountedPath === '/' ? 'index.html' : mountedPath?.slice(1);
            if (!['index.html', 'app.js', 'style.css', 'render.js', 'model.js', 'diagnostics.js', 'settings.js', 'settings.json', 'paths.js', 'paths.json'].includes(asset)) { response.writeHead(404); response.end(); return; }
            response.writeHead(200, { 'Content-Type': asset.endsWith('.html') ? 'text/html' : asset.endsWith('.css') ? 'text/css' : asset.endsWith('.json') ? 'application/json' : 'text/javascript', 'Cache-Control': 'no-store' });
            response.end(await readFile(join(here, '..', 'web', asset)));
          }
        }
      } catch (error) {
        response.writeHead(500);
        response.end(String(error));
      }
    });
    await new Promise(resolve => server.listen(0, '127.0.0.1', resolve));
    const base = `http://127.0.0.1:${server.address().port}${APP_BASE}`;
    browserSession = await launchChromium(browser);
    const { send: cdp, evaluate, wait, route, exceptions } = browserSession;
    const noOverflow = async () => assert.equal(await evaluate('document.documentElement.scrollWidth <= document.documentElement.clientWidth'), true, 'No horizontal page overflow');
    await cdp('Emulation.setDeviceMetricsOverride', { width: 1360, height: 950, deviceScaleFactor: 1, mobile: false });
    await cdp('Page.navigate', { url: base });
    await wait(`document.querySelector('h1')?.textContent === 'Knowledge overview' && document.querySelector('main').getAttribute('aria-busy') === 'false'`);
    assert.equal(await evaluate('document.title'), 'Knowledge overview · powder');
    assert.equal(await evaluate('document.querySelector(".brand").getAttribute("aria-label")'), 'powder overview');
    assert.ok(await evaluate('document.querySelector(".brand-subtitle").textContent.includes("Paraconsistent Open World Defeasible Epistemic Reasoner")'));
    assert.equal(await evaluate('document.body.innerText.includes("Logos")'), false);
    assert.equal(await evaluate('getComputedStyle(document.querySelector(".sidebar")).position'), 'sticky');
    await noOverflow();
    await route('#/microtheories');
    assert.equal(await evaluate('document.querySelectorAll(".microtheory-directory li[data-mt]").length'), allContexts.length);
    assert.ok(await evaluate('document.querySelector(\'li[data-mt="x_Unseen400Mt"]\') !== null'));
    assert.equal(apiRequests('microtheories').at(-1).params.limit, undefined);
    failContextList = true;
    await evaluate('location.hash = "#/microtheories?retry=1"');
    await wait('document.querySelector(".microtheory-directory .error-panel") !== null && document.querySelector("main").getAttribute("aria-busy") === "false"');
    assert.ok(await evaluate('document.querySelector(".microtheory-directory .error-panel").textContent.includes("Context list unavailable")'));
    assert.equal(await evaluate('document.querySelector(".microtheory-directory .empty-state")'), null);
    failContextList = false;
    if (process.env.LOGOS_SCREENSHOTS) {
      const image = await cdp('Page.captureScreenshot');
      await writeFile(join(here, '.browser-check-desktop.png'), Buffer.from(image.data, 'base64'));
    }
    await route('#/term?term=x_Dog');
    assert.equal(await evaluate('document.querySelectorAll(".mt-block").length'), 3);
    assert.ok(await evaluate('document.querySelector(".assertion-card > .expression").innerText.includes("\\n  (and\\n    (isa ?X Dog)")'));
    assert.equal(await evaluate('document.querySelectorAll(".assertion-card > .expression a").length'), 24);
    await route('#/predicates');
    assert.ok(await evaluate('document.querySelector("tbody").innerText.includes("2")'));
    await route('#/source?path=KBs%2Falpha%2Fa.kif&line=10');
    assert.equal(await evaluate('document.querySelector(".highlighted-line code").textContent'), '(isa Fido Dog)');
    await route('#/sources');
    const directory = 'document.querySelector(\'input[aria-label="Select all supported files in KBs/alpha"]\')';
    assert.equal(await evaluate(`${directory}.indeterminate`), true);
    await evaluate(`document.querySelector('button[aria-label="Expand KBs/alpha"]').click(); ${directory}.click(); document.querySelector('input[aria-label="Select KBs/alpha/c.metta"]').click()`);
    assert.equal(await evaluate(`${directory}.indeterminate`), true);
    failNextLoad = true;
    await evaluate('document.querySelector(".source-actions .button").click()');
    await wait('document.querySelector("#notice").textContent.includes("Fixture compile failure")');
    assert.deepEqual(apiRequests('kb/load').at(-1).body,
      { files: ['KBs/alpha/a.kif', 'KBs/alpha/b.krf', 'KBs/tinyKB.kif'], generation: 1 });
    assert.deepEqual(active, ['KBs/alpha/a.kif', 'KBs/tinyKB.kif']);
    assert.equal(await evaluate(`${directory}.indeterminate`), true);
    const batchIssues = Array.from({ length: 15 }, (_, index) => {
      const message = `Source ${index + 1} has an invalid form; review its arguments.`;
      return {
        source: index === 0 ? 'KBs/alpha/a.kif' : index === 1 ? 'KBs/alpha/b.krf'
          : index === 2 ? 'C:/outside/private.krf' : `KBs/unavailable-${index}.krf`,
        line: 13, column: 17, message, status: 'failed', errors: [message],
        warnings: index === 0 ? ['Review the unexpected argument list.'] : [],
        notices: index === 0 ? ['Approved list handling was preserved.'] : [],
        mappingRows: [{ type: 'errors', message }],
      };
    });
    failNextLoad = {
      code: 'compile_failed', message: '15 source(s) failed to compile.',
      counts: { failed: 15, busy: 0, generated: 0, cacheHits: 42 }, issues: batchIssues,
      results: Array.from({ length: 42 }, (_, index) => ({ source: `KBs/success-from-cache-${index}.krf`, status: 'cache_hit' })),
    };
    await evaluate('document.querySelector(".source-actions .button").click()');
    await wait('document.querySelector("#notice .compile-issues") !== null');
    assert.equal(await evaluate('document.querySelector("#notice .failure-summary").textContent'), '15 source(s) failed to compile.');
    assert.equal(await evaluate('document.querySelector("#notice [data-count=cacheHits]").textContent'), '42 cache hits');
    assert.equal(await evaluate('document.querySelectorAll("#notice .compile-issue").length'), 15);
    assert.equal(await evaluate('document.querySelectorAll("#notice .compile-issue-heading a").length'), 2);
    assert.ok(!(await evaluate('document.querySelector("#notice").textContent')).includes('success-from-cache'));
    assert.ok(!(await evaluate('document.querySelector("#notice").textContent')).includes('Unknown error term'));
    assert.ok((await evaluate('document.querySelector("#notice").textContent')).length < 12000);
    assert.equal(await evaluate(`document.querySelector("#notice").textContent.split(${JSON.stringify(batchIssues[0].message)}).length - 1`), 1);
    assert.ok(await evaluate('document.querySelector("#notice .state-protection").textContent.includes("draft selection is unchanged")'));
    assert.deepEqual(active, ['KBs/alpha/a.kif', 'KBs/tinyKB.kif']);
    assert.equal(generation, 1);
    assert.equal(await evaluate(`${directory}.indeterminate`), true);
    await evaluate('document.querySelector("#notice .compile-issues > summary").click()');
    assert.equal(await evaluate('document.querySelector("#notice .compile-issue-heading .source-link").textContent'), 'KBs/alpha/a.kif:13:17');
    await cdp('Emulation.setDeviceMetricsOverride', { width: 390, height: 844, deviceScaleFactor: 1, mobile: true });
    await noOverflow();
    await cdp('Emulation.setDeviceMetricsOverride', { width: 1360, height: 950, deviceScaleFactor: 1, mobile: false });
    await evaluate('document.querySelector("#notice .compile-issue-heading .source-link").click()');
    await wait('document.querySelector("h1")?.textContent === "KBs/alpha/a.kif"');
    assert.ok(await evaluate('document.querySelector(".lead").textContent.includes("line 13, column 17")'));
    assert.equal(await evaluate('document.querySelector("#notice .compile-issues").open'), false);
    await route('#/sources');
    assert.equal(await evaluate(`${directory}.indeterminate`), true);
    assert.equal(await evaluate('document.querySelector(\'input[aria-label="Select KBs/alpha/b.krf"]\').checked'), true);
    assert.equal(await evaluate('document.querySelector(\'input[aria-label="Select KBs/alpha/c.metta"]\').checked'), false);
    failNextLoad = { code: 'busy', message: '1 source is busy.',
      counts: { failed: 0, busy: 1, generated: 0, cacheHits: 42 },
      issues: [{ source: 'KBs/alpha/b.krf', status: 'busy', message: 'Another compiler owns this source; retry after it finishes.' }],
    };
    await evaluate('document.querySelector(".source-actions .button").click()');
    await wait('document.querySelector("#notice.busy-notice") !== null');
    assert.equal(await evaluate('document.querySelector("#notice").getAttribute("role")'), 'status');
    assert.equal(await evaluate('document.querySelector("#notice .compile-issue-heading .badge").textContent'), 'Busy');
    assert.equal(generation, 1);
    assert.equal(await evaluate(`${directory}.indeterminate`), true);
    await evaluate('document.querySelector(".source-actions .button").click()');
    await wait('document.querySelector("#generation-state").textContent.startsWith("Generation 2") && document.querySelector("main").getAttribute("aria-busy") === "false"');
    assert.equal(active.length, 3);
    assert.equal(await evaluate('document.querySelector("#notice .compile-issue")'), null);
    await route('#/query?mt=x_A');
    await evaluate(`document.querySelector('textarea').value = '(isa ?X Dog)'; document.querySelector('.query-form').requestSubmit()`);
    await wait('document.querySelectorAll(".solution").length === 1');
    assert.equal(apiRequests('query').at(-1).body.mt, 'x_A');
    assert.ok(await evaluate('document.querySelector(".proof").textContent.includes("Bound slots 0 → 1")'));
    await route('#/term?term=x_compoundDemo');
    assert.deepEqual(await evaluate('Array.from(document.querySelectorAll(".mt-block > summary .mt-link")).map(link => new URLSearchParams(link.hash.split("?")[1]).get("mt"))'),
      [compoundA, compoundB, compoundA]);
    assert.equal(await evaluate('document.querySelector(".mt-block > summary .expression").textContent'), sourceA);
    assert.equal(await evaluate('document.querySelector(".mt-block > summary .expression a").textContent'), 'CommonsenseMicrostoryMtFn');
    assert.equal(await evaluate('document.querySelector(".mt-block > summary .expression a:last-child").textContent'), 'ViolentImpact-Harm');
    assert.ok(!(await evaluate('document.body.textContent')).includes('mt:x_'));
    await evaluate('document.querySelector(".mt-block > summary .mt-link").click()');
    await wait(`document.querySelector('h1')?.textContent === ${JSON.stringify(sourceA)}`);
    assert.equal(apiRequests('microtheory').at(-1).params.mt, compoundA);
    assert.equal(await evaluate('document.querySelectorAll(".microtheory-directory li[data-mt]").length'), allContexts.length);
    assert.equal(await evaluate('new URLSearchParams(document.querySelector(".microtheory-directory [aria-current=page]").hash.split("?")[1]).get("mt")'), compoundA);
    assert.ok(await evaluate('document.querySelector(".mt-block").open'));
    await evaluate('document.querySelector(".page-heading .button").click()');
    await wait('document.querySelector("textarea") !== null');
    assert.equal(await evaluate('document.querySelector(\'input[name="mt"]\').value'), sourceA);
    await evaluate('document.querySelector("textarea").value = "(isa ?X Dog)"; document.querySelector(".query-form").requestSubmit()');
    await wait('document.querySelectorAll(".solution").length === 1');
    assert.equal(apiRequests('query').at(-1).body.mt, compoundA);
    assert.equal(await evaluate('new URLSearchParams(location.hash.split("?")[1]).get("mt")'), compoundA);
    await evaluate(`document.querySelector('input[name="mt"]').value = ${JSON.stringify(sourceB)}; document.querySelector('input[name="mt"]').dispatchEvent(new Event('input', { bubbles: true })); document.querySelector(".query-form").requestSubmit()`);
    await wait('document.querySelectorAll(".solution").length === 1');
    assert.equal(apiRequests('query').at(-1).body.mt, sourceB);
    assert.equal(await evaluate('new URLSearchParams(document.querySelector(".solution .mt-link").hash.split("?")[1]).get("mt")'), compoundB);
    await route(`#/assertion?id=${compoundAssertions[1].id}`);
    assert.ok(!(await evaluate('document.body.textContent')).includes('mt:x_'));
    await route(`#/query?mt=${encodeURIComponent(compoundC)}`);
    assert.equal(await evaluate('document.querySelector(\'input[name="mt"]\').value'), '(ContextFn |A & B| (nested C))');
    await evaluate('document.querySelector("textarea").value = "(isa ?X Dog)"; document.querySelector(".query-form").requestSubmit()');
    await wait('document.querySelectorAll(".solution").length === 1');
    assert.equal(apiRequests('query').at(-1).body.mt, compoundC);
    await evaluate('document.querySelector(".context-input-help button").click(); document.querySelector("textarea").value = "(compoundQuery ?X)"; document.querySelector(".query-form").requestSubmit()');
    await wait('document.querySelectorAll(".solution").length === 2');
    assert.equal(apiRequests('query').at(-1).body.mt, '');
    assert.deepEqual(await evaluate('Array.from(document.querySelectorAll(".solution .mt-link")).map(link => new URLSearchParams(link.hash.split("?")[1]).get("mt"))'), [compoundA, compoundB]);
    await route('#/microtheories');
    assert.ok(!(await evaluate('document.body.textContent')).includes('mt:x_'));
    await evaluate(`document.querySelector('input[name="mt"]').value = ${JSON.stringify(sourceB)}; document.querySelector('main form').requestSubmit()`);
    await wait(`document.querySelector('h1')?.textContent === ${JSON.stringify(sourceB)}`);
    assert.equal(await evaluate('new URLSearchParams(document.querySelector(".page-heading .button").hash.split("?")[1]).get("mt")'), compoundB);
    await route('#/term?term=x_diagnosticsDemo');
    assert.deepEqual(await evaluate('Array.from(document.querySelector(".assertion-card").querySelectorAll(".diagnostic")).map(item => item.dataset.severity)'), ['error', 'warning', 'note']);
    assert.equal(await evaluate('document.querySelector(".assertion-card").querySelectorAll(".diagnostic-message").length'), 3);
    assert.deepEqual(await evaluate('Array.from(document.querySelector(".assertion-card").querySelectorAll(".mapping-link")).map(link => new URLSearchParams(link.hash.split("?")[1]).get("row"))'), ['instance-isa', 'instance-isa']);
    assert.ok(!(await evaluate('document.body.textContent')).includes('[object Object]'));
    assert.ok(!(await evaluate('document.body.textContent')).includes('Stale alias must not win'));
    assert.equal(await evaluate('document.querySelectorAll(".assertion-card")[1].querySelectorAll(".diagnostic-message").length'), 3);
    assert.equal(await evaluate('document.querySelectorAll(".assertion-card")[1].querySelectorAll(".mapping-link").length'), 0);
    await route(`#/assertion?id=${diagnosticAssertions[0].id}`);
    assert.equal(await evaluate('document.querySelectorAll(".diagnostic-message").length'), 3);
    assert.equal(await evaluate(`document.body.textContent.split(${JSON.stringify(diagnosticMarkers[0].message)}).length - 1`), 1);
    assert.ok(await evaluate('document.querySelector(".diagnostic-property-summary").textContent.includes("1 stored notice")'));
    assert.ok(await evaluate('document.querySelector(".diagnostic-warning .diagnostic-provenance a").textContent.startsWith("Review source")'));
    compilerDiagnostics = { notices: ['Approved doAnnounce handling'], warnings: [{ type: 'note', message: 'Approved doAnnounce handling' }, { type: 'warnings', message: 'Unexpected form' }], errors: ['A failed source remains unloaded'] };
    await route('#/sources');
    await route('#/overview');
    assert.equal(await evaluate('document.querySelector(".status-diagnostics > summary").textContent'), 'Compiler diagnostics · 1 error · 1 warning · 1 note');
    assert.equal(await evaluate('document.querySelectorAll(".status-diagnostics .diagnostic-message").length'), 3);
    compilerDiagnostics = { notices: ['Approved lists are notes, not warnings'], warnings: [], errors: [] };
    await route('#/sources');
    await route('#/overview');
    assert.equal(await evaluate('document.querySelector(".status-diagnostics > summary").textContent'), 'Compiler diagnostics · 1 note');
    await route('#/mappings?basis=guess');
    assert.ok(await evaluate('document.querySelector(".mapping-table").textContent.includes("#$isa")'));
    assert.ok(await evaluate('document.querySelector(".mapping-table").textContent.includes("Curated guess")'));
    assert.equal(await evaluate('document.querySelectorAll(".mapping-table tbody tr").length'), 400);
    await evaluate('document.querySelector(".page-actions a:last-child").click()');
    await wait('location.hash.includes("offset=400") && document.querySelectorAll(".mapping-table tbody tr").length === 4');
    await route('#/mappings?row=instance-isa');
    assert.equal(await evaluate('document.querySelectorAll(".mapping-table tbody tr").length'), 1);
    assert.ok(await evaluate('document.querySelector(".selected-mapping") !== null'));
    await route('#/settings');
    await wait('document.querySelector(".server-settings-form") !== null');
    assert.equal(await evaluate('document.querySelector(\'input[name="server_loader_start"]\').value'), '5');
    assert.equal(await evaluate('document.querySelector(\'input[name="server_inference_max"]\').value'), '10');
    assert.equal(await evaluate('document.querySelector(\'input[name="server_http_spare"]\').value'), '2');
    const configGeneration = generation;
    await evaluate('Array.from(document.querySelectorAll(".server-settings button")).find(button => button.textContent === "Use currently loaded sources").click(); document.querySelector(".server-settings-form").requestSubmit()');
    await wait('document.querySelector(".server-settings").textContent.includes("Saved for the next server start")');
    assert.equal(generation, configGeneration);
    assert.equal(serverConfig.startupConfigured, true);
    assert.deepEqual(serverConfig.startupFiles, active);
    await wait('document.querySelectorAll(".tasks-panel [data-pool]").length === 3');
    assert.ok(await evaluate('document.querySelector(\'[data-pool="loader"]\').textContent.includes("Requested tasks")'));
    assert.ok(await evaluate('document.querySelector(\'[data-pool="inference"]\').textContent.includes("Requested tasks")'));
    assert.equal(await evaluate('document.querySelector(\'input[name="pageSize"]\').value'), '400');
    assert.equal(await evaluate('document.querySelector(\'input[name="queryLimit"]\').value'), '400');
    await evaluate('document.querySelector(\'input[name="pageSize"]\').value = "0"; document.querySelector(".settings-form").requestSubmit()');
    assert.ok(await evaluate('document.querySelector(".settings-feedback[role=alert]").textContent.includes("not saved")'));
    await evaluate('document.querySelector(\'input[name="pageSize"]\').value = "125"; document.querySelector(\'input[name="queryLimit"]\').value = "350"; document.querySelector(".settings-form").requestSubmit()');
    await route('#/search');
    assert.equal(apiRequests('search').at(-1).params.limit, '125');
    await route('#/query');
    assert.equal(await evaluate('document.querySelector(\'input[name="limit"]\').value'), '350');
    await cdp('Page.reload');
    await wait('document.querySelector("textarea") !== null && document.querySelector("main").getAttribute("aria-busy") === "false"');
    assert.equal(await evaluate('document.querySelector(\'input[name="limit"]\').value'), '350');
    await route('#/sources');
    await evaluate('document.querySelector(".source-tree input:not(:disabled)").click()');
    await route('#/settings');
    const beforeReload = { generation, active: [...active] };
    await evaluate('const button = document.querySelector(".application-reload button"); button.click(); button.click()');
    await wait('document.querySelector(".reload-feedback").textContent.includes("Reloaded 1")');
    assert.equal(apiRequests('app/reload').length, 1);
    assert.deepEqual(apiRequests('app/reload')[0].body, {});
    assert.equal(generation, beforeReload.generation);
    assert.deepEqual(active, beforeReload.active);
    failCodeReload = true;
    await evaluate('document.querySelector(".application-reload button").click()');
    await wait('document.querySelector(".reload-feedback[role=alert]") !== null');
    assert.ok(await evaluate('document.querySelector(".reload-feedback").textContent.includes("cannot be rolled back")'));
    failCodeReload = false;
    await route('#/sources');
    assert.ok(await evaluate('document.querySelector(".draft-count").textContent.includes("unsaved selection")'));
    await evaluate('document.querySelector(".source-actions .secondary").click()');
    await route('#/settings');
    assert.equal(await evaluate('document.querySelector(\'input[name="pageSize"]\').value'), '125');
    assert.equal(await evaluate('document.querySelector(\'input[name="queryLimit"]\').value'), '350');
    await route('#/query');
    await wait('document.querySelectorAll(\'select[name="storedQuestion"] option\').length === 406');
    const executionsBefore = apiRequests('prolog/query').length;
    await evaluate('const select = document.querySelector(\'select[name="storedQuestion"]\'); select.value = "question-404"; select.dispatchEvent(new Event("change", { bubbles: true }))');
    assert.equal(await evaluate('document.querySelector("textarea").value'), 'member(V1, [one,two]).');
    assert.equal(apiRequests('prolog/query').length, executionsBefore);
    await evaluate('document.querySelector(\'[data-query-mode="prolog"]\').click()');
    await wait('document.querySelector(".prolog-results") !== null');
    assert.ok(await evaluate('document.querySelector(".prolog-output").textContent.includes("captured output")'));
    assert.equal(apiRequests('prolog/query').at(-1).token, 'fixture-local-token');
    assert.equal(apiRequests('prolog/query').at(-1).body.mt, compoundA);
    await evaluate('document.querySelector("textarea").value = "throw(test_exception)."; document.querySelector(\'[data-query-mode="prolog"]\').click()');
    await wait('document.querySelector(".prolog-results[role=alert]") !== null');
    assert.ok(await evaluate('document.querySelector(".prolog-results").textContent.includes("test_exception")'));
    assert.ok(await evaluate('document.querySelector(".prolog-results").textContent.includes("captured output")'));
    await route('#/microtheories');
    assert.equal(await evaluate('document.querySelectorAll(".microtheory-directory li[data-mt]").length'), allContexts.length);
    await cdp('Emulation.setDeviceMetricsOverride', { width: 390, height: 844, deviceScaleFactor: 1, mobile: true });
    await noOverflow();
    await route('#/term?term=x_compoundDemo');
    await noOverflow();
    if (process.env.LOGOS_SCREENSHOTS) {
      const image = await cdp('Page.captureScreenshot');
      await writeFile(join(here, '.browser-check-mobile.png'), Buffer.from(image.data, 'base64'));
    }
    await route(`#/microtheory?mt=${encodeURIComponent(compoundA)}`);
    await noOverflow();
    await route(`#/query?mt=${encodeURIComponent(compoundC)}`);
    await noOverflow();
    await route('#/term?term=x_diagnosticsDemo');
    await noOverflow();
    await route('#/sources');
    await noOverflow();
    while (active.length) {
      const before = active.length;
      await evaluate('document.querySelector(".loaded-files .unload-button").click()');
      await wait(`document.querySelectorAll('.loaded-files .unload-button').length === ${before - 1} && document.querySelector('main').getAttribute('aria-busy') === 'false'`);
    }
    assert.equal(await evaluate('document.querySelector(".empty-state h2").textContent'), 'No sources loaded');
    await route('#/overview');
    assert.ok(await evaluate('document.querySelector(".empty-state").textContent.includes("Choose KB Sources")'));
    assert.deepEqual(active, []);
    await route('#/microtheories');
    assert.equal(await evaluate('document.querySelectorAll(".microtheory-directory li[data-mt]").length'), 0);
    assert.ok(await evaluate('document.querySelector(".microtheory-directory").textContent.includes("No microtheories loaded")'));
    assert.deepEqual(exceptions, []);
    assert.deepEqual(requests.filter(request => !request.path.startsWith(APP_BASE)).map(request => request.path), []);
  } finally {
    if (browserSession) await browserSession.close();
    if (server) {
      server.closeAllConnections();
      await new Promise(resolve => server.close(resolve));
    }
  }
});
