:- use_module(kb_compile).
:- use_module(kb_reader).
:- use_module(kb_cache).
:- use_module(kb_index).
:- use_module(kb_mappings).
:- use_module(kb_store).
:- use_module(kb_server).
:- use_module(kb_paths).
:- use_module(kb_urls).
:- use_module(kb_config,[server_settings/1,startup_selection/3]).
:- use_module(kb_debug_admin,[debug_cli_options/3,with_debug_service/2]).
:- use_module(kb_lifecycle).
:- use_module(kb_listener_control).
:- use_module(kb_interactive_control).
:- use_module(kb_jobs,[]).
:- use_module(kb_messages).
:- initialization(kb_reload:remember_loaded_code).
:- initialization(main, main).

main(Args) :-
    catch(run(Args),Error,(print_message(error,Error),halt(1))).
run(Args) :-
    debug_cli_options(Args,AppArgs,DebugOptions),
    arguments(AppArgs,3050,Port,[],Selected),
    server_settings(Settings),
    (Selected=[]->startup_selection([],Settings,Sources);
     reverse(Selected,Sources)),
    setup_call_cleanup(kb_jobs:start_pools(Settings),
      serve_sources(Sources,Port,DebugOptions),kb_jobs:stop_pools).
serve_sources(Sources,Port) :-
    serve_sources(Sources,Port,[enabled(false)]).
serve_sources(Sources,Port,DebugOptions) :-
    load_sources(Sources,any,Status),
    kb_catalog:remember_startup_sources,
    setup_call_cleanup(start_server(Port),
      with_debug_service(DebugOptions,(app_base(Base),
       format('powder - Paraconsistent Open World Defeasible Epistemic Reasoner~nReady: http://localhost:~d~w~n',[Port,Base]),
       format('Generation ~d; ~d assertions.~n',[Status.generation,Status.counts.assertions]),
       wait_for_stop([make(kb_listener_control:make_application),
                      restart(kb_listener_control:restart_listeners),
                      bind(kb_listener_control:bind_loopback_listener),
                      prolog(kb_interactive_control:prolog_console),
                      shell(kb_interactive_control:os_shell)]))),
      stop_listeners).
arguments([],Port,Port,Sources,Sources).
arguments(['--'|Rest],P,Port,S,Files) :- !,arguments(Rest,P,Port,S,Files).
arguments([Arg|Rest],P,Port,S,Files) :-
    (atom_concat('--port=',Value,Arg)->atom_number(Value,Next),Next>0,Next=<65535,S1=S
    ;atom_concat('--kb-source=',Source,Arg)->Next=P,S1=[Source|S]
    ;atom_concat('--kb-dir=',Source,Arg)->Next=P,S1=[Source|S]
    ;sub_atom(Arg,0,2,_,'--')->throw(error(domain_error(option,Arg),_))
    ;Next=P,S1=[Arg|S]),
    arguments(Rest,Next,Port,S1,Files).
