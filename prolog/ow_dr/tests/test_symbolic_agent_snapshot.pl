:- ensure_loaded(test_symbolic_agent_kee).
:- begin_tests(symbolic_agent_snapshot).
:- use_module('../kb_symbolic_agent_knowledge',[]).
:- use_module('../kb_symbolic_agent_knowledge_schema',[]).
:- use_module('../kb_symbolic_agent_wire',[]).
:- use_module('../kb_kee_schema',[]).
:- use_module('../kb_activity',[]).
:- use_module(library(prolog_wrap)).
:- use_module(library(http/json)).

basic_records([kb(a901,x_DefMt,x_isa(x_Agent,x_SymbolicTextAgent)),
               kb(a902,x_DefMt,x_value("café 😀"))]).
fixture(Records,F,T,P) :-
    plunit_symbolic_agent_kee:native_fixture_records(Records,F),
    plunit_symbolic_agent_kee:snapshot_context(T),kb_kee_auth:principal(T,P).
basic_fixture(F,T,P) :- basic_records(R),fixture(R,F,T,P).
cleanup(F,T) :-
    kb_kee:close_context(T),plunit_symbolic_agent_kee:cleanup_native(F).
args(Overrides,Args) :-
    kb_store:generation(G),
    Args=json{agent:"x_Agent",mt:"x_DefMt",linkedMts:[],generation:G,
      maxRecords:8192,maxBytes:1048576}.put(Overrides).
read(P,Overrides,Reply) :-
    args(Overrides,Args),kb_symbolic_agent_knowledge:read_snapshot(P,Args,Reply).
released :-
    assertion(\+kb_store:query_snapshot(_,_,_,_)),
    assertion(\+kb_store:native_query_refs(_,_)),
    kb_activity:activity_status(Status),assertion(Status.active==0).

test(schema_is_closed_and_requires_explicit_selection) :-
    kb_symbolic_agent_knowledge_schema:input_spec(Spec),
    kb_kee_schema:json_schema(Spec,Schema),
    assertion(Schema.additionalProperties==false),
    assertion(member(linkedMts,Schema.required)),
    assertion(member(maxBytes,Schema.required)),
    args(json{principal:json{}},Bad),
    catch(kb_kee_schema:validate(Spec,Bad,_),Error,true),
    assertion(nonvar(Error)),assertion(Error=error(kee(invalid_arguments,_),_)).

test(actual_native_references_names_and_deterministic_digest,
     [setup(basic_fixture(F,T,P)),cleanup(cleanup(F,T))]) :-
    read(P,json{},A),read(P,json{},B),
    assertion(A.snapshotHash==B.snapshotHash),assertion(A==B),
    assertion(ground(A)),assertion(A.complete==true),
    assertion(A.programValidated==false),
    member(Row,A.records),Row.id=="a902",
    assertion(Row.kbNames==[]),
    F=fixture(_,Source,_,_,_),atom_string(Source,Path),
    assertion(Row.provenance.sourceFile==Path),
    assertion(Row.provenance.sourceLine==2),
    assertion(Row.provenance.occurrenceId==Row.id),
    assertion(Row.provenance.verification=="pinned_native_metadata"),released,!.

test(selection_deduplicates_and_does_not_invent_empty_mt_contents,
     [setup(basic_fixture(F,T,P)),cleanup(cleanup(F,T))]) :-
    read(P,json{linkedMts:["x_DefMt","x_EmptyMt","x_EmptyMt"]},R),
    assertion(R.selectedMts==["x_DefMt","x_EmptyMt"]),
    assertion(R.recordCount==2),
    assertion(member(json{mt:"x_EmptyMt",recordCount:0,status:"no_loaded_assertions"},R.microtheories)).

test(authorized_but_unselected_link_is_not_automatically_read,
     [setup(fixture([kb(a901,x_DefMt,x_isa(x_Agent,x_SymbolicTextAgent)),
                     kb(a902,x_DefMt,x_symbolicAgentContext(x_Agent,x_Lexicon,x_PrivateMt)),
                     kb(a903,x_PrivateMt,x_secret(x_A))],F,T,P)),
      cleanup(cleanup(F,T)),throws(error(symbolic_snapshot_unselected_mt("x_PrivateMt"),_))]) :-
    read(P,json{},_).

test(unselected_records_never_leak,
     [setup(fixture([kb(a901,x_DefMt,x_isa(x_Agent,x_SymbolicTextAgent)),
                     kb(a902,x_PrivateMt,x_secret(x_A))],F,T,P)),cleanup(cleanup(F,T))]) :-
    read(P,json{},R),assertion(R.recordCount==1),
    assertion(\+ (member(Row,R.records),get_dict(id,Row,"a902"))).

test(missing_loaded_definition_is_explicit,
     [setup(basic_fixture(F,T,P)),cleanup(cleanup(F,T)),
      throws(error(symbolic_snapshot_definition_unavailable,_))]) :-
    read(P,json{agent:"x_UnloadedAgent"},_).

test(variable_class_does_not_fabricate_identity,
     [setup(fixture([kb(a901,x_DefMt,x_isa(x_Agent,_))],F,T,P)),
      cleanup(cleanup(F,T)),throws(error(symbolic_snapshot_definition_unavailable,_))]) :-
    read(P,json{},_).

test(stale_generation_fails_and_releases_lease,
     [setup(basic_fixture(F,T,P)),cleanup(cleanup(F,T))]) :-
    kb_store:generation(G),Wrong is G+1,
    catch(read(P,json{generation:Wrong},_),Error,true),
    assertion(nonvar(Error)),assertion(Error=error(symbolic_snapshot_generation_conflict,_)),released.

test(canonical_keys_only_not_sexpression_or_goal_inputs,
     [setup(basic_fixture(F,T,P)),cleanup(cleanup(F,T))]) :-
    catch(read(P,json{agent:"(shell \"never\")"},_),Error,true),
    assertion(nonvar(Error)),released.

test(byte_limit_is_real_utf8_not_a_character_or_row_limit,
     [setup(basic_fixture(F,T,P)),cleanup(cleanup(F,T))]) :-
    read(P,json{},R),kb_symbolic_agent_knowledge:json_bytes(R,Bytes),
    kb_symbolic_agent_knowledge:json_text(R,JSON),string_length(JSON,Characters),
    assertion(Bytes>Characters),
    Limit is Bytes-1,
    catch(read(P,json{maxBytes:Limit},_),Error,true),
    assertion(nonvar(Error)),assertion(Error=error(symbolic_snapshot_byte_limit(Limit),_)),released.

test(oversized_string_is_rejected_before_json_allocation,
     [setup(basic_fixture(F,T,_)),cleanup(cleanup(F,T)),
      throws(error(symbolic_snapshot_byte_limit(1024),_))]) :-
    length(Codes,2048),maplist(=(0'a),Codes),string_codes(Text,Codes),
    kb_symbolic_agent_knowledge:bounded_text(json{value:Text},1024).

structure_records([
    kb(a901,x_DefMt,x_isa(x_Agent,x_SymbolicTextAgent)),
    kb(a902,x_DefMt,(x_path(X,Y):-and(x_edge(X,Z),x_edge(Z,Y)))),
    kb(a903,x_DefMt,x_forAll(X,x_thereExists(Y,x_pair(X,Y)))),
    kb(a904,x_DefMt,x_values([x_A,X],metta_map{x_key:X},-3.25,"a")),
    kb(a905,x_DefMt,t(x_compound(x_Head),x_arg(X))),
    kb(a906,x_DefMt,'x_<=='(x_data(X),x_body(X)))
]).
structure_fixture(F,T,P) :-
    structure_records(R),fixture(R,F,T,P),
    F=fixture(_,_,_,M,_),
    retractall(M:xc_kb_names(a902,_)),
    assertz(M:xc_kb_names(a902,["??Foo-Bar","$Target","?z"])).

test(rule_quantifier_higher_order_and_structure_roundtrip_without_execution,
     [setup(structure_fixture(F,T,P)),cleanup(cleanup(F,T))]) :-
    setup_call_cleanup(
      wrap_predicate(kb_runtime:rule_guard(_,_,_,_,_),symbolic_snapshot_body,_,
        throw(error(symbolic_test_body_executed,_))),
      read(P,json{},R),
      unwrap_predicate(kb_runtime:rule_guard(_,_,_,_,_),symbolic_snapshot_body)),
    kb_symbolic_agent_knowledge:decode_snapshot(R,Records),
    member(kb(a902,_,(x_path(X,Y):-and(x_edge(A,Z),x_edge(B,C)))),Records),
    assertion(X==A),assertion(Y==C),assertion(Z==B),
    member(kb(a903,_,x_forAll(U,x_thereExists(V,x_pair(U1,V1)))),Records),
    assertion(U==U1),assertion(V==V1),assertion(U\==V),assertion(U\==X),
    member(kb(a904,_,x_values([x_A,D],Map,-3.25,"a")),Records),assertion(Map.x_key==D),
    member(kb(a905,_,t(x_compound(x_Head),x_arg(_))),Records),
    member(kb(a906,_,'x_<=='(x_data(Q),x_body(Q1))),Records),assertion(Q==Q1),
    member(Row,R.records),Row.id=="a902",
    assertion(Row.kbNames==["??Foo-Bar","$Target","?z"]),
    kb_symbolic_agent_knowledge:decode_snapshot(R,Other),
    member(kb(a902,_,(x_path(Fresh,_):-_)),Other),assertion(Fresh\==X),released,!.

test(malformed_name_alignment_rejected,
     [setup(basic_fixture(F,T,P)),cleanup(cleanup(F,T)),
      throws(error(symbolic_snapshot_variable_names(a902),_))]) :-
    F=fixture(_,_,_,M,_),retractall(M:xc_kb_names(a902,_)),assertz(M:xc_kb_names(a902,["?wrong"])),
    read(P,json{},_).

test(metadata_body_is_rejected_not_executed,
     [setup(basic_fixture(F,T,P)),cleanup(cleanup(F,T)),
      throws(error(symbolic_snapshot_invalid_metadata(source_file),_))]) :-
    F=fixture(_,_,_,M,_),retractall(M:xc_source_file(a902,_)),
    assertz(M:(xc_source_file(a902,_) :- throw(error(symbolic_test_metadata_executed,_)))),
    read(P,json{},_).

test(timeout_cleans_pin_and_application_lease,
     [setup(basic_fixture(F,T,P)),cleanup(cleanup(F,T))]) :-
    setup_call_cleanup(
      wrap_predicate(kb_runtime:module_assertion(_,_,_,_),symbolic_snapshot_delay,Wrapped,
        (sleep(0.1),call(Wrapped))),
      catch(read(P,json{seconds:0.01},_),Error,true),
      unwrap_predicate(kb_runtime:module_assertion(_,_,_,_),symbolic_snapshot_delay)),
    assertion(Error==time_limit_exceeded),released.

test(opaque_handle_is_never_serialized,
     [setup(basic_fixture(F,T,_)),cleanup(cleanup(F,T)),
      throws(error(symbolic_snapshot_opaque_term,_))]) :-
    F=fixture(_,_,_,M,_),kb_runtime:module_assertion(M,a901,_,Ref),
    kb_symbolic_agent_knowledge:supported_data(x_value(Ref),0).

test(cyclic_source_is_rejected,
     [throws(error(symbolic_snapshot_cyclic_term,_))]) :-
    X=x_cycle(X),kb_symbolic_agent_knowledge:consume_cells(budget(0,0),X).

dag(0,x_leaf) :- !.
dag(N,x_pair(Child,Child)) :- Next is N-1,dag(Next,Child).
test(shared_subterm_cannot_expand_without_a_bound,
     [throws(error(symbolic_snapshot_expansion_limit,_))]) :-
    dag(25,Term),kb_symbolic_agent_knowledge:supported_data(Term,0).

switch_fixture(F1,F2,T,P,G) :-
    basic_fixture(F1,T,P),kb_store:generation(G),
    plunit_symbolic_agent_kee:native_fixture_records(
      [kb(a911,x_DefMt,x_isa(x_Agent,x_SymbolicTextAgent)),
       kb(a912,x_DefMt,x_new_generation(x_OnlyNew))],F2),
    F2=fixture(_,Source,_,_,_),retractall(kb_store:source_module(Source,_,_)).
cleanup_switch(F1,F2,T,G) :-
    cleanup(F1,T),plunit_symbolic_agent_kee:cleanup_native(F2),
    retractall(kb_store:generation(_)),assertz(kb_store:generation(G)).
switch_generation(Q,F1,F2,G) :-
    thread_get_message(Q,switch),
    F1=fixture(_,Old,_,_,_),F2=fixture(_,New,Native,Module,_),
    with_mutex(openworld_store,transaction(
      (retractall(kb_store:source_module(Old,_,_)),
       assertz(kb_store:source_module(New,Module,Native)),
       retractall(kb_store:generation(_)),Next is G+1,assertz(kb_store:generation(Next))))),
    thread_send_message(Q,switched).
switch_at_pin(Q,Wrapped) :-
    call(Wrapped),thread_send_message(Q,switch),thread_get_message(Q,switched).
join_switch(Thread) :-
    thread_property(Thread,status(Status)),
    (Status==running->thread_signal(Thread,throw(symbolic_snapshot_test_cancelled));true),
    thread_join(Thread,_).

test(concurrent_source_switch_reads_only_the_pinned_generation,
     [setup(switch_fixture(F1,F2,T,P,G)),cleanup(cleanup_switch(F1,F2,T,G))]) :-
    args(json{generation:G},Args),
    setup_call_cleanup(message_queue_create(Q),
      setup_call_cleanup(
        thread_create(plunit_symbolic_agent_snapshot:switch_generation(Q,F1,F2,G),Thread,[]),
        setup_call_cleanup(
          wrap_predicate(kb_store:acquire_query_snapshot(_),symbolic_snapshot_switch,Wrapped,
            plunit_symbolic_agent_snapshot:switch_at_pin(Q,Wrapped)),
          kb_symbolic_agent_knowledge:read_snapshot(P,Args,R),
          unwrap_predicate(kb_store:acquire_query_snapshot(_),symbolic_snapshot_switch)),
        join_switch(Thread)),
      message_queue_destroy(Q)),
    assertion(R.generation==G),kb_store:generation(Current),assertion(Current=:=G+1),
    assertion(R.recordCount==2),
    assertion((member(Row,R.records),get_dict(id,Row,"a902"))),
    assertion(\+ (member(Row,R.records),get_dict(id,Row,"a912"))),released.

:- end_tests(symbolic_agent_snapshot).
