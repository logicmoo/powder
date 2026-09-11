# KB organization

Original root-level files are grouped by corpus or purpose:

| Directory | Contents |
| --- | --- |
| `sumo` | tinyKB, Merge, and English-format SUMO sources |
| `ikb` | IKB exports and associated existential axioms |
| `sigma` | Sigma support sources and test questions |
| `scenarios` | HPKB, military, and scenario sources |
| `examples` | Small example sources |
| `docs` | Corpus license and reference documentation |

Existing nested corpora retain their original directory structure. Source
contents are not repaired or rewritten during organization. The default KB
is `sumo\tinyKB.kif`.

Each `*.inventory.json` stays beside its original source. The `microtheory`
directory keeps the recorded MT catalogs, content contributors, referenced-only
files, relationships, and predicate/function statistics. KIF inventories use
post-translation vocabulary; KRF/MELD and MeTTa do not receive SUMO mappings.
These are saved statistics, not additional KB assertions or runtime inheritance
rules. Their recorded timestamps and coverage identify the snapshot they describe.

Loading caches are separate: `KBs\sumo\tinyKB.kif` uses
`tmp\KBs\sumo\tinyKB.kif.data` and `.index.data` relative to the repository root.
The text caches contain serialized Prolog data, not application source code.
Optional QLFs are derived fast-load files; MeTTa equations remain inert data.
New runtime snapshots are under `tmp\runtime`; retained old snapshots may be
under `tmp\legacy-runtime`.
Old QLF bundles with embedded pre-migration paths are preserved under
`tmp\legacy-qlf` instead of being advertised as current fast-load caches.
Fresh QLFs can be generated explicitly from the new `.data` companions.

Durable assertion-ID ledgers are **not** temporary caches. They remain in
`prolog\ow_dr\.logos-state`, including the old path assignments retained for
rollback after source relocation.

Source comments are retained as inert `xc_comments` assertion metadata. Leading
blocks, comments inside a form, and same-line trailing comments are associated
by proximity. `xc_comment_association` labels this as a first-pass guess and
records the assertion's start/end span (one-based positions, exclusive end).
Comments without an assertion owner remain source-level metadata. Neither
comments nor guessed associations change semantic assertion IDs or counts.

The corpus license is preserved in [license.txt](license.txt).
