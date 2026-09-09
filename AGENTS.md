\# Rebuild the complete Prolog KB browser from scratch



Build a complete, working SWI-Prolog knowledge-base browser and offline compiler. Use this specification as the authoritative design. Do not recreate superseded representations or build placeholder implementations.



\## 1. Workspace and delivery



\- Work directly in `C:\\\\\\\\snet\\\\\\\\PeTTa\\\\\\\\repos\\\\\\\\openworld\\\\\\\_ikris` on its existing `master` branch.

\- Use a local branch-mode session targeting that checkout. Do not create feature branches or isolated worktrees.

\- Preserve the original `KBs\\\\\\\\` corpus and its user-authored repairs. Never delete, rewrite, or “fix” source files without explicit permission.

\- Preserve Git history and unrelated files. Rebuilding the application is not permission to delete the repository.

\- Commit every meaningful working stage directly to `master`.

\- Use scoped commits; do not accidentally include temporary files or every generated corpus companion.

\- Include the required Copilot co-author trailer when applicable.

\- Do not push unless a remote exists and pushing is authorized.

\- Keep dependencies minimal: SWI-Prolog standard libraries, HTML, CSS, and JavaScript. No Node build step is required.

\- Use PL-Unit and Node’s built-in test facilities where appropriate.

\- Prioritize a usable offline compiler, then complete the runtime and browser.

\- Report compiler readiness only after actual fresh compilation and loading work. Do not confuse a completed helper module with an integrated application.

\- Continue until the whole project works, not merely until a plan or scaffold exists.



If the original corpus is unavailable, request it rather than fabricating its contents.



\## 2. Project purpose



Create a Cyc-style knowledge browser, named \*\*Logos KB Browser\*\*, with:



\- Recursive discovery of KB sources.

\- Offline source-to-Prolog compilation.

\- Persistent normalized and semantic-index caches.

\- Safe concurrent compilation.

\- Recovery of interrupted compilation.

\- Interactive source repair through an editor.

\- Native Prolog clauses with stable assertion IDs and source locations.

\- Microtheory-aware querying and proof tracking.

\- Term, predicate, microtheory, source, and provenance browsing.

\- A searchable, executable SUMO-to-CycL Markdown mapping table.

\- Readable linked S-expression rendering.

\- MeTTa data import without executing MeTTa.



The initial KB is exactly:



```text

KBs\\\\\\\\tinyKB.kif

```



Do not silently replace it with a sample directory or another KB.



\## 3. Final compiled representation



This format is fixed.



\### 3.1 General rules



\- Ordinary KB predicates and semantic symbols use the `x\\\\\\\_` prefix.

\- Ordinary facts use their actual predicate functors, not a universal `t/N` wrapper.

\- Use `t(Predicate, Arguments...)` only when the predicate position is a variable or compound expression.

\- There is \*\*no synthetic microtheory argument anywhere\*\* in a clause, nested formula, function, or higher-order application.

\- Microtheory is stored exclusively in assertion metadata.

\- Preserve explicit context arguments that genuinely occur in source expressions, such as an explicit `ist` argument.

\- Clauses contain real Prolog variables with correct sharing.

\- Do not emit named or numeric `'$VAR'(...)` placeholders in clauses.

\- Every complete generated clause occupies one physical line.

\- Every metadata record occupies its own physical line.

\- Escape embedded newlines in strings and atoms so one emitted term never accidentally spans multiple physical lines.

\- Every term ends with a period and newline.

\- Browser pretty-printing is independent of compiled-file layout.



\### 3.2 Ground fact



Source:



```lisp

(isa Fido Dog)

```



Generated form, with an illustrative ID:



```prolog

x\\\\\\\_isa(x\\\\\\\_Fido,x\\\\\\\_Dog) :- x\\\\\\\_cid(a65b1073318e63).

xc\\\\\\\_microtheory(a65b1073318e63,x\\\\\\\_FamilyMt).

xc\\\\\\\_source\\\\\\\_file(a65b1073318e63,'KBs/example.kif').

xc\\\\\\\_source\\\\\\\_line(a65b1073318e63,10).

xc\\\\\\\_kb\\\\\\\_names(a65b1073318e63,\\\\\\\[]).

```



\### 3.3 Fact containing variables



```prolog

x\\\\\\\_isa(X,x\\\\\\\_Dog) :- x\\\\\\\_cid(a65b1073318e64,X).

xc\\\\\\\_microtheory(a65b1073318e64,x\\\\\\\_FamilyMt).

xc\\\\\\\_source\\\\\\\_file(a65b1073318e64,'KBs/example.kif').

xc\\\\\\\_source\\\\\\\_line(a65b1073318e64,15).

xc\\\\\\\_kb\\\\\\\_names(a65b1073318e64,\\\\\\\["?X"]).

```



The `x\\\\\\\_cid` arguments are:



1\. Assertion ID.

2\. Each distinct original clause variable, in first-occurrence traversal order.



Ground facts therefore use `x\\\\\\\_cid/1`.



\### 3.4 Logical implication remains an asserted formula



KIF source:



```lisp

(=> (isa ?X Dog) (isa ?X Animal))

```



Generated:



```prolog

x\\\\\\\_implies(x\\\\\\\_isa(X,x\\\\\\\_Dog),x\\\\\\\_isa(X,x\\\\\\\_Animal)) :- x\\\\\\\_cid(a65b1073318e65,X).

xc\\\\\\\_microtheory(a65b1073318e65,x\\\\\\\_FamilyMt).

xc\\\\\\\_source\\\\\\\_file(a65b1073318e65,'KBs/example.kif').

xc\\\\\\\_source\\\\\\\_line(a65b1073318e65,20).

xc\\\\\\\_kb\\\\\\\_names(a65b1073318e65,\\\\\\\["?X"]).

```



This is a fact about a formula. Do not automatically turn ordinary implication into an executable Prolog rule.



\### 3.5 Executable rules use exactly `<===`



Source:



```lisp

(<=== (grandparent ?X ?Y)

\\\&#x20;     (parent ?X ?Z)

\\\&#x20;     (parent ?Z ?Y))

```



Generated, with the entire clause on one line:



```prolog

x\\\\\\\_grandparent(X,Y) :- x\\\\\\\_cid\\\\\\\_io(a65b1073318e66,and(x\\\\\\\_parent(X,Z),x\\\\\\\_parent(Z,Y)),vs(X,Y),vs(Z)).

xc\\\\\\\_microtheory(a65b1073318e66,x\\\\\\\_FamilyMt).

xc\\\\\\\_source\\\\\\\_file(a65b1073318e66,'KBs/example.kif').

xc\\\\\\\_source\\\\\\\_line(a65b1073318e66,30).

xc\\\\\\\_kb\\\\\\\_names(a65b1073318e66,\\\\\\\["?X","?Y","?Z"]).

```



The fixed `x\\\\\\\_cid\\\\\\\_io/4` arguments are:



1\. Assertion ID.

2\. Ordered body represented as `and(Goal1,Goal2,...)`.

3\. `vs(...)` containing distinct head variables in first-occurrence order.

4\. `vs(...)` containing distinct body-only variables in first-occurrence order.



All occurrences refer to the same real Prolog variables.



Use the atom `vs` for an empty variable group. Use the atom `and` for an empty conjunction, interpreted by the trusted runtime as success.



Do not emit:



\- A list instead of `and(...)`.

\- Separate `x\\\\\\\_cid\\\\\\\_in` and `x\\\\\\\_cid\\\\\\\_out` calls.

\- A `BoundBefore` bookkeeping argument.

\- `io(...)` or `m(...)` wrappers.

\- Separate load-time `x\\\\\\\_aid` or `x\\\\\\\_cid` directives.



The `x\\\\\\\_cid\\\\\\\_io/4` implementation handles execution, microtheory scope, binding observations, proof tracking, and cleanup internally.



\### 3.6 `<==` and `<===` are different



Recognize exact tokens:



\- `<===`: executable back-chaining rule as specified above.

\- `<==`: preserve as distinct operator data using the quoted functor `'x\\\\\\\_<=='`.

\- Never treat the extra `=` as a typo.

\- Never map `<==` to `implies`, “reverse implication,” or `commitedChoice`.

\- Do not insert cuts or committed-choice behavior.



MeTTa remains data-only even when its content resembles rule syntax.



\## 4. Assertion IDs



Use one durable ID per source assertion occurrence.



An ID is:



```text

a + lowercase hexadecimal representation of full Unix microseconds

```



Example:



```text

1700000000.123456 seconds

→ 1700000000123456 microseconds

→ a60a2418202240

```



Requirements:



\- No year-2000 offset.

\- No `0x` prefix.

\- No `x\\\\\\\_` prefix on IDs.

\- IDs are atoms in Prolog and strings in JSON.

\- Centralize generation.

\- Use a native cross-process lock and durable high-water state.

\- Allocate at least `max(current\\\\\\\_unix\\\\\\\_microseconds, previous\\\\\\\_allocated + 1)`.

\- Efficient safe block reservation is allowed.

\- Handle same-tick allocation, clock rollback, restart, and concurrent compilers.

\- Preserve assigned IDs across reloads, unchanged forced compilation, and harmless source-layout changes.

\- Distinct duplicate assertions must remain distinct occurrences with different IDs.

\- Keep durable occurrence assignments and allocator state outside disposable cache pruning.

\- Report conflicting imported IDs rather than silently merging assertions.

\- Document uniqueness scope across repositories or copied datasets.



Do not use native clause-reference addresses, process-local counters, generated `.pl` line numbers, or content hashes as the final assertion ID.



\## 5. Metadata and provenance



\### 5.1 Emit binary `xc\\\\\\\_\\\\\\\*` facts directly



New generated files contain actual metadata terms, not provenance comments or `cp/3` records.



Canonical properties include:



```prolog

xc\\\\\\\_microtheory(Id,Microtheory).

xc\\\\\\\_source\\\\\\\_file(Id,OriginalSourceFile).

xc\\\\\\\_source\\\\\\\_line(Id,OriginalSourceLine).

xc\\\\\\\_kb\\\\\\\_names(Id,OriginalVariableNameStrings).

xc\\\\\\\_mapping\\\\\\\_rows(Id,AppliedMappingRowIds).

xc\\\\\\\_direction(Id,Direction).

xc\\\\\\\_monotonicity(Id,Monotonicity).

xc\\\\\\\_creator(Id,Creator).

xc\\\\\\\_creation\\\\\\\_date(Id,CreationDate).

```



Use centralized schema definitions and preserve additional real Cyc assertion properties as inert binary metadata.



\- Always emit `xc\\\\\\\_kb\\\\\\\_names`, including `\\\\\\\[]` for variable-free assertions.

\- Omit `xc\\\\\\\_creator` and `xc\\\\\\\_creation\\\\\\\_date` when their values are Lisp `NIL`.

\- Do not generalize that omission into dropping all empty or false metadata.

\- Preserve meaningful non-NIL creator/date fields.

\- Preserve mapping row order and multiplicity when relevant.

\- Preserve unknown imported properties safely and losslessly without executing them.

\- Metadata must not count as logical KB assertions or pollute predicate/term indexes.



Use explicit structured cache header/footer records rather than comments. Their schema may be designed cleanly, but must be documented and validated.



\### 5.2 Cyc wrapper example



Input:



```lisp

(:DIRECTION :FORWARD

\\\&#x20;:MONOTONICITY :DEFAULT

\\\&#x20;:CREATOR NIL

\\\&#x20;:CREATION-DATE NIL

\\\&#x20;:MICROTHEORY BaseKB

\\\&#x20;:KIF

\\\&#x20;(prettyName StepanavaniShrjanRegionArmenia "Step'anavani Shrjan"))

```



Output includes:



```prolog

x\\\\\\\_prettyName(x\\\\\\\_StepanavaniShrjanRegionArmenia,"Step'anavani Shrjan") :- x\\\\\\\_cid(a65b1073318e67).

xc\\\\\\\_microtheory(a65b1073318e67,x\\\\\\\_BaseKB).

xc\\\\\\\_direction(a65b1073318e67,':FORWARD').

xc\\\\\\\_monotonicity(a65b1073318e67,':DEFAULT').

xc\\\\\\\_kb\\\\\\\_names(a65b1073318e67,\\\\\\\[]).

```



Also emit the actual original source path and location.



Do not emit the NIL creator/date fields. Do not infer forward-chaining execution merely from `:DIRECTION :FORWARD`.



\### 5.3 Runtime properties



Provide:



\- Semantic source-clause access, such as `xc\\\\\\\_src(Id,Clause)`.

\- Runtime-only `xc\\\\\\\_clause\\\\\\\_handle(Id,Ref)`.

\- Lazy `xc\\\\\\\_plvars(Id,PrologSafeNameAtoms)`.



Never serialize native opaque clause handles.



`xc\\\\\\\_plvars` contains ground name atoms, not shared live query variables. Generate names deterministically, handle collisions, and invalidate them when original variable-name metadata changes.



Use one authoritative metadata store rather than parallel mutable `cp/3` and `xc\\\\\\\_\\\\\\\*` registries.



\### 5.4 Legacy metadata input



Continue reading legacy forms such as:



```prolog

% source\\\\\\\_line(13514).

% mapping\\\\\\\_rows(\\\\\\\[]).

```



Also support legacy:



```prolog

last\\\\\\\_clause(\\\\\\\[kb\\\\\\\_file\\\\\\\_line(13514),mapping\\\\\\\_rows(\\\\\\\[])]).

last\\\\\\\_clause(kb\\\\\\\_file\\\\\\\_line,13514).

```



These are compatibility inputs, not the new emitted representation.



\- Preceding metadata comments describe the following assertion.

\- `last\\\\\\\_clause` describes the preceding assertion.

\- Prevent metadata leakage across clauses, files, streams, or modules.

\- Reject malformed or orphan metadata clearly.

\- Never execute provenance text as code.



\## 6. Variables



\- Read KIF/KRF variables such as `?X`, `??`, and `??Foo-Bar`.

\- Read MeTTa variables such as `$x`.

\- Preserve original spelling, sigils, case, and punctuation in `xc\\\\\\\_kb\\\\\\\_names`.

\- Preserve repeated-variable sharing and lexical scopes.

\- Use real Prolog variables in clauses and semantic source variants.

\- Determine source-variable order before injecting runtime instrumentation.

\- Align names with first-occurrence traversal of the semantic head/body.

\- Exclude synthetic bookkeeping variables from source names and variable groups.

\- Use `term\\\\\\\_variables/2` or equivalent without instantiating the term.

\- If hashing/indexing requires canonical numbering, operate on a disposable copy. Never mutate the clause or emit those numbered placeholders as its variables.

\- Do not let nonground index entries accidentally unify with all terms.

\- Clause retrieval and invocation must produce fresh independent variables.



Preserve row-variable identity/kind; do not silently invent sequence-expansion semantics.



\## 7. Source dialects



\### 7.1 KIF



Read S-expressions, nested forms, comments, quoted/escaped symbols and strings, numbers, and variables with accurate source locations.



Support:



\- Ordinary assertions.

\- Formula-valued arguments.

\- Variable and compound predicate positions.

\- Cyc assertion-spec wrappers.

\- `in-microtheory`.

\- Exact `<===` rules.

\- Preserved `<==` data.



Apply the Markdown mapping policy described later.



\### 7.2 KRF



KRF is an authoritative separate dialect.



\*\*Never apply any SUMO-to-CycL mapping row to `.krf`.\*\*



No filename, path, header, opt-in comment, or `global(...)` mapping specification may override this rule.



Examples:



\- `instance` remains `x\\\\\\\_instance`.

\- `Class` remains `x\\\\\\\_Class`.

\- `exists` remains `x\\\\\\\_exists`.

\- `forall` remains `x\\\\\\\_forall`.

\- `=>` remains `'x\\\\\\\_=>'`.

\- `<==` remains `'x\\\\\\\_<=='`.



Internal prefixing, real-variable construction, metadata extraction, and exact `<===` compilation are not SUMO mappings.



The following is valid KRF data and must not trigger a quantifier-mapping error:



```lisp

(exists (IndexicalFn currentRole))

```



Support KRF reader conditionals:



```lisp

\\\\#-:rc4

(arg2Isa likelihoodOfSuccess Probability-QuantityType)

\\\\#+:rc4

(arg2Isa likelihoodOfSuccess Likelihood-QuantityType)

```



Use an explicit default empty feature set:



\- `#-:feature` includes the following form when the feature is absent.

\- `#+:feature` excludes it when absent.

\- Consume the whole following form correctly.

\- Never assert the reader marker.

\- Report malformed or dangling conditionals with source locations.

\- Include any configurable feature set in cache identity.



Support the corpus’s `#-:executable` cases too.



Use ISO-8859-1 compatibility for the existing legacy KIF/KRF corpus; provide explicit handling rather than lossy guessing if UTF-8 source support is needed.



\### 7.3 MeTTa



Read `.metta` as UTF-8 \*\*data only\*\*.



Support:



\- S-expressions.

\- Semicolon comments.

\- Escaped strings and Unicode.

\- Numbers and symbols.

\- `$name` variables.

\- Nested applications.

\- Type declarations such as `(: f Type)`.

\- Equations such as `(= (f $x) ...)`.

\- Standalone atoms and values.

\- Inert representation of `!(...)`.



Never execute MeTTa, load an interpreter implicitly, or apply SUMO/CycL mappings to it.



Use documented reserved semantic wrappers for standalone values and inert execution forms where a top-level Prolog clause needs a predicate. Keep their original structure recoverable.



MeTTa-specific structural interpretation:



```lisp

(\\\\\\\[] a b)

```



becomes a real Prolog list of normalized values.



```lisp

(\\\\\\\[])

```



becomes an empty list.



```lisp

((a b) (c d))

```



becomes a real Prolog dict, using a fixed ground structural tag, for example:



```prolog

metta\\\\\\\_map{x\\\\\\\_a:x\\\\\\\_b,x\\\\\\\_c:x\\\\\\\_d}

```



Explicit list syntax takes precedence:



```lisp

(\\\\\\\[] (a b) (c d))

```



remains a list of pairs.



Reject duplicate or unsupported map keys rather than silently dropping entries. Preserve nested values and variable sharing. Structural tags are not semantic vocabulary.



\*\*This interpretation is MeTTa-only.\*\* In KIF/KRF:



```lisp

((a b) (c d))

```



means compound predicate `(a b)` applied to argument `(c d)`, represented through `t/N`, not a dict.



\## 8. Microtheories



Honor declarations:



```lisp

(in-microtheory NuSketchTutoringSuggestionsMt :exclude-globals t)

```



\- Select `x\\\\\\\_NuSketchTutoringSuggestionsMt` for following assertions.

\- Parse keyword/value options separately.

\- Accept `:exclude-globals t` and `:exclude-globals nil`.

\- Diagnose malformed, duplicate, or unsupported options instead of misparsing them as assertions.

\- Do not assert the declaration itself.

\- Preserve meaningful directive properties as metadata where necessary.

\- Do not invent global-context inclusion.



Assertion-spec `:MICROTHEORY` overrides the file context for its assertion.



Before any declaration, derive MT from the original filename stem:



\- `tinyKB.kif` → `x\\\\\\\_tinyKB`.

\- `Foo.kif` → `x\\\\\\\_FooMt`.

\- Do not append `Mt` when the stem already ends, case-insensitively, in `PSC`, `Mt`, `Microtheory`, or `KB`.



Store the result in `xc\\\\\\\_microtheory/2`. Never inject it into semantic arguments.



\## 9. Native loader headers



Support both interfaces:



```prolog

:- include(kb\\\\\\\_dynamic\\\\\\\_assert).

```



and:



```prolog

:- use\\\\\\\_module(kb\\\\\\\_tail\\\\\\\_loader), kb\\\\\\\_tail\\\\\\\_loader:load\\\\\\\_remaining.

```



Requirements:



\- Generated nested files must resolve helpers independently of the caller’s working directory.

\- No manual per-predicate `dynamic` or `multifile` lists in generated KB files.

\- The helper may register necessary declarations centrally.

\- Loading must preserve real native SWI locations:



```prolog

clause\\\\\\\_property(Ref,file(File)).

clause\\\\\\\_property(Ref,line\\\\\\\_count(Line)).

```



\- A custom provenance registry alone does not satisfy this requirement.

\- Native locations identify the generated `.pl` clause’s physical location.

\- Original KIF/KRF/MeTTa location remains separate metadata.

\- Preserve correct module, source, stream, and thread ownership.

\- Do not choose an arbitrary stream merely because its filename matches.

\- Do not confuse the outermost source file with the immediate includer.

\- Do not reopen and reread the parent header.

\- Do not close a loader-owned stream.

\- Do not compile or assert the same clause twice.

\- Reloading must not duplicate clauses or accumulate stale metadata.

\- Unloading must remove corresponding native handles, metadata, and indexes.

\- Multiple files may contribute to the same KB predicate safely.



Use supported compiler/term-expansion facilities where possible. Any SWI-specific adapter must be narrow and tested. Do not monkeypatch `clause\\\\\\\_property/2`.



Raw compiled-cache readers must parse trusted generated headers, guarded clauses, and metadata as data. They must not blindly consult arbitrary input directives.



\## 10. Runtime execution and proofs



Implement functional `x\\\\\\\_cid/N` and `x\\\\\\\_cid\\\\\\\_io/4` helpers—not undefined predicates or always-true stubs.



\### Facts



`x\\\\\\\_cid(Id,Vars...)`:



\- Checks the assertion’s MT against the active query context.

\- Records successful fact participation and appropriate bindings.

\- Does not modify source metadata or store live query variables globally.



\### Rules



`x\\\\\\\_cid\\\\\\\_io(Id,and(Goals...),vs(HeadVars...),vs(BodyOnlyVars...))`:



\- Enforces the rule’s MT.

\- Executes body goals in source order through validated KB dispatch.

\- Preserves normal Prolog alternatives and variable sharing.

\- Tracks active clauses and successful proof steps.

\- Observes bound-variable counts before/after using the original fixed variable slots.

\- Treats `nonvar` counts as diagnostic information, not a reason to prune unchanged results.

\- Cleans context and proof state on failure, backtracking, cut, exception, timeout, and cancellation.

\- Does not retain failed-branch steps in successful proof results.



Query state must be thread-local and invocation-local.



MT isolation must apply to fact calls as well as rule calls. A rule in one MT must not silently consume facts from another.



Provide an explicit query-MT interface. For an unscoped query, enumerate entire-query solutions independently by MT rather than allowing each goal to choose a different context.



Do not invent MT inheritance.



Preserve safety:



\- Dispatch only registered KB predicates and explicitly supported logical forms.

\- No unrestricted `call/1` on web input or arbitrary source bodies.

\- No filesystem, process, module, or administrative execution from KB data.

\- Merely loading a file must never run its rule bodies.

\- Time-limit and result-limit query execution.

\- Report unsupported executable constructs clearly rather than assigning guessed semantics.



\## 11. Offline compiler



Provide:



```powershell

swipl compile\\\\\\\_kb.pl -- KBs

swipl compile\\\\\\\_kb.pl -- KBs\\\\\\\\tinyKB.kif

swipl compile\\\\\\\_kb.pl -- --force KBs

swipl compile\\\\\\\_kb.pl -- --edit --editor=edit KBs

swipl compile\\\\\\\_kb.pl -- --edit --editor=code KBs

swipl compile\\\\\\\_kb.pl -- --no-progress KBs

swipl compile\\\\\\\_kb.pl -- --progress=plain KBs

swipl compile\\\\\\\_kb.pl -- --strict-mappings KBs

swipl compile\\\\\\\_kb.pl -- --recover-tmp KBs

swipl compile\\\\\\\_kb.pl -- --force-recover KBs

```



Accept multiple files/directories and deduplicate overlapping selections.



Generate adjacent companions:



```text

name.kif       → name.kif.pl

name.krf       → name.krf.pl

name.metta     → name.metta.pl

```



Generate semantic companions such as:



```text

name.kif.index.pl

name.krf.index.pl

name.metta.index.pl

```



Use one shared compiler/reader/cache implementation for offline and runtime loading.



\### Default batch behavior



Without `--edit`:



\- Print each source error immediately.

\- Record that source as failed.

\- Continue with remaining files.

\- Preserve successful caches.

\- Do not prompt or open an editor.

\- Finish with accurate generated, cache-hit, busy, warning, and failure counts.

\- Return nonzero if errors occurred.

\- Never publish an incomplete merged index as though all inputs succeeded.



A later interactive run without `--force` reuses successful fresh caches and repairs failed or stale sources.



\### Live progress



Show:



\- Phase.

\- Percentage.

\- Completed/total files.

\- Processed/total size.

\- Elapsed time.

\- ETA.

\- Generated/cache-hit counts.

\- Warning/error/busy counts.

\- Current path.



Use monotonic timing and weighted work, not file count alone. Include normalization, indexing, and aggregate phases. Avoid negative/NaN estimates and show unknown ETA until meaningful.



\- Interactive terminal: update one bounded line.

\- Redirected output: periodic plain newline records.

\- `--no-progress` disables progress only, not diagnostics.

\- Send progress and diagnostics to `stderr`.

\- Flush warnings/errors immediately.

\- Clear the live line, print the diagnostic, then redraw.

\- Do not buffer warnings until the final summary.

\- Print first occurrences immediately and bound duplicate-warning floods.

\- Exclude human editing time from throughput/ETA.



\### Error/edit repair loop



Use full-line string input and trim it.



```text

Enter: edit and retry

s: skip repairing this file

S: continue compiling without any more repair/editor prompts

q or quit: abort

```



\- Empty or whitespace-only input means Enter.

\- Preserve the distinction between `s` and `S`.

\- EOF exits safely; it is not Enter.

\- Invalid text prints a reminder and re-prompts.

\- `S` is invocation-local and also suppresses a final warning-edit prompt.

\- Errors/warnings still print after `S`.



Before opening anything:



1\. Print and flush the complete error.

2\. Show source path, line, column where known, and a short source excerpt.

3\. Prompt and wait for acknowledgement.



Editor precedence:



1\. `--editor=<command-or-executable-path>`.

2\. `VISUAL`.

3\. `EDITOR`.

4\. Known line-capable editors on PATH.



Prefer `edit` before VS Code during automatic discovery.



Adapters include:



```text

edit FILE:LINE:COLUMN

code --goto FILE:LINE:COLUMN

```



Preserve quoted executable paths and filenames safely. Do not construct unsafe shell commands.



For Windows `edit.exe`:



\- It must visibly take over the \*\*same cmd.exe console\*\*.

\- Inherit standard handles.

\- Suspend compiler progress.

\- Wait intentionally while the user edits.

\- After save and close, retry only that source.

\- If unchanged or editor launch/exit fails, report clearly and re-prompt.

\- No hidden process, separate terminal window, or silent save watcher.



For GUI editors:



\- Launch nonblocking.

\- Observe a stable saved change and retry.

\- Handle launcher handoff/exit without hanging silently.

\- Provide a clear way to return to the prompt or abort.



With redirected input, never hang waiting for interactive repair.



`--edit` prioritizes errors. If a run has no errors, it may prompt once to open the first source-located warning; do not open editors automatically before the prompt.



\## 12. Cache identity, concurrent work, and recovery



\### Persistent validity



Bind caches to:



\- Original source identity/hash.

\- Dialect and relevant options.

\- Converter and schema versions.

\- KIF mapping-table identity when applicable.

\- Microtheory derivation policy.

\- Normalized output identity.

\- Semantic-index schema.



Validate complete headers, footers, counts, and structure.



Do not accept stale output based on timestamps alone. Avoid needlessly hashing the same unchanged file repeatedly during one run.



Keep source IDs stable when regenerating derived caches.



\### Safe writing



Never stream into the final `.pl` path.



1\. Acquire ownership.

2\. Create the early marker.

3\. Write a unique same-directory staged file.

4\. Flush and close.

5\. Validate the complete staged output.

6\. Remove the old final file only after the new file is ready.

7\. Rename the complete temporary to the final path.

8\. Clean owned temporaries and release ownership.



Preserve old output on conversion/write/validation failure. Surface failures during final installation honestly. Never present a partial file under its final name.



\### Early claim protocol



For a source such as `tinyKB.kif`:



```text

tinyKB.kif.pl.lock

tinyKB.kif.pl.tmp

```



\- Acquire a real exclusive native cross-process lock \*\*before\*\* creating or inspecting the marker.

\- Lock acquisition is nonblocking.

\- Never use “check whether `.tmp` exists, then create it” as synchronization.

\- Keep the stable lock file; do not unlink it during routine cleanup.

\- The winner rechecks state, creates the marker, and owns that source through normalization/indexing/repair.

\- Another compiler prints `BUSY: skipping file` and continues immediately.

\- A busy source is neither a successful cache hit nor a compilation error.

\- Remove the owned marker before releasing the lock.

\- Distinguish metadata markers from actual staged payloads.

\- Recover unlocked abandoned markers after a crash.

\- Never delete another live writer’s marker or staged file.



Two compiler windows must be safe. Do not keep one handle open for every file in the whole batch.



Runtime loading must not silently omit busy sources and claim success; return an explicit busy response while retaining the prior active KB.



Suggested consistent exit codes:



| Code | Meaning |

|---|---|

| 0 | Completed successfully or successful no-op |

| 1 | Source compilation/recovery failures |

| 2 | Usage or fatal setup failure |

| 3 | Busy/deferred sources with no source failures |



\### Recovery-only modes



`--recover-tmp`:



\- Inspect only known generated temporary/claim patterns under requested paths.

\- Do not run a normal full-tree compilation.

\- Skip active owners.

\- If a complete current final exists, clean abandoned temporaries.

\- Otherwise promote a complete validated stage if valid for the current source/schema.

\- Never promote a metadata-only marker as Prolog payload.

\- If no usable final/stage exists, recompile only the interrupted source and its required index.

\- Leave unrelated source files and arbitrary `.tmp` files untouched.

\- Report missing sources and failures explicitly.

\- Zero matching artifacts is a successful no-op.



`--force-recover`:



\- Discover the same affected-source set.

\- Fully recompile only those interrupted sources, even when final `.pl` exists.

\- Never override active locks.

\- Never touch sources without matching abandoned artifacts.



Ordinary `--force`, without a recovery mode, continues to mean rebuilding all selected sources.



\## 13. Semantic indexes and performance



Provide persistent per-source indexes plus cheap reusable aggregate indexes where useful.



Avoid:



\- Repeated full scans per file.

\- O(files × assertions) source counts.

\- Re-sorting the whole term index for each blank search.

\- Reformatting deep terms on every API request.

\- One PowerShell or other subprocess per file.

\- Quadratic directory/reparse scanning.



Index and cache:



\- Source assertion locators/counts.

\- Predicate signatures and semantic arities.

\- Term occurrence counts and search keys.

\- Pre-ranked overview terms/predicates.

\- MT-to-assertion locators.

\- Stable assertion IDs and provenance references.



Provide the derived binary index:



```prolog

xc\\\\\\\_indexed\\\\\\\_constant(Id,Constant).

```



\- One entry per distinct semantic constant per assertion occurrence.

\- Include actual predicate/function heads and nested symbols.

\- Include compound/higher-order head contents.

\- Exclude variables, instrumentation hooks, structural wrappers, dict tags, metadata, source paths, and context-only MT references.

\- If an MT occurs as a real semantic argument, index it normally.

\- Rebuild from authoritative semantic source data.

\- Maintain correctness across reload, unload, rollback, and cache reuse.

\- Do not mutate real variables during traversal or indexing.



Keep memory bounded and source reads streaming where appropriate.



Measure cold/warm compilation and startup, plus initial status/search/predicate requests. Aim for tinyKB to become usable in a few seconds and warm overview requests well below one second on the development machine. Report measured results rather than inventing performance claims.



\## 14. Server



Default command:



```powershell

swipl app.pl

```



Default address:



```text

http://localhost:3050/

```



Default source:



```text

KBs\\\\\\\\tinyKB.kif

```



Support explicit sources and overrides:



```powershell

swipl app.pl -- KBs\\\\\\\\Merge.kif

swipl app.pl -- --port=8080 KBs\\\\\\\\tinyKB.kif

swipl app.pl -- --kb-source=KBs\\\\\\\\tinyKB.kif --kb-source=KBs\\\\\\\\other.krf

swipl app.pl -- --kb-dir=C:\\\\\\\\path\\\\\\\\to\\\\\\\\kb

```



\- Load all selected sources successfully before declaring startup ready.

\- Do not publish a partially loaded KB after a startup failure.

\- Runtime source changes are transactional: successful replacement or preservation of the previous active generation.

\- Include generation checks for concurrent load/unload requests.

\- Keep CLI external-path support separate from the browser’s restricted source catalog.

\- Default to local use; do not add unauthenticated remote administration.



Provide read-only browsing/query APIs and explicit load/unload endpoints. Suggested paths:



| Endpoint | Purpose |

|---|---|

| `GET /api/status` | Current generation, files, counts, warnings, timing/cache information |

| `GET /api/search` | Paginated semantic term search |

| `GET /api/predicates` | Paginated predicate signatures |

| `GET /api/term` | Term details and assertions |

| `GET /api/microtheory` | All assertions in one MT |

| `GET /api/assertion` | Assertion/provenance by stable ID |

| `GET /api/kb/catalog` | Repository-root `KBs\\\\\\\\` source tree |

| `POST /api/kb/load` | Load an explicit selected source set |

| `POST /api/kb/unload` | Remove one active source |

| `POST /api/query` | Safe bounded query with explicit context/proof results |

| `GET /api/source` | Authorized read-only source excerpt |

| `GET /api/mappings` | Markdown-driven mappings |

| `GET /api/version` | Web-source version for live reload |



Validate pagination and inputs; use consistent structured errors.



\## 15. Browser



\### Main experience



Provide a responsive Cyc-style interface with:



\- Overview and statistics.

\- Search.

\- Predicate catalog.

\- Term details and assertion-role views.

\- MT pages.

\- Source selection.

\- Loaded files.

\- Query console and proofs.

\- SUMO-to-CycL mapping table.

\- Source/provenance inspection.



No external framework is necessary.



\### Expression rendering



Render KB content as S-expressions, not Prolog syntax.



Clip `x\\\\\\\_` from visible semantic symbol labels.



Every `x\\\\\\\_\\\\\\\*` semantic symbol—including nested predicate/function heads and constants—must be a clickable canonical term link.



Variables, strings, numbers, and punctuation remain plain text.



Use a shared structured renderer/token representation, not regex replacement over HTML.



Pretty-print nested logical formulas:



```lisp

(implies

\\\&#x20; (and

\\\&#x20;   (isa ?X Human)

\\\&#x20;   (relatedTo ?X ?Y))

\\\&#x20; (isa ?Y Thing))

```



\- Two-space indentation.

\- Compact shallow leaf expressions.

\- Final closing parentheses stay on the final expression line.

\- No lines containing only closing parentheses.

\- Preserve whitespace safely without causing horizontal page overflow.

\- Preserve original variable spellings from metadata.

\- Escape strings and HTML correctly.

\- Use the same layout for assertion cards, compound-term details, bindings, and proofs.

\- Hide instrumentation completely.

\- Predicate arity equals the actual semantic argument count.

\- Do not subtract one: MT is no longer an argument.

\- For `t/N`, exclude only its predicate-position slot from semantic arity.



\### MT grouping



Group adjacent source-ordered assertions into collapsible MT blocks.



\- State the clipped, linked MT once before each block.

\- Do not show MT inside every expression.

\- Preserve source/file/line order.

\- Start a fresh block when the MT changes.

\- Handle pagination beginning in the middle of a block.

\- Clicking an MT opens its paginated complete assertion list.

\- MT-only context occurrences must not inflate normal term rankings.



\### Sources tree



Root browser selection strictly at repository `KBs\\\\\\\\`.



\- Show supported original files and directories.

\- Hide generated companions, indexes, claims, locks, and temporary files.

\- Checkbox selection of a directory selects all supported descendant files.

\- Individual descendants can be unchecked before loading.

\- Parent checkboxes are checked, unchecked, or indeterminate.

\- Clicking an indeterminate parent selects all.

\- Expand/collapse is a separate control.

\- Selection edits are a draft until Load succeeds.

\- Submit concrete deduplicated file paths, not directories that could re-add excluded files.

\- Initialize selection from the server’s active concrete manifest.

\- Avoid quadratic descendant DOM scans.

\- Support keyboard access and meaningful ARIA labels.



Reject traversal and symlink/junction/reparse escapes with native, efficient checks.



\### Loaded files and removal



Each loaded file has an accessible `\\\\\\\[x]` unload control.



\- Unload only that source from memory.

\- Do not delete source, compiled cache, or semantic cache.

\- Reuse remaining-source caches.

\- Prevent double submission and use generation checks.

\- Preserve prior state on failure.

\- Refresh statistics, predicates, and current page appropriately.

\- Allow unloading the last file.

\- An empty loaded KB is valid and offers a link to KB Sources.

\- Do not automatically reload tinyKB after the last-file removal; restart defaults are separate.



\### Line counts and size fallback



Show cached source line counts beside files in the tree and loaded list.



\- Count original sources, not companions.

\- Use an internal streaming counter, not external `wc`.

\- Cache by validated source identity.

\- Do not rescan unchanged files per request.

\- Bound uncached counting to approximately one second per file.

\- Use a cheap size precheck or bounded overall catalog budget so many huge files cannot stall the page.

\- If counting exceeds the budget, show size in KB instead.

\- Cache that fallback until the source changes.

\- Distinguish `lineCount` from `sizeBytes` explicitly in the API.



\### Provenance links



\- Source file/line links open authorized read-only excerpts with the correct line highlighted.

\- Mapping IDs link to the corresponding Markdown-backed mapping row.

\- Assertion IDs can link to assertion detail.

\- Preserve inspectable Cyc properties.

\- Unknown/unresolvable references appear as text, not broken or unsafe links.

\- Never use provenance to navigate arbitrary filesystem paths or execute commands.



\### Static assets and live reload



\- Serve HTML/CSS/JS with correct status and MIME types.

\- Avoid absolute-path/static-handler mistakes that leave the page unstyled.

\- Disable stale asset caching.

\- Use dependency-free source-version polling for web changes.

\- Seed the initial version without a reload loop.

\- Auto-refresh when HTML/CSS/JS changes.

\- Include the mapping Markdown in applicable versioning.

\- Pause unnecessary polling while hidden and recover from transient failures.

\- Prolog source changes still require an explicit supported reload/restart; do not pretend browser refresh reloads backend modules.



\## 16. SUMO-to-CycL mapping policy



Create `docs\\\\\\\\sumo-cycl-mapping.md` from the appendix below.



It is the sole canonical mapping source for both compilation and the searchable browser table. Do not maintain a duplicate hand-edited Prolog mapping list.



\### Dialect policy



\- `.krf`: no mapping rows, ever.

\- `.metta`: no mapping rows, ever.

\- SUMO `.kif`: apply all matching rows, including explicitly labeled guesses.

\- Pass-through Cyc-style `.kif`: apply only rows wrapped in `global(...)`.

\- Explicit `#$Target` spellings bypass SUMO remapping.

\- Recognize bundled SUMO files such as `tinyKB.kif`, `Merge.kif`, `engformat.kif`, SUMO-OBO paths, SUMO filenames, and the SUMO header.

\- Support a leading `;; logos: sumo-mappings` opt-in for custom KIF.

\- Never let this detection override the KRF/MeTTa exclusion.

\- Exact `<===` executable syntax is a compiler rule, not an approximate mapping row.



Apply transformations recursively and once per original expression. Do not cascade output symbols through another mapping.



\### Mismatch handling



A mapping applies only when its declared shape matches.



On a KIF mapping arity/shape mismatch:



\- Preserve the original head under ordinary `x\\\\\\\_` normalization.

\- Preserve argument order.

\- Independently transform nested children only when their own mappings match.

\- Do not partially apply target renames, permutations, projections, or insertions.

\- Emit a source-located warning immediately and preserve the assertion.

\- `--strict-mappings` makes it fatal.

\- Keep warnings in cache metadata so warm loads report them consistently.



Malformed mapping DSL, invalid table schema, source syntax errors, and internal transformation failures remain real errors.



\### Executable conversion DSL



Use a strict data parser, not arbitrary evaluation.



\- `rename(Target,Shape)`: rename a symbol/head; preserve argument order.

\- Shapes: `constant`, integer arity, `variadic(Min)`, `one\\\\\\\_of(\\\\\\\[Arities...])`, `any`.

\- `template(SymbolTarget,ApplicationTarget,SourceArity,Args)`: explicit application rewrite.

\- `arg(N)`: one-based original argument selection.

\- `fixed(atom(Value))`, `fixed(number(Value))`, `fixed(string(Value))`: typed fixed insertion.

\- `indexed\\\\\\\_template(SymbolTarget,Prefix,IndexPosition,Suffix,SourceArity,Args)`: generate targets such as `arg2Isa` from a positive integer position. A variable position retains the generic relation and original argument sequence.

\- `quantifier(Target)`: convert a valid binder/formula pair, including variable lists, into nested single-binder forms while preserving scope.

\- `predicate\\\\\\\_application(SymbolTarget,PredicatePosition,Shape)`: remove a predicate-application wrapper and dispatch the selected source predicate through its own valid conversion; variable/compound predicates use `t/N`.

\- `global(Spec)`: applies to both mapped and pass-through KIF only.



Validate duplicate IDs, ambiguous source rules, target collisions, conversion chains, invalid positions, malformed Markdown, and unsupported specifications.



Do not interpret free-form Notes as executable instructions.



\### Mapping browser



Provide:



\- Search across SUMO/CycL symbols, notes, conversion, and provenance.

\- Category, equivalence, confidence, and evidence/guess filters.

\- Deterministic pagination.

\- URL-backed filter state.

\- Safe literal `#$` rendering and copy controls.

\- Clear approximate/transform labels.

\- Links to available source or converted terms; otherwise plain text.

\- Loading, empty, and error states.



The user approved applying guesses, but the UI must never imply that approval makes them authoritative ontology equivalences.



\## 17. Canonical Markdown mapping table



Save this section as `docs\\\\\\\\sumo-cycl-mapping.md`.



References below are retained review provenance. Verify them against the supplied corpus where needed; do not fabricate missing evidence. “Broader” and “narrower” describe the CycL target relative to SUMO.



| ID | SUMO | CycL | Conversion | Category | Equivalence | Confidence | Basis | Notes / provenance |

|---|---|---|---|---|---|---|---|---|

| entity-thing | `Entity` | `#$Thing` | `rename('Thing',constant)` | class | close | high | evidence | Universal top concepts; not asserted ontology identity. tinyKB:554; BaseKB-IKB:122411. |

| class-collection | `Class` | `#$Collection` | `rename('Collection',constant)` | class | close | high | evidence | Intensional classes/collections; metamodels differ. tinyKB:1422; BaseKB-IKB:270862. |

| setorclass-setorcollection | `SetOrClass` | `#$SetOrCollection` | `rename('SetOrCollection',constant)` | class | close | medium | guess | Curated guess; includes extensional sets as well as classes. BaseKB-IKB:40126; source term absent from the initial tinyKB. |

| relation-relation | `Relation` | `#$Relation` | `rename('Relation',constant)` | class | close | medium | evidence | Shared relation concept; arity/reification conventions differ. tinyKB:1437; BaseKB-IKB relation vocabulary. |

| predicate-predicate | `Predicate` | `#$Predicate` | `rename('Predicate',constant)` | class | close | medium | evidence | Sentence-forming relations with different surrounding type systems. tinyKB:2186; BaseKB-IKB:233316. |

| instance-isa | `instance` | `(#$isa ?TERM ?CLASS)` | `rename(isa,2)` | predicate | exact | high | evidence | Individual first, class second. tinyKB:90–97; BaseKB-IKB:158436. |

| subclass-genls | `subclass` | `(#$genls ?NARROW ?BROAD)` | `rename(genls,2)` | predicate | exact | high | evidence | Narrower class first. tinyKB:115–128; BaseKB-IKB:110477. |

| subrelation-genlpreds | `subrelation` | `(#$genlPreds ?NARROW ?BROAD)` | `rename(genlPreds,2)` | predicate | exact | high | evidence | Same argument order and tuple-preservation intent. tinyKB:130–139; BaseKB-IKB:220043. |

| valence-arity | `valence` | `(#$arity ?REL ?N)` | `rename(arity,2)` | predicate | broader | high | evidence | SUMO count is positive; Cyc permits nonnegative. Correct spelling is valence. tinyKB/Merge:263–272; BaseKB-IKB:33175,56083,298779. |

| disjoint-disjointwith | `disjoint` | `(#$disjointWith ?CLASS1 ?CLASS2)` | `rename(disjointWith,2)` | predicate | close | high | evidence | No shared instances; context policies may differ. tinyKB:284–299; BaseKB-IKB:78921. |

| equal-equals | `equal` | `(#$equals ?TERM1 ?TERM2)` | `rename(equals,one\\\\\\\_of(\\\\\\\[1,2]))` | predicate | close | high | evidence | Normally binary. Unary legacy occurrence is preserved as an anomaly, not repaired. tinyKB:190–210,7487; BaseKB-IKB:79610. |

| part-parts | `part` | `(#$parts ?WHOLE ?PART)` | `template(parts,parts,2,\\\\\\\[arg(2),arg(1)])` | predicate | transform | high | evidence | Reverse part/whole order. tinyKB:608–617; BaseKB-IKB:298707. |

| attribute-hasattributes | `attribute` | `(#$hasAttributes ?OBJECT ?ATTRIBUTE)` | `rename(hasAttributes,2)` | predicate | broader | medium | evidence | Target broader; specialized predicates may be preferable. tinyKB:1093–1100; BaseKB-IKB:263685. |

| documentation-comment | `documentation` | `(#$comment ?TERM ?TEXT)` | `rename(comment,one\\\\\\\_of(\\\\\\\[1,2]))` | predicate | close | high | evidence | Normally binary; preserve known unary anomaly without inventing an argument. tinyKB:274–282,9049; BaseKB-IKB:295409. |

| domain-argnisa | `domain` | `(#$arg<N>Isa ?REL ?CLASS)` | `indexed\\\\\\\_template(argIsa,arg,2,'Isa',3,\\\\\\\[arg(1),arg(3)])` | transform | transform | high | evidence | Positive integer N selects argNIsa. Variable N uses generic argIsa with original arguments. tinyKB:167–179; BaseKB-IKB:83131,266283. |

| domainsubclass-argngenl | `domainSubclass` | `(#$arg<N>Genl ?REL ?CLASS)` | `indexed\\\\\\\_template(argGenl,arg,2,'Genl',3,\\\\\\\[arg(1),arg(3)])` | transform | transform | high | evidence | Collection-valued argument restriction. Variable N uses generic argGenl. tinyKB:181–188; BaseKB-IKB:164590,313576. |

| range-resultisa | `range` | `(#$resultIsa ?FUNCTION ?CLASS)` | `rename(resultIsa,2)` | transform | transform | high | evidence | Function result, not the last argument of an arbitrary relation. tinyKB:212–225; BaseKB-IKB:94574. |

| rangesubclass-resultgenl | `rangeSubclass` | `(#$resultGenl ?FUNCTION ?CLASS)` | `rename(resultGenl,2)` | transform | transform | high | evidence | Collection-denoting function result. tinyKB:227–239; BaseKB-IKB:177156. |

| and-and | `and` | `(#$and ?FORMULA1 ?FORMULA2 ...)` | `rename(and,variadic(2))` | logical | exact | high | evidence | Preserve operand order. tinyKB:471–474; BaseKB-IKB:278804. |

| or-or | `or` | `(#$or ?FORMULA1 ?FORMULA2 ...)` | `rename(or,variadic(2))` | logical | exact | high | evidence | Logical disjunction. tinyKB:476–479; BaseKB-IKB:347546. |

| not-not | `not` | `(#$not ?FORMULA)` | `rename(not,1)` | logical | exact | high | evidence | Logical negation, not automatic Prolog negation-as-failure. tinyKB:491–493; BaseKB-IKB:37189. |

| implication-implies | `=>` | `(#$implies ?ANTECEDENT ?CONSEQUENT)` | `global(rename(implies,2))` | operator | exact | high | evidence | KIF formula mapping; not executable-rule compilation. KRF retains the operator. tinyKB:481–484; BaseKB-IKB:108907. |

| biconditional-equiv | `<=>` | `(#$equiv ?LEFT ?RIGHT)` | `global(rename(equiv,2))` | operator | exact | high | evidence | KIF bi-implication. tinyKB:486–489; BaseKB-IKB:356361–356363. |

| backward-rule-operator | `<==` | `<==` | `global(rename('<==',any))` | operator | transform | high | evidence | Identity preservation only. TWO equals remains operator data, distinct from executable THREE-equals `<===`. Never implies or committed choice. Corpus examples: games.krf:172–174. |

| forall-forall | `forall` | `(#$forAll ?VAR ?FORMULA)` | `global(quantifier(forAll))` | operator | transform | high | evidence | Valid KIF binder lists become nested single-binder forms. tinyKB:108–113; BaseKB-IKB:343091. |

| exists-thereexists | `exists` | `(#$thereExists ?VAR ?FORMULA)` | `global(quantifier(thereExists))` | operator | transform | high | evidence | Only matching binder/formula shapes convert. No KRF mapping. tinyKB:619–622; BaseKB-IKB:112038–112058. |

| binarypredicate-binarypredicate | `BinaryPredicate` | `#$BinaryPredicate` | `rename('BinaryPredicate',constant)` | class | close | high | guess | Curated name-and-semantics guess. tinyKB:2309–2312; BaseKB-IKB:251316. |

| unaryfunction-unaryfunction | `UnaryFunction` | `#$UnaryFunction` | `rename('UnaryFunction',constant)` | class | close | high | guess | Curated guess for unary denotational functions. tinyKB:2201–2204; BaseKB-IKB:342212. |

| transitiverelation-transitivebinarypredicate | `TransitiveRelation` | `#$TransitiveBinaryPredicate` | `rename('TransitiveBinaryPredicate',constant)` | class | close | high | guess | Cyc target explicitly binary. tinyKB:1542–1543; BaseKB-IKB:20666. |

| symmetricrelation-symmetricbinarypredicate | `SymmetricRelation` | `#$SymmetricBinaryPredicate` | `rename('SymmetricBinaryPredicate',constant)` | class | close | high | guess | Curated symmetry correspondence. tinyKB:1494–1495; BaseKB-IKB:270372. |

| asymmetricrelation-asymmetricbinarypredicate | `AsymmetricRelation` | `#$AsymmetricBinaryPredicate` | `rename('AsymmetricBinaryPredicate',constant)` | class | close | high | guess | Curated asymmetry correspondence. tinyKB:1507–1509; BaseKB-IKB:58807. |

| reflexiverelation-reflexivebinarypredicate | `ReflexiveRelation` | `#$ReflexiveBinaryPredicate` | `rename('ReflexiveBinaryPredicate',constant)` | class | close | high | guess | Argument-type conventions may differ. tinyKB:1475–1476; BaseKB-IKB:218800. |

| irreflexiverelation-irreflexivebinarypredicate | `IrreflexiveRelation` | `#$IrreflexiveBinaryPredicate` | `rename('IrreflexiveBinaryPredicate',constant)` | class | close | high | guess | Curated irreflexivity correspondence. tinyKB:1484–1485; BaseKB-IKB:268419. |

| object-partiallytangible | `Object` | `#$PartiallyTangible` | `rename('PartiallyTangible',constant)` | class | close | medium | guess | Physical-individual boundaries differ. tinyKB:587–602; BaseKB-IKB:258211. |

| process-event | `Process` | `#$Event` | `rename('Event',constant)` | class | close | high | guess | Occurrences through time; situation boundaries differ. tinyKB:1031–1032; BaseKB-IKB:22725. |

| agent-agent-class | `Agent` | `#$Agent` | `rename('Agent',constant)` | class | close | high | guess | Context-sensitive conceptual overlap. tinyKB:1006–1007; BaseKB-IKB:127748. |

| human-humanbeing | `Human` | `#$HumanBeing` | `rename('HumanBeing',constant)` | class | close | high | guess | Curated target-name proposal. tinyKB:8872–8874; verify target semantics. |

| organism-organismwhole | `Organism` | `#$Organism-Whole` | `rename('Organism-Whole',constant)` | class | close | high | guess | Whole-organism emphasis. tinyKB:8559–8561; BaseKB-IKB:146143. |

| animal-animal | `Animal` | `#$Animal` | `rename('Animal',constant)` | class | close | high | guess | Biological alignment remains proposed. tinyKB:8657–8658; BaseKB-IKB:328944. |

| artifact-artifactgeneric | `Artifact` | `#$Artifact-Generic` | `rename('Artifact-Generic',constant)` | class | close | medium | guess | Intentionally made objects; target requires review. tinyKB:9526–9527. |

| device-physicaldevice | `Device` | `#$PhysicalDevice` | `rename('PhysicalDevice',constant)` | class | close | high | guess | Designed-use artifacts. tinyKB:9630–9631; BaseKB-IKB:68795. |

| weapon-weapon | `Weapon` | `#$Weapon` | `rename('Weapon',constant)` | class | close | high | guess | Purpose-based correspondence. tinyKB:9656–9657; BaseKB-IKB:110051. |

| vehicle-transportationdevice | `Vehicle` | `#$TransportationDevice` | `rename('TransportationDevice',constant)` | class | close | medium | guess | Target may include additional conveyances. tinyKB Vehicle vocabulary; BaseKB-IKB:235697. |

| building-building | `Building` | `#$Building` | `rename('Building',constant)` | class | close | high | guess | Formal boundary conditions may differ. tinyKB:9587–9588; BaseKB-IKB:363838. |

| geographicarea-geographicalregion | `GeographicArea` | `#$GeographicalRegion` | `rename('GeographicalRegion',constant)` | class | close | high | guess | Mappable regions; geopolitical modeling differs. tinyKB:8427–8429; BaseKB-IKB:35467. |

| nation-country | `Nation` | `#$Country` | `rename('Country',constant)` | class | close | medium | guess | Nation/state/country are not identical. tinyKB:8510–8512; BaseKB-IKB:312826. |

| city-city | `City` | `#$City` | `rename('City',constant)` | class | close | high | guess | Settlement/legal criteria may differ. tinyKB:8535–8537; BaseKB-IKB:94992. |

| timeposition-temporalthing | `TimePosition` | `#$TemporalThing` | `rename('TemporalThing',constant)` | class | broader | medium | guess | Target broader than temporal points/intervals. tinyKB:1367–1369; target chosen by semantics. |

| timeinterval-timeinterval | `TimeInterval` | `#$TimeInterval` | `rename('TimeInterval',constant)` | class | close | high | guess | Endpoint/granularity conventions require review. tinyKB:1373–1374; BaseKB-IKB:311785. |

| year-calendaryear | `Year` | `#$CalendarYear` | `rename('CalendarYear',constant)` | class | close | high | guess | Calendar-system assumptions may differ. tinyKB:5752–5755; BaseKB-IKB:259559. |

| month-calendarmonth | `Month` | `#$CalendarMonth` | `rename('CalendarMonth',constant)` | class | close | high | guess | Calendar-system assumptions may differ. tinyKB:5783–5785; BaseKB-IKB:184234. |

| day-calendarday | `Day` | `#$CalendarDay` | `rename('CalendarDay',constant)` | class | close | high | guess | Day-boundary conventions may differ. tinyKB:5952–5955; BaseKB-IKB:155505. |

| organization-organization | `Organization` | `#$Organization` | `rename('Organization',constant)` | class | close | high | guess | Membership/legal criteria differ. tinyKB:9848–9849; BaseKB-IKB:166432. |

| group-group | `Group` | `#$Group` | `rename('Group',constant)` | class | close | low | guess | SUMO Group combines collection/agent aspects; Cyc distinguishes groups from collections. tinyKB:9782–9784; BaseKB-IKB:226694. |

| language-language | `Language` | `#$Language` | `rename('Language',constant)` | class | close | high | guess | Conventional symbol systems. tinyKB:905–907; BaseKB-IKB:87775. |

| formula-cycformula | `Formula` | `#$CycFormula` | `rename('CycFormula',constant)` | class | close | high | guess | Well-formed formula classes; language syntax differs. tinyKB:998–999; BaseKB-IKB:220319. |

| set-setmathematical | `Set` | `#$Set-Mathematical` | `rename('Set-Mathematical',constant)` | class | close | high | guess | Extensional mathematical sets. tinyKB:2375–2376; BaseKB-IKB:299922. |

| proposition-proposition | `Proposition` | `#$Proposition` | `rename('Proposition',constant)` | class | close | medium | guess | Formula/content distinctions require review. tinyKB:2386–2387; target chosen by name. |

| contentbearingobject-informationbearingthing | `ContentBearingObject` | `#$InformationBearingThing` | `rename('InformationBearingThing',constant)` | class | close | high | guess | Information bearers; representation boundaries differ. tinyKB:838–841; target chosen by semantics. |

| member-groupmembers | `member` | `(#$groupMembers ?GROUP ?MEMBER)` | `template(groupMembers,groupMembers,2,\\\\\\\[arg(2),arg(1)])` | transform | transform | high | guess | Reverse member/group order. tinyKB:817–828; BaseKB-IKB:143396. |

| containsinformation-containsinformation | `containsInformation` | `(#$containsInformation ?BEARER ?CONTENT)` | `rename(containsInformation,2)` | predicate | close | high | guess | Same order; content ontologies differ. tinyKB:865–874; BaseKB-IKB:179271. |

| agent-performedby | `agent` | `(#$performedBy ?PROCESS ?AGENT)` | `rename(performedBy,2)` | predicate | narrower | medium | guess | Target emphasizes deliberate performance. tinyKB:1606–1614; BaseKB-IKB:151687. |

| patient-objectactedon | `patient` | `(#$objectActedOn ?PROCESS ?ENTITY)` | `rename(objectActedOn,2)` | predicate | narrower | medium | guess | Target emphasizes affected focal objects. tinyKB:1660–1670; BaseKB-IKB:146722. |

| instrument-deviceused | `instrument` | `(#$deviceUsed ?PROCESS ?TOOL)` | `rename(deviceUsed,2)` | predicate | narrower | medium | guess | Target restricted to devices. tinyKB:1641–1648; BaseKB-IKB:260328. |

| destination-tolocation | `destination` | `(#$toLocation ?PROCESS ?GOAL)` | `rename(toLocation,2)` | predicate | narrower | medium | guess | Target is movement/location-specific. tinyKB:1621–1630; BaseKB-IKB:260618. |

| origin-fromlocation | `origin` | `(#$fromLocation ?PROCESS ?SOURCE)` | `rename(fromLocation,2)` | predicate | narrower | medium | guess | Target is movement/location-specific. tinyKB:1650–1658; BaseKB-IKB:247652. |

| causes-causeseventevent | `causes` | `(#$causes-EventEvent ?CAUSE ?EFFECT)` | `rename('causes-EventEvent',2)` | predicate | narrower | medium | guess | Token-event causation versus broader situations. tinyKB:2557–2561; BaseKB-IKB:200027. |

| located-inregion | `located` | `(#$inRegion ?OBJECT ?REGION)` | `rename(inRegion,2)` | predicate | close | medium | guess | Boundary/temporal policies differ. tinyKB:2747–2752; BaseKB-IKB:217582. |

| during-temporallysubsumes | `during` | `(#$temporallySubsumes ?OUTER ?INNER)` | `template(temporallySubsumes,temporallySubsumes,2,\\\\\\\[arg(2),arg(1)])` | transform | transform | high | guess | Reverse arguments; SUMO also requires strict containment. tinyKB:5460–5473; BaseKB-IKB:171354. |

| overlapstemporally-temporallyintersects | `overlapsTemporally` | `(#$temporallyIntersects ?INTERVAL1 ?INTERVAL2)` | `rename(temporallyIntersects,2)` | predicate | close | high | guess | Shared temporal point; inference properties need review. tinyKB:5436–5452; BaseKB-IKB:262623. |

| subprocess-subevents | `subProcess` | `(#$subEvents ?PROCESS ?SUBPROCESS)` | `template(subEvents,subEvents,2,\\\\\\\[arg(2),arg(1)])` | transform | transform | high | guess | Reverse subprocess/whole-event order. tinyKB:6685–6691; BaseKB-IKB:313339. |

| represents-represents | `represents` | `(#$represents ?REPRESENTATION ?THING)` | `rename(represents,2)` | predicate | close | medium | guess | Proposed same-order semiotic relation. tinyKB:2927–2931; target chosen by name/semantics. |

| holds-predicate-application | `holds` | `(?PREDICATE ?ARG1 ...)` | `predicate\\\\\\\_application(holds,1,variadic(2))` | transform | transform | high | evidence | Remove wrapper, apply selected predicate; variable/compound heads use t/N. tinyKB:511–528. |

| holdsduring-holdsin | `holdsDuring` | `(#$holdsIn ?TIME ?FORMULA)` | `rename(holdsIn,2)` | predicate | close | high | guess | Same order; temporal/contextual inference policies differ. tinyKB:2598–2602; BaseKB-IKB:347540. |



\## 18. Required validation



Use real integration tests, not only mocked representations.



At minimum prove:



1\. Fresh KIF/KRF/MeTTa compilation produces the specified one-line format.

2\. Real variables and sharing survive write/read/native-load roundtrips.

3\. `xc\\\\\\\_kb\\\\\\\_names` retains sigils and `\\\\\\\[]`.

4\. Both loader headers produce real native file/line clause properties.

5\. Native reload/unload is duplicate-free and cleans handles.

6\. Same source occurrence reuses its ID across warm/forced recompilation.

7\. Concurrent allocators do not collide.

8\. KRF never receives SUMO mappings.

9\. MeTTa remains inert and has correct list/dict interpretation.

10\. `<===` executes through `x\\\\\\\_cid\\\\\\\_io`; `<==` stays distinct data.

11\. Rule head/body-only variable groups are correct.

12\. MT isolation covers rules and facts.

13\. Proof traces exclude failed alternatives and clean up after exceptions/timeouts.

14\. Provenance comments and legacy annotations remain readable.

15\. New generated metadata contains actual terms, not comments.

16\. Mapping transforms, mismatches, strict mode, and original-source preservation work.

17\. Two real compiler processes obey early locks and busy skipping.

18\. Interrupted writes never expose a partial final `.pl`.

19\. Recovery modes affect only eligible abandoned work.

20\. A warning is visible on `stderr` before a later long-running file finishes.

21\. Normal batch compilation continues after first/middle-file failures.

22\. `--edit` prompts before launch, distinguishes Enter/s/S/q, and reuses good caches.

23\. Actual Windows `edit.exe` runs visibly in the same console and retries after closing.

24\. Cached line counts and size fallback avoid repeated expensive catalog reads.

25\. Browser assets load correctly and expressions preserve indentation and links.

26\. Source-tree parent/child selection, unload-last-file, MT navigation, and pagination work.

27\. Derived constant indexes exclude instrumentation and preserve nested symbols.

28\. Fresh and warm tinyKB startup/search timings are measured.

29\. Original corpus bytes remain unchanged.

30\. Each completed stage is committed directly on `master`.



\## 19. Implementation sequence



Deliver bounded, working stages:



1\. Final-format vertical slice: reader, IDs, metadata, guarded facts/formulas, exact `<===` compilation, native loader, and minimal context-aware runtime.

2\. Offline compiler with mappings, all source dialects, persistent caches, streaming diagnostics, progress, editor repair, claims, and recovery.

3\. Persistent semantic/constant indexes and transactional runtime source management.

4\. Complete browser/API, provenance links, mappings page, and live reload.

5\. Integrated correctness, concurrency, performance, and native-editor validation.



Prefer one shared implementation for each concern. Avoid parallel incompatible readers, duplicated mapping tables, placeholder runtime hooks, and layers added solely to imitate the abandoned implementation.



Announce \*\*“CLI READY TO TRY”\*\* with the commit and exact command once the real compiler can generate stable final-format output and its required downstream readers work. Do not delay that milestone for cosmetic browser work, but do not declare readiness for an incompatible partial migration.



Finish all stages and leave concise documentation explaining commands, formats, supported dialects, metadata, recovery, querying, and any genuine limitations.

