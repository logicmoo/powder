# Dependency Resolution

This is a **read-only, bounded inspection** surface for the primary `prolog\ow_dr`
application. It does not load knowledge, execute rule bodies, create declarations,
walk runtime MT inheritance, edit source files, or call a model. The host owns
HTTP/menu integration; the menu title is exactly **Dependency Resolution**.

## Backend and host integration

Load `kb_dependency_resolution.pl` explicitly in the host's next approved code
publication. Do not wrap the following operations in the live-store mutex.

| Suggested HTTP route | Prolog API |
|---|---|
| `GET api/dependencies/capabilities` | `report_capabilities(-Reply)` |
| `POST api/dependencies/reports` | `start_report(+Request,-Reply)` |
| `GET api/dependencies/report` | `report_status(+Id,+Filters,-Reply)` |
| `POST api/dependencies/cancel` | `cancel_report(+Id,-Reply)` |
| optional policy validation | `kb_dependency_resolution_policy:policy_preview(+Policy,+Findings,-Reply)` |

`start_report/2` accepts a JSON object:

```json
{
  "mt": "x_BaseKB",
  "term": "x_ExampleFn",
  "roots": [],
  "termLimit": 10,
  "termOffset": 0,
  "seconds": 60,
  "policy": {"rules": []}
}
```

`mt` is required and is a canonical atomic or `mt:` context key. A supplied term
uses the existing canonical resolver, including complete `nat:` identities.
Empty term means a slice of terms actually indexed in the selected context.
Empty roots means the loaded source manifest; nonempty roots are at most 16
authorized concrete `KBs` original-file paths. Single-term results explicitly
record whether use was witnessed in loaded roots or a selected catalog source.
An unestablished use is not silently represented as a loaded dependency.

The initial reply is `{job,report,stale,cacheHit}`. `job.id` identifies the job.
`report` is initially `null` and then contains incrementally completed term
results. Job states are `running`, `succeeded`, `failed`, `timed_out`, and
`cancelled`. Errors retain a typed code and message; completed partial results
remain inspectable. Cancellation is cooperative, and all generation leases are
released on completion, error, cancellation, and timeout.

Filters: `kind`, `severity`, `status`, `disposition`, `scope`, `offset`, `limit`.
Availability scopes are `loaded`, `unloaded`, `unresolved`, or `all`.
Pagination occurs after filtering, with a maximum of 100 findings per page.
Invalid options are errors, not success-shaped empty pages.
Reopened report URLs restore the recorded context, concrete selected roots,
single term and policy draft. Changing that draft or detecting a stale report
disables its next-slice cursor; a new analysis starts from the beginning.

The synchronous host/diagnostic interface is `run_report(+Request,-Report)`.
`clear_report_cache/0` clears finished report history, refusing while a report
is running. Clear it after changing report semantics during an approved reload.

The UI export is:

```javascript
dependencyResolutionPage(env, route, signal)
```

It reuses the incumbent `api`, `element`, `button`, `link`, `heading`,
`errorPanel`, `sourceLink`, and `mtLink` helpers. Optional `currentMt()` supplies
the current canonical key; optional `rememberRoute(values)` records URL state.
`route.params` is a `URLSearchParams`. No route or dead menu button is installed
by the module itself.

## Result contract

Schema: `powder.dependency-resolution.v1`.

* `scope`: roots, explicit MT, generation, catalog/taxonomy revisions, loaded
  source/cache fingerprints, term-slice selection and cursor.
* `coverage`: independent row, definition, relation, return-inference and MT
  declaration coverage; typed issues; lookup count; provider coverage.
* `policy`, `policyRevision`, `terms`, `total`, `items`.
* A finding carries canonical `term`, shared renderer `expression`, `mt`,
  `mtExpression`, explicit visible `types`, `kind`, `status`, availability
  `scope`, severity, policy disposition, `why`, and evidence.
* Evidence retains assertion ID, actual and original source names, original
  line, context, original variable spellings, origin and loaded status. Type
  and return-schema support retain their own assertion IDs and contexts.
* At most 32 evidence records are displayed per finding; `evidenceCount` and
  `evidenceTruncated` identify sampling. Native clause handles and live query
  variables are never serialized.

Known positive evidence can be `loaded_available` or `exists_unloaded_source`.
Other states include `external_implementation_required`, `indeterminate`,
`detached`, `standalone_reference`, and `exempt`. A static rule definition is
**not** evidence of executable availability. Conflicting source revisions
override apparent resolution with `indeterminate`, retaining the observed state.

## Evidence semantics

Provider rules and schema subjects reuse `kb_inventory_rules`,
`kb_inventory:declaration_target/4`, and the existing catalog taxonomy/target-slot
classifier. Ordinary predicate use does not define that predicate. The type
classifier receives positive claims from one assertion context, never a union
of incompatible MTs. `<==` remains non-executable operator data; MeTTa is inert.

Function checks retain `resultGenl`, `interArgResultIsa`, `interArgResultGenl`,
and related conditional constraints separately from effective `resultIsa`.
Besides direct positive `resultIsa`, this version recognizes the exact,
same-context, **actually evidenced** schema:

```text
resultIsaArg(F,N) AND argNGenl(F,C) => resultIsa(F,C)
```

Observed corpus witnesses include `a65b38ed883eff`, original tinyKB.krf line
15013 in **BaseKB** (N=6), and `a65b38ed885ba8`, original line 117877 in
**UniversalVocabularyMt** (N=1). One witness is not imported into the other's
context. No `genls`/`genlPreds` relationship on function names is guessed to
inherit a return constraint. Other return reasoning remains partial.

Collections require a positive same-MT `genls` path to Thing. The traversal is
cycle-safe, retains the supporting edge IDs, and distinguishes wholly loaded
paths from paths requiring unloaded sources. Thing is exempt. `isa Collection`
is not itself a path.

Used MTs are checked for declarations in the **BaseKB assertion context**, not
files with BaseKB-like names. Compound MTs may be typed by a constructor's
positive BaseKB `resultIsa`, including an evidenced same-context subtype of
Microtheory. Content, typing, `genlMt` edges and explicit `ist`/`ist-Information`
references remain separate. A detached MT is informational by default.

Explicit external-symbol types and the existing inert foreign-reference codec
identify host requirements; neither proves a host implementation exists.

## Policies and genuine current limitations

Rules configure enablement, missing/unresolved severity, exact canonical term/MT
exemptions, explicit type exemptions, and bounded literal `exact`, `prefix`, or
`suffix` patterns. There is no regex evaluation. Positive loaded support remains
informational even when missing information would have error severity.
Suppressed findings remain available through the policy filter.

**Policy drafts and pure previews work; durable policy editing is unavailable.**
The inspected KEE registry has no dependency-policy save operation with
authentication, revision checks and audit. This module does not bypass that
boundary or claim one exists. A future KEE integration must authorize all MTs
whose evidence is exposed (including BaseKB), audit policy changes, and never
derive permission from KB text.

### Typed policy handoff to KEE

The owner module exports one canonical closed schema, using the existing
`kb_kee_schema` DSL rather than a separate JSON Schema:

* `policy_spec(-Spec)` returns `obj([...])`. Derive browser/registry JSON Schema
  with `kb_kee_schema:json_schema(Spec,Schema)`.
* `validate_policy(+JSON,-CanonicalDTO)` strictly validates JSON text values,
  rejects unknown fields and duplicate rule kinds, and returns a deterministic,
  ground `json{rules:SixCompleteRules}`. It has no side effects.
* `default_policy_dto(-CanonicalDTO)` returns the same complete DTO for built-in
  defaults. This is **not** evidence of a saved record.
* Existing `normalize_policy/2` accepts both JSON strings and programmatic Prolog
  atoms and returns the report's `policy{schema,revision,rules}` representation.
  That content digest is **not** a ledger/resource revision.
* Existing `default_policy/1` and `policy_preview/3` retain their report-format
  output; preview still reports persistence unavailable.

The closed input is `{"rules":[Rule...]}`; `rules` defaults to `[]`, has at most
six entries, and has unique `kind` values. Each closed rule requires `kind`:
`definition`, `function_result_isa`, `collection_root`,
`microtheory_declaration`, `microtheory_attachment`, or `comment`.
Optional fields are:

| Field | Accepted values / default |
|---|---|
| `enabled` | Boolean; `true` |
| `severity` | `info`, `warning`, `error`; `warning` except attachment/comment `info` |
| `ignoreTerms`, `ignoreMts`, `exemptTypes` | Up to 128 nonempty strings of at most 4096 characters; `[]`; sorted/deduplicated |
| `patterns` | Up to 32 closed `{mode,value}` objects; `[]` |
| Pattern `mode` | Required `exact`, `prefix`, or `suffix` |
| Pattern `value` | Required nonempty string of at most 128 characters |

Exemptions compare exact canonical finding keys. Validation does not claim that
those terms/types/MTs exist. Patterns match the canonical **term** key literally,
case-sensitively; they are not regexes or glob patterns. Normalization fills all
omitted rules/fields from built-in defaults, not from a previous saved policy.
The canonical DTO is suitable for `kb_kee_schema:validate_stored/2`.

The agreed scope for the first prospective persistence adapter is **one global
singleton**, not implicit per-MT overrides. `ignoreMts` are rule exemptions, not
saved-policy scopes. The prospective save envelope is `{policy,revision}` with
the expected exact ledger revision; this owner module validates `policy` only.
Save means whole-policy replacement. Saving `{"rules":[]}` explicitly stores
defaults. A separate future clear operation would write a tombstone and restore
labelled built-in defaults; it must not infer the browser's current MT. No
per-MT inheritance or clear endpoint exists in this module. KEE owns any future
typed domain, permissions, audit, idempotency, undo and registered handler.

**Runtime reports do not certify global absence.** The current catalog may have
complete membership while provider enrichment is pending. Reading bounded
source-verified pages is not fresh, exhaustive ontology/provider reasoning.
Thus no-evidence runtime results stay `indeterminate`. The pure checker can
produce `missing_complete_catalog` only with explicit complete, fresh,
issue-free relevant coverage; known unsupported cases reduce that coverage.

This is the **static source-clause layer**, not TVA truth entailment. General
conditional inference, native implementation checks, assertion-subset loading,
new fallback MTs/declarations and automatic comment generation are not provided.
Existing SourcePack planning remains the only planner; no competing cascade or
configuration snapshot is introduced.

## Work bounds and reuse

One background analysis runs at a time. Limits are 20 semantic terms plus their context per slice,
500 selectable term positions, eight exact catalog lookups, 25 selected catalog
rows per lookup, 24 support keys, a 512 MiB worker stack, and at most 60 seconds.
Known taxonomy roots are not expanded into enormous incidental type postings.
Postings exceeding 2,000 sentences or 10,000 occurrences are skipped explicitly.
Selected-root enumeration stops before a subsequent record after 4 MiB or
5,000 posting records; a single large record may instead hit the worker's
time/stack limit. Limits are coverage boundaries, never evidence of absence.

Eight recent requests are reused for five minutes, keyed by request, policy,
generation and catalog identity. Evidence resource stamps are rechecked before
reuse; catalog/generation changes mark historical results stale. Original source
and normalized cache fingerprints are labeled as legacy compiler fingerprints;
an unavailable raw-byte digest is `null`, not relabeled SHA-256 evidence.

The adapter intentionally reuses existing directory, posting, safe cache-reader,
native-clause, and loaded-index helpers. Loaded non-atomic identities come from
the existing evidenced AST annotations, not new denotation/type guesses.
Selected-source enumeration validates the actual posting header, individual
record checksums, and—when reached—the footer. It never parses displayed ASTs back into
clauses: identical original variable spellings can denote distinct lexical
slots. These narrow internal helper dependencies are covered by integration
fixtures and should be coordinated with their owners when schemas change.

## Validation

```powershell
swipl -q -s prolog\ow_dr\tests\test_dependency_resolution_checks.pl -s prolog\ow_dr\tests\test_dependency_resolution_runtime.pl -g run_tests -t halt
node --test prolog\ow_dr\tests\dependency-resolution.test.mjs
```

`tests\dependency-resolution-preview.mjs` serves an isolated UI fixture on a
random loopback port, without contacting the knowledge server. Desktop/mobile
browser checks covered pagination, filters, policy draft submission, cancellation,
error states, canonical links, labels and overflow. The focused suites pass
**84 PL-Unit tests and 8 Node tests**.

Existing-catalog checks used `KBs/tinykb.krf` and `x_BaseKB`, without compilation
or real KB loading:

- A ten-row exact lookup took **1.790 seconds**.
- Public asynchronous `start_report`/`report_status` for `x_resultIsaArg`,
  including verified selected-root use, JSON serialization and a subsequent
  cache hit, took **11.683 seconds**. No native modules were loaded.
- A bounded selected-source term slice took **11.328 seconds** and returned
  explicit bounded coverage.
- Public cancellation reached `cancelled`, serialized successfully, and left
  **zero native generation leases**.

These are measured standalone costs, not claims about live server latency.
