# Compact provider justifications

`source_provider_extensions/4` retains every distinct local positive declaration
occurrence, its original assertion ID, file, MT, path and supported type/role.
Mentioning a symbol is still not provision. A declaration is not an executable
implementation.

Before joining taxonomy evidence to local assertions, the producer:

1. Deduplicates local claims and application positions.
2. Builds one compact witness per type/group and per schema predicate/slot.
   Equivalent hierarchy roots do not duplicate a local type-role declaration.
3. Carries only ordinal/head/slot/path in target requests, not entire proof trees.
4. Uses the local `isa` assertion as its type-declaration source, rather than
   copying all other files' declarations into that local evidence.

The selected taxonomy justification is representative. Both the extension
coverage and individual evidence explicitly set
`proofAlternativesExhaustive:false`. Distinct local occurrences and contexts
remain distinct. Other original schema/type declarations remain accessible
through their own source catalog entries; this projection is not an enumeration
of every possible proof path.

This prevents duplicate global schema declarations and diamond paths from
multiplying into a local-assertion × all-global-proof Cartesian product. Small
unknown proof constructors remain inert data; they are never executed.

Regression coverage includes 300 repeated global slot proofs joined to 300
local occurrences, independent MTs, a diamond with a cycle, wrong/nested target
positions, collection-only typing, and MetaFunction's predicate-valued meaning.
The real BaseKB benchmark reads only the existing source catalog and persisted
taxonomy. No original source recompilation or increased memory ceiling is needed.

## Measured BaseKB result

On the installed Windows/SWI runtime, `f4e7d2c1` completed the producer for
`KBs/fire/flat-files/nextkb/basekb.krf` (192,369 source assertions) within the
existing 8-GiB stack ceiling:

| Measurement | Result |
|---|---:|
| Producer wall / CPU time | 14.199 / 11.625 seconds |
| Declared symbols | 23,400 |
| Local declaration-evidence entries | 132,072 |
| Explicit unsupported/provenance gaps | 8,442 |
| Output term cells | 20,144,699 |
| Global-stack bytes reported after production | 654,010,472 |

Input loading is excluded from the producer timing. The stack reading is
neither peak memory nor RSS. Status remains `partial` because genuine gaps are
retained; success here means the producer completes, not complete ontology or
runtime implementation coverage. The later `b02fbad5` refinement deduplicates
equivalent hierarchy roots for one local type role and has separate regression
coverage; the table above is specifically the measured `f4e7d2c1` result.
