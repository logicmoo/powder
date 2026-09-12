:- begin_tests(symbolic_agent_todos).
:- use_module('../kb_symbolic_agent_kee',[]).
:- use_module('../kb_symbolic_agent_engine',[]).
:- use_module('../kb_symbolic_agent_program',[]).
:- use_module('../kb_kee',[]).
:- use_module('../kb_kee_ledger',[]).
:- use_module('../kb_kee_registry',[]).
:- use_module(symbolic_agent_fixture).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(prolog_wrap)).
:- use_module(library(http/http_open),[]).
:- use_module(library(http/http_client),[]).
:- use_module(library(process),[]).

fixture(Patch,fixture(Root,Previous,Token),Token) :-
    source_file(plunit_symbolic_agent_todos:fixture(_,_,_),Here),
    file_directory_name(Here,Tests),uuid(Id),atom_concat('.symbolic-todo-',Id,Name),
    directory_file_path(Tests,Name,Root),make_directory(Root),
    (getenv('POWDER_KEE_STATE_DIR',Old)->Previous=some(Old);Previous=none),
    setenv('POWDER_KEE_STATE_DIR',Root),get_time(Now),Expiry is Now+600,
    P0=json{authenticated:true,actor:"symbolic-test-user",kind:"symbolic",
      agent:"x_SymbolicTestAgent",conversation:"symbolic-todo-fixture",
      policyVersion:"symbolic-todo-test-v1",model:null,promptVersion:null,promptHash:null,
      permissions:["todo.read","todo.write","changeset.read","changeset.undo"],
      readMts:["x_SymbolicTestGoalsMt"],writeMts:["x_SymbolicTestGoalsMt"],
      effects:["application_read","application_write"],expiresAt:Expiry,
      budgets:json{calls:100,mutations:10,resultBytes:1048576,seconds:2}},
    P=P0.put(Patch),kb_kee:open_context(P,Token).
cleanup(fixture(Root,Previous,Token)) :-
    kb_kee:close_context(Token),
    (Previous=some(Old)->setenv('POWDER_KEE_STATE_DIR',Old);unsetenv('POWDER_KEE_STATE_DIR')),
    delete_directory_and_contents(Root).
data(json{title:"Review source knowledge",description:"No claimed completion",status:"open",
  priority:0,dependencies:[],evidence:[],acceptance:[],
  links:json{conversation:null,agent:"x_SymbolicTestAgent",changesets:[],assertions:[]}}).
invoke(Token,Capability,Arguments,CallId,Reply) :-
    kb_symbolic_agent_kee:invoke(Token,[Capability],
      intent{capability:Capability,arguments:Arguments},CallId,Reply).
create_intent(Token,Intent) :-
    invoke(Token,"kee_ledger_status",json{},"status",Status),data(Data),
    Intent=intent{capability:"kee_todo_create",
      arguments:json{revision:Status.result.revision,mt:"x_SymbolicTestGoalsMt",data:Data}}.
invoke_intent(Token,Intent,Reply) :-
    kb_symbolic_agent_kee:invoke(Token,["kee_todo_create"],Intent,"fixture-run/action-1",Reply).

test(real_cyc_workflow_creates_durable_cases_for_heldout_variations,
     [setup(fixture(json{},F,Token)),cleanup(cleanup(F))]) :-
    todo_program(P),kb_symbolic_agent_program:initial_state(P,Initial),
    setup_call_cleanup(trap_transports,
      (workflow(P,Token,Initial,text("review phrase dog"),AfterDog),
       workflow(P,Token,AfterDog,text("review phrase cat"),AfterCat),
       assertion(AfterCat.phase==awaiting_input),assertion(AfterCat.actions==4),
       flag(symbolic_todo_external_calls,Calls,Calls),assertion(Calls==0)),
      untrap_transports),
    invoke(Token,"kee_todo_list",json{mt:"x_SymbolicTestGoalsMt"},"list",Listed),
    assertion(Listed.result.total==2),Listed.result.items=[One,Two],
    assertion(One.data.description\==Two.data.description),
    assertion(One.data.status=="open"),assertion(Two.data.completion==null),
    kb_kee_ledger:snapshot(Durable),assertion(Durable.sequence==2),
    forall(member(E,Durable.events),
      (assertion(E.actor.kind==symbolic),assertion(E.actor.model==null),
       assertion(E.actor.agent=="x_SymbolicTestAgent"))),
    forall(member(R,Durable.resources),assertion(R.kind==todo)).

workflow(P,Token,State,Input,After) :-
    kb_symbolic_agent_engine:step(P,State,Input,[],Step),
    (Step.effects=[Intent]->
      format(string(CallId),'fixture-workflow/~w',[Intent.id]),
      kb_symbolic_agent_kee:invoke(Token,P.allowedCapabilities,Intent,CallId,Reply),
      assertion(Reply.ok==true),
      assertion(memberchk(Reply.symbolicEffect,["not_mutation","committed"])),
      kb_symbolic_agent_kee:action_outcome(Reply,Outcome),
      kb_symbolic_agent_engine:step(P,Step.state,action_result(Intent.id,Outcome),[],Completed),
      workflow(P,Token,Completed.state,continue,After)
    ;Step.effects==[],After=Step.state).

test(real_durable_receipt_replays_without_a_second_effect,
     [setup(fixture(json{},F,Token)),cleanup(cleanup(F))]) :-
    create_intent(Token,Intent),invoke_intent(Token,Intent,First),invoke_intent(Token,Intent,Replay),
    assertion(First.symbolicEffect=="committed"),assertion(Replay.result.replayed==true),
    assertion(First.result.changeset==Replay.result.changeset),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==1).

test(actual_commit_with_lost_reply_is_unknown_until_receipt_probe,
     [setup(fixture(json{},F,Token)),cleanup(cleanup(F))]) :-
    create_intent(Token,Intent),
    setup_call_cleanup(
      wrap_predicate(kb_kee:invoke(_,_,_),symbolic_lost_reply,Wrapped,
        (call(Wrapped),throw(error(symbolic_fixture_lost_reply,_)))),
      invoke_intent(Token,Intent,Lost),
      unwrap_predicate(kb_kee:invoke(_,_,_),symbolic_lost_reply)),
    assertion(Lost.ok==false),assertion(Lost.symbolicEffect=="unknown"),
    kb_symbolic_agent_kee:action_outcome(Lost,Outcome),assertion(Outcome=unresolved(_)),
    invoke(Token,"kee_call_status",json{callId:"fixture-run/action-1"},"probe",Receipt),
    assertion(Receipt.result.status=="committed"),
    invoke_intent(Token,Intent,Replay),assertion(Replay.result.replayed==true),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==1).

test(mutable_policy_does_not_supply_missing_write_authority,
     [setup(fixture(json{permissions:["changeset.read"]},F,Token)),cleanup(cleanup(F))]) :-
    create_intent(Token,Intent),
    catch(invoke_intent(Token,Intent,_),Error,true),
    assertion(nonvar(Error)),
    assertion(Error=error(kee(permission_denied,_),_)),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==0).

test(symbolic_claimed_evidence_cannot_mark_a_task_done,
     [setup(fixture(json{},F,Token)),cleanup(cleanup(F))]) :-
    create_intent(Token,Original),
    Claimed=Original.arguments.data.put(_{status:"done",
      evidence:[json{kind:"reference",reference:"unverified claim",note:"not a real attestation"}],
      acceptance:[json{given:"a claim",when:"the agent says so",then:"done"}]}),
    Args=Original.arguments.put(data,Claimed),Intent=Original.put(arguments,Args),
    invoke_intent(Token,Intent,Rejected),assertion(Rejected.ok==false),
    assertion(sub_string(Rejected.error.message,_,_,_,"completion_requires_user_attestation")),
    kb_kee_ledger:snapshot(S),assertion(S.sequence==0).

test(todo_undo_redo_use_real_versioned_registry_operations,
     [setup(fixture(json{},F,Token)),cleanup(cleanup(F))]) :-
    create_intent(Token,Intent),invoke_intent(Token,Intent,Created),
    invoke(Token,"kee_undo",
      json{revision:Created.result.currentRevision,changeset:Created.result.changeset},"undo",Undone),
    assertion(Undone.symbolicEffect=="committed"),
    invoke(Token,"kee_redo",
      json{revision:Undone.result.currentRevision,changeset:Undone.result.changeset},"redo",Redone),
    assertion(Redone.symbolicEffect=="committed"),
    invoke(Token,"kee_todo_get",json{id:Created.result.result.id},"get",Restored),
    assertion(Restored.result.resource.data.status=="open").

test(future_cross_domain_undo_is_not_implicitly_authorized,
     [setup(fixture(json{},F,Token)),cleanup(cleanup(F))]) :-
    kb_kee_registry:capability(kee_undo,C),Changed=C.put(domain,managed_knowledge),
    setup_call_cleanup(
      wrap_predicate(kb_kee_registry:capability(Name,Value),symbolic_domain_test,Wrapped,
        (Name==kee_undo->Value=Changed;call(Wrapped))),
      (catch(kb_symbolic_agent_kee:authorize(Token,["kee_undo"],"kee_undo",_),Error,true),
       assertion(nonvar(Error)),
       assertion(Error=error(symbolic_forbidden_capability(kee_undo),_))),
      unwrap_predicate(kb_kee_registry:capability(_,_),symbolic_domain_test)).

trap_transports :-
    flag(symbolic_todo_external_calls,_,0),
    wrap_predicate(http_open:http_open(_,_,_),symbolic_todo_transport,_,plunit_symbolic_agent_todos:external_call),
    wrap_predicate(http_client:http_post(_,_,_,_),symbolic_todo_transport,_,plunit_symbolic_agent_todos:external_call),
    wrap_predicate(process:process_create(_,_,_),symbolic_todo_transport,_,plunit_symbolic_agent_todos:external_call).
untrap_transports :-
    unwrap_predicate(http_open:http_open(_,_,_),symbolic_todo_transport),
    unwrap_predicate(http_client:http_post(_,_,_,_),symbolic_todo_transport),
    unwrap_predicate(process:process_create(_,_,_),symbolic_todo_transport).
external_call :-
    flag(symbolic_todo_external_calls,N,N+1),throw(error(symbolic_test_forbidden_transport,_)).

:- end_tests(symbolic_agent_todos).
