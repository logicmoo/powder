:- module(kb_symbolic_agent_fork,[fork_prepared/8,availability/2,history/5]).
:- use_module(kb_symbolic_agent_control,[]).
:- use_module(kb_symbolic_agent_kee,[]).
:- use_module(kb_symbolic_agent_state,[]).
:- use_module(kb_kee_auth,[]).
:- use_module(kb_kee_ledger,[]).
:- use_module(kb_kee_registry,[]).
:- use_module(kb_kee_agent_runs,[]).
:- use_module(library(http/json)).
:- use_module(library(error)).
:- use_module(library(lists)).

% Host-only operation: the actual registered create capability commits the
% copied cursor. Its agent_control CAS also guards the unchanged parent image.
fork_prepared(ParentControl,ChildControl,Program,Parent,CallId,Hash,Child,Replayed) :-
    reader(ParentControl,PP),reader(ChildControl,CP),
    owner(ParentControl,Parent),
    same_authority(PP,CP),
    must_be(string,Hash),must_be(string,CallId),
    kb_kee_ledger:snapshot(State),
    (kb_kee_ledger:call_receipt(CP,CallId,State,Receipt)->
      kb_symbolic_agent_control:get(ChildControl,Receipt.result.id,Child),
      (Child.source.host.requestHash==Hash,
       Child.source.host.lineage.parentRun==Parent.id,
       Child.source.host.lineage.parentRevision==Parent.resource.revision,
       Child.source.host.lineage.parentConversation==PP.conversation->Replayed=true;
        throw(error(symbolic_fork_request_conflict,_)))
    ;kb_symbolic_agent_control:verify_program(Program,Parent),
     kb_symbolic_agent_control:validate_frame(Parent.frame),
     availability(Parent,Available),
     (Available.allowed==true->true;throw(error(symbolic_fork_unsafe(Available.reason),_))),
     current_parent(State,Parent),
     fresh_conversation(State,CP),
     rows(State,PP,Parent.resource,[],Rows),length(Rows,HistoryCount),
     depth(Parent.source,Depth0),Depth is Depth0+1,
     Lineage=json{schema:"powder.symbolic-fork.v1",parentRun:Parent.id,
       parentConversation:PP.conversation,parentRevision:Parent.resource.revision,
       parentSourceRevision:Parent.resource.data.sourceRevision,
       parentEventSequence:Parent.resource.data.eventSequence,
       historyCount:HistoryCount,depth:Depth,
       inherited:json{steps:Parent.frame.engine.steps,actions:Parent.frame.engine.actions,
                      turns:Parent.frame.turns}},
     Host=Parent.source.host.put(_{requestHash:Hash,lineage:Lineage}),
     Source=Parent.source.put(host,Host),
     kb_symbolic_agent_control:json_text(Source,SourceJSON,16384),
     kb_symbolic_agent_state:encode_cursor(Parent.frame,Cursor),
     Args=json{revision:Parent.revision,mt:Parent.resource.mt,
               sourceJson:SourceJSON,stateJson:Cursor},
     commit_fork(ChildControl,Args,CallId,Created),
     catch(kb_symbolic_agent_control:get(ChildControl,Created.result.result.id,Child),
       Cause,throw(error(symbolic_fork_outcome_unknown(Cause),_))),
     Replayed=Created.result.replayed).

commit_fork(Control,Args,CallId,Reply) :-
    catch(kb_symbolic_agent_control:control_call(Control,"kee_agent_run_create",Args,CallId,Reply),
      Cause,(known_rejection(Cause)->throw(Cause);
        throw(error(symbolic_fork_outcome_unknown(Cause),_)))).
known_rejection(error(kee(Code,_),_)) :-
    memberchk(Code,[domain_conflict,resource_conflict,revision_conflict,ledger_busy,
      idempotence_conflict,invalid_arguments,permission_denied,mt_denied,context_expired]).

availability(Run,json{supported:true,allowed:Allowed,reason:Reason}) :-
    (unsafe(Run,Why)->Allowed=false,atom_string(Why,Reason);
      Allowed=true,Reason="Copies this input checkpoint and completed history; never replays actions.").
unsafe(R,unresolved_action) :- R.frame.pending\==null,!.
unsafe(R,input_checkpoint_required) :- R.frame.engine.phase\==awaiting_input,!.
unsafe(R,pending_continuation) :-
    E=R.frame.engine,
    (E.pending\==none;E.queue\==[];E.compensations\==[];E.compensating\==false),!.
unsafe(R,nonground_checkpoint) :- \+ground(R.frame),!.
unsafe(R,lineage_depth_limit) :- depth(R.source,D),D>=16.

depth(Source,Depth) :-
    (get_dict(lineage,Source.host,L)->
      (L.schema=="powder.symbolic-fork.v1",integer(L.depth),between(1,16,L.depth)->
        Depth=L.depth;throw(error(symbolic_fork_lineage_invalid,_)));
      Depth=0).
owner(control(_,Owner,_),Run) :-
    (Run.resource.data.owner==Owner->true;throw(error(symbolic_run_owner_mismatch,_))).
reader(control(Token,Owner,_),P) :-
    kb_kee_registry:capability(kee_agent_run_get,Capability),
    kb_kee_auth:admit(Token,Capability,P),
    (P.kind==symbolic->true;throw(error(symbolic_context_required,_))),
    (Owner==json{actor:P.actor,agent:P.agent,conversation:P.conversation}->true;
      throw(error(symbolic_run_owner_mismatch,_))).
same_authority(P,C) :-
    (P.actor==C.actor,P.agent==C.agent,P.conversation\==C.conversation,
     P.permissions==C.permissions,P.readMts==C.readMts,P.writeMts==C.writeMts,
     P.effects==C.effects->true;throw(error(symbolic_fork_authority_mismatch,_))).
current_parent(State,Parent) :-
    (kb_kee_ledger:resource(Parent.id,State,Raw),
     kb_symbolic_agent_kee:canonical_json(Raw,Current),Current==Parent.resource->true;
      throw(error(symbolic_fork_parent_conflict,_))),
    atom_json_dict(Current.data.sourceJson,Source,[]),
    kb_symbolic_agent_state:decode_cursor(Current.data.stateJson,Frame),
    (Source==Parent.source,Frame==Parent.frame->true;
      throw(error(symbolic_fork_parent_conflict,_))),
    kb_kee_ledger:domain_revision(State,agent_control,Revision),
    (Revision==Parent.revision->true;throw(error(symbolic_fork_parent_conflict,_))).
fresh_conversation(State,P) :-
    (member(R,State.resources),R.kind==agent_run,
     R.data.owner==json{actor:P.actor,agent:P.agent,conversation:P.conversation}->
      throw(error(symbolic_fork_conversation_exists,_));true).

% Completed ancestral events are immutable ledger references, not new effects
% or receipts owned by the child. Native event numbering remains untouched.
history(Control,Run,Offset,Limit,Reply) :-
    must_be(integer,Offset),must_be(integer,Limit),
    (Offset>=0,between(1,100,Limit)->true;domain_error(symbolic_history_page,Offset-Limit)),
    owner(Control,Run),reader(Control,P),kb_kee_ledger:snapshot(State),
    rows(State,P,Run.resource,[],Rows),length(Rows,Total),
    findall(Item,(nth0(N,Rows,Row),N>=Offset,N<Offset+Limit,
      (Row.origin.runId==Run.id->Inherited=false;Inherited=true),
      Item=Row.put(_{eventSequence:N,inherited:Inherited})),Items),
    Reply=json{items:Items,total:Total}.

rows(State,P,R,Seen,Rows) :-
    length(Seen,Depth),
    (Depth=<16,\+memberchk(R.id,Seen)->true;throw(error(symbolic_fork_lineage_invalid,_))),
    pinned(State,R.id,R.revision,Raw),
    kb_kee_ledger:authorize_image(P,read,Raw),
    kb_symbolic_agent_kee:canonical_json(Raw,Canonical),
    (Canonical==R->true;throw(error(symbolic_fork_history_invalid,_))),
    atom_json_dict(R.data.sourceJson,Source,[]),
    local_rows(State,R,Local),
    (get_dict(lineage,Source.host,L)->
      depth(Source,_),pinned(State,L.parentRun,L.parentRevision,ParentRaw),
      kb_symbolic_agent_kee:canonical_json(ParentRaw,Parent),
      Local=[Created|_],pinned(State,R.id,Created.resourceRevision,CreatedRaw),
      validate_lineage(R,Source,L,Parent,CreatedRaw),
      rows(State,P,Parent,[R.id|Seen],Inherited),
      length(Inherited,Count),
      (Count==L.historyCount->true;throw(error(symbolic_fork_history_invalid,_))),
      append(Inherited,Local,Rows);
      Rows=Local),
    length(Rows,N),(N=<10000->true;throw(error(symbolic_fork_history_limit,_))).

pinned(State,Id,Revision,R) :-
    (member(E,State.events),member(Entry,E.entries),Entry.key==Id,
     atom_string(Entry.after.revision,Revision),R=Entry.after->true;
      throw(error(symbolic_fork_history_unavailable,_))).
local_rows(State,R,Rows) :-
    findall(Row,(member(E,State.events),E.sequence=<R.sequence,
      member(Entry,E.entries),Entry.key==R.id,
      kb_kee_agent_runs:event_item(E,Entry,Raw),
      kb_symbolic_agent_kee:canonical_json(Raw,Item),
      Row=Item.put(origin,json{runId:R.id,conversation:R.data.owner.conversation,
        eventSequence:Item.eventSequence,resourceRevision:Item.resourceRevision,
        changeset:Item.changeset})),Rows),
    Expected is R.data.eventSequence+1,length(Rows,N),
    (N==Expected,forall(nth0(I,Rows,Row),Row.eventSequence==I),
     last(Rows,Last),Last.resourceRevision==R.revision->true;
      throw(error(symbolic_fork_history_invalid,_))).
validate_lineage(R,Source,L,Parent,Created) :-
    atom_json_dict(Parent.data.sourceJson,PS,[]),depth(PS,PD),
    Base=Source.put(host,PS.host),
    base_host(Source.host,Host),base_host(PS.host,ParentHost),
    kb_symbolic_agent_state:decode_cursor(Parent.data.stateJson,F),
    kb_symbolic_agent_state:decode_cursor(Created.data.stateJson,Initial),
    (L.parentConversation==Parent.data.owner.conversation,
     R.data.owner.actor==Parent.data.owner.actor,R.data.owner.agent==Parent.data.owner.agent,
     R.data.owner.conversation\==Parent.data.owner.conversation,
     L.parentSourceRevision==Parent.data.sourceRevision,
     L.parentEventSequence==Parent.data.eventSequence,
     L.depth=:=PD+1,Base==PS,Host==ParentHost,Initial==F,
     L.inherited.steps==F.engine.steps,L.inherited.actions==F.engine.actions,
     L.inherited.turns==F.turns,Created.data.lastEvent.kind==created->true;
      throw(error(symbolic_fork_lineage_invalid,_))).
base_host(H,Base) :-
    (del_dict(lineage,H,_,WithoutLineage)->true;WithoutLineage=H),
    (del_dict(requestHash,WithoutLineage,_,Base)->true;Base=WithoutLineage).
