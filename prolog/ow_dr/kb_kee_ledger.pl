:- module(kb_kee_ledger,[snapshot/1,resource/3,event/3,commit/7,inverse/4,call_receipt/4,domain_revision/3]).
:- use_module(kb_cache,[]).
:- use_module(kb_paths,[]).
:- use_module(kb_activity,[]).
:- use_module(kb_kee_auth,[]).
:- use_module(kb_kee_todo_schema,[]).
:- use_module(kb_kee_agent_schema,[]).
:- use_module(kb_kee_schema,[reject/2,json_size/2]).
:- use_module(library(assoc)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(uuid)).
:- meta_predicate commit(+,+,+,+,3,4,-).

ledger_path(Path) :-
    (getenv('POWDER_KEE_STATE_DIR',Input),Input\==''->
      absolute_file_name(Input,Directory,[access(none)])
    ;kb_paths:app_dir(App),directory_file_path(App,'.logos-state',State),
      directory_file_path(State,kee,Directory)),
    directory_file_path(Directory,'ledger.pl',Path).
empty_revision(Revision) :- kb_cache:terms_digest([powder_kee_ledger(1)],Revision).
snapshot(State) :- ledger_path(Path),read_snapshot(Path,State).
read_snapshot(Path,State) :-
    (exists_file(Path)->
      size_file(Path,Size),(Size=<33554432->true;reject(ledger_capacity,json{})),
      catch(setup_call_cleanup(open(Path,read,S,[encoding(utf8)]),
        read_state(S,State),close(S)),Error,read_error(Error))
    ;empty_revision(Revision),
      State=ledger{schema:1,sequence:0,revision:Revision,events:[],resources:[]}).
read_error(error(kee(Code,Details),Context)) :- !,throw(error(kee(Code,Details),Context)).
read_error(_) :- reject(ledger_corrupt,json{reason:invalid_data}).
read_state(S,State) :-
    data_term(S,Header),
    (Header=kee_header(1,Count,Revision),integer(Count),between(0,10000,Count),atom(Revision)->true;
      reject(ledger_corrupt,json{reason:header})),
    read_events(Count,S,Events),data_term(S,Footer),data_term(S,End),
    (Footer==kee_footer(Revision),End==end_of_file->true;reject(ledger_corrupt,json{reason:footer})),
    events_state(Events,State),
    (State.sequence==Count,State.revision==Revision->true;reject(ledger_corrupt,json{reason:identity})).
data_term(S,Term) :-
    read_term(S,Term,[syntax_errors(error),double_quotes(string),cycles(false),quasi_quotations(Q)]),
    (ground(Term),acyclic_term(Term),Q==[]->true;reject(ledger_corrupt,json{reason:nonground_or_quotation})).
read_events(0,_,[]) :- !.
read_events(N,S,[Event|Rest]) :-
    data_term(S,Term),(Term=kee_event(Event)->true;reject(ledger_corrupt,json{reason:event})),
    Next is N-1,read_events(Next,S,Rest).
events_state(Events,State) :-
    empty_assoc(Resources),empty_assoc(Calls),empty_assoc(Ids),empty_revision(Zero),
    foldl(check_event,Events,scan(0,Zero,Resources,Calls,Ids),scan(N,Head,Final,_,_)),
    assoc_to_values(Final,Rows),
    State=ledger{schema:1,sequence:N,revision:Head,events:Events,resources:Rows}.
check_event(E,scan(N,Previous,Rows0,Calls0,Ids0),scan(Next,E.revision,Rows,Calls,Ids)) :-
    exact_object(E,[actor,callId,callKey,entries,id,parent,requestHash,result,revision,schemaVersion,sequence,time,tool]),
    Next is N+1,
    (E.schemaVersion==1,E.sequence==Next,E.parent==Previous,string(E.id),
     string(E.tool),string(E.callId),number(E.time),atom(E.callKey),atom(E.requestHash),
     is_list(E.entries),E.entries\==[],is_dict(E.actor),is_dict(E.result)->true;
      reject(ledger_corrupt,json{reason:event_fields})),
    event_revision(E,Expected),
    (Expected==E.revision->true;reject(ledger_corrupt,json{reason:event_digest})),
    validate_actor(E.actor),
    kb_cache:terms_digest([E.actor.actor,E.actor.agent,E.actor.conversation,E.callId],CallKey),
    (CallKey==E.callKey->true;reject(ledger_corrupt,json{reason:call_identity})),
    ((get_assoc(E.callKey,Calls0,_);get_assoc(E.id,Ids0,_))->
      reject(ledger_corrupt,json{reason:duplicate_identity});true),
    put_assoc(E.callKey,Calls0,true,Calls),put_assoc(E.id,Ids0,true,Ids),
    apply_entries(E.entries,Next,Rows0,Rows).
event_revision(Event,Revision) :-
    (del_dict(revision,Event,_,Body)->true;Body=Event),
    kb_cache:terms_digest([kee_event_v1,Body],Revision).
exact_object(Value,Keys) :-
    (ground(Value),acyclic_term(Value),is_dict(Value,json),safe_data(Value),
     dict_pairs(Value,_,Pairs),pairs_keys(Pairs,Found),sort(Keys,Found)->true;
      reject(ledger_corrupt,json{reason:object_schema})).
safe_data(Value) :-
    (string(Value);integer(Value)),!.
safe_data(Value) :-
    (float(Value)->float_class(Value,C),memberchk(C,[zero,subnormal,normal])
    ;is_dict(Value,json)->dict_pairs(Value,_,Pairs),maplist(safe_pair,Pairs)
    ;is_list(Value)->maplist(safe_data,Value)
    ;atom(Value),blob(Value,text)).
safe_pair(Key-Value) :- atom(Key),safe_data(Value).
resource(Id,State,Resource) :- member(Resource,State.resources),Resource.id==Id,!.
event(Id,State,Event) :- member(Event,State.events),Event.id==Id,!.
call_receipt(Principal,CallId,State,Event) :-
    call_key(Principal,CallId,Key),member(Event,State.events),Event.callKey==Key,!.
call_key(P,CallId,Key) :-
    kb_cache:terms_digest([P.actor,P.agent,P.conversation,CallId],Key).
domain_kind(application_todo,todo).
domain_kind(agent_control,agent_run).
domain_revision(State,Domain,Token) :-
    domain_kind(Domain,Kind),
    foldl(last_domain_sequence(Kind),State.resources,0,Sequence),
    (Sequence==0->kb_cache:terms_digest([kee_domain_v1,Domain],Head);
      nth1(Sequence,State.events,Event),Head=Event.revision),
    format(string(Token),'kee:~w:~w',[Domain,Head]).
last_domain_sequence(Kind,R,Previous,Sequence) :-
    (R.kind==Kind->Sequence is max(Previous,R.sequence);Sequence=Previous).
resource_revision(Record,Revision) :-
    (del_dict(revision,Record,_,Body)->true;Body=Record),
    kb_cache:terms_digest([kee_resource_v1,Body],Revision).
apply_entries(Entries,Sequence,Rows0,Rows) :-
    findall(Key,(member(E,Entries),get_dict(key,E,Key)),Keys),sort(Keys,Unique),
    (same_length(Keys,Unique)->true;reject(ledger_corrupt,json{reason:duplicate_resource})),
    foldl(apply_entry(Sequence),Entries,Rows0,Rows).
apply_entry(Sequence,Entry,Rows0,Rows) :-
    exact_object(Entry,[key,before,after]),Key=Entry.key,
    (string(Key),get_assoc(Key,Rows0,Current)->true;Current=null),
    (Current==Entry.before->true;reject(ledger_corrupt,json{reason:before_image})),
    After=Entry.after,exact_object(After,[id,kind,mt,revision,sequence,deleted,data]),
    (After.id==Key,After.sequence==Sequence,memberchk(After.kind,[todo,agent_run]),
     memberchk(After.deleted,[true,false]),(After.mt==null;atom(After.mt))->true;
      reject(ledger_corrupt,json{reason:resource_fields})),
    validate_domain_record(After),
    resource_revision(After,Expected),
    (Expected==After.revision->true;reject(ledger_corrupt,json{reason:resource_digest})),
    put_assoc(Key,Rows0,After,Rows).
validate_domain_record(R) :-
    (R.kind==todo->validate_todo(R);
      kb_kee_agent_schema:validate_record(R)).
validate_actor(Actor) :-
    Spec=obj([req(actor,str(1,256)),req(kind,enum([user,llm,symbolic])),req(agent,str(1,256)),
      req(conversation,str(1,256)),req(model,nullable(str(1,256))),
      req(promptVersion,nullable(str(1,256))),req(promptHash,nullable(str(1,256))),
      req(policyVersion,str(1,256))]),
    stored(Spec,Actor).
stored(Spec,Data) :-
    (catch(kb_kee_schema:validate_stored(Spec,Data),_,fail)->true;
      reject(ledger_corrupt,json{reason:stored_schema})).
validate_todo(R) :-
    (string(R.id),sub_string(R.id,0,5,_,"todo:")->true;reject(ledger_corrupt,json{reason:resource_id})),
    (R.mt==null->true;
      (catch(kb_kee_auth:canonical_mt(R.mt,Canonical),_,fail),Canonical==R.mt->true;
        reject(ledger_corrupt,json{reason:resource_mt}))),
    (R.deleted==true->
      (R.data==null->true;reject(ledger_corrupt,json{reason:deleted_data}))
    ;(is_dict(R.data,json),del_dict(completion,R.data,Completion,Base)->true;
        reject(ledger_corrupt,json{reason:todo_data})),
      kb_kee_todo_schema:data_spec(Spec),stored(Spec,Base),
      (Base.status==done->
        stored(obj([req(kind,enum([user_attestation])),req(actor,str(1,256)),
          req(conversation,str(1,256)),req(time,num(0,1.0e15))]),Completion),
        (Base.evidence\==[],Base.acceptance\==[]->true;reject(ledger_corrupt,json{reason:completion}))
      ;Completion==null->true;reject(ledger_corrupt,json{reason:completion}))).

% Only trusted compiled adapters supply these closures; no tool accepts a goal.
commit(Token,Principal,Request,Expected,Planner,Validator,Reply) :-
    kb_activity:with_application(kb_kee_ledger:guarded_commit(
      Token,Principal,Request,Expected,Planner,Validator,Reply)).
guarded_commit(Token,P,Request,Expected,Planner,Validator,Reply) :-
    with_mutex(powder_kee_ledger,kb_kee_ledger:locked_commit(
      Token,P,Request,Expected,Planner,Validator,Reply)).
locked_commit(Token,P,Request,Expected,Planner,Validator,Reply) :-
    ledger_path(Path),file_directory_name(Path,Directory),make_directory_path(Directory),
    atom_concat(Path,'.lock',LockPath),kb_cache:try_lock(LockPath,Lock),
    (Lock==busy->reject(ledger_busy,json{});true),
    setup_call_cleanup(true,
      commit_owned(Token,P,Request,Expected,Planner,Validator,Path,Reply),
      kb_cache:release_lock(Lock)).
commit_owned(Token,P,Request,Expected,Planner,Validator,Path,Reply) :-
    cleanup_stages(Path),read_snapshot(Path,Before),actor(P,Actor),
    call_key(P,Request.callId,CallKey),
    kb_cache:terms_digest([Request,Actor],RequestHash),
    (member(Old,Before.events),Old.callKey==CallKey->
      (Old.requestHash==RequestHash->true;reject(idempotency_conflict,json{})),
      authorize_entries(P,write,Old.entries),reply(Old,Before.revision,true,Reply)
    ;check_revision(Expected,Before),
      kb_kee_auth:reserve_mutation(Token),
      call(Planner,Before,Changes,Payload),
      (ground(Payload),is_dict(Payload,json),safe_data(Payload),is_list(Changes),
       Changes\==[],length(Changes,Count),Count=<100->true;reject(invalid_changeset,json{})),
      Sequence is Before.sequence+1,
      (Sequence=<10000->true;reject(ledger_capacity,json{})),
      maplist(make_entry(Before,Sequence),Changes,Entries),
      check_domain_entries(Expected,Entries),authorize_entries(P,write,Entries),
      uuid(UUID),atom_string(UUID,Id),get_time(Time),
      Draft=json{id:Id,schemaVersion:1,sequence:Sequence,parent:Before.revision,
        callId:Request.callId,callKey:CallKey,requestHash:RequestHash,actor:Actor,tool:Request.tool,time:Time,
        entries:Entries,result:Payload},
      event_revision(Draft,Revision),Event=Draft.put(revision,Revision),
      append(Before.events,[Event],Events),events_state(Events,After),
      call(Validator,P,Before,Entries,After),reply(Event,Revision,false,Reply),
      json_size(Reply,Bytes),Available is P.budgets.resultBytes-1024,
      (Bytes=<Available->true;reject(result_budget,json{})),
      stage_commit(Token,P,Path,After)).
same_revision(Expected,Actual) :-
    (atom_string(Actual,Expected)->true;reject(ledger_conflict,json{actual:Actual})).
check_revision(scoped(Domain,Expected),State) :- !,
    (sub_string(Expected,0,4,_,"kee:")->
      format(string(Prefix),'kee:~w:',[Domain]),
      (string_concat(Prefix,_,Expected)->true;reject(domain_revision_scope,json{domain:Domain})),
      domain_revision(State,Domain,Actual),
      (Expected==Actual->true;reject(domain_conflict,json{domain:Domain,actual:Actual}))
    ;same_revision(Expected,State.revision)).
check_revision(Expected,State) :- same_revision(Expected,State.revision).
check_domain_entries(scoped(Domain,_),Entries) :- !,
    domain_kind(Domain,Kind),
    (forall(member(E,Entries),
      (E.after.kind==Kind,(E.before==null;E.before.kind==Kind)))->true;
      reject(invalid_changeset,json{reason:domain_mismatch})).
check_domain_entries(_,_).
actor(P,json{actor:P.actor,kind:P.kind,agent:P.agent,conversation:P.conversation,
    model:P.model,promptVersion:P.promptVersion,promptHash:P.promptHash,policyVersion:P.policyVersion}).
make_entry(State,Sequence,change(Key,Expected,Desired),json{key:Key,before:Before,after:After}) :-
    (resource(Key,State,Before)->true;Before=null),
    (Before==null->Current=null;Current=Before.revision),
    (Expected==Current->true;reject(resource_conflict,json{key:Key})),
    (Desired==null->
      (Before==null->reject(resource_not_found,json{});true),
      Kind=Before.kind,MT=Before.mt,Data=null,Deleted=true
    ;Desired=resource(Kind,MT,Data),Deleted=false),
    Draft=json{id:Key,kind:Kind,mt:MT,sequence:Sequence,deleted:Deleted,data:Data},
    resource_revision(Draft,Revision),After=Draft.put(revision,Revision).
authorize_entries(P,Mode,Entries) :-
    forall(member(Entry,Entries),
      (authorize_image(P,Mode,Entry.before),authorize_image(P,Mode,Entry.after))).
authorize_image(_,_,null) :- !.
authorize_image(P,Mode,Image) :-
    kb_kee_auth:authorize_mt(P,Mode,Image.mt),
    (Image.kind==agent_run->
      Owner=Image.data.owner,
      (P.actor==Owner.actor,P.agent==Owner.agent->true
      ;Mode==read,memberchk('agent.run.inspect_all',P.permissions)->true
      ;reject(agent_owner_denied,json{}))
    ;true).
reply(Event,Current,Replayed,json{committed:true,replayed:Replayed,
    revision:Event.revision,currentRevision:Current,changeset:Event.id,sequence:Event.sequence,result:Event.result}).
stage_commit(Token,P,Path,State) :-
    kb_cache:stage_path(Path,Stage),
    setup_call_cleanup(true,
      (setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
         (write_state(S,State),flush_output(S)),close(S)),
       read_snapshot(Stage,Validated),
       (Validated==State->true;reject(ledger_corrupt,json{reason:stage_validation})),
       kb_kee_auth:commit_guard(Token,P,kb_kee_ledger:publish(Stage,Path))),
      kb_cache:remove_if_exists(Stage)).
publish(Stage,Path) :- kb_cache:install_stage(Stage,Path).
cleanup_stages(Path) :-
    file_directory_name(Path,Directory),file_base_name(Path,Base),atom_concat(Base,'.stage.',Prefix),
    directory_files(Directory,Names),
    forall((member(Name,Names),atom_concat(Prefix,UUID,Name),stage_uuid(UUID)),
      (directory_file_path(Directory,Name,Stage),kb_cache:remove_if_exists(Stage))).
stage_uuid(UUID) :-
    atomic_list_concat(Parts,'-',UUID),maplist(atom_length,Parts,[8,4,4,4,12]),
    atom_codes(UUID,Codes),
    forall(member(Code,Codes),(Code==45;between(48,57,Code);between(97,102,Code))).
write_state(S,State) :-
    kb_cache:write_one_line(S,kee_header(1,State.sequence,State.revision)),
    forall(member(Event,State.events),kb_cache:write_one_line(S,kee_event(Event))),
    kb_cache:write_one_line(S,kee_footer(State.revision)).
inverse(State,Id,Changes,Event) :-
    (event(Id,State,Event)->true;reject(changeset_not_found,json{})),
    maplist(inverse_entry(State),Event.entries,Changes).
inverse_entry(State,Entry,change(Key,Revision,Desired)) :-
    (resource(Entry.key,State,Current),Current.revision==Entry.after.revision->true;
      reject(undo_conflict,json{key:Entry.key})),
    After=Entry.after,Before=Entry.before,Key=Entry.key,Revision=After.revision,
    (Before==null->Desired=null
    ;Before.deleted==true->Desired=null
    ;Desired=resource(Before.kind,Before.mt,Before.data)).
