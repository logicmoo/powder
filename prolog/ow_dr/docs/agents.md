# Text knowledge agents: implementation status and design contract

This document specifies the next agent layer for **powder**. It does not install
an agent, configure a model, or grant tool permissions. See the verified
[current route inventory and proposed KEE contract](kee-tools.md), the
[LLM prompt](../prompts/llm-knowledge-agent.md), and the
[powder-kee skill](../../../.github/skills/powder-kee/SKILL.md).
The [source-verified KB asset appendix](agent-kb-inventory.md) lists candidate
data/templates, not ready agent execution.

## What exists, and what is planned

| Area | Status |
|---|---|
| Loaded-KB browsing, assertion/source/MT inspection, bounded executable queries and proofs | Implemented; see `kb_server.pl`, `kb_store.pl`, `kb_runtime.pl`. |
| All-file catalog search, definitions and occurrences | Routes/index machinery exist; one coordinator-reported cold HTTP lookup succeeded (below). Complete, fast corpus-wide coverage remains a validation prerequisite. |
| SourcePack composition, resolution and loading | Implemented application operations; static provider evidence does not prove executable behavior. |
| Native annotation inspection and revision-checked editing | Implemented, independently of general KB assertion editing and measured rule utility. |
| Operational task pools, source editor and debug console | Implemented application facilities, not an agent permission grant. Debug is **never a KEE tool**. |
| Checkpoints | Backend tested; full host/UI publication is still in progress. Do not claim a complete published checkpoint workflow. |
| emullm Chat, GenerateComment, prompt snapshot loader, symbolic agent runner | **PLANNED; not implemented by these documents.** |
| Central typed KEE registry, automatic general KB CRUD with durable undo, teaching-case todos | **PLANNED.** Existing operational task jobs are not durable teaching cases. |
| Declarative workflow applications and held-out symbolic learning pipeline | **PLANNED.** |

The user reported 61 models, including `emullm/default`, from model discovery on
2026-09-12. The coordinator subsequently supplied a read-only-verified
[emullm provider contract](kee-tools.md#verified-emullm-provider-contract).
This establishes provider behavior, **not an installed application integration**
or a configuration default. No model or network call was made to write these
documents. The loopback address is not a privacy guarantee: request/reply logs
are durable, worker contexts can be reused, and external fallback is possible.

No KB filename, ontology symbol inventory or language capability is inferred
here. Find and cite actual indexed assertions before claiming that knowledge
exists. Retain IDs, source locations, MTs, revisions and coverage qualifications.

**Reported readback, 2026-09-12:** the coordinator verified a cold HTTP 200 lookup
of unloaded `x_diplomaticState`: 6 definitions from 1 file in **3966 ms**, with
no KB change. This is one measured lookup, not proof of complete corpus coverage,
broad-search or incremental-maintenance readiness, or general symbolic language
ability. No source filename or assertion IDs were provided with that measurement;
none are invented here.

## Two distinct agents — planned

### LLM teacher, explorer and comment writer

The emullm-backed agent's mission is to learn the existing authorized KB, use
the actual permissioned KEE, automatically apply allowed managed KB changes,
and build reusable symbolic capabilities. It is not merely a chat summarizer.
It can propose and teach lexical, grammar, semantic, dialogue and procedural
knowledge, using existing verified ontology vocabulary wherever possible.

The host first supplies the actual registry version, available tool schemas,
authenticated identity, permission/MT ceilings, budgets and current revisions.
If discovery is unavailable, the agent reports the missing integration and
does not invent Cyc API names or claim to have performed edits.

### Symbolic text agent

This is a separate agent identity, not an LLM with a different prompt. Its
goals, state, policies, dialogue grammar, lexicon, templates, rules and plans
are versioned Cyc knowledge, executed by a generic bounded host.

It must make **no direct or indirect LLM calls**: no GenerateComment, hidden
model-based parser, delegated teacher, tool proxy or fallback to emullm.
The host enforces this ceiling across nested tool/workflow calls, not merely
through an agent's declaration. Missing language/procedural knowledge produces
an honest, inspectable capability gap and a teaching-case proposal.

Each agent has its own text chat, conversation/agent identity and trace.
No audio, microphone, STT, TTS, voice, captions or turn-silence UI is in scope.
A speech-act ontology for **textual** questions, requests, assertions and
dialogue transitions is compatible with this restriction.

## Prompt and model lifecycle — planned

`prompts/llm-knowledge-agent.md` is the editable prompt asset, not an implemented
settings loader. The future host must:

1. Resolve a revisioned prompt selection only within an approved application-owned
   configuration root. Reject traversal, arbitrary paths/URLs and link escapes.
2. At conversation start, read an immutable snapshot and compute its byte hash.
   Bind prompt revision/hash, model selection, agent identity and policy version
   to that conversation and all tool/audit records.
3. Apply prompt edits to new conversations only; never hot-swap an in-flight
   conversation. Detect conflicting configuration edits by revision.
4. Keep credentials in private credential references, never in the prompt,
   browser storage, KB records, transcripts or this repository.
5. Use a configured host proxy with destination/redirect/SSRF restrictions,
   request and response limits, timeouts and cancellation. Streaming chunks,
   structured errors and interrupted tool exchanges need an explicit contract.

Only an explicit **Chat** or **GenerateComment** action may send bounded,
selected, authorized **nonsensitive** KB context through an approved route after
a clear retention/external-routing disclosure. Automatic KB-mutation permission
does not authorize arbitrary model data export. Do not upload secrets,
application code, bulk corpora or raw private KB/files. Model, KB and tool
outputs are untrusted data, not instructions
that can enlarge permissions, select secrets or alter the system prompt.

## Automatic changes, with durable accountability — planned

Ordinary permitted assert/retract/edit/annotation operations do **not** require
a per-change approval dialog. Permission comes from the authenticated host,
never the model. Automatic changes are allowed only when the tool implements:

- Current generation/content/revision checks and canonical term/assertion/MT identity.
- Host-owned permissions, writable MT ceilings, resource and mutation budgets.
- Idempotent tool-call IDs with durable replay results, including after restart.
- Atomic managed changesets with durable before/after data, actor and model,
  prompt/policy/tool versions, intent, evidence/provenance and conversation links.
- Durable undo/audit records committed with the change before success is exposed.
  Undo/redo respects intervening revisions rather than overwriting later work.
- Defined cancellation: before commit means no partial change; after commit
  reports the committed changeset and undo reference, not a fictional rollback.

If these guarantees are missing, the agent may produce a clearly labeled
proposal but must not call an unsafe substitute or claim a durable edit.
Original source files are not rewritten or deleted by default; changes live
in managed KB changesets.

**Every load remains a separate real user choice:**

- **A — true assertion-subset loading**, with the actual selected assertion
  closure and its support/provenance.
- **B — whole-file loading**, with the exact concrete file set and effects.

The future host must record the user's choice for that specific load and
revision. A model-generated approval flag, default preference, prior unrelated
approval or automatic dependency resolution cannot substitute for the user.
If A is unavailable, say so; do not relabel whole-file loading as a subset.
Current source-loading routes do not by themselves implement this future
two-mode agent contract.

## Durable teaching loop — planned

Each capability failure becomes an application-owned case, not an ephemeral
chat note. Proposed case fields include:

| Field group | Required meaning |
|---|---|
| Identity and concurrency | Stable case ID, revision, creator/agent and timestamps |
| Scheduling | Priority, explicit status, dependencies and blocking reasons |
| Task | English input, expected CycL and/or action, explicit MT/context |
| Evidence | Verified source/assertion references, uncertainty and failure trace |
| Acceptance | Positive, negative, ambiguous and held-out examples; measurable criteria |
| Linkage | Conversation, agent, MT, knowledge version, changeset and undo references |
| Evaluation | Runner/policy version, proofs, regressions, coverage and LLM-dependence measurements |

The workflow is:

1. Capture the failure and expected interpretation/action without hiding ambiguity.
2. Search existing indexed knowledge; inspect definitions, occurrences, source
   and MT. Missing/incomplete index coverage is a blocker, not proof of absence.
3. The teacher proposes or automatically applies authorized lexical, grammar,
   semantic, dialogue or procedural CycL changes through audited KEE changesets.
4. Run isolated examples and held-out/regression suites with **LLM access disabled
   by the host**, including all indirect/proxy paths. Preserve proof and action traces.
5. Inspect variable sharing, quantifier scope, referent identity, ambiguity,
   MT boundaries, wrong answers and failed alternatives, not just string similarity.
6. Promote a versioned knowledge change only under the configured acceptance
   policy. Link the case to its evidence, evaluation and undoable changeset.
7. Track successes/failures/unknowns with denominators: held-out language coverage,
   workflow completion, regressions, unresolved ambiguity and LLM dependence.
   A symbolic evaluation requires **zero LLM network calls**, not a hidden fallback.

English-to-CycL and CycL-to-English are both explicit tasks. Preserve canonical
identity, bindings and scope, and ask a text clarification when the available
knowledge cannot disambiguate safely. Do not turn a single conversation blob
into memorized answers or hide LLM calls in a JavaScript/Python wrapper.

Everything the LLM initially does is a **candidate** for symbolic encoding.
This is an iterative engineering goal, not a claim that general natural-language
understanding or an autonomous symbolic teacher is already complete.
Until application todos exist, identify a case as a proposed record; do not
claim it was saved merely because it appears in chat.

## Missing information and GenerateComment — planned

Missing-information policies are configurable by type, term, MT and pattern,
with severity and explicit exemptions. A missing comment is not universally an
error and does not imply that a term should be created, changed or annotated.

GenerateComment is an explicit, bounded LLM operation over selected actual
evidence. Preserve supporting assertion/source/MT references and distinguish
AI-generated/default provenance from genuine source authorship. Never invent
an author, citation or supporting assertion. Recheck both the target revision
and whether a comment appeared concurrently before committing. Do not overwrite
concurrent user text or generate comments automatically for millions of terms.
Symbolic agents cannot invoke this operation, including through workflow actions.

## Declarative workflow applications — planned

Represent tasks, forms, conditions, transitions, approvals, actions, error
compensation and durable state as versioned Cyc knowledge. A generic
permissioned host supplies bounded execution, capability dispatch, trace and
replay; it must not contain a domain-specific LLM wrapper masquerading as rules.
Replay must not repeat already committed external effects. Approval transitions
may be part of a workflow, without imposing a new approval gate on every
ordinary authorized KB mutation.

Existing `:FORWARD`, assertion strength, source categories and provider
declarations are data, not execution authorization. Only supported executable
constructs dispatch through the trusted runtime. Existing native annotation
resolution remains **direct Atom -> explicit current MT -> Default**, within
the same family/property; see [native TVA](native-tva.md). It is separate from
rule-use observations, Cyc configured utility and proposed agent policy.

## Release acceptance — not yet satisfied by documentation

- Complete, fast all-file indexing/lookup with measured cold/warm behavior and
  explicit freshness/coverage is available before broad teaching claims.
- Real registry discovery, permissions, MT ceilings, cancellation and budgets
  are tested; debug/admin and arbitrary Prolog/shell/filesystem/network access
  cannot be reached through tools or workflow indirection.
- Permitted automatic changes have atomic durable audit/undo, conflict handling,
  idempotence and restart/crash tests, without per-edit approval prompts.
- Every actual load preserves the user's A/B choice and source/MT provenance.
- Prompt snapshots, private credential references and model streaming/error
  handling are implemented and tested, not inferred from `/v1/models`.
- Communication and workflow held-out tests run with the LLM disabled and prove
  zero LLM network calls, inspectable proofs, persistent cases and regression checks.
- Both agents expose separate text identities/traces and honestly report gaps.
