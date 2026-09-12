:- ensure_loaded(test_term_resolver).
:- begin_tests(term_categories).
:- use_module('../kb_term_categories').
:- use_module('../kb_term_roles').
:- use_module('../kb_non_atomic').
:- use_module('../kb_term_browser',[]).
:- use_module('../kb_store',[]).
:- use_module('../kb_runtime',[]).
:- use_module('../kb_cache',[file_digest/2]).
:- use_module(library(http/json)).

index(Terms,Index) :- plunit_term_roles:index(Terms,Index).
catalog(Terms,C) :- index(Terms,I),C=I.categoryCatalog,assertion(ground(C)).
json_ready(R) :-
    assertion(ground(R)),with_output_to(string(_),json_write_dict(current_output,R)).
item(C,Identity,Item) :- category_item(C,Identity,Item).
nat_item(C,Term,Item) :- non_atomic_key(Term,Key),category_item(C,Key,Item).
count(Reply,Group,Count) :- member(C,Reply.groupCounts),C.key==Group,!,Count=C.total.
member_group(Item,Group) :- assertion(memberchk(Group,Item.groups)).
not_group(Item,Group) :- assertion(\+memberchk(Group,Item.groups)).
member_evidence(Item,Group,E) :-
    member(M,Item.memberships),M.group==Group,member(E,M.evidence).
one(C,F,I) :-
    category_page(C,F,0,100,R),assertion(R.total==1),R.items=[I],json_ready(R).

test(group_order_and_labels_match_the_superseding_contract) :-
    catalog([],C),category_page(C,_{},0,20,R),
    assertion(R.groupOrder==[predicates,functions,collections,microtheories,the_word,
                             external_symbols,do_invocations,individuals,unclassified]),
    assertion(R.membershipPolicy==every_matching_group),assertion(R.groupCountsOverlap==true),
    assertion(R.total==0),assertion(R.overallTotal==0),json_ready(R).
test(every_matching_membership_is_retained_and_overall_is_not_the_group_sum) :-
    Term='x_Multi-TheWord',
    catalog([x_isa(Term,x_Predicate),x_isa(Term,x_Function),
             x_isa(Term,x_Collection),x_isa(Term,x_Microtheory),
             x_p(x_SubLQuoteFn(Term))],C),
    one(C,_{q:Term,match:exact},I),
    assertion(I.groups==[predicates,functions,collections,microtheories,the_word,external_symbols]),
    category_page(C,_{q:Term,match:exact},0,100,R),
    findall(N,(member(G,R.groupCounts),N=G.total),Ns),sum_list(Ns,Sum),
    assertion(Sum==6),assertion(R.total==1),assertion(R.filteredTotal==1),
    assertion(R.overallTotal>R.filteredTotal),
    assertion(I.externalSymbol==true),assertion(I.externalMethod==false).
test(ordinary_scope_excludes_external_symbols_without_erasing_their_other_groups) :-
    Term=x_Method,
    catalog([x_afterAdding(x_p,x_SubLQuoteFn(Term)),x_Method(x_a)],C),
    one(C,_{q:Term,match:exact,scope:all},I),
    member_group(I,predicates),member_group(I,external_symbols),
    assertion(I.externalMethod==true),
    category_page(C,_{q:Term,match:exact,scope:ordinary},0,100,Ordinary),
    assertion(Ordinary.total==0),
    one(C,_{q:Term,match:exact,scope:external},_).
test(function_references_outside_callback_are_external_symbols_not_methods) :-
    catalog([x_p(x_SubLQuoteFn(x_Foreign))],C),
    one(C,_{q:x_Foreign,match:exact},I),
    member_group(I,external_symbols),assertion(I.externalMethod==false),
    category_page(C,_{q:x_Foreign,match:exact,externalMethodsOnly:true},0,100,R),
    assertion(R.total==0).
test(uppercase_quotes_strings_and_prefixes_do_not_establish_external_membership) :-
    catalog([x_p('x_UPPER-METHOD'),x_quote(x_SubLQuoteFn(x_Quoted)),
             x_comment(x_t,"(SubLQuoteFn STRING-METHOD)")],C),
    item(C,'x_UPPER-METHOD',Upper),item(C,x_Quoted,Quoted),
    not_group(Upper,external_symbols),not_group(Quoted,external_symbols).
test(explicit_external_type_and_declared_result_type_are_not_lost) :-
    catalog([x_isa(x_Foreign,x_SubLSymbol),x_p(x_RefFn(x_a)),
             x_resultIsa(x_RefFn,x_ExternalSymbol)],C),
    item(C,x_Foreign,F),member_group(F,external_symbols),
    nat_item(C,x_RefFn(x_a),N),member_group(N,external_symbols),
    assertion(N.externalMethod==false),
    category_page(C,_{group:external_symbols,scope:ordinary},0,100,R),assertion(R.total==0).
test(facts_supply_predicate_reference_evidence_not_definition_assertions) :-
    catalog([x_p(x_a),x_p(x_a,x_b)],C),item(C,x_p,P),
    member_group(P,predicates),assertion(P.semanticAssertionCount==2),
    findall(A,(member_evidence(P,predicates,E),A=E.details.arity),Arities0),
    sort(Arities0,[1,2]),
    forall(member_evidence(P,predicates,E),assertion(E.basis==predicate_position)),
    assertion(C.coverage.term_categories.createsProviders==false).
test(function_constructor_and_result_object_are_distinct_roles) :-
    catalog([x_p(x_Fn(x_a))],C),
    item(C,x_Fn,Function),member_group(Function,functions),
    nat_item(C,x_Fn(x_a),Value),not_group(Value,functions),member_group(Value,unclassified).
test(explicit_function_root_is_not_mistaken_for_predicate_use) :-
    catalog([x_isa(x_Fn,x_Function),x_Fn(x_a)],C),
    item(C,x_Fn,F),member_group(F,functions),not_group(F,predicates).
test(compound_predicate_heads_and_constructors_keep_complete_identities) :-
    catalog([t(x_PredFn(x_a),x_b),x_p(t(x_PredFn(x_a),x_c))],C),
    nat_item(C,x_PredFn(x_a),P),member_group(P,predicates),member_group(P,functions),
    item(C,x_PredFn,F),member_group(F,functions),
    assertion(P.identity\==F.identity).
test(logical_operator_symbols_are_not_predicates_from_spelling_or_position_alone) :-
    catalog([x_implies(x_p(x_a),x_q(x_b)),x_not(x_r(x_c))],C),
    item(C,x_implies,Implies),not_group(Implies,predicates),
    item(C,x_p,P),member_group(P,predicates).
test(generic_arity_and_argument_declarations_do_not_guess_predicate_vs_function) :-
    catalog([x_arity(x_Unknown,2),x_arg2Isa(x_Unknown,x_Class),
             x_resultIsa(x_KnownFunction,x_Result)],C),
    item(C,x_Unknown,U),member_group(U,unclassified),not_group(U,predicates),not_group(U,functions),
    item(C,x_KnownFunction,F),member_group(F,functions),
    item(C,x_Class,Class),member_group(Class,collections),
    item(C,x_Result,Result),member_group(Result,collections).
test(collections_come_from_actual_collection_slots_and_collection_valued_results) :-
    catalog([x_isa(x_John,x_Human),x_genls(x_Human,x_Animal),
             x_p(x_SetFn(x_a)),x_resultGenl(x_SetFn,x_Animal)],C),
    forall(member(Key,[x_Human,x_Animal]),(item(C,Key,I),member_group(I,collections))),
    item(C,x_John,John),member_group(John,individuals),not_group(John,collections),
    nat_item(C,x_SetFn(x_a),Set),member_group(Set,collections),
    member_evidence(Set,collections,E),assertion(E.basis==collection_valued_result).
test(compound_collection_arguments_do_not_get_lost_when_their_functor_is_also_a_predicate) :-
    catalog([x_TypeFn(x_a),x_isa(x_Thing,x_TypeFn(x_a))],C),
    nat_item(C,x_TypeFn(x_a),Type),member_group(Type,collections).
test(lexical_word_bucket_is_explicitly_heuristic_atomic_and_case_insensitive) :-
    catalog([x_p('x_Dog-TheWord'),x_p('x_DOG-THEWORD'),x_p(x_Fn('x_Dog-TheWord')),
             x_comment(x_x,"String-TheWord")],C),
    forall(member(K,['x_Dog-TheWord','x_DOG-THEWORD']),
      (item(C,K,I),member_group(I,the_word),member_evidence(I,the_word,E),
       assertion(E.heuristic==true),assertion(E.basis==lexical_suffix))),
    nat_item(C,x_Fn('x_Dog-TheWord'),N),not_group(N,the_word).
test(format_descriptor_words_are_not_promoted_from_literal_reader_data) :-
    catalog([x_doAnnounce("~a",['x_Only-TheWord'])],C),
    category_page(C,_{group:the_word},0,100,R),assertion(R.total==0).
test(do_invocations_require_real_applications_and_known_vocabulary_or_documented_pattern) :-
    catalog([x_doAnnounce(Text,Args),x_doFormat("~a",[1]),
             x_p(x_doSomething),x_doNothing(x_a),
             x_doWrong("text",x_not_a_list),
             x_quote(x_doQuoted("~a",[1]))],C),
    assertion(var(Text)),assertion(var(Args)),
    forall(member(K,[x_doAnnounce,x_doFormat]),
      (item(C,K,I),member_group(I,do_invocations),member_evidence(I,do_invocations,E),
       assertion(E.details.execution==unknown),assertion(E.details.analysisExecuted==false))),
    forall(member(K,[x_doSomething,x_doNothing,x_doWrong,x_doQuoted]),
      (item(C,K,I),not_group(I,do_invocations))).
test(invocation_classification_never_runs_rules_or_inert_forms) :-
    catalog([(x_rule(x_a):-and(throw(must_never_execute),x_doAnnounce("x",[]))),
             metta_exec(x_doHidden("x",[]))],C),
    item(C,x_doAnnounce,D),member_group(D,do_invocations),
    item(C,x_doHidden,H),not_group(H,do_invocations),
    assertion(C.coverage.term_categories.executesInvocations==false).
test(typed_and_untyped_remainders_do_not_claim_closed_world_disjointness) :-
    catalog([x_isa(x_John,x_Human),x_p(x_Unclassified)],C),
    item(C,x_John,John),assertion(John.groups==[individuals]),
    item(C,x_Unclassified,U),assertion(U.groups==[unclassified]).
test(spindle_semantic_type_evidence_is_catalogued_with_one_semantic_and_zero_context_assertions) :-
    Spindle=x_SpindleMtFn(x_Project),
    E=evidence{source:'KBs/test.krf',originalSource:'KBs/original.krf',line:41},
    build_term_index(2,[loaded(a65b134dbbb09f,x_isa(Spindle,x_Microtheory),x_BaseKB,E)],Index),
    nat_item(Index.categoryCatalog,Spindle,I),
    member_group(I,microtheories),assertion(I.semanticAssertionCount==1),
    assertion(I.contextAssertionCount==0),assertion(I.zeroContextContent==true),
    assertion(I.mtEvidenceKinds==[declared_type]),
    member_evidence(I,microtheories,Proof),assertion(Proof.assertionId==a65b134dbbb09f),
    non_atomic_context_key(Spindle,Mt),assertion(I.mt==Mt),
    resolve_index_term(Index,Mt,R),assertion(R.resolvedAs==microtheory),
    assertion(R.information.totals.context==0),json_ready(R).
test(reference_only_compound_and_atomic_mts_stay_in_the_catalog) :-
    catalog([x_genlMt(x_MtFn(x_a),x_Parent)],C),
    nat_item(C,x_MtFn(x_a),Child),item(C,x_Parent,Parent),
    forall(member(I,[Child,Parent]),
      (member_group(I,microtheories),assertion(I.contextAssertionCount==0),
       assertion(I.mtEvidenceKinds==[context_reference]))).
test(metadata_only_contexts_and_constructor_links_do_not_inflate_semantic_ranking) :-
    Mt=x_MtFn(x_Project),plunit_term_roles:row(1,x_p(x_a),Mt,Row),
    build_term_index(7,[Row],Index),C=Index.categoryCatalog,
    nat_item(C,Mt,M),assertion(M.contextAssertionCount==1),assertion(M.count==0),
    item(C,x_MtFn,Constructor),member_group(Constructor,functions),
    assertion(Constructor.count==0),
    index_term(Index,x_Project,Argument),assertion(Argument.totals.all==1),
    assertion(Argument.totals.semantic==0),
    category_page(C,_{q:x_Project,match:exact},0,100,Unranked),assertion(Unranked.total==0).
test(batch_sections_repeat_members_but_report_a_distinct_union) :-
    Term=x_Multi,
    catalog([x_isa(Term,x_Predicate),x_isa(Term,x_Function)],C),
    Requests=[_{group:predicates,offset:0,limit:20},_{group:functions,offset:0,limit:20}],
    category_section_pages(C,_{q:Term,match:exact},Requests,R),
    assertion(R.total==1),assertion(R.displayedDistinctTotal==1),
    R.sections=[P,F],assertion(P.total==1),assertion(F.total==1),
    P.items=[A],F.items=[B],assertion(A.identity==B.identity),json_ready(R).
test(multiple_selected_groups_use_union_not_duplicates_before_paging) :-
    catalog([x_isa(x_A,x_Predicate),x_isa(x_A,x_Function),x_isa(x_B,x_Function)],C),
    category_page(C,_{groups:[predicates,functions],q:"x_",match:substring},0,1,First),
    category_page(C,_{groups:[predicates,functions],q:"x_",match:substring},1,100,Rest),
    findall(K,(member(I,First.items),K=I.identity),A),
    findall(K,(member(I,Rest.items),K=I.identity),B),append(A,B,Keys),sort(Keys,Unique),
    assertion(same_length(Keys,Unique)),assertion(length(Keys,First.total)).
test(atomicity_and_reification_remain_independent_of_all_category_memberships) :-
    catalog([x_isa(x_Fn(x_a),x_CycLNonAtomicReifiedTerm),x_isa(x_Atomic,x_Function)],C),
    nat_item(C,x_Fn(x_a),N),assertion(N.atomicity==non_atomic),
    assertion(N.representation.status==unknown),
    category_page(C,_{atomicity:atomic,representation:unknown},0,100,AtomicUnknown),
    assertion(AtomicUnknown.total==0),
    category_page(C,_{atomicity:non_atomic,representation:nart},0,100,Nart),
    assertion(Nart.total==0).
test(type_constructor_search_and_atomicity_filters_intersect_without_splitting_full_arguments) :-
    catalog([x_isa(x_Fn("A"),x_Type),x_isa(x_Fn("B"),x_Other)],C),
    one(C,_{constructor:x_Fn,type:x_Type,atomicity:non_atomic,q:"Fn"},I),
    non_atomic_key(x_Fn("A"),I.identity).
test(type_facets_include_every_type_not_just_the_first) :-
    catalog([x_isa(x_Fn(x_a),x_A),x_isa(x_Fn(x_a),x_B)],C),
    non_atomic_key(x_Fn(x_a),Key),
    category_facet_page(C,_{q:Key,match:exact},types,0,100,R),
    assertion(R.total==2),assertion(R.uniqueTerms==1),
    findall(T,(member(F,R.items),T=F.key),Types),assertion(Types==[x_A,x_B]),
    forall(member(F,R.items),assertion(F.count==1)),json_ready(R).
test(group_facets_and_atomicity_facets_have_unique_counts) :-
    catalog([x_isa(x_A,x_Function),x_isa(x_A,x_Predicate)],C),
    category_facet_page(C,_{q:x_A,match:exact},groups,0,100,G),
    assertion(G.uniqueTerms==1),
    category_facet_page(C,_{q:x_A,match:exact},atomicity,0,100,A),
    A.items=[Atom],assertion(Atom.key==atomic),assertion(Atom.count==1).
test(duplicate_batch_sections_are_rejected,
     [throws(error(domain_error(duplicate_category_section,_),_))]) :-
    catalog([],C),category_section_pages(C,_{},[_{group:functions},_{group:functions}],_).
test(group_selection_is_not_ambiguously_combined_with_batch_requests,
     [throws(error(domain_error(section_group_selection,_),_))]) :-
    catalog([],C),category_section_pages(C,_{group:functions},[_{group:predicates}],_).
test(page_limit_is_bounded,[throws(error(domain_error(category_page_limit,101),_))]) :-
    catalog([],C),category_page(C,_{},0,101,_).
test(unknown_group_is_not_silently_empty,[throws(error(domain_error(term_category_group,_),_))]) :-
    catalog([],C),category_page(C,_{group:invented},0,10,_).
test(missing_native_semantics_retains_partial_coverage_not_success_shaped_empty) :-
    R=unavailable(a1,x_MtFn(x_a),evidence{source:'KBs/a.krf',originalSource:'KBs/a.krf',line:1},
                  reason{code:native_clause_count,count:0}),
    build_term_index(8,[R],Index),
    category_page(Index.categoryCatalog,_{},0,100,Reply),
    assertion(Reply.coverage.status==partial),json_ready(Reply).

test(native_generations_facade_catalog_and_ordinary_scope_preserve_the_loaded_kg,
     [setup(plunit_term_roles:fixture(S)),cleanup(plunit_term_roles:cleanup(S))]) :-
    Mt=x_SpindleMtFn(x_Project),
    plunit_term_roles:row(1,x_isa(Mt,x_Microtheory),x_BaseKB,R1),
    plunit_term_roles:row(2,x_afterAdding(x_p,x_SubLQuoteFn(x_Method)),x_BaseKB,R2),
    plunit_term_roles:fixture_cache('mt.krf',[R1],MTSource,MTC),
    plunit_term_roles:fixture_cache('method.krf',[R2],MethodSource,MC),
    plunit_term_roles:load_fixture(MTSource,MTC,_),
    plunit_term_roles:load_fixture(MethodSource,MC,Loaded),
    kb_store:source_module(MTSource,Module,Native),
    findall(Id-Ref,kb_runtime:module_assertion(Module,Id,_,Ref),Before),
    file_digest(MTSource,SourceHash),file_digest(MTC,CacheHash),
    category_terms(_{group:microtheories,atomicity:non_atomic},0,100,MTs),
    assertion(MTs.total==1),MTs.items=[Spindle],
    assertion(Spindle.contextAssertionCount==0),
    category_terms(_{scope:external,externalMethodsOnly:true},0,100,Methods),
    assertion(Methods.total==1),
    category_sections(_{},[_{group:microtheories},_{group:external_symbols}],Batch),
    assertion(Batch.generation==Loaded.generation),json_ready(Batch),
    category_facets(_{},groups,0,100,Facets),assertion(Facets.generation==Loaded.generation),
    kb_store:unload_source(MethodSource,Loaded.generation,Unloaded),
    category_terms(_{scope:external},0,100,Empty),assertion(Empty.total==0),
    assertion(Empty.generation==Unloaded.generation),
    findall(Id-Ref,kb_runtime:module_assertion(Module,Id,_,Ref),After),assertion(Before==After),
    kb_store:source_module(MTSource,Module,Native),
    file_digest(MTSource,SourceHash),file_digest(MTC,CacheHash),
    kb_term_browser:microtheory_catalog(Catalog),
    member(C,Catalog.items),C.mt==Spindle.mt,assertion(C.count==0).

:- end_tests(term_categories).
