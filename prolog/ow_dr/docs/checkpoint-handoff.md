# Managed checkpoint trial and takeover

`kb_checkpoint.pl` is the saved-image coordinator. `kb_checkpoint_host.pl`
implements the real serving/console adapter, and `kb_checkpoint_http.pl` exposes
the local Settings interface. No listener is contacted or created on module load.

## Integrated entry and policy boundary

`app.pl` delegates its existing `run/1` entry to
`kb_checkpoint_host:run_application/1`. The normal CLI source/port/debug options
and independent Prolog/Shell console callbacks are retained. Runtime Settings
(`#/settings`) renders the checkpoint component; the native-annotation
`#/ui-settings` page is unchanged.

The parent's existing production execution pause remains fail-closed. Ordinary
cold startup still starts its requested KB, owned HTTP pools and optional debug
service, but does not create checkpoint control resources while paused. Settings
shows the policy reason and disables checkpoint creation/selection/trials.
Selected images do not override this pause. No production policy was unpaused
by the integration.

`kb_server` installs SWI's supported `http_request_expansion/2` guard at the
application API mount. It blocks trial mutations even in separately registered
catalog/annotation handlers, while permitting explicitly read-only POST queries
and inspectors. Candidates have no HTTP listener at all; the guard also covers
the approved port-transfer interval before final activation. It uses a
memory-only role check, not a potentially failing status/profile expansion.

## Settings HTTP interface

Routes are below the canonical `/swish/openworld_dr/api/checkpoint/` mount.
GET requires an owned local Host; POST additionally requires its exact Origin.
Use JSON bodies, not filesystem paths or executable goals.

| Method / route | Input | Result |
|---|---|---|
| GET `catalog` | none | Image catalog/revision, generation, redacted instance, operations and trials |
| GET `configuration` | none | Effective settings/SourcePacks, using module-owned imported fallback only for absent sidecars |
| GET `inspect` | `?id=s-UUID` | Full image metadata, without control credentials |
| POST `create` | `{name,generation,revision}` | Accepted operation; poll until completed/failed/cancelled |
| POST `select` | `{id,revision}`; `id:"none"` clears selection | Updated next-start catalog; does not start or promote |
| POST `try` | `{id,generation}` | Accepted operation; its result contains the verified trial |
| GET `status` | exactly one of `?operation=UUID` / `?run=UUID` | Current operation or trial state |
| POST `cancel` | `{kind:"operation"|"trial",id}` | Cancellation state; existing images are retained |
| POST `promote` | `{run,revision,confirm:"take-over-original-ports"}` | Asynchronous explicit takeover |
| GET `identity` | `?nonce=...` | Read-only public identity proof; never a capability |

The async registry is volatile, bounded, and separate from ordinary file and
inference jobs. A running save blocks retirement, and new operations/selection
cannot bypass a drain lease. Failed/cancelled publication leaves existing data
and selection intact; an image already fully published remains in the catalog.
Cancellation allows up to 20 seconds for native console/debug cleanup before
terminating its owned child. After confirmed process exit, Windows may still
retain an empty console working directory. Only that empty directory is deferred,
with `cleanup:deferred_empty_directory`; payload deletion errors remain failures.
Settings displays the distinction. A secondary automatic-recovery failure becomes
`recovery_required`, never an indefinitely misleading `promoting` state.

## Public application contract

After normal startup has opened its owned loopback listeners, call
`start_managed_instance(PrimaryPort, PrivateCredentials)` once. Never put
`PrivateCredentials` in browser JSON, logs, or a URL. Register this public,
read-only endpoint under the canonical application mount:

```prolog
:- http_handler(openworld_dr('api/checkpoint/identity'),
                kb_checkpoint:checkpoint_identity_http, []).
```

It returns a bounded echoed nonce, instance UUID, role, checkpoint/run identity,
generation, counts, and owned listener profiles. No control capability is public.

Expose the following only through the app's authenticated, local, explicitly
user-authorized Settings actions:

* Save: `kb_saved_state:create_saved_state(Name,Generation,CatalogRevision,Metadata)`.
  Save is synchronous and cancellable through its caller. Success includes a
  **real separate-process restore validation**, never just qsave's return value.
* Try: `try_checkpoint(StateId,ExpectedGeneration,Trial)`. Starts an isolated
  **nonserving** image candidate and returns `trial_ready` only after private-IPC
  identity/data/query/provenance checks. It leaves old listeners alone. Browser,
  CSS/JavaScript and HTTP API checks occur only after approved original-port binding.
* Take over: `promote_checkpoint(RunId,ExpectedRunRevision,Status)`.
  Returns `promoting` and runs the drain/rebind transaction on an owned management
  thread, not the HTTP worker whose own listener must drain.
* Poll: `checkpoint_status(RunId,Status)` or
  `await_checkpoint(RunId,TimeoutSeconds,Status)`.
* Cancel a trial: `cancel_checkpoint(RunId,Status)`. This stops/reaps only the
  recorded candidate, removes that run's owned artifacts, and retains the image.
  Cancellation during promotion/recovery is rejected rather than interrupting
  a half-completed port transfer.
* `checkpoint_instance(Info)` is a public/redacted current-instance summary.
  `stop_managed_instance/0` stops only the private IPC worker; normal
  application cleanup still owns application listeners, pools, and console.

Create does not select the next-start state. Use the saved-state catalog's
optimistic revision API for selection; use the run revision for promotion.
Repeated Try for an existing active trial and repeated promotion of a promoting/
promoted run are idempotent. Display phase/message and recovery information, not
merely the initial HTTP request's success. Never auto-promote after Try.

The loaded generation, full semantic/metadata snapshot digest, material startup/
pool configuration, and listener profiles must still match the checkpoint.
Instance UUID changes alone do not invalidate reusable logical checkpoints.
When retention adapts a compatible old data payload, comparison uses its
separately verified `retainedSnapshotDigest`; the original input digest is
preserved rather than mislabeled as the new output's hash.
Named images remain immutable and reusable for normal next-start selection;
there is no destructive pruning or replacement of the last good image.
Completed utility rows are explicitly imported into the isolated builder and
verified using a separate digest on restore. They are not logical assertions,
do not affect material-KB drift checks, and are not changed by health probes.
Their query-local timers/references/reports are transient.

## Required runtime hooks

Declare `kb_checkpoint:runtime_hook/3` multifile. Hooks receive trusted local
data, not executable web goals. They must either succeed completely or throw
an informative error; there are no always-successful production fallbacks.

| Action | Input | Output / obligation |
|---|---|---|
| `capabilities` | `none` | List including `drain`, `resume_admissions`, `release_ports`, `bind_ports`, `retire_old` |
| `profiles` | `none` | Exact owned application listeners; **empty** for a nonserving candidate |
| `start_candidate` | `{metadata:Metadata,stopQueue:Queue}` | Atom `nonserving`; install memory-only host configuration, no pools/listeners/debug/agent/console startup |
| `wait_candidate` | `Queue` | Wait for stop or explicit activation; start the normal console scanner only after activation |
| `stop_candidate` | `none` | Gracefully clean only this candidate's resources |
| `drain` | `checkpoint` | Invocation-local lease: reject busy accepted/running work immediately, prevent new admissions and code/store/config changes; never wait for/drop/cancel jobs |
| `resume_admissions` | `Lease` | Release exactly this drain lease; idempotent release is strongly recommended |
| `release_ports` | exact owned profile list | Drain/stop only these owned listeners, not another process or an arbitrary PID; do not stop private control |
| `bind_ports` | exact target profile list | Recreate original primary and all extras, registering each newly owned listener for rollback |
| `nonserving` | `none` | Close owned promotion resources and return to nonserving mode after failed binding |
| `query` | bounded query DTO | Execute through validated KB dispatch, no source/cache reload |
| `health` | `none` | Redacted runtime, pools, debug and console state, without credentials |
| `retire_old` | run ID | Schedule graceful old-process/console/pool retirement after replacement verification; do not kill or synchronously await the current control worker |

The existing snapshot hook `kb_jobs:with_saved_state_snapshot(Goal)` must reject
unsafe pending/running work, prevent new admissions while copying, and take the
code/store locks. It must also permit a snapshot while the calling checkpoint
operation owns a compatible drain lease. Config writes and hot code reloads must
respect the promotion lease. Never discard existing jobs to make a save succeed.
The implemented job facade provides `begin_checkpoint_drain/1` and idempotent
`end_checkpoint_drain/1`; beginning a lease reports busy rather than discarding
accepted work. Lease-owned snapshots are allowed only from their owner thread.
Consequently the private IPC channel intentionally has one worker:
candidate prepare, proof, bind, commit, and activate requests must share the
same thread. It is not an HTTP pool and owns no sockets.
Material verification now checks the complete SourcePack authority/revision DTO
under that lease, not just the semantic selections. Candidate prepare acquires
its lease before this verification and releases it on failure.

Candidate startup uses `swipl -q -f none -x IMAGE -- --checkpoint-candidate REQUEST`.
The image already contains a dormant-mode fence. An early `initialization(...,restore)`
hook reinstalls guards on SWI socket creation/binding/listening/connect/send
boundaries before application restore hooks. SWI reloads foreign predicates on
restore, so merely saving `prolog_wrap` wrappers is **not sufficient**.
The mode module is the builder's first application import. A real qsave test
checks refused socket and HTTP calls from a later restore initializer.
The controlled `resume_entry/0` selects candidate mode before rebuilding native handles/index
registrations from restored clauses, then invokes candidate hooks. It does not
call `main`, reload the corpus, run agent startup, or inherit an HTTP worker's stack.
The serving fence is released only for ordinary selected startup after restoration,
or an authenticated explicit promotion command after old-port release. A candidate
cannot enter the ordinary resume path.

## Windows launcher: handle isolation is mandatory

Supply multifile:

```prolog
kb_checkpoint:launch_hook(Executable,Arguments,OwnedRunDirectory,ActualChildPID).
```

The production Windows launcher must create a **fresh visible console** with
fresh standard handles and must not inherit the old process's sockets, raw
console handles, queues, or locks. `process_create(...,window(true))` is NOT a
guarantee of `CREATE_NEW_CONSOLE`: SWI documents it as controlling
`CREATE_NO_WINDOW`. Use a native owned launcher with `CREATE_NEW_CONSOLE` and
`bInheritHandles=FALSE`, or a deliberately restricted handle whitelist.
The dedicated `kb_console_launch` adapter exposes `launch_new_console/4` and
`process_control/4`; `kb_checkpoint_host` delegates its hooks to these APIs.
`kb_interactive_control:os_shell/0` intentionally shares the existing console
and is not an acceptable candidate launcher.

For the dedicated fresh-console adapter, use `CreateProcessW` with a separate
absolute `lpApplicationName`, Windows CRT quoting of each argv element, and no
`STARTF_USESTDHANDLES`: never forward the old scanner's standard handles. Do not
construct a `cmd /c start` command string. If the old process belongs to a
kill-on-close Windows job, independent candidate survival also requires
`CREATE_BREAKAWAY_FROM_JOB` where permitted. A denying job policy is an explicit
launch failure, not permission to silently retain the inherited job. The native
adapter must retain and reap its own process handle through `process_hook/4`.

This is not merely cosmetic: isolated testing on SWI 10.1.7/x64 Windows found
that launching the long-lived candidate with ordinary SWI `process_create/3`
kept old listener sockets alive after the old listener stopped. New connections
then hung on a socket with no accepting Prolog thread. An isolated Python
controller using `subprocess.Popen(close_fds=True)` eliminated this failure.
The older test controller is not a production visible-console implementation;
the current native integration runner uses the real adapter instead.

If a native launcher does not register its child with SWI's process library,
also supply multifile `process_hook/4`:

* `process_hook(wait,PID,TimeoutSeconds,exit(Code))` or `timeout`.
* `process_hook(terminate,PID,none,done)`.
* `process_hook(release,PID,none,done)` closes only the owned native handle.

Retain a native process handle/ownership record, not just a reusable PID.
Operate only on children actually created by that launcher. Without such hooks,
the coordinator uses SWI's tracked-child `process_wait/3` and `process_kill/2`.
There is deliberately no arbitrary-PID fallback.
When custom process hooks exist, all three operations must be supported; hook
failure never falls through to SWI PID operations. Wait retains native ownership
across repeated terminal polls. Cancellation/failed-trial cleanup calls release
only after confirmed exit and successful owned-artifact removal, atomically
clearing the run's PID so repeated cancellation cannot release another process.
For ordinary SWI-owned children release is a no-op after their terminal wait.
Promoted candidates are never killed by this cleanup path. After verified
activation, the coordinator releases its candidate process handle **before**
requesting old-instance retirement, without stopping the replacement. The PID
remains instance-identity metadata only. Retirement hooks must not release that
same handle themselves.
The clean-builder guard also calls the launcher's read-only
`launcher_snapshot_safe/0` when loaded, without forcing DLL initialization.

## Identity, control, and state machine

Run requests/readiness live under the controlled
`saved-states/runs/UUID/` directory. Run and IPC directories have owner-only native
Windows ACLs (0700 on Unix); reparse ancestors are refused. The launch request is deleted
after consumption. Successful states are independent immutable `s-UUID` images.

A private file mailbox extends the existing request/readiness IPC. There is no
temporary, control, health or recovery HTTP listener, including in the old owner.
Messages are bounded JSON, atomically published under owner-only directories;
the serialized worker accepts a closed action set and requires an instance UUID
plus a random capability. This is local same-user IPC, not a network protocol.
Every accepted command consumes/rotates the capability. The bounded replay cache
returns the exact previous response for an identical request; the same request
ID with changed content/capability is rejected. `control_call/5` uses credentials
`{instance,mailbox,token}`; paths/capabilities never enter browser responses.
Do not expose this private protocol as the
Settings API or persist its credentials into a checkpoint.

Trial proves launched PID, candidate/owner/run/checkpoint identity and nonce,
full snapshot digest, generation, concrete manifest, counts, query/provenance
probe, empty listener profiles, and nonserving runtime state.
Only after explicitly approved promotion do checks cover canonical HTML,
directly linked CSS/JavaScript MIME/status, and HTTP API data.
Every public-port probe also checks the nonce-bearing instance UUID: matching
KB counts alone cannot distinguish the old process from its replacement.

Promotion order:

1. Recheck material state/configuration and all required capabilities.
2. Acquire old and candidate drain leases.
3. Stop only old owned target listeners; retain old private control/process.
4. Explicitly authorize promotion, leave candidate mode, start fresh pools and bind
   original primary/extras. Debug startup waits until its old listener is released.
5. Verify canonical UI/assets/API and candidate UUID at every original port.
6. Replacement commits while retaining its admission lease.
7. Verify original-port identity again; no temporary listener ever existed.
8. Activate candidate admissions, mark promotion complete, and request old
   graceful retirement.

Failed binding first attempts a bounded old rebind. If successful, the failed
candidate is stopped and state becomes `rolled_back`. If the original port is
occupied, state becomes `recovery_required`; private control remains available
and no new recovery HTTP address is created. Release the conflicting owner and
repair the original binding explicitly. Foreign port occupants are never killed. A failed
final commit is recovery, not a success-shaped `promoted` result.

This is a controlled local handoff, not a distributed availability guarantee:
OS resource exhaustion, machine failure, or broken runtime hooks can require
operator recovery. Retain private control and do not retire the old
owned process before successful verification.

## Isolated integration proof

```powershell
$env:LOGOS_CHROME='C:\Program Files\Google\Chrome\Application\chrome.exe'
python prolog\ow_dr\tests\checkpoint_native_integration.py
python prolog\ow_dr\tests\saved_state_integration.py
swipl -q -f none -s prolog\ow_dr\tests\test_checkpoint_wiring.pl -s prolog\ow_dr\tests\test_checkpoint_pause.pl -g "run_tests([checkpoint_wiring,checkpoint_pause]),halt" -t "halt(1)"
node --test prolog\ow_dr\tests\checkpoints-ui.test.mjs
swipl -q -f none -s prolog\ow_dr\tests\test_checkpoint_nonserving.pl -g "(run_tests(checkpoint_nonserving)->halt(0);halt(1))"
```

Only disposable copied backend code, tiny fixtures, owned children, and ephemeral
loopback ports are used. No production checkpoint is created or tried.
The two Python harnesses explicitly authorize the c06 workflow only in their
copied policy module, with a checked test-directory boundary. The primary module
and policy document remain untouched; there is no production HTTP, environment
or saved-image opt-out. The separate pause tests retain the real production gate.

Native coverage includes two loaded files, actual qsave/new-process restore after
deleting original/cache/native inputs, busy-save refusal, an actual fresh Windows
console, deferred main scanner, trial cancellation, injected candidate binding failure
with old original-plus-extra rollback, successful takeover and old graceful exit,
native TVA preservation, another qsave after deleting its sidecar, and selected
next-start restore with explicit primary-port override and restored extra port.
Fault injection modifies only the disposable adapter copy; the launcher, native
listeners, process handles and rollback protocol are real.
Configured debug restoration is also exercised: custom limits survive, a trial
starts no debug listener or credentials, original-port activation generates fresh
credentials only after the old owner releases its listener, rollback recreates
the old service with its saved options and new credentials, and `--debug-off` is honored on
selected-image startup. Only the copied credential script's storage root is
redirected under the fixture; its private Windows ACL implementation is unchanged.
The harness requires one exact root-assignment anchor, substitutes a pre-created
absolute scratch directory using PowerShell single-quote escaping, and refuses
launch if that anchor changes. The copied script remains beside its source-module
path and uses a UTF-8 BOM for Windows PowerShell; production script bytes are untouched.
No token is returned by the test HTTP endpoint or serialized into image metadata.

The actual SWI controller is assigned to an owned kill-on-close job with
breakaway permission after its readiness handshake. Each native SWI candidate
must be outside that explicit job (other Windows compatibility jobs are allowed).
After takeover, closing the controller's job must leave the candidate serving.
Exact child process handles are retained for terminal cleanup.

The PL-Unit tests independently cover metadata/IDs/sharing/mutability, corrupt or
incomplete images, catalog revisions/native locks, selection/CLI overrides,
empty KB, cancellation, utility integrity, annotation drift, retention integrity,
SUMO/dialect exclusions, source-free origin classification, imported metadata
helper exclusion, HTTP origin/consent checks and operation admission.
The native harness drives the actual full application's Runtime Settings page in
Chrome to create its first image through the real HTTP API. It verifies desktop/
mobile navigation, runs a real private-IPC trial query, and rejects a same-content
SourcePack revision change. Windows IPv4/IPv6 TCP and UDP ownership tables are
sampled throughout startup/trial: the candidate has **zero endpoints before approval**
while original HTTP remains available. Separate real-socket tests retain mounted
mutation-fence coverage for the approved promotion interval. The
standalone Chrome fixture additionally covers escaped names, paused controls,
operation-specific status and default-off promotion consent.
The final nonserving native run passed in **166.055 seconds**, including missing-sidecar
repeat save and selected restart through `app.pl`. Earlier native shutdown
failures remain historical observations, not a claimed diagnosis of every
Windows termination path.
The frozen-copy backend/API suite passed **37/37**, the private-IPC and real-qsave
early-fence suite **5/5**, and the Chrome component suite **2/2**. The native
runner also passed its 24-case copied-host/API/wiring preflight.

The older `checkpoint_integration.py` entry now delegates to the actual native
workflow. Its superseded temporary-HTTP surrogate host has been retired.
