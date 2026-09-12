:- ensure_loaded(test_term_resolver).
:- begin_tests(role_metadata).
:- use_module('../kb_role_metadata').
:- use_module('../kb_term_roles').
:- use_module('../kb_non_atomic').
:- use_module('../kb_metadata_policy',[retention_policy/1]).
:- use_module('../kb_cache',[read_cache/3,write_cache/4,file_digest/2]).
:- use_module('../kb_paths').
:- use_module(library(http/json)).
:- use_module(library(process)).
:- use_module(library(qsave)).

huge(Text) :- length(Codes,200000),maplist(=(0'x),Codes),string_codes(Text,Codes).
marker(Term,Kind,P) :-
    non_atomic_key(Term,Key),
    P=_{name:term_representation,value:term_representation{
      schema:'powder.term-representation.v1',identity:Key,representation:Kind}}.
index(Props,Index) :-
    E=evidence{source:'KBs/legacy.krf',originalSource:'KBs/old.krf',line:1,properties:Props},
    build_term_index(3,[loaded(a1,x_isa(x_Fn(x_a),x_Thing),x_BaseKB,E)],Index).
json_ready(Value) :-
    assertion(ground(Value)),with_output_to(string(_),json_write_dict(current_output,Value)).

test(shared_policy_drops_redundant_blobs_before_the_derived_index_copies_them) :-
    huge(Text),Props=[_{name:'original-formula',value:Text},
                     _{name:original_cnf,value:Text},_{name:source_expression,value:Text},
                     _{name:creator,value:"Alice"}],
    project_properties(Props,Kept,R),
    assertion(Kept==[json{name:creator,value:"Alice"}]),
    assertion(R.policyDroppedCount==3),assertion(R.complete==false),
    assertion(R.sourcePropertyPositions==[3]),
    index(Props,Index),index_assertions(Index,[a1],Reply),Reply.items=[A],
    assertion(A.properties==Kept),
    assertion(Index.coverage.metadataProperties.policyDroppedProperties==3).
test(intentional_large_cnf_and_large_unknown_values_are_deferred_not_duplicated) :-
    huge(Text),Props=[_{name:cnf,value:Text},_{name:other_payload,value:Text}],
    project_properties(Props,Kept,R),assertion(Kept==[]),
    assertion(R.policyDroppedCount==0),assertion(R.deferredCount==2),
    assertion(R.originalCount==2),assertion(R.authoritative==false),
    assertion(Props=[_{name:cnf,value:Text},_{name:other_payload,value:Text}]).
test(compact_real_properties_remain_lossless_and_ground) :-
    Props=[_{name:creator,value:"Alice"},_{name:custom_property,value:_{a:[1,"x",false]}},
           _{name:comments,value:[_{line:1,column:1,text:"kept"}]}],
    project_properties(Props,Kept,R),assertion(R.complete==true),
    assertion(R.sourcePropertyPositions==[0,1,2]),json_ready(Kept).
test(conflicting_markers_survive_a_full_ordinary_property_budget) :-
    findall(_{name:small,value:N},between(1,90,N),Ordinary),
    marker(x_Fn(x_a),nart,A),marker(x_Fn(x_a),naut,B),
    append(Ordinary,[A,B],Props),index(Props,Index),
    non_atomic_key(x_Fn(x_a),Key),index_term(Index,Key,Reply),
    assertion(Reply.inferredIsa.representation.status==conflicting),
    assertion(Reply.inferredIsa.representation.kinds==[nart,naut]),
    findall(P,(member(E,Reply.inferredIsa.representation.evidence),P=E.propertyPosition),Positions),
    assertion(Positions==[90,91]),
    assertion(Index.coverage.metadataProperties.deferredProperties==26).
test(marker_optional_payload_is_not_retained_for_reification_evidence) :-
    huge(Text),marker(x_Fn(x_a),nart,M),Extended=M.put(value,M.value.put(originalBody,Text)),
    project_properties([Extended],Kept,R),Kept=[P],
    assertion(\+get_dict(originalBody,P.value,_)),
    assertion(R.condensedMarkerCount==1),assertion(R.complete==false),
    index([Extended],Index),non_atomic_key(x_Fn(x_a),Key),index_term(Index,Key,Reply),
    assertion(Reply.inferredIsa.representation.kinds==[nart]).
test(raw_reified_class_or_prolog_text_is_never_parsed_as_actual_reification) :-
    Props=[_{name:original_prolog,value:":- throw(must_not_execute)."},
           _{name:original_formula,value:"(isa (Fn a) CycLNonAtomicReifiedTerm)"}],
    index(Props,Index),non_atomic_key(x_Fn(x_a),Key),index_term(Index,Key,Reply),
    assertion(Reply.inferredIsa.representation.status==unknown).
test(valid_marker_identity_can_exceed_the_ordinary_string_budget) :-
    length(Codes,10000),maplist(=(0'x),Codes),string_codes(Text,Codes),
    marker(x_Fn(Text),nart,P),project_properties([P],Kept,R),
    assertion(R.retainedCount==1),Kept=[K],assertion(K.value.identity==P.value.identity).
test(source_header_probing_is_not_needed_even_for_missing_custom_kif_sources) :-
    E=evidence{source:'KBs/does-not-exist/custom.kif',originalSource:'KBs/old.kif',line:1,
      properties:[_{name:original_formula,value:"unused"},_{name:creator,value:"kept"}]},
    build_term_index(3,[loaded(a1,x_p(x_a),x_BaseKB,E)],Index),
    assertion(Index.coverage.metadataProperties.policyDroppedProperties==1).
test(deep_or_oversized_properties_are_bounded_without_partial_value_rewrites) :-
    nest(30,"leaf",Deep),project_properties([_{name:deep,value:Deep}],Kept,R),
    assertion(Kept==[]),assertion(R.deferredCount==1),assertion(R.complete==false).
nest(0,V,V) :- !.
nest(N,V,[Rest]) :- Next is N-1,nest(Next,V,Rest).
test(derived_cache_is_declared_volatile) :-
    assertion(predicate_property(kb_term_roles:cached_index(_,_),volatile)).
test(stale_retention_policy_cache_is_rebuilt_even_without_a_generation_change,
     [setup(plunit_term_roles:fixture(S)),cleanup(plunit_term_roles:cleanup(S))]) :-
    kb_store:generation(G),index([],Built),
    Stale=Built.put(_{generation:G,metadataPolicy:obsolete_policy}),
    assertz(kb_term_roles:cached_index(G,Stale)),
    loaded_term_index(Fresh),retention_policy(Policy),
    assertion(Fresh.generation==G),assertion(Fresh.metadataPolicy==Policy),
    findall(Tag,(kb_term_roles:cached_index(G,I),Tag=I.metadataPolicy),Tags),
    assertion(Tags==[Policy]).

test(native_snapshot_keeps_provenance_and_compact_markers_without_mutating_authoritative_properties,
     [setup(plunit_term_roles:fixture(S)),cleanup(plunit_term_roles:cleanup(S))]) :-
    Nat=x_Fn(x_a),plunit_term_roles:row(1,x_isa(Nat,x_Thing),x_BaseKB,Row),
    plunit_term_roles:fixture_cache('projection.krf',[Row],Source,Cache),
    huge(Text),marker(Nat,nart,Marker),
    read_cache(Cache,H,[record(Id,T,Metadata)]),
    append(Metadata,[xc_cnf(Id,Text),xc_term_representation(Id,Marker.value)],WithMetadata),
    write_cache(Cache,H,[record(Id,T,WithMetadata)],_),
    plunit_term_roles:load_fixture(Source,Cache,Loaded),
    file_digest(Source,SH),file_digest(Cache,CH),
    resolve_term('(Fn a)',R),assertion(R.generation==Loaded.generation),
    assertion(R.inferredIsa.representation.kinds==[nart]),
    assertion_role_asts([a1],Batch),Batch.items=[A],
    assertion(\+ (member(P,A.properties),get_dict(name,P,cnf))),
    assertion(A.propertyProjection.deferredCount==1),
    kb_store:assertion(a1,Stored),
    once((member(P,Stored.properties),get_dict(name,P,cnf),get_dict(value,P,Actual))),
    assertion(Actual==Text),
    file_digest(Source,SH),file_digest(Cache,CH).
test(qsave_image_does_not_restore_the_derived_cache,
     [setup(plunit_term_roles:fixture(S)),cleanup(plunit_term_roles:cleanup(S))]) :-
    repo_root(Root),directory_file_path(Root,'roles-image.state',Image),
    current_prolog_flag(executable,Exe),
    source_file(kb_term_roles:clear_term_role_cache,Module),
    Check=(kb_term_roles:cached_index(_,_)->halt(17);halt(0)),
    Producer=(use_module(Module),assertz(kb_term_roles:cached_index(0,not_to_be_saved)),
      qsave_program(Image,[goal(Check),toplevel(halt),stand_alone(false),autoload(false)]),halt),
    term_to_atom(Producer,Goal),
    process_create(Exe,['-q','-g',Goal],[process(ProducerPID)]),
    process_wait(ProducerPID,Produced),assertion(Produced==exit(0)),
    process_create(Exe,['-q','-x',Image],[process(PID)]),
    process_wait(PID,Exit),assertion(Exit==exit(0)).

:- end_tests(role_metadata).
