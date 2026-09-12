// Isolated, read-only UI fixture. This never contacts the knowledge server.
import http from 'node:http';
import { readFile } from 'node:fs/promises';
import { fileURLToPath } from 'node:url';
import path from 'node:path';

const web = fileURLToPath(new URL('../web/', import.meta.url));
const html = `<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Dependency Resolution fixture</title><link rel="stylesheet" href="/style.css"></head>
<body><main id="preview"></main><footer>Isolated test fixture. No knowledge server is contacted.</footer>
<script type="module">
import { dependencyResolutionPage, dependencyCheckLabels } from '/dependency-resolution.js';
const requests = window.previewRequests = [];
const el = (tag, attrs = {}, ...children) => {
  const node = document.createElement(tag);
  for (const [key, value] of Object.entries(attrs)) {
    if (value == null) continue;
    if (key.startsWith('on')) node.addEventListener(key.slice(2), value);
    else if (key in node) node[key] = value;
    else node.setAttribute(key, String(value));
  }
  for (const child of children.flat(Infinity)) if (child != null && child !== false) {
    node.append(child instanceof Node ? child : document.createTextNode(String(child)));
  }
  return node;
};
const symbol = value => ({ type: 'symbol', value });
const context = { type: 'application', head: symbol('x_MtFn'), args: [symbol('x_LongContextArgument')], natKey: 'nat:x_MtFn(x_LongContextArgument)', denotesNat: true };
const mt = 'mt:x_MtFn(x_LongContextArgument)';
const row = n => ({ term: 'x_ExampleFn' + n, expression: symbol('x_ExampleFn' + n),
  mt, mtExpression: context, kind: n % 2 ? 'function_result_isa' : 'definition',
  status: n % 2 ? 'indeterminate' : 'loaded_available', severity: n % 2 ? 'warning' : 'info', disposition: 'active',
  scope: n % 2 ? 'unresolved' : 'loaded', why: n % 2 ? 'no_evidence_in_bounded_analysis' : 'positive_visible_evidence',
  evidence: n % 2 ? [] : [{ id: 'a' + n, source: 'KBs/fixture.krf', originalSource: 'KBs/original-fixture.krf',
    line: 12, mt, mtExpression: context, loaded: true, kind: 'static_rule_head', polarity: 'negative', support: [] }],
  evidenceCount: n % 2 ? 0 : 1, evidenceTruncated: false, types: [] });
const report = { scope: { generation: 7, catalogRevision: 'a'.repeat(64), taxonomyRevision: 'b'.repeat(64),
  mt, selection: { more: true, nextOffset: 10 } }, terms: 10, total: 60, items: Array.from({ length: 60 }, (_, n) => row(n)) };
let state = 'succeeded';
const env = {
  element: el,
  button: (label, action, className = 'button') => el('button', { type: 'button', className, onclick: action }, label),
  link: (label, route, params = {}) => el('a', { href: '#/' + route + '?' + new URLSearchParams(params) }, label),
  heading: (title, text) => el('header', { className: 'page-heading' }, el('div', {}, el('h1', {}, title), el('p', { className: 'lead' }, text))),
  errorPanel: error => el('div', { className: 'error-panel', role: 'alert' }, error.message),
  sourceLink: (source, line) => el('a', { href: '#/source?' + new URLSearchParams({ path: source, line }) }, source + ':' + line),
  mtLink: (key) => el('a', { href: '#/microtheory?' + new URLSearchParams({ mt: key }) }, '(MtFn LongContextArgument)'),
  rememberRoute: values => { window.previewRoute = values; },
  api: async (endpoint, params = {}, options = {}) => {
    requests.push({ endpoint, params, options });
    if (window.previewFailNext) { window.previewFailNext = false; throw new Error('Fixture request failed'); }
    if (endpoint.endsWith('capabilities')) return { defaultPolicy: { rules: Object.keys(dependencyCheckLabels).map(kind => ({
      kind, enabled: true, severity: kind === 'comment' ? 'info' : 'warning', ignoreTerms: [], ignoreMts: [], exemptTypes: [], patterns: [],
    })) } };
    if (endpoint.endsWith('cancel')) { state = 'cancelled'; return { state }; }
    if (endpoint.endsWith('reports')) state = window.previewKeepRunning ? 'running' : 'succeeded';
    let items = report.items;
    for (const key of ['kind', 'severity', 'scope', 'disposition']) if (params[key] && params[key] !== 'all') items = items.filter(row => row[key] === params[key]);
    return { job: { id: 'fixture-report', state, completedTerms: 10 },
      report: { ...report, total: items.length, items: items.slice(params.offset ?? 0, (params.offset ?? 0) + (params.limit ?? 25)) } };
  },
};
const controller = new AbortController();
window.previewStop = () => controller.abort();
document.getElementById('preview').append(await dependencyResolutionPage(env, { params: new URLSearchParams({ mt, report: 'fixture-report' }) }, controller.signal));
window.previewReady = true;
</script></body></html>`;

const server = http.createServer(async (request, response) => {
  try {
    const pathname = new URL(request.url, 'http://localhost').pathname;
    if (pathname === '/') {
      response.writeHead(200, { 'content-type': 'text/html; charset=utf-8', 'cache-control': 'no-store' });
      response.end(html); return;
    }
    if (!/^\/[a-z-]+\.(?:js|css)$/u.test(pathname)) { response.writeHead(404); response.end(); return; }
    const data = await readFile(path.join(web, pathname.slice(1)));
    response.writeHead(200, { 'content-type': pathname.endsWith('.css') ? 'text/css; charset=utf-8' : 'text/javascript; charset=utf-8',
      'cache-control': 'no-store' }); response.end(data);
  } catch { response.writeHead(404); response.end(); }
});
server.listen(0, '127.0.0.1', () => console.log(JSON.stringify({ url: `http://127.0.0.1:${server.address().port}/`, pid: process.pid })));
process.on('SIGTERM', () => server.close());
