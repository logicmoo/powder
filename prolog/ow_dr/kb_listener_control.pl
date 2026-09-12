:- module(kb_listener_control, [restart_listeners/0, bind_loopback_listener/1,
                                stop_listeners/0, make_application/0]).
:- use_module(kb_server,[]).
:- use_module(kb_urls,[app_base/1]).
:- use_module(kb_reload,[]).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch),[http_dispatch/1]).
:- use_module(library(error)).
:- use_module(library(lists)).

make_application :-
    kb_activity:with_exclusive_reload(kb_reload:reload_changed_files(Report)),
    format(user_error,'~w~n',[Report.message]),
    forall(member(Warning,Report.warnings),
      format(user_error,'~w: ~w~n',[Warning.source,Warning.message])),
    flush_output(user_error).

bind_loopback_listener(Port) :-
    must_be(integer,Port),
    (between(1,65535,Port)->true;domain_error(http_port,Port)),
    with_mutex(openworld_listener_control,
      (kb_server:server_port(Port)->throw(error(permission_error(bind,owned_http_port,Port),_));
       kb_server:start_server(Port))),
    app_base(Base),format(user_error,'Listening on http://localhost:~d~w~n',[Port,Base]).

restart_listeners :-
    with_mutex(openworld_listener_control,restart_owned).
restart_owned :-
    owned_ports(Ports),
    (Ports==[]->throw(error(existence_error(http_listener,owned),_));true),
    maplist(listener_profile,Ports,Profiles),
    format(user_error,'Restarting HTTP listeners; waiting for active HTTP work to finish.~n',[]),
    maplist(restart_listener,Profiles,Results),
    report_failures(restart,Results),
    format(user_error,'HTTP listeners restarted: ~w. Loaded KB is unchanged.~n',[Ports]).

owned_ports(Ports) :-
    findall(Port,kb_server:server_port(Port),Found),sort(Found,Ports).
listener_profile(Port,listener(Port,Module:Goal,Workers)) :-
    (http_current_server(Module:Goal,Port),http_workers(Port,Workers)->true;
      throw(error(existence_error(http_listener,Port),_))).

restart_listener(listener(Port,Goal,Workers),Result) :-
    catch((stop_owned_port(Port),
           http_server(Goal,[port('127.0.0.1':Port),workers(Workers)]),
           assertz(kb_server:server_port(Port)),Result=ok(Port)),
      Error,(reconcile_port(Port),Result=failed(Port,Error))).

stop_listeners :-
    with_mutex(openworld_listener_control,
      (owned_ports(Ports),maplist(stop_listener,Ports,Results),report_failures(stop,Results))).
stop_listener(Port,Result) :-
    catch((stop_owned_port(Port),Result=ok(Port)),
      Error,(reconcile_port(Port),Result=failed(Port,Error))).
stop_owned_port(Port) :-
    (listening(Port)->http_stop_server('127.0.0.1':Port,[]);true),
    retractall(kb_server:server_port(Port)).
reconcile_port(Port) :-
    (listening(Port)->true;retractall(kb_server:server_port(Port))).
listening(Port) :- http_current_server(_Module:_Goal,Port).
report_failures(Operation,Results) :-
    findall(failure(Port,Error),member(failed(Port,Error),Results),Failures),
    (Failures==[]->true;throw(error(http_listener_operation_failed(Operation,Failures),_))).
