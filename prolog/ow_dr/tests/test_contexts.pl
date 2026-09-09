:- begin_tests(ow_contexts).
:- use_module('../kb_terms').
:- use_module('../kb_runtime').
:- use_module('../kb_paths').

native_context_file(File) :-
    tmp_file(ow_contexts,Base),atom_concat(Base,'.pl',File),
    app_dir(App),directory_file_path(App,'kb_tail_loader.pl',Loader),
    setup_call_cleanup(open(File,write,S),
      (format(S,':- use_module(~q), kb_tail_loader:load_remaining.~n',[Loader]),
       format(S,'x_context_fact(x_one) :- x_cid(a401).~nxc_microtheory(a401,x_CommonsenseMicrostoryMtFn(\'x_ViolentImpact-Harm\')).~nxc_kb_names(a401,[]).~n',[]),
       format(S,'x_context_fact(x_two) :- x_cid(a402).~nxc_microtheory(a402,x_CommonsenseMicrostoryMtFn(x_Other)).~nxc_kb_names(a402,[]).~n',[])),
      close(S)).
cleanup_context(File) :- native_unload(File),delete_file(File).

test(compound_key_round_trip) :-
    Mt=x_CommonsenseMicrostoryMtFn('x_ViolentImpact-Harm'),
    context_key(Mt,Key),atom(Key),context_from_key(Key,Same),assertion(Same==Mt),
    term_ast(Mt,[],AST),assertion(AST.head.value==x_CommonsenseMicrostoryMtFn),
    assertion(AST.args=[_{type:symbol,value:'x_ViolentImpact-Harm'}]).
test(compound_keys_do_not_collide) :-
    context_key(x_Fn(x_a,x_b),One),context_key(x_Fn(x_a(x_b)),Two),
    context_key(x_Fn("x_a"),Three),context_key(x_Fn(x_a),Four),
    assertion(One\==Two),assertion(Three\==Four).
test(atomic_key_compatibility) :-
    context_key(x_tinyKB,x_tinyKB),context_from_key(x_tinyKB,x_tinyKB).
test(lisp_atom_does_not_collide_with_compound_key_prefix) :-
    context_key('mt:Context',Key),context_from_key(Key,RoundTrip),
    assertion(RoundTrip=='mt:Context'),
    context_key('CL:IMPORT','CL:IMPORT'),
    context_from_key('CL:IMPORT','CL:IMPORT').
test(source_expression_context_input) :-
    context_input("(CommonsenseMicrostoryMtFn ViolentImpact-Harm)",Mt),
    assertion(Mt==x_CommonsenseMicrostoryMtFn('x_ViolentImpact-Harm')).
test(nonground_key_rejected,[throws(error(instantiation_error,_))]) :-
    context_from_key('mt:x_Fn(_)',_).
test(noncanonical_trailing_input_rejected,[throws(error(domain_error(microtheory_key,_),_))]) :-
    context_from_key('mt:x_Fn(x_a). halt.',_).
test(compound_mt_native_isolation,
 [setup(native_context_file(F)),cleanup(cleanup_context(F))]) :-
    native_load(F,ow_context_test),Mt=x_CommonsenseMicrostoryMtFn('x_ViolentImpact-Harm'),
    query_modules([ow_context_test],x_context_fact(_),Mt,10,3,Solutions),
    assertion(Solutions=[solution(Mt,[x_one],[step(a401,fact,[],0,0)])]),
    query_modules([ow_context_test],x_context_fact(_),_,10,3,All),
    assertion(length(All,2)),
    forall(member(solution(Context,_,_),All),assertion(compound(Context))).

test(diagnostic_rows_and_properties_are_distinct) :-
    Rows=[some_mapping,note("informational"),warnings("unexpected"),errors("failed")],
    mapping_rows_json(Rows,JSON),
    assertion(JSON=[some_mapping,_{type:note,message:"informational"},
                    _{type:warnings,message:"unexpected"},_{type:errors,message:"failed"}]),
    metadata_json([xc_mapping_rows(a1,[]),xc_notices(a1,["stored notice"]),
                   xc_warnings(a1,["stored warning"]),xc_errors(a1,["stored error"])],Properties),
    assertion(member(_{name:notices,value:["stored notice"]},Properties)),
    assertion(member(_{name:warnings,value:["stored warning"]},Properties)),
    assertion(member(_{name:errors,value:["stored error"]},Properties)).

test(native_first_class_diagnostics_do_not_scan_rows,
 [setup(native_context_file(F)),cleanup(cleanup_context(F))]) :-
    setup_call_cleanup(open(F,append,S),
      format(S,'xc_notices(a402,["stored notice"]).~nxc_warnings(a402,["stored warning"]).~nxc_errors(a402,["stored error"]).~nxc_mapping_rows(a402,[]).~n',[]),close(S)),
    native_load(F,ow_context_test),
    xc_notices(a402,["stored notice"]),xc_warnings(a402,["stored warning"]),xc_errors(a402,["stored error"]),
    native_load(F,ow_context_test),
    findall(N,xc_notices(a402,N),[["stored notice"]]),
    module_metadata(ow_context_test,mapping_rows,a402,[]).
:- end_tests(ow_contexts).
