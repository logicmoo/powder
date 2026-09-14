# Strict symbolic text host

This is a separate **non-LLM** host, not a model prompt or fallback transport.
Its immutable ceiling excludes models, emullm, GenerateComment, delegated
agents, arbitrary Prolog, processes, network, secrets, administration and audio.
Mutable knowledge cannot grant these effects. No example is installed into the
live KB; `tests\fixtures\symbolic-agent.krf` is isolated test knowledge.

## Language interpreter

`kb_symbolic_agent_language.pl` is a pure bounded interpreter:

```prolog
compile_language(Records,Profile,Language).
interpret(Language,Text,Options,Result).
generate(Language,Meaning,Options,Result).
generate_category(Language,Category,Meaning,Options,Result).
```

`Records` contains `kb(AssertionId,Microtheory,CanonicalSemanticTerm)`. Real
variables and their sharing remain intact. The profile selects explicit
`lexiconMt`, `grammarMt`, `startCategory` and optional
`caseMode:sensitive|insensitive`. No MT inheritance or vocabulary guessing occurs.

The following are **new, deliberately limited powder predicates**, not invented
implementations of existing corpus interfaces:

- `(symbolicLexeme CATEGORY (TheList "token" ...) MEANING)` defines a finite
  lexical item. Meanings are ground canonical terms, not display labels.
- `(symbolicProduction CATEGORY (TheList SLOT ...) MEANING)` defines a reusable
  production. Slots are `(symbolicLiteral "token")` or
  `(symbolicNonterminal CATEGORY MEANING)`. Category features and meaning slots
  share real variables within their source assertion.

The same productions parse and generate. Tokenization is Unicode-aware and
whitespace-delimited, splitting `! , . : ; ?` into separate tokens. Case is
preserved unless the explicit profile selects folding; collisions still produce
distinct interpretations. Generation currently joins tokens with spaces.
There is no open-vocabulary name/number guesser, general English parser,
statistical model, generated code or per-utterance restart.

Results distinguish `interpreted`, `generated`, `ambiguous`,
`no_applicable_rule` and `resource_limit`. They include completeness, candidates,
source assertion-ID proofs and search work. Incomplete search never establishes
a unique interpretation. Unknown language produces a structured gap, not a
hardcoded greeting or fabricated answer. Quantified formula variables preserve
scope/sharing; separate calls receive fresh variables.

Defaults are depth 16, 20,000 search steps, 8 results and 1 second. Explicit
options cannot exceed the host ceilings of depth 64, 200,000 steps, 32 results
and 5 seconds. Inputs are limited to 4,096 characters/256 tokens.

## Source-verified reuse boundary

Read directly, without loading or changing the corpus:

- `KBs\companions\v1\flat-files\interaction-manager\im-preds.krf:61–78` declares
  `textInterpretation/2` (text → formula) and `sentenceForm/2` (formula → text).
  Those are declarations, not this parser's executable implementations.
- `...\dialog\language-games.krf:13–56` describes a conversational FSM in
  comments and declares `planConversationalTurn/1`. `currentRole` there occurs
  in templates; this host does not infer missing arity/outsourcing behavior.
- `...\dialog\language-learning.krf:117–155` contains `methodForAction`,
  `actionSequence`, `doRecordMembers`, `multiWordString` and `denotation`
  recording templates. They do not authorize host actions.
- `KBs\fire\flat-files\htnplanner.krf:13–29,103–121,157–160` declares method
  selection and `doAssert/1`, `doRetract/1`, `doRecord/1`. No automatic execution
  semantics are supplied for those legacy names.

Ordinary implication and exact `<==` remain data. The language interpreter
executes neither these formulas nor native `<===` rules. Query actions use the
real bounded KEE query operation, where supported native `<===` rules retain
their existing execution semantics. No KB term becomes arbitrary Prolog.

## Program and pure workflow interpreter

```prolog
kb_symbolic_agent_program:compile_program(Records,Agent,DefinitionMt,Program).
kb_symbolic_agent_program:initial_state(Program,State).
kb_symbolic_agent_engine:step(Program,State,Input,Options,Result).
```

The definition MT must explicitly assert `(isa AGENT SymbolicTextAgent)`,
`(symbolicStartCategory AGENT CATEGORY)`, `(symbolicInitialState AGENT STATE)`
and `(symbolicAgentContext AGENT ROLE MT)` for each of `Lexicon`, `Grammar`,
`Dialogue`, `Templates`, `Plans`, `Goals`, `Policy` and `State`. Repeated optional
`Knowledge` links select condition-readable MTs. The policy MT declares
`(symbolicCaseMode AGENT Sensitive)` or `Insensitive`, and zero or more
`(symbolicAllowedCapability AGENT "kee_query")` permissions. These are restrictions,
**never authority grants**. Goals use `(symbolicInitialGoal AGENT GOAL)`.
Contradictory explicit agent identity, duplicate IDs and ambiguous configuration
are errors. A deterministic program version prevents mixed-knowledge continuations.

Dialogue uses `(symbolicDialogueRule FSM EVENT CONDITION PLAN)`; task expansion
uses `(symbolicPlan TASK CONDITION PLAN)`. Multiple applicable rules produce
`ambiguous_plan`, not an arbitrary winner. Supported conditions are
`symbolicTrue`, `symbolicFalse`, `(symbolicSame A B)`,
`(symbolicKnown MT FORMULA)` and `(symbolicAll (TheList CONDITION ...))`.
`symbolicKnown` checks asserted positive/explicit-negative snapshot membership:
true, false, unknown or inconsistent. It is **not** general inference or
TVA/strength-aware belief. Unknown/inconsistent is not ordinary false.

Supported plan instructions:

| Instruction | Meaning |
|---|---|
| `(symbolicSequence (TheList PLAN ...))` | Ordered continuation |
| `(symbolicSetState STATE)` | Set ground semantic FSM state |
| `(symbolicGoal GOAL)` / `(symbolicCompleteGoal GOAL)` | Update ground goals |
| `(symbolicSay TEMPLATE-CALL)` | Unique knowledge-defined realization |
| `(symbolicIf CONDITION THEN ELSE)` | Explicit true/false branch only |
| `(symbolicTask TASK)` | Unique applicable declared plan |
| `(symbolicOnError PLAN)` | Register reverse-order error compensation |
| `(symbolicInvoke "CAPABILITY" ARGUMENTS RESULT-PATTERN)` | Yield a typed action intent |
| `(symbolicAwaitForm FORM FIELDS RESULT-PATTERN)` | Wait for exact typed fields |
| `(symbolicAwaitApproval KEY CHOICES RESULT-PATTERN)` | Wait for a trusted host receipt |

Templates are `(symbolicTemplate CALL (TheList PART ...))`; parts are
`(symbolicText "text")` or `(symbolicRealize CATEGORY MEANING)`. Missing or ambiguous
templates/realizations are errors/gaps, not fallback text. Forms use
`(symbolicFormField "name" String|Number|Boolean|Term)`. Unexpected fields, missing
fields and wrong types do not advance the form.
Strings may declare inclusive bounds with
`(symbolicFormField "title" String (symbolicStringLength 1 256))`.
Bounds must be integers within the host's 0–4096-character ceiling; unsupported
constraint forms are rejected, not guessed. Two-argument String fields retain
the default 0–4096 bound. The pure interpreter preserves waiting state on invalid
values; HTTP validates the same declarations before recording a form transition.

Inputs are `text(Text)`, `event(GroundTerm)`, `continue`, `stop`, `interrupt`,
`resume`, `form(Form,GroundDict)` and the **trusted-host-only**
`action_result(ActionId,ok(Value)|error(Reason))` / `host_approval(Key,Choice,Receipt)`.
Text meanings become `symbolicUtterance`; external events become `symbolicInput`.
Neither text nor KB knowledge can fabricate those host control messages.

Results contain `state`, `effects` and `events`, including language/rule/plan
assertion-ID evidence, responses, requests and structured gaps. The interpreter
does not dispatch effects or persist state. Action completion is a separate step
before continuing: an ensuing budget failure cannot erase the completed action.
For structured tool results, the result pattern can be:

```lisp
(symbolicResultFields
  (TheList
    (symbolicResultField (TheList "revision") ?Revision)
    (symbolicResultField (TheList "items" 0 "id") ?FirstId)))
```

Paths are explicit string keys or zero-based array indexes, limited to 16
components and 32 selected fields. They are validated before yielding an action;
no expression evaluation or code dispatch occurs during selection. Values retain
their JSON types. Selected variables share the continuation's real variables.
A missing/mismatched result produces a binding gap **after recording successful
completion**, clearing the unsafe continuation rather than pretending the action
failed. A receipt arriving after Stop/Interrupt clears pending action state but
does not resume work.

Compensation remains failed/compensated rather than claiming successful rollback.
Stop/Interrupt preserve semantic state; an unresolved action cannot simply resume.
The durable control layer can resume an interrupted **planned, undispatched**
action to `awaiting_action` without executing it or changing its identity/counters.
The pure engine alone cannot prove this boundary; dispatched/unknown actions
remain blocked, including when a committed receipt exists but its outcome was lost.

Default budgets are **cumulative per state**: 128 instructions and 16 actions,
plus 2 seconds per step. Hard ceilings are 1,024 instructions, 64 actions and
10 seconds. The host must retain these counters; this is not an unlimited daemon.

## Wire format and actual KEE gateway

`kb_symbolic_agent_wire:encode_term/2` and `decode_term/2` implement
`powder.symbolic-term.v1`, a bounded data-only JSON tree preserving whole functor,
argument, dict-tag and real-variable sharing. Each decode creates fresh variables.
`query_text/2` emits escaped canonical KIF and verifies an exact variant roundtrip
through the real reader. Unsupported structures are rejected rather than renamed.

Argument objects use `(symbolicObject (TheList (symbolicField "key" VALUE) ...))`,
arrays use `symbolicArray`, and typed inserts use `symbolicContextKey`,
`symbolicSExpression` or lossless `symbolicTerm`. Duplicate fields/unbound scalar
arguments are errors. Only explicit `True`, `False` and `Null` produce JSON values.

```prolog
kb_symbolic_agent_kee:capabilities(ContextToken,Reply).
kb_symbolic_agent_kee:authorize(ContextToken,Policy,Capability,Checked).
kb_symbolic_agent_kee:preflight(ContextToken,Policy,Intent,GlobalCallId).
kb_symbolic_agent_kee:invoke(ContextToken,Policy,Intent,GlobalCallId,Reply).
kb_symbolic_agent_kee:action_outcome(Reply,Outcome).
```

This is wired to actual `kb_kee:registry/2` and `invoke/3`, not fixture dispatch.
The caller supplies an opaque, authenticated symbolic context with null model
and prompt metadata. Actual registry permission, MT scope, budgets, expiry and
revocation checks remain in force. The immutable ceiling permits these registered
read/query operations:

`kee_catalog_status`, `kee_find_terms`, `kee_definitions`, `kee_occurrences`,
`kee_catalog_assertion`, `kee_assertion`, `kee_query`.

It also permits the **real application-TODO domain only**:

`kee_ledger_status`, `kee_call_status`, `kee_todo_list`, `kee_todo_get`,
`kee_todo_create`, `kee_todo_update`, `kee_todo_delete`, `kee_audit`, `kee_undo`,
`kee_redo`.

These require actual host-granted `todo.read`, `todo.write`, `changeset.read` or
`changeset.undo` permissions and `application_read`/`application_write` effects,
as specified by the shared registry. Mutation budgets and old/new MT authorization
remain enforced there. Mutable agent policy cannot supply those grants. The
backend still forbids symbolic task completion by claimed evidence: setting or
restoring `done` requires the real user-attestation boundary.

The gateway independently checks the **exact name/operation/domain/mutation
tuple**, schema version, direct and transitive effect allowlists, cycles and
symbolic eligibility. Expanding a TODO undo tool to another domain does not
implicitly expand this ceiling. Unknown/model/proxy/process/network
capabilities remain forbidden even if mutable policies request them. Tool schemas
and dispatch implementations exist only in the shared registry. Call IDs must be
prefixed with a real durable run identity; pure `action-N` ordinals are insufficient.

Replies normalize ordinary Prolog atoms to JSON strings, preserving true/false/null,
and include `symbolicEffect`:

- `"not_mutation"`: a registered non-mutation operation.
- `"committed"`: the actual mutation returned its durable committed receipt.
- `"unknown"`: an attempted mutation failed or did not return a verified receipt.
  Its `ok:false` error remains explicit. This **does not mean no effect occurred**.

`action_outcome/2` returns `ok(Result)` only for acknowledged completion;
uncertain writes return `unresolved(Reply)`, which must not be passed as a failed
action, compensated automatically, or retried under a new ID. Inspect
`kee_call_status` in the same actor/agent/conversation namespace and recover with
the same durable call ID and request. An unknown receipt is not proof that an
in-flight operation cannot commit. No automatic retry loop is implemented here.

## Canonical knowledge snapshot adapter

`kb_symbolic_agent_knowledge:read_snapshot(Principal,Args,Reply)` is a **compiled KEE
adapter contract**, not a public endpoint accepting a client-supplied Principal.
`snapshot/3` is an alias with the same strict input contract. The registration name
agreed with the KEE owner is `kee_agent_knowledge_snapshot`; it is not available
until that owner's fixed registration is published.
It requires an authenticated symbolic principal with null model/prompt metadata.
Its immutable audit-agent identifier is distinct from the executable knowledge
root: `Args.agent` identifies the latter, not the principal. The trusted execution
host must bind that knowledge root/version immutably for a run rather than accept
source-switching instructions from KB text.
The pure `kb_symbolic_agent_knowledge_schema:input_spec/1` exports the existing
KEE schema DSL and imports no auth, registry, runtime or store module:

| Field | Required | Constraint |
|---|---|---|
| `agent` | yes | canonical ground entity key, 1–4,096 characters |
| `mt` | yes | canonical explicit definition MT key, 1–4,096 characters |
| `linkedMts` | yes | concrete array of 0–200 canonical MT keys |
| `generation` | yes | integer 0–1,000,000,000,000 |
| `maxRecords` | yes | integer 1–8,192 |
| `maxBytes` | yes | integer 1,024–1,048,576 |
| `seconds` | no | 0.01–5; default 2, further limited by the actual host context |

Extra fields, principals, goals, paths and module names are rejected. Entity/MT
keys use the existing canonical `x_*` or full `mt:...` representation, not rendered
S-expressions. Selections are deduplicated. **Every selected MT is authorized,
and an agent's declared linked MT must already be explicitly selected**; neither
KB declarations nor all-MT read grants implicitly expand selection.

The adapter pins the native modules and reads a coherent database snapshot,
enumerating only `Pin.modules`, never fresh global source/index rows. Expected
generation is checked against that pin. A concurrent publication may advance the
global generation; it cannot substitute new records into an old pinned result.
The application lease and native pin are released on success, failure and timeout.
Semantic and metadata clauses are inspected as data; neither body is executed.

The v2 JSON reply contains `schema:"powder.symbolic-knowledge.v2"`, agent,
definition MT, pinned generation, selected MTs, per-MT coverage, record count,
`snapshotHash` and `records`. Each record contains:

```json
{
  "id": "a902",
  "mt": "x_DefMt",
  "kbNames": [],
  "semantic": {"schema":"powder.symbolic-term.v1","term":{"type":"symbol","value":"x_Example"}},
  "provenance": {
    "occurrenceId":"a902",
    "sourceFile":"<original source reference>",
    "sourceLine":2,
    "verification":"pinned_native_metadata"
  }
}
```

Names match the semantic record's variable count; a rule can preserve spellings
such as `["??Foo-Bar","$Target","?z"]`. IDs, original variable spellings, native
source metadata, operator distinctions and complete uninstrumented clauses are
preserved. Variable sharing is exact within a record and fresh between records
and decodes. Opaque/native handles, attributed variables, cyclic or unsupported
values and unbounded shared-subterm expansion are rejected.

`complete:true` means `completeness:"selected_loaded_assertions"`—all records of
the selected MTs in the **already loaded** pinned generation, not all source/provider
material or an executable-program validation (`programValidated:false`). Missing
agent identity, unavailable source metadata, unselected links, limit and scope
errors never become partial successes. A selected MT with no native assertions
is explicitly `no_loaded_assertions`, not guessed to be an empty ontology. The
host must compile/validate the full program and stop on missing required knowledge.
No catalog fallback, archive reopening, provider load or A/B escalation occurs.

`snapshotHash` hashes the exact returned selection/generation/records/provenance
before adding the hash field. Source-reference verification means those references
were read from the pinned native occurrence; it does **not** claim current disk
bytes were reread or verified. The generic run-manifest hash does neither job.
`decode_snapshot/2` reconstructs canonical `kb/3` records, not rendered bindings.

Limits cover total semantic cells (65,536), per-record expanded traversal (16,384),
depth (128), row count, actual UTF-8 JSON bytes and elapsed time. JSON sizing/hashing
uses standard-library UTF-8 memory streams, including supplementary Unicode; no
scratch files are created. The independent registry result-byte ceiling also applies.

**Registry publication remains unavailable:** this snapshot adapter is not a
public KEE tool. The trusted HTTP host invokes it directly with a bounded,
authorized loaded selection; KB-authored plans cannot request this host operation.

## Remaining integration boundary

Persistent agent runs/state, events, actions, cases and todos must use the shared
KEE ledger. Its `agent_run` domain is now available and the prepared-state client
below uses it. No parallel mutable run authority or disguised todo resource exists.
The HTTP host now captures and compiles bounded loaded knowledge, and the
independently mounted Cyc UI operates its durable lifecycle (see below).
Authenticated human approval receipts and knowledge-changing teaching transactions
remain **unavailable**. The host never bootstraps examples, executes a hidden
fallback, or exposes raw host-control inputs.
No source-load operation is currently permitted, so load A/B selection cannot be
invented or treated as automatically approved.

The separate `tests\fixtures\symbolic-agent-todos.krf` defines a reusable
`review phrase CLASS` production and workflow: obtain the real ledger revision,
bind it into a real TODO creation request, extract the returned task ID and
update the pure goal continuation. Dog/cat variations create distinct durable,
audited open tasks with the same program and interpreter process. These are
genuine application TODOs, **not** persisted agent runs, taught KB assertions,
verified acceptance results or automatic completed tasks.

## Prepared durable cursor and step client

`kb_symbolic_agent_control.pl` uses only public KEE registry/invocation operations
for lifecycle data. Its **host-only** control context is separate from action
authority; all lifecycle tools and `agent_state_control` remain forbidden to
KB-authored action plans.

```prolog
open_control(TrustedHostSpec,Control).
create_prepared(Control,VerifiedProgram,Generation,Limits,CallId,Run).
get(Control,RunId,Run).
advance_prepared(Control,VerifiedProgram,RunId,Input,CallId,Run,Effects).
record_outcome(Control,VerifiedProgram,RunId,ActualToolReply,CallId,Run).
events(Control,RunId,Offset,Limit,Reply).
close_control(Control).
```

Prepared programs must come from a source snapshot independently verified by the
trusted host. This is an explicit isolated-fixture/integration boundary, **not a
web endpoint accepting programs or permission manifests from clients**. Immutable
source data records the canonical knowledge-agent identity separately from the
host audit-agent identity, definition MT, generation claim, semantic program hash,
host/ceiling versions and fixed limits. The client checks the program hash and
identities on advancement; it does not pretend to verify a generation merely
because it appears in JSON. The HTTP host independently captures/verifies native
loaded knowledge or the explicitly selected immutable application profile.

`create_prepared` creates an actual `agent_run` record in the declared state MT;
it starts no thread. `advance_prepared` executes the bounded pure interpreter
synchronously and atomically stores its cursor/event before returning any action
intents. `resume` on a newly created record marks it ready for input. Actions are
not automatically dispatched. Only verified `record_outcome` input acknowledges
their completion, with actual committed receipts independently checked by KEE.
The generic advance entry rejects raw `action_result` and `host_approval` inputs.
Callers must use distinct stable input/action/outcome call IDs.

Stop state is durable, future advancement is rejected, and a late outcome retains
the stopped phase. This client is **not yet an interruptible execution worker**:
it does not cancel an external caller's in-flight query or automatically dispatch
continuations. It cannot be advertised as complete Run/Stop worker integration.

`kb_symbolic_agent_state.pl` encodes `powder.symbolic-cursor.v1` as a compact
postorder JSON node table. This accommodates shared variables and ordinary deep
continuations without exceeding KEE's JSON-depth limit. Cursor text is capped at
65,536 characters, 8,192 nodes and bounded expanded size. Forward/cyclic references
and exponential DAG expansion are rejected. No Prolog term strings, credentials,
native handles, whole program copies or accumulated conversation arrays are stored.
Semantic event deltas and compact action links live in the same ledger history.

The shared ledger now publishes `domainRevisions.application_todo` and
`domainRevisions.agent_control` in `kee_ledger_status`. Control commits use the
agent-control token. A knowledge-authored TODO workflow must explicitly select
`("domainRevisions" "application_todo")` into its write's revision argument.
The host **does not rewrite/rebase planned arguments**. Legacy workflows selecting
the global `revision` still conflict after a cursor commit; the regression retains
that behavior. The HTTP integration fixture uses the actual domain token and
successfully creates a durable, audited TODO across all control commits.

## HTTP lifecycle and Cyc UI

`kb_symbolic_agent_http.pl` registers routes when imported by the main server.
`web/symbolic-agent.js` exports:

```javascript
createSymbolicAgent(host, {signal, active, onStateChange, storage})
// => {element, activate, deactivate, getState, destroy}
// host = {api, element, button, heading}
// api(path, query, {method, body, signal}) uses the application's API base.
```

The controller owns no main navigation and edits no shared shell. It loads its
scoped CSS, preserves separate Cyc settings/drafts/history, and hides without
submitting, cancelling or replaying work when deactivated. No timer/provider is
started. Reactivation always reads the latest durable state (deferred until an
already pending request settles). GET recovery reads durable state; only explicit
POSTs execute steps. The lifetime signal belongs to the app/controller, not a
route visit. `onStateChange` and `getState()` include `status`, `conversationId`,
`sequence`, `error` and `unread`. `sequence` is a nonnegative monotonic durable
event count per conversation; unchanged polling and older-page reads never
increment it or unread. In-flight results arriving while hidden count only new
events. Reactivation clears the view's unread count without resetting sequence.
Storage keys are `powder.cyc.{settings,drafts,forms,history,pending}.v1`, separate from
Teacher and operators. Browser history is a bounded local index/cache (20 runs,
200 events per view); authoritative history/state remains in KEE. There is no
server-wide conversation enumeration. Losing the browser index does not delete
ledger runs: the run ID and conversation ID can still retrieve them.

| Route under `api/symbolic/` | Request |
|---|---|
| GET `status` | No arguments; unconfigured status, host bounds and app-profile descriptors, no source reads |
| POST `start` | `{agent,definitionMt,linkedMts,conversation,callId}` **or** `{profile:"cyc-starter-v1",conversation,callId}` |
| GET `conversation` | `{id,conversation,offset?,limit?}`; latest 50 by default |
| POST `send` | `{id,conversation,revision,callId,text}` |
| POST `continue`, `interrupt`, `resume`, `stop` | `{id,conversation,revision,callId}` |
| POST `form` | Above identity/revision fields plus `values` |
| GET `todos`, `audit` | `{id,conversation,offset?,limit?}`; real selected goals-MT KEE records |
| GET `receipt` | `{id,conversation,actionCallId}`; current pending action only |
| GET `request-status` | `{conversation,callId}`; durable HTTP request receipt, never a replay |

POST `revision` is the **run resource revision**, not the global ledger revision.
Every write takes a fresh call ID (up to 80 characters); repeated identical
committed requests are read back, and changed payloads under the same identity
conflict. Unknown browser responses retain the request identity for inspection.
Responses contain `{run,events,eventTotal,offset,limit,replayed}`. `run` exposes
the semantic wire state, fixed cumulative counters, source manifest, phase and
typed pending request. Event deltas preserve input text and source assertion-ID
proofs. No credentials or native clause handles are returned.

Authorization reuses `kb_llm_http:authorize/1`: loopback peer and exact server
Origin (or same-origin GET Referer). No cross-origin writes, browser-provided
principal/grants, model/operator destinations, arbitrary source loads or general
Prolog calls are accepted. The host's trusted snapshot path calls the real native
snapshot adapter directly; this does **not** advertise an unregistered KEE tool.
Start requires explicit profile selection; the loaded option has no default
agent/MT and fails actionably when definition knowledge is absent. Mixing the
two Start shapes or supplying a profile path is rejected. The immutable manifest retains selected MTs,
coverage, program version, source generation and snapshot hash. Continuations
re-read and verify the complete snapshot; changes conflict rather than substituting
knowledge. Stop/Interrupt remain available even if source knowledge has changed.

Before recording a dispatch claim, the host validates the planned action against
the actual registry input specification, immutable capability ceiling, policy,
permissions and MT scope. Rejections return HTTP 422
`symbolic_action_not_dispatched` with the original registry cause and
`dispatched:false`; the cursor/revision remains planned, not unknown. This check
does not execute a tool, consume an action receipt, rebase revisions or guarantee
that later execution will succeed. The real KEE invocation rechecks authority.

Each request performs **one bounded synchronous step**, not a daemon or background
worker. A yielded intent is durable and inspectable; the next explicit Continue
records a dispatch claim *before* the fixed KEE gateway runs it. Another Continue
advances the post-action continuation. Stop/Interrupt serialize at the request
boundary; they do not forcibly cancel an already executing bounded native query.
Counters persist across requests (128 instructions, 16 actions, 1,000 user turns;
2 seconds per interpreter/query step). Different browsers use resource CAS;
the KEE ledger supplies cross-process locking, durable commits and idempotence.

A crash after a dispatch claim or lost action response remains
`dispatched`/`unknown`: no automatic action retry, compensation or Resume is
allowed. Receipt inspection never executes the tool. This release intentionally
does not reconcile unresolved action state automatically, even when a receipt
is found; Stop preserves that evidence. Create a separately reviewed new run
only when appropriate, never as an implicit retry of the unresolved action.

Typed forms use the pending knowledge-defined field set. Term fields take
`powder.symbolic-term.v1` JSON and must decode to ground data. Approval requests
are displayed but have **no approval button or POST approval route**: an actual
trusted human-receipt adapter is not installed. TODO inspection uses real KEE
reads; knowledge-authored workflows may create/update only permitted application
TODOs with actual revisions. No source knowledge or production sidecar is mutated.
Unsubmitted form drafts persist locally across state reads, chip changes and
controller recreation (at most 20 forms). Acknowledged submission clears that
form's draft instead of pre-filling the next task with the previous submission.
String declarations expose `minLength`/`maxLength` to the UI; the starter title
is 1–256 characters. Client validation explains the bound and retains the draft.
Server form rejection returns HTTP 422 `symbolic_form_invalid`, preserves the
editable form and its revision, and never creates a dispatch claim.

## Explicit app-owned starter

Select **Cyc starter — limited app-owned profile** in Knowledge, then **Start**.
Discovery/selection alone executes no program. The fixed file
`profiles\cyc-starter.krf` is application code/data, not a corpus fixture:
`kb_symbolic_agent_profiles.pl` reads it through the shared KRF reader and
`compile_program/4` as an isolated immutable program. It never installs native
clauses, publishes sources, changes live KB generation, creates source companions
or imports test fixtures. There is no client-supplied file path.

The explicitly declared agent is `x_PowderCycStarter`, its definition and
language/plan/policy MT is `x_PowderCycStarterMt`, its goals MT is
`x_PowderCycStarterTasksMt` and its state MT is `x_PowderCycStarterStateMt`.
The KRF declarations—not a host English switchboard—define these limited,
case-insensitive phrases:

- `hello` / `hi`: bounded greeting.
- `help` / `capabilities`: exact finite coverage and limitations.
- `new todo` / `add todo`: typed title/description form; then explicit Continue
  steps read the real TODO domain revision, create a real audited **open** TODO,
  and acknowledge only its durable receipt. Inspect TODOs/Audit for the record.
- Unrecognized language: honest knowledge gap; no automatic TODO or fallback.

The starter cannot query the live corpus, teach knowledge, mark work verified,
load sources, use models, or invoke operators. Its declarative action policy
contains only `kee_ledger_status` and `kee_todo_create`. TODO conversation audit
ownership comes from the host; the declarative TODO's optional conversation link
is null rather than a fabricated identifier.

Profile reads are bounded to 64 KiB, 512 assertions and two seconds. File SHA-256
is verified before/after reading and recorded with the compiled program version.
Continuation rejects changed file/program identity; unrelated live-KB generation
changes do not invalidate this independent program. New versions require a new
explicit Start. Profile provenance uses
`app-profile:<profile-id>:<full-file-sha256>:<occurrence-ordinal>` locators with
original line numbers. These are **application-program evidence locators**, not
native `a...` assertion IDs or claims of corpus coverage. The run source inspector
displays this separate origin and source manifest.

## Focused validation

```powershell
swipl -q -s prolog\ow_dr\tests\test_symbolic_agent_language.pl -s prolog\ow_dr\tests\test_symbolic_agent_engine.pl -s prolog\ow_dr\tests\test_symbolic_agent_kee.pl -s prolog\ow_dr\tests\test_symbolic_agent_todos.pl -s prolog\ow_dr\tests\test_symbolic_agent_control.pl -s prolog\ow_dr\tests\test_symbolic_agent_snapshot.pl -g "run_tests([symbolic_agent_language,symbolic_agent_engine,symbolic_agent_kee,symbolic_agent_todos,symbolic_agent_control,symbolic_agent_snapshot])" -t halt
swipl -q -s prolog\ow_dr\tests\test_symbolic_agent_http.pl -g "run_tests([symbolic_agent_http])" -t halt
$env:LOGOS_CHROME = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
node --test prolog\ow_dr\tests\symbolic-agent-ui.test.mjs
```

The existing grammar tests demonstrate one learned production and held-out
combinations/synonyms, bidirectional generation, ambiguity, MT isolation, exact
compound identity, quantified sharing, fresh variables and resource limits.
Further tests cover workflow/form/approval continuations, wire persistence,
compensation, capability/effect denial, actual native assertion/query calls and
pinned multi-MT knowledge retrieval. Snapshot fixtures also cover an actual
concurrent source-generation switch, supplementary Unicode, byte/time limits,
explicit selection, provenance/name alignment and non-execution of metadata/rules.
Actual TODO writes, receipt replay, a
committed-write/lost-reply scenario, user-completion protection and undo/redo are
tested through the public registry. HTTP GET/POST and process creation are trapped
during real query and declarative TODO workflows with zero attempted calls.
All fixture sources, ledgers, native modules and identities are isolated; no model
transport is configured. These commands do not run any checkpoint/qsave tests.
Starter tests run the actual shipped KRF, actual HTTP host and actual durable
TODO gateway under an isolated ledger, assert zero external calls and unchanged
live source modules/generation, and exercise immutability and explicit selection.
The Node suite also opens the actual Cyc controller against an ephemeral isolated
SWI HTTP host: oversized title rejection/draft retention, corrected submission,
Interrupt/Resume at both read and write boundaries, and one real audited TODO.
That fixture uses a separate project-local ledger, traps external transports,
checks unchanged native generation and cleans up its owned server/state.
These tests do not claim general NLU or an already-persisted teaching transaction.
