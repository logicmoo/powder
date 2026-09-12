# Catalog-backed SourcePack resolution

See [catalog provider declarations](catalog-source-packs.md) for the positive
type/target-slot evidence producer and snapshot accessor contract.

`kb_source_packs:resolve_pack/4` and `refresh_provider_index/2` capture
`kb_catalog_query:source_pack_snapshot/1` **once per operation**. The accessor
performs one manifest/stat compatibility check, not source-content or normalized
cache reads. Resolution does not build a projection, save a pack, or load KBs.

## Pure consumer API

`kb_source_pack_catalog` exposes:

- `catalog_analysis(+Snapshot,+Path,-Analysis)` lazily produces the existing
  `analysis{path,info,freshness}` DTO for one selected member. `info.symbols`
  contains defined, declared, referenced, outbound and unresolved entries.
  Typed/target-slot declarations merge by canonical symbol; outbound is
  recomputed from references minus all known local providers.
- `catalog_provider_index(+Snapshot,+allOrPaths,-Index,-SourceCount)` builds
  a candidate lookup containing **internal compact tokens**, without expanding
  every provider's provenance. This internal index is not a JSON DTO.
- `catalog_provider(+Token,-Provider)` expands only requested candidate tokens
  to ground JSON-ready provider records. No source/cache lookup is performed.

Compact `e(Id,Line,Role,Polarity)` evidence does **not** contain original paths,
variable names, MT, per-occurrence arity, executable kind or the original total
evidence count. Those values remain null/unknown; only the sample count is
reported. Current paths carry `sourcePathKind:catalog_source`. Static heads
remain `kind:static_head, implementation:unknown`, never inferred executable
rules. Extension evidence retains actual variable names, MT and complete
type/target-slot provenance.

`rolePresentation.doInvocation` uses the shared literal `^do[A-Z]` helper plus
static predicate-head, explicit schema relation-declaration or predicate-type
evidence. Naming without predicate/relation evidence remains unknown. This
presentation never claims execution support.

## Freshness, missing sources and fallback

Available but incomplete projections cannot establish global uniqueness.
Stale snapshots offer **no** old provider candidates. Missing/unindexed members
remain explicit, and saved choices are never replaced automatically—even when a
newly published catalog offers another provider for the same symbol.

Pre-extension or corrupt projections require refresh. Only an entirely absent
query projection uses the explicitly labeled `legacy_cache_fallback`. Stale
legacy indexes likewise offer no stale or removed provider rows. Existing
ambiguity handling outside explicitly reviewed choices is unchanged.

With an available projection, explicit provider-index refresh reuses it and
reports `persisted:false`, rather than writing a duplicate provider index.

`load_pack/4` still requires an explicitly saved composition and generation
check. It verifies the legacy source fingerprint, separate raw-byte SHA-256 when
present, physical normalized/index fingerprints when present, and the complete
normalized payload. The legacy compiler fingerprint is never relabeled as raw
SHA-256. Stat-compatible resolution alone is not permission to skip these checks.

## Validation

Focused PL-Unit suites are `catalog_providers`, `source_pack_catalog` and
`source_packs`. Integration fixtures publish real checksum-validated query
projections from isolated caches. Read guards reject normalization, compilation
and full dependency/cache reads during catalog-backed resolution, and count one
snapshot/manifest capture per operation. Other cases cover typed declarations,
argument-two schema targets, ambiguity, removed choices, corrupt/stale/old
projections, raw hashes, and native loading of fixture-only saved compositions.
