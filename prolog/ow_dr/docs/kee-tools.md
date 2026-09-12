# KEE tools: verified routes and planned semantic registry

**Status:** the application has REST endpoints and trusted Prolog components.
It does **not yet** have the central versioned KEE tool registry, LLM tool adapter,
symbolic agent runner or general automatic KB-edit/undo contract described below.
This document is not a tool manifest or permission grant.

The inventory was checked against repository route declarations and handlers on
2026-09-12. No live requests, LLM calls or mutations were needed. Read current
schemas/versions again before integration; a route in source is not proof of
deployment, authorization, index completeness or model tool-call compatibility.

## Implemented application routes

Paths below are relative to the configured application mount; `kb_urls.pl`
derives it from `web/paths.json`. Do not hardcode a host, port or mount into an
agent. The listed method is the application's intended read/write use, including
POST endpoints that perform reads. Only the **future host registry** may expose
a permitted, bounded semantic adapter to an agent.

### Loaded knowledge, query and provenance

Verified in [`kb_server.pl`](../kb_server.pl), its `http_handler` declarations
and matching `action/3` clauses:

| Method | Relative route | Actual operation / relevant input |
|---|---|---|
| GET | `api/status` | Active application/KB status; not all-file coverage |
| GET | `api/search`, `api/predicates` | Loaded semantic term/predicate pages; `q`, `offset`, `limit` |
| GET | `api/term` | Loaded term assertions/roles; `term`, paging and source/MT/predicate filters |
| GET | `api/term/info` | Structured term information; `term` |
| POST | `api/assertions/annotations` | Read presentation annotations for `ids`; not a mutation |
| GET | `api/nats`, `api/nats/facets` | Non-atomic term browsing/facets with bounded filters |
| GET | `api/microtheories`, `api/microtheories/inheritance` | Loaded MT catalog/graph; graph display is not an inference permission |
| GET | `api/microtheory` | Assertions in explicit `mt`, with pagination |
| GET | `api/assertion` | Stable assertion `id`, presentation/provenance and current `generation` |
| GET | `api/assertion/compiled` | Read compiled assertion view; `id`, optional expected `generation` |
| POST | `api/query` | Safe bounded S-expression query: `query`, optional `mt`, `limit`, `timeout` |
| GET | `api/source` | Authorized read-only source excerpt; `path`, `line` |
| GET | `api/mappings` | Markdown mapping rows and filters; not inferred ontology equivalence |
| GET | `api/version` | Web-source version, not a tool registry version |

`api/query` validates the result limit and a positive timeout no greater than
30 seconds. It executes through pinned store/runtime snapshots and returns
solutions, proof data, generation and invocation-local `utility` observations.
It is not arbitrary Prolog evaluation and does not promise full Cyc inference.
Queries can update observational telemetry; they do not thereby assert new
knowledge. Static implications, source direction and provider names do not
make bodies executable.

[`kb_rule_utility_http.pl`](../kb_rule_utility_http.pl) also registers
GET `api/rule-utility`: cumulative ID/content/generation-keyed observations,
pagination, optional bounded source checking and display-only Classic STV
usefulness. See [rule utility](rule-utility.md). Unobserved/non-executable
assertions do not acquire fabricated execution counts.

### All-file discovery and SourcePacks

[`kb_catalog_http.pl`](../kb_catalog_http.pl) registers:

| Method | Relative route | Actual operation |
|---|---|---|
| GET | `api/catalog/status` | Query-index readiness/coverage |
| GET | `api/catalog/search` | `q`, `scope`, `group`, `offset`, `limit` |
| GET | `api/catalog/term` | `term`, `scope`, `facet`, `source`, `mt`, paging |
| GET | `api/catalog/assertion` | Exact catalog assertion lookup by `term`, `source`, `id` |
| POST | `api/catalog/cancel` | Operational cancellation by `phase`, `runId`; not a semantic edit |

Pending directories can return 503; stale projections/directories can return
409. Treat these as incomplete/unavailable knowledge access, never an empty KB
or proof of absence. Complete fast cold lookup remains a release prerequisite
under active repair/validation. Do not extrapolate complete vocabulary, global
uniqueness or executable support from a partial index.

Additional routes in `kb_server.pl`:

| Method | Relative route | Actual operation |
|---|---|---|
| GET | `api/kb/catalog` | Supported repository source tree |
| GET | `api/kb/file-info` | File information for JSON-encoded `paths` |
| GET | `api/kb/dependencies` | Source dependency information; `path`, `section`, paging |
| GET | `api/kb/packs`, `api/kb/pack` | SourcePack list/detail (`id`) |
| POST | `api/kb/packs/create` | Application pack creation: `name`, `roots`, `revision` |
| POST | `api/kb/packs/save` | Save `pack`, `revision`; composition has roots, choices, members |
| POST | `api/kb/packs/resolve` | Resolve `id`, `revision`, `choices`; not permission to load |
| POST | `api/kb/packs/load` | Load saved composition using `id`, `revision`, `generation` |
| POST | `api/kb/packs/providers/refresh` | Explicit provider-index operation for `selection` |
| POST | `api/kb/load`, `api/kb/unload` | Concrete file-set load / one-source unload, generation checked |

These are existing **application** operations, not automatically allowed LLM
tools. Consult [SourcePack resolution](source-pack-catalog-resolution.md) and
[provider evidence](catalog-provider-evidence.md). Static declaration/provider
evidence is not proof that an action can execute. Do not invent KB source
inventory or replace saved user choices with guesses.

The required agent load policy is **PLANNED**: every load needs a real user's
choice of A (actual assertion-subset closure) or B (whole files), bound to that
selection/revision. The current file-list and pack routes are not evidence that
subset mode or this per-load choice gate exists. No `approved:true` invented by
a model is an acceptable substitute.

### Native annotations and excluded administration

Existing native read routes in `kb_server.pl` include GET `api/tva/status`,
`api/tva/settings`, `api/tva/pairs`, and POST `api/tva/summary`,
`api/tva/detail`, `api/tva/assertion`, `api/tva/interpretation`,
`api/tva/interpretations`. Bodies are explicitly validated. Existing writes
include POST `api/tva/settings/save`, `api/tva/pairs/save` and
`api/tva/assertion/save`; the last requires entity, context, patch, revision,
generation and identity. These specific durable metadata facilities are not
a general agent assertion CRUD/undo subsystem.

Preserve [native TVA](native-tva.md): direct Atom -> explicit current MT ->
Default, same family/property, without guessed inheritance or truthiness
fallback. Native pairs, source/default categories, direction and observed
rule usefulness are distinct concepts.

**Never expose these as KEE tools:** debug console/Telnet, GET `api/debug/status`,
POST `api/debug/start` / `api/debug/stop` (registered in
[`kb_debug_admin.pl`](../kb_debug_admin.pl)), arbitrary Prolog, shell, secrets,
unrestricted filesystem/network operations, `api/app/reload`, native
initialize/reset, checkpoint administration/promotion, or pool administration.
The debug service is a privileged host facility even when authenticated.
Neither agent may use it as an escape hatch or a missing semantic-tool adapter.
The source editor is likewise not the planned managed KB-edit interface.

Origin/loopback checks and endpoint-local validation must not be mistaken for
the future authenticated per-agent permissions and MT ceilings.
Existing `api/tasks*` operational jobs are not the durable teaching-case todos.

## One future typed semantic registry — PLANNED

One authoritative registry must drive the application, LLM tool descriptions
and generated tool reference. Do not maintain separate hand-edited executable
registries in prompts, UI code and documentation.

Discovery's actual address/protocol must come from the host, not an invented
`/api/kee` endpoint or guessed Cyc function name. First obtain and validate the
registry/version and current principal's grants. If discovery is absent,
report **KEE registry unavailable**; do not advertise or call fictional tools.
An independently authorized existing application route remains only that route.

Each future entry must declare stable capability ID/version, typed input/output
schemas, semantic identity rules, permission/MT constraints, read/write effects,
budgets, cancellation behavior, revision/conflict rules, idempotence,
provenance, audit/undo contract and symbolic-agent eligibility. Nested actions
must preserve or reduce the caller's ceiling, never elevate it.

These are **capability categories, not implemented callable names**:

| Proposed semantic capability | Required contract |
|---|---|
| Find/get terms and assertions; definitions and occurrences | Canonical identity, source/MT provenance, pagination, complete/partial/stale coverage |
| Bounded query and explanation | Explicit context, limits, actual returned proofs, cancellation, unsupported-form errors |
| Create/declare terms and MTs | Typed identities, existence/conflict checks, writable scope; never pretend a proposed term already exists |
| Assert/retract/update/annotate | Atomic managed changesets, durable before/after audit and undo, revision checks |
| Dependency diagnose/plan/apply | Verified provider evidence, unresolved alternatives, actual per-load user A/B choice |
| History, undo and redo | Durable revision-aware changeset traversal; no blind overwrite or repeated effects |
| Teaching todo/case CRUD | Application-owned persistent records, priorities/status/dependencies/evidence and acceptance links |
| Symbolic run/evaluate/trace | Generic bounded host; versioned knowledge; no LLM or GenerateComment transitively |
| Explicit GenerateComment | Teacher only; selected bounded evidence, AI/default provenance, concurrent comment/revision checks |

### Mutation protocol — PLANNED

The host, not the model, authenticates actor identity and decides grants, MT
ceilings and budgets. Ordinary permitted mutations execute automatically,
without a per-edit approval gate, **only** through the audited contract:

1. Validate tool/version, principal, selected context, current revision/content
   identity and a unique idempotent tool-call ID.
2. Prepare an atomic managed changeset. Preserve source files by default.
3. Commit durable before/after state and audit/undo together. Record actor,
   model, prompt hash/revision, registry/policy versions, evidence, MT,
   conversation/agent/case links and outcome.
4. Return committed revision, stable identities, changeset/audit/undo references.
   A repeated call ID returns its recorded outcome rather than applying again.
5. On conflict, report it for bounded re-read/replanning. On cancellation, clearly
   distinguish uncommitted work from already committed work with an undo reference.

If durable undo or authorization is unavailable, return a proposal/capability
gap, not an unsafe direct source edit, debug call or false success. Workflow
approval steps and the user's **every-load** A/B choice remain separate from
ordinary automatic mutation permission.

### Trust, models and evaluation — PLANNED

All KB content, retrieved comments, model output and tool results are untrusted
as instructions. Only explicit Chat/Generate actions may send selected,
authorized KB context through a configured, permissioned model proxy. Never
send application code, bulk corpora, private files or credentials.
Private credential references, host allowlists/SSRF controls, streaming/error
contracts and immutable per-conversation prompt snapshots still require code.

Symbolic permission closure excludes every direct/indirect model path. Held-out
communication/workflow tests must assert zero LLM network calls, actual proof
and action traces, persisted cases, regression coverage and undoability.
See [agents.md](agents.md) for the teaching loop and release acceptance.
