:- use_module(kb_compile).
:- use_module(kb_reader).
:- use_module(kb_cache).
:- use_module(kb_index).
:- use_module(kb_mappings).
:- use_module(kb_store).
:- use_module(kb_server).
:- use_module(kb_paths).
:- use_module(kb_messages).
:- use_module(kb_urls).
:- initialization(kb_reload:remember_loaded_code).
:- initialization(main, main).

main(Args) :-
    catch(run(Args),Error,(print_message(error,Error),halt(1))).
run(Args) :-
    arguments(Args,3050,Port,[],Selected),
    reverse(Selected,Explicit),
    kb_server:effective_server_settings(Settings),
    start_server(Port,Settings),
    app_base(Base),
    format('powder - Paraconsistent Open World Defeasible Epistemic Reasoner~nServer listening: http://localhost:~d~w~n',[Port,Base]),
    queue_startup(Explicit,Settings,Task),
    (Task.accepted==false->
       (kb_server:startup_config_error(_)->format('Startup settings failed; the server is available to correct them in Settings.~n',[])
       ;format('No startup KB load configured.~n',[]))
    ;format('Startup load queued as ~w. Inspect Settings Tasks for completion or failures.~n',[Task.jobId])),
    thread_get_message(stop),stop_server.
arguments([],Port,Port,Sources,Sources).
arguments(['--'|Rest],P,Port,S,Files) :- !,arguments(Rest,P,Port,S,Files).
arguments([Arg|Rest],P,Port,S,Files) :-
    (atom_concat('--port=',Value,Arg)->atom_number(Value,Next),Next>0,Next=<65535,S1=S
    ;atom_concat('--kb-source=',Source,Arg)->Next=P,S1=[Source|S]
    ;atom_concat('--kb-dir=',Source,Arg)->Next=P,S1=[Source|S]
    ;sub_atom(Arg,0,2,_,'--')->throw(error(domain_error(option,Arg),_))
    ;Next=P,S1=[Arg|S]),
    arguments(Rest,Next,Port,S1,Files).
