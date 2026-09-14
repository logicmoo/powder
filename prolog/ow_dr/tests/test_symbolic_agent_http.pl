:- ensure_loaded(test_symbolic_agent_snapshot).
:- ensure_loaded(test_symbolic_agent_todos).
:- begin_tests(symbolic_agent_http).
:- use_module('../kb_symbolic_agent_host',[]).
:- use_module('../kb_symbolic_agent_http',[]).
:- use_module('../kb_symbolic_agent_profiles',[]).
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
    advance(interrupt,Unknown,"pause",json{},Paused),
    catch(advance(resume,Paused,"resume",json{},_),ResumeError,true),
    assertion(ResumeError=error(symbolic_resume_requires_resolved_action,_)),
    advance(stop,Paused,"stop",json{},Stopped),assertion(Stopped.run.phase==stopped).
test(committed_but_unknown_action_cannot_resume_or_replay,
    [setup(todo_fixture(F)),cleanup(cleanup(F))]) :-
    start(R),advance(send,R,"text",json{text:"review phrase dog"},Planned),
    advance(continue,Planned,"read",json{},Read),advance(continue,Read,"write",json{},Write),
    setup_call_cleanup(
      wrap_predicate(kb_symbolic_agent_kee:execute_request(_,Request,_),symbolic_http_unknown,Wrapped,
        (call(Wrapped),(Request.tool=="kee_todo_create"->throw(error(test_lost_reply,_));true))),
      advance(continue,Write,"dispatch-write",json{},Unknown),
      unwrap_predicate(kb_symbolic_agent_kee:execute_request(_,_,_),symbolic_http_unknown)),
    assertion(Unknown.run.pending.stage=="unknown"),
    advance(interrupt,Unknown,"pause",json{},Paused),
    catch(advance(resume,Paused,"resume",json{},_),Error,true),
    assertion(Error=error(symbolic_resume_requires_resolved_action,_)),
    kb_symbolic_agent_host:request(receipt,json{id:Paused.run.id,conversation:Paused.run.conversation,
      actionCallId:Paused.run.pending.callId},Receipt),assertion(Receipt.receipt.status=="committed"),
    kb_symbolic_agent_host:request(todos,json{id:Paused.run.id,conversation:Paused.run.conversation},Todos),
    assertion(Todos.result.total==1).

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

app_fixture(Ledger) :- plunit_symbolic_agent_todos:fixture(json{},Ledger,_).
app_start(R) :-
    kb_symbolic_agent_host:request(start,json{profile:"cyc-starter-v1",
      conversation:"app-profile-isolated",callId:"app-start"},R).
app_form(Form) :- app_start(R),advance(send,R,"todo",json{text:"new todo"},Form).
app_planned(Planned) :-
    app_form(Form),
    advance(form,Form,"form",json{values:json{title:"A bounded task",description:""}},Filled),
    advance(continue,Filled,"plan-read",json{},Planned).
test(planned_action_interrupt_resumes_without_dispatch_or_duplicate_effect,
    [setup(app_fixture(F)),cleanup(plunit_symbolic_agent_todos:cleanup(F))]) :-
    app_planned(Planned),
    setup_call_cleanup(plunit_symbolic_agent_todos:trap_transports,
      (advance(interrupt,Planned,"pause",json{},Paused),
       advance(resume,Paused,"resume-planned",json{},Resumed),
       assertion(Resumed.run.phase==awaiting_action),
       assertion(Resumed.run.pending==Planned.run.pending),
       assertion(Resumed.run.actions==Planned.run.actions),
       assertion(Resumed.run.steps==Planned.run.steps),
       kb_symbolic_agent_host:request(receipt,json{id:Resumed.run.id,
         conversation:Resumed.run.conversation,actionCallId:Resumed.run.pending.callId},Receipt),
       assertion(Receipt.receipt.status=="unknown"),
       advance(continue,Resumed,"dispatch-read",json{},Read),
       advance(continue,Resumed,"dispatch-read",json{},Replay),assertion(Replay.replayed==true),
       advance(continue,Read,"plan-write",json{},Write),
       advance(interrupt,Write,"pause-write",json{},PausedWrite),
       advance(resume,PausedWrite,"resume-write",json{},ResumedWrite),
       assertion(ResumedWrite.run.pending==Write.run.pending),
       finish_steps(ResumedWrite,4,Done),
       kb_symbolic_agent_host:request(todos,json{id:Done.run.id,conversation:Done.run.conversation},Todos),
       assertion(Todos.result.total==1),
       flag(symbolic_todo_external_calls,Calls,Calls),assertion(Calls==0)),
      plunit_symbolic_agent_todos:untrap_transports).
test(oversize_form_title_is_rejected_while_form_remains_editable,
    [setup(app_fixture(F)),cleanup(plunit_symbolic_agent_todos:cleanup(F))]) :-
    app_form(Form),length(Codes,257),maplist(=(0'a),Codes),string_codes(Long,Codes),
    catch(advance(form,Form,"too-long",json{values:json{title:Long,description:""}},_),Error,true),
    assertion(nonvar(Error)),
    assertion(Error=error(symbolic_form_invalid(length("title",1,256)),_)),
    kb_symbolic_agent_host:request(conversation,
      json{id:Form.run.id,conversation:Form.run.conversation},Still),
    assertion(Still.run.revision==Form.run.revision),
    assertion(Still.run.phase==awaiting_form),assertion(Still.run.actions==0),
    sub_string(Long,0,256,_,Valid),
    advance(form,Still,"corrected",json{values:json{title:Valid,description:""}},Filled),
    finish_steps(Filled,8,Done),
    kb_symbolic_agent_host:request(todos,json{id:Done.run.id,conversation:Done.run.conversation},Todos),
    Todos.result.items=[Todo],assertion(Todo.data.title==Valid).

invalid_action_fixture(fixture(Native,Ledger)) :-
    todo_program(P),maplist(domain_record,P.records,Domain),
    length(Codes,257),maplist(=(0'a),Codes),string_codes(Long,Codes),
    maplist(invalid_action_record(Long),Domain,Records),
    plunit_symbolic_agent_kee:native_fixture_records(Records,Native),
    plunit_symbolic_agent_todos:fixture(json{},Ledger,_).
invalid_action_record(Long,kb(Id,Mt,Term),kb(Id,Mt,Out)) :- invalid_action_term(Long,Term,Out).
invalid_action_term(Long,Term,Out) :-
    (var(Term)->Out=Term;
      Term=x_symbolicField("title",_)->Out=x_symbolicField("title",Long);
      compound(Term)->compound_name_arguments(Term,Name,Args),
        maplist(invalid_action_term(Long),Args,Converted),compound_name_arguments(Out,Name,Converted);
      Out=Term).
test(invalid_registry_arguments_never_cross_dispatch_boundary,
    [setup(invalid_action_fixture(F)),cleanup(cleanup(F))]) :-
    start(R),advance(send,R,"text",json{text:"review phrase dog"},Planned),
    advance(continue,Planned,"read",json{},Read),advance(continue,Read,"write",json{},Write),
    flag(symbolic_invalid_dispatches,_,0),
    setup_call_cleanup(
      wrap_predicate(kb_symbolic_agent_kee:execute_request(_,Request,_),symbolic_invalid_dispatch,Wrapped,
        ((Request.tool=="kee_todo_create"->flag(symbolic_invalid_dispatches,N,N+1);true),call(Wrapped))),
      catch(advance(continue,Write,"invalid-dispatch",json{},_),Error,true),
      unwrap_predicate(kb_symbolic_agent_kee:execute_request(_,_,_),symbolic_invalid_dispatch)),
    flag(symbolic_invalid_dispatches,Count,Count),assertion(Count==0),
    assertion(nonvar(Error)),
    Error=error(symbolic_action_not_dispatched(error(kee(invalid_arguments,Details),_)),_),
    assertion(Details.path=="$.data.title"),
    kb_symbolic_agent_host:request(conversation,json{id:Write.run.id,conversation:Write.run.conversation},Still),
    assertion(Still.run.revision==Write.run.revision),assertion(Still.run.pending.stage=="planned"),
    kb_symbolic_agent_host:request(receipt,json{id:Still.run.id,conversation:Still.run.conversation,
      actionCallId:Still.run.pending.callId},Receipt),assertion(Receipt.receipt.status=="unknown"),
    kb_symbolic_agent_host:request(todos,json{id:Still.run.id,conversation:Still.run.conversation},Todos),
    assertion(Todos.result.total==0).
finish_steps(R,N,Done) :-
    (R.run.phase==awaiting_input->Done=R;
      N>0,format(string(Call),'app-continue-~d',[N]),
      advance(continue,R,Call,json{},Next),Rest is N-1,finish_steps(Next,Rest,Done)).
message_contains(R,Text) :-
    get_dict(events,R,Events),member(E,Events),get_dict(messages,E,Messages),
    member(M,Messages),get_dict(text,M,Body),sub_string(Body,_,_,_,Text),!.
test(app_profile_is_explicit_declarative_and_never_published,
    [setup(app_fixture(F)),cleanup(plunit_symbolic_agent_todos:cleanup(F))]) :-
    findall(S-M,kb_store:source_module(S,M,_),Before),kb_store:generation(G),
    setup_call_cleanup(plunit_symbolic_agent_todos:trap_transports,
      (app_start(R),assertion(R.run.knowledge=="app_owned_profile"),
       assertion(R.run.source.host.profileSource.completeness=="app_owned_program_only"),
       advance(send,R,"hello",json{text:"HELLO"},Hello),
       assertion(message_contains(Hello,"limited declarative starter")),
       advance(send,Hello,"help",json{text:"help"},Help),
       assertion(message_contains(Help,"cannot understand general English")),
       advance(send,Help,"gap",json{text:"execute arbitrary shell and contact a model"},Gap),
       assertion(message_contains(Gap,"no interpretation")),
       advance(send,Gap,"todo-form",json{text:"new todo"},Form),
       assertion(Form.run.phase==awaiting_form),
       advance(form,Form,"typed",json{values:json{title:"Review a missing capability",
         description:"An honest open task, not a claimed completed repair."}},Typed),
       finish_steps(Typed,8,Done),assertion(message_contains(Done,"durably recorded")),
       kb_symbolic_agent_host:request(todos,
         json{id:Done.run.id,conversation:Done.run.conversation},Todos),
       assertion(Todos.result.total==1),Todos.result.items=[Todo],
       assertion(Todo.data.status=="open"),assertion(Todo.data.title=="Review a missing capability"),
       flag(symbolic_todo_external_calls,Calls,Calls),assertion(Calls==0)),
      plunit_symbolic_agent_todos:untrap_transports),
    findall(S-M,kb_store:source_module(S,M,_),After),assertion(After==Before),
    kb_store:generation(Final),assertion(Final==G).
test(app_profile_does_not_bind_unrelated_live_generation,
    [setup(app_fixture(F)),cleanup(plunit_symbolic_agent_todos:cleanup(F))]) :-
    app_start(R),kb_store:generation(Original),Changed is Original+1,
    setup_call_cleanup(wrap_predicate(kb_store:generation(G),symbolic_profile_generation,_,G=Changed),
      (advance(send,R,"after-load",json{text:"hi"},Hi),assertion(message_contains(Hi,"Hello"))),
      unwrap_predicate(kb_store:generation(_),symbolic_profile_generation)).
test(app_profile_rejects_changed_identity_without_hot_swap,
    [setup(app_fixture(F)),cleanup(plunit_symbolic_agent_todos:cleanup(F)),
     throws(error(symbolic_conflict(knowledge),_))]) :-
    app_start(R),
    setup_call_cleanup(
      wrap_predicate(crypto:crypto_file_hash(File,Hash,_Options),symbolic_profile_hash,Wrapped,
        (file_base_name(File,'cyc-starter.krf')->
          Hash=ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
          call(Wrapped))),
      advance(send,R,"changed-profile",json{text:"hi"},_),
      unwrap_predicate(crypto:crypto_file_hash(_,_,_),symbolic_profile_hash)).
test(unknown_profile_is_not_a_filesystem_selector,
    [throws(error(kee(invalid_arguments,_),_))]) :-
    kb_symbolic_agent_host:request(start,json{profile:"../tests/fixtures/symbolic-agent.krf",
      conversation:"bad",callId:"bad"},_).
test(profile_selection_cannot_smuggle_paths_or_loaded_scope,
    [throws(error(kee(invalid_arguments,_),_))]) :-
    kb_symbolic_agent_host:request(start,json{profile:"cyc-starter-v1",
      conversation:"bad",callId:"bad",linkedMts:["x_SecretMt"],path:"KBs/tinyKB.kif"},_).

http_fixture(Fixture,Port) :-
    fixture(Fixture),
    http_server(http_dispatch,[port(Port),workers(2)]),
    assertz(kb_server:server_port(Port)).
http_cleanup(F,Port) :-
    http_stop_server(Port,[]),retractall(kb_server:server_port(Port)),cleanup(F).
app_http_fixture(F,Port) :-
    app_fixture(F),http_server(http_dispatch,[port(Port),workers(2)]),
    assertz(kb_server:server_port(Port)).
app_http_cleanup(F,Port) :-
    http_stop_server(Port,[]),retractall(kb_server:server_port(Port)),
    plunit_symbolic_agent_todos:cleanup(F).
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
test(real_http_starter_without_any_loaded_profile,
    [setup(app_http_fixture(F,Port)),cleanup(app_http_cleanup(F,Port))]) :-
    post(Port,start,json{profile:"cyc-starter-v1",
      conversation:"http-app-profile",callId:"start"},R,200),
    assertion(R.run.knowledge=="app_owned_profile"),
    input_args(R,"http-hello",Input),
    post(Port,send,Input.put(text,"hello"),Hello,200),
    assertion(message_contains(Hello,"limited declarative starter")),
    input_args(Hello,"http-form",FormInput),
    post(Port,send,FormInput.put(text,"add todo"),Form,200),
    assertion(Form.run.pending.kind=="form"),
    input_args(Form,"http-stop",Stop),post(Port,stop,Stop,Stopped,200),
    assertion(Stopped.run.phase=="stopped").
test(actual_fork_preserves_completed_todo_receipts_without_replaying,
     [setup(app_fixture(F)),cleanup(plunit_symbolic_agent_todos:cleanup(F))]) :-
    setup_call_cleanup(plunit_symbolic_agent_todos:trap_transports,
      (app_planned(Planned),finish_steps(Planned,8,Parent),
       assertion(Parent.run.fork.allowed==true),assertion(Parent.run.actions==2),
       kb_kee_ledger:snapshot(Before),
       advance(fork,Parent,"branch",json{newConversation:"forked-app"},Child),
       assertion(Child.run.conversation=="forked-app"),assertion(Child.run.id\==Parent.run.id),
       assertion(Child.run.state==Parent.run.state),
       assertion(Child.run.source.host.snapshotHash==Parent.run.source.host.snapshotHash),
       assertion(Child.run.source.host.selectedMts==Parent.run.source.host.selectedMts),
       assertion(Child.run.steps==Parent.run.steps),assertion(Child.run.actions==Parent.run.actions),
       assertion(Child.run.turns==Parent.run.turns),
       assertion(Child.eventTotal=:=Parent.eventTotal+1),assertion(Child.run.nativeEventSequence==0),
       once((member(Committed,Child.events),get_dict(action,Committed,Action),
         Action\==null,get_dict(status,Action,"committed"))),
       assertion(Committed.inherited==true),assertion(Committed.origin.runId==Parent.run.id),
       kb_kee_ledger:snapshot(After),
       assertion(After.sequence=:=Before.sequence+1),
       findall(R,(member(R,Before.resources),R.kind==todo),TodosBefore),
       findall(R,(member(R,After.resources),R.kind==todo),TodosAfter),
       assertion(TodosBefore==TodosAfter),length(TodosAfter,1),
       advance(fork,Parent,"branch",json{newConversation:"forked-app"},Again),
       assertion(Again.run.id==Child.run.id),assertion(Again.replayed==true),
       advance(send,Child,"child-hello",json{text:"hello"},Hello),
       assertion(message_contains(Hello,"limited declarative starter")),
       assertion(Hello.run.steps>Parent.run.steps),
       advance(send,Child,"child-hello",json{text:"hello"},HelloReplay),
       assertion(HelloReplay.replayed==true),
       kb_symbolic_agent_host:request(conversation,
         json{id:Parent.run.id,conversation:Parent.run.conversation},Same),
       assertion(Same.run.revision==Parent.run.revision),
       flag(symbolic_todo_external_calls,Calls,Calls),assertion(Calls==0)),
      plunit_symbolic_agent_todos:untrap_transports).

test(fork_native_commit_cas_rejects_parent_change_after_helper_validation,
     [setup(app_fixture(F)),cleanup(plunit_symbolic_agent_todos:cleanup(F))]) :-
    app_start(Public),
    kb_symbolic_agent_host:base_spec(Public.run.conversation,"all",[],ReadSpec),
    setup_call_cleanup(kb_symbolic_agent_control:open_control(ReadSpec,Reader),
      kb_symbolic_agent_control:get(Reader,Public.run.id,R),
      kb_symbolic_agent_control:close_control(Reader)),
    kb_symbolic_agent_host:restore_program(json{conversation:Public.run.conversation},R,P,Spec),
    setup_call_cleanup(kb_symbolic_agent_control:open_control(Spec,C),
      setup_call_cleanup(
        wrap_predicate(kb_symbolic_agent_control:control_call(_,Name,_,CallId,_),
          symbolic_fork_cas,Wrapped,
          ((Name=="kee_agent_run_create",CallId=="symbolic-http/cas-fork"->
             kb_symbolic_agent_control:advance_prepared(C,P,R.id,text("hello"),"race",_,[]);
             true),call(Wrapped))),
        catch(advance(fork,Public,"cas-fork",json{newConversation:"cas-child"},_),Error,true),
        unwrap_predicate(kb_symbolic_agent_control:control_call(_,_,_,_,_),symbolic_fork_cas)),
      kb_symbolic_agent_control:close_control(C)),
    assertion(nonvar(Error)),assertion(Error=error(kee(domain_conflict,_),_)),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==2),
    assertion(\+ (member(Resource,S.resources),get_dict(data,Resource,Data),
      get_dict(owner,Data,Owner),get_dict(conversation,Owner,"cas-child"))).

test(real_http_fork_identity_receipt_scope_and_unsafe_rejection,
     [setup(app_http_fixture(F,Port)),cleanup(app_http_cleanup(F,Port))]) :-
    post(Port,start,json{profile:"cyc-starter-v1",conversation:"fork-http-parent",callId:"start"},R,200),
    input_args(R,"branch",Input),Args=Input.put(newConversation,"fork-http-child"),
    post(Port,fork,Args,Child,200),
    assertion(Child.run.conversation=="fork-http-child"),assertion(Child.run.fork.allowed==true),
    post(Port,fork,Args,Replay,200),assertion(Replay.run.id==Child.run.id),
    kb_symbolic_agent_host:request(request_status,json{conversation:"fork-http-child",callId:"branch"},Receipt),
    assertion(Receipt.receipt.status=="committed"),
    kb_symbolic_agent_host:request(request_status,json{conversation:"fork-http-parent",callId:"branch"},Absent),
    assertion(Absent.receipt.status=="unknown"),
    input_args(Child,"todo",Send),post(Port,send,Send.put(text,"new todo"),Form,200),
    assertion(Form.run.fork.allowed==false),
    input_args(Form,"unsafe",Unsafe),
    post(Port,fork,Unsafe.put(newConversation,"unsafe-child"),Rejected,409),
    assertion(Rejected.error.code=="symbolic_fork_unsafe").

test(postcommit_fork_read_failure_is_unknown_not_a_known_rejection,
     [setup(app_http_fixture(F,Port)),cleanup(app_http_cleanup(F,Port))]) :-
    app_start(R),input_args(R,"lost-branch",Input),Args=Input.put(newConversation,"lost-child"),
    setup_call_cleanup(
      wrap_predicate(kb_symbolic_agent_control:get(Control,_,_),symbolic_fork_lost,Wrapped,
        (Control=control(_,Owner,_),
         (Owner.conversation=="lost-child"->throw(error(test_lost_after_create,_));call(Wrapped)))),
      post(Port,fork,Args,Lost,500),
      unwrap_predicate(kb_symbolic_agent_control:get(_,_,_),symbolic_fork_lost)),
    assertion(Lost.error.code=="symbolic_fork_outcome_unknown"),
    kb_symbolic_agent_host:request(request_status,
      json{conversation:"lost-child",callId:"lost-branch"},Receipt),
    assertion(Receipt.receipt.status=="committed"),
    kb_kee_ledger:snapshot(Before),
    post(Port,fork,Args,Recovered,200),assertion(Recovered.replayed==true),
    assertion(Recovered.run.id==Receipt.receipt.commit.result.id),
    kb_kee_ledger:snapshot(After),assertion(After==Before).

test(http_predispatch_error_preserves_registry_reason,
    [setup((invalid_action_fixture(F),http_server(http_dispatch,[port(Port),workers(2)]),
      assertz(kb_server:server_port(Port)))),cleanup(http_cleanup(F,Port))]) :-
    start_args(A),post(Port,start,A,R,200),
    input_args(R,"input",Input),post(Port,send,Input.put(text,"review phrase dog"),Planned,200),
    input_args(Planned,"read",ReadArgs),post(Port,continue,ReadArgs,Read,200),
    input_args(Read,"write",WriteArgs),post(Port,continue,WriteArgs,Write,200),
    input_args(Write,"reject",RejectArgs),post(Port,continue,RejectArgs,Rejected,422),
    assertion(Rejected.error.code=="symbolic_action_not_dispatched"),
    assertion(Rejected.error.dispatched==false),
    assertion(Rejected.error.cause.code=="invalid_arguments"),
    assertion(Rejected.error.cause.details.path=="$.data.title").

:- end_tests(symbolic_agent_http).
