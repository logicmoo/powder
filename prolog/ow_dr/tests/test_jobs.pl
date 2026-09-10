:- begin_tests(worker_jobs).
:- use_module('../kb_server').
:- use_module('../kb_jobs').
:- use_module('../kb_config').
:- use_module('../kb_store').
:- use_module(library(filesex)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(socket)).

fixture(Directory,Previous) :-
    (getenv('POWDER_SERVER_SETTINGS',Old)->Previous=value(Old);Previous=none),
    tmp_file(powder_jobs,Directory),make_directory(Directory),
    directory_file_path(Directory,'settings.json',File),setenv('POWDER_SERVER_SETTINGS',File),
    kb_limits:server_defaults(Default),
    Profiles=_{loader:_{start:1,max:3,spare:1},inference:_{start:1,max:3,spare:1},http:_{start:1,max:3,spare:1}},
    save_server_settings(Default.put(pools,Profiles),none,Settings),start_pools(Settings).
cleanup(Directory,Previous) :-
    findall(Path,source_info(Path,_),Paths),
    forall(member(Path,Paths),(generation(G),unload_source(Path,G,_))),
    stop_pools,retractall(kb_jobs:job(_,_,_,_)),
    (Previous=value(Old)->setenv('POWDER_SERVER_SETTINGS',Old);unsetenv('POWDER_SERVER_SETTINGS')),
    delete_directory_and_contents(Directory).
source(Directory,Name,Value,File) :-
    directory_file_path(Directory,Name,File),
    setup_call_cleanup(open(File,write,S),
      format(S,'(in-microtheory M)~n(p ~w)~n',[Value]),close(S)),
    kb_compile:compile_source(File,[state_dir(Directory),progress(none)],_).

test(settings_are_durable_ordered_and_next_start_only,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    source(D,'a.krf',first,A),source(D,'b.krf',second,B),
    server_settings(Before),generation(G),
    save_server_settings(Before.put(_{startupConfigured:true,startupFiles:[B,A,B]}),Before.revision,After),
    assertion(After.startupFiles=[_,_]),server_settings(Read),
    assertion(Read.startupFiles==After.startupFiles),
    startup_selection([],Read,Read.startupFiles),startup_selection([A],Read,[A]),
    generation(G),assertion(\+source_info(_,_)),
    save_server_settings(Read.put(startupFiles,[]),Read.revision,Empty),
    startup_selection([],Empty,[]).

test(loader_intent_is_fifo_and_inference_is_a_separate_pool,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    source(D,'first.krf',first,A),source(D,'second.krf',second,B),
    generation(G),submit_load([A],G,First),submit_load([B],G,Second),
    await_result(First.jobId,R1),await_result(Second.jobId,R2),
    assertion(R2.generation=:=R1.generation+1),
    submit_inference(kb,query("(p ?X)",context(x_M),10,2),Query),
    await_result(Query.jobId,Answer),
    assertion(Answer.solutions=[_{mt:x_M,mtExpression:_,bindings:[_{name:"?X",value:_{type:symbol,value:x_second}}],proof:_}]),
    job_status(Query.jobId,Task),assertion(Task.pool==inference),assertion(Task.state==succeeded).

test(inference_snapshot_survives_loader_publication,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    source(D,'first.krf',first,A),source(D,'second.krf',second,B),
    generation(G),submit_load([A],G,First),await_result(First.jobId,Before),
    thread_self(Main),
    format(string(Code),'thread_send_message(~q, snapshot_ready), thread_get_message(continue), x_p(X).',[Main]),
    submit_inference(prolog,query(Code,context(x_M),10,3),Query),
    thread_get_message(snapshot_ready),
    submit_load([B],Before.generation,Second),await_result(Second.jobId,After),
    kb_jobs:worker(inference,Thread,running(Query.jobId)),thread_send_message(Thread,continue),
    await_result(Query.jobId,Result),
    assertion(Result.generation=:=Before.generation),
    assertion(Result.solutions=[_{bindings:[_{name:'X',value:"x_first"}]}]),
    assertion(After.generation=:=Before.generation+1).

test(profiles_scale_with_a_hard_maximum_and_keep_both_requested_lists,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    findall(J,(between(1,6,_),submit_inference(prolog,query("sleep(0.2), true.",none,1,2),J)),Jobs),
    thread_wait((kb_jobs:pool_stats(inference,S),S.total=:=3),[retry_every(0.01),timeout(2)]),
    assertion(S.total=<S.profile.max),
    task_overview(Overview),include(inference_task,Overview.tasks,Tasks),assertion(length(Tasks,6)),
    forall(member(J,Jobs),await_result(J.jobId,_)),
    kb_jobs:pool_stats(loader,Loader),assertion(Loader.total=:=1).
inference_task(Task) :- Task.pool==inference.

test(cancel_queued_or_running_inference_does_not_reexecute,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    submit_inference(prolog,query("sleep(2), flag(powder_cancel_counter, N, N+1).",none,1,3),Job),
    cancel_job(Job.jobId),
    thread_wait((job_status(Job.jobId,S),memberchk(S.state,[cancelled,failed])),[retry_every(0.01),timeout(2)]),
    assertion(S.state==cancelled).

test(queued_prolog_effects_are_once_only_and_not_exposed_in_task_lists,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    flag(powder_private_counter,_,0),
    submit_inference(prolog,query("flag(powder_private_counter, N, N+1), member(X,[a,b]).",none,2,2),Job),
    await_result(Job.jobId,Result),assertion(length(Result.solutions,2)),
    job_status(Job.jobId,_),task_overview(Overview),job_status(Job.jobId,_),
    flag(powder_private_counter,Count,Count),assertion(Count=:=1),
    term_string(Overview,Public),assertion(\+sub_string(Public,_,_,_,"powder_private_counter")).

slow_http(_) :- sleep(0.15),format('Content-type: text/plain~n~nok').
test(http_profile_uses_actual_listener_queue_and_enforces_maximum,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    tcp_socket(Socket),tcp_bind(Socket,'127.0.0.1':Port),tcp_close_socket(Socket),
    setup_call_cleanup(
      (http_handler('/pool-fixture',slow_http,[]),start_server(Port)),
      (http_workers(Port,Initial),assertion(Initial=:=1),
       format(atom(URL),'http://127.0.0.1:~d/pool-fixture',[Port]),
       findall(Thread,(between(1,6,_),thread_create(http_get(URL,_,[to(string)]),Thread,[])),Clients),
       thread_wait((kb_jobs:http_stats(Port,Stats),Stats.total=:=3),[retry_every(0.01),timeout(2)]),
       assertion(Stats.total=<Stats.profile.max),
       forall(member(Thread,Clients),thread_join(Thread,true)),
       kb_jobs:http_stats(Port,After),assertion(After.queued=:=0)),
      (stop_server,http_delete_handler('/pool-fixture'))).

test(missing_startup_source_fails_visibly_without_stopping_http,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    server_settings(Current),directory_file_path(D,'missing.krf',Missing),
    save_server_settings(Current.put(_{startupConfigured:true,startupFiles:[Missing]}),Current.revision,Saved),
    tcp_socket(Socket),tcp_bind(Socket,'127.0.0.1':Port),tcp_close_socket(Socket),
    setup_call_cleanup(start_server(Port,Saved),
      (generation(Before),queue_startup([],Saved,Accepted),
       thread_wait((job_status(Accepted.jobId,Task),Task.state==failed),[retry_every(0.01),timeout(3)]),
       generation(Before),assertion(Task.error.message\==""),
       kb_urls:api_path(status,Path),format(atom(URL),'http://127.0.0.1:~d~w',[Port,Path]),
       http_get(URL,Status,[json_object(dict)]),assertion(Status.startup.state=="failed")),
      stop_server).
:- end_tests(worker_jobs).
