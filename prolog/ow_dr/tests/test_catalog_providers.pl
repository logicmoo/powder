:- begin_tests(catalog_providers).
:- use_module('../kb_catalog_providers').
:- use_module('../kb_catalog_schema').
:- use_module('../kb_catalog_index',[build_source_data/5]).
:- use_module(library(assoc)).
:- use_module(library(http/json)).
:- use_module(library(terms),[term_size/2]).

proof(e('KBs/taxonomy.krf',a1,1,x_BaseKB,[])).
taxonomy(Extra,Taxonomy) :-
    proof(P),append([
      claim(genls,x_BinaryPredicate,x_Predicate,P),
      claim(genls,x_UnaryFunction,'x_Function-Denotational',P),
      claim(genls,x_MetaFunction,x_MetaRelation,P),
      claim(genls,x_MetaRelation,x_Predicate,P),
      claim(isa,x_resultIsa,x_MetaFunction,P),
      claim(isa,x_rolesForEventType,x_MetaRelation,P),
      claim(target_slot,x_rolesForEventType,slot(2,x_Predicate),P)],Extra,All),
    build_catalog_schema(All,Taxonomy).
data(Claims,Apps,Terms,Data) :-
    Data=source{dialect:krf,
      sentences:[s(1,a10,12,x_TestMt,["?Original-Name"],0),
                 s(2,a11,15,x_OtherMt,[],100)],
      claims:Claims,applications:Apps,terms:Terms}.
extension(Data,Taxonomy,Extension) :-
    source_provider_extensions('KBs/does-not-exist.krf',Data,Taxonomy,Extension),
    assertion(ground(Extension)),
    with_output_to(string(_),json_write_dict(current_output,Extension)).
declared(Extensions,Symbol,Evidence) :-
    member(Entry,Extensions.declared),Entry.symbol==Symbol,Evidence=Entry.evidence.

test(local_positive_isa_subject_is_a_declaration) :-
    taxonomy([],T),data([c(isa,x_p,x_BinaryPredicate,1,[])],[],[],D),
    extension(D,T,E),assertion(E.status==complete),
    E.declared=[Entry],assertion(Entry.symbol==x_p),assertion(Entry.roles==[declaration]),
    Entry.evidence=[Proof],assertion(Proof.id==a10),assertion(Proof.mt==x_TestMt),
    assertion(Proof.variableNames==["?Original-Name"]),
    assertion(Proof.kind==typed_declaration),assertion(Proof.implementation==unknown).
test(function_requires_a_type_membership_not_a_name) :-
    taxonomy([],T),data([c(isa,x_notNamedFn,x_UnaryFunction,1,[])],[],
      [t(x_GuessedFn,1,1,0,[],[constructor_symbol],[h(1,[],constructor_symbol,semantic)])],D),
    extension(D,T,E),findall(S,(member(X,E.declared),S=X.symbol),[x_notNamedFn]).
test(collection_and_observed_predicate_usage_do_not_declare) :-
    taxonomy([],T),data([c(isa,x_Thing,x_Collection,1,[])],
      [a(1,x_p,1,[])],[t(x_p,1,1,0,[],[predicate_symbol],[h(1,[],predicate_symbol,semantic)])],D),
    extension(D,T,E),assertion(E.declared==[]).
test(a_type_claim_in_another_file_does_not_provide_locally) :-
    proof(P),taxonomy([claim(isa,x_p,x_BinaryPredicate,P)],T),
    data([],[],[t(x_p,1,1,0,[],[predicate_symbol],[])],D),
    extension(D,T,E),assertion(E.declared==[]).
test(metafunction_is_a_predicate_not_a_callable_function) :-
    taxonomy([],T),data([c(isa,x_resultIsa,x_MetaFunction,1,[])],[],[],D),
    extension(D,T,E),declared(E,x_resultIsa,[Proof]),
    assertion(Proof.callableRole==predicates).
test(metafunction_conflicting_function_membership_is_not_accepted) :-
    taxonomy([],Base),put_assoc(x_MetaFunction,Base.categories,
      [membership(functions,x_Function,[])],Categories),T=Base.put(categories,Categories),
    data([c(isa,x_resultIsa,x_MetaFunction,1,[])],[],[],D),
    extension(D,T,E),assertion(E.status==partial),assertion(E.declared==[]).
test(both_actual_types_and_their_provenance_survive) :-
    proof(P),taxonomy([claim(isa,x_resultIsa,x_BinaryPredicate,P),
      claim(isa,x_resultIsa,x_MetaFunction,P)],T),
    data([c(isa,x_resultIsa,x_BinaryPredicate,1,[]),
          c(isa,x_resultIsa,x_MetaFunction,2,[])],[],[],D),
    extension(D,T,E),declared(E,x_resultIsa,Proofs),length(Proofs,2),
    findall(Type,(member(X,Proofs),Type=X.type),Types),
    assertion(memberchk(x_BinaryPredicate,Types)),assertion(memberchk(x_MetaFunction,Types)),
    assertion(forall(member(X,Proofs),(get_dict(typeAssertions,X,As),As\==[]))).
test(proven_second_slot_and_exact_path_declare_subject_not_operator) :-
    taxonomy([],T),
    data([],[a(1,x_rolesForEventType,2,[args,0])],
      [t(x_doneBy,1,1,0,[],[],[h(1,[args,0,args,1],constant,semantic)]),
       t(x_rolesForEventType,1,1,0,[],[],[h(1,[args,0,head],predicate_symbol,semantic)])],D),
    extension(D,T,E),E.declared=[Entry],assertion(Entry.symbol==x_doneBy),
    Entry.evidence=[Proof],assertion(Proof.targetPosition==2),
    assertion(Proof.targetPath==[args,0,args,1]),
    assertion(Proof.targetSlotEvidence\==[]).
test(nested_mentions_and_wrong_argument_do_not_match) :-
    taxonomy([],T),data([],[a(1,x_rolesForEventType,2,[])],
      [t(x_nested,1,1,0,[],[],[h(1,[args,1,args,0],constant,semantic)]),
       t(x_first,1,1,0,[],[],[h(1,[args,0],constant,semantic)])],D),
    extension(D,T,E),assertion(E.declared==[]),assertion(E.status==partial).
test(context_and_definition_hits_are_not_semantic_targets) :-
    taxonomy([],T),data([],[a(1,x_rolesForEventType,2,[])],
      [t(x_p,1,1,1,[1],[],[h(1,[args,1],constant,context),
                           h(1,[args,1],head,definition)])],D),
    extension(D,T,E),assertion(E.declared==[]),assertion(E.status==partial).
test(metarelation_without_proven_slot_does_not_declare) :-
    proof(P),taxonomy([claim(isa,x_unproven,x_MetaRelation,P)],T),
    data([],[a(1,x_unproven,1,[])],
      [t(x_p,1,1,0,[],[],[h(1,[args,0],constant,semantic)])],D),
    extension(D,T,E),assertion(E.declared==[]),assertion(E.status==partial).
test(out_of_range_proven_slot_is_not_silently_complete) :-
    taxonomy([],T),data([],[a(1,x_rolesForEventType,1,[])],[],D),
    extension(D,T,E),assertion(E.status==partial),assertion(E.declared==[]).
test(atomic_symbol_not_compound_target_constructor_is_required) :-
    taxonomy([],T),data([],[a(1,x_rolesForEventType,2,[])],
      [t('nat:x_Fn(x_a)',1,1,0,[],[],[h(1,[args,1],non_atomic,semantic)]),
       t(x_Fn,1,1,0,[],[],[h(1,[args,1,head],constructor_symbol,semantic)])],D),
    extension(D,T,E),assertion(E.status==partial),assertion(E.declared==[]).
test(duplicate_hits_do_not_duplicate_the_declaration_evidence) :-
    taxonomy([],T),data([],[a(1,x_rolesForEventType,2,[])],
      [t(x_p,1,2,0,[],[],[h(1,[args,1],constant,semantic),
                           h(1,[args,1],predicate_symbol,semantic)])],D),
    extension(D,T,E),declared(E,x_p,[_]).
test(distinct_occurrences_keep_distinct_evidence_and_mts) :-
    taxonomy([],T),data([],[a(1,x_rolesForEventType,2,[]),a(2,x_rolesForEventType,2,[])],
      [t(x_p,2,2,0,[],[],[h(1,[args,1],constant,semantic),h(2,[args,1],constant,semantic)])],D),
    extension(D,T,E),declared(E,x_p,Proofs),length(Proofs,2),
    findall(Mt,(member(X,Proofs),Mt=X.mt),Mts),
    assertion(memberchk(x_TestMt,Mts)),assertion(memberchk(x_OtherMt,Mts)).
test(missing_sentence_is_explicit_partial) :-
    taxonomy([],T),data([c(isa,x_p,x_BinaryPredicate,99,[])],[],[],D),
    extension(D,T,E),assertion(E.status==partial),assertion(E.declared==[]).
test(missing_projection_is_unavailable_not_empty) :-
    taxonomy([],T),source_provider_extensions('KBs/missing.krf',source{dialect:krf},T,E),
    assertion(E.status==unavailable),assertion(E.declared==null),assertion(ground(E)).
test(metta_never_acquires_definition_semantics) :-
    taxonomy([],T),data([c(isa,x_p,x_BinaryPredicate,1,[])],[],[],Base),
    extension(Base.put(dialect,metta),T,E),assertion(E.status==unavailable),
    assertion(E.declared==null).
test(unsupported_proof_structure_is_losslessly_inert) :-
    taxonomy([],Base),put_assoc(x_rolesForEventType,Base.targetSlots,
      [slot(2,unknown_proof(shell('NEVER EXECUTE'),false,[]))],Slots),
    T=Base.put(targetSlots,Slots),data([],[a(1,x_rolesForEventType,2,[])],
      [t(x_p,1,1,0,[],[],[h(1,[args,1],constant,semantic)])],D),
    extension(D,T,E),declared(E,x_p,[Proof]),
    Proof.targetSlotEvidence=[Json],assertion(Json.functor==unknown_proof),
    assertion(Json.arguments=[_,false,[]]).

test(duplicate_global_slot_paths_do_not_multiply_local_evidence) :-
    taxonomy([],Base),proof(P),
    length(Repeated,300),maplist(=(P),Repeated),
    Witness=target_evidence(P,[meta(x_MetaRelation,Repeated)|Repeated],[Repeated,Repeated],[]),
    length(Duplicates,300),maplist(=(slot(2,Witness)),Duplicates),
    put_assoc(x_rolesForEventType,Base.targetSlots,Duplicates,Slots),
    T=Base.put(targetSlots,Slots),
    findall(s(N,Id,N,Mt,[],0),(between(1,300,N),format(atom(Id),'a~16r',[N]),
      (0 is N mod 2->Mt=x_EvenMt;Mt=x_OddMt)),Sentences),
    findall(a(N,x_rolesForEventType,2,[]),between(1,300,N),Apps),
    findall(h(N,[args,1],constant,semantic),between(1,300,N),Hits),
    D=source{dialect:krf,sentences:Sentences,claims:[],applications:Apps,
      terms:[t(x_p,300,300,0,[],[],Hits)]},
    extension(D,T,E),declared(E,x_p,Proofs),length(Proofs,300),
    findall(Mt,(member(X,Proofs),Mt=X.mt),Mts),sort(Mts,[x_EvenMt,x_OddMt]),
    assertion(E.coverage.proofAlternativesExhaustive==false),
    term_size(E,Cells),assertion(Cells<1000000).

test(diamond_and_cyclic_types_keep_source_occurrences_not_path_products) :-
    proof(P),taxonomy([claim(genls,x_Left,x_Predicate,P),claim(genls,x_Right,x_Predicate,P),
      claim(genls,x_Diamond,x_Left,P),claim(genls,x_Diamond,x_Right,P),
      claim(genls,x_Left,x_Diamond,P)],T),
    data([c(isa,x_p,x_Diamond,1,[]),c(isa,x_p,x_Diamond,2,[])],[],[],D),
    extension(D,T,E),declared(E,x_p,Proofs),length(Proofs,2),
    findall(Id,(member(X,Proofs),Id=X.id),Ids),sort(Ids,[a10,a11]),
    forall(member(X,Proofs),assertion(X.proofAlternativesExhaustive==false)).
test(equivalent_roots_do_not_duplicate_one_local_type_role) :-
    taxonomy([],Base),proof(P),
    put_assoc(x_UnaryFunction,Base.categories,
      [membership(functions,x_Function,[P]),
       membership(functions,'x_Function-Denotational',[P])],Classes),
    T=Base.put(categories,Classes),
    data([c(isa,x_f,x_UnaryFunction,1,[])],[],[],D),
    extension(D,T,E),declared(E,x_f,[_]).

test(global_type_duplicates_are_not_copied_into_each_local_assertion) :-
    taxonomy([],Base),
    findall(type(x_BinaryPredicate,e('KBs/remote.krf',Id,N,x_RemoteMt,[])),
      (between(1,300,N),format(atom(Id),'a~16r',[N])),GlobalTypes),
    put_assoc(x_p,Base.types,GlobalTypes,Types),T=Base.put(types,Types),
    findall(s(N,Id,N,x_LocalMt,[],0),
      (between(1,300,N),Number is N+1000,format(atom(Id),'a~16r',[Number])),Sentences),
    findall(c(isa,x_p,x_BinaryPredicate,N,[]),between(1,300,N),Claims),
    D=source{dialect:krf,sentences:Sentences,claims:Claims,applications:[],terms:[]},
    extension(D,T,E),declared(E,x_p,Proofs),length(Proofs,300),
    forall(member(Proof,Proofs),
      (get_dict(typeAssertions,Proof,[Assertion]),get_dict(id,Proof,Id),
       assertion(Assertion.id==Id),assertion(Assertion.sourceFile=='KBs/does-not-exist.krf'))),
    term_size(E,Cells),assertion(Cells<100000),
    get_assoc(x_p,T.types,Unchanged),assertion(Unchanged==GlobalTypes).

test(actual_catalog_projection_excludes_negation_implication_and_quote) :-
    taxonomy([],T),
    Terms=[x_not(x_isa(x_negative,x_BinaryPredicate)),
      x_implies(x_true,x_rolesForEventType(x_Event,x_conditional)),
      x_quote(x_rolesForEventType(x_Event,x_quoted)),
      x_and(x_isa(x_positive,x_BinaryPredicate),x_rolesForEventType(x_Event,x_role))],
    projected_data(Terms,Data),extension(Data,T,E),
    findall(S,(member(X,E.declared),S=X.symbol),Symbols),
    assertion(Symbols==[x_positive,x_role]).
test(actual_catalog_projection_keeps_metta_inert) :-
    taxonomy([],T),projected_data([x_isa(x_p,x_BinaryPredicate)],Base),
    extension(Base.put(dialect,metta),T,E),
    assertion(E.status==unavailable),assertion(E.declared==null).
projected_data(Terms,Data) :-
    findall(record(Id,Term,Meta),
      (nth1(N,Terms,Term),format(atom(Id),'a~16r',[N]),
       Meta=[xc_microtheory(Id,x_TestMt),xc_source_file(Id,'KBs/inert-fixture.krf'),
             xc_source_line(Id,N),xc_kb_names(Id,[])]),Records),
    findall(Id-0,member(record(Id,_,_),Records),Pairs),list_to_assoc(Pairs,Offsets),
    length(Records,Count),
    build_source_data('KBs/inert-fixture.krf',cache{dialect:krf,count:Count},Records,Offsets,Data).

:- end_tests(catalog_providers).
