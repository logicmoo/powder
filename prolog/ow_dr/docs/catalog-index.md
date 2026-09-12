# All-source catalog index

The catalog indexes original `KBs` files without consulting their clauses into
the active knowledge base. First run the explicit compiler/index job, then:

```powershell
swipl --stack-limit=8g prolog\ow_dr\index_catalog.pl -- --all
```

This command does not compile, repair or load sources. Missing/stale companions,
active compiler ownership and malformed artifacts appear as individual failures
or deferred files. Other files continue. Exit 0 means the complete discovered
eligible set was indexed; exit 1 means incomplete coverage or failure. A subset
refresh retains the full eligible denominator and marks unselected files pending.
Coverage describes the explicit refresh snapshot, with its verification time;
it is not a promise that files cannot subsequently change.

## Persistent data

`tmp\KBs\<relative-source>.catalog.data` contains one validated source snapshot.
`tmp\catalog\terms.data` contains the aggregate inverted term-to-files index.
`tmp\catalog\progress.data` reports the current/final refresh. These are disposable
derived artifacts, not assertion-ID ledgers or native annotations.

Each file has `catalog_header(1)`, a ground payload and
`catalog_footer(SHA256)`. Readers validate the digest, complete ending,
source/locator counts and term-hit counts before using it. Writes use unique
same-directory stages and publish only validated complete payloads. The source's
existing native compiler lock is held during indexing. A retained aggregate lock
serializes catalog refreshes; another refresh receives an explicit busy error.

The source identity binds original path and SHA-256, current compiler/options/
mapping/MT policy, semantic-index bytes, normalized bytes and catalog schema.
Identical content at different paths cannot borrow assertion IDs.
Existing compiler/index validation is reused; headers are parsed as data,
never consulted. Corrupt catalog artifacts are diagnosed before rebuilding.

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
