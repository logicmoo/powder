:- module(kb_debug_admin,
          [debug_cli_options/3, with_debug_service/2, stop_host_debug/0,
           debug_admin_status/1]).
:- use_module(kb_debug_telnet).
:- use_module(kb_urls,[]).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(error)).
:- use_module(library(time),[call_with_time_limit/2]).
:- meta_predicate with_debug_service(+,0).
:- dynamic host_shutdown/0, halt_cleanup_registered/0.
:- volatile host_shutdown/0, halt_cleanup_registered/0.

:- http_handler(openworld_dr(api/debug/status),debug_endpoint(status),[method(get),id(powder_debug_status)]).
:- http_handler(openworld_dr(api/debug/start),debug_endpoint(start),[method(post),id(powder_debug_start)]).
:- http_handler(openworld_dr(api/debug/stop),debug_endpoint(stop),[method(post),id(powder_debug_stop)]).
:- initialization(register_halt_cleanup).

% Existing live app frames may predate the explicit serving-scope wrapper.
% A halt hook covers their normal process exit without touching their scanner.
register_halt_cleanup :-
    with_mutex(powder_debug_admin,
      (halt_cleanup_registered->true;
       at_halt(kb_debug_admin:stop_host_debug),assertz(halt_cleanup_registered))).

with_debug_service(Options,Goal) :-
    setup_call_cleanup(
      with_mutex(powder_debug_admin,
        (retractall(host_shutdown),start_debug_telnet(Options))),
      Goal,stop_host_debug).
stop_host_debug :-
    with_mutex(powder_debug_admin,
      ((host_shutdown->true;assertz(host_shutdown)),stop_debug_telnet)).

debug_cli_options(Args,Remaining,Options) :-
    must_be(list,Args),
    debug_arguments(Args,false,3051,Remaining,Enabled,Port),
    Options=[enabled(Enabled),port(Port)].
debug_arguments([],Enabled,Port,[],Enabled,Port).
debug_arguments([Arg|Args],E0,P0,Remaining,E,P) :-
    (Arg=='--debug-off' ->
      debug_arguments(Args,false,P0,Remaining,E,P)
    ;atom(Arg),atom_concat('--debug-port=',Text,Arg) ->
      cli_port(Text,Port),debug_arguments(Args,true,Port,Remaining,E,P)
    ;Remaining=[Arg|Rest],debug_arguments(Args,E0,P0,Rest,E,P)).
cli_port(Text,Port) :-
    (atom_codes(Text,Codes),Codes\=[],maplist(decimal_code,Codes),
     catch(atom_number(Text,Port),_,fail),integer(Port),between(1,65535,Port) -> true;
     domain_error(debug_port,Text)).
decimal_code(Code) :- between(0'0,0'9,Code).

debug_endpoint(Action,Request) :-
    catch((authorize(Request),no_query_options(Request),
           admin_action(Action,Request,Reply),
           respond(200,Reply)),
          Error,admin_error(Error)).
authorize(Request) :-
    (memberchk(peer(ip(127,0,0,1)),Request),
     findall(Origin,member(origin(Origin),Request),[Origin]),
     atom(Origin),current_predicate(kb_server:server_port/1),
     once((kb_server:server_port(Port),member(Host,[localhost,'127.0.0.1']),
           format(atom(Expected),'http://~w:~d',[Host,Port]),Origin==Expected))
    -> true;throw(debug_admin(forbidden))).
no_query_options(Request) :-
    (memberchk(search(Options),Request),Options\=[] ->
       throw(debug_admin(invalid_input));true).

admin_action(status,_,Reply) :- debug_admin_status(Reply).
admin_action(start,Request,Reply) :-
    small_json_object(Request,Body),
    dict_pairs(Body,_,Pairs),
    (Pairs==[]->Port=3051;
     Pairs=[port-Port],integer(Port),between(1,65535,Port)->true;
     throw(debug_admin(invalid_input))),
    with_mutex(powder_debug_admin,
      (require_active_host,start_debug_telnet([port(Port)]),debug_admin_status(Reply))).
admin_action(stop,Request,Reply) :-
    small_json_object(Request,Body),
    (dict_pairs(Body,_,[])->true;throw(debug_admin(invalid_input))),
    with_mutex(powder_debug_admin,
      (stop_debug_telnet,debug_admin_status(Reply))).
require_active_host :-
    (host_shutdown->throw(debug_admin(shutting_down));true).

small_json_object(Request,Body) :-
    (memberchk(transfer_encoding(_),Request)->throw(debug_admin(invalid_input));true),
    (memberchk(content_length(Size),Request),integer(Size),between(1,128,Size)->true;
     throw(debug_admin(invalid_input))),
    catch(call_with_time_limit(3,http_read_json_dict(Request,Body)),
          _,throw(debug_admin(invalid_input))),
    (is_dict(Body)->true;throw(debug_admin(invalid_input))).

% Whitelist rather than forwarding the implementation's status dictionary.
debug_admin_status(Reply) :-
    debug_telnet_status(Status),current_prolog_flag(pid,PID),
    (get_dict(port,Status,Port)->true;Port=null),
    (get_dict(maxSessions,Status,Max)->true;Max=null),
    Reply=_{enabled:Status.enabled,state:Status.state,host:"127.0.0.1",
            port:Port,sessions:Status.sessions,maxSessions:Max,pid:PID}.
respond(Status,Reply) :-
    format('Cache-Control: no-store~n'),
    reply_json_dict(Reply,[status(Status)]).

% Never reflect exception terms: request bodies or filesystem errors could
% contain credentials, digests, private paths, or arbitrary user input.
admin_error(Error) :-
    error_kind(Error,Status,Code,Message),
    respond(Status,_{error:_{code:Code,message:Message}}).
error_kind(debug_admin(forbidden),403,forbidden,
           "An exact owned localhost Origin and loopback peer are required.") :- !.
error_kind(debug_admin(invalid_input),400,invalid_input,
           "Use a small JSON object: start accepts only an integer port; stop accepts {}.") :- !.
error_kind(debug_admin(shutting_down),503,shutting_down,
           "The app is shutting down; debug startup is disabled.") :- !.
error_kind(error(socket_error(_,_),_),409,port_unavailable,
           "The requested debug port is unavailable; no listener was displaced.") :- !.
error_kind(error(permission_error(reconfigure,_,_),_),409,already_running,
           "Debug is already running with different options; stop it first.") :- !.
error_kind(error(permission_error(start,debug_service,_),_),409,not_stopped,
           "Previous debug resources must be stopped before starting.") :- !.
error_kind(_,503,debug_unavailable,
           "The debug operation failed; no private diagnostic data is exposed.").
