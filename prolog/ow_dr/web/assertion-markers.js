const values = (item, names) => (item.properties ?? [])
  .filter(property => names.includes(property.name)).map(property => property.value)
  .filter(value => typeof value === 'string' || typeof value === 'boolean')
  .map(value => String(value).replace(/^:/u, '').toUpperCase());

export function assertionMarker(item) {
  const truth = new Set(values(item, ['truth', 'truth_value', 'truthValue']));
  if (truth.has('FALSE') && !truth.has('TRUE')) return { kind: 'false', description: 'Stored assertion truth: FALSE.' };
  if (item.kind === 'rule') return { kind: 'backward-rule', description: 'Executable back-chaining rule (<===). Stored direction metadata does not enable forward execution.' };
  const strength = new Set(values(item, ['monotonicity', 'strength']));
  if (strength.has('MONOTONIC') && !strength.has('DEFAULT')) return { kind: 'monotonic', description: 'Stored strength: MONOTONIC.' };
  return { kind: 'default', description: 'Assertion properties. Color does not estimate truth, confidence, rule utility or additional answers.' };
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
    ball.title = `${ball.getAttribute('aria-label')}. ${marker.description}`;
  }
  return container;
}
