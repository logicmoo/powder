:- module(static_http_fixture, [main/0]).
:- use_module('../kb_server', []).
:- use_module('../kb_activity', []).
:- use_module('../kb_store', []).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(prolog_wrap)).
:- use_module(library(socket)).
:- dynamic sample/1.
:- http_handler(root('__static_fixture_metrics'), metrics, []).
:- initialization(main, main).

main :-
    current_prolog_flag(argv,[Mode]),
    wrap_predicate(kb_server:static(Request),static_latency,Wrapped,
      static_http_fixture:measured(Mode,Request,Wrapped)),
    tcp_socket(Socket),tcp_bind(Socket,Port),tcp_close_socket(Socket),
    kb_activity:begin_admission_lease(Lease),
    setup_call_cleanup(kb_server:start_server(Port),
      (format('STATIC_TEST_PORT=~d~n',[Port]),flush_output,
       read_line_to_string(user_input,_)),
      (kb_server:stop_server,kb_activity:end_admission_lease(Lease))).

:- meta_predicate measured(+, +, 0).
measured(Mode,Request,Goal) :-
    get_time(Start),statistics(cputime,CPU0),
    catch(Goal,Error,true),
    get_time(End),statistics(cputime,CPU1),
    memberchk(path(Path),Request),
    Wall is (End-Start)*1000,CPU is (CPU1-CPU0)*1000,
    assertz(sample(_{path:Path,handlerMs:Wall,cpuMs:CPU})),
    (var(Error)->true;reply_error(Mode,Error)).

reply_error(keep_alive,http_reply(Reply,Headers)) :- !,
    exclude(connection_header,Headers,Rest),
    throw(http_reply(Reply,[connection('Keep-Alive')|Rest])).
reply_error(_,Error) :- throw(Error).
connection_header(connection(_)).

metrics(_) :-
    findall(S,sample(S),Samples),kb_activity:activity_status(Activity),
    kb_store:status(Status),
    reply_json_dict(_{samples:Samples,activity:Activity,native:Status}).
