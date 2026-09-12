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
refresh retains the full eligible denominator and marks unselected files pending.
Coverage describes the explicit refresh snapshot, with its verification time;
it is not a promise that files cannot subsequently change.

## Persistent data

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
Per-request hash cost, broad-search cold reads, incremental subset retention and
compact inspectable type-support links remain limitations.
