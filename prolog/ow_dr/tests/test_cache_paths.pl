:- begin_tests(cache_paths).

:- use_module('../kb_paths').
:- use_module('../kb_compile').
:- use_module('../kb_cache').
:- use_module('../kb_index').
:- use_module('../kb_runtime', []).
:- use_module('../kb_store', []).
:- use_module('../kb_inventory', []).
:- use_module('../kb_inventory_links', []).
:- use_module('../kb_qlf', []).
:- use_module(library(filesex)).
:- use_module(library(process)).
:- use_module(library(readutil)).
:- use_module(library(uuid)).

fixture(Repo, OldApp) :-
    app_dir(OldApp), uuid(Token),
    directory_file_path(OldApp, tests, Tests),
    directory_file_path(Tests, artifacts, Artifacts),
    directory_file_path(Artifacts, Token, Repo),
    directory_file_path(Repo, prolog, Prolog),
    directory_file_path(Prolog, ow_dr, App), make_directory_path(App),
    kb_compile:implementation_files(Implementation),
    forall(member(Name, ['windows_catalog.ps1'|Implementation]),
      (directory_file_path(OldApp, Name, From),
       directory_file_path(App, Name, To), copy_file(From, To))),
    directory_file_path(Repo, 'KBs', KBs), make_directory_path(KBs),
    retractall(kb_paths:app_directory(_)), assertz(kb_paths:app_directory(App)).

cleanup(Repo, OldApp) :-
    retractall(kb_paths:app_directory(_)), assertz(kb_paths:app_directory(OldApp)),
    retractall(kb_inventory:rollup(_,_,_,_,_)),
    retractall(kb_inventory_links:source_projection(_,_,_)),
    delete_directory_and_contents(Repo).

source(Directory, Name, Text, File) :-
    directory_file_path(Directory, Name, File),
    file_directory_name(File, Parent), make_directory_path(Parent),
    setup_call_cleanup(open(File, write, S, [encoding(utf8),newline(posix)]),
                       format(S, '~s', [Text]), close(S)).

options(Repo, [state_dir(State),progress(none),diagnostics(false)]) :-
    directory_file_path(Repo, state, State).

canonical(Path, Absolute) :- absolute_file_name(Path, Absolute, [access(none)]).
ids(Records, Ids) :- findall(Id, member(record(Id,_,_), Records), Ids).
marker(File, Marker) :-
    cache_paths(File, Normal, _), atom_concat(Normal, '.tmp', Marker),
    file_directory_name(Marker, Parent), make_directory_path(Parent),
    setup_call_cleanup(open(Marker, write, S),
                       write_one_line(S, kb_compile_claim(1,File,0,0)), close(S)).

test(roots_default_and_inverse, [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), cache_source_base(KBs, Cache), cache_root(Cache),
    directory_file_path(R, tmp, Tmp),
    directory_file_path(Tmp, 'KBs', ExpectedCache), canonical(ExpectedCache, Cache),
    directory_file_path(Tmp, runtime, ExpectedRuntime),
    canonical(ExpectedRuntime, Runtime), runtime_root(Runtime),
    default_source(Default),
    file_base_name(Default, 'tinyKB.kif'),
    file_directory_name(Default, Sumo), file_base_name(Sumo, sumo),
    cache_source_base(Default, Base), cache_paths(Default, Normal, Index),
    atom_concat(Base, '.data', Normal), atom_concat(Base, '.index.data', Index),
    cache_original_source(Base, Original), canonical(Default, Original).

test(canonical_case_and_cwd_independence,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    cache_paths('KBs/sumo/tinyKB.kif', Normal, Index),
    app_dir(App),
    setup_call_cleanup(working_directory(Old, App),
      (cache_paths('KBs/sumo/../sumo/tinyKB.kif', Normal, Index),
       (current_prolog_flag(windows,true)->
         cache_paths('kBs\\SuMo\\TinYKB.KIF', Normal, Index);true)),
      working_directory(_, Old)).

test(non_kbs_and_boundary_paths_remain_adjacent,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    forall(member(Relative, ['fixtures/example.krf','KBs-other/example.kif']),
      (directory_file_path(R, Relative, File), canonical(File, Base),
       cache_source_base(File, Base), cache_original_source(Base, Base),
       cache_paths(File, Normal, Index),
       atom_concat(Base, '.data', Normal), atom_concat(Base, '.index.data', Index))).

test(dialects_compile_in_mirror_without_adjacent_companions,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    forall(member(Name-Text-Semantic, [
        'sumo/tinyKB.kif'-"(instance Fido Dog)\n"-x_isa(x_Fido,x_Dog),
        'ikb/example.krf'-"(instance Fido Class)\n"-x_instance(x_Fido,x_Class),
        'examples/data.meld'-"(instance Fido Class)\n"-x_instance(x_Fido,x_Class),
        'examples/data.metta'-"!(run a)\n"-metta_exec(x_run(x_a)),
        'examples/custom.data'-"(p a)\n"-x_p(x_a)]),
      (source(KBs, Name, Text, File), file_digest(File, Before),
       compile_source(File, Options, Result), assertion(Result.status==generated),
       cache_paths(File, Result.normalized, Result.index),
       read_cache(Result.normalized, Header, [record(Id,Actual,Metadata)]),
       assertion(Actual==Semantic), assertion(Header.normalizedFile==Result.normalized),
       assertion(memberchk(xc_kb_names(Id,[]),Metadata)),
       read_index(Result.index, _, _),
       atom_concat(File, '.data', Adjacent), assertion(\+exists_file(Adjacent)),
       atom_concat(File, '.index.data', AdjacentIndex), assertion(\+exists_file(AdjacentIndex)),
       atom_concat(Result.normalized, '.lock', Lock), assertion(exists_file(Lock)),
       source_artifacts(File, []), file_digest(File, Before))).

test(native_rules_warm_forced_ids_and_runtime_snapshot,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    source(KBs, 'scenarios/family.krf',
      "(in-microtheory FamilyMt)\n(parent alice bob)\n(parent bob carol)\n(<=== (grandparent ?X ?Y) (parent ?X ?Z) (parent ?Z ?Y))\n", File),
    compile_source(File, Options, Cold), read_cache(Cold.normalized, _, Records), ids(Records, Ids),
    compile_source(File, Options, Warm), assertion(Warm.status==cache_hit),
    compile_source(File, [force(true)|Options], Forced), assertion(Forced.status==generated),
    read_cache(Forced.normalized, _, Again), ids(Again, Ids),
    setup_call_cleanup(kb_runtime:native_load(Forced.normalized, cache_path_native),
      (kb_runtime:query_modules([cache_path_native], x_grandparent(x_alice,_), x_FamilyMt, 5, 3,
                               [solution(x_FamilyMt,[x_carol],_)]),
       once(kb_runtime:module_assertion(cache_path_native, _, _, Ref)),
       clause_property(Ref, file(NativeFile)), assertion(same_file(NativeFile,Forced.normalized)),
       clause_property(Ref, line_count(Line)), assertion(Line>1)),
      kb_runtime:native_unload(Forced.normalized)),
    kb_store:prepare_source(Forced, Prepared),
    setup_call_cleanup(kb_store:stage_source(Prepared, Entry),
      (Entry=entry(_,_,Module,Native,_,false),
       file_directory_name(Native, Snapshot), file_directory_name(Snapshot, Root),
       runtime_root(Root),
       kb_runtime:query_modules([Module], x_grandparent(x_alice,_), x_FamilyMt, 5, 3, [_])),
      kb_store:cleanup_staged([Entry])).

test(obsolete_normalized_origin_invalidates_without_reopening,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    source(KBs, 'examples/data.krf', "(p a)\n", File),
    compile_source(File, Options, Cold),
    read_cache(Cold.normalized, Header, Records), ids(Records, Ids),
    atom_concat(File, '.pl', Obsolete),
    write_cache(Cold.normalized, Header.put(normalizedFile,Obsolete), Records, _),
    assertion(\+exists_file(Obsolete)),
    compile_source(File, Options, Rebuilt), assertion(Rebuilt.status==generated),
    cache_paths(File, Rebuilt.normalized, Rebuilt.index),
    read_cache(Rebuilt.normalized, NewHeader, NewRecords), ids(NewRecords, Ids),
    assertion(NewHeader.normalizedFile==Rebuilt.normalized),
    compile_source(File, Options, Warm), assertion(Warm.status==cache_hit),
    assertion(Warm.normalized==Rebuilt.normalized).

test(recovery_promotes_only_selected_mirrored_stage,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    source(KBs, 'examples/data.krf', "(p a)\n", File),
    source(KBs, 'examples/unrelated.krf', "(invalid", Other),
    compile_source(File, Options, First), file_digest(First.normalized, Hash),
    stage_path(First.normalized, Stage), copy_file(First.normalized, Stage),
    delete_file(First.normalized), marker(File, Marker),
    source_artifacts(File, Artifacts), assertion(memberchk(Stage,Artifacts)),
    recover_sources([KBs,File], Options, Summary),
    assertion(Summary.generated==1), assertion(Summary.failures==0),
    Summary.results=[Recovered], assertion(same_file(Recovered.source,File)),
    assertion(Recovered.normalized==First.normalized),
    file_digest(Recovered.normalized, Hash),
    assertion(\+exists_file(Stage)), assertion(\+exists_file(Marker)),
    cache_paths(Other, OtherNormal, _), assertion(\+exists_file(OtherNormal)),
    recover_sources([KBs], Options, Empty), assertion(Empty.results==[]).

test(recovery_clean_final_force_and_nested_selection,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    source(KBs, 'examples/data.krf', "(p a)\n", File),
    source(KBs, 'scenarios/other.krf', "(p b)\n", Other),
    compile_source(File, Options, First), marker(File, Marker), marker(Other, OtherMarker),
    file_directory_name(First.normalized, CacheDirectory),
    source(CacheDirectory, 'notes.tmp', "keep", Unrelated),
    source(CacheDirectory, 'data.krf.data.stage.not-a-uuid', "keep", NotStage),
    source(CacheDirectory, 'unselected.txt.data.tmp', "keep", CustomMarker),
    file_directory_name(File, SelectedDirectory),
    recover_sources([SelectedDirectory], Options, Clean),
    assertion(Clean.cacheHits==1), assertion(Clean.generated==0),
    assertion(\+exists_file(Marker)), assertion(exists_file(OtherMarker)),
    marker(File, Marker),
    recover_sources([SelectedDirectory], [recovery(force)|Options], Forced),
    assertion(Forced.generated==1), assertion(Forced.cacheHits==0),
    assertion(exists_file(OtherMarker)), assertion(exists_file(Unrelated)),
    assertion(exists_file(NotStage)), assertion(exists_file(CustomMarker)).

test(explicit_custom_source_recovery,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    source(KBs, 'examples/facts.custom', "(p a)\n", File), marker(File, Marker),
    recover_sources([KBs], Options, NoMatch), assertion(NoMatch.results==[]),
    recover_sources([File], Options, Recovered), assertion(Recovered.generated==1),
    assertion(\+exists_file(Marker)).

test(missing_source_failure_and_deferred_paths,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    directory_file_path(KBs, 'gone.krf', Missing), marker(Missing, _),
    cache_paths(Missing, Normal, Index),
    recover_sources([KBs], Options, Summary),
    assertion(Summary.failures==1), assertion(Summary.exitCode==1),
    Summary.results=[Failed], assertion(Failed.normalized==Normal), assertion(Failed.index==Index),
    canonical(Missing, Failed.source),
    memberchk(state_dir(State),Options),directory_file_path(State,failures,Failures),
    directory_files(Failures,FailureNames),
    include(data_name,FailureNames,[_]),
    kb_compile:deferred_result(Missing, Deferred),
    assertion(Deferred.normalized==Normal), assertion(Deferred.index==Index).

data_name(Name) :- file_name_extension(_,data,Name).

test(mirrored_lock_is_busy_in_compile_and_recovery,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    source(KBs, 'examples/busy.krf', "(p a)\n", File), marker(File, Marker),
    cache_paths(File, Normal, Index), atom_concat(Normal, '.lock', Lock),
    setup_call_cleanup(hold_lock(Lock, Pid, In, Out),
      (compile_source(File, Options, Busy), assertion(Busy.status==busy),
       assertion(Busy.normalized==Normal), assertion(Busy.index==Index),
       recover_sources([KBs], Options, Summary),
       assertion(Summary.busy==1), assertion(Summary.exitCode==3),
       assertion(exists_file(Marker)), assertion(\+exists_file(Normal))),
      release_holder(Pid, In, Out)).

hold_lock(Lock, Pid, In, Out) :-
    source_file(plunit_cache_paths:hold_lock(_,_,_,_), Here),
    file_directory_name(Here, Tests), directory_file_path(Tests, 'test_concurrency.pl', Script),
    current_prolog_flag(executable, Exe),
    process_create(Exe, ['-q','-s',Script,'--',hold,Lock],
      [process(Pid),stdin(pipe(In)),stdout(pipe(Out)),stderr(std)]),
    read_line_to_string(Out, "ready").
release_holder(Pid, In, Out) :-
    format(In, 'release~n', []), flush_output(In), close(In), close(Out),
    process_wait(Pid, exit(0)).

test(inventory_reads_mirror_but_writes_statistics_beside_source,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    source(KBs, 'sumo/tinyKB.kif', "(instance a Class)\n", File),
    compile_source(File, Options, Compiled),
    directory_file_path(R, 'inventory.ndjson', Log),
    setup_call_cleanup(open(Log, write, S, [encoding(utf8)]),
      kb_inventory:inventory_one(S, File, Data), close(S)),
    assertion(Data.compiled.path==Compiled.normalized), assertion(Data.index.path==Compiled.index),
    assertion(Data.compiled.semanticClauseCount==1),
    Data.microtheories=[Context], Context.predicates=[Predicate],
    assertion(Predicate.name==x_isa),
    read_cache(Compiled.normalized, _, [record(_,x_isa(x_a,x_Collection),_)]),
    atom_concat(File, '.inventory.json', Adjacent),
    assertion(Data.sidecar.path==Adjacent), assertion(exists_file(Adjacent)),
    cache_source_base(File, Base), atom_concat(Base, '.inventory.json', Mirrored),
    assertion(\+exists_file(Mirrored)),
    directory_file_path(R, 'identities.ndjson', Identities),
    directory_file_path(R, 'candidates.pl', Candidates),
    setup_call_cleanup(open(Identities, write, IdentityStream, [encoding(utf8)]),
      setup_call_cleanup(asserta(kb_inventory_links:identity_stream(IdentityStream), Ref),
        setup_call_cleanup(open(Candidates, write, CandidateStream, [encoding(utf8)]),
          kb_inventory_links:project_source(File, CandidateStream), close(CandidateStream)),
        erase(Ref)),
      close(IdentityStream)),
    assertion(kb_inventory_links:source_projection(File,complete,[])).

test(qlf_discovers_mirrored_and_external_companions_without_parsing_sources,
     [setup(fixture(R,A)),cleanup(cleanup(R,A))]) :-
    kb_root(KBs), options(R, Options),
    findall(Normal,
      (member(Ext,[kif,krf,meld,metta]), atom_concat('sample.',Ext,Name),
       source(KBs, Name, "(p a)\n", File),
       compile_source(File, Options, Result), Normal=Result.normalized,
       source(KBs, Name, "(not readable", File),
       atom_concat(Name,'.pl',AdjacentName), source(KBs,AdjacentName,"not a cache",_)),
      Companions),
    sort(Companions, Expected), cache_root(Cache),
    kb_qlf:discover_companions([KBs,KBs], Expected),
    kb_qlf:discover_companions([Cache], Expected),
    kb_qlf:discover_companions([KBs,Cache], Expected),
    forall(member(Compiled, Expected),
      (kb_qlf:convert_companion(Compiled, [], Result), assertion(Result.status==generated),
       file_name_extension(Base,data,Compiled), file_name_extension(Base,qlf,Result.qlf),
       assertion(exists_file(Result.qlf)),
       kb_qlf:paths(Compiled,Result.qlf,Metadata,Stage),
       atom_concat(Result.qlf,'.meta.data',Metadata),
       atom_concat(Result.qlf,'-stage.data',Stage),
       assertion(exists_file(Metadata)),assertion(exists_file(Stage)),
       setup_call_cleanup(kb_runtime:native_load(Compiled,cache_data_with_qlf),
         (once(kb_runtime:module_assertion(cache_data_with_qlf,_,_,Ref)),
          clause_property(Ref,file(NativeFile)),assertion(same_file(NativeFile,Compiled))),
         kb_runtime:native_unload(Compiled)))),
    directory_file_path(R, external, External),
    source(External, 'external.krf', "(p a)\n", Outside),
    compile_source(Outside, Options, Direct),
    kb_qlf:discover_companions([External], [Direct.normalized]),
    kb_qlf:discover_companions([Direct.normalized], [Direct.normalized]),
    directory_file_path(External,'legacy.krf.pl',Legacy),copy_file(Direct.normalized,Legacy),
    canonical(Legacy,LegacyCanonical),
    kb_qlf:discover_companions([Legacy],[LegacyCanonical]),
    sort([Direct.normalized,LegacyCanonical],Both),
    kb_qlf:discover_companions([External],Both).

:- end_tests(cache_paths).
