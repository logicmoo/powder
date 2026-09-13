# Opt-in definitional patches

`KBs\DefinationalPatches.krf` is the authored program. Its 69 prototypes are
preserved; the two forward rules now end with `(missingConstraintSlot ?Post)`.
The constructor substitutes `:P` twice in **one fresh prototype**. The former
`copy_term` followed by `=` unnecessarily copied and then reunified that
prototype; neither spelling was an available Prolog primitive in KRF.

## Supported invocation

This is a trusted, in-process Prolog API, **not a web/KEE tool** or an automatic
startup action. In an explicitly authorized local runtime with sources already
loaded, load the module and preview:

```prolog
?- use_module('prolog/ow_dr/kb_definitional_patches', []).
?- kb_store:generation(G),
   kb_definitional_patches:preview(
       'KBs/DefinationalPatches.krf', x_YourMt, catalog, G, Report).
```

SWI accepts the slash-separated Prolog path atoms above on Windows. Shell
commands below use Windows paths. Keep the returned generation, inspect the
report, and explicitly call `kb_definitional_patches:apply/5` with the **same
arguments and expected generation** to materialize defaults. `apply/5` computes
the plan again against current evidence; it never trusts a submitted proposal.
Do not call it in a live runtime without authorization.

The evidence argument is one of:

| Argument | Authority and completeness |
|---|---|
| `catalog` | The repository's entire `KBs` manifest, including unloaded sources. Requires a complete current catalog and compiler identities, verified source/cache hashes, and readable complete normalized records. Does not build or refresh the catalog. |
| `manifest(Root, Files)` | An explicitly designated authoritative directory for this operation and its **entire** recursively discovered original-source manifest. `Files` must match actual discovery; omissions, newly discovered files, and relevant loaded sources outside it reject the operation. |

A directory manifest is a host/user declaration of **bounded source authority**,
not evidence that the rest of the repository/world lacks a definition. Use the
repository catalog when repository-wide providers are relevant. Never present an
arbitrary loaded subset as an authoritative directory. No directory option
creates an ontology-closure or microtheory-inheritance assumption.

For a deliberately isolated directory, obtain the concrete manifest with
`kb_compile:discover_sources([Root], Files)` and pass `manifest(Root, Files)`.
All selected original sources are read through the shared reader, including
unloaded providers. Loaded source bytes and semantic clauses must match.
Only loaded positive assertion records supply inheritance edges and antecedents;
unloaded records block occupied/uncertain slots and identify their providers,
but are not loaded or used to create new inheritance candidates.
Source records are matched in validated native source order using the shared
occurrence key and duplicate ordinal; assertions sharing a source line retain
distinct native IDs. Compiler identities include mapping-table content and
recorded options, and are checked again before publication.

Both modes operate in **one exact MT**, including compound MTs. The patch
program's own MT is program provenance, not an implicit visibility override.
`genlPreds` and the authored spelling `genlFuncts` are supported. No guessed
`genlFuncs` or `genlFunctions` alias exists.

## Rule and primitive semantics

The program is parsed as KRF, not recognized by filename or text search. The
interpreter validates the complete authored program: the two guarded forward
rule shapes, the backward constructor, direction metadata, variable sharing,
and supported prototype schemas. Unsupported statements/constructors reject
the operation; no arbitrary Prolog `call`, unification, filesystem operation,
or evaluation can be requested by the program.

`replaceMarker(Original, :P, Replacement, Result)` is literal recursive
structural substitution. Variables are not markers. One fresh prototype per
candidate is used for both substitutions, preserving repeated variables and
Pre/Post sharing, including nested terms. Nothing mutates the stored prototype.
No row-variable sequence expansion is invented.

`missingConstraintSlot(Post)` is a **record-presence check**, not logical
negation and not `\+ call(Post)`. The candidate must be ground first. Its
schema separates key fields from value fields even when the antecedent already
bound those values.

| Family | Slot key (besides family) | Value |
|---|---|---|
| `arity`, `arityMin`, `arityMax` | Target | Count |
| `argIsa`, `argGenl`, `argQuotedIsa`, `argFormat` | Target, position | Type/format |
| `argsIsa`, `argsGenl`, `argsQuotedIsa` | Target | Type |
| `argAndRestIsa/Genl/QuotedIsa` | Target, starting position | Type |
| `resultIsa/Genl/QuotedIsa`, `evaluationResultQuotedIsa` | Target | Type |
| `resultIsaArg`, `resultGenlArg` | Target | Argument supplying the result collection |
| Numbered `interArgIsa/NotIsa/Genl` | Target, triggering position, dependent position, triggering type | Dependent type |
| `interArgDifferent` | Target, both ordered positions | Presence of that constraint |

Generic and numbered argument forms share keys: `(argIsa P 1 A)` and
`(arg1Isa P B)` occupy the same slot. The same applies independently to Genl,
QuotedIsa, and Format. Different families and sibling positions remain distinct.
No other family equivalences are guessed.

Any positive matching slot blocks inheritance, with the same **or a different**
value. A matching variable-target record also blocks. Negative/formula/rule
evidence involving the target or antecedent slot, malformed slot data, and
higher-order executable heads produce conservative unknown blockers, not proof
of absence. This includes direct higher-order facts, higher-order expressions
inside negation, and unresolved/negative evidence for an inheritance edge.
The engine does not execute queries to settle them.

Tentative defaults never occupy authoritative slots during planning. The bounded
potential inheritance closure is collected before resolving conflicts, so a
shorter path cannot hide a later conflicting value. Conflicted slots and dependent
candidates without an independent supported derivation are not materialized.
Potential conflicts are treated conservatively, including conflicts reached
through another conflicted slot; no arbitrary preference is inferred. Equivalent
numbered/generic candidates materialize only once.

`set-direction` now selects file-local direction metadata for following
KIF/KRF assertions; `:FORWARD` and `:BACKWARD` are the supported values.
It is not asserted as a command fact, does not leak across files/threads, and
does not enable execution. An assertion wrapper can override the default.
MeTTa retains it as inert data. Ordinary `<==` throughout the corpus remains
operator data; only this explicit validated workflow interprets its program.
`<===` retains its existing separate runtime semantics.

## Publication, provenance, and lifecycle

Preview writes no sources, caches, or IDs. Application is serialized with the
existing application admission, code-reload and store mutexes. It requires an
integer generation; a stale invocation fails instead of overwriting a newer
generation. Final input hashes and manifests are rechecked before publication.
Concurrent callers in the **same resident store** get one commit plus a stale
generation response. Retrying against the new generation is a no-op if all
slots are occupied. Cyclic inheritance reaches a bounded fixed point.

Materialized assertions are ground guarded native facts, allocated by the
existing durable ID allocator and stored in an immutable validated cache under
`prolog\ow_dr\.logos-state\definitional-patches`. They are published as one
derived source through the existing native staging/transaction API. Original
KB files and companions are not edited. Stable IDs, source program location,
program hash, rule/constructor/prototype/generalization/antecedent references,
slot keys, `xc_patch_generated(Id,true)` and `:DEFAULT` monotonicity are retained.
The cache header records the scope, input hashes and patch schema.

Ordinary successful additive source changes and unloads retire engine-tagged
derived overlays in the same transaction. Full source replacement also drops
unselected overlays. Authored assertions/settings are never retired by this
policy. Failed/stale source changes retain the previous generation. Existing
queries keep their pinned native snapshots. No lifecycle hook reapplies patches.
This deliberately conservative retirement avoids defaults outliving evidence or
competing with newly loaded authored definitions.

To undo, unload the returned derived `Report.source` using the current generation
and `kb_store:unload_source/3`. Other derived overlays are also retired because
they may depend on it. Immutable audit caches remain on disk. They are **not**
auto-loaded on restart and must not be replayed as fresh defaults.

This is a process-local store transaction, not a distributed cross-process KB
or general durable KEE CRUD/undo service. A crash before publication can leave an
unloaded complete audit cache; its presence alone never proves it was applied.

## Limits and diagnostics

Reports contain `status`, `generation`, `coverage`, `additions`, `count`, and
per-slot `decisions` (`add`, `blocked`, `conflict`) with provider references.
Blocked results distinguish positive occupied slots from conservative unknown
evidence. Stale sources, unsupported programs, incomplete manifests/catalogs,
source errors, warnings, nonground candidates and timeouts raise errors; none
means an empty slot. Exceptions abort the operation without a partial KB.

Planning is limited to 15 seconds and at most 100 distinct potential slot/value
candidates (hence at most 100 additions). These limits are
fixed in the current API, not caller-configurable. Catalog absence
requires inspecting unloaded records, not merely exact-term postings: variable
targets and higher-order heads may lack the candidate's symbol. Large catalogs
may exceed the budget and therefore remain **unknown**; there is no fallback to
loaded-only evidence, automatic full-corpus compilation, or guessed completion.
No full-production-catalog usability or performance claim is made.

Run the focused integration cases in a separate process, not the live server:

```powershell
swipl -q -s prolog\ow_dr\tests\test_definitional_patches.pl -g "run_tests(definitional_patches)" -t halt
```
