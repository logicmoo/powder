:- ensure_loaded(test_term_roles).
:- begin_tests(term_resolver).
:- use_module('../kb_term_resolver').
:- use_module('../kb_term_roles').
:- use_module('../kb_non_atomic').
:- use_module(library(http/json)).

index(Terms,Index) :- plunit_term_roles:index(Terms,Index).
json_ready(Reply) :-
    assertion(ground(Reply)),with_output_to(string(_),json_write_dict(current_output,Reply)).

test(human_native_text_native_term_and_canonical_key_resolve_identically) :-
    Term=x_Fn('x_Mixed-Case',"two  spaces",2026),
    index([x_p(Term)],Index),non_atomic_key(Term,Key),
    atom_concat('nat:',Native,Key),
    maplist(resolve_index_term(Index),
      ['(Fn Mixed-Case "two  spaces" 2026)',Native,Term,Key],Replies),
    forall(member(R,Replies),
      (assertion(R.canonicalKey==Key),assertion(R.resolvedAs==non_atomic),
       assertion(R.expression.denotesNat==true),json_ready(R))).
test(exact_freeciv_human_alias_preserves_full_mt_key_ast_and_387_context_assertions) :-
    Mt=x_ActionModelMtFn('x_Freeciv-TheGame'),
    findall(Row,(between(1,387,N),plunit_term_roles:row(N,x_p(x_a),Mt,Row)),Rows),
    build_term_index(37,Rows,Index),
    resolve_index_term(Index,'(ActionModelMtFn Freeciv-TheGame)',R),
    assertion(R.resolvedAs==microtheory),
    assertion(R.canonicalKey=='mt:x_ActionModelMtFn(\'x_Freeciv-TheGame\')'),
    assertion(R.information.totals.context==387),
    assertion(R.expression.head.value==x_ActionModelMtFn),
    R.expression.args=[Game],assertion(Game.value=='x_Freeciv-TheGame'),
    assertion(R.inferredIsa.microtheory.status==supported),
    assertion(R.inferredIsa.microtheory.bases==[actual_context]),
    assertion(R.inferredIsa.representation.status==unknown),
    resolve_index_term(Index,'x_ActionModelMtFn(\'x_Freeciv-TheGame\')',Native),
    assertion(Native.canonicalKey==R.canonicalKey),
    assertion(Native.information.totals.context==387),json_ready(R).
test(native_context_key_and_native_compound_use_the_same_mt_resolution) :-
    Mt=x_MtFn(x_A),plunit_term_roles:row(1,x_p,Mt,Row),build_term_index(3,[Row],Index),
    resolve_index_term(Index,Mt,A),non_atomic_context_key(Mt,Key),
    resolve_index_term(Index,Key,B),assertion(A.canonicalKey==B.canonicalKey),
    assertion(A.expression==B.expression),assertion(B.resolvedAs==microtheory).
test(native_input_bypasses_sumo_remapping_and_double_prefixing) :-
    term_input(x_Fn(x_Class,'x_=>'),A,_),
    term_input('x_Fn(x_Class,\'x_=>\')',B,_),
    non_atomic_key(x_Fn(x_Class,'x_=>'),A),assertion(A==B).
test(human_quoted_strings_keep_internal_spaces_case_and_unicode) :-
    Term=x_Fn("A  B\n雪",x_Case),
    term_input('  (Fn "A  B\\n雪" Case) \n',Key,_),non_atomic_key(Term,Key).
test(human_atomic_symbol_and_existing_unusual_native_identity) :-
    index([x_p(x_Thing,'x_odd name')],Index),
    resolve_index_term(Index,'Thing',Thing),assertion(Thing.term==x_Thing),
    resolve_index_term(Index,'x_odd name',Odd),assertion(Odd.term=='x_odd name').
test(human_nonground_is_rejected,[throws(error(domain_error(ground_term_input,_),_))]) :-
    term_input('(Fn ?X)',_,_).
test(native_nonground_is_rejected,[throws(error(domain_error(ground_term_input,_),_))]) :-
    term_input(x_Fn(_),_,_).
test(multiform_is_rejected,[throws(error(_,_))]) :-
    term_input('(Fn a) (Fn b)',_,_).
test(multiform_native_prefixed_symbols_are_not_a_single_identity,[throws(error(_,_))]) :-
    term_input('x_A x_B',_,_).
test(directive_data_cannot_execute,[throws(error(domain_error(ground_normalized_application,_),_))]) :-
    term_input((:-throw(must_never_execute)),_,_).
test(inert_metta_execution_input_is_rejected_not_evaluated,[throws(error(_,_))]) :-
    term_input('!(throw must_never_execute)',_,_).
test(logical_or_unobserved_expressions_do_not_become_nats,
     [throws(error(existence_error(loaded_term_identity,_),_))]) :-
    index([x_implies(x_p(x_a),x_q(x_b))],Index),
    resolve_index_term(Index,'(implies (p a) (q b))',_).
test(mt_alias_without_context_role_does_not_promote_an_ordinary_nat,
     [throws(error(existence_error(loaded_term_identity,_),_))]) :-
    Term=x_Fn(x_a),index([x_isa(Term,x_Thing)],Index),
    non_atomic_context_key(Term,Alias),resolve_index_term(Index,Alias,_).
test(microtheory_type_can_be_supported_without_fabricated_context_content) :-
    Nat=x_Fn(x_a),index([x_isa(Nat,x_Microtheory)],Index),
    resolve_index_term(Index,'(Fn a)',R),
    assertion(R.resolvedAs==microtheory),assertion(R.information.totals.context==0),
    assertion(R.inferredIsa.microtheory.status==supported),
    assertion(R.inferredIsa.microtheory.bases==[asserted_type]),
    assertion(R.inferredIsa.microtheory.typeLinkAvailable==true),
    assertion(R.inferredIsa.representation.kinds==[]).
test(result_isa_support_and_result_genl_non_support_stay_distinct) :-
    index([x_p(x_A(x_a)),x_p(x_B(x_b)),
           x_resultIsa(x_A,x_Microtheory),x_resultGenl(x_B,x_Microtheory)],Index),
    resolve_index_term(Index,'(A a)',A),resolve_index_term(Index,'(B b)',B),
    assertion(A.inferredIsa.microtheory.status==supported),
    assertion(A.inferredIsa.microtheory.bases==[declared_result_type]),
    assertion(B.inferredIsa.microtheory.status==unknown).
test(mere_mt_reference_does_not_become_inferred_isa_context_evidence) :-
    index([x_genlMt(x_MtFn(x_a),x_Parent)],Index),
    resolve_index_term(Index,'(MtFn a)',R),
    assertion(R.inferredIsa.microtheory.status==unknown),
    assertion(R.information.totals.context==0).
test(representation_is_not_semantic_isa_and_unknown_does_not_stamp_all_three) :-
    Nat=x_Fn(x_a),non_atomic_key(Nat,Key),
    E=evidence{source:'KBs/a.krf',originalSource:'KBs/a.krf',line:1,
      properties:[_{name:term_representation,value:_{schema:'powder.term-representation.v1',
                    identity:Key,representation:nart}}]},
    build_term_index(2,[loaded(a1,x_p(Nat),x_BaseKB,E)],Index),
    resolve_index_term(Index,Key,R),assertion(R.inferredIsa.microtheory.status==unknown),
    assertion(R.inferredIsa.representation.status==known),
    assertion(R.inferredIsa.representation.kinds==[nart]),
    assertion(R.inferredIsa.semanticIsa==[]),
    assertion(R.inferredIsa.representation.semanticIsa==false),json_ready(R).
test(atomic_mt_types_are_supported_from_actual_positive_whole_term_evidence) :-
    index([x_isa(x_Mt,x_Microtheory)],Index),resolve_index_term(Index,x_Mt,R),
    assertion(R.inferredIsa.microtheory.status==supported),
    assertion(R.inferredIsa.microtheory.bases==[asserted_type]),
    assertion(R.inferredIsa.representation.status==unknown).
test(exact_cycl_class_labels_are_independently_supported_not_inferred_from_shape) :-
    Nat=x_Fn(x_a),
    index([x_isa(Nat,x_CycLNonAtomicTerm),
           x_isa(Nat,'x_CycLNonAtomicTerm-Askable')],Index),
    resolve_index_term(Index,Nat,R),
    findall(T,(member(J,R.inferredIsa.semanticIsa),T=J.type),Supported),
    assertion(Supported==[x_CycLNonAtomicTerm,'x_CycLNonAtomicTerm-Askable']),
    findall(T,(member(J,R.inferredIsa.classAssessments),T=J.type),All),
    assertion(All==[x_CycLNonAtomicTerm,x_CycLNonAtomicReifiedTerm,
                    'x_CycLNonAtomicTerm-ClosedFunctor','x_CycLNonAtomicTerm-Assertible',
                    'x_CycLNonAtomicTerm-Askable']),
    assertion(R.inferredIsa.representation.status==unknown),json_ready(R).
test(ground_closed_shape_and_vocabulary_mentions_do_not_stamp_cycl_classes) :-
    index([x_p(x_Fn(x_a)),x_comment('x_CycLNonAtomicTerm-ClosedFunctor',"vocabulary only")],Index),
    resolve_index_term(Index,'(Fn a)',R),
    assertion(R.inferredIsa.semanticIsa==[]),
    forall(member(J,R.inferredIsa.classAssessments),assertion(J.status==unknown)).
test(reified_class_claim_does_not_establish_exported_reification_or_other_classes) :-
    Nat=x_Fn(x_a),index([x_isa(Nat,x_CycLNonAtomicReifiedTerm)],Index),
    resolve_index_term(Index,Nat,R),
    R.inferredIsa.semanticIsa=[J],assertion(J.label=="CycLNonAtomicReifiedTerm"),
    assertion(R.inferredIsa.representation.status==unknown),
    assertion(R.inferredIsa.representation.kinds==[]).
test(cycl_classes_preserve_positive_type_evidence_but_not_genl_or_negative_claims) :-
    Nat=x_Fn(x_a),
    index([x_p(Nat),x_resultIsa(x_Fn,'x_CycLNonAtomicTerm-Assertible'),
           x_resultGenl(x_Fn,'x_CycLNonAtomicTerm-ClosedFunctor'),
           x_not(x_isa(Nat,'x_CycLNonAtomicTerm-Askable'))],Index),
    resolve_index_term(Index,Nat,R),R.inferredIsa.semanticIsa=[J],
    assertion(J.type=='x_CycLNonAtomicTerm-Assertible'),
    assertion(J.bases==[declared_result_type]),
    assertion(J.evidenceCount==1),assertion(J.typeLinkAvailable==true).
test(old_derived_cache_schema_is_rebuilt_without_reloading_the_kg,
     [setup(plunit_term_roles:fixture(S)),cleanup(plunit_term_roles:cleanup(S))]) :-
    Mt=x_MtFn(x_Project),plunit_term_roles:row(1,x_p,Mt,Row),
    plunit_term_roles:fixture_cache('resolver.krf',[Row],Source,Cache),
    plunit_term_roles:load_fixture(Source,Cache,Loaded),
    assertz(kb_term_roles:cached_index(Loaded.generation,old_index{})),
    resolve_term('(MtFn Project)',R),
    assertion(R.resolvedAs==microtheory),assertion(R.generation==Loaded.generation),
    kb_term_roles:cached_index(Loaded.generation,Fresh),
    assertion(Fresh.cacheVersion==6).

:- end_tests(term_resolver).
