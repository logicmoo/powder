:- ensure_loaded('../app.pl').
:- use_module('../kb_saved_state',[]).
:- use_module(library(http/json)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(readutil)).
:- dynamic debug_http_fixture/1.
:- initialization(debug_http_main,main).

debug_http_main :- current_prolog_flag(argv,Args),debug_http_main(Args).
debug_http_main([PortText,Mode|Args]) :-
    atom_number(PortText,Port),debug_cli_options(Args,[],Options),
    set_stream(user_output,encoding(utf8)),
    assertz(debug_http_fixture(existing_app)),
    setup_call_cleanup(kb_server:start_server(Port),
      (Mode==legacy -> debug_http_ready(Port),debug_http_commands
      ;with_debug_service(Options,(debug_http_ready(Port),debug_http_commands))),
      kb_server:stop_server).
debug_http_ready(Port) :-
    current_prolog_flag(pid,PID),kb_urls:api_path(debug,Path),
    debug_http_reply(_{pid:PID,port:Port,path:Path}).
debug_http_commands :-
    read_line_to_string(user_input,Line),
    (Line==end_of_file -> true;
     atom_json_dict(Line,R,[]),
     catch(debug_http_command(R,Reply),Error,debug_http_error(Error,Reply)),
     debug_http_reply(Reply),
     (R.action=="quit"->true;debug_http_commands)).
debug_http_error(error(permission_error(save,debug_service,active),_),_{error:debug_active}) :- !.
debug_http_error(_,_{error:true}).
debug_http_command(R,Reply) :-
    (R.action=="credential" ->
      kb_debug_telnet:debug_credentials_file(File),Reply=_{file:File}
    ;R.action=="cli" ->
      maplist(atom_string,Atoms,R.args),
      debug_cli_options(Atoms,Rest,Options),
      arguments(Rest,3050,Port,[],Files),
      memberchk(enabled(E),Options),memberchk(port(D),Options),
      Reply=_{appPort:Port,files:Files,enabled:E,debugPort:D}
    ;R.action=="legacy_arguments" ->
      maplist(atom_string,Atoms,R.args),arguments(Atoms,3050,Port,[],Files),
      Reply=_{port:Port,files:Files}
    ;R.action=="reload" ->
      source_file(kb_server:start_server(_),Server),
      source_file(kb_debug_admin:debug_admin_status(_),Admin),
      load_files(Server,[if(true),silent(true),imports([])]),
      load_files(Admin,[if(true),silent(true),imports([])]),
      findall(Path,http_current_handler(Path,kb_debug_admin:_),Paths),
      length(Paths,Count),Reply=_{handlers:Count}
    ;R.action=="stop_http" -> kb_server:stop_server,Reply=_{stopped:true}
    ;R.action=="stop_debug" -> kb_debug_admin:stop_host_debug,Reply=_{stopped:true}
    ;R.action=="builder_guard" -> kb_saved_state:clean_builder_resources,Reply=_{safe:true}
    ;R.action=="quit" -> Reply=_{quitting:true}
    ;throw(unknown_fixture_command)).
debug_http_reply(Reply) :- json_write_dict(current_output,Reply,[width(0)]),nl,flush_output.
