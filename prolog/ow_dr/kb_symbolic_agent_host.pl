:- module(kb_symbolic_agent_host,[request/3]).
:- use_module(kb_symbolic_agent_control,[]).
:- use_module(kb_symbolic_agent_knowledge,[]).
:- use_module(kb_symbolic_agent_program,[]).
:- use_module(kb_symbolic_agent_profiles,[]).
:- use_module(kb_symbolic_agent_state,[]).
:- use_module(kb_symbolic_agent_wire,[]).
:- use_module(kb_symbolic_agent_kee,[]).
:- use_module(kb_kee,[]).
:- use_module(kb_kee_auth,[]).
:- use_module(kb_kee_schema,[]).
:- use_module(kb_store,[]).
:- use_module(kb_terms,[]).
:- use_module(kb_cache,[]).
:- use_module(library(http/json)).
:- use_module(library(lists)).
:- use_module(library(time)).

% Compiled localhost host policy. No browser-supplied principal, grants, program,
% arbitrary goal, source path, model or operator destination crosses this API.
request(Action,Input,Reply) :-
    (schema(Action,Spec)->true;throw(error(symbolic_unsupported_operation(Action),_))),
    kb_kee_schema:validate(Spec,Input,Args),
    (Action==status->status(Reply);
      with_mutex(powder_symbolic_http,once(request_locked(Action,Args,Reply)))),!.

identity([req(conversation,str(1,80)),req(id,str(1,128))]).
schema(status,obj([])).
schema(request_status,obj([req(conversation,str(1,80)),req(callId,str(1,80))])).
schema(start,choice([obj(App),obj(Loaded)])) :-
    Common=[req(conversation,str(1,80)),req(callId,str(1,80))],
    append(Common,[req(profile,enum(['cyc-starter-v1']))],App),
    append(Common,[req(agent,str(1,4096)),req(definitionMt,str(1,4096)),
      req(linkedMts,list(str(1,4096),199))],Loaded).
schema(Action,obj(Fields)) :-
    memberchk(Action,[conversation,todos,audit,receipt]),
    identity(Base),
    (Action==receipt->Extra=[req(actionCallId,str(1,128))];
      Extra=[opt(offset,int(0,100000)),opt(limit,int(1,100))]),
    append(Base,Extra,Fields).
schema(Action,obj(Fields)) :-
    memberchk(Action,[send,continue,interrupt,resume,stop,form]),
    identity(Base),
    (Action==send->Extra=[req(text,str(1,4096))];
      Action==form->Extra=[req(values,object)];Extra=[]),
    append([Base,[req(revision,str(64,64)),req(callId,str(1,80))],Extra],Fields).

status(Reply) :-
    kb_store:generation(G),kb_symbolic_agent_profiles:catalog(Profiles),
    Reply=json{identity:"symbolic",label:"Cyc",schema:"powder.symbolic-http.v1",
    knowledge:"unconfigured",message:"Select the limited app-owned starter, or a loaded agent with its definition and linked MTs, then Start. No program executes on selection.",
    generation:G,model:false,network:false,approvalSupported:false,
    profiles:Profiles,formSupported:true,limits:json{steps:128,actions:16,turns:1000,seconds:2}}.

base_spec(Conversation,Read,Write,Spec) :-
    get_time(Now),Expiry is Now+60,
    Spec=json{authenticated:true,actor:"local-user",agent:"powder-symbolic-http",
      conversation:Conversation,kind:"symbolic",model:null,promptVersion:null,promptHash:null,
      policyVersion:"powder.symbolic-http.v1",readMts:Read,writeMts:Write,
      permissions:["knowledge.read","knowledge.query","todo.read","todo.write",
        "changeset.read","agent.run.read","agent.run.write"],
      effects:["knowledge_read","query","telemetry","application_read","application_write",
        "agent_state_control"],
      expiresAt:Expiry,budgets:json{calls:256,mutations:8,resultBytes:1048576,seconds:2}}.

request_locked(request_status,A,json{receipt:Receipt}) :- !,
    base_spec(A.conversation,"all",[],Spec),http_call_id(A.callId,Id),
    setup_call_cleanup(kb_symbolic_agent_control:open_control(Spec,C),
      receipt(C,Id,Receipt),kb_symbolic_agent_control:close_control(C)).
request_locked(start,A,Reply) :- !,
    request_hash(start,A,Hash),http_call_id(A.callId,CallId),
    base_spec(A.conversation,"all",[],ReadSpec),
    setup_call_cleanup(kb_symbolic_agent_control:open_control(ReadSpec,Reader),
      (receipt(Reader,CallId,Receipt),
       (Receipt.status=="committed"->
         kb_symbolic_agent_control:get(Reader,Receipt.commit.result.id,Existing),
         (Existing.source.host.requestHash==Hash->public_recent(Reader,Existing,true,Reply);
           conflict(idempotence))
       ;start_new(A,Hash,CallId,Reply))),
      kb_symbolic_agent_control:close_control(Reader)).
request_locked(Action,A,Reply) :-
    base_spec(A.conversation,"all",[],ReadSpec),
    setup_call_cleanup(kb_symbolic_agent_control:open_control(ReadSpec,Reader),
      (kb_symbolic_agent_control:get(Reader,A.id,Run),
       owned_host(Run),
       request_run(Action,A,Reader,Run,Reply)),
      kb_symbolic_agent_control:close_control(Reader)).

start_new(A,Hash,CallId,Reply) :-
    prepare_start(A,Program,Snapshot,Config,Selected),
    host_spec(A.conversation,Selected,Program,Spec),
    mt_text(Program.mts.goalsMt,GoalsMt),
    Host0=json{config:Config,requestHash:Hash,snapshotHash:Snapshot.snapshotHash,selectedMts:Selected,
      recordCount:Snapshot.recordCount,coverage:Snapshot.microtheories,goalsMt:GoalsMt},
    (get_dict(profileSource,Snapshot,Source)->
      Host=Host0.put(_{origin:"app_owned_profile",profileSource:Source});
      Host=Host0.put(origin,"loaded_knowledge")),
    setup_call_cleanup(kb_symbolic_agent_control:open_control(Spec,Control),
      (kb_symbolic_agent_control:create_prepared(Control,Program,Snapshot.generation,[],
         CallId,Host,Run),
       public_recent(Control,Run,false,Reply)),
      kb_symbolic_agent_control:close_control(Control)).
prepare_start(A,Program,Snapshot,json{profile:Profile},Selected) :-
    get_dict(profile,A,Profile),!,
    kb_symbolic_agent_profiles:compile_profile(Profile,Program,Snapshot),
    Selected=Snapshot.selectedMts.
prepare_start(A,Program,Snapshot,Config,Selected) :-
    sort([A.definitionMt|A.linkedMts],Selected),
    base_spec(A.conversation,Selected,[],ReadSpec),
    setup_call_cleanup(kb_kee:open_context(ReadSpec,Token),
      capture(Token,A,Program,Snapshot),
      kb_kee:close_context(Token)),
    Config=json{agent:A.agent,definitionMt:A.definitionMt,linkedMts:A.linkedMts}.

capture(_,A,Program,Snapshot) :-
    get_dict(profile,A,Profile),!,
    kb_symbolic_agent_profiles:compile_profile(Profile,Program,Snapshot).
capture(Token,A,Program,Snapshot) :-
    kb_store:generation(G),kb_kee_auth:principal(Token,Principal),
    Args=json{agent:A.agent,mt:A.definitionMt,linkedMts:A.linkedMts,generation:G,
      maxRecords:8192,maxBytes:1048576,seconds:2},
    % This is the actual bounded native snapshot adapter, not a fictitious
    % registry tool; it executes no source clause and starts no source load.
    kb_symbolic_agent_knowledge:read_snapshot(Principal,Args,Snapshot),
    kb_symbolic_agent_knowledge:decode_snapshot(Snapshot,Records),
    kb_terms:context_from_key(A.agent,Agent),
    kb_terms:context_from_key(A.definitionMt,Mt),
    call_with_time_limit(2,
      kb_symbolic_agent_program:compile_program(Records,Agent,Mt,Program)).
host_spec(Conversation,Selected,Program,Spec) :-
    maplist(mt_text,[Program.mts.stateMt,Program.mts.goalsMt],Write0),sort(Write0,Write),
    base_spec(Conversation,Selected,Write,Spec).
mt_text(Mt,Text) :- kb_terms:context_key(Mt,Key),atom_string(Key,Text).
owned_host(Run) :-
    (get_dict(host,Run.source,H),is_dict(H),get_dict(config,H,_)->true;
      throw(error(symbolic_legacy_run_requires_new_start,_))).

request_run(conversation,A,C,R,Reply) :- !,
    page(A,_,Limit),
    (get_dict(offset,A,Offset)->true;Offset is max(0,R.resource.data.eventSequence+1-Limit)),
    public_run(C,R,Offset,Limit,false,Reply).
request_run(Action,A,_,R,Reply) :-
    memberchk(Action,[todos,audit,receipt]),!,
    selected_read(A.conversation,R,Spec),
    setup_call_cleanup(kb_symbolic_agent_control:open_control(Spec,C),
      inspect(Action,A,C,R,Reply),kb_symbolic_agent_control:close_control(C)).
request_run(Action,A,Reader,R,Reply) :-
    request_hash(Action,A,Hash),http_call_id(A.callId,CallId),
    receipt(Reader,CallId,Receipt),
    (Receipt.status=="committed"->
      verify_replay(Reader,R,Receipt,Hash),
      public_recent(Reader,R,true,Reply)
    ;(R.resource.revision==A.revision->true;conflict(revision)),
     advance_run(Action,A,R,Hash,CallId,Reply)).

selected_read(Conversation,R,Spec) :-
    base_spec(Conversation,R.source.host.selectedMts,[],Spec).
restore_program(A,R,Program,Spec) :-
    selected_read(A.conversation,R,ReadSpec),
    setup_call_cleanup(kb_kee:open_context(ReadSpec,Token),
      capture(Token,R.source.host.config,Program,Snapshot),kb_kee:close_context(Token)),
    ((get_dict(origin,R.source.host,"app_owned_profile");Snapshot.generation=:=R.source.kbGeneration),
     Snapshot.snapshotHash==R.source.host.snapshotHash->true;conflict(knowledge)),
    kb_symbolic_agent_control:verify_program(Program,R),
    host_spec(A.conversation,R.source.host.selectedMts,Program,Spec).

% Stop and Interrupt remain usable when the knowledge generation is unavailable.
advance_run(Action,A,R,Hash,CallId,Reply) :-
    (memberchk(Action,[stop,interrupt])->
      Program=program{agent:R.frame.engine.agent,version:R.frame.engine.program,
        definitionMt:Definition},kb_terms:context_from_key(R.source.definitionMt,Definition),
      base_spec(A.conversation,R.source.host.selectedMts,[R.resource.mt],Spec)
    ;restore_program(A,R,Program,Spec)),
    setup_call_cleanup(kb_symbolic_agent_control:open_control(Spec,C),
      advance_owned(Action,A,C,Program,R,Hash,CallId,Reply),
      kb_symbolic_agent_control:close_control(C)).

advance_owned(continue,A,C,P,R,Hash,CallId,Reply) :-
    R.frame.engine.phase==awaiting_action,!,
    (R.frame.pending.stage=="planned"->true;
      throw(error(symbolic_outcome_unknown_inspect_receipt,_))),
    % The intent is already durable. Claim its dispatch with this request's
    % idempotence marker before invoking the fixed gateway.
    kb_symbolic_agent_control:mark_dispatched(C,R.id,CallId,json{requestHash:Hash},Dispatched),
    dispatch(C,P,Dispatched,Finished),
    public_recent(C,Finished,false,Raw),
    Reply=Raw.put(_{requestHash:Hash,conversation:A.conversation}).
advance_owned(Action,A,C,P,R,Hash,CallId,Reply) :-
    input(Action,A,R,Input),
    kb_symbolic_agent_wire:encode_term(Input,Wire),
    Meta=json{requestHash:Hash,input:Wire},
    kb_symbolic_agent_control:advance_request(C,P,R.id,Input,CallId,Meta,After,_),
    public_recent(C,After,false,Reply).

input(send,A,_,text(A.text)).
input(continue,_,_,continue).
input(interrupt,_,_,interrupt).
input(stop,_,_,stop).
input(resume,_,_,resume).
input(form,A,R,form(Form,Values)) :-
    (R.frame.engine.phase==awaiting_form,
     R.frame.engine.pending=form(Form,Fields,_)->true;
       throw(error(symbolic_form_unavailable,_))),
    dict_pairs(A.values,_,Pairs),maplist(form_pair(Fields),Pairs,Converted),
    dict_pairs(Values,json,Converted).
form_pair(Fields,Key-Value,Key-Decoded) :-
    atom_string(Key,Name),
    (member(x_symbolicFormField(Name,x_Term),Fields)->
       kb_symbolic_agent_wire:decode_term(Value,Decoded),
       (ground(Decoded)->true;throw(error(symbolic_form_ground_term_required,_)))
    ;Decoded=Value).

dispatch(C,P,R,Final) :-
    C=control(Token,_,_),
    catch(kb_symbolic_agent_kee:invoke(Token,P.allowedCapabilities,
      R.frame.pending.intent,R.frame.pending.callId,Reply),
      Error,unknown_reply(R.frame.pending,Error,Reply)),
    string_concat(R.frame.pending.callId,"/outcome",OutcomeId),
    kb_symbolic_agent_control:record_outcome(C,P,R.id,Reply,OutcomeId,Final).
unknown_reply(Pending,Error,json{ok:false,tool:Pending.intent.capability,
    callId:Pending.callId,symbolicEffect:"unknown",
    error:json{code:"symbolic_action_unresolved",message:Message}}) :-
    message_to_string(Error,Message).

receipt(control(Token,_,_),CallId,Receipt) :-
    kb_symbolic_agent_kee:invoke(Token,["kee_call_status"],
      intent{capability:"kee_call_status",arguments:json{callId:CallId}},
      "symbolic-http/receipt",Reply),Receipt=Reply.result.
verify_replay(C,R,Receipt,Hash) :-
    (Receipt.commit.result.id==R.id->true;conflict(idempotence)),
    Sequence=Receipt.commit.result.eventSequence,
    kb_symbolic_agent_control:events(C,R.id,Sequence,1,Events),
    (Events.result.items=[Item],
     atom_json_dict(Item.event.json,Payload,[]),
     get_dict(request,Payload,Meta),Meta.requestHash==Hash->true;
       conflict(idempotence)).
request_hash(Action,A,Hash) :-
    kb_cache:terms_digest([symbolic_http_v1,Action,A],Atom),atom_string(Atom,Hash).
http_call_id(Input,Id) :- string_concat("symbolic-http/",Input,Id).
conflict(Kind) :- throw(error(symbolic_conflict(Kind),_)).
page(A,O,L) :-
    (get_dict(offset,A,O)->true;O=0),(get_dict(limit,A,L)->true;L=50).

inspect(receipt,A,C,R,json{receipt:Receipt}) :- !,
    (R.frame.pending\==null,R.frame.pending.callId==A.actionCallId->true;
      throw(error(symbolic_receipt_not_pending,_))),
    receipt(C,A.actionCallId,Receipt).
inspect(Action,A,control(Token,_,_),R,json{tool:Name,result:Result}) :-
    (Action==todos->Name="kee_todo_list";Name="kee_audit"),
    % The goals scope was verified during Start and is stored explicitly.
    goals_mt(R,Mt),page(A,Offset,Limit),
    kb_symbolic_agent_kee:invoke(Token,[Name],
      intent{capability:Name,arguments:json{mt:Mt,offset:Offset,limit:Limit}},
      "symbolic-http/inspect",Reply),Result=Reply.result.
goals_mt(R,Mt) :-
    get_dict(goalsMt,R.source.host,Mt),!.
goals_mt(_,_) :- throw(error(symbolic_goals_scope_unavailable,_)).

public_recent(C,R,Replayed,Reply) :-
    Offset is max(0,R.resource.data.eventSequence-49),
    public_run(C,R,Offset,50,Replayed,Reply).
public_run(C,R,Offset,Limit,Replayed,Reply) :-
    kb_symbolic_agent_control:events(C,R.id,Offset,Limit,Raw),
    maplist(public_event,Raw.result.items,Events),
    kb_symbolic_agent_wire:encode_term(R.frame.engine,State),
    pending_view(R,Pending),
    kb_store:generation(Current),
    (get_dict(origin,R.source.host,"app_owned_profile")->Knowledge="app_owned_profile";
      Current=:=R.source.kbGeneration->Knowledge="snapshot_bound";Knowledge="generation_changed"),
    Public=json{id:R.id,conversation:R.resource.data.owner.conversation,
      revision:R.resource.revision,eventSequence:R.resource.data.eventSequence,
      status:R.resource.data.status,phase:R.frame.engine.phase,steps:R.frame.engine.steps,
      actions:R.frame.engine.actions,turns:R.frame.turns,state:State,pending:Pending,
      source:R.source,knowledge:Knowledge,approvalSupported:false},
    Reply=json{run:Public,events:Events,eventTotal:Raw.result.total,
      offset:Offset,limit:Limit,replayed:Replayed}.
pending_view(R,Pending) :-
    (R.frame.pending\==null->
      Pending=json{kind:"action",stage:R.frame.pending.stage,
        callId:R.frame.pending.callId,intent:R.frame.pending.intent}
    ;R.frame.engine.pending=form(Form,Fields,_)->
      kb_symbolic_agent_wire:encode_term(Form,Key),maplist(public_field,Fields,PublicFields),
      Pending=json{kind:"form",key:Key,fields:PublicFields}
    ;R.frame.engine.pending=approval(Key,Choices,_)->
      kb_symbolic_agent_wire:encode_term(Key-Choices,Wire),
      Pending=json{kind:"approval",supported:false,value:Wire,
        message:"A trusted human approval receipt adapter is not installed. Interrupt or Stop; no browser approval flag is accepted."}
    ;Pending=null).
public_field(x_symbolicFormField(Name,Type),json{name:Name,type:Text}) :-
    atom_concat(x_,Kind,Type),atom_string(Kind,Text).
public_event(Item,Public) :-
    atom_json_dict(Item.event.json,Data,[]),
    (get_dict(cursor,Data,JSON)->
      kb_symbolic_agent_state:decode_cursor(JSON,Delta),
      kb_symbolic_agent_wire:encode_term(Delta.items,Wire),
      findall(json{text:Text,proof:Proof},member(text(Text,Proof),Delta.items),Messages)
    ;Wire=null,Messages=[]),
    (get_dict(request,Data,Request)->true;Request=null),
    Public=json{sequence:Item.eventSequence,time:Item.time,kind:Item.event.kind,
      callId:Item.event.id,request:Request,semantic:Wire,messages:Messages,
      action:Item.event.action}.
