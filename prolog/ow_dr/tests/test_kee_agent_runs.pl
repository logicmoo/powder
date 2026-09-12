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
test(utf8_public_todo_write_read_and_replay,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),string_codes(Value,[128512,945,28450]),string_concat("unicode-",Value,CallId),
    revision(Rev),plunit_kee_ledger:data(Base),Data=Base.put(json{title:Value,description:Value}),
    Request=json{tool:"kee_todo_create",schemaVersion:1,callId:CallId,
      arguments:json{revision:Rev,mt:"x_PublicMt",data:Data}},
    kb_kee_schema:json_text(Request,JSON),kb_kee:invoke_json(T,JSON,Created),
    Id=Created.result.result.id,invoke(T,"kee_todo_get","unicode-get",json{id:Id},Detail),
    assertion(Detail.result.resource.data.title==Value),
    assertion(Detail.result.resource.data.description==Value),assertion(Created.callId==CallId),
    kb_kee_ledger:snapshot(Before),kb_kee:invoke_json(T,JSON,Replay),
    assertion(Replay.result.replayed==true),assertion(Replay.result.changeset==Created.result.changeset),
    kb_kee_ledger:snapshot(After),assertion(After==Before).
test(utf8_public_read_budget_counts_bytes_not_characters,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,Host),length(Codes,400),maplist(=(128512),Codes),string_codes(Value,Codes),
    revision(Rev),plunit_kee_ledger:data(Base),Data=Base.put(description,Value),
    invoke(T,"kee_todo_create","unicode-task",json{revision:Rev,mt:"x_PublicMt",data:Data},Created),
    Request=json{tool:"kee_todo_get",schemaVersion:1,callId:"unicode-read",
      arguments:json{id:Created.result.result.id}},
    kb_kee:invoke(T,Request,Full),kb_kee_schema:json_text(Full,Text),string_length(Text,Characters),
    kb_kee_schema:json_size(Full,Bytes),Limit is max(1024,Characters),assertion(Bytes>Limit),
    Budgets=Host.budgets.put(resultBytes,Limit),kb_kee_ledger:snapshot(Before),
    setup_call_cleanup(kb_kee:open_context(Host.put(budgets,Budgets),Limited),
      (catch(kb_kee:invoke(Limited,Request,_),error(kee(result_budget,_),_),Rejected=true),
       assertion(Rejected==true)),kb_kee:close_context(Limited)),
    kb_kee_ledger:snapshot(After),assertion(After==Before).
test(utf8_public_lifecycle_source_state_event_and_replay,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),string_codes(Value,[128512]),atom_codes(Key,[120,95,128512]),
    dict_create(State,json,[Key-Value,enabled-false]),
    kb_kee_schema:json_text(json{label:Value},SourceJSON),kb_kee_schema:json_text(State,StateJSON),
    revision(Rev),Input=json{revision:Rev,mt:"x_PublicMt",sourceJson:SourceJSON,stateJson:StateJSON},
    invoke(T,"kee_agent_run_create","unicode-run",Input,Created),Id=Created.result.result.id,
    invoke(T,"kee_agent_run_get","unicode-run-get",json{id:Id},Detail),
    assertion(Detail.result.resource.data.sourceJson==SourceJSON),
    assertion(Detail.result.resource.data.stateJson==StateJSON),
    event_input(Id,Base),Event=Base.put(json{stateJson:StateJSON,eventJson:SourceJSON}),
    invoke(T,"kee_agent_run_event","unicode-event",Event,Written),
    invoke(T,"kee_agent_run_events","unicode-events",json{id:Id},Events),
    Events.result.items=[_,Last],assertion(Last.event.json==SourceJSON),
    kb_kee_ledger:snapshot(Before),invoke(T,"kee_agent_run_event","unicode-event",Event,Replay),
    assertion(Replay.result.replayed==true),assertion(Replay.result.changeset==Written.result.changeset),
    kb_kee_ledger:snapshot(After),assertion(After==Before).
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

domain_status(T,Status) :-
    invoke(T,"kee_ledger_status","domain-status",json{},Reply),Status=Reply.result.
rejected(T,Tool,CallId,Args,Code) :-
    catch(invoke(T,Tool,CallId,Args,_),error(kee(Code,_),_),Caught=true),
    assertion(Caught==true).

test(domain_tokens_are_read_only_and_repeatable,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(fixture(Root,_,_),T,_),domain_status(T,First),domain_status(T,Again),
    assertion(First==Again),assertion(First.domainRevisions.application_todo\==First.domainRevisions.agent_control),
    assertion(string(First.domainRevisions.application_todo)),
    directory_files(Root,Names),assertion(Names==['.','..']).
test(domain_token_survives_prepare_dispatch_and_receipt_journaling,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),domain_status(T,Initial),create(T,_,Created),RunId=Created.result.result.id,
    plunit_kee_ledger:data(D),
    ActionArgs=json{revision:Initial.domainRevisions.application_todo,mt:"x_PublicMt",data:D},
    ActionRequest=json{tool:"kee_todo_create",schemaVersion:1,callId:"planned-action",arguments:ActionArgs},
    atom_json_dict(PendingJSON,json{pendingCall:ActionRequest},[width(0)]),atom_string(PendingJSON,Pending),
    event_input(RunId,Input),
    Intent=json{tool:"kee_todo_create",callId:"planned-action",status:"planned",commitRevision:null},
    invoke(T,"kee_agent_run_event","intent",
      Input.put(json{eventKind:"action_intent",action:Intent,stateJson:Pending}),_),
    domain_status(T,Prepared),assertion(Prepared.revision\==Initial.revision),
    assertion(Prepared.domainRevisions.application_todo==Initial.domainRevisions.application_todo),
    event_input(RunId,OutcomeBase),
    OutcomeInput=OutcomeBase.put(revision,Prepared.domainRevisions.agent_control),
    kb_kee:invoke(T,ActionRequest,ActionReply),domain_status(T,Dispatched),
    assertion(Dispatched.domainRevisions.agent_control==Prepared.domainRevisions.agent_control),
    atom_string(ActionReply.result.revision,CommitRevision),
    Outcome=Intent.put(json{status:"committed",commitRevision:CommitRevision}),
    invoke(T,"kee_agent_run_event","outcome",
      OutcomeInput.put(json{eventKind:"action_outcome",action:Outcome,stateJson:"{\"pendingCall\":null}"}),_),
    resource(RunId,R),assertion(R.data.lastEvent.action.status==committed),
    invoke(T,"kee_call_status","probe",json{callId:"planned-action"},Probe),
    assertion(Probe.result.status==committed),
    assertion(Probe.result.commit.changeset==ActionReply.result.changeset).
test(domain_tokens_do_not_rebase_legacy_global_requests,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),domain_status(T,Initial),create(T,_,_),
    atom_string(Initial.revision,Global),plunit_kee_ledger:data(D),
    kb_kee_ledger:snapshot(Before),
    rejected(T,"kee_todo_create","old-global",json{revision:Global,mt:"x_PublicMt",data:D},ledger_conflict),
    kb_kee_ledger:snapshot(After),assertion(After==Before).
test(domain_tokens_reject_wrong_domain_and_stale_todo_state,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),domain_status(T,Initial),plunit_kee_ledger:data(D),
    rejected(T,"kee_todo_create","wrong-domain",
      json{revision:Initial.domainRevisions.agent_control,mt:"x_PublicMt",data:D},domain_revision_scope),
    Args=json{revision:Initial.domainRevisions.application_todo,mt:"x_PublicMt",data:D},
    invoke(T,"kee_todo_create","winner",Args,_),kb_kee_ledger:snapshot(Before),
    rejected(T,"kee_todo_create","stale-domain",Args,domain_conflict),
    rejected(T,"kee_agent_run_create","wrong-agent-domain",
      json{revision:Initial.domainRevisions.application_todo,mt:"x_PublicMt",sourceJson:"{}",stateJson:"{}"},
      domain_revision_scope),
    kb_kee_ledger:snapshot(After),assertion(After==Before).
test(domain_tokens_advance_for_update_delete_undo_and_aba_redo,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),domain_status(T,Initial),plunit_kee_ledger:data(D),
    invoke(T,"kee_todo_create","todo",json{revision:Initial.domainRevisions.application_todo,mt:"x_PublicMt",data:D},C),
    Id=C.result.result.id,resource(Id,Original),domain_status(T,S1),atom_string(Original.revision,R1),
    invoke(T,"kee_todo_update","same-data",json{revision:S1.domainRevisions.application_todo,
      id:Id,resourceRevision:R1,mt:"x_PublicMt",data:D},_),domain_status(T,S2),
    resource(Id,Updated),atom_string(Updated.revision,R2),
    assertion(S2.domainRevisions.application_todo\==S1.domainRevisions.application_todo),
    rejected(T,"kee_todo_update","stale-resource",json{revision:S2.domainRevisions.application_todo,
      id:Id,resourceRevision:R1,mt:"x_PublicMt",data:D},resource_conflict),
    invoke(T,"kee_todo_delete","delete",json{revision:S2.domainRevisions.application_todo,
      id:Id,resourceRevision:R2},Deleted),domain_status(T,S3),
    invoke(T,"kee_undo","undo-delete",json{revision:S3.domainRevisions.application_todo,
      changeset:Deleted.result.changeset},Undo),domain_status(T,S4),
    invoke(T,"kee_redo","redo-delete",json{revision:S4.domainRevisions.application_todo,
      changeset:Undo.result.changeset},_),domain_status(T,S5),
    findall(Token,(member(S,[Initial,S1,S2,S3,S4,S5]),Token=S.domainRevisions.application_todo),Tokens),
    sort(Tokens,Unique),assertion(same_length(Tokens,Unique)),
    resource(Id,Final),assertion(Final.deleted==true).
test(domain_token_replay_preserves_exact_original_request,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),domain_status(T,Initial),plunit_kee_ledger:data(D),
    Args=json{revision:Initial.domainRevisions.application_todo,mt:"x_PublicMt",data:D},
    invoke(T,"kee_todo_create","durable-action",Args,First),create(T,_,_),
    domain_status(T,Current),kb_kee_ledger:snapshot(Before),
    invoke(T,"kee_todo_create","durable-action",Args,Replay),
    assertion(Replay.result.replayed==true),assertion(Replay.result.changeset==First.result.changeset),
    assertion(Replay.result.currentRevision==Before.revision),
    rejected(T,"kee_todo_create","durable-action",Args.put(revision,Current.domainRevisions.application_todo),
      idempotency_conflict),
    kb_kee_ledger:snapshot(After),assertion(After==Before).
test(domain_read_tokens_match_validated_snapshot_and_do_not_weaken_event_cas,[setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=state(_,T,_),create(T,_,Created),Id=Created.result.result.id,domain_status(T,Initial),
    invoke(T,"kee_agent_run_get","get",json{id:Id},Get),
    invoke(T,"kee_agent_run_list","list",json{mt:"x_PublicMt"},List),
    invoke(T,"kee_agent_run_events","events",json{id:Id},Events),
    forall(member(R,[Get,List,Events]),assertion(R.result.domainRevision==Initial.domainRevisions.agent_control)),
    event_input(Id,Input),invoke(T,"kee_agent_run_event","first-event",
      Input.put(revision,Initial.domainRevisions.agent_control),_),domain_status(T,Next),
    rejected(T,"kee_agent_run_event","stale-counter",
      Input.put(revision,Next.domainRevisions.agent_control),agent_event_conflict),
    event_input(Id,Fresh),rejected(T,"kee_agent_run_event","stale-agent-domain",
      Fresh.put(revision,Initial.domainRevisions.agent_control),domain_conflict),
    plunit_kee_ledger:data(D),invoke(T,"kee_todo_create","task",
      json{revision:Next.domainRevisions.application_todo,mt:"x_PublicMt",data:D},Task),
    domain_status(T,Final),invoke(T,"kee_todo_get","task-get",json{id:Task.result.result.id},TaskGet),
    invoke(T,"kee_todo_list","task-list",json{mt:"x_PublicMt"},TaskList),
    assertion(TaskGet.result.domainRevision==Final.domainRevisions.application_todo),
    assertion(TaskList.result.domainRevision==Final.domainRevisions.application_todo),
    kb_kee_ledger:snapshot(S),kb_kee_ledger:domain_revision(S,application_todo,Restored),
    assertion(Restored==Final.domainRevisions.application_todo).

:- end_tests(kee_agent_runs).
