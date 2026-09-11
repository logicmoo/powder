import test from 'node:test';
import assert from 'node:assert/strict';
import { readFile } from 'node:fs/promises';
import { decodedTextRuns, decodedTextSource, renderDecodedText } from '../web/decoded-text.js';
import { expressionText, expressionTokens, renderExpression } from '../web/render.js';
import { launchChromium } from './chromium.mjs';

const ESC = '\u001b';
const visible = parsed => parsed.runs.map(run => run.text).join('');
const textRuns = value => decodedTextRuns(value).runs.filter(run => run.kind === 'text');
const walk = node => [node, ...(node.children ?? []).flatMap(walk)];
class FakeNode {
  constructor(tag) { this.tag = tag; this.children = []; this.style = {}; this.attributes = {}; this.ownText = ''; }
  append(...nodes) { this.children.push(...nodes); }
  setAttribute(key, value) { this.attributes[key] = value; }
  get textContent() { return this.ownText + this.children.map(node => node.textContent).join(''); }
  set textContent(value) { this.ownText = value; this.children = []; }
  set innerHTML(_value) { throw new Error('HTML injection attempted'); }
}
const document = {
  createElement: tag => new FakeNode(tag),
  createTextNode: value => ({ tag: '#text', textContent: value }),
};

test('actual LF, tabs, leading/repeated/trailing spaces remain exact; literal escapes are not decoded', () => {
  const raw = '  one\t  two  \n    three\tfour  \n\\n\\t\\r\\u001b[31m';
  const parsed = decodedTextRuns(raw);
  assert.equal(parsed.raw, raw);
  assert.equal(visible(parsed), raw);
  assert.equal(parsed.runs.length, 1);
  const node = renderDecodedText(raw, { document });
  assert.equal(node.textContent, raw);
  assert.equal(decodedTextSource(node), raw);
  assert.equal(node.style.whiteSpace, 'break-spaces');
  assert.equal(node.style.overflowWrap, 'anywhere');
  assert.equal(node.style.tabSize, '2');
});

test('CRLF displays ordinary newline; standalone CR and backspace are visible without rewriting', () => {
  const raw = '  before\r\n\tafter\rX\bY';
  const parsed = decodedTextRuns(raw);
  assert.equal(parsed.raw, raw);
  assert.equal(visible(parsed), '  before\n\tafter\\rX\\bY');
  assert.equal(decodedTextSource(renderDecodedText(raw, { document })), raw);
  assert.deepEqual(parsed.runs.filter(run => run.kind === 'control').map(run => run.text), ['\\r', '\\b']);
});

test('allowlisted SGR toggles bold, italic, underline and foreground/background independently', () => {
  const runs = textRuns(`${ESC}[1;3;4;31;44mA${ESC}[22mB${ESC}[23;24;39;49mC`);
  assert.deepEqual(runs.map(run => run.style), [
    { fontWeight: 'bold', fontStyle: 'italic', textDecorationLine: 'underline', color: '#800000', backgroundColor: '#000080' },
    { fontStyle: 'italic', textDecorationLine: 'underline', color: '#800000', backgroundColor: '#000080' },
    {},
  ]);
  assert.equal(runs.map(run => run.text).join(''), 'ABC');
});

test('reset and empty/default SGR parameters reset all styles, without splitting unchanged runs', () => {
  for (const reset of ['0', '', ';', '0;0']) {
    assert.deepEqual(textRuns(`${ESC}[1;32mstyled${ESC}[${reset}mplain`).map(run => run.style),
      [{ fontWeight: 'bold', color: '#008000' }, {}]);
  }
  assert.deepEqual(textRuns(`A${ESC}[0mB${ESC}[mC`).map(run => run.text), ['ABC']);
  assert.deepEqual(textRuns(`${ESC}[1;;31mA`)[0].style, { color: '#800000' });
});

test('common and bright ANSI colours are allowlisted fixed values', () => {
  for (let code = 30; code <= 37; code++) {
    const [run] = textRuns(`${ESC}[${code};${code + 10}mX`);
    assert.match(run.style.color, /^#[\da-f]{6}$/u);
    assert.equal(run.style.backgroundColor, run.style.color);
  }
  for (let code = 90; code <= 97; code++) {
    const [run] = textRuns(`${ESC}[${code};${code + 10}mX`);
    assert.match(run.style.color, /^#[\da-f]{6}$/u);
    assert.equal(run.style.backgroundColor, run.style.color);
  }
});

test('indexed colours cover base palette, colour cube and grayscale endpoints', () => {
  for (const [index, color] of [[0, '#000000'], [15, '#ffffff'], [16, 'rgb(0, 0, 0)'],
    [21, 'rgb(0, 0, 255)'], [231, 'rgb(255, 255, 255)'], [232, 'rgb(8, 8, 8)'], [255, 'rgb(238, 238, 238)']]) {
    assert.deepEqual(textRuns(`${ESC}[38;5;${index};48;5;${index}mX`)[0].style,
      { color, backgroundColor: color });
  }
});

test('24-bit and colon colour forms accept only complete bounded components', () => {
  for (const parameters of ['38;2;0;127;255', '38:2:0:127:255', '38:2::0:127:255', '38:2:0:0:127:255']) {
    assert.deepEqual(textRuns(`${ESC}[${parameters}mX`)[0].style, { color: 'rgb(0, 127, 255)' });
  }
  assert.deepEqual(textRuns(`${ESC}[48;2;255;0;1mX`)[0].style, { backgroundColor: 'rgb(255, 0, 1)' });
  assert.deepEqual(textRuns(`${ESC}[38:5:15;48:5:16mX`)[0].style,
    { color: '#ffffff', backgroundColor: 'rgb(0, 0, 0)' });
  for (const parameters of ['38;5;256', '48;5;-1', '38;2;256;0;1', '38;2;0;1',
    '38;2;;1;2', '38;2;NaN;0;1', '38:2:1:0:0:0', '38:2::0:0:256',
    '38:5:', '38:5:0:1', '38;2;1.5;0;0', `38;2;${'9'.repeat(1000)};0;0`]) {
    const parsed = decodedTextRuns(`${ESC}[${parameters}mX`);
    assert.ok(parsed.runs.some(run => run.kind === 'control'), parameters);
    assert.ok(parsed.runs.every(run => !Object.keys(run.style).length), parameters);
  }
});

test('unsupported SGR remains visible atomically and cannot apply even its supported prefix', () => {
  const parsed = decodedTextRuns(`${ESC}[31mA${ESC}[0;1;999mB${ESC}[3;5mC${ESC}[0mD`);
  assert.equal(visible(parsed), 'A\\u001b[0;1;999mB\\u001b[3;5mCD');
  assert.deepEqual(parsed.runs.filter(run => run.kind === 'text').map(run => run.style),
    [{ color: '#800000' }, { color: '#800000' }, { color: '#800000' }, {}]);
  for (const code of [2, 5, 7, 8, 9, 21, 51, 53, 58]) {
    assert.equal(visible(decodedTextRuns(`${ESC}[${code}mX`)), `\\u001b[${code}mX`);
  }
});

test('each string and each invocation starts reset, including strings in bindings and expressions', () => {
  const first = renderDecodedText(`${ESC}[1;31mred`, { document });
  const second = renderDecodedText('ordinary', { document });
  assert.ok(walk(first).some(node => node.style?.color === '#800000'));
  assert.ok(!walk(second).some(node => node.style?.color || node.style?.fontWeight === 'bold'));
  const expression = { type: 'application', head: { type: 'symbol', value: 'x_p' },
    args: [{ type: 'string', value: `${ESC}[1mone` }, { type: 'string', value: 'two' }] };
  const strings = walk(renderExpression(expression, { document })).filter(node => node.className === 'decoded-text');
  assert.ok(walk(strings[0]).some(node => node.style?.fontWeight === 'bold'));
  assert.ok(!walk(strings[1]).some(node => node.style?.fontWeight === 'bold'));
  assert.deepEqual(decodedTextRuns('ordinary').runs[0].style, {});
});

test('cursor movement, erase, BEL, C0/C1, standalone CR and bidi overrides remain visibly inert', () => {
  const raw = `A${ESC}[2JB${ESC}[1;1HC\u0007D\rE\bF\u0000G\u009cH\u202eI`;
  const parsed = decodedTextRuns(raw);
  assert.equal(visible(parsed), 'A\\u001b[2JB\\u001b[1;1HC\\u0007D\\rE\\bF\\u0000G\\u009cH\\u202eI');
  assert.equal(parsed.raw, raw);
  assert.ok(parsed.runs.every(run => !Object.keys(run.style).length));
});

test('truncated CSI/escapes are visible and do not consume a following ordinary newline or SGR', () => {
  for (const raw of [ESC, `${ESC}[`, `${ESC}[38;2;255;`, `${ESC}(`]) {
    assert.equal(visible(decodedTextRuns(raw)), raw.replace(ESC, '\\u001b'));
  }
  assert.equal(visible(decodedTextRuns(`${ESC}[31\nnext`)), '\\u001b[31\nnext');
  const parsed = decodedTextRuns(`${ESC}[31${ESC}[1mnext`);
  assert.equal(visible(parsed), '\\u001b[31next');
  assert.deepEqual(parsed.runs.at(-1).style, { fontWeight: 'bold' });
});

test('OSC hyperlinks, clipboard/title commands and DCS payloads never execute embedded styles', () => {
  for (const raw of [`${ESC}]8;;https://evil.invalid/${ESC}\\label${ESC}]8;;${ESC}\\`,
    `${ESC}]52;c;Y2xpcGJvYXJk\u0007`, `${ESC}]0;title\u0007`,
    `${ESC}Ppayload${ESC}[31mred${ESC}\\`, `${ESC}_remote-image${ESC}\\`,
    `${ESC}]8;;https://evil.invalid/unterminated`, `${ESC}Punterminated`,
    `${ESC}]0;line\n\t${ESC}[31mstill opaque`]) {
    const parsed = decodedTextRuns(raw);
    assert.equal(parsed.raw, raw);
    assert.ok(parsed.runs.some(run => run.kind === 'control'));
    assert.ok(parsed.runs.every(run => !Object.keys(run.style).length));
    assert.ok(!/[\u0000-\u0008\u000b-\u001f\u007f-\u009f]/u.test(visible(parsed)));
    assert.ok(!walk(renderDecodedText(raw, { document })).some(node => node.tag === 'a' || node.href));
  }
});

test('even opaque unsupported control payloads keep actual tabs and newlines in their visible notation', () => {
  const raw = `${ESC}]0;  title\tcolumn\r\n next\n${ESC}[31mnot a nested style${ESC}\\`;
  const parsed = decodedTextRuns(raw);
  assert.equal(parsed.raw, raw);
  assert.equal(visible(parsed), '\\u001b]0;  title\tcolumn\n next\n\\u001b[31mnot a nested style\\u001b\\');
  assert.equal(parsed.runs.length, 1);
  assert.equal(parsed.runs[0].kind, 'control');
  assert.deepEqual(parsed.runs[0].style, {});
});

test('8-bit CSI supports the same SGR allowlist and 8-bit OSC/DCS remain inert', () => {
  assert.deepEqual(textRuns('\u009b1;31mA\u009bmB').map(run => run.style),
    [{ fontWeight: 'bold', color: '#800000' }, {}]);
  assert.equal(visible(decodedTextRuns('\u009d0;title\u009c')), '\\u009d0;title\\u009c');
  assert.equal(visible(decodedTextRuns('\u0090\u009b31mtext\u009c')), '\\u0090\\u009b31mtext\\u009c');
});

test('visible escape notation is styled and accessible, unlike identical original literal text', () => {
  const raw = `\\u001b[2J${ESC}[2J`;
  const root = renderDecodedText(raw, { document });
  assert.equal(root.children[0].tag, '#text');
  const control = root.children[1];
  assert.equal(control.className, 'decoded-control');
  assert.equal(control.attributes.role, 'img');
  assert.match(control.attributes['aria-label'], /visible escape notation, not executed/u);
  assert.match(control.title, /CSI/u);
  assert.equal(control.style.border, '1px dashed currentColor');
  assert.equal(decodedTextSource(root), raw);
});

test('hostile HTML/CSS and remote OSC URLs create only inert spans/text; copy backing stays exact', async () => {
  const raw = `</span><img src="https://evil.invalid/pixel" onerror="alert(1)">`
    + `${ESC}[38;2;0;0;0m;background:url(https://evil.invalid/a)${ESC}]8;;javascript:alert(1)\u0007`;
  const root = renderDecodedText(raw, { document });
  assert.deepEqual([...new Set(walk(root).map(node => node.tag))].sort(), ['#text', 'span']);
  const allowed = new Set(['whiteSpace', 'overflowWrap', 'wordBreak', 'tabSize', 'fontFamily', 'fontWeight',
    'fontStyle', 'textDecorationLine', 'minWidth', 'maxWidth', 'unicodeBidi', 'color',
    'backgroundColor', 'border', 'borderRadius']);
  for (const node of walk(root)) {
    assert.ok(!node.href && !node.src && !node.onclick);
    for (const [key, value] of Object.entries(node.style ?? {})) {
      assert.ok(allowed.has(key), key);
      assert.ok(!value.includes('url('));
    }
  }
  assert.equal(decodedTextSource(root), raw);
  const source = await readFile(new URL('../web/decoded-text.js', import.meta.url), 'utf8');
  assert.doesNotMatch(source, /innerHTML|outerHTML|insertAdjacentHTML|\bfetch\s*\(|\beval\s*\(|\bFunction\s*\(/u);
});

test('large text, redundant styles and consecutive controls group into runs, not per-character DOM', () => {
  const raw = '  value\t  next\n'.repeat(50000);
  assert.equal(decodedTextRuns(raw).runs.length, 1);
  const root = renderDecodedText(raw, { document });
  assert.equal(root.children.length, 1);
  assert.equal(root.textContent, raw);
  const controls = renderDecodedText('\u0007'.repeat(30000), { document });
  assert.equal(controls.children.length, 1);
  assert.equal(controls.children[0].textContent.length, 6 * 30000);
  const repeated = decodedTextRuns(`${ESC}[31mword`.repeat(20000));
  assert.equal(repeated.runs.length, 1);
  assert.equal(repeated.runs[0].text, 'word'.repeat(20000));
  const truncated = `${ESC}]${'payload'.repeat(50000)}`;
  assert.equal(decodedTextRuns(truncated).runs.length, 1);
  assert.equal(decodedTextSource(renderDecodedText(truncated, { document })), truncated);
});

test('semantic string DOM is decoded while token text, expression serialization and source input are unchanged', () => {
  const value = `  a\tb\r\n"quoted" \\n ${ESC}[31mred${ESC}[0m`;
  const expression = { type: 'application', head: { type: 'symbol', value: 'x_comment' },
    args: [{ type: 'symbol', value: 'x_Thing' }, { type: 'string', value }] };
  const before = JSON.stringify(expression);
  const serialized = `(comment Thing ${JSON.stringify(value)})`;
  assert.equal(expressionText(expression), serialized);
  const token = expressionTokens(expression).find(item => item.kind === 'string');
  assert.equal(token.raw, value);
  assert.equal(token.text, JSON.stringify(value));
  const root = renderExpression(expression, { document });
  assert.equal(root.textContent, '(comment Thing "  a\tb\n"quoted" \\n red")');
  assert.equal(expressionText(expression), serialized);
  assert.equal(JSON.stringify(expression), before);
  assert.equal(decodedTextSource(walk(root).find(node => node.className === 'decoded-text')), value);
  const lexicalSource = '(comment Thing "literal\\\\n and escaped\\n and \\\\u001b[31m")';
  const sourceNode = document.createElement('code');
  sourceNode.textContent = lexicalSource;
  assert.equal(sourceNode.textContent, lexicalSource);
  assert.equal(decodedTextSource(sourceNode), undefined);
});

test('isolated Chromium confirms whitespace alignment, overflow, style isolation and inert remote content',
  { skip: !process.env.LOGOS_CHROME, timeout: 45000 }, async () => {
    const browser = await launchChromium(process.env.LOGOS_CHROME);
    try {
      const source = await readFile(new URL('../web/decoded-text.js', import.meta.url), 'utf8');
      const moduleURL = `data:text/javascript;base64,${Buffer.from(source).toString('base64')}`;
      const result = await browser.evaluate(`(async () => {
        const {renderDecodedText, decodedTextSource} = await import(${JSON.stringify(moduleURL)});
        let fetches = 0; window.fetch = () => { fetches++; throw Error('Unexpected fetch'); };
        document.body.style.margin = '0';
        const host = document.createElement('div'); host.style.width = '320px'; document.body.append(host);
        const raw = '  A\\tB  \\n  C\\tD  \\r\\n  E  ';
        const display = renderDecodedText(raw); host.append(display);
        const start = index => { const range = document.createRange();
          range.setStart(display.firstChild, index); range.setEnd(display.firstChild, index + 1);
          return range.getBoundingClientRect().x; };
        const aligned = start(4) === start(12);
        const red = renderDecodedText('\\u001b[1;38;2;255;0;1mred');
        const ordinary = renderDecodedText('ordinary');
        host.append(document.createElement('br'), red, ordinary);
        const malicious = renderDecodedText('\\u001b]8;;https://evil.invalid/\\u001b\\\\<img src=https://evil.invalid/x>\\u0007'
          + 'W'.repeat(300));
        host.append(document.createElement('br'), malicious);
        const control = malicious.querySelector('.decoded-control');
        return {raw: decodedTextSource(display), text: display.textContent, aligned,
          whiteSpace: getComputedStyle(display).whiteSpace, tabSize: getComputedStyle(display).tabSize,
          red: getComputedStyle(red.firstChild).color, bold: getComputedStyle(red.firstChild).fontWeight,
          plain: getComputedStyle(ordinary).fontWeight,
          width: host.scrollWidth, available: 320,
          markup: malicious.querySelectorAll('a,img,script,iframe,link').length,
          accessible: control.getAttribute('aria-label'), fetches,
          resources: performance.getEntriesByType('resource').filter(entry => /^https?:/.test(entry.name)).length};
      })()`);
      assert.equal(result.raw, '  A\tB  \n  C\tD  \r\n  E  ');
      assert.equal(result.text, '  A\tB  \n  C\tD  \n  E  ');
      assert.equal(result.aligned, true);
      assert.equal(result.whiteSpace, 'break-spaces');
      assert.equal(result.tabSize, '2');
      assert.equal(result.red, 'rgb(255, 0, 1)');
      assert.equal(result.bold, '700');
      assert.equal(result.plain, '400');
      assert.ok(result.width <= result.available, JSON.stringify(result));
      assert.equal(result.markup, 0);
      assert.match(result.accessible, /visible escape notation/u);
      assert.equal(result.fetches, 0);
      assert.equal(result.resources, 0);
      assert.deepEqual(browser.exceptions, []);
    } finally { await browser.close(); }
  });
