# Teacher operation timing

Timing is display-only host observation. It does not admit work, select a
provider worker, prove worker health, or enlarge disclosure/tool authority.
Send, Enqueue, Drain, conversation creation and initiation make no discovery
or model-detail requests. The exact saved model is still passed to emullm once
per actual completion request, without rewriting or fallback.

## Conversation DTO

`GET llm/conversation` and existing action responses add:

```text
timing: {
  supported: boolean,
  clock: "native_monotonic_milliseconds" | null,
  current: Trace | null,
  last: Trace | null,
  queued: [{callId, elapsedMs: number | null}]
}

Trace = {
  runId: string,
  requestId: string | null,
  turn: integer | null,
  queueCallId: string | null,
  queueEnteredAt: unixSeconds | null,
  queueWaitMs: number | null,
  status: "running" | "completed" | "failed" | "interrupted" |
          "closed" | "outcome_unknown",
  result: null | string,
  startedAt: unixSeconds,
  runStartedAt: unixSeconds,
  finishedAt: unixSeconds | null,
  observedAt: unixSeconds,
  elapsedMs: number,
  runElapsedMs: number,
  currentStep: {index, operation, startedAt, elapsedMs, requestId} | null,
  steps: [{index, operation, startedAt, finishedAt, durationMs, requestId,
           kind: "interval" | "instant"}],
  truncated: boolean,
  complete: boolean,
  live: boolean,
  source: "memory" | "checkpoint" | "persisted"
}
```

All duration fields use the native monotonic clock. Wall timestamps are server
Unix seconds; clock adjustments may reorder those wall values without changing
durations. `runId` matches the existing `turn_started.detail.run` and active-turn
identity. `turn` is null when admission failed before a turn was accepted.
`queueCallId` links a dispatched queue entry, without merging its timeline with
the preceding run. The conversation's normal revision/sequence do not advance
for timing observations or polling.

Each owned completion round receives a fresh UUIDv4 string in
`Config.requestId`; `Config.conversation` remains its stable conversation UUID.
`Trace.requestId` is the most recently prepared round's ID. Each step records
its own round's ID, or `null` before any round; completed steps are never
relabelled for later rounds. Older persisted traces may omit this added field.
The agreed transport correlation headers are `X-Request-ID` and
`X-EmuLLM-Client-ID`, respectively. An allocated ID does not prove the endpoint
accepted or even received a POST, and is not a worker/model selector. Correlation
does not initiate provider-status requests, preflights, retries or fallback.

`elapsedMs` includes measured queue wait when available; `runElapsedMs` starts
at run admission. `startedAt` is the earliest observed queue/run boundary;
`runStartedAt` always marks run admission. Pending entries expose increasing
`timing.queued[].elapsedMs` without a model call. After restart or observation
eviction, their wait duration is **null**, not reconstructed from wall time.
The original `queueEnteredAt` can still be shown as a timestamp. The queue clock
starts after its existing admission write succeeds; rejected writes and
idempotent replays never start or reset it.

Only animate an elapsed value when **`live === true`**. Current observations
are independent of the canonical conversation state; that state remains the
authority for controls. A result may be known while final persistence/cleanup
is still running. `result` is `reply`, `local_mutation_boundary`,
`interrupted`, `closed`, or the existing sanitized failure code; error details
remain in the existing conversation error/audit fields.

## Observed operations

Intervals are closed observations, not assertions that each remote operation
succeeded. Repeated operations are normal for multiple tool rounds. `index`
provides their stable order.

| Operation | Actual observed boundary |
| --- | --- |
| `queue_wait` | In-process accepted queue observation to run admission |
| `admission` | Host run admission, ownership/file access and current-state checks |
| `disclosure_validation` | Policy, revision, scope/history and exact-grant validation |
| `request_preparation` | Semantic message/budget preparation and completion envelope construction |
| `admission_persistence` | Existing durable acceptance/queued-run reservation write |
| `worker_wait` | Owned worker handoff, not provider worker selection |
| `context_preparation` | Existing KEE context/registry and immutable snapshot setup |
| `outgoing_validation` | Existing before-request disclosure/scope/history/budget checks |
| `request_encoding` | Existing JSON request-byte encoding |
| `http_dispatch` | **Instant** immediately before calling the HTTP client; not proof of wire delivery |
| `endpoint_wait` | HTTP connect/send and blocking until endpoint response headers |
| `response_read` | Existing bounded response-body read |
| `response_decode` | Existing UTF-8/JSON decode after a successful HTTP status |
| `reply_validation` | Existing assistant-message, output and tool-envelope validation |
| `reply_persistence` | Existing assistant response/history write |
| `tool_validation` | Host tool-call envelope/identity preparation |
| `tool_reservation` | Existing durable call-ID reservation/readback |
| `tool_execution` | Existing validated KEE invocation, never an invented tool |
| `tool_receipt_persistence` | Existing durable result/audit recording |
| `tool_history_persistence` | Existing tool-protocol history write |
| `terminal_persistence` | Existing terminal-state write/attempt |
| `context_cleanup` | Existing native KEE context cleanup |
| `cancellation` | Explicit host interruption/stop processing |

The HTTP library combines connection, sending and header waiting; those
sub-durations are not separately observable here. Provider queueing, model
loading, token generation and internal worker health are **unavailable**.
Label `endpoint_wait` “Waiting for emullm,” not “generating.” Only the explicitly
agreed correlation IDs are provided; no internal provider-stage protocol is
inferred. Timings contain no prompt, payload, model output,
PID, native handle, context token, credentials or source path.

## Persistence and overhead

Phase transitions update bounded, ground, in-memory records only: at most 512
steps per run, 64 completed traces and 512 pending queue clock observations.
They make **zero filesystem writes and zero HTTP requests**. Timeouts and
cancellation exceptions are never swallowed by instrumentation.

The existing terminal conversation write carries a `lastTiming` checkpoint.
It is deliberately `source:"checkpoint", complete:false, live:false`: final
write/cleanup durations cannot be known before that write finishes. Its elapsed
value is measured only through the checkpoint; do not extrapolate it after
restart. The complete final trace remains in memory and is opportunistically
included in the next **already-required** write for that conversation.
Persisted complete traces return `source:"persisted"`. No extra terminal or
per-phase save is added.

Timing metadata is omitted/trimmed before it would consume the conversation's
1 MiB storage allowance. Missing/failed observations do not gate Send.
Interrupted/restarted runs never resume because of timing reads. Forks inherit
no timing state. If a run predates telemetry or its volatile observations were
lost, `current` is null rather than fabricated.

## Native clock

SWI's `statistics(walltime)` is thread-relative and uses wall-clock time. It
is not used for these durations. The narrow `kb_llm_clock.c` adapter reads
Windows `QueryPerformanceCounter` (POSIX `CLOCK_MONOTONIC` on other platforms).
It creates no threads, processes, handles, files, network requests or provider
state.

Build the generated adapter before publishing this optional feature:

```powershell
.\prolog\ow_dr\build_llm_clock_windows.ps1
```

This follows the repository's existing MSVC x64/SWI build pattern. The generated
`kb_llm_clock.dll` is a local build artifact, not a source or corpus companion.
Where PowerShell script execution is restricted, use the equivalent MSVC
compile command from the script in an authorized developer command prompt;
do not change machine execution policy. If the DLL is locked by an existing
process, do not force-unload it or kill that process. Schedule any required
publication separately.

On POSIX, the same source can be built with the installed SWI toolchain:
`swipl-ld -shared -o kb_llm_clock.so kb_llm_clock.c` from the module directory.
If the adapter is unavailable, `timing.supported` is false; Send still works.

## Isolated validation

```powershell
swipl -q -g "load_files('prolog/ow_dr/tests/test_llm_timing.pl',[silent(true)]),run_tests([llm_timing_clock,llm_timing,llm_timing_fifo]),halt"
```

Tests use synthetic isolated transports/state, including a real delayed
loopback endpoint. They check monotonicity across threads/wall-clock rollback,
increasing endpoint wait, closed terminal durations, cancellation, independent
drained-run timelines, no metadata leakage, no extra HTTP/discovery, and exactly
the existing three successful-turn conversation writes.

An isolated Windows measurement read the native clock 10,000 times in 1.283 ms
and recorded 100 phase transitions in 5.598 ms. These are local instrumentation
measurements, not a provider latency or end-to-end response guarantee.
