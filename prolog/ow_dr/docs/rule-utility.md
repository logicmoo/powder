# Observed rule utility

**Rule execution observations** appears on assertion-detail pages. It is separate
from the native truth/confidence editor and imported/configured Cyc utility.
Opening, refreshing, paging, or changing the display checkbox never executes a
rule, loads a KB, or saves settings.

The query console also displays **this query** observations, including queries
with no solutions. Proof cards can show the matching rule's whole-query totals
when *Observed rule utility* is enabled in the existing UI Settings. These are
not measurements of one particular proof step.

## Read API

The `kb_rule_utility_http` server module registers one read-only endpoint:

```text
GET <app-base>api/rule-utility
GET <app-base>api/rule-utility?id=a123&generation=70
GET <app-base>api/rule-utility?id=a123&generation=70&classic_stv=true&check_source=true
```

Parameters:

| Parameter | Default | Meaning |
|---|---|---|
| `id` | all rules | One stable assertion-occurrence ID, not a predicate name |
| `generation` | current snapshot | Expected generation; mismatch returns HTTP 409 |
| `offset` | 0 | Nonnegative observation-record offset |
| `limit` | 25 | 1–100 records |
| `sort` | `calls` | `calls`, `results`, `answersHelped`, `proofOccurrences`, `wallSeconds`, `cpuSeconds`, `inferences`, or `id` |
| `classic_stv` | false | Derive the optional Classic-STV usefulness display |
| `check_source` | false | Bounded original-source hash check; requires `id` |

Responses contain `scope:"cumulative"`, `generation`, `eligibility`, paginated
`items`, `lifetime`, and measurement limitations. Existing query responses carry
their invocation-local report in `utility`; the read endpoint does **not**
pretend another HTTP worker's last query is the requested query.

Snapshot leases protect native clauses while inspecting them. Store locking is
brief; there is no query-wide store mutex. The read endpoint does not dispatch
KB bodies or change completed telemetry totals.

## Identity and freshness

Measurements are separated by assertion ID, semantic rule/microtheory hash, and
observed generation. Different occurrences of the same predicate remain separate.
Changed rule content is never silently combined with the previous rule.

`identityState` describes the **loaded snapshot**, not the current disk bytes:

- `current`: matching loaded content and generation.
- `prior_generation`: matching content, explicitly older observed generation.
- `unknown_generation`: matching content whose observed generation was not recorded.
- `stale`: no matching loaded rule. Historical source locations are not invented.

Matching records include the current matching loaded assertion's source, line,
MT, and available loaded-source/output hashes. That location is explicitly **not**
represented as the location at the time of a historical observation.

An optional source check reads only the selected loaded source, at most 1 MiB
and 250 ms, once per response. It reports a matching hash, changed source,
missing source, or an explicit unchecked/unavailable reason. A changed source
does not invalidate the recorded observation of the still-loaded snapshot.
Large files are not silently called fresh.

## Measures and optional Classic STV

Only actual `x_cid_io/4` application entries count. Facts and static
`implies`/`equiv` assertions have no fabricated rule-use counts.

- **Calls:** after head matching and MT acceptance.
- **Results:** successful local body results; may exceed calls.
- **Answers helped:** distinct returned answers per query, summed across queries.
- **Proof occurrences:** every corresponding step in actually returned proofs.
- **Inclusive cost:** active wall time, thread CPU, and inference deltas. Nested
  and recursive costs overlap and must not be summed as whole-query time.

Unobserved numeric measures are null, not zero. Timings have platform resolution
limits and observer overhead; see `kb_rule_utility.pl` for the measured fixture
benchmark and full measurement contract.

The optional checkbox derives a **usefulness** pair, not native truth/confidence:
`strength = positiveApplications / trials`,
`confidence = trials / (trials + 800)`.
This follows the [historical OpenCog SimpleTruthValue convention](https://github.com/opencog/atomspace/blob/5b6302ca33eef491ca0f7331ba7558d7777c21a3/opencog/atoms/truthvalue/SimpleTruthValue.cc).
The pair is unavailable without comparable per-application evidence.

Each entered application can be positive once, only through a returned proof.
A negative requires both application and whole-query exhaustion without such
participation. Noncontributing partial/cancelled/timed-out applications stay
unknown. Recursion, correlated workloads, and censoring mean the display is not
calibrated statistical confidence. It never changes inference order or pruning.

Completed aggregate counts survive the saved-state export/import bridge.
Query-local proof tokens and timers do not. Legacy aggregate rows without
application attribution stay unavailable rather than being reconstructed from
incompatible raw counters. `reset_telemetry/0` remains a trusted host operation
that resets only telemetry; no HTTP reset or source-management endpoint is added.

## Focused validation

Load and run the PL-Unit suites `rule_utility`, `rule_utility_http`, and
`ow_runtime`. Existing runtime tests use temporary files: set `TEMP`/`TMP` to a
repository-local scratch directory when running them.

```powershell
node --test --test-concurrency=1 prolog\ow_dr\tests\rule-utility.browser.test.mjs prolog\ow_dr\tests\presentation.browser.test.mjs
```

The browser test starts a separate loopback server with five owned fixture
assertions, executes only its bounded fixture query, and cleans up. It never
contacts or reloads the live application.
