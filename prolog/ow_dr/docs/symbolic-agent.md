# Strict symbolic text host

This is a separate **non-LLM** host, not a model prompt or fallback transport.
Its immutable ceiling excludes models, emullm, GenerateComment, delegated
agents, arbitrary Prolog, processes, network, secrets, administration and audio.
Mutable knowledge cannot grant these effects. No example is installed into the
live KB; `tests\fixtures\symbolic-agent.krf` is isolated test knowledge.

## Implemented first stage: language interpreter

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
executes neither these formulas nor native `<===` rules. Future query actions
must use the real bounded KEE query operation; they must not call KB data as
arbitrary Prolog.

## Integration boundary

The typed KEE registry is owned by `kb_kee*`; persistent agent state, events,
actions, cases and todos must use its shared durable ledger. The language stage
does not create a parallel authority. Run controls, durable workflows and actual
registry dispatch are separate integration work, not claimed ready by this
language module. Missing integration must report `dependency_unavailable`.

The existing grammar tests demonstrate one learned production and held-out
combinations/synonyms, bidirectional generation, ambiguity, MT isolation, exact
compound identity, quantified sharing, fresh variables and resource limits.
They do not claim general NLU or an already-persisted teaching transaction.
