:- module(kb_symbolic_agent_control,
          [open_control/2,close_control/1,create_prepared/6,create_prepared/7,
           get/3,advance_prepared/7,advance_request/8,mark_dispatched/4,mark_dispatched/5,
           record_outcome/6,events/5]).
:- use_module(kb_kee,[]).
:- use_module(kb_kee_schema,[]).
:- use_module(kb_symbolic_agent_kee,[]).
:- use_module(kb_symbolic_agent_program,[]).
:- use_module(kb_symbolic_agent_engine,[]).
:- use_module(kb_symbolic_agent_state,[]).
:- use_module(kb_terms,[]).
:- use_module(library(http/json)).
:- use_module(library(error)).
:- use_module(library(lists)).

% Only trusted host code constructs this value. Neither it nor its credential
% is serialized into a cursor, tool argument, event, or source manifest.
open_control(Spec,control(Token,Owner,Audit)) :-
    (Spec.kind=="symbolic",Spec.model==null,Spec.promptVersion==null,Spec.promptHash==null->true;
      throw(error(symbolic_context_required,_))),
    forall(member(Effect,Spec.effects),
      (memberchk(Effect,["knowledge_read","query","telemetry","application_read",
                        "application_write","agent_state_control"])->true;
        domain_error(symbolic_control_effect,Effect))),
    Owner=json{actor:Spec.actor,agent:Spec.agent,conversation:Spec.conversation},
    Audit=Owner.put(_{kind:"symbolic",policyVersion:Spec.policyVersion,
                     model:null,promptVersion:null,promptHash:null}),
    kb_kee:open_context(Spec,Token).
close_control(control(Token,_,_)) :- kb_kee:close_context(Token).

% Program is a host-verified immutable semantic snapshot, not client JSON.
% This prepared interface is also the explicit isolated-fixture boundary.
create_prepared(Control,Program,Generation,Options,CallId,Reply) :-
    create_prepared(Control,Program,Generation,Options,CallId,json{},Reply).
create_prepared(Control,Program,Generation,Options,CallId,Host,Reply) :-
    must_be(dict,Host),must_be(ground,Host),
    must_be(integer,Generation),(Generation>=0->true;domain_error(kb_generation,Generation)),
    kb_symbolic_agent_engine:limits(Options,Limits),
    kb_symbolic_agent_program:initial_state(Program,Engine),
    Frame=frame{engine:Engine,pending:null,turns:0},
    kb_terms:context_key(Program.agent,AgentKey),
    kb_terms:context_key(Program.definitionMt,DefinitionKey),
    kb_terms:context_key(Program.mts.stateMt,StateKey),atom_string(StateKey,StateText),
    Source=json{schema:"powder.symbolic-source.v1",knowledgeAgent:AgentKey,
      definitionMt:DefinitionKey,kbGeneration:Generation,programVersion:Program.version,
      hostVersion:"powder.symbolic-control.v1",ceilingVersion:"powder.symbolic-ceiling.v2",
      limits:json{steps:Limits.steps,actions:Limits.actions,seconds:Limits.seconds},host:Host},
    json_text(Source,SourceJSON,16384),
    kb_symbolic_agent_state:encode_cursor(Frame,StateJSON),
    control_call(Control,"kee_ledger_status",json{},"symbolic-control/status",Status),
    Args=json{revision:Status.result.domainRevisions.agent_control,
      mt:StateText,sourceJson:SourceJSON,stateJson:StateJSON},
    control_call(Control,"kee_agent_run_create",Args,CallId,Created),
    get(Control,Created.result.result.id,Reply).

get(Control,Id,Reply) :-
    control_call(Control,"kee_agent_run_get",json{id:Id},"symbolic-control/get",Raw),
    R=Raw.result.resource,Control=control(_,Owner,_),
    (R.data.owner==Owner->true;throw(error(symbolic_run_owner_mismatch,_))),
    atom_json_dict(R.data.sourceJson,Source,[]),
    kb_symbolic_agent_state:decode_cursor(R.data.stateJson,Frame),
    validate_frame(Frame),
    phase_status(Frame.engine.phase,ExpectedStatus),
    (((R.data.status=="created",Frame.engine.phase==awaiting_input);
      R.data.status==ExpectedStatus)->
        Reply=run{id:Id,revision:Raw.result.domainRevision,resource:R,source:Source,frame:Frame};
        throw(error(symbolic_cursor_status_mismatch,_))).

advance_prepared(Control,Program,Id,Input,CallId,Reply,Effects) :-
    advance_request(Control,Program,Id,Input,CallId,json{},Reply,Effects).
advance_request(Control,Program,Id,Input,CallId,Request,Reply,Effects) :-
    must_be(nonvar,Input),
    must_be(dict,Request),must_be(ground,Request),
    ((Input=action_result(_,_);Input=host_approval(_,_,_))->
      throw(error(symbolic_host_receipt_required,_));
      advance_checked(Control,Program,Id,Input,CallId,Request,Reply,Effects)).
advance_checked(Control,Program,Id,Input,CallId,Request,Reply,Effects) :-
    get(Control,Id,Before),verify_program(Program,Before),
    limits_options(Before.source.limits,Options),
    ((Before.frame.turns<1000;memberchk(Input,[stop,interrupt]))->
      advance_bounded(Control,Program,Before,Input,Options,CallId,Request,Reply,Effects);
      throw(error(symbolic_turn_limit,_))).
advance_bounded(Control,Program,Before,Input,Options,CallId,Request,Reply,Effects) :-
    (Input==resume,Before.resource.data.status=="created"->
      Engine=Before.frame.engine,Step=step_result{state:Engine,effects:[],events:[control(started)]}
    ;Input==resume,Before.frame.engine.phase==interrupted,
     is_dict(Before.frame.pending),Before.frame.pending.stage=="planned"->
      % Only the durable host marker proves no dispatch was claimed. The pure
      % engine cannot make this distinction and still refuses unresolved calls.
      Engine=Before.frame.engine.put(phase,awaiting_action),
      Step=step_result{state:Engine,effects:[],events:[control(resumed_planned_action)]}
    ;kb_symbolic_agent_engine:step(Program,Before.frame.engine,Input,Options,Step)),
    Turns is Before.frame.turns+1,
    pending_frame(Control,Before,Step,Pending,Kind,Action),
    Next=Before.frame.put(_{engine:Step.state,pending:Pending,turns:Turns}),
    event_data(Step.events,SemanticEvent),Event=SemanticEvent.put(request,Request),
    phase_status(Step.state.phase,Status),
    (Input==stop->EventKind="stop";EventKind=Kind),
    persist(Control,Before,Next,Status,EventKind,Event,Action,CallId,Reply),
    Effects=Step.effects.

% Persist the boundary before any host dispatch. A crash after this record is
% explicitly unresolved, never an invitation to execute the intent again.
mark_dispatched(Control,Id,CallId,Reply) :-
    mark_dispatched(Control,Id,CallId,json{},Reply).
mark_dispatched(Control,Id,CallId,Request,Reply) :-
    get(Control,Id,Before),Pending=Before.frame.pending,
    (is_dict(Pending),Pending.stage=="planned",
     Before.frame.engine.phase==awaiting_action->true;
       throw(error(symbolic_action_not_planned,_))),
    Next=Before.frame.put(pending,Pending.put(stage,"dispatched")),
    Action=json{tool:Pending.intent.capability,callId:Pending.callId,
      status:"dispatched",commitRevision:null},
    Event=json{kind:"dispatch",callId:Pending.callId,request:Request},
    persist(Control,Before,Next,"running","action_intent",Event,Action,CallId,Reply).

pending_frame(Control,Before,Step,Pending,"action_intent",Action) :-
    Step.effects=[Intent],!,
    string_concat(Before.id,"/",Prefix),atom_string(Intent.id,Ordinal),
    string_concat(Prefix,Ordinal,GlobalId),Control=control(_,_,Audit),
    Pending=json{intent:Intent,callId:GlobalId,audit:Audit,stage:"planned"},
    Action=json{tool:Intent.capability,callId:GlobalId,status:"planned",commitRevision:null}.
pending_frame(_,Before,_,Before.frame.pending,"transition",null).

record_outcome(Control,Program,Id,ToolReply,CallId,Reply) :-
    get(Control,Id,Before),verify_program(Program,Before),
    Pending=Before.frame.pending,
    (is_dict(Pending),ToolReply.callId==Pending.callId,
     ToolReply.tool==Pending.intent.capability->true;throw(error(symbolic_action_receipt_mismatch,_))),
    kb_symbolic_agent_kee:action_outcome(ToolReply,Outcome),
    outcome_frame(Outcome,Program,Before,Next,Status),
    (Outcome=unresolved(_)->Observed="unknown";
      ToolReply.symbolicEffect=="committed"->Observed="committed";Observed="read_complete"),
    (Observed=="committed"->Revision=ToolReply.result.revision;Revision=null),
    Action=json{tool:Pending.intent.capability,callId:Pending.callId,
                status:Observed,commitRevision:Revision},
    Event=json{kind:"action",callId:Pending.callId,capability:Pending.intent.capability,
               outcome:Observed},
    persist(Control,Before,Next,Status,"action_outcome",Event,Action,CallId,Reply).
outcome_frame(unresolved(_),_,Before,Next,Before.resource.data.status) :- !,
    Pending=Before.frame.pending.put(stage,"unknown"),Next=Before.frame.put(pending,Pending).
outcome_frame(ok(Value),Program,Before,Next,Status) :-
    limits_options(Before.source.limits,Options),
    kb_symbolic_agent_engine:step(Program,Before.frame.engine,
      action_result(Before.frame.pending.intent.id,ok(Value)),Options,Step),
    Next=Before.frame.put(_{engine:Step.state,pending:null}),
    phase_status(Step.state.phase,Status).

persist(Control,Before,Next,Status,Kind,Event,Action,CallId,Reply) :-
    validate_frame(Next),kb_symbolic_agent_state:encode_cursor(Next,StateJSON),
    json_text(Event,EventJSON,16384),
    Args=json{revision:Before.revision,id:Before.id,resourceRevision:Before.resource.revision,
      expectedEvent:Before.resource.data.eventSequence,status:Status,step:Next.engine.steps,
      stateJson:StateJSON,eventKind:Kind,eventJson:EventJSON,action:Action},
    control_call(Control,"kee_agent_run_event",Args,CallId,_),
    get(Control,Before.id,Reply).

events(Control,Id,Offset,Limit,Reply) :-
    get(Control,Id,_),
    control_call(Control,"kee_agent_run_events",json{id:Id,offset:Offset,limit:Limit},
      "symbolic-control/events",Reply).
verify_program(Program,Run) :-
    atom_string(Program.version,Version),
    kb_terms:context_key(Program.agent,Agent),atom_string(Agent,AgentText),
    kb_terms:context_key(Program.definitionMt,Mt),atom_string(Mt,MtText),
    (Run.source.schema=="powder.symbolic-source.v1",
     Run.source.hostVersion=="powder.symbolic-control.v1",
     Run.source.ceilingVersion=="powder.symbolic-ceiling.v2",
     Run.source.programVersion==Version,Run.source.knowledgeAgent==AgentText,
     Run.source.definitionMt==MtText,Run.frame.engine.program==Program.version,
     Run.frame.engine.agent==Program.agent->true;throw(error(symbolic_program_conflict,_))).
validate_frame(Frame) :-
    must_be(dict,Frame),must_be(dict,Frame.engine),must_be(integer,Frame.turns),
    dict_pairs(Frame,frame,Pairs),findall(K,member(K-_,Pairs),Keys),
    (Keys==[engine,pending,turns]->true;domain_error(symbolic_cursor_fields,Keys)),
    (between(0,1001,Frame.turns)->true;domain_error(symbolic_turn_count,Frame.turns)),
    Engine=Frame.engine,
    must_be(ground,Engine.agent-Engine.program-Engine.fsm-Engine.goals),
    must_be(list,Engine.goals),must_be(list,Engine.queue),must_be(list,Engine.compensations),
    (memberchk(Engine.phase,[awaiting_input,running,awaiting_action,awaiting_form,
      awaiting_approval,compensating,gap,failed,stopped,interrupted])->true;
      domain_error(symbolic_cursor_phase,Engine.phase)),
    must_be(integer,Engine.steps),must_be(integer,Engine.actions),
    (between(0,1024,Engine.steps),between(0,64,Engine.actions),
     memberchk(Engine.compensating,[true,false])->true;
       domain_error(symbolic_cursor_counters,Engine)),
    (Frame.pending==null->
      (Engine.pending=call(_,_)->throw(error(symbolic_missing_pending_request,_));true)
    ;is_dict(Frame.pending),ground(Frame.pending),
       memberchk(Frame.pending.stage,["planned","dispatched","unknown"]),Engine.pending=call(Id,_),
      Frame.pending.intent.id==Id->true;
      throw(error(symbolic_invalid_pending_request,_))).
limits_options(L,[steps(L.steps),actions(L.actions),seconds(L.seconds)]).
phase_status(stopped,"stopped") :- !.
phase_status(interrupted,"paused") :- !.
phase_status(failed,"failed") :- !.
phase_status(_,"running").
event_data(Events,json{kind:"semantic",cursor:Wire}) :-
    kb_symbolic_agent_state:encode_cursor(event{items:Events},Wire).
json_text(Value,Text,Maximum) :-
    kb_kee_schema:json_text(Value,Text),
    string_length(Text,N),(N=<Maximum->true;domain_error(symbolic_event_characters,N)).

control_name("kee_agent_run_create").
control_name("kee_agent_run_get").
control_name("kee_agent_run_event").
control_name("kee_agent_run_events").
control_name("kee_ledger_status").
control_call(control(Token,_,_),Name,Args,CallId,Reply) :-
    (control_name(Name)->true;domain_error(symbolic_control_operation,Name)),
    kb_kee:registry(Token,Registry),atom_string(Key,Name),
    (member(C,Registry.tools),C.name==Key,C.available==true->true;
      throw(error(symbolic_control_unavailable(Name),_))),
    once(kb_kee:invoke(Token,json{tool:Name,schemaVersion:1,callId:CallId,arguments:Args},Raw)),
    kb_symbolic_agent_kee:canonical_json(Raw,Reply).
