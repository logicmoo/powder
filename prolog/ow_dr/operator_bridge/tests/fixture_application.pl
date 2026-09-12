:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_json)).
:- use_module(library(readutil)).
:- initialization(main,main).

reply(Request) :-
    memberchk(path('/swish/openworld_dr/api/status'),Request),
    reply_json_dict(_{generation:1,counts:_{assertions:0}}).
main :-
    http_server(reply,[port('127.0.0.1':Port),workers(1)]),
    current_prolog_flag(pid,Pid),
    json_write_dict(current_output,_{port:Port,pid:Pid}),nl,flush_output,
    read_line_to_string(user_input,_),
    http_stop_server(Port,[]).
