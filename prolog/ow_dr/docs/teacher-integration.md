# Teacher integration

Teacher is a text-only model client, not Cyc or either operator. It cannot
delegate to them. General KB CRUD and saved comment writing remain unavailable.
**Generate Comment produces an unsaved AI proposal**, never a claimed write.

The default provider is exactly `http://127.0.0.1:8801/v1`, model
`gpt-5.6-sol`. Refresh reads the provider's actual model catalog; only an
explicit revision-checked selection changes it. **Explicit model** accepts a
typed model ID, with discovered models offered as suggestions. Refresh preserves
the typed value; Save agent settings persists its exact spelling. An unavailable
model stops the request. There is no application fallback. The provider retains payloads/logs,
reuses contexts and may route externally: loopback is not a privacy guarantee.

## Container contract

```js
await createLLMKnowledgeAgent(host, {
  route, signal, active, onConversationChange, onStateChange, storage
})
// -> {element, activate(), deactivate(), getState(), destroy()}
```

The host supplies the existing `api`, `element`, `button`, and `heading`
functions. The controller owns only Teacher. It does not rewrite the containing
workspace URL. `route.params.get('conversation')` opens a specific history.
`onConversationChange` receives `{agent, identity, id}`.
`onStateChange` receives the same local snapshot as `getState()`:
`agent`, `identity`, `active`, `disposed`, `conversationId`, `revision`, `turns`, `sequence`, `error`, `status`,
`backendStatus`, `connection`, `model`, `pending`, and `draft`.

`sequence` is the nonnegative per-conversation durable event counter, independent
of the 200-entry display-log bound. Ordinary polling never increments it.
`error` is a current transport/client error string, backend error object, or null.
The containing workspace can derive unread state from sequence deltas.

Deactivation hides the view and pauses polling without cancelling backend work.
Reactivation always reads the latest conversation, including previously idle
ones. The supplied signal must have controller/app lifetime, not route lifetime.
Destroy aborts browser requests, not submitted model/tool work. Reconnect reads
status; it never resends a chat or mutation. A persisted running turn without a
live host worker is reported as `outcome_unknown`, not as still progressing.
Unknown/reserved mutation calls continue blocking new turns; local receipt
inspection does not silently unblock them.

Drafts use the optional Storage-compatible object (default browser localStorage),
with keys `powder.teacher.draft.v1:<conversation-id>`. Only bounded draft text
is stored. Consent, grant IDs, provider payloads and inspector data are **never
restored from browser storage**. Storage denial keeps the in-memory draft.
Settings and exact file-backed prompt bytes/hash are frozen per conversation;
editing the prompt affects new conversations only.

## HTTP contract

All paths are relative to the application API mount and retain the existing
loopback/same-origin host authorization. Starting, previewing, approving,
history and inspectors do not contact the model.

1. `POST llm/start`: `{scope:{terms:[],readMts:[],writeMts:[],grant:null}}`.
   Set bounded canonical selectors before starting. Terms are not permission
   to export their contents.
2. `POST llm/grounding/preview`:
   `{conversation,revision,text,mode,automaticTodos,requests}`.
   `mode` is `chat` or `generate_comment`. Each request is
   `{tool,arguments}`. At most eight read requests, five results each.
   The UI selects up to three term/MT pairs; empty context supports text-only
   previews. Enabling automatic TODOs also previews the current ledger revision.
3. The returned local document contains the exact outgoing `messages`,
   projected `entries` with identity/revision evidence and hashes, actual
   permitted registry-derived `tools`, and `binding`: conversation/revision,
   actor/agent/policy, provider/model, settings revision/hash, immutable prompt
   hash, scope, text, action, TODO permission and retention notice.
   Source paths are not copied into model evidence; source identity is hashed.
4. `POST llm/grounding/approve`: `{id,hash,approvedNonsensitive:true}`.
   Only the current complete exact document is approved. The user must inspect
   it and affirm that **all** material is authorized and nonsensitive.
5. `POST llm/chat`:
   `{id,revision,text,grant,approvedNonsensitive:true}`.
   The five-minute grant is consumed once. A changed conversation, text,
   provider/model/settings, disclosure, registry, evidence or expiry rejects
   it. A host restart invalidates pending/approved grants rather than restoring
   consent. Chat/Generate remains an explicit separate action after approval.

The old `{scope,requests}` preview remains local-only and cannot be approved.
The legacy empty-scope text-only Chat request remains supported without tools;
it cannot export grounding or old tool history without a new bound preview.

Read calls may use only an approved exact request and return only its approved
projection. Evidence is revalidated at approval, admission and before outgoing
rounds; reads never send a newly discovered raw result. There are no general
search/query, file, shell, administrative, symbolic or operator tools.

Only actual typed `kee_todo_create/update/delete`, `kee_undo` and `kee_redo`
may mutate this conversation's owned TODOs/changesets, under KEE schemas,
permissions, MT/revision checks, budgets, durable audit and idempotent call IDs.
After a mutation batch the model loop stops: receipts remain local. A later
explicit preview may disclose only then-known, inspected material; this is not
blanket consent to future tool results. No automatic retries occur on conflicts,
cancellation, disconnects or unknown outcomes.

- `GET llm/conversations?offset=0&limit=25`: bounded history summaries, newest
  changed first; maximum page size 50.
- `GET llm/conversation?id=...`: conversation/status and recorded outcomes.
- `GET llm/todos?id=...`: local owned TODOs and up to five recent undo/redo
  candidates. Current resource/dependency conflicts can still reject undo.
- `POST llm/todos/undo`: `{id,action,changeset,revision,callId}`, where action is
  `kee_undo` or `kee_redo`. This is a local action, never a model request.
- Existing `llm/receipt`, `llm/interrupt`, `llm/stop`, settings, model and prompt
  endpoints retain their contracts.

Audit/receipt/TODO inspection never appends inspector output to model history.
Undo does not delete source files or restore consent. All rendering is inert
text. Prompt, KB, model and tool content cannot change permissions.

## Isolated validation

From the repository root:

```powershell
swipl -q -g "load_files('prolog/ow_dr/tests/test_llm_agent.pl',[silent(true)]),run_tests([llm_settings,llm_unicode,llm_chat,llm_schema,llm_kee,llm_receipts,llm_export_hold,llm_bound,llm_selected_catalog,llm_sequence]),halt"
$env:LOGOS_CHROME='C:\Program Files\Google\Chrome\Application\chrome.exe'
node --test prolog\ow_dr\tests\llm-agent-ui.test.mjs
```

Tests use repo-contained disposable state, a synthetic loopback provider and a
synthetic catalog. They never query a real model, export the private corpus, or
reload/restart the production application. Browser tests use an isolated profile.
