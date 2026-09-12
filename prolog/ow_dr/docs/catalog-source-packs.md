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
coverage: {types, schemaTargets, scope, implements:false,
           proofAlternativesExhaustive:false, proofPolicy:representative_justification}
reasons: [{code, ...}]
```

`declared` is `null` when inputs or dialect semantics are unavailable.
`complete` means extraction under the supplied explicit taxonomy—not ontology
completeness or executable readiness. Unsupported compound/variable targets are
reported as partial coverage.

Evidence preserves each distinct local assertion ID, original line, MT key,
variable spellings, ordinal and semantic path. Type evidence contains the local
type assertion and one representative hierarchy justification per callable
category; target evidence contains one representative justification per proven
argument slot. Global alternative proofs remain in the authoritative catalog,
not copied into every local occurrence. `proofAlternativesExhaustive:false`
explicitly distinguishes this projection from an exhaustive proof listing.
Unknown proof constructors are serialized as inert `{functor, arguments}` data.
Historical source paths are not recoverable from sentence locators alone:
`sourcePathKind:catalog_source` and `originalSourceFile:null` make that distinction
explicit.

Type and target-slot templates are compacted before the local evidence joins.
Duplicate global declarations, equivalent category roots, taxonomy cycles and
diamond paths do not multiply local evidence. This avoids a cross-file
proof-count × local-occurrence allocation while preserving distinct local
assertions and MTs.

The authoritative [compact provider justification
contract](catalog-provider-evidence.md) describes this evidence policy and its
bounded-join regressions.

Entries are grouped by canonical symbol, never split by observed arity. Unknown
arity remains unknown; a predicate type name is not converted to an arity here.
Existing semantic rule-head and explicit schema declaration helpers remain the
authority for the base dependency summary.

## Snapshot accessor

`kb_catalog_query:source_pack_snapshot/1` returns `status`, `revision`, `taxonomy`,
`verifiedAt`, `coverage`, and a `files` assoc. Each file retains its separate
legacy compiler fingerprint and `rawSourceHash`, plus `dependencySummary` and
`providerExtensions`.

`status:available` means a validated projection with a stat-compatible current
source set; it does not mean a new source-content hash scan.

Capture this accessor once per resolution/index operation. It reads the
validated query projection and checks the current eligible path set and file
stats; it does not compile or parse normalized sources. Changed paths/stats mark
the snapshot stale and prevent a complete-provider claim. Exact hashes must
still be verified before loading. A projection predating the extension fields is
explicitly unavailable until refreshed, not a successful empty provider index.

Removed original files are excluded by the next full catalog revision. Their
durable assertion-ID assignments and historical caches are not deleted.

The [SourcePack consumer contract](source-pack-catalog-resolution.md) documents
the lazy adapter, explicit fallback, missing choices, and load-time hash checks.
