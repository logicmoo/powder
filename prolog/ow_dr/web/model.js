export const PAGE_SIZE = 50;

export function normalizeContextInput(value) {
  const input = String(value ?? '').trim();
  if (!input || input.startsWith('mt:') || input.startsWith('x_') || input.startsWith('(')) return input;
  return `x_${input}`;
}

export function contextRequestValue(initial, currentText, edited = false) {
  return !edited && currentText === initial.display ? initial.key : normalizeContextInput(currentText);
}

export function canonicalPath(path) {
  if (typeof path !== 'string') return null;
  const normalized = path.replaceAll('\\', '/');
  const segments = normalized.split('/');
  if (segments[0] !== 'KBs' || segments.some(part => !part || part === '.' || part === '..' || /[:\0]/u.test(part))) return null;
  return normalized;
}

export function supportedSource(path) {
  return Boolean(canonicalPath(path) && /\.(kif|krf|metta)$/iu.test(path));
}

export function positiveInteger(value, fallback, maximum = Number.MAX_SAFE_INTEGER, minimum = 0) {
  if (value === null || value === undefined || value === '') return fallback;
  const number = Number(value);
  return Number.isSafeInteger(number) && number >= minimum ? Math.min(maximum, number) : fallback;
}

export function parseRoute(hash = '') {
  const raw = hash.replace(/^#\/?/u, '');
  const separator = raw.indexOf('?');
  const name = (separator < 0 ? raw : raw.slice(0, separator)) || 'overview';
  const params = new URLSearchParams(separator < 0 ? '' : raw.slice(separator + 1));
  return {
    name, params,
    offset: positiveInteger(params.get('offset'), 0),
    limit: positiveInteger(params.get('limit'), PAGE_SIZE, 100, 1),
  };
}

export function pageRange(total, offset, limit) {
  const safeTotal = positiveInteger(total, 0);
  return {
    start: safeTotal && offset < safeTotal ? offset + 1 : 0,
    end: offset < safeTotal ? Math.min(safeTotal, offset + limit) : 0,
    previous: Math.max(0, offset - limit),
    next: offset + limit,
    hasPrevious: offset > 0,
    hasNext: offset + limit < safeTotal,
  };
}

export function fileMeasure(file, format = value => new Intl.NumberFormat().format(value)) {
  if (Number.isInteger(file.lineCount) && file.lineCount >= 0) return `${format(file.lineCount)} lines`;
  if (Number.isFinite(file.sizeBytes) && file.sizeBytes >= 0) {
    return `${format(Math.round(file.sizeBytes / 1024 * 10) / 10)} KB`;
  }
  return 'Size unavailable';
}

// Directory counts are maintained in the model; the DOM is never scanned for descendants.
export class SourceSelection {
  constructor(nodes, active = [], generation = 0) {
    this.records = new Map();
    this.roots = [];
    this.files = [];
    this.selected = new Set();
    this.generation = generation;
    const build = (node, parent) => {
      const path = canonicalPath(node.path);
      if (!path || this.records.has(path)) return null;
      if (parent && !path.startsWith(`${parent}/`)) return null;
      if (node.type !== 'directory' && (node.type !== 'file' || !supportedSource(path))) return null;
      const record = { ...node, path, parent, children: [], total: 0, selected: 0 };
      this.records.set(path, record);
      if (node.type === 'directory') {
        for (const child of node.children ?? []) {
          const built = build(child, path);
          if (built) {
            record.children.push(built.path);
            record.total += built.total;
          }
        }
      } else {
        record.total = 1;
        this.files.push(path);
      }
      return record;
    };
    for (const node of nodes ?? []) {
      const record = build(node, null);
      if (record) this.roots.push(record.path);
    }
    this.reset(active, generation);
  }

  reset(active, generation = this.generation) {
    this.generation = generation;
    this.active = new Set(active.map(canonicalPath).filter(path => this.records.get(path)?.type === 'file'));
    this.selected = new Set(this.active);
    const count = path => {
      const record = this.records.get(path);
      record.selected = record.type === 'file' ? Number(this.selected.has(path)) : record.children.reduce((sum, child) => sum + count(child), 0);
      return record.selected;
    };
    this.roots.forEach(count);
  }

  state(path) {
    const record = this.records.get(canonicalPath(path));
    if (!record) return { checked: false, indeterminate: false, disabled: true, selected: 0, total: 0 };
    return {
      checked: record.total > 0 && record.selected === record.total,
      indeterminate: record.selected > 0 && record.selected < record.total,
      disabled: record.total === 0,
      selected: record.selected, total: record.total,
    };
  }

  setSelected(path, checked = !this.state(path).checked) {
    const record = this.records.get(canonicalPath(path));
    if (!record) return [];
    const changes = [];
    const previous = record.selected;
    const apply = item => {
      item.selected = checked ? item.total : 0;
      changes.push(item.path);
      if (item.type === 'file') {
        if (checked) this.selected.add(item.path);
        else this.selected.delete(item.path);
      } else item.children.forEach(child => apply(this.records.get(child)));
    };
    apply(record);
    const delta = record.selected - previous;
    let parent = record.parent;
    while (parent) {
      const ancestor = this.records.get(parent);
      ancestor.selected += delta;
      changes.push(parent);
      parent = ancestor.parent;
    }
    return changes;
  }

  selectedFiles() {
    return this.files.filter(path => this.selected.has(path));
  }

  get dirty() {
    return this.selected.size !== this.active.size || [...this.selected].some(path => !this.active.has(path));
  }
}

export class VersionTracker {
  constructor() { this.version = null; }

  observe(version) {
    if (typeof version !== 'string' || !version) return false;
    const changed = this.version !== null && this.version !== version;
    this.version = version;
    return changed;
  }
}

export class APIError extends Error {
  constructor(message, code = 'request_failed', status = 0, details = {}) {
    super(message);
    this.name = 'APIError';
    this.code = code;
    this.status = status;
    this.counts = details?.counts && typeof details.counts === 'object' && !Array.isArray(details.counts) ? details.counts : null;
    this.issues = Array.isArray(details?.issues) ? details.issues : [];
  }
}

export function apiErrorSummary(error) {
  if (error.code === 'compile_failed' && Number.isSafeInteger(error.counts?.failed) && error.counts.failed > 0) {
    return `${error.counts.failed} source(s) failed to compile.`;
  }
  if (error.code === 'busy' && Number.isSafeInteger(error.counts?.busy) && error.counts.busy > 0) {
    return `${error.counts.busy} source(s) are busy. Retry after the other compiler finishes.`;
  }
  return error.message || String(error);
}

export function compilationIssues(error) {
  return (Array.isArray(error.issues) ? error.issues : []).filter(issue =>
    issue && typeof issue === 'object' && (!issue.status || issue.status === 'failed' || issue.status === 'busy'));
}

export async function requestJSON(path, { method = 'GET', body, signal, fetch: fetcher = globalThis.fetch } = {}) {
  let response;
  try {
    response = await fetcher(path, {
      method, signal, cache: 'no-store', credentials: 'same-origin',
      headers: { Accept: 'application/json', ...(body === undefined ? {} : { 'Content-Type': 'application/json' }) },
      ...(body === undefined ? {} : { body: JSON.stringify(body) }),
    });
  } catch (error) {
    if (error.name === 'AbortError') throw error;
    throw new APIError('Cannot reach the local KB server. Check that SWI-Prolog is running and retry.', 'connection_failed');
  }
  let result;
  try { result = await response.json(); }
  catch { throw new APIError(`The server returned an unreadable response (HTTP ${response.status}).`, 'invalid_response', response.status); }
  if (!response.ok || result?.error) {
    throw new APIError(result?.error?.message ?? `Request failed (HTTP ${response.status}).`, result?.error?.code ?? 'request_failed', response.status, result?.error);
  }
  return result;
}
