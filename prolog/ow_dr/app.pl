:- use_module(kb_compile).
:- use_module(kb_reader).
:- use_module(kb_cache).
:- use_module(kb_index).
:- use_module(kb_mappings).
:- use_module(kb_store).
:- use_module(kb_server).
:- use_module(kb_paths).
:- use_module(kb_messages).
:- initialization(kb_reload:remember_loaded_code).
:- initialization(main, main).

main(Args) :-
    catch(run(Args),Error,(print_message(error,Error),halt(1))).
run(Args) :-
    arguments(Args,3050,Port,[],Selected),
    (Selected=[]->default_source(Source),Sources=[Source];reverse(Selected,Sources)),
    load_sources(Sources,any,Status),
    start_server(Port),
    format('powder - Paraconsistent Open World Defeasible Epistemic Reasoner~nReady: http://localhost:~d/~n',[Port]),
    format('Generation ~d; ~d assertions.~n',[Status.generation,Status.counts.assertions]),
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
