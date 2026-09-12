const values = (item, names) => (item.properties ?? [])
  .filter(property => names.includes(property.name)).map(property => property.value)
  .filter(value => typeof value === 'string' || typeof value === 'boolean')
  .map(value => String(value).replace(/^:/u, '').toUpperCase());

export function assertionMarker(item) {
  const truth = new Set(values(item, ['truth', 'truth_value', 'truthValue']));
  const strength = new Set(values(item, ['monotonicity', 'strength']));
  let category = strength.has('MONOTONIC') && !strength.has('DEFAULT') ? 'MONOTONIC'
    : strength.has('DEFAULT') && !strength.has('MONOTONIC') ? 'DEFAULT' : 'unknown or conflicting';
  const effective = item.strengthCategory;
  if (effective) {
    const value = effective.status === 'initialized' ? effective.summary?.value : null;
    category = value === ':MONOTONIC' ? 'MONOTONIC' : value === ':DEFAULT' ? 'DEFAULT' : 'unknown or conflicting';
  }
  const originalTruth = new Set(values(item, ['cyc::original-tv', 'original-tv', 'original_tv']));
  const metta = item.dialect === 'metta' || /\.metta$/iu.test(item.source ?? '');
  const expression = item.expression;
  const negative = !metta && expression?.type === 'application'
    && expression.head?.type === 'symbol' && expression.head.value === 'x_not' && expression.args?.length === 1;
  const falseRecord = originalTruth.has('FALSE-DEF') && !originalTruth.has('TRUE-DEF');
  const storedFalse = truth.has('FALSE') && !truth.has('TRUE');
  const direction = values(item, ['direction']).join(' / ');
  const rule = item.kind === 'rule';
  const description = [
    negative ? 'Canonical negative assertion.' : falseRecord ? 'Original truth status: FALSE-DEF.' : storedFalse ? 'Stored assertion truth: FALSE.' : '',
    falseRecord && negative ? 'Original truth status: FALSE-DEF.' : '',
    effective?.reason === 'global_missing_strength'
      ? `Effective strength: ${category}, from global Missing assertion strength; not stored on this assertion.`
      : `Declared strength: ${category}.`,
    effective && effective.status !== 'initialized' ? `Strength status: ${effective.status} (${effective.reason ?? 'unavailable'}).` : '',
    direction ? `Stored direction: ${direction}.` : '',
    rule ? 'Executable back-chaining rule (<===); direction metadata does not enable forward execution.' : '',
    'Color does not encode numeric strength, confidence, utility or TVA fallback origin.',
  ].filter(Boolean).join(' ');
  return { kind: negative || falseRecord || storedFalse ? 'false' : category === 'MONOTONIC' ? 'monotonic' : category === 'DEFAULT' ? 'default' : 'unknown', rule, description };
}

export function colorAssertionBalls(container, items) {
  const byId = new Map(items.map(item => [String(item.id), item]));
  const cards = [...container.querySelectorAll('.assertion-view')];
  if (container.matches?.('.assertion-view')) cards.push(container);
  for (const card of cards) {
    const item = byId.get(card.dataset.assertionId);
    const ball = card.querySelector('.assertion-ball');
    if (!item || !ball) continue;
    const marker = assertionMarker(item);
    ball.dataset.marker = marker.kind;
    ball.dataset.rule = String(marker.rule);
    const label = `Properties and full details for assertion ${item.id}. ${marker.description}`;
    ball.setAttribute('aria-label', label);
    ball.title = label;
  }
  return container;
}
