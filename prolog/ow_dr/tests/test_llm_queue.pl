:- ensure_loaded(test_llm_agent).
:- use_module(library(process)).
:- dynamic teacher_queue_gate/0,teacher_queue_waiter/1,teacher_queue_send/1,
           teacher_queue_error_at/1,teacher_queue_id/1.

teacher_queue_setup(State) :-
    fixture_setup(State),
    wrap_predicate(kb_llm_transport:chat_completion(Config,History,Tools,Reply),
      teacher_queue_transport,_,user:teacher_queue_transport(Config,History,Tools,Reply)).
teacher_queue_cleanup(State) :-
    retractall(teacher_queue_gate),
    forall(teacher_queue_id(Id),catch(stop_conversation(Id,_),_,true)),
    forall(teacher_queue_id(Id),catch(wait_chat(Id,_),_,true)),
    unwrap_predicate(kb_llm_transport:chat_completion(_,_,_,_),teacher_queue_transport),
    retractall(teacher_queue_id(_)),retractall(teacher_queue_send(_)),
    retractall(teacher_queue_waiter(_)),retractall(teacher_queue_error_at(_)),
    fixture_cleanup(State).
teacher_queue_transport(Config,History,Tools,Reply) :-
    assertz(teacher_queue_send(_{model:Config.model,messages:History,tools:Tools})),
    (teacher_queue_gate->
      thread_self(Thread),setup_call_cleanup(assertz(teacher_queue_waiter(Thread)),
        thread_get_message(teacher_queue_release),retractall(teacher_queue_waiter(Thread)));true),
    findall(S,teacher_queue_send(S),Sent),length(Sent,N),
    (teacher_queue_error_at(N)->throw(error(llm_http_status(503),synthetic));true),
    last(History,Last),string_concat("Synthetic reply: ",Last.content,Text),
    Reply=_{choices:[_{message:_{role:"assistant",content:Text}}]}.
teacher_queue_new(C) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    assertz(teacher_queue_id(C.id)).
teacher_queue_hold(C) :-
    retractall(teacher_queue_send(_)),retractall(teacher_queue_error_at(_)),
    assertz(teacher_queue_gate),teacher_queue_new(C),
    start_chat(_{id:C.id,revision:C.revision,text:"first",approvedNonsensitive:true},_),
    call_with_time_limit(30,teacher_queue_wait).
teacher_queue_wait :- (teacher_queue_waiter(_)->true;sleep(0.02),teacher_queue_wait).
teacher_queue_release :-
    retractall(teacher_queue_gate),
    forall(teacher_queue_waiter(Thread),thread_send_message(Thread,teacher_queue_release)).
teacher_queue_add(Id,Call,Text,Reply) :-
    conversation(Id,C),enqueue_chat(_{id:Id,revision:C.revision,
      callId:Call,text:Text,approvedNonsensitive:true},Reply).
teacher_queue_sent(Texts) :-
    findall(Text,(teacher_queue_send(R),last(R.messages,M),get_dict(content,M,Text)),Texts).
teacher_queue_put(Fields,D,After) :- After=D.put(Fields).
teacher_queue_child_read(Id,Reply) :-
    format(atom(Operation),"kb_llm_agent:conversation(~q,D)",[Id]),
    teacher_queue_child(Operation,Reply).
teacher_queue_child_replay(Id,Reply) :-
    Request=_{id:Id,revision:0,callId:"restart-a",text:"after restart",approvedNonsensitive:true},
    format(atom(Operation),"kb_llm_agent:enqueue_chat(~q,D)",[Request]),
    teacher_queue_child(Operation,Reply).
teacher_queue_child(Operation,Reply) :-
    kb_paths:app_dir(App),directory_file_path(App,'kb_llm_agent.pl',Module),
    format(atom(Goal),
      "use_module(~q),~w,kb_kee_schema:json_text(D,T),format('~~s',[T]),halt",
      [Module,Operation]),
    agent_state_dir(Directory),uuid(Name),atom_concat(Name,'.pl',ScriptName),
    directory_file_path(Directory,ScriptName,Script),
    setup_call_cleanup(open(Script,write,S,[encoding(utf8)]),
      format(S,':- initialization(main, main).~nmain :- ~w.~n',[Goal]),close(S)),
    current_prolog_flag(executable,Exe),
    setup_call_cleanup(true,
      setup_call_cleanup(process_create(Exe,['-q','-f',Script],[stdout(pipe(Out)),process(PID)]),
        call_with_time_limit(30,
          (read_string(Out,_,Text),process_wait(PID,Status),assertion(Status==exit(0)),
           atom_json_dict(Text,Reply,[]))),
        (close(Out),
         (nonvar(Status)->true;process_wait(PID,Exit,[timeout(0)]),
          (Exit==timeout->process_kill(PID,term),process_wait(PID,_);true)))),
      delete_file(Script)).

:- begin_tests(llm_queue,[setup(teacher_queue_setup(State)),cleanup(teacher_queue_cleanup(State))]).
test(durable_fifo_idempotence_and_isolated_conversation_history) :-
    teacher_queue_hold(C),teacher_queue_new(Other),
    conversation(C.id,Running),
    Request=_{id:C.id,revision:Running.revision,callId:"fifo-a",text:"second",approvedNonsensitive:true},
    enqueue_chat(Request,First),assertion(First.queue.pending=:=1),
    enqueue_chat(Request,Duplicate),assertion(Duplicate.revision=:=First.revision),
    assertion(Duplicate.sequence=:=First.sequence),
    catch(enqueue_chat(Request.put(text,"different"),_),error(llm_queue_call_conflict,_),Conflict=true),
    assertion(Conflict==true),
    teacher_queue_add(C.id,"fifo-b","third",Queued),
    assertion(Queued.queue.state=="waiting"),assertion(Queued.queue.pending=:=2),
    kb_llm_agent:conversation_file(C.id,File),read_json(File,Persisted),
    assertion(Persisted.queue.items=Queued.queue.items),
    conversation(Other.id,Untouched),assertion(Untouched.messages==[]),assertion(Untouched.queue.pending=:=0),
    teacher_queue_release,wait_chat(C.id,Done),
    assertion(Done.status=="ready"),assertion(Done.turns=:=3),
    Done.queue.items=[A,B],assertion(A.status=="completed"),assertion(B.status=="completed"),
    teacher_queue_sent(Sent),assertion(Sent==["first","second","third"]),
    enqueue_chat(Request,Replayed),assertion(Replayed.revision=:=Done.revision),
    conversation(C.id,Polled),assertion(Polled.sequence=:=Done.sequence),
    teacher_queue_sent(Still),assertion(Still==Sent),
    kb_activity:activity_status(Activity),assertion(Activity.active=:=0).
test(interrupt_pauses_and_explicit_resume_skips_cancelled_items) :-
    teacher_queue_hold(C),teacher_queue_add(C.id,"cancel-a","cancel me",_),
    teacher_queue_add(C.id,"cancel-b","keep me",Queued),
    Cancel=_{id:C.id,revision:Queued.revision,callId:"cancel-a"},
    cancel_queued(Cancel,Cancelled),cancel_queued(Cancel,Again),
    assertion(Again.revision=:=Cancelled.revision),
    interrupt_chat(C.id,_),wait_chat(C.id,Paused),retractall(user:teacher_queue_gate),
    assertion(Paused.status=="interrupted"),assertion(Paused.queue.state=="paused"),
    assertion(Paused.queue.pending=:=1),assertion(Paused.queue.canResume==true),
    teacher_queue_sent(Before),assertion(Before==["first"]),
    resume_queue(_{id:C.id,revision:Paused.revision,approvedNonsensitive:true},_),
    wait_chat(C.id,Done),teacher_queue_sent(After),assertion(After==["first","keep me"]),
    Done.queue.items=[A,B],assertion(A.status=="cancelled"),assertion(B.status=="completed").
test(failed_attempt_is_not_retried_and_remaining_fifo_needs_resume) :-
    teacher_queue_hold(C),teacher_queue_add(C.id,"error-a","will fail",_),
    teacher_queue_add(C.id,"error-b","remaining",_),assertz(user:teacher_queue_error_at(2)),
    teacher_queue_release,wait_chat(C.id,Failed),
    assertion(Failed.status=="failed"),assertion(Failed.queue.canResume==true),
    Failed.queue.items=[A,B],assertion(A.status=="failed"),assertion(B.status=="queued"),
    assertion(A.error.code=="provider_http"),
    teacher_queue_sent(Sent),assertion(Sent==["first","will fail"]),
    resume_queue(_{id:C.id,revision:Failed.revision,approvedNonsensitive:true},_),
    wait_chat(C.id,Done),assertion(Done.queue.pending=:=0),
    teacher_queue_sent(After),assertion(After==["first","will fail","remaining"]).
test(restart_reads_never_dispatch_and_new_epoch_requires_explicit_resume) :-
    teacher_queue_hold(C),teacher_queue_add(C.id,"restart-a","after restart",_),
    teacher_queue_child_read(C.id,Restarted),
    assertion(Restarted.status=="outcome_unknown"),
    assertion(Restarted.queue.state=="paused"),assertion(Restarted.queue.canResume==false),
    teacher_queue_child_replay(C.id,Retry),assertion(Retry.revision=:=Restarted.revision),
    assertion(Retry.queue.pending=:=1),
    assertion(\+fixture_request(_,_)),
    kb_llm_agent:init_queue_epoch,teacher_queue_release,wait_chat(C.id,Paused),
    assertion(Paused.status=="ready"),assertion(Paused.queue.pauseReason=="restart"),
    teacher_queue_child_read(C.id,ReadOnly),assertion(ReadOnly.queue.pauseReason=="restart"),
    teacher_queue_sent(Sent),assertion(Sent==["first"]),
    assertz(user:teacher_queue_gate),
    resume_queue(_{id:C.id,revision:Paused.revision,approvedNonsensitive:true},_),
    call_with_time_limit(30,teacher_queue_wait),
    teacher_queue_child_read(C.id,Attempted),
    Attempted.queue.items=[Unknown],assertion(Unknown.status=="outcome_unknown"),
    assertion(Attempted.queue.canResume==false),
    teacher_queue_release,wait_chat(C.id,_),
    teacher_queue_sent(After),assertion(After==["first","after restart"]).
test(stop_blocks_resume_and_stale_controls_do_not_change_queue) :-
    teacher_queue_hold(C),teacher_queue_add(C.id,"stop-a","never run",Q),
    catch(cancel_queued(_{id:C.id,revision:0,callId:"stop-a"},_),
      error(agent_conversation_conflict,_),Conflict=true),assertion(Conflict==true),
    stop_conversation(C.id,_),wait_chat(C.id,Stopped),retractall(user:teacher_queue_gate),
    assertion(Stopped.queue.canResume==false),
    catch(resume_queue(_{id:C.id,revision:Stopped.revision,approvedNonsensitive:true},_),
      error(llm_queue_resume_blocked,_),Blocked=true),assertion(Blocked==true),
    teacher_queue_sent(Sent),assertion(Sent==["first"]),
    cancel_queued(_{id:C.id,revision:Stopped.revision,callId:"stop-a"},Empty),
    assertion(Empty.queue.pending=:=0),assertion(Empty.revision>Q.revision).
test(plain_text_only_scope_and_tool_history_cannot_bypass_disclosure) :-
    teacher_queue_new(C),kb_llm_agent:load_document(C.id,D),
    forall(member(Scope,[_{terms:["x_Fixture"],readMts:[],writeMts:[]},
                        _{terms:[],readMts:["x_FixtureMt"],writeMts:[]},
                        _{terms:[],readMts:["x_FixtureMt"],writeMts:["x_FixtureMt"]}]),
      assertion(\+kb_llm_agent:plain_text_eligible(D.put(scope,Scope)))),
    Tool=_{role:"assistant",content:null,tool_calls:[_{id:"synthetic",function:_{name:"fixture",arguments:"{}"}}]},
    append(D.history,[Tool],History),kb_llm_agent:update_document(C.id,teacher_queue_put(_{history:History})),
    conversation(C.id,Guarded),assertion(Guarded.plainTextEligible==false),
    assertion(\+kb_llm_agent:plain_text_eligible(D.put(_{status:"running",turnGrant:"synthetic-exact-grant"}))),
    catch(start_chat(_{id:C.id,revision:Guarded.revision,text:"unsafe",approvedNonsensitive:true},_),
      error(llm_grounding_not_approved,_),Denied=true),assertion(Denied==true),
    catch(enqueue_chat(_{id:C.id,revision:Guarded.revision,callId:"bad",text:"unsafe",approvedNonsensitive:true},_),
      error(llm_queue_plaintext_required,_),QueueDenied=true),assertion(QueueDenied==true),
    assertion(\+teacher_queue_waiter(_)).
test(queue_caps_and_exact_envelopes) :-
    teacher_queue_hold(C),
    kb_llm_agent:load_document(C.id,D),
    Request=_{id:C.id,revision:D.revision,callId:"cap-test",text:"bounded",approvedNonsensitive:true},
    json_bytes(D.history,Bytes),length(Bytes,Size),
    Tight=D.put(config,D.config.put(budgets,D.config.budgets.put(historyBytes,Size))),
    catch(kb_llm_agent:enqueue_update(Request,Tight,_),error(resource_error(llm_payload_budget),_),HistoryLimit=true),
    assertion(HistoryLimit==true),
    catch(kb_llm_agent:enqueue_update(Request,D.put(turns,100),_),
      error(resource_error(llm_queue_limit),_),TurnLimit=true),assertion(TurnLimit==true),
    findall(_{callId:Key,text:"old",status:"cancelled"},(between(1,100,N),number_string(N,Key)),Retained),
    Old=D.put(queue,D.queue.put(items,Retained)),
    catch(kb_llm_agent:enqueue_update(Request,Old,_),error(resource_error(llm_queue_limit),_),RetentionLimit=true),
    assertion(RetentionLimit==true),
    length(Codes,8193),maplist(=(0'a),Codes),string_codes(TooLong,Codes),
    catch(kb_llm_agent:queue_text(Request.put(text,TooLong)),error(resource_error(llm_input_limit),_),TextLimit=true),
    assertion(TextLimit==true),
    sub_string(TooLong,0,8192,_,Large),
    findall(_{callId:Key,text:Large,status:"queued"},(between(1,3,N),number_string(N,Key)),LargePending),
    ByteFull=D.put(queue,D.queue.put(items,LargePending)),
    catch(kb_llm_agent:enqueue_update(Request.put(text,Large),ByteFull,_),
      error(resource_error(llm_payload_budget),_),ByteLimit=true),assertion(ByteLimit==true),
    forall(between(1,8,N),(number_string(N,Key),teacher_queue_add(C.id,Key,"bounded",_))),
    conversation(C.id,Full),assertion(Full.queue.canEnqueue==false),
    catch(teacher_queue_add(C.id,"overflow","bounded",_),error(resource_error(llm_queue_limit),_),Limit=true),
    assertion(Limit==true),
    catch(enqueue_chat(_{id:C.id,revision:Full.revision,callId:"grant",text:"bounded",
      grant:"forbidden",approvedNonsensitive:true},_),error(domain_error(agent_fields,_),_),Extra=true),
    assertion(Extra==true),interrupt_chat(C.id,_),wait_chat(C.id,_),retractall(user:teacher_queue_gate).
:- end_tests(llm_queue).

:- begin_tests(llm_forks,[setup(teacher_queue_setup(State)),cleanup(teacher_queue_cleanup(State))]).
test(fork_copies_only_completed_history_and_exact_snapshots_without_execution) :-
    agent_settings(Settings),
    save_agent_settings(_{model:"openai/gpt-5.6-sol",budgets:Settings.budgets},Settings.revision,_),
    teacher_queue_hold(C),teacher_queue_release,wait_chat(C.id,First),
    assertz(user:teacher_queue_gate),
    start_chat(_{id:C.id,revision:First.revision,text:"unfinished",approvedNonsensitive:true},_),
    call_with_time_limit(30,teacher_queue_wait),
    conversation(C.id,Busy),
    catch(fork_conversation(_{id:C.id,revision:Busy.revision},_),
      error(llm_fork_parent_busy_or_unknown,_),Denied=true),assertion(Denied==true),
    interrupt_chat(C.id,_),wait_chat(C.id,Parent),retractall(user:teacher_queue_gate),
    kb_llm_agent:conversation_file(C.id,File),read_bytes(File,1048576,Before),
    teacher_queue_sent(Sent),
    fork_conversation(_{id:C.id,revision:Parent.revision},Fork),
    assertion(Fork.id\==C.id),assertion(Fork.branchOf.id==C.id),
    assertion(Fork.branchOf.revision=:=Parent.revision),
    assertion(Fork.model=="openai/gpt-5.6-sol"),assertion(Fork.promptHash==Parent.promptHash),
    assertion(Fork.messages==First.messages),assertion(Fork.turns=:=0),
    assertion(Fork.calls==[]),assertion(Fork.audit==[]),assertion(Fork.queue.items==[]),
    read_bytes(File,1048576,After),assertion(After==Before),
    kb_llm_agent:load_document(Fork.id,ChildDoc),kb_llm_agent:load_document(C.id,ParentDoc),
    assertion(ChildDoc.config==ParentDoc.config),assertion(ChildDoc.prompt==ParentDoc.prompt),
    ChildDoc.history=[_,Context|_],assertion(sub_string(Context.content,_,_,_,Fork.id)),
    assertion(\+sub_string(Context.content,_,_,_,C.id)),
    kb_llm_kee:ownership(Fork.id,Own),assertion(Own.ids==[]),assertion(Own.changesets==[]),
    teacher_queue_sent(Still),assertion(Still==Sent).
test(inherited_tool_material_requires_a_new_exact_grant_and_is_never_replayed) :-
    teacher_queue_new(C),kb_llm_agent:load_document(C.id,D),
    History=[_{role:"user",name:"approved_grounding",content:"Synthetic selected material"},
      _{role:"user",content:"Synthetic question"},
      _{role:"assistant",content:null,tool_calls:[_{id:"fixture",type:"function",
        function:_{name:"kee_ledger_status",arguments:"{}"}}]},
      _{role:"tool",tool_call_id:"fixture",content:"Synthetic observed result"}],
    append(D.history,History,Complete),
    kb_llm_agent:update_document(C.id,teacher_queue_put(_{history:Complete,completedHistory:Complete,
      calls:[_{id:"fixture",name:"kee_ledger_status",state:"completed"}]})),
    conversation(C.id,Parent),fork_conversation(_{id:C.id,revision:Parent.revision},Fork),
    kb_llm_kee:json_normalize(History,Expected),
    assertion(Fork.messages==Expected),assertion(Fork.plainTextEligible==false),assertion(Fork.calls==[]),
    catch(start_chat(_{id:Fork.id,revision:Fork.revision,text:"No implicit export",approvedNonsensitive:true},_),
      error(llm_grounding_not_approved,_),Denied=true),assertion(Denied==true).
test(unknown_parent_and_revision_conflicts_are_rejected) :-
    teacher_queue_new(C),
    catch(fork_conversation(_{id:C.id,revision:999},_),error(agent_conversation_conflict,_),Conflict=true),
    assertion(Conflict==true),
    kb_llm_agent:update_document(C.id,teacher_queue_put(_{status:"running",activeTurn:"synthetic-orphan"})),
    catch(fork_conversation(_{id:C.id,revision:C.revision},_),
      error(llm_fork_parent_busy_or_unknown,_),Unknown=true),assertion(Unknown==true),
    kb_llm_agent:update_document(C.id,teacher_queue_put(_{status:"ready",activeTurn:null,
      calls:[_{state:"unknown"}]})),
    catch(fork_conversation(_{id:C.id,revision:C.revision},_),
      error(llm_fork_parent_busy_or_unknown,_),CallUnknown=true),assertion(CallUnknown==true).
:- end_tests(llm_forks).
