# Independent Copilot + Codex operator bridge — foundation

This directory owns a Python process and recovery view, **not a Prolog job**.
It does not alter the existing pools, loader, application UI, server, Teacher,
Symbolic agent, source corpus, or shared registries.

**Current state:** authenticated transport, durable journal, permission protocol,
recovery assets, native instance lock and an explicit independent launcher work.
Both production adapters are deliberately **unavailable**. There is no live Copilot
or Codex protocol integration in this stage; the fake adapters exist only in tests. No
model prompt, session creation, code edit or production process start was used
to demonstrate this foundation.

## Install and authorized activation

Python 3.11+ and one project-local HTTP dependency:

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

Executable discovery is passive `shutil.which("copilot"|"codex")`. Found paths,
`protocolVerified:false` and `authentication:"not_checked"` are shown explicitly;
discovery does not start a CLI, install anything, run a prompt or change auth.
Both executables were found on the development machine, but that does not prove
protocol compatibility or authentication.

Both native process startup and each new/resumed session/thread must use
`C:\snet\PeTTa\repos\openworld_dr`, the trusted installed primary checkout.
Browser `cwd`, workspace, executable and provider override fields are rejected.
The internal adapter receives a mandatory server-owned `cwd` and must return
verified `processCwd` and session/thread `cwd`; mismatches or missing evidence
leave an unknown outcome, disconnected actor and **no prompt dispatch**.
Actual SDK/process/thread enforcement remains to be implemented separately using
each documented native contract. No checkout, worktree or edit-overwrite action
is performed by this guard.

Starting a second actor while another is active/pending returns
`409 operator_conflict`, including `conflicts`, `requiresConfirmation:true` and
`allowedWithConfirmation:true`. The recovery view recommends one at a time and
offers **Start anyway**. Re-submit the same start identifier with
`startAnyway:true` to proceed. This does not kill the first actor or grant any
native permission. A short admission lock prevents two simultaneous start
requests from both missing the warning; it does **not** serialize their native
execution, reserve the workspace exclusively or prohibit running both.

Concurrent editing is **not race-proof**. Both actors share the same checkout;
external editors/operators are not tracked. SDK-supported optimistic edit
guards will require their actual documented APIs; none are invented here.

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
tags its provider. Numeric sequences are **per provider**, never global.
Legacy unscoped endpoints remain Copilot-only compatibility aliases.

The independent recovery view selects `/?provider=copilot` or
`/?provider=codex`. Drafts and histories live in their respective journals,
including across browser refresh. Parent chips can open those top-level views;
they must not copy operator authentication into teacher/symbolic JS or send
another chip's messages to these routes. Embedded UI/capability integration
remains subject to the hostname/origin boundary below.

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
* Every API/event request requires an opaque, host-only, HttpOnly,
  SameSite=Strict cookie. Tokens exist only in browser cookies and a hashed,
  expiring in-memory registry. They are not placed in URLs, JS, storage, logs or
  Git. Bridge restart invalidates browser authentication and requires re-pairing.
* The hostname separation matters: cookies are **not port-scoped**. Reusing
  `localhost` for Prolog and the bridge could disclose operator cookies to the
  Prolog server. Do not add the Prolog Origin to this bridge's allowlist.
* Recovery is deliberately top-level (`frame-ancestors 'none'`), not an iframe
  or cross-origin authenticated fetch surface. The parent Operator chip may
  open this view. Embedded integration requires a separate reviewed capability
  contract; the Teacher/Symbolic code must never receive operator credentials.
* HTTP loopback is not remote TLS. This is a browser/agent-origin boundary, not
  a defense against malicious code already running as the same OS user.
* State directories receive a protected Windows owner/SYSTEM ACL (0700 on
  Unix); a native nonblocking lock prevents duplicate owners of one directory.
  No credentials are serialized. Operator text/drafts are private local data:
  recognized token/private-key patterns are redacted, but redaction is **not**
  a universal secret detector. Never paste credentials into prompts.
* SDK authentication objects, raw exceptions and unrestricted SDK event payloads
  must never be forwarded. The future adapter supplies only the bounded,
  reviewed output/permission projection. Oversized or redacted permission
  details are denied rather than asking a user to approve an incomplete view.

## Public HTTP / event interface

All `/api/*` paths below require the cookie; POSTs also require the exact Origin.

| Interface | Meaning |
|---|---|
| `GET /` | Independent pairing or recovery HTML |
| `POST /login` | Native form pairing; rate-limited, returns cookie/303 |
| `GET /api/status` | Operator/bridge/workspace/session/command/permission state |
| `POST /api/commands` | `{id,kind:"start_session"|"prompt",text?}` |
| `GET /api/commands/{id}` | Inspect a possibly interrupted command; never rerun it |
| `POST /api/commands/{id}/cancel` | Explicit cancellation request, `{}` |
| `POST /api/permissions/{id}` | `{decision:"allow"|"deny"}` for one live request |
| `GET /api/draft`, `POST /api/draft` | Operator-only persistent draft, `{text}` |
| `POST /api/operator/stop` | `{confirmation:"STOP OPERATOR"}`; explicit adapter stop |
| `POST /api/logout` | Revoke this browser's capability, `{}` |
| `WS /events?since=N` | Authenticated **output-only** sequenced replay |

WebSocket messages are `{type:"status",data:...}` and
`{type:"events",events:[{sequence,created,kind,data}],lastSequence,latestSequence}`.
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
stop requests do not repeat native operations. After explicit stop, use a new
authorized bridge start for another session. Closing the
browser or Prolog does not stop that adapter. The bridge does not claim it can
preserve in-flight native execution across its own OS/process crash.

Workspace identity is checked before dispatch and permission decisions. It is
not a sandbox for a human-approved native command; the adapter must preserve
the primary working directory and expose native permissions without auto-allow.

## Native SDK contract still required

`OperatorAdapter` in `adapter.py` is an internal typed seam, **not a guessed
Copilot or Codex API**. The coordinator must supply official documentation for
both native protocols; they need not use the same RPC, session or model scheme:

1. supported CLI process startup/ownership, clean shutdown and session IDs;
2. documented create/resume/load capabilities and restart limitations;
3. async event lifecycle and correlation with each submitted request;
4. permission callbacks that can await a human decision without auto-approval;
5. cancellation/idle completion semantics and safe unknown-outcome inspection;
6. credentials and model configuration confined to CLI/SDK ownership.
7. explicit process plus new/resumed session/thread cwd and any optimistic
   mutation/version safeguards actually supported by that provider.

No SDK dependency is installed yet. No Copilot App internals are inspected.
Teacher model selection (`gpt-5.6-sol` / port 8801) does not select or configure
the operator model. Parent lifecycle registration is also pending: an app
restart button must remain unavailable until target instance/PID/generation
checks and the existing lifecycle API are agreed. Availability probes cannot
authorize restart.

## Validation

```powershell
prolog\ow_dr\operator_bridge\.venv\Scripts\python.exe -m unittest discover -s prolog\ow_dr\operator_bridge\tests -t . -v
node --check prolog\ow_dr\operator_bridge\static\recovery.js
```

Tests use clearly named test-only fake adapters, isolated loopback HTTP/WS
servers, and owned files under `tests\.artifacts`. A real SWI-Prolog fixture is
started/stopped/restarted on ephemeral loopback ports while the same bridge,
operator conversation and test-native-session identity remain alive. It loads
no KBs. Only those created children are stopped. No production process, private
KB prompt, actual model request or source corpus is involved.

The shared Chrome tool was unavailable during the first fixture visual check
(another browser instance owned its profile). Real HTTP asset/MIME/authentication
and WebSocket tests pass; an interactive desktop/mobile visual check remains for
the coordinator. The disposable offline fixture was health-checked and stopped.

The dual-provider fixtures additionally prove warning-then-allow concurrency,
simultaneous-start admission, independent session/auth markers/history/drafts,
permission/cancellation isolation, provider-tagged output-only replay, passive
discovery, explicit new/resumed cwd and rejection of cross-repository native
contexts. They make no real model request or source edit.
