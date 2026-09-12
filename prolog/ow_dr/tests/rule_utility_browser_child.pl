:- ensure_loaded(test_rule_utility_http).
:- use_module(library(http/json)).
:- use_module(library(readutil)).
:- initialization(main,main).

main :-
    current_prolog_flag(argv,[Ready]),
    setup_call_cleanup(plunit_rule_utility_http:http_fixture(State),
      (kb_urls:app_base(Base),
       setup_call_cleanup(open(Ready,write,S,[encoding(utf8)]),
         json_write_dict(S,ready{port:State.port,base:Base,directory:State.directory}),close(S)),
       read_line_to_string(user_input,_)),
      plunit_rule_utility_http:http_cleanup(State)).
