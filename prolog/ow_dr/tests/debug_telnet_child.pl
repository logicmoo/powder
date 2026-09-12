:- use_module('../kb_debug_telnet').
:- use_module('../kb_debug_admin',[]).
:- use_module(library(http/json)).
:- use_module(library(readutil)).
:- dynamic debug_fixture_marker/1.
:- dynamic fixture_admission/1.
:- initialization(main,main).

main([PortText]) :-
    atom_number(PortText,Port),set_stream(user_output,encoding(utf8)),
    set_prolog_flag(toplevel_goal,halt),
    assertz(debug_fixture_marker(same_app)),
    current_prolog_flag(pid,PID),
    setup_call_cleanup(true,
      (reply(_{pid:PID}),commands(Port)),
      (forall(retract(fixture_admission(Token)),kb_activity:end_admission_lease(Token)),
       catch(stop_debug_telnet,_,true))).
commands(Port) :-
    read_line_to_string(user_input,Line),
    (Line==end_of_file->true;
     atom_json_dict(Line,R,[]),
     catch(command(R,Port,Result),Error,
       (safe_error(Error,Code),Result=_{error:Code})),
     reply(Result),
     (R.action=="quit"->true;commands(Port))).
command(R,Port,Result) :-
    (R.action=="start" ->
      options(R,Options),start_debug_telnet([port(Port)|Options]),
      debug_telnet_status(S),debug_credentials_file(File),
      Result=_{status:S,credentialFile:File}
    ;R.action=="failed_credentials" ->
      getenv('SystemRoot',Windows),
      working_directory(Directory,Directory),
      directory_file_path(Directory,'.debug-missing-provider',Missing),
      setup_call_cleanup(setenv('SystemRoot',Missing),
        start_debug_telnet([port(Port)]),setenv('SystemRoot',Windows)),
      Result=_{unexpected:true}
    ;R.action=="stop" -> stop_debug_telnet,Result=_{stopped:true}
    ;R.action=="status" -> debug_telnet_status(Result)
    ;R.action=="snapshot" -> debug_snapshot_safe,Result=_{safe:true}
    ;R.action=="profile" -> debug_resume_profile(Result)
    ;R.action=="start_profile" ->
      kb_debug_admin:start_host_debug(R.profile),
      debug_telnet_status(S),
      (debug_credentials_file(File)->true;File=null),
      Result=_{status:S,credentialFile:File}
    ;R.action=="transfer_stop" ->
      kb_debug_admin:stop_debug_for_transfer,Result=_{stopped:true}
    ;R.action=="retire_debug" ->
      kb_debug_admin:stop_host_debug,Result=_{stopped:true}
    ;R.action=="shutdown_flag" ->
      (kb_debug_admin:host_shutdown->Flag=true;Flag=false),Result=_{shutdown:Flag}
    ;R.action=="gate_begin" ->
      kb_activity:begin_admission_lease(Token),assertz(fixture_admission(Token)),
      Result=_{leased:true}
    ;R.action=="gate_end" ->
      forall(retract(fixture_admission(Token)),kb_activity:end_admission_lease(Token)),
      Result=_{leased:false}
    ;R.action=="activity" -> kb_activity:activity_status(Result)
    ;R.action=="admission" -> debug_admission_status(Result)
    ;R.action=="quiescent" -> debug_require_admission_quiescence,Result=_{safe:true}
    ;R.action=="legacy_reader" ->
      with_mutex(powder_debug_clients,
        (retract(kb_debug_telnet:client(G,Id,T,Socket,authenticated_gated)),
         assertz(kb_debug_telnet:client(G,Id,T,Socket,authenticated)))),
      Result=_{legacy:true}
    ;R.action=="reload_transport" ->
      source_file(kb_debug_telnet:debug_telnet_status(_),File),
      load_files(File,[if(true),silent(true),imports([])]),Result=_{reloaded:true}
    ;R.action=="flags" ->
      current_prolog_flag(toplevel_goal,Goal),current_input(In),current_output(Out),
      (stream_property(In,alias(user_input))->MainIn=true;MainIn=false),
      (stream_property(Out,alias(user_output))->MainOut=true;MainOut=false),
      Result=_{goal:Goal,mainInput:MainIn,mainOutput:MainOut}
    ;R.action=="marker" ->
      (debug_fixture_marker(unauthenticated)->V=true;V=false),Result=_{mutated:V}
    ;R.action=="quit" -> Result=_{quit:true}
    ;throw(unknown_test_command)).
safe_error(error(Formal,_),Code) :- !,functor(Formal,Name,Arity),
    format(string(Code),'~w/~d',[Name,Arity]).
safe_error(_,other).
options(R,Options) :-
    (get_dict(options,R,Dict)->
      dict_pairs(Dict,_,Pairs),
      findall(Option,(member(Key-Value,Pairs),Option=..[Key,Value]),Options)
    ;Options=[]).
reply(Dict) :- json_write_dict(current_output,Dict,[width(0)]),nl,flush_output.
