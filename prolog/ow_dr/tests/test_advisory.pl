:- begin_tests(advisory_compilation).
:- use_module('../kb_compile').

test(compound_microtheory_is_valid_data) :-
    Mt=x_CommonsenseMicrostoryMtFn('x_ViolentImpact-Harm'),
    Semantic=x_genlMt(Mt,x_CommonsenseMicrostoryMt),
    kb_compile:assertion_record('microstories-for-copa.krf',
      assertion(Semantic,[],Mt,44,[],key),a44,Record),
    kb_cache:validate_record(Record),
    Record=record(a44,Retained,Metadata),
    assertion(Retained==Semantic),
    assertion(memberchk(xc_microtheory(a44,Mt),Metadata)),
    assertion(\+member(xc_warnings(_,_),Metadata)).

test(unexpected_shape_is_retained_with_warning) :-
    Mt=x_ContextFn(x_Test),
    kb_compile:assertion_record('example.krf',
      assertion(x_data(t(1,2)),[],Mt,9,[],key),a45,Record),
    Record=record(a45,Retained,Metadata),
    assertion(Retained==x_data(t(1,2))),
    memberchk(xc_warnings(a45,[Message]),Metadata),
    memberchk(xc_mapping_rows(a45,[warnings(Message)]),Metadata),
    kb_cache:validate_record(Record).

test(guard_boundary_remains_enforced,[fail]) :-
    kb_cache:storable_semantic(((:-shell(unsafe)) :- and)).
:- end_tests(advisory_compilation).
