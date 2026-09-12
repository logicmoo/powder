:- begin_tests(assertion_view).
:- use_module('../kb_assertion_view').
:- use_module('../kb_runtime',[]).
:- use_module('../kb_paths').

fixture(File) :-
    tmp_file(ow_compiled_view,File),app_dir(App),directory_file_path(App,'kb_tail_loader.pl',Helper),
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),
      (format(S,':- use_module(~q), kb_tail_loader:load_remaining.~n',[Helper]),
       format(S,'x_p(X,x_fn(X,''x_With quote'')) :- x_cid(a901,X).~n',[]),
       format(S,'xc_microtheory(a901,x_TestMt).~nxc_kb_names(a901,["?X"]).~n',[]),
       format(S,'x_r(X) :- x_cid_io(a902,and(x_p(X,Y)),vs(X),vs(Y)).~n',[]),
       format(S,'xc_microtheory(a902,x_TestMt).~nxc_kb_names(a902,["?X","?Y"]).~n',[]),
       format(S,'x_implies(x_p(X),x_q(X)) :- x_cid(a903,X).~n',[]),
       format(S,'xc_microtheory(a903,x_TestMt).~nxc_kb_names(a903,["?X"]).~n',[])),
      close(S)),
    kb_runtime:native_load(File,ow_compiled_view).
cleanup(File) :- kb_runtime:native_unload(File),delete_file(File).
test(actual_fact_variables_and_quoted_nested_term,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    native_clause_text(ow_compiled_view,a901,Text,Location),
    read_term_from_atom(Text,Clause,[variable_names(Vars)]),
    assertion(Clause=@=(x_p(X,x_fn(X,'x_With quote')):-ow_compiled_view:x_cid(a901,X))),
    assertion(Vars=['V1'=_]),assertion(Location.line=:=2),
    assertion(sub_string(Text,_,2,0,".\n")).
test(actual_rule_guard_groups_share_real_variables,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    native_clause_text(ow_compiled_view,a902,Text,_),
    read_term_from_atom(Text,Clause,[]),
    assertion(Clause=@=(x_r(X):-ow_compiled_view:x_cid_io(a902,and(x_p(X,Y)),vs(X),vs(Y)))).
test(implication_remains_fact,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    native_clause_text(ow_compiled_view,a903,Text,_),
    read_term_from_atom(Text,Clause,[]),
    assertion(Clause=@=(x_implies(x_p(X),x_q(X)):-ow_compiled_view:x_cid(a903,X))).
test(erased_handles_are_not_reused,[setup(fixture(F)),cleanup(delete_file(F)),
     throws(error(existence_error(native_assertion_clause,a901),_))]) :-
    kb_runtime:native_unload(F),native_clause_text(ow_compiled_view,a901,_,_).
:- end_tests(assertion_view).
