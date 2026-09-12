:- begin_tests(term_browser).
:- use_module('../kb_term_browser').
:- use_module('../kb_term_roles',[]).
:- use_module('../kb_store',[]).
:- meta_predicate with_index(0).

with_index(Goal) :-
    Term=x_SpindleMtFn('x_Freeciv-TheGame',x_PlayingFn('x_Freeciv-TheGame')),
    E=evidence{source:'KBs/example.krf',originalSource:'KBs/example.krf',line:45,names:[],properties:[]},
    kb_store:generation(G),
    kb_term_roles:build_term_index(G,[loaded(a1,x_isa(Term,x_Microtheory),x_BaseKB,E)],Index),
    setup_call_cleanup(asserta(kb_term_roles:cached_index(G,Index),Ref),call(Goal),erase(Ref)).
filters(_{section:all,arg:0,predicate:'',mt:'',source:''}).

test(reference_only_nested_term_keeps_full_identity_and_assertions) :-
    with_index((
      filters(F),
      browse_compound('(SpindleMtFn Freeciv-TheGame (PlayingFn Freeciv-TheGame))',0,1,F,R),
      assertion(R.known==true),assertion(R.total=:=1),assertion(R.items=[_]),
      assertion(R.termInfo.totals.context=:=0),
      assertion(R.term=='nat:x_SpindleMtFn(\'x_Freeciv-TheGame\',x_PlayingFn(\'x_Freeciv-TheGame\'))'),
      assertion(R.expression.denotesNat==true),R.expression.args=[_,Inner],
      assertion(Inner.natKey=='nat:x_PlayingFn(\'x_Freeciv-TheGame\')'))).
test(native_and_readable_input_are_identical) :-
    resolve_compound('(ActionModelMtFn Freeciv-TheGame)',A,Key),
    resolve_compound('x_ActionModelMtFn(\'x_Freeciv-TheGame\')',B,Key),
    assertion(A==B).
test(occurrences_separate_references_from_context_content) :-
    with_index((
      term_information('(SpindleMtFn Freeciv-TheGame (PlayingFn Freeciv-TheGame))',Info),
      assertion(Info.occurrences.assertions=:=1),
      assertion(Info.totals.context=:=0),
      assertion(Info.occurrences.sources=[_{source:'KBs/example.krf',count:1,firstLine:45,evidence:_}]))).
test(unknown_application_is_not_given_invented_denotation_evidence) :-
    with_index((
      filters(F),browse_compound('(UnknownFn A)',0,1,F,R),
      assertion(R.known==false),assertion(R.total=:=0),
      assertion(\+get_dict(natKey,R.expression,_)))).
test(definition_filter_matches_exact_nat_not_constructor) :-
    with_index((
      filters(F0),F=F0.put(section,definition),
      browse_compound('(SpindleMtFn Freeciv-TheGame (PlayingFn Freeciv-TheGame))',0,1,F,R),
      assertion(R.total=:=1))).
test(annotation_batch_keeps_formula_and_denoting_parens_separate) :-
    with_index((
      annotate_page([a1],R),R.items=[A],A.expression.args=[Nat,_],
      assertion(A.expression.denotesNat==false),
      assertion(A.expression.natKey==null),
      assertion(Nat.denotesNat==true))).
:- end_tests(term_browser).
