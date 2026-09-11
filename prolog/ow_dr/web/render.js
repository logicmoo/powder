import { renderDecodedText } from './decoded-text.js';

const text = value => ({ text: String(value), kind: 'text' });

export function symbolLabel(value) {
  const name = String(value ?? '');
  return name.startsWith('x_') ? name.slice(2) : name;
}

export function routeHref(route, values = {}) {
  const params = new URLSearchParams();
  for (const [key, value] of Object.entries(values)) {
    if (value !== undefined && value !== null && value !== '') params.set(key, String(value));
  }
  return `#/${route}${params.size ? `?${params}` : ''}`;
}

function symbolToken(value) {
  const name = String(value ?? '');
  const label = symbolLabel(name);
  const quoted = /[\s()";|\\]/u.test(label)
    ? `|${label.replaceAll('\\', '\\\\').replaceAll('|', '\\|').replaceAll('\n', '\\n').replaceAll('\r', '\\r').replaceAll('\t', '\\t')}|`
    : label;
  return {
    text: quoted,
    kind: 'symbol',
    ...(name.startsWith('x_') ? { href: routeHref('term', { term: name }) } : {}),
  };
}

function branches(node) {
  if (!node || typeof node !== 'object') return [];
  switch (node.type) {
    case 'application': return [node.head, ...(node.args ?? [])];
    case 'list': return node.items ?? [];
    case 'map': return (node.entries ?? []).flatMap(entry => [entry.key, entry.value]);
    case 'value':
    case 'execute': return [node.value];
    default: return [];
  }
}

function nested(node) {
  return branches(node).length > 0;
}

function sequence(open, head, children, close, depth, output, pretty) {
  output.push(typeof open === 'object' ? open : text(open), ...head);
  const split = pretty && children.some(nested);
  for (const child of children) {
    output.push(text(split ? `\n${'  '.repeat(depth + 1)}` : ' '));
    emit(child, depth + 1, output, pretty);
  }
  output.push(text(close));
}

function emit(node, depth, output, pretty) {
  if (!node || typeof node !== 'object') {
    output.push(text('[unavailable expression]'));
    return;
  }
  switch (node.type) {
    case 'symbol':
      output.push(symbolToken(node.value));
      break;
    case 'variable':
      output.push({ text: String(node.value), kind: 'variable' });
      break;
    case 'string':
      output.push({ text: JSON.stringify(String(node.value)), raw: String(node.value), kind: 'string' });
      break;
    case 'number':
      output.push({ text: String(node.value), kind: 'number' });
      break;
    case 'empty':
      output.push(text('()'));
      break;
    case 'application': {
      const head = [];
      emit(node.head, depth, head, pretty);
      const identity = node.natKey ?? node.termKey;
      const opening = node.denotesNat !== false && typeof identity === 'string' && identity
        ? { text: '(', kind: 'nat', href: routeHref('term', { term: identity }),
          title: 'Browse this complete non-atomic term', termKey: identity }
        : '(';
      sequence(opening, head, node.args ?? [], ')', depth, output, pretty);
      break;
    }
    case 'list':
      sequence('(', [text('[]')], node.items ?? [], ')', depth, output, pretty);
      break;
    case 'map': {
      const pairs = (node.entries ?? []).map(entry => ({
        type: 'application', head: entry.key, args: [entry.value],
      }));
      output.push(text('('));
      pairs.forEach((pair, index) => {
        if (index) output.push(text(pretty && pairs.some(nested) ? `\n${'  '.repeat(depth + 1)}` : ' '));
        emit(pair, depth + 1, output, pretty);
      });
      output.push(text(')'));
      break;
    }
    case 'value':
      emit(node.value, depth, output, pretty);
      break;
    case 'execute':
      output.push(text('!'));
      emit(node.value, depth, output, pretty);
      break;
    default:
      output.push(text('[unsupported expression]'));
  }
}

export function expressionTokens(expression, { pretty = true } = {}) {
  const result = [];
  emit(expression, 0, result, pretty);
  return result;
}

export function expressionText(expression, options) {
  return expressionTokens(expression, options).map(token => token.text).join('');
}

export function renderExpression(expression, { document: doc = globalThis.document, pretty = true, inline = false } = {}) {
  const element = doc.createElement(inline ? 'span' : 'pre');
  element.className = inline ? 'expression expression-inline' : 'expression';
  const code = doc.createElement('code');
  for (const token of expressionTokens(expression, { pretty })) {
    if (token.kind === 'text') {
      code.append(doc.createTextNode(token.text));
    } else {
      const part = doc.createElement(token.href ? 'a' : 'span');
      part.className = `expr-${token.kind}`;
      if (token.kind === 'string') {
        part.append(doc.createTextNode('"'), renderDecodedText(token.raw, { document: doc }), doc.createTextNode('"'));
      } else part.textContent = token.text;
      if (token.href) {
        part.href = token.href;
        part.title = token.title ?? `Browse ${token.text}`;
        if (token.kind === 'nat') part.setAttribute('aria-label', token.title);
      }
      code.append(part);
    }
  }
  element.append(code);
  return element;
}

export function contextExpression(key, supplied) {
  if (supplied?.type) return supplied;
  if (typeof key === 'string' && key && !key.startsWith('mt:')) return { type: 'symbol', value: key };
  return null;
}

export function contextLabel(key, supplied) {
  const expression = contextExpression(key, supplied);
  return expression ? expressionText(expression, { pretty: false }) : key ? 'Compound microtheory' : 'Unspecified microtheory';
}

export function contextInputText(key, expression) {
  if (typeof key === 'string' && key.startsWith('mt:')) {
    return expression?.type ? expressionText(expression, { pretty: false }) : '';
  }
  return symbolLabel(key);
}

export function assertionRoles(expression, term) {
  const roles = new Set();
  function visit(node, role) {
    if (!node || typeof node !== 'object') return;
    if (node.denotesNat !== false && (node.natKey ?? node.termKey) === term) roles.add(role);
    if (node.type === 'symbol' && node.value === term) roles.add(role);
    if (node.type === 'application') {
      visit(node.head, role === 'predicate' ? 'predicate' : 'nested');
      for (const argument of node.args ?? []) visit(argument, 'argument');
    } else {
      for (const child of branches(node)) visit(child, role);
    }
  }
  visit(expression, 'predicate');
  return [...roles];
}

export function groupAssertions(assertions) {
  const groups = [];
  for (const assertion of assertions) {
    let group = groups.at(-1);
    if (!group || group.mt !== assertion.mt) {
      group = { mt: assertion.mt, mtExpression: assertion.mtExpression, items: [] };
      groups.push(group);
    }
    if (!group.mtExpression && assertion.mtExpression) group.mtExpression = assertion.mtExpression;
    group.items.push(assertion);
  }
  return groups;
}
