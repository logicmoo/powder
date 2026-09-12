:- begin_tests(checkpoint_wiring).
:- prolog_load_context(directory,D),directory_file_path(D,'../app.pl',App),
   load_files(user:App,[if(not_loaded)]).
:- use_module('../kb_checkpoint_host',[]).
:- use_module('../kb_checkpoint_policy',[]).
:- use_module('../kb_server',[]).
:- use_module('../kb_urls',[app_base/1]).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_client)).
:- use_module(library(filesex)).
:- use_module(library(uuid)).

fixture(C) :-
    source_file(plunit_checkpoint_wiring:fixture(_),Here),file_directory_name(Here,Tests),
    uuid(Id),atom_concat('.checkpoint-wiring-',Id,FixtureName),
    directory_file_path(Tests,FixtureName,Dir),make_directory(Dir),
    findall(Name-Old,(member(Name,['POWDER_SERVER_SETTINGS','POWDER_SOURCE_PACKS','POWDER_NATIVE_TVA_FILE']),
      (getenv(Name,V)->Old=some(V);Old=none)),Environment),
    directory_file_path(Dir,'settings.json',Settings),setenv('POWDER_SERVER_SETTINGS',Settings),
    directory_file_path(Dir,'packs.json',Packs),setenv('POWDER_SOURCE_PACKS',Packs),
    directory_file_path(Dir,'native.pl',Native),setenv('POWDER_NATIVE_TVA_FILE',Native),
    http_server(http_dispatch,[port('127.0.0.1':Port),workers(2)]),
    assertz(kb_server:server_port(Port)),
    C=case{directory:Dir,environment:Environment,port:Port}.
cleanup(C) :-
    (http_current_server(_,C.port)->http_stop_server('127.0.0.1':C.port,[]);true),
    retractall(kb_server:server_port(C.port)),
    forall(member(Name-Old,C.environment),
      (Old=some(Value)->setenv(Name,Value);unsetenv(Name))),
    delete_directory_and_contents(C.directory).
url(C,Action,URL) :-
    app_base(Base),format(atom(URL),'http://127.0.0.1:~d~wapi/~w',[C.port,Base,Action]).
post(C,Action,Body,Status,Reply) :-
    url(C,Action,URL),format(atom(Origin),'http://127.0.0.1:~d',[C.port]),
    http_post(URL,json(Body),Reply,[status_code(Status),json_object(dict),
      request_header('Origin'=Origin)]).
candidate(C,Goal) :-
    setup_call_cleanup(
      assertz(kb_checkpoint:instance(instance{id:fixture,primary:C.port,role:candidate}),Ref),
      call(Goal),erase(Ref)).
:- meta_predicate candidate(+,0).

test(app_entry_delegates_without_another_main_loop) :-
    clause(user:run(Args),Body),assertion(Body==kb_checkpoint_host:run_application(Args)).

test(cli_source_order_port_and_debug_policy_are_preserved) :-
    kb_checkpoint_host:startup_plan(
      ['--debug-port=4073','--port=4072','first.krf','--kb-source=second.krf'],
      cold(4072,['first.krf','second.krf'],[enabled(true),port(4073)])).

test(trials_reject_mutations_across_all_mounted_handlers,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    kb_store:generation(G),
    candidate(C,forall(member(Action,['kb/unload','kb/packs/save','tva/reset',
      'catalog/cancel','source/editor','app/reload','checkpoint/create']),
      (post(C,Action,_{},Code,Reply),
       assertion(Code=:=409),assertion(Reply.error.code=="trial_read_only")))),
    kb_store:generation(G),directory_files(C.directory,Files),
    assertion(Files==['.','..']).

test(trial_query_post_reaches_the_safe_query_dispatcher,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    candidate(C,post(C,query,_{query:"(checkpointFixtureMissing ?X)",limit:1,timeout:1},Code,Reply)),
    assertion(Code=\=409),
    assertion(\+ (get_dict(error,Reply,Error),get_dict(code,Error,"trial_read_only"))).

test(read_only_post_whitelist_does_not_include_save_or_queue) :-
    forall(member(Path,['query','assertions/annotations','tva/summary','tva/detail',
      'tva/assertion','tva/interpretation','tva/interpretations','terms/sections',
      'kb/statistics/selected','kb/packs/resolve']),kb_server:trial_read_only_post(Path)),
    forall(member(Path,['tva/assertion/save','tva/settings/save','kb/queue',
      'pools/save','tasks/cancel']),assertion(\+kb_server:trial_read_only_post(Path))).

test(starting_and_not_yet_activated_candidates_are_already_read_only) :-
    setup_call_cleanup(assertz(kb_checkpoint:candidate_starting,Starting),
      assertion(kb_checkpoint:checkpoint_read_only),erase(Starting)),
    setup_call_cleanup(assertz(kb_checkpoint:candidate_lease(fixture),Lease),
      assertion(kb_checkpoint:checkpoint_read_only),erase(Lease)),
    assertion(\+kb_checkpoint:checkpoint_read_only).

test(paused_normal_startup_has_no_checkpoint_control_listener,
     [condition((kb_checkpoint_policy:checkpoint_policy(P),get_dict(executionPaused,P,true))),
      setup(fixture(C)),cleanup(cleanup(C))]) :-
    kb_config:server_settings(Settings),
    setup_call_cleanup(kb_checkpoint_host:start_cold_host(Port,Settings,[enabled(false),port(3051)]),
      (assertion(integer(Port)),assertion(kb_server:server_port(Port)),
       assertion(\+kb_checkpoint:instance(_)),
       kb_debug_telnet:debug_telnet_status(Debug),assertion(Debug.enabled==false),
       assertion(\+kb_debug_telnet:debug_credentials_file(_))),
      kb_checkpoint_host:stop_host).

:- end_tests(checkpoint_wiring).
