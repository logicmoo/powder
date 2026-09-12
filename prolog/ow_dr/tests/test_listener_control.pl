:- begin_tests(listener_control).
:- use_module('../kb_listener_control').
:- use_module('../kb_server',[]).
:- use_module('../kb_store',[]).
:- use_module('../kb_urls').
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(socket)).
:- use_module(library(filesex)).
:- use_module(library(prolog_wrap)).

unused_port(Port) :-
    tcp_socket(Socket),tcp_bind(Socket,'127.0.0.1':Port),tcp_close_socket(Socket).
fixture(D,F,P1,P2,Generation,Ref) :-
    tmp_file(listener_controls,D),make_directory(D),directory_file_path(D,'control.krf',F),
    setup_call_cleanup(open(F,write,S),format(S,'(in-microtheory ControlMt)~n(p a)~n',[]),close(S)),
    kb_compile:compile_source(F,[state_dir(D),progress(none)],_),
    kb_store:load_sources([F],any,Status),Generation=Status.generation,
    kb_store:active_modules([Module]),kb_runtime:module_assertion(Module,_,_,Ref),
    unused_port(P1),kb_server:start_server(P1),unused_port(P2).
cleanup(D,F) :-
    stop_listeners,kb_store:generation(G),kb_store:unload_source(F,G,_),
    delete_directory_and_contents(D).
status_at(Port,Status) :-
    api_path(status,Path),format(atom(URL),'http://127.0.0.1:~d~w',[Port,Path]),
    http_get(URL,Status,[json_object(dict)]).

test(add_and_restart_multiple_loopback_listeners_preserve_kb,
     [setup(fixture(D,F,P1,P2,G,Ref)),cleanup(cleanup(D,F))]) :-
    bind_loopback_listener(P2),
    status_at(P1,Before),status_at(P2,Before2),
    assertion(Before.generation=:=G),assertion(Before2.generation=:=G),
    http_workers(P1,3),http_workers(P2,2),
    restart_listeners,
    http_workers(P1,3),http_workers(P2,2),
    status_at(P1,After),status_at(P2,After2),
    assertion(After.generation=:=G),assertion(After2.counts.assertions=:=1),
    assertion(\+clause_property(Ref,erased)),
    format(atom(Origin),'http://localhost:~d',[P2]),kb_server:valid_origin([origin(Origin)]).

test(duplicate_and_occupied_ports_leave_existing_listener_working,
     [setup(fixture(D,F,P1,P2,_,_)),cleanup(cleanup(D,F))]) :-
    catch(bind_loopback_listener(P1),Duplicate,true),
    assertion(Duplicate=error(permission_error(bind,owned_http_port,P1),_)),
    setup_call_cleanup(
      (tcp_socket(Socket),tcp_bind(Socket,'127.0.0.1':P2),tcp_listen(Socket,1)),
      (catch(bind_loopback_listener(P2),Occupied,true),assertion(nonvar(Occupied)),
       assertion(\+kb_server:server_port(P2)),status_at(P1,S),assertion(S.counts.assertions=:=1)),
      tcp_close_socket(Socket)).

test(restart_failure_is_visible_and_does_not_stop_other_listeners,
     [setup(fixture(D,F,P1,P2,G,_)),cleanup(cleanup(D,F))]) :-
    bind_loopback_listener(P2),
    setup_call_cleanup(
      wrap_predicate(thread_httpd:http_server(_Goal,Options),restart_failure,Wrapped,
        (memberchk(port('127.0.0.1':P1),Options)->throw(test_restart_failure);call(Wrapped))),
      (catch(restart_listeners,Error,true),
       assertion(Error=error(http_listener_operation_failed(restart,[_]),_)),
       assertion(\+kb_server:server_port(P1)),
       status_at(P2,S),assertion(S.generation=:=G)),
      unwrap_predicate(thread_httpd:http_server(_,_),restart_failure)),
    bind_loopback_listener(P1),status_at(P1,_).

test(invalid_ports_are_rejected) :-
    forall(member(Port,[0,65536,-1]),
      (catch(bind_loopback_listener(Port),Error,true),assertion(Error=error(domain_error(http_port,Port),_)))).

test(make_only_reloads_application_code) :-
    flag(listener_make_calls,_,0),kb_store:generation(Before),
    setup_call_cleanup(
      (wrap_predicate(kb_reload:reload_changed_files(Report),listener_make,_,
         (flag(listener_make_calls,N,N+1),Report=_{message:"No changed application files.",warnings:[]})),
       wrap_predicate(kb_compile:compile_sources(_,_,_),listener_make,_,
         throw(error(unexpected_corpus_compilation,_)))),
      (make_application,flag(listener_make_calls,Calls,Calls),assertion(Calls=:=1),
       kb_store:generation(Before)),
      (unwrap_predicate(kb_reload:reload_changed_files(_),listener_make),
       unwrap_predicate(kb_compile:compile_sources(_,_,_),listener_make))).

:- end_tests(listener_control).
