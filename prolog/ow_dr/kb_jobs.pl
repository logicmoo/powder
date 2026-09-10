:- module(kb_jobs, [start_pools/1, stop_pools/0, pools_started/0, in_loader/0, in_inference/0,
    submit_load/3, submit_unload/3, submit_inference/3, submit_native/2,
    await_result/2, job_status/2, task_overview/1, cancel_job/1,
    wait_loader_turn/1, loader_progress/2, mark_publishing/1,
    attach_http/2, detach_http/1, current_job_id/1]).
:- use_module(kb_activity).
:- use_module(kb_config).
:- use_module(kb_messages).
:- use_module(kb_store, []).
:- use_module(kb_prolog, []).
:- use_module(library(uuid)).
:- use_module(library(error)).
:- use_module(library(http/thread_httpd)).
:- dynamic pool/3, worker/3, job/4, manager/2, http_pool/2, service_error/2.
:- dynamic cancel_requested/1.
:- dynamic scheduler_hook/1.
:- thread_local current_job/2.
:- multifile http:schedule_workers/1.
:- dynamic http:schedule_workers/1.
:- meta_predicate job_update(0).

job_update(Goal) :- with_mutex(powder_jobs,transaction(Goal)).

pools_started :- pool(loader,_,_),pool(inference,_,_).
in_loader :- current_job(_,loader).
in_inference :- current_job(_,inference).
current_job_id(Id) :- current_job(Id,_).

start_pools(Settings) :-
    with_mutex(powder_pools,
      (forall(member(Type,[loader,inference]),
        (pool(Type,_,_)->true;
         get_dict(Type,Settings.pools,Profile),
         message_queue_create(Queue,[max_size(100)]),assertz(pool(Type,Queue,Profile)),
         forall(between(1,Profile.start,_),spawn_worker(Type,Queue)))),
       ensure_manager)).
ensure_started :-
    (pools_started->true;throw(error(task_pools_require_startup,_))).
ensure_manager :-
    (manager(_,_)->true;
      message_queue_create(Queue,[max_size(1)]),
      thread_create((set_output(user_output),manager_loop(Queue)),Thread,
                    [inherit_from(main),at_exit(retractall(manager(_,Queue)))]),
      assertz(manager(Thread,Queue))).

spawn_worker(Type,Queue) :-
    thread_create((set_output(user_output),thread_get_message(go),worker_loop(Type,Queue)),Thread,[inherit_from(main)]),
    assertz(worker(Type,Thread,starting)),thread_send_message(Thread,go).
worker_loop(Type,Queue) :-
    thread_self(Thread),set_worker(Type,Thread,idle),
    thread_get_message(Queue,Message),
    (Message==stop->retractall(worker(Type,Thread,_))
    ;catch(run_job(Type,Thread,Message),Error,worker_fault(Type,Message,Error)),
     worker_loop(Type,Queue)).
set_worker(Type,Thread,State) :-
    job_update((retractall(worker(Type,Thread,_)),assertz(worker(Type,Thread,State)))).

submit_load(Paths,Expected,Accepted) :-
    must_be(list,Paths),maplist(must_be(atom),Paths),
    maplist(absolute_source,Paths,Resolved),list_to_set(Resolved,Files),
    submit(loader,replace(Files),Expected,"Load sources",Files,Accepted).
submit_unload(Path,Expected,Accepted) :-
    must_be(atom,Path),kb_paths:repo_root(Root),
    absolute_file_name(Path,File,[relative_to(Root),access(none)]),
    submit(loader,unload(File),Expected,"Unload source",[File],Accepted).
submit_native(Operation,Accepted) :-
    native_operation(Operation,Normalized,Files),
    submit(loader,Normalized,any,"Native KB load",Files,Accepted).
absolute_source(Input,File) :- absolute_file_name(Input,File,[access(none)]).
native_operation(native_load(Input,Module,Options),native_load(File,Module,Options),[File]) :-
    must_be(atom,Module),absolute_source(Input,File).
native_operation(import_cache(Input,Module),import_cache(File,Module),[File]) :-
    must_be(atom,Module),absolute_source(Input,File).
submit_inference(Kind,Request,Accepted) :-
    memberchk(Kind,[kb,prolog]),must_be(ground,Request),
    (Kind==prolog->Label="Prolog query";Label="KB inference"),
    submit(inference,infer(Kind,Request),any,Label,[],Accepted).

submit(Type,Operation,Expected,Label,Files,Accepted) :-
    ensure_started,uuid(Id),get_time(Now),
    with_mutex(openworld_store,
      (kb_store:generation(Generation),
       (Expected==any;Expected=:=Generation)->true;
       kb_store:generation(Current),throw(error(generation_conflict(Expected,Current),_)))),
    job_update(
      (flag(powder_job_sequence,Sequence,Sequence+1),
       Meta=task{id:Id,pool:Type,label:Label,files:Files,state:queued,createdAt:Now,
         startedAt:null,finishedAt:null,sequence:Sequence,generationAtAcceptance:Generation,
         progress:_{phase:queued,completedFiles:0,totalFiles:0},cancelable:true},
       assertz(job(Id,Meta,Operation,pending)),
       pool(Type,Queue,_),
       (thread_send_message(Queue,Id,[timeout(0)])->true;
         retractall(job(Id,_,_,_)),throw(error(task_queue_full(Type),_))))),
    wake_manager,Accepted=_{accepted:true,jobId:Id,pool:Type,state:queued}.

run_job(Type,Thread,Id) :-
    job_update(
      (job(Id,Meta,Operation,pending),Meta.state==queued->
        retract(job(Id,Meta,Operation,pending)),get_time(Start),
        Running=Meta.put(_{state:running,startedAt:Start,progress:_{phase:running}}),
        assertz(job(Id,Running,Operation,pending)),Proceed=true
      ;Proceed=false)),
    (Proceed==false->true;
      set_worker(Type,Thread,running(Id)),wake_manager,
      setup_call_cleanup(asserta(current_job(Id,Type),Ref),
        (catch(with_application((interrupt_if_requested(Id),execute_operation(Id,Operation,Result))),Error,Failure=Error),
         complete_job(Id,Result,Failure)),
        erase(Ref))).

execute_operation(Id,replace(Paths),Result) :-
    kb_store:load_sources_worker(Paths,Id,Result).
execute_operation(Id,unload(Path),Result) :-
    wait_loader_turn(Id),mark_publishing(Id),
    kb_store:unload_source_worker(Path,Result).
execute_operation(Id,native_load(File,Module,Options),_{loaded:File}) :-
    wait_loader_turn(Id),mark_publishing(Id),
    kb_runtime:native_load(File,Module,Options).
execute_operation(Id,import_cache(File,Module),_{loaded:File}) :-
    wait_loader_turn(Id),mark_publishing(Id),kb_runtime:import_cache(File,Module).
execute_operation(_,infer(kb,query(Text,Scope,Limit,Seconds)),Result) :-
    scope_term(Scope,Mt),kb_store:query_text(Text,Mt,Limit,Seconds,Result).
execute_operation(_,infer(prolog,query(Text,Scope,Limit,Seconds)),Result) :-
    scope_term(Scope,Mt),kb_prolog:run_prolog(Text,Mt,Limit,Seconds,Result).
scope_term(none,_).
scope_term(context(Mt),Mt).

complete_job(Id,Result,Failure) :-
    (nonvar(Failure)->
      (Failure=job_cancelled(Id)->State=cancelled;State=failed),
      error_details(Failure,Details),Outcome=failed(Details)
    ;is_dict(Result),get_dict(status,Result,Status),memberchk(Status,[exception,timeout,cancelled])->
      (Status==cancelled->State=cancelled;State=failed),Outcome=result(Result)
    ;State=succeeded,Outcome=result(Result)),
    job_update(
      (retract(job(Id,Meta,Operation,_)),get_time(Finish),
       Progress=Meta.progress.put(phase,State),
       Done=Meta.put(_{state:State,finishedAt:Finish,cancelable:false,progress:Progress}),
       assertz(job(Id,Done,Operation,Outcome)),prune_history)),
    wake_manager.
error_details(error(compile_incomplete(Summary),_),Report) :- !,compile_report(Summary,Report).
error_details(Error,_{message:Message}) :-
    (Error=job_cancelled(_)->Message="Task cancelled. Completed side effects are not rolled back.";
      message_to_string(Error,Message)).
worker_fault(Type,Id,Error) :-
    print_message(error,Error),error_details(Error,Details),
    record_service_error(Type,Details),
    (job(Id,_,_,pending)->complete_job(Id,_,Error);true).

wait_loader_turn(Id) :-
    thread_wait(loader_turn(Id),[module(kb_jobs),wait_preds([job/4]),retry_every(0.1)]).
loader_turn(Id) :-
    job(Id,Meta,_,_),Sequence=Meta.sequence,
    \+ (job(Other,Earlier,_,_),Other\==Id,Earlier.pool==loader,
        Earlier.sequence<Sequence,\+terminal(Earlier.state)).
mark_publishing(Id) :-
    job_update(
      (retract(job(Id,Meta,Operation,Outcome)),
       New=Meta.put(_{cancelable:false,progress:_{phase:publishing}}),
       assertz(job(Id,New,Operation,Outcome)))).
loader_progress(Id,Progress) :-
    job_update(
      (retract(job(Id,Meta,Operation,Outcome))->
        New=Meta.put(progress,Progress),assertz(job(Id,New,Operation,Outcome));true)).

await_result(Id,Result) :-
    thread_wait((job(Id,Meta,_,Outcome)->terminal(Meta.state);
                 throw(error(existence_error(task,Id),_))),
                [module(kb_jobs),wait_preds([job/4]),retry_every(0.1)]),
    (Outcome=result(Result)->true;
      throw(error(task_failed(Id,Outcome),_))).
job_status(Id,Status) :-
    with_mutex(powder_jobs,
      (job(Id,Meta,_,Outcome)->detail_status(Meta,Outcome,Status);
       throw(error(existence_error(task,Id),_)))).
detail_status(Meta,result(Result),Status) :- !,Status=Meta.put(result,Result).
detail_status(Meta,failed(Error),Status) :- !,Status=Meta.put(error,Error).
detail_status(Meta,_,Meta).
terminal(succeeded).
terminal(failed).
terminal(cancelled).

cancel_job(Id) :-
    job_update(
      ((job(Id,Meta,Operation,Outcome)->true;throw(error(existence_error(task,Id),_))),
       (terminal(Meta.state)->Action=none;
        Meta.cancelable==false->throw(error(permission_error(cancel,publishing_task,Id),_));
        Meta.state==queued->
          retract(job(Id,Meta,Operation,Outcome)),get_time(Now),
          New=Meta.put(_{state:cancelled,finishedAt:Now,cancelable:false}),
          assertz(job(Id,New,Operation,failed(_{message:"Cancelled before execution."}))),Action=none
       ;assertz(cancel_requested(Id)),
        (worker(_,Thread,running(Id))->Action=signal(Thread);Action=none)))),
    (Action=signal(Thread)->thread_signal(Thread,kb_jobs:interrupt_job(Id));true),
    wake_manager.
interrupt_if_requested(Id) :- (cancel_requested(Id)->interrupt_job(Id);true).
interrupt_job(Id) :-
    (current_job(Id,_),job(Id,Meta,_,_),Meta.cancelable==true->throw(job_cancelled(Id));true).

prune_history :-
    findall(Seq-Id,(job(Id,M,_,_),terminal(M.state),Seq=M.sequence),Pairs),
    keysort(Pairs,Sorted),length(Sorted,N),Remove is max(0,N-100),
    length(Old,Remove),append(Old,_,Sorted),
    forall(member(_-Id,Old),(retractall(job(Id,_,_,_)),retractall(cancel_requested(Id)))).

task_overview(Overview) :-
    with_mutex(powder_jobs,
      findall(Seq-Public,
        (job(_,Meta,_,Outcome),Seq=Meta.sequence,public_task(Meta,Outcome,Public)),Pairs)),
    keysort(Pairs,Sorted),reverse(Sorted,Descending),pairs_values_local(Descending,Tasks),
    findall(Stats,(member(Type,[loader,inference]),pool_stats(Type,Stats)),Background),
    findall(Stats,(kb_server:server_port(Port),http_stats(Port,Stats)),HTTP),
    append(Background,HTTP,Pools),
    findall(_{pool:Type,message:"Worker service error; inspect the local server log."},service_error(Type,_),Errors),
    Overview=_{tasks:Tasks,pools:Pools,completedHistoryLimit:100,
               serviceErrors:Errors,persistence:"Tasks are transient; queued work is not resumed after restart."}.
public_task(Meta,Outcome,Public) :-
    (Meta.pool==loader->detail_status(Meta,Outcome,Full),
      (get_dict(result,Full,R),is_dict(R),get_dict(generation,R,G)->Public=Meta.put(resultGeneration,G)
      ;get_dict(error,Full,E)->Public=Meta.put(error,E);Public=Meta)
    ;Outcome=result(R),is_dict(R),get_dict(solutions,R,Solutions)->length(Solutions,N),Public=Meta.put(resultCount,N)
    ;Meta.state==failed->Public=Meta.put(error,_{message:"Inference failed. The query result contains its private diagnostic details."})
    ;Public=Meta).
pairs_values_local([],[]).
pairs_values_local([_-V|Rest],[V|Values]) :- pairs_values_local(Rest,Values).

pool_stats(Type,Stats) :-
    pool(Type,Queue,Profile),!,
    aggregate_all(count,worker(Type,_,_),Total),
    aggregate_all(count,worker(Type,_,idle),Idle),
    aggregate_all(count,worker(Type,_,running(_)),Busy),
    aggregate_all(count,(job(_,Meta,_,_),get_dict(pool,Meta,Type),get_dict(state,Meta,queued)),Queued),
    message_queue_property(Queue,max_size(Capacity)),
    Stats=_{pool:Type,profile:Profile,total:Total,busy:Busy,idle:Idle,queued:Queued,queueCapacity:Capacity,
            sparePolicy:"Grow to retain spare workers as capacity permits; no idle retirement until shutdown."}.
pool_stats(Type,_{pool:Type,profile:null,total:0,busy:0,idle:0,queued:0,initialized:false}) :-
    memberchk(Type,[loader,inference]).

wake_manager :-
    (manager(_,Queue)->(thread_send_message(Queue,tick,[timeout(0)])->true;true);true).
manager_loop(Queue) :-
    (thread_get_message(Queue,Message,[timeout(0.2)])->true;Message=tick),
    (Message==stop->true;
      catch(maintain_pools,Error,(print_message(error,Error),error_details(Error,D),record_service_error(manager,D))),
      manager_loop(Queue)).
record_service_error(Type,Details) :-
    job_update((retractall(service_error(Type,_)),assertz(service_error(Type,Details)))).
maintain_pools :-
    with_mutex(powder_pools,
      (forall(pool(Type,Queue,Profile),
         (reap_workers(Type),pool_stats(Type,Stats),
          Desired is min(Profile.max,max(Profile.start,Stats.busy+Stats.queued+Profile.spare)),
          Add is max(0,Desired-Stats.total),forall(between(1,Add,_),spawn_worker(Type,Queue)))),
       forall(http_pool(Port,Profile),scale_http(Port,Profile)))).
reap_workers(Type) :-
    forall((worker(Type,Thread,_),thread_property(Thread,status(Status)),Status\==running),
      (thread_join(Thread,_),retractall(worker(Type,Thread,_)))).

attach_http(Port,Profile) :-
    with_mutex(powder_pools,
      (retractall(http_pool(Port,_)),assertz(http_pool(Port,Profile)),install_http_scheduler)),
    wake_manager.
detach_http(Port) :- retractall(http_pool(Port,_)).
http_stats(Port,Stats) :-
    (http_pool(Port,Profile)->true;Profile=null),
    thread_httpd:current_server(Port,_,_,Queue,_,_),
    http_workers(Port,Total),message_queue_property(Queue,size(Queued)),
    (message_queue_property(Queue,waiting(Idle))->true;Idle=0),
    Busy is max(0,Total-Idle),
    term_string(Port,Listener),
    Stats=_{pool:http,listener:Listener,profile:Profile,total:Total,busy:Busy,idle:Idle,queued:Queued,
      scope:"Server-wide workers for this listener",
      statisticsBasis:"Idle = workers waiting on the HTTP accept queue; busy = other workers. No request headers or goals are exposed."}.
scale_http(Port,Profile) :-
    (http_stats(Port,Stats)->
      Desired is min(Profile.max,max(Profile.start,Stats.busy+Stats.queued+Profile.spare)),
      (Desired>Stats.total->http_workers(Port,Desired);true)
    ;true).
install_http_scheduler :-
    (scheduler_hook(Ref),\+clause_property(Ref,erased)->true;
      asserta((http:schedule_workers(Dict):-kb_jobs:managed_http_schedule(Dict),!),Ref),
      retractall(scheduler_hook(_)),assertz(scheduler_hook(Ref))).
managed_http_schedule(Dict) :- get_dict(port,Dict,Port),http_pool(Port,_),wake_manager.

stop_pools :-
    (manager(Manager,ManagerQueue)->thread_send_message(ManagerQueue,stop),thread_join(Manager,_),message_queue_destroy(ManagerQueue);true),
    findall(Id,(job(Id,Meta,_,_),\+terminal(Meta.state)),Ids),
    forall(member(Id,Ids),catch(cancel_job(Id),Error,print_message(warning,Error))),
    forall(pool(Type,Queue,_),
      (findall(Thread,worker(Type,Thread,_),Threads),
       forall(member(_,Threads),thread_send_message(Queue,stop)),
       forall(member(Thread,Threads),thread_join(Thread,_)),
       message_queue_destroy(Queue))),
    retractall(pool(_,_,_)),retractall(worker(_,_,_)),retractall(http_pool(_,_)).
