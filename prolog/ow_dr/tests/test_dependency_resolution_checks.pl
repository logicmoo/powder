:- begin_tests(dependency_resolution_checks).
:- use_module('../kb_dependency_resolution_checks').
:- use_module('../kb_dependency_resolution_policy').

scope(scope{mt:x_TestMt,generation:1,roots:[],catalogRevision:fixture,taxonomyRevision:fixture}).
coverage(coverage{catalogComplete:true,freshness:complete,rows:complete,
  definitions:complete,relations:complete,returnInference:complete,mtDeclarations:complete,issues:[]}).
row(Semantic,Mt,Loaded,Id,row(Semantic,evidence{id:Id,source:'KBs/fixture.krf',
  originalSource:'historical/fixture.krf',line:12,mt:Mt,loaded:Loaded,dialect:krf})).
report(Terms,Rows,Report) :- scope(S),coverage(C),default_policy(P),analyze_report(S,Terms,Rows,C,P,Report).
finding(Report,Kind,Finding) :- member(Finding,Report.items),Finding.kind==Kind,!.
status(Report,Kind,Status) :- finding(Report,Kind,Finding),assertion(Finding.status==Status).

test(ordinary_fact_is_not_a_definition) :-
    row(x_p(x_a),x_TestMt,true,a1,R),report([x_p],[R],Out),
    status(Out,definition,missing_complete_catalog).
test(semantic_conclusion_not_antecedent_defines,[nondet]) :-
    row(x_implies(x_q(X),x_p(X)),x_TestMt,true,a1,R),
    report([x_p,x_q],[R],Out),
    member(P,Out.items),P.term==x_p,P.kind==definition,
    member(Q,Out.items),Q.term==x_q,Q.kind==definition,
    assertion(P.status==loaded_available),assertion(Q.status==missing_complete_catalog),
    assertion(var(X)),assertion(ground(Out)).
test(numbered_declaration_subject) :-
    row(x_arg2Isa(x_p,x_Class),x_TestMt,true,a1,R),report([x_p],[R],Out),
    status(Out,definition,loaded_available),finding(Out,definition,F),
    F.evidence=[E],assertion(E.kind==declaration_subject).
test(equivalence_negative_and_quantified_heads,[nondet]) :-
    row(x_forAll(X,x_equiv(x_q(X),x_and(x_p(X),x_not(x_r(X))))),x_TestMt,true,a1,R),
    report([x_p,x_q,x_r],[R],Out),
    forall((member(F,Out.items),F.kind==definition),assertion(F.status==loaded_available)),
    member(RF,Out.items),RF.term==x_r,RF.kind==definition,
    RF.evidence=[E],assertion(E.polarity==negative),assertion(var(X)).
test(quantified_fact_not_a_definition) :-
    row(x_forAll(X,x_p(X)),x_TestMt,true,a1,R),report([x_p],[R],Out),
    status(Out,definition,missing_complete_catalog).
test(static_rule_body_not_called) :-
    row((x_p(X):-and(throw(must_not_execute(X)))),x_TestMt,true,a1,R),
    report([x_p],[R],Out),status(Out,definition,loaded_available),assertion(var(X)).
test(two_equals_stays_non_executable) :-
    row('x_<=='(x_p(X),x_q(X)),x_TestMt,true,a1,R),report([x_p],[R],Out),
    finding(Out,definition,F),F.evidence=[E],
    assertion(E.executableSyntax==false),assertion(E.semanticRuleKind==two_equals_operator_data).
test(other_mt_does_not_satisfy) :-
    row(x_p(x_a),x_TestMt,true,a1,Use),
    row(x_arity(x_p,1),x_OtherMt,true,a2,Declaration),
    report([x_p],[Use,Declaration],Out),status(Out,definition,indeterminate).
test(unloaded_same_mt_support) :-
    row(x_p(x_a),x_TestMt,true,a1,Use),
    row(x_arity(x_p,1),x_TestMt,false,a2,Declaration),
    report([x_p],[Use,Declaration],Out),status(Out,definition,exists_unloaded_source).
test(incomplete_catalog_cannot_prove_missing) :-
    scope(S),coverage(C0),C=C0.put(catalogComplete,false),default_policy(P),
    row(x_p(x_a),x_TestMt,true,a1,R),analyze_report(S,[x_p],[R],C,P,Out),
    status(Out,definition,indeterminate).
test(stale_cannot_prove_missing) :-
    scope(S),coverage(C0),C=C0.put(freshness,stale),default_policy(P),
    row(x_p(x_a),x_TestMt,true,a1,R),analyze_report(S,[x_p],[R],C,P,Out),
    status(Out,definition,indeterminate).
test(direct_result_type) :-
    row(x_resultIsa(x_TestFn,x_Thing),x_TestMt,true,a1,R),
    report([x_TestFn],[R],Out),status(Out,function_result_isa,loaded_available).
test(result_genl_is_separate) :-
    row(x_resultGenl(x_TestFn,x_Thing),x_TestMt,true,a1,R),
    report([x_TestFn],[R],Out),status(Out,function_result_isa,missing_complete_catalog),
    finding(Out,function_result_isa,F),assertion(F.why.separateConstraints\=[]).
test(unsupported_return_inference_is_unknown) :-
    scope(S),coverage(C0),C=C0.put(returnInference,partial),default_policy(P),
    analyze_report(S,[x_TestFn],[],C,P,Out),status(Out,function_result_isa,indeterminate).
test(actual_same_mt_return_schema) :-
    row(x_resultIsaArg(x_TestFn,2),x_TestMt,true,a1,A),
    row(x_arg2Genl(x_TestFn,x_Class),x_TestMt,true,a2,B),
    row(x_implies(x_and(x_resultIsaArg(F,2),x_arg2Genl(F,C)),x_resultIsa(F,C)),x_TestMt,true,a3,Schema),
    report([x_TestFn],[A,B,Schema],Out),status(Out,function_result_isa,loaded_available),
    finding(Out,function_result_isa,Result),Result.evidence=[E],
    assertion(E.kind==schema_supported_resultIsa),assertion(var(F)),assertion(var(C)).
test(return_schema_not_invented) :-
    row(x_resultIsaArg(x_TestFn,2),x_TestMt,true,a1,A),
    row(x_arg2Genl(x_TestFn,x_Class),x_TestMt,true,a2,B),
    report([x_TestFn],[A,B],Out),status(Out,function_result_isa,missing_complete_catalog).
test(return_schema_other_mt_not_visible) :-
    row(x_resultIsaArg(x_TestFn,2),x_TestMt,true,a1,A),
    row(x_arg2Genl(x_TestFn,x_Class),x_TestMt,true,a2,B),
    row(x_implies(x_and(x_resultIsaArg(F,2),x_arg2Genl(F,C)),x_resultIsa(F,C)),x_OtherMt,true,a3,Schema),
    report([x_TestFn],[A,B,Schema],Out),status(Out,function_result_isa,missing_complete_catalog).
test(genlpreds_on_function_name_not_return_inheritance) :-
    row(x_genlPreds(x_TestFn,x_ParentFn),x_TestMt,true,a1,A),
    row(x_resultIsa(x_ParentFn,x_Class),x_TestMt,true,a2,B),
    report([x_TestFn],[A,B],Out),status(Out,function_result_isa,missing_complete_catalog).
test(collection_transitive_positive_path) :-
    row(x_genls(x_C,x_D),x_TestMt,true,a1,A),
    row(x_genls(x_D,x_Thing),x_TestMt,true,a2,B),
    report([x_C],[A,B],Out),status(Out,collection_root,loaded_available),
    finding(Out,collection_root,F),length(F.evidence,2).
test(unloaded_collection_path) :-
    row(x_genls(x_C,x_D),x_TestMt,true,a1,A),
    row(x_genls(x_D,x_Thing),x_TestMt,false,a2,B),
    report([x_C],[A,B],Out),status(Out,collection_root,exists_unloaded_source).
test(collection_cycle_terminates_and_reports_gap) :-
    row(x_genls(x_C,x_D),x_TestMt,true,a1,A),
    row(x_genls(x_D,x_C),x_TestMt,true,a2,B),
    report([x_C],[A,B],Out),status(Out,collection_root,missing_complete_catalog).
test(collection_isa_does_not_create_root_edge) :-
    row(x_isa(x_C,x_Collection),x_TestMt,true,a1,A),
    report([x_C],[A],Out),status(Out,collection_root,missing_complete_catalog).
test(collection_cross_mt_path_forbidden) :-
    row(x_genls(x_C,x_D),x_TestMt,true,a1,A),
    row(x_genls(x_D,x_Thing),x_OtherMt,true,a2,B),
    report([x_C],[A,B],Out),status(Out,collection_root,missing_complete_catalog).
test(thing_exempt) :- report([x_Thing],[],Out),status(Out,collection_root,exempt).
test(negative_genls_not_positive_path) :-
    row(x_isa(x_C,x_Collection),x_TestMt,true,a1,A),
    row(x_not(x_genls(x_C,x_Thing)),x_TestMt,true,a2,B),
    report([x_C],[A,B],Out),status(Out,collection_root,missing_complete_catalog).
test(mt_declaration_requires_basekb_assertion_context) :-
    row(x_p(x_a),x_TestMt,true,a1,A),
    row(x_isa(x_TestMt,x_Microtheory),x_OtherMt,true,a2,B),
    report([x_TestMt],[A,B],Out),status(Out,microtheory_declaration,missing_complete_catalog).
test(mt_basekb_context_not_filename) :-
    row(x_p(x_a),x_TestMt,true,a1,A),
    row(x_isa(x_TestMt,x_Microtheory),x_BaseKB,true,a2,B),
    report([x_TestMt],[A,B],Out),status(Out,microtheory_declaration,loaded_available).
test(compound_mt_constructor_typing) :-
    row(x_p(x_a),'mt:x_MtFn(x_a)',true,a1,A),
    row(x_resultIsa(x_MtFn,x_Microtheory),x_BaseKB,true,a2,B),
    report(['nat:x_MtFn(x_a)'],[A,B],Out),
    status(Out,microtheory_declaration,loaded_available),
    finding(Out,microtheory_declaration,F),assertion(F.term=='nat:x_MtFn(x_a)').
test(standalone_mt_reference_is_not_error) :-
    row(x_p(x_a),x_TestMt,true,a1,A),
    row('x_ist-Information'(x_TestMt,x_p(x_a)),x_TestMt,true,a2,B),
    report([x_TestMt],[A,B],Out),status(Out,microtheory_attachment,standalone_reference),
    finding(Out,microtheory_attachment,F),assertion(F.severity==info).
test(metta_not_a_rule_provider) :-
    row(x_p(x_a),x_TestMt,true,a1,A),
    row((x_p(X):-and(x_q(X))),x_TestMt,true,a2,B0),
    B0=row(S,E0),B=row(S,E0.put(dialect,metta)),
    report([x_p],[A,B],Out),status(Out,definition,indeterminate),assertion(var(X)).
test(pagination_filtered_after_policy) :-
    row(x_p(x_a),x_TestMt,true,a1,R),report([x_p],[R],Out),
    report_page(Out,json{kind:definition,offset:0,limit:1},Page),
    assertion(Page.total==1),Page.items=[F],assertion(F.kind==definition).
test(policy_suppression_preserves_findings,[nondet]) :-
    row(x_p(x_a),x_TestMt,true,a1,R),report([x_p],[R],Out),
    policy_preview(json{rules:[json{kind:definition,ignoreTerms:[x_p],severity:info}]},Out.items,Preview),
    member(F,Preview.items),F.kind==definition,
    assertion(F.disposition==suppressed),assertion(F.severity==info),
    assertion(F.status==missing_complete_catalog),assertion(Preview.persisted==false).
test(policy_bounded_literal_pattern,[nondet]) :-
    row(x_p(x_a),x_TestMt,true,a1,R),report([x_p],[R],Out),
    policy_preview(json{rules:[json{kind:definition,patterns:[json{mode:prefix,value:x_}]}]},Out.items,Preview),
    member(F,Preview.items),F.kind==definition,assertion(F.disposition==suppressed).
test(reject_regex_policy,[throws(error(kee(invalid_arguments,_),_))]) :-
    normalize_policy(json{rules:[json{kind:comment,patterns:[json{mode:regex,value:'.*'}]}]},_).
test(reject_duplicate_policy_rule,[throws(error(domain_error(duplicate_policy_rules,_),_))]) :-
    normalize_policy(json{rules:[json{kind:comment},json{kind:comment}]},_).
test(shared_type_hierarchy_supplies_declaration_not_observed_head) :-
    row(x_isa(x_p,x_SpecialPredicate),x_TestMt,true,a1,A),
    row(x_genls(x_SpecialPredicate,x_Predicate),x_TestMt,true,a2,B),
    report([x_p],[A,B],Out),status(Out,definition,loaded_available).
test(type_hierarchy_cannot_cross_contexts) :-
    row(x_p(x_a),x_TestMt,true,a1,Use),
    row(x_isa(x_p,x_SpecialPredicate),x_TestMt,true,a2,A),
    row(x_genls(x_SpecialPredicate,x_Predicate),x_OtherMt,true,a3,B),
    report([x_p],[Use,A,B],Out),status(Out,definition,missing_complete_catalog).
test(variable_rule_head_makes_provider_coverage_unknown) :-
    row(x_p(x_a),x_TestMt,true,a1,A),
    row(x_implies(x_q(X),t(P,X)),x_TestMt,true,a2,B),
    report([x_p],[A,B],Out),status(Out,definition,indeterminate),
    assertion(var(P)),assertion(var(X)).
test(unsupported_conditional_return_rule_is_unknown) :-
    row(x_implies(x_condition(F),x_resultIsa(F,x_Thing)),x_TestMt,true,a1,A),
    report([x_TestFn],[A],Out),status(Out,function_result_isa,indeterminate),assertion(var(F)).
test(external_type_reports_host_requirement_without_execution) :-
    row(x_isa(x_External,x_SubLSymbol),x_TestMt,true,a1,A),
    report([x_External],[A],Out),status(Out,definition,external_implementation_required).
test(compound_mt_constructor_subtype_uses_basekb_evidence) :-
    row(x_p(x_a),'mt:x_MtFn(x_a)',true,a1,A),
    row(x_resultIsa(x_MtFn,x_SpecialMt),x_BaseKB,true,a2,B),
    row(x_genls(x_SpecialMt,x_Microtheory),x_BaseKB,true,a3,C),
    report(['nat:x_MtFn(x_a)'],[A,B,C],Out),status(Out,microtheory_declaration,loaded_available).
test(conflicting_revisions_are_not_marked_resolved) :-
    scope(S),coverage(C0),C=C0.put(issues,[issue{code:loaded_catalog_conflict}]),default_policy(P),
    row(x_arity(x_p,1),x_TestMt,true,a1,A),
    analyze_report(S,[x_p],[A],C,P,Out),status(Out,definition,indeterminate).
test(positive_support_is_not_presented_as_a_policy_error) :-
    scope(S),coverage(C),normalize_policy(json{rules:[json{kind:definition,severity:error}]},P),
    row(x_arity(x_p,1),x_TestMt,true,a1,A),
    analyze_report(S,[x_p],[A],C,P,Out),finding(Out,definition,F),
    assertion(F.severity==info),assertion(F.configuredSeverity==error).
test(unknown_scope_filter_is_rejected,[throws(error(domain_error(report_filter_value,scope-bogus),_))]) :-
    report([x_Thing],[],Out),report_page(Out,json{scope:bogus},_).
test(foreign_reference_reuses_existing_inert_reference_codec) :-
    row(x_callback(x_function(x_EXTERNAL_METHOD)),x_TestMt,true,a1,A),
    report([x_EXTERNAL_METHOD],[A],Out),
    status(Out,definition,external_implementation_required).

:- end_tests(dependency_resolution_checks).

:- begin_tests(dependency_resolution_policy_dto).
:- use_module('../kb_dependency_resolution_policy').
:- use_module('../kb_kee_schema',[]).

test(schema_is_closed_at_every_object_level) :-
    policy_spec(Spec),kb_kee_schema:json_schema(Spec,Schema),
    assertion(Schema.additionalProperties==false),
    assertion(Schema.required==[]),
    Rules=Schema.properties.rules,assertion(Rules.maxItems==6),
    Rule=Rules.items,assertion(Rule.additionalProperties==false),
    assertion(Rule.required==[kind]),
    Patterns=Rule.properties.patterns,assertion(Patterns.maxItems==32),
    Pattern=Patterns.items,assertion(Pattern.additionalProperties==false),
    assertion(Pattern.required==[mode,value]),
    assertion(Pattern.properties.mode.enum==[exact,prefix,suffix]).
test(defaults_are_canonical_complete_dto_not_persisted_record) :-
    default_policy_dto(DTO),policy_spec(Spec),
    kb_kee_schema:validate_stored(Spec,DTO),
    assertion(ground(DTO)),length(DTO.rules,6),
    dict_keys(DTO,Keys),assertion(Keys==[rules]),
    forall(member(Rule,DTO.rules),
      (assertion(Rule.enabled==true),
       assertion(Rule.ignoreTerms==[]),assertion(Rule.ignoreMts==[]),
       assertion(Rule.exemptTypes==[]),assertion(Rule.patterns==[]))).
test(strict_dto_normalization_is_deterministic_and_roundtrips) :-
    Input=json{rules:[json{kind:"definition",severity:"error",
      ignoreTerms:["x_Z","x_A","x_Z"],ignoreMts:["mt:x_MtFn(x_a)"],
      patterns:[json{mode:"prefix",value:"x_"}]}]},
    findall(DTO,validate_policy(Input,DTO),[Canonical]),
    assertion(ground(Canonical)),policy_spec(Spec),
    kb_kee_schema:validate_stored(Spec,Canonical),
    Canonical.rules=[First|_],
    assertion(First.ignoreTerms==["x_A","x_Z"]),
    assertion(First.ignoreMts==["mt:x_MtFn(x_a)"]),
    normalize_policy(Input,FromJSON),normalize_policy(Canonical,FromDTO),
    assertion(FromJSON==FromDTO).
test(programmatic_atoms_preserve_existing_report_format) :-
    normalize_policy(json{rules:[json{kind:definition,ignoreTerms:[x_p],
      patterns:[json{mode:prefix,value:x_}]}]},Programmatic),
    normalize_policy(json{rules:[json{kind:"definition",ignoreTerms:["x_p"],
      patterns:[json{mode:"prefix",value:"x_"}]}]},JSON),
    assertion(Programmatic==JSON),
    Programmatic.rules=[Rule|_],
    assertion(Rule.ignoreTerms==[x_p]),
    assertion(Rule.patterns==[pattern{mode:prefix,value:x_}]).
test(compiled_kee_handler_accepts_already_typed_enum_values) :-
    Input=json{rules:[json{kind:"comment",severity:"warning",
      patterns:[json{mode:"exact",value:"x_Term"}]}]},
    policy_spec(Spec),kb_kee_schema:validate(Spec,Input,Typed),
    Typed.rules=[TypedRule],assertion(TypedRule.kind==comment),
    normalize_policy_dto(Typed,Canonical),validate_policy(Input,Expected),
    assertion(Canonical==Expected),kb_kee_schema:validate_stored(Spec,Canonical).
test(strict_dto_requires_json_text,[throws(error(kee(invalid_arguments,_),_))]) :-
    validate_policy(json{rules:[json{kind:definition}]},_).
test(strict_dto_rejects_duplicate_kinds,
     [throws(error(domain_error(duplicate_policy_rules,_),_))]) :-
    validate_policy(json{rules:[json{kind:"comment"},json{kind:"comment"}]},_).
test(strict_dto_rejects_scope_not_implicitly_per_mt,
     [throws(error(kee(invalid_arguments,_),_))]) :-
    validate_policy(json{mt:"x_BaseKB",rules:[]},_).
test(strict_dto_rejects_rule_actions,[throws(error(kee(invalid_arguments,_),_))]) :-
    validate_policy(json{rules:[json{kind:"comment",action:"generate"}]},_).
test(strict_dto_rejects_nested_pattern_properties,
     [throws(error(kee(invalid_arguments,_),_))]) :-
    validate_policy(json{rules:[json{kind:"comment",
      patterns:[json{mode:"prefix",value:"x_",execute:"anything"}]}]},_).
test(strict_dto_bounds_rule_count,[throws(error(kee(invalid_arguments,_),_))]) :-
    length(Rules,7),maplist(=(json{kind:"comment"}),Rules),
    validate_policy(json{rules:Rules},_).
test(strict_dto_bounds_pattern_count,[throws(error(kee(invalid_arguments,_),_))]) :-
    length(Patterns,33),maplist(=(json{mode:"prefix",value:"x_"}),Patterns),
    validate_policy(json{rules:[json{kind:"comment",patterns:Patterns}]},_).
test(strict_dto_rejects_unbound_values_without_binding_input) :-
    catch(validate_policy(json{rules:[json{kind:"comment",enabled:Flag}]},_),Error,true),
    assertion(nonvar(Error)),assertion(Error=error(kee(invalid_arguments,_),_)),
    assertion(var(Flag)).
test(saving_empty_rule_patch_means_defaults_not_clear) :-
    validate_policy(json{rules:[]},DTO),default_policy_dto(Default),
    assertion(DTO==Default),normalize_policy(DTO,Policy),default_policy(Expected),
    assertion(Policy==Expected).

:- end_tests(dependency_resolution_policy_dto).
