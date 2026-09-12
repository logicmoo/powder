# All-source catalog index

The catalog indexes original `KBs` files without consulting their clauses into
the active knowledge base. First run the explicit compiler/index job, then:

```powershell
swipl --stack-limit=8g prolog\ow_dr\index_catalog.pl -- --all
```

This command does not compile, repair or load sources. Four persistent, isolated
SWI worker processes enrich sources; each holds only its current source lock.
The parent is the sole aggregate progress publisher. Small selections run
directly. Workers inherit the CLI's stack limit; no global runtime setting changes.
Isolation keeps a native worker crash from losing the other workers' completed
artifacts. Large tasks no longer share the in-process worker heap where an
access violation was observed in the installed Windows SWI. Missing/stale companions,
active compiler ownership and malformed artifacts appear as individual failures
or deferred files. Other files continue. Exit 0 means the complete discovered
eligible set was indexed; exit 1 means incomplete coverage or failure. A subset
refresh retains previously indexed, identity-validated files and their memberships;
only selected files are rebuilt. Never-indexed files remain pending.
Coverage describes the explicit refresh snapshot, with its verification time;
it is not a promise that files cannot subsequently change.

Subset maintenance reads the existing aggregate once and filters its compact
file memberships, rather than rereading every source's term payload. Retained
files are checked against current compiler identity and source/normalized hashes
under their native source locks; this is explicit maintenance I/O, not view-time
parsing. Stale, failed and busy sources stay in the inventory but lose their old
fresh memberships. Removed/renamed paths disappear from the current inventory;
their historical artifacts and IDs are not deleted. A final manifest/stamp check
handles files changing during maintenance. An unchanged refresh preserves the
aggregate revision. `refresh_catalog([], Report)` reconciles inventory without
indexing any newly discovered file.

New summaries also carry the aggregate's validated revision. After maintenance,
an older query/directory is explicitly stale until controlled query publication;
cached classifications cannot continue reporting removed type evidence as fresh.
The original directory remains on disk, and old-format summaries remain readable.
Rebuilding the shared taxonomy retracts claims from failed, stale or removed files,
including categories of terms mentioned in other files. Native load/unload changes
only the optional loaded filter, not this disk membership or type evidence.

For a controlled end-to-end update after the selected compiler companions are
current, use the same maintenance and publication pipeline:

```powershell
swipl --stack-limit=8g prolog\ow_dr\index_catalog.pl -- --update --defer-providers KBs\changed.krf
```

Omit `--defer-providers` to include provider enrichment. With no file arguments,
`--update` only reconciles inventory before rebuilding the query projection.
This does not compile originals or load/unload anything. It retains other source
memberships, then rebuilds taxonomy/query access from the maintained catalog;
failure remains explicit rather than advertising the previous projection as fresh.

## Persistent data

Broad term search uses a compact ranked binary view in the **same query
directory**. It contains only term keys, category bits and source ordinals, not
sentences, formula copies, source payloads or another provider model. Requests
read the selected result buckets for counts/types and preserve the existing
per-source postings. Blank search uses stored rank order; substring/category/file
filters preserve deterministic pagination. No search request calls `model/1`.

New query/directory publication creates this view automatically. An existing
directory can be upgraded without reading `query.data`, rebuilding any source or
rewriting existing buckets/postings:

```powershell
swipl --stack-limit=8g prolog\ow_dr\index_catalog.pl -- --search-directory
```

The existing native directory lock serializes publication. A unique binary file
is validated before the small manifest references it; failed upgrades leave the
old directory intact. SHA-256, term/file counts, source ordinals, complete EOF,
query revision, taxonomy and SWI version/architecture are validated. A missing
view is explicitly pending, never a fallback to the monolithic model. One compact
view, one filtered key list and at most 16 selected buckets are cached per HTTP
thread and replaced on revision changes. Bucket file stamps invalidate cached
records. Exact lookup remains independently usable during this upgrade.

Measured against the existing 978-file / 1,007,236-term publication on the
development machine: the directory-only upgrade took **98.276 seconds** and wrote
**61,974,128 bytes**. It reused every source, query, exact bucket and posting.
In a fresh standalone reader, ten-row overview was **3,867 ms cold / 43 ms warm**;
the first `diplomaticState` substring search was **1,218 ms** (three keys), and
the lexical filter **1,218 ms** (89,900 keys). End-of-probe global heap was
169,965,528 bytes, not a peak/RSS measurement. Isolated real HTTP tests forbid
`model/1` and exercise overview, substring and lexical pagination; different HTTP
workers can each incur their own compact-view cold read. These are backend
measurements, not a claim that the separate browser static-startup queue is fixed.

The `lexical_words` category recognizes the exact `x_*-TheWord` naming convention.
It retains other categories and unknown/recorded types; it is not ontology
evidence or an inference that the term is an Individual.

`tmp\KBs\<relative-source>.catalog.data` contains one validated source snapshot.
`tmp\catalog\terms.data` contains the aggregate inverted term-to-files index.
Its small `terms.data.summary` companion binds coverage to that aggregate's
path/size/mtime. Status reads this validated summary, never the million-term
payload. Normal refresh publishes both. To add or repair just the summary for
an existing aggregate (without indexing any source or rebuilding the query):

```powershell
swipl --stack-limit=8g prolog\ow_dr\index_catalog.pl -- --summary
```

`tmp\catalog\progress.data` reports the current/final refresh. These are disposable
derived artifacts, not assertion-ID ledgers or native annotations.

Each file has `catalog_header(1)`, a ground payload and
`catalog_footer(SHA256)`. Readers validate the digest, complete ending,
source/locator counts and term-hit counts before using it. Writes use unique
same-directory stages and publish only validated complete payloads. The source's
existing native compiler lock is held during indexing. A retained aggregate lock
serializes catalog refreshes; another refresh receives an explicit busy error.
The digest covers the emitted UTF-8 payload line including its LF. Readers hash
those bytes in bounded chunks on the same open handle, rewind, and parse once.
They do not reserialize a hundreds-of-megabytes model merely to check its digest.
The canonical single-payload-line envelope, full structural validation and
Unicode/control-character integrity remain enforced.

The source identity binds original path and SHA-256, current compiler/options/
mapping/MT policy, semantic-index bytes, normalized bytes and catalog schema.
Identical content at different paths cannot borrow assertion IDs.
`rawSourceHash` is SHA-256 over actual original bytes (`encoding(octet)`).
It is distinct from the compiler's historical `sourceHash`: SWI's default
file-hash encoding re-encodes high-bit octet characters as UTF-8. That legacy
fingerprint is retained for companion compatibility, not mislabeled as raw SHA.
No original files or compiler identity ledgers are rewritten to add the raw hash.
The normalized cache's complete structural/digest validation is reused; its
guarded clauses and metadata are the authority for occurrence counts and IDs.
The older distinct-constant index is fingerprinted but its large, redundant
term table is not parsed or used as evidence. This avoids validating unused data
again while building a richer index. Headers are parsed as data, never consulted.
Corrupt catalog artifacts are diagnosed before rebuilding.

Compact source data retains:

- `s(Ordinal,Id,OriginalLine,MtKey,OriginalVariableNames,NormalizedByteOffset)`.
- `t(TermKey,SentenceCount,OccurrenceCount,ContextCount,DefinitionOrdinals,Roles,Hits)`.
- `h(Ordinal,StructuralPath,Role,semantic|definition|context)`.
- Positive type/hierarchy/schema claims, their exact sentence/path provenance,
  and positive application heads for subsequent catalog-wide ontology analysis.
- Static defined/declared/referenced/outbound evidence and explicit unknowns.

Repeated appearances have separate paths; three uses in one assertion count as
three occurrences and one sentence. Whole NAT identities use the shared `nat:`
codec, independently of their constructor. Metadata-only MT occurrences have
their own facet and do not increase ordinary semantic counts. Variables,
instrumentation and source-path metadata are not semantic constants.

Assertion details seek the identified normalized clause and reconstruct its
semantic AST with fresh variables and original names. Source and normalized
hashes are checked first. No extra formula strings or live clause references
are persisted in this catalog.

## Definition evidence and limits

Known schema target slots reuse `declaration_target/4`. Explicit positive `isa`
assertions define the selected **subject's type**, including whole NAT subjects.
Nested implication antecedents/consequents, negative assertions and ordinary
`P(a,b)` applications do not become declarations of `P`. Conjunctive positive
declarations retain their exact child paths.

Type claims retain real collection identities; `MetaFunction`, a collection of
predicates about functions, is not guessed to be a callable function type from
its name. Type declarations and static rule heads are not proof of executable
implementation. MeTTa equations remain inert. Additional cross-file taxonomy
and provider resolution must report their own evidence/coverage rather than
silently treating these source-local claims as complete inference.

## All-file query projection

After enriching the source catalog, publish the direct-seek query projection:

```powershell
swipl --stack-limit=8g prolog\ow_dr\index_catalog.pl -- --query
```

If SourcePack provider enrichment is unavailable, publish the same complete
membership/definition projection independently:

```powershell
swipl --stack-limit=8g prolog\ow_dr\index_catalog.pl -- --query --defer-providers
```

This still uses the complete taxonomy, exact term/file/assertion positions and
the same `query.data`/postings codec. It reports `providerCoverage:pending`;
`source_pack_snapshot/1` explicitly reports `provider_enrichment_pending`, not
SourcePack readiness. A later normal `--query` enriches that same projection,
reusing its taxonomy and posting files. A failed enrichment leaves the readable
membership projection in place.

This builds `tmp\catalog\query.data` and versioned, immutable per-source posting
files. Each term posting has its own validated digest and exact source/MT/ID/
position locators. Requests seek the selected term rather than parsing entire
per-source occurrence indexes. Old projections remain usable during publication.
Query retries validate and reuse already-complete postings in the same
catalog/taxonomy revision directory. Their compact counts and byte locators are
recovered from the validated postings, without copying formulas or rewriting
those files. Taxonomy is persisted separately by catalog revision before the
postings phase; subsequent retries recheck source hashes but do not rebuild it
from every source artifact. A run predating this taxonomy checkpoint requires
one read of the validated derived source catalogs, not recompilation of originals.
Publication verifies that the current eligible source manifest still matches
the catalog; removed directories cannot be reintroduced as global providers
from retained artifacts. The CLI reports measured projection time, and progress
retains its known source denominator through the postings phase.

Cross-revision maintenance also reuses a previous file's immutable posting when
its source identity and effective definition-position schema are unchanged.
Type/category proof changes alone do not duplicate unaffected source postings.
Changing a schema target slot invalidates those postings even when their original
file bytes are unchanged. Legacy directories can reuse postings when the complete
taxonomy hash matches; no existing artifact migration is required.

Exact term and assertion requests use `query.directory`: a small manifest,
256 immutable key buckets and compact source descriptors. These reference the
same term entries and per-source postings, not a second semantic index. A request
reads one bucket rather than the monolithic query model. Query publication builds
the directory automatically; an existing complete projection can acquire this
access path without rebuilding sources or postings:

```powershell
swipl --stack-limit=8g prolog\ow_dr\index_catalog.pl -- --directory
```

Status reports `lookupDirectory` separately from projection and provider coverage.
Its native owner lock, progress and atomic manifest publication preserve the old
directory on failure. Exact lookups reject a directory whose input projection
has changed. Broad search still uses the larger query model.

`kb_catalog_schema` combines positive type and hierarchy claims with explicit
provenance. Multiple categories are retained. MetaRelation schema predicates
require proven relation-valued target slots; membership alone does not imply
argument 1. Known schema-role helpers remain available where ontology evidence
is absent. Type classification is catalog taxonomy, not cross-MT entailment.
Unrecognized declared classes form the `typed_other` remainder, never an inferred
ontological Individual. Old `individuals` group keys are translated to that
honest label when reading an older projection. Unknown untyped terms remain
`unclassified`. Current query rows expose type names with
`typeEvidenceCoverage:summary_only`; the underlying taxonomy retains their
source/ID/context supports, but dedicated compact type-support links are not yet
exposed. Filtering occurrences to loaded files does not turn catalog-wide types
into loaded-KB or MT entailments.

The read-only `/api/catalog/status`, `/search`, `/term` and `/assertion`
endpoints report snapshot coverage and active-generation membership separately.
Term queries accept `scope=all|loaded|unloaded`, `facet=definition|semantic|context`,
source/MT filters and pagination. Counts apply before pagination; repeated
positions and distinct assertion counts are separate. Visible assertion details
recheck authorized original paths and source/normalized hashes.
Catalog assertion cards expose exact matching structural paths. MT blocks offer
an all-indexed context view, including unloaded sources; this does not load the
MT or change the active generation.

Blank all-term pages slice the persisted rank order directly. Other searches
scan once and retain only the last result-key list per request worker, keyed by
catalog revision, taxonomy, active generation, scope and category; pagination
reuses those keys. A worker reading the large validated query model has an
8-GiB **thread-local** stack ceiling (or retains a higher configured ceiling).
This is a limit, not a reservation, and does not change other threads, native
annotations, or the active KB. The default 1-GiB HTTP limit was insufficient for
digest validation of the actual million-term aggregate.

## External job visibility

The CLI catalog indexer is **not** an app file-pool queue item. Task Pools has a
separate external-indexer panel. Status includes run/controller and worker PIDs,
current/last files, completion counts, heartbeat age, native owner-lock state,
terminal errors and cancellation. A saved `running` record without its live
native owner lock is reported as **interrupted**, not as continuing work.

`POST /api/catalog/cancel` accepts `{phase:"catalog"|"query", runId}` only for
the matching live owner. The controller notices its cancellation record and
stops only its own worker processes. Projection cancellation is observed
between source operations. Completed source artifacts are retained. Stale run
IDs cannot cancel a later invocation. Query projection has its own progress
record and lock; source completion is not confused with query publication.

Progress-file replacement races are advisory: status retries native transient
open failures, then explicitly reports an unavailable observation rather than
claiming a saved worker is alive. Once the owner lock is gone, worker states are
only unverified last reports. Status caches the small validated coverage summary,
not a copy of the complete term-to-file table for every polling request.

## Read-only live verification

The opt-in Node test checks real unloaded definitions, distinct/occurrence counts,
pagination, source-ID details, MT context, positions, linked expressions and desktop/
mobile layout in an isolated browser. It verifies that live generation, files and
counts are unchanged. Basic mode does not read the monolithic broad-search model:

```powershell
$env:OPENWORLD_CATALOG_TEST_URL='http://localhost:3050'
$env:OPENWORLD_CATALOG_EXPECTED_FILES='978'
$env:OPENWORLD_CATALOG_BASIC_ONLY='1'
$env:LOGOS_CHROME='C:\Program Files\Google\Chrome\Application\chrome.exe'
node --test prolog\ow_dr\tests\catalog-index-ui.test.mjs
```

The current 978-file publication passed all seven tests: 1,007,236 indexed terms;
`resultIsa` had 101 defining assertions, including 79 unloaded assertions.
Provider enrichment remained pending. Under concurrent live-service load the
measured definition requests took 13.5 seconds cold / 14.5 seconds warm, and
isolated browser startup took 49.5 seconds. A separate-process exact request took
3.843 seconds, including 2.258 seconds for full source/normalized hash validation.
These are working correctness results, **not** a subsecond performance claim.
Per-request hash cost, broad-search cold reads, automatic scheduling and
compact inspectable type-support links remain limitations.

The narrower `diplomaticState` cold-path probe against the real published artifacts
completed in 834 ms through an isolated HTTP listener: six defining assertions,
one source, five returned rows. The probe replaces `model/1` with an exception,
so success proves this exact path never reads the monolithic million-term model.
It starts/stops only its own ephemeral listener and does not touch the primary:

```powershell
$env:OPENWORLD_CATALOG_REAL_PROBE='1'
swipl -q -s prolog\ow_dr\tests\test_catalog_directory.pl -g "run_tests(catalog_directory:real_cold_exact_http_uses_bounded_directory_not_monolithic_model),halt"
```

This isolated result does not certify a restored/running primary's thread or
loaded-module state. A reported primary timeout must still be checked there;
increasing its heap ceiling or rebuilding the validated projection is not justified
by the measured bounded-directory path.

The same real-artifact probe verified `source_pack_snapshot/1` in 2 ms with
`model/1` forbidden: the small directory manifest reported
`provider_enrichment_pending`, so the 523,398,637-byte `query.data` was not read.
`real_pending_provider_snapshot_reads_only_the_small_manifest` exercises this
contract under `OPENWORLD_CATALOG_REAL_PROBE=1`. A legacy/stale running accessor
must not be mistaken for the current bounded pending-provider gate.

`/api/catalog/status` includes `exactLookups`: the serving PID, bounded-path
implementation marker, active request phases and the latest completed lookup.
Phases distinguish directory access, active-manifest capture, source descriptor,
posting, authorization, source identity and rendering. Timings use monotonic
process wall time. This bounded, volatile diagnostic state contains only ground
labels/timings, is cleared on request cleanup, and is not part of a saved KB.
It allows a coordinator to inspect a pending request without submitting a duplicate.
Completion covers lookup/rendering, not subsequent HTTP JSON transmission.
