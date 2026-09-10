# powder

**Paraconsistent Open World Defeasible Epistemic Reasoner**

A local SWI-Prolog knowledge-base compiler, native assertion runtime, and
dependency-free browser. The original knowledge corpus lives in the repository's
`KBs` directory. This application never rewrites those original sources.

## Running from the repository root

```powershell
Set-Location C:\snet\PeTTa\repos\openworld_dr

# Compile the collection, or just the initial KB.
swipl .\prolog\ow_dr\compile_kb.pl -- KBs
swipl .\prolog\ow_dr\compile_kb.pl -- KBs\tinyKB.kif

# Start the browser with saved sources, or all KB sources when unset.
swipl .\prolog\ow_dr\app.pl

# Select different sources or a different local port.
swipl .\prolog\ow_dr\app.pl -- --port=8080 KBs\Merge.kif
swipl .\prolog\ow_dr\app.pl -- --kb-source=KBs\tinyKB.kif --kb-source=KBs\example.kif
```

The default address is **http://localhost:3050/swish/powder/**, bound to the loopback interface.
The HTTP server becomes available first, then the selected startup sources are
queued in the loader pool. Enqueueing is not successful loading: Overview and
Settings show the startup task's actual state, progress and failures. Publication
is transactional; failed loads do not install a partial generation.

Settings > **Next server startup** stores an ordered list of `.kif`, `.krf`, and
`.metta` files on the server. Paths are saved as canonical absolute paths and
duplicates are removed without reordering the remaining entries. Enable the
saved list and leave it empty to start with no KB. With no enabled saved list,
all original `.kif`, `.krf`, and `.metta` files under the repository KB root are
selected, without a page-size limit. Companions, QLFs and JSON are not independent
sources. Explicit CLI sources override
the saved list. Saving settings does not load anything immediately, restart the
server, or affect browser source-selection drafts.

Machine settings live in the ignored
`prolog\ow_dr\.logos-state\server-settings.json`; `POWDER_SERVER_SETTINGS` may
select a different local settings file. Writes are locked, atomic and guarded
by a revision check. Missing sources are flagged, and startup failures leave the
server available to correct the saved list.

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

## Offline dynamic QLF conversion

The standalone command intentionally uses the requested spelling:

```powershell
swipl .\prolog\ow_dr\to_dynanic_qlf.pl -- KBs
swipl .\prolog\ow_dr\to_dynanic_qlf.pl -- KBs\tinyKB.kif.pl
```

It reads complete compiled `.kif.pl`, `.krf.pl`, and `.metta.pl` companions as
data, builds one QLF per file, and exits. It does not start powder/SWISH, HTTP,
loader/inference pools, or an active KB. Source/index files and `XXXX` counting
artifacts are not conversion inputs. All records, duplicates, real IDs,
microtheories, variable sharing and metadata are retained: no offline interning,
deduplication or renumbering occurs.

For `example.krf.pl`, outputs are `example.krf.pl.qlf`, its
`.qlf.meta.pl` identity manifest, and `.qlf-stage.pl` controlled staging source.
Every staging KB predicate and metadata predicate is declared **dynamic and
multifile** before clauses are installed; live shared form predicates also
retain both flags. No `compile_predicates/1` is used. Runtime form sharing
remains a separate later operation.

`kb_qlf:convert_companion(File,Options,Result)` is the callable offline API.
Options include `force(true)`; the CLI accepts `--force`. Valid converter-owned
caches are reused. Input hash, normalized identity, converter implementation,
SWI version/architecture/address width, staging hash and QLF binary hash are
checked. Unknown preexisting outputs are refused rather than overwritten.
Per-file locks and staged publication protect final QLF files; failures retain
honest errors and the batch continues. Importing the utility does not run its
CLI or load a default corpus. Generated binaries/staging files are derived
local artifacts and are not automatically committed.

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

Offline occurrence IDs are atoms formed by `a` plus the hexadecimal full Unix-microsecond value.
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
`xc_clause_handle/2` returns a native source-record reference with the original
generated-file/line properties, `xc_form_handle/2` returns the shared executable
clause reference, and `xc_plvars/2` computes
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

Runtime loading interns variant-equivalent forms independently of microtheory.
There is **one dynamically asserted executable clause per form**, and **one
primary assertion number per (form, microtheory)**. Repeated source occurrences
within that MT join their contributions into the existing number. Another MT
retains a different number and separate properties, linked by
`kb_runtime:xc_same_form/2` and the API's `sameForm` links. Ordinary unification
or subsumption is never used for form identity.

Each source contribution retains its own occurrence ID, source/line, original
variable names, MT and properties. The API exposes these together in
`contributions`; `aliases` and `xc_source_id/2` retain original IDs. Joined
properties never cross MT records. Query proof steps include only supporting
contributions from that query's selected generation and MT.

Existence checks, dynamic assertion, MT identity selection and contribution
updates are atomic across loader workers. Unloading a source removes only its
contributions. Its MT number survives while any remaining source supports it;
the shared executable clause survives while any MT supports it. Generation
leases also retain the old contributions for already-running queries.
Status distinguishes primary `assertions`, shared `forms`, and source
`occurrences`. Original source files and offline companions are not rewritten
to impose runtime deduplication. Restart once before loading existing snapshots
under this new runtime representation.

The browser's **Run query** action accepts S-expressions, a microtheory (or all contexts),
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

The KB dispatcher calls only registered guarded KB predicates and supported
conjunction/disjunction forms. It does not execute operating-system commands,
arbitrary Prolog built-ins, or MeTTa. Unsupported goals are errors. Neither
loading nor browsing a rule executes its body.

**Run Prolog** is a separate, explicitly trusted-local execution mode, not a
sandbox. It accepts a single Prolog goal, including built-ins and side effects.
Unqualified predicates and user assertions live in the persistent
`powder_console` module. Use explicit module qualification to access `user` or
application modules. Current-generation KB predicates are bridged into the
console and require a selected microtheory; ordinary built-ins run once without
one. For example, `member(X,[a,b]).` needs no KB context.

Execution honors the selected result/time limits without rerunning goals to
count results. Output from current output, `user_output`, and `user_error` is
captured together; input is EOF. Results distinguish success, false, reaching
the result limit, exceptions, and timeout, preserving output and earlier
solutions on exceptions. Unqualified assertions persist until explicitly
retracted. Side effects are **not rolled back** by failure, cancellation,
exceptions, or timeout; full Prolog can change files and stop the server.

Full execution requires a loopback peer, the server's exact localhost host/port,
same-origin browser metadata, and a server-issued local CSRF capability header.
It is only available on explicit POST; no GET or dropdown action executes code.
Do not expose this trusted-local server through an unauthenticated remote proxy.

The stored-question dropdown reads actual loaded `test_Qs/3` assertions. The
schema is declared in `KBs\SigmaTestQuestions.krf`: identifier string, English
question string, then query formula. Every available choice is retrieved through
pagination, searchable, and labelled with its owning MT/source location.
Selecting one fills editable Prolog text and context, but never runs it.
Variables keep their sharing and show their original-to-Prolog name mapping.
Conjunction/disjunction become Prolog controls; other formula heads remain KB
predicates. The owning question MT is not necessarily the data context needed
to answer it, so the context stays editable.

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

The application is mounted at `/swish/powder/`; every REST endpoint is under
`/swish/powder/api/`. The shared `web/paths.json` supplies the mount to both
Prolog route registration and the browser client.

Read endpoints: `status`, `search`, `predicates`, `term`, `microtheory`,
`microtheories`, `assertion`, `kb/catalog`, `source`, `mappings`, and `version`.
Mutation/query endpoints: `POST kb/load`, `kb/unload`, and `query`.
Application maintenance: `POST app/reload` with an empty JSON object.
Stored questions: `GET test-questions` (`q`, `offset`, `limit`).
Full local Prolog: `GET prolog/access` obtains the local capability;
`POST prolog/query` requires it in `X-Powder-Local-Token`.
All names in this paragraph are relative to `/swish/powder/api/`.

Loads, unloads, KB queries and full-Prolog queries return **HTTP 202** with
`{accepted:true,jobId,pool,state:"queued"}`. Read `GET tasks/detail?id=...` until
the task reaches `succeeded`, `failed` or `cancelled`; only then consume its
`result` or `error`. The browser does this automatically and does not reset a
source draft on acceptance or failure. `GET tasks` returns the pool overview
and task lists. `POST tasks/cancel` accepts `{id:...}` and requires the local
capability header; full-Prolog side effects completed before cancellation are
not undone. `GET server/settings` reads next-start configuration;
`POST server/settings/save` saves `{revision,settings}` with the same trusted-local
capability protection. Neither settings endpoint executes a startup load.

Examples: `/swish/powder/#/query`, `/swish/powder/#/settings`, and
`/swish/powder/api/status`. `/swish/powder` redirects to its trailing-slash form.
Powder does not claim `/`, the parent `/swish/`, or sibling applications, and
does not alias the old `/api/` or `/powder/` locations. Unknown API paths return
JSON 404 responses, never the SPA page. This mount does not install SWISH.
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
`GET /swish/powder/api/microtheories` returns the entire generation's catalog without a result
cap; assertion pages within each context remain paginated.

Web assets are served without stale caching. Content-version polling refreshes
HTML/CSS/JavaScript/Markdown changes and pauses while hidden. A browser refresh
does not reload Prolog.

Settings > **Reload changed files** reloads changed, already loaded application
modules directly under `prolog/ow_dr`, using SWI's module loader and recorded
dependencies. It excludes KB sources, generated companions, runtime snapshots,
tests, external modules and include-only KB headers; it never invokes broad
`make/0`. Application-code reload is excluded while loader or inference operations are
active, rather than serializing all those operations behind one global lock.
Active generations,
native assertion handles, browser drafts and saved settings are retained.
The button sends no filenames or executable goals. Reload failures are reported
with affected files; already applied code changes cannot be automatically rolled
back. Fix the files and retry, or restart if necessary.

A server started before this endpoint existed needs one normal restart to load
the feature; subsequent button presses do not require restarting the server.
A long-running `--edit` compiler also keeps its loaded implementation. Start a
fresh compiler invocation after changing Prolog application code.

## Task pools

Loader, inference and HTTP pools have separate server-side profiles, each
defaulting to **startup 5, maximum 10, spare 2**. Settings validates
`1 <= startup <= maximum <= 128` and `0 <= spare <= maximum`. Changes apply
at the next normal server start, not on save or application-code reload.

The loader and inference pools own separate worker threads and bounded queues
(100 waiting requests per pool). Each accepted request receives an ID before a
worker starts. Workers grow toward `busy + queued + spare`, never above the
configured maximum. Spare is a preferred minimum idle reserve, not a command to
exceed capacity. Pools do not shrink during the run; workers retire gracefully
at shutdown. Application-code reload does not spawn duplicate pools.

All managed source replacement/unload, startup-source loads, and public native
cache import/loading use the loader service. Independent source preparations
can overlap, but loader publication follows accepted FIFO intent. Accepted
source selections are complete manifests; later queued selections publish after
earlier ones. Source and allocator locks still apply; a busy or failed source
produces a visible failed task. Inference uses immutable generation leases, so
an existing query can finish against its old native clauses while a new
generation is published. Retired snapshots are removed after their readers
finish. Arbitrary Prolog I/O remains explicitly user-operated Prolog, not an
implicit KB loader.

KB and full-Prolog inference run in the dedicated inference pool, not HTTP
request threads. The result and time limits still apply. Scheduling, polling,
listing and counting tasks never rerun a query. Queued cancellation prevents
execution; running cancellation signals only the matching task. A loader
publication already in progress is not interrupted.

Settings shows a separate **Requested tasks** list for loader and inference,
including all active/queued tasks and the latest 100 completed tasks. Completed
history is bounded; active jobs are never pruned. Task history is transient and
pending work is **not** resumed after process restart. Public pool views omit
arbitrary query text, output, tokens and request headers; private query results
remain available through their task ID.

HTTP profiles apply server-wide to the app's actual listener. Its scoped
scheduler uses SWI's HTTP worker facilities and enforces the same maximum/reserve
policy without changing unrelated listeners. HTTP idle counts come from workers
waiting on the accept queue; busy counts are the remaining workers, not guesses
based on generic thread `running` state. Queue depth is read from that queue.
Five or more simultaneous heavy loads can still consume substantial memory;
set smaller startup/maximum values when appropriate.

A server predating this service needs one normal restart to create the pools
and apply startup settings. Application-code reload may install the API/UI code
but deliberately does not bootstrap or resize an already running server.

## On-disk inventory reports

`kb_inventory:inventory(SourceDirectory, ReportDirectory)` scans the original
KIF/KRF/MeTTa files as data, without consulting, compiling, importing, or
executing KB expressions. It writes derived `<source>.inventory.json` sidecars
and a `microtheory` subdirectory containing one safe, readable JSON filename per
MT plus `_catalog.json`. Compound contexts use names such as
`DataOfFn_Something.json`; canonical identities are retained inside the data,
and case-insensitive filename collisions receive stable hash suffixes.
Existing unrelated JSON files are not overwritten.

The report directory contains `microtheories.csv`,
`microtheory-predicates-files.csv`, `kb-file-counts.csv`, a complete NDJSON
per-file stream, and `summary.json`. Counts are disk occurrences, not runtime
form/MT deduplication. Rules count executable `<===` heads; GAFs are ground
atomic assertions. Non-ground and logical formula assertions are counted
separately. Declaration targets of `argIsa`, `argGenl`, `resultIsa`,
`resultGenl`, `argFormat`, known indexed variants, range/domain declarations,
and explicit arity declarations are included with distinct reference counts.
An argument-position number is never treated as full predicate arity.

Companion `physicalLineCount` is the exact number of LF bytes, equivalent to
`wc -l`, including metadata and directives and excluding any unterminated final
line. Parsed semantic clauses, metadata facts, and directives have separate
counts. Missing/unreadable/stale/changing evidence is labelled explicitly.
Sources, normalized companions, indexes, allocator state and running
generations are not changed. Inventory JSON is generated local data and should
not be automatically staged or pushed.

`kb_inventory_links:extend_inventory(SourceDirectory, ReportDirectory)` adds a
compiled-companion-only projection to the same sidecars/catalogs without
repeating the original-source or LF-count pass. It discovers relations whose
first **and** second arguments have Microtheory-valued schema declarations
(`argIsa`, `arg1Isa`, `arg2Isa`, plus documented explicit subtype/predicate
specialization evidence). `_relations.json` contains the actual evidence and
unresolved one-sided signatures. This is not a name-suffix heuristic.

Each MT JSON contains relation-specific `mtRelations` with `asArg1` and `asArg2`
neighbors and source/line/asserting-context supports. `genlMt` additionally has
the same two arrays as a convenient hierarchy field. Endpoints are associated
with the MTs named in the relation, not its asserting context. Referenced-only
MTs receive zero-clause entries. Multiple parents, cycles, self-links and support
multiplicity remain explicit data; no inferred edge or runtime MT inheritance
is introduced. Compiled metadata guards are removed for semantic identity:
`Head :- x_cid(...)` remains a fact, while `x_cid_io` recovers the rule body.

The projection retains an `assertion-identities.ndjson` stream for exact
disk-backed global deduplication. Its variant hash is the runtime's
`variant_sha1/2`; an exact variable-preserving canonical form is retained as a
collision check. Source IDs/properties/locations are excluded from form identity,
and canonical MTs distinguish per-MT assertion identities. This is separate
from a requested quick **textual** `^x_` line count whose temporary copies only
replace guard IDs with `XXXX`; that quick count does not alpha-normalize forms.

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
