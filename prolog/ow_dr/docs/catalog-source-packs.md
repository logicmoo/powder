# Catalog provider declarations

`kb_catalog_providers:source_provider_extensions(Source, Data, Taxonomy, Extensions)`
is a pure projection of a validated `source_catalog` and catalog taxonomy. It does
not read originals, normalized caches, query state, or native KB clauses.

The producer supplies **positive unconditional** `claims` and `applications`.
Semantic occurrence hits alone do not establish that an assertion is positive.
The projection accepts:

* A local `isa` subject whose **type** has a `predicates` or `functions` taxonomy
  membership. Observed predicate/constructor positions do not qualify.
* A local positive schema application with a proven `definition_slots/3`
  argument position and an atomic semantic hit at the exact argument path.
  Context hits, nested mentions and the constructor of a compound target do not
  qualify. A `MetaRelation` label alone never supplies a target slot.

`MetaFunction` describes predicates about functions; it is not a callable
function category. `Collection` alone is not a callable-provider declaration.
Nothing here establishes an executable implementation.

## Extension DTO

The ground JSON-ready result has:

```text
schema: powder.catalog-provider-extensions.v1
source: catalog source path
status: complete | partial | unavailable
declared: [{symbol, arities, roles, polarities, evidenceCount, evidence, implementation}]
coverage: {types, schemaTargets, scope, implements:false}
reasons: [{code, ...}]
```

`declared` is `null` when inputs or dialect semantics are unavailable.
`complete` means extraction under the supplied explicit taxonomy—not ontology
completeness or executable readiness. Unsupported compound/variable targets are
reported as partial coverage.

Evidence preserves assertion ID, original line, MT key, variable spellings,
ordinal and semantic path. It includes all relevant type assertions/hierarchy
proofs or complete target-slot evidence. Unknown proof constructors are serialized
as inert `{functor, arguments}` data. Historical source paths are not recoverable
from sentence locators alone: `sourcePathKind:catalog_source` and
`originalSourceFile:null` make that distinction explicit.

Entries are grouped by canonical symbol, never split by observed arity. Unknown
arity remains unknown; a predicate type name is not converted to an arity here.
Existing semantic rule-head and explicit schema declaration helpers remain the
authority for the base dependency summary.
