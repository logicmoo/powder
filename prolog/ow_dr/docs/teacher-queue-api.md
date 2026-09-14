# Teacher plaintext queue and conversation forks

Backend contract; all paths are relative to the existing application API mount.
The existing same-origin/loopback authorization applies. These are conversation
operations, not Git branches, KEE tools, or new KB mutation authority.

## Explicit actions

| POST path | Exact JSON keys | Result |
| --- | --- | --- |
| `llm/chat` | `id, revision, text, approvedNonsensitive:true` | Existing explicit plaintext Send; no grant when strictly eligible |
| `llm/queue/enqueue` | `id, revision, callId, text, approvedNonsensitive:true` | Append to the active conversation's durable FIFO |
| `llm/queue/resume` | `id, revision, approvedNonsensitive:true` | Start the next **unattempted** queued message |
| `llm/queue/cancel` | `id, revision, callId` | Cancel that still-queued entry |
| `llm/fork` | `id, revision` | Create and return a new conversation, without starting a model |

Each returns a complete conversation DTO. `revision` is the current DTO's
nonnegative integer revision. A stale revision normally returns HTTP 409; do
not automatically resubmit a mutation after rereading. `callId` is a
conversation-local string of 1–128 characters, chosen once per queued message.
An exact ID/text enqueue retry returns its existing state even with an older
revision, including after completion or cancellation. Reusing that ID with
different text returns `llm_queue_call_conflict`. An already-cancelled entry
can likewise be inspected by repeating its cancellation without another event.
Resume retries cannot replay an attempted entry: active work and stale
revisions are rejected.

Send/Enqueue/Resume must be explicit user actions under the existing provider
disclosure. The API acknowledgement is **not** a new checkbox requirement and
does not authorize KB data export. The provider can retain logs, reuse context,
and route externally. No action changes the user's saved model or settings.

## DTO additions

```text
plainTextEligible: boolean
branchOf: null | {id: parentConversationId, revision: parentSnapshotRevision}
queue: {
  state: "idle" | "waiting" | "running" | "paused",
  pauseReason: null | string,
  pending: integer,
  canEnqueue: boolean,
  canResume: boolean,
  maximumPending: 8,
  maximumEntries: 100,
  maximumTextCharacters: 8192,
  items: [{
    callId, text, createdAt, run: null | runId,
    status: "queued" | "running" | "completed" | "failed" |
            "interrupted" | "cancelled" | "outcome_unknown",
    error: null | {code, message, ...},
    startedAt?: unixSeconds,
    finishedAt?: unixSeconds
  }]
}
```

`GET llm/conversations` includes `branchOf` and queue summary fields, **without**
the `items` array. Open the selected conversation to read its own queue/history.
The existing conversation `sequence` advances only for actual persisted events,
not polling, history reads, or idempotent replays.

Enqueue is admitted only while this host owns that conversation's current
running plaintext turn. Queue entries never carry disclosure grants or tool
schemas. Selected terms, read/write MT scopes, approved grounding, tool-call
history/results, recorded tool calls, and active exact-grant turns disqualify
queueing. The server independently enforces this; hiding controls is not
authorization. The no-grant Send path also rejects inherited tool-call history.
Knowledge turns still need the existing exact, bounded disclosure workflow.

## Durable execution and limits

Entries are appended under the existing native conversation-file lock and
published atomically. A queued entry is durably marked running before provider
dispatch. Its ID and terminal status are retained; no refresh, restart,
reconnect, retry, or Resume replays an attempted entry.

Only successful completion of the current **owned** turn may drain the next
entry. Worker transfer, queue admission, and Interrupt/Stop share the host's
run mutex. Interrupt pauses remaining items and marks an attempted queued item
interrupted; Stop additionally closes the conversation. Failures pause the
queue. Resume starts only remaining queued entries, never a failed item.
New direct Send is refused while queued entries remain; explicitly Resume or
cancel them first. Unknown tool outcomes still block execution.

Queue auto-drain authority is bound to a volatile host epoch. On restart,
pending work requires explicit Resume. A persisted running turn without its
owned worker is `outcome_unknown`; reading it cannot start anything. Resume is
blocked until an explicit Interrupt resolves that host-side active state, and
even then only untouched entries may run. Provider cancellation/log erasure is
not promised. A queued attempted item remains interrupted/unknown, never
requeued.

Limits: 8 pending entries, 100 retained queue IDs per conversation, 8192
characters per nonblank message, 32 KiB serialized pending entries, and the
existing 100-turn, configured history/output/time/tool budgets. Enqueue checks
the projected history with pending user messages; dispatch checks again after
new replies. Each persisted conversation remains bounded to 1 MiB. Queue IDs
are not pruned and reused; start a new conversation after reaching its limits.
Dispatch/budget failures pause rather than skipping work or silently enlarging
limits. An enqueue response can become stale as the current turn progresses.

## Fork semantics

Fork requires the expected parent revision and rejects live workers, orphaned
running turns, and unresolved call outcomes. It copies only the latest completed
history checkpoint, immutable model/provider/settings and exact prompt snapshot,
and the same scope ceiling. It creates a fresh conversation ID and regenerated
host-context message, with explicit `branchOf` provenance. The parent file is
unchanged.

Forks have no worker, pending queue, call reservations, execution receipts,
TODO ownership, or automatic continuation. Their local turn counter starts at
zero; inherited history still counts against the unchanged byte budget. Tool
messages inherited as historical data are never executed or replayed; future
disclosure requires a new exact grant. New forks never inherit consent.
For pre-checkpoint legacy documents interrupted/failed mid-turn, the last
unfinished user/grounding block is excluded.

## Isolated validation

```powershell
swipl -q -g "load_files('prolog/ow_dr/tests/test_llm_queue.pl',[silent(true)]),run_tests([llm_queue,llm_forks]),halt"
```

Tests use repository-contained synthetic state, a gated synthetic transport,
actual owned workers and durable conversation files, plus a fresh SWI process
for restart readback. They do not contact the real provider or change live KB,
services, settings, or operator bridges.
