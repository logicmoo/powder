:- ensure_loaded(test_symbolic_agent_control).
:- begin_tests(symbolic_agent_fork).
:- use_module('../kb_symbolic_agent_fork',[]).
:- use_module('../kb_kee_auth',[]).
:- use_module('../kb_kee_ledger',[]).
:- use_module(symbolic_agent_fixture).

fixture(F,C,D) :-
    plunit_symbolic_agent_control:fixture(F,C,_),
    child(C,"symbolic-fork-child",D).
child(control(Token,_,_),Conversation,D) :-
    kb_kee_auth:principal(Token,P),kb_symbolic_agent_kee:canonical_json(P,JSON),
    kb_symbolic_agent_control:open_control(JSON.put(conversation,Conversation),D).
cleanup(F,C,D) :-
    kb_symbolic_agent_control:close_control(D),
    plunit_symbolic_agent_control:cleanup(F,C).
ready(C,P,R) :-
    fixture_program([],P),kb_symbolic_agent_control:create_prepared(C,P,0,[],"create",New),
    kb_symbolic_agent_control:advance_prepared(C,P,New.id,text("mark Boreal as cat"),"input",R,[]).
fork(C,D,P,R,Child,Replayed) :-
    kb_symbolic_agent_fork:fork_prepared(C,D,P,R,"fork","isolated-fork-request",Child,Replayed).

test(durable_checkpoint_history_counters_and_parent_are_preserved,
     [setup(fixture(F,C,D)),cleanup(cleanup(F,C,D))]) :-
    ready(C,P,R),fork(C,D,P,R,Child,Replayed),
    assertion(Replayed==false),assertion(Child.id\==R.id),
    assertion(Child.resource.data.owner.conversation=="symbolic-fork-child"),
    assertion(Child.frame==R.frame),assertion(Child.source.limits==R.source.limits),
    assertion(Child.source.programVersion==R.source.programVersion),
    assertion(Child.source.host.lineage.parentRevision==R.resource.revision),
    kb_symbolic_agent_control:get(C,R.id,Same),assertion(Same.resource==R.resource),
    kb_symbolic_agent_control:get(D,Child.id,Read),assertion(Read.frame==R.frame),
    kb_symbolic_agent_fork:history(D,Read,0,100,H),
    assertion(H.total==3),H.items=[First,Dialogue,Own],
    assertion(First.inherited==true),assertion(Dialogue.inherited==true),
    assertion(Dialogue.origin.runId==R.id),assertion(Dialogue.event==R.resource.data.lastEvent),
    assertion(number(Dialogue.time)),assertion(Own.inherited==false),
    kb_symbolic_agent_control:advance_prepared(C,P,R.id,text("mark Ada as dog"),"later",_,[]),
    kb_symbolic_agent_fork:history(D,Read,0,100,Frozen),assertion(Frozen==H),
    kb_symbolic_agent_control:advance_prepared(D,P,Child.id,text("mark Ada as dog"),"child-input",Next,[]),
    assertion(Next.frame.turns=:=R.frame.turns+1),
    assertion(Next.frame.engine.steps>R.frame.engine.steps),
    kb_symbolic_agent_fork:history(D,Next,0,100,H2),assertion(H2.total==4).

test(idempotent_retry_returns_same_child_without_replaying_mutations,
     [setup(fixture(F,C,D)),cleanup(cleanup(F,C,D))]) :-
    ready(C,P,R),fork(C,D,P,R,Child,false),
    kb_symbolic_agent_control:advance_prepared(C,P,R.id,text("mark Ada as dog"),"later",_,[]),
    kb_kee_ledger:snapshot(Before),
    fork(C,D,P,R,Again,true),assertion(Again.id==Child.id),
    kb_kee_ledger:snapshot(After),assertion(After==Before),
    catch(kb_symbolic_agent_fork:fork_prepared(C,D,P,R,"fork","changed",_,_),Error,true),
    assertion(Error=error(symbolic_fork_request_conflict,_)).

test(stale_parent_fails_without_creating_child,
     [setup(fixture(F,C,D)),cleanup(cleanup(F,C,D))]) :-
    ready(C,P,R),
    kb_symbolic_agent_control:advance_prepared(C,P,R.id,text("mark Ada as dog"),"later",_,[]),
    kb_kee_ledger:snapshot(Before),
    catch(fork(C,D,P,R,_,_),Error,true),assertion(Error=error(symbolic_fork_parent_conflict,_)),
    kb_kee_ledger:snapshot(After),assertion(After==Before).

test(fresh_identity_and_authority_are_required,
     [setup(fixture(F,C,D)),cleanup(cleanup(F,C,D))]) :-
    ready(C,P,R),
    catch(fork(C,C,P,R,_,_),Same,true),
    assertion(Same=error(symbolic_fork_authority_mismatch,_)),
    kb_symbolic_agent_control:create_prepared(D,P,0,[],"existing-child",_),
    kb_symbolic_agent_control:get(C,R.id,Current),
    catch(fork(C,D,P,Current,_,_),Existing,true),
    assertion(Existing=error(symbolic_fork_conversation_exists,_)).

test(pending_planned_dispatched_unknown_and_interrupted_are_not_forkable,
     [setup(fixture(F,C,D)),cleanup(cleanup(F,C,D))]) :-
    todo_program(P),kb_symbolic_agent_control:create_prepared(C,P,0,[],"create",New),
    kb_symbolic_agent_control:advance_prepared(C,P,New.id,text("review phrase dog"),"input",Planned,[_]),
    catch(fork(C,D,P,Planned,_,_),E1,true),
    assertion(E1=error(symbolic_fork_unsafe("unresolved_action"),_)),
    kb_symbolic_agent_control:mark_dispatched(C,New.id,"dispatch",Dispatched),
    catch(fork(C,D,P,Dispatched,_,_),E2,true),
    assertion(E2=error(symbolic_fork_unsafe("unresolved_action"),_)),
    Reply=json{callId:Dispatched.frame.pending.callId,tool:"kee_ledger_status",symbolicEffect:"unknown"},
    kb_symbolic_agent_control:record_outcome(C,P,New.id,Reply,"unknown",Unknown),
    catch(fork(C,D,P,Unknown,_,_),E3,true),
    assertion(E3=error(symbolic_fork_unsafe("unresolved_action"),_)),
    kb_symbolic_agent_control:advance_prepared(C,P,New.id,interrupt,"interrupt",Paused,[]),
    catch(fork(C,D,P,Paused,_,_),E4,true),
    assertion(E4=error(symbolic_fork_unsafe("unresolved_action"),_)).

test(continuations_and_terminal_phases_have_explicit_disabled_reasons,
     [setup(fixture(F,C,D)),cleanup(cleanup(F,C,D))]) :-
    ready(C,P,R),
    forall(member(Phase,[running,awaiting_form,awaiting_approval,gap,failed,stopped,interrupted]),
      (Engine=R.frame.engine.put(phase,Phase),Bad=R.put(frame,R.frame.put(engine,Engine)),
       kb_symbolic_agent_fork:availability(Bad,A),assertion(A.allowed==false))),
    Engine2=R.frame.engine.put(queue,[continuation]),
    Bad2=R.put(frame,R.frame.put(engine,Engine2)),
    catch(fork(C,D,P,Bad2,_,_),Error,true),
    assertion(Error=error(symbolic_fork_unsafe("pending_continuation"),_)).

test(fork_chain_keeps_original_provenance_and_budget_floor,
     [setup(fixture(F,C,D)),cleanup(cleanup(F,C,D))]) :-
    ready(C,P,R),fork(C,D,P,R,One,false),
    setup_call_cleanup(child(D,"symbolic-fork-grandchild",E),
      (kb_symbolic_agent_fork:fork_prepared(D,E,P,One,"fork-again","second",Two,false),
       assertion(Two.frame==R.frame),assertion(Two.source.host.lineage.depth==2),
       kb_symbolic_agent_fork:history(E,Two,0,100,H),
       assertion(H.total==4),H.items=[Origin|_],assertion(Origin.origin.runId==R.id)),
      kb_symbolic_agent_control:close_control(E)).

test(exhausted_step_budget_is_not_reset_by_fork,
     [setup(fixture(F,C,D)),cleanup(cleanup(F,C,D))]) :-
    fixture_program([],P),
    kb_symbolic_agent_control:create_prepared(C,P,0,[steps(1)],"create",R),
    Engine=R.frame.engine.put(steps,1),Frame=R.frame.put(engine,Engine),
    kb_symbolic_agent_control:persist(C,R,Frame,"running","log",json{},null,"exhaust",Exhausted),
    fork(C,D,P,Exhausted,Child,false),
    assertion(Child.frame.engine.steps==1),assertion(Child.source.limits.steps==1),
    kb_symbolic_agent_control:advance_prepared(D,P,Child.id,text("mark Ada as dog"),"input",Final,[]),
    assertion(Final.frame.engine.phase==gap),
    assertion(Final.frame.engine.steps==1).

:- end_tests(symbolic_agent_fork).
