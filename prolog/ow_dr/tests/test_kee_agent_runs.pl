:- ensure_loaded(test_kee_ledger).
:- begin_tests(kee_agent_runs).
:- use_module('../kb_kee').
:- use_module('../kb_kee_ledger',[]).
:- use_module(library(http/json)).

fixture(state(F,T,Host)) :-
    plunit_kee_ledger:fixture(F),plunit_kee:host(H),
    Host=H.put(json{kind:"symbolic",
      permissions:["agent.run.read","agent.run.write","changeset.read","changeset.undo","todo.read","todo.write","knowledge.query"],
      effects:["application_read","application_write","agent_state_control","knowledge_read","query","telemetry"]}),
    kb_kee:open_context(Host,T).
cleanup(state(F,T,_)) :- kb_kee:close_context(T),plunit_kee_ledger:cleanup(F).
invoke(T,Tool,CallId,Args,R) :-
    kb_kee:invoke(T,json{tool:Tool,schemaVersion:1,callId:CallId,arguments:Args},R).
revision(Text) :- kb_kee_ledger:snapshot(S),atom_string(S.revision,Text).
create(T,Input,R) :-
    revision(Rev),Input=json{revision:Rev,mt:"x_PublicMt",
      sourceJson:"{\"agent\":\"fixture-agent\",\"definition\":\"fixture-v1\"}",
      stateJson:"{\"cursor\":0,\"enabled\":false}"},
    invoke(T,"kee_agent_run_create","create",Input,R).
resource(Id,R) :- kb_kee_ledger:snapshot(S),kb_kee_ledger:resource(Id,S,R).
event_input(Id,Input) :-
    resource(Id,R),revision(Rev),atom_string(R.revision,ResourceRevision),
    Input=json{revision:Rev,id:Id,resourceRevision:ResourceRevision,expectedEvent:R.data.eventSequence,
      status:"running",step:1,stateJson:"{\"cursor\":1}",eventKind:"transition",eventJson:"{}",action:null}.

test(create_is_durable_data_not_agent_execution,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),kb_store:generation(Before),create(T,_,Created),Id=Created.result.result.id,
    resource(Id,R),assertion(R.kind==agent_run),assertion(R.data.status==created),
    assertion(R.data.eventSequence==0),assertion(R.data.owner.agent=="fixture-agent"),
    atom_json_dict(R.data.stateJson,Data,[]),assertion(Data.enabled==false),assertion(Data.cursor==0),
    kb_store:generation(After),assertion(After==Before).
test(cas_state_event_atomic_and_same_call_replayed,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),create(T,_,Created),Id=Created.result.result.id,event_input(Id,Input),
    invoke(T,"kee_agent_run_event","event-1",Input,First),resource(Id,R),
    assertion(R.data.eventSequence==1),assertion(R.data.status==running),
    assertion(R.data.lastEvent.id=="event-1"),assertion(R.data.stateJson=="{\"cursor\":1}"),
    invoke(T,"kee_agent_run_event","event-1",Input,Again),assertion(Again.result.replayed==true),
    assertion(Again.result.changeset==First.result.changeset),
    invoke(T,"kee_agent_run_events","events",json{id:Id},Events),
    assertion(Events.result.total==2),Events.result.items=[_,Event],assertion(Event.event.id=="event-1").
test(stale_event_and_resource_preconditions_preserve_state,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),create(T,_,Created),Id=Created.result.result.id,event_input(Id,Input),
    invoke(T,"kee_agent_run_event","event-1",Input,_),event_input(Id,Next),
    kb_kee_ledger:snapshot(Before),
    catch(invoke(T,"kee_agent_run_event","bad-counter",Next.put(expectedEvent,0),_),
      error(kee(agent_event_conflict,_),_),Conflict=true),assertion(Conflict==true),
    catch(invoke(T,"kee_agent_run_event","bad-resource",Next.put(resourceRevision,Input.resourceRevision),_),
      error(kee(resource_conflict,_),_),Stale=true),assertion(Stale==true),
    kb_kee_ledger:snapshot(After),assertion(After==Before).
test(stop_is_metadata_and_terminal_cannot_silently_resume,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),create(T,_,Created),Id=Created.result.result.id,event_input(Id,Input),
    invoke(T,"kee_agent_run_event","stop",Input.put(json{status:"stopped",eventKind:"stop"}),_),
    event_input(Id,Next),catch(invoke(T,"kee_agent_run_event","resume",Next,_),
      error(kee(agent_terminal_state,_),_),Stopped=true),assertion(Stopped==true),
    invoke(T,"kee_agent_run_event","late-log",Next.put(json{status:"stopped",eventKind:"log"}),_),
    resource(Id,R),assertion(R.data.status==stopped).
test(state_control_is_not_available_to_llm_even_with_grants,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,_,Host),LLM=Host.put(json{kind:"llm",model:"fixture",promptVersion:"v1",promptHash:"fixture"}),
    setup_call_cleanup(kb_kee:open_context(LLM,T),
      (kb_kee:registry(T,Registry),once((member(C,Registry.tools),C.name==kee_agent_run_create)),
       assertion(C.available==false),
       catch(create(T,_,_),error(kee(agent_control_host_only,_),_),Denied=true),assertion(Denied==true)),
      kb_kee:close_context(T)),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==0).
test(owner_scope_covers_get_and_generic_audit,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,Host),create(T,_,Created),Id=Created.result.result.id,
    setup_call_cleanup(kb_kee:open_context(Host.put(agent,"other-agent"),Other),
      (catch(invoke(Other,"kee_agent_run_get","get",json{id:Id},_),
         error(kee(agent_owner_denied,_),_),Denied=true),assertion(Denied==true),
       invoke(Other,"kee_agent_run_list","list",json{mt:"x_PublicMt"},List),assertion(List.result.total==0),
       invoke(Other,"kee_audit","audit",json{mt:"x_PublicMt"},Audit),assertion(Audit.result.total==0)),
      kb_kee:close_context(Other)).
test(action_commit_link_requires_real_durable_receipt,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),create(T,_,Created),Id=Created.result.result.id,event_input(Id,Input),
    BadAction=json{tool:"kee_todo_create",callId:"not-committed",status:"committed",
      commitRevision:"0000000000000000000000000000000000000000000000000000000000000000"},
    catch(invoke(T,"kee_agent_run_event","fake-result",
      Input.put(json{eventKind:"action_outcome",action:BadAction}),_),error(kee(unconfirmed_action_commit,_),_),Denied=true),
    assertion(Denied==true),revision(Rev),plunit_kee_ledger:data(D),
    invoke(T,"kee_todo_create","actual-action",json{revision:Rev,mt:"x_PublicMt",data:D},Action),
    event_input(Id,Next),atom_string(Action.result.revision,CommitRevision),
    Good=json{tool:"kee_todo_create",callId:"actual-action",status:"committed",commitRevision:CommitRevision},
    invoke(T,"kee_agent_run_event","actual-result",Next.put(json{eventKind:"action_outcome",action:Good}),_),
    resource(Id,R),assertion(R.data.lastEvent.action.status==committed),
    invoke(T,"kee_todo_list","todos",json{mt:"x_PublicMt"},Todos),assertion(Todos.result.total==1).
test(intent_and_outcome_ids_cannot_collide_with_action_id,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),create(T,_,Created),event_input(Created.result.result.id,Input),
    A=json{tool:"kee_todo_create",callId:"same",status:"planned",commitRevision:null},
    catch(invoke(T,"kee_agent_run_event","same",Input.put(json{eventKind:"action_intent",action:A}),_),
      error(kee(agent_event_call_collision,_),_),Conflict=true),assertion(Conflict==true).
test(run_history_is_not_undoable_execution,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),create(T,_,Created),revision(Rev),
    catch(invoke(T,"kee_undo","rewind",json{revision:Rev,changeset:Created.result.changeset},_),
      error(kee(non_undoable_resource_kind,_),_),Denied=true),assertion(Denied==true).
test(prolog_or_array_payload_cannot_be_executed_or_stored,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),revision(Rev),
    forall(member(Text,["[]","null",":- halt.","{\"x\":1,\"x\":2}"]),
      (catch(invoke(T,"kee_agent_run_create","bad",
        json{revision:Rev,mt:"x_PublicMt",sourceJson:"{}",stateJson:Text},_),
        error(kee(invalid_agent_json,_),_),Invalid=true),assertion(Invalid==true))),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==0).
test(fresh_process_reads_run_and_replays_event_without_advancing,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(fixture(Root,_,_),T,Host),create(T,_,Created),Id=Created.result.result.id,
    event_input(Id,Input),invoke(T,"kee_agent_run_event","event-1",Input,First),
    Request=json{tool:"kee_agent_run_event",schemaVersion:1,callId:"event-1",arguments:Input},
    directory_file_path(Root,'agent-replay.pl',Job),
    setup_call_cleanup(open(Job,write,S,[encoding(utf8)]),
      kb_cache:write_one_line(S,invoke(Host,Request)),close(S)),
    kb_kee_ledger:snapshot(Before),
    plunit_kee_ledger:start_worker(invoke,Job,Worker),plunit_kee_ledger:finish_worker(Worker,Text),
    atom_json_dict(Text,Reply,[]),assertion(Reply.result.replayed==true),
    assertion(Reply.result.changeset==First.result.changeset),
    kb_kee_ledger:snapshot(After),assertion(After==Before),assertion(ground(After)).

:- end_tests(kee_agent_runs).
