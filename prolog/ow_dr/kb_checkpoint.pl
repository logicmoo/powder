:- module(kb_checkpoint,
          [start_managed_instance/2, stop_managed_instance/0, checkpoint_instance/1,
           try_checkpoint/3, promote_checkpoint/3, checkpoint_status/2,
           await_checkpoint/3, cancel_checkpoint/2, candidate_entry/2,
           snapshot_safe/0, control_call/5, checkpoint_identity_http/1,
           runtime_hook/3, launch_hook/4, process_hook/4, checkpoint_runs/1,
           checkpoint_read_only/0]).
:- use_module(kb_paths).
:- use_module(kb_store, []).
:- use_module(kb_checkpoint_policy, []).
:- use_module(kb_checkpoint_mode, []).
:- use_module(kb_checkpoint_ipc, []).
:- use_module(kb_urls, [app_base/1]).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_open)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/json)).
:- use_module(library(lists)).
:- use_module(library(process)).
:- use_module(library(readutil)).
:- use_module(library(sgml)).
:- use_module(library(time)).
:- use_module(library(uri)).
:- use_module(library(uuid)).
:- dynamic instance/1, control_secret/1, control_replay/4, run/3, peer/2.
:- dynamic candidate_context/1, candidate_lease/1, adopted/2, transition_thread/2.
:- dynamic old_lease/2.
:- dynamic candidate_starting/0.
:- volatile instance/1, control_secret/1, control_replay/4, run/3, peer/2,
            candidate_context/1, candidate_lease/1, adopted/2, transition_thread/2, old_lease/2,
            candidate_starting/0.
:- multifile runtime_hook/3, launch_hook/4, process_hook/4, kb_saved_state:checkpoint_stamp/1.

% Hooks are trusted application integration, never clauses supplied over HTTP.
host(Action,Input,Output) :-
    (once(runtime_hook(Action,Input,Output))->true;
      throw(error(checkpoint_runtime_hook_missing_or_failed(Action),_))).
owned_process(Action,PID,Options,Result) :-
    (clause(process_hook(_,_,_,_),_)->
     (once(process_hook(Action,PID,Options,Result))->true;
       throw(error(checkpoint_process_hook_failed(Action,PID),_)));
     default_process(Action,PID,Options,Result)).
default_process(wait,PID,Seconds,Result) :- process_wait(PID,Result,[timeout(Seconds)]).
default_process(terminate,PID,_,done) :- process_kill(PID,term).
default_process(release,_,_,done).
snapshot_safe :-
    kb_checkpoint_ipc:snapshot_safe,
    ((instance(_);run(_,_,_);candidate_context(_);candidate_starting;transition_thread(_,_))->
      throw(error(checkpoint_runtime_is_not_savable,_));true).
kb_saved_state:checkpoint_stamp(Stamp) :-
    kb_checkpoint:instance(I),
    kb_checkpoint:owned_profiles(Profiles),
    Base=checkpoint{instance:I.id,primary:I.primary,profiles:Profiles},
    (once(kb_checkpoint:runtime_hook(configuration,none,Configuration))->
      Stamp=Base.put(runtime,Configuration);Stamp=Base).

start_managed_instance(Primary,Credentials) :-
    kb_checkpoint_policy:require_checkpoint_execution(control_listener),
    kb_checkpoint_mode:require_serving,
    must_be(integer,Primary),between(1,65535,Primary),
    with_mutex(powder_checkpoint_instance,
      (instance(_)->throw(error(checkpoint_instance_already_started,_));
       uuid(Id),secret(Token),
      run_directory(Id,Directory),file_directory_name(Directory,Parent),
      make_directory_path(Parent),kb_checkpoint_ipc:private_directory(Directory),
      start_instance_control(Id,Primary,active,Token,Directory,Credentials))).
start_instance_control(Id,Primary,Role,Token,Directory,Credentials) :-
    directory_file_path(Directory,ipc,Mailbox),
    kb_checkpoint_ipc:private_directory(Mailbox),
    assertz(instance(instance{id:Id,primary:Primary,control:Mailbox,role:Role})),
    assertz(control_secret(Token)),
    kb_checkpoint_ipc:start_server(Mailbox,kb_checkpoint:control_command,Thread),
    assertz(control_worker(Thread)),
    Credentials=credentials{instance:Id,mailbox:Mailbox,token:Token}.
:- dynamic control_worker/1.
:- volatile control_worker/1.
control_command(Command,Reply) :-
    with_mutex(powder_checkpoint_control,authenticated_command(Command,Reply)).
stop_managed_instance :-
    with_mutex(powder_checkpoint_instance,
      (instance(I)->
        (retract(control_worker(Thread))->kb_checkpoint_ipc:stop_server(Thread);true),
        retractall(instance(_)),
        (exists_directory(I.control)->delete_directory_and_contents(I.control);true),
        retractall(control_secret(_)),retractall(control_replay(_,_,_,_))
      ;true)).
checkpoint_instance(Info) :-
    instance(I),owned_profiles(Profiles),kb_store:status(Status),
    (candidate_context(C)->Checkpoint=C.checkpoint,Run=C.run;
      Checkpoint=none,Run=none),
    Info=instance{id:I.id,role:I.role,primary:I.primary,profiles:Profiles,
      checkpoint:Checkpoint,run:Run,generation:Status.generation,counts:Status.counts}.
checkpoint_read_only :-
    (kb_checkpoint_mode:nonserving;candidate_starting;candidate_lease(_);
     instance(I),memberchk(I.role,[candidate,promoting,retired])), !.
checkpoint_runs(Runs) :-
    with_mutex(powder_checkpoint_data,
      (findall(Id-Data,run(Id,Data,_),Owned),
       findall(Id-Data,(adopted(Id,Data),\+memberchk(Id-_,Owned)),Adopted),
       append(Owned,Adopted,All),keysort(All,Sorted),
       findall(Data,member(_-Data,Sorted),Runs))).
checkpoint_identity_http(Request) :-
    http_parameters(Request,[nonce(Nonce,[atom])]),
    atom_length(Nonce,Length),between(1,100,Length),
    checkpoint_instance(Info),reply_json_dict(Info.put(nonce,Nonce)).

owned_profiles(Profiles) :-
    host(profiles,none,Found),must_be(list,Found),maplist(valid_profile,Found),
    sort(Found,Profiles),
    findall(P,(member(F,Profiles),P=F.port),Ports),sort(Ports,Unique),
    (same_length(Ports,Unique)->true;throw(error(checkpoint_duplicate_ports,_))).
valid_profile(P) :-
    must_be(dict,P),must_be(integer,P.port),between(1,65535,P.port),
    must_be(integer,P.workers),between(1,128,P.workers).
secret(Token) :-
    crypto_n_random_bytes(32,Bytes),
    crypto_data_hash(Bytes,Token,[algorithm(sha256),encoding(octet)]).
text_atom(Text,Atom) :- (atom(Text)->Atom=Text;atom_string(Atom,Text)).
json_hash(Term,Hash) :-
    atom_json_dict(Text,Term,[as(atom),width(0)]),
    crypto_data_hash(Text,Hash,[algorithm(sha256),encoding(utf8)]).
same_json(A,B) :- json_hash(A,HA),json_hash(B,HB),HA==HB.

authenticated_command(Command,Reply) :-
    must_be(dict,Command),instance(I),
    (text_atom(Command.instance,I.id)->true;
      throw(error(permission_error(access,checkpoint_control,instance),_))),
    text_atom(Command.request,RequestId),text_atom(Command.token,Token),
    json_hash(Command,Fingerprint),
    (control_replay(RequestId,Token,Fingerprint,Previous)->Reply=Previous
    ;control_replay(RequestId,_,_,_)->
      throw(error(permission_error(reuse,checkpoint_request,RequestId),_))
    ;control_secret(Expected),Token==Expected->
      secret(Next),retractall(control_secret(_)),assertz(control_secret(Next)),
      catch((permitted_control_action(I.role,Command.action),
             control_action(Command.action,Command.payload,Result)->Outcome=ok(Result);
             throw(error(checkpoint_control_failed,_))),Error,
        (message_to_string(Error,Message),Outcome=error(Message))),
      (Outcome=ok(Value)->Reply=reply{ok:true,result:Value,token:Next,instance:I.id,request:RequestId};
       Outcome=error(Message)->Reply=reply{ok:false,error:Message,token:Next,instance:I.id,request:RequestId}),
      assertz(control_replay(RequestId,Token,Fingerprint,Reply)),
      prune_replays
    ;throw(error(permission_error(access,checkpoint_control,identity_or_capability),_))).
permitted_control_action(Role,Action) :-
    (Role==candidate->Allowed=[proof,query,prepare,bind,unbind,stop]
    ;Role==promoting->Allowed=[proof,commit,unbind,stop]
    ;Role==active->Allowed=[proof,commit,activate,unbind,stop,trial,promote,status,cancel,save,candidate]
    ;Role==retired->Allowed=[status]
    ;domain_error(checkpoint_role,Role)),
    (memberchk(Action,Allowed)->true;
     throw(error(permission_error(execute,checkpoint_control,Action),_))).
prune_replays :-
    findall(Id,control_replay(Id,_,_,_),Ids),length(Ids,N),
    (N>128->Ids=[Old|_],retractall(control_replay(Old,_,_,_));true).

control_call(Credentials,Action,Payload,Updated,Reply) :-
    uuid(RequestId),
    Command=command{instance:Credentials.instance,token:Credentials.token,
      request:RequestId,action:Action,payload:Payload},
    kb_checkpoint_ipc:request(Credentials.mailbox,Command,Response),
    text_atom(Response.instance,Credentials.instance),
    text_atom(Response.request,RequestId),text_atom(Response.token,Next),
    Updated=Credentials.put(token,Next),Reply=Response.
peer_action(Run,Action,Payload,Result) :-
    atom_concat(checkpoint_peer_,Run,Mutex),
    with_mutex(Mutex,
      (peer(Run,Before),control_call(Before,Action,Payload,After,Reply),
       retractall(peer(Run,_)),assertz(peer(Run,After)),
       (Reply.ok==true->Result=Reply.result;
        throw(error(checkpoint_peer_failed(Action,Reply.error),_))))).
local_url(Port,Path,URL) :-
    must_be(integer,Port),between(1,65535,Port),
    format(atom(URL),'http://127.0.0.1:~d~w',[Port,Path]).

control_action(proof,Payload,Proof) :- !,
    must_be(dict,Payload),checkpoint_proof(Payload.nonce,Proof).
control_action(prepare,_,_{prepared:true}) :- !,
    candidate_context(C),
    (candidate_lease(_)->ensure_material(C.metadata,false)
    ;setup_call_catcher_cleanup(host(drain,checkpoint,Lease),
       (ensure_material(C.metadata,false),assertz(candidate_lease(Lease))),
       Catcher,(Catcher==exit->true;host(resume_admissions,Lease,_)))).
control_action(bind,Payload,_{bound:Profiles}) :- !,
    candidate_context(C),same_json(Payload.profiles,C.targets),
    (Payload.confirm=='take-over-original-ports'->true;
      throw(error(permission_error(promote,checkpoint_candidate,explicit_approval_required),_))),
    candidate_lease(_),owned_profiles(Before),
    retract(instance(I)),assertz(instance(I.put(role,promoting))),
    kb_checkpoint_mode:permit_serving,
    catch(host(bind_ports,C.targets,_),Error,
      (owned_profiles(After),new_profiles(Before,After,Added),
       catch(host(release_ports,Added,_),_,true),return_to_nonserving,throw(Error))),
    owned_profiles(Profiles).
control_action(unbind,_,_{unbound:true}) :- !,
    candidate_context(C),owned_profiles(Current),matching_profiles(Current,C.targets,Targets),
    host(release_ports,Targets,_),release_candidate_lease,return_to_nonserving.
control_action(commit,_,_{committed:true}) :- !,
    candidate_context(C),
    owned_profiles(Current),forall(member(P,C.targets),known_profile(Current,P)),
    retract(instance(I)),assertz(instance(I.put(_{role:active,primary:C.original}))),
    adopt_success(C).
control_action(activate,_,_{active:true}) :- !,
    candidate_context(C),instance(I),I.role==active,
    owned_profiles(Current),same_json(Current,C.targets),
    host(capabilities,none,Capabilities),
    (memberchk(activate,Capabilities)->host(activate,none,_);true),
    release_candidate_lease.
control_action(query,Payload,Result) :- !,
    candidate_context(_),host(query,Payload,Result).
control_action(stop,_,_{stopping:true}) :- !,
    candidate_context(C),
    release_candidate_lease,
    thread_send_message(C.stopQueue,stop).
control_action(trial,Payload,Reply) :- !,try_checkpoint(Payload.id,Payload.generation,Reply).
control_action(promote,Payload,Reply) :- !,promote_checkpoint(Payload.run,Payload.revision,Reply).
control_action(status,Payload,Reply) :- !,checkpoint_status(Payload.run,Reply).
control_action(cancel,Payload,Reply) :- !,cancel_checkpoint(Payload.run,Reply).
control_action(candidate,Payload,Reply) :- !,
    instance(I),I.role==active,memberchk(Payload.action,[proof,query]),
    peer_action(Payload.run,Payload.action,Payload.payload,Reply).
control_action(save,Payload,Reply) :- !,
    kb_saved_state:saved_states(Catalog),
    kb_saved_state:create_saved_state(Payload.name,Payload.generation,Catalog.revision,Reply).
control_action(Action,_,_) :- throw(error(domain_error(checkpoint_action,Action),_)).
return_to_nonserving :-
    host(nonserving,none,_),kb_checkpoint_mode:enter_candidate,
    retract(instance(I)),assertz(instance(I.put(role,candidate))).
port_is(Port,Profile) :- Profile.port=:=Port.
new_profiles(Before,After,New) :- exclude(known_profile(Before),After,New).
known_profile(Profiles,P) :- member(Q,Profiles),same_json(P,Q),!.
matching_profiles(Current,Targets,Found) :-
    include(known_profile(Targets),Current,Found).
release_candidate_lease :-
    (retract(candidate_lease(Lease))->host(resume_admissions,Lease,_);true).

checkpoint_proof(Nonce,Proof) :-
    instance(I),candidate_context(C),current_prolog_flag(pid,PID),
    kb_saved_state:current_snapshot_identity(Identity),
    kb_saved_state:runtime_probe(Probe),owned_profiles(Profiles),
    host(health,none,Health),kb_saved_state:verify_saved_native(C.metadata,Native),
    nonserving_value(I.role,Nonserving),
    Proof=proof{nonce:Nonce,instance:I.id,pid:PID,checkpoint:C.checkpoint,
      run:C.run,owner:C.owner,identity:Identity,runtimeProbe:Probe,profiles:Profiles,
      role:I.role,nonserving:Nonserving,health:Health,nativeTVA:Native,coldSourceLoad:false}.
nonserving_value(candidate,true) :- !.
nonserving_value(_,false).

try_checkpoint(Id0,Expected,Reply) :-
    kb_checkpoint_policy:require_checkpoint_execution(start_candidate),
    text_atom(Id0,Id),must_be(integer,Expected),
    instance(Owner),Owner.role==active,
    kb_saved_state:saved_state_metadata(Id,Metadata),
    kb_saved_state:validate_artifact(Metadata,true,Image),
    (Expected=:=Metadata.generation->true;throw(error(checkpoint_generation_mismatch,_))),
    ensure_material(Metadata,true),
    with_mutex(powder_checkpoint_runs,
      (run(_,Existing,_),memberchk(Existing.phase,[starting,trial_ready,promoting,recovery_serving])->
        (Existing.checkpoint==Id->Reply=Existing;
         throw(error(checkpoint_transition_busy(Existing.id),_)))
      ;new_trial(Owner,Metadata,Image,Reply))).
new_trial(Owner,Metadata,Image,Reply) :-
    uuid(Id),uuid(CandidateId),secret(Token),
    run_directory(Id,Directory),file_directory_name(Directory,Parent),make_directory_path(Parent),
    kb_checkpoint_ipc:private_directory(Directory),
    directory_file_path(Directory,'request.json',RequestFile),
    directory_file_path(Directory,'ready.json',ReadyFile),
    owned_profiles(Profiles),
    Request=request{run:Id,candidate:CandidateId,owner:Owner.id,secret:Token,
      checkpoint:Metadata.id,stateHash:Metadata.stateHash,original:Owner.primary,
      targets:Profiles,ready:ReadyFile},
    kb_saved_state:write_json(RequestFile,Request),
    Initial=trial{id:Id,checkpoint:Metadata.id,owner:Owner.id,candidate:CandidateId,
      phase:starting,revision:1,primary:Owner.primary,targets:Profiles,
      temporary:null,transport:private_file_ipc,
      message:"Restoring nonserving candidate; no HTTP, debug or agent services."},
    assertz(run(Id,Initial,owned{directory:Directory,pid:none,metadata:Metadata})),
    catch(((current_prolog_flag(executable,SWI),
      (once(launch_hook(SWI,['-q','-f',none,'-x',Image,'--','--checkpoint-candidate',RequestFile],Directory,PID))->
        true;throw(error(checkpoint_visible_launcher_hook_missing,_))),
      set_run_pid(Id,PID),
      wait_ready(ReadyFile,PID,30,Ready),
      text_atom(Ready.instance,CandidateId),Ready.pid=:=PID,
      directory_file_path(Directory,ipc,Mailbox),text_atom(Ready.mailbox,Mailbox),
      Credentials=credentials{instance:CandidateId,mailbox:Mailbox,token:Token},
      assertz(peer(Id,Credentials)),
      verify_candidate(Id,Metadata,Profiles),
      update_run(Id,_{phase:trial_ready,pid:PID,
        message:"Nonserving candidate verified over private IPC; original instance remains untouched."},Reply))->true;
      throw(error(checkpoint_candidate_start_failed(Id),_))),
      Error,(fail_trial(Id,Error,Reply))).
set_run_pid(Id,PID) :-
    must_be(integer,PID),retract(run(Id,Data,Owned)),
    assertz(run(Id,Data,Owned.put(pid,PID))).
run_directory(Id,Directory) :-
    atom_codes(Id,Codes),Codes\=[],
    forall(member(C,Codes),(between(0'0,0'9,C);between(0'a,0'f,C);C=:=0'-)),
    kb_saved_state:saved_state_root(Root),directory_file_path(Root,runs,Runs),
    kb_saved_state:safe_path(Runs),directory_file_path(Runs,Id,Directory).
wait_ready(File,PID,Seconds,Ready) :-
    get_time(Start),wait_ready_until(File,PID,Start,Seconds,Ready).
wait_ready_until(File,PID,Start,Seconds,Ready) :-
    (exists_file(File),read_ready(File,Ready)->true
    ;owned_process(wait,PID,0,Exit),
     (Exit==timeout->true;throw(error(checkpoint_candidate_exited(Exit),_))),
     get_time(Now),(Now-Start<Seconds->true;throw(error(checkpoint_trial_timeout,_))),
     sleep(0.05),wait_ready_until(File,PID,Start,Seconds,Ready)).
read_ready(File,Ready) :-
    % Windows may briefly deny sharing just after atomic publication.
    catch(kb_saved_state:read_json(File,Ready),
      error(permission_error(open,source_sink,_),_),fail).
fail_trial(Id,Error,Reply) :-
    message_to_string(Error,Message),
    catch((cleanup_candidate(Id),Details=Message),CleanupError,
      (message_to_string(CleanupError,CleanupMessage),
       format(string(Details),'~s; owned candidate cleanup requires retry: ~s',[Message,CleanupMessage]))),
    update_run(Id,_{phase:failed,message:Details},Reply).

ensure_material(Metadata,CheckPorts) :-
    kb_saved_state:with_snapshot_lock(kb_checkpoint:ensure_material_locked(Metadata,CheckPorts)).
ensure_material_locked(Metadata,CheckPorts) :-
    kb_source_packs:verify_source_pack_snapshot_authority(Metadata.sourcePackSnapshot),
    kb_saved_state:current_snapshot_identity(Current),
    kb_saved_state:saved_snapshot_digest(Metadata,ExpectedDigest),
    (Current.generation=:=Metadata.generation,
     Current.snapshotDigest==ExpectedDigest,
     same_json(Current.configuration,Metadata.configuration)->true;
      throw(error(checkpoint_loaded_state_or_configuration_changed,_))),
    (is_dict(Metadata.checkpoint),get_dict(runtime,Metadata.checkpoint,ExpectedRuntime)->
      (is_dict(Current.checkpoint),get_dict(runtime,Current.checkpoint,ActualRuntime),
       same_json(ExpectedRuntime,ActualRuntime)->true;
        throw(error(checkpoint_runtime_configuration_changed,_)));true),
    (CheckPorts==true->
      (checkpoint_ports(Current.checkpoint,CurrentPorts),
       checkpoint_ports(Metadata.checkpoint,SavedPorts),same_json(CurrentPorts,SavedPorts)->true;
       throw(error(checkpoint_listener_or_instance_configuration_changed,_)))
    ;true).
checkpoint_ports(Stamp,ports{primary:Stamp.primary,profiles:Stamp.profiles}) :- is_dict(Stamp).
verify_candidate(Id,Metadata,_) :-
    run(Id,Data,Owned),uuid(Nonce),peer_action(Id,proof,_{nonce:Nonce},Proof),
    text_atom(Proof.nonce,Nonce),text_atom(Proof.instance,Data.candidate),
    text_atom(Proof.run,Id),text_atom(Proof.owner,Data.owner),
    text_atom(Proof.checkpoint,Data.checkpoint),Proof.pid=:=Owned.pid,
    Proof.identity.generation=:=Metadata.generation,
    kb_saved_state:saved_snapshot_digest(Metadata,Digest),
    text_atom(Proof.identity.snapshotDigest,Digest),
    matching_json(configuration,Proof.identity.configuration,Metadata.configuration),
    matching_json(counts,Proof.identity.counts,Metadata.counts),
    matching_json(files,Proof.identity.files,Metadata.files),Proof.coldSourceLoad==false,
    Proof.profiles==[],Proof.nonserving==true,Proof.role==candidate, !.
verify_candidate(Id,_,_) :- throw(error(checkpoint_candidate_identity_or_health_failed(Id),_)).
matching_json(Label,A,B) :-
    (same_json(A,B)->true;throw(error(checkpoint_mismatched(Label,A,B),_))).
verify_public_ports(Profiles,Metadata) :-
    forall(member(P,Profiles),verify_public_port(P.port,Metadata)).
verify_instance_ports(Profiles,Metadata,Instance) :-
    verify_public_ports(Profiles,Metadata.put(expectedInstance,Instance)).
verify_public_port(Port,Metadata) :-
    app_base(Base),local_url(Port,Base,Page),
    setup_call_cleanup(http_open(Page,S,[timeout(5),status_code(Code)]),
      read_string(S,_,HTML),close(S)),
    (Code=:=200,sub_string(HTML,_,_,_,"<html")->true;
      throw(error(checkpoint_canonical_ui_failed(Port),_))),
    verify_page_assets(Page,HTML),
    atom_concat(Base,'api/status',StatusPath),local_url(Port,StatusPath,URL),
    setup_call_cleanup(http_open(URL,Input,[timeout(5),status_code(StatusCode)]),
      json_read_dict(Input,Status),close(Input)),
    (StatusCode=:=200,Status.generation=:=Metadata.generation->true;
      throw(error(checkpoint_canonical_api_failed(Port),_))),
    matching_json(api_counts,Status.counts,Metadata.counts),
    maplist(manifest_file,Status.files,ActualFiles),
    maplist(manifest_file,Metadata.files,ExpectedFiles),
    matching_json(api_files,ActualFiles,ExpectedFiles),
    uuid(Nonce),atomic_list_concat([Base,'api/checkpoint/identity?nonce=',Nonce],IdentityPath),
    local_url(Port,IdentityPath,IdentityURL),
    setup_call_cleanup(http_open(IdentityURL,IdentityStream,[timeout(5)]),
      json_read_dict(IdentityStream,PublicIdentity),close(IdentityStream)),
    (text_atom(PublicIdentity.nonce,Nonce),text_atom(PublicIdentity.id,Metadata.expectedInstance),
     PublicIdentity.generation=:=Metadata.generation->true;
      throw(error(checkpoint_public_instance_identity_failed(Port,
        expected(Metadata.expectedInstance,Metadata.generation,Nonce),PublicIdentity),_))).
manifest_file(File,file{path:File.path,count:File.count,lineCount:File.lineCount,sizeBytes:File.sizeBytes}).
verify_page_assets(Page,HTML) :-
    setup_call_cleanup(open_string(HTML,Input),load_html(stream(Input),DOM,[]),close(Input)),
    findall(Kind-Path,(sub_term(Element,DOM),page_asset(Element,Kind,Path)),Assets0),
    sort(Assets0,Assets),
    (member(css-_,Assets),member(js-_,Assets)->true;
      throw(error(checkpoint_ui_assets_missing,_))),
    forall(member(Kind-Relative,Assets),
      (uri_resolve(Relative,Page,URL),
       (atom_concat(Page,_,URL)->true;throw(error(checkpoint_nonlocal_asset(Relative),_))),
       setup_call_cleanup(http_open(URL,S,[timeout(5),status_code(Code),header(content_type,Type)]),
         read_string(S,_,Body),close(S)),
       (Code=:=200,Body\=="",asset_type(Kind,Type)->true;
         throw(error(checkpoint_ui_asset_failed(URL,Code,Type),_))))).
page_asset(element(link,Attributes,_),css,Path) :-
    memberchk(rel=stylesheet,Attributes),memberchk(href=Path,Attributes).
page_asset(element(script,Attributes,_),js,Path) :- memberchk(src=Path,Attributes).
asset_type(css,Type) :- sub_atom(Type,0,_,_,'text/css').
asset_type(js,Type) :- (sub_atom(Type,0,_,_,'text/javascript');sub_atom(Type,0,_,_,'application/javascript')).

promote_checkpoint(Id0,ExpectedRevision,Reply) :-
    kb_checkpoint_policy:require_checkpoint_execution(promote),
    text_atom(Id0,Id),must_be(integer,ExpectedRevision),
    with_mutex(powder_checkpoint_runs,
      (run(Id,Data,_),
       (memberchk(Data.phase,[promoting,promoted])->Reply=Data
       ;memberchk(Data.phase,[trial_ready,recovery_serving]),
        (Data.revision=:=ExpectedRevision->true;throw(error(checkpoint_revision_conflict,_))),
        host(capabilities,none,Capabilities),
        forall(member(C,[drain,resume_admissions,release_ports,bind_ports,retire_old]),
          (memberchk(C,Capabilities)->true;throw(error(checkpoint_capability_required(C),_)))),
        update_run(Id,_{phase:promoting,previousPhase:Data.phase,released:false,
          message:"Draining before original-port takeover."},Reply),
        thread_create((thread_get_message(go),promotion_worker(Id)),Thread,
          [detached(true),inherit_from(main)]),
        assertz(transition_thread(Id,Thread)),thread_send_message(Thread,go)))).
promotion_worker(Id) :-
    setup_call_cleanup(true,
      catch((perform_promotion(Id)->true;throw(error(checkpoint_promotion_failed,_))),
        Error,recover_transition(Id,Error)),
      (release_old_lease(Id),retractall(transition_thread(Id,_)))).
recover_transition(Id,Error) :-
    catch(recover_promotion(Id,Error),RecoveryError,
      (message_to_string(Error,Original),message_to_string(RecoveryError,Recovery),
       format(string(Message),'~s; recovery also failed: ~s',[Original,Recovery]),
       update_run(Id,_{phase:recovery_required,message:Message,
         recovery:"Automatic recovery is incomplete. Verify the owned instance and listeners before further action."},_))).
release_old_lease(Id) :-
    (retract(old_lease(Id,Lease))->host(resume_admissions,Lease,_);true).
perform_promotion(Id) :-
    run(Id,Data,Owned),ensure_material(Owned.metadata,false),
    owned_profiles(Current),matching_profiles(Current,Data.targets,Known),
    (Data.previousPhase==trial_ready->ExpectedProfiles=Data.targets;ExpectedProfiles=Known),
    (same_json(Current,ExpectedProfiles)->true;throw(error(checkpoint_listener_configuration_changed,_))),
    (catch(primary_candidate_verified(Id),_,fail)->
       finish_candidate(Id,Data,Owned)
    ;verify_candidate(Id,Owned.metadata,Data.targets),
    host(drain,checkpoint,Lease),assertz(old_lease(Id,Lease)),
      (ensure_material(Owned.metadata,false),
       peer_action(Id,prepare,_{},_),
       owned_profiles(Release),matching_profiles(Release,Data.targets,OwnedRelease),
       update_run(Id,_{released:true},_),
       host(release_ports,OwnedRelease,_),
       peer_action(Id,bind,_{profiles:Data.targets,confirm:'take-over-original-ports'},_),
       verify_instance_ports(Data.targets,Owned.metadata,Data.candidate),
       finish_candidate(Id,Data,Owned))).
finish_candidate(Id,Data,Owned) :-
    peer_action(Id,commit,_{},_),
    primary_candidate_verified(Id),verify_instance_ports(Data.targets,Owned.metadata,Data.candidate),
    peer_action(Id,activate,_{},_),
    release_process_ownership(Id,false),
    update_run(Id,_{phase:promoted,recovery:null,
      message:"Explicitly promoted replacement verified on the original ports."},_),
    instance(I),retract(instance(I)),assertz(instance(I.put(role,retired))),
    release_old_lease(Id),
    host(retire_old,Id,_).
recover_promotion(Id,Error) :-
    message_to_string(Error,Message),run(Id,Data,Owned),
    (catch(primary_candidate_verified(Id),_,fail)->
      (catch(finish_candidate(Id,Data,Owned),_,fail)->true
      ;update_run(Id,_{phase:recovery_serving,message:Message,
        recovery:"Replacement serves original ports, but finalization is incomplete; old control remains available."},_))
    ;get_dict(released,Data,true)->
      catch(peer_action(Id,unbind,_{},_),_,true),
      (catch(call_with_time_limit(6,
         (host(bind_ports,Data.targets,_),verify_instance_ports(Data.targets,Owned.metadata,Data.owner))),_,fail)->
        cleanup_candidate(Id),
        update_run(Id,_{phase:rolled_back,message:Message},_)
      ;update_run(Id,_{phase:recovery_required,message:Message,
          recovery:"Original-port rebind failed. Both private control channels remain available; no recovery HTTP port was opened."},_))
    ;Data.previousPhase==recovery_serving->
      update_run(Id,_{phase:recovery_serving,message:Message},_)
    ;catch(peer_action(Id,unbind,_{},_),_,true),
     update_run(Id,_{phase:trial_ready,message:Message},_)).
primary_candidate_verified(Id) :-
    run(Id,Data,Owned),uuid(Nonce),peer_action(Id,proof,_{nonce:Nonce},Proof),
    text_atom(Proof.instance,Data.candidate),Proof.pid=:=Owned.pid,
    forall(member(P,Data.targets),(member(Q,Proof.profiles),same_json(P,Q))),
    verify_instance_ports(Data.targets,Owned.metadata,Data.candidate).
adopt_success(C) :-
    retractall(adopted(C.run,_)),
    assertz(adopted(C.run,trial{id:C.run,checkpoint:C.checkpoint,candidate:C.candidate,
      owner:C.owner,phase:promoted,primary:C.original,temporary:null,
      targets:C.targets,revision:1,message:"Checkpoint active on original ports."})).

update_run(Id,Patch,Updated) :-
    with_mutex(powder_checkpoint_data,
      (retract(run(Id,Before,Owned)),Revision is Before.revision+1,
       Updated=Before.put(Patch).put(revision,Revision),assertz(run(Id,Updated,Owned)))).
checkpoint_status(Id0,Reply) :-
    text_atom(Id0,Id),
    with_mutex(powder_checkpoint_data,
      (run(Id,Reply,_)->true;adopted(Id,Reply)->true;
       throw(error(existence_error(checkpoint_trial,Id),_)))).
await_checkpoint(Id,Seconds,Reply) :-
    must_be(number,Seconds),Seconds>0,
    call_with_time_limit(Seconds,
      thread_wait((checkpoint_status(Id,R),R.phase\==promoting),
        [wait_preds([run/3,adopted/2]),retry_every(0.05)])),
    checkpoint_status(Id,Reply).
cancel_checkpoint(Id0,Reply) :-
    text_atom(Id0,Id),
    with_mutex(powder_checkpoint_runs,
      (run(Id,Data,_),
       (memberchk(Data.phase,[starting,trial_ready,failed,cancelled,rolled_back])->
         cleanup_candidate(Id),update_run(Id,_{phase:cancelled,message:"Owned candidate stopped; checkpoint retained."},Reply)
       ;throw(error(permission_error(cancel,checkpoint_transition,Data.phase),_))))).
cleanup_candidate(Id) :-
    (run(Id,_,Owned)->
      ignore(catch(peer_action(Id,stop,_{},_),_,true)),
      (integer(Owned.pid)->
        owned_process(wait,Owned.pid,20,Exit),
        (Exit==timeout->owned_process(terminate,Owned.pid,none,_),
          owned_process(wait,Owned.pid,3,Final),
          (Final==timeout->throw(error(checkpoint_candidate_did_not_stop(Owned.pid),_));true);true)
      ;true),
      retractall(peer(Id,_)),
      cleanup_run_directory(Owned.directory,Cleanup),
      update_run(Id,_{cleanup:Cleanup},_),
      release_process_ownership(Id,true)
    ;true).
cleanup_run_directory(Directory,Cleanup) :-
    (exists_directory(Directory)->
     catch((delete_directory_and_contents(Directory),Cleanup=complete),
       Error,empty_directory_cleanup(Error,Directory,Cleanup))
    ;Cleanup=complete).
empty_directory_cleanup(error(permission_error(delete,directory,Directory),_),Directory,deferred_empty_directory) :-
    % A Windows console host/observer may retain the exited process's working
    % directory. Only an empty directory can be deferred; payload deletion must
    % have succeeded, and process exit was already confirmed.
    directory_files(Directory,Entries),
    forall(member(Entry,Entries),memberchk(Entry,['.','..'])), !.
empty_directory_cleanup(Error,_,_) :- throw(Error).
release_process_ownership(Id,ClearPID) :-
    with_mutex(powder_checkpoint_data,
      sig_atomic(
       (run(Id,Data,Owned),
        (get_dict(processReleased,Owned,true)->true;
          integer(Owned.pid)->owned_process(release,Owned.pid,none,_);true),
        Released=Owned.put(processReleased,true),
        (ClearPID==true->Updated=Released.put(pid,none);Updated=Released),
        retract(run(Id,Data,Owned)),assertz(run(Id,Data,Updated))))).

candidate_entry(RequestFile,Metadata) :-
    kb_checkpoint_policy:require_checkpoint_execution(candidate),
    kb_checkpoint_mode:enter_candidate,
    kb_saved_state:read_json(RequestFile,Request),
    run_directory(Request.run,Directory),directory_file_path(Directory,'request.json',Expected),
    absolute_file_name(RequestFile,Actual,[access(read)]),Actual==Expected,
    text_atom(Request.checkpoint,Metadata.id),
    kb_saved_state:saved_state_metadata(Request.checkpoint,Published),
    kb_saved_state:validate_artifact(Published,true,_),
    text_atom(Request.stateHash,Published.stateHash),
    kb_cache:remove_if_exists(RequestFile),
    maplist(valid_profile,Request.targets),
    message_queue_create(Stop),
    setup_call_cleanup(assertz(candidate_starting),
      (host(start_candidate,_{metadata:Metadata,stopQueue:Stop},nonserving),
       start_candidate_control(Request,Stop,Metadata,Credentials),
       retractall(candidate_starting),
       checkpoint_proof(startup,Proof),
       Ready=ready{instance:Credentials.instance,mailbox:Credentials.mailbox,
         pid:Proof.pid,nonserving:true},
       directory_file_path(Directory,'ready.json',ReadyFile),
       kb_cache:stage_path(ReadyFile,Stage),kb_saved_state:write_json(Stage,Ready),
       rename_file(Stage,ReadyFile),
       host(wait_candidate,Stop,_)),
      (retractall(candidate_starting),catch(host(stop_candidate,none,_),_,true),
       catch(stop_managed_instance,_,true),
       retractall(candidate_context(_)),message_queue_destroy(Stop))).
start_candidate_control(Request,Stop,Metadata,Credentials) :-
    run_directory(Request.run,Directory),
    C=Request.put(_{stopQueue:Stop,metadata:Metadata}),
    assertz(candidate_context(C)),
    start_instance_control(Request.candidate,Request.original,candidate,Request.secret,
      Directory,Credentials).
