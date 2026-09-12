# Saved application states

These are **SWI `qsave_program/2` application images**, not saved source lists.
Their dynamic native KB clauses, assertion IDs and binary properties, real
variables, loaded-source manifest, and semantic browsing indexes are already
in the image. Restoring does not compile or read original KBs, normalized data,
semantic cache files, or the builder's temporary snapshot.

## Application and Settings integration

`kb_checkpoint_host:run_application(Args)` is the production host entry for the
application's existing `main/0`. Importing it starts nothing. It resolves the
selected image before loading any sources; a cold start loads sources once.
Do not surround this entry with the old app's pool/listener/console startup.

```prolog
main :-
    current_prolog_flag(argv,Args),
    kb_checkpoint_host:run_application(Args).
```

Supported startup overrides:

* `--saved-state=s-UUID`: choose a specific compatible image.
* `--cold-start`: ignore next-start image selection for this invocation.
* Explicit source paths, `--kb-source=...`, or `--kb-dir=...`: take precedence
  over image selection, without modifying that selection.
* `--port=N`: override the restored primary HTTP port. Tracked extra HTTP ports
  are restored once; an extra matching the new primary is not duplicated.
* `--debug-port=N` / `--debug-off`: override the saved debug setting.

The host already implements the resume callback and native-launcher/coordinator
hooks. Normal selected resume creates new pools, HTTP listeners, a private IPC
worker and the native console scanner from restored data. Trial candidates create
**none** of those serving resources: only private file IPC is started, with no
HTTP/debug/agent services or outbound network access. Do not add another resume hook
that calls `main`, `load_sources`, or recursively launches the same selection.

Import `kb_checkpoint_http` to register the local Settings routes. The independent
browser helper is:

```javascript
import { renderCheckpointSettings } from './checkpoints.js';
container.append(renderCheckpointSettings({ api, signal }));
```

`api` uses the existing `(path, parameters, options)` signature. Abort `signal`
when leaving Settings. The helper loads `checkpoints.css`, and never promotes
without an explicit unchecked-by-default consent checkbox.

Shared mutation endpoints must call
`kb_checkpoint_host:require_mutable_instance/0` before writes in a trial.
Checkpoint routes must remain outside ordinary application/query admission
wrappers: they manage their own short admission and snapshot boundaries.
The final shared `app.pl` / server / Settings wiring is separate from these
resource-free modules; importing an unconnected helper is not application readiness.

## Backend contract

`kb_saved_state` exports:

* `saved_states(-Result)` → `{revision,selected,items}`. Each item has its name,
  ID, creation time, generation, files, counts, byte size, integrity and ABI/code
  identity, validation status, availability, and `selectedNextStart`.
* `create_saved_state(+Name,+ExpectedGeneration,+ExpectedRevision,-Metadata)`.
  Synchronous; success means a **separate SWI process actually restored the
  completed image** and verified its data. Creation does not change selection.
* `select_saved_state(+IdOrNone,+ExpectedRevision,-Result)` atomically selects
  a completed compatible image, or `none`. Use the returned revision for the
  next operation. A stale revision, active writer, duplicate name, missing or
  changed artifact, or incompatible code produces an exception, not fallback.
* `saved_state_metadata(+Id,-Metadata)` reads one catalog entry.
* `startup_saved_state(+ExplicitSources,-Choice)` returns
  `sources(ExplicitSources)` when that list is nonempty, otherwise `none` or
  `saved(ImagePath,Metadata)`. Explicit source arguments override selection
  **without validating or silently clearing** the selected image.
* `run_saved_state(+Id,+ForwardedArgs,-Exit)` starts a validated image with
  `swipl -q -f none -x IMAGE -- ARGS` through the native Windows launcher, with
  a new console and no inherited standard/socket handles. It waits for this
  owned child; it never contacts an existing server. Live takeover still requires
  the explicit trial/coordinator transaction, not this direct startup API.

Separate explicit Settings **Create saved state**, **Start candidate**, and
**Promote candidate** actions use
the managed coordinator described in [checkpoint-handoff.md](checkpoint-handoff.md).
Selection for the next ordinary startup and a live takeover are separate actions.

`resume_entry/0` restores registrations and validates data before calling this
host hook. Its invocation-local guard rejects a second resource startup. No callback
is executed by the verification child. `restore_saved_data/1` is idempotent.
The normal-launch parent resolves selection **before** loading KB files, starts
the chosen image, and exits with its child status rather than running a second
HTTP/console loop. Listener/console handoff remains app-owned. Never use an HTTP
worker's stack as the resume goal.

On SWI 10, `halt(0)` unwinds through `catch/3` as `unwind(halt(0))`. Keep process
termination outside broad error handlers, or rethrow `unwind/1`.

## Durable artifacts and atomic writes

States live next to the configured server settings:

```text
.logos-state/saved-states/catalog.json
.logos-state/saved-states/catalog.lock
.logos-state/saved-states/s-UUID/image.state
.logos-state/saved-states/s-UUID/metadata.json
.logos-state/saved-states/s-UUID/validation.json
```

`POWDER_SERVER_SETTINGS` relocates both configuration and this sibling
directory for isolated tests/trusted deployments. Web clients supply only a
display name or controlled state ID, never an output path. Native filesystem
checks reject symlink/junction/reparse targets. This is local-user storage:
hashes detect damage, **not hostile replacement by the owner of the directory**.
Do not import or launch untrusted saved states: they contain executable code.

A retained native nonblocking lock serializes catalog writers. Generation and
catalog revision are checked before export. A unique same-directory
`.building-UUID` directory holds the current in-memory export and image. The
export and generated native inputs are deleted **before** validation restores
the image. Only a successful validation permits directory publication and
atomic catalog replacement. Existing states and the live KB are not rewritten.
Exceptions/cancellation terminate and reap only the operation's child, clean
owned staging, and retain existing selection. A hard process crash may leave a
hidden `.building-*` directory; it is not listed, selected, or auto-promoted.
There is deliberately no automatic deletion or pruning of saved states.

## Consistency and resource boundary

Export reads authoritative registered native clauses and `xc_*` metadata,
validates the original guards against the normal compiler envelope, and checks
IDs/counts against the store. Unmanaged native imports outside its source
manifest are rejected explicitly rather than silently omitted. A full semantic
and metadata digest survives the roundtrip; it covers variable sharing too.
Metadata enumeration uses `kb_runtime:module_metadata_terms/3`, excluding
imported helper predicates even when they expose a matching ID or opaque handle.

When job infrastructure is loaded it must supply:

```prolog
:- meta_predicate with_saved_state_snapshot(0).
kb_jobs:with_saved_state_snapshot(Goal).
```

The wrapper rejects pending/running save-unsafe work and prevents new admissions
while taking the code/store locks and copying the snapshot. It must not discard,
cancel, or serialize live jobs. The locks are released before the expensive
isolated build. Without the job module the backend uses nonblocking code/store
mutexes. A loaded job module without that hook is a clear error.

The builder uses the public `kb_jobs:save_quiescence/1` report and calls
`prepare_saved_state/0` immediately before qsave. Preparation accepts only an
unused isolated registry, refuses existing pools/jobs/leases, and clears only
its transient standard-stream references. It is never invoked in the live owner.
After full restored-data validation, `restore_saved_state/0` checks that this is
a different process and rebinds standard streams. It does not create pools.
The parent startup/candidate hook then calls `start_pools(Settings)` once;
repeat initialization is tested not to add workers. No queues are stopped to
make a live snapshot succeed.

The builder loads app code with `initialization(_,main)` suppressed; module
initializers must not open listeners or enter console raw mode. It rejects
populated pool/job/worker, HTTP listener, console-owner, and Prolog native-bridge
registries. No live process memory, environment tokens, HTTP request, sockets,
stream handles, timer, queue, lock, active query, or proof stack is copied.
Only allowlisted KB/store, configuration, native annotation, and completed
utility data are transported to the clean builder.

Native annotation export uses the copy-only
`kb_native_annotations:export_native_snapshot/1`, never the synchronizing or
persisting facade. The builder imports the full validated native records through
`import_native_state/1`. Restore verifies them using the memory-only
`restored_native_snapshot/1`, even when the native sidecar is unavailable.
The native schema/revision/sequence/count is included in configuration identity,
so annotation drift prevents takeover. The captured defaults, per-MT settings,
per-entity records and separate assertion priors remain native data, not inferred
KB assertions. Save neither seeds defaults nor writes the live annotation file.

Debug configuration contains only the validated nonsecret resume profile. Its
authentication digests, sockets, threads, attempts, sessions and stopped-profile
registry are volatile. A fresh debug service generates new private credentials;
the builder's active-debug guard remains mandatory. Snapshot capture owns an
admission lease and requires no executing or legacy ungated debug command.
Interactive console sessions and active work return busy rather than being
discarded. The host uses the public transfer stop/start APIs, so rollback does
not leave debug administration permanently marked as shutting down.

Completed rule-utility aggregates are an additional explicit data payload, not
an accidental consequence of declaring a live predicate dynamic. Under the
snapshot gate the backend calls `kb_rule_utility:export_telemetry/1`; after native
KB/index installation the isolated builder calls `import_telemetry/1`. Ground,
portable schema-1 rows retain assertion ID, content hash, generation, aggregate
counters, and lifetime metadata. `ruleUtility` in state/validation metadata
contains its separate digest and counts; restore verifies it before querying.
This digest is deliberately not part of the logical KB/generation fingerprint:
ordinary utility observations must not create false material-KB drift.

Unfinished attempts, query-local timers/native references, and last-query reports
are not exported. The builder rejects an active `powder_rule_query` context
rather than clearing it to force qsave. Restore uses idempotent
`reset_transient/0`, which never clears completed aggregates. Health probes use
`query_modules_report/8` with `telemetry(false)` and clean their transient report,
so validation neither adds observations nor double-counts saved aggregates.

## Metadata retention and snapshot identity

The shared `non_sumo_originals_v1` policy filters copied non-SUMO/unknown-origin
metadata before long-lived `snapshot.term` or native builder staging. IDs,
semantic clauses, variable names, MT/source properties, and intentional canonical
`cnf` remain intact. Verified SUMO originals remain data. Save does not prune the
live owner or rewrite its source/cache files.

Classification uses stored `sourceOrigin`/`mappingMode` or the policy's pure
known-path/options conversion. Missing evidence becomes `unknown`. The backend
seeds this origin before calling `origin_context/2`, preventing that API's legacy
source-reading fallback; dialect/file-extension exclusions still override SUMO.
Even an existing malformed legacy source header is not parsed during capture.
Native builder loading passes `metadata_context(Info)` explicitly. Thus a custom
KIF's stored SUMO opt-in survives the headerless native snapshot even after the
original file/header is unavailable; the loader cannot mistake it for unknown
origin and drop its retained originals.

Compatible old **data payloads** are validated against their declared raw
`snapshotDigest` before adaptation. That digest is preserved; the separate
`retainedSnapshotDigest` identifies the actual filtered native output.
`saved_snapshot_digest/2` supplies the effective loaded-data identity to checkpoint
comparisons. A raw cache header continues to identify disk bytes, never filtered
records. Tampering with an otherwise disposable original property still fails
raw integrity validation.

Builder and resume call `kb_store:apply_metadata_retention_locked/1` only in their
quiescent process, inside `begin_checkpoint_drain/1` and
`with_saved_state_snapshot/1`, holding admission, code-reload and store locks. The public hook
prunes native/JSON metadata and clears hidden role caches without changing
generation or manifest. Resume verifies native data before pruning and again
afterward. Retention policy/runtime schema are compatibility fields; this data
adaptation does not permit executing incompatible old qsave code images.

The exact call is:

```prolog
qsave_program(Image,
  [ class(development), goal(kb_saved_state:resume_entry), toplevel(halt),
    init_file(none), stand_alone(false), autoload(false),
    foreign(no_save), packs(false)
  ]).
```

`development` preserves native file/line metadata and mutable predicates.
The builder seals a persistent dormant startup mode before qsave. Its first
application restore initializer reinstalls SWI socket guards, because foreign
predicate wrappers do not themselves survive reloading. They refuse socket
creation, listen/bind/connect and UDP send while dormant or a candidate. The
controlled resume goal identifies candidate mode before data restoration.
Only normal selected startup or explicit approved promotion releases the fence.
Private IPC uses owner-only atomic JSON mailboxes beneath the controlled saved-state
root; no temporary/admin/readiness/health HTTP port is opened. See the
[checkpoint handoff](checkpoint-handoff.md) for the protocol and rollback contract.
`native_handle/4`, `native_signature/4`, and `native_file/2` are made volatile
**in the isolated builder only**. Resume scans already-restored native clauses,
rebuilds handles and predicate registrations, and retains the saved semantic
indexes. It does not execute rule bodies to reconstruct data. SWI normalizes
Windows source path case in images; registration uses actual restored
`clause_property(Ref,source(File))`, not a stale spelling.
The image also records its detached builder root. Rebound paths must match that
root's generated `native-UUID/clauses.data` path for the module, never a parent
runtime/cache path. Each nonempty module must have exactly one actual source
identity. Only a source whose saved `Info.count` is zero may reuse its validated
builder path when no semantic clause supplies a native location. Original
source/Info paths are unchanged, including their spelling.

`foreign(no_save)` intentionally requires the same SWI installation; it avoids
packaging/extracting native DLLs. The console DLL is loaded by the normal fresh
console setup, never represented by a supposedly persistent handle.

## Compatibility and limitations

Images include full KB data and backend code. Treat them as sensitive data.
They are same-checkout/same-machine artifacts, not a portable interchange or
backup format. Compatibility checks cover exact SWI version, executable hash,
architecture, word size, installation/application/repository paths, cache/state
schema, top-level backend Prolog/PowerShell/DLL files, web assets, and mappings.
Native shared libraries in the SWI executable, library, and architecture-library
directories are hashed too, rather than assuming an unchanged launcher EXE
implies an unchanged SWI core/DLL ABI.
Loaded external Prolog dependencies outside the app/SWI installation are also
hashed; they must be available with matching bytes. External source-module
dependencies and native DLLs are not magically bundled into a portable image.
Changed code/assets invalidate old images clearly; there is no hidden reload
of KB sources or automatic fallback. Recreate a state after a backend update.
Source changes are intentionally irrelevant to restoring the saved generation.
Current explicit startup source selection and current runtime options remain
app-owned; pool resources are fresh, not continuations of old workers.

The synchronous create call is exposed by a bounded, volatile checkpoint
operation registry. It is not a file/inference job and never discards their work.
Pending saves prevent retirement; an admission lease rejects new operations.
Creation success follows real child restoration, not HTTP acceptance.

Images now retain validated SourcePack roots, choices, members and resolution
data as well as startup/pool settings. Their semantic content participates in
configuration identity. `effective_configuration/1` and GET
`api/checkpoint/configuration` use existing validated sidecars when present and
module-owned imported fallback when absent. Corrupt existing sidecars are errors, not a
reason to silently fall back. Independent image verification removes settings,
SourcePacks, native annotations, originals and caches before restoring.

Ordinary Settings/SourcePack readers now own their missing-sidecar fallback.
See [settings snapshots](settings-snapshots.md) and
[SourcePack snapshots](source-pack-snapshots.md) for the frozen export/import/
inspection contracts. No snapshot operation creates or overwrites a sidecar.
Effective missing-sidecar reads use revision `none`; existing sidecars retain
their real optimistic revision. SourcePack writes now join application admission
before authorization/publication, retaining native locking and revision checks.

Runtime data schema 7 stores the full authority/revision/packs DTO separately as
`Metadata.sourcePackSnapshot`. Its volatile fallback is explicitly reimported
on restore, without source/cache reads. Semantic configuration identity remains
separate from document authority. The integrated coordinator verifies the
captured DTO against live SourcePack authority under its lease.

An earlier extended actual-native Windows test passed in 319.270 seconds:
trial, busy refusal, cancel, injected-bind-failure rollback, successful takeover,
sidecar-free repeat save and selected startup with an explicit port override.
That stage passed 31 backend and two Chrome/UI tests. These are historical
results, not validation of the current paused checkpoint workflow.

Earlier native runs exposed intermittent old-host
`thread_join/2: thread ... does not exist` shutdown failures (exit 2).
The latest run did not reproduce them; this is not proof that the underlying
shutdown race is fixed. Cleanup stages now identify debug/HTTP/control/pools
failures. A subsequent expanded native test also exposed an unresolved candidate
exit `0xC000013A`; no root cause is claimed. App/API/Settings wiring is now
integrated. The final **nonserving** copied-app native workflow passed in
312.080 seconds, including real browser-created qsave, source/cache removal,
private-IPC trial queries, zero preapproval candidate TCP/UDP endpoints,
cancellation, failed-bind rollback, fresh debug credentials, original
port takeover, survival after old-owner/job retirement, sidecar-free repeat save,
and selected restart through `app.pl` with explicit CLI overrides.

Production checkpoint-policy guards remain in force. The integration test
authorizes c06 actions only by replacing the policy module in its own disposable
copied application. It never unpauses production through HTTP, environment
variables or image data. The production-pause/cold-start tests run against the
unchanged real policy. Production execution remains paused; this implementation
does not authorize a production save, candidate or promotion.

## Focused verification

From the repository checkout:

```powershell
swipl -q -f none -s prolog\ow_dr\tests\test_saved_state.pl -g "run_tests(saved_application_state),halt" -t "halt(1)"
python prolog\ow_dr\tests\saved_state_integration.py
python prolog\ow_dr\tests\checkpoint_native_integration.py
$env:LOGOS_CHROME='C:\Program Files\Google\Chrome\Application\chrome.exe'
node --test prolog\ow_dr\tests\checkpoints-ui.test.mjs
```

Tests generate only isolated tiny fixtures under the test directory with their
own IDs/config/state directory. They exercise actual `qsave` and a new `-x`
process after removal of originals, caches and native inputs; IDs/properties/
sharing/locations/indexes/dynamic mutability; selection and explicit overrides;
generation/revision/lock failures; corrupted/truncated images; resource guards;
and callback idempotence. Concurrent edits to versioned application code can
correctly invalidate an image during a test. The Python runners freeze copied
code under the test directory to avoid this ambiguity and remove their owned
copies afterward. The native runner uses the production Windows launcher for
candidates, verifies a real console/scanner, cancellation, injected binding
failure and rollback, primary-plus-extra takeover, repeated save, and selected
next-start restore with a CLI port override. It never contacts the live server.

Official references: [SWI saved states](https://www.swi-prolog.org/pldoc/man?section=saved-states)
and [process_create/3](https://www.swi-prolog.org/pldoc/doc_for?object=process_create/3).
The saved-state manual specifically excludes ordinary clause-reference,
recorded-reference, stream, and thread blobs. A logical clause is persistent;
an old native reference to that clause is not.
