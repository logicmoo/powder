:- ensure_loaded(test_symbolic_agent_todos).
:- begin_tests(symbolic_agent_control).
:- use_module('../kb_symbolic_agent_control',[]).
:- use_module('../kb_symbolic_agent_state',[]).
:- use_module('../kb_symbolic_agent_kee',[]).
:- use_module('../kb_kee',[]).
:- use_module(symbolic_agent_fixture).
:- use_module(library(http/json)).

fixture(Fixture,Control,ActionToken) :-
    plunit_symbolic_agent_todos:fixture(json{agent:"symbolic-controller"},Fixture,ActionToken),
    get_time(Now),Expiry is Now+600,
    Spec=json{authenticated:true,actor:"symbolic-test-user",kind:"symbolic",
      agent:"symbolic-controller",conversation:"symbolic-todo-fixture",
      policyVersion:"symbolic-todo-test-v1",model:null,promptVersion:null,promptHash:null,
      permissions:["todo.read","todo.write","changeset.read","agent.run.read","agent.run.write"],
      readMts:["x_SymbolicTestGoalsMt","x_SymbolicTestStateMt"],
      writeMts:["x_SymbolicTestGoalsMt","x_SymbolicTestStateMt"],
      effects:["application_read","application_write","agent_state_control"],expiresAt:Expiry,
      budgets:json{calls:200,mutations:30,resultBytes:1048576,seconds:2}},
    kb_symbolic_agent_control:open_control(Spec,Control).
cleanup(Fixture,Control) :-
    kb_symbolic_agent_control:close_control(Control),
    plunit_symbolic_agent_todos:cleanup(Fixture).

test(compact_cursor_retains_scope_and_sharing_with_bounded_json_depth) :-
    Cursor=frame{engine:state{queue:[x_forAll(X,x_equals(X,Y)),x_next(Y)],pending:X},turns:0},
    kb_symbolic_agent_state:encode_cursor(Cursor,JSON),
    kb_symbolic_agent_state:decode_cursor(JSON,Restored),
    assertion(Restored=@=Cursor),assertion(Restored.engine.pending\==X),
    Restored.engine.queue=[x_forAll(A,x_equals(B,C)),x_next(D)],
    assertion(A==B),assertion(C==D),assertion(Restored.engine.pending==A).

test(forward_cursor_reference_is_rejected,
     [throws(error(domain_error(symbolic_cursor_reference,0),_))]) :-
    kb_symbolic_agent_state:decode_cursor(
      "{\"schema\":\"powder.symbolic-cursor.v1\",\"root\":0,\"nodes\":[[\"l\",[0]]]}",_).

test(cursor_dag_cannot_expand_exponentially,
     [throws(error(domain_error(symbolic_cursor_expansion,_),_))]) :-
    findall(["c","x_double",[Previous,Previous]],
      (between(1,20,I),Previous is I-1),Rest),
    Nodes=[["a","x_base"]|Rest],
    with_output_to(string(JSON),json_write_dict(current_output,
      json{schema:"powder.symbolic-cursor.v1",root:20,nodes:Nodes},[width(0)])),
    kb_symbolic_agent_state:decode_cursor(JSON,_).

test(real_run_cursor_and_dialogue_events_survive_readback,
     [setup(fixture(F,C,_)),cleanup(cleanup(F,C))]) :-
    fixture_program([],P),
    kb_symbolic_agent_control:create_prepared(C,P,0,[],"create",Created),
    assertion(Created.resource.kind=="agent_run"),
    assertion(Created.resource.data.owner.agent=="symbolic-controller"),
    assertion(Created.source.knowledgeAgent=="x_SymbolicTestAgent"),
    kb_symbolic_agent_control:advance_prepared(C,P,Created.id,text("mark Boreal as cat"),
      "input-1",After,Effects),
    assertion(Effects==[]),assertion(After.resource.data.status=="running"),
    kb_symbolic_agent_control:get(C,Created.id,Read),
    assertion(Read.frame.engine=@=After.frame.engine),
    kb_symbolic_agent_control:events(C,Created.id,0,10,Events),
    assertion(Events.result.total==2),
    Events.result.items=[_,Event],atom_json_dict(Event.event.json,Payload,[]),
    kb_symbolic_agent_state:decode_cursor(Payload.cursor,Delta),
    assertion(member(text("Boreal is cat .",_),Delta.items)).

test(stop_is_durable_and_does_not_become_resume,
     [setup(fixture(F,C,_)),cleanup(cleanup(F,C))]) :-
    fixture_program([],P),kb_symbolic_agent_control:create_prepared(C,P,0,[],"create",R),
    kb_symbolic_agent_control:advance_prepared(C,P,R.id,stop,"stop",Stopped,[]),
    assertion(Stopped.resource.data.status=="stopped"),
    catch(kb_symbolic_agent_control:advance_prepared(C,P,R.id,resume,"resume",_,_),Error,true),
    assertion(nonvar(Error)).

test(real_read_receipt_after_stop_does_not_resume_continuation,
     [setup(fixture(F,C,A)),cleanup(cleanup(F,C))]) :-
    todo_program(P),kb_symbolic_agent_control:create_prepared(C,P,0,[],"create",R),
    kb_symbolic_agent_control:advance_prepared(C,P,R.id,text("review phrase dog"),"input",Waiting,[Intent]),
    kb_symbolic_agent_kee:invoke(A,P.allowedCapabilities,Intent,Waiting.frame.pending.callId,ToolReply),
    kb_symbolic_agent_control:advance_prepared(C,P,R.id,stop,"stop",_,[]),
    kb_symbolic_agent_control:record_outcome(C,P,R.id,ToolReply,"outcome",Final),
    assertion(Final.resource.data.status=="stopped"),
    assertion(Final.frame.pending==null),assertion(Final.frame.engine.pending==none),
    assertion(Final.resource.data.lastEvent.action.status=="read_complete").

test(control_authority_is_not_a_kb_action,
     [setup(fixture(F,C,_)),cleanup(cleanup(F,C)),
      throws(error(symbolic_forbidden_capability(kee_agent_run_event),_))]) :-
    C=control(Token,_,_),
    kb_symbolic_agent_kee:authorize(Token,["kee_agent_run_event"],"kee_agent_run_event",_).

test(changed_program_cannot_advance_a_bound_run,
     [setup(fixture(F,C,_)),cleanup(cleanup(F,C)),
      throws(error(symbolic_program_conflict,_))]) :-
    fixture_program([],P),kb_symbolic_agent_control:create_prepared(C,P,0,[],"create",R),
    fixture_program([kb(aff,x_SymbolicTestWorldMt,x_new_fact)],Changed),
    kb_symbolic_agent_control:advance_prepared(C,Changed,R.id,text("hello"),"input",_,_).

test(fake_mutation_receipt_is_rejected_by_real_ledger,
     [setup(fixture(F,C,_)),cleanup(cleanup(F,C))]) :-
    todo_program(P),kb_symbolic_agent_control:create_prepared(C,P,0,[],"create",R),
    kb_symbolic_agent_control:advance_prepared(C,P,R.id,text("review phrase dog"),"input",Waiting,[_]),
    length(Codes,64),maplist(=(0'0),Codes),string_codes(Hash,Codes),
    Fake=json{ok:true,tool:"kee_ledger_status",callId:Waiting.frame.pending.callId,
      symbolicEffect:"committed",result:json{committed:true,revision:Hash}},
    catch(kb_symbolic_agent_control:record_outcome(C,P,R.id,Fake,"fake",_),Error,true),
    assertion(nonvar(Error)),assertion(Error=error(kee(unconfirmed_action_commit,_),_)),
    kb_symbolic_agent_control:get(C,R.id,Still),
    assertion(Still.resource.data.eventSequence==Waiting.resource.data.eventSequence).

test(global_revision_conflict_is_exposed_not_silently_rebased,
     [setup(fixture(F,C,A)),cleanup(cleanup(F,C))]) :-
    todo_program(P),kb_symbolic_agent_control:create_prepared(C,P,0,[],"create",R),
    kb_symbolic_agent_control:advance_prepared(C,P,R.id,text("review phrase dog"),"input",Read,[ReadIntent]),
    kb_symbolic_agent_kee:invoke(A,P.allowedCapabilities,ReadIntent,Read.frame.pending.callId,ReadReply),
    kb_symbolic_agent_control:record_outcome(C,P,R.id,ReadReply,"read-outcome",_),
    kb_symbolic_agent_control:advance_prepared(C,P,R.id,continue,"continue",Write,[WriteIntent]),
    assertion(WriteIntent.arguments.revision==ReadReply.result.revision),
    assertion(WriteIntent.arguments.revision\==Write.revision),
    kb_symbolic_agent_kee:invoke(A,P.allowedCapabilities,WriteIntent,Write.frame.pending.callId,Rejected),
    assertion(Rejected.ok==false),assertion(Rejected.symbolicEffect=="unknown"),
    assertion(sub_string(Rejected.error.message,_,_,_,"ledger_conflict")),
    plunit_symbolic_agent_todos:invoke(A,"kee_todo_list",
      json{mt:"x_SymbolicTestGoalsMt"},"list",Listed),
    assertion(Listed.result.total==0).

:- end_tests(symbolic_agent_control).
