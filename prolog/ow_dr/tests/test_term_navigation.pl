:- begin_tests(term_navigation).
:- use_module('../kb_term_navigation').
:- use_module('../kb_terms').
:- use_module('../kb_server',[]).

row(Id,Term,Mt,Row) :-
    term_ast(Term,[],AST),term_ast(Mt,[],MTAST),
    Row=_{id:Id,expression:AST,mt:Mt,mtExpression:MTAST}.
fixtures(Rows) :-
    row(a1,x_isa(x_Dog,x_Collection),x_BaseKB,A),
    row(a2,x_genls(x_Dog,x_Animal),x_BaseKB,B),
    row(a3,x_comment(x_Dog,"A\n\tDog"),x_DocsMt,C),
    row(a4,x_genPhrase(x_Dog,"dog"),x_LexicalMt,D),
    row(a5,x_implies(x_isa(X,x_Dog),x_isa(X,x_Animal)),x_BaseKB,E),
    row(a6,x_genlMt(x_ContextFn(x_Dog),x_BaseKB),x_BaseKB,F),
    Rows=[A,B,C,D,E,F].

test(real_counts_and_categories) :-
    fixtures(Rows),term_navigation(x_Dog,Rows,N),
    assertion(N.total=:=6),
    member(S,N.sections),S.key==gafs,assertion(S.count=:=5),
    member(D,N.sections),D.key==documentation,assertion(D.count=:=1),
    member(L,N.sections),L.key==lexical,assertion(L.count=:=1),
    member(A,N.arguments),A.position=:=1,assertion(A.count=:=6),
    member(P,A.predicates),P.term==x_genlMt,assertion(P.count=:=1),
    assertion(P.microtheories=[_{count:1,mt:x_BaseKB,mtExpression:_}]).

test(filters_precede_pagination) :-
    fixtures(Rows),
    filter_term_assertions(x_Dog,Rows,_{section:all,arg:1,predicate:x_comment,mt:x_DocsMt},Matches),
    kb_server:page(Matches,0,1,Page),
    assertion(Page.total=:=1),assertion(Page.items=[_{id:a3,expression:_,mt:_,mtExpression:_}]).

test(empty_section_honest_zero) :-
    row(a1,x_genlMt(x_ContextFn(x_Dog),x_BaseKB),x_BaseKB,A),
    term_navigation(x_Dog,[A],N),
    member(S,N.sections),S.key==lexical,assertion(S.count=:=0).

test(repeated_symbol_counts_one_assertion_per_argument) :-
    row(a1,x_p(x_f(x_Dog,x_Dog),x_Dog),x_BaseKB,A),
    term_navigation(x_Dog,[A],N),
    assertion(N.arguments=[_{position:1,count:1,predicates:_},_{position:2,count:1,predicates:_}]).

test(unknown_section_rejected,[throws(error(domain_error(assertion_section,fake),_))]) :-
    filter_term_assertions(x_Dog,[],_{section:fake,arg:0,predicate:'',mt:''},_).
test(negative_argument_rejected,[throws(error(domain_error(argument_position,-1),_))]) :-
    filter_term_assertions(x_Dog,[],_{section:all,arg: -1,predicate:'',mt:''},_).
test(compound_context_key_is_not_parsed_as_a_goal) :-
    row(a1,x_p(x_Dog),x_BaseKB,A),
    filter_term_assertions(x_Dog,[A],_{section:all,arg:0,predicate:'',mt:'mt:halt(1)'},[]).
test(literal_query_shapes_count_only_direct_occurrences) :-
    fixtures(Rows),term_navigation(x_Dog,Rows,N),
    member(A,N.arguments),A.position=:=1,
    member(P,A.predicates),P.term==x_genlMt,
    assertion(P.queryShapes=[_{arity:2,directCount:0,contexts:[]}]),
    member(Isa,A.predicates),Isa.term==x_isa,
    assertion(Isa.queryShapes=[_{arity:2,directCount:1,contexts:[x_BaseKB]}]).
test(human_and_native_compound_mt_input_resolve_same_complete_identity) :-
    Context=x_ActionModelMtFn('x_Freeciv-TheGame'),context_key(Context,Key),
    term_ast(Context,[],Expression),
    setup_call_cleanup(
      asserta(kb_store:microtheory_catalog([_{mt:Key,mtExpression:Expression,count:387}]),Ref),
      (kb_server:action(term,[search([term='(ActionModelMtFn Freeciv-TheGame)'])],Human),
       kb_server:action(term,[search([term='x_ActionModelMtFn(\'x_Freeciv-TheGame\')'])],Native),
       assertion(Human.resolvedAs==microtheory),assertion(Human.total=:=387),
       assertion(Human.mt==Key),assertion(Human.expression=@=Expression),
       assertion(Human=@=Native)),
      erase(Ref)).
test(compound_mt_arguments_remain_distinct) :-
    kb_server:compound_context_input('(ActionModelMtFn Freeciv-TheGame)',A),
    kb_server:compound_context_input('(ActionModelMtFn AnotherGame)',B),
    assertion(A\==B).
test(nonground_compound_is_rejected,[throws(error(_,_))]) :-
    kb_server:compound_context_input('(ActionModelMtFn ?Game)',_).
test(multiple_compound_forms_are_rejected,[throws(error(_,_))]) :-
    kb_server:compound_context_input('(ActionModelMtFn A) (ActionModelMtFn B)',_).
test(occurrence_groups_are_distinct_and_pre_filter) :-
    row(a1,x_p(x_Dog),x_BaseKB,A0),A=A0.put(_{source:'KBs/a.krf',line:10}),
    row(a2,x_p(x_Dog),x_BaseKB,B0),B=B0.put(_{source:'KBs/b.krf',line:20}),
    row(a3,x_q(x_Dog),x_OtherMt,C0),C=C0.put(_{source:'KBs/a.krf',line:30}),
    occurrence_summary([A,A,B,C],S),assertion(S.assertions=:=3),
    member(F,S.sources),F.source=='KBs/a.krf',assertion(F.count=:=2),
    assertion(F.firstLine=:=10),
    filter_term_assertions(x_Dog,[A,B,C],_{section:all,arg:0,predicate:'',mt:'',source:'KBs/b.krf'},[B]).
test(definition_uses_schema_target_not_predicate_or_nested_mentions) :-
    row(a1,x_arity(x_P,2),x_BaseKB,A),
    row(a2,x_argIsa(x_P,1,x_Dog),x_BaseKB,B),
    row(a3,x_P(x_Fido,x_Rover),x_BaseKB,C),
    row(a4,x_argIsa(x_Other,1,x_P),x_BaseKB,D),
    row(a5,x_arg2Isa(x_P,x_Dog),x_BaseKB,E),
    row(a6,x_genlMt(x_MtFn(x_P),x_BaseKB),x_BaseKB,F),
    row(a7,x_defnIff(x_P,x_isa(x_X,x_Dog)),x_BaseKB,G),
    Rows=[A,B,C,D,E,F,G],
    filter_term_assertions(x_P,Rows,_{section:definition,arg:0,predicate:'',mt:''},Matches),
    assertion(Matches=[A,B,E,G]),
    term_navigation(x_P,Rows,N),member(S,N.sections),S.key==definition,assertion(S.count=:=4),
    filter_term_assertions(x_argIsa,Rows,_{section:definition,arg:0,predicate:'',mt:''},[]).
test(definition_matches_full_nat_subject_not_constructor) :-
    row(a1,x_isa(x_MtFn(x_Game),x_Microtheory),x_BaseKB,A0),
    A0.expression.args=[Subject,Type],
    Nat='nat:x_MtFn(x_Game)',Annotated=Subject.put(_{denotesNat:true,natKey:Nat}),
    A=A0.put(expression,A0.expression.put(args,[Annotated,Type])),
    filter_term_assertions(Nat,[A],_{section:definition,arg:0,predicate:'',mt:''},[A]),
    filter_term_assertions(x_MtFn,[A],_{section:definition,arg:0,predicate:'',mt:''},[]).
:- end_tests(term_navigation).
