:- begin_tests(inference_worker_pool).
:- use_module('../kb_jobs').
:- use_module('../kb_store',[]).
:- use_module('../kb_questions',[]).
:- use_module('../kb_compile',[]).
:- use_module('../kb_paths',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(prolog_wrap)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- dynamic block_queries/1,block_file/2.

fixture(D,File,Options) :-
    fixture(_{start:5,max:10,spare:2},D,File,Options).
fixture(Profile,D,File,[state_dir(State),diagnostics(false)]) :-
    source_file(plunit_inference_worker_pool:fixture(_,_,_),Here),file_directory_name(Here,Tests),
    directory_file_path(Tests,artifacts,Artifacts),make_directory_path(Artifacts),
    uuid(Id),directory_file_path(Artifacts,Id,D),make_directory(D),
    directory_file_path(D,state,State),directory_file_path(D,'questions.krf',File),
    write_source(File,"(in-microtheory M)\n(p A)\n(p B)\n(q B)\n(<=== (match ?X) (p ?X) (q ?X))\n(test_Qs \"Q1\" \"Which item?\" (and (p ?X) (p ?X)))\n(<=== (slow ?X) (p ?X))\n(<=== (loop ?X) (loop ?X))\n(in-microtheory Other)\n(p C)\n"),
    kb_compile:compile_source(File,[state_dir(State),diagnostics(false)],_),
    kb_store:load_sources([File],any,_),
    start_file_pool(_{start:5,max:10,spare:2}),start_inference_pool(Profile).
cleanup(D) :-
    stop_pools,
    forall(member(P,[kb_runtime:query_modules_report(_,_,_,_,_,_,_,_),
                     kb_runtime:rule_guard_body(_,_,_,_,_),
                     kb_store:cleanup_native_now(_),
                     kb_compile:compile_source(_,_,_)]),
      (catch(unwrap_predicate(P,inference_pool_test),_,true)->true;true)),
    retractall(block_queries(_)),retractall(block_file(_,_)),
    findall(S,kb_store:source_info(S,_),Sources),
    forall(member(S,Sources),(kb_store:generation(G),kb_store:unload_source(S,G,_))),
    retractall(kb_jobs:job(_,_,_,_)),retractall(kb_jobs:cancel_requested(_)),
    delete_directory_and_contents(D).
write_source(File,Text) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),format(S,'~s',[Text]),close(S)).
await(Job,Result) :- await_result(Job.jobId,10,Result).
failed(Job,Error) :- catch(await(Job,_),Error,true),assertion(nonvar(Error)).

query_barrier(Queue) :-
    message_queue_create(Queue),assertz(block_queries(Queue)),
    wrap_predicate(kb_runtime:query_modules_report(_M,_G,_Mt,_L,_T,_O,_S,_R),
      inference_pool_test,Wrapped,
      (plunit_inference_worker_pool:wait_query,call(Wrapped))).
wait_query :-
    (block_queries(Queue)->
      thread_self(Thread),current_job_id(Job),
      thread_send_message(Queue,entered(Job,Thread)),
      thread_get_message(proceed)
    ;true).
entered(Queue,Job,Thread) :-
    thread_get_message(Queue,entered(Job.jobId,Thread),[timeout(8)]).
release(Thread) :- thread_send_message(Thread,proceed).
destroy_barrier(Queue) :- retractall(block_queries(Queue)),message_queue_destroy(Queue).
pool_idle(Type) :- \+kb_jobs:worker(Type,_,running(_,_)).
wait_idle(Type) :-
    thread_wait(plunit_inference_worker_pool:pool_idle(Type),
      [module(kb_jobs),wait_preds([worker/3]),retry_every(0.01),timeout(5)]).
report_context(Queue) :-
    (nb_current(logos_query,_)->Context=present;Context=none),
    (kb_jobs:in_inference->Pool=present;Pool=none),
    thread_send_message(Queue,state(Context,Pool)).

test(separate_profiles_and_queues_start_five_each,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    task_overview(Overview),
    once((member(File,Overview.pools),File.pool==file)),
    once((member(Inference,Overview.pools),Inference.pool==inference)),
    assertion(File.total==5),assertion(Inference.total==5),
    assertion(Inference.profile.max==10),assertion(Inference.profile.spare==2),
    kb_jobs:pool(file,FQ,_),kb_jobs:pool(inference,IQ,_),assertion(FQ\==IQ).

test(query_demand_scales_only_the_inference_pool,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    setup_call_cleanup(query_barrier(Queue),
      (findall(J,(between(1,12,_),queue_query("(p ?X)",x_M,5,2,J)),Jobs),
       findall(T,(between(1,10,_),thread_get_message(Queue,entered(_,T),[timeout(8)])),Threads),
       sort(Threads,Unique),assertion(length(Unique,10)),
       kb_jobs:pool_statistics(file,File),kb_jobs:pool_statistics(inference,Inference),
       assertion(File.total==5),assertion(Inference.total==10),
       retractall(block_queries(Queue)),maplist(release,Threads),
       forall(member(J,Jobs),(await(J,Answer),assertion(length(Answer.solutions,2)))),
       assertion(\+kb_store:query_snapshot(_,_,_,_))),
      destroy_barrier(Queue)).

test(configured_inference_bounds_can_differ_from_file_bounds,
     [setup(fixture(_{start:2,max:12,spare:1},D,_,_)),cleanup(cleanup(D))]) :-
    kb_jobs:pool_statistics(inference,Pool),assertion(Pool.total==2),
    assertion(Pool.profile.max==12),
    kb_jobs:pool_statistics(file,File),assertion(File.profile.max==10).

test(file_publication_preserves_an_older_query_and_its_proof,
     [setup(fixture(D,File,O)),cleanup(cleanup(D))]) :-
    kb_store:generation(Before),kb_store:source_module(File,_,OldNative),
    setup_call_cleanup(query_barrier(Queue),
      (queue_query("(p ?X)",x_M,5,2,Query),entered(Queue,Query,Thread),
       write_source(File,"(in-microtheory M)\n(p New)\n"),
       queue_load([File],Before,O,Load),await(Load,Loaded),
       assertion(Loaded.generation=:=Before+1),assertion(exists_file(OldNative)),
       retractall(block_queries(Queue)),release(Thread),await(Query,Answer),
       assertion(Answer.generation==Before),
       assertion(Answer.utility.generation==Before),
       Answer.solutions=[A,B],
       A.bindings=[AB],B.bindings=[BB],
       assertion(AB.value.value==x_A),assertion(BB.value.value==x_B),
       assertion(A.proof=[_]),assertion(B.proof=[_]),
       assertion(\+exists_file(OldNative)),
       assertion(\+kb_store:native_query_refs(_,_))),
      destroy_barrier(Queue)).

test(native_snapshot_retires_only_after_the_last_query_releases,
     [setup(fixture(D,File,O)),cleanup(cleanup(D))]) :-
    kb_store:generation(G),kb_store:source_module(File,_,OldNative),
    setup_call_cleanup(query_barrier(Queue),
      (queue_query("(p ?X)",x_M,5,2,A),entered(Queue,A,AT),
       queue_query("(p ?X)",x_M,5,2,B),entered(Queue,B,BT),
       assertion(kb_store:native_query_refs(OldNative,2)),
       write_source(File,"(in-microtheory M)\n(p Changed)\n"),
       queue_load([File],G,O,Load),await(Load,_),
       release(AT),await(A,_),assertion(exists_file(OldNative)),
       assertion(kb_store:native_query_refs(OldNative,1)),
       release(BT),await(B,_),assertion(\+exists_file(OldNative))),
      destroy_barrier(Queue)).

test(async_query_acceptance_does_not_wait_for_a_running_query,
     [setup(fixture(_{start:1,max:1,spare:0},D,_,_)),cleanup(cleanup(D))]) :-
    setup_call_cleanup(query_barrier(Queue),
      (queue_query("(p ?X)",x_M,5,2,A),entered(Queue,A,Thread),
       get_time(Start),queue_query("(p ?X)",x_M,5,2,B),get_time(End),
       assertion(End-Start<0.5),job_status(B.jobId,Pending),assertion(Pending.state==queued),
       retractall(block_queries(Queue)),release(Thread),await(A,_),await(B,_)),
      destroy_barrier(Queue)).

test(queued_query_reports_the_generation_at_execution_not_acceptance,
     [setup(fixture(_{start:1,max:1,spare:0},D,File,O)),cleanup(cleanup(D))]) :-
    kb_store:generation(Old),
    setup_call_cleanup(query_barrier(Queue),
      (queue_query("(p ?X)",x_M,5,2,A),entered(Queue,A,Thread),
       queue_query("(p ?X)",x_M,5,2,B),
       write_source(File,"(in-microtheory M)\n(p New)\n"),
       queue_load([File],Old,O,Load),await(Load,Loaded),
       retractall(block_queries(Queue)),release(Thread),
       await(A,First),await(B,Second),
       assertion(First.generation==Old),assertion(Second.generation==Loaded.generation),
       Second.solutions=[S],S.bindings=[Binding],assertion(Binding.value.value==x_New)),
      destroy_barrier(Queue)).

test(failed_alternatives_do_not_leak_into_proofs_or_reused_workers,
     [setup(fixture(_{start:1,max:1,spare:0},D,_,_)),cleanup(cleanup(D))]) :-
    forall(between(1,2,_),
      (queue_query("(match ?X)",x_M,5,2,Job),await(Job,Answer),
       Answer.solutions=[Solution],Solution.bindings=[Binding],
       assertion(Binding.value.value==x_B),assertion(length(Solution.proof,3)),
       Solution.proof=[First|_],First.expression.args=[FactArgument],
       assertion(FactArgument.value==x_B))),
    assertion(\+kb_store:query_snapshot(_,_,_,_)).

test(query_queue_backpressure_is_independent,
     [setup(fixture(_{start:1,max:1,spare:0,queueCapacity:1},D,_,_)),cleanup(cleanup(D))]) :-
    setup_call_cleanup(query_barrier(Queue),
      (queue_query("(p ?X)",x_M,5,2,A),entered(Queue,A,Thread),
       catch(queue_query("(p ?X)",x_M,5,2,_),Error,true),
       assertion(Error=error(task_queue_full(inference),_)),
       queue_index([],[],Index),await(Index,_),
       retractall(block_queries(Queue)),release(Thread),await(A,_)),
      destroy_barrier(Queue)).

test(synchronous_query_wrappers_and_legacy_locked_callers_remain_bounded,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    kb_store:query_text("(p ?X)",x_M,1,2,Answer),
    assertion(length(Answer.solutions,1)),
    task_overview(Overview),member(Task,Overview.tasks),Task.pool==inference,!,
    with_mutex(openworld_store,kb_store:query_text("(p ?X)",x_M,1,2,Locked)),
    assertion(length(Locked.solutions,1)).

test(stored_questions_execute_formula_data_in_their_own_microtheory,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    kb_questions:stored_questions([Question]),
    queue_question(Question.id,5,2,Job),await(Job,Answer),
    assertion(Answer.question.identifier=="Q1"),
    Answer.solutions=[A,B],A.bindings=[Binding],
    assertion(Binding.name=="?X"),
    assertion(length(A.proof,2)),assertion(length(B.proof,2)),
    kb_questions:run_question(Question.id,1,2,Sync),
    assertion(length(Sync.solutions,1)),
    stop_inference_pool(drain),atom_string(Question.id,TextId),
    kb_questions:run_question(TextId,1,2,Direct),
    assertion(length(Direct.solutions,1)).

test(arbitrary_prolog_and_unknown_question_ids_are_not_executed,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    flag(inference_arbitrary_probe,_,0),
    catch(submit_inference(prolog,query("flag(inference_arbitrary_probe,_,1).",none,1,1),_),Error,true),
    assertion(Error=error(domain_error(bounded_inference_request,_),_)),
    flag(inference_arbitrary_probe,N,N),assertion(N==0),
    queue_query("(halt)",none,1,1,Unsafe),failed(Unsafe,_),
    queue_question(a000000000000,1,1,Missing),failed(Missing,MissingError),
    assertion(MissingError=error(existence_error(stored_test_question,_),_)),
    queue_query("(p ?X)",x_M,1,1,Good),await(Good,_).

test(timeout_restores_query_context_and_releases_the_snapshot,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    queue_query("(loop A)",x_M,1,0.02,Loop),failed(Loop,Error),
    assertion(Error==time_limit_exceeded),
    job_status(Loop.jobId,Status),assertion(Status.error.kind==timeout),
    assertion(\+kb_store:query_snapshot(_,_,_,_)),
    assertion(\+kb_store:native_query_refs(_,_)),
    queue_query("(p ?X)",x_M,1,1,Good),await(Good,_).

test(cancellation_unwinds_active_query_and_worker_context,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    message_queue_create(Queue),
    setup_call_cleanup(
      wrap_predicate(kb_runtime:rule_guard_body(_Id,_Body,_Inputs,_Locals,_State),
        inference_pool_test,Wrapped,
        (thread_self(T),thread_send_message(Queue,inside(T)),
         thread_get_message(proceed),call(Wrapped))),
      (queue_query("(slow ?X)",x_M,5,2,Job),
       thread_get_message(Queue,inside(Thread),[timeout(8)]),
       cancel_job(Job.jobId),failed(Job,Error),assertion(Error=job_cancelled(_)),
       assertion(\+kb_store:query_snapshot(_,_,_,_)),
       wait_idle(inference),
       thread_signal(Thread,plunit_inference_worker_pool:report_context(Queue)),
       thread_get_message(Queue,State,[timeout(3)]),assertion(State==state(none,none))),
      message_queue_destroy(Queue)).

test(stopping_file_pool_leaves_query_workers_and_manager_running,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    setup_call_cleanup(query_barrier(Queue),
      (queue_query("(p ?X)",x_M,5,2,Job),entered(Queue,Job,Thread),
       kb_jobs:manager(Manager,_),stop_file_pool(cancel),
       inference_pool_started,thread_property(Manager,status(running)),
       retractall(block_queries(Queue)),release(Thread),await(Job,_),
       start_file_pool(_{start:5,max:10,spare:2})),
      destroy_barrier(Queue)).

test(stopping_queries_leaves_file_work_available,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    stop_inference_pool(cancel),file_pool_started,
    kb_jobs:manager(Manager,_),thread_property(Manager,status(running)),
    queue_index([],[],Job),await(Job,_),
    start_inference_pool(_{start:5,max:10,spare:2}).

test(shutdown_cancels_active_and_queued_queries_and_releases_retired_natives,
     [setup(fixture(_{start:1,max:1,spare:0},D,File,O)),cleanup(cleanup(D))]) :-
    kb_store:generation(G),kb_store:source_module(File,_,OldNative),
    setup_call_cleanup(query_barrier(Queue),
      (queue_query("(p ?X)",x_M,5,2,A),entered(Queue,A,_),
       queue_query("(p ?X)",x_M,5,2,B),
       write_source(File,"(in-microtheory M)\n(p New)\n"),
       queue_load([File],G,O,Load),await(Load,_),
       stop_inference_pool(cancel),failed(A,_),failed(B,_),
       assertion(\+kb_store:query_snapshot(_,_,_,_)),
       assertion(\+kb_store:native_query_refs(_,_)),
       assertion(\+exists_file(OldNative)),
       assertion(\+kb_jobs:worker(inference,_,_)),file_pool_started),
      destroy_barrier(Queue)).

test(retirement_cleanup_failures_are_retried_on_explicit_pool_shutdown,
     [setup(fixture(D,File,O)),cleanup(cleanup(D))]) :-
    kb_store:generation(G),kb_store:source_module(File,_,OldNative),
    setup_call_cleanup(query_barrier(Queue),
      (queue_query("(p ?X)",x_M,5,2,Job),entered(Queue,Job,Thread),
       write_source(File,"(in-microtheory M)\n(p New)\n"),
       queue_load([File],G,O,Load),await(Load,_),
       wrap_predicate(kb_store:cleanup_native_now(Native),inference_pool_test,Wrapped,
         (Native==OldNative->throw(error(fixture_retirement_failure,_));call(Wrapped))),
       release(Thread),await(Job,_),assertion(kb_store:retired_native(OldNative)),
       unwrap_predicate(kb_store:cleanup_native_now(_),inference_pool_test),
       stop_inference_pool(drain),
       assertion(\+exists_file(OldNative)),assertion(\+kb_store:retired_native(_))),
      destroy_barrier(Queue)).

test(owned_http_restart_preserves_both_pools_and_a_running_query,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    setup_call_cleanup(query_barrier(Queue),
      (queue_query("(p ?X)",x_M,5,2,Job),entered(Queue,Job,Thread),
       findall(T,kb_jobs:worker(_,T,_),Workers),
       http_server(http_dispatch,[port('127.0.0.1':Port),workers(1)]),
       setup_call_cleanup(attach_http(Port,_{start:1,max:1,spare:0}),
         (format(atom(URL),'http://127.0.0.1:~d/__pool_test_missing',[Port]),
          http_get(URL,_,[status_code(404)]),
          http_stop_server(Port,[]),detach_http(Port),
          http_server(http_dispatch,[port('127.0.0.1':Port),workers(1)]),
          http_get(URL,_,[status_code(404)])),
         (http_stop_server(Port,[]),detach_http(Port))),
       forall(member(T,Workers),thread_property(T,status(running))),
       retractall(block_queries(Queue)),release(Thread),await(Job,_)),
      destroy_barrier(Queue)).

test(public_task_overview_does_not_publish_query_bindings,
     [setup(fixture(D,_,_)),cleanup(cleanup(D))]) :-
    queue_query("(p ?X)",x_M,5,2,Job),await(Job,_),
    task_overview(Overview),member(Task,Overview.tasks),Task.id==Job.jobId,!,
    assertion(Task.resultCount==2),assertion(\+get_dict(result,Task,_)),
    job_status(Job.jobId,Detail),assertion(length(Detail.result.solutions,2)).

:- end_tests(inference_worker_pool).
