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

Inputs are `text(Text)`, `event(GroundTerm)`, `continue`, `stop`, `interrupt`,
`resume`, `form(Form,GroundDict)` and the **trusted-host-only**
`action_result(ActionId,ok(Value)|error(Reason))` / `host_approval(Key,Choice,Receipt)`.
Text meanings become `symbolicUtterance`; external events become `symbolicInput`.
Neither text nor KB knowledge can fabricate those host control messages.

Results contain `state`, `effects` and `events`, including language/rule/plan
assertion-ID evidence, responses, requests and structured gaps. The interpreter
does not dispatch effects or persist state. Action completion is a separate step
before continuing: an ensuing budget failure cannot erase the completed action.
Compensation remains failed/compensated rather than claiming successful rollback.
Stop/Interrupt preserve semantic state; an unresolved action cannot simply resume.

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
kb_symbolic_agent_kee:invoke(ContextToken,Policy,Intent,GlobalCallId,Reply).
```

This is wired to actual `kb_kee:registry/2` and `invoke/3`, not fixture dispatch.
The caller supplies an opaque, authenticated symbolic context with null model
and prompt metadata. Actual registry permission, MT scope, budgets, expiry and
revocation checks remain in force. The immutable ceiling currently permits only
these registered read/query operations:

`kee_catalog_status`, `kee_find_terms`, `kee_definitions`, `kee_occurrences`,
`kee_catalog_assertion`, `kee_assertion`, `kee_query`.

It independently checks schema version, direct and transitive operation/effect
allowlists, cycles and symbolic eligibility. Unknown/model/proxy/process/network
capabilities remain forbidden even if mutable policies request them. Tool schemas
and dispatch implementations exist only in the shared registry. Call IDs must be
prefixed with a real durable run identity; pure `action-N` ordinals are insufficient.

## Canonical knowledge snapshot adapter

`kb_symbolic_agent_knowledge:snapshot(Principal,Args,Reply)` is a **compiled KEE
adapter contract**, not a public endpoint accepting a client-supplied Principal.
It requires the authenticated symbolic principal's agent to equal `Args.agent`.
Arguments are canonical `agent`, definition `mt`, expected `generation` and an
optional `maxRecords` (default 4,096, maximum 8,192). Every linked agent MT is
separately authorized before returning its records.
Independent ceilings bound the collected semantic terms to 65,536 heap cells
and encoded rows to 131,072 cells; the registry's result-byte budget also applies.

The adapter pins the native modules and reads a coherent database snapshot,
retaining actual assertion IDs and complete semantic clauses with shared
variables. It returns `powder.symbolic-knowledge.v1` with `complete:true` only
when the whole authorized bounded snapshot fits. Limit/generation/scope errors
never become successful partial programs. `decode_snapshot/2` reconstructs
`kb/3` records. No unloaded source/catalog data is implicitly installed.

**Pending:** the shared registry owner must register this operation and supply its
actual capability contract before the agent host can call it. Direct fixture
invocation proves the adapter, not a publicly available capability.

## Remaining integration boundary

Persistent agent runs/state, events, actions, cases and todos must use the shared
KEE ledger. Its current resource validation supports todos, not symbolic runs.
No parallel mutable run authority or disguised todo resource has been created.
Durable Run/Stop/Interrupt/status/logs, authenticated human approval receipts,
knowledge-changing teaching transactions and app/server/UI wiring are therefore
**not yet available**; callers must report `dependency_unavailable`, not bootstrap
examples, execute a hidden fallback, or expose the pure host-control input directly.
No source-load operation is currently permitted, so load A/B selection cannot be
invented or treated as automatically approved.

## Focused validation

```powershell
swipl -q -s prolog\ow_dr\tests\test_symbolic_agent_language.pl -s prolog\ow_dr\tests\test_symbolic_agent_engine.pl -s prolog\ow_dr\tests\test_symbolic_agent_kee.pl -g "run_tests([symbolic_agent_language,symbolic_agent_engine,symbolic_agent_kee])" -t halt
```

The existing grammar tests demonstrate one learned production and held-out
combinations/synonyms, bidirectional generation, ambiguity, MT isolation, exact
compound identity, quantified sharing, fresh variables and resource limits.
Further tests cover workflow/form/approval continuations, wire persistence,
compensation, capability/effect denial, actual native assertion/query calls and
pinned multi-MT knowledge retrieval. HTTP GET/POST and process creation are
trapped during real query dispatch with zero attempted calls. All fixture sources,
native modules and identities are isolated; no model transport is configured.
These tests do not claim general NLU or an already-persisted teaching transaction.
