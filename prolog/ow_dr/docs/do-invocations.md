# doInvocations category

## Shared naming contract

```prolog
:- use_module(kb_do_invocations,[do_invocation_symbol/1]).
```

`do_invocation_symbol(+Symbol)` is a **naming-only semidet check**. It accepts
atoms or strings, recognizes a leading source `#$` spelling, normalizes through
the existing `kb_symbols:encode_symbol/2`, and removes one canonical `x_` display
prefix. The resulting visible name must start with literal lowercase `do`
immediately followed by an **ASCII capital A–Z**: `^do[A-Z]`.

Examples:

* Match: `doAttack`, `doMove`, `doInvoke`, `x_doAttack`, `#$doMove`.
* Do not match: `domain`, `double`, `dog`, `do`, `doattack`, `DoAttack`,
  `doÄttack`, `x_DoAttack`.
* Variables, compounds and lists fail without instantiation or execution.

The helper never checks existence, roles, definitions or execution. Every caller
(loaded categories, global catalog, source-pack adapter) must independently
require indexed predicate/relation evidence. An unrelated constant named
`doSomething` does **not** qualify merely because this naming helper succeeds.

## Loaded category evidence

`kb_term_categories` combines the naming check with existing predicate membership,
positive explicit `Predicate`/supported predicate-type or `Relation` type evidence,
or indexed relation-schema references. Schema references use existing
`kb_inventory:declaration_target/4` declarations, plus both arguments of
`genlPreds`/`subrelation`. They are resolved through already-cached assertion AST
locators, not source files. Invalid arity values, literal formatting data,
quoted forms and inert execution forms do not supply this evidence.

No executable definition is required. Other evidenced categories and original
type keys remain present; the doInvocations group is not an exclusive partition.
Collection-only typing supplies no relation evidence. Membership provenance uses
`basis:named_relation_reference`, records the reference basis and exact naming
pattern, and reports `execution:unknown, analysisExecuted:false`.

The old `doAnnounce`/format-descriptor restriction is removed **only from category
classification**. The existing reader `list_data_slot/3` string-formatting policy
is unchanged—including its separate handling of names such as `domain`.

## Category-only cache upgrade

The category DTO schema remains `powder.term-categories.v1`; its internal derived
catalog now carries `projectionVersion:2`.

`current_category_catalog/1` checks that projection marker.
`refresh_category_catalog(Roles,OldCatalog,NewCatalog)` is the pure upgrade:
it removes old do-format memberships, recalculates do membership from cached
evidence, restores/removes browsing remainders as appropriate, updates counts and
the identity lookup, and preserves existing ranking order and source counts.

`kb_term_roles:loaded_term_index/1` upgrades an otherwise valid cached role index
once. It retains the occurrence index, NAT catalog, types, assertion ASTs, MT
graph, metadata-retention tag and KB generation. Publication still rechecks
generation/policy. Subsequent reads reuse the upgraded cache. A genuinely changed
generation or invalid role/retention schema retains its existing rebuild policy.

No source, compiled companion, native TVA, store setting or compiler fingerprint
input is changed. This upgrade does not recompile the corpus or reset the KB.

## Focused tests

```powershell
swipl -q -s prolog\ow_dr\tests\test_term_categories.pl -g "run_tests([do_invocations,term_categories,term_roles])" -t halt
```

Fixtures cover naming/case/prefixes, unrelated constants, reference-only/type/
schema evidence, multiple groups, unchanged reader behavior, removal of stale
`domain` membership, and equality of fresh/upgraded catalogs. A wrapped cache
fixture rejects any full role rebuild or source snapshot, proves only one
projection upgrade, and compares every noncategory index field unchanged.

Validation: 78 focused PL-Unit tests passed, including the existing
`logos_reader:doannounce_queries_keep_variables_and_literal_descriptor_lists`
case. The native-generation fixture reports a non-failing choicepoint warning.
Compiler-sensitive files and the compiler implementation fingerprint remained
unchanged; no live service or corpus operation was performed.
