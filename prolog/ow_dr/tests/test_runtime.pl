:- begin_tests(ow_runtime).
:- use_module('../kb_runtime').
:- use_module('../kb_paths').
:- use_module('../kb_terms').
:- use_module(library(filesex)).

fixture(Header,File) :-
    tmp_file(ow_native,Base),atom_concat(Base,'.pl',File),
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),
                       fixture_text(S,Header),close(S)).
fixture_text(S,Header) :-
    app_dir(App),
    (Header==tail ->
      directory_file_path(App,'kb_tail_loader.pl',Helper),
      format(S,':- use_module(~q), kb_tail_loader:load_remaining.~n',[Helper])
    ; directory_file_path(App,'kb_dynamic_assert.pl',Helper),
      format(S,':- include(~q).~n',[Helper])),
    format(S,'x_parent(x_ann,x_wrong) :- x_cid(a100).~n',[]),
    format(S,'xc_microtheory(a100,x_TestMt).~nxc_kb_names(a100,[]).~n',[]),
    format(S,'x_parent(x_ann,x_bob) :- x_cid(a101).~n',[]),
    format(S,'xc_microtheory(a101,x_TestMt).~nxc_kb_names(a101,[]).~n',[]),
    format(S,'x_parent(x_bob,x_cal) :- x_cid(a102).~n',[]),
    format(S,'xc_microtheory(a102,x_TestMt).~nxc_kb_names(a102,[]).~n',[]),
    format(S,'x_grandparent(X,Y) :- x_cid_io(a103,and(x_parent(X,Z),x_parent(Z,Y)),vs(X,Y),vs(Z)).~n',[]),
    format(S,'xc_microtheory(a103,x_TestMt).~nxc_kb_names(a103,["?X","?Y","?Z"]).~n',[]),
    format(S,'x_parent(x_wrong,x_leak) :- x_cid(a104).~n',[]),
    format(S,'xc_microtheory(a104,x_OtherMt).~nxc_kb_names(a104,[]).~n',[]),
    format(S,'x_loop(X) :- x_cid_io(a105,and(x_loop(X)),vs(X),vs).~n',[]),
    format(S,'xc_microtheory(a105,x_TestMt).~nxc_kb_names(a105,["?X"]).~n',[]).
dispose(File) :- native_unload(File),delete_file(File).

test(tail_native_location, [setup(fixture(tail,F)),cleanup(dispose(F))]) :-
    native_load(F,ow_native_test),
    xc_clause_handle(a101,R),
    clause_property(R,file(Native)),same_file(F,Native),
    clause_property(R,line_count(5)).

test(include_native_location, [setup(fixture(include,F)),cleanup(dispose(F))]) :-
    native_load(F,ow_native_test),
    xc_clause_handle(a101,R),
    clause_property(R,file(Native)),same_file(F,Native),
    clause_property(R,line_count(5)).

test(nested_include_location) :-
    fixture(include,F),tmp_file(ow_outer,Outer),
    setup_call_cleanup(true,
      (setup_call_cleanup(open(Outer,write,S),format(S,':- include(~q).~n',[F]),close(S)),
       native_load(Outer,ow_nested_test),
       xc_clause_handle(a101,R),clause_property(R,file(Native)),same_file(F,Native),
       clause_property(R,line_count(5))),
      (native_unload(Outer),delete_file(Outer),delete_file(F))).

test(failed_fact_is_not_exception, [setup(fixture(tail,F)),cleanup(dispose(F))]) :-
    native_load(F,ow_native_test),
    query(x_parent(x_missing,_),x_TestMt,10,3,[]).

test(proof_branch_and_mt, [setup(fixture(tail,F)),cleanup(dispose(F))]) :-
    native_load(F,ow_native_test),
    query(x_grandparent(x_ann,Y),x_TestMt,10,3,Solutions),
    assertion(var(Y)),
    assertion(Solutions = [solution(x_TestMt,[x_cal],
      [step(a101,fact,[],0,0),step(a102,fact,[],0,0),
       step(a103,rule,[x_ann,x_cal,x_bob],1,3)])]),
    assertion(\+ nb_current(logos_query,_)).

test(unscoped_whole_query, [setup(fixture(tail,F)),cleanup(dispose(F))]) :-
    native_load(F,ow_native_test),
    query(and(x_parent(x_ann,X),x_parent(X,Y)),_,10,3,Solutions),
    assertion(var(X)),assertion(var(Y)),
    assertion(Solutions = [solution(x_TestMt,[x_bob,x_cal],_)]).

test(reload_and_unload, [setup(fixture(tail,F)),cleanup(delete_file(F))]) :-
    native_load(F,ow_native_test),native_load(F,ow_native_test),
    findall(R,xc_clause_handle(a101,R),Refs),Refs=[Ref],
    native_unload(F),
    assertion(\+ xc_clause_handle(a101,_)),
    assertion(clause_property(Ref,erased)).

test(fresh_source_variables, [setup(fixture(tail,F)),cleanup(dispose(F))]) :-
    native_load(F,ow_native_test),
    xc_src(a103,(x_grandparent(A,B):-and(x_parent(A,C),x_parent(C,B)))),
    xc_src(a103,(x_grandparent(D,E):-_)),
    assertion(A\==D),assertion(B\==E),
    term_variables([A,B,C],Vars),assertion(length(Vars,3)),
    xc_plvars(a103,['V1','V2','V3']).

test(exception_cleanup, [setup(fixture(tail,F)),cleanup(dispose(F))]) :-
    native_load(F,ow_native_test),
    catch(query(x_unknown(_),x_TestMt,10,3,_),Error,true),
    assertion(nonvar(Error)),assertion(\+nb_current(logos_query,_)).

test(timeout_cleanup, [setup(fixture(tail,F)),cleanup(dispose(F))]) :-
    native_load(F,ow_native_test),
    catch(query(x_loop(_),x_TestMt,10,0.02,_),Error,true),
    assertion(Error==time_limit_exceeded),assertion(\+nb_current(logos_query,_)).

test(renderer_scoped_names) :-
    semantic_ast((x_p(X):-and(x_q(X,Y))),["??X","?Y"],AST),
    assertion(AST.head.value=='x_<==='),
    assertion(AST.args=[_{type:application,head:_{type:symbol,value:x_p},
                         args:[_{type:variable,value:"??X"}]},_]),
    assertion(var(Y)).
:- end_tests(ow_runtime).
