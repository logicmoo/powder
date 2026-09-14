:- ensure_loaded(test_llm_queue).
:- use_module('../kb_llm_timing',[]).
:- dynamic teacher_timing_write/1.

teacher_timing_wait(Id,Operation,Conversation) :-
    conversation(Id,C),
    (C.timing.current\==null,C.timing.current.currentStep\==null,
     C.timing.current.currentStep.operation==Operation->Conversation=C;
     sleep(0.02),teacher_timing_wait(Id,Operation,Conversation)).
teacher_timing_trace(Trace) :-
    assertion(ground(Trace)),assertion(Trace.elapsedMs>=0),assertion(Trace.runElapsedMs>=0),
    forall(member(S,Trace.steps),
      (assertion(S.durationMs>=0),assertion(number(S.startedAt)),assertion(number(S.finishedAt)))),
    findall(Index,(member(S,Trace.steps),get_dict(index,S,Index)),Indices),
    sort(Indices,Sorted),assertion(Indices==Sorted).
teacher_timing_fifo_setup(State) :-
    teacher_queue_setup(State),
    wrap_predicate(kb_llm_transport:chat_completion(_,_,_,_),teacher_timing_transport,Wrapped,
      (kb_llm_timing:phase(endpoint_wait),call(Wrapped))).
teacher_timing_fifo_cleanup(State) :-
    unwrap_predicate(kb_llm_transport:chat_completion(_,_,_,_),teacher_timing_transport),
    teacher_queue_cleanup(State).

:- begin_tests(llm_timing_clock).
test(native_clock_is_cross_thread_and_wall_rollback_does_not_change_durations) :-
    kb_llm_timing:supported(true),
    kb_llm_timing:monotonic_milliseconds(Before),
    thread_create((kb_llm_timing:monotonic_milliseconds(Inside),
      thread_send_message(main,timing_clock(Inside))),Thread,[]),
    thread_get_message(timing_clock(Inside)),thread_join(Thread,true),
    kb_llm_timing:monotonic_milliseconds(After),
    assertion(Inside>=Before),assertion(Inside=<After),
    uuid(Run),kb_llm_timing:begin_run("timing-clock-fixture",Run),
    setup_call_cleanup(
      wrap_predicate(kb_llm_timing:wall_stamp(Wall),teacher_timing_rollback,_,Wall=1.0),
      (kb_llm_timing:phase(Run,endpoint_wait),sleep(0.03),
       kb_llm_timing:checkpoint(Run,"completed","reply",_),
       kb_llm_timing:finish(Run),
       kb_llm_timing:latest_terminal("timing-clock-fixture",T),
       assertion(T.finishedAt<T.startedAt),assertion(T.elapsedMs>=20),teacher_timing_trace(T)),
      unwrap_predicate(kb_llm_timing:wall_stamp(_),teacher_timing_rollback)).
test(deadlines_and_cancellation_are_never_swallowed_by_observers) :-
    forall(member(Error,[time_limit_exceeded,llm_cancelled]),
      (catch(kb_llm_timing:observe(throw(Error)),Caught,true),assertion(Caught==Error))).
test(queue_wait_is_unknown_when_monotonic_enqueue_observation_is_missing) :-
    uuid(Run),kb_llm_timing:begin_run("timing-orphan-fixture",Run),
    kb_llm_timing:queue_link(Run,"unobserved-queue-entry",1.0),
    kb_llm_timing:checkpoint(Run,"completed","reply",_),
    kb_llm_timing:finish(Run),
    kb_llm_timing:latest_terminal("timing-orphan-fixture",Trace),
    assertion(Trace.queueWaitMs==null),assertion(Trace.queueEnteredAt=:=1),
    assertion(\+ (member(S,Trace.steps),get_dict(operation,S,"queue_wait"))).
test(optional_timing_metadata_cannot_reduce_the_existing_storage_budget) :-
    length(Codes,1048500),maplist(=(0'a),Codes),string_codes(Text,Codes),
    Base=timing_fixture{data:Text},
    WithTiming=Base.put(lastTiming,timing{detail:Text}),
    kb_llm_agent:trim_timing_metadata(WithTiming,Trimmed),
    assertion(Trimmed==Base),kb_llm_agent:bounded_json(Trimmed,1048576).
:- end_tests(llm_timing_clock).

:- begin_tests(llm_timing,[setup(fixture_setup(State)),cleanup(fixture_cleanup(State))]).
test(actual_endpoint_wait_and_terminal_trace_add_no_http_or_state_writes,
     [setup(assertz(user:fixture_mode(slow))),cleanup(retractall(user:fixture_mode(_)))]) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    kb_llm_agent:conversation_file(C.id,File),retractall(user:teacher_timing_write(_)),
    setup_call_cleanup(
      wrap_predicate(kb_llm_files:atomic_json(Path,_),teacher_timing_writes,Wrapped,
        ((Path==File->assertz(user:teacher_timing_write(Path));true),call(Wrapped))),
      (start_chat(_{id:C.id,revision:C.revision,text:"Synthetic timing-only sentinel",approvedNonsensitive:true},_),
       call_with_time_limit(30,teacher_timing_wait(C.id,"endpoint_wait",Waiting)),
       Active=Waiting.timing.current,assertion(Active.live==true),assertion(Active.runId==Waiting.activeTurn),
       findall(F,teacher_timing_write(F),WritesBefore),
       sleep(0.1),conversation(C.id,Again),
       assertion(Again.timing.current.elapsedMs>Active.elapsedMs),
       assertion(Again.sequence=:=Waiting.sequence),assertion(Again.revision=:=Waiting.revision),
       findall(F,teacher_timing_write(F),WritesAfter),assertion(WritesAfter==WritesBefore),
       wait_chat(C.id,Done),Trace=Done.timing.last,
       assertion(Done.timing.current==null),assertion(Trace.status=="completed"),assertion(Trace.result=="reply"),
       assertion(Trace.live==false),assertion(Trace.complete==true),teacher_timing_trace(Trace),
       findall(Op,(member(S,Trace.steps),get_dict(operation,S,Op)),Operations),
       forall(member(Required,["admission","disclosure_validation","request_preparation",
           "admission_persistence","worker_wait","context_preparation","outgoing_validation",
           "request_encoding","http_dispatch","endpoint_wait","response_read","response_decode",
           "reply_validation","reply_persistence","terminal_persistence","context_cleanup"]),
         assertion(memberchk(Required,Operations))),
       once((member(WaitStep,Trace.steps),get_dict(operation,WaitStep,"endpoint_wait"))),
       assertion(WaitStep.durationMs>=7000),
       findall(F,teacher_timing_write(F),Writes),length(Writes,Count),assertion(Count=:=3),
       assertion(\+fixture_request(models,_)),
       findall(B,fixture_request(chat,B),Requests),assertion(Requests=[_]),
       Requests=[Request],assertion(\+get_dict(timing,Request,_)),
       kb_kee_schema:json_text(Trace,JSON),
       assertion(\+sub_string(JSON,_,_,_,"Synthetic timing-only sentinel")),
       forall(member(Key,[pid,thread,context,handle,prompt,messages,url,model]),
         assertion(\+get_dict(Key,Trace,_))),
       read_json(File,Persisted),assertion(Persisted.lastTiming.source=="checkpoint"),
       assertion(Persisted.lastTiming.complete==false),assertion(Persisted.lastTiming.live==false),
       assertion(Persisted.lastTiming.elapsedMs=<Trace.elapsedMs),
       teacher_queue_child_read(C.id,Recovered),
       assertion(Recovered.timing.current==null),assertion(Recovered.timing.last.source=="checkpoint"),
       assertion(Recovered.timing.last.complete==false),assertion(Recovered.timing.last.live==false),
       sleep(0.05),conversation(C.id,Frozen),assertion(Frozen.timing.last.elapsedMs=:=Trace.elapsedMs),
       stop_conversation(C.id,_),read_json(File,AfterStop),
       assertion(AfterStop.lastTiming.complete==true),
       teacher_queue_child_read(C.id,Durable),
       assertion(Durable.timing.last.source=="persisted"),assertion(Durable.timing.last.complete==true),
       assertion(Durable.timing.last.elapsedMs=:=Trace.elapsedMs)),
      unwrap_predicate(kb_llm_files:atomic_json(_,_),teacher_timing_writes)).
test(interrupt_closes_the_observed_trace_without_provider_replay,
     [setup(assertz(user:fixture_mode(slow))),cleanup(retractall(user:fixture_mode(_)))]) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    findall(B,fixture_request(chat,B),Before),length(Before,BeforeCount),
    start_chat(_{id:C.id,revision:C.revision,text:"Synthetic timing cancellation",approvedNonsensitive:true},_),
    call_with_time_limit(30,teacher_timing_wait(C.id,"endpoint_wait",_)),
    interrupt_chat(C.id,_),wait_chat(C.id,Done),
    T=Done.timing.last,assertion(T.status=="interrupted"),assertion(T.result=="interrupted"),
    assertion(T.live==false),assertion(T.complete==true),teacher_timing_trace(T),
    assertion((member(S,T.steps),get_dict(operation,S,"cancellation"))),
    sleep(0.05),conversation(C.id,Again),assertion(Again.timing.last.elapsedMs=:=T.elapsedMs),
    findall(B,fixture_request(chat,B),After),length(After,AfterCount),
    assertion(AfterCount=<BeforeCount+1),assertion(\+fixture_request(models,_)).
test(observer_failure_does_not_fail_send_or_restore_discovery) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    setup_call_cleanup(
      wrap_predicate(kb_llm_timing:stamp(_,_),teacher_timing_fault,_,throw(error(synthetic_clock_failure,_))),
      (start_chat(_{id:C.id,revision:C.revision,text:"Synthetic clock failure",approvedNonsensitive:true},_),
       wait_chat(C.id,Done),assertion(Done.status=="ready"),assertion(\+fixture_request(models,_))),
      unwrap_predicate(kb_llm_timing:stamp(_,_),teacher_timing_fault)).
test(unavailable_native_clock_does_not_gate_send) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    setup_call_cleanup(
      wrap_predicate(kb_llm_timing:supported(Available),teacher_timing_unavailable,_,Available=false),
      (start_chat(_{id:C.id,revision:C.revision,text:"Synthetic no-clock request",approvedNonsensitive:true},_),
       wait_chat(C.id,Done),assertion(Done.status=="ready"),
       assertion(Done.timing.supported==false),assertion(Done.timing.clock==null),
       assertion(\+fixture_request(models,_))),
      unwrap_predicate(kb_llm_timing:supported(_),teacher_timing_unavailable)).
test(control_exception_in_cleanup_observation_still_releases_native_authority) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    setup_call_cleanup(
      wrap_predicate(kb_llm_timing:phase(Operation),teacher_timing_cleanup,Wrapped,
        (Operation==context_cleanup->throw(time_limit_exceeded);call(Wrapped))),
      (start_chat(_{id:C.id,revision:C.revision,text:"Synthetic cleanup clock interruption",
                   approvedNonsensitive:true},_),
       wait_chat(C.id,_),assertion(\+kb_llm_kee:live_turn_context(C.id,_)),
       kb_activity:activity_status(Activity),assertion(Activity.active=:=0)),
      unwrap_predicate(kb_llm_timing:phase(_),teacher_timing_cleanup)).
test(actual_tool_steps_keep_receipts_local_and_add_no_provider_rounds,
     [setup(assertz(user:fixture_mode(managed))),cleanup(retractall(user:fixture_mode(_)))]) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    bound_preview(C,"Synthetic timed managed task",true,
      [_{tool:"kee_ledger_status",arguments:_{}}],Preview),
    findall(B,fixture_request(chat,B),Before),length(Before,BeforeCount),
    bound_chat(C,"Synthetic timed managed task",Preview,Done),
    T=Done.timing.last,assertion(T.status=="completed"),
    assertion(T.result=="local_mutation_boundary"),teacher_timing_trace(T),
    forall(member(Operation,["tool_validation","tool_reservation","tool_execution",
                            "tool_receipt_persistence","tool_history_persistence"]),
      assertion((member(S,T.steps),get_dict(operation,S,Operation)))),
    findall(B,fixture_request(chat,B),After),length(After,AfterCount),
    assertion(AfterCount=:=BeforeCount+2),
    assertion(\+ (member(B,After),get_dict(messages,B,Messages),
      member(M,Messages),get_dict(tool_call_id,M,"managed-create"))),
    assertion(\+fixture_request(models,_)).
:- end_tests(llm_timing).

:- begin_tests(llm_timing_fifo,
    [setup(teacher_timing_fifo_setup(State)),cleanup(teacher_timing_fifo_cleanup(State))]).
test(failed_enqueue_does_not_start_a_queue_clock_or_replay_work) :-
    teacher_queue_hold(C),
    setup_call_cleanup(
      wrap_predicate(kb_llm_files:atomic_json(_,D),teacher_timing_failed_enqueue,Wrapped,
        ((get_dict(queue,D,Q),member(Item,Q.items),Item.callId=="failed-admission")->
          throw(error(synthetic_queue_write_failure,_));call(Wrapped))),
      catch(teacher_queue_add(C.id,"failed-admission","Synthetic pending text",_),
        error(synthetic_queue_write_failure,_),Failed=true),
      unwrap_predicate(kb_llm_files:atomic_json(_,_),teacher_timing_failed_enqueue)),
    assertion(Failed==true),
    assertion(\+kb_llm_timing:queued_clock(C.id,"failed-admission",_,_)),
    conversation(C.id,Still),assertion(Still.queue.items==[]),
    teacher_queue_add(C.id,"failed-admission","Synthetic pending text",Accepted),
    Accepted.timing.queued=[Wait],assertion(Wait.elapsedMs>=0),
    teacher_queue_sent(Sent),assertion(Sent=[_]),
    interrupt_chat(C.id,_),wait_chat(C.id,_),retractall(user:teacher_queue_gate).
test(drained_turns_have_independent_runs_and_monotonic_queue_wait) :-
    teacher_queue_hold(C),teacher_queue_add(C.id,"timing-next","second",Enqueued),
    FirstRun=Enqueued.activeTurn,Enqueued.timing.queued=[Wait],
    assertion(Wait.callId=="timing-next"),assertion(Wait.elapsedMs>=0),
    sleep(0.1),conversation(C.id,Waiting),Waiting.timing.queued=[Later],
    assertion(Later.elapsedMs>Wait.elapsedMs),
    teacher_queue_release,wait_chat(C.id,Done),Trace=Done.timing.last,
    assertion(Trace.runId\==FirstRun),assertion(Trace.queueCallId=="timing-next"),
    assertion(Trace.turn=:=2),assertion(Trace.queueWaitMs>0),
    Trace.steps=[QueueStep|_],assertion(QueueStep.operation=="queue_wait"),
    Difference is abs(Trace.elapsedMs-Trace.runElapsedMs-Trace.queueWaitMs),
    assertion(Difference<0.01),teacher_timing_trace(Trace),
    assertion(ground(Trace)),assertion(\+kb_llm_timing:active_run(_)),
    assertion(\+fixture_request(_,_)),
    kb_llm_agent:load_document(C.id,D),
    fork_conversation(_{id:C.id,revision:D.revision},Fork),
    assertion(Fork.timing.current==null),assertion(Fork.timing.last==null).
:- end_tests(llm_timing_fifo).
