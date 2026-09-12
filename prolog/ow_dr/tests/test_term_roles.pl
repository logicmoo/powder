:- begin_tests(term_roles).
:- use_module('../kb_term_roles').
:- use_module('../kb_non_atomic').
:- use_module('../kb_store',[]).
:- use_module('../kb_runtime',[]).
:- use_module('../kb_cache',[write_cache/4,file_digest/2,converter_version/1]).
:- use_module('../kb_paths').
:- use_module(library(assoc)).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(uuid)).

row(N,Term,Context,loaded(Id,Term,Context,E)) :-
    format(atom(Id),'a~16r',[N]),
    E=evidence{source:'KBs/current.krf',originalSource:'KBs/original.krf',line:N}.
rows(Terms,Rows) :- rows(Terms,1,Rows).
rows([],_,[]).
rows([T|Ts],N,[R|Rs]) :- row(N,T,x_BaseKB,R),Next is N+1,rows(Ts,Next,Rs).
index(Terms,Index) :-
    rows(Terms,Rows),build_term_index(9,Rows,Index),assertion(ground(Index)).
json_ready(Reply) :- assertion(ground(Reply)),with_output_to(string(_),json_write_dict(current_output,Reply)).
external(Index,Names) :-
    query_index(Index,"",substring,external,0,100,Reply),
    findall(N,(member(E,Reply.items),N=E.identity),Names),json_ready(Reply).
external_evidence(Reply,Evidence) :-
    member(Evidence,Reply.evidence),Evidence.role==external_method,!.

test(supplied_after_adding_shape_retains_exact_assertion_provenance) :-
    E=evidence{source:'KBs/ikb/file.krf',originalSource:'KBs/file.krf',line:42},
    build_term_index(18,[loaded(a65b38ed8843fe,x_afterAdding(x_arity,x_SubLQuoteFn('x_ADD-ARITY')),
                               x_BaseKB,E)],Index),
    index_term(Index,'x_ADD-ARITY',Reply),external_evidence(Reply,Proof),
    assertion(Reply.term.external==true),assertion(Reply.term.symbol=='x_ADD-ARITY'),
    assertion(Proof.assertionId==a65b38ed8843fe),assertion(Proof.source=='KBs/ikb/file.krf'),
    assertion(Proof.originalSource=='KBs/file.krf'),assertion(Proof.line==42),
    assertion(Proof.predicate==x_afterAdding),assertion(Proof.slot==2),
    assertion(Proof.referenceKind==subl_quote),assertion(Reply.generation==18),
    assertion(Reply.totals.semantic==1),json_ready(Reply).
test(all_whitelisted_callback_slots_and_function_reference_form) :-
    index([x_afterAdding(x_p,x_SubLQuoteFn(x_a)),
           x_afterRemoving(x_p,x_SubLQuoteFn(x_b)),
           x_evaluationDefn(x_p,x_function(x_c)),
           x_definition(x_p,x_SubLQuoteFn(x_d))],Index),
    external(Index,[x_a,x_b,x_c,x_d]).
test(package_qualified_reference_keeps_original_identity_and_real_subject_properties) :-
    index([x_definition(x_p,x_function('subL::Mixed-Method')),
           x_comment('subL::Mixed-Method',"original description")],Index),
    external(Index,['subL::Mixed-Method']),index_term(Index,'subL::Mixed-Method',Reply),
    assertion(Reply.term.label=="subL::Mixed-Method"),assertion(Reply.totals.properties==1),
    assertion(Reply.totals.semantic==2).
test(uppercase_suffix_and_plain_symbol_callback_are_not_external_evidence) :-
    index([x_isa('x_UPPERCASE-METHOD',x_Thing),x_p(x_SomethingFn),
           x_afterAdding(x_p,'x_DIRECT-METHOD')],Index),external(Index,[]).
test(function_reference_outside_callback_is_not_external) :-
    index([x_p(x_SubLQuoteFn(x_Method)),x_function(x_Other)],Index),external(Index,[]),
    index_term(Index,x_Other,Other),assertion(Other.totals.properties==0).
test(quoted_string_formatting_and_inert_data_are_not_callback_evidence) :-
    Callback=x_afterAdding(x_p,x_SubLQuoteFn(x_Method)),
    index([x_quote(Callback),x_comment(x_p,"(afterAdding p (SubLQuoteFn Method))"),
           x_genFormat(x_p,"text",[Callback]),x_doFormat("text",[Callback]),
           metta_exec(Callback),'x_metta='(x_lhs,Callback),
           'x_<==='(x_head,Callback)],Index),external(Index,[]).
test(wrong_callback_slot_arity_and_reference_shape_do_not_match) :-
    index([x_afterAdding(x_SubLQuoteFn(x_a),x_p),
           x_afterAdding(x_p,x_SubLQuoteFn(x_b),x_extra),
           x_other(x_p,x_SubLQuoteFn(x_c)),
           x_definition(x_p,x_SubLQuoteFn(x_d,x_extra))],Index),external(Index,[]).
test(quoted_native_rule_shape_cannot_escape_data_position) :-
    index([x_quote((x_afterAdding(x_p,x_SubLQuoteFn(x_Method)):-and(x_true)))],Index),
    external(Index,[]).
test(multirole_identity_is_not_duplicated_or_left_in_ordinary_section) :-
    index([x_afterAdding(x_p,x_SubLQuoteFn(x_Method)),x_Method(x_a),x_uses(x_Method)],Index),
    external(Index,[x_Method]),index_term(Index,x_Method,Reply),
    assertion(memberchk(predicate_reference,Reply.term.roles)),
    assertion(memberchk(external_method,Reply.term.roles)),
    assertion(Reply.term.count==3),
    query_index(Index,"x_Method",exact,ordinary,0,20,Ordinary),
    assertion(Ordinary.total==0),assertion(Ordinary.matchingOverallTotal==1).
test(external_only_exact_search_and_partition_precede_pagination) :-
    index([x_afterAdding(x_p,x_SubLQuoteFn(x_B)),x_afterRemoving(x_p,x_SubLQuoteFn(x_A)),
           x_uses(x_C),x_uses(x_B)],Index),
    query_index(Index,"",substring,external,0,1,First),
    query_index(Index,"",substring,external,1,1,Second),
    assertion(First.total==2),assertion(First.sectionTotal==2),
    First.items=[B],Second.items=[A],assertion(B.identity==x_B),assertion(A.identity==x_A),
    query_index(Index,"B",exact,external,0,1,Exact),assertion(Exact.total==1),
    assertion(Exact.matchingOverallTotal==1),assertion(Exact.overallTotal==First.overallTotal),
    assertion(First.totals.ordinary+First.totals.external=:=First.overallTotal),
    query_index(Index,"B",exact,ordinary,0,1,Absent),assertion(Absent.total==0),
    assertion(Absent.sectionTotal==First.totals.ordinary),json_ready(Exact).
test(external_evidence_remains_available_when_ordinary_mentions_dominate) :-
    length(Mentions,30),maplist(=(x_p(x_Method)),Mentions),
    append(Mentions,[x_afterAdding(x_p,x_SubLQuoteFn(x_Method))],Terms),
    index(Terms,Index),index_term(Index,x_Method,Reply),
    assertion(Reply.externalEvidenceCount==1),Reply.externalEvidence=[E],
    assertion(E.role==external_method),assertion(E.assertionId==a1f),
    assertion(Reply.evidenceCount>12),assertion(length(Reply.evidence,12)).
test(negative_and_rule_callback_positions_are_descriptive_not_execution) :-
    index([x_not(x_afterAdding(x_p,x_SubLQuoteFn(x_Negative))),
           (x_afterAdding(x_q,x_SubLQuoteFn(x_Head)):-and(throw(must_never_run))),
           x_implies(x_afterAdding(x_r,x_SubLQuoteFn(x_Antecedent)),x_true)],Index),
    index_term(Index,x_Negative,N),external_evidence(N,NE),assertion(NE.polarity==negative),
    index_term(Index,x_Head,H),external_evidence(H,HE),assertion(HE.positionRole==head),
    index_term(Index,x_Antecedent,A),external_evidence(A,AE),assertion(AE.positionRole==antecedent),
    assertion(Index.coverage.executesMethods==false),
    assertion(Index.coverage.createsProviderAssertions==false).
test(variable_callback_and_property_subject_remain_unbound) :-
    Terms=[x_afterAdding(x_p,x_SubLQuoteFn(X)),x_p(x_Fn(Y),Y),x_isa(x_C,Z)],
    index(Terms,Index),external(Index,[]),assertion(var(X)),assertion(var(Y)),assertion(var(Z)),
    assertion(Index.coverage.nongroundDenotingPositions>0).
test(no_provider_or_ontology_assertions_are_fabricated) :-
    index([x_afterAdding(x_arity,x_SubLQuoteFn(x_Method))],Index),
    assoc_to_keys(Index.assertions,[a1]),index_term(Index,x_Method,Reply),
    assertion(Reply.totals.properties==0),
    index_occurrences(Index,x_Method,all,0,20,Occurrences),
    Occurrences.items=[Original],assertion(Original.expression.head.value==x_afterAdding),
    assertion(Original.properties==[]),assertion(Occurrences.total==1).
test(nat_lookup_returns_full_identity_properties_and_annotated_assertions) :-
    Nat=x_DateFn(2026,"Case"),index([x_isa(Nat,x_Date),x_related(x_a,Nat)],Index),
    non_atomic_key(Nat,Key),index_term(Index,Key,Reply),
    assertion(Reply.term.kind==non_atomic),assertion(Reply.term.expression.natKey==Key),
    assertion(Reply.term.expression.head.value==x_DateFn),assertion(Reply.totals.all==2),
    assertion(Reply.totals.properties==1),assertion(Reply.totals.semantic==2),
    index_occurrences(Index,Key,properties,0,1,Properties),Properties.items=[A],
    A.expression.args=[Subject,_],assertion(Subject.denotesNat==true),assertion(Subject.natKey==Key),
    assertion(Properties.total==1),assertion(Properties.totals.semantic==2),json_ready(Properties).
test(nat_exact_identity_search_preserves_string_and_symbol_case) :-
    Upper=x_Fn("A",x_Case),Lower=x_Fn("a",x_case),
    index([x_p(Upper),x_p(Lower)],Index),non_atomic_key(Upper,Key),
    query_index(Index,Key,exact,non_atomic,0,10,Reply),
    assertion(Reply.total==1),Reply.items=[Entry],assertion(Entry.identity==Key).
test(property_occurrence_retains_existing_metadata_and_original_names) :-
    E=evidence{source:'KBs/a.krf',originalSource:'KBs/old.krf',line:9,names:[],
      properties:[_{name:creator,value:"Alice"},_{name:comment,value:"original\ntext"}]},
    Nat=x_Fn(x_A),build_term_index(7,[loaded(a1,x_isa(Nat,x_Class),x_BaseKB,E)],Index),
    non_atomic_key(Nat,Key),index_occurrences(Index,Key,properties,0,10,Reply),
    Reply.items=[A],assertion(A.properties==[json{name:creator,value:"Alice"},
                                             json{name:comment,value:"original\ntext"}]),
    assertion(A.originalSource=='KBs/old.krf'),json_ready(Reply).
test(batched_assertion_annotations_preserve_order_and_one_generation) :-
    index([x_p(x_Fn(1)),x_p(x_Fn(2))],Index),index_assertions(Index,[a2,a1],Reply),
    Reply.items=[A,B],assertion(A.id==a2),assertion(B.id==a1),
    assertion(Reply.generation==9),json_ready(Reply).
test(batched_assertion_lookup_reports_missing_id,
     [throws(error(existence_error(loaded_assertion,missing),_))]) :-
    index([],Index),index_assertions(Index,[missing],_).
test(compound_mt_alias_reuses_nat_identity_and_real_context_edges) :-
    Child=x_MtFn(x_Project,2026),Parent=x_MtFn(x_Project,2025),
    row(1,x_genlMt(Child,Parent),Child,R1),row(2,x_p(x_A),Child,R2),
    build_term_index(2,[R1,R2],Index),non_atomic_key(Child,Key),
    non_atomic_context_key(Child,MtKey),index_term(Index,Key,N),index_term(Index,MtKey,M),
    assertion(N==M),assertion(N.totals.context==2),
    assertion(memberchk(microtheory_context,N.term.roles)),
    assertion(memberchk(microtheory_reference,N.term.roles)),
    N.contextRelationships=[Edge],assertion(Edge.child==MtKey),
    index_occurrences(Index,Key,context,1,1,Page),assertion(Page.total==2),
    Page.items=[Second],assertion(Second.id==a2),json_ready(N).
test(merely_nested_nat_cannot_be_opened_as_a_microtheory_alias,
     [throws(error(existence_error(loaded_term_identity,_),_))]) :-
    Nat=x_Fn(x_A),index([x_isa(Nat,x_Thing)],Index),
    non_atomic_context_key(Nat,Alias),index_term(Index,Alias,_).
test(canonical_shape_without_loaded_evidence_is_not_an_indexed_nat,
     [throws(error(existence_error(loaded_term_identity,_),_))]) :-
    index([x_p(x_a)],Index),non_atomic_key(x_Unknown(1),Key),index_term(Index,Key,_).
test(context_only_atomic_mt_does_not_inflate_ordinary_search) :-
    index([x_p(x_a)],Index),index_term(Index,x_BaseKB,Reply),
    assertion(Reply.totals.context==1),
    query_index(Index,"BaseKB",exact,all,0,20,Search),assertion(Search.total==0).
test(referenced_atomic_mt_has_real_relationships_without_fabricated_content) :-
    index([x_genlMt(x_Child,x_Parent)],Index),index_term(Index,x_Child,Reply),
    assertion(Reply.totals.context==0),assertion(Reply.term.contextKeys==[x_Child]),
    assertion(memberchk(microtheory_reference,Reply.term.roles)),
    assertion(Reply.contextRelationships=[_]).
test(nested_context_function_references_are_not_content_of_that_inner_term) :-
    Context=x_MtFn(x_DateFn(2026)),
    row(1,x_p(x_A),Context,R),build_term_index(4,[R],Index),
    non_atomic_key(x_DateFn(2026),Key),index_term(Index,Key,Reply),
    assertion(Reply.totals.all==1),assertion(Reply.totals.context==0),
    assertion(Reply.term.contextKeys==[]),
    index_occurrences(Index,Key,all,0,1,All),assertion(All.total==1),json_ready(All).
test(context_position_and_ast_use_the_same_loaded_formula_schema) :-
    Context=x_MtFn(x_p(x_a)),row(1,x_p(x_a),Context,R),
    build_term_index(4,[R],Index),query_index(Index,"",substring,non_atomic,0,10,Reply),
    assertion(Reply.total==1),Reply.items=[Outer],
    Outer.expression.args=[Formula],assertion(Formula.denotesNat==false).
test(unknown_native_semantics_is_explicit_partial_not_successful_empty) :-
    R=unavailable(a1,x_BaseKB,evidence{source:'KBs/a.krf',originalSource:'KBs/a.krf',line:1},
                  reason{code:native_clause_count,count:0}),
    build_term_index(3,[R],Index),query_index(Index,"",substring,all,0,10,Reply),
    assertion(Reply.coverage.status==partial),assertion(Reply.coverage.unavailable=[_]),
    index_occurrences(Index,x_BaseKB,context,0,1,Page),Page.items=[A],
    assertion(A.available==false),assertion(A.expression==null),json_ready(Page).
test(pagination_input_is_validated,[throws(error(domain_error(term_role_page_limit,101),_))]) :-
    index([],Index),query_index(Index,"",substring,all,0,101,_).
test(empty_generation_has_consistent_zero_section_totals) :-
    index([],Index),query_index(Index,"",substring,all,0,1,R),
    assertion(R.total==0),assertion(R.overallTotal==0),
    assertion(R.totals==totals{all:0,ordinary:0,external:0,nonAtomic:0}),json_ready(R).

fixture(state(Root,OldApp)) :-
    (kb_store:source_info(_,_)->throw(error(nonempty_test_store,_));true),
    app_dir(OldApp),source_file(plunit_term_roles:fixture(_),Here),file_directory_name(Here,Tests),
    directory_file_path(Tests,artifacts,Artifacts),make_directory_path(Artifacts),uuid(Uuid),
    directory_file_path(Artifacts,Uuid,Root),directory_file_path(Root,prolog,Prolog),
    directory_file_path(Prolog,ow_dr,App),make_directory_path(App),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(App)),
    clear_term_role_cache.
cleanup(state(Root,OldApp)) :-
    findall(Source,kb_store:source_info(Source,_),Sources),
    forall(member(Source,Sources),(kb_store:generation(G),kb_store:unload_source(Source,G,_))),
    clear_term_role_cache,
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(OldApp)),
    delete_directory_and_contents(Root).
fixture_cache(Name,Rows,Source,Cache) :-
    repo_root(Root),directory_file_path(Root,Name,Given),
    setup_call_cleanup(open(Given,write,S,[encoding(utf8)]),
      format(S,'This is deliberately invalid source (((',[]),close(S)),
    absolute_file_name(Given,Source,[access(read)]),cache_paths(Source,Cache,_),
    file_digest(Source,Hash),size_file(Source,Size),converter_version(Converter),
    maplist(cache_record,Rows,Records),
    Header=cache{source:Source,sourceHash:Hash,implementationHash:Hash,dialect:krf,
      mappingHash:none,options:[],converter:Converter,mtPolicy:filename_v1,
      sizeBytes:Size,lineCount:1,warnings:[]},
    write_cache(Cache,Header,Records,_).
cache_record(loaded(Id,Semantic,Context,E),record(Id,Semantic,Metadata)) :-
    term_variables(Semantic,Vars),length(Vars,N),
    findall(Name,(between(1,N,K),format(string(Name),'??Original-~d',[K])),Names),
    Metadata=[xc_microtheory(Id,Context),xc_source_file(Id,E.originalSource),
              xc_source_line(Id,E.line),xc_kb_names(Id,Names),
              xc_direction(Id,':FORWARD')].
load_fixture(Source,Cache,Status) :-
    file_digest(Source,SourceHash),file_digest(Cache,OutputHash),
    kb_store:add_cached_sources([snapshot{source:Source,sourceHash:SourceHash,outputHash:OutputHash}],any,Status).

test(real_loaded_index_is_reused_and_preserves_native_handles_sources_and_properties,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    rows([x_afterAdding(x_arity,x_SubLQuoteFn('x_ADD-ARITY')),
          (x_rule(X):-and(throw(must_never_execute),x_p(x_Fn(X)))),
          x_isa(x_DateFn(2026),x_Date)],Rows),
    fixture_cache('roles.krf',Rows,Source,Cache),load_fixture(Source,Cache,Loaded),
    kb_store:source_module(Source,Module,Native),
    findall(Id-Ref,kb_runtime:module_assertion(Module,Id,_,Ref),Before),
    file_digest(Source,SourceHash),file_digest(Cache,CacheHash),file_digest(Native,NativeHash),
    loaded_term_index(First),loaded_term_index(Again),assertion(First==Again),
    assertion_role_asts([a1,a2],Batch),assertion(Batch.generation==Loaded.generation),
    assertion(length(Batch.items,2)),
    findall(G,kb_term_roles:cached_index(G,_),[Loaded.generation]),
    term_roles('x_ADD-ARITY',Reply),assertion(Reply.term.external==true),
    assertion_role_ast(a2,Rule),Rule.assertion.expression.args=[Head|_],
    Head.args=[V],assertion(V.value=="??Original-1"),
    term_occurrences('x_ADD-ARITY',all,0,20,Occurrences),Occurrences.items=[A],
    member(Direction,A.properties),Direction.name==direction,
    assertion(Direction.value==':FORWARD'),json_ready(Reply),
    findall(Id-Ref,kb_runtime:module_assertion(Module,Id,_,Ref),After),assertion(Before==After),
    kb_store:generation(Loaded.generation),file_digest(Source,SourceHash),
    file_digest(Cache,CacheHash),file_digest(Native,NativeHash).
test(unload_reload_reclassifies_multirole_symbol_and_replaces_generation_cache,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    row(1,x_afterAdding(x_p,x_SubLQuoteFn(x_Method)),x_BaseKB,R1),
    row(2,x_Method(x_a),x_BaseKB,R2),
    fixture_cache('callback.krf',[R1],Callback,CC),fixture_cache('ordinary.krf',[R2],Ordinary,OC),
    load_fixture(Callback,CC,_),load_fixture(Ordinary,OC,Loaded),
    query_terms("Method",exact,external,0,10,Before),assertion(Before.total==1),
    kb_store:unload_source(Callback,Loaded.generation,Unloaded),
    query_terms("Method",exact,external,0,10,External),assertion(External.total==0),
    query_terms("Method",exact,ordinary,0,10,Normal),assertion(Normal.total==1),
    assertion(Normal.generation==Unloaded.generation),
    load_fixture(Callback,CC,Reloaded),query_terms("Method",exact,external,0,10,After),
    assertion(After.total==1),assertion(After.generation==Reloaded.generation),
    findall(G,kb_term_roles:cached_index(G,_),[Reloaded.generation]).
test(inactive_native_source_cannot_contribute_external_methods,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    row(1,x_p(x_a),x_BaseKB,R),fixture_cache('active.krf',[R],Source,Cache),
    load_fixture(Source,Cache,_),
    row(2,x_afterAdding(x_p,x_SubLQuoteFn(x_Inactive)),x_BaseKB,Inactive),
    fixture_cache('inactive.krf',[Inactive],_,Other),uuid(Uuid),atom_concat(roles_inactive_,Uuid,Module),
    setup_call_cleanup(kb_runtime:native_load(Other,Module),
      (query_terms("",substring,external,0,10,Reply),assertion(Reply.total==0)),
      kb_runtime:native_unload(Other)).
test(missing_active_native_clause_reports_partial_coverage,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    row(1,x_afterAdding(x_p,x_SubLQuoteFn(x_Method)),x_BaseKB,R),
    fixture_cache('missing.krf',[R],Source,Cache),load_fixture(Source,Cache,_),
    kb_store:source_module(Source,_,Native),kb_runtime:native_unload(Native),
    query_terms("",substring,external,0,10,Reply),
    assertion(Reply.total==0),assertion(Reply.coverage.status==partial),
    assertion(Reply.coverage.semanticAssertions==0),assertion(Reply.coverage.unavailable=[_]).

:- end_tests(term_roles).
