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

## User intent and generated selections

Choices and members may carry `origin:user` or `origin:generated`. Missing origin
means **user**, preserving legacy saved packs. Root paths are always explicit
user intent. User choices and legacy/user members remain explicit selection
anchors even when they have no incoming dependency.

Generated choices/members are candidate preferences, **not roots**. Resolution
starts from explicit anchors and adds a generated provider only for a currently
required symbol with actual provider evidence. Every derived member receives
`witness:{root,anchor,steps:[{consumer,symbol,provider},...]}`. Supplied witness
metadata is never trusted to establish reachability; it is recomputed.

Unused generated choices, orphan providers and rootless cycles are discarded.
Changing an alternative or removing its consumer also removes that consumer's
solely induced requirements. Cycles reachable from a genuine requirement remain
valid. There is no filename-specific exclusion policy.

New composition members derived from a user choice are generated artifacts;
the explicit choice anchors them while present. Removing that choice does not
silently turn its derived member into a permanent user selection. Explicitly
tagging a member as user makes that independent intent persistent.

Unavailable root or required generated-provider metadata defers pruning and reports
`generatedReachability:unknown`; it is not evidence of an empty dependency set.
An unavailable orphan is not a reason to preserve a known rootless component.
Resolvable named-reference reachability does not establish support for unknown
variable positions, external host methods, MT entailment or runtime execution.

## Validation

Focused PL-Unit suites are `catalog_providers`, `source_pack_catalog` and
`source_packs`. Integration fixtures publish real checksum-validated query
projections from isolated caches. Read guards reject normalization, compilation
and full dependency/cache reads during catalog-backed resolution, and count one
snapshot/manifest capture per operation. Other cases cover typed declarations,
argument-two schema targets, ambiguity, removed choices, corrupt/stale/old
projections, raw hashes, and native loading of fixture-only saved compositions.
Additional regressions cover orphan/self/rootless cycles, changed alternatives,
legacy origins, explicit choices, unknown root metadata and forged witnesses.
