:- begin_tests(file_worker_pool).
:- use_module('../kb_jobs').
:- use_module('../kb_store',[]).
:- use_module('../kb_compile',[]).
:- use_module('../kb_cache',[]).
:- use_module('../kb_paths',[]).
:- use_module('../kb_activity',[]).
:- use_module('../kb_pool_settings',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(prolog_wrap)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- dynamic barrier/3,native_failure/1.

fixture(Directory,Options) :-
    fixture(_{start:5,max:10,spare:2},Directory,Options).
fixture(Profile,Directory,[state_dir(State),diagnostics(false)]) :-
    source_file(plunit_file_worker_pool:fixture(_,_),Here),file_directory_name(Here,Tests),
    directory_file_path(Tests,artifacts,Artifacts),make_directory_path(Artifacts),
    uuid(Id),directory_file_path(Artifacts,Id,Directory),make_directory(Directory),
    directory_file_path(Directory,state,State),start_file_pool(Profile).
cleanup(Directory) :-
    stop_file_pool(cancel),
    forall(member(Name,[compile,parsed,native,lock,cleanup,activate,obsolete,identity,source_names]),
      (catch(unwrap_predicate_for(Name),_,true)->true;true)),
    retractall(barrier(_,_,_)),retractall(native_failure(_)),
    findall(Path,kb_store:source_info(Path,_),Paths),
    forall(member(Path,Paths),
      (kb_store:generation(G),kb_store:unload_source(Path,G,_))),
    retractall(kb_jobs:job(_,_,_,_)),retractall(kb_jobs:cancel_requested(_)),
    delete_directory_and_contents(Directory).
unwrap_predicate_for(compile) :- unwrap_predicate(kb_compile:compile_source(_,_,_),file_pool_test).
unwrap_predicate_for(parsed) :- unwrap_predicate(kb_compile:memory_checkpoint(_,_,_),file_pool_test).
unwrap_predicate_for(native) :- unwrap_predicate(kb_runtime:native_load(_,_,_),file_pool_test).
unwrap_predicate_for(lock) :- unwrap_predicate(kb_cache:try_lock(_,_),file_pool_test).
unwrap_predicate_for(cleanup) :- unwrap_predicate(kb_store:cleanup_staged(_),file_pool_test).
unwrap_predicate_for(activate) :- unwrap_predicate(kb_store:activate_source(_),file_pool_test).
unwrap_predicate_for(obsolete) :- unwrap_predicate(kb_store:cleanup_native(_),file_pool_test).
unwrap_predicate_for(identity) :- unwrap_predicate(kb_compile:compute_implementation_identity(_),file_pool_test).
unwrap_predicate_for(source_names) :- unwrap_predicate(kb_compile:source_names(_,_),file_pool_test).

source(D,Name,Value,File) :-
    directory_file_path(D,Name,File),
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),
      format(S,'(in-microtheory M)~n(p ~w)~n',[Value]),close(S)).
gate(File,Entered,Continue) :-
    message_queue_create(Entered),message_queue_create(Continue),
    assertz(barrier(File,Entered,Continue)).
destroy_gate(Entered,Continue) :-
    retractall(barrier(_,Entered,Continue)),
    message_queue_destroy(Entered),message_queue_destroy(Continue).
block(File) :-
    (barrier(File,Entered,Continue)->
      thread_self(Thread),thread_send_message(Entered,entered(Thread,File)),
      thread_get_message(Continue,continue)
    ;true).
wrap_compile :-
    wrap_predicate(kb_compile:compile_source(File,_Options,_Result),file_pool_test,Wrapped,
      (plunit_file_worker_pool:block(File),call(Wrapped))).
wrap_parsed :-
    wrap_predicate(kb_compile:memory_checkpoint(Phase,File,_Options),file_pool_test,Wrapped,
      ((Phase==parsed->plunit_file_worker_pool:block(File);true),call(Wrapped))).
entered(Queue,Thread) :- thread_get_message(Queue,entered(Thread,_),[timeout(8)]).
await(Job,Result) :- await_result(Job.jobId,15,Result).
await_failed(Job,Error) :-
    catch(await(Job,_),Error,true),assertion(nonvar(Error)),
    job_status(Job.jobId,Status),assertion(memberchk(Status.state,[failed,cancelled])).
staged(Job,Native) :-
    kb_jobs:unit(Job.jobId,_,_,done,compiled(_,entry(_,_,_,Native,_,false))).
wait_staged(Job,Native) :-
    thread_wait(plunit_file_worker_pool:staged(Job,Native),
      [module(kb_jobs),wait_preds([unit/5]),retry_every(0.01),timeout(8)]).
workers_idle :- \+kb_jobs:worker(file,_,running(_,_)).
report_context(Queue) :-
    (kb_jobs:current_job_id(_)->Job=true;Job=false),
    (kb_compile:batch_state(_)->Batch=true;Batch=false),
    (kb_compile:file_progress_callback(_)->Callback=true;Callback=false),
    (kb_activity:application_depth(_)->Application=true;Application=false),
    ((kb_compile:prepared_source_path(_,_);kb_compile:prepared_source_identity(_))->Prepared=true;Prepared=false),
    thread_send_message(Queue,context(Job,Batch,Callback,Application,Prepared)).
report_streams(Queue) :-
    current_output(Current),stream_property(Output,alias(user_output)),
    stream_property(Error,alias(user_error)),
    flush_output(Current),thread_send_message(Queue,streams(Current,Output,Error)).

test(starts_five_persistent_workers_without_inference,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    findall(T,kb_jobs:worker(file,T,_),Before),assertion(length(Before,5)),
    assertion(\+kb_jobs:pool(inference,_,_)),
    task_overview(Overview),Overview.pools=[P],
    assertion(P.pool==file),assertion(P.profile.max==10),assertion(P.profile.spare==2),
    queue_index([],[],Job),await(Job,Summary),assertion(Summary.results==[]),
    findall(T,kb_jobs:worker(file,T,_),After),
    sort(Before,Expected),sort(After,Actual),assertion(Actual==Expected).

test(persistent_workers_do_not_retain_closed_request_capture_streams,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    stop_file_pool(drain),
    stream_property(Input,alias(user_input)),stream_property(Output,alias(user_output)),
    stream_property(Error,alias(user_error)),current_input(CurrentIn),current_output(CurrentOut),
    setup_call_cleanup(open_null_stream(Capture),
      setup_call_cleanup(set_prolog_IO(Input,Capture,Capture),
        start_file_pool(_{start:5,max:10,spare:2}),
        (set_prolog_IO(Input,Output,Error),set_input(CurrentIn),set_output(CurrentOut))),
      close(Capture)),
    kb_jobs:pool_io(_,ExpectedOutput,ExpectedError),
    setup_call_cleanup(message_queue_create(Queue),
      forall(kb_jobs:worker(file,Thread,_),
        (thread_signal(Thread,plunit_file_worker_pool:report_streams(Queue)),
         thread_get_message(Queue,Streams,[timeout(3)]),
         assertion(Streams==streams(ExpectedOutput,ExpectedOutput,ExpectedError)))),
      message_queue_destroy(Queue)).

test(one_batch_fans_out_to_ten_actual_workers_and_keeps_them,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    message_queue_create(Entered),message_queue_create(Continue),
    setup_call_cleanup(true,
      (findall(F,(between(1,12,N),format(atom(Name),'file~d.krf',[N]),
          source(D,Name,N,F),assertz(barrier(F,Entered,Continue))),Files),
       wrap_compile,queue_index(Files,O,Job),
       findall(T,(between(1,10,_),entered(Entered,T)),Threads),
       sort(Threads,Unique),assertion(length(Unique,10)),
       task_overview(AtPeak),AtPeak.pools=[Peak],assertion(Peak.total==10),
       forall(between(1,12,_),thread_send_message(Continue,continue)),
       await(Job,R),assertion(R.generated==12),assertion(R.busy==0),
       task_overview(After),After.pools=[Pool],assertion(Pool.total==10),
       assertion(\+kb_store:source_info(_,_))),
      destroy_gate(Entered,Continue)).

test(one_request_hashes_implementation_only_once,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    flag(file_pool_identity_checks,_,0),
    wrap_predicate(kb_compile:compute_implementation_identity(_Hash),file_pool_test,Wrapped,
      (flag(file_pool_identity_checks,N,N+1),call(Wrapped))),
    wrap_predicate(kb_compile:source_names(_Dir,_Names),file_pool_test,NamesWrapped,
      ((kb_jobs:current_job(_,Unit),integer(Unit),Unit>0)->
        throw(error(unexpected_per_file_directory_scan,_));call(NamesWrapped))),
    findall(F,(between(1,6,N),format(atom(Name),'identity~d.krf',[N]),source(D,Name,N,F)),Files),
    queue_index(Files,O,Job),await(Job,Summary),assertion(Summary.generated==6),
    flag(file_pool_identity_checks,Count,Count),assertion(Count==1).

test(accepted_queued_work_holds_the_code_gate_before_a_worker_starts,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    with_mutex(powder_pools,
      (queue_index([],[],Job),
       catch(kb_activity:with_exclusive_reload(true),Error,true),
       assertion(Error=error(application_reload_busy,_)),
       assertion(kb_activity:application_ticket(Job.jobId)))),
    await(Job,_),
    thread_wait(plunit_file_worker_pool:workers_idle,
      [module(kb_jobs),wait_preds([worker/3]),retry_every(0.01),timeout(5)]),
    kb_activity:with_exclusive_reload(true).

test(independent_index_finishes_while_a_load_is_blocked,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'slow.krf',slow,Slow),source(D,'fast.krf',fast,Fast),
    setup_call_cleanup(gate(Slow,Entered,Continue),
      (wrap_compile,kb_store:generation(G),queue_load([Slow],G,O,Loading),entered(Entered,_),
       queue_index([Fast],O,Indexing),await(Indexing,R),assertion(R.generated==1),
       kb_store:generation(G),job_status(Loading.jobId,Pending),assertion(Pending.state==running),
       thread_send_message(Continue,continue),await(Loading,Loaded),
       assertion(Loaded.counts.assertions==1)),
      destroy_gate(Entered,Continue)).

test(overlapping_sources_are_scheduled_not_reported_busy,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'same.krf',same,File),
    setup_call_cleanup(gate(File,Entered,Continue),
      (wrap_compile,queue_index([File,File],O,First),entered(Entered,_),
       queue_index([File],O,Second),
       thread_wait(kb_jobs:unit(Second.jobId,1,_,pending,_),
         [module(kb_jobs),wait_preds([unit/5]),retry_every(0.01),timeout(8)]),
       assertion(\+thread_get_message(Entered,_,[timeout(0.05)])),
       thread_send_message(Continue,continue),entered(Entered,_),
       thread_send_message(Continue,continue),
       await(First,A),await(Second,B),
       assertion(A.generated==1),assertion(B.cacheHits==1),assertion(B.busy==0)),
      destroy_gate(Entered,Continue)).

test(publication_is_fifo_and_does_not_rebase_stale_intent,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'first.krf',first,First),source(D,'second.krf',second,Second),
    setup_call_cleanup(gate(First,Entered,Continue),
      (wrap_compile,kb_store:generation(G),
       queue_load([First],G,O,A),entered(Entered,_),queue_load([Second],G,O,B),
       wait_staged(B,Native),assertion(exists_file(Native)),kb_store:generation(G),
       thread_send_message(Continue,continue),await(A,Loaded),
       await_failed(B,Error),assertion(Error=error(generation_conflict(G,_),_)),
       assertion(\+exists_file(Native)),kb_store:status(Current),
       assertion(Current.generation==Loaded.generation),assertion(Current.counts.assertions==1),
       kb_store:query_text("(p ?X)",x_M,5,2,Answer),
       Answer.solutions=[S],S.bindings=[Binding],assertion(Binding.value.value==x_first)),
      destroy_gate(Entered,Continue)).

test(whole_file_addition_compiles_only_target_and_reuses_cache,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'kept.krf',kept,Kept),source(D,'added.krf',added,Added),
    kb_config:server_settings(SettingsBefore),
    queue_load([Kept],any,O,Initial),await(Initial,Before),
    kb_store:source_info(Kept,KeptInfo),kb_store:source_module(Kept,Module,Native),
    kb_cache:file_digest(Added,Original),
    delete_file(Kept),
    queue_file_load(Added,Before.generation,O,Job),await(Job,After),
    assertion(After.counts.assertions==2),assertion(After.addition.changed==[Added]),
    kb_store:source_info(Kept,KeptInfo),kb_store:source_module(Kept,Module,Native),
    kb_store:source_info(Added,Info),assertion(Info.status==generated),
    kb_store:query_text("(p added)",x_M,2,2,Answer),assertion(Answer.solutions=[_]),
    queue_file_load(Added,After.generation,O,Again),await(Again,Reused),
    assertion(Reused.generation==After.generation),assertion(Reused.addition.changed==[]),
    assertion(Reused.addition.reused==[Added]),
    kb_cache:file_digest(Added,Original),
    kb_config:server_settings(SettingsAfter),assertion(SettingsAfter==SettingsBefore).

test(whole_file_addition_conflicts_without_discarding_concurrent_load,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'kept.krf',kept,Kept),source(D,'first.krf',first,First),source(D,'second.krf',second,Second),
    queue_load([Kept],any,O,Initial),await(Initial,Before),
    setup_call_cleanup(gate(First,Entered,Continue),
      (wrap_compile,queue_file_load(First,Before.generation,O,A),entered(Entered,_),
      queue_file_load(Second,Before.generation,O,B),wait_staged(B,Native),
      thread_send_message(Continue,continue),await(A,Loaded),
      await_failed(B,Error),assertion(Error=error(generation_conflict(_,_),_)),
      assertion(\+exists_file(Native)),kb_store:source_info(Kept,_),kb_store:source_info(First,_),
      assertion(\+kb_store:source_info(Second,_)),kb_store:generation(Loaded.generation),
      catch(queue_file_load(Second,Before.generation,O,_),Stale,true),
      assertion(Stale=error(generation_conflict(_,_),_)),
      queue_file_load(Second,Loaded.generation,O,Retry),await(Retry,After),
      assertion(After.counts.assertions==3)),
      destroy_gate(Entered,Continue)).

test(whole_file_failure_preserves_generation_and_allows_repair,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'kept.krf',kept,Kept),source(D,'broken.krf','(',Broken),
    queue_load([Kept],any,O,Initial),await(Initial,Before),
    queue_file_load(Broken,Before.generation,O,Job),await_failed(Job,Error),
    assertion(Error=error(compile_incomplete(_),_)),
    kb_store:generation(Before.generation),kb_store:source_info(Kept,_),
    assertion(\+kb_store:source_info(Broken,_)),
    source(D,'broken.krf',repaired,Broken),
    queue_file_load(Broken,Before.generation,O,Retry),await(Retry,After),
    assertion(After.counts.assertions==2).

test(whole_file_action_rejects_directories,
     [setup(fixture(D,O)),cleanup(cleanup(D)),throws(error(domain_error(kb_source_file,_),_))]) :-
    queue_file_load(D,any,O,_).

test(whole_file_jobs_expose_task_lists_and_details,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'task.krf','(',File),
    setup_call_cleanup(gate(File,Entered,Continue),
      (wrap_compile,queue_file_load(File,any,O,Job),entered(Entered,_),
       kb_pool_settings:task_list(_{pool:file,state:active},Active),
       Active.items=[Task],assertion(Task.id==Job.jobId),assertion(Task.kind==load),
       kb_pool_settings:task_details(Job.jobId,_{section:files},Details),
       assertion(Details.task.id==Job.jobId),assertion(Details.request.kind==load),
       assertion(Details.total==1),
       thread_send_message(Continue,continue),await_failed(Job,_),
       kb_pool_settings:task_list(_{pool:file,state:completed},Completed),
       Completed.items=[Failed],assertion(Failed.state==failed),
       kb_pool_settings:task_details(Job.jobId,_{section:results},Result),
       assertion(Result.task.state==failed)),
      destroy_gate(Entered,Continue)).

test(cancelled_claim_cleans_up_and_the_worker_is_reusable,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'cancel.krf',cancelled,File),
    setup_call_cleanup(gate(File,Entered,Continue),
      (wrap_parsed,queue_index([File],O,Job),entered(Entered,Thread),
       kb_paths:cache_paths(File,Data,_),atom_concat(Data,'.tmp',Marker),
       assertion(exists_file(Marker)),cancel_job(Job.jobId),
       await_failed(Job,Error),assertion(Error=job_cancelled(_)),
       assertion(\+exists_file(Marker)),assertion(\+exists_file(Data)),
       assertion(\+kb_jobs:reservation(_,_,_)),
       thread_property(Thread,status(running)),
       retractall(barrier(File,_,_)),
       queue_index([File],O,Retry),await(Retry,R),assertion(R.generated==1)),
      destroy_gate(Entered,Continue)).

test(cancelled_batch_removes_staged_native_files_before_completion,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'ready.krf',ready,Ready),source(D,'blocked.krf',blocked,Blocked),
    setup_call_cleanup(gate(Blocked,Entered,Continue),
      (wrap_compile,kb_store:generation(G),queue_load([Ready,Blocked],G,O,Job),
       entered(Entered,_),wait_staged(Job,Native),
       cancel_job(Job.jobId),await_failed(Job,_),
       assertion(\+exists_file(Native)),kb_store:generation(G),
       assertion(\+kb_store:source_info(_,_))),
      destroy_gate(Entered,Continue)).

test(bounded_queue_rejects_without_losing_existing_work,
     [setup(fixture(_{start:1,max:1,spare:0,queueCapacity:1},D,O)),cleanup(cleanup(D))]) :-
    source(D,'busy.krf',busy,File),
    setup_call_cleanup(gate(File,Entered,Continue),
      (wrap_compile,queue_index([File],O,First),entered(Entered,_),
       catch(queue_index([File],O,_),Error,true),assertion(Error=error(task_queue_full(file),_)),
       thread_send_message(Continue,continue),await(First,_)),
      destroy_gate(Entered,Continue)).

test(synchronous_load_wrapper_awaits_and_native_reload_is_duplicate_free,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'sync.krf',sync,File),queue_index([File],O,Index),await(Index,_),
    kb_store:load_sources([File],any,First),
    kb_store:source_module(File,Module,Native),
    kb_store:load_sources([File],First.generation,Second),
    kb_store:source_module(File,Module,Native),
    assertion(Second.counts.assertions==1),
    findall(Id,kb_runtime:module_assertion(Module,Id,_,_),Ids),assertion(length(Ids,1)).

stale_retention_info(missing_policy,Info,Old) :- del_dict(retentionPolicy,Info,_,Old).
stale_retention_info(stale_policy,Info,Old) :- Old=Info.put(retentionPolicy,obsolete).
stale_retention_info(missing_origin,Info,Old) :- del_dict(sourceOrigin,Info,_,Old).
stale_retention_info(different_origin,Info,Old) :- Old=Info.put(sourceOrigin,sumo).
replace_source_info(File,Info) :-
    with_mutex(openworld_store,transaction(
      (retractall(kb_store:source_info(File,_)),assertz(kb_store:source_info(File,Info))))).

test(native_staging_requires_current_retention_and_matching_origin,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'retention-stage.krf',kept,File),
    queue_load([File],any,O,Load),await(Load,_),
    kb_store:source_info(File,Info),kb_store:source_module(File,Module,Native),
    kb_runtime:module_assertion(Module,Id,_,_),
    kb_store:prepare_source(Info,Prepared),
    kb_store:stage_source(Prepared,entry(File,_,Module,Native,_,true)),
    setup_call_cleanup(
      assertz(Module:'xc_cyc::original-formula'(Id,"pre-policy native payload"),Heavy),
      forall(member(Kind,[missing_policy,stale_policy,missing_origin,different_origin]),
        (stale_retention_info(Kind,Info,Old),
         setup_call_cleanup(replace_source_info(File,Old),
           setup_call_cleanup(kb_store:stage_source(Prepared,Entry),
             (Entry=entry(File,NewInfo,NewModule,NewNative,_,Reuse),
              assertion(Reuse==false),assertion(NewModule\==Module),
              assertion(NewNative\==Native),assertion(NewInfo.outputHash==Info.outputHash),
              assertion(exists_file(Native)),
              assertion(\+kb_runtime:module_metadata(NewModule,'cyc::original-formula',Id,_)),
              kb_runtime:query_modules([NewModule],x_p(x_kept),x_M,2,2,[_])),
             kb_store:cleanup_staged([Entry])),
           replace_source_info(File,Info)))),
      erase(Heavy)).

test(cached_addition_replaces_stale_retention_without_changing_cache_bytes,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'retention-cached.krf',kept,File),
    queue_load([File],any,O,Load),await(Load,_),
    forall(member(Kind,[missing_policy,stale_policy,missing_origin,different_origin]),
      (kb_store:source_info(File,Info),kb_store:source_module(File,OldModule,OldNative),
       kb_runtime:module_assertion(OldModule,Id,_,_),kb_store:generation(Generation),
       stale_retention_info(Kind,Info,Old),
       Snapshot=_{source:File,sourceHash:Info.sourceHash,outputHash:Info.outputHash},
       setup_call_cleanup(
         (replace_source_info(File,Old),
          assertz(OldModule:'xc_cyc::original-formula'(Id,"pre-policy native payload"),Heavy)),
         (queue_cached_load([Snapshot],Generation,Job),await(Job,After),
          assertion(After.generation=:=Generation+1),assertion(After.addition.changed==[File]),
          kb_store:source_info(File,Fresh),kb_store:source_module(File,Module,Native),
          assertion(Module\==OldModule),assertion(Native\==OldNative),
          assertion(Fresh.outputHash==Info.outputHash),
          assertion(Fresh.sourceOrigin==non_sumo),
          kb_metadata_policy:retention_policy(Policy),assertion(Fresh.retentionPolicy==Policy),
          assertion(\+exists_file(OldNative)),
          assertion(\+kb_runtime:module_metadata(Module,'cyc::original-formula',Id,_)),
          queue_cached_load([Snapshot],After.generation,Noop),await(Noop,Unchanged),
          assertion(Unchanged.generation==After.generation),
          assertion(Unchanged.addition.changed==[]),
          kb_store:source_module(File,Module,Native)),
         erase(Heavy)))).

test(cached_addition_preserves_missing_unrelated_live_sources,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'old.krf',old,Old),source(D,'new.krf',new,New),
    kb_store:generation(G),queue_load([Old],G,O,Loading),await(Loading,Before),
    kb_store:source_info(Old,OldInfo),kb_store:source_module(Old,OldModule,OldNative),
    queue_index([New],O,Index),await(Index,_),
    kb_paths:cache_paths(New,Data,_),
    kb_cache:file_digest(New,SourceHash),kb_cache:file_digest(Data,OutputHash),
    delete_file(Old),
    Snapshot=_{source:New,sourceHash:SourceHash,outputHash:OutputHash},
    queue_cached_load([Snapshot],Before.generation,Pack),await(Pack,After),
    assertion(After.counts.assertions==2),
    kb_store:source_info(Old,OldInfo),kb_store:source_module(Old,OldModule,OldNative),
    kb_store:add_cached_sources([Snapshot],After.generation,Noop),
    assertion(Noop.generation==After.generation),assertion(Noop.addition.changed==[]).

test(source_failure_preserves_the_prior_generation,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'old.krf',old,Old),kb_store:generation(G),
    queue_load([Old],G,O,Initial),await(Initial,Before),
    source(D,'good.krf',good,Good),directory_file_path(D,'bad.krf',Bad),
    setup_call_cleanup(open(Bad,write,S),write(S,'(broken'),close(S)),
    queue_load([Good,Bad],Before.generation,O,Broken),
    await_failed(Broken,Error),assertion(Error=error(compile_incomplete(_),_)),
    kb_store:status(After),assertion(After.generation==Before.generation),
    assertion(After.counts.assertions==1),kb_paths:cache_paths(Good,Data,_),
    assertion(exists_file(Data)).

test(native_loading_exception_cleans_owned_snapshots,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'native-fail.krf',bad,File),message_queue_create(Paths),
    setup_call_cleanup(
      wrap_predicate(kb_runtime:native_load(Native,_Module,_Options),file_pool_test,Wrapped,
        (sub_atom(Native,_,_,0,'native-fail.krf.data')->
          thread_send_message(Paths,native(Native)),throw(error(fixture_native_failure,_));
         call(Wrapped))),
      (kb_store:generation(G),queue_load([File],G,O,Job),
       await_failed(Job,Error),assertion(Error=error(fixture_native_failure,_)),
       thread_get_message(Paths,native(Native),[timeout(2)]),
       assertion(\+exists_file(Native)),kb_store:generation(G)),
      message_queue_destroy(Paths)).

test(publication_exception_rolls_back_all_active_store_changes,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'old.krf',old,Old),kb_store:generation(G),
    queue_load([Old],G,O,Initial),await(Initial,Before),
    kb_store:source_module(Old,Module,Native),
    source(D,'replacement.krf',replacement,Replacement),
    wrap_predicate(kb_store:activate_source(_Entry),file_pool_test,Wrapped,
      (call(Wrapped),throw(error(fixture_publication_failure,_)))),
    queue_load([Replacement],Before.generation,O,Job),
    await_failed(Job,Error),assertion(Error=error(fixture_publication_failure,_)),
    kb_store:status(After),assertion(After.generation==Before.generation),
    assertion(After.counts.assertions==1),
    kb_store:source_module(Old,Module,Native),
    kb_store:query_text("(p ?X)",x_M,5,2,Answer),
    Answer.solutions=[S],S.bindings=[Binding],assertion(Binding.value.value==x_old).

test(obsolete_cleanup_failure_does_not_delete_newly_committed_snapshots,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'old.krf',old,Old),kb_store:generation(G),
    queue_load([Old],G,O,Initial),await(Initial,Before),
    kb_store:source_module(Old,_,OldNative),
    source(D,'new.krf',new,New),
    wrap_predicate(kb_store:cleanup_native(Path),file_pool_test,Wrapped,
      (Path==OldNative->throw(error(fixture_obsolete_cleanup_failure,_));call(Wrapped))),
    queue_load([New],Before.generation,O,Job),await(Job,After),
    assertion(After.generation=:=Before.generation+1),
    assertion(After.cleanupIssues=[_]),
    kb_store:source_module(New,_,NewNative),assertion(exists_file(NewNative)),
    unwrap_predicate_for(obsolete),kb_store:cleanup_native(OldNative),
    kb_store:query_text("(p ?X)",x_M,5,2,Answer),
    Answer.solutions=[S],S.bindings=[Binding],assertion(Binding.value.value==x_new).

test(one_load_stages_files_on_multiple_native_workers,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    message_queue_create(Entered),message_queue_create(Continue),
    setup_call_cleanup(
      wrap_predicate(kb_runtime:native_load(Native,_Module,_Options),file_pool_test,Wrapped,
        (thread_self(T),thread_send_message(Entered,entered(T,Native)),
         thread_get_message(Continue,continue),call(Wrapped))),
      (findall(F,(between(1,5,N),format(atom(Name),'native~d.krf',[N]),
          source(D,Name,N,F)),Files),
       kb_store:generation(G),queue_load(Files,G,O,Job),
       findall(T,(between(1,5,_),entered(Entered,T)),Threads),
       sort(Threads,Unique),assertion(length(Unique,5)),
       forall(between(1,5,_),thread_send_message(Continue,continue)),
       await(Job,Loaded),assertion(Loaded.counts.assertions==5),
       kb_store:active_modules(Modules),assertion(length(Modules,5))),
      (message_queue_destroy(Entered),message_queue_destroy(Continue))).

test(native_busy_is_reported_without_loading_a_partial_selection,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'native-busy.krf',busy,File),
    kb_paths:cache_paths(File,Data,_),atom_concat(Data,'.lock',LockPath),
    setup_call_cleanup(kb_cache:try_lock(LockPath,Lock),
      (assertion(Lock\==busy),kb_store:generation(G),
       queue_load([File],G,O,Job),await_failed(Job,Error),
       Error=error(compile_incomplete(Summary),_),
       assertion(Summary.busy==1),assertion(Summary.failures==0),
       job_status(Job.jobId,Public),assertion(Public.error.kind==busy),
       kb_store:generation(G),assertion(\+kb_store:source_info(_,_))),
      kb_cache:release_lock(Lock)).

test(cancel_at_lock_acquisition_releases_the_native_handle,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'lock-cancel.krf',cancel,File),
    kb_paths:cache_paths(File,Data,_),atom_concat(Data,'.lock',LockPath),
    setup_call_cleanup(gate(LockPath,Entered,Continue),
      (wrap_predicate(kb_cache:try_lock(Path,_Lock),file_pool_test,Wrapped,
         (call(Wrapped),plunit_file_worker_pool:block(Path))),
       queue_index([File],O,Job),entered(Entered,_),
       cancel_job(Job.jobId),thread_send_message(Continue,continue),
       await_failed(Job,_),retractall(barrier(LockPath,_,_)),
       setup_call_cleanup(kb_cache:try_lock(LockPath,Again),
         assertion(Again\==busy),kb_cache:release_lock(Again))),
      destroy_gate(Entered,Continue)).

test(queued_cancellation_does_not_compile_the_cancelled_source,
     [setup(fixture(_{start:1,max:1,spare:0},D,O)),cleanup(cleanup(D))]) :-
    source(D,'first-blocked.krf',blocked,First),source(D,'never.krf',never,Never),
    setup_call_cleanup(gate(First,Entered,Continue),
      (wrap_compile,queue_index([First],O,A),entered(Entered,_),
       queue_index([Never],O,B),cancel_job(B.jobId),
       thread_send_message(Continue,continue),await(A,_),await_failed(B,_),
       kb_paths:cache_paths(Never,Data,Index),
       assertion(\+exists_file(Data)),assertion(\+exists_file(Index))),
      destroy_gate(Entered,Continue)).

test(drain_finishes_work_and_rejects_new_submissions,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'drain.krf',drained,File),
    setup_call_cleanup(gate(File,Entered,Continue),
      (wrap_compile,queue_index([File],O,Job),entered(Entered,_),
       thread_create(kb_jobs:stop_file_pool(drain),Stopper,[]),
       thread_wait(kb_jobs:pool_state(drain),
         [module(kb_jobs),wait_preds([pool_state/1]),retry_every(0.01),timeout(5)]),
       catch(queue_index([],[],_),Error,true),
       assertion(Error=error(file_pool_not_accepting,_)),
       thread_send_message(Continue,continue),thread_join(Stopper,true),
       job_status(Job.jobId,Done),assertion(Done.state==succeeded),
       assertion(\+file_pool_started)),
      destroy_gate(Entered,Continue)).

test(persistent_workers_clear_job_compiler_and_activity_context,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'context.krf',context,File),queue_index([File],O,Job),await(Job,_),
    thread_wait(plunit_file_worker_pool:workers_idle,
      [module(kb_jobs),wait_preds([worker/3]),retry_every(0.01),timeout(5)]),
    setup_call_cleanup(message_queue_create(Queue),
      (findall(T,kb_jobs:worker(file,T,_),Threads),
       forall(member(T,Threads),thread_signal(T,plunit_file_worker_pool:report_context(Queue))),
       forall(member(_,Threads),
         (thread_get_message(Queue,Context,[timeout(5)]),
          assertion(Context==context(false,false,false,false,false))))),
      message_queue_destroy(Queue)).

test(cleanup_failure_is_reported_and_retried_after_workers_stop,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'staged.krf',ready,Ready),source(D,'waiting.krf',waiting,Waiting),
    setup_call_cleanup(gate(Waiting,Entered,Continue),
      (wrap_compile,kb_store:generation(G),queue_load([Ready,Waiting],G,O,Job),
       entered(Entered,_),wait_staged(Job,Native),
       wrap_predicate(kb_store:cleanup_staged(Entries),file_pool_test,Wrapped,
         (Entries\=[]->throw(error(fixture_cleanup_denied,_));call(Wrapped))),
       cancel_job(Job.jobId),await_failed(Job,Error),
       assertion(Error=error(file_job_cleanup_failed(_,_),_)),
       assertion(kb_jobs:pending_cleanup(Native)),assertion(exists_file(Native)),
       unwrap_predicate_for(cleanup),stop_file_pool(cancel),
       assertion(\+exists_file(Native)),assertion(\+kb_jobs:pending_cleanup(_))),
      destroy_gate(Entered,Continue)).

test(code_reload_gate_and_http_restart_do_not_destroy_workers,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'active.krf',active,File),
    setup_call_cleanup(gate(File,Entered,Continue),
      (wrap_compile,queue_index([File],O,Job),entered(Entered,_),
       catch(kb_activity:with_exclusive_reload(true),Error,true),
       assertion(Error=error(application_reload_busy,_)),
       findall(T,kb_jobs:worker(file,T,_),Threads),
       http_server(http_dispatch,[port('127.0.0.1':Port),workers(1)]),
       setup_call_cleanup(attach_http(Port,_{start:1,max:1,spare:0}),
         (http_stop_server(Port,[]),detach_http(Port),
          http_server(http_dispatch,[port('127.0.0.1':Port),workers(1)]),
          http_stop_server(Port,[])),
         detach_http(Port)),
       forall(member(T,Threads),thread_property(T,status(running))),
       thread_send_message(Continue,continue),await(Job,_),
       thread_wait(plunit_file_worker_pool:workers_idle,
         [module(kb_jobs),wait_preds([worker/3]),retry_every(0.01),timeout(5)]),
       assertion(\+kb_activity:application_ticket(_)),
       kb_activity:with_exclusive_reload(true)),
      destroy_gate(Entered,Continue)).

test(shutdown_cancels_owned_jobs_and_joins_all_workers,
     [setup(fixture(D,O)),cleanup(cleanup(D))]) :-
    source(D,'stop.krf',stop,File),
    setup_call_cleanup(gate(File,Entered,Continue),
      (wrap_compile,queue_index([File],O,Job),entered(Entered,_),
       findall(T,kb_jobs:worker(file,T,_),Threads),kb_jobs:manager(Manager,_),
       stop_file_pool(cancel),job_status(Job.jobId,Done),assertion(Done.state==cancelled),
       assertion(\+file_pool_started),assertion(\+kb_jobs:manager(_,_)),
       forall(member(T,[Manager|Threads]),assertion(\+catch(thread_property(T,status(_)),_,fail))),
       start_file_pool(_{start:5,max:10,spare:2})),
      destroy_gate(Entered,Continue)).

:- end_tests(file_worker_pool).
