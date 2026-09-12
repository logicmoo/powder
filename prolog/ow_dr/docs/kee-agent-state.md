# Durable agent lifecycle data

These tools extend the existing KEE ledger, not a parallel run/log store.
They record data only: **no agent launch, cancellation, plan execution,
delegation, LLM/network call or KB load occurs**. The host owns its real bounded
interpreter and reconciles runtime activity with recorded state.

Use the existing `kb_kee:registry/2` and `invoke/3` contracts. Do not call private
adapter methods or manufacture authority from agent knowledge. All schemas are
in the generated [reference](kee-reference.md).

## Capabilities and authority

| Function | Permission | Effect |
|---|---|---|
| `kee_agent_run_create` | `agent.run.write` | `application_write`, `agent_state_control` |
| `kee_agent_run_event` | `agent.run.write` | `application_write`, `agent_state_control` |
| `kee_agent_run_get` | `agent.run.read` | `application_read` |
| `kee_agent_run_list` | `agent.run.read` | `application_read` |
| `kee_agent_run_events` | `agent.run.read` | `application_read` |

Use a **host-only lifecycle context** for writes. Do not place its token or
`agent_state_control` grant in a KB-authored action's authority/allowlist.
Action execution uses a separately restricted context through the same registry.
LLM-kind contexts cannot create/change run state even if accidentally granted
these permissions. Symbolic host controllers may record state; this is not
delegation. `agent_delegation`, `llm`, `network`, `proxy` and `generate_comment`
remain hard-denied for symbolic contexts.

The run owner is captured from host `actor`, `agent`, and `conversation`.
Owner identity, source manifest and MT cannot be replaced by events. Reads and
writes require the stored MT grant and the same actor/agent. An additional
explicit host `agent.run.inspect_all` grant permits cross-owner **reads only**.
Generic audit and call-receipt inspection enforce this ownership boundary too.
Do not restore permissions, native thread handles or context tokens from data.

## Create

Arguments:

```json
{
  "revision": "<ledger revision>",
  "mt": "x_WorkMt",
  "sourceJson": "{\"entity\":\"x_MyAgent\",\"definitionRevision\":\"...\",\"generation\":2}",
  "stateJson": "{\"cursor\":0}"
}
```

`sourceJson` is the host's immutable provenance manifest (references, IDs,
versions/hashes, not duplicate source files/formula blobs). Its normalized JSON
hash is stored as `sourceRevision`; this is **manifest identity**, not a claim
that KEE independently verified every source reference. The host must bind and
validate its actual definition/catalog snapshot. MT is explicit, not inferred.

`stateJson` is a bounded JSON-object cursor/state payload, not a Prolog term.
The object-string interface keeps function schemas closed while allowing the
host's typed FSM representation to evolve. Payload contents are inert data,
never identity/permission grants or instructions. Use a JSON encoder, not
`term_string/2` on native Prolog objects.

Create allocates `run:<UUID>`, phase `created`, step/event sequence zero and a
`created` event, atomically. The mutation result's compact payload is
`{action:"create_run",id,eventSequence:0}` in the standard durable KEE receipt.
Creation does not schedule anything.

## Compare-and-swap state + event

`kee_agent_run_event` arguments:

```json
{
  "revision": "<ledger revision>",
  "id": "run:<UUID>",
  "resourceRevision": "<run revision>",
  "expectedEvent": 0,
  "status": "running",
  "step": 1,
  "stateJson": "{\"cursor\":1}",
  "eventKind": "transition",
  "eventJson": "{\"reason\":\"host accepted start\"}",
  "action": null
}
```

Every field is required. Status is `created`, `running`, `paused`, `stopped`,
`completed`, or `failed`. Steps cannot decrease. Event kinds are `transition`,
`dialogue`, `goal`, `plan`, `action_intent`, `action_outcome`, `log`, `stop`,
or `error`. Each commit increments the run event sequence exactly once.
Global ledger revision, resource revision and expected event sequence all
participate in CAS. Identical envelope `callId` retries return the original
durable receipt without advancing again.

Terminal phases cannot silently resume. They may accept late log/outcome events
without changing terminal phase. A stop-kind event must record `stopped`.
These are recorded host phases, not runtime side effects: the host must actually
cancel/stop its worker and check the stop state before further dispatch.
`completed` does not mark an application TODO `done` or prove acceptance.

For action intent/outcome, `action` is required:

```json
{
  "tool": "kee_todo_create",
  "callId": "<separate stable action call ID>",
  "status": "committed",
  "commitRevision": "<actual KEE event revision>"
}
```

Action status is `planned`, `dispatched`, `committed`, `unknown`, `read_complete`,
or `failed`. Non-committed statuses require `commitRevision:null`. Intent accepts
only planned/dispatched. Lifecycle-control functions cannot be recorded as
executable action capabilities. The controller must retain the actual tool's
permissions/effect ceiling; no record grants a new capability.

For `committed`, the backend verifies an actual durable receipt in the current
host actor/agent/conversation namespace, its exact tool and commit revision,
and current read authority over its affected MTs. Fabricated success is rejected.
Read-only tools have no mutation receipt: `read_complete` is a host observation,
not durable mutation verification, and cannot be used for a mutating tool.

The state-event envelope call ID **must differ** from its action call ID.
Use stable per-run/per-step intent, action and outcome IDs. Persist exact
in-flight request/provenance data in the bounded cursor/event payload if retry
is needed; never serialize credentials or authority tokens. If it cannot fit,
stop before dispatch rather than execute an unrecoverable operation. Probe
`kee_call_status` after an ambiguous outcome; unknown is not proof of failure.
Reconstruct current host authority, never permissions from a stored manifest.

## Reads and durability

`kee_agent_run_get` takes `{id}` and returns `{revision,resource}`.
Resource data contains `owner`, `sourceJson`, `sourceRevision`, `stateJson`,
`status`, `step`, `eventSequence`, and `lastEvent`.

`kee_agent_run_list` requires an explicit `mt` with optional `offset`/`limit`.
It returns authorized summaries only: IDs/revisions, owner/MT, phase, step,
event count and source-manifest identity—not cursor/dialogue payloads.

`kee_agent_run_events` takes `{id,offset?,limit?}` and returns chronological
paginated events with changeset/revision, host actor/time, resource revision,
phase/step/event sequence and the inert event payload. This is a projection of
the existing authoritative changeset history, not another mutable event store.

Source/event JSON objects are bounded to 16,384 characters, state to 65,536,
with maximum structural depth 32. Duplicate JSON properties, non-object roots,
Prolog text and nonfinite data are rejected. Keep cursor state compact and
append dialogue/log deltas; do not accumulate/rewrite the entire conversation.
The shared ledger's capacity, native locking, atomic replacement, idempotency
and promotion-admission rules apply. Ordinary restart and independent-process
replay are tested. The new domain does not install a sidecar-free qsave bridge.

Run history cannot be deleted or undone through TODO tools or `kee_undo`.
Reversing metadata cannot undo executed actions; create a new run instead.
Actual managed TODO/KB mutations use their own authorized compensating changes.
No KB assertion editing or native TVA mutation is introduced here.

These records can contain sensitive dialogue/knowledge. Local read authority
is not permission to forward them to emullm, logs outside the application, or
another provider. The host's explicit approved-material boundary still applies.
