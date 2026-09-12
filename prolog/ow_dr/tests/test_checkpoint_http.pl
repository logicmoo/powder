:- begin_tests(checkpoint_http).
:- use_module('../kb_checkpoint_http').
:- use_module('../kb_checkpoint_host',[]).
:- use_module('../kb_saved_state',[]).
:- use_module('../kb_server',[]).
:- use_module('../kb_urls',[app_base/1]).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_open)).
:- use_module(library(http/http_client)).
:- use_module(library(http/json)).
:- use_module(library(filesex)).
:- use_module(library(uuid)).

fixture(D,Port) :-
    source_file(plunit_checkpoint_http:fixture(_,_),File),file_directory_name(File,Tests),
    uuid(UUID),atom_concat('.checkpoint-http-',UUID,Name),
    directory_file_path(Tests,Name,D),make_directory(D),
    directory_file_path(D,'settings.json',Config),setenv('POWDER_SERVER_SETTINGS',Config),
    http_server(http_dispatch,[port('127.0.0.1':Port),workers(2)]),
    assertz(kb_server:server_port(Port)).
cleanup(D,Port) :-
    forall(kb_checkpoint_http:operation(Id,_,Thread),
      (Thread==none->true;cancel_checkpoint_operation(Id,_),wait_operation(Id,300,_))),
    (http_current_server(_,Port)->http_stop_server('127.0.0.1':Port,[]);true),
    retractall(kb_server:server_port(Port)),
    retractall(kb_checkpoint_http:operation(_,_,_)),
    unsetenv('POWDER_SERVER_SETTINGS'),delete_directory_and_contents(D).
url(Port,Action,URL) :-
    app_base(Base),format(atom(URL),'http://127.0.0.1:~d~wapi/checkpoint/~w',[Port,Base,Action]).
read_api(Port,Action,Options,Status,Reply) :-
    url(Port,Action,URL),
    setup_call_cleanup(http_open(URL,S,[status_code(Status)|Options]),json_read_dict(S,Reply),close(S)).
origin(Port,Origin) :- format(atom(Origin),'http://127.0.0.1:~d',[Port]).

test(real_get_catalog,[setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    read_api(P,catalog,[],Code,Reply),
    assertion(Code=:=200),assertion(Reply.items==[]),assertion(Reply.instance==null).
test(cross_origin_is_rejected,[setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    read_api(P,catalog,[request_header('Origin'='http://evil.invalid')],Code,_),
    assertion(Code=:=403).
test(select_requires_origin,[setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    url(P,select,URL),
    http_post(URL,json(_{id:none,revision:none}),_,[status_code(Code),json_object(dict)]),
    assertion(Code=:=403).
test(select_never_promotes,[setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    url(P,select,URL),origin(P,Origin),
    http_post(URL,json(_{id:none,revision:none}),Reply,
      [status_code(Code),json_object(dict),request_header('Origin'=Origin)]),
    assertion(Code=:=200),assertion(Reply.selected=="none"),
    assertion(\+kb_checkpoint:instance(_)).
test(promotion_requires_exact_consent,[setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    url(P,promote,URL),origin(P,Origin),
    http_post(URL,json(_{run:fake,revision:1,confirm:no}),_,
      [status_code(Code),json_object(dict),request_header('Origin'=Origin)]),
    assertion(Code=:=403).
test(native_cleanup_permission_is_not_reported_as_an_origin_failure) :-
    kb_checkpoint_http:error_description(
      error(permission_error(delete,directory,owned_runtime),test),Status,Code,_),
    assertion(Status=:=500),assertion(Code==checkpoint_failed).
test(trial_mutation_permission_is_an_explicit_conflict) :-
    kb_checkpoint_http:error_description(
      error(permission_error(modify,checkpoint_trial,read_only_until_promoted),test),
      Status,Code,_),
    assertion(Status=:=409),assertion(Code==trial_read_only).
test(nonserving_control_rejects_startup_and_mutation_actions) :-
    forall(member(Action,[save,trial,promote,activate]),
      (catch(kb_checkpoint:permitted_control_action(candidate,Action),Error,true),
       assertion(Error=error(permission_error(execute,checkpoint_control,Action),_)))),
    forall(member(Action,[proof,query,prepare,bind,stop]),
      kb_checkpoint:permitted_control_action(candidate,Action)).
test(private_bind_still_requires_explicit_promotion_consent) :-
    setup_call_cleanup(assertz(kb_checkpoint:candidate_context(_{targets:[]}),Ref),
      catch(kb_checkpoint:control_action(bind,_{profiles:[],confirm:no},_),Error,true),
      erase(Ref)),
    assertion(Error=error(permission_error(promote,checkpoint_candidate,explicit_approval_required),_)).
test(promotion_starts_console_wait_once) :-
    message_queue_create(Queue),
    setup_call_cleanup(
      assertz(kb_checkpoint_host:host(host{mode:promoting,configuration:_{primary:4012},stopQueue:Queue})),
      (kb_checkpoint:runtime_hook(activate,none,done),
       kb_checkpoint:runtime_hook(activate,none,done),
       thread_get_message(Queue,activate,[timeout(1)]),
       assertion(\+thread_get_message(Queue,_,[timeout(0)]))),
      (retractall(kb_checkpoint_host:host(_)),message_queue_destroy(Queue))).
test(explicit_sources_override_saved_mode) :-
    kb_checkpoint_host:startup_plan(['--saved-state=invalid','--kb-source=missing.krf'],
      cold(3050,['missing.krf'],[enabled(false),port(3051)])).
test(conflicting_startup_flags,[throws(error(domain_error(conflicting_checkpoint_startup_options,_),_))]) :-
    kb_checkpoint_host:startup_plan(['--cold-start','--saved-state=invalid'],_).
test(async_save_failure_preserves_catalog,[setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    kb_store:generation(G),Wrong is G+1,
    submit_checkpoint_operation(create,_{name:fixture,revision:none,generation:Wrong},Accepted),
    wait_operation(Accepted.id,600,Done),
    assertion(Done.phase==failed),
    kb_saved_state:saved_states(Catalog),assertion(Catalog.items==[]),
    kb_store:generation(G).
test(checkpoint_admission_lease_rejects_new_operations,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    setup_call_cleanup(kb_jobs:begin_checkpoint_drain(Lease),
      catch(submit_checkpoint_operation(create,_{name:fixture,revision:none,generation:0},_),
        Error,true),
      kb_jobs:end_checkpoint_drain(Lease)),
    assertion(Error=error(application_reload_busy,_)),
    assertion(\+kb_checkpoint_http:operation(_,_,_)).
test(pending_save_prevents_retirement_without_cancellation,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    Data=operation{phase:running,action:create},
    setup_call_cleanup(assertz(kb_checkpoint_http:operation(pending,Data,none),Ref),
      (catch(checkpoint_operations_quiescent,Error,true),
       assertion(Error=error(checkpoint_busy(operation(pending)),_)),
       assertion(kb_checkpoint_http:operation(pending,Data,none))),
      erase(Ref)).
test(only_empty_runtime_directory_cleanup_can_be_deferred,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    directory_file_path(D,empty,Empty),make_directory(Empty),
    Error=error(permission_error(delete,directory,Empty),test),
    kb_checkpoint:empty_directory_cleanup(Error,Empty,deferred_empty_directory),
    directory_file_path(Empty,payload,Payload),
    setup_call_cleanup(open(Payload,write,S),write(S,retained),close(S)),
    catch(kb_checkpoint:empty_directory_cleanup(Error,Empty,_),Failure,true),
    assertion(Failure==Error),assertion(exists_file(Payload)).
test(candidate_defers_debug_without_losing_the_saved_profile,
     [setup(fixture(D,P)),cleanup((kb_checkpoint_host:stop_host,
       kb_checkpoint_mode:permit_serving,cleanup(D,P)))]) :-
    kb_config:server_settings(Settings),
    kb_debug_telnet:debug_resume_profile(Default),
    Debug=Default.put(_{enabled:true,port:3051,max_sessions:3}),
    Runtime=runtime{schema:1,primary:P,debug:Debug},
    Metadata=_{checkpoint:_{runtime:Runtime},configuration:_{settings:Settings}},
    kb_checkpoint:runtime_hook(start_candidate,_{metadata:Metadata,stopQueue:main},_),
    findall(Port,kb_server:server_port(Port),Ports),assertion(Ports==[P]),
    assertion(\+kb_jobs:inference_pool_started),
    catch(kb_checkpoint_host:open_listener(_,Settings.pools.http),Blocked,true),
    assertion(Blocked=error(permission_error(start,checkpoint_services,nonserving),_)),
    kb_checkpoint_host:host_configuration(Captured),
    assertion(Captured.debug==Debug),
    kb_debug_telnet:debug_telnet_status(Actual),
    assertion(Actual.enabled==false),
    assertion(\+kb_debug_telnet:debug_credentials_file(_)).

test(host_resource_start_is_single_owned_generation,
     [setup(fixture(D,P)),cleanup((kb_checkpoint_host:stop_host,cleanup(D,P)))]) :-
    kb_config:server_settings(Settings),
    kb_checkpoint_host:start_host(Owned,Settings,[enabled(false),port(3051)],main),
    assertion(integer(Owned)),
    kb_jobs:task_overview(Before),
    catch(kb_checkpoint_host:start_host(_,Settings,[enabled(false),port(3051)],main),Error,true),
    assertion(Error=error(checkpoint_host_already_started,_)),
    kb_jobs:task_overview(After),assertion(Before=@=After),
    read_api(Owned,catalog,[],Code,Reply),
    assertion(Code=:=200),assertion(Reply.instance.primary=:=Owned),
    kb_checkpoint_host:listener_profiles(Profiles),
    kb_checkpoint:runtime_hook(release_ports,Profiles,done),
    assertion(\+kb_server:server_port(_)).
wait_operation(Id,N,Done) :-
    checkpoint_operation(Id,Current),
    (memberchk(Current.phase,[running,cancelling]),N>0->
      sleep(0.1),Left is N-1,wait_operation(Id,Left,Done)
    ;Done=Current).
:- end_tests(checkpoint_http).
