:- begin_tests(ow_store).
:- use_module('../kb_store').
:- use_module('../kb_server',[]).
:- use_module('../kb_load_policy').
:- use_module(library(filesex)).
:- use_module(library(memfile)).

fixture(Text,Dir,File) :-
    tmp_file(ow_store,Dir),make_directory(Dir),
    directory_file_path(Dir,'source.krf',File),write_source(File,Text),
    compile_fixture(File).
compile_fixture(File) :-
    file_directory_name(File,Dir),
    kb_compile:compile_source(File,[state_dir(Dir),progress(none),diagnostics(false)],_).
write_source(File,Text) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),format(S,'~s',[Text]),close(S)).
cleanup(Dir) :-
    findall(Path,kb_store:source_info(Path,_),Paths),
    forall(member(P,Paths),(generation(G),unload_source(P,G,_))),
    delete_directory_and_contents(Dir).

test(load_query_unload_last,
     [setup(fixture("(in-microtheory TestMt)\n(isa A Thing)\n(<=== (checked ?X) (isa ?X Thing))\n",D,F)),
      cleanup(cleanup(D))]) :-
    load_sources([F],any,S),
    assertion(S.counts.assertions=:=2),
    query_text("(checked ?Who)",x_TestMt,10,3,Q),
    Q.solutions=[Solution],
    assertion(Solution.bindings=[_{name:"?Who",value:_{type:symbol,value:x_A}}]),
    Solution.proof=[Fact,Rule],
    assertion(Fact.expression.head.value==x_isa),
    assertion(Rule.expression.args=[_{type:application,head:_{type:symbol,value:x_checked},args:_},_]),
    unload_source(F,S.generation,Empty),
    assertion(Empty.files==[]),assertion(Empty.counts.assertions=:=0),
    atom_concat(F,'.pl',Compiled),assertion(exists_file(Compiled)).

test(failed_replacement_preserves_generation,
     [setup(fixture("(isa A Thing)\n",D,F)),cleanup(cleanup(D))]) :-
    load_sources([F],any,Before),
    directory_file_path(D,'invalid.krf',Bad),write_source(Bad,"(broken\n"),
    catch(load_sources([Bad],Before.generation,_),Error,true),
    assertion(nonvar(Error)),status(After),
    assertion(After.generation=:=Before.generation),
    assertion(After.counts.assertions=:=1).

test(stale_generation_rejected,
     [setup(fixture("(isa A Thing)\n",D,F)),cleanup(cleanup(D))]) :-
    load_sources([F],any,Before),
    Previous is Before.generation-1,
    catch(unload_source(F,Previous,_),Error,true),
    assertion(Error=error(generation_conflict(_,_),_)),
    status(After),assertion(After.generation=:=Before.generation).

test(unload_does_not_require_original_source_to_still_exist,
     [setup(fixture("(isa A Thing)\n",D,F)),cleanup(cleanup(D))]) :-
    load_sources([F],any,Before),
    delete_file(F),
    unload_source(F,Before.generation,After),
    assertion(After.files==[]),
    atom_concat(F,'.pl',Compiled),assertion(exists_file(Compiled)).

test(changed_source_replaces_native_generation,
     [setup(fixture("(in-microtheory TestMt)\n(isa A Thing)\n",D,F)),cleanup(cleanup(D))]) :-
    load_sources([F],any,Before),
    write_source(F,"(in-microtheory TestMt)\n(isa B Thing)\n"),
    compile_fixture(F),
    load_sources([F],Before.generation,After),
    assertion(After.generation=:=Before.generation+1),
    query_text("(isa ?X Thing)",x_TestMt,10,3,Result),
    Result.solutions=[Solution],assertion(Solution.mt==x_TestMt),
    assertion(Solution.bindings=[_{name:"?X",value:_{type:symbol,value:x_B}}]).

test(all_microtheories_include_counts_compounds_and_refresh,
     [setup(fixture("(in-microtheory ZuluMt)\n(p a)\n(p b)\n(in-microtheory (ContextFn Other))\n(p c)\n",D,F)),
      cleanup(cleanup(D))]) :-
    load_sources([F],any,Status),
    kb_server:action(microtheories,[search([limit='1'])],Reply),
    assertion(Reply.total=:=2),assertion(Reply.generation=:=Status.generation),
    member(Atomic,Reply.items),Atomic.mt==x_ZuluMt,assertion(Atomic.count=:=2),
    member(Compound,Reply.items),Compound.mt\==x_ZuluMt,
    assertion(Compound.mtExpression.head.value==x_ContextFn),
    kb_terms:context_from_key(Compound.mt,Mt),assertion(Mt==x_ContextFn(x_Other)),
    mt_assertions(Mt,[_]),
    unload_source(F,Status.generation,_),
    microtheories([]),
    kb_server:action(microtheories,[],Empty),assertion(Empty.total=:=0).

test(normal_load_requires_companions_without_creating_any,
     [setup(fixture("(p A)\n",D,F)),cleanup(cleanup(D))]) :-
    atom_concat(F,'.pl',PL),atom_concat(F,'.index.pl',Index),
    delete_file(PL),delete_file(Index),generation(Before),
    catch(load_sources([F],any,_),Error,true),
    assertion(Error=error(existence_error(compiled_kb,_),_)),
    generation(Before),assertion(\+exists_file(PL)),assertion(\+exists_file(Index)).

test(pl_load_ignores_source_changes_missing_index_and_live_compile_claim,
     [setup(fixture("(p A)\n",D,F)),cleanup(cleanup(D))]) :-
    atom_concat(F,'.pl',PL),atom_concat(F,'.index.pl',Index),
    kb_cache:file_digest(PL,Hash),delete_file(Index),
    write_source(F,"(unclosed"),
    atom_concat(PL,'.lock',LockFile),atom_concat(PL,'.tmp',Marker),
    write_source(Marker,"live writer marker"),
    setup_call_cleanup(kb_cache:try_lock(LockFile,Lock),
      (load_sources([F],any,S),assertion(S.counts.assertions=:=1),
       S.files=[Info],assertion(Info.nativeLoad.format==pl),
       assertion(\+exists_file(Index)),assertion(exists_file(Marker)),
       kb_cache:file_digest(PL,Hash)),
      kb_cache:release_lock(Lock)).

test(qlf_load_precedes_pl_reader_and_source_analysis,
     [setup(fixture("(p A)\n",D,F)),cleanup(cleanup(D))]) :-
    atom_concat(F,'.pl',PL),kb_qlf:convert_companion(PL,[],_),
    write_source(PL,"not valid prolog or cache data"),
    write_source(F,"(unclosed"),
    atom_concat(F,'.index.pl',Index),delete_file(Index),
    load_sources([F],any,S),assertion(S.counts.assertions=:=1),
    S.files=[Info],assertion(Info.nativeLoad.format==qlf),
    assertion(\+exists_file(Index)),
    delete_file(PL),
    load_sources([F],S.generation,Again),assertion(Again.counts.assertions=:=1).

test(stored_warnings_are_preserved_but_never_reprinted,
     [setup(fixture("(p A)\n",D,F)),cleanup(cleanup(D))]) :-
    atom_concat(F,'.pl',PL),kb_cache:read_cache(PL,Header,[record(Id,Semantic,Metadata)]),
    Message="Saved row-type advisory",
    kb_cache:write_cache(PL,Header.put(warnings,[warning(F,1,1,Message)]),
      [record(Id,Semantic,[xc_warnings(Id,[Message])|Metadata])],_),
    capture_stderr(load_sources([F],any,First),PLText),
    assertion(PLText==""),assertion(First.warnings=[_]),
    kb_store:lookup_assertion(Id,Data),assertion(Data.warnings==[Message]),
    unload_source(F,First.generation,_),kb_qlf:convert_companion(PL,[],_),
    capture_stderr(load_sources([F],any,Second),QLFText),
    assertion(QLFText==""),assertion(Second.warnings==First.warnings),
    kb_store:lookup_assertion(Id,Again),assertion(Again.warnings==[Message]).

test(runtime_guard_rejects_compiler_reader_and_cache_builders) :-
    forall(member(Operation-Goal,
      [kb_compile:compile_sources/3-kb_compile:compile_sources([],[],_),
       kb_compile:compile_source/3-kb_compile:compile_source(unused,[],_),
       kb_compile:cache_identity/3-kb_compile:cache_identity(unused,[],_),
       kb_reader:read_source/4-kb_reader:read_source(unused,[],_,_),
       kb_cache:write_cache/4-kb_cache:write_cache(unused,_,[],_),
       kb_index:build_index/3-kb_index:build_index(_,[],_),
       kb_index:write_index/4-kb_index:write_index(unused,_,[],_),
       kb_qlf:convert_companion/3-kb_qlf:convert_companion(unused,[],_)]),
      (catch(with_runtime_load(call(Goal)),Error,true),
       assertion(Error=error(runtime_cache_build(Operation),_)))),
    require_offline(outside_load),
    catch(with_runtime_load(throw(load_failed)),load_failed,true),
    require_offline(after_exception),
    \+with_runtime_load(fail),
    require_offline(after_failure).

capture_stderr(Goal,Text) :-
    current_input(In),current_output(Out),stream_pair(user_error,_,Err),
    setup_call_cleanup(new_memory_file(Memory),
      (setup_call_cleanup(open_memory_file(Memory,write,Capture,[encoding(utf8)]),
        setup_call_cleanup(set_prolog_IO(In,Out,Capture),once(Goal),set_prolog_IO(In,Out,Err)),
        close(Capture)),memory_file_to_string(Memory,Text)),
      free_memory_file(Memory)).
:- end_tests(ow_store).
