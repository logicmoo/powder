:- begin_tests(ow_store).
:- use_module('../kb_store').
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
    load_sources([F],Before.generation,After),
    assertion(After.generation=:=Before.generation+1),
    query_text("(isa ?X Thing)",x_TestMt,10,3,Result),
    Result.solutions=[Solution],assertion(Solution.mt==x_TestMt),
    assertion(Solution.bindings=[_{name:"?X",value:_{type:symbol,value:x_B}}]).
:- end_tests(ow_store).
