# Bounded exact-term directory

The query projection's exact-term interface no longer bootstraps by parsing the
entire `query.data` model. Its key directory is a persistent, key-addressable view
of that **same** projection and uses the existing canonical IDs and postings.

```powershell
swipl --stack-limit=8g prolog\ow_dr\index_catalog.pl -- --directory
```

This explicit repair/build reads the already-published query projection once.
It does not parse original KB sources, recompile the corpus, load assertions, or
rewrite existing sentence postings. Normal query publication builds the directory
from the model already in memory.

`tmp\catalog\query.directory` is a small validated manifest. It records source/
taxonomy revisions, coverage, provider readiness, the input projection identity,
and an immutable version directory. That directory contains up to 256 SHA-256
UTF-8 key-prefix buckets plus per-source query descriptors. A bucket holds
term/type summaries and source/count/offset locators—not sentences, CNF, or copies
of original metadata. Source descriptors exclude dependency/provider summaries.

Exact term and assertion requests read one bucket, only matching source
descriptors, and existing direct-seek postings. Files with no hits in the requested
facet are skipped. The original source and normalized identity checks still run
for displayed assertions. Native loaded/unloaded membership remains independent.

The small manifest is published only after complete staged outputs validate.
Changed query-projection size/time invalidates its directory; an unavailable or
stale directory produces an explicit response, never a silent full-model read.
An unenriched SourcePack snapshot is rejected from the small provider-readiness
field without decoding the large model.

The external directory builder has its own native ownership lock and small
progress record. Cancellation is checked between bounded chunks; a completed
manifest is never left pointing at deleted shards if later progress reporting
fails. No original sources or existing postings are deleted on cancellation.

This fixes the exact lookup path first. Broad substring/ranked catalog search
retains its separate existing projection path; the directory does not claim that
all broad searches are already optimized.

## Contextual loaded/unloaded file menu

`GET /api/catalog/files` reads only the selected term's compact membership/count
posting. It does not decode sentences, hash every source or read the full model.
Responses separate distinct matching assertions, semantic positions and
definition/declaration assertions, with current loaded membership and the
catalog revision/coverage. They do not infer executable availability.

The existing contextual left pane offers **UNLOADED occurrences**, **Loaded
occurrences** and **All indexed scope**. Each group is lazy and file-paginated.
Filename links keep the canonical selected term and filter the right-hand
sentences to that source; Properties retains the shared file renderer.
Browsing, expansion and Properties never load a KB. SourcePack navigation opens
the explicit existing review flow rather than submitting a load.

A generation-change event refreshes loaded/unloaded groups without deleting
disk memberships. Source selection, canonical term/NAT identity, file filters
and left-page offsets remain represented in links/history. Actual source
identity validation happens when sentence details are opened; a snapshot file
count is not a promise that the source cannot later change.
