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

## Validation

```powershell
swipl -q -g run_tests -t halt prolog\ow_dr\tests\test_llm_agent.pl
```

Tests launch an isolated loopback HTTP fixture, never the live emullm completion
endpoint, and use only synthetic text. Their state is repository-local scratch
and is removed afterward. No native KB or production listener is changed.
