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
| `llm/start` | POST | `{scope:{terms:[],readMts:[],writeMts:[]}}`; no inference |
| `llm/conversation?id=...` | GET | Status, text, events, raw reply and execution records |
| `llm/chat` | POST | `{id,revision,text,approvedNonsensitive:true}` |
| `llm/interrupt` | POST | `{id}`; interrupt current turn, retain conversation |
| `llm/stop` | POST | `{id}`; close conversation |

All routes require a real loopback peer and an exact owned HTTP Origin. Same-origin
browser GETs may instead supply an owned Referer, because browsers omit Origin on
many same-origin GETs. This is local browser-CSRF protection, not OS-user identity.
Bodies, schemas and revisions are checked. No browser/model URL, credential,
Prolog goal, file path, or administrative command is accepted.

Start records immutable prompt/model/policy/scope snapshots and sends nothing.
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
resumed after restart. Use Stop and a new conversation when needed.

The real `kb_kee` API is used for actual discovery, context grants and invocation.
The current export adapter connects only `kee_catalog_status`,
`kee_definitions`, and `kee_occurrences` when available. Definitions/occurrences
must match the real user's selected exact term and read-MT keys; no broad
all-MT term search or file reads are exposed. Results pass a bounded semantic
field projection, dropping source paths and arbitrary diagnostic metadata.
Context tokens stay host-only and expire/close. Every tool argument is parsed
as a JSON object and strictly schema-validated before invocation. Original
assistant `tool_calls` and matching `role:tool` IDs are retained for later rounds.

**Current limitation:** the managed mutation/audit/undo and todo bridge is
another owner's unfinished integration. This adapter advertises no mutation,
load, todo, GenerateComment or fake capability. The UI states this explicitly;
execution records for read tools are not claimed to be managed KB changesets.
The symbolic agent is separate and is not implemented by this module.

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
endpoint, and use only synthetic text. Their state is repository-local scratch
and is removed afterward. No native KB or production listener is changed.
