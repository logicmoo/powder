:- ensure_loaded(test_native_annotations).
:- begin_tests(missing_strength).
:- use_module('../kb_native_annotations').
fixture(F) :- plunit_native_annotations:fixture(F),native_status(B),initialize_defaults(B.revision,_).
cleanup(F) :- plunit_native_annotations:dispose(F).
source(Labels) :- plunit_native_annotations:source_fixture([],Labels).
put(P,V) :- plunit_native_annotations:put(cyc,default,P,V).

test(absent_category_uses_global_without_materializing,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    source([]),native_status(Before),
    assertion_interpretation(a123,null,R),
    assertion(R.monotonicity==[]),assertion(R.effectiveMonotonicity==[':DEFAULT']),
    assertion(R.strengthCategory.origin==default),
    assertion(R.strengthCategory.reason==global_missing_strength),
    assertion(R.assertionPrior.confidence.summary.value=:=0.66),
    assertion(\+cyc_bayes_value(a123,monotonicity,_)),
    native_status(After),assertion(After.revision==Before.revision).
test(global_change_affects_only_missing_source,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    source([]),put(missing_assertion_strength,':MONOTONIC'),
    assertion_interpretation(a123,null,R),assertion(R.effectiveMonotonicity==[':MONOTONIC']),
    assertion(R.assertionPrior.confidence.summary.value=:=0.97),
    retractall(kb_store:assertion(a123,_)),
    source([_{name:monotonicity,value:':DEFAULT'}]),
    assertion_interpretation(a123,null,Explicit),
    assertion(Explicit.effectiveMonotonicity==[':DEFAULT']),
    assertion(Explicit.strengthCategory.origin==source).
test(explicit_invalid_or_conflicting_is_not_missing,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    source([_{name:monotonicity,value:0}]),
    assertion_interpretation(a123,null,Invalid),assertion(Invalid.strengthCategory.status==invalid),
    retractall(kb_store:assertion(a123,_)),
    source([_{name:monotonicity,value:':DEFAULT'},_{name:strength,value:':MONOTONIC'}]),
    assertion_interpretation(a123,null,Conflict),assertion(Conflict.strengthCategory.status==conflict).
test(native_explicit_and_current_mt_confidence_remain_independent,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    source([]),put(missing_assertion_strength,':MONOTONIC'),
    plunit_native_annotations:put(cyc,a123,monotonicity,':DEFAULT'),
    plunit_native_annotations:put(cyc,x_Mt,asserted_default_confidence,0.23),
    assertion_interpretation(a123,x_Mt,R),
    assertion(R.strengthCategory.origin==atom),assertion(R.effectiveMonotonicity==[':DEFAULT']),
    assertion(R.assertionPrior.confidence.summary.value=:=0.23).
test(negative_formula_is_not_rewritten_or_given_positive_prior,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    plunit_native_annotations:source_fixture(x_not(x_p(x_A)),[],[]),
    assertion_interpretation(a123,null,R),
    assertion(R.effectiveMonotonicity==[':DEFAULT']),
    assertion(R.assertionPrior.polarity==negative),assertion(R.assertionPrior.truth==null).
test(global_setting_is_not_a_per_mt_override,
     [setup(fixture(F)),cleanup(cleanup(F)),throws(error(domain_error(global_only_setting,missing_assertion_strength),_))]) :-
    native_status(S),save_native_settings(x_Mt,_{missing_assertion_strength:':MONOTONIC'},S.revision,_).
test(reset_global_defaults_keeps_atom_and_mt_records,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    plunit_native_annotations:put(opencog,x_A,null,false),
    plunit_native_annotations:put(cyc,x_Mt,default_strength,0),
    put(direction,':FORWARD'),put(missing_assertion_strength,':MONOTONIC'),
    native_status(Before),reset_global_defaults(Before.revision,Reset),
    assertion(Reset.global.direction.summary.value==":BACKWARD"),
    assertion(Reset.global.missing_assertion_strength.summary.value==":DEFAULT"),
    assertion(oc_tva(x_A,false)),assertion(cyc_bayes_value(x_Mt,default_strength,0)),
    assertion(cyc_bayes_value(default,asserted_monotonic_confidence,0.97)),
    assertion(cyc_bayes_value(default,asserted_default_confidence,0.66)).
:- end_tests(missing_strength).
