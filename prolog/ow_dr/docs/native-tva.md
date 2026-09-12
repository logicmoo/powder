# Native truth-value annotations

`kb_native_annotations.pl` is an independent metadata store. It does not load,
rewrite, index or infer anything in a KB. Module loading performs **no disk I/O
and no default initialization**. Browser visibility is a per-browser concern,
not a server setting.

## Native data, not a universal truth value

The authoritative dynamic **data-fact** predicates are exactly:

```prolog
nars_tva(Entity, NativeRecord).
oc_tva(Entity, NativeRecord).
cyc_bayes_value(Entity, Property, Value).
```

Canonical records rendered specially are:

* NARS: `nars_truth_value(Frequency,Confidence)`.
* Historical OpenCog SimpleTruthValue: `stv(Strength,Confidence)`.

Both pairs use finite numbers in `[0,1]`. Confidence zero denotes no evidence;
the pair does not create evidence counts. These explicitly supported storage
records preserve their own family semantics. They are not representations of
each other, Cyc utility, assertion strength, or measured rule usefulness.
Boundary confidence 1 is accepted as stored native data; this module does not
convert it into a finite evidence count or run a NARS/OpenCog implementation.

Other native records are retained **whole and unchanged**, including extra
fields, vendor functors, lists, fixed-tag dicts, strings, zero, `false`, negative
values, and empty lists. Unknown layouts are inspectable, not guessed into a
pair. Cyc property names preserve exact spelling and case; they are nonempty
text atoms, at most 1024 characters. The facade accepts strings for property
names but stores the corresponding atom. It never remaps a property.

Records must be ground, acyclic, finite, ordinary Prolog data. Opaque SWI blobs,
clause/stream references, nonground dict tags, and nonfinite floats are rejected.
Limits: 128 nesting levels, 100,000 data nodes, 262,144 serialized characters
per record; 50,000 exact facts and 64 MiB per sidecar. No native handles or
threads enter exports or storage. Values are never called, consulted, expanded,
or treated as web goals. Directly asserting a rule into any fixed predicate
causes a typed `native_data_fact` error; its body is never executed.

## Identity and fallback

`native_entity(Input,NativeTerm,CanonicalKey)` accepts:

* Native, case-sensitive `x_*` atomic identities.
* Full ground normalized applications, including compound MT identities.
* Canonical `nat:` / `mt:` keys.
* Lowercase hexadecimal assertion IDs, e.g. `a60a2418202240`.
* The literal atom/key `default`.

Arbitrary unprefixed human text is rejected. Text beginning `x_` is an **atomic
identity**, even when its name contains spaces or parentheses; use `nat:...`
for unambiguous compound text. Actual Prolog compounds are accepted directly.
The existing `kb_term_resolver`,
`kb_non_atomic`, and `kb_terms` codecs do all parsing/validation. Compound
entities are stored as actual terms, not flattened strings; their public entity
key is `nat:...`. Contexts use `kb_terms`' atomic/`mt:...` key. No existence,
denotation, microtheory membership, or inheritance is invented by a key parser.

Every read takes an explicit `Context`: JSON/Prolog `null` skips the MT level;
otherwise it must be a valid native atomic or compound MT identity. There is no
first-loaded, last-visited, source-assertion-MT, or `genlMt` fallback.

Resolution checks **the same family and same property key** at:

1. The entity (`origin: "atom"`).
2. The supplied current browser MT (`origin: "mt"`).
3. Literal `default` (`origin: "default"`).
4. `status: "uninitialized"`, only if none exists.

Repeated identical checked keys are removed, retaining the first origin. Thus
an entity equal to its current MT, or entity `default`, has origin `atom`.
Existence, not truthiness, controls selection: zero, `false`, negative values,
and valid empty records stop fallback. NARS and OpenCog select **one entire
record**; no fields are merged. Cyc enumerates the union of property keys at all
three locations, including inherited-only properties, and resolves each
independently. Reads never materialize inherited records.

Exactly one fact is allowed per family/entity/property through the upsert API.
Direct REPL-created duplicates, **even identical duplicates**, are represented
as `conflict`, never a first-match winner. A conflict at a higher level stops
fallback. Explicit upsert or clear can repair that exact key. Other keys remain
unchanged.

## Stable Prolog and JSON facade

All JSON examples below are ordinary SWI dicts. Names shown in camelCase are
literal response keys. Property names remain unchanged. Empty context is the
JSON value `null`, not the string `"null"`.

### Status

```prolog
native_status(Reply).
```

```json
{
  "revision": "sha256",
  "sequence": 3,
  "schema": 1,
  "recordCount": 5,
  "keyCount": 5,
  "conflictCount": 0,
  "persistence": "durable"
}
```

`persistence` is `absent` for a never-written empty store, `durable` for a
validated sidecar, or `snapshot_only` for a restored/imported snapshot whose
sidecar is absent. Native annotation revisions are independent of KB generation.

### Summary

```prolog
native_summary(Entity, Context, Reply).
```

```json
{
  "revision": "store-sha256",
  "entity": "x_Fido",
  "context": "x_BrowserMt",
  "families": {
    "nars": {"family": "nars", "effective": {}},
    "opencog": {"family": "opencog", "effective": {}},
    "cyc": {
      "family": "cyc",
      "properties": [{"property": "utility", "effective": {}}]
    }
  }
}
```

Summary and detail also include `entityExpression` and `contextExpression`.
Every effective row includes `supplierExpression` (null only when no supplier).
These are the existing `kb_terms:term_ast/3` **semantic identity ASTs**, suitable
for the shared linked S-expression renderer. They preserve the complete compound
identity, including nested heads and case, without fetching/copying an assertion
formula or native TVA payload. Missing context has `contextExpression:null`.
Batch and Settings replies include their top-level `contextExpression` too.
Canonical keys remain the navigation/identity authority; JavaScript must not
parse Prolog `nat:`/`mt:` text to reconstruct these ASTs.

Each `effective` has the common fields:

```json
{
  "status": "initialized",
  "origin": "default",
  "supplier": "default",
  "supplierExpression": {"type": "symbol", "value": "default"},
  "recordRevision": "context-bound-sha256",
  "summary": {"renderer": "nars_truth_value", "frequency": 0.5, "confidence": 0.0},
  "recordCount": 1
}
```

Statuses are `initialized`, `uninitialized`, or `conflict`. Uninitialized has
null origin/supplier/supplierExpression/summary, count 0; conflict has its actual supplier/origin,
null summary, and count greater than 1. Every status has a `recordRevision`.

OpenCog's summary is `{"renderer":"opencog_stv","strength":S,"confidence":C}`.
Unknown layouts use `renderer: "native_data"` and a compact shape:
`kind: number|boolean|atom|string|list|dict|compound`, with scalar `value`, or
`length`, `size`, or `functor`/`arity` as appropriate. Strings/atoms longer than
128 characters are summarized by length; long functors are explicitly marked
`functorTruncated:true` with their original `functorLength`. Rationals and
integers outside JavaScript's exact safe-integer range expose
`kind:"number",representation:"rational"|"integer"`; they are not rounded. No whole
nested payload, formula, dict contents or large text is present in summaries.

### Detail, fetched lazily

```prolog
native_detail(Entity, Context, Family, Property, ExpectedRecordRevision, Reply).
```

`Family` is `nars`, `opencog`, or `cyc`; `Property` **must be `null`** for
NARS/OpenCog, and the exact property name for Cyc. Pass `recordRevision` from
the summary for the **same entity and context**.

The result is `{revision,entity,context,entityExpression,contextExpression,
family,property,effective,records}`.
`records` contains zero, one, or multiple `{data,text}` objects according to the
resolution state. `text` is canonical, escaped Prolog **data**, ending in a
period/newline. It is generated only on demand. Use `textContent`, never HTML
insertion/evaluation. `data` is lossless typed DTO:

* `{type:"atom",value:"..."}` versus `{type:"string",value:"..."}`.
* `{type:"number",value:N}`; exact rationals `{type:"rational",text:"1r3"}`;
  integers beyond JavaScript's exact safe range `{type:"integer",text:"..."}`.
* `{type:"compound",functor:"...",args:[DTO...]}`.
* `{type:"list",items:[DTO...]}`.
* `{type:"dict",tag:DTO,entries:[{key:DTO,value:DTO}...]}`.

`native_record_dto(Record,DTO)` exposes the same pure validated adapter.
No regex rewriting, executable terms, or opaque references are needed.
`recordRevision` hashes the complete selection and explicit context; changes
to unrelated keys do not invalidate detail. Changing the applicable record or
context does. A stale token throws `native_tva_record_revision_conflict`.

### Bounded batch

```prolog
native_batch(Entities, Context, Options, Reply).
```

At most 200 input entities; canonical duplicates are removed. Response:
`{revision,context,contextExpression,items:[Summary...],total,offset,limit}`. All rows come from
one synchronized snapshot. Options are a dict:

| Key | Values / default |
|---|---|
| `family` | `nars`, `opencog`, `cyc`; omitted by default |
| `property` | Exact Cyc property for filtering/sorting |
| `sort` | `entity` (default), `origin`, `frequency`, `confidence`, `strength`, `value` |
| `order` | `asc` (default), `desc` |
| `status` | `all` (default), `initialized`, `uninitialized`, `conflict` |
| `origin` | `all` (default), `atom`, `mt`, `default` |
| `min`, `max` | Optional finite numeric bounds on the selected numeric sort field |
| `offset` | Nonnegative integer, default 0 |
| `limit` | 1..200, default 200 |

Filters and non-entity sorting require a family, and Cyc requires a property.
Numeric sorts include only initialized, available **numeric** fields: booleans,
strings, missing values, and conflicts are not coerced into numbers. Origin
sort omits unavailable origins. Ties use canonical entity identity.
No arbitrary field path, comparator, or goal can be passed.

An explicitly supplied `property` (with family `cyc` or omitted) additionally
requests that Cyc property in every row. If it is absent at all three levels,
the backend includes a normal `uninitialized` effective object and valid lazy
detail token. This is an explicit **absence result**, not a stored/inherited
copy. The ordinary property union remains intact and sorted without duplicates.
With no `property` option, summaries still enumerate only the actual union.
`property` is invalid with family `nars` or `opencog`.

## Trusted writes and authorized Settings

```prolog
upsert_native(Family, Entity, Property, NativeRecord, ExpectedRevision, Status).
clear_native(Family, Entity, Property, ExpectedRevision, Status).
native_update([put(Family,Entity,Property,Record),
               remove(Family,Entity,Property)], ExpectedRevision, Status).
```

Up to 500 changes, applied atomically in supplied order. All values are
validated before writing. Expected revision is mandatory; there is no `any`
bypass. No-op changes keep the revision unchanged. Only the requested exact
keys are replaced/removed. Raw native-record editing is a trusted Prolog API,
**not** a general-purpose HTTP editor.

```prolog
initialize_defaults(ExpectedRevision, Status).
```

This **explicit authorized write**, never a startup hook, upserts exactly:

```prolog
nars_tva(default,nars_truth_value(0.5,0.0)).
oc_tva(default,stv(0.5,0.0)).
cyc_bayes_value(default,utility,0.5).
```

It additionally inserts these independent settings **only when each exact key
is absent**:

```prolog
cyc_bayes_value(default,monotonic_strength,1.0).
cyc_bayes_value(default,default_strength,0.7).
cyc_bayes_value(default,asserted_positive_truth,1.0).
cyc_bayes_value(default,asserted_monotonic_confidence,0.97).
cyc_bayes_value(default,asserted_default_confidence,0.66).
```

All other keys/overrides are retained. Existing duplicate setting keys remain
visible conflicts, not implicitly repaired. The subsequently approved direction
default is `:BACKWARD`, and missing assertion strength defaults to `:DEFAULT`. Utility
0.5 is a configured default, not an observed rate. The asserted-prior settings
do not overwrite or supplement native-family resolution.

```prolog
native_settings(Context, Reply).
save_native_settings(Context, Patch, ExpectedRevision, Reply).
```

For Settings APIs, `null` or `default` selects global settings; otherwise
the explicit context selects per-MT overrides. Allowed Patch keys are `utility`,
`monotonic_strength`, `default_strength`, `direction`, `asserted_positive_truth`,
`asserted_monotonic_confidence`, `asserted_default_confidence`, and the global-only
`missing_assertion_strength` category (`:DEFAULT` or `:MONOTONIC`). Numeric values
must be finite `[0,1]`; there is **no ordering constraint** between strengths
or confidence settings.
Directions are `:FORWARD` or `:BACKWARD` (atoms in storage; JSON strings accepted
by Settings save). A Patch value `null` clears that exact override instead of
copying the global value. Clearing a global value removes the global setting.

Reply: `{revision,context,contextExpression,global,effective,overrides}`.
`global` and `effective` each contain the eight property keys with an
`effective`-shaped object. `overrides` contains eight boolean presence flags
at the selected exact key.
Settings origins are `mt` or `default`, including their own exact key. Existing
bad direct-REPL values return `status:"invalid",reason:"invalid_setting_value"`,
not Uninitialized, and do not fall back.

Settings endpoints must be explicitly authorized and narrowly allowlisted by
the host. This module does not create endpoints, remote administration, or
browser preferences.

## Source direction and display-only mapped strength

```prolog
assertion_interpretation(Entity, Context, Reply).
assertion_interpretations(Entities, Context, Batch).
```

Read-only access uses the already-loaded `kb_store:assertion/2` compact
`properties` list. No source loading, rescanning, provenance mutation or rule
execution occurs. The native TVA store does not copy original formulas/CNF.

The plural API accepts at most **200** input entities and returns exactly
`{revision,generation,context,items:[InterpretationDTO...]}`. Canonical duplicate
entities are removed in first-input order; an empty list is valid. Inputs over
the limit raise `resource_error(native_interpretations_limit)`.

Source generation and compact source data are captured together under one
`openworld_store` lock. Assertion retrieval is indexed by the exact ID; no
source files or whole assertion catalogs are scanned per entity. Captured data
contains only source references, direction/monotonicity values and polarity,
not original formula AST copies. Native storage is then synchronized **once**
under its own mutex, and all items derive from that same state. Each batch
item has the wrapper's identical native `revision` and source `generation`.
Generation is null when there is no loaded store-generation provider. These
are two explicit snapshots, not a claimed cross-store transaction. Host
generation/revision events can invalidate an older returned tuple.

Use this API to refresh direction, mapped-strength and separate assertion-prior
views for a compact list after Settings changes, without an N+1 disk-read
pattern. The singular API and native-family lookup behavior remain unchanged.

Reply is `{revision,generation,entity,context,entityExpression,contextExpression,
source,monotonicity,effectiveMonotonicity,strengthCategory,direction,mappedStrength,assertionPrior}`. Source is
`{assertionId,file,line}` or null. Monotonicity is the unchanged list of
original source label atoms.

* Explicit native exact-assertion **Atom overrides win source metadata**,
  including an intentional replacement of invalid/conflicting recorded metadata.
  Invalid or duplicate Atom overrides remain invalid/conflicting until replaced
  or cleared; they never silently fall through.
* Without an Atom override, recorded source direction and strength win supplied
  MT/global values. Duplicate recorded values (even identical) are conflicts;
  unsupported values are invalid. Source arrays remain visible and unchanged.
* With neither Atom override nor recorded source value, the same property
  (`direction` or `monotonicity`) resolves supplied MT → global. Missing category
  then uses the separate global `missing_assertion_strength` policy.
* Effective `:MONOTONIC` selects `monotonic_strength`; `:DEFAULT` selects
  `default_strength`. Each numerical setting resolves supplied MT → global
  independently, with origin/supplier. Missing settings are uninitialized;
  non-assertion entities have unsupported source-strength interpretation.

These mappings are **display interpretation only**. Source monotonicity remains
unchanged; numerical strength is not native TVA, utility, confidence, a rewrite
policy or an inference weight. No forward chaining is enabled by direction.
Explicit native per-entity TVAs retain their own independent precedence.

### Configured assertion priors are a separate view

`assertion_interpretation/3` returns the separately named `assertionPrior`:

```json
{
  "kind": "configured_assertion_prior",
  "scope": "asserted_formula",
  "status": "initialized",
  "polarity": "positive",
  "source": {"assertionId": "a123", "file": "KBs/example.krf", "line": 9},
  "sourceMonotonicity": [":MONOTONIC"],
  "observed": false,
  "affectsNativeTVA": false,
  "materialized": false,
  "reason": "configured_asserted_formula",
  "truth": {"property": "asserted_positive_truth", "...": "normal effective fields"},
  "confidence": {"property": "asserted_monotonic_confidence", "...": "normal effective fields"},
  "families": {
    "nars": {
      "family": "nars", "kind": "configured_assertion_prior", "scope": "asserted_formula",
      "derived": true, "stored": false, "status": "initialized",
      "summary": {"renderer": "nars_truth_value", "frequency": 1.0, "confidence": 0.97},
      "data": {"type": "compound", "functor": "nars_truth_value", "args": [
        {"type": "number", "value": 1.0}, {"type": "number", "value": 0.97}
      ]},
      "notation": "%1.0;0.97%", "notationFormat": "nars"
    },
    "opencog": {
      "family": "opencog", "kind": "configured_assertion_prior", "scope": "asserted_formula",
      "derived": true, "stored": false, "status": "initialized",
      "summary": {"renderer": "opencog_stv", "strength": 1.0, "confidence": 0.97},
      "data": {"type": "compound", "functor": "stv", "args": [
        {"type": "number", "value": 1.0}, {"type": "number", "value": 0.97}
      ]},
      "notation": "(stv 1.0 0.97)", "notationFormat": "opencog_stv"
    }
  }
}
```

This is **not a fourth fallback**, a native truth-value conversion, or an
asserted record. Render it separately and clearly as **Configured asserted-formula
prior**, never in place of NARS/OpenCog/Cyc results. There are no observation
counts, evidence samples, engine weights, inferred inverse values or per-atom
materializations. Native Atom → supplied MT → literal default resolution stays
unchanged, including explicit native overrides and the user's current global
records (which need not equal the initial `.5/0`). Reads never initialize, reset
or rewrite those records. The two views are displayed together, not selected
against one another.

For a loaded source assertion with supported whole-formula polarity and an
initialized effective strength category:

* Whole-formula truth uses **the unchanged key** `asserted_positive_truth`
  (initial global 1). “Asserted-formula prior truth” is a compatibility label,
  not a renamed key, alias, migration, reset, or loss of existing overrides.
* `:MONOTONIC` confidence uses `asserted_monotonic_confidence` (initial 0.97).
* `:DEFAULT` confidence uses `asserted_default_confidence` (initial 0.66).

Each setting resolves **supplied browser MT → global** independently. Zero
is valid; clearing an MT override exposes the current global value. These
settings are distinct from earlier `monotonic_strength`/`default_strength`
display mappings 1/.7. The source category, original labels, formula and
monotonicity presentation colors are unchanged. A per-assertion Cyc fact using
one of these names is still visible to ordinary exact-key Cyc resolution, but
does not become an app/MT prior-setting override.

Polarity inspection is a conservative, read-only use of the already-rendered
source AST: an application with a named normalized `x_*` head is syntactically
positive except canonical unary `x_not`, which is **negative**. There is no
logical simplification or polarity inference through arbitrary predicates.
MeTTa `not` data is not treated as logical negation. Malformed canonical negation,
variable/compound predicate heads, non-application
data forms, and unavailable source ASTs have unknown polarity.

Canonical `(not P)` receives the configured prior **for that whole negated
formula**, identified by `source.assertionId`: `polarity:"negative"`,
`scope:"asserted_formula"`, with the same configured truth and selected confidence.
This never asserts `P` true, complements/inverts a value, simplifies a formula,
or changes a negative/red assertion marker. Canonical FALSE-DEF and stored-false
negative assertions work identically. A false source marker without a canonical
negated AST is conservatively `polarity:"source_false"`, `status:"unsupported"`,
`reason:"source_false_without_canonical_negation"` with null values: the browser
must not affirm its positive formula or fabricate a missing negation. Its source
false/red marker remains unchanged.

Unknown source/polarity returns an explicit unsupported reason; nonasserted terms
receive no prior truth value. Invalid, conflicting and uninitialized category
states propagate for **both** positive and negative assertions. Missing
settings are uninitialized, invalid values are invalid, and duplicate exact
setting records are conflict. Overall status prioritizes conflict, then invalid,
then uninitialized; truth and confidence retain independent supplier/provenance.

`assertionPrior.families` contains only **read-derived configuration shapes**:
NARS `nars_truth_value(Truth,Confidence)` and OpenCog `stv(Truth,Confidence)`.
Each shape has no supplying native entity or native record revision; provenance
is the enclosing prior's source plus independent `truth`/`confidence` effective
settings. For noninitialized priors, each family has the same status and null
`summary`, `data`, `notation`, and `notationFormat`. Exact non-JSON numeric
components remain typed data, with `notationFormat:"prolog_data"` instead of
rounded NARS/OpenCog notation. Values and notation are computed by the backend
from one snapshot, never hardcoded in JavaScript or saved as per-assertion facts.
The bounded `assertion_interpretations/3` batch includes this same DTO without
additional disk reads or source-file scans.

`renderAssertionPriorInline(interpretation,{document})` is a pure, text-safe
compact renderer. The annotation host shows this separate line beside inline
native records whenever any native family is visible and the full prior field
is hidden. Enabling the full prior field replaces the compact line; assertion
detail always uses the full inspector. Family visibility defaults and browser
preferences are unchanged. Revision/context changes clear stale prior text while
the coherent batch refreshes; original formulas and negative markers are retained.

The existing pure `kb_rule_utility:opencog_utility/3` adapter is a **separate
derived rule-usefulness metric**. Its observed application counts and DTO must
not be stored in `oc_tva/2`, overwritten with defaults, or confused with
propositional truth. This module neither calls nor changes that telemetry store.

Whole-formula refinement verification: **84 PL-Unit and 35 Node tests passed**,
including isolated actual-SWI DTO integration, restart/qsave/lock fixtures,
negative FALSE-DEF/stored-false scope, zero/clear inheritance, `.9/.9` native
global preservation, no per-assertion materialization, and desktop/mobile browser
checks of both displays, red markers, and revision refresh. Scoped UI detection
and `git diff --check` also passed. Commands from `prolog\ow_dr`:

```powershell
swipl -q -s tests\test_native_annotations.pl -g run_tests -t halt
node --test tests\native-tva.test.mjs tests\native-tva.integration.test.mjs tests\native-tva.browser.test.mjs tests\native-tva-editors.browser.test.mjs tests\presentation.test.mjs
```

All writes in these tests use isolated fixtures. No live state initialization,
reset, reseed, save, reload, restart, publication, source edit, or cache rebuild
is part of this refinement.

## Typed persistent editors

These editors write only the existing native sidecar. They never modify source
bytes, formulas, CNF, IDs, clause handles, execution policy or KB selection.
The application routes below are relative to its configured URL base.

### Assertion Strength and Direction

```prolog
assertion_annotation_settings(AssertionId, Context, Reply).
save_assertion_annotations(AssertionId, Context, Patch, Expected, Reply).
```

`AssertionId` must identify exactly one **currently loaded assertion**.
`Context` is the explicit browser MT or `null`, not its source MT.
Read reply:

```text
{
  revision, generation, identity, entity, context,
  recorded: {monotonicity:[original labels], direction:[original values]},
  overrides: {monotonicity:Effective, direction:Effective},
  effective: {monotonicity:Effective, direction:Effective},
  layers: {
    mt: null | {monotonicity:Effective, direction:Effective},
    global: {monotonicity:Effective, direction:Effective,
             missing_assertion_strength:Effective}
  },
  interpretation: InterpretationDTO
}
```

`recorded.monotonicity` includes original `monotonicity` and `strength` properties.
`overrides` and `layers` inspect exact keys, never inherited copies. Effective
objects retain their actual status, origin, supplier, revision and safe summary;
MT/global source layers remain inspectable even while an Atom override wins.

Patch has only the edited keys:

```json
{"monotonicity":":DEFAULT","direction":":BACKWARD"}
```

Strength permits `:DEFAULT` / `:MONOTONIC`; direction permits `:FORWARD` /
`:BACKWARD`. `null` independently removes that exact assertion override.
Persistent facts use the unchanged ID with Cyc keys **`monotonicity`** and
**`direction`**. A typed replacement resolves all duplicate records at only
that exact key. Clearing reveals unchanged recorded source metadata—including
invalid/conflicting metadata—before applicable MT/global fallback.

`Expected` must be exactly `{revision,generation,identity}` from the read.
Identity hashes the assertion ID, current source expression, properties and
source location; only the hash is retained in the editor token, never a duplicate
formula blob in native storage. The save checks generation and identity while
holding the source-store mutex through the revision-safe native commit. A
replaced/unloaded assertion or stale store cannot be edited accidentally.

* `POST api/tva/assertion`: `{entity,context}` → read reply.
* `POST api/tva/assertion/save`:
  `{entity,context,patch,revision,generation,identity}` → refreshed read reply.
* Revision, generation and identity conflicts are HTTP 409; nonexistent
  assertions are 404; invalid typed fields are 400.

The assertion-detail editor is visible independently of annotation visibility
preferences. Each select offers **Use source / inherit** and an independent clear
control. Conflicts preserve dirty selections. **Read latest (keep edits)** fetches
new preconditions; review before explicitly saving again. Success invalidates
shared annotation summaries, lazy native details, mapped strengths, priors and
visible assertion balls without replacing unrelated editor DOM. Negative
assertions remain red and receive no guessed positive prior.

### Native NARS / OpenCog whole-pair Settings

```prolog
native_pair_settings(Context, Reply).
save_native_pair(Context, Family, PairOrNull, ExpectedRevision, Replace, Reply).
```

As in scalar Settings, `null`/`default` chooses the global record, otherwise the
explicit MT chooses its whole-record override. `Family` is `nars` or `opencog`.
NARS accepts exactly `{frequency:F,confidence:C}`; OpenCog accepts exactly
`{strength:S,confidence:C}`. Both fields are required, finite `[0,1]`, and explicit
zero is valid. Writes create `nars_truth_value(F,C)` or `stv(S,C)`, not a merged
record. `null` removes the scoped whole record (MT then inherits the global).

```text
{
  revision, context, contextExpression,
  families: {
    nars: {family, exact:Effective, effective:Effective, editable,
           replacementRequired, detail:{entity,context:null,family,
                                        property:null,recordRevision}},
    opencog: {same fields}
  }
}
```

Origins are `mt` or `default`; the UI labels the latter **Global record**.
`detail` is an exact ready-to-send lazy-detail request, including inherited
records. Summaries never include whole unknown native payloads.

Unknown/vendor layouts, extra fields, non-JSON-exact rational pair components
and conflicting exact records have
`replacementRequired:true`. A save/clear then requires the explicit boolean
`Replace=true`; otherwise HTTP 409 `native_pair_replacement_required` preserves
everything. The UI keeps those records read-only with a safe lazy inspector
until the user explicitly checks replacement consent and enters a complete
canonical pair. Exact rational components remain losslessly inspectable, never
silently rounded into editable decimal controls. A new MT pair does not replace an inherited vendor global
record. Other families, Cyc settings, Atom overrides and other MTs are untouched.

* `GET api/tva/pairs?context=...`: omit context for global.
* `POST api/tva/pairs/save`: `{context,family,pair,revision,replace}`.
* Both typed **write** routes require loopback peer and existing same-origin
  validation, in addition to strict body allowlists. There is no generic native
  term editor or arbitrary goal endpoint.

Settings have separate native-pair and Cyc prior sections. Creating an MT override
starts from the displayed complete pair but writes nothing until Save. Clearing
removes the override rather than copying global values. The existing deliberate
global reset remains separate; opening any editor never initializes/reseeds.
Native values remain `.5/0` until an explicit authorized write changes them.

### Frontend host callbacks

`renderAssertionAnnotationEditor` receives `entity`, `initialContext`, `signal`,
`readAssertion({entity,context},{signal})`,
`saveAssertion({entity,context,patch,revision,generation,identity},{signal})`,
and `onSaved(reply)`. It exposes `setContext`, `refresh`, `dispose`, and its
`controller`. Optional `reference` renders canonical supplying keys.

`renderTVASettings` additionally accepts
`readPairs({context},{signal})`,
`savePair({context,family,pair,revision,replace},{signal})` and existing
`fetchDetail(request,{signal})`. It retains all scalar Settings/reset callbacks.
The standalone `renderNativePairSettings` exposes `setContext`, `refresh`,
`discard`, `dispose`, and per-family controllers. Context drafts are bounded;
changing scope never autosaves. `createAssertionAnnotationController` and
`createNativePairController` expose `get/load/save/edit/discard/setContext/
subscribe/dispose` for focused host tests.

## Durability, conflicts, REPL, and saved states

### Missing assertion strength category

The global-only Cyc property `missing_assertion_strength` is initially
`:DEFAULT`, and may be changed to `:MONOTONIC` or explicitly cleared.
It is a category, not numerical strength, confidence, utility or native TVA.
It is used only after absent Atom override, absent recorded source category and
absent supplied-MT/global native `monotonicity`. Invalid/conflicting explicit
categories remain visible, not replaced by this policy. An explicit typed Atom
override intentionally takes precedence over recorded metadata; clearing it
restores the original source behavior. Native `monotonicity` and global
`missing_assertion_strength` are separate Cyc properties.

Interpretations retain `monotonicity` as recorded and return separate
`effectiveMonotonicity` and `strengthCategory` with its supplier. The effective
category selects the existing current-MT/global numeric mapping and configured
prior confidence. Nothing is copied into assertion metadata. Negative formulas
stay negative. Native NARS/OpenCog/Cyc record fallback is unchanged.

This eighth Settings key is editable only at global scope. Initialization adds
it only if absent; upgrading a running installation should save only this key,
not reinitialize the other native defaults. Inline marker refresh uses the same
interpretation result, so only inheriting assertions change color.

`reset_global_defaults(ExpectedRevision,Reply)` is an explicit global-only
reset. It restores the two native `.5/0` family records, Cyc utility `.5`,
numeric source mappings `1/.7`, assertion-prior truth/confidences `1/.97/.66`,
direction `:BACKWARD`, and missing category `:DEFAULT`. It does not modify any
atom/MT override, unrelated Cyc property, source label, formula or KB selection.
The UI's **Reset global defaults** button uses this revision-safe operation and
reloads the saved values. It is not run implicitly when opening Settings.

Default sidecar: application `.logos-state\native-tva.pl`, outside disposable
cache trees. A **trusted process environment** override
`POWDER_NATIVE_TVA_FILE` must be an absolute file path; it is intended for
fixtures/isolated builders, not request input. Changing it while attached raises
`native_tva_storage_changed`; it is not a web storage selector.

Storage uses `kb_cache:try_lock/2`'s real nonblocking native cross-process lock
on the stable `.lock` file, unique adjacent staging, flush/close, complete
re-read validation, and `kb_cache:install_stage/2` atomic replacement. The old
sidecar is preserved when staging/validation/installation fails. Lock files are
not deleted. Interrupted unreferenced stages are inert and never automatically
promoted or mistaken for state. OS power-loss durability is limited to the
existing SWI flush/close + native rename primitives, not a claimed hardware
`fsync` guarantee.

The inert file format is:

```prolog
native_tva_header(1,Sequence,Revision,FactCount).
% Actual nars_tva/2, oc_tva/2, cyc_bayes_value/3 facts, sorted with duplicates.
native_tva_footer(Revision,FactCount).
```

The comment above is documentation, not emitted data. SHA-256 binds schema,
monotonic sequence, complete typed records, ordering and multiplicity. Footer,
count, shape and digest are validated; arbitrary directives are never consulted.
No source fingerprints, source configuration, corpus bytes, caches, native
clauses, or KB generations are changed.

Facade APIs observe current predicate generations and a validated snapshot,
including direct qualified `assertz/retract/retractall` changes to the exact
three predicates. Such REPL edits are persisted on the **next facade call** or
`persist_native_state/1`; they are not immediately durable at the raw
`assertz/1` return and have no implicit at-halt flusher. A crash before flushing
can lose them. Raw reads of the predicates do not automatically open the
sidecar: attach using `native_status/1` first.

**Concurrent applications must use the revision-safe write APIs.** Trusted
REPL edits should be serialized, e.g. under `with_mutex(powder_native_annotations,
...)`, and flushed before exit. The module detects snapshot drift but cannot
make a naked assertion racing a disk rename transactional. It never promises
that unsupported race is safe. REPL records invalidating the data-only contract
must be repaired by the trusted REPL before a facade API can continue.

An unchanged process refreshes from another process's committed sidecar.
Unsynced REPL edits plus external disk changes throw
`native_tva_persistence_conflict(Base,Disk)`, retaining the local edits and the
external durable file. There is no silent merge/discard. Missing established
durable storage throws `native_tva_storage_missing`; corruption/read failures
propagate instead of becoming Uninitialized. Busy, revision conflicts, invalid
input and resource limits are typed errors for the host to translate.

```prolog
export_native_state(State).     % synchronize; ground completed records only
import_native_state(State).     % trusted isolated-builder MEMORY replacement
reset_transient.                % cache/path attachment only; retains records
persist_native_state(Status).   % explicit flush
```

The exact export is
`native_annotations{schema:1,revision:Hash,sequence:N,records:[NativeFacts...]}`.
Import validates it, performs no disk write, and establishes an imported
baseline. Actual qsave restore clears volatile caches/path attachment and marks
the captured baseline imported; dynamic native facts survive. If the sidecar is
absent, that snapshot remains active (`snapshot_only`), not emptied. An existing
sidecar is authoritative when the imported/local snapshot has no unsynced
edits. Explicit persistence can recreate a missing sidecar under its lock.
The host's saved-state bridge should export and import these records rather
than serializing native handles. A restore does not implicitly seed defaults.

## Focused validation

From the repository root:

```powershell
swipl -q -s prolog\ow_dr\tests\test_native_annotations.pl -g run_tests -t halt
node --test prolog\ow_dr\tests\native-tva.test.mjs prolog\ow_dr\tests\native-tva.integration.test.mjs prolog\ow_dr\tests\native-tva.browser.test.mjs prolog\ow_dr\tests\native-tva-editors.browser.test.mjs
```

Fixture sidecars, child-process qsave files and isolated browser profiles are
confined to unique paths inside `tests`, then removed. The test suite never connects
to the published server, initializes live defaults, compiles a corpus, or
changes existing application settings.

Verified on Windows / SWI-Prolog 10.1.7: **79 native backend tests plus eight
focused HTTP-action tests passed**, including actual
native KB load/query/source-byte isolation, restart, two qsave/restore paths,
cross-process native locking and stale-writer conflicts. A 200-item interpretation
batch is instrumented to prove one native synchronization and one disk read;
a real competing source-writer thread verifies coherent source generation and
metadata capture. **25 Node tests passed**, including actual SWI DTO integration
and two isolated Chromium fixtures. Typed editor tests cover immutable recorded
source, intentional overrides, independent clears, revision/identity/generation
conflicts, unknown/rational record protection, native whole-pair persistence,
negative-marker preservation and desktop/mobile layout. No live reload or
production write was used. An earlier isolated eight-record
default fixture measured 20 batches of 200 entities at 1.496 seconds total
(0.0748 seconds per batch), including identity ASTs. This is a small annotation-store measurement, not a
large-corpus or production-service performance claim.
