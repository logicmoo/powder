:- begin_tests(source_pack_catalog).
:- use_module('../kb_source_pack_catalog').
:- use_module(library(assoc)).
:- use_module(library(http/json)).

base(Defined,Declared,Referenced,B) :-
    B=dependencies{status:complete,coverage:coverage{records:complete,definitions:complete,references:complete},
      reasons:[],defined:Defined,declared:Declared,referenced:Referenced,outbound:Referenced,
      unresolved:[],microtheories:microtheories{outbound:[],missingImplied:implied{status:unknown}}}.
empty_extensions(provider_extensions{status:complete,declared:[],
  coverage:coverage{types:complete,schemaTargets:complete},reasons:[]}).
symbol(Name,Arity,Role,symbol(Name,[Arity],[Role],[positive],[e(a1,7,Role,positive)])).
snapshot(B,E,S) :-
    File=file{path:'KBs/root.krf',status:fresh,rawSourceHash:raw_hash,
      identity:identity{sourceHash:legacy_hash,normalizedDigest:semantic_digest,
        normalizedHash:file_fingerprint,indexHash:index_fingerprint},
      dependencySummary:B,providerExtensions:E},
    kb_source_pack_catalog:path_key('KBs/root.krf',Key),list_to_assoc([Key-File],Files),
    S=source_pack_catalog{status:available,revision:revision1,taxonomy:taxonomy1,
      verifiedAt:123,coverage:coverage{complete:true},files:Files}.
analysis(S,A) :- catalog_analysis(S,'KBs/root.krf',A).
typed(Name,Role,Entry) :-
    Entry=symbol{symbol:Name,arities:[],roles:[declaration],polarities:[positive],
      evidenceCount:1,evidence:[evidence{id:a2,line:8,kind:typed_declaration,
        callableRole:Role,variableNames:["?Original"],mt:x_Mt,
        typeAssertions:[proof{id:a2,sourceFile:'KBs/root.krf'}]}]}.

test(static_head_does_not_invent_executable_kind_or_original_names) :-
    symbol(x_doWork,2,consequent,D),base([D],[],[D],B),empty_extensions(E),snapshot(B,E,S),analysis(S,A),
    A.info.symbols.defined=[Def],Def.evidence=[Proof],
    assertion(Proof.kind==static_head),assertion(Proof.via==unknown),
    assertion(Proof.variableNames==null),assertion(Proof.implementation==unknown),
    assertion(Def.evidenceCount==null),assertion(Def.rolePresentation.doInvocation==true).
test(real_hash_kinds_are_separate) :-
    base([],[],[],B),empty_extensions(E),snapshot(B,E,S),analysis(S,A),
    assertion(A.info.source.sha256==legacy_hash),assertion(A.info.source.rawSha256==raw_hash),
    assertion(A.info.cache.normalizedDigest==semantic_digest),
    assertion(A.info.cache.fileHash==file_fingerprint),assertion(A.info.cache.indexHash==index_fingerprint).
test(typed_subject_becomes_local_provider_and_not_outbound) :-
    symbol(x_doWork,1,assertion,R),base([],[],[R],B),typed(x_doWork,predicates,T),
    empty_extensions(E0),E=E0.put(declared,[T]),snapshot(B,E,S),analysis(S,A),
    assertion(A.info.symbols.outbound==[]),A.info.symbols.declared=[D],
    assertion(D.rolePresentation.doInvocation==true),
    assertion(D.evidenceCount==1),
    assertion(D.evidence=[evidence{callableRole:predicates,id:a2,kind:typed_declaration,
      line:8,mt:x_Mt,typeAssertions:[proof{id:a2,sourceFile:'KBs/root.krf'}],variableNames:["?Original"]}]).
test(function_naming_does_not_invent_predicate_evidence) :-
    base([],[],[],B),typed(x_doSomething,functions,T),empty_extensions(E0),
    E=E0.put(declared,[T]),snapshot(B,E,S),analysis(S,A),
    A.info.symbols.declared=[D],assertion(D.rolePresentation.doInvocation==unknown).
test(explicit_schema_subject_is_relation_evidence_for_do_label) :-
    symbol(x_doThing,2,declaration,D),base([],[D],[],B),empty_extensions(E),
    snapshot(B,E,S),analysis(S,A),A.info.symbols.declared=[Decl],
    assertion(Decl.rolePresentation.doInvocation==true).
test(nonmatching_name_never_becomes_do_invocation) :-
    base([],[],[],B),typed(x_dog,predicates,T),empty_extensions(E0),
    snapshot(B,E0.put(declared,[T]),S),analysis(S,A),A.info.symbols.declared=[D],
    assertion(D.rolePresentation.doInvocation==false).
test(declaration_arities_group_by_canonical_symbol) :-
    symbol(x_p,1,declaration,One),symbol(x_p,2,declaration,Two),
    base([],[One,Two],[One,Two],B),typed(x_p,predicates,T),empty_extensions(E),
    snapshot(B,E.put(declared,[T]),S),analysis(S,A),
    A.info.symbols.declared=[D],assertion(D.arities==[1,2]),
    assertion(D.sampledEvidenceCount==3),assertion(A.info.symbols.outbound==[]).
test(ordinary_uses_are_not_local_providers) :-
    symbol(x_p,1,assertion,R),base([],[],[R],B),empty_extensions(E),snapshot(B,E,S),analysis(S,A),
    assertion(A.info.symbols.defined==[]),assertion(A.info.symbols.declared==[]),
    assertion(A.info.symbols.outbound=[_]).
test(metta_unknown_is_not_repaired_to_empty) :-
    base(null,null,[],B0),B=B0.put(coverage,coverage{records:complete,definitions:unknown,references:partial}),
    empty_extensions(E0),E=E0.put(provider_extensions{status:unavailable,declared:null}),
    snapshot(B,E,S),analysis(S,A),assertion(A.info.status==partial),
    assertion(A.info.symbols.declared==null),assertion(A.info.symbols.outbound==null).
test(partial_extensions_prevent_global_uniqueness) :-
    symbol(x_p,1,head,D),base([D],[],[],B),empty_extensions(E),
    snapshot(B,E.put(status,partial),S),catalog_provider_index(S,all,I,1),
    assertion(I.coverage.complete==false),get_assoc(x_p,I.providerLookup,[_]),
    analysis(S,A),assertion(A.info.coverage.definitions==partial).
test(stale_snapshot_never_offers_ghost_providers) :-
    symbol(x_p,1,head,D),base([D],[],[],B),empty_extensions(E),snapshot(B,E,S0),
    S=S0.put(status,stale),catalog_provider_index(S,all,I,0),
    assoc_to_list(I.providerLookup,[]),analysis(S,A),assertion(A.info.status==unavailable).
test(missing_saved_member_is_explicit_not_replaced) :-
    base([],[],[],B),empty_extensions(E),snapshot(B,E,S),
    catalog_analysis(S,'KBs/repos/sumo/removed.kif',A),
    assertion(A.info.status==unavailable),assertion(A.info.symbols.defined==null),
    assertion(A.info.reasons=[reason{code:source_not_in_current_catalog,detail:missing_or_unindexed}]).
test(missing_projection_fields_are_unavailable) :-
    base([],[],[],B),empty_extensions(E),snapshot(B,E,S0),
    kb_source_pack_catalog:path_key('KBs/root.krf',Key),
    get_assoc(Key,S0.files,F),del_dict(dependencySummary,F,_,Bad),
    put_assoc(Key,S0.files,Bad,Files),S=S0.put(files,Files),
    analysis(S,A),assertion(A.info.status==unavailable),
    catalog_provider_index(S,all,I,1),assertion(I.coverage.complete==false),
    assoc_to_list(I.providerLookup,[]).
test(malformed_compact_rows_are_unavailable_not_silent_failure) :-
    base([unsupported_record],[],[],B),empty_extensions(E),snapshot(B,E,S),
    analysis(S,A),assertion(A.info.status==unavailable),
    catalog_provider_index(S,all,I,1),assertion(I.coverage.complete==false).
test(index_retains_compact_tokens_until_candidate_requested) :-
    symbol(x_p,1,head,D),base([D],[],[],B),empty_extensions(E),snapshot(B,E,S),
    catalog_provider_index(S,all,I,1),get_assoc(x_p,I.providerLookup,[Token]),
    assertion(Token=catalog_compact('KBs/root.krf',defined,D)),
    catalog_provider(Token,P),assertion(P.kind==defined),assertion(P.evidence=[_]).
test(complete_json_analysis_has_no_internal_compact_terms) :-
    symbol(x_p,1,head,D),base([D],[],[D],B),empty_extensions(E),snapshot(B,E,S),analysis(S,A),
    assertion(ground(A)),with_output_to(string(_),json_write_dict(current_output,A)).

:- end_tests(source_pack_catalog).
