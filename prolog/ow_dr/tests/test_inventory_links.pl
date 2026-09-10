:- begin_tests(inventory_links).
:- use_module('../kb_inventory_links').

test(typed_relation_discovery_requires_both_positions_and_preserves_evidence) :-
    setup_call_cleanup(
      (retractall(kb_inventory_links:signature(_,_,_,_)),
       retractall(kb_inventory_links:subtype(_,_,_)),
       retractall(kb_inventory_links:subrelation(_,_,_)),
       retractall(kb_inventory_links:mt_type(_,_)),
       retractall(kb_inventory_links:mt_argument(_,_,_))),
      (E=_{source:'fixture.krf',line:1},
       kb_inventory_links:collect_schema(x_arg1Isa(x_otherMtLink,x_SpecialMt),E),
       kb_inventory_links:collect_schema(x_argIsa(x_otherMtLink,2,x_Microtheory),E),
       kb_inventory_links:collect_schema(x_genls(x_SpecialMt,x_Microtheory),E),
       kb_inventory_links:collect_schema(x_arg1Isa(x_oneSided,x_Microtheory),E),
       kb_inventory_links:collect_schema(x_genlPreds(x_childMtLink,x_otherMtLink),E),
       kb_inventory_links:discover_mt_signatures(Relations,Unresolved),
       assertion(Relations==[x_childMtLink,x_otherMtLink]),
       assertion(Unresolved=[_]),
       kb_inventory_links:relation_schema(x_otherMtLink,Schema),
       assertion(Schema.arg1=[_]),assertion(Schema.arg2=[_])),
      (retractall(kb_inventory_links:signature(_,_,_,_)),retractall(kb_inventory_links:subtype(_,_,_)),
       retractall(kb_inventory_links:subrelation(_,_,_)),retractall(kb_inventory_links:mt_type(_,_)),
       retractall(kb_inventory_links:mt_argument(_,_,_)))).

test(compiled_guards_do_not_turn_facts_into_rules) :-
    kb_inventory_links:compiled_semantic((x_p(x_A):-x_cid(a1)),a1,Fact),
    kb_inventory:classify_assertion(Fact,gaf,x_p(x_A)),
    kb_inventory_links:compiled_semantic((x_r(X):-x_cid_io(a2,and(x_p(X)),vs(X),vs)),a2,Rule),
    kb_inventory:classify_assertion(Rule,rule,x_r(X)).
:- end_tests(inventory_links).
