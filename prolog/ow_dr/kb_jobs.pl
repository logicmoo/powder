:- module(kb_jobs,
    [start_file_pool/1,stop_file_pool/1,file_pool_started/0,in_file_worker/0,
     start_inference_pool/1,stop_inference_pool/1,inference_pool_started/0,in_inference/0,
     queue_load/3,queue_load/4,queue_index/3,queue_cached_load/3,queue_unload/3,
     queue_query/5,queue_question/4,submit_inference/3,
     job_status/2,await_result/2,await_result/3,cancel_job/1,task_overview/1,
     current_job_id/1,compiler_progress/3,
     save_quiescence/1,with_saved_state_snapshot/1,prepare_saved_state/0,restore_saved_state/0,
     begin_checkpoint_drain/1,end_checkpoint_drain/1,
     configure_pools/1,pool_profiles/1,
     start_pools/1,stop_pools/0,in_loader/0,submit_load/3,submit_unload/3,
     attach_http/2,detach_http/1]).
:- use_module(kb_activity).
:- use_module(kb_paths).
:- use_module(kb_compile,[]).
:- use_module(kb_store,[]).
:- use_module(kb_questions,[]).
:- use_module(kb_limits,[]).
:- use_module(kb_config,[]).
:- use_module(kb_cache,[]).
:- use_module(kb_messages).
:- use_module(library(error)).
:- use_module(library(option)).
:- use_module(library(uuid)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(aggregate)).
:- dynamic pool/3,worker/3,manager/2,pool_state/1,job/4,unit/5.
:- dynamic inference_state/1.
:- dynamic reservation/3,cancel_requested/1,unit_progress/3,service_error/1,http_pool/2.
:- dynamic pending_cleanup/1.
:- dynamic pool_io/3.
:- dynamic registry_owner/1,prepared_save/1.
:- thread_local current_job/2,current_pool/1.
:- volatile pool/3,worker/3,manager/2,pool_state/1,inference_state/1,job/4,unit/5.
:- volatile reservation/3,cancel_requested/1,unit_progress/3,service_error/1,http_pool/2.
:- volatile pending_cleanup/1,pool_io/3,current_job/2,current_pool/1.
:- meta_predicate jobs_locked(0).
:- meta_predicate with_saved_state_snapshot(0),snapshot_mutex(+,0),copy_saved_snapshot(0),
                  locked_snapshot(0).

initialize_pool_io :-
    (registry_owner(_)->true;
     current_prolog_flag(pid,Pid),assertz(registry_owner(Pid))),
    (pool_io(_,_,_)->true;
     stream_property(Input,alias(user_input)),
     stream_property(Output,alias(user_output)),
     stream_property(Error,alias(user_error)),
     assertz(pool_io(Input,Output,Error))).
:- initialization(initialize_pool_io).

% Request/test output captures may close while persistent workers are still alive.
worker_io :-
    pool_io(Input,Output,Error),set_prolog_IO(Input,Output,Error).
require_local_registry :-
    current_prolog_flag(pid,Pid),
    (registry_owner(Pid)->true;
     throw(error(permission_error(use,unrestored_job_registry,Pid),_))).

% Advisory only: use with_exclusive_reload/1 around the actual live snapshot copy.
save_quiescence(Status) :-
    jobs_locked(
      (aggregate_all(count,(job(_,M,_,_),\+terminal(M.state)),Jobs),
       aggregate_all(count,worker(_,_,running(_,_)),Workers),
       aggregate_all(count,pool(_,_,_),Pools),
       aggregate_all(count,job(_,_,_,_),History),
       aggregate_all(count,unit(_,_,_,_,_),Units),
       aggregate_all(count,http_pool(_,_),HTTP),
       aggregate_all(count,pending_cleanup(_),Cleanup))),
    kb_activity:activity_status(Activity),
    with_mutex(openworld_store,
      (aggregate_all(count,kb_store:query_snapshot(_,_,_,_),Snapshots),
       aggregate_all(count,kb_store:native_query_refs(_,_),References),
       aggregate_all(count,kb_store:retired_native(_),Retired))),
    Status=save_state{state:State,jobs:Jobs,workers:Workers,pendingCleanup:Cleanup,
      registeredPools:Pools,recordedJobs:History,units:Units,httpAttachments:HTTP,
      querySnapshots:Snapshots,nativeReferences:References,retiredNatives:Retired,activity:Activity},
    (quiet_snapshot_work(Status),Activity.exclusive==false->State=ready;State=busy).
quiet_snapshot_work(Status) :-
    Status.jobs=:=0,Status.workers=:=0,Status.units=:=0,Status.pendingCleanup=:=0,
    Status.querySnapshots=:=0,Status.nativeReferences=:=0,Status.retiredNatives=:=0,
    Status.activity.active=:=0,Status.activity.tickets==[].

with_saved_state_snapshot(Goal) :-
    (owns_admission_lease->locked_snapshot(Goal);
     catch(with_exclusive_reload(locked_snapshot(Goal)),
       error(application_reload_busy,_),throw(error(saved_state_busy(application),_)))).
locked_snapshot(Goal) :-
    snapshot_mutex(openworld_code_reload,snapshot_mutex(openworld_store,
      copy_saved_snapshot(Goal))).
copy_saved_snapshot(Goal) :-
    save_quiescence(Status),
    (quiet_snapshot_work(Status)->once(Goal);throw(error(saved_state_busy(Status),_))).
snapshot_mutex(Name,Goal) :-
    (mutex_trylock(Name)->setup_call_cleanup(true,Goal,mutex_unlock(Name));
     throw(error(saved_state_busy(Name),_))).

begin_checkpoint_drain(Token) :-
    catch(setup_call_catcher_cleanup(
      begin_admission_lease(Token),with_saved_state_snapshot(true),Catcher,
      (Catcher==exit->true;end_admission_lease(Token))),
      Error,checkpoint_drain_error(Error)).
checkpoint_drain_error(error(application_reload_busy,_)) :- !,
    throw(error(checkpoint_busy(application),_)).
checkpoint_drain_error(error(saved_state_busy(Reason),_)) :- !,
    throw(error(checkpoint_busy(Reason),_)).
checkpoint_drain_error(Error) :- throw(Error).
end_checkpoint_drain(Token) :- end_admission_lease(Token).

% Only an isolated, unused registry may be serialized; never stop a live pool.
prepare_saved_state :-
    with_mutex(powder_pool_lifecycle,
      (require_local_registry,save_quiescence(Status),
       jobs_locked(
         (Status.state==ready,
          \+pool(_,_,_),\+worker(_,_,_),\+manager(_,_),
          \+job(_,_,_,_),\+unit(_,_,_,_,_),\+reservation(_,_,_),\+http_pool(_,_)->true;
          throw(error(permission_error(save,live_job_registry,Status),_)))),
       current_prolog_flag(pid,Pid),
       retractall(prepared_save(_)),assertz(prepared_save(Pid)),
       retractall(pool_io(_,_,_)))).

restore_saved_state :-
    current_prolog_flag(pid,Pid),
    (prepared_save(Builder),registry_owner(Builder),Builder=\=Pid->true;
     throw(error(permission_error(restore,live_job_registry,Pid),_))),
    save_quiescence(Status),
    (Status.state==ready,\+pool(_,_,_),\+job(_,_,_,_)->true;
     throw(error(permission_error(restore,nonquiescent_job_registry,Status),_))),
    retractall(registry_owner(_)),retractall(prepared_save(_)),
    retractall(pool_io(_,_,_)),initialize_pool_io.

jobs_locked(Goal) :- with_mutex(powder_jobs,transaction(Goal)).
file_pool_started :- pool(file,_,_).
inference_pool_started :- pool(inference,_,_).
in_file_worker :- current_pool(file).
in_inference :- current_pool(inference).
in_loader :- in_file_worker.
current_job_id(Id) :- current_job(Id,_).
start_pools(Settings) :- start_file_pool(Settings),start_inference_pool(Settings).
stop_pools :- stop_inference_pool(cancel),stop_file_pool(cancel).
submit_load(Paths,Expected,Accepted) :- queue_load(Paths,Expected,Accepted).
submit_unload(Path,Expected,Accepted) :- queue_unload(Path,Expected,Accepted).

start_file_pool(Settings) :-
    file_profile(Settings,Profile),
    start_pool(file,Profile).
start_inference_pool(Settings) :-
    inference_profile(Settings,Profile),
    start_pool(inference,Profile).
start_pool(Type,Profile) :-
    with_mutex(powder_pool_lifecycle,
      (require_local_registry,initialize_pool_io,retractall(prepared_save(_)),
       start_pool_locked(Type,Profile))).
start_pool_locked(Type,Profile) :-
    with_mutex(powder_pools,
      (pool(Type,_,Existing)->
        (Existing==Profile,run_state(Type,running)->true;
         throw(error(permission_error(reconfigure,active_pool(Type),Profile),_)))
      ;catch(start_new_pool(Type,Profile),Error,(destroy_idle_pool(Type),throw(Error))))).

file_profile(Settings,Profile) :-
    must_be(dict,Settings),
    (get_dict(pools,Settings,Pools)->get_dict(loader,Pools,P);P=Settings),
    normalized_profile(loader,P,Profile).

inference_profile(Settings,Profile) :-
    must_be(dict,Settings),
    (get_dict(pools,Settings,Pools)->get_dict(inference,Pools,P);P=Settings),
    normalized_profile(inference,P,Profile).
normalized_profile(Name,Input,Profile) :-
    kb_config:pool_profile(Name,Input,Checked),
    (get_dict(queueCapacity,Checked,_)->Profile=Checked;
     Profile=Checked.put(queueCapacity,100)).

configure_pools(Settings) :-
    file_profile(Settings,File),inference_profile(Settings,Inference),
    with_application(with_mutex(powder_pool_lifecycle,
      with_mutex(powder_pools,jobs_locked(
        (require_local_registry,
         forall(pool(Type,_,_),
           (run_state(Type,running)->true;
            throw(error(permission_error(reconfigure,stopping_pool,Type),_)))),
         configure_running_pool(file,File),configure_running_pool(inference,Inference)))))),
    wake_manager.
configure_running_pool(Type,Profile) :-
    (retract(pool(Type,Queue,_))->assertz(pool(Type,Queue,Profile));true).
pool_profiles(Profiles) :-
    jobs_locked(findall(Stats,(pool(Type,_,_),pool_statistics(Type,Stats)),Profiles)).

run_state(file,State) :- pool_state(State).
run_state(inference,State) :- inference_state(State).
set_run_state(file,State) :- retractall(pool_state(_)),assertz(pool_state(State)).
set_run_state(inference,State) :- retractall(inference_state(_)),assertz(inference_state(State)).
clear_run_state(file) :- retractall(pool_state(_)).
clear_run_state(inference) :- retractall(inference_state(_)).

start_new_pool(Type,Profile) :-
    message_queue_create(Queue,[max_size(Profile.max)]),
    assertz(pool(Type,Queue,Profile)),set_run_state(Type,running),
    ensure_manager(New),
    forall(between(1,Profile.start,_),spawn_worker(Type,Queue)),
    (New==true->manager(Thread,_),thread_send_message(Thread,go);true).
ensure_manager(false) :- manager(_,_),!.
ensure_manager(true) :-
    message_queue_create(Control,[max_size(1)]),
    catch(thread_create(
      (worker_io,thread_send_message(Control,ready),
       thread_get_message(go),manager_loop(Control)),Thread,[inherit_from(main)]),
      Error,(message_queue_destroy(Control),throw(Error))),
    assertz(manager(Thread,Control)),thread_get_message(Control,ready).

spawn_worker(Type,Queue) :-
    manager(Owner,_),
    thread_create((set_output(user_output),thread_get_message(go),worker_loop(Type,Queue)),Thread,[inherit_from(Owner)]),
    assertz(worker(Type,Thread,idle)),thread_send_message(Thread,go).

queue_load(Paths,Expected,Accepted) :- queue_load(Paths,Expected,[],Accepted).
queue_load(Paths,Expected,Options,Accepted) :-
    selection(Paths,Files),compiler_options(Options,Safe),
    submit(replace(Files,Safe),Expected,"Load sources",Files,Accepted).
queue_index(Paths,Options,Accepted) :-
    selection(Paths,Files),compiler_options(Options,Safe),
    submit(index(Files,Safe),none,"Index sources",Files,Accepted).
queue_cached_load(Snapshots,Expected,Accepted) :-
    must_be(list,Snapshots),maplist(cached_snapshot,Snapshots,Checked),
    findall(Source,(member(S,Checked),Source=S.source),Files),
    submit(cached(Checked),Expected,"Load cached source pack",Files,Accepted).
queue_unload(Input,Expected,Accepted) :-
    canonical_path(Input,File),submit(unload(File),Expected,"Unload source",[File],Accepted).

queue_query(Text,Scope0,Limit,Seconds,Accepted) :-
    must_be(string,Text),string_length(Text,Length),
    (Length=<65536->true;domain_error(query_length,Length)),
    query_bounds(Limit,Seconds),query_scope(Scope0,Scope),
    submit_to(inference,infer(query(Text,Scope,Limit,Seconds)),any,"KB query",[],Accepted).
queue_question(Input,Limit,Seconds,Accepted) :-
    canonical_question_id(Input,Id),query_bounds(Limit,Seconds),
    submit_to(inference,infer(question(Id,Limit,Seconds)),any,"Stored test question",[],Accepted).
canonical_question_id(Input,Id) :-
    (atom(Input)->Id=Input;string(Input)->atom_string(Id,Input);type_error(text,Input)),
    (kb_cache:valid_assertion_id(Id)->true;domain_error(assertion_id,Input)).
query_bounds(Limit,Seconds) :-
    kb_limits:validate_result_limit(queryLimit,Limit),must_be(number,Seconds),
    (Seconds>0,Seconds=<30->true;domain_error(query_timeout,Seconds)).
query_scope(Input,none) :- (var(Input);Input==none),!.
query_scope(context(Mt),context(Mt)) :- !,must_be(ground,Mt).
query_scope(Mt,context(Mt)) :- must_be(ground,Mt).
submit_inference(kb,query(Text,Scope,Limit,Seconds),Accepted) :- !,
    queue_query(Text,Scope,Limit,Seconds,Accepted).
submit_inference(question,question(Id,Limit,Seconds),Accepted) :- !,
    queue_question(Id,Limit,Seconds,Accepted).
submit_inference(Kind,Request,_) :- domain_error(bounded_inference_request,Kind-Request).

selection(Paths,Files) :-
    must_be(list,Paths),maplist(canonical_path,Paths,Resolved),list_to_set(Resolved,Files).
canonical_path(Input,File) :-
    (atom(Input)->Path=Input;string(Input)->atom_string(Path,Input);type_error(text,Input)),
    repo_root(Root),absolute_file_name(Path,File,[relative_to(Root),access(none)]).
cached_snapshot(Input,Snapshot) :-
    must_be(dict,Input),must_be(atom,Input.source),
    must_be(atom,Input.sourceHash),must_be(atom,Input.outputHash),
    canonical_path(Input.source,Source),Snapshot=Input.put(source,Source).

compiler_options(Options,[edit(false),progress(none)|Options]) :-
    must_be(list,Options),maplist(compiler_option,Options).
compiler_option(force(B)) :- !,must_be(boolean,B).
compiler_option(strict_mappings(B)) :- !,must_be(boolean,B).
compiler_option(sumo_mappings(B)) :- !,must_be(boolean,B).
compiler_option(diagnostics(B)) :- !,must_be(boolean,B).
compiler_option(semantic_shape_checks(false)) :- !.
compiler_option(encoding(E)) :- !,must_be(atom,E).
compiler_option(features(F)) :- !,must_be(list(atom),F).
compiler_option(state_dir(D)) :- !,must_be(atom,D).
compiler_option(Option) :- domain_error(file_compiler_option,Option).

submit(Operation,Expected,Label,Files,Accepted) :-
    submit_to(file,Operation,Expected,Label,Files,Accepted).
submit_to(Type,Operation,Expected,Label,Files,Accepted) :-
    accepted_generation(Type,Expected,Generation),
    uuid(Id),get_time(Now),
    AcceptedState=accepted(false),
    setup_call_cleanup(kb_activity:acquire_application(Id),
      sig_atomic((jobs_locked(
       (pool(Type,_,Profile),run_state(Type,running)->
         aggregate_all(count,(job(_,M,_,_),M.pool==Type,\+terminal(M.state)),Count),
         (Count<Profile.queueCapacity->true;throw(error(task_queue_full(Type),_))),
         flag(powder_file_job_sequence,Sequence,Sequence+1),
         Meta=task{id:Id,pool:Type,label:Label,files:Files,state:queued,sequence:Sequence,
           createdAt:Now,startedAt:null,finishedAt:null,generationAtAcceptance:Generation,
           progress:_{phase:queued,completedFiles:0,totalFiles:0},cancelable:true},
         assertz(job(Id,Meta,Operation,pending)),
         initial_unit(Type,Operation,N,Action),assertz(unit(Id,N,none,pending,Action))
       ;not_accepting(Type))),
       nb_setarg(1,AcceptedState,true))),
      (arg(1,AcceptedState,true)->true;kb_activity:release_application(Id))),
    wake_manager,Accepted=_{accepted:true,jobId:Id,pool:Type,state:queued}.
initial_unit(file,Operation,0,plan(Operation)).
initial_unit(inference,Operation,1,Operation).
not_accepting(file) :- throw(error(file_pool_not_accepting,_)).
not_accepting(inference) :- throw(error(inference_pool_not_accepting,_)).
accepted_generation(inference,_,Generation) :- !,kb_store:generation(Generation).
accepted_generation(file,Expected,Generation) :-
    with_mutex(openworld_store,
      (kb_store:generation(Current),
       (Expected==none->Generation=none
       ;Expected==any->Generation=Current
       ;must_be(integer,Expected),
        (Expected=:=Current->Generation=Current;
         throw(error(generation_conflict(Expected,Current),_)))))).

wake_manager :-
    (manager(_,Queue)->catch((thread_send_message(Queue,tick,[timeout(0)])->true;true),_,true);true).
manager_loop(Control) :-
    (thread_get_message(Control,Message,[timeout(0.1)])->true;Message=tick),
    (Message==stop->true;
     catch(maintain_pool,Error,
       (message_to_string(Error,Text),jobs_locked((retractall(service_error(_)),assertz(service_error(Text)))))),
     manager_loop(Control)).

maintain_pool :-
    with_mutex(powder_pools,
      forall(pool(Type,Queue,Profile),maintain_one_pool(Type,Queue,Profile))).
maintain_one_pool(Type,Queue,Profile) :-
        reap_workers(Type),
        jobs_locked(
          (aggregate_all(count,worker(Type,_,_),Total),
           aggregate_all(count,(pool_unit(Type,_,_,_,S,_),memberchk(S,[scheduled,running])),Active),
           aggregate_all(count,pool_unit(Type,_,_,_,pending,_),Pending),
           Desired is min(Profile.max,max(Profile.start,Active+Pending+Profile.spare)),
           Add is max(0,Desired-Total))),
        forall(between(1,Add,_),spawn_worker(Type,Queue)),
        wake_excess_workers(Type,Queue,Profile.max),
        dispatch_available(Type,Queue).
wake_excess_workers(Type,Queue,Maximum) :-
    jobs_locked(aggregate_all(count,
      (worker(Type,_,State),State\==retiring),Total)),
    Excess is max(0,Total-Maximum),send_worker_wakes(Excess,Queue).
send_worker_wakes(0,_) :- !.
send_worker_wakes(N,Queue) :-
    (thread_send_message(Queue,wake,[timeout(0)])->Next is N-1,send_worker_wakes(Next,Queue);true).
pool_unit(Type,Id,N,File,State,Value) :-
    unit(Id,N,File,State,Value),job(Id,Meta,_,_),Meta.pool==Type.

reap_workers(Type) :-
    forall((worker(Type,Thread,_),thread_property(Thread,status(Status)),Status\==running),
      (thread_join(Thread,_),
       jobs_locked(
         (retractall(worker(Type,Thread,_)),
          forall(unit(Id,N,File,running,assigned(Thread,_)),
            (retractall(unit(Id,N,_,_,_)),
             (N==final->Key=worker_failure(Thread);Key=N),
             assertz(unit(Id,Key,File,error,error(file_worker_exited(Status),_))),
             retractall(reservation(_,Id,N)))))))).

dispatch_available(Type,Queue) :-
    jobs_locked(
      (aggregate_all(count,(worker(Type,_,State),State\==retiring),Total),
       pool(Type,Queue,Profile),Capacity is min(Total,Profile.max),
       aggregate_all(count,(pool_unit(Type,_,_,_,S,_),memberchk(S,[scheduled,running])),Active),
       Active<Capacity,choose_work(Type,Id,N,File,Action)->
         (N==final->assertz(unit(Id,final,none,scheduled,finalize))
         ;retract(unit(Id,N,File,pending,Action)),assertz(unit(Id,N,File,scheduled,Action))),
         (File==none->true;assertz(reservation(File,Id,N))),
         (thread_send_message(Queue,work(Id,N,Action),[timeout(0)])->Sent=true;
          retract(unit(Id,N,File,scheduled,Action)),
          (N==final->true;assertz(unit(Id,N,File,pending,Action))),
          retractall(reservation(_,Id,N)),Sent=false)
      ;Sent=false)),
    (Sent==true->dispatch_available(Type,Queue);true).

choose_work(Type,Id,final,none,finalize) :-
    job(Id,M,Operation,pending),M.pool==Type,\+terminal(M.state),
    \+unit(Id,final,_,_,_),
    \+ (unit(Id,_,_,State,_),memberchk(State,[pending,scheduled,running])),
    (Type==inference;cancel_requested(Id);unit(Id,_,_,error,_);Operation=index(_,_);publication_turn(Id)),!.
choose_work(Type,Id,N,File,Action) :-
    findall(Share-Sequence-I-K-F-A,
      (unit(I,K,F,pending,A),\+cancel_requested(I),\+reservation(F,_,_),
       job(I,M,_,pending),M.pool==Type,Sequence=M.sequence,
       aggregate_all(count,(unit(I,_,_,S,_),memberchk(S,[scheduled,running])),Share)),
      Candidates),
    keysort(Candidates,[_-_-Id-N-File-Action|_]).

mutation(replace(_,_)).
mutation(cached(_)).
mutation(unload(_)).
publication_turn(Id) :-
    job(Id,M,_,_),
    \+ (job(Other,Earlier,Operation,_),Other\==Id,mutation(Operation),
       Earlier.sequence<M.sequence,\+terminal(Earlier.state)).

worker_loop(Type,Queue) :-
    (retire_idle_worker(Type)->true;worker_receive(Type,Queue)).
retire_idle_worker(Type) :-
    thread_self(Thread),
    jobs_locked(
      (pool(Type,_,Profile),worker(Type,Thread,idle),
       aggregate_all(count,(worker(Type,_,State),State\==retiring),Total),
       Total>Profile.max,
       retract(worker(Type,Thread,idle)),assertz(worker(Type,Thread,retiring)))).
worker_receive(Type,Queue) :-
    thread_get_message(Queue,Work),
    (Work==stop->true;
     Work==wake->worker_loop(Type,Queue);
     Work=work(Id,N,Action),thread_self(Thread),
     jobs_locked(
       (retract(unit(Id,N,File,scheduled,Action)),
        assertz(unit(Id,N,File,running,assigned(Thread,Action))),
        retractall(worker(Type,Thread,_)),assertz(worker(Type,Thread,running(Id,N))),
        start_job(Id))),
     setup_call_cleanup((asserta(current_job(Id,N),Ref),asserta(current_pool(Type),PoolRef)),
       catch((with_application(execute_unit(Id,N,Action))->true;throw(error(file_work_failed(Id,N),_))),
             Error,unit_error(Id,N,Error)),
       (erase(Ref),erase(PoolRef))),
     jobs_locked((retractall(worker(Type,Thread,_)),assertz(worker(Type,Thread,idle)))),
     wake_manager,worker_loop(Type,Queue)).

start_job(Id) :-
    retract(job(Id,M,Operation,Outcome)),
    (M.startedAt==null->get_time(Now);Now=M.startedAt),
    New=M.put(_{state:running,startedAt:Now}),
    assertz(job(Id,New,Operation,Outcome)).

execute_unit(Id,final,finalize) :- !,finalize_job(Id).
execute_unit(Id,N,infer(Request)) :- !,
    interrupt_if_requested(Id),
    compiler_progress(Id,N,_{phase:querying}),
    execute_inference(Request,Result),deliver_unit(Id,N,inference_result(Result)).
execute_unit(Id,N,Action) :-
    interrupt_if_requested(Id),
    execute_file_work(Action,Id,N).
execute_inference(query(Text,Scope,Limit,Seconds),Result) :-
    (Scope=none->true;Scope=context(Mt)),
    kb_store:query_text_direct(Text,Mt,Limit,Seconds,Result).
execute_inference(question(Id,Limit,Seconds),Result) :-
    kb_questions:run_question_direct(Id,Limit,Seconds,Result).

execute_file_work(plan(Operation),Id,0) :-
    plan_operation(Operation,Units,Files),
    jobs_locked(
      (interrupt_if_requested(Id),
       retractall(unit(Id,0,_,_,_)),assertz(unit(Id,0,none,done,none)),
       add_units(Units,Id,1),
       retract(job(Id,M,Op,Outcome)),length(Files,Count),
       New=M.put(_{files:Files,progress:_{phase:preparing,completedFiles:0,totalFiles:Count}}),
       assertz(job(Id,New,Op,Outcome)))).
execute_file_work(compile(File,Options,Mode,Hash),Id,N) :-
    kb_compile:with_progress_callback(kb_jobs:compiler_progress(Id,N),
      kb_compile:with_prepared_source(File,Hash,
        kb_compile:compile_sources([File],Options,Summary))),
    Summary.results=[Info],interrupt_if_requested(Id),
    (Mode==load,memberchk(Info.status,[generated,cache_hit])->
      compiler_progress(Id,N,_{phase:loading,source:File,fraction:0}),
      kb_store:prepare_source(Info,Prepared),
      deliver_staged(Id,N,Prepared,compiled(Info))
    ;deliver_unit(Id,N,compiled(Info,none))).
execute_file_work(cached_source(Snapshot),Id,N) :-
    compiler_progress(Id,N,_{phase:loading,source:Snapshot.source,fraction:0}),
    kb_store:prepare_cached_source(Snapshot,Prepared),
    interrupt_if_requested(Id),
    (Prepared=retained(_)->deliver_unit(Id,N,cached(Prepared));
     deliver_staged(Id,N,Prepared,cached)).

plan_operation(replace(Paths,Options),Units,Files) :-
    kb_compile:implementation_hash(Hash),
    kb_compile:discover_sources(Paths,Files),maplist(compile_unit(Options,load,Hash),Files,Units).
plan_operation(index(Paths,Options),Units,Files) :-
    kb_compile:implementation_hash(Hash),
    kb_compile:discover_sources(Paths,Files),maplist(compile_unit(Options,index,Hash),Files,Units).
plan_operation(cached(Snapshots),Units,Files) :-
    findall(Source-cached_source(S),(member(S,Snapshots),Source=S.source),Units),
    pairs_keys(Units,Files),sort(Files,Unique),
    (same_length(Files,Unique)->true;throw(error(duplicate_additive_sources,_))).
plan_operation(unload(File),[],[File]).
compile_unit(Options,Mode,Hash,File,File-compile(File,Options,Mode,Hash)).
add_units([],_,_).
add_units([File-Action|Rest],Id,N) :-
    cache_paths(File,Key,_),assertz(unit(Id,N,Key,pending,Action)),
    Next is N+1,add_units(Rest,Id,Next).

% The setup/cleanup bracket owns the native snapshot until the atomic handoff.
% A cancellation during SWI native loading is deferred until setup unwinds.
deliver_staged(Id,N,Prepared,Kind) :-
    Transferred=transferred(false),
    setup_call_cleanup(kb_store:stage_source(Prepared,Entry),
      (stage_value(Kind,Entry,Value),
       sig_atomic((deliver_unit(Id,N,Value),nb_setarg(1,Transferred,true)))),
      (arg(1,Transferred,true)->true;
       cleanup_entries([Entry],Problems),
       (Problems=[]->true;throw(error(file_pool_cleanup_failed(Problems),_))))).
stage_value(compiled(Info),Entry,compiled(Info,Entry)).
stage_value(cached,Entry,cached(Entry)).

deliver_unit(Id,N,Value) :-
    jobs_locked(
      (interrupt_if_requested(Id),
       retract(unit(Id,N,File,running,_)),
       assertz(unit(Id,N,File,done,Value)),retractall(reservation(_,Id,N)),
       retractall(unit_progress(Id,N,_)),
       completed_progress(Id))).
unit_error(Id,N,Error) :-
    (N==final->
       findall(Entry,(unit(Id,_,_,done,Value),value_stage(Value,Entry)),Staged),
       cleanup_entries(Staged,Problems),cleanup_outcome(failed(Error),Problems,Outcome),
       finish_job(Id,Outcome);
     jobs_locked(
       (unit(Id,N,File,running,_)->
         retractall(unit(Id,N,_,_,_)),assertz(unit(Id,N,File,error,Error)),
         retractall(reservation(_,Id,N)),retractall(unit_progress(Id,N,_)),completed_progress(Id)
       ;true))).

completed_progress(Id) :-
    aggregate_all(count,(unit(Id,N,_,S,_),integer(N),N>0,memberchk(S,[done,error,cancelled])),Done),
    retract(job(Id,M,Op,Outcome)),
    (M.pool==file->Progress=M.progress.put(completedFiles,Done)
    ;Progress=M.progress.put(completedTasks,Done)),
    assertz(job(Id,M.put(progress,Progress),Op,Outcome)).
compiler_progress(Id,N,Progress) :-
    interrupt_if_requested(Id),
    jobs_locked((retractall(unit_progress(Id,N,_)),assertz(unit_progress(Id,N,Progress)))).

finalize_job(Id) :-
    jobs_locked(
      (retract(job(Id,M,Op,pending)),
       (cancel_requested(Id)->Phase=cleanup;Op=index(_,_)->Phase=aggregate;
        Op=infer(_)->Phase=finishing;Phase=publishing),
       New=M.put(_{cancelable:false,progress:M.progress.put(phase,Phase)}),
       assertz(job(Id,New,Op,pending)),
       findall(N-Value,(unit(Id,N,_,done,Value),integer(N),N>0),Pairs),
       keysort(Pairs,Sorted),pairs_values(Sorted,Values),
       findall(E,unit(Id,_,_,error,E),Errors))),
    findall(Entry,(member(Value,Values),value_stage(Value,Entry)),Staged),
    Published=published(false),
    catch(
      (cancel_requested(Id)->throw(job_cancelled(Id))
      ;Errors=[Error|_]->throw(Error)
      ;publish_operation(Op,Values,New.generationAtAcceptance,New.startedAt,Result),
       nb_setarg(1,Published,true),Original=result(Result)),
      Error,Original=failed(Error)),
    (arg(1,Published,true)->Problems=[];cleanup_entries(Staged,Problems)),
    cleanup_outcome(Original,Problems,Outcome),
    finish_job(Id,Outcome).

cleanup_entries(Entries,Problems) :-
    findall(Problem,(member(Entry,Entries),cleanup_entry(Entry,Problem)),Problems).
cleanup_entry(Entry,Problem) :-
    Entry=entry(_,_,_,Native,_,_),
    catch((kb_store:cleanup_staged([Entry])->Error=none;
           Error=error(native_cleanup_failed(Native),_)),Error,true),
    (Error==none->retractall(pending_cleanup(Native)),fail
    ;(pending_cleanup(Native)->true;assertz(pending_cleanup(Native))),
     message_to_string(Error,Text),Problem=_{path:Native,message:Text}).
cleanup_outcome(Outcome,[],Outcome) :- !.
cleanup_outcome(Original,Problems,failed(error(file_job_cleanup_failed(Original,Problems),_))).

value_stage(compiled(_,Entry),Entry) :- Entry\==none.
value_stage(cached(Entry),Entry) :- Entry=entry(_,_,_,_,_,_).
publish_operation(index(_,_),Values,_,_,Summary) :-
    compilation_summary(Values,Summary),complete_compilation(Summary).
publish_operation(infer(_),[inference_result(Result)],_,_,Result).
publish_operation(replace(_,_),Values,Expected,Start,Status) :-
    compilation_summary(Values,Summary),complete_compilation(Summary),
    findall(Entry,member(compiled(_,Entry),Values),Staged),
    kb_store:publish_staged_sources(Staged,Expected,Start,Status).
publish_operation(cached(_),Values,Expected,_,Status) :-
    findall(Entry,member(cached(Entry),Values),Staged),
    kb_store:publish_staged_addition(Staged,Expected,Status).
publish_operation(unload(Path),_,Expected,_,Status) :-
    kb_store:unload_source(Path,Expected,Status).

compilation_summary(Values,Summary) :-
    findall(Info,member(compiled(Info,_),Values),Infos),
    aggregate_all(count,(member(I,Infos),I.status==generated),Generated),
    aggregate_all(count,(member(I,Infos),I.status==cache_hit),Hits),
    aggregate_all(count,(member(I,Infos),I.status==busy),Busy),
    aggregate_all(count,(member(I,Infos),I.status==failed),Failed),
    findall(W,(member(I,Infos),member(W,I.warnings)),Warnings),length(Warnings,WarningCount),
    (Failed>0->Code=1;Busy>0->Code=3;Code=0),
    Summary=summary{generated:Generated,cacheHits:Hits,busy:Busy,failures:Failed,
      warnings:WarningCount,results:Infos,exitCode:Code}.
complete_compilation(Summary) :-
    (Summary.failures=:=0,Summary.busy=:=0->true;
     throw(error(compile_incomplete(Summary),_))).

finish_job(Id,Outcome) :-
    jobs_locked(
      (retract(job(Id,M,Op,_)),get_time(Now),
       (cancel_requested(Id)->State=cancelled;Outcome=result(_)->State=succeeded;State=failed),
       New=M.put(_{state:State,finishedAt:Now,cancelable:false,progress:M.progress.put(phase,State)}),
       assertz(job(Id,New,Op,Outcome)),
       retractall(unit(Id,_,_,_,_)),retractall(unit_progress(Id,_,_)),
       retractall(reservation(_,Id,_)),prune_history)),
    kb_activity:release_application(Id),wake_manager.
terminal(succeeded).
terminal(failed).
terminal(cancelled).

interrupt_if_requested(Id) :-
    (cancel_requested(Id)->throw(job_cancelled(Id));true).
interrupt_job(Id,N) :-
    (current_job(Id,N),N\==final->interrupt_if_requested(Id);true).
cancel_job(Id) :-
    jobs_locked(
      ((job(Id,M,_,_)->true;existence_error(task,Id)),
       (terminal(M.state)->Threads=[]
       ;M.cancelable==false->throw(error(permission_error(cancel,publishing_task,Id),_))
       ;(cancel_requested(Id)->true;assertz(cancel_requested(Id))),
        forall(unit(Id,N,F,pending,_),
          (retractall(unit(Id,N,_,_,_)),assertz(unit(Id,N,F,cancelled,none)))),
        findall(Thread-N,unit(Id,N,_,running,assigned(Thread,_)),Threads)))),
    forall(member(Thread-N,Threads),
      catch(thread_signal(Thread,kb_jobs:interrupt_job(Id,N)),_,true)),
    wake_manager.

await_result(Id,Result) :- await_result(Id,infinite,Result).
await_result(Id,Timeout,Result) :-
    (Timeout==infinite->Options=[];must_be(number,Timeout),Timeout>=0,Options=[timeout(Timeout)]),
    (thread_wait(terminal_job(Id),[module(kb_jobs),wait_preds([job/4]),retry_every(0.05)|Options])->true;
     throw(error(timeout_error(file_job,Id),_))),
    jobs_locked(job(Id,_,_,Outcome)),
    (Outcome=result(Result)->true;Outcome=failed(Error),throw(Error)).
terminal_job(Id) :-
    (job(Id,M,_,_)->terminal(M.state);throw(error(existence_error(task,Id),_))).

job_status(Id,Status) :-
    jobs_locked(
      (job(Id,M,_,Outcome)->detail_status(M,Outcome,Status);
       throw(error(existence_error(task,Id),_)))).
detail_status(M,Outcome,Status) :-
    findall(P,unit_progress(M.id,_,P),Active),
    Base=M.put(progress,M.progress.put(activeFiles,Active)),
    (Outcome=result(Result)->Status=Base.put(result,Result)
    ;Outcome=failed(Error)->error_details(Error,Details),Status=Base.put(error,Details)
    ;Status=Base).
error_details(error(compile_incomplete(Summary),_),Details) :- !,
    compile_report(Summary,Base),
    (Summary.failures=:=0->Kind=busy;Kind=compilation),
    Details=Base.put(_{kind:Kind,summary:Summary}).
error_details(error(generation_conflict(Expected,Current),_),
              _{kind:generation_conflict,expected:Expected,current:Current,message:Text}) :- !,
    format(string(Text),'KB generation changed (expected ~w, current ~w).',[Expected,Current]).
error_details(job_cancelled(_),_{kind:cancelled,message:"Task cancelled; completed file caches are retained."}) :- !.
error_details(time_limit_exceeded,_{kind:timeout,message:"Query time limit exceeded."}) :- !.
error_details(Error,_{kind:execution,message:Text}) :- message_to_string(Error,Text).

task_overview(Overview) :-
    jobs_locked(
      (findall(Sequence-S,(job(_,M,_,O),Sequence=M.sequence,public_status(M,O,S)),Pairs),
       keysort(Pairs,Sorted),reverse(Sorted,Descending),pairs_values(Descending,Tasks),
       findall(Stats,(pool(Type,_,_),pool_statistics(Type,Stats)),Pools),
       findall(E,service_error(E),Errors))),
    Overview=_{tasks:Tasks,pools:Pools,serviceErrors:Errors,completedHistoryLimit:100,
      persistence:"Transient jobs; 100 completed jobs per pool. File caches persist; queries use pinned generations."}.
public_status(M,Outcome,Status) :-
    M.pool==file,!,detail_status(M,Outcome,Status).
public_status(M,result(Result),Status) :- !,
    length(Result.solutions,Count),
    Status=M.put(_{resultCount:Count,resultGeneration:Result.generation}).
public_status(M,failed(_),Status) :- !,
    Status=M.put(error,_{message:"Query failed; inspect this job for details."}).
public_status(M,_,Status) :- detail_status(M,pending,Status).
pool_statistics(Stats) :- pool_statistics(file,Stats).
pool_statistics(Type,Stats) :-
    pool(Type,_,Profile),Capacity=Profile.queueCapacity,
    aggregate_all(count,worker(Type,_,_),Total),
    aggregate_all(count,worker(Type,_,running(_,_)),Busy),
    aggregate_all(count,worker(Type,_,retiring),Retiring),Idle is Total-Busy-Retiring,
    aggregate_all(count,(pool_unit(Type,_,_,_,S,_),memberchk(S,[scheduled,running])),InFlight),
    aggregate_all(count,(job(_,M,_,_),M.pool==Type,M.state==queued),Queued),
    aggregate_all(count,(job(_,M,_,_),M.pool==Type,\+terminal(M.state)),Outstanding),
    (run_state(Type,State)->true;State=stopped),
    Stats=_{pool:Type,profile:Profile,total:Total,busy:Busy,idle:Idle,queued:Queued,
      retiring:Retiring,inFlight:InFlight,outstanding:Outstanding,
      queueCapacity:Capacity,state:State,
      sparePolicy:"Persistent workers grow with demand; lowering maximum retires idle workers only."}.
prune_history :-
    forall(member(Type,[file,inference]),prune_pool_history(Type)).
prune_pool_history(Type) :-
    findall(Sequence-Id,(job(Id,M,_,_),M.pool==Type,terminal(M.state),Sequence=M.sequence),Pairs),
    keysort(Pairs,Sorted),length(Sorted,N),Remove is max(0,N-100),
    length(Old,Remove),append(Old,_,Sorted),
    forall(member(_-Id,Old),(retractall(job(Id,_,_,_)),retractall(cancel_requested(Id)))).

% HTTP ownership is independent. Detaching/stopping a listener never stops jobs.
attach_http(Port,Profile) :- must_be(integer,Port),retractall(http_pool(Port,_)),assertz(http_pool(Port,Profile)).
detach_http(Port) :- retractall(http_pool(Port,_)).

stop_file_pool(Mode) :- stop_pool(file,Mode).
stop_inference_pool(Mode) :- stop_pool(inference,Mode).
stop_pool(Type,Mode) :-
    must_be(atom,Mode),
    (memberchk(Mode,[drain,cancel])->true;domain_error(file_pool_shutdown,Mode)),
    (current_pool(Type)->throw(error(permission_error(stop,own_pool(Type),Mode),_));true),
    with_mutex(powder_pool_lifecycle,stop_pool_locked(Type,Mode)).
stop_pool_locked(Type,Mode) :-
    with_mutex(powder_pools,
      jobs_locked(
        (pool(Type,_,_)->set_run_state(Type,Mode),
         findall(Id,(job(Id,M,_,_),M.pool==Type,\+terminal(M.state)),Ids)
        ;Ids=[]))),
    (Mode==cancel->forall(member(Id,Ids),cancel_for_shutdown(Id));true),
    wake_manager,
    thread_wait(no_pending_jobs(Type),
      [module(kb_jobs),wait_preds([job/4]),retry_every(0.05)]),
    destroy_idle_pool(Type),
    retry_file_cleanup(Type),
    kb_store:cleanup_retired_snapshots(Issues),
    (Issues=[]->true;throw(error(query_snapshot_cleanup_failed(Issues),_))).
retry_file_cleanup(inference).
retry_file_cleanup(file) :-
    findall(entry(none,none,none,Native,[],false),pending_cleanup(Native),Remaining),
    cleanup_entries(Remaining,Problems),
    (Problems=[]->true;throw(error(file_pool_cleanup_failed(Problems),_))).
no_pending_jobs(Type) :- \+ (job(_,M,_,_),M.pool==Type,\+terminal(M.state)).
cancel_for_shutdown(Id) :-
    catch(cancel_job(Id),error(permission_error(cancel,publishing_task,_),_),true).
destroy_idle_pool(Type) :-
    with_mutex(powder_pools,
      (reap_workers(Type),jobs_locked(
        (retract(pool(Type,Queue,_))->
          findall(T,worker(Type,T,_),Threads),
          findall(T,(worker(Type,T,State),State\==retiring),Consumers)
        ;Queue=none,Threads=[],Consumers=[])))),
    (Queue\==none->
      forall(member(_,Consumers),thread_send_message(Queue,stop)),
      forall(member(T,Threads),thread_join(T,_)),message_queue_destroy(Queue)
    ;true),
    retractall(worker(Type,_,_)),clear_run_state(Type),
    (pool(_,_,_)->true;stop_manager).
stop_manager :-
    (retract(manager(Thread,Control))->
      (thread_get_message(Control,_,[timeout(0)])->true;true),
      thread_send_message(Control,stop),thread_send_message(Thread,go),
      thread_join(Thread,_),message_queue_destroy(Control)
    ;true).
