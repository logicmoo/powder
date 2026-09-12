# KEE tools: verified routes and planned semantic registry

**Status:** the application has REST endpoints and trusted Prolog components.
It does **not yet** have the central versioned KEE tool registry, LLM tool adapter,
symbolic agent runner or general automatic KB-edit/undo contract described below.
This document is not a tool manifest or permission grant.

The inventory was checked against repository route declarations and handlers on
2026-09-12. No live requests, LLM calls or mutations were needed. Read current
schemas/versions again before integration; a route in source is not proof of
deployment, authorization, index completeness or model tool-call compatibility.

## Verified emullm provider contract

**Evidence:** coordinator's read-only probe and emullm-owner contract inspection,
2026-09-12.
No model prompt or user data was sent by this documentation worker. This is
verified provider behavior, not implemented powder Chat/tool integration and
not a new KEE capability.

| Provider surface | Verified behavior |
|---|---|
| Base | `http://127.0.0.1:8801/v1`; recorded evidence, not hardcoded application configuration |
| GET `/models`, GET `/models/{model-id}` | Model listing/detail; read-only probe verified 61 models, including the previous catalog example `emullm/default` |
| POST `/chat/completions` | OpenAI-shaped conversation request; always supply an explicit authorized `model` |
| Model selection | Initial user-selected LLM teacher model: **`gpt-5.6-sol`**, explicit. **Never omit `model`:** omission routes through `worker-copilot-n/percent100` |
| Incoming authentication | Keyless; incoming `Authorization` is ignored. This is not application/agent authorization |
| Caller tools | Schemas are rendered into text; worker JSON is used to synthesize `tool_calls`. The provider never executes caller tools |
| Tool selection | `tool_choice` is ignored; strict-schema/selection hints are not enforcement |
| Streaming | Start integration with `stream:false`. SSE is post-completion: role, one whole content/tool-call payload, finish, `[DONE]`; not incremental token generation |
| Timing/cancellation | Relay timeout is 900 seconds. Clients need their own shorter deadline; abort is best effort and there is no public cancellation endpoint |

**Model configuration is PLANNED, not live.** The user verified and selected
exact `gpt-5.6-sol` at this provider base for the application agent. The future
host must send that explicit initial choice. A Refresh/picker must read actual
`/models` entries and persist explicit selection in revisioned registered-agent
configuration when implemented. If the selected model is unavailable, fail
clearly; never silently substitute `emullm/default`, Gemma or another GPT model.
`emullm/default` remains a previous catalog example only. This does not alter
the Copilot coding model; no LLM request or user data was sent for this choice.

**Not private/local-only.** Durable JSONL request/reply records and worker logs
retain payloads. Stable workers reuse contexts; a new powder conversation or
prompt snapshot does not establish fresh provider context or isolation.
An external SNET-compatible fallback is possible after approximately 20 seconds.
Do not promise local-only processing, ephemeral storage, erasure on Stop or
isolation between requests.
An explicit model field does not remove these provider-side routing/privacy
risks; the no-substitution rule also forbids an application fallback model.

The future UI must clearly disclose retention, context reuse and possible
external routing **before export**. Only explicit Chat/Generate actions may
send bounded selected **nonsensitive**, authorized KB context through an approved
route. Never send secrets, application code, raw private KB or unrelated/bulk
private files. Automatic KB-mutation grants do not grant arbitrary model export.
If the route/disclosure/data policy cannot be satisfied, do not send the request.

Configuration identifiers only: `EMULLM_BASE_URL`, `EMULLM_MODEL`, and the
proxy-side credential name `SNET_API_KEY`. No secret value is needed here.
These names document the future integration boundary; they do not establish
powder configuration code. Do not put credential values into model messages,
browser state or repository files, or treat ignored incoming authorization as
an authentication mechanism.

### Required host tool loop — application implementation PLANNED

1. Discover real registry/tool versions and authenticated grants; offer only
   known, uniquely named tools with bounded typed schemas.
2. Strictly parse each returned arguments string as JSON with an **object root**
   (not null, an array or a scalar). Enforce required fields,
   `additionalProperties:false`, known names, types, constraints, permissions,
   MT/revision checks and idempotent call IDs in the host. Reject invalid calls;
   never execute prose, JSON-looking text or unknown tools as a fallback.
3. Persist the original response/call identity and execution record. Append the
   **exact assistant `tool_calls` message**, then one `role:tool` result/error
   with the matching `tool_call_id` for each call before the next model round.
   Do not rewrite the original IDs/arguments to disguise validation failures.
   Results sent back remain bounded and subject to the same nonsensitive-data policy.
4. Only the permissioned host executes accepted tools. Neither provider claims,
   `strict` schemas nor `tool_choice` authorize execution. Cap rounds, calls,
   returned bytes, time and mutations independently.
5. On Stop/deadline, close the host run and discard late tool calls before
   dispatch, even if the provider continues. Do not automatically retry executed
   mutations. Resolve interrupted/unknown outcomes from durable call/execution
   records and idempotent changeset results when resuming.

This protocol is distinct from a symbolic run: the symbolic agent may not
contact emullm at all, directly or through another tool/workflow.

## Implemented application routes

Paths in this section are relative to the configured application mount;
`kb_urls.pl` derives it from `web/paths.json`. Do not hardcode a host, port or
mount into an agent. The listed method is the application's intended read/write
use, including POST endpoints that perform reads. Only the **future host registry**
may expose a permitted, bounded semantic adapter to an agent.

### Loaded knowledge, query and provenance

Verified in [`kb_server.pl`](../kb_server.pl), its `http_handler` declarations
and matching `action/3` clauses:

| Method | Relative route | Actual operation / relevant input |
|---|---|---|
| GET | `api/status` | Active application/KB status; not all-file coverage |
| GET | `api/search`, `api/predicates` | Loaded semantic term/predicate pages; `q`, `offset`, `limit` |
| GET | `api/term` | Loaded term assertions/roles; `term`, paging and source/MT/predicate filters |
| GET | `api/term/info` | Structured term information; `term` |
| POST | `api/assertions/annotations` | Read presentation annotations for `ids`; not a mutation |
| GET | `api/nats`, `api/nats/facets` | Non-atomic term browsing/facets with bounded filters |
| GET | `api/microtheories`, `api/microtheories/inheritance` | Loaded MT catalog/graph; graph display is not an inference permission |
| GET | `api/microtheory` | Assertions in explicit `mt`, with pagination |
| GET | `api/assertion` | Stable assertion `id`, presentation/provenance and current `generation` |
| GET | `api/assertion/compiled` | Read compiled assertion view; `id`, optional expected `generation` |
| POST | `api/query` | Safe bounded S-expression query: `query`, optional `mt`, `limit`, `timeout` |
| GET | `api/source` | Authorized read-only source excerpt; `path`, `line` |
| GET | `api/mappings` | Markdown mapping rows and filters; not inferred ontology equivalence |
| GET | `api/version` | Web-source version, not a tool registry version |

`api/query` validates the result limit and a positive timeout no greater than
30 seconds. It executes through pinned store/runtime snapshots and returns
solutions, proof data, generation and invocation-local `utility` observations.
It is not arbitrary Prolog evaluation and does not promise full Cyc inference.
Queries can update observational telemetry; they do not thereby assert new
knowledge. Static implications, source direction and provider names do not
make bodies executable.

[`kb_rule_utility_http.pl`](../kb_rule_utility_http.pl) also registers
GET `api/rule-utility`: cumulative ID/content/generation-keyed observations,
pagination, optional bounded source checking and display-only Classic STV
usefulness. See [rule utility](rule-utility.md). Unobserved/non-executable
assertions do not acquire fabricated execution counts.

### All-file discovery and SourcePacks

[`kb_catalog_http.pl`](../kb_catalog_http.pl) registers:

| Method | Relative route | Actual operation |
|---|---|---|
| GET | `api/catalog/status` | Query-index readiness/coverage |
| GET | `api/catalog/search` | `q`, `scope`, `group`, `offset`, `limit` |
| GET | `api/catalog/term` | `term`, `scope`, `facet`, `source`, `mt`, paging |
| GET | `api/catalog/assertion` | Exact catalog assertion lookup by `term`, `source`, `id` |
| POST | `api/catalog/cancel` | Operational cancellation by `phase`, `runId`; not a semantic edit |

Pending directories can return 503; stale projections/directories can return
409. Treat these as incomplete/unavailable knowledge access, never an empty KB
or proof of absence. Do not extrapolate complete vocabulary, global uniqueness
or executable support from a partial index or one successful exact lookup.

**Coordinator-verified live readback (2026-09-12):** the **978-file catalog** and
exact HTTP 200 lookup of unloaded `x_diplomaticState` are verified. The lookup
returned 6 definitions from 1 file in the reported **4–5 second** live range
(earlier measured sample: **3966 ms**), without a KB change. Broad-search and
provider/type-proof details remain pending; incremental-maintenance readiness
requires separate verification. Registry and agent applications remain planned.
Do not infer general cold/warm
latency or complete semantic coverage from this sample. No source filenames or
assertion IDs were supplied with the measurement; none are invented here.

Additional routes in `kb_server.pl`:

| Method | Relative route | Actual operation |
|---|---|---|
| GET | `api/kb/catalog` | Supported repository source tree |
| GET | `api/kb/file-info` | File information for JSON-encoded `paths` |
| GET | `api/kb/dependencies` | Source dependency information; `path`, `section`, paging |
| GET | `api/kb/packs`, `api/kb/pack` | SourcePack list/detail (`id`) |
| POST | `api/kb/packs/create` | Application pack creation: `name`, `roots`, `revision` |
| POST | `api/kb/packs/save` | Save `pack`, `revision`; composition has roots, choices, members |
| POST | `api/kb/packs/resolve` | Resolve `id`, `revision`, `choices`; not permission to load |
| POST | `api/kb/packs/load` | Load saved composition using `id`, `revision`, `generation` |
| POST | `api/kb/packs/providers/refresh` | Explicit provider-index operation for `selection` |
| POST | `api/kb/load`, `api/kb/unload` | Concrete file-set load / one-source unload, generation checked |

These are existing **application** operations, not automatically allowed LLM
tools. Consult [SourcePack resolution](source-pack-catalog-resolution.md) and
[provider evidence](catalog-provider-evidence.md). Static declaration/provider
evidence is not proof that an action can execute. Do not invent KB source
inventory or replace saved user choices with guesses.

The required agent load policy is **PLANNED**: every load needs a real user's
choice of A (actual assertion-subset closure) or B (whole files), bound to that
selection/revision. The current file-list and pack routes are not evidence that
subset mode or this per-load choice gate exists. No `approved:true` invented by
a model is an acceptable substitute.

### Native annotations and excluded administration

Existing native read routes in `kb_server.pl` include GET `api/tva/status`,
`api/tva/settings`, `api/tva/pairs`, and POST `api/tva/summary`,
`api/tva/detail`, `api/tva/assertion`, `api/tva/interpretation`,
`api/tva/interpretations`. Bodies are explicitly validated. Existing writes
include POST `api/tva/settings/save`, `api/tva/pairs/save` and
`api/tva/assertion/save`; the last requires entity, context, patch, revision,
generation and identity. These specific durable metadata facilities are not
a general agent assertion CRUD/undo subsystem.

Preserve [native TVA](native-tva.md): direct Atom -> explicit current MT ->
Default, same family/property, without guessed inheritance or truthiness
fallback. Native pairs, source/default categories, direction and observed
rule usefulness are distinct concepts.

**Never expose these as KEE tools:** debug console/Telnet, GET `api/debug/status`,
POST `api/debug/start` / `api/debug/stop` (registered in
[`kb_debug_admin.pl`](../kb_debug_admin.pl)), arbitrary Prolog, shell, secrets,
unrestricted filesystem/network operations, `api/app/reload`, native
initialize/reset, checkpoint administration/promotion, or pool administration.
The debug service is a privileged host facility even when authenticated.
Neither agent may use it as an escape hatch or a missing semantic-tool adapter.
The source editor is likewise not the planned managed KB-edit interface.

Origin/loopback checks and endpoint-local validation must not be mistaken for
the future authenticated per-agent permissions and MT ceilings.
Existing `api/tasks*` operational jobs are not the durable teaching-case todos.

## Copilot/Codex Operator boundary — planned, never KEE

The same resident Python bridge has pluggable Copilot and Codex adapters
**outside Prolog's lifetime**. Each operator is a human-controlled privileged
code/service interface, not a semantic capability. The Codex label is exactly
**Maintain code, inspect failures and manage services**. No operator
WebSocket, recovery route, installation or SDK adapter is claimed implemented
by this inventory. Do not invent endpoints or reverse-engineer private
application internals; use documented supported session/resume interfaces only.
The installed backends have distinct official protocols, authentication and
model IDs. Do not share credentials, assume interchangeable IDs or automatically
fall back from one operator to the other.

Both adapters use the host-trusted primary checkout
`C:\snet\PeTTa\repos\openworld_dr`, supplied explicitly for process launch,
session/thread creation and resume. Validate the recorded canonical checkout
identity; reject browser CWD and cross-repository resume. Do not create a branch
or worktree, rely on inherited CWD, or overwrite user changes.

The authenticated localhost WebSocket and recovery view must bind a real human
session, validate origin and keep credentials private. Native CLI permissions
continue to require their normal human decisions: **Start does not grant edit
permission**. They fail closed when that
human is disconnected. KEE grants cannot authorize these privileged actions.
Teacher and symbolic tools/workflows cannot call the operator, delegate to it,
submit its TODOs as commands or acquire its privileges through indirection.
The symbolic role remains LLM-free; the teacher's emullm model setting is not
an operator/native CLI model change. Sessions, authentication, owned PIDs,
history, permission requests and cancellation stay isolated per backend.

Warn and recommend against running both operators in the same checkout, but
allow the human's explicit **Start anyway**. Do not enforce a hard checkout
mutex or automatically kill the other process. This is not race-proof editing
and never authorizes overwriting user edits or bypassing native permissions.

Main assets are served by Prolog. Therefore a minimal authenticated recovery
view must be served independently with the Python bridge; an open WebSocket
alone does not provide restart persistence or a reachable recovery UI.
Persist bounded private sequenced **output** with replay cursors, never a queue
of commands to re-execute on reconnect. Render replay as data, not executable
HTML, stdin, tool calls or new model tasks. Resume only through documented
native support. Unknown in-flight command/tool outcomes must remain explicitly
unknown until inspected; do not blindly retry or claim exactly-once execution.
Secrets must not enter URLs, transcript/replay logs or KB records.

The four chip labels are **Teacher / Cyc / Copilot / Codex**; Cyc is the
symbolic role and the latter two are operators. Each needs separate buffers, history,
drafts, settings, status, unread indicators and TODO scope. Changing chips must
not merge authority or submit work. This planned role adds no KEE registry entry,
global installation authorization or automatic code/model task.

### Verified operator interfaces; application bridge still planned

Coordinator-verified details constrain the future host; they are not KEE tool
names and do not establish a delivered bridge:

| Backend concern | Required handling |
|---|---|
| Copilot SDK compatibility | Pin the tested official SDK version. Confirm support for explicit `cli_path` and `RuntimeConnection.for_uri` in that version; do not guess a private runtime interface. |
| Copilot disconnect | Resumable, retaining history. Never implement it with permanent `delete_session`; transport loss, tab close and cancel must not erase history. |
| Copilot runtime shutdown | `client.stop` is restricted to SDK-owned runtimes, not attached/shared runtimes. Record ownership and use only documented resume with validated CWD. |
| Native permissions | Never `approve_all`. Preserve human native permissions; fail closed for pending requests when disconnected. Starting is not edit authorization. |
| Codex initialization | Official `app-server` stdio: `initialize`, then `initialized`, then the documented thread/turn API with camelCase fields. Not Copilot protocol or guessed snake_case fields. |
| Codex approval policy | `approvalPolicy: "never"` auto-rejects approval requests; it is not approve-all or unrestricted execution. Never use it to bypass human policy. |
| Codex installation | Explicit user-installed `codex_bin` and host-trusted CWD; no bundled download/substitution. |
| Windows launchers | Resolve installed PowerShell shims to a supported target/launcher. Do not treat `.ps1` as a Win32 executable; verify path/version and use structured arguments. |

No sessions or model prompts were started to document these contracts. Preserve
isolated authentication/model IDs, session history, PIDs, permissions and
cancellation for the two operators.

## One future typed semantic registry — PLANNED

One authoritative registry must drive the application, LLM tool descriptions
and generated tool reference. Do not maintain separate hand-edited executable
registries in prompts, UI code and documentation.

Discovery's actual address/protocol must come from the host, not an invented
`/api/kee` endpoint or guessed Cyc function name. First obtain and validate the
registry/version and current principal's grants. If discovery is absent,
report **KEE registry unavailable**; do not advertise or call fictional tools.
An independently authorized existing application route remains only that route.

Each future entry must declare stable capability ID/version, typed input/output
schemas, semantic identity rules, permission/MT constraints, read/write effects,
budgets, cancellation behavior, revision/conflict rules, idempotence,
provenance, audit/undo contract and symbolic-agent eligibility. Nested actions
must preserve or reduce the caller's ceiling, never elevate it.

These are **capability categories, not implemented callable names**:

| Proposed semantic capability | Required contract |
|---|---|
| Find/get terms and assertions; definitions and occurrences | Canonical identity, source/MT provenance, pagination, complete/partial/stale coverage |
| Bounded query and explanation | Explicit context, limits, actual returned proofs, cancellation, unsupported-form errors |
| Create/declare terms and MTs | Typed identities, existence/conflict checks, writable scope; never pretend a proposed term already exists |
| Assert/retract/update/annotate | Atomic managed changesets, durable before/after audit and undo, revision checks |
| Dependency diagnose/plan/apply | Verified provider evidence, unresolved alternatives, actual per-load user A/B choice |
| History, undo and redo | Durable revision-aware changeset traversal; no blind overwrite or repeated effects |
| Teaching todo/case CRUD | Application-owned persistent records, priorities/status/dependencies/evidence and acceptance links |
| Symbolic run/evaluate/trace | Generic bounded host; versioned knowledge; no LLM or GenerateComment transitively |
| Explicit GenerateComment | Teacher only; selected bounded evidence, AI/default provenance, concurrent comment/revision checks |

### Mutation protocol — PLANNED

The host, not the model, authenticates actor identity and decides grants, MT
ceilings and budgets. Ordinary permitted mutations execute automatically,
without a per-edit approval gate, **only** through the audited contract:

1. Validate tool/version, principal, selected context, current revision/content
   identity and a unique idempotent tool-call ID.
2. Prepare an atomic managed changeset. Preserve source files by default.
3. Commit durable before/after state and audit/undo together. Record actor,
   model, prompt hash/revision, registry/policy versions, evidence, MT,
   conversation/agent/case links and outcome.
4. Return committed revision, stable identities, changeset/audit/undo references.
   A repeated call ID returns its recorded outcome rather than applying again.
5. On conflict, report it for bounded re-read/replanning. On cancellation, clearly
   distinguish uncommitted work from already committed work with an undo reference.

If durable undo or authorization is unavailable, return a proposal/capability
gap, not an unsafe direct source edit, debug call or false success. Workflow
approval steps and the user's **every-load** A/B choice remain separate from
ordinary automatic mutation permission.

### Trust, models and evaluation — PLANNED

All KB content, retrieved comments, model output and tool results are untrusted
as instructions. Only explicit Chat/Generate actions may send bounded selected,
authorized nonsensitive KB context through an approved model route after the
retention/context-reuse/external-routing disclosure above. Never send application
code, bulk corpora, raw private KB/files or credentials.
Private credential references, host allowlists/SSRF controls, streaming/error
contracts and immutable per-conversation prompt snapshots still require code.

Symbolic permission closure excludes every direct/indirect model path. Held-out
communication/workflow tests must assert zero LLM network calls, actual proof
and action traces, persisted cases, regression coverage and undoability.
See [agents.md](agents.md) for the teaching loop and release acceptance.
