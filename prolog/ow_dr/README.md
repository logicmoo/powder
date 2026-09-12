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
swipl .\prolog\ow_dr\compile_kb.pl -- KBs\tinyKB.krf

# Start with the saved selection, defaulting to KBs\tinyKB.krf.
swipl .\prolog\ow_dr\app.pl

# Select different sources or a different local port.
swipl .\prolog\ow_dr\app.pl -- --port=8080 KBs\sumo\Merge.kif
swipl .\prolog\ow_dr\app.pl -- --kb-source=KBs\sumo\tiny-merge.kif --kb-source=KBs\examples\example.kif
```

The canonical address is **http://localhost:3050/swish/openworld_dr/**, bound to
the loopback interface. APIs are below `/swish/openworld_dr/api/`. The root and
old misspelled entry redirect to the canonical mount.
All selected inputs must finish compilation and loading before startup is
announced. An invalid source or a busy compiler prevents startup.

Explicit CLI sources override saved startup selection. `KBs\tinyKB.krf` is the
combined Cyc export; its original per-assertion MTs are preserved. The separate
SUMO source is `KBs\sumo\tiny-merge.kif`, with explicit `(in-microtheory MergeMt)`.
Its former `x_tinyKB` cache/ID context is historical, not silently reassigned.

## Browser layout and assertion display

Classic Cyc is the default layout, retaining this application's colors and fonts.
The top menu remains global; the left pane indexes the current term by assertion
section, argument position, predicate and microtheory. Counts and filters are
computed over all of that term's loaded assertions before pagination.
`Viewpoint Filters` filters stored assertions; it does not perform inference.

The neutral **+** beside an eligible predicate/MT runs a real bounded query in the
query console (20 results, three seconds). Only observed direct argument slots and
known arities are offered; nested-only constructor references are not substituted
for whole arguments. The action returns existing as well as derivable answers and
successful proofs. No estimate of additional-answer likelihood is implied.
Tree disclosure arrows and assertion-property balls are separate actions.

`#/ui-settings` controls dense/comfortable spacing and visibility of IDs, kinds,
MTs, source provenance, strength/direction, diagnostics, properties, proof details
and observed utility. Defaults show just expressions and each assertion's
properties ball. Full assertion detail retains all metadata; large raw properties
are collapsed until requested. Blocking errors are never hidden.
The checkbox **Classic Cyc mode** is synchronized with UI Settings and reversible
without rebuilding the current page. Browser-only preferences use
`powder.presentation.v2`; deliberate modern opt-outs persist, while legacy default
false values migrate to Classic. Reset restores Classic/dense defaults.

For a loaded compound MT, readable `#/term?term=(ActionModelMtFn%20Freeciv-TheGame)`
and canonical native term input resolve through the existing inert context codec
to its specialized microtheory page. Headings use linked S-expressions, not native
Prolog or opaque keys. A non-atomic term is not assumed to be a microtheory from its
constructor's spelling.

Property-ball colors describe available metadata: MONOTONIC white, DEFAULT yellow,
canonical negative/FALSE red (which takes precedence), otherwise unknown gray.
Executable back-chaining rules have a separate small purple marker.
They are not truth-confidence or rule-utility scores; asserted implications are
not colored as executable rules merely because of their formula or direction.

Enabled native NARS, OpenCog/PLN and Cyc annotations appear inline. Select them
with UI Settings, including **Show TVA OpenCog/PLN**. Values resolve by record
presence at the selected atom, explicit current annotation MT, then `default`;
no current MT means the middle step is skipped. Full native payloads are lazy
inside the existing assertion Properties. Native values and configured assertion
priors are distinct. The global defaults and seven editable Cyc settings are
documented in [native TVA](docs/native-tva.md); none changes logical inference.

Term Search has persistent, multi-membership category checkboxes. External
Symbols starts unchecked. Group counts overlap; the distinct union count is
reported separately. Source Packs and recorded inventories do not imply that
all unloaded corpus files are covered by the active semantic-term index.

Task pools expose desired/running profiles and bounded task contents. Save a
profile, then explicitly Apply live; HTTP settings are restart-only. **Queue
Selected for Loading** returns after acceptance so the Sources page is usable
while work proceeds. Directory selection separates Subdirectories and Local
files; selected totals are distinct from all-files totals. **Not at startup**
adds only that file to the saved next-startup selection without loading it now.

Source links open the local [CodeMirror workspace](docs/source-editor.md).
Save changes only the original file, with a revision precondition; reload is
separate. Tabs and split panes retain buffers across routes and layout switches.
SUMO mapping browsing is now entered from Settings; existing `#/mappings` and
mapping-row links remain valid.

## Console controls

The main thread quietly scans bounded, blocking key reads. **?** and **Ctrl+C**
display the same help; **C** continue, **X** exit, **M** make/reload changed
application code, **R** restart owned HTTP listeners, **B** bind another loopback
port, and **T** list threads work directly without entering a menu or pressing
Enter. Every recognized choice is printed and flushed before its action.
Only port entry needs digits plus Enter (Escape cancels). Idle timeouts are
silent. Make does not rerun main or recompile the corpus.

Listener restart preserves loaded KBs, ports and worker counts. It drains active
HTTP work rather than restarting the process. Extra ports are process-local and
all owned listeners close on exit. Closed/redirected stdin never implies consent
to exit; headless operation waits for a host `stop` message.

Windows console handles require the included native adapter; build it once with
`prolog\ow_dr\build_lifecycle_windows.ps1`. The DLL is a generated, ignored build
product. Terminal/signal settings are restored on cleanup. A detached headless
launch has no keyboard menu: start in a visible terminal to use these controls.

Requirements: SWI-Prolog with its standard libraries. Windows source-catalog
authorization uses the included PowerShell helper and native .NET file attributes:
SWI's `read_link/3` does not detect NTFS junctions on the tested Windows build.
There is no package installation or JavaScript build step. Node is used only by
the JavaScript tests.

## Offline compiler

Supported input extensions are `.kif`, `.krf`, `.meld`, and `.metta`. Selections may be files,
directories, or overlapping combinations. Originals under repository `KBs` have
their generated loading caches mirrored under repository `tmp\KBs`:

```text
KBs\examples\example.kif
tmp\KBs\examples\example.kif.data
tmp\KBs\examples\example.kif.index.data
```

These `.data` files still contain validated Prolog terms, not a different source
language. The suffix distinguishes generated loading data from application code.
Locks, claims (`.data.tmp`), and unique stages are alongside those generated caches,
not the originals. Cache directories are created before taking the native lock.
Files explicitly selected outside repository `KBs`, including test fixtures,
retain adjacent `.data` and `.index.data` companions.
Source statistics are **not loading caches**: `*.inventory.json` remains beside
its original source, and microtheory statistics remain in `KBs\microtheory`.

The shared `kb_paths` helpers return absolute, Windows-case-canonical paths,
independent of the working directory (relative helper inputs are repository-root
relative). `cache_source_base(Source,Base)` mirrors the original relative path;
`cache_paths(Source,Normal,Index)` appends `.data` and `.index.data`.
`cache_root/1` returns `tmp\KBs`, and `runtime_root/1` returns `tmp\runtime`.
`cache_original_source(Base,Source)` reverses a mirrored base, including missing
originals; callers remove artifact suffixes before using it. External bases are
unchanged apart from absolute-path canonicalization.

An explicitly supplied filename with no extension or an unrecognized extension
is read as KIF, without renaming it. `.meld` is an alias for KRF, with the same
encoding, reader conditionals and no-SUMO-mapping policy as `.krf`.
`.krf`, `.meld`, and `.metta` always retain their own
readers. This applies to both the compiler and `app.pl`; directory discovery and
the browser source catalog still select only `.kif`, `.krf`, `.meld`, and `.metta`.
For recovery of an extensionless/custom-extension source, supply that file
explicitly rather than its directory.

```powershell
swipl .\prolog\ow_dr\compile_kb.pl -- KBs\my-data.metta
swipl .\prolog\ow_dr\app.pl -- KBs\my-data.metta
swipl .\prolog\ow_dr\app.pl -- C:\data\facts.txt
```

MeTTa companions are `my-data.metta.data` and `my-data.metta.index.data`.
These cache inert browsing data; they are not executable translations of
MeTTa functions. Equations, type declarations and `!(...)` are not evaluated.
MELD companions retain their source extension: `my-data.meld.data` and
`my-data.meld.index.data`.

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
selected source. Selecting a `KBs` directory for recovery scans its mirrored
`tmp\KBs` subtree, not every original source; artifact paths are translated back
to originals before validation or recompilation. Missing originals are reported
as failures. Legacy `.pl` artifacts and adjacent artifacts under `KBs` must be migrated first;
external sources retain adjacent recovery. Unrelated temporary files are ignored.

The offline QLF converter accepts explicit `.kif.data`, `.krf.data`, `.meld.data`,
and `.metta.data` companions, as well as legacy `.pl` inputs. A source-directory selection discovers originals and
selects their mapped companions without parsing source content or mappings.
A `tmp\KBs` directory selection discovers cached companions directly.
QLF outputs replace the final `.data` (or legacy `.pl`) with `.qlf` beside the
selected cache. Metadata is `.qlf.meta.data`, and the retained staging source is
`.qlf-stage.data`; SWI `qcompile/2` accepts this exact `.data` filename and creates
`.qlf-stage.qlf` before installation as `.qlf`. Direct external companions keep
their existing location. The converter still verifies ownership and artifact
identity; renaming an old bundle does not make obsolete embedded paths current.

For a mirrored base `tmp\KBs\examples\example.kif`, compiler artifacts are:

```text
example.kif.data
example.kif.index.data
example.kif.data.lock
example.kif.data.tmp
example.kif.data.stage.UUID
example.kif.index.data.stage.UUID
```

The stable lock is retained; claims and owned stages are removed after successful
work. QLF conversion retains `.qlf.lock`, `.qlf`, `.qlf.meta.data`, and
`.qlf-stage.data`. Its unique write stages append `.stage.UUID` to the data
metadata/staging names. Source inventories are not renamed.

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
MeTTa equations such as `(= (f $x) $x)` are stored as `x_metta=`,
displayed as `(metta= (f $x) $x)`. They remain inert equation data.
KIF/KRF `=` instead uses `x_equals` (Cyc `equals`); it is not Prolog
unification. MeTTa type declarations such as `(: s TypeName)` and
`(: s (-> Atom Atom))` remain ordinary data too; types are not enforced.

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
generated `.kif.data`, `.krf.data`, `.meld.data`, or `.metta.data` companion in both normalized and
index headers; it remains unchanged in runtime snapshot copies. Older headers
without this optional field remain readable. Raw readers validate these records and guarded clause
structure as data; they do not consult arbitrary directives.
When the reader supplies file-level/orphan comments, the cache header preserves
the ground list as optional `sourceComments`. Assertion comments remain
`xc_comments(Id,[comment(Line,Column,Text),...])` metadata. Comment text, including
embedded newlines, uses the same one-line term serialization and header/payload
integrity checks; older reader results without the optional field remain valid.
`xc_comment_association(Id,proximity_guess(span(StartLine,StartColumn,EndLine,EndColumn)))`
marks assertion attachment as a first-pass proximity heuristic, not semantic
evidence; the source span's end position is exclusive.
Compiler freshness checks include the resolved cache location and implementation
identity. Moved caches with obsolete source/origin paths or implementation hashes
are stale, not silently trusted. Compiler results always report the resolved
physical output path, never an obsolete header path.

IDs are atoms formed by `a` plus the hexadecimal full Unix-microsecond value.
Native locks protect the durable allocator and occurrence assignments.
`--state-dir=PATH` selects the durable state directory; it must not be pruned
with disposable `.data` or index caches. Keep occurrence state with its source
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

## Shared file-worker pool

The trusted host API in `kb_jobs` uses **one shared file pool** for indexing and
loading. Bounded queries and stored questions use a separate inference pool:

```prolog
kb_jobs:start_file_pool(_{start:5,max:10,spare:2}).
kb_jobs:queue_load(Paths,ExpectedGeneration,Accepted).
kb_jobs:queue_index(Paths,Options,Accepted).
kb_jobs:queue_cached_load(ValidatedPackSnapshots,ExpectedGeneration,Accepted).
kb_jobs:queue_unload(Path,ExpectedGeneration,Accepted).
kb_jobs:job_status(Accepted.jobId,Status).
kb_jobs:await_result(Accepted.jobId,Result).
kb_jobs:cancel_job(Accepted.jobId).
kb_jobs:task_overview(Overview).
kb_jobs:stop_file_pool(drain). % or cancel
```

`start_file_pool/1` also accepts saved settings and selects `Settings.pools.loader`.
Five persistent workers start immediately for the selected profile; demand grows
the same pool to at most ten, retaining two spare workers where capacity allows.
Workers remain alive until explicit shutdown or an explicitly lowered maximum.
Both managed pool profiles accept worker limits up to 128. `queueCapacity` optionally sets the
accepted nonterminal-job bound (default 100, maximum 1000); excess submissions
raise `task_queue_full(file)` rather than blocking the request thread. Completed
history retains 100 jobs and is not a durable work queue.

Each request fans out its concrete files to the shared workers. Overlapping
physical cache paths are scheduled exclusively inside the process, while native
cross-process claims still report external `busy` results. Compilation, indexing
and native snapshot preparation can overlap; successful KB publication is FIFO
among mutating jobs and checks the exact accepted generation again. `any` captures
the generation at acceptance: later queued mutations are **not silently rebased**
after an earlier mutation changes it. Index jobs never publish KB assertions.
Native snapshot reuse additionally requires the current metadata-retention policy
and the same verified source origin. Equal cache bytes alone cannot retain an
older in-memory representation that still contains discarded metadata.
Index jobs use the existing compiler/index pipeline, so a missing or stale
normalized cache is compiled first; no separate semantic analyzer is introduced.
Discovery resolves source spelling once and the compiler implementation is
fingerprinted once per request, not once per file. Request-wide application
tickets prevent Code Make from changing the implementation between file units.
Source-pack jobs load only their validated cache snapshots and preserve unrelated
live sources, even if those originals have changed or disappeared.

`load_sources/3`, `add_cached_sources/3` and `unload_source/3` remain synchronous:
when the pool is active they enqueue and await, and otherwise retain their direct
behavior. Worker adapters bypass these wrappers to avoid recursive enqueueing.
`queue_load/4` accepts trusted compiler options, and `await_result/3` accepts a
timeout in seconds (`infinite` is the default). Asynchronous status/error objects
are inspectable; synchronous waits rethrow the underlying error.

Cancellation cleans claims, locks and unpublished native snapshots; completed
valid data/index caches remain reusable. Publication itself is a short
non-cancellable operation. Shutdown rejects new submissions, drains or cancels
owned jobs, then joins its manager/workers. Cleanup failures are reported and
retained for another shutdown cleanup attempt; live snapshots are never deleted
as failed staging work.

HTTP stop/restart must not stop this pool. Application exit owns explicit pool
shutdown. Code Make must use `kb_activity:with_exclusive_reload/1` together with
the existing reload locks; queued and running jobs hold the matching shared gate.
Source authorization and HTTP/UI lifecycle wiring remain host responsibilities.
`start_file_pool/1` alone does not start query workers.

### Separate bounded query and test-question pool

```prolog
kb_jobs:start_inference_pool(Settings).
kb_jobs:queue_query(Text,Scope,Limit,Seconds,Accepted).
kb_jobs:queue_question(AssertionId,Limit,Seconds,Accepted).
kb_jobs:stop_inference_pool(cancel). % or drain
```

This pool uses `Settings.pools.inference`, or a supplied profile dict. The selected
default is start 5, maximum 10, spare 2; configured inference limits may differ
(up to the existing settings maximum of 128). Its queue, worker budget and
backpressure are independent of file work. `start_pools/1` starts both configured
pools; `stop_pools/0` cancels and joins both. Their shared lightweight scheduler
remains alive until the last pool stops. HTTP stop/restart stops neither.

Queries are bounded by the existing result limit, a maximum 30-second execution
timeout and 65,536-character input limit. Scope is a ground MT, `context(MT)`, or
`none` for independent per-MT enumeration. Results identify the generation
actually queried and carry the existing proof and rule-utility report. A short
snapshot acquisition pins immutable native source modules; queries do not hold
the store mutex while evaluating. Replaced/unloaded native files are retired only
after the last query releases them, including exception, timeout and cancellation
paths. Query results remain accessible by job ID; public task overviews show only
counts and generation, not bindings.

“Tests” here means existing `test_Qs` stored question assertions. Execution resolves
the assertion ID in a pinned generation and dispatches its formula data in its
own MT. Displayed Prolog text is never evaluated. No PL-Unit/software suites,
arbitrary goals, or full-Prolog console evaluation are added to this pool.

`kb_store:query_text/5` and `kb_questions:run_question/4` synchronously enqueue and
await when query workers are active. A legacy caller already owning the store
mutex executes directly to avoid self-deadlock. New HTTP handlers should instead
return `queue_query/5` or `queue_question/4` acceptance immediately, without an
outer store mutex. `submit_inference/3` accepts only bounded `kb` query requests
and stored `question` requests; unsupported kinds are rejected.

### Revisioned pool settings and bounded task management

The dependency-free `kb_pool_settings` host API is ready for Settings integration:

```prolog
kb_pool_settings:pool_settings(Overview).
kb_pool_settings:save_pool_settings(
    _{file:_{start:5,max:10,spare:2,queueCapacity:100}}, Revision, Saved).
kb_pool_settings:apply_pool_settings(Saved.revision, Applied).
kb_pool_settings:task_list(_{pool:file,state:active,offset:0,limit:25}, Page).
kb_pool_settings:task_details(JobId, _{section:files,offset:0,limit:25}, Detail).
kb_pool_settings:cancel_task(JobId, UpdatedSummary).
```

Updates are per-pool patches (`file`/`loader`, `inference`, `http`) using the shared
server-settings revision. Other profiles and startup selections are preserved;
conflicting revisions, unknown fields and invalid ranges are rejected. Saving
changes only durable desired profiles. An explicit Apply uses the current saved
revision and changes existing file/inference pools in place, never creating a
second manager or starting a stopped pool. HTTP remains host-controlled,
restart-only; its effective observations come from `attach_http/2`, and an
unattached listener is reported as untracked rather than presumed stopped.

Responses distinguish desired/effective profiles, pending application, stopped
and settling workers, next-start settings and HTTP restart requirements. Raising
limits grows the existing pool. Lowering a maximum stops new excess dispatch and
retires idle workers normally; already dispatched work completes without being
killed. Lowering `queueCapacity` never drops accepted jobs: new submissions are
rejected until outstanding work falls below the new bound. Queue capacity is the
logical accepted-job limit, independent of the bounded internal dispatch buffer.
Settings writes and live application respect checkpoint admission leases.

Task lists default to active work, with `all`, `queued`, `running` and `completed`
filters. Pages default to 25 and are capped at 100 records. Detail sections are
`files`, `progress` and `results`; they return bounded management metadata, not
embedded full query bindings/proofs/utility reports. Query previews are capped at
512 characters and file-error previews at 1024. Existing authorized query-result
retrieval remains separate. Cancellation reports its request state and preserves
the non-cancellable atomic publication boundary. Runtime worker/job references
remain volatile; only desired settings survive restoration.

### Saved-state boundaries

`kb_jobs:save_quiescence/1` is a read-only advisory report: outstanding jobs,
workers, query leases, cleanup work and application activity make it `busy`.
For a race-free live-manifest copy, use `kb_jobs:with_saved_state_snapshot(Goal)`
outside any `with_application/1` caller. It refuses active work, prevents new
admissions, and nonblockingly acquires the code-reload/store mutexes. `Goal` runs
once; every exit releases the guard before subsequent serialization or qsave.
Busy conditions raise `error(saved_state_busy(Reason),_)`. Do not stop pools or
discard jobs to save.

An isolated snapshot builder may call `kb_jobs:prepare_saved_state/0` immediately
before `qsave_program/2`. It refuses live pools, HTTP attachments, job history,
query leases and application activity; it removes only transient standard-stream
references. The restored entry point must call `kb_jobs:restore_saved_state/0`
before starting fresh pools from saved settings. This rebinds process-local I/O
and rejects calls in the original process or unprepared/nonquiescent images.
Neither hook restores jobs, resets the live KG, or serializes worker/queue handles.
Pool, queue, worker, job, I/O and application-activity registries are explicitly
volatile. Only the builder-process/prepared-image guards persist. Repeating
`start_pools/1` with the same profiles does not create duplicate workers.

Checkpoint promotion uses `kb_jobs:begin_checkpoint_drain(Token)` and
`end_checkpoint_drain(Token)`. Begin returns `error(checkpoint_busy(Reason),_)`
immediately if work, query leases, cleanup or mutation locks are active. It does
not wait, cancel jobs, stop pools, or change listeners. Success keeps a volatile
admission lease until idempotent `end_checkpoint_drain/1`; ordinary queued and
synchronous store mutations/queries are blocked meanwhile. The acquiring thread
may use `with_saved_state_snapshot/1` for identity rechecks under that lease.
Use `setup_call_cleanup/3` in an independent coordinator thread so rollback,
exceptions and cancellation release admission. Listener takeover/rollback remains
the host's responsibility; private native adapters must not bypass these gates.
Acquire outside `with_application/1`, not from a file/inference job whose own
activity would correctly make the drain busy.

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

Runtime source replacement uses validated immutable native `.data` snapshots in
repository `tmp\runtime`. Native clause `file/1` and `line_count/1` properties refer to those
actual snapshot files; original source locations remain `xc_source_*` metadata.
The active generation changes only after all snapshots load successfully.
Unchanged modules are reused. Failed or stale-generation requests preserve the
previous active KB. Unloading the final source leaves a valid empty KB.
Exact `.data` native loads preserve real SWI file/line properties, even beside a
QLF companion. Hand-authored `.pl` loader inputs remain supported.

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
Application maintenance: `POST /api/app/reload` with an empty JSON object.
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
HTML/CSS/JavaScript/Markdown changes and pauses while hidden. A browser refresh
does not reload Prolog.

Settings > **Reload changed files** reloads changed, already loaded application
modules directly under `prolog/ow_dr`, using SWI's module loader and recorded
dependencies. It excludes KB sources, generated companions, runtime snapshots,
tests, external modules and include-only KB headers; it never invokes broad
`make/0`. Code reload and source compilation are serialized. Active generations,
native assertion handles, browser drafts and saved settings are retained.
The button sends no filenames or executable goals. Reload failures are reported
with affected files; already applied code changes cannot be automatically rolled
back. Fix the files and retry, or restart if necessary.

A server started before this endpoint existed needs one normal restart to load
the feature; subsequent button presses do not require restarting the server.
A long-running `--edit` compiler also keeps its loaded implementation. Start a
fresh compiler invocation after changing Prolog application code.

## Scope and current limitations

All vocabulary is loaded as inert guarded data. Normal compilation, cache
admission, and loading do not run advisory normalized-semantic or microtheory
shape analysis. Internal `semantic_shape_checks(true)` explicitly enables reader
analysis; its default `false` value is part of cache identity, so optional
diagnostics cannot leak between cache modes. The explicit `kb_cache:valid_semantic/1`
and `kb_cache:normalized_microtheory/1` analyses remain available. Historical
warnings beginning `Non-symbol predicate position`, `Empty expression outside a
declared list-data slot`, or `Unexpected normalized semantic shape` remain
inspectable in saved metadata but are not replayed during default compiler/native
cache loading. Explicit `semantic_shape_checks(true)` also permits their replay.
Mapping shape gates and their
warnings are unchanged. Integrity checks still
reject corrupt caches, mismatched variable slots, and unsafe executable
envelopes. Unparseable source syntax is reported with the original source left
intact; it is not replaced by an invented assertion or an incomplete success
cache. Separate last-failure reports use `.data` files in `.logos-state/failures`.

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
swipl -q -s .\prolog\ow_dr\tests\test_cache_paths.pl -g "run_tests(cache_paths)" -t halt
node --test .\prolog\ow_dr\tests\render.test.mjs .\prolog\ow_dr\tests\browser.test.mjs
```

Cache-path integration tests use disposable fake repositories beneath
`prolog\ow_dr\tests\artifacts`; they do not compile or modify the original corpus.
