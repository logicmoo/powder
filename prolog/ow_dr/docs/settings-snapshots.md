# Settings snapshots

`kb_config` owns the validated in-memory settings fallback. These APIs do not
start services, load KB files, alter runtime pool sizes, or seed a disk document.

```prolog
export_settings_snapshot(Snapshot).
import_settings_snapshot(Snapshot).
restored_settings_snapshot(Snapshot).
```

The ground payload is:

```prolog
settings_snapshot{
    schema:1,
    settings:server_settings{
        startupConfigured:true,
        startupFiles:['C:/data/missing-directory'],
        pools:pools{loader:profile{start:5,max:10,spare:0},
                    inference:profile{start:1,max:4,spare:0},
                    http:profile{start:4,max:8,spare:0}}
    },
    revision:none
}.
```

## Authority and side effects

- Export reads a present sidecar consistently by SHA-256 before/after parsing.
  It returns the actual observed revision. It creates no locks or files and
  does not adopt the sidecar into memory.
- Missing sidecars use imported settings, or ordinary defaults when no snapshot
  was imported. A present malformed/changing document is an error, never a
  fallback. A directory or dangling symbolic link at the sidecar path is not
  treated as absence.
- Import validates before atomically replacing only the memory fallback.
  Imported revisions become `none`: an image is not proof that a current disk
  document exists. Import joins application admission, except that the current
  owner of an admission lease may perform this trusted restore operation.
- Restored inspection reads memory only, including no environment or sidecar
  lookup. It fails when no snapshot exists. Conflicting raw memory records are
  errors. The ground fallback is retained by `qsave_program/2`.
- `server_settings/1` uses the fallback **only when the sidecar is absent**.
  It returns revision `none` and no filesystem-derived source issues in that
  case. Existing valid sidecars remain authoritative.

Snapshot validation does not call `canonical_source/2` or source-existence
checks. Nonempty text paths are retained; relative paths are anchored lexically
to the repository root. Source directories need not still exist. A pure validator
cannot establish whether a path names a file or directory; ordinary explicit
save requests retain their existing source validation. Pool validation,
optimistic revisions, native locking, staged writes and live-worker behavior are
unchanged.

The saved-state bridge exports through this API, imports settings into the
isolated builder, and verifies the restored memory fallback against immutable
image metadata. It does not maintain another mutable settings registry.

## Validation

`tests/test_settings_snapshot.pl` covers copy-only behavior, absent/present/
malformed/changing sidecars, missing directories, pool validation, admission
ownership, revision-safe writes, and a real isolated qsave builder followed by a
fresh process restoring with both source directory and sidecar removed. The
transport file is deleted before restore. Traps reject accidental calls to the
source canonicalizer or source-issue scanner.

This component-level test does not bypass `kb_checkpoint_policy` or enable
paused application checkpoint execution.
