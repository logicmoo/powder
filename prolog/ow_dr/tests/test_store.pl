:- begin_tests(ow_store).
:- use_module('../kb_store').
:- use_module('../kb_server',[]).
:- use_module(library(filesex)).

fixture(Text,Dir,File) :-
    tmp_file(ow_store,Dir),make_directory(Dir),
    directory_file_path(Dir,'source.krf',File),write_source(File,Text).
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
    kb_paths:cache_paths(F,Compiled,_),assertion(exists_file(Compiled)).

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
    kb_paths:cache_paths(F,Compiled,_),assertion(exists_file(Compiled)).

test(changed_source_replaces_native_generation,
     [setup(fixture("(in-microtheory TestMt)\n(isa A Thing)\n",D,F)),cleanup(cleanup(D))]) :-
    load_sources([F],any,Before),
    write_source(F,"(in-microtheory TestMt)\n(isa B Thing)\n"),
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
:- end_tests(ow_store).
