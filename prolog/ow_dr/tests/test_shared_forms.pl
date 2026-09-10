:- begin_tests(shared_form_records).
:- use_module('../kb_store').
:- use_module('../kb_runtime',[]).
:- use_module('../kb_forms',[]).
:- use_module('../kb_paths').
:- use_module(library(filesex)).

fixture(Directory,A,B,C) :-
    tmp_file(powder_shared,Directory),make_directory(Directory),
    source(Directory,'a.krf',"(in-microtheory MtA)\n(:DIRECTION :FORWARD :KIF (p A))\n(p A)\n(v ?X ?X)\n",A),
    source(Directory,'b.krf',"(in-microtheory MtA)\n(:DIRECTION :BACKWARD :KIF (p A))\n(v ?Y ?Y)\n",B),
    source(Directory,'c.krf',"(in-microtheory (MtFn B))\n(:DIRECTION :DEFAULT :KIF (p A))\n(v ?P ?Q)\n",C).
source(D,Name,Text,File) :-
    directory_file_path(D,Name,File),
    setup_call_cleanup(open(File,write,S),format(S,'~s',[Text]),close(S)),
    kb_compile:compile_source(File,[state_dir(D),progress(none)],_).
cleanup(D) :-
    findall(P,source_info(P,_),Paths),
    forall(member(P,Paths),(generation(G),unload_source(P,G,_))),
    delete_directory_and_contents(D).
record_for(Mt,Head,Id,Data) :-
    assertion(Id,Data),Data.mt==Mt,Data.predicate.term==Head.

test(one_form_one_number_per_mt_with_associated_evidence,
     [setup(fixture(D,A,B,C)),cleanup(cleanup(D))]) :-
    load_sources([A],any,S1),record_for(x_MtA,x_p,Id,First),
    assertion(length(First.contributions,2)),
    kb_runtime:xc_form_handle(Id,Handle),
    load_sources([A,B,C],S1.generation,S2),
    record_for(x_MtA,x_p,Id,Joined),
    assertion(length(Joined.contributions,3)),assertion(length(Joined.aliases,3)),
    assertion(member(_{name:direction,value:':FORWARD'},Joined.properties)),
    assertion(member(_{name:direction,value:':BACKWARD'},Joined.properties)),
    assertion(\+member(_{name:direction,value:':DEFAULT'},Joined.properties)),
    member(OtherId,Joined.sameForm),assertion(OtherId\==Id),
    assertion(OtherId,Other),assertion(Other.contributions=[_]),
    assertion(Other.mtExpression.head.value==x_MtFn),
    kb_runtime:xc_form_handle(OtherId,Handle),
    assertion(S2.counts.assertions=:=4),assertion(S2.counts.forms=:=3),
    assertion(S2.counts.occurrences=:=7),
    query_text("(p ?X)",x_MtA,10,3,Q),Q.solutions=[Solution],
    Solution.proof=[Proof],assertion(Proof.id==Id),
    assertion(length(Proof.contributions,3)),
    forall(member(E,Proof.contributions),assertion(E.mt==x_MtA)),
    load_sources([A,B,C],S2.generation,S3),
    record_for(x_MtA,x_p,Id,Again),assertion(length(Again.contributions,3)),
    unload_source(A,S3.generation,S4),
    record_for(x_MtA,x_p,Id,Remaining),assertion(Remaining.contributions=[_]),
    assertion(\+member(_{name:direction,value:':FORWARD'},Remaining.properties)),
    unload_source(B,S4.generation,_),
    assertion(\+kb_store:assertion(Id,_)),
    kb_runtime:xc_form_handle(OtherId,Handle),assertion(\+clause_property(Handle,erased)).

test(variants_not_unification_and_alias_lookup,
     [setup(fixture(D,A,B,C)),cleanup(cleanup(D))]) :-
    load_sources([A,B,C],any,_),
    record_for(x_MtA,x_v,Id,Same),assertion(length(Same.contributions,2)),
    Same.aliases=[Alias1,Alias2],assertion(Alias1\==Alias2),
    lookup_assertion(Alias2,Resolved),assertion(Resolved.id==Id),
    kb_runtime:xc_form_handle(Id,Ref),
    kb_store:assertion(Other,OtherData),OtherData.predicate.term==x_v,Other\==Id,
    kb_runtime:xc_form_handle(Other,OtherRef),assertion(Ref\==OtherRef),
    kb_forms:form_record(Id,x_v(X,Y),_,_),assertion(X==Y),
    kb_forms:form_record(Other,x_v(P,Q),_,_),assertion(P\==Q).

test(prebuilt_qlfs_use_normal_generation_interning,
     [setup(fixture(D,A,B,C)),cleanup(cleanup(D))]) :-
    kb_compile:compile_sources([A,B,C],[progress(none)],Compiled),
    forall(member(Info,Compiled.results),kb_qlf:convert_companion(Info.normalized,[],_)),
    load_sources([A,B,C],any,Loaded),
    forall(source_info(_,Info),assertion(Info.nativeLoad.format==qlf)),
    record_for(x_MtA,x_p,Id,Data),assertion(length(Data.contributions,3)),
    Data.sameForm=[Other],kb_runtime:xc_form_handle(Id,Ref),kb_runtime:xc_form_handle(Other,Ref),
    predicate_property(kb_forms:x_p(_),dynamic),predicate_property(kb_forms:x_p(_),multifile),
    load_sources([A,B,C],Loaded.generation,Reused),
    unload_source(A,Reused.generation,Removed),record_for(x_MtA,x_p,Id,Remaining),
    assertion(length(Remaining.contributions,1)),
    unload_source(B,Removed.generation,_),kb_runtime:xc_form_handle(Other,Ref).

native_fixture(D,Name,Id,Mt,File) :-
    directory_file_path(D,Name,File),app_dir(App),
    directory_file_path(App,'kb_tail_loader.pl',Loader),
    setup_call_cleanup(open(File,write,S),
      format(S,':- use_module(~q),kb_tail_loader:load_remaining.~nx_concurrent(x_a) :- x_cid(~w).~nxc_microtheory(~w,~q).~nxc_source_file(~w,~q).~nxc_source_line(~w,2).~nxc_kb_names(~w,[]).~n',
        [Loader,Id,Id,Mt,Id,File,Id,Id]),close(S)).
test(concurrent_native_intern_is_atomic) :-
    tmp_file(powder_native_forms,D),make_directory(D),
    native_fixture(D,'one.pl',a810,x_A,A),native_fixture(D,'two.pl',a811,x_A,B),
    setup_call_cleanup(true,
      (thread_create(kb_runtime:native_load(A,shared_native_a),TA,[]),
       thread_create(kb_runtime:native_load(B,shared_native_b),TB,[]),
       thread_join(TA,true),thread_join(TB,true),
       kb_forms:owner_record(shared_native_a,a810,Primary,_,_),
       kb_forms:owner_record(shared_native_b,a811,Primary,_,_),
       findall(Ref,kb_forms:form_record(Primary,_,_,Ref),[_]),
       kb_runtime:query_modules([shared_native_a,shared_native_b],x_concurrent(_),x_A,10,3,Solutions),
       assertion(Solutions=[solution(x_A,[x_a],_)])),
      (kb_runtime:native_unload(A),kb_runtime:native_unload(B),delete_directory_and_contents(D))).
:- end_tests(shared_form_records).
