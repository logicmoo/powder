:- module(kb_kee_agent_runs,[run/6]).
:- use_module(kb_kee_agent_schema,[]).
:- use_module(kb_kee_ledger,[]).
:- use_module(kb_kee_auth,[]).
:- use_module(kb_kee_registry,[]).
:- use_module(kb_kee_schema,[reject/2]).
:- use_module(kb_cache,[]).
:- use_module(library(uuid)).
:- use_module(library(lists)).

run(agent_run_get,_,P,_,Args,Reply) :- !,
    kb_kee_ledger:snapshot(State),owned_run(P,read,State,Args.id,R),
    Reply=json{revision:State.revision,resource:R}.
run(agent_run_list,_,P,_,Args,Reply) :- !,
    kb_kee_auth:canonical_mt(Args.mt,MT),kb_kee_auth:authorize_mt(P,read,MT),
    kb_kee_ledger:snapshot(State),
    findall(Summary,(member(R,State.resources),R.kind==agent_run,R.mt==MT,
      visible(P,R),run_summary(R,Summary)),Rows),
    page(Args,Rows,Items,Total),Reply=json{revision:State.revision,items:Items,total:Total}.
run(agent_run_events,_,P,_,Args,Reply) :- !,
    kb_kee_ledger:snapshot(State),owned_run(P,read,State,Args.id,_),
    findall(Item,(member(E,State.events),member(Entry,E.entries),Entry.key==Args.id,
      event_item(E,Entry,Item)),Rows),
    page(Args,Rows,Items,Total),Reply=json{revision:State.revision,items:Items,total:Total}.
run(Operation,Token,P,Request,Args,Reply) :-
    (P.kind==llm->reject(agent_control_host_only,json{});true),
    kb_kee_ledger:commit(Token,P,Request,Args.revision,
      kb_kee_agent_runs:plan(Operation,P,Request,Args),
      kb_kee_agent_runs:validate_transition,Reply).
visible(P,R) :- catch(kb_kee_ledger:authorize_image(P,read,R),error(kee(_,_),_),fail).
owned_run(P,Mode,State,Id,R) :-
    (kb_kee_ledger:resource(Id,State,R),R.kind==agent_run,R.deleted==false->true;
      reject(agent_run_not_found,json{})),
    kb_kee_ledger:authorize_image(P,Mode,R).
run_summary(R,json{id:R.id,revision:R.revision,mt:R.mt,owner:R.data.owner,
    status:R.data.status,step:R.data.step,eventSequence:R.data.eventSequence,
    sourceRevision:R.data.sourceRevision}).
event_item(E,Entry,json{changeset:E.id,revision:E.revision,time:E.time,actor:E.actor,
    resourceRevision:Entry.after.revision,eventSequence:Entry.after.data.eventSequence,
    status:Entry.after.data.status,step:Entry.after.data.step,event:Entry.after.data.lastEvent}).
page(Args,Rows,Items,Total) :-
    option(Args,offset,0,Offset),option(Args,limit,25,Limit),length(Rows,Total),
    findall(Row,(nth0(N,Rows,Row),N>=Offset,N<Offset+Limit),Items).
option(Args,Key,Default,Value) :- (get_dict(Key,Args,Value)->true;Value=Default).

plan(agent_run_create,P,Request,Args,_,[change(Id,null,resource(agent_run,MT,Data))],
    json{action:create_run,id:Id,eventSequence:0}) :-
    kb_kee_auth:canonical_mt(Args.mt,MT),
    kb_kee_agent_schema:canonical_json(Args.sourceJson,Source),
    kb_kee_agent_schema:canonical_json(Args.stateJson,State),
    kb_cache:terms_digest([kee_agent_source_v1,Source],SourceHash),atom_string(SourceHash,SourceRevision),
    uuid(UUID),atom_string(UUID,Text),string_concat("run:",Text,Id),
    Data=json{owner:json{actor:P.actor,agent:P.agent,conversation:P.conversation},
      sourceJson:Source,sourceRevision:SourceRevision,stateJson:State,status:created,
      step:0,eventSequence:0,lastEvent:json{id:Request.callId,kind:created,json:"{}",action:null}}.
plan(agent_run_event,P,Request,Args,Before,[change(Id,Expected,resource(agent_run,MT,Data))],
    json{action:record_event,id:Id,eventSequence:Sequence}) :-
    Id=Args.id,owned_run(P,write,Before,Id,R),MT=R.mt,atom_string(Expected,Args.resourceRevision),
    (Args.expectedEvent==R.data.eventSequence->true;reject(agent_event_conflict,json{})),
    (Args.step>=R.data.step->true;reject(agent_step_regression,json{})),
    allowed_transition(R.data.status,Args.status,Args.eventKind),
    kb_kee_agent_schema:canonical_json(Args.stateJson,State),
    kb_kee_agent_schema:canonical_json(Args.eventJson,EventJSON),
    validate_action(P,Request,Args,Before),
    Sequence is R.data.eventSequence+1,
    Data=R.data.put(json{stateJson:State,status:Args.status,step:Args.step,eventSequence:Sequence,
      lastEvent:json{id:Request.callId,kind:Args.eventKind,json:EventJSON,action:Args.action}}).
allowed_transition(Old,New,Kind) :-
    (memberchk(Old,[stopped,completed,failed])->
      (New==Old,memberchk(Kind,[log,action_outcome])->true;reject(agent_terminal_state,json{}))
    ;Old==created->
      (memberchk(New,[created,running,stopped,failed])->true;reject(agent_state_transition,json{}))
    ;memberchk(New,[running,paused,stopped,completed,failed])->true;
      reject(agent_state_transition,json{})),
    (Kind==stop,New\==stopped->reject(agent_state_transition,json{});true).
validate_action(_,_,Args,_) :- Args.action==null,!,
    (memberchk(Args.eventKind,[action_intent,action_outcome])->reject(action_link_required,json{});true).
validate_action(P,Request,Args,State) :-
    Action=Args.action,atom_string(Tool,Action.tool),
    (kb_kee_registry:capability(Tool,C),C.domain\==agent_control->true;
      reject(agent_action_capability,json{})),
    kb_kee_auth:authorize(P,C),
    (Request.callId==Action.callId->reject(agent_event_call_collision,json{});true),
    (Args.eventKind==action_intent->
      (memberchk(Action.status,[planned,dispatched])->true;reject(agent_action_status,json{}))
    ;Args.eventKind==action_outcome->true;reject(agent_action_event,json{})),
    (Action.status==committed->
      (kb_kee_ledger:call_receipt(P,Action.callId,State,Receipt),
       Receipt.tool==Action.tool,atom_string(Receipt.revision,Action.commitRevision)->true;
        reject(unconfirmed_action_commit,json{})),
      kb_kee_ledger:authorize_entries(P,read,Receipt.entries)
    ;Action.commitRevision==null->true;reject(agent_action_status,json{})),
    (Action.status==read_complete,C.mutation==true->reject(agent_action_status,json{});true).
validate_transition(_,Before,Entries,_) :-
    forall(member(E,Entries),validate_entry(Before,E)).
validate_entry(_,E) :- E.before==null,!,kb_kee_agent_schema:validate_record(E.after).
validate_entry(_,E) :-
    Old=E.before,New=E.after,
    (Old.kind==agent_run,New.kind==agent_run,Old.mt==New.mt,
     Old.data.owner==New.data.owner,Old.data.sourceJson==New.data.sourceJson,
     Old.data.sourceRevision==New.data.sourceRevision->true;reject(agent_identity_immutable,json{})),
    kb_kee_agent_schema:validate_record(New).
