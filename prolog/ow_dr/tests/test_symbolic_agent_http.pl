:- ensure_loaded(test_symbolic_agent_snapshot).
:- ensure_loaded(test_symbolic_agent_todos).
:- begin_tests(symbolic_agent_http).
:- use_module('../kb_symbolic_agent_host',[]).
:- use_module('../kb_symbolic_agent_http',[]).
:- use_module('../kb_kee_ledger',[]).
:- use_module(symbolic_agent_fixture).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(prolog_wrap)).
:- use_module(library(uri)).

fixture(fixture(Native,Ledger)) :-
    fixture_records(Records),
    plunit_symbolic_agent_kee:native_fixture_records(Records,Native),
    plunit_symbolic_agent_todos:fixture(json{},Ledger,_).
cleanup(fixture(Native,Ledger)) :-
    plunit_symbolic_agent_todos:cleanup(Ledger),
    plunit_symbolic_agent_kee:cleanup_native(Native).
start_args(A) :-
    plunit_symbolic_agent_kee:snapshot_arguments(json{},Snapshot),
    A=json{conversation:"http-isolated",callId:"start",agent:Snapshot.agent,
      definitionMt:Snapshot.mt,linkedMts:Snapshot.linkedMts}.
start(R) :- start_args(A),kb_symbolic_agent_host:request(start,A,R).
input_args(R,Call,A) :-
    A=json{id:R.run.id,conversation:R.run.conversation,revision:R.run.revision,callId:Call}.
advance(Action,R,Call,Extra,Next) :-
    input_args(R,Call,A),Args=A.put(Extra),kb_symbolic_agent_host:request(Action,Args,Next).

test(unconfigured_does_not_install_knowledge) :-
    kb_symbolic_agent_host:request(status,json{},R),
    assertion(R.knowledge=="unconfigured"),assertion(R.model==false),assertion(R.network==false).

test(full_native_dialogue_controls_replay_and_durable_history,
    [setup(fixture(F)),cleanup(cleanup(F))]) :-
    setup_call_cleanup(plunit_symbolic_agent_todos:trap_transports,
      (start(R),
       advance(send,R,"send",json{text:"mark Boreal as cat"},Answered),
       assertion(Answered.run.phase==awaiting_input),
       get_dict(events,Answered,AnswerEvents),
       assertion((member(Event,AnswerEvents),get_dict(messages,Event,Messages),
         member(json{text:"Boreal is cat .",proof:_},Messages))),
       advance(send,R,"send",json{text:"mark Boreal as cat"},Replay),
       assertion(Replay.replayed==true),
       assertion(Replay.run.revision==Answered.run.revision),
       advance(interrupt,Answered,"interrupt",json{},Paused),
       assertion(Paused.run.phase==interrupted),
       advance(resume,Paused,"resume",json{},Resumed),
       advance(stop,Resumed,"stop",json{},Stopped),
       assertion(Stopped.run.phase==stopped),
       kb_symbolic_agent_host:request(conversation,
         json{id:R.run.id,conversation:R.run.conversation},Restored),
       assertion(Restored.run.phase==stopped),assertion(Restored.eventTotal==5),
       flag(symbolic_todo_external_calls,Calls,Calls),assertion(Calls==0)),
      plunit_symbolic_agent_todos:untrap_transports).

test(start_retry_does_not_create_second_run,
    [setup(fixture(F)),cleanup(cleanup(F))]) :-
    start(A),start(B),assertion(A.run.id==B.run.id),assertion(B.replayed==true),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==1).

test(reused_call_id_changed_input_rejected,
    [setup(fixture(F)),cleanup(cleanup(F)),throws(error(symbolic_conflict(idempotence),_))]) :-
    start(R),advance(send,R,"send",json{text:"mark Boreal as cat"},_),
    advance(send,R,"send",json{text:"mark Ada as dog"},_).

test(stale_revision_rejected,
    [setup(fixture(F)),cleanup(cleanup(F)),throws(error(symbolic_conflict(revision),_))]) :-
    start(R),advance(send,R,"send",json{text:"mark Boreal as cat"},_),
    advance(stop,R,"stop",json{},_).

test(unselected_knowledge_is_not_expanded,
    [setup(fixture(F)),cleanup(cleanup(F)),throws(error(symbolic_snapshot_unselected_mt(_),_))]) :-
    start_args(A),kb_symbolic_agent_host:request(start,A.put(linkedMts,[]),_).

test(owner_cannot_switch_conversation,
    [setup(fixture(F)),cleanup(cleanup(F))]) :-
    start(R),catch(kb_symbolic_agent_host:request(conversation,
      json{id:R.run.id,conversation:"another"},_),E,true),assertion(nonvar(E)).

test(actual_todo_audit_reads,
    [setup(fixture(F)),cleanup(cleanup(F))]) :-
    start(R),A=json{id:R.run.id,conversation:R.run.conversation},
    kb_symbolic_agent_host:request(todos,A,T),assertion(T.result.total==0),
    kb_symbolic_agent_host:request(audit,A,Audit),assertion(Audit.result.items==[]).

todo_fixture(fixture(Native,Ledger)) :-
    todo_program(P),maplist(domain_record,P.records,Records),
    plunit_symbolic_agent_kee:native_fixture_records(Records,Native),
    plunit_symbolic_agent_todos:fixture(json{},Ledger,_).
domain_record(kb(Id,Mt,Term),kb(Id,Mt,Out)) :- domain_term(Term,Out).
domain_term(Term,Out) :-
    (var(Term)->Out=Term;
      Term=x_symbolicResultField(x_TheList("revision"),Variable)->
        Out=x_symbolicResultField(x_TheList("domainRevisions","application_todo"),Variable);
      compound(Term)->compound_name_arguments(Term,Name,Args),
        maplist(domain_term,Args,Converted),compound_name_arguments(Out,Name,Converted);
      Out=Term).

test(real_durable_todo_workflow_dispatches_once_and_preserves_counters,
    [setup(todo_fixture(F)),cleanup(cleanup(F))]) :-
    start(R),advance(send,R,"text",json{text:"review phrase dog"},Planned),
    assertion(Planned.run.pending.stage=="planned"),
    advance(continue,Planned,"dispatch-read",json{},Read),
    assertion(Read.run.phase==running),
    advance(continue,Planned,"dispatch-read",json{},Replay),
    assertion(Replay.replayed==true),
    advance(continue,Read,"plan-write",json{},Write),
    assertion(Write.run.actions==2),
    advance(continue,Write,"dispatch-write",json{},Wrote),
    assertion(Wrote.run.pending==null),
    advance(continue,Wrote,"finish",json{},Finished),
    assertion(Finished.run.phase==awaiting_input),assertion(Finished.run.actions==2),
    kb_symbolic_agent_host:request(todos,
      json{id:R.run.id,conversation:R.run.conversation},Todos),
    assertion(Todos.result.total==1),
    Todos.result.items=[Todo],assertion(Todo.data.status=="open").

test(dispatched_without_outcome_is_not_replayed,
    [setup(todo_fixture(F)),cleanup(cleanup(F))]) :-
    start(R),advance(send,R,"text",json{text:"review phrase dog"},Planned),
    setup_call_cleanup(
      wrap_predicate(kb_symbolic_agent_control:record_outcome(_,_,_,_,_,_),
        symbolic_http_lost,_,throw(error(test_lost_outcome,_))),
      catch(advance(continue,Planned,"dispatch",json{},_),Error,true),
      unwrap_predicate(kb_symbolic_agent_control:record_outcome(_,_,_,_,_,_),symbolic_http_lost)),
    assertion(nonvar(Error)),
    kb_symbolic_agent_host:request(conversation,
      json{id:R.run.id,conversation:R.run.conversation},Unknown),
    assertion(Unknown.run.pending.stage=="dispatched"),
    catch(advance(continue,Unknown,"retry",json{},_),Rejected,true),
    assertion(Rejected=error(symbolic_outcome_unknown_inspect_receipt,_)),
    advance(stop,Unknown,"stop",json{},Stopped),assertion(Stopped.run.phase==stopped).

form_fixture(fixture(Native,Ledger)) :-
    fixture_records(Base),maplist(form_record,Base,Records),
    plunit_symbolic_agent_kee:native_fixture_records(Records,Native),
    plunit_symbolic_agent_todos:fixture(json{},Ledger,_).
form_record(kb(Id,Mt,Term),kb(Id,Mt,Out)) :-
    (Term=x_symbolicDialogueRule(F,E,C,_)->
      Out=x_symbolicDialogueRule(F,E,C,x_symbolicAwaitForm(x_Review,
        x_TheList(x_symbolicFormField("note",x_String)),_));
      Out=Term).
test(real_typed_form_and_forged_approval_rejection,
    [setup(form_fixture(F)),cleanup(cleanup(F))]) :-
    start(R),advance(send,R,"form",json{text:"mark Boreal as cat"},Form),
    assertion(Form.run.pending.kind=="form"),
    advance(form,Form,"form-submit",json{values:json{note:"A real typed value"}},Filled),
    assertion(Filled.run.phase==running),
    advance(continue,Filled,"finish",json{},Done),assertion(Done.run.phase==awaiting_input),
    catch(kb_symbolic_agent_host:request(approval,
      json{id:R.run.id,conversation:R.run.conversation,approved:true},_),Error,true),
    assertion(nonvar(Error)).

query_fixture(fixture(Native,Ledger)) :-
    fixture_records(Base),kb_store:generation(G),maplist(query_record(G),Base,Records),
    plunit_symbolic_agent_kee:native_fixture_records(Records,Native),
    plunit_symbolic_agent_todos:fixture(json{},Ledger,_).
query_record(G,kb(Id,Mt,Term),kb(Id,Mt,Out)) :-
    (Term=x_symbolicDialogueRule(F,E,C,_)->
      Out=x_symbolicDialogueRule(F,E,C,x_symbolicInvoke("kee_query",
        x_symbolicObject(x_TheList(
          x_symbolicField("query","(#$isa ?Who #$Dog)"),
          x_symbolicField("mt","x_SymbolicTestWorldMt"),
          x_symbolicField("generation",G),x_symbolicField("limit",2),
          x_symbolicField("seconds",1))),_));
      Out=Term).
test(actual_query_gateway_and_source_proofs_without_external_calls,
    [setup(query_fixture(F)),cleanup(cleanup(F))]) :-
    setup_call_cleanup(plunit_symbolic_agent_todos:trap_transports,
      (start(R),advance(send,R,"query",json{text:"mark Ada as dog"},Planned),
       assertion(Planned.run.pending.intent.capability=="kee_query"),
       advance(continue,Planned,"dispatch",json{},Read),
       assertion(Read.run.pending==null),assertion(Read.run.phase==running),
       advance(continue,Read,"finish",json{},Done),assertion(Done.run.phase==awaiting_input),
       flag(symbolic_todo_external_calls,Calls,Calls),assertion(Calls==0)),
      plunit_symbolic_agent_todos:untrap_transports).

test(stale_generation_blocks_execution_but_not_stop,
    [setup(fixture(F)),cleanup(cleanup(F))]) :-
    start(R),kb_store:generation(Original),Changed is Original+1,
    setup_call_cleanup(
      wrap_predicate(kb_store:generation(G),symbolic_http_generation,_,G=Changed),
      (catch(advance(send,R,"stale",json{text:"mark Ada as dog"},_),Error,true),
       assertion(nonvar(Error)),
       advance(stop,R,"stop",json{},Stopped),assertion(Stopped.run.phase==stopped)),
      unwrap_predicate(kb_store:generation(_),symbolic_http_generation)).

http_fixture(Fixture,Port) :-
    fixture(Fixture),
    http_server(http_dispatch,[port(Port),workers(2)]),
    assertz(kb_server:server_port(Port)).
http_cleanup(F,Port) :-
    http_stop_server(Port,[]),retractall(kb_server:server_port(Port)),cleanup(F).
url(Port,Action,URL,Origin) :-
    format(atom(Origin),'http://127.0.0.1:~d',[Port]),
    atom_concat('symbolic/',Action,Path),kb_urls:api_path(Path,Api),
    atom_concat(Origin,Api,URL).
post(Port,Action,Body,Reply,Status) :-
    url(Port,Action,URL,Origin),
    http_post(URL,json(Body),Reply,
      [json_object(dict),status_code(Status),request_header('Origin'=Origin)]).
test(real_localhost_http_lifecycle_and_same_origin_auth,
    [setup(http_fixture(F,Port)),cleanup(http_cleanup(F,Port))]) :-
    start_args(A),post(Port,start,A,R,200),
    input_args(R,"http-send",Input),
    post(Port,send,Input.put(text,"mark Ada as dog"),Answer,200),
    assertion(Answer.run.phase=="awaiting_input"),
    input_args(Answer,"http-interrupt",Interrupt),post(Port,interrupt,Interrupt,Paused,200),
    assertion(Paused.run.phase=="interrupted"),
    input_args(Paused,"http-resume",Resume),post(Port,resume,Resume,Resumed,200),
    input_args(Resumed,"http-stop",Stop),post(Port,stop,Stop,Stopped,200),
    assertion(Stopped.run.phase=="stopped"),
    url(Port,'request-status',ReceiptURL,Origin),
    uri_encoded(query_value,A.conversation,Encoded),
    format(atom(Recovery),'~w?conversation=~w&callId=start',[ReceiptURL,Encoded]),
    http_get(Recovery,Recovered,[json_object(dict),request_header('Origin'=Origin)]),
    assertion(Recovered.receipt.status=="committed"),
    url(Port,start,URL,_),
    http_post(URL,json(A),Denied,[json_object(dict),status_code(Status),
      request_header('Origin'='https://untrusted.invalid')]),
    assertion(Status==403),assertion(Denied.error.code=="symbolic_forbidden").

:- end_tests(symbolic_agent_http).
