# Four text agents

Open **Agents** in powder's main navigation
(`http://localhost:3050/swish/openworld_dr/#/agents` at the default mount).
The four tabs are **Teacher**, **Cyc**, **Copilot**, and **Codex**.
They have independent conversations, drafts, settings, status, and permissions.
Changing tabs or visiting another powder page does not send a message, stop a
run, or recreate an operator frame. Unread counts are per conversation; a role
not yet connected is labeled **unread not checked**, not falsely up-to-date.

## Teacher

The knowledge teacher uses emullm at `http://127.0.0.1:8801/v1`, initially with
the exact saved model **`gpt-5.6-sol`**. **Refresh models** only reads discovery;
changing the model or prompt affects new conversation snapshots. An unavailable
model is an error, never a reason to substitute another.

Review the provider disclosure before sending anything. The provider retains
requests/replies, may reuse contexts, and may route externally. Localhost does
not make private KBs or application code safe to export. Only explicitly
selected, previewed, approved nonsensitive material may accompany a chat.
Changing disclosure-bound settings or evidence invalidates the approval.
Local inspectors do not themselves export their contents.

The host, not model output, validates typed KEE calls and permissions. Ordinary
permitted TODO mutations use revision checks, durable call identities,
changesets, and undo. Unknown outcomes are inspected, never automatically
retried. General source/KB CRUD and native annotation writes are **not**
implemented as audited KEE mutations and are not advertised as available.
Generated comment proposals are not saved KB assertions.

Interrupt/cancel is best effort: it stops further host dispatch but cannot
erase provider logs or guarantee that upstream processing stops.

## Cyc

Cyc is a separate knowledge-defined symbolic runtime. It does not use an LLM,
the Teacher, Generate Comment, or either CLI operator, directly or indirectly.
Its grammar, lexicon, dialogue, goals, plans, templates, and policies are Cyc
knowledge interpreted by a bounded host. Ordinary implication and `<==` remain
data. Missing language or procedural knowledge is an inspectable capability gap.

For a first conversation, choose **Knowledge → Cyc starter → Start**.
This finite app-owned KRF profile understands `hello`, `help`, `capabilities`,
and `new todo` (a typed form with audited TODO creation). **Continue** advances
planned actions. It is read as an isolated program, never added to the live KB.

Program selection is explicit. Loaded-knowledge programs require their
definition and linked MTs; unrelated source files are not silently loaded.
State, proofs, action receipts, and capability gaps remain inspectable.
Host permissions are a ceiling that editable knowledge cannot enlarge.
See [the symbolic host contract](symbolic-agent.md) for the supported vocabulary
and bounds, rather than assuming general English understanding.

## Copilot and Codex

These are privileged, human-controlled code/service operators, **not KEE
tools**. Both use the primary checkout on `master`. They retain independent
native sessions, transcripts, drafts, command identities, permissions, and
cancellation. Start only the intended operator. If the other is active, a
warning recommends one at a time; explicit **Start anyway** is permitted.
It does not approve native tool requests or protect against concurrent edits.

The embedded controls are served by the independent Python bridge at
`http://operator.localhost:8063`, not by Prolog. Pair within the isolated
operator surface. Credentials never pass through the parent workspace.
The parent cannot send commands through the frame handshake; Start, Send,
approval, cancellation, and Stop remain operator-origin actions.
Neither opening a tab nor reconnecting starts a native model turn.

The standalone recovery UI remains at `http://operator.localhost:8063/`,
including while Prolog is offline. Browser refresh replays output, not
commands. Unknown in-flight outcomes require inspection before a human retry.
See [bridge installation, authentication, and recovery](../operator_bridge/README.md).
An authorized Windows launcher can use an owner-private pairing file beneath
`operator_bridge\.state`; the human reads it locally and pairs inside each
operator frame. It is not a provider credential, and its value must never be
copied into chat, URLs, Prolog configuration, or logs.
If a nondefault bridge port is configured, also set the host-owned
`POWDER_OPERATOR_PORT` before starting powder. Browser input cannot change
the bridge host, executable, repository, or working directory.

## Storage and safety

Teacher and symbolic state use app-owned storage, not source corpus repairs.
The KEE ledger stores durable application state and audited changesets.
Operator state lives in separate provider journals under the bridge's private
state directory. Browser preferences/drafts are local data, not a privacy
guarantee; do not put credentials in chat.

No role starts automatically on app load. Backend code publication uses the
normal application reload; it does not reload KB sources, reset native TVA,
change startup selections, or enable checkpoint automation. A browser refresh
alone does not reload Prolog code.
