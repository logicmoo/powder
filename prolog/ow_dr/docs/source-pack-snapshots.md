# SourcePack snapshot bridge

`kb_source_packs` owns the full saved selection document. The provider index and
`kb_catalog_query:source_pack_snapshot/1` are derived evidence, not its authority.
These APIs never resolve dependencies, load original sources, read corpus caches,
start services, or create a saved image or durable configuration file.

```prolog
export_source_pack_snapshot(State).
import_source_pack_snapshot(State).
restored_source_pack_snapshot(State).
verify_source_pack_snapshot_authority(State).
```

The ground, JSON-ready payload is:

```prolog
source_pack_snapshot{
    schema:'powder.source-pack-snapshot.v1',
    authority:authority{repositoryRoot:AbsoluteRepository,sidecar:AbsoluteConfiguredFile},
    revision:SHA256OrNone,
    packs:ValidatedPacks
}.
```

## Contract

- **Export** reads the configured durable document with before/after SHA-256
  checks and returns its actual revision and exact repository/sidecar authority.
  It validates and copies roots, choices, members, origins, witnesses and
  resolution records using the existing pure pack validator. It neither adopts
  the document into memory nor creates locks, directories or files.
- **Import** validates the complete payload before replacing only the in-memory
  fallback. It performs no environment lookup, path canonicalization, filesystem
  access or durable write. It joins application admission; the current owner of
  an admission lease may invoke this trusted restore operation directly.
- **Restored inspection** is memory-only and returns the captured revision
  unchanged. It fails when nothing was imported. Conflicting stored records are
  errors rather than an arbitrary choice.
- A present sidecar always wins. Malformed, duplicate-ID, unreadable, changing,
  non-file or dangling-link sidecars are errors, not fallback opportunities.
- Only an absent sidecar uses imported packs, and only when the exact configured
  repository/sidecar authority matches. Effective reads return revision `none`,
  because the image cannot prove that a current document exists. The first
  explicit write therefore uses optimistic revision `none`.
- Untagged origins retain the existing implicit `user` meaning. Rooted resolver,
  dependency-choice, provider and loader semantics are unchanged.

Ordinary `save_pack/3` and the shared document writer hold
`kb_activity:with_application/1` admission before authorization or filesystem
mutation. They retain the existing native lock, optimistic revision and staged
publication behavior. Owning a checkpoint lease does not permit ordinary writes.

## qsave integration

The fallback predicate is **volatile**. Save the complete exported DTO in
immutable image data and explicitly import it into both the isolated builder and
every restored process. Do not rely on the fallback surviving `qsave_program/2`.

`kb_saved_state` stores it as `Metadata.sourcePackSnapshot` (runtime data schema
7), imports it during builder installation and restored-data initialization,
and compares memory with that immutable payload. The existing
`Metadata.configuration.sourcePacks` list remains the semantic configuration
view and must match the DTO's packs. Configuration hashes do not conflate the
document revision with semantic selections.

**Restored-data integrity is not live authority verification.** It must work
without a sidecar. Before any future manual activation/promotion, the coordinator
must separately call `verify_source_pack_snapshot_authority/1` under its existing
checkpoint lease. That check rejects repository/sidecar configuration changes,
changed revisions (including removal), or changed content. It reads the current
document but does not write or adopt it.

Current `kb_checkpoint_policy` execution guards remain unchanged. This bridge
does not enable auto-save, auto-start, serving candidates or live promotion.
Saved images contain application code and complete KB/configuration data; they
are trusted local artifacts, not safe inputs from arbitrary users.

## Validation

```powershell
cd prolog\ow_dr
swipl -q -f none -s tests\test_settings_snapshot.pl -s tests\test_source_pack_snapshot.pl -g "run_tests([settings_snapshot,source_pack_snapshot]),halt" -t "halt(1)"
```

The tests cover missing/present/malformed/conflicting/non-file sidecars, revision
and authority drift, record preservation, invalid-import rollback, admission
ownership and memory-only inspection. Traps reject source/cache/catalog reads.
A fresh builder calls actual `qsave_program/2`; a second process restores after
both the sidecar and transport are removed, proves that volatile fallback was
not persisted, then recreates it through the same saved-state bridge used by the
application. No listeners or production processes are started or modified.
