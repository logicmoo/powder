:- begin_tests(job_saved_state).
:- use_module('../kb_jobs').
:- use_module('../kb_activity',[]).
:- use_module(library(filesex)).
:- use_module(library(process)).
:- use_module(library(readutil)).
:- use_module(library(uuid)).

pool_setup :- start_file_pool(_{start:1,max:2,spare:0}).
pool_cleanup :-
    stop_pools,retractall(kb_jobs:job(_,_,_,_)),retractall(kb_jobs:cancel_requested(_)).

test(quiescence_is_read_only_and_reports_accepted_work,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    with_mutex(powder_pools,
      (queue_index([],[],Job),
       job_status(Job.jobId,Before),save_quiescence(State),job_status(Job.jobId,After),
       assertion(State.state==busy),assertion(State.jobs==1),
       assertion(State.activity.active>0),assertion(Before=@=After))),
    await_result(Job.jobId,5,_),
    thread_wait(\+kb_jobs:worker(_,_,running(_,_)),
      [module(kb_jobs),wait_preds([worker/3]),retry_every(0.01),timeout(5)]),
    save_quiescence(Ready),assertion(Ready.state==ready).

test(prepare_never_stops_or_erases_a_live_registry,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    findall(T,kb_jobs:worker(file,T,_),Before),
    catch(prepare_saved_state,Error,true),
    assertion(Error=error(permission_error(save,live_job_registry,_),_)),
    file_pool_started,findall(T,kb_jobs:worker(file,T,_),After),
    assertion(Before==After),
    queue_index([],[],Job),await_result(Job.jobId,5,_).

test(restore_is_refused_in_the_original_process,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    catch(restore_saved_state,Error,true),
    assertion(Error=error(permission_error(restore,live_job_registry,_),_)),
    file_pool_started.

test(ephemeral_pool_and_activity_predicates_are_volatile) :-
    forall(member(Head,[kb_jobs:pool(_,_,_),kb_jobs:worker(_,_,_),
      kb_jobs:manager(_,_),kb_jobs:job(_,_,_,_),kb_jobs:unit(_,_,_,_,_),
      kb_jobs:pool_io(_,_,_),kb_activity:active(_),kb_activity:exclusive,
      kb_activity:application_ticket(_),kb_activity:admission_lease(_,_,_)]),
      assertion(predicate_property(Head,volatile))).

test(snapshot_guard_refuses_queued_work_without_mutating_it,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    flag(saved_snapshot_entered,_,0),
    with_mutex(powder_pools,
      (queue_index([],[],Job),
       catch(with_saved_state_snapshot(flag(saved_snapshot_entered,_,1)),Error,true),
       assertion(Error=error(saved_state_busy(application),_)),
       flag(saved_snapshot_entered,N,N),assertion(N==0),
       job_status(Job.jobId,Status),assertion(Status.state==queued))),
    await_result(Job.jobId,5,_).

test(snapshot_guard_blocks_admission_and_releases_all_exit_paths,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    with_saved_state_snapshot(
      (kb_store:owns_store_mutex,thread_self(Self),
       mutex_property(openworld_code_reload,status(locked(Self,_))),
       catch(queue_index([],[],_),Busy,true),
       assertion(Busy=error(application_reload_busy,_)),
       member(_, [first,second]))),
    assertion(\+kb_activity:exclusive),
    assertion(\+with_saved_state_snapshot(fail)),
    catch(with_saved_state_snapshot(throw(snapshot_probe)),Error,true),
    assertion(Error==snapshot_probe),assertion(\+kb_activity:exclusive),
    queue_index([],[],Job),await_result(Job.jobId,5,_).

test(snapshot_guard_does_not_wait_for_an_existing_code_lock,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    message_queue_create(Queue),
    setup_call_cleanup(
      thread_create(with_mutex(openworld_code_reload,
        (thread_send_message(Queue,locked),thread_get_message(release))),Thread,[]),
      (thread_get_message(Queue,locked,[timeout(3)]),
       get_time(Start),catch(with_saved_state_snapshot(true),Error,true),get_time(End),
       assertion(End-Start<0.5),assertion(Error=error(saved_state_busy(openworld_code_reload),_)),
       assertion(\+kb_activity:exclusive)),
      (thread_send_message(Thread,release),thread_join(Thread,_),message_queue_destroy(Queue))).

test(snapshot_guard_preserves_existing_native_query_leases,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    setup_call_cleanup(kb_store:acquire_query_snapshot(Snapshot),
      (catch(with_saved_state_snapshot(true),Error,true),
       assertion(Error=error(saved_state_busy(_),_)),
       assertion(kb_store:query_snapshot(Snapshot.id,_,_,_))),
      kb_store:release_query_snapshot(Snapshot)).

test(checkpoint_lease_blocks_new_jobs_without_stopping_workers,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    start_inference_pool(_{start:1,max:2,spare:0}),
    findall(P-T,kb_jobs:worker(P,T,_),Before),
    setup_call_cleanup(begin_checkpoint_drain(Token),
      (kb_activity:activity_status(Activity),assertion(Activity.leased==true),
       with_saved_state_snapshot(kb_store:owns_store_mutex),
       catch(queue_index([],[],_),IndexError,true),
       assertion(IndexError=error(application_reload_busy,_)),
       catch(queue_query("(p A)",none,1,1,_),QueryError,true),
       assertion(QueryError=error(application_reload_busy,_)),
       findall(P-T,kb_jobs:worker(P,T,_),During),assertion(During==Before),
       assertion(\+kb_jobs:job(_,_,_,_))),
      end_checkpoint_drain(Token)),
    end_checkpoint_drain(Token),
    kb_activity:activity_status(Released),assertion(Released.leased==false),
    queue_index([],[],Job),await_result(Job.jobId,5,_).

test(checkpoint_busy_preserves_accepted_work,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    with_mutex(powder_pools,
      (queue_index([],[],Job),job_status(Job.jobId,Before),
       catch(begin_checkpoint_drain(_),Error,true),
       assertion(Error=error(checkpoint_busy(application),_)),
       assertion(\+kb_activity:admission_lease(_,_,_)),
       job_status(Job.jobId,After),assertion(Before=@=After))),
    await_result(Job.jobId,5,_).

test(checkpoint_failed_preflight_releases_its_admission_lease,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    setup_call_cleanup(kb_store:acquire_query_snapshot(Snapshot),
      (catch(begin_checkpoint_drain(_),Error,true),
       assertion(Error=error(checkpoint_busy(_),_)),
       assertion(\+kb_activity:exclusive),
       assertion(\+kb_activity:admission_lease(_,_,_)),
       assertion(kb_store:query_snapshot(Snapshot.id,_,_,_))),
      kb_store:release_query_snapshot(Snapshot)).

test(checkpoint_lease_covers_synchronous_store_fallbacks,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    stop_file_pool(drain),kb_store:generation(Generation),
    setup_call_cleanup(begin_checkpoint_drain(Token),
      forall(member(Goal,[kb_store:load_sources([],any,_),
                          kb_store:add_cached_sources([],any,_),
                          kb_store:unload_source("not-active",Generation,_),
                          kb_store:query_text("(p A)",none,1,1,_)]),
        (catch(call(Goal),Error,true),assertion(Error=error(application_reload_busy,_)))),
      end_checkpoint_drain(Token)),
    kb_store:generation(Generation).

test(checkpoint_snapshot_reuse_is_limited_to_the_lease_owner,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    setup_call_cleanup(begin_checkpoint_drain(Token),
      setup_call_cleanup(message_queue_create(Queue),
        (thread_create(
           (catch(kb_jobs:with_saved_state_snapshot(true),Error,true),
            thread_send_message(Queue,result(Error))),Thread,[]),
         thread_get_message(Queue,result(Error),[timeout(3)]),thread_join(Thread,true),
         assertion(Error=error(saved_state_busy(application),_)),
         with_saved_state_snapshot(true)),
        message_queue_destroy(Queue)),
      end_checkpoint_drain(Token)).

test(checkpoint_coordinator_exception_and_cancellation_release_admission,
     [setup(pool_setup),cleanup(pool_cleanup)]) :-
    catch(setup_call_cleanup(begin_checkpoint_drain(Token),
      throw(promotion_failed),end_checkpoint_drain(Token)),Error,true),
    assertion(Error==promotion_failed),assertion(\+kb_activity:exclusive),
    setup_call_cleanup(message_queue_create(Queue),
      (thread_create(setup_call_cleanup(begin_checkpoint_drain(Other),
         (thread_send_message(Queue,leased),thread_get_message(proceed)),
         end_checkpoint_drain(Other)),Thread,[]),
       thread_get_message(Queue,leased,[timeout(3)]),
       thread_signal(Thread,throw(promotion_cancelled)),thread_join(Thread,Exit),
       assertion(Exit==exception(promotion_cancelled)),
       assertion(\+kb_activity:exclusive),
       assertion(\+kb_activity:admission_lease(_,_,_))),
      message_queue_destroy(Queue)),
    queue_index([],[],Job),await_result(Job.jobId,5,_).

saved_fixture(D,Builder,State) :-
    source_file(plunit_job_saved_state:saved_fixture(_,_,_),Here),
    file_directory_name(Here,Tests),directory_file_path(Tests,artifacts,Artifacts),
    uuid(Id),directory_file_path(Artifacts,Id,D),make_directory_path(D),
    directory_file_path(D,'builder.pl',Builder),directory_file_path(D,'jobs.sav',State),
    source_file(kb_jobs:prepare_saved_state,Jobs),
    setup_call_cleanup(open(Builder,write,S,[encoding(utf8)]),
      (format(S,':- use_module(~q).~n:- set_prolog_flag(tmp_dir,~q).~n',[Jobs,D]),
       format(S,'build :- kb_jobs:prepare_saved_state, qsave_program(~q,[stand_alone(false),class(runtime),goal(user:restored),toplevel(halt)]).~n',[State]),
       format(S,'restored :- kb_jobs:restore_saved_state, Settings=_{pools:_{loader:_{start:1,max:2,spare:0},inference:_{start:1,max:2,spare:0}}}, kb_jobs:start_pools(Settings), findall(P-T,kb_jobs:worker(P,T,_),Before), kb_jobs:start_pools(Settings), findall(P-T,kb_jobs:worker(P,T,_),After), Before==After, length(After,2), kb_jobs:queue_index([],[],J), kb_jobs:await_result(J.jobId,5,R), R.results=[], kb_jobs:stop_pools, writeln(''RESTORE_OK'').~n',[])),
      close(S)).
run_child(Args,Text) :-
    setup_call_cleanup(
      process_create(path(swipl),Args,[process(Pid),stdout(pipe(Out))]),
      (read_string(Out,_,Text),process_wait(Pid,Status),assertion(Status==exit(0))),
      close(Out)).

test(actual_qsave_restore_rebinds_streams_and_creates_fresh_workers,
     [setup(saved_fixture(D,Builder,State)),cleanup(delete_directory_and_contents(D))]) :-
    run_child(['-q','-s',Builder,'-g',build,'-t',halt],_),
    assertion(exists_file(State)),
    run_child(['-q','-x',State],Output),
    assertion(sub_string(Output,_,_,_,"RESTORE_OK")).

:- end_tests(job_saved_state).
