# Compact provider justifications

`source_provider_extensions/4` retains every distinct local positive declaration
occurrence, its original assertion ID, file, MT, path and supported type/role.
Mentioning a symbol is still not provision. A declaration is not an executable
implementation.

Before joining taxonomy evidence to local assertions, the producer:

1. Deduplicates local claims and application positions.
2. Builds one compact witness per type/group/root and per schema predicate/slot.
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
