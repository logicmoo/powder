const properties = Object.freeze({ errors: 'error', warnings: 'warning', notices: 'note' });
const markerLevels = Object.freeze({ note: 'note', warnings: 'warning', errors: 'error' });
const singularLevels = Object.freeze({ note: 'note', warning: 'warning', error: 'error' });
const levelIn = (table, key) => Object.hasOwn(table, key) ? table[key] : undefined;

export function diagnosticProperty(name) {
  return Object.hasOwn(properties, name);
}

export function diagnosticMessages(value) {
  return value === undefined || value === null ? [] : Array.isArray(value) ? value : [value];
}

export function mappingRowsOf(record) {
  if (Array.isArray(record.mappingRows)) return record.mappingRows;
  return (record.properties ?? []).filter(property => property.name === 'mapping_rows')
    .flatMap(property => Array.isArray(property.value) ? property.value : []);
}

export function splitMappingRows(rows = []) {
  const result = { ids: [], markers: [], other: [] };
  for (const row of rows) {
    if (typeof row === 'string') result.ids.push(row);
    else if (row && Object.hasOwn(markerLevels, row.type) && typeof row.message === 'string') result.markers.push(row);
    else result.other.push(row);
  }
  return result;
}

function messageText(value) {
  if (typeof value === 'string') return value;
  if (typeof value?.message === 'string') return value.message;
  return typeof value === 'object' ? JSON.stringify(value) : String(value);
}

// Deduplication is presentation-only. Stored properties are never inferred from discovery markers.
export function collectDiagnostics(record, { includeRows = true, status = false } = {}) {
  const result = [];
  const seen = new Map();
  const append = (severity, value, origin) => {
    const message = messageText(value);
    const source = value?.source ?? value?.path ?? record.source;
    const line = value?.line ?? record.line;
    const column = value?.column ?? record.column;
    const key = JSON.stringify([severity, message, source ?? null, line ?? null, column ?? null]);
    let entry = seen.get(key);
    if (!entry) {
      entry = { severity, message, origins: [], ...(source ? { source } : {}), ...(line !== undefined ? { line } : {}), ...(column !== undefined ? { column } : {}) };
      result.push(entry);
      seen.set(key, entry);
    }
    if (!entry.origins.includes(origin)) entry.origins.push(origin);
  };
  for (const [name, severity] of Object.entries(properties)) {
    const stored = (record.properties ?? []).filter(property => property.name === name);
    if (stored.length) {
      for (const property of stored) {
        for (const message of diagnosticMessages(property.value)) append(severity, message, `property:${name}`);
      }
    } else {
      for (const message of diagnosticMessages(record[name])) {
        const explicit = status ? levelIn(markerLevels, message?.type) ?? levelIn(properties, message?.type)
          ?? levelIn(singularLevels, message?.severity) : null;
        append(explicit ?? severity, message, `field:${name}`);
      }
    }
  }
  if (includeRows) {
    for (const marker of splitMappingRows(mappingRowsOf(record)).markers) {
      append(markerLevels[marker.type], marker, 'mappingRows');
    }
  }
  return result;
}

export function diagnosticCounts(entries) {
  const counts = { note: 0, warning: 0, error: 0 };
  for (const entry of entries) counts[entry.severity]++;
  return counts;
}
