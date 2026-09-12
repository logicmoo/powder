# Application LLM knowledge agent

This is powder's separate **text-only application agent**, not the Copilot coding
model or symbolic agent. Deployment/route registration is host-owned; committed
modules alone do not mean the live app has loaded them.

## Registered settings, model selection, and prompt

`kb_agent_settings:agent_settings/1` creates the first durable registered profile
in `.logos-state/agents/llm-knowledge.json` with explicit model `gpt-5.6-sol` and
base `http://127.0.0.1:8801/v1`. This performs **no model request**.
`save_agent_settings(Patch,ExpectedRevision,Settings)` accepts exactly `model`
and `budgets`; stale revisions conflict rather than overwrite.

`kb_llm_transport:discover_models/1` performs an actual GET `/v1/models`. The
picker may save any explicit valid model ID, including other actual catalog
entries. A missing selected model remains selected and is reported unavailable;
there is no default/family/Gemma fallback. Every completion includes `model`
and `stream:false`.

Provider base is host-only configuration (`POWDER_LLM_BASE_URL`); browser/model
input cannot change it. Only canonical HTTP `127.0.0.1:<port>/v1` is supported.
Proxy hooks and HTTP redirects are disabled. Existing saved base and host base
must agree; changing destinations requires explicit host configuration/migration.
`POWDER_AGENT_STATE` is a trusted host override restricted to this repository.
No credential is currently needed or accepted from the browser. Incoming
Authorization is not a provider security boundary.

`kb_llm_prompt:prompt_document/1` reads only the fixed app-owned
`prolog/ow_dr/prompts/llm-knowledge-agent.md`.
`save_prompt_document(Content,ExpectedRevision,Document)` performs a locked,
revision-checked UTF-8 edit, at most 64 KiB. `prompt_snapshot/1` records content
and **raw-byte SHA-256** and archives those exact bytes in a hash-named immutable
prompt file. A conversation retains its own snapshot; later edits must not
replace an in-flight prompt. Original CRLF and UTF-8 bytes affect the hash.
Native Windows ancestor/reparse checks are used because SWI `read_link/3` alone
does not detect Windows junctions.

## Disclosure and capability boundary

emullm retains durable JSONL request/reply and worker logs, reuses worker contexts,
and may forward externally through SNET-compatible fallback. It is **not
private-local-only**. Only explicit Chat/Generate may send bounded, explicitly
approved nonsensitive input/grounding. Never send application code, secrets,
raw private KB or bulk files. Opening the UI, saving settings, starting a
conversation, and refreshing models must never trigger completion requests.

The provider's OpenAI-shaped tools are advisory schema text; `tool_choice` is
not enforced and the provider does not execute tools. Only the real permissioned
KEE registry can authorize managed mutations with revision checks, durable audit
and undo. No raw Prolog, shell, debug, administrative, filesystem, arbitrary
network, or credential tools are supplied. Unavailable KEE capabilities must be
shown as unavailable, not replaced with fake functions.

## Text chat and host integration

The host imports `kb_llm_http` once to register `api/llm/*` beneath its existing
`openworld_dr` URL prefix. It must provide its actual `kb_server:server_port/1`
listener inventory. The UI router imports `renderLLMKnowledgeAgent` from
`web/llm-knowledge-agent.js`, calls it with the normal
`{api,element,button,heading}` host, route and abort signal, and mounts the
returned element on `#/llm-knowledge`. The module loads its own CSS.
No changes to `app.js` or `kb_server.pl` are included in this ownership stage.

For the four-chip host, use the persistent controller instead:

```javascript
const teacher = await createLLMKnowledgeAgent(host, {
  signal: chipHostLifetime.signal,
  onConversationChange: ({ id }) => rememberTeacherConversation(id),
});
chipBody.append(teacher.element);
teacher.deactivate(); // switch away: hide and pause view polling only
teacher.activate();   // switch back: same draft, conversation and inspector DOM
// teacher.destroy() only when disposing this chip host, not on chip selection
```

`createLLMKnowledgeAgent` is exported by the same module and returns
`{agent,identity,label,element,activate,deactivate,getState,destroy}`.
It never changes the shared location/hash, aborts a model turn on chip switching,
or shares conversation/cancellation state with another instance. Draft message,
unsaved settings/prompt fields, selected inspector tab, events/audit/todos and
conversation remain in that controller's own view. Use a chip-host lifetime
signal, **not** a signal aborted whenever the selected chip changes.
`getState()` returns identity/model/conversation/status metadata, not draft text.
Destroy aborts that view's network/polling only; stopping a running conversation
remains the explicit Stop action.

Teacher/LLM (`llm-knowledge` settings, initially `gpt-5.6-sol`),
Symbolic/Cyc-only (no model), Copilot Operator, and Codex Operator require four
separate controllers, settings and transports. This module does not mount,
import, invoke or fall back to any other agent. Neither operator nor its SDK
is a Teacher KEE tool; Symbolic must never call this completion transport.
Changing Teacher's application model does not change either CLI operator model.
The operator host owns their fixed primary-repository CWD and concurrent-start
warning: starting the second operator is explicitly allowed after warning,
without automatic exclusion, cancellation or process termination. Teacher's
view controller does not arbitrate operator starts.

| Route suffix | Method | Contract |
|---|---|---|
| `llm/settings` | GET | Registered settings and revision |
| `llm/settings/save` | POST | `{settings:{model,budgets},revision}` |
| `llm/models` | GET | Actual provider catalog; never inference |
| `llm/prompt` | GET | Current fixed prompt content and raw hash |
| `llm/prompt/save` | POST | `{content,revision}` |
| `llm/registry` | GET | Actual adapter availability/limitations |
| `llm/grounding/preview` | POST | `{scope,requests:[{tool,arguments}]}`; local reads only |
| `llm/grounding/approve` | POST | `{id,hash,approvedNonsensitive:true}`; exact local approval, no inference |
| `llm/start` | POST | `{scope:{terms:[],readMts:[],writeMts:[],grant:null}}`; optional approved grant ID, no inference |
| `llm/conversation?id=...` | GET | Status, text, events, raw reply and execution records |
| `llm/todos?id=...` | GET | Local conversation-owned TODO inspector, first 25 resources |
| `llm/chat` | POST | `{id,revision,text,approvedNonsensitive:true}` |
| `llm/interrupt` | POST | `{id}`; interrupt current turn, retain conversation |
| `llm/stop` | POST | `{id}`; close conversation |

All routes require a real loopback peer and an exact owned HTTP Origin. Same-origin
browser GETs may instead supply an owned Referer, because browsers omit Origin on
many same-origin GETs. This is local browser-CSRF protection, not OS-user identity.
Bodies, schemas and revisions are checked. No browser/model URL, credential,
Prolog goal, file path, or administrative command is accepted.

Start records immutable prompt/model/policy/scope snapshots and sends nothing.
Importing these modules opens no listener and starts no worker/provider request;
`kb_llm_http` only registers dispatch handlers. Saved-state candidates must remain
**zero HTTP / no listening sockets** before promotion and use private IPC
readiness only. The checkpoint host must gate all restored app/debug/agent hooks;
neither Teacher nor debug is delegated to a candidate startup path. Main-process
Refresh/Chat remain separate explicit user actions. Volatile worker state is
never automatically resumed or replayed after image restoration.
Chat requires explicit nonsensitive-export acknowledgement. The selected model
must still occur in the real provider catalog before completion; an unavailable
model fails visibly without fallback. Each round uses `stream:false`.
History bytes, full response bytes, calls, rounds, conversation length and host
deadline are bounded. `tokens` is the requested **per-response** output-token
ceiling; provider behavior cannot be guaranteed, so independent byte limits
remain enforced locally. There is no automatic retry.

The worker holds application admission, checks interruption around network and
tool boundaries, and best-effort aborts its own pending HTTP request. Stop does
not promise provider cancellation, erasure or rollback. Received late tool
calls are discarded. Tool execution is one-shot, with durable reservations
before dispatch and durable outcomes afterward. Repeated call IDs reuse a
recorded result; changed arguments conflict; reserved/unknown outcomes are never
automatically re-executed. An interrupted/crashed conversation is not silently
resumed after restart. Unconfirmed mutation outcomes stop the turn and block new
turns in that conversation. There is no automatic reconciliation/resubmission:
review the durable KEE receipt through the host's KEE facilities before repeating
the intent. Stop does not undo a committed mutation.

The real `kb_kee` API is used for actual discovery, context grants and invocation.
Availability comes from actual registry discovery, not module-name presence.
Context tokens stay host-only and expire/close. Every tool argument is parsed as
a JSON object and strictly schema-validated, including canonical nullable
`anyOf` fields and nested `additionalProperties:false`. Provider `strict:true`
is not fabricated for schemas containing genuinely optional fields. Original
assistant `tool_calls` and matching `role:tool` IDs are retained for later rounds.

### Exact outgoing grounding

Read-MT permission alone is **not** export consent. Selecting a term does not
advertise its read tools. The local preview supports bounded catalog status,
definitions, occurrences, TODO get/list and audit projections; the browser offers
up to four term/MT pairs. A preview accepts at most eight requests, limits each
paged read to five records and each projected result to 16 KiB of UTF-8 JSON.
Unsupported tools and mutations cannot be previewed.

The preview displays the exact permitted material plus local identity evidence
(IDs, source identities, MTs and revisions). Source paths and arbitrary
diagnostics are never automatically included in outgoing material. Evidence
remains local; outgoing snapshots include material, request and content hash.
Approval binds the entire preview hash and selected scope. Stored entry hashes
are checked for corruption. Changed selection requires a new preview/approval.
These actions perform no provider request and cannot be invoked as model tools.

Conversation policy `llm-exact-grounding-v2` snapshots approved material as an
explicitly untrusted data message, never system instructions. Before **every**
provider round, the host re-reads all approved requests through KEE and requires
the same material/identity hashes. Each read tool call must also match an exact
approved request and return the approved hash. Changed data is withheld, even if
the change came from an otherwise authorized TODO mutation. Old-policy
conversations must be replaced explicitly; their history is not silently
upgraded or exported.

### Real application TODOs

The adapter connects actual available `kee_ledger_status`, `kee_todo_create`,
`kee_todo_update`, `kee_todo_delete`, `kee_undo` and `kee_redo`. Ledger status
exports only its revision. Ordinary valid mutations are automatic, not subject
to per-change approval. Exact ledger/resource revisions, permissions, MT
ceilings and durable replay are enforced by KEE.

An additional durable conversation ownership set prevents changing, depending
on or undoing another conversation's resources/changesets. New MTs must be in
the explicit write ceiling (itself a subset of selected read MTs); `null` is
application-global, never all MTs. The model cannot mark tasks done: KEE requires
real user-kind completion attestation. Mutation results expose only committed
receipts, changeset/resource IDs and revisions, not raw task text or audit images.
The local TODO inspector does not export its contents.

These are **application TODOs**, not KB assertions or Copilot session tasks.
Managed KB assertion edits, native annotation mutation, both source-loading
choices, GenerateComment, broad all-MT queries and operator/symbolic execution
remain unavailable through Teacher. No fake functions or load-approval fields
are emitted. The symbolic agent remains a separate non-LLM implementation.

Conversation files and the exact user-approved material they contain remain
in the repository-local application state directory. They are not deleted by
Stop. File reads reuse only a matching raw SHA-256 cache, capped at 32 entries;
new/changed bytes undergo the same owned-path/reparse checks.

## Validation commands

```powershell
swipl -q -g run_tests -t halt prolog\ow_dr\tests\test_llm_agent.pl
$env:LOGOS_CHROME='C:\Program Files\Google\Chrome\Application\chrome.exe'
node --test prolog\ow_dr\tests\llm-agent-ui.test.mjs
```

Tests launch an isolated loopback HTTP fixture, never the live emullm completion
endpoint, and use only synthetic text. `POWDER_AGENT_STATE` and
`POWDER_KEE_STATE_DIR` point at owned repository-local fixture directories and are
restored afterward. Tests include actual TODO commit/replay/update/undo/redo,
exact approval/freshness/corruption, full assistant/tool protocol rounds, lost
receipt blocking and real Chrome chip/preview interactions. No checkpoint
process, native KB or production listener is changed.
