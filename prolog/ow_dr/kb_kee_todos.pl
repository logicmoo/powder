:- module(kb_kee_todos,[run/6,validate_transition/4]).
:- use_module(kb_kee_ledger,[]).
:- use_module(kb_kee_auth,[]).
:- use_module(kb_kee_schema,[reject/2]).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(assoc)).
:- use_module(library(ugraphs)).
:- use_module(library(uuid)).

run(ledger_status,_,_,_,_,Reply) :- !,
    kb_kee_ledger:snapshot(State),length(State.resources,Count),
    kb_kee_ledger:domain_revision(State,application_todo,TodoRevision),
    kb_kee_ledger:domain_revision(State,agent_control,AgentRevision),
    Reply=json{revision:State.revision,sequence:State.sequence,resources:Count,changesets:State.sequence,
      domainRevisions:json{application_todo:TodoRevision,agent_control:AgentRevision}}.
run(ledger_call_status,_,P,_,Args,Reply) :- !,
    kb_kee_ledger:snapshot(State),
    (kb_kee_ledger:call_receipt(P,Args.callId,State,Event)->
      kb_kee_ledger:authorize_entries(P,read,Event.entries),
      Commit=json{revision:Event.revision,changeset:Event.id,sequence:Event.sequence,
        tool:Event.tool,requestHash:Event.requestHash,actor:Event.actor,result:Event.result},
      Status=committed
    ;Commit=null,Status=unknown),
    Reply=json{status:Status,callId:Args.callId,revision:State.revision,commit:Commit}.
run(todo_get,_,P,_,Args,Reply) :- !,
    kb_kee_ledger:snapshot(State),active_resource(State,Args.id,Resource),
    kb_kee_auth:authorize_mt(P,read,Resource.mt),
    kb_kee_ledger:domain_revision(State,application_todo,DomainRevision),
    Reply=json{revision:State.revision,domainRevision:DomainRevision,resource:Resource}.
run(todo_list,_,P,_,Args,Reply) :- !,
    kb_kee_ledger:snapshot(State),mt_key(Args.mt,MT),kb_kee_auth:authorize_mt(P,read,MT),
    findall(Key-R,(member(R,State.resources),R.kind==todo,R.deleted==false,R.mt==MT,
      matches_status(Args,R),Priority is -R.data.priority,Key=Priority-R.id),Pairs),
    keysort(Pairs,Sorted),pairs_values(Sorted,Rows),page(Args,Rows,Page,Total),
    kb_kee_ledger:domain_revision(State,application_todo,DomainRevision),
    Reply=json{revision:State.revision,domainRevision:DomainRevision,items:Page,total:Total}.
run(ledger_audit,_,P,_,Args,Reply) :- !,
    kb_kee_ledger:snapshot(State),mt_key(Args.mt,MT),kb_kee_auth:authorize_mt(P,read,MT),
    reverse(State.events,Events),
    include(visible_event(P,MT),Events,Rows),page(Args,Rows,Page,Total),
    Reply=json{revision:State.revision,items:Page,total:Total}.
run(Operation,Token,P,Request,Args,Reply) :-
    kb_kee_ledger:commit(Token,P,Request,scoped(application_todo,Args.revision),
      kb_kee_todos:plan(Operation,P,Args),kb_kee_todos:validate_transition,Reply).

mt_key(null,null) :- !.
mt_key(Input,MT) :- kb_kee_auth:canonical_mt(Input,MT).
matches_status(Args,R) :- (get_dict(status,Args,Status)->R.data.status==Status;true).
active_resource(State,Id,Resource) :-
    (kb_kee_ledger:resource(Id,State,Resource),Resource.deleted==false,Resource.kind==todo->true;
      reject(resource_not_found,json{})).
page(Args,Rows,Page,Total) :-
    option(Args,offset,0,Offset),option(Args,limit,25,Limit),length(Rows,Total),
    findall(Row,(nth0(N,Rows,Row),N>=Offset,N<Offset+Limit),Page).
option(Args,Key,Default,Value) :- (get_dict(Key,Args,Value)->true;Value=Default).
visible_event(P,MT,E) :-
    member(Entry,E.entries),(image_mt(Entry.before,MT);image_mt(Entry.after,MT)),!,
    catch(kb_kee_ledger:authorize_entries(P,read,E.entries),error(kee(_,_),_),fail).
image_mt(Image,MT) :- is_dict(Image),Image.mt==MT.

plan(todo_create,P,Args,_,[change(Id,null,resource(todo,MT,Data))],json{id:Id,action:create}) :-
    uuid(UUID),atom_string(UUID,Text),string_concat("todo:",Text,Id),
    mt_key(Args.mt,MT),todo_data(P,Args.data,Data).
plan(todo_update,P,Args,State,[change(Id,Expected,resource(todo,MT,Data))],json{id:Id,action:update}) :-
    Id=Args.id,active_resource(State,Id,_),atom_string(Expected,Args.resourceRevision),
    mt_key(Args.mt,MT),todo_data(P,Args.data,Data).
plan(todo_delete,_,Args,State,[change(Id,Expected,null)],json{id:Id,action:delete}) :-
    Id=Args.id,active_resource(State,Id,_),atom_string(Expected,Args.resourceRevision).
plan(ledger_undo,P,Args,State,Changes,json{action:undo,undoOf:Args.changeset}) :-
    undo_authority(P,State,Args.changeset),
    kb_kee_ledger:inverse(State,Args.changeset,Changes,_).
plan(ledger_redo,P,Args,State,Changes,json{action:redo,redoOf:Args.changeset}) :-
    undo_authority(P,State,Args.changeset),
    kb_kee_ledger:inverse(State,Args.changeset,Changes,Original),
    (Original.tool=="kee_undo"->true;reject(not_an_undo_changeset,json{})).
undo_authority(P,State,Id) :-
    (kb_kee_ledger:event(Id,State,E)->true;reject(changeset_not_found,json{})),
    kb_kee_ledger:authorize_entries(P,write,E.entries),
    (forall(member(Entry,E.entries),Entry.after.kind==todo)->true;
      reject(non_undoable_resource_kind,json{})).
todo_data(P,Input,Data) :-
    (Input.status==done->
      (P.kind==user,Input.acceptance\==[],Input.evidence\==[]->true;
        reject(completion_requires_user_attestation,json{})),
      get_time(Time),Completion=json{kind:user_attestation,actor:P.actor,conversation:P.conversation,time:Time}
    ;Completion=null),
    Data=Input.put(completion,Completion).
validate_transition(P,_,Entries,State) :-
    forall(member(Entry,Entries),validate_changed(P,Entry.after,State)),
    findall(Id-R,(member(R,State.resources),R.kind==todo,Id=R.id),Pairs),list_to_assoc(Pairs,Map),
    forall((member(R,State.resources),R.kind==todo,R.deleted==false),validate_dependencies(Map,R)),
    findall(Id,(member(R,State.resources),R.kind==todo,R.deleted==false,Id=R.id),Vertices),
    findall(Id-Dep,(member(R,State.resources),R.kind==todo,R.deleted==false,Id=R.id,member(Dep,R.data.dependencies)),Edges),
    vertices_edges_to_ugraph(Vertices,Edges,Graph),
    (top_sort(Graph,_)->true;reject(todo_dependency_cycle,json{})).
validate_changed(P,R,State) :-
    (R.deleted==true->true;
      (R.data.status==done,P.kind\==user->reject(completion_requires_user_attestation,json{});true),
      forall(member(Id,R.data.dependencies),
        (active_resource(State,Id,Dep),kb_kee_auth:authorize_mt(P,read,Dep.mt)))).
validate_dependencies(Map,R) :-
    Deps=R.data.dependencies,sort(Deps,Unique),
    (same_length(Deps,Unique)->true;reject(duplicate_dependency,json{})),
    forall(member(Id,Deps),
      (get_assoc(Id,Map,Dep),Dep.deleted==false->
        (R.data.status==done,Dep.data.status\==done->reject(incomplete_dependency,json{});true)
      ;reject(todo_dependency_missing,json{}))).
