# Source-verified candidate assets for text agents

This appendix records the coordinator's source-verified citations, supplied on
2026-09-12. Local filenames were checked read-only; selected cited ranges were
read to preserve exact spelling. No KB was loaded or changed.

**These are data, declarations and templates, not ready agent execution.**
Only exact **`<===` (three equals)** is directly executable rule syntax in
powder. The sampled **`<==` (two equals)** remains distinct data.
`preconditionForMethod`, `methodForAction`, `actionSequence` and named `do*`
actions need a compatible bounded interpreter and explicitly registered,
permissioned host primitives. Their names do not authorize execution.

Source line references describe the supplied corpus revision, not a future
unchanging location. Recheck identity, source revision/hash, MT and dependencies
before reuse. No missing filenames, assertion IDs or executable implementations
are inferred. See [agent design](agents.md) and the [KEE contract](kee-tools.md).

## Companions: identity, tasks, goals and planning

Prefix: `KBs/companions/v1/flat-files/`.

| Source / cited lines | Verified content | Candidate use and boundary |
|---|---|---|
| `companion-predicates.krf`: [13–41](../../../KBs/companions/v1/flat-files/companion-predicates.krf#L13-L41), [60–67](../../../KBs/companions/v1/flat-files/companion-predicates.krf#L60-L67), [86–93](../../../KBs/companions/v1/flat-files/companion-predicates.krf#L86-L93) | MT links; `CompanionSystem` with `SoftwareAgent`, `IntelligentAgent`, `PerceptualAgent`; `CompanionsAgent` / `CompanionsAgentType` | Candidate identity/context vocabulary, not an instantiated agent or permission policy. |
| `companion-internals.krf`: [33–79](../../../KBs/companions/v1/flat-files/companion-internals.krf#L33-L79), [98–104](../../../KBs/companions/v1/flat-files/companion-internals.krf#L98-L104) | `classNameForAgentType`, `agentClassUsesKB`, OS bindings; `defaultAgentConfiguration`, `defaultCaseLibraryFor`, `domainCodeFor`, `defaultKB` | **Old host wiring.** Not current powder configuration, supported host classes, or permission to start OS processes. |
| `agenda.krf`: [10–23](../../../KBs/companions/v1/flat-files/agenda.krf#L10-L23), [46–54](../../../KBs/companions/v1/flat-files/agenda.krf#L46-L54), [168](../../../KBs/companions/v1/flat-files/agenda.krf#L168) | `currentAgendaItem`, `currentAgendaLength`, `pendingTask` with dynamic-update declarations; `taskStatus`, `taskBlockedOn`, `TaskFn` | Candidate agenda/state vocabulary. Dynamic values require actual runtime instrumentation; not implemented durable application todos. |
| `tasks.krf`: [16](../../../KBs/companions/v1/flat-files/tasks.krf#L16), [30–40](../../../KBs/companions/v1/flat-files/tasks.krf#L30-L40), [57](../../../KBs/companions/v1/flat-files/tasks.krf#L57), [128](../../../KBs/companions/v1/flat-files/tasks.krf#L128) | `Task` as `PurposefulAction`; `newUniqueTask` with `<==`; `volatileTask`; `TaskStatus` | Candidate task ontology. Neither `<==` nor a task declaration provides a working task-creation tool or persistence. |
| `learning-goals.krf`: [24](../../../KBs/companions/v1/flat-files/learning-goals.krf#L24), [173–178](../../../KBs/companions/v1/flat-files/learning-goals.krf#L173-L178) | `LearningGoal`, `SelfKnowledgeLearningGoal`, `UserModelLearningGoal`; exact source spelling **`GoalTypeByCateogory`** at line 177 | Candidate teaching-goal vocabulary. Preserve the spelling; do not silently repair or substitute a new symbol. |
| `performance-goals.krf`: [32–40](../../../KBs/companions/v1/flat-files/performance-goals.krf#L32-L40) | `PerformanceGoal`, `QuantityGoal`, `PropositionalGoal` | Candidate acceptance/goal distinctions, not measured agent performance. |
| `self-modeling.krf`: [23](../../../KBs/companions/v1/flat-files/self-modeling.krf#L23), [60](../../../KBs/companions/v1/flat-files/self-modeling.krf#L60), [91](../../../KBs/companions/v1/flat-files/self-modeling.krf#L91), [39](../../../KBs/companions/v1/flat-files/self-modeling.krf#L39), [77](../../../KBs/companions/v1/flat-files/self-modeling.krf#L77), [99](../../../KBs/companions/v1/flat-files/self-modeling.krf#L99), [110](../../../KBs/companions/v1/flat-files/self-modeling.krf#L110) | `setupSessionCase`, `sessionPostMortem`, `ensureUserModelExists`; `methodForAction`, `actionSequence`, `doRecordMembers` templates | Candidate session/self-model procedures. Not an installed session-case recorder or automatic user-model mutation. |
| `common-plans.krf`: [31](../../../KBs/companions/v1/flat-files/common-plans.krf#L31), [44](../../../KBs/companions/v1/flat-files/common-plans.krf#L44), [64–74](../../../KBs/companions/v1/flat-files/common-plans.krf#L64-L74), [224–246](../../../KBs/companions/v1/flat-files/common-plans.krf#L224-L246) | `goalStatus`, `postLearningGoal`, `followUpOnPostedGoal`; method/action sequences using `doRecord`, `ist-Information`, `SelfModelMt`, `doAgentPlan`; planning-MT templates | Candidate procedural knowledge. Preserve explicit `ist-Information` context structure; supply no guessed execution semantics. |
| `executive/executive-plans.krf`: [53–71](../../../KBs/companions/v1/flat-files/executive/executive-plans.krf#L53-L71), [426–433](../../../KBs/companions/v1/flat-files/executive/executive-plans.krf#L426-L433), [501–513](../../../KBs/companions/v1/flat-files/executive/executive-plans.krf#L501-L513), [779–785](../../../KBs/companions/v1/flat-files/executive/executive-plans.krf#L779-L785) | Timeouts/`counterLimit`; supporting/preceding goals; dispatch/delegation; reboot/handoff declarations | Declarative planning evidence only. **No permission to reboot, kill, delegate privileged work or run an old host.** |

## Companions: text interpretation, dialogue and language learning

Unless otherwise noted, prefix:
`KBs/companions/v1/flat-files/interaction-manager/`.

| Source / cited lines | Verified content | Candidate use and boundary |
|---|---|---|
| `im-preds.krf`: [61–77](../../../KBs/companions/v1/flat-files/interaction-manager/im-preds.krf#L61-L77), [80–83](../../../KBs/companions/v1/flat-files/interaction-manager/im-preds.krf#L80-L83), [104](../../../KBs/companions/v1/flat-files/interaction-manager/im-preds.krf#L104), [732](../../../KBs/companions/v1/flat-files/interaction-manager/im-preds.krf#L732), [751](../../../KBs/companions/v1/flat-files/interaction-manager/im-preds.krf#L751) | `textInterpretation`: `StringObject` -> `ELSentence-Assertible`; `sentenceForm` has the reverse argument types; `currentSentenceId`, `currentSystemUtterance`, `interpretationOf`, `utteranceType` | Candidate typed text/CycL and conversation-state interfaces. Declarations are not a working parser/generator. |
| `dialog/intent.krf`: [26–45](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/intent.krf#L26-L45), [64–72](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/intent.krf#L64-L72) | `inferIntent`, `handleContradictions`, fragmentary-question handling and method templates | Candidate intent/repair policy, not demonstrated intent recognition. |
| `dialog/responding.krf`: [19–39](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/responding.krf#L19-L39), [262 onward](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/responding.krf#L262) | `respondToUtterance/3`, `respondToQuestion/3`, `queryFormForInterpretation/4`; response templates | Candidate dialogue routing. Arity describes source declarations, not registered host tools. |
| `dialog/question-answering.krf`: [21–40](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/question-answering.krf#L21-L40), [127 onward](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/question-answering.krf#L127) | `generateAnswers/3`, `describeReferent/4`, `defineConcept/4`; templates | Candidate answering/description procedures; actual bounded query/proof adapters remain necessary. |
| `dialog/generation.krf`: [12](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/generation.krf#L12), [48–62](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/generation.krf#L48-L62), [179–191](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/generation.krf#L179-L191) | `generateUtterance/3`; methods with `doRecordMembers` / `doRespond`; literal `Unknown` response | Candidate text-generation and honest-gap templates, not general NLG or permission to call an LLM. |
| `dialog/ambiguity-dialogs.krf`: [31–70](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/ambiguity-dialogs.krf#L31-L70), [156 onward](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/ambiguity-dialogs.krf#L156) | Unknown-word/meaning/parse/semantics/interpretation/metonymy cases; `preferInContext` with `<==` | Candidate ambiguity/clarification knowledge. Preference interpretation is not supplied by the two-equals operator. |
| `dialog/explanation.krf`: [24](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf#L24), [92](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf#L92) | `explainBelief/4`, `preferInContext` with `<==` | Candidate explanation policy, not an implemented explanation engine. |
| `dialog/language-learning.krf`: [23–24](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-learning.krf#L23-L24), [30](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-learning.krf#L30), [55–64](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-learning.krf#L55-L64), [77–87](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-learning.krf#L77-L87), [117–155](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-learning.krf#L117-L155), [217–236](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-learning.krf#L217-L236) | `LearnedVocabularyMt` visibility; `nounTypeForConcept`, `lexicalWordFor`, `descriptiveCycName`, `indexNewTerm`, `indexNewName`; `isa`, `genls`, `multiWordString`, `denotation` recording templates; proper-name handling | Candidate lexical teaching knowledge. No existing automatic index/mutation tool or complete English↔CycL conversion is implied. |
| `dialog/language-games.krf`: [13–24](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf#L13-L24), [29](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf#L29), [34](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf#L34), [37–56](../../../KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf#L37-L56) | **Source comments** describing a conversation FSM/`currentTurn`; `initializeConversationInstance`, `saveGameStateKeyframe`, `planConversationalTurn`, `currentRole`, `currentlyTrue` control-state patterns and `doAgentPlan` | Comments describe intended design, not a proven state machine. Candidate durable text-dialogue plans require a host, state model and tests. |
| `epistemic-forms.krf` at the **parent flat-files prefix**: [17–42](../../../KBs/companions/v1/flat-files/epistemic-forms.krf#L17-L42), [54–89](../../../KBs/companions/v1/flat-files/epistemic-forms.krf#L54-L89) | Epistemic-form/game constraints, entry/legal-move patterns; analysis, list-making, temporal, comparison and cost-benefit forms | Candidate structured text-interaction/task patterns; not completed workflow execution. |

## FIRE: planning, verbalization and reflection

Prefix: `KBs/fire/flat-files/`.

| Source / cited lines | Verified content | Candidate use and boundary |
|---|---|---|
| `htnplanner.krf`: [13–28](../../../KBs/fire/flat-files/htnplanner.krf#L13-L28), [38](../../../KBs/fire/flat-files/htnplanner.krf#L38), [103–121](../../../KBs/fire/flat-files/htnplanner.krf#L103-L121), [157](../../../KBs/fire/flat-files/htnplanner.krf#L157), [193](../../../KBs/fire/flat-files/htnplanner.krf#L193) | `generalMethodFor`, acceptable/best method forms, `preferInContext`; `doAssert`, `doRetract` as simple-action predicates; `doRecord`, `doRecordMembers` | Candidate HTN/action vocabulary. These declarations do not provide audited mutation tools or authorize assertions/retractions. |
| `nlgen.krf`: [19–50](../../../KBs/fire/flat-files/nlgen.krf#L19-L50) | `vbFormOf`, `vbFactFor`, `vbOptionFor`, plurals | Candidate text realization/lexical forms, not a complete generator. |
| `verbalize.krf`: [19](../../../KBs/fire/flat-files/verbalize.krf#L19), [42–77](../../../KBs/fire/flat-files/verbalize.krf#L42-L77), [265–360](../../../KBs/fire/flat-files/verbalize.krf#L265-L360) | `VerbalizePred`, `genFormatForFormula`, `genQuestionForFormula`, `prettyStringForFormula`; profile/context/fallback/inference/constraint/predicate controls | Candidate formula-to-text controls. Source fallback settings do not authorize an LLM fallback for the symbolic agent. |
| `reflection.krf`: [18–43](../../../KBs/fire/flat-files/reflection.krf#L18-L43), [53–85](../../../KBs/fire/flat-files/reflection.krf#L53-L85) | Solve-activity/function, `AndOrNode`, solve-status vocabulary; `hasSolveActivity`, `goalOfSolve`, `getNextSolveStep` with `DynamicUpdatePredicate` declarations | Candidate reflection interface. Needs real solver instrumentation; no fabricated live solve tree or proof step. |
| `fire-internals.krf`: [17–36](../../../KBs/fire/flat-files/fire-internals.krf#L17-L36), [62](../../../KBs/fire/flat-files/fire-internals.krf#L62) | Temporal CWA/UT and closed-retrieval conventions, `closedRetrievalSetCWA-KB`; `Suggestion` / `SuggestionsMt` | Candidate epistemic/policy vocabulary. Do not import guessed closed-world semantics or implicit suggestion execution. |

## EA: dialogue, reference and lexical assets

Prefix: `KBs/ea/v8/kbfiles/`.

| Source / cited lines | Verified content | Candidate use and boundary |
|---|---|---|
| `dialogue-rules.krf`: [23–76](../../../KBs/ea/v8/kbfiles/dialogue-rules.krf#L23-L76), [90–134](../../../KBs/ea/v8/kbfiles/dialogue-rules.krf#L90-L134), [143–177](../../../KBs/ea/v8/kbfiles/dialogue-rules.krf#L143-L177) | Backward dialogue-function replying/question/answer/elaboration patterns; `utteranceInDialogue`, `dialogueEvent`, `dialogueUtteranceBetween`; `informOf`, `topicOf`, `recipientOfInfo` | Candidate dialogue relations and text speech-act structure; not a ready dialogue agent. |
| `reference-rules.krf`: [17–37](../../../KBs/ea/v8/kbfiles/reference-rules.krf#L17-L37), [52](../../../KBs/ea/v8/kbfiles/reference-rules.krf#L52), [66 onward](../../../KBs/ea/v8/kbfiles/reference-rules.krf#L66), [375–398](../../../KBs/ea/v8/kbfiles/reference-rules.krf#L375-L398) | `preferredBinding`, candidate/intra-candidate referents and rescoping; `resolveUnresolvedReferences`; `<==` preferences; listener/speaker forms | Candidate reference-resolution constraints. Preserve scope, binding and speaker/listener identity; compatibility must be tested. |
| `lexicon/nulex4/verbs.krf`: [1](../../../KBs/ea/v8/kbfiles/lexicon/nulex4/verbs.krf#L1), [3–10](../../../KBs/ea/v8/kbfiles/lexicon/nulex4/verbs.krf#L3-L10) | `NulexMt` with `:exclude-globals`; `definitionInDictionary` root, `vform`, `agr`, `subcat` features | Candidate lexical feature data. The declaration does not implement parsing, generation or automatic global-context inclusion. |

### Semtrans assets: names only

The following filenames are verified. **Entry schemas, frame/role mappings,
coverage and interpreter compatibility have not been verified.** Do not infer
additional filenames or semantic translation behavior from these names.
Generated inventory/cache companions are not the cited original sources.

- [Verb-Semtranses.krf](../../../KBs/ea/v8/kbfiles/semtranses/Verb-Semtranses.krf)
- [Noun-Semtranses.krf](../../../KBs/ea/v8/kbfiles/semtranses/Noun-Semtranses.krf)
- [ADJ-Semtranses.krf](../../../KBs/ea/v8/kbfiles/semtranses/ADJ-Semtranses.krf)
- [ADV-Semtranses.krf](../../../KBs/ea/v8/kbfiles/semtranses/ADV-Semtranses.krf)
- [PREP-Semtranses.krf](../../../KBs/ea/v8/kbfiles/semtranses/PREP-Semtranses.krf)
- [NUM-Semtranses.krf](../../../KBs/ea/v8/kbfiles/semtranses/NUM-Semtranses.krf)
- [INTERJ-Semtranses.krf](../../../KBs/ea/v8/kbfiles/semtranses/INTERJ-Semtranses.krf)
- [Handmade-Semtranses.krf](../../../KBs/ea/v8/kbfiles/semtranses/Handmade-Semtranses.krf)
- [Tech-Noun-Semtranses.krf](../../../KBs/ea/v8/kbfiles/semtranses/Tech-Noun-Semtranses.krf)
- [fe-defs.krf](../../../KBs/ea/v8/kbfiles/semtranses/fe-defs.krf)

## Safe reuse and acceptance — planned work

1. Verify source/MT/content identity and current index coverage, then map only
   the selected relevant vocabulary and dependencies. This appendix is not a
   source-load request: every actual load still needs the user's A (true
   assertion subset) / B (whole files) choice.
2. Document which legacy declarations are inert, which require an interpreter,
   and which need new trusted primitives. Do not silently reinterpret `<==`,
   dispatch arbitrary named host methods, or turn source direction into execution.
3. Connect task/learning vocabulary to real durable application cases through
   the planned audited KEE, not by claiming that a `Task` fact is a saved todo.
   Preserve before/after audit, permissions, revisions, idempotence and undo.
4. Teach reusable lexical/grammar/semantic/dialogue/procedural knowledge.
   Test English↔CycL ambiguity, scope, variable sharing and identity, then inspect
   actual proofs, clarification/unknown responses and workflow effects.
5. Evaluate isolated and held-out cases with all direct/indirect LLM access
   disabled and **zero LLM network calls**. Promote versioned knowledge only on
   evidence; retain failure cases, regression results and undo links.

No readiness guarantee, delivery estimate or general-NLU claim follows from
this inventory. It supplies candidate knowledge for the separate text agents,
not an LLM wrapper, operational agent or permission to use debug/admin facilities.
