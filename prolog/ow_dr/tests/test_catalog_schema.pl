:- begin_tests(catalog_schema).
:- use_module('../kb_catalog_schema').
:- use_module(library(assoc)).

proof(e('KBs/schema.krf',a1,12,x_OntologyMt,[])).
claim(Kind,A,B,claim(Kind,A,B,E)) :- proof(E).
schema(Claims,Schema) :- maplist(expand_claim,Claims,Evidence),build_catalog_schema(Evidence,Schema).
expand_claim(c(K,A,B),Claim) :- claim(K,A,B,Claim).

test(semantic_subclass_memberships_preserve_multiple_types) :-
    schema([c(genls,x_CustomPredicate,x_Predicate),c(genls,x_CustomCollection,x_Collection),
            c(isa,x_p,x_CustomPredicate),c(isa,x_p,x_CustomCollection)],S),
    term_classification(x_p,[],S,R),
    assertion(R.groups==[collections,predicates]),assertion(R.types=[_,_]),
    assertion(R.implementation==unknown).
test(meta_function_is_predicate_not_callable_function) :-
    schema([c(genls,x_MetaFunction,x_MetaRelation),c(genls,x_MetaRelation,x_Predicate),
            c(genls,x_BinaryPredicate,x_Predicate),
            c(isa,x_resultIsa,x_MetaFunction),c(isa,x_resultIsa,x_BinaryPredicate)],S),
    term_classification(x_resultIsa,[],S,R),
    assertion(R.groups==[predicates]),assertion(R.metaRelation\==[]).
test(suffix_is_not_ontology_evidence) :-
    schema([c(isa,x_p,x_SomethingFunction)],S),term_classification(x_p,[],S,R),
    assertion(R.groups==[individuals]).
test(meta_relation_requires_proven_target_slot) :-
    schema([c(isa,x_unknownSchema,x_MetaRelation)],S),
    definition_slots(x_unknownSchema,S,Slots),assertion(Slots==[]).
test(target_can_be_second_argument) :-
    schema([c(isa,x_describesRelation,x_MetaRelation),
            c(target_slot,x_describesRelation,slot(1,x_String)),
            c(target_slot,x_describesRelation,slot(2,x_Relation))],S),
    definition_slots(x_describesRelation,S,Slots),assertion(Slots==[2]).
test(subpredicate_inherits_proven_slot_with_provenance) :-
    schema([c(isa,x_schema,x_MetaRelation),c(target_slot,x_schema,slot(2,x_Predicate)),
            c(genlPreds,x_specificSchema,x_schema)],S),
    definition_slots(x_specificSchema,S,[2]),
    get_assoc(x_specificSchema,S.targetSlots,[slot(2,target_evidence(_,_,_,Path))]),
    assertion(Path=[e('KBs/schema.krf',a1,12,x_OntologyMt,[])]).
test(cyclic_and_diamond_hierarchy_terminates) :-
    schema([c(genls,x_A,x_B),c(genls,x_B,x_A),c(genls,x_A,x_Predicate),
            c(genls,x_B,x_Predicate),c(isa,x_p,x_A)],S),
    term_classification(x_p,[],S,R),assertion(R.groups==[predicates]).
test(unknown_constants_remain_visible) :-
    schema([],S),term_classification(x_unknown,[],S,R),assertion(R.groups==[unclassified]).
test(type_only_collection_not_executable_predicate) :-
    schema([c(isa,x_p,x_Collection)],S),term_classification(x_p,[],S,R),
    assertion(R.groups==[collections]),assertion(R.implementation==unknown).
test(source_scope_is_retained_without_mt_entailment) :-
    proof(P),build_catalog_schema([claim(genls,x_A,x_Predicate,P),claim(isa,x_p,x_A,P)],S),
    term_classification(x_p,[],S,R),assertion(R.scope==catalog_taxonomy_not_mt_entailment),
    R.evidence=[predicates-type_evidence(x_A,P,x_Predicate,[P])].
test(do_invocations_use_exact_case_and_predicate_evidence) :-
    schema([],S),
    forall(member(Key,[x_doAttack,x_doMove,x_doInvoke]),
      (term_classification(Key,[predicate_symbol],S,R),
       assertion(memberchk(do_invocations,R.groups)),assertion(memberchk(predicates,R.groups)))),
    forall(member(Key,[x_domain,x_double,x_dog,x_do,x_doattack,x_DoAttack]),
      (term_classification(Key,[predicate_symbol],S,R),assertion(\+memberchk(do_invocations,R.groups)))).
test(do_named_unrelated_constant_and_collection_are_excluded) :-
    schema([c(isa,x_doSomething,x_Collection)],S),
    term_classification(x_doSomething,[],S,R),assertion(R.groups==[collections]),
    term_classification(x_doUnknown,[],S,U),assertion(U.groups==[unclassified]).
test(do_relation_type_and_schema_declaration_qualify) :-
    schema([c(isa,x_doRel,x_Relation),c(relation_declaration,x_doDeclared,declared)],S),
    term_classification(x_doRel,[],S,R),assertion(memberchk(do_invocations,R.groups)),
    term_classification(x_doDeclared,[],S,D),assertion(memberchk(do_invocations,D.groups)).

:- end_tests(catalog_schema).
