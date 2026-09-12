# Metadata allocation audit and explicit maintenance

The authoritative retention policy remains
`kb_metadata_policy:retention_policy(non_sumo_originals_v1)`.
Only its approved redundant original-representation properties are candidates.
SUMO originals remain. KRF, MELD and MeTTa are non-SUMO; unknown origin is
explicitly reported and uses the non-SUMO drop policy. A global mapping row
does not establish SUMO origin. Intentional `cnf`/`cyc::cnf`, creator, source
linkage, MT, variable names, compact representation evidence and other
meaningful properties are not removed.

## Read-only API

For an already-running, authorized local application, prefer the asynchronous
API instead of putting a full audit inside a short HTTP/debug-console timeout:

```prolog
kb_metadata_audit:start([seconds(30),serialized(redundant)],Ticket).
kb_metadata_audit:status(JobId,Reply).
kb_metadata_audit:cancel(JobId).
```

`JobId` is the atom in `Ticket.id`. In the raw debug console use
`get_dict(id,Ticket,JobId)` rather than unevaluated dict functional notation.
Only the host may publish new modules into its running application. Calling
an audit never reloads sources or applies retention.

There is one background audit at a time. Terminal states are `completed`,
`failed`, `timed_out` and `cancelled`. Polling returns only small aggregates;
no source/property payloads are stored in the job registry. At most four
completed reports are retained, and the registry is volatile for saved images.
Cancellation is cooperative at property/record boundaries. Work and acquisition
are time-limited; mandatory lease cleanup still runs on timeout. All exit paths
release query/application leases.

For scripts with sufficient time:

```prolog
kb_metadata_audit:audit([seconds(30),serialized(none)],Report).
kb_store:metadata_retention_stats(Report). % Default audit options
```

`seconds` defaults to 30 and accepts 0.01–120.
`serialized` is `none`, `redundant` (default), or `all`.
`all` additionally formats every property and is intentionally more expensive.
Use the default to measure candidate payload bytes without formatting retained
properties.

## Coherence and memory

The audit obtains ordinary application admission and pins the current native
modules with the existing query-snapshot mechanism. One SWI database snapshot
then covers source registration, native metadata and JSON assertion rows.
The store mutex is used only for pin acquisition/release, **not** the scan.
Concurrent publication can continue; pinned modules cannot be unloaded.
If publication changes the generation, the report is marked `stale:true`.
Missing source information, unmanaged/duplicate IDs or inconsistent row counts
are errors, not incomplete successful reports.

Origin classification uses only stored hints and the shared pure path/dialect
policy. The audit never opens, hashes or reparses sources/caches. Predicate
enumeration is once per module, JSON rows are scanned once, and ID/module
associations avoid repeated assertion scans. Intermediate state is IDs, source
descriptors, counters and one reusable serialization buffer—not a second
metadata collection or semantic-clause index.

Reports have schema `powder.metadata-audit.v1` and six `byOrigin` rows:
`sumo`, `non_sumo`, `unknown`, each for `native` and `json`.

| Field | Meaning |
|---|---|
| `assertions`, `propertyCount` | Actual occurrences in that store/origin, not distinct property names. |
| `redundantPropertyCount` | Properties the approved policy would remove; SUMO originals are not candidates. |
| Native `liveClauseBytes` | Sum of SWI `clause_property(Ref,size(Bytes))` for live metadata fact clauses. |
| Native `redundantLiveClauseBytes` | Actual live clause storage occupied by candidate metadata facts. |
| JSON `liveClauseBytes` | Actual storage of **whole** `kb_store:assertion/2` rows, including semantic/browser fields. Not a property-only allocation figure. |
| `predicateAllocatedBytes` | Native predicate/index/administrative allocation reported by SWI; may include not-yet-reclaimed storage. JSON per-origin attribution is unavailable (`null`). |
| `runtimeAllocation.assertionRowPredicate` | SWI allocation for the shared assertion-row predicate, across origins. |
| `termCells`, `redundantTermCells` | `term_size/2` of reconstructed individual properties. Heap-cell estimates, not stored clause allocation; shared/external atoms are not fully accounted for. `termCellBytes` gives native word size. |
| `serializedUtf8Bytes`, `redundantSerializedUtf8Bytes` | Optional canonical **Prolog UTF-8 serialization** sizes, not JSON wire size or runtime allocation. Unmeasured values are `null`, not fictitious zeroes. |

Native and JSON are different resident representations. Do not interpret their
serialized sizes as saved memory, add reconstructed-term estimates to actual
clause storage, or call these figures RSS. JSON candidate-only clause allocation
cannot be isolated, so `redundantLiveClauseBytes` is `null` there. Zero candidate
properties truthfully means zero candidate payload bytes.

The audit excludes runtime-only `xc_src`, clause handles, lazy variable-name
views and derived constant-index predicates. Existing role/NAT projections
already exclude large raw originals, are policy-versioned and volatile; this
audit does not build them.

## Explicit parent-controlled cleanup

No audit authorizes a mutation. After reviewing a completed non-stale report,
the parent must explicitly choose whether cleanup is needed:

```prolog
get_dict(identity,AuditReport,Expected),
kb_store:apply_metadata_retention(Expected,CleanupReport).
```

The action obtains/reuses an **owner-held admission lease**, takes the code and
store mutexes nonblockingly, and rejects active application work, query pins,
native references and retired native modules. It checks generation, concrete
manifest/native-module identity, assertion IDs and retention policy. Stale or
busy requests fail without modification; there is no restart, unload, retry
loop or automatic selection replacement.

Cleanup rechecks actual metadata under this exclusive maintenance envelope.
Only affected native metadata facts and JSON property rows change. Changes are
transactional; failures roll back. Canonical clauses/native references, query
behavior, IDs, source selection and generation remain unchanged. The role/NAT
cache is invalidated only after actual successful pruning. Existing cache-read,
native-load and saved-state filters prevent old blobs from returning; the
maintenance action writes no source or cache files.

If both candidate counts are zero, `changed:false` and both removed counts are
zero. **No rows, source descriptors or derived caches are rewritten.** This is
an honest no-op, not a claim that memory was reduced.

`apply_metadata_retention_locked/1` remains the isolated saved-state adapter.
Its caller must already own both mutexes; it additionally requires/acquires an
owner-held admission lease. When nesting inside
`kb_jobs:with_saved_state_snapshot/1`, establish the owned admission/checkpoint
lease **before** that wrapper. An anonymous `with_exclusive_reload/1` gate is
not proof of ownership and is rejected. Ordinary audits must not run inside a
maintenance lease.

Before/after cleanup reports omit serialization and separately measure actual
live clause changes. Erased clause/predicate memory can remain allocated until
SWI reclaims it; the action does not force garbage collection or claim an
immediate RSS decrease.

## Isolated validation

Fixtures use generated files under `tests\artifacts`, never the source corpus:

```powershell
swipl -q -s prolog\ow_dr\tests\test_metadata_audit.pl `
  -s prolog\ow_dr\tests\test_metadata_retention.pl `
  -s prolog\ow_dr\tests\test_saved_state.pl `
  -s prolog\ow_dr\tests\test_job_saved_state.pl `
  -g "run_tests([metadata_audit,metadata_retention,saved_application_state,job_saved_state])" -t halt
```

Coverage includes actual native allocation, UTF-8/buffer reuse, SUMO and
intentional CNF preservation, unknown origin, real selective pruning,
unchanged proof/semantic references, zero-removal clause-reference stability,
rollback, stale audits, short locks, concurrent publication, cancellation,
timeouts, saved-image restore, and a 55-source/16,815-assertion synthetic audit.

Measured on the development Windows/SWI 10.1.7 installation: the 55-source,
16,815-assertion fixture audited 100,890 native properties and 100,890 JSON
properties in **1.743 seconds** with default candidate-only serialization.
Native live metadata clauses occupied 11,703,240 bytes; whole JSON assertion
rows occupied 29,728,920 bytes. Both candidate counts were zero. These are
fixture measurements, not promised production latency.

A separate two-assertion fixture with two 2-KiB non-SUMO original properties
showed actual live native metadata clause storage changing from **5,712 to
1,392 bytes**, and whole JSON row storage from **7,856 to 3,536 bytes**.
Exactly two native and two JSON properties were removed; semantic clause
references, IDs, canonical CNF, creator/names/MT and query proofs were unchanged.
No immediate RSS reduction is asserted.
