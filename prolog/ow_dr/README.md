# OpenWorld Defeasible Reasoner

A local SWI-Prolog knowledge-base compiler, native assertion runtime, and
dependency-free browser. The original knowledge corpus lives in the repository's
`KBs` directory. This application never rewrites those original sources.

## Running from the repository root

```powershell
Set-Location C:\snet\PeTTa\repos\openworld_dr

# Compile the collection, or just the initial KB.
swipl .\prolog\ow_dr\compile_kb.pl -- KBs
swipl .\prolog\ow_dr\compile_kb.pl -- KBs\tinyKB.kif

# Start the browser with exactly KBs\tinyKB.kif.
swipl .\prolog\ow_dr\app.pl

# Select different sources or a different local port.
swipl .\prolog\ow_dr\app.pl -- --port=8080 KBs\Merge.kif
swipl .\prolog\ow_dr\app.pl -- --kb-source=KBs\tinyKB.kif --kb-source=KBs\example.kif
```

The default address is **http://localhost:3050/**, bound to the loopback interface.
All selected inputs must finish compilation and loading before startup is
announced. An invalid source or a busy compiler prevents startup.

Requirements: SWI-Prolog with its standard libraries. Windows source-catalog
authorization uses the included PowerShell helper and native .NET file attributes:
SWI's `read_link/3` does not detect NTFS junctions on the tested Windows build.
There is no package installation or JavaScript build step. Node is used only by
the JavaScript tests.

## Offline compiler

Supported input extensions are `.kif`, `.krf`, and `.metta`. Selections may be files,
directories, or overlapping combinations. Companions are adjacent to each source:

```text
example.kif
example.kif.pl
example.kif.index.pl
```

Useful options, placed after `--` and before the selected paths:

```powershell
swipl .\prolog\ow_dr\compile_kb.pl -- --force KBs
swipl .\prolog\ow_dr\compile_kb.pl -- --no-progress KBs
swipl .\prolog\ow_dr\compile_kb.pl -- --progress=plain KBs
swipl .\prolog\ow_dr\compile_kb.pl -- --strict-mappings KBs
swipl .\prolog\ow_dr\compile_kb.pl -- --edit --editor=edit KBs
swipl .\prolog\ow_dr\compile_kb.pl -- --edit --editor=code KBs
swipl .\prolog\ow_dr\compile_kb.pl -- --recover-tmp KBs
swipl .\prolog\ow_dr\compile_kb.pl -- --force-recover KBs
swipl .\prolog\ow_dr\compile_kb.pl -- --help
```

Batch mode reports errors and continues with the remaining sources. It never
opens an editor without `--edit`. Successful caches are retained after another
source fails. Exit codes are 0 for success, 1 for source failures, 2 for
usage/setup failures, and 3 for busy/deferred inputs without source failures.
Diagnostics and progress go to stderr; `--no-progress` does not suppress errors.

Repair mode asks before launching an editor. Enter edits and retries, `s` skips
one source, `S` disables further repair prompts for that invocation, and `q` or
`quit` aborts. EOF is not Enter. Editor selection prefers `--editor`, then
`VISUAL`, `EDITOR`, and discovery (`edit` before VS Code). Do not run interactive
repair with redirected input.

Recovery modes inspect known compiler claim/stage artifacts only. They do not
mean a fresh compilation of the whole selection. `--recover-tmp` validates and
recovers abandoned work; `--force-recover` rebuilds only affected interrupted
sources. Neither overrides a live native lock. Ordinary `--force` rebuilds every
selected source.

## Dialects and mappings

KIF and KRF default to ISO-8859-1 for the legacy corpus. Explicit `--encoding=utf8`
enables UTF-8 input; MeTTa is UTF-8. KRF reader features default to empty and can
be configured with `--features=feature1,feature2`.

The sole mapping source is [docs/sumo-cycl-mapping.md](docs/sumo-cycl-mapping.md).
SUMO KIF uses all matching rows, including explicitly labelled guesses. Other KIF
uses only `global(...)` rows. A leading `;; logos: sumo-mappings` opts a custom
KIF source in. Explicit `#$` symbols bypass remapping.
**KRF and MeTTa never receive SUMO mappings.**

Shape mismatches preserve the original normalized application, transform valid
nested children independently, and produce source-located warnings.
`--strict-mappings` makes such mismatches fatal. Notes and provenance in the
Markdown table are never executable.

MeTTa is data only. No interpreter is loaded. `([] a b)` becomes a Prolog list;
an application consisting entirely of key/value pairs becomes a `metta_map`
dict. Explicit lists take precedence. Invalid or duplicate map keys are errors.
Reserved structural wrappers are `metta_value/1`, `metta_exec/1`, and
`metta_expression([])` for standalone values, inert `!(...)`, and empty `()`.
These wrappers and the dict tag are not semantic constants.

KIF/KRF interpret `genFormat` argument 3 as list data. They also interpret
argument 2 of **any predicate starting with `do`** as list data, but only when
argument 1 is actually a string (including `doAnnounce` and `doEnterState`).
Both guards are required. Explicit S-expressions in these slots become proper
recursive lists, including `()` as `[]`.
Formatting descriptor markers such as `A-THE-WORD` remain literal, normally
encoded data (`x_A-THE-WORD`), not callable expressions.
`NIL` instead remains an unprefixed special symbol and a **default-argument-spread
marker**; it is not `[]` and is never expanded by counting format placeholders.
No action is executed while reading or loading these forms. Other arguments
retain ordinary expression semantics; unexpected forms are reported rather than
silently receiving list semantics.

## Native format and metadata

Ordinary vocabulary uses `x_` functors. Only variable or compound predicate
positions use `t/N`. Microtheories occur **only in metadata**, except when a
context really is an explicit semantic argument in the source.
Ordinary constants such as `TheEmptyList` become `x_TheEmptyList`. Constants
containing `:` anywhere, `?`-prefixed variable syntax, and special `NIL` keep their
special handling without an added prefix. Colon-containing names remain literal
symbols, never executable Prolog module qualifications.

```prolog
x_isa(x_Fido,x_Dog) :- x_cid(a65b1073318e63).
xc_microtheory(a65b1073318e63,x_FamilyMt).
xc_source_file(a65b1073318e63,'KBs/example.kif').
xc_source_line(a65b1073318e63,10).
xc_kb_names(a65b1073318e63,[]).

x_grandparent(X,Y) :- x_cid_io(a65b1073318e64,and(x_parent(X,Z),x_parent(Z,Y)),vs(X,Y),vs(Z)).
```

Each complete generated term occupies one physical line. SWI functional notation
for operators is equivalent to the infix examples above. Variables are real
shared Prolog variables, never serialized `'$VAR'` placeholders.
`xc_kb_names/2` retains original source spellings in semantic traversal order.
Empty variable groups are `vs`, and an empty executable conjunction is `and`.

Only exact **`<===`** creates an executable rule. `<==` remains distinct operator
data. Ordinary implication is an asserted formula, not a Prolog inference rule.
Direction, monotonicity, creator/date and other Cyc properties remain inspectable
metadata; they do not enable implicit forward chaining or a guessed defeasible
conflict-resolution policy. NIL creator/date fields are omitted, not all empty
metadata.

Compound microtheories are real, recursively normalized terms:

```prolog
xc_microtheory(a65b1073318e65,x_CommonsenseMicrostoryMtFn('x_ViolentImpact-Harm')).
```

They are neither atomized nor lists, and are not interpretation anomalies.

Diagnostic properties are independent binary metadata facts:
`xc_notices(Id,Messages)`, `xc_warnings(Id,Messages)`, and
`xc_errors(Id,Messages)`. Additional discovery markers `note(Message)`,
`warnings(Message)`, and `errors(Message)` appear in `xc_mapping_rows`.
Property access does not depend on scanning those markers. Informational notes
do not count as warnings. Unrecoverable source failures do not publish a
successful cache, and compiler/runtime faults are not fabricated source
assertion errors with invented line numbers.

Normalized caches contain `kb_cache_header/1` and `kb_cache_footer/1` with schema,
converter, source/mapping/options identities, assertion count, normalized digest,
and header digest. `normalizedFile` records the full absolute origin path of the
generated `.kif.pl`, `.krf.pl`, or `.metta.pl` companion in both normalized and
index headers; it remains unchanged in runtime snapshot copies. Older headers
without this optional field remain readable. Raw readers validate these records and guarded clause
structure as data; they do not consult arbitrary directives.

IDs are atoms formed by `a` plus the hexadecimal full Unix-microsecond value.
Native locks protect the durable allocator and occurrence assignments.
`--state-dir=PATH` selects the durable state directory; it must not be pruned
with disposable `.pl` or index caches. Keep occurrence state with its source
dataset. The uniqueness domain is the shared allocator state, not every
independently copied repository in the world. Independent copies that need
coordinated allocation should share one state directory. Conflicting assertion
IDs in a selected source set are rejected.

Both native loader headers are supported:

```prolog
:- include(kb_dynamic_assert).
:- use_module(kb_tail_loader), kb_tail_loader:load_remaining.
```

Generated headers use an absolute helper location so nested caches do not depend
on the caller's working directory. The include adapter narrowly uses SWI's
immediate include frame; it does not reopen the parent or select a stream by
matching filenames.

`kb_runtime:xc_src/2` returns fresh semantic clauses,
`xc_clause_handle/2` returns native references, and `xc_plvars/2` computes
deterministic ground Prolog-safe names. Native handles are never serialized.
`xc_indexed_constant/2` derives distinct semantic constants, including nested
heads, without indexing metadata or context-only MT references.

Legacy `% source_line(...).` and `% mapping_rows(...).` comments attach to the
following guarded assertion; `last_clause(...)` attaches to the preceding one.
The native helper converts these to the same binary metadata facts, with
file/stream/module isolation and explicit orphan/conflict errors. It preserves
the compiler's real source location while parsing provenance as data.
`kb_legacy:read_legacy/2` is also available for inert inspection of older Prolog
files, including directives that are returned as data and never executed.
Legacy files are **not** accepted as fresh, validated modern caches; recompile
their original sources to migrate.

## Queries and active generations

The browser query console accepts S-expressions, a microtheory (or all contexts),
a result limit, and a timeout. Results include bindings and successful proof
steps. Unscoped queries run the **whole query independently in each MT**.
There is no implicit MT inheritance or cross-MT joining.

Trusted Prolog callers can load a generated file with
`kb_runtime:native_load(File, Module)` and use
`kb_runtime:query(Goal, MT, Limit, Seconds, Solutions)`. A variable `MT` selects
independent whole-query contexts. Each result is
`solution(MT, QueryVariableValues, ProofSteps)`; the caller's query variables are
not retained in global state. Direct guarded calls without a query context
raise an error.

API contexts keep atomic keys such as `x_tinyKB`. Compound contexts use an opaque
`mt:` canonical key plus a structured `mtExpression`; consumers round-trip the
key and render the expression. Query inputs may also use a source S-expression
such as `(CommonsenseMicrostoryMtFn ViolentImpact-Harm)`.

The dispatcher calls only registered guarded KB predicates and supported
conjunction/disjunction forms. It does not execute operating-system commands,
arbitrary Prolog built-ins, or MeTTa. Unsupported goals are errors. Neither
loading nor browsing a rule executes its body.

Runtime source replacement uses validated immutable native `.pl` snapshots in
`.runtime`. Native clause `file/1` and `line_count/1` properties refer to those
actual snapshot files; original source locations remain `xc_source_*` metadata.
The active generation changes only after all snapshots load successfully.
Unchanged modules are reused. Failed or stale-generation requests preserve the
previous active KB. Unloading the final source leaves a valid empty KB.

Browser source selection is restricted to concrete original files below `KBs`.
Reparse/symlink escapes are rejected. CLI-selected external files can be unloaded
from their active manifest, but their paths do not grant browser filesystem
browsing privileges. External/unresolvable source references remain plain text.
Original files and their compiled/index companions are not deleted on unload.

## APIs and browser

Read endpoints: `/api/status`, `/api/search`, `/api/predicates`, `/api/term`,
`/api/microtheory`, `/api/microtheories`, `/api/assertion`, `/api/kb/catalog`, `/api/source`,
`/api/mappings`, and `/api/version`.
Mutation/query endpoints: `POST /api/kb/load`, `/api/kb/unload`, `/api/query`.
Load/unload requests carry the expected `generation`; conflicts return HTTP 409.
Pagination uses `offset` and `limit` (1-400), defaulting to 400. Queries default
to 400 results, accept 1-1000 results, and retain the existing 30-second timeout
ceiling. Errors have `{error:{code,message}}` form.

The Settings page changes results per page and the default query result limit.
Validated preferences persist in this browser's local storage across reloads.
Settings do not modify KBs or other users' preferences. Explicit URL limits
override defaults; the microtheory catalog remains uncapped. The shared
`web/settings.json` defines browser/server defaults and safety ceilings.

The browser provides linked S-expressions, MT groups, term-role views, provenance,
draft source-tree selection, loaded-file removal, bounded queries, and the
Markdown-backed mapping table. Approximate mappings remain labelled proposals,
not authoritative ontology identities.
The Microtheories page lists every indexed context with its assertion count,
including compound contexts, and retains the full list while a context is open.
`GET /api/microtheories` returns the entire generation's catalog without a result
cap; assertion pages within each context remain paginated.

Web assets are served without stale caching. Content-version polling refreshes
HTML/CSS/JavaScript/Markdown changes and pauses while hidden. Backend Prolog
changes require an explicit restart; a browser refresh does not reload Prolog.
A long-running `--edit` compiler also keeps its loaded implementation. Start a
fresh compiler invocation after changing Prolog application code.

## Scope and current limitations

All vocabulary is loaded as inert guarded data. Unsupported semantic shapes are
advisory warnings, not reasons to discard an assertion. Integrity checks still
reject corrupt caches, mismatched variable slots, and unsafe executable
envelopes. Unparseable source syntax is reported with the original source left
intact; it is not replaced by an invented assertion or an incomplete success
cache. Separate last-failure reports are retained in `.logos-state/failures`.

There is no implicit Lisp, MeTTa, forward-chaining, microtheory-inheritance, or
defeasible conflict-resolution interpreter. Declared back-chaining rules execute
only through the bounded guarded dispatcher.

`kb_runtime:import_cache(File,Module)` validates a complete generated cache and
imports its final assertion IDs with conflict checks, retaining existing imports
on failure. A conflicting ID cannot be hidden merely by claiming the same
original source path. Original KIF/Cyc ID properties remain inert provenance
(`xc_id`, etc.); they do not silently override durable occurrence allocation.
Durable allocator/occurrence state belongs to the dataset and is not a disposable
cache.

The native Windows editor adapter inherits the current console handles. Visible
`edit.exe` takeover has not been confirmed through the terminal-canvas tooling;
no automated result is claimed for that interactive behavior.

The full-batch investigation reproduced retained validator choicepoints and
whole-output serialization copies. Successful validation is now deterministic;
hashing is incremental and newline escaping does not allocate per-character
linked lists. Serialized payload bytes/digests are unchanged.

The unchanged 14,775,895-byte `FMA-merged-SUMO.kif` completed a cold-companion run
in 171.4027832 seconds with 240,965 assertions, three warnings, and exit 0 under
the default 1 GiB Prolog stack limit. Before the determinism fix it failed after
343.5097813 seconds with 247,510 retained choicepoints. The successful run's
observed OS peak working set was 2,349,305,856 bytes; process memory is not the
Prolog stack limit, and this is not a claim that OS peak memory decreased.
The full 967-source corpus has not yet been demonstrated error-free in one run.
The application does not raise the stack limit or silently skip failed inputs.

Earlier measured tinyKB timings on this development machine were 3.141 seconds
for fresh compilation, 1.559 seconds warm, and 2.419 seconds to prepare a warm
native generation. Status/search/predicate requests measured approximately
4-11 milliseconds. These are observed runs, not performance guarantees.

Tests use SWI PL-Unit and Node's built-in test runner; no test packages are
required. For the current targeted loader/cache regression:

```powershell
swipl -q -s .\prolog\ow_dr\tests\test_advisory.pl -g run_tests -t halt
node --test .\prolog\ow_dr\tests\render.test.mjs .\prolog\ow_dr\tests\browser.test.mjs
```
