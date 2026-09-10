:- begin_tests(inventory_rules).
:- use_module('../kb_inventory_rules').

test(logical_is_separate_from_executable_with_consequent_heads) :-
    rule_classification(x_implies(x_p(X),x_and(x_q(X),x_not(x_r(X)))),Info),
    assertion(Info.semanticRule==true),assertion(Info.executableRule==false),
    assertion(Info.heads=[_{predicate:x_q,arity:1,role:consequent,polarity:positive},
                          _{predicate:x_r,arity:1,role:consequent,polarity:negative}]),
    assertion(var(X)).
test(two_equals_keeps_its_identity_without_execution) :-
    rule_classification('x_<=='(x_p(X),x_q(X),x_r(X)),Info),
    assertion(Info.kind==two_equals_operator_data),assertion(Info.executableRule==false).
test(head_only_and_propositional_rule_data) :-
    forall(member(Term,['x_<=='(x_p(X)),'x_<=='(x_p(X),x_false)]),
      (rule_classification(Term,Info),assertion(Info.semanticRule==true))),
    rule_classification(x_implies(x_true,x_false),Info),
    assertion(Info.heads=[_{predicate:x_false,arity:0,role:consequent,polarity:positive}]).
test(package_qualified_semantic_symbols) :-
    rule_classification('x_<=='('fire::answer'(X),'fire::premise'(X)),Info),
    assertion(Info.heads=[_{predicate:'fire::answer',arity:1,role:head,polarity:positive}]).
test(scoped_and_biconditional_shapes) :-
    rule_classification(x_forAll(X,x_equiv(x_p(X),x_q(X))),Info),
    assertion(Info.kind==biconditional),assertion(length(Info.heads,2)).
test(negations_and_arbitrary_nonground_data_are_not_rules) :-
    forall(member(Term,[x_not(x_implies(x_p(X),x_q(X))),x_isa(X,x_Dog),
                        metta_exec('x_<==='(x_p(X),x_q(X))),x_exists(x_IndexicalFn(x_role))]),
      (rule_classification(Term,Info),assertion(Info.semanticRule==false))).
test(executable_envelope_is_distinct) :-
    rule_classification((x_p(X):-and(x_q(X))),Info),
    assertion(Info.semanticRule==true),assertion(Info.executableRule==true).
:- end_tests(inventory_rules).
