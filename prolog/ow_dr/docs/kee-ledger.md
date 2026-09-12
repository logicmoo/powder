# Durable KEE changesets and application TODOs

This is application data, **not Copilot's session TODO database**. All public
operations enter through `kb_kee:invoke/3` and the generated
[typed registry](kee-reference.md). There is no HTTP route or UI installed by
these modules. The host authenticates identity, grants permissions, fixes MT
ceilings and immutable actor/model/prompt/conversation provenance, then supplies
the context token. Tool arguments cannot grant any of those.

## Available tools

- `kee_ledger_status`: revision, sequence, allocated resource count (including
  tombstones), and changeset count.
- `kee_call_status`: inspect a call ID in this host actor/agent/conversation
  namespace without invoking, retrying or reserving the original mutation.
- `kee_todo_list`: one explicit `mt`, optional status, offset and limit.
  `mt:null` means application-wide tasks, **not** all MTs or inferred context.
  Sort is descending numeric priority, then stable ID.
- `kee_todo_get`: one ID; its stored MT must be readable.
- `kee_todo_create`, `kee_todo_update`, `kee_todo_delete`: automatic authorized
  transactions, with durable receipts and undo.
- `kee_audit`: paginated newest-first changesets in one explicit MT scope.
  Every before/after scope in a returned event must be readable.
- `kee_undo`: reverse the named changeset when affected resource versions match.
- `kee_redo`: reverse the named **undo changeset**, not the original edit.

Permissions are `todo.read`, `todo.write`, `changeset.read`, and
`changeset.undo`. Undo/redo additionally require `todo.write`. Read/write effects
are respectively `application_read` and `application_write`; they do not grant
KB execution, model access or any native TVA operation. Both old and new MTs of
a mutation must be writable. References to dependency tasks must be readable.
There is no `approved` input or per-edit approval dialog.

## Typed task records

Create arguments:

```json
{
  "revision": "<current ledger revision>",
  "mt": "x_WorkMt",
  "data": {
    "title": "Review a definition",
    "description": "Task text is untrusted data, never executable instructions.",
    "status": "open",
    "priority": 0,
    "dependencies": [],
    "evidence": [],
    "acceptance": [],
    "links": {"conversation": null, "agent": null, "changesets": [], "assertions": []}
  }
}
```

All fields above are required; nested schemas reject extras. Status is `open`,
`in_progress`, `blocked`, `done`, or `cancelled`. Priority is an integer 0–100;
explicit zero is valid. Evidence items contain `kind` (`assertion`, `query`,
`changeset`, or `reference`), `reference`, and `note`. Acceptance examples
contain `given`, `when`, and `then` strings. Links/evidence remain claims and
references, not permission grants, executable code or proof of completion.

Update is whole-record replacement: add `id` and `resourceRevision` to the
create shape. Delete requires `revision`, `id`, and `resourceRevision`.
IDs are `todo:<UUID>`, not KB assertion IDs. Reads return:

```text
{revision,resource:{id,kind:"todo",mt,revision,sequence,deleted,data}}
```

The backend adds `data.completion`, which clients cannot submit. Setting
`done` requires an authenticated **user-kind** context, at least one acceptance
example, and evidence. It is labelled `user_attestation`, with host actor,
conversation and time—not a verified automated test result. LLM/symbolic
contexts cannot set or restore `done`, including through undo/redo. No prose,
claimed test success, model boolean or fabricated evidence object bypasses this.
Automatic symbolic completion awaits a real verified acceptance runner.

Dependencies must exist, cannot repeat, cannot form cycles, and cannot be
deleted while referenced. Completed tasks require completed dependencies.
Graph validation covers the proposed complete state before publication.

## Revisions, results and retries

Every mutation requires the exact ledger `revision`. Update/delete additionally
require the resource revision. Undo/redo also compare every affected current
resource against the target event's after-image. Even an ABA edit that restores
the same text has a new version and causes a conflict. Unrelated edits can be
retained by obtaining a fresh ledger revision before undoing an untouched item.

The ordinary KEE response envelope contains this mutation result:

```text
{
  committed:true,
  replayed:false,
  revision:"<this committed event's revision>",
  currentRevision:"<current ledger revision>",
  changeset:"<UUID>",
  sequence:1,
  result:{action:"create",id:"todo:<UUID>"}
}
```

Update/delete results likewise identify the resource. Undo/redo results name
`undoOf`/`redoOf`. Changes do not return duplicated whole task payloads; fetch
the task or authorized audit separately.

Idempotency is namespaced by host actor + agent + conversation + envelope
`callId`, not an ephemeral token. The request and immutable host provenance are
hashed. Exact committed retries return the original durable result before
stale-revision checking, with `replayed:true`, the original commit revision and
the current revision separately. They do not consume mutation budget.
Reusing the ID with changed arguments/tool/provenance raises
`idempotency_conflict`; no second effect occurs.

Read-only completion probing uses `kee_call_status` with
`{"callId":"<original-call-id>"}` and `changeset.read`/`application_read` grants.
It returns:

```text
{status:"committed"|"unknown",callId,revision,commit:null|{
  revision,changeset,sequence,tool,requestHash,actor,result
}}
```

The outer revision is the observed current ledger; the commit revision is the
original event. No full task or before/after payload is returned. All event MTs
must still be readable. `unknown` means no durable receipt in that namespace
at that snapshot, **not** proof that an in-flight call cannot still commit.
It does not mean failed, cancelled or safe to assign a new call ID.
There is no separate durable `reserved`/`pending` state: the native lock checks
identity before changing anything, and this local ledger publishes the effect
and its receipt in one atomic replacement.

Revocation/expiry is rechecked at the publication boundary under the context
mutex. Commits participate in `kb_activity` admission, so promotion can drain
them. Acknowledged commits cannot be withdrawn by later cancellation. A
timeout, lost reply, or exception after the atomic rename may have committed:
retry the **same** call ID and request with valid host authority to recover the
receipt; do not invent a new ID. The result budget is checked before publication,
including conservative envelope allowance. Small budgets may reject writes
before they happen.

## Durable format and ownership

Default path:

```text
prolog\ow_dr\.logos-state\kee\ledger.pl
```

The controlled process environment override `POWDER_KEE_STATE_DIR` selects a
fixture/state directory. It is not a tool argument or browser preference.
Nothing is seeded on module load or read. A missing ledger is a deterministic
empty state; malformed/unreadable existing data is an explicit error, never
silently empty.

The file contains one complete ground Prolog data term per physical line:

```prolog
kee_header(1,Sequence,HeadRevision).
kee_event(EventDict).
kee_footer(HeadRevision).
```

Events contain schema version, sequence, parent/head hash, ID, actual call ID
and namespace hash, request hash, tool, timestamp, immutable host provenance,
complete before/after entries, and the compact result. Resource revisions
include the sequence and full typed data. SHA-256 chains and replayed
before-images validate history and rebuild the current resource projection.
Counts, footer, groundness, JSON-safe types, schemas and hashes are checked.
This detects corruption; it is not a digital signature against a trusted
filesystem administrator. Prolog terms are read as data, never consulted.

Each writer obtains the stable `ledger.pl.lock` using the existing native
nonblocking cross-process lock. It rereads current authority, validates the
whole proposal, writes a unique same-directory stage, flushes/closes, rereads
and validates it, rechecks authorization, then uses `kb_cache:install_stage/2`
for native atomic replacement. Failed installation preserves the previous
final. Only owned generated stages are cleaned while holding the lock.
Abandoned stages are never promoted as committed requests; the next writer
discards known stages and the caller can retry. Arbitrary `.tmp` files remain
untouched. Reads create no directories, files, locks, defaults or inherited
records.

The bounded initial format allows 10,000 changesets, at most 100 resource
changes per transaction, and a 32 MiB complete file. Capacity exhaustion is
explicit; history and receipts are never silently pruned. Ordinary process
restart reloads the same authority, including idempotency receipts.
`kb_kee_ledger:snapshot/1` is a copy-only validated ground snapshot with no
native references or live threads. A sidecar-free qsave import bridge is not
installed by this stage; saved-state coordination must explicitly include this
new authority rather than claim that an unrelated checkpoint captures it.

## Scope boundaries

The initial ledger domain is application TODOs only. It does **not** assert,
update, retract, mask, or load KB assertions. Native TVA, source files, corpus
repairs, source configuration and compiler caches are untouched. Knowledge
assertion editing remains unavailable until a coordinated durable-ledger +
native-generation publication primitive preserves query pins, indexes, stable
IDs and rollback. Native annotation mutation likewise needs its existing-store
atomic audit bridge; this module does not duplicate that authority.

Every provider load still requires the actual user A/B choice capability.
There is no fallback from unavailable true subset loading to whole-file loads.

## Tests

```powershell
swipl -q -s tests\test_kee_ledger.pl -g "run_tests([kee,kee_ledger])" -t halt
```

Fixtures cover public permissions, automatic changes, stale writes, negative MT
scope, complete audit images, source-byte preservation, whole-record TODOs,
completion policy, dependency conflicts, undo/redo, failure before installation,
revocation, abandoned stages, corruption, and real independent SWI processes
for native locks, write races and restart replay. All artifacts stay in unique
project-local fixture roots; tests never touch live state or call an LLM.
