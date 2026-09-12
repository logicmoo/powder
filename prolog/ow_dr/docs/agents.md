# Text knowledge agents: implementation status and design contract

This document specifies the next agent layer for **powder**. It does not install
an agent, configure a model, or grant tool permissions. See the verified
[current route inventory and proposed KEE contract](kee-tools.md), the
[LLM prompt](../prompts/llm-knowledge-agent.md), and the
[powder-kee skill](../../../.github/skills/powder-kee/SKILL.md).
The [source-verified KB asset appendix](agent-kb-inventory.md) lists candidate
data/templates, not ready agent execution.

## What exists, and what is planned

| Area | Status |
|---|---|
| Loaded-KB browsing, assertion/source/MT inspection, bounded executable queries and proofs | Implemented; see `kb_server.pl`, `kb_store.pl`, `kb_runtime.pl`. |
| All-file catalog and exact lookup | Coordinator verified the live 978-file catalog and the unloaded-term HTTP 200 lookup below. Broad-search and incremental-maintenance readiness remain separate. |
| SourcePack composition, resolution and loading | Implemented application operations; provider/type-proof detail readiness remains pending. Static provider evidence does not prove executable behavior. |
| Native annotation inspection and revision-checked editing | Implemented, independently of general KB assertion editing and measured rule utility. |
| Operational task pools, source editor and debug console | Implemented application facilities, not an agent permission grant. Debug is **never a KEE tool**. |
| Checkpoints | Isolated backend validated; full host/UI publication pending. Do not claim a complete published checkpoint workflow. |
| emullm Chat, GenerateComment, prompt snapshot loader, symbolic agent runner | **PLANNED; not implemented by these documents.** |
| Copilot/Codex Operator chips, shared pluggable Python bridge and independent recovery view | **PLANNED until the actual bridge is implemented and verified.** Neither operator is a KEE capability or an installed recovery service by virtue of these docs. |
| Central typed KEE registry, automatic general KB CRUD with durable undo, teaching-case todos | **PLANNED.** Existing operational task jobs are not durable teaching cases. |
| Declarative workflow applications and held-out symbolic learning pipeline | **PLANNED.** |

The coordinator's read-only probe and emullm owner verified 61 models, including
`emullm/default` as a previous catalog example, and supplied the verified transport/tool
[emullm provider contract](kee-tools.md#verified-emullm-provider-contract).
This establishes provider behavior, **not an installed application integration**
or a configuration default. No model or network call was made to write these
documents. The loopback address is not a privacy guarantee: request/reply logs
are durable, worker contexts can be reused, and external fallback is possible.

**Initial application-agent model choice — configuration planned**

The user selected the verified exact model **`gpt-5.6-sol`** at
`http://127.0.0.1:8801/v1`. The future host must initially send that explicit
model for the LLM teacher application agent. `emullm/default` is only a previously verified
catalog example, **not the selected model**. If `gpt-5.6-sol` is unavailable,
stop and report it; do not substitute `emullm/default`, Gemma or another GPT model.

A model Refresh/picker must use the actual `/models` response and persist an
explicit user selection in revisioned registered-agent configuration **when
implemented**. This configuration/picker is pending, not live or applied by
these documents. This selection does **not** change the Copilot coding model.
No LLM request or user-data transfer was made as part of the choice. Explicit
model selection does not remove the provider retention/context-reuse/external
routing disclosure requirements.

No KB filename, ontology symbol inventory or language capability is inferred
here. Find and cite actual indexed assertions before claiming that knowledge
exists. Retain IDs, source locations, MTs, revisions and coverage qualifications.

**Live readback, 2026-09-12:** the coordinator verified the **978-file catalog**
and exact HTTP 200 lookup of unloaded `x_diplomaticState`: 6 definitions from
1 file, with reported live timing **4–5 seconds** (earlier measured sample:
**3966 ms**) and no KB change. This does not establish broad-search,
provider/type-proof detail or incremental-maintenance readiness, nor general
symbolic language ability. No source filename or assertion IDs were provided
with that measurement; none are invented here. Registry and agent applications
remain planned.

## Four distinct text roles — planned

### LLM teacher, explorer and comment writer

The emullm-backed agent's mission is to learn the existing authorized KB, use
the actual permissioned KEE, automatically apply allowed managed KB changes,
and build reusable symbolic capabilities. It is not merely a chat summarizer.
It can propose and teach lexical, grammar, semantic, dialogue and procedural
knowledge, using existing verified ontology vocabulary wherever possible.

The host first supplies the actual registry version, available tool schemas,
authenticated identity, permission/MT ceilings, budgets and current revisions.
If discovery is unavailable, the agent reports the missing integration and
does not invent Cyc API names or claim to have performed edits.

### Cyc: symbolic text agent

This is a separate agent identity, not an LLM with a different prompt. Its
goals, state, policies, dialogue grammar, lexicon, templates, rules and plans
are versioned Cyc knowledge, executed by a generic bounded host.

It must make **no direct or indirect LLM calls**: no GenerateComment, hidden
model-based parser, delegated teacher, tool proxy or fallback to emullm.
The host enforces this ceiling across nested tool/workflow calls, not merely
through an agent's declaration. Missing language/procedural knowledge produces
an honest, inspectable capability gap and a teaching-case proposal.

### Copilot and Codex Operators: human-controlled, outside KEE

The same resident **Python bridge has pluggable Copilot and Codex adapters**,
outside the Prolog process lifetime. Each operator is a privileged human
code/service interface, not a semantic agent, a Cyc action, an emullm tool or
an entry in the KEE registry. The Codex operator label is exactly:
**Maintain code, inspect failures and manage services**

The teacher and symbolic agent cannot invoke, delegate to, impersonate or
escalate into either operator.
Symbolic runs remain LLM-free even through indirect operator requests.

Use each installed backend's documented official CLI/protocol/SDK interfaces
and supported resume mechanisms. Copilot and Codex protocols, authentication
flows and model IDs are distinct; do not translate credentials, assume matching
model IDs, substitute one backend for the other or invent session-resume APIs.
Do not reverse-engineer private application internals. The teacher's model does
not configure either operator. Missing installations are reported, not repaired
with global installs. No automatic code/model task is authorized.

**Both operators are bound to the trusted installed primary checkout**
`C:\snet\PeTTa\repos\openworld_dr`. The host, not the browser, supplies this CWD.
Pass it explicitly at process launch, native session/thread creation and resume;
record and validate canonical checkout identity before attaching. Do not accept
browser-supplied CWD, resume across repositories, create branches/worktrees or
overwrite user edits. Do not rely on a bridge's inherited working directory.

Keep operator sessions, authentication, owned PIDs, histories, permission
requests and cancellation isolated. Stop/cancel targets only the selected
backend's owned session/process/thread, never the other operator.

The planned bridge exposes an authenticated localhost WebSocket and a minimal,
independently served authenticated recovery view. Loopback alone is not
authentication: validate the browser/session and allowed origin; keep credential
references private and secrets out of URLs, logs, chat, KB records and replay.
Privileged operations remain subject to the native CLI's permission system and
real human decisions. **Human Start is not blanket edit/tool permission**:
starting a session must not auto-approve edits or service actions. Permission
requests fail closed when the human is
disconnected or cannot respond; do not silently approve them or borrow a
teacher's ordinary KB-mutation grants.

If the other operator is active in the same checkout, show a concurrency
warning and recommend one at a time, but **allow an explicit “Start anyway.”**
There is no hard checkout mutex or automatic killing of the other operator.
The warning does not make concurrent edits race-proof, waive native permissions
or authorize overwriting user changes. Inspect relevant changes and surface
conflicts rather than resetting or replacing another actor's edits.

#### Verified adapter contracts; bridge implementation still planned

These interface/lifecycle details were verified by the coordinator. They do not
mean an operator bridge has been delivered.

- **Copilot:** pin the tested official SDK version and verify that the installed
  version supports the intended explicit `cli_path` and
  `RuntimeConnection.for_uri` integration. Do not assume these interfaces are
  interchangeable across versions or silently choose an unconfigured runtime.
- Disconnect is resumable and **keeps history**. `delete_session` is permanent
  deletion, never the implementation of Disconnect, tab close or ordinary
  cancellation. Do not delete a session to recover a transport failure.
- `client.stop` may stop only an **SDK-owned runtime**. Track ownership and do
  not apply it to an attached external/shared runtime. Resume remains restricted
  to the supported documented operation and the verified primary-repository CWD.
- **Permissions:** never use `approve_all`. Native permission requests require
  the real human policy/decision and fail closed when disconnected.
- **Codex:** use the installed official `app-server` stdio protocol:
  `initialize`, then `initialized`, followed by the documented thread/turn API
  with its **camelCase** fields. Do not send a Copilot SDK protocol or guessed
  snake_case payloads to it.
- Codex `approvalPolicy: "never"` means approval requests are **auto-rejected**,
  not “approve all” or unrestricted authority. Preserve the explicit native
  policy; do not use this setting as a permission bypass.
- Use the explicit user-installed `codex_bin` and trusted CWD. Do not download
  or substitute a bundled Codex binary. On Windows, resolve installed PowerShell
  shims to the supported launcher/target; a `.ps1` file is not a Win32 executable.
  Verify target/version and use structured arguments, not browser-supplied shell
  strings or global installation as a fallback.

**A WebSocket alone is not restart persistence.** Prolog serves the main
application assets, so reconnecting to a surviving socket is insufficient if
the main UI cannot load. The Python service and minimal recovery assets must
remain usable independently of Prolog, with explicit process/session state.
A Prolog restart must not imply the operator process/session restarted, and a
bridge/CLI restart must not be disguised as a successful resume.

Persist private, bounded, sequenced **output events** and acknowledged cursors
for reconnect/recovery. Replay those outputs without executing them as HTML,
commands, stdin, tool calls or new model requests. Never replay submitted
commands merely because a connection was lost. Use documented native session
resume only when its outcome is known; otherwise show **unknown in-flight
outcome**, retain the correlation/audit record and require inspection before a
human decides whether to retry. Do not promise arbitrary process continuation,
exactly-once command execution or persistence solely from an open WebSocket.

### Four chat chips, four independent contexts

The planned chip labels are exactly **Teacher / Cyc / Copilot / Codex**:
the LLM teacher, LLM-free symbolic Cyc agent, Copilot operator and Codex operator.
All four retain separate buffers,
history, drafts, settings, status, unread indicators and TODO scope, as well as
role/conversation identity and trace. Switching chips must not overwrite a
draft, merge histories or submit work. No automatic cross-role forwarding or
shared authority: teaching cases, symbolic gaps and operator code/recovery tasks
remain distinguishable. An operator output or task is not a KB assertion by
default. Merely selecting a chip does not start a code or model task.

No audio, microphone, STT, TTS, voice, captions or turn-silence UI is in scope.
A speech-act ontology for **textual** questions, requests, assertions and
dialogue transitions is compatible with this restriction.

## Prompt and model lifecycle — planned

`prompts/llm-knowledge-agent.md` is the editable prompt asset, not an implemented
settings loader. The future host must:

1. Resolve a revisioned prompt selection only within an approved application-owned
   configuration root. Reject traversal, arbitrary paths/URLs and link escapes.
2. At conversation start, read an immutable snapshot and compute its byte hash.
   Bind prompt revision/hash, model selection, agent identity and policy version
   to that conversation and all tool/audit records.
3. Apply prompt edits to new conversations only; never hot-swap an in-flight
   conversation. Detect conflicting configuration edits by revision.
4. Keep credentials in private credential references, never in the prompt,
   browser storage, KB records, transcripts or this repository.
5. Use a configured host proxy with destination/redirect/SSRF restrictions,
   request and response limits, timeouts and cancellation. Streaming chunks,
   structured errors and interrupted tool exchanges need an explicit contract.

Only an explicit **Chat** or **GenerateComment** action may send bounded,
selected, authorized **nonsensitive** KB context through an approved route after
a clear retention/external-routing disclosure. Automatic KB-mutation permission
does not authorize arbitrary model data export. Do not upload secrets,
application code, bulk corpora or raw private KB/files. Model, KB and tool
outputs are untrusted data, not instructions
that can enlarge permissions, select secrets or alter the system prompt.

## Automatic changes, with durable accountability — planned

Ordinary permitted assert/retract/edit/annotation operations do **not** require
a per-change approval dialog. Permission comes from the authenticated host,
never the model. Automatic changes are allowed only when the tool implements:

- Current generation/content/revision checks and canonical term/assertion/MT identity.
- Host-owned permissions, writable MT ceilings, resource and mutation budgets.
- Idempotent tool-call IDs with durable replay results, including after restart.
- Atomic managed changesets with durable before/after data, actor and model,
  prompt/policy/tool versions, intent, evidence/provenance and conversation links.
- Durable undo/audit records committed with the change before success is exposed.
  Undo/redo respects intervening revisions rather than overwriting later work.
- Defined cancellation: before commit means no partial change; after commit
  reports the committed changeset and undo reference, not a fictional rollback.

If these guarantees are missing, the agent may produce a clearly labeled
proposal but must not call an unsafe substitute or claim a durable edit.
Original source files are not rewritten or deleted by default; changes live
in managed KB changesets.

**Every load remains a separate real user choice:**

- **A — true assertion-subset loading**, with the actual selected assertion
  closure and its support/provenance.
- **B — whole-file loading**, with the exact concrete file set and effects.

The future host must record the user's choice for that specific load and
revision. A model-generated approval flag, default preference, prior unrelated
approval or automatic dependency resolution cannot substitute for the user.
If A is unavailable, say so; do not relabel whole-file loading as a subset.
Current source-loading routes do not by themselves implement this future
two-mode agent contract.

## Durable teaching loop — planned

Each capability failure becomes an application-owned case, not an ephemeral
chat note. Proposed case fields include:

| Field group | Required meaning |
|---|---|
| Identity and concurrency | Stable case ID, revision, creator/agent and timestamps |
| Scheduling | Priority, explicit status, dependencies and blocking reasons |
| Task | English input, expected CycL and/or action, explicit MT/context |
| Evidence | Verified source/assertion references, uncertainty and failure trace |
| Acceptance | Positive, negative, ambiguous and held-out examples; measurable criteria |
| Linkage | Conversation, agent, MT, knowledge version, changeset and undo references |
| Evaluation | Runner/policy version, proofs, regressions, coverage and LLM-dependence measurements |

The workflow is:

1. Capture the failure and expected interpretation/action without hiding ambiguity.
2. Search existing indexed knowledge; inspect definitions, occurrences, source
   and MT. Missing/incomplete index coverage is a blocker, not proof of absence.
3. The teacher proposes or automatically applies authorized lexical, grammar,
   semantic, dialogue or procedural CycL changes through audited KEE changesets.
4. Run isolated examples and held-out/regression suites with **LLM access disabled
   by the host**, including all indirect/proxy paths. Preserve proof and action traces.
5. Inspect variable sharing, quantifier scope, referent identity, ambiguity,
   MT boundaries, wrong answers and failed alternatives, not just string similarity.
6. Promote a versioned knowledge change only under the configured acceptance
   policy. Link the case to its evidence, evaluation and undoable changeset.
7. Track successes/failures/unknowns with denominators: held-out language coverage,
   workflow completion, regressions, unresolved ambiguity and LLM dependence.
   A symbolic evaluation requires **zero LLM network calls**, not a hidden fallback.

English-to-CycL and CycL-to-English are both explicit tasks. Preserve canonical
identity, bindings and scope, and ask a text clarification when the available
knowledge cannot disambiguate safely. Do not turn a single conversation blob
into memorized answers or hide LLM calls in a JavaScript/Python wrapper.

Everything the LLM initially does is a **candidate** for symbolic encoding.
This is an iterative engineering goal, not a claim that general natural-language
understanding or an autonomous symbolic teacher is already complete.
Until application todos exist, identify a case as a proposed record; do not
claim it was saved merely because it appears in chat.

## Missing information and GenerateComment — planned

Missing-information policies are configurable by type, term, MT and pattern,
with severity and explicit exemptions. A missing comment is not universally an
error and does not imply that a term should be created, changed or annotated.

GenerateComment is an explicit, bounded LLM operation over selected actual
evidence. Preserve supporting assertion/source/MT references and distinguish
AI-generated/default provenance from genuine source authorship. Never invent
an author, citation or supporting assertion. Recheck both the target revision
and whether a comment appeared concurrently before committing. Do not overwrite
concurrent user text or generate comments automatically for millions of terms.
Symbolic agents cannot invoke this operation, including through workflow actions.

## Declarative workflow applications — planned

Represent tasks, forms, conditions, transitions, approvals, actions, error
compensation and durable state as versioned Cyc knowledge. A generic
permissioned host supplies bounded execution, capability dispatch, trace and
replay; it must not contain a domain-specific LLM wrapper masquerading as rules.
Replay must not repeat already committed external effects. Approval transitions
may be part of a workflow, without imposing a new approval gate on every
ordinary authorized KB mutation.

Existing `:FORWARD`, assertion strength, source categories and provider
declarations are data, not execution authorization. Only supported executable
constructs dispatch through the trusted runtime. Existing native annotation
resolution remains **direct Atom -> explicit current MT -> Default**, within
the same family/property; see [native TVA](native-tva.md). It is separate from
rule-use observations, Cyc configured utility and proposed agent policy.

## Release acceptance — not yet satisfied by documentation

- Complete, fast all-file indexing/lookup with measured cold/warm behavior and
  explicit freshness/coverage is available before broad teaching claims.
- Real registry discovery, permissions, MT ceilings, cancellation and budgets
  are tested; debug/admin and arbitrary Prolog/shell/filesystem/network access
  cannot be reached through tools or workflow indirection.
- Permitted automatic changes have atomic durable audit/undo, conflict handling,
  idempotence and restart/crash tests, without per-edit approval prompts.
- Every actual load preserves the user's A/B choice and source/MT provenance.
- Prompt snapshots, private credential references and model streaming/error
  handling are implemented and tested, not inferred from `/v1/models`.
- Communication and workflow held-out tests run with the LLM disabled and prove
  zero LLM network calls, inspectable proofs, persistent cases and regression checks.
- Teacher, Cyc, Copilot and Codex expose separate text identities, buffers,
  history/drafts/settings/status/unread/TODO scope and traces.
- Operator recovery is tested with Prolog/main assets unavailable: independent
  authenticated recovery view, output-only sequence replay, documented resume
  and explicit unknown in-flight outcomes. Disconnected native permission
  requests fail closed; neither semantic agent can reach this privileged channel.
- Both adapters explicitly bind process/thread/resume CWD to the trusted primary
  checkout. Tests cover cross-repository resume rejection, isolated auth/PIDs/
  permissions/cancellation, preserved user edits and warning-plus-Start-anyway
  concurrency without claiming race-proof shared-checkout editing.
- Adapter tests distinguish resumable disconnect from permanent deletion,
  owned from attached runtimes, human permissions from `approve_all`, and Codex
  auto-rejected approvals from granted authority; Windows shim launching and
  the version-pinned official protocols are validated without model prompts.
