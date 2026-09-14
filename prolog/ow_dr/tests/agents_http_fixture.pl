:- use_module('../kb_server',[]).
:- use_module(library(socket)).
:- initialization(main,main).

main :-
    tcp_socket(Socket),tcp_bind(Socket,Port),tcp_close_socket(Socket),
    setup_call_cleanup(kb_server:start_server(Port),
      (format('AGENTS_TEST_PORT=~d~n',[Port]),flush_output,
       read_line_to_string(user_input,_)),
      kb_server:stop_server).
