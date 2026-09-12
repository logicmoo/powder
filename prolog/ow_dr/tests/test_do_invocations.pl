:- begin_tests(do_invocations).
:- use_module('../kb_do_invocations').

test(canonical_visible_ascii_prefix_and_encoding) :-
    forall(member(Symbol,[doAttack,doMove,doInvoke,doA,x_doAttack,x_doMove,
                          '#$doAttack',"#$doMove","x_doInvoke","doAttack"]),
      assertion(do_invocation_symbol(Symbol))).
test(case_and_noncapital_suffixes_are_not_normalized_away) :-
    forall(member(Symbol,[domain,double,dog,do,doattack,'DoAttack',x_domain,
                          x_doattack,'x_DoAttack','#$DoAttack','#$doattack',
                          'doÄttack','do1Attack','do_Attack','X_doAttack',
                          x_x_doAttack,'x_#$doAttack',"","do\nAttack"]),
      assertion(\+do_invocation_symbol(Symbol))).
test(naming_check_does_not_claim_evidence) :-
    assertion(do_invocation_symbol(x_doSomething)).
test(nonground_or_structured_inputs_are_not_instantiated_or_executed) :-
    assertion(\+do_invocation_symbol(Variable)),assertion(var(Variable)),
    assertion(\+do_invocation_symbol(doAttack(x_A))),
    assertion(\+do_invocation_symbol([doAttack])).

:- end_tests(do_invocations).
