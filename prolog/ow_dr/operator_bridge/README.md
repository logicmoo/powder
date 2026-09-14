# Independent Copilot + Codex operator bridge

This directory owns a Python process, isolated embedded operator views and a
standalone recovery view, **not a Prolog job**.
It does not alter the existing pools, loader, application server, Teacher,
Symbolic agent, source corpus, or shared registries.

**Current state:** authenticated transport, durable journals, embedded/recovery views and
separate native adapters are implemented. Real **protocol health only** passed for
Copilot CLI **1.0.82** with Python SDK **1.0.13**, and Codex CLI **0.149.0**.
Native session/turn/permission behavior is covered with explicit fake SDK/protocol
fixtures, not real model activity. No real session, thread, prompt, code edit or
production bridge activation was used to demonstrate this stage.

## Install and authorized activation

Python 3.11+, project-local `aiohttp` and the pinned official Copilot SDK:

```powershell
python -m venv prolog\ow_dr\operator_bridge\.venv
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m pip install -r prolog\ow_dr\operator_bridge\requirements.txt
```

Only after the coordinator freezes the integrated release and the user
authorizes this specific start:

```powershell
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m prolog.ow_dr.operator_bridge.launch
```

The Windows launcher requests `CREATE_NEW_CONSOLE`,
`CREATE_BREAKAWAY_FROM_JOB`, `close_fds=True` and a separate process. Denied
breakaway is a launch failure, not permission to inherit the old job. It is not
called by Prolog. Visible native-console activation remains unverified until an
authorized start; automated tests do not open a real operator console.

In that console, enter a local pairing phrase of at least 16 characters.
It is neither a GitHub token nor a password, is never printed, and is not written
to the journal. Pair through the native HTML form at
`http://operator.localhost:8063/`. The form contains no credential-handling JS.
The dedicated `.localhost` name is resolved to loopback by supported browsers;
do not modify system DNS/hosts or substitute the Prolog application's hostname.

`python -m prolog.ow_dr.operator_bridge --help` is safe: no listener, CLI,
authentication prompt or model task is started.

### Noninteractive activation boundary

Default activation still obtains the phrase from the bridge's private native
console. A non-private `getpass` fallback now fails rather than echoing input.
If the user is absent and no phrase has been securely provisioned, leave that
console waiting; **do not claim the HTTP bridge is ready**, invent a known
password, write a phrase to an unguarded file, or expose it in a tool log.

An explicitly trusted OS launcher may instead launch
`python -m prolog.ow_dr.operator_bridge --pairing-stdin` with a private inherited
stdin pipe. Supply exactly one UTF-8 line containing a 16–1024 character local
phrase, then close the pipe. TTY input, empty/unterminated input, invalid UTF-8,
and oversized input fail closed. This pipe mode never accepts a redirected regular file. The phrase is not
accepted in argv, environment variables or URLs, and is never printed. The launcher must obtain/retain it
securely for the human; generating a secret nobody can recover does not complete
pairing. Browser/main-Prolog code must never provide or receive that pipe.

`launch.py` intentionally refuses `--pairing-stdin`: its console-only handle
inheritance is not a secret pipe. A trusted direct launcher must explicitly own
its pipe and process creation flags. Reading the phrase only permits bridge
pairing; idle HTTP startup still creates **zero native sessions or prompts**.
This option was validated with synthetic input only, not production activation.

#### Explicit owner-private pairing file (Windows)

When the human has authorized persistent local provisioning, a trusted host
launcher may use:

```powershell
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m prolog.ow_dr.operator_bridge.launch --pairing-file prolog\ow_dr\operator_bridge\.state\pairing.txt
```

Only the path enters argv, never the phrase. Console `getpass` remains the default;
`--pairing-file` and `--pairing-stdin` are mutually exclusive. The file is an
explicit exception to non-persistent phrase provisioning, **not** permission to
persist browser/session capabilities.

Provision with a cryptographic random generator and exclusive file creation
inside the operator's already owner-private `.state`. The existing
`security.private_directory` helper establishes its protected owner/SYSTEM
inheritable DACL before any secret is written. Do not write a secret into a
permissive file and fix permissions afterward. The user reads this local file
through their OS, then enters the phrase **inside the operator iframe**; no
browser/main-Prolog endpoint reads it. Never paste its contents into tool output,
logs, main configuration, assets, URLs or commits.

The native reader:

* permits only descendants of this installed operator's `.state`, rejecting
  traversal, alternate streams and ambiguous trailing-dot/space paths;
* rejects symlinks/junctions/reparse points throughout the path ancestry, then
  verifies opened handles' final native paths;
* checks the owner is the current user and all allowing DACL entries are only
  that user, SYSTEM or OWNER RIGHTS, on `.state`, intermediate directories and
  the file; absent/broad/unsupported ACLs fail closed rather than being repaired;
* holds private directory/file handles without write/delete sharing while
  reading, rejects hard links, directories and files larger than 4098 bytes;
* accepts one UTF-8 phrase (16–1024 characters), optionally terminated by one
  newline, rejects embedded NUL/newlines, and never outputs the contents.

This file mode is Windows-only; unsupported platforms fail closed. No state
directory, phrase file or ACL is recreated/repaired by the reader. The validated
default `.state` ACL is not rewritten during this startup path. The existing
native instance lock still prevents a second owner. Before any provisioning or
launch, the coordinator must preserve an already healthy bridge/state; do not
replace its phrase or rotate its credentials merely to start another process.
An authorized unattended start is possible only after valid private provisioning.
Authentication/native availability must still be observed, never inferred.
No operator/model Start is performed by this mode.

Optional host settings: `--copilot-bin=PATH`, `--codex-bin=PATH`,
`--copilot-model=ID`, `--codex-model=ID`, and `--offline` for recovery-only mode.
Models remain independent of the Teacher and one another; omission uses that
provider's native default. No SDK-bundled CLI, global installer, automatic
download, login endpoint or global PATH change is used.

## Two operators, one bridge

One Python resident hosts two independent `OperatorService` actors:

* **Copilot operator** — provider `copilot`.
* **Codex operator — Maintain code, inspect failures and manage services** —
  provider `codex` (this exact role label is returned by the API).

Each actor has its own native session/thread identifier, adapter/authentication
state, owned CLI PID list, journal, command queue, history, draft, pending
permissions and cancellation routing. The old `.state/operator.sqlite3`
remains the Copilot journal; `.state/codex.sqlite3` is separate. A provider cannot
open another provider's journal or be assigned its native adapter. Native
authentication is provider-owned: there is no sharing of Copilot credentials,
models or protocol assumptions with Codex. The common local pairing cookie
authenticates the **human to the bridge**, not either native provider account.

### Chat-first, multiple durable conversations

Both embedded and standalone views have a **Conversation** dropdown with **New
conversation…** and previous conversations, a composer with **Send** when idle
or **Enqueue** while work is pending, **Say something**, **Interrupt**, and a
**Settings** toggle. Say something explicitly submits a normal, innocuous prompt
asking the selected native agent to reply first without tools or file actions.
It is not draft insertion or a canned client-side answer. While busy its label is
**Enqueue reply** and it uses the same real FIFO, auth, native permissions,
conversation binding and request idempotence as Send—including Start anyway
when a second provider must start.

Say something is disabled while any draft text is present. Its separate preset
request never replaces or clears a draft typed while the request is in flight.
Page load, selection, reconnect and clocks never invoke it. Tests use only the
synthetic SDK/stdio fixtures, not live provider/model calls.
Empty/disconnected Send and inactive Interrupt controls are
visibly disabled, including on hover. Settings contains model
selection, explicit native Start/resume, status/identity, command controls,
recorded events and Stop. Pending native permissions remain visible **outside**
collapsed Settings. The main transcript shows human/assistant messages and
failed/unknown/cancelled outcomes, not routine native bookkeeping.

Transcript messages show their durable `events.created` timestamp in the
browser's local time zone. Human messages also show **time since sent**, anchored
to the recorded `command.accepted` event—not the click, page load or replay time.
It includes queue/permission wait and completed-message age; it is **not** model
execution time. Assistant/outcome timestamps identify when their events were
recorded. Missing/invalid timestamps and a local clock earlier than the recorded
send time are shown as unavailable, never invented or negative durations.

Elapsed labels update locally while visible. Updates pause for a hidden browser
tab, inactive parent chip, hidden paired view or page departure, then catch up
from the same original timestamp. The timer makes no API calls, changes no
commands/journal entries and adds nothing to the parent message contract.
This display-only update needs refreshed frame assets when the owner permits;
it neither requires nor performs a backend restart.

Each provider's original SQLite journal remains at its original path, retaining
its UUID, history, draft and native identity. An additive `conversation_catalog`
table and selected-ID/revision metadata live in that journal. New conversation
journals are created exclusively under
`.state\conversations\<provider>\<conversation-UUID>.sqlite3` (relative to the
configured state directory). No journal is moved, deleted or reset. Up to 500
conversations per provider are retained. New conversations inherit the selected
conversation's model setting, but have independent transcripts, drafts,
commands, permissions and native session/thread identifiers. Titles default to
numbered conversation labels, never private prompt previews.

New/Previous changes only app selection and, when necessary, detaches an idle
Copilot SDK session. Codex's previous durable idle thread stays on its native
server: no speculative unsubscribe RPC is sent. The native runtime may remain
idle and owned. Opening history never creates/resumes a native session and never
replays a command. Explicit **Send** may start/resume the selected native
conversation and then send that one prompt. Explicit Start only starts/resumes.
Copilot resume retains `continue_pending_work=False`; Codex validates
`thread/read` before `thread/resume`. Duplicate native IDs across conversations
are rejected before any prompt is dispatched. Provider-native account login is
still independent; configured models do not imply access.

Selection/settings changes are serialized with command admission, cancel and
Stop. Queued/running work, pending permissions and unresolved native outcomes
gate switching with `409 conversation_busy`. Finish/cancel the command or
explicitly stop a confirmed owned native runtime first. Interrupted journals
remain unknown after restart; an explicit verified resume can establish a safe
idle session without replaying work. An unconfirmed creation or unowned unknown
native process may require host inspection; the bridge does not invent a
replacement thread or assert that a no-op Stop resolved external work.

#### Conversation API (operator origin only)

Use `/api/operators/{provider}` with the existing standalone cookie, or
`/embed/api/{provider}` with the existing frame-only capability. The parent
iframe protocol and `createOperatorAgent` interface are unchanged.

| Suffix | Standalone method | Payload / result |
|---|---|---|
| `/conversations` | GET | `{provider,conversationId,selectionRevision,items:[{id,title,created}]}` |
| `/conversations/new` | POST | `{conversationId,id:<fresh UUID>,title?}`; creates and selects without native work |
| `/conversations/select` | POST | `{conversationId,id:<existing UUID>}` |
| `/conversations/branch` | POST | `{conversationId,id:<fresh UUID>,startAnyway?:boolean}`; native Codex fork, then select |
| `/settings` | GET / POST | Read settings; write `{conversationId,model:<native ID or null>}` |
| `/draft` | GET / POST | Read draft; write `{conversationId,text}` |

Embedded reads remain own-origin POSTs: `/conversations`, `/settings/read`,
`/draft/read`, `/status`. Every mutating conversation request—including commands,
permissions, cancellation, Stop and drafts—**requires `conversationId` matching
the selected app conversation**, never a native session ID. Missing/stale/foreign
IDs return `409 conversation_changed` without dispatch. Logout revokes the
pairing, not a conversation. Command IDs are idempotent within
`(provider,conversationId,id)`; the same identifier in another conversation
cannot route an old request there. Explicit Send uses
`{conversationId,id,kind:"prompt",text,startIfNeeded:true}`. The existing
two-provider warning applies to this startup path too: explicit **Start anyway**
resubmits the same identifier with `startAnyway:true`, never grants permissions.

Enqueue uses the existing command FIFO and exact same idempotent prompt endpoint;
it does not start a parallel turn or silently interrupt existing work. Status
adds `workPending:boolean` and `activeCommandId:string|null` inside the operator
origin only. **Interrupt** captures that command ID plus the selected conversation
and calls `/commands/{id}/cancel`; it does not stop the provider or remove queued
messages. Dispatch of the next FIFO item waits for the previous interrupt
acknowledgement, and native adapters retain the interrupted turn's own completion
future. Interrupt during startup suppresses the pending prompt. Unknown native
outcomes are reported, not interpreted as permission to replay.

Selection revisions prevent delayed read/stream responses from replacing a
newer conversation in the UI. Event cursors reset only when the selected
selection changes, including rapid A→B→A switches between output polls; durable
event watermarks remain per conversation. Standalone reconnect cursors include
the app conversation ID and selection revision so another selection's cursor
cannot suppress history. These are public identity fields, not credentials.
Complete embedded snapshots retain their 1 MiB serialized budget. Catalog reads
are separate, bounded by the 500-conversation/120-character-title limits.
Unflushed drafts also remain in frame-local memory by conversation when another
view changes selection; they never become a draft in the newly selected chat.
Explicit selection flushes the current draft before switching. Interrupted
exclusive creation files are retained, not overwritten or automatically deleted.

#### Native conversation branches

**Branch conversation** means a conversation fork at the latest idle native
history—not a Git branch, checkout or prompt replay. It is an explicit action
inside the operator frame; loading, reconnecting and selecting history cannot
fork. Source work/permissions/uncertain outcomes block it. Status exposes
`branch:{supported,ready,reason}` and `branchFrom` provenance only inside the
operator origin, never through parent messages.

Codex CLI **0.149.0** supports documented `thread/fork`. A branch has a different
native ID and confirmed `forkedFromId`; trusted CWD, durable/idle status and
untrusted/user/read-only policy are validated. We negotiate `experimentalApi:true`
for the pinned protocol's `excludeTurns:true` (bounded native response) and
`deferGoalContinuation:true` (no inherited-goal continuation until a later explicit
turn). This negotiates protocol fields, **not** permission grants. No `turn/start`
is issued by Branch. If the native runtime must be started while another provider
is active, the existing **Start anyway** warning applies before any fork.

Copilot SDK **1.0.13** exposes no public session-fork method. Its visibly disabled
Branch control explains this limitation. New/Previous and native resume work;
copying prompts or manipulating provider storage to imitate a fork is not offered.

The original journal remains unchanged apart from native lifecycle/safety
metadata. The branch journal receives an inert event-history snapshot with
`inheritedFrom:{conversationId,sequence}` per event, its own draft/model settings,
and `branchFrom:{conversationId,nativeSessionId,sequence,created}`. Executable
command records and pending permissions are **not** copied. Old permission IDs
cannot authorize new work. Native history is copied by the native protocol, not
reconstructed from browser messages. External native changes outside the bridge
are not mirrored into its app event journal.

Branch UUIDs are durable request identities. Completed retries reuse the existing
branch. A recorded incomplete/unknown attempt is retained and never automatically
retried or opened as a blank chat; host inspection may be required. A durable
source uncertainty marker precedes native dispatch, so interruption fails closed.
There is no branch-delete, rollback, arbitrary-turn boundary or automatic recovery
RPC. Original conversations remain selectable after successful branching.

Protocol review: [Codex pinned app-server documentation](https://github.com/openai/codex/blob/rust-v0.149.0/codex-rs/app-server/README.md),
[fork parameter definitions](https://github.com/openai/codex/blob/rust-v0.149.0/codex-rs/app-server-protocol/src/protocol/v2/thread.rs)
and [deferred goal implementation](https://github.com/openai/codex/blob/rust-v0.149.0/codex-rs/app-server/src/request_processors/thread_fork_goal.rs).
The stable generated schema omits experimental fields; the pinned Rust definitions
and processor were checked as well. Copilot capability was checked against the
installed public SDK interface; no unsupported RPC is guessed.

**Publication:** this revision requires an authorized Python bridge restart and
fresh pairing inside the operator view. Old clients without conversation IDs
fail closed. A browser refresh cannot reload Python modules. Do not restart a
live bridge with active work just to publish UI files; the coordinator owns
publication. This work did not inspect a production pairing file, restart the
existing 8063 bridge, or perform real native/model turns.

Validation for this stage: native SDK/stdio fixture tests exercise distinct
native IDs, New/Previous, restart/resume, draft/model persistence, idempotency,
cancel/permission routing, native forks and cancelled detach. Ten real Chromium scenarios
cover standalone and embedded chat, stale/delayed responses, Unicode replay,
permissions outside Settings, origin/window isolation, liveness recovery,
branch acknowledgement/provenance, FIFO Enqueue/Interrupt, and disabled styles
including hover/active, durable local clocks with visibility pause/resume, and
explicit native first replies with draft preservation and busy FIFO handling.
These are synthetic conversations, not evidence of a logged-in account or
successful real model inference.

Executable discovery is passive. Windows npm CMD/PowerShell shims are resolved
through the installed official package metadata to their native `.exe`; shims
are never passed to Win32 `Popen` or a shell. Missing/ambiguous installations
remain unavailable. Before an explicit native action, `protocolVerified` is false;
discovery and SDK import do not start a CLI. Start, Send startup and native Branch
verify the actual native `--version`,
not just npm package metadata, and rejects unvalidated versions. Authentication
stays native-CLI-managed; neither discovery nor protocol health proves account
or model access.

Both native process startup and each new/resumed session/thread must use
`C:\snet\PeTTa\repos\openworld_dr`, the trusted installed primary checkout.
Browser `cwd`, workspace, executable and provider override fields are rejected.
The internal adapter receives a mandatory server-owned `cwd` and must return
verified `processCwd` and session/thread `cwd`; mismatches or missing evidence
leave an unknown outcome, disconnected actor and **no prompt dispatch**.
Native metadata is checked before resume and after creation/resume. Remote,
foreign-repository, foreign-branch or unverified contexts fail closed; Codex
additionally requires an idle durable thread.
No checkout or worktree action is performed by this guard.

Starting a second actor while another is active/pending returns
`409 operator_conflict`, including `conflicts`, `requiresConfirmation:true` and
`allowedWithConfirmation:true`. The recovery view recommends one at a time and
offers **Start anyway**. Re-submit the same start identifier with
`startAnyway:true` to proceed. This does not kill the first actor or grant any
native permission. A short admission lock prevents two simultaneous start
requests from both missing the warning; it does **not** serialize their native
execution, reserve the workspace exclusively or prohibit running both.

Concurrent editing is **not race-proof**. Both actors share the same checkout;
external editors/operators are not tracked. Proposed file writes are hashed
before human review and checked again before approval; changed files are denied.
This bounded optimistic guard is not an atomic transaction or a guarantee against
changes after approval. Native edit safeguards still apply.

### Four-chip parent contract

The main app owns its four chips and is not modified here:

| Chip | Type / provider | State and input boundary |
|---|---|---|
| Teacher / LLM | existing teacher | Separate model: `gpt-5.6-sol` / 8801 |
| Symbolic / Cyc-only | existing non-LLM symbolic agent | Cannot invoke an operator |
| Copilot operator | `agentType:"operator"`, `provider:"copilot"` | Copilot-only session, draft, permissions and output |
| Codex operator | `agentType:"operator"`, `provider:"codex"` | Codex-only session, draft, permissions and output |

`GET /api/operators` returns both statuses with one bridge instance/PID and
independent conversation IDs. Each status includes `provider`, exact `role`,
`workspace`, `outputSource`, `nativeSessionId`, adapter/auth-discovery state,
owned PID list, command state and permissions. `sdkSessionId` remains only a
legacy Copilot alias; it is null for Codex and implies no shared protocol.

Use `/api/operators/{provider}/status`, `/commands`, `/commands/{id}`,
`/commands/{id}/cancel`, `/permissions/{id}`, `/draft` and `/stop`, with the same
request bodies as below. Streams are `/events/{provider}?since=N`; every frame
tags its provider. Numeric sequences are **per conversation**, never global.
Legacy unscoped endpoints remain Copilot-only compatibility aliases.

The main four-chip workspace embeds `/embed?provider=copilot` and
`/embed?provider=codex` on the isolated operator origin. It must keep each frame
mounted while switching chips. The independent recovery view still selects
`/?provider=copilot` or `/?provider=codex` **only for standalone recovery**.
Drafts and histories live in their respective journals across refresh.

Load `web/operator-agent.css` and import `createOperatorAgent` from
`web/operator-agent.js` in the main application's existing asset path:

```javascript
const view = createOperatorAgent(host, {
  provider: 'copilot', active: true, signal,
  bridgeURL: descriptor.bridgeURL, // e.g. http://operator.localhost:8063
  onStateChange({status, conversationId, sequence, error, unread}) { /* update that chip only */ },
});
view.activate();   // first activation loads the frame; then visibility lifecycle only
view.deactivate(); // does not unmount, stop, send, cancel or decide permissions
view.getState();   // fields above, plus provider and connected
view.destroy();    // closes/removes only this view and revokes its pairing
```

`bridgeURL` is required and owned by the host descriptor; the controller appends
`/embed` to its exact trusted origin (an explicit `/embed` URL is also accepted).
Ports must be 1024–65535. The bridge's default port also honors the deployment
environment's `POWDER_OPERATOR_PORT`; explicit `--port` takes precedence.
A controller created
with `active:false` reports `status:"not_loaded"` and does not navigate the iframe
until its first explicit `activate()`. The `signal` is the application/controller
lifetime, never a route lifetime. Switching chips or routes retains the frame.
Bounded output streaming continues while inactive; reactivation clears that
provider's unread count and receives the next current snapshot within the
750 ms heartbeat. No models or operators start from lifecycle operations.

The safe `conversationId` is the bridge journal's opaque UUID, **never a native
session/thread identifier**. `sequence` is the durable journal event watermark,
a nonnegative monotonic integer per conversation; it does not increase for
ordinary polling, pairing or chip activation. The controller retains the last
known identity/watermark while temporarily unpaired and rejects regressions
within one conversation. `error` is null or a fixed transport/pairing error,
never native output. Parent callbacks run only for changes in projected state.
Operator drafts, transcripts, provider model settings and permission controls
remain inside the privileged operator container/journal, not parent storage.

Configure the bridge's `--parent-origin=http://localhost:3050` to the **exact**
main-workspace origin (scheme, hostname, port; no path, wildcard or trailing
slash). This is also the default. A host-owned main configuration endpoint may
provide the fixed operator origin; it must never proxy operator APIs or
receive pairing phrases, session cookies or frame capabilities. The iframe is
sandboxed with only `allow-scripts allow-same-origin allow-forms`. Its CSP allows
only the configured ancestor. No popups or top navigation are enabled.

#### Display-only postMessage protocol

All messages have `channel:"powder.operator.embed.v1"`, the fixed `provider`, and
a random per-document `nonce` (a **public handshake challenge**, not authority).
The frame sends `{type:"hello",nonce,provider,channel}` to the exact configured
parent origin. The parent replies with those fields plus
`type:"bind",active:boolean,probe:UUID`. Later parent messages may use only
`type:"lifecycle",active:boolean,probe:UUID`. All keys and types must match exactly.
`probe` is another public liveness challenge, never a credential. It is refreshed
on iframe document load and activation, and the child echoes it in status.

Both directions check the exact Origin **and** source WindowProxy. The child
requires its direct parent, not a sibling or nested owner. Parent status frames
add only `type:"state",revision,status,connected,unread,conversationId,sequence,error,probe`; revisions strictly
increase for that document challenge. Unknown fields/types, stale revisions,
other providers, windows and origins are ignored. Status values are bounded to
`pairing`, `disconnected`, `offline`, `idle`, `busy`, `awaiting_permission`;
unread is an integer from 0–999. Parent messages have no command, text, URL,
permission, model, credential or arbitrary dispatch interface.

A hello alone does not complete the host watchdog: a valid status must echo the
current probe. A replacement document (including a failed native pairing POST)
and reactivation re-arm the ten-second watchdog. If no matching response arrives,
the parent shows **Retry view connection** again. A stale response from the prior
document cannot hide this recovery action. Retry navigates only the descriptor's
fixed `/embed` URL; it neither authenticates nor starts an operator.

All Start/Send/Cancel/Stop/permission interactions are authored inside the
operator-origin document. A new iframe, pairing, handshake, tab selection,
output replay or reconnect **never starts a native session or sends a prompt**.
Models and native authentication remain provider-owned CLI settings, visible
honestly in each frame's inspector; pairing does not prove model/account access.

Optional arguments: `--port`, `--project-root` (must remain this primary checkout
on `master`), `--state-dir` (only beneath this directory's `.state`).
An optional `--application-status-url
http://localhost:3050/swish/openworld_dr/api/status` is **read-only availability
monitoring**, not identity proof or restart authority. It follows no redirects,
uses no proxy/environment credentials, bounds responses to 1 MiB, and has a
two-second timeout. Slow status responses can be reported unavailable even if
the application process is still alive.

## Authentication and capability boundary

* Bind only `127.0.0.1`; accept exact `Host: operator.localhost:PORT`.
* Every mutation and WebSocket upgrade requires the exact own Origin.
  Foreign/null origins and cross-site API requests are rejected before parsing
  command bodies.
* Every standalone API/event request requires an opaque, host-only, HttpOnly,
  SameSite=Strict cookie. Tokens exist only in browser cookies and a hashed,
  expiring in-memory registry. They are not placed in URLs, JS, storage, logs or
  Git. Bridge restart invalidates browser authentication and requires re-pairing.
* The hostname separation matters: cookies are **not port-scoped**. Reusing
  `localhost` for Prolog and the bridge could disclose operator cookies to the
  Prolog server. Do not add the Prolog Origin to this bridge's allowlist.
* Standalone recovery remains top-level (`frame-ancestors 'none'`, X-Frame-Options
  DENY). Only `/embed` and its native form response permit the configured parent.
  Document `Referrer-Policy: same-origin` preserves the exact native form Origin
  in Chromium (which otherwise sends `Origin:null` under `no-referrer`); it sends
  no cross-origin referrers. Origin/Host checks are not relaxed.
* HTTP loopback is not remote TLS. This is a browser/agent-origin boundary, not
  a defense against malicious code already running as the same OS user.
* State directories receive a protected Windows owner/SYSTEM ACL (0700 on
  Unix); a native nonblocking lock prevents duplicate owners of one directory.
  No credentials are serialized. Operator text/drafts are private local data:
  recognized token/private-key patterns are redacted, but redaction is **not**
  a universal secret detector. Never paste credentials into prompts.
* SDK authentication objects, raw exceptions and unrestricted SDK event payloads
  are not forwarded. Adapters supply only the bounded,
  reviewed output/permission projection. Oversized or redacted permission
  details are denied rather than asking a user to approve an incomplete view.

### Cross-site frame authentication without weakening Strict cookies

`localhost` and `operator.localhost` are cross-site. The embedded view **does
not depend on third-party or partitioned cookies**, and does not downgrade the
standalone SameSite=Strict cookie. Its native HTML form posts the human-entered
phrase directly to `/embed/login` on the operator origin. A separate,
provider-scoped 384-bit random capability is returned inside that frame's
no-store document. Operator-origin JS removes the bootstrap element and retains
the capability in a closure only. It is never posted to the parent, put in a
URL/browser storage, journaled or logged. There is no provider login/token form.

The server stores only its hash, provider, expiry and stream ownership. It
expires after 12 hours (or the configured auth lifetime); an unclaimed capability
expires after 30 seconds. One output stream owns each capability. Requests use
`credentials:"omit"` and the `X-Operator-Embed` header on **own-Origin POSTs**
under `/embed/api/{provider}`. Existing cookies cannot authorize those routes;
frame capabilities cannot authorize standalone routes or another provider.
No CORS headers are provided, including to the allowed framing parent.

The output-only `POST .../events` accepts `{since:N}` and streams NDJSON
snapshots, never commands. Each snapshot contains the provider's status and
bounded sequenced journal output inside the frame.

The **complete UTF-8 serialized snapshot**, including JSON syntax, status,
commands, permissions, event data and final newline, is capped at **1 MiB**.
Unicode is not needlessly ASCII-escaped. The embedded status projection sends
15 recent command identifiers/states without unused prompt previews, bounded
display metadata (long scalar text is explicitly marked clipped), and at most
16 **complete** permission requests within a 256 KiB permission budget.
Omitted permissions are explicitly reported and never partially shown as
approvable requests; resolving visible requests makes room for subsequent ones.
Events are paged using the last event actually sent. An individually oversized
transcript event gets an explicit display-only omission marker so replay can
advance, while its full content stays in the journal. Journal history, command
previews, idempotency digests and native permission data are never rewritten.
The receiver checks each NDJSON line independently, including when network
chunks contain multiple complete snapshots.

Start/Send/Cancel/permissions
use the same native service/adapters as standalone recovery. Revocation detaches
the principal immediately; stream close/failure revokes and detaches when
observed (normally within the 750 ms output heartbeat, bounded writes at 5 s).
Unpair, page navigation and frame destruction also send a best-effort revocation.
Bridge shutdown/restart invalidates every frame capability. Queued commands
require their **own author** still connected when dispatched; another view
cannot keep a revoked author's queued input alive. Already-dispatched native
work is not falsely reported cancelled; permissions remain pending without
automatic approval. Re-pairing reads durable output/drafts without resending.

The frame shows an explicit **Pair again** recovery action on disconnection
rather than silently recycling capabilities. Chip deactivation leaves output
connected and the provider draft intact. The configured parent is trusted to
display the frame honestly (a malicious allowlisted parent can visually
clickjack any embeddable UI); it still receives no operator command authority.

## Public HTTP / event interface

All standalone `/api/*` paths below require the cookie; POSTs also require the exact Origin.

| Interface | Meaning |
|---|---|
| `GET /` | Independent pairing or recovery HTML |
| `POST /login` | Native form pairing; rate-limited, returns cookie/303 |
| `GET /api/status` | Operator/bridge/workspace/session/command/permission state |
| `POST /api/commands` | `{conversationId,id,kind:"start_session"|"prompt",text?,startIfNeeded?}` |
| `GET /api/commands/{id}` | Inspect a possibly interrupted command; never rerun it |
| `POST /api/commands/{id}/cancel` | Explicit cancellation request, `{conversationId}` |
| `POST /api/permissions/{id}` | `{conversationId,decision:"allow"|"deny"}` for one live request |
| `GET /api/draft`, `POST /api/draft` | Operator-only persistent draft, `{conversationId,text}` |
| `POST /api/operator/stop` | `{conversationId,confirmation:"STOP OPERATOR"}`; explicit adapter stop |
| `POST /api/logout` | Revoke this browser's capability, `{}` |
| `WS /events?since=N` | Authenticated **output-only** sequenced replay |

WebSocket messages are `{type:"status",data:...}` and
`{type:"events",conversationId,selectionRevision,events:[{sequence,created,kind,data}],lastSequence,latestSequence}`.
Incoming WS text/binary frames close the connection with code 1008. There is no
WebSocket shell, command replay, or model-send-on-connect.

Each provider status uses `schema:"powder.operator.v1"`, `agentType:"operator"`,
its exact provider role as `name`, and `state` of `offline`, `idle`, `busy` or
`awaiting_permission`. `bridge.online` is separate from application availability
and adapter connectivity. Clients add reconnecting/unread presentation using
their own observed sequence. Recent command lists are capped at 100; event
pages at 200 and approximately 512 KiB of payload. The page keeps at most 1,000 rendered events; the full journal
remains available by sequence. No automatic history pruning changes idempotency
records.

## Durability and dispatch

Both provider journals use WAL and synchronous FULL transactions. Each stores:

* primary workspace/root/branch identity and bridge process instance;
* an independent conversation UUID and the provider-native session/thread ID, once known;
* sequenced redacted output, bounded command previews, full redacted prompt
  events, an input digest, pending permission state, and the operator draft.

Commands are accepted durably **before** dispatch. One worker serializes native
operations. A repeated identifier with identical input returns existing state;
different input is a conflict. Accepted queue capacity is 20. No application
restart, query, source edit, arbitrary process kill or generic shell endpoint
exists.

On bridge restart every queued/running/awaiting-permission record becomes
`unknown`; pending native callbacks become `interrupted`. Nothing is
automatically resubmitted. A timeout/transport error is an unknown outcome, not
evidence of failure before execution. Clients query command status. The page
retains an uncertain request's identifier for any explicit retry of unchanged
input; reconnect itself only reads output.

Permissions pause while disconnected. Only an authenticated connected operator
can resolve one live callback; duplicate identical decisions are harmless.
Interrupted callbacks are not resumable. A cancellation is marked cancelled
only when the adapter confirms it (queued cancellation is known before
dispatch); otherwise it is unknown. Explicit stop denies pending permissions,
cancels queued input, and asks only the owned adapter to stop. A stop exception
is reported as an unknown native outcome, not successful termination; repeated
stop requests do not repeat native operations. After a **confirmed** stop, explicit
Start creates a fresh adapter and resumes only that provider's saved identity;
it does not restart the bridge or the other provider. Unknown stops cannot be
automatically retried or replaced. Closing the
browser or Prolog does not stop that adapter. The bridge does not claim it can
preserve in-flight native execution across its own OS/process crash.

Workspace identity is checked before dispatch and permission decisions. It is
not a sandbox for a human-approved native command; the adapter must preserve
the primary working directory and expose native permissions without auto-allow.

## Implemented native contracts

`OperatorAdapter` remains an internal seam, not a common external RPC scheme.

### Copilot

The **installed, pinned 1.0.13** Python API uses
`CopilotClient(connection=RuntimeConnection.for_stdio(path=EXE),
working_directory=ROOT)`. Older `CopilotClient({"cli_path": ...})` examples are
not used. Both create/resume pass `working_directory=ROOT`. Named session IDs
are journaled before creation; resume uses `continue_pending_work=False`.
`get_session_metadata` checks native context without scanning all conversations.
Events are received through the SDK's `on_event` session handler.

The permission callback waits for the paired human and returns only
`PermissionDecisionApproveOnce(approved_interactively=True)` or rejection.
Read/write/shell/URL requests are supported; managed approvals and unsupported
capabilities are rejected. There is no `approve_all`. File hooks, host-managed
Git operations and schedule management are disabled for these sessions.

Stop uses `session.disconnect()` (preserves history) and `client.stop()` on the
SDK-owned **stdio** runtime only. No `delete_session` operation exists. The
version-pinned `_cli_process` Popen handle is the sole private SDK adapter seam,
used to attach native process-tree ownership; no Copilot App internals are read.

### Codex

The installed native executable runs `app-server --listen stdio://` with private
pipes and explicit process cwd. `initialize` plus `initialized` completes before
thread methods. This implementation uses the official app-server protocol, not
a guessed Copilot RPC or an implicitly downloaded Python-SDK CLI.

`thread/start` requests durable `ephemeral:false`; resume uses `thread/read`
first, then the actual `threadId` and explicit cwd. The confirmed policy must be
`approvalPolicy:"untrusted"`, `approvalsReviewer:"user"`, and a read-only sandbox.
Every `turn/start` supplies its thread ID, text input, cwd and the same policy.
Only matching thread/turn events reach that provider's output.

Command and file-change approval requests pause for the human; responses permit
only the current request (`accept`), never session/persistent grants. File changes
must include the matching announced change set. Unsupported capability/profile
grants return no permissions; authentication refresh, elicitation and unknown
methods fail closed. `approvalPolicy:"never"` is not used and is not an
approve-all policy. Cancellation requires matching `turn/completed` evidence,
not merely a `turn/interrupt` acknowledgment.

### Ownership and genuine limits

On Windows each runtime is assigned its own native job before any thread/session
creation. Explicit Stop terminates only that owned tree; job-handle closure has
**no kill-on-close** policy. App restart never invokes this path. Persisted PID
records are observations, not authority to kill reused PIDs after bridge restart.
Only Windows process-tree behavior has been verified.

Native RPC operations are bounded; interrupted or unknown outcomes are not
resent. A diagnostic alone is not proof of native completion. Unknown native
work prevents further prompt dispatch. Pending permission callbacks expire when
their command or transport ends. Copilot named-create uncertainty is inspected
by that exact ID before resume. A lost Codex create response without a known
thread ID requires native inspection, not another automatic create.

Permission projections over 4 KiB, unsupported requests and unverifiable writes
are denied, not partially approved. The write-review guard is bounded to 32 files
of at most 8 MiB each. No full terminal/ConPTY surface is claimed: this is an
event-chat adapter with native permission prompts.

Actual create/resume/send permission flows and visible independent-console
activation still require an authorized interactive acceptance run. Real model
access has **not** been tested. Parent lifecycle registration remains pending:
an app restart button must stay unavailable until target instance/PID/generation
checks and the existing lifecycle API are agreed. Availability is not authority.

Official references used:
* [Copilot SDK local CLI](https://github.com/github/copilot-sdk/blob/main/docs/setup/local-cli.md)
* [Copilot Python client](https://github.com/github/copilot-sdk/blob/main/python/copilot/client.py)
* [Copilot Python session](https://github.com/github/copilot-sdk/blob/main/python/copilot/session.py)
* [Codex Python protocol client](https://github.com/openai/codex/blob/main/sdk/python/src/openai_codex/client.py)
* [Codex thread protocol](https://github.com/openai/codex/blob/main/codex-rs/app-server-protocol/src/protocol/v2/thread.rs)
* [Codex turn protocol](https://github.com/openai/codex/blob/main/codex-rs/app-server-protocol/src/protocol/v2/turn.rs)

Codex 0.149.0's own `app-server generate-json-schema` export was checked as well.
Experimental `historyMode` and permissions-profile fields from newer documents
are deliberately not sent to this pinned stable protocol.

## Validation

```powershell
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m unittest prolog.ow_dr.operator_bridge.tests.test_embed prolog.ow_dr.operator_bridge.tests.test_service prolog.ow_dr.operator_bridge.tests.test_http prolog.ow_dr.operator_bridge.tests.test_providers prolog.ow_dr.operator_bridge.tests.test_native_adapters
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m unittest prolog.ow_dr.operator_bridge.tests.test_pairing_input
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m unittest prolog.ow_dr.operator_bridge.tests.test_pairing_file
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m unittest prolog.ow_dr.operator_bridge.tests.test_projection
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m unittest prolog.ow_dr.operator_bridge.tests.test_conversations
node --test prolog\ow_dr\operator_bridge\tests\embed-browser.test.mjs
```

The embedded browser test launches a disposable localhost parent and
operator.localhost child on ephemeral ports. It uses the **real native adapter
classes** with the existing synthetic Copilot SDK and Codex stdio peers, never
real provider executables or model prompts. It verifies frame-native pairing
with third-party Strict cookies unavailable, zero native starts on pairing,
wrong parent/window/origin/message rejection, safe status-only messages,
provider-specific model settings/drafts/permissions, Start anyway, unpair/re-pair
replay, unread state, destruction, mobile/desktop overflow and standalone
HttpOnly Strict recovery pairing. Additional real Chromium regressions seed
100 completed 4096-character CJK prompts without native dispatch and verify
re-pair/replay, and interrupt native pairing navigation offline to verify that
the host's Retry returns and reconnects without native startup.
Set `LOGOS_CHROME` if Chromium is not installed
at the default Chrome path. Fixture files/profiles are removed on completion.

**Validated 2026-09-14:** the selected Python suites and three real Chromium
cross-site integration scenarios passed. No production bridge activation, real model
activity or live Prolog reload/restart was part of that validation.

The broader pre-existing suite also includes an isolated Prolog lifecycle test;
run it only when that additional fixture activity is desired:

```powershell
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m unittest discover -s prolog\ow_dr\operator_bridge\tests -t . -v
```

Tests use clearly named test-only fake adapters, isolated loopback HTTP/WS
servers, and owned files under `tests\.artifacts`. A real SWI-Prolog fixture is
started/stopped/restarted on ephemeral loopback ports while the same bridge,
operator conversation and test-native-session identity remain alive. It loads
no KBs. Only those created children are stopped. No production process, private
KB prompt, actual model request or source corpus is involved.

The embedded browser test now covers real HTTP asset, MIME, native-form and
cross-site authentication behavior. Operator events render as text, not HTML.

The dual-provider fixtures additionally prove warning-then-allow concurrency,
simultaneous-start admission, independent session/auth markers/history/drafts,
permission/cancellation isolation, provider-tagged output-only replay, passive
discovery, explicit new/resumed cwd and rejection of cross-repository native
contexts. They make no real model request or source edit.

The explicit native-health command starts only owned health runtimes, verifies
SDK/status or app-server initialize, then stops them:

```powershell
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m prolog.ow_dr.operator_bridge.tests.native_health
```

The verified run created **zero sessions/threads and sent zero prompts**.
When SWI-Prolog is available, it also starts, stops and restarts only the isolated
no-KB Prolog fixture while the same native runtime PID and transport stay alive.
All owned native PIDs exit after health cleanup.
Do not turn this health command into a demo model task or run it as an implicit
browser-connect/startup action.
