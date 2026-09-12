:- module(kb_checkpoint_host,
          [run_application/1, startup_plan/2, resume_host/2,
           start_host/4, wait_host/1, stop_host/0,
           host_configuration/1, require_mutable_instance/0,
           host_snapshot_safe/0]).
:- use_module(kb_saved_state, []).
:- use_module(kb_checkpoint, []).
:- use_module(kb_checkpoint_http, []).
:- use_module(kb_console_launch, []).
:- use_module(kb_server, []).
:- use_module(kb_config, []).
:- use_module(kb_store, []).
:- use_module(kb_jobs, []).
:- use_module(kb_activity, []).
:- use_module(kb_catalog, []).
:- use_module(kb_lifecycle, []).
:- use_module(kb_listener_control, []).
:- use_module(kb_interactive_control, []).
:- use_module(kb_debug_admin, []).
:- use_module(kb_debug_telnet, []).
:- use_module(kb_urls, [app_base/1]).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch), [http_dispatch/1]).
:- use_module(library(socket)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- dynamic host/1.
:- volatile host/1.
:- meta_predicate stop_stage(+,0).
:- multifile kb_saved_state:resume_application/2,
             kb_checkpoint:runtime_hook/3, kb_checkpoint:launch_hook/4,
             kb_checkpoint:process_hook/4.

% This is the serving adapter, not an additional initialization(main) entry.
% Importing it registers handlers/hooks only and never starts resources.
run_application(Args) :-
    startup_plan(Args,Plan),
    (Plan=saved(Id,Forward)->
      launch_selected(Id,Forward)
    ;Plan=cold(Port,Sources,Debug),
     kb_config:server_settings(Settings),
     setup_call_cleanup(kb_jobs:start_pools(Settings),
       (kb_store:load_sources(Sources,any,_),kb_catalog:remember_startup_sources,
        setup_call_cleanup(start_host(Port,Settings,Debug,main),
          wait_host(main),stop_host)),
       kb_jobs:stop_pools)).

startup_plan(Args,Plan) :-
    must_be(list,Args),maplist(must_be(atom),Args),
    startup_options(Args,normal,[],Mode,Forward),
    kb_debug_admin:debug_cli_options(Forward,AppArgs,Debug),
    app_arguments(AppArgs,3050,Port,[],Reversed),reverse(Reversed,Explicit),
    (Explicit\=[]->kb_config:server_settings(Settings),
      kb_config:startup_selection(Explicit,Settings,Sources),Plan=cold(Port,Sources,Debug)
    ;Mode=cold->kb_config:server_settings(Settings),
      kb_config:startup_selection([],Settings,Sources),Plan=cold(Port,Sources,Debug)
    ;Mode=state(Id)->kb_saved_state:saved_state_metadata(Id,_),Plan=saved(Id,Forward)
    ;kb_saved_state:startup_saved_state([],Choice),
     (Choice=saved(_,Metadata)->Plan=saved(Metadata.id,Forward)
     ;kb_config:server_settings(Settings),kb_config:startup_selection([],Settings,Sources),
      Plan=cold(Port,Sources,Debug))).
startup_options([],Mode,Reversed,Mode,Forward) :- reverse(Reversed,Forward).
startup_options([Arg|Args],Before,Accumulated,Mode,Forward) :-
    (Arg=='--cold-start'->Next=cold,Rest=Accumulated
    ;atom_concat('--saved-state=',Id,Arg)->Next=state(Id),Rest=Accumulated
    ;Next=Before,Rest=[Arg|Accumulated]),
    ((Before\==normal,Next\==Before,Next\==normal)->
       domain_error(conflicting_checkpoint_startup_options,Arg);true),
    startup_options(Args,Next,Rest,Mode,Forward).
app_arguments([],Port,Port,Sources,Sources).
app_arguments(['--'|Args],P,Port,S,Files) :- !,app_arguments(Args,P,Port,S,Files).
app_arguments([Arg|Args],P,Port,S,Files) :-
    (atom_concat('--port=',Text,Arg)->port_number(Text,Next),Sources=S
    ;atom_concat('--kb-source=',Source,Arg)->Next=P,Sources=[Source|S]
    ;atom_concat('--kb-dir=',Source,Arg)->Next=P,Sources=[Source|S]
    ;sub_atom(Arg,0,2,_,'--')->domain_error(option,Arg)
    ;Next=P,Sources=[Arg|S]),
    app_arguments(Args,Next,Port,Sources,Files).
port_number(Text,Port) :-
    (catch(atom_number(Text,Port),_,fail),integer(Port),between(1,65535,Port)->true;
      domain_error(http_port,Text)).

launch_selected(Id,Args) :-
    kb_saved_state:run_saved_state(Id,Args,Exit),
    (Exit==exit(0)->true;throw(error(saved_state_application_exit(Exit),_))).

kb_saved_state:resume_application(Args,Metadata) :-
    kb_checkpoint_host:resume_host(Args,Metadata).
resume_host(Args,Metadata) :-
    resume_configuration(Args,Metadata,Port,Debug),
    Settings=Metadata.configuration.settings,
    setup_call_cleanup(start_host(Port,Settings,Debug,main),
      (resume_extra_listeners(Metadata,Port),wait_host(main)),stop_host).
resume_extra_listeners(Metadata,Primary) :-
    saved_configuration(Metadata,Config),
    forall((member(Profile,Metadata.checkpoint.profiles),
            Profile.port=\=Config.primary,Profile.port=\=Primary),
      open_listener(Profile.port,Profile.http)).
resume_configuration(Args,Metadata,Port,Debug) :-
    saved_configuration(Metadata,Saved),
    kb_debug_admin:debug_cli_options(Args,Remaining,ExplicitDebug),
    app_arguments(Remaining,Saved.primary,Port,[],Sources),
    (Sources==[]->true;permission_error(load,saved_application_sources,Sources)),
    (member(Arg,Args),(Arg=='--debug-off';atom_concat('--debug-port=',_,Arg))->
      memberchk(enabled(Enabled),ExplicitDebug),memberchk(port(DebugPort),ExplicitDebug),
      Debug=Saved.debug.put(_{enabled:Enabled,port:DebugPort})
    ;Debug=Saved.debug).
saved_configuration(Metadata,Config) :-
    (is_dict(Metadata.checkpoint),get_dict(runtime,Metadata.checkpoint,Config),
     is_dict(Config)->true;
      throw(error(saved_state_host_configuration_missing,_))).
debug_dict(Options,Debug) :-
    kb_debug_telnet:debug_resume_profile(Default),
    foldl(debug_option,Options,Default,Debug),
    kb_debug_telnet:debug_profile_options(Debug,_).
debug_option(Option,Before,After) :-
    Option=..[Key,Value],get_dict(Key,Before,_),After=Before.put(Key,Value).

start_host(Port,Settings,DebugInput,StopQueue) :-
    (is_list(DebugInput)->debug_dict(DebugInput,Debug);Debug=DebugInput),
    with_mutex(powder_checkpoint_host,
      (host(_)->throw(error(checkpoint_host_already_started,_));
       start_host_locked(Port,Settings,Debug,StopQueue))).
start_host_locked(Port,Settings,Debug,StopQueue) :-
    Config=runtime{schema:1,primary:Port,debug:Debug},
    setup_call_catcher_cleanup(true,
      (kb_jobs:start_pools(Settings),
       open_listener(Port,Settings.pools.http),
       assertz(host(host{configuration:Config,settings:Settings,stopQueue:StopQueue,
         primary:Port,mode:active})),
       kb_checkpoint:start_managed_instance(Port,_),
       start_debug(Debug)),
      Catcher,(Catcher==exit->true;stop_host)).
wait_host(Queue) :-
    kb_store:status(Status),host(H),app_base(Base),
    format('powder - Paraconsistent Open World Defeasible Epistemic Reasoner~nReady: http://localhost:~d~w~n',
      [H.primary,Base]),
    format('Generation ~d; ~d assertions already loaded.~n',[Status.generation,Status.counts.assertions]),
    kb_lifecycle:wait_for_stop([stop_queue(Queue),
      make(kb_listener_control:make_application),
      restart(kb_listener_control:restart_listeners),
      bind(kb_listener_control:bind_loopback_listener),
      prolog(kb_interactive_control:prolog_console),
      shell(kb_interactive_control:os_shell)]).
stop_host :-
    stop_stage(debug,kb_debug_admin:stop_host_debug),
    stop_stage(http,close_all_listeners),
    stop_stage(control,kb_checkpoint:stop_managed_instance),
    stop_stage(pools,kb_jobs:stop_pools),retractall(host(_)).
stop_stage(Stage,Goal) :-
    catch(Goal,Error,throw(error(checkpoint_host_cleanup_failed(Stage,Error),_))).

host_configuration(Config) :-
    host(H),
    (H.mode==candidate->Config=H.configuration
    ;kb_debug_telnet:debug_resume_profile(D),
     Config=H.configuration.put(debug,D)).
host_snapshot_safe :-
    (host(_)->throw(error(saved_state_unexpected_host_resources,_));true).
require_mutable_instance :-
    (kb_checkpoint:checkpoint_instance(I),I.role==candidate->
      permission_error(modify,checkpoint_trial,read_only_until_promoted);true).

open_listener(Port,Profile) :-
    with_mutex(openworld_listener_control,
      (nonvar(Port),kb_server:server_port(Port)->
        throw(error(permission_error(bind,owned_http_port,Port),_))
      ;http_server(http_dispatch,[port('127.0.0.1':Port),workers(Profile.start)]),
       assertz(kb_server:server_port(Port)),
       kb_jobs:attach_http(Port,Profile))).
close_listener(Port) :-
    with_mutex(openworld_listener_control,
      (kb_server:server_port(Port)->
        http_stop_server('127.0.0.1':Port,[]),
        retractall(kb_server:server_port(Port)),kb_jobs:detach_http(Port)
      ;true)).
close_all_listeners :-
    findall(P,kb_server:server_port(P),Ports),maplist(close_listener,Ports).
listener_profiles(Profiles) :-
    findall(listener{port:Port,workers:Start,http:Profile},
      (kb_server:server_port(Port),
       (kb_jobs:http_pool(Port,Profile)->true;
         http_workers(Port,Workers),Profile=profile{start:Workers,max:Workers,spare:0}),
       get_dict(start,Profile,Start)),Profiles).
start_debug(Debug) :-
    kb_debug_admin:start_host_debug(Debug).
free_loopback_port(Port) :-
    setup_call_cleanup(tcp_socket(Socket),tcp_bind(Socket,ip(127,0,0,1):Port),tcp_close_socket(Socket)).

kb_checkpoint:launch_hook(Exe,Args,Directory,PID) :-
    host(_),
    kb_console_launch:launch_new_console(Exe,Args,Directory,PID).
kb_checkpoint:process_hook(Action,PID,Options,Result) :-
    host(_),
    kb_console_launch:process_control(Action,PID,Options,Result).
kb_checkpoint:runtime_hook(configuration,_,Config) :- host_configuration(Config).
kb_checkpoint:runtime_hook(capabilities,_,[drain,resume_admissions,release_ports,
    bind_ports,recovery_listener,retire_old,activate]) :- host(_).
kb_checkpoint:runtime_hook(profiles,_,Profiles) :- host(_),listener_profiles(Profiles).
kb_checkpoint:runtime_hook(start_candidate,Input,Port) :-
    is_dict(Input.metadata.checkpoint),get_dict(runtime,Input.metadata.checkpoint,_),
    saved_configuration(Input.metadata,Config),Settings=Input.metadata.configuration.settings,
    setup_call_catcher_cleanup(true,
      (kb_jobs:start_pools(Settings),open_listener(Port,Settings.pools.http),
       assertz(host(host{configuration:Config,settings:Settings,stopQueue:Input.stopQueue,
         primary:Port,mode:candidate})),
       (Config.debug.enabled==true->free_loopback_port(DebugPort),
         start_debug(Config.debug.put(port,DebugPort));true)),
      Catcher,(Catcher==exit->true;stop_host)).
kb_checkpoint:runtime_hook(wait_candidate,Queue,done) :- wait_host(Queue).
kb_checkpoint:runtime_hook(stop_candidate,_,done) :- host(_),stop_host.
kb_checkpoint:runtime_hook(drain,_,Lease) :-
    host(_),
    kb_jobs:begin_checkpoint_drain(Token),
    catch((kb_checkpoint_http:checkpoint_operations_quiescent,
           kb_debug_telnet:debug_require_admission_quiescence,
           (\+kb_interactive_control:interactive_context_active->true;
             throw(error(checkpoint_busy(interactive_session),_))),
           Lease=Token),Error,(kb_jobs:end_checkpoint_drain(Token),throw(Error))).
kb_checkpoint:runtime_hook(resume_admissions,Lease,done) :- kb_jobs:end_checkpoint_drain(Lease).
kb_checkpoint:runtime_hook(release_ports,Profiles,done) :-
    host(H),
    (member(Primary,Profiles),Primary.port=:=H.configuration.primary->kb_debug_admin:stop_debug_for_transfer;true),
    forall(member(P,Profiles),close_listener(P.port)).
kb_checkpoint:runtime_hook(bind_ports,Profiles,done) :-
    forall(member(P,Profiles),
      (kb_server:server_port(P.port)->true;
        (get_dict(http,P,Profile)->true;Profile=profile{start:P.workers,max:P.workers,spare:0}),
        open_listener(P.port,Profile))),
    host(H),
    (member(P,Profiles),P.port=:=H.configuration.primary->
      kb_debug_admin:stop_debug_for_transfer,start_debug(H.configuration.debug);true).
kb_checkpoint:runtime_hook(recovery_listener,_,Port) :-
    host(H),open_listener(Port,H.settings.pools.http).
kb_checkpoint:runtime_hook(activate,_,done) :-
    retract(host(H)),assertz(host(H.put(_{mode:active,primary:H.configuration.primary}))).
kb_checkpoint:runtime_hook(retire_old,_,done) :-
    host(H),thread_send_message(H.stopQueue,stop).
