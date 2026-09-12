:- ensure_loaded(test_term_roles).
:- begin_tests(nat_browser).
:- use_module('../kb_nat_browser').
:- use_module('../kb_term_roles').
:- use_module('../kb_non_atomic').
:- use_module('../kb_cache',[read_cache/3,write_cache/4,file_digest/2]).
:- use_module('../kb_store',[]).
:- use_module('../kb_runtime',[]).
:- use_module(library(http/json)).

index(Terms,Index) :- plunit_term_roles:index(Terms,Index).
row(N,Term,Mt,Row) :- plunit_term_roles:row(N,Term,Mt,Row).
catalog(Terms,Catalog) :- index(Terms,Index),Catalog=Index.natCatalog,assertion(ground(Catalog)).
json_ready(Reply) :-
    assertion(ground(Reply)),with_output_to(string(_),json_write_dict(current_output,Reply)).
item(Catalog,Term,Item) :- non_atomic_key(Term,Key),nat_item(Catalog,Key,Item).
category_keys(Item,Keys) :- findall(K,(member(C,Item.categories),K=C.key),Keys).
type_keys(Item,Keys) :- findall(K,(member(T,Item.typeConstraints),K=T.key),Keys).
one_result(Catalog,Filters,Item) :-
    nat_page(Catalog,Filters,0,100,Reply),assertion(Reply.total==1),Reply.items=[Item],json_ready(Reply).
export(Term,Kind,Property) :-
    non_atomic_key(Term,Key),
    Property=property{name:term_representation,
      value:term_representation{schema:'powder.term-representation.v1',
                                identity:Key,representation:Kind}}.
metadata_index(Term,Properties,Index) :-
    E=evidence{source:'KBs/export.krf',originalSource:'KBs/original.krf',line:7,properties:Properties},
    build_term_index(23,[loaded(a1,x_isa(Term,x_Thing),x_BaseKB,E)],Index).
facet(Catalog,Kind,Key,Value) :-
    nat_facet_page(Catalog,_{},Kind,0,100,Reply),
    member(Value,Reply.items),Value.key==Key,!.

test(empty_catalog_is_bounded_and_ground) :-
    catalog([],C),nat_page(C,_{},0,20,R),
    assertion(R.total==0),assertion(R.overallTotal==0),assertion(R.items==[]),
    assertion(R.facets.categories.total==0),json_ready(R).
test(primary_list_excludes_variables_logical_forms_quotes_and_suffix_guesses) :-
    catalog([x_GuessFn(x_a),x_UPPER(x_b),x_p(x_Fn(X)),
             x_implies(x_p(x_a),x_q(x_b)),x_quote(x_QuotedFn(x_c))],C),
    assertion(var(X)),nat_page(C,_{},0,100,R),assertion(R.total==0),
    assertion(R.coverage.nongroundDenotingPositions==1).
test(full_arguments_and_arities_remain_distinct_but_constructor_is_one_facet) :-
    catalog([x_p(x_Fn(x_a)),x_p(x_Fn(x_b)),x_p(x_Fn(x_a,x_b)),x_p(x_Fn(x_a))],C),
    nat_page(C,_{constructor:x_Fn},0,2,First),assertion(First.total==3),
    First.items=[A,_],non_atomic_key(x_Fn(x_a),A.identity),assertion(A.count==2),
    nat_page(C,_{constructor:x_Fn},2,2,Last),assertion(length(Last.items,1)),
    facet(C,constructors,x_Fn,F),assertion(F.count==3),
    facet(C,representations,unknown,U),assertion(U.count==3).
test(whole_term_typing_can_establish_denotation_despite_other_predicate_usage) :-
    catalog([x_Fn(x_a),x_isa(x_Fn(x_a),x_Date)],C),
    item(C,x_Fn(x_a),Item),assertion(Item.expression.denotesNat==true),
    type_keys(Item,[x_Date]),category_keys(Item,['type:x_Date']).
test(whole_formula_type_and_logical_isa_subject_do_not_become_nats) :-
    catalog([x_isa(x_implies(x_a,x_b),x_CycFormula),
             x_isa(x_p(x_a),x_CycFormula)],C),
    assertion(C.total==0).
test(all_explicit_whole_term_types_survive_without_a_winner_or_duplicates) :-
    Nat=x_Fn(x_a),
    catalog([x_isa(Nat,x_B),x_isa(Nat,x_A),x_isa(Nat,x_A)],C),
    item(C,Nat,I),type_keys(I,[x_A,x_B]),assertion(I.typeCount==2),
    assertion(I.typeEvidenceCount==3),assertion(I.count==3),
    category_keys(I,['type:x_A','type:x_B']),
    facet(C,types,x_A,A),facet(C,types,x_B,B),assertion(A.count==1),assertion(B.count==1),
    nat_page(C,_{types:[x_A,x_B]},0,100,R),assertion(R.total==1).
test(constructor_and_argument_isa_types_do_not_type_the_whole_application) :-
    catalog([x_isa(x_Fn,x_UnaryFunction),x_isa(x_a,x_Human),x_p(x_Fn(x_a))],C),
    item(C,x_Fn(x_a),I),assertion(I.typeCount==0),category_keys(I,[unknown]).
test(result_isa_and_result_genl_are_distinct_evidence_not_fabricated_isa) :-
    Nat=x_Fn(x_a),
    catalog([x_p(Nat),x_resultIsa(x_Fn,x_Object),x_resultGenl(x_Fn,x_Animal)],C),
    item(C,Nat,I),type_keys(I,[x_Animal,x_Object]),assertion(I.categoryCount==2),
    category_keys(I,['resultGenl:x_Animal','type:x_Object']),
    forall(member(E,I.typeEvidence),assertion(E.scope==constructor_declaration)),
    assertion(\+ (member(E,I.typeEvidence),get_dict(predicate,E,x_isa))),
    one_result(C,_{type:x_Animal},_),
    assertion(I.representation.status==unknown),
    assertion(C.coverage.nat_categories.infersIsa==false).
test(declaration_scope_and_original_source_are_preserved_without_mt_inheritance) :-
    Nat=x_Fn(x_a),row(1,x_p(Nat),x_UseMt,R1),
    row(2,x_resultIsa(x_Fn,x_Type),x_DeclarationMt,R2),
    build_term_index(5,[R1,R2],Index),item(Index.natCatalog,Nat,I),
    I.typeEvidence=[E],assertion(E.mt==x_DeclarationMt),
    assertion(E.source=='KBs/current.krf'),assertion(E.originalSource=='KBs/original.krf'),
    assertion(E.assertionId==a2),assertion(E.line==2),
    assertion(E.scope==constructor_declaration),
    assertion(Index.natCatalog.coverage.nat_categories.infersMtInheritance==false).
test(negative_quoted_conditional_and_executable_typing_are_not_categories) :-
    Nat=x_Fn(x_a),
    catalog([x_p(Nat),x_not(x_isa(Nat,x_Negative)),x_quote(x_isa(Nat,x_Quoted)),
             x_implies(x_p(x_a),x_isa(Nat,x_Conditional)),
             (x_resultIsa(x_Fn,x_Rule):-and(throw(must_never_run))),
             x_not(x_resultGenl(x_Fn,x_NegGenl))],C),
    item(C,Nat,I),category_keys(I,[unknown]),assertion(I.typeCount==0).
test(positive_conjunction_types_keep_their_original_paths) :-
    Nat=x_Fn(x_a),catalog([x_and(x_isa(Nat,x_A),x_resultIsa(x_Fn,x_B))],C),
    item(C,Nat,I),type_keys(I,[x_A,x_B]),
    findall(P,(member(E,I.typeEvidence),P=E.path),Paths),
    sort(Paths,[[args,0],[args,1]]).
test(actual_compound_context_adds_a_role_category_not_an_isa_claim) :-
    Mt=x_MtFn(x_Project),row(1,x_p(x_a),Mt,R),build_term_index(3,[R],Index),
    item(Index.natCatalog,Mt,I),category_keys(I,[compound_microtheory]),
    assertion(I.typeCount==0),assertion(I.contextEvidenceCount==1),
    assertion(I.representation.status==unknown),json_ready(I).
test(referenced_compound_mt_is_categorized_without_content_or_inheritance_inference) :-
    Mt=x_MtFn(x_Project),index([x_genlMt(Mt,x_Parent)],Index),
    item(Index.natCatalog,Mt,I),category_keys(I,[compound_microtheory]),
    index_term(Index,I.identity,Detail),assertion(Detail.totals.context==0),
    assertion(Detail.nat==I).
test(untyped_category_is_explicit_and_does_not_win_over_real_type_evidence) :-
    catalog([x_p(x_Unknown(x_a)),x_isa(x_Typed(x_b),x_Type)],C),
    one_result(C,_{category:unknown},Unknown),
    non_atomic_key(x_Unknown(x_a),Unknown.identity),
    one_result(C,_{category:'type:x_Type'},Typed),non_atomic_key(x_Typed(x_b),Typed.identity).
test(full_compound_constructor_filters_and_declarations_do_not_flatten_arguments) :-
    A=t(x_Ctor(x_a),1),B=t(x_Ctor(x_b),1),
    catalog([x_p(A),x_p(B),x_resultIsa(x_Ctor(x_a),x_AResult)],C),
    non_atomic_key(x_Ctor(x_a),KA),non_atomic_key(x_Ctor(x_b),KB),
    one_result(C,_{constructor:KA},IA),non_atomic_key(A,IA.identity),
    type_keys(IA,[x_AResult]),
    one_result(C,_{constructor:KB},IB),non_atomic_key(B,IB.identity),assertion(IB.typeCount==0),
    nat_page(C,_{constructors:[KA,KB]},0,100,Outer),assertion(Outer.total==2),
    nat_page(C,_{constructor:x_Ctor},0,100,Constructors),assertion(Constructors.total==2).
test(type_and_constructor_and_search_filters_intersect_before_paging) :-
    catalog([x_isa(x_Fn("A"),x_A),x_isa(x_Fn("B"),x_B),
             x_isa(x_Other("A"),x_A)],C),
    one_result(C,_{constructor:x_Fn,type:x_A,q:"Fn"},I),
    non_atomic_key(x_Fn("A"),I.identity),
    nat_page(C,_{constructor:x_Fn,type:x_A,q:"Other"},0,100,Empty),
    assertion(Empty.total==0),assertion(Empty.overallTotal==3).
test(exact_nat_search_preserves_all_argument_types_strings_and_case) :-
    A=x_Fn("A",x_Case),B=x_Fn("a",x_case),
    catalog([x_p(A),x_p(B)],C),non_atomic_key(A,Key),
    one_result(C,_{q:Key,match:exact},I),assertion(I.identity==Key).
test(groundness_names_ontology_types_and_assertion_ids_do_not_establish_reification) :-
    Nat=x_NartLookingFn(x_a),
    catalog([x_isa(Nat,x_NART),x_isa(Nat,x_CycLNonAtomicReifiedTerm)],C),
    item(C,Nat,I),assertion(I.representation==representation{status:unknown,kinds:[]}),
    nat_page(C,_{representation:nart},0,100,N),assertion(N.total==0),
    one_result(C,_{representation:unknown},_).
test(versioned_term_targeted_export_establishes_representation_without_isa_creation) :-
    Nat=x_Fn(x_a),export(Nat,nart,Export),metadata_index(Nat,[Export],Index),
    one_result(Index.natCatalog,_{representation:nart},I),
    assertion(I.representation==representation{status:known,kinds:[nart]}),
    assertion(I.representationEvidenceCount==1),I.representationEvidence=[E],
    assertion(E.assertionId==a1),assertion(E.propertyPosition==0),
    assertion(E.originalSource=='KBs/original.krf'),
    assertion(I.typeCount==1),type_keys(I,[x_Thing]).
test(conflicting_exports_preserve_both_facets_without_a_winner) :-
    Nat=x_Fn(x_a),export(Nat,nart,Nart),export(Nat,naut,Naut),
    metadata_index(Nat,[Nart,Naut],Index),C=Index.natCatalog,
    one_result(C,_{representation:conflicting},I),
    assertion(I.representation==representation{status:conflicting,kinds:[nart,naut]}),
    forall(member(Kind,[nart,naut]),one_result(C,_{representation:Kind},_)),
    nat_facet_page(C,_{},representations,0,100,F),
    assertion(F.total==3),assertion(F.uniqueTerms==1),
    forall(member(V,F.items),assertion(V.count==1)).
test(unversioned_flags_and_text_are_not_interpreted_as_representation) :-
    Nat=x_Fn(x_a),Props=[_{name:reified,value:true},_{name:term_type,value:nart},
                        _{name:term_representation,value:"NART"}],
    metadata_index(Nat,Props,Index),one_result(Index.natCatalog,_{representation:unknown},_),
    assertion(Index.natCatalog.coverage.nat_categories.representationIssueCount==1).
test(orphan_representation_export_cannot_invent_a_term) :-
    export(x_Absent(x_b),nart,P),metadata_index(x_Fn(x_a),[P],Index),
    assertion(Index.natCatalog.total==1),
    assertion(Index.natCatalog.coverage.nat_categories.representationIssueCount==1),
    one_result(Index.natCatalog,_{representation:unknown},_).
test(malformed_export_key_is_data_only_and_reported) :-
    P=_{name:term_representation,value:_{schema:'powder.term-representation.v1',
         identity:'nat::-(throw(must_not_execute))',representation:nart}},
    metadata_index(x_Fn(x_a),[P],Index),
    assertion(Index.natCatalog.coverage.nat_categories.representationIssueCount==1).
test(global_browse_partitions_terms_then_nats_then_external_before_paging) :-
    index([x_afterAdding(x_p,x_SubLQuoteFn(x_Method)),x_Method(x_a),
           x_isa(x_Fn(x_a),x_Type)],Index),
    browse_page(Index,_{},0,100,All),
    assertion(All.sectionOrder==[terms,non_atomic,external]),
    findall(R,(member(I,All.items),section_rank(I.section,R)),Ranks),msort(Ranks,Ranks),
    findall(K,(member(I,All.items),K=I.identity),Keys),sort(Keys,Unique),
    assertion(length(Keys,All.total)),assertion(same_length(Keys,Unique)),
    Start=All.sectionTotals.terms,browse_page(Index,_{},Start,1,Boundary),
    Boundary.items=[N],assertion(N.section==non_atomic),
    browse_page(Index,_{section:external},0,100,External),assertion(External.total==1),
    External.items=[Method],assertion(Method.identity==x_Method),
    assertion(External.overallTotal==All.total),assertion(External.sectionTotal==1),json_ready(All).
section_rank(terms,0).
section_rank(non_atomic,1).
section_rank(external,2).
test(global_nat_filters_do_not_guess_types_for_atomic_sections) :-
    index([x_isa(x_Fn(x_a),x_Type),x_isa(x_Atomic,x_Type),
           x_afterAdding(x_p,x_SubLQuoteFn(x_Method))],Index),
    browse_page(Index,_{type:x_Type},0,100,R),assertion(R.total==1),
    R.items=[I],assertion(I.section==non_atomic),
    browse_page(Index,_{type:x_Type,section:terms},0,100,Terms),
    assertion(Terms.total==0),assertion(Terms.matchingOverallTotal==1),
    assertion(Terms.sectionTotal>0).
test(facet_counts_deduplicate_multityped_rows_and_duplicate_assertions) :-
    Nat=x_Fn(x_a),catalog([x_isa(Nat,x_A),x_isa(Nat,x_A),x_isa(Nat,x_B)],C),
    nat_facet_page(C,_{types:[x_A,x_B]},types,0,1,Page),
    assertion(Page.total==2),assertion(Page.uniqueTerms==1),
    Page.items=[A],assertion(A.key==x_A),assertion(A.count==1),
    nat_facet_page(C,_{types:[x_A,x_B]},types,1,1,Next),Next.items=[B],
    assertion(B.key==x_B),assertion(B.count==1).
test(category_facet_merges_evidence_predicates_instead_of_choosing_first) :-
    catalog([x_isa(x_Direct(x_a),x_Type),x_p(x_Declared(x_b)),
             x_resultIsa(x_Declared,x_Type)],C),
    facet(C,categories,'type:x_Type',T),
    assertion(T.predicates==[x_isa,x_resultIsa]),assertion(T.count==2).
test(previews_are_bounded_and_full_multitype_membership_remains_pageable) :-
    Nat=x_Fn(x_a),findall(x_isa(Nat,Type),(between(1,45,N),format(atom(Type),'x_T~|~`0t~d~2+',[N])),Terms),
    catalog(Terms,C),one_result(C,_{},I),
    assertion(I.typeCount==45),assertion(length(I.typeConstraints,32)),
    assertion(I.typeConstraintsTruncated==true),assertion(I.categoryCount==45),
    assertion(length(I.categories,32)),assertion(I.categoriesTruncated==true),
    assertion(I.typeEvidenceCount==45),assertion(length(I.typeEvidence,8)),
    nat_page(C,_{},0,1,R),assertion(R.facets.types.total==45),
    assertion(length(R.facets.types.items,20)),
    nat_facet_page(C,_{q:I.identity,match:exact},types,40,10,Last),
    assertion(Last.total==45),assertion(length(Last.items,5)),json_ready(Last).
test(row_order_does_not_change_catalog_or_filtered_pages) :-
    plunit_term_roles:rows([x_isa(x_Fn(x_a),x_A),x_resultIsa(x_Fn,x_B),x_p(x_Fn(x_b))],Rows),
    reverse(Rows,Reversed),build_term_index(8,Rows,A),build_term_index(8,Reversed,B),
    nat_page(A.natCatalog,_{},0,100,RA),nat_page(B.natCatalog,_{},0,100,RB),assertion(RA==RB).
test(variable_type_claims_remain_unknown_without_binding) :-
    Nat=x_Fn(x_a),catalog([x_p(Nat),x_isa(Nat,T),x_resultIsa(x_Fn,U)],C),
    assertion(var(T)),assertion(var(U)),item(C,Nat,I),category_keys(I,[unknown]).
test(page_limit_validation,[throws(error(domain_error(nat_page_limit,101),_))]) :-
    catalog([],C),nat_page(C,_{},0,101,_).
test(unknown_filter_is_rejected,[throws(error(domain_error(nat_filter,execute),_))]) :-
    catalog([],C),nat_page(C,_{execute:halt},0,10,_).
test(duplicate_singular_plural_filter_is_rejected,
     [throws(error(domain_error(duplicate_nat_filter,constructor),_))]) :-
    catalog([],C),nat_page(C,_{constructor:x_Fn,constructors:[x_Fn]},0,10,_).
test(atomic_section_cannot_be_misreported_as_a_nat_page,
     [throws(error(domain_error(nat_only_section,terms),_))]) :-
    catalog([],C),nat_page(C,_{section:terms},0,10,_).

test(native_generation_rebuild_removes_stale_categories_without_refreshing_retained_source,
     [setup(plunit_term_roles:fixture(S)),cleanup(plunit_term_roles:cleanup(S))]) :-
    row(1,x_p(x_Fn(x_a)),x_BaseKB,R1),row(2,x_resultIsa(x_Fn,x_Type),x_BaseKB,R2),
    plunit_term_roles:fixture_cache('nat-values.krf',[R1],Values,VC),
    plunit_term_roles:fixture_cache('nat-types.krf',[R2],Types,TC),
    plunit_term_roles:load_fixture(Values,VC,_),plunit_term_roles:load_fixture(Types,TC,Loaded),
    kb_store:source_module(Values,Module,Native),
    findall(Id-Ref,kb_runtime:module_assertion(Module,Id,_,Ref),Before),
    file_digest(Values,VHash),file_digest(VC,CHash),
    browse_nats(_{type:x_Type},0,100,Initial),assertion(Initial.total==1),
    assertion(Initial.generation==Loaded.generation),
    nat_facets(_{},types,0,100,Facets),assertion(Facets.total==1),
    kb_store:unload_source(Types,Loaded.generation,Unloaded),
    browse_nats(_{type:x_Type},0,100,Missing),assertion(Missing.total==0),
    browse_nats(_{category:unknown},0,100,Unknown),assertion(Unknown.total==1),
    assertion(Unknown.generation==Unloaded.generation),
    findall(Id-Ref,kb_runtime:module_assertion(Module,Id,_,Ref),After),assertion(Before==After),
    kb_store:source_module(Values,Module,Native),file_digest(Values,VHash),file_digest(VC,CHash),
    plunit_term_roles:load_fixture(Types,TC,Reloaded),
    browse_nats(_{type:x_Type},0,100,Again),assertion(Again.total==1),
    assertion(Again.generation==Reloaded.generation).
test(real_exported_binary_metadata_establishes_nart_without_source_parsing,
     [setup(plunit_term_roles:fixture(S)),cleanup(plunit_term_roles:cleanup(S))]) :-
    Nat=x_Fn(x_a),row(1,x_isa(Nat,x_Thing),x_BaseKB,R),
    plunit_term_roles:fixture_cache('typed-export.krf',[R],Source,Cache),
    export(Nat,nart,P),read_cache(Cache,H,[record(Id,T,Metadata)]),
    append(Metadata,[xc_term_representation(Id,P.value)],WithExport),
    write_cache(Cache,H,[record(Id,T,WithExport)],_),
    plunit_term_roles:load_fixture(Source,Cache,Loaded),
    file_digest(Source,SH),file_digest(Cache,CH),
    browse_nats(_{representation:nart},0,100,Page),
    assertion(Page.total==1),assertion(Page.generation==Loaded.generation),
    Page.items=[I],assertion(I.representation.kinds==[nart]),
    assertion(I.representationEvidenceCount==1),json_ready(Page),
    file_digest(Source,SH),file_digest(Cache,CH).

:- end_tests(nat_browser).
