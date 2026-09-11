// Display decoded semantic/API strings, never original lexical source or editor buffers.
// This is not a terminal: only complete, allowlisted SGR changes presentation.
const sources = new WeakMap();
const palette = [
  '#000000', '#800000', '#008000', '#808000', '#000080', '#800080', '#008080', '#c0c0c0',
  '#808080', '#ff0000', '#00ff00', '#ffff00', '#0000ff', '#ff00ff', '#00ffff', '#ffffff',
];
const styleKeys = ['fontWeight', 'fontStyle', 'textDecorationLine', 'color', 'backgroundColor'];
const isByte = value => Number.isInteger(value) && value >= 0 && value <= 255;
const isControl = code => code < 32 || (code >= 127 && code <= 159)
  || code === 0x061c || code === 0x200e || code === 0x200f
  || (code >= 0x202a && code <= 0x202e) || (code >= 0x2066 && code <= 0x2069);

function indexedColor(index) {
  if (index < 16) return palette[index];
  if (index >= 232) {
    const gray = 8 + (index - 232) * 10;
    return `rgb(${gray}, ${gray}, ${gray})`;
  }
  const levels = [0, 95, 135, 175, 215, 255];
  const cube = index - 16;
  return `rgb(${levels[Math.floor(cube / 36)]}, ${levels[Math.floor(cube / 6) % 6]}, ${levels[cube % 6]})`;
}

function colorValue(mode, values) {
  if (mode === 5 && values.length === 1 && isByte(values[0])) return indexedColor(values[0]);
  if (mode === 2 && values.length === 3 && values.every(isByte)) return `rgb(${values.join(', ')})`;
  return null;
}

function numeric(value) {
  return /^\d+$/u.test(value) ? Number(value) : NaN;
}

function sgr(parameters, previous) {
  if (!/^[\d;:]*$/u.test(parameters)) return null;
  const fields = parameters.split(';');
  let style = { ...previous };
  for (let index = 0; index < fields.length; index++) {
    const field = fields[index];
    if (field.includes(':')) {
      const parts = field.split(':');
      const code = numeric(parts.shift()), mode = numeric(parts.shift());
      if (code !== 38 && code !== 48) return null;
      // ISO colon form optionally carries an empty/default colour-space identifier.
      if (mode === 2 && parts.length === 4) {
        if (parts[0] !== '' && parts[0] !== '0') return null;
        parts.shift();
      }
      const color = colorValue(mode, parts.map(numeric));
      if (color === null) return null;
      style[code === 38 ? 'color' : 'backgroundColor'] = color;
      continue;
    }
    const code = field === '' ? 0 : numeric(field);
    if (code === 0) style = {};
    else if (code === 1) style.fontWeight = 'bold';
    else if (code === 3) style.fontStyle = 'italic';
    else if (code === 4) style.textDecorationLine = 'underline';
    else if (code === 22) delete style.fontWeight;
    else if (code === 23) delete style.fontStyle;
    else if (code === 24) delete style.textDecorationLine;
    else if (code === 39) delete style.color;
    else if (code === 49) delete style.backgroundColor;
    else if (code >= 30 && code <= 37) style.color = palette[code - 30];
    else if (code >= 90 && code <= 97) style.color = palette[code - 90 + 8];
    else if (code >= 40 && code <= 47) style.backgroundColor = palette[code - 40];
    else if (code >= 100 && code <= 107) style.backgroundColor = palette[code - 100 + 8];
    else if (code === 38 || code === 48) {
      const mode = numeric(fields[++index] ?? '');
      const count = mode === 5 ? 1 : mode === 2 ? 3 : 0;
      if (!count || index + count >= fields.length) return null;
      const values = fields.slice(index + 1, index + count + 1).map(numeric);
      const color = colorValue(mode, values);
      if (color === null) return null;
      style[code === 38 ? 'color' : 'backgroundColor'] = color;
      index += count;
    } else return null;
  }
  return style;
}

function notation(raw) {
  const parts = [];
  let start = 0;
  for (let index = 0; index < raw.length; index++) {
    const code = raw.charCodeAt(index);
    if (!isControl(code) || code === 9 || code === 10) continue;
    if (index > start) parts.push(raw.slice(start, index));
    if (code === 13 && raw[index + 1] === '\n') {
      parts.push('\n'); start = ++index + 1;
      continue;
    }
    parts.push(code === 13 ? '\\r' : code === 8 ? '\\b'
      : `\\u${code.toString(16).padStart(4, '0')}`);
    start = index + 1;
  }
  if (start < raw.length) parts.push(raw.slice(start));
  return parts.join('');
}

function controlString(raw, contentStart, kind) {
  for (let index = contentStart; index < raw.length; index++) {
    const code = raw.charCodeAt(index);
    if (code === 0x9c || (kind === 'OSC' && code === 7)) return { end: index + 1, description: `${kind} control string` };
    if (code === 27 && raw[index + 1] === '\\') return { end: index + 2, description: `${kind} control string` };
  }
  return { end: raw.length, description: `Truncated ${kind} control string` };
}

function escapeSequence(raw, start) {
  const escaped = raw.charCodeAt(start) === 27;
  const introducer = escaped ? raw[start + 1] : raw[start];
  const contentStart = start + (escaped ? 2 : 1);
  if (introducer === '[' || introducer === '\u009b') {
    for (let index = contentStart; index < raw.length; index++) {
      const code = raw.charCodeAt(index);
      if (code >= 0x40 && code <= 0x7e) {
        return { end: index + 1, description: 'Unsupported or invalid CSI sequence',
          ...(raw[index] === 'm' ? { parameters: raw.slice(contentStart, index) } : {}) };
      }
      if (code < 0x20 || code > 0x3f) return { end: index, description: 'Truncated or invalid CSI sequence' };
    }
    return { end: raw.length, description: 'Truncated CSI sequence' };
  }
  const kind = { ']': 'OSC', '\u009d': 'OSC', P: 'DCS', '\u0090': 'DCS',
    X: 'SOS', '\u0098': 'SOS', '^': 'PM', '\u009e': 'PM', _: 'APC', '\u009f': 'APC' }[introducer];
  if (kind) return controlString(raw, contentStart, kind);
  if (!escaped) return { end: start + 1, description: 'Control character' };
  let index = start + 1;
  while (index < raw.length && raw.charCodeAt(index) >= 0x20 && raw.charCodeAt(index) <= 0x2f) index++;
  if (index < raw.length && raw.charCodeAt(index) >= 0x30 && raw.charCodeAt(index) <= 0x7e) {
    return { end: index + 1, description: 'Unsupported escape sequence' };
  }
  return { end: index, description: 'Truncated escape sequence' };
}

/**
 * Lossless backing input plus grouped display runs. CRLF is displayed as LF.
 * Invalid/unsupported SGR is atomic: the entire sequence stays visible and
 * leaves styles unchanged. There is no truncation, escape decoding, or I/O.
 */
export function decodedTextRuns(value) {
  const raw = String(value ?? '');
  const runs = [];
  let style = {}, styleKey = styleKeys.map(() => '').join('|'), pending, index = 0;
  const flush = () => {
    if (pending) {
      const { pieces, key: _key, ...run } = pending;
      runs.push({ ...run, text: pieces.join('') });
      pending = undefined;
    }
  };
  const append = (text, kind = 'text', description) => {
    if (!text) return;
    const key = kind === 'control' ? `control:${description}` : `text:${styleKey}`;
    if (pending?.key !== key) {
      flush();
      pending = { key, kind, style: kind === 'control' ? {} : { ...style },
        ...(description ? { description } : {}), pieces: [] };
    }
    pending.pieces.push(text);
  };
  while (index < raw.length) {
    const start = index;
    const code = raw.charCodeAt(index);
    if (code === 13 && raw[index + 1] === '\n') {
      append('\n'); index += 2;
    } else if (code === 27 || [0x90, 0x98, 0x9b, 0x9d, 0x9e, 0x9f].includes(code)) {
      const sequence = escapeSequence(raw, index);
      index = sequence.end;
      const nextStyle = sequence.parameters === undefined ? null : sgr(sequence.parameters, style);
      if (nextStyle === null) append(notation(raw.slice(start, index)), 'control', sequence.description);
      else {
        style = nextStyle;
        styleKey = styleKeys.map(key => style[key] ?? '').join('|');
      }
    } else if (isControl(code) && code !== 9 && code !== 10) {
      append(notation(raw[index++]), 'control', 'Control character');
    } else {
      do { index++; } while (index < raw.length
        && (!isControl(raw.charCodeAt(index)) || raw[index] === '\n' || raw[index] === '\t'));
      append(raw.slice(start, index));
    }
  }
  flush();
  return { raw, runs };
}

/** Exact original input, including SGR/control codepoints and CRLF, for explicit copy/raw views. */
export function decodedTextSource(element) {
  return sources.get(element);
}

/** Safe self-contained display node; every invocation starts with reset ANSI state. */
export function renderDecodedText(value, { document: doc = globalThis.document } = {}) {
  const parsed = decodedTextRuns(value);
  const element = doc.createElement('span');
  element.className = 'decoded-text';
  sources.set(element, parsed.raw);
  element.style.whiteSpace = 'pre-wrap';
  element.style.whiteSpace = 'break-spaces';
  element.style.overflowWrap = 'anywhere';
  element.style.wordBreak = 'normal';
  element.style.tabSize = '2';
  element.style.fontFamily = 'ui-monospace, "Cascadia Code", "Cascadia Mono", Consolas, monospace';
  element.style.fontWeight = 'normal';
  element.style.fontStyle = 'normal';
  element.style.textDecorationLine = 'none';
  element.style.minWidth = '0';
  element.style.maxWidth = '100%';
  element.style.unicodeBidi = 'isolate';
  for (const run of parsed.runs) {
    if (run.kind === 'text' && !Object.keys(run.style).length) {
      element.append(doc.createTextNode(run.text));
      continue;
    }
    const span = doc.createElement('span');
    span.className = run.kind === 'control' ? 'decoded-control' : 'decoded-sgr';
    if (run.kind === 'control') {
      const explanation = `${run.description}; visible escape notation, not executed: ${run.text}`;
      span.title = explanation;
      span.setAttribute('role', 'img');
      span.setAttribute('aria-label', explanation);
      span.style.color = 'var(--muted, #536277)';
      span.style.backgroundColor = 'var(--surface, #fff)';
      span.style.border = '1px dashed currentColor';
      span.style.borderRadius = '2px';
    } else {
      for (const key of styleKeys) if (run.style[key]) span.style[key] = run.style[key];
    }
    span.append(doc.createTextNode(run.text));
    element.append(span);
  }
  return element;
}
