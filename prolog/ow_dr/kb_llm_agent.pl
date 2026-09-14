:- module(kb_llm_agent,
          [start_conversation/2,conversation/2,start_chat/2,interrupt_chat/2,stop_conversation/2,
           local_todos/2,local_receipt/3,list_conversations/3,undo_todo/2,
           enqueue_chat/2,resume_queue/2,cancel_queued/2,fork_conversation/2]).
:- use_module(kb_agent_settings).
:- use_module(kb_llm_files).
:- use_module(kb_llm_prompt).
:- use_module(kb_llm_transport).
:- use_module(kb_llm_schema).
:- use_module(kb_llm_kee).
:- use_module(kb_kee_schema,[json_text/2]).
:- use_module(kb_activity,[]).
:- use_module(library(error)).
:- use_module(library(http/json)).
:- use_module(library(uuid)).
:- use_module(library(time)).
:- use_module(library(utf8)).
:- dynamic owned_run/4,cancelled/1.
:- volatile owned_run/4,cancelled/1.
:- dynamic queue_epoch/1.
:- volatile queue_epoch/1.
:- initialization(init_queue_epoch).
:- meta_predicate update_document(+,2).

init_queue_epoch :-
    uuid(Id),atom_string(Id,Epoch),retractall(queue_epoch(_)),assertz(queue_epoch(Epoch)).

start_conversation(Scope,Reply) :-
    validate_scope(Scope),agent_settings(Settings),
    Config=Settings.put(policyVersion,"llm-exact-grounding-v2"),
    prompt_snapshot(Prompt),uuid(Id,[version(4)]),
    new_document(Id,Config,Prompt,Scope,Doc),
    conversation_file(Id,File),locked_file(File,atomic_json(File,Doc)),conversation(Id,Reply).
new_document(Id,Config,Prompt,Scope,Doc) :-
    get_time(Now),registry_status(Registry),
    json_text(_{conversation:Id,model:Config.model,promptHash:Prompt.rawHash,
      scope:Scope,budgets:Config.budgets,registry:Registry,
      policy:Config.policyVersion},Context),
    string_concat("Trusted host configuration snapshot (data): ",Context,HostContext),
    (get_dict(grant,Scope,G),G\==null->throw(error(llm_grounding_not_approved,_));true),
    History=[_{role:"system",content:Prompt.content},_{role:"system",content:HostContext}],
    empty_queue(Queue),
    Doc=_{schema:1,id:Id,agent:"llm-knowledge",identity:"llm",createdAt:Now,
      revision:0,status:"ready",activeTurn:null,config:Config,prompt:Prompt,scope:Scope,
      history:History,completedHistory:History,queue:Queue,branchOf:null,
      events:[],eventSequence:0,calls:[],audit:[],
      turns:0,lastError:null,lastResponse:null}.
conversation(Input,Reply) :-
    load_document(Input,D),registry_status(Registry),
    exclude(system_message,D.history,Messages),maplist(public_call,D.calls,Calls),
    observed_status(D,Status),event_sequence(D,Sequence),queue_view(D,Queue),
    (plain_text_eligible(D)->Plain=true;Plain=false),
    (get_dict(branchOf,D,Branch)->true;Branch=null),
    (get_dict(lastAction,D,Action)->true;Action="chat"),
    Reply=_{id:D.id,agent:D.agent,identity:D.identity,status:Status,revision:D.revision,
      activeTurn:D.activeTurn,sequence:Sequence,model:D.config.model,baseURL:D.config.baseURL,
      promptHash:D.prompt.rawHash,settingsRevision:D.config.revision,
      budgets:D.config.budgets,scope:D.scope,messages:Messages,events:D.events,
      audit:D.audit,calls:Calls,turns:D.turns,error:D.lastError,
      rawResponse:D.lastResponse,
      registry:Registry,todos:_{available:Registry.available,reason:"Use Refresh local TODOs. This inspector never exports task text."},
      notice:D.config.notice,disclosureRequired:true,action:Action,
      plainTextEligible:Plain,queue:Queue,branchOf:Branch}.
observed_status(D,Status) :-
    id_atom(D.id,Id),
    (D.status=="running",\+owned_run(Id,_,_,_)->Status="outcome_unknown";Status=D.status).
system_message(Message) :- Message.role=="system".
public_call(Call,Public) :-
    (kb_llm_kee:mutation_name(Call.name)->Inspectable=true;Inspectable=false),
    Public=Call.put(receiptInspectable,Inspectable).
conversation_file(Input,File) :-
    id_atom(Input,Id),agent_state_dir(Directory),atom_concat('conversation-',Id,Stem),
    atom_concat(Stem,'.json',Name),directory_file_path(Directory,Name,File).
id_atom(Input,Id) :-
    (atom(Input)->Id=Input;must_be(string,Input),atom_string(Id,Input)),
    atom_codes(Id,Codes),length(Codes,36),
    forall(member(C,Codes),(between(0'0,0'9,C);between(0'a,0'f,C);C=:=0'-)),!.
id_atom(_,_) :- domain_error(agent_conversation_id,invalid).
load_document(Id,Doc) :- conversation_file(Id,File),read_json(File,Doc).
update_document(Id,Goal) :-
    conversation_file(Id,File),
    locked_file(File,(read_json(File,Before),call(Goal,Before,After),
                      bounded_json(After,1048576),atomic_json(File,After))).
next_revision(D,Next) :- N is D.revision+1,Next=D.put(revision,N).

start_chat(Request,Reply) :-
    (get_dict(grant,Request,_)->strict_keys(Request,[approvedNonsensitive,grant,id,revision,text]);
      strict_keys(Request,[approvedNonsensitive,id,revision,text])),
    (Request.approvedNonsensitive==true->true;permission_error(export,llm_input,approval_required)),
    must_be(string,Request.text),string_length(Request.text,N),
    must_be(integer,Request.revision),
    (between(1,8192,N)->true;resource_error(llm_input_limit)),
    uuid(Run,[version(4)]),id_atom(Request.id,Id),
    kb_activity:acquire_application(Run),
    catch(
      (with_mutex(powder_llm_runs,
         ((owned_run(Id,_,_,_)->throw(error(agent_conversation_busy,_));true),
          findall(R,owned_run(_,R,_,_),Active),length(Active,Count),
          (Count<4->true;resource_error(llm_active_turns)),
          update_document(Id,accept_chat(Request,Run)),
          thread_create(run_wait(Id,Run),Thread,[detached(true)]),
          assertz(owned_run(Id,Run,Thread,starting)))),
       thread_send_message(Thread,start)),
      Error,(finish_error(Id,Run,Error),kb_activity:release_application(Run),throw(Error))),
    conversation(Id,Reply).
accept_chat(Request,Run,D,After) :-
    queue_data(D,Q),pending_items(Q.items,Pending),
    (Pending==[]->true;throw(error(llm_queue_pending,_))),
    prepare_chat(Request,Run,D,After).
prepare_chat(Request,Run,D,After) :-
    kb_llm_kee:policy(D.config,_),
    (member(Call,D.calls),memberchk(Call.state,["reserved","unknown"])->
       throw(error(llm_call_outcome_unknown,_));true),
    (D.revision=:=Request.revision->true;throw(error(agent_conversation_conflict,_))),
    (D.status=="closed"->permission_error(chat,conversation,closed);true),
    (D.status=="running"->throw(error(agent_conversation_busy,_));true),
    (get_dict(grant,Request,Grant)->
      consume_grounding(Grant,D,Request,Run),
      kb_llm_kee:grant_file(Grant,GF),read_json(GF,GD),
      History=GD.messages,TurnGrant=Grant,Action=GD.binding.mode;
      verify_provider_input(D.scope,D.history),
      append(D.history,[_{role:"user",content:Request.text}],History),TurnGrant=null,Action="chat"),
    bounded_json(History,D.config.budgets.historyBytes),
    Turns is D.turns+1,(Turns=<100->true;resource_error(llm_conversation_turns)),
    completed_history(D,Completed),event(D,"turn_started",_{run:Run},E),
    next_revision(E.put(_{status:"running",activeTurn:Run,history:History,
      completedHistory:Completed,turnGrant:TurnGrant,lastAction:Action,turns:Turns,lastError:null}),After).
run_wait(Id,Run) :-
    thread_get_message(start),run_chain(Id,Run).
run_chain(Id,Run) :-
    setup_call_cleanup(true,
      catch((once(run_turn(Id,Run))->true;throw(error(llm_turn_failed,_))),
            Error,finish_error(Id,Run,Error)),
      finish_owned_run(Id,Run,Next)),
    (Next=next(NextRun)->run_chain(Id,NextRun);true).
run_turn(Id,Run) :-
    load_document(Id,D),ensure_current(Id,Run),
    Config=D.config.put(_{conversation:D.id,run:Run}),
    (get_dict(turnGrant,D,G),G\==null->Scope=D.scope.put(grant,G);Scope=D.scope),
    setup_call_cleanup(open_turn(Config,D.prompt,Scope,Handle,Tools),
      call_with_time_limit(Config.budgets.seconds,
        rounds(Id,Run,Config,Handle,Tools,D.history,0,0)),
      close_turn(Handle)).
rounds(Id,Run,Config,Handle,Tools,History,Rounds,Calls) :-
    ensure_current(Id,Run),
    (Rounds<Config.budgets.rounds->true;resource_error(llm_round_budget)),
    verify_outgoing(Handle),Handle=kee(_,_,Scope,_,_),
    verify_provider_input(Scope,History),ensure_current(Id,Run),
    bounded_json(History,Config.budgets.historyBytes),set_phase(Id,Run,http),
    chat_completion(Config,History,Tools,Response),
    set_phase(Id,Run,validating),ensure_current(Id,Run),
    bounded_json(Response,Config.budgets.outputBytes),response_message(Response,Message),
    append(History,[Message],WithAssistant),
    update_document(Id,record_assistant(Run,Message,Response,WithAssistant)),
    (get_dict(tool_calls,Message,ToolCalls),ToolCalls\=[]->
      length(ToolCalls,Count),NextCalls is Calls+Count,
      (NextCalls=<Config.budgets.calls->true;resource_error(llm_call_budget)),
      maplist(call_identifier,ToolCalls,Ids),sort(Ids,Unique),
      (same_length(Ids,Unique)->true;throw(error(llm_duplicate_call_ids,_))),
      execute_calls(ToolCalls,Id,Run,Handle,Config,WithAssistant,NextHistory),
      (member(C,ToolCalls),kb_llm_kee:mutation_name(C.function.name)->
        update_document(Id,finish_local_mutations(Run));
        NextRound is Rounds+1,rounds(Id,Run,Config,Handle,Tools,NextHistory,NextRound,NextCalls))
    ;update_document(Id,finish_success(Run))).
response_message(Response,Message) :-
    (is_dict(Response),get_dict(choices,Response,[Choice|_]),get_dict(message,Choice,Message),
     is_dict(Message),Message.role=="assistant"->true;throw(error(llm_invalid_response,_))),
    (get_dict(content,Message,C)->(string(C);C==null);true),
    (get_dict(tool_calls,Message,Calls)->must_be(list,Calls);true).
call_identifier(Call,Id) :-
    strict_keys(Call,[function,id,type]),Call.type=="function",
    must_be(string,Call.id),string_length(Call.id,N),between(1,128,N),
    strict_keys(Call.function,[arguments,name]),
    must_be(string,Call.function.name),must_be(string,Call.function.arguments),Id=Call.id.
record_assistant(Run,Message,Response,History,D,After) :-
    check_document_run(D,Run),
    bounded_json(History,D.config.budgets.historyBytes),
    (get_dict(tool_calls,Message,Calls)->length(Calls,Count);Count=0),
    event(D,"assistant_complete",_{toolCalls:Count},E),
    next_revision(E.put(_{history:History,lastResponse:Response}),After).
finish_success(Run,D,After) :-
    check_document_run(D,Run),event(D,"turn_completed",_{run:Run},E),
    finish_queue_item(E,Run,"completed",null,Q),
    next_revision(E.put(_{status:"ready",activeTurn:null,queue:Q,
                         completedHistory:D.history,lastCompletedRun:Run}),After).
finish_local_mutations(Run,D,After) :-
    check_document_run(D,Run),
    event(D,"local_mutation_boundary",
      _{notice:"Model continuation stopped. Inspect actual TODO outcomes and receipts locally. No future result export was approved."},E),
    paused_queue(E,"knowledge_turn",Q),
    next_revision(E.put(_{status:"ready",activeTurn:null,completedHistory:D.history,queue:Q}),After).

execute_calls([],_,_,_,_,History,History).
execute_calls([Call|Rest],Id,Run,Handle,Config,Before,After) :-
    ensure_current(Id,Run),set_phase(Id,Run,tool),
    json_bytes(Call,Bytes),bytes_hash(Bytes,HashAtom),atom_string(HashAtom,Hash),
    reserve_call(Id,Run,Call,Hash,Previous),
    (Previous=completed(Result)->true;
     catch(((once(run_call(Handle,Call,Safe,Audit))->true;throw(error(llm_tool_failed,_))),
            bounded_json(Safe,Config.budgets.outputBytes),
            Result=_{ok:true,result:Safe},store_call(Id,Run,Call,Hash,Result,Audit)),
           Error,call_error(Id,Run,Call,Hash,Error,Result))),
    ensure_current(Id,Run),
    json_text(Result,Text),
    ToolMessage=_{role:"tool",tool_call_id:Call.id,content:Text},
    append(Before,[ToolMessage],Next),
    update_document(Id,record_tool(Run,Next)),
    execute_calls(Rest,Id,Run,Handle,Config,Next,After).
call_error(Id,Run,Call,Hash,Error,Result) :-
    safe_error(Error,SafeError),
    (kb_llm_kee:mutation_name(Call.function.name),\+ definite_rejection(Error)->
      Result=_{ok:false,error:SafeError,outcome:"unknown"},
      store_call(Id,Run,Call,Hash,Result,_{outcome:"unknown"}),
      throw(error(llm_mutation_unconfirmed,_));
     Result=_{ok:false,error:SafeError,outcome:"rejected"},
     store_call(Id,Run,Call,Hash,Result,_{outcome:"rejected"})).
definite_rejection(error(llm_call_rejected,_)).
definite_rejection(error(kee(Code,_),_)) :-
    memberchk(Code,[ledger_conflict,resource_conflict,undo_conflict,completion_requires_user_attestation]).
reserve_call(Id,Run,Call,Hash,Previous) :-
    conversation_file(Id,File),
    locked_file(File,
      (read_json(File,D),check_document_run(D,Run),
       (member(Record,D.calls),Record.id==Call.id->
         (Record.hash==Hash->
           (Record.state=="completed"->Previous=completed(Record.result);
            throw(error(llm_call_outcome_unknown,_)));
          throw(error(llm_call_id_conflict,_)))
       ;Previous=new,
        Record=_{id:Call.id,hash:Hash,name:Call.function.name,call:Call,state:"reserved",result:null},
        append(D.calls,[Record],Records),next_revision(D.put(calls,Records),After),
        bounded_json(After,1048576),atomic_json(File,After)))).
store_call(Id,_Run,Call,Hash,Result,Audit) :-
    % Commit outcome recording survives interruption; new calls still require current admission.
    update_document(Id,complete_call(Call.id,Hash,Result,Audit)).
complete_call(CallId,Hash,Result,Audit,D,After) :-
    select(Old,D.calls,Rest),Old.id==CallId,Old.hash==Hash,
    (get_dict(outcome,Result,"unknown")->State="unknown";State="completed"),
    New=Old.put(_{state:State,result:Result}),
    append(Rest,[New],Calls),append(D.audit,[Audit.put(callId,CallId)],Audits),
    next_revision(D.put(_{calls:Calls,audit:Audits}),After).
record_tool(Run,History,D,After) :-
    check_document_run(D,Run),next_revision(D.put(history,History),After).

interrupt_chat(Id,Reply) :- cancel_chat(Id,"interrupted",Reply).
stop_conversation(Id,Reply) :- cancel_chat(Id,"closed",Reply).
cancel_chat(Input,Status,Reply) :-
    id_atom(Input,Id),
    with_mutex(powder_llm_runs,
      (findall(Run-Thread-Phase,owned_run(Id,Run,Thread,Phase),Owned),
       forall(member(Run-_-_,Owned),(cancelled(Run)->true;assertz(cancelled(Run)))),
       atom_string(Id,Conversation),revoke_turn(Conversation),
       update_document(Id,record_cancel(Status)))),
    forall(member(_-Thread-http,Owned),catch(thread_signal(Thread,throw(llm_cancelled)),_,true)),
    conversation(Id,Reply).
record_cancel(Status,D,After) :-
    event(D,Status,_{providerCancellation:"best effort; no provider cancellation endpoint"},E),
    finish_queue_item(E,D.activeTurn,"interrupted",null,Q0),
    Q=Q0.put(_{paused:true,pauseReason:Status}),
    next_revision(E.put(_{status:Status,activeTurn:null,queue:Q}),After).
ensure_current(Id,Run) :-
    (cancelled(Run)->throw(llm_cancelled);true),load_document(Id,D),check_document_run(D,Run).
check_document_run(D,Run) :-
    atom_string(Run,Text),
    (D.status=="running",D.activeTurn==Text->true;throw(llm_cancelled)).
set_phase(Id,Run,Phase) :-
    with_mutex(powder_llm_runs,
      ((cancelled(Run)->throw(llm_cancelled);true),
       (retract(owned_run(Id,Run,T,_))->assertz(owned_run(Id,Run,T,Phase));throw(llm_cancelled)))).
finish_error(Id,Run,Error) :-
    safe_error(Error,Safe),
    catch(update_document(Id,record_error(Run,Safe)),_,true).
record_error(Run,Error,D,After) :-
    check_document_run(D,Run),event(D,"turn_failed",Error,E),
    finish_queue_item(E,Run,"failed",Error,Q0),
    Q=Q0.put(_{paused:true,pauseReason:"failed"}),
    next_revision(E.put(_{status:"failed",activeTurn:null,lastError:Error,queue:Q}),After).
safe_error(llm_cancelled,_{code:"interrupted",message:"The turn was interrupted; late calls are discarded."}) :- !.
safe_error(time_limit_exceeded,_{code:"timeout",message:"The host deadline expired. No automatic retry was performed."}) :- !.
safe_error(error(llm_http_status(Status),_),_{code:"provider_http",status:Status,
  message:"The selected provider/model request failed. No fallback was attempted."}) :- !.
safe_error(error(kee(Code,_),_),_{code:Code,
  message:"KEE rejected the operation. Check permissions, scope and revisions; no raw private diagnostics are exported."}) :- !.
safe_error(error(llm_call_rejected,Underlying),Safe) :- !,safe_error(Underlying,Safe).
safe_error(error(llm_grounding_not_approved,_),
  _{code:"grounding_not_approved",
    message:"An exact current disclosure grant is required. Preview this turn and approve its bounded nonsensitive material; no raw future tool result is authorized."}) :- !.
safe_error(error(llm_grounding_expired,_),_{code:"disclosure_expired",
    message:"The five-minute disclosure approval expired. Preview this turn again; no automatic resend occurred."}) :- !.
safe_error(error(llm_grounding_stale,_),_{code:"disclosure_stale",
    message:"Selected evidence changed. Read a fresh local preview and approve it before sending."}) :- !.
safe_error(error(llm_grounding_conflict,_),_{code:"disclosure_conflict",
    message:"The approved turn no longer matches its conversation, host, settings or material. Preview again; start a new conversation after changing model settings."}) :- !.
safe_error(error(llm_mutation_unconfirmed,_),_{code:"mutation_unconfirmed",
  message:"A mutation outcome is unconfirmed. This conversation is blocked to prevent accidental repetition; inspect its durable call receipt locally."}) :- !.
safe_error(error(llm_conversation_policy_upgrade_required,_),
  _{code:"new_conversation_required",message:"Start a new Teacher conversation for exact export approval. No provider request was sent."}) :- !.
safe_error(error(Form,_),_{code:Name,message:"The request was rejected or failed; no automatic retry was performed."}) :-
    nonvar(Form),functor(Form,Name,_),!.
safe_error(_,_{code:"agent_failed",message:"The turn failed; no automatic retry was performed."}).
event(D,Kind,Detail,After) :-
    get_time(Now),append(D.events,[_{at:Now,kind:Kind,detail:Detail}],Events0),
    length(Events0,N),Drop is max(0,N-200),length(Prefix,Drop),append(Prefix,Events,Events0),
    event_sequence(D,Before),Sequence is Before+1,
    After=D.put(_{events:Events,eventSequence:Sequence}).
event_sequence(D,Sequence) :-
    (get_dict(eventSequence,D,Sequence)->true;length(D.events,Sequence)).
bounded_json(Value,Limit) :-
    json_bytes(Value,Bytes),length(Bytes,N),
    (N=<Limit->true;resource_error(llm_payload_budget)).

empty_queue(_{items:[],paused:false,pauseReason:null,epoch:Epoch}) :- queue_epoch(Epoch).
queue_data(D,Q) :- (get_dict(queue,D,Q)->true;empty_queue(Q)).
pending_items(Items,Pending) :- include(queued_item,Items,Pending).
queued_item(Item) :- Item.status=="queued".
run_text(Run,Text) :- (atom(Run)->atom_string(Run,Text);Text=Run).
owned_current(D) :-
    D.status=="running",id_atom(D.id,Id),owned_run(Id,Run,_,_),
    run_text(Run,Text),D.activeTurn==Text.
unresolved_calls(D) :- member(C,D.calls),memberchk(C.state,["reserved","unknown"]).
plain_text_eligible(D) :-
    D.calls==[],
    \+ (D.status=="running",get_dict(turnGrant,D,G),G\==null),
    catch(verify_provider_input(D.scope,D.history),error(llm_grounding_not_approved,_),fail).
require_plain_text(D) :-
    (plain_text_eligible(D)->true;throw(error(llm_queue_plaintext_required,_))).
expected_revision(R,D) :-
    must_be(integer,R.revision),
    (R.revision=:=D.revision->true;throw(error(agent_conversation_conflict,_))).
queue_call_id(Id) :-
    must_be(string,Id),string_length(Id,N),
    (between(1,128,N)->true;domain_error(llm_queue_call_id,Id)).
queue_text(R) :-
    (R.approvedNonsensitive==true->true;permission_error(export,llm_input,approval_required)),
    must_be(string,R.text),string_length(R.text,N),normalize_space(string(Trimmed),R.text),
    (between(1,8192,N),Trimmed\==""->true;resource_error(llm_input_limit)).
queue_view(D,View) :-
    queue_data(D,Q),pending_items(Q.items,Pending),length(Pending,N),
    maplist(queue_public_item(D),Q.items,Items),
    (plain_text_eligible(D),owned_current(D),N<8,length(Q.items,Total),Total<100,
     D.turns+N<100->Enqueue=true;Enqueue=false),
    (N>0,plain_text_eligible(D),\+memberchk(D.status,["running","closed"]),
     id_atom(D.id,Id),\+owned_run(Id,_,_,_)->Resume=true;Resume=false),
    queue_state(D,Q,N,State,Reason),
    View=_{state:State,pauseReason:Reason,pending:N,canEnqueue:Enqueue,canResume:Resume,
           items:Items,maximumPending:8,maximumEntries:100,maximumTextCharacters:8192}.
queue_public_item(D,Item,Public) :-
    (Item.status=="running",\+owned_current(D)->Public=Item.put(status,"outcome_unknown");Public=Item).
queue_state(D,Q,N,State,Reason) :-
    ((N>0;member(I,Q.items),I.status=="running")->HasWork=true;HasWork=false),
    (HasWork==false->State="idle",Reason=null;
     D.status=="running",\+owned_current(D)->State="paused",Reason="outcome_unknown";
     queue_epoch(Epoch),Q.epoch\==Epoch->State="paused",Reason="restart";
     Q.paused==true->State="paused",Reason=Q.pauseReason;
     owned_current(D)->(member(I,Q.items),I.status=="running"->State="running";State="waiting"),Reason=null;
     id_atom(D.id,Id),owned_run(Id,Run,_,_),automatic_queue_ready(D,Run)->State="waiting",Reason=null;
     State="paused",Reason="explicit_resume_required").
enqueue_chat(R,Reply) :-
    strict_keys(R,[approvedNonsensitive,callId,id,revision,text]),queue_text(R),
    queue_call_id(R.callId),must_be(integer,R.revision),id_atom(R.id,Id),
    with_mutex(powder_llm_runs,update_document(Id,enqueue_update(R))),
    conversation(Id,Reply).
enqueue_update(R,D,After) :-
    queue_data(D,Q),
    (member(Item,Q.items),Item.callId==R.callId->
       (Item.text==R.text->After=D;throw(error(llm_queue_call_conflict,_)));
     expected_revision(R,D),require_plain_text(D),
     (owned_current(D)->true;throw(error(llm_queue_requires_active_turn,_))),
     pending_items(Q.items,Pending),length(Pending,N),length(Q.items,Total),
     (N<8,Total<100,D.turns+N<100->true;resource_error(llm_queue_limit)),
     get_time(Now),queue_epoch(Epoch),
     Entry=_{callId:R.callId,text:R.text,status:"queued",createdAt:Now,run:null,error:null},
     append(Q.items,[Entry],Items),append(Pending,[Entry],Future),
     bounded_json(Future,32768),
     findall(_{role:"user",content:Text},(member(P,Future),get_dict(text,P,Text)),Messages),
     append(D.history,Messages,Projected),bounded_json(Projected,D.config.budgets.historyBytes),
     event(D,"message_enqueued",_{callId:R.callId},E),
     NewQ=Q.put(_{items:Items,paused:false,pauseReason:null,epoch:Epoch}),
     next_revision(E.put(queue,NewQ),After)).
cancel_queued(R,Reply) :-
    strict_keys(R,[callId,id,revision]),queue_call_id(R.callId),must_be(integer,R.revision),
    id_atom(R.id,Id),with_mutex(powder_llm_runs,update_document(Id,cancel_queued_update(R))),
    conversation(Id,Reply).
cancel_queued_update(R,D,After) :-
    queue_data(D,Q),
    (member(Item,Q.items),Item.callId==R.callId->true;throw(error(llm_queue_item_not_found,_))),
    (Item.status=="cancelled"->After=D;
     expected_revision(R,D),
     (Item.status=="queued"->true;throw(error(llm_queue_item_started,_))),
     get_time(Now),New=Item.put(_{status:"cancelled",finishedAt:Now}),
     replace_queue_item(Q.items,Item.callId,New,Items),
     event(D,"queued_message_cancelled",_{callId:R.callId},E),
     next_revision(E.put(queue,Q.put(items,Items)),After)).
replace_queue_item([],_,_,[]).
replace_queue_item([I|Rest],Id,New,[Item|Items]) :-
    (I.callId==Id->Item=New;Item=I),replace_queue_item(Rest,Id,New,Items).
resume_queue(R,Reply) :-
    strict_keys(R,[approvedNonsensitive,id,revision]),must_be(integer,R.revision),
    (R.approvedNonsensitive==true->true;permission_error(export,llm_input,approval_required)),
    id_atom(R.id,Id),
    with_mutex(powder_llm_runs,
      ((owned_run(Id,_,_,_)->throw(error(agent_conversation_busy,_));true),
       findall(A,owned_run(_,A,_,_),Active),length(Active,N),
       (N<4->true;resource_error(llm_active_turns)),
       reserve_queued_run(Id,resume(R),Run),
       catch((thread_create(run_wait(Id,Run),Thread,[detached(true)]),
              assertz(owned_run(Id,Run,Thread,starting)),thread_send_message(Thread,start)),
         Error,(retractall(owned_run(Id,Run,_,_)),finish_error(Id,Run,Error),
                kb_activity:release_application(Run),throw(Error))))),
    conversation(Id,Reply).
reserve_queued_run(Id,Mode,Run) :-
    uuid(Run),kb_activity:acquire_application(Run),
    catch((once(update_document(Id,accept_queued(Mode,Run)))->true;
           throw(error(llm_queue_dispatch_failed,_))),Error,
      (kb_activity:release_application(Run),throw(Error))).
accept_queued(Mode,Run,D,After) :-
    (Mode=resume(R)->expected_revision(R,D);Mode=automatic(Previous),automatic_queue_ready(D,Previous)),
    require_plain_text(D),
    (memberchk(D.status,["running","closed"])->throw(error(llm_queue_resume_blocked,_));true),
    queue_data(D,Q),pending_items(Q.items,Pending),
    (Pending=[Item|_]->true;throw(error(llm_queue_empty,_))),
    Request=_{id:D.id,revision:D.revision,text:Item.text,approvedNonsensitive:true},
    prepare_chat(Request,Run,D,Prepared),get_time(Now),queue_epoch(Epoch),
    Started=Item.put(_{status:"running",run:Run,startedAt:Now}),
    replace_queue_item(Q.items,Item.callId,Started,Items),
    After=Prepared.put(queue,Q.put(_{items:Items,paused:false,pauseReason:null,epoch:Epoch})).
finish_queue_item(D,Run,Status,Error,Q) :-
    queue_data(D,Before),run_text(Run,Text),get_time(Now),
    maplist(finish_queue_entry(Text,Status,Error,Now),Before.items,Items),Q=Before.put(items,Items).
finish_queue_entry(Run,Status,Error,Now,Item,After) :-
    (Item.status=="running",Item.run==Run->
       After=Item.put(_{status:Status,error:Error,finishedAt:Now});After=Item).
paused_queue(D,Reason,Q) :-
    queue_data(D,Before),Q=Before.put(_{paused:true,pauseReason:Reason}).
automatic_queue_ready(D,Run) :-
    run_text(Run,Text),D.status=="ready",get_dict(lastCompletedRun,D,Text),
    queue_data(D,Q),Q.paused==false,queue_epoch(Q.epoch),
    pending_items(Q.items,[_|_]),plain_text_eligible(D).
finish_owned_run(Id,Run,Next) :-
    % Only the finishing worker can reserve a successor, under the cancellation mutex.
    setup_call_cleanup(true,
      with_mutex(powder_llm_runs,
        setup_call_cleanup(true,
          catch(next_queued_run(Id,Run,Next),Error,
            (catch(update_document(Id,pause_queue_error(Error)),_,true),Next=none)),
          (retractall(owned_run(Id,Run,_,_)),retractall(cancelled(Run))))),
      kb_activity:release_application(Run)).
next_queued_run(Id,Run,Next) :-
    load_document(Id,D),
    (\+cancelled(Run),owned_run(Id,Run,Thread,_),automatic_queue_ready(D,Run)->
       reserve_queued_run(Id,automatic(Run),NextRun),
       assertz(owned_run(Id,NextRun,Thread,starting)),Next=next(NextRun);
     Next=none).
pause_queue_error(Error,D,After) :-
    safe_error(Error,Safe),paused_queue(D,"dispatch_error",Q),
    event(D,"queue_paused",Safe,E),next_revision(E.put(queue,Q),After).

completed_history(D,History) :-
    (get_dict(completedHistory,D,History)->true;
     D.status=="ready"->History=D.history;
     legacy_completed_history(D.history,History)).
legacy_completed_history(History,Completed) :-
    findall(N,(nth0(N,History,M),M.role=="user",
      \+get_dict(name,M,"approved_grounding")),Positions),
    (Positions==[]->include(system_message,History,Completed);
     last(Positions,Last),
     (Last>0,Before is Last-1,nth0(Before,History,G),get_dict(name,G,"approved_grounding")->End=Before;End=Last),
     length(Completed,End),append(Completed,_,History)).
fork_conversation(R,Reply) :-
    strict_keys(R,[id,revision]),must_be(integer,R.revision),id_atom(R.id,Parent),
    conversation_file(Parent,File),
    with_mutex(powder_llm_runs,locked_file(File,
      (read_json(File,D),expected_revision(R,D),
       ((owned_run(Parent,_,_,_);D.status=="running";unresolved_calls(D))->
          throw(error(llm_fork_parent_busy_or_unknown,_));true),
       completed_history(D,Completed),exclude(system_message,Completed,Messages),
       uuid(Id),new_document(Id,D.config,D.prompt,D.scope,New),
       append(New.history,Messages,History),bounded_json(History,D.config.budgets.historyBytes),
       Branch=_{id:D.id,revision:D.revision},
       event(New,"conversation_forked",Branch,E),
       Fork=E.put(_{history:History,completedHistory:History,branchOf:Branch}),
       bounded_json(Fork,1048576),conversation_file(Id,Child),
       locked_file(Child,atomic_json(Child,Fork))))),
    conversation(Id,Reply).

local_todos(Id,Reply) :-
    load_document(Id,D),Config=D.config.put(conversation,D.id),
    conversation_todos(Config,D.prompt,D.scope,Reply).
local_receipt(Input,CallId,Reply) :-
    id_atom(Input,Id),must_be(string,CallId),string_length(CallId,N),between(1,128,N),
    existing_agent_state_dir(Directory),
    atomic_list_concat(['conversation-',Id,'.json'],Name),directory_file_path(Directory,Name,File),
    read_json(File,D),
    (member(Record,D.calls),Record.id==CallId->true;throw(error(llm_recorded_call_not_found,_))),
    Config=D.config.put(conversation,D.id),inspect_receipt(Config,D.prompt,D.scope,Record,Reply).

list_conversations(Offset,Limit,Reply) :-
    must_be(integer,Offset),must_be(integer,Limit),between(0,100000,Offset),between(1,50,Limit),
    agent_state_dir(Dir),directory_files(Dir,Names),
    findall(Time-File,(member(Name,Names),atom_concat('conversation-',Tail,Name),
      atom_concat(Id,'.json',Tail),catch(id_atom(Id,_),_,fail),
      directory_file_path(Dir,Name,File),time_file(File,Time)),Files),
    sort(0,@>=,Files,Sorted),length(Sorted,Total),
    findall(Item,(nth0(N,Sorted,_-File),N>=Offset,N<Offset+Limit,
      catch((read_json(File,D),observed_status(D,Status),event_sequence(D,Sequence),queue_view(D,FullQueue),
        del_dict(items,FullQueue,_,Queue),
        (get_dict(branchOf,D,Branch)->true;Branch=null),
        Item=_{id:D.id,createdAt:D.createdAt,model:D.config.model,status:Status,
               revision:D.revision,sequence:Sequence,turns:D.turns,promptHash:D.prompt.rawHash,
               queue:Queue,branchOf:Branch}),
        _,Item=_{status:"unavailable"})),Items),
    Reply=_{items:Items,total:Total,offset:Offset,limit:Limit}.
undo_todo(R,Reply) :-
    strict_keys(R,[action,callId,changeset,id,revision]),
    load_document(R.id,D),
    (D.status=="running"->throw(error(agent_conversation_busy,_));true),
    Config=D.config.put(conversation,D.id),
    del_dict(id,R,_,Request),
    kb_activity:with_application(kb_llm_kee:local_undo(Config,D.prompt,D.scope,Request,Reply)).
