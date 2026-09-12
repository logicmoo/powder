:- begin_tests(pool_settings).
:- use_module('../kb_pool_settings').
:- use_module('../kb_jobs',[]).
:- use_module('../kb_config',[]).
:- use_module('../kb_store',[]).
:- use_module('../kb_limits',[]).
:- use_module('../kb_cache',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(prolog_wrap)).
:- dynamic barrier/2.

fixture(D,Previous) :-
    (getenv('POWDER_SERVER_SETTINGS',Old)->Previous=some(Old);Previous=none),
    source_file(plunit_pool_settings:fixture(_,_),Here),file_directory_name(Here,Tests),
    directory_file_path(Tests,artifacts,Artifacts),uuid(Id),
    directory_file_path(Artifacts,Id,D),make_directory_path(D),
    directory_file_path(D,'settings.json',File),setenv('POWDER_SERVER_SETTINGS',File),
    kb_limits:server_defaults(Default),
    Profiles=_{loader:_{start:2,max:4,spare:0,queueCapacity:20},
      inference:_{start:2,max:4,spare:0,queueCapacity:20},http:_{start:1,max:2,spare:0}},
    kb_config:save_server_settings(
      Default.put(_{startupConfigured:true,startupFiles:[],pools:Profiles}),none,Settings),
    kb_jobs:start_pools(Settings).
cleanup(D,Previous) :-
    kb_jobs:stop_pools,
    (catch(unwrap_predicate(kb_jobs:execute_file_work(_,_,_),pool_settings_test),_,true)->true;true),
    (catch(unwrap_predicate(kb_runtime:query_modules_report(_,_,_,_,_,_,_,_),pool_settings_test),_,true)->true;true),
    findall(S,kb_store:source_info(S,_),Sources),
    forall(member(S,Sources),(kb_store:generation(G),kb_store:unload_source(S,G,_))),
    retractall(barrier(_,_)),retractall(kb_jobs:job(_,_,_,_)),
    retractall(kb_jobs:cancel_requested(_)),kb_jobs:detach_http(43567),
    (Previous=some(Old)->setenv('POWDER_SERVER_SETTINGS',Old);unsetenv('POWDER_SERVER_SETTINGS')),
    delete_directory_and_contents(D).
profile(Reply,Type,Profile) :- once((member(Profile,Reply.items),Profile.pool==Type)).
await(Job) :- kb_jobs:await_result(Job.jobId,10,_).
block_plans(Entered,Continue) :-
    message_queue_create(Entered),message_queue_create(Continue),
    assertz(barrier(Entered,Continue)),
    wrap_predicate(kb_jobs:execute_file_work(Action,_Id,_N),pool_settings_test,Wrapped,
      ((Action=plan(_)->plunit_pool_settings:wait_plan;true),call(Wrapped))).
wait_plan :-
    barrier(Entered,Continue),thread_self(Thread),
    thread_send_message(Entered,entered(Thread)),thread_get_message(Continue,continue).
unblock(Entered,Continue) :-
    retractall(barrier(Entered,Continue)),message_queue_destroy(Entered),message_queue_destroy(Continue).
wait_workers(Type,N) :-
    thread_wait(plunit_pool_settings:worker_count(Type,N),
      [module(kb_jobs),wait_preds([worker/3]),retry_every(0.01),timeout(8)]).
worker_count(Type,N) :- findall(T,kb_jobs:worker(Type,T,_),Threads),length(Threads,N).

test(save_persists_desired_profile_without_changing_live_workers_or_generation,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    pool_settings(Before),kb_store:generation(G),
    findall(T,kb_jobs:worker(file,T,_),Workers),
    save_pool_settings(_{file:_{start:1,max:1,spare:0,queueCapacity:3}},Before.revision,Saved),
    profile(Saved,file,File),
    assertion(File.desired.max==1),assertion(File.effective.max==4),
    assertion(File.needsApply==true),assertion(File.state==pending_apply),
    kb_config:server_settings(Read),assertion(Read.pools.loader.queueCapacity==3),
    assertion(Read.startupConfigured==true),assertion(Read.startupFiles==[]),
    findall(T,kb_jobs:worker(file,T,_),After),assertion(After==Workers),kb_store:generation(G).

test(revision_conflicts_and_invalid_profiles_do_not_overwrite_settings,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    pool_settings(Before),
    save_pool_settings(_{inference:_{max:5}},Before.revision,Saved),
    catch(save_pool_settings(_{file:_{max:6}},Before.revision,_),Conflict,true),
    assertion(Conflict=error(server_settings_conflict,_)),
    catch(save_pool_settings(_{file:_{start:9,max:1}},Saved.revision,_),Invalid,true),
    assertion(nonvar(Invalid)),
    catch(save_pool_settings(_{file:_{maximum:6}},Saved.revision,_),Unknown,true),
    assertion(Unknown=error(domain_error(settings_field,maximum),_)),
    pool_settings(After),assertion(After.revision==Saved.revision),
    catch(apply_pool_settings(Before.revision,_),ApplyError,true),
    assertion(ApplyError=error(server_settings_conflict,_)).

test(lowering_limits_preserves_busy_and_queued_jobs_then_retires_idle_workers,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    setup_call_cleanup(block_plans(Entered,Continue),
      (findall(J,(between(1,6,_),kb_jobs:queue_index([],[],J)),Jobs),
       findall(T,(between(1,4,_),thread_get_message(Entered,entered(T),[timeout(8)])),Threads),
       sort(Threads,Unique),assertion(length(Unique,4)),
       pool_settings(Current),
       save_pool_settings(_{loader:_{start:1,max:1,spare:0,queueCapacity:1}},Current.revision,Saved),
       apply_pool_settings(Saved.revision,Applied),profile(Applied,file,File),
       assertion(File.effective.max==1),assertion(File.workers.busy==4),
       assertion(File.workers.outstanding==6),assertion(File.state==settling),
       forall(member(T,Threads),thread_property(T,status(running))),
       catch(kb_jobs:queue_index([],[],_),Full,true),
       assertion(Full=error(task_queue_full(file),_)),
       forall(between(1,6,_),thread_send_message(Continue,continue)),maplist(await,Jobs),
       wait_workers(file,1),
       forall(member(J,Jobs),(kb_jobs:job_status(J.jobId,S),assertion(S.state==succeeded))),
       pool_settings(Finished),profile(Finished,file,Settled),assertion(Settled.state==running)),
      unblock(Entered,Continue)).

test(live_growth_uses_the_existing_queue_and_has_no_duplicate_pools,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    kb_jobs:pool(file,Queue,_),kb_jobs:manager(Manager,_),
    pool_settings(Current),
    save_pool_settings(_{file:_{start:6,max:12},inference:_{start:3,max:5}},Current.revision,Saved),
    apply_pool_settings(Saved.revision,_),wait_workers(file,6),wait_workers(inference,3),
    kb_jobs:pool(file,Queue,_),kb_jobs:manager(Manager,_),
    setup_call_cleanup(block_plans(Entered,Continue),
      (findall(J,(between(1,9,_),kb_jobs:queue_index([],[],J)),Jobs),
       findall(T,(between(1,9,_),thread_get_message(Entered,entered(T),[timeout(8)])),Threads),
       sort(Threads,Unique),assertion(length(Unique,9)),
       forall(between(1,9,_),thread_send_message(Continue,continue)),maplist(await,Jobs)),
      unblock(Entered,Continue)),
    findall(T,kb_jobs:worker(file,T,_),Before),
    apply_pool_settings(Saved.revision,_),
    findall(T,kb_jobs:worker(file,T,_),After),assertion(Before==After),
    findall(Type,kb_jobs:pool(Type,_,_),Pools),msort(Pools,[file,inference]).

test(lowering_inference_limits_preserves_query_proofs_and_snapshot_cleanup,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    directory_file_path(D,'query.krf',Source),directory_file_path(D,state,State),
    setup_call_cleanup(open(Source,write,S),
      format(S,'(in-microtheory M)~n(p A)~n',[]),close(S)),
    kb_compile:compile_source(Source,[state_dir(State),diagnostics(false)],_),
    kb_store:load_sources([Source],any,Loaded),
    message_queue_create(Entered),message_queue_create(Continue),
    setup_call_cleanup(assertz(barrier(Entered,Continue)),
      (wrap_predicate(kb_runtime:query_modules_report(_,_,_,_,_,_,_,_),pool_settings_test,Wrapped,
         (plunit_pool_settings:wait_plan,call(Wrapped))),
       findall(J,(between(1,5,_),kb_jobs:queue_query("(p ?X)",x_M,1,2,J)),Jobs),
       forall(between(1,4,_),thread_get_message(Entered,entered(_),[timeout(8)])),
       pool_settings(Current),
       save_pool_settings(_{inference:_{start:1,max:1,queueCapacity:1}},Current.revision,Saved),
       apply_pool_settings(Saved.revision,Applied),profile(Applied,inference,Inference),
       assertion(Inference.workers.busy==4),assertion(Inference.state==settling),
       forall(between(1,5,_),thread_send_message(Continue,continue)),
       forall(member(J,Jobs),
         (kb_jobs:await_result(J.jobId,10,Answer),assertion(Answer.generation==Loaded.generation),
          Answer.solutions=[Solution],assertion(length(Solution.proof,1)))),
       wait_workers(inference,1),assertion(\+kb_store:query_snapshot(_,_,_,_)),
       assertion(\+kb_store:native_query_refs(_,_))),
      unblock(Entered,Continue)).

test(native_settings_lock_returns_busy_without_changes,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    pool_settings(Current),kb_config:settings_file(File),atom_concat(File,'.lock',LockFile),
    setup_call_cleanup(kb_cache:try_lock(LockFile,Lock),
      (catch(save_pool_settings(_{file:_{max:6}},Current.revision,_),Error,true),
       assertion(Error=error(server_settings_busy,_))),
      kb_cache:release_lock(Lock)),
    pool_settings(After),assertion(After.revision==Current.revision).

test(http_changes_are_desired_only_until_host_listener_restart,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    kb_jobs:attach_http(43567,_{start:1,max:2,spare:0}),pool_settings(Current),
    save_pool_settings(_{http:_{start:2,max:3}},Current.revision,Saved),
    apply_pool_settings(Saved.revision,Applied),profile(Applied,http,HTTP),
    assertion(HTTP.restartRequired==true),assertion(HTTP.liveApplySupported==false),
    HTTP.effective=[Listener],assertion(Listener.profile.max==2),
    kb_jobs:detach_http(43567),pool_settings(Untracked),profile(Untracked,http,Missing),
    assertion(Missing.state==untracked).

test(applying_stopped_profiles_does_not_start_new_managers,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    kb_jobs:stop_pools,pool_settings(Current),
    save_pool_settings(_{file:_{start:3,max:3}},Current.revision,Saved),
    apply_pool_settings(Saved.revision,Reply),profile(Reply,file,File),
    assertion(File.state==stopped),assertion(File.effective==null),
    assertion(\+kb_jobs:manager(_,_)),assertion(\+kb_jobs:pool(_,_,_)),
    kb_config:server_settings(Settings),kb_jobs:start_pools(Settings),wait_workers(file,3).

test(checkpoint_lease_blocks_settings_mutations,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    pool_settings(Current),
    setup_call_cleanup(kb_jobs:begin_checkpoint_drain(Token),
      (catch(save_pool_settings(_{file:_{max:6}},Current.revision,_),SaveError,true),
       assertion(SaveError=error(application_reload_busy,_)),
       catch(apply_pool_settings(Current.revision,_),ApplyError,true),
       assertion(ApplyError=error(application_reload_busy,_)),
       kb_config:server_settings(Config),
       catch(kb_config:save_server_settings(Config,Config.revision,_),RawError,true),
       assertion(RawError=error(application_reload_busy,_))),
      kb_jobs:end_checkpoint_drain(Token)),
    pool_settings(After),assertion(After.revision==Current.revision).

test(task_lists_details_and_cancel_are_bounded,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    findall(Path,(between(1,250,N),format(atom(Name),'missing~d.krf',[N]),
      directory_file_path(D,Name,Path)),Paths),
    setup_call_cleanup(block_plans(Entered,Continue),
      (kb_jobs:queue_index(Paths,[],Job),thread_get_message(Entered,entered(_),[timeout(8)]),
       task_list(_{pool:"file",state:"active",limit:1},Page),
       assertion(Page.total==1),Page.items=[Task],assertion(Task.fileCount==250),
       assertion(\+get_dict(files,Task,_)),assertion(\+get_dict(result,Task,_)),
       task_details(Job.jobId,_{section:"files",offset:100,limit:7},Details),
       assertion(Details.total==250),assertion(length(Details.items,7)),
       assertion(\+get_dict(result,Details,_)),
       cancel_task(Job.jobId,Cancelled),assertion(Cancelled.cancellationRequested==true),
       catch(await(Job),Error,true),assertion(Error=job_cancelled(_)),
       task_list(_{state:completed,limit:1},Completed),assertion(Completed.total==1)),
      unblock(Entered,Continue)).

test(task_query_preview_does_not_embed_results_or_proofs,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    length(Codes,3000),maplist(=(0'a),Codes),string_codes(Symbol,Codes),
    format(string(Query),'(p ~s)',[Symbol]),
    kb_jobs:queue_query(Query,none,1,1,Job),await(Job),
    task_details(Job.jobId,_{section:results,limit:1},Details),
    string_length(Details.request.preview,512),assertion(Details.items==[]),
    assertion(\+get_dict(solutions,Details.outcome,_)),
    assertion(\+get_dict(utility,Details.outcome,_)).

test(task_page_validation_and_alias_collision_are_explicit,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    catch(task_list(_{limit:101},_),LimitError,true),
    assertion(LimitError=error(domain_error(task_page,_),_)),
    pool_settings(Current),
    catch(save_pool_settings(_{file:_{max:5},loader:_{max:6}},Current.revision,_),Error,true),
    assertion(Error=error(domain_error(duplicate_pool_updates,_),_)).

:- end_tests(pool_settings).
