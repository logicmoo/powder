:- ensure_loaded(test_kee_ledger).
:- use_module(library(http/json)).
:- use_module(library(readutil)).
:- initialization(main,main).

main :-
    current_prolog_flag(argv,[Mode,Job]),worker(Mode,Job),halt.
worker(hold,_) :-
    kb_kee_ledger:ledger_path(Path),atom_concat(Path,'.lock',LockPath),
    kb_cache:try_lock(LockPath,Lock),
    setup_call_cleanup(true,
      (writeln(locked),flush_output,read_line_to_string(user_input,_)),
      kb_cache:release_lock(Lock)).
worker(commit,Job) :-
    setup_call_cleanup(open(Job,read,S,[encoding(utf8)]),read_term(S,job(CallId,Input),[]),close(S)),
    plunit_kee:host(H),
    setup_call_cleanup(kb_kee_auth:open_context(H,T),
      catch(plunit_kee_ledger:command(T,todo_create,CallId,Input,Reply),
        error(kee(Code,_),_),Reply=json{committed:false,error:Code}),
      kb_kee_auth:close_context(T)),
    json_write_dict(current_output,Reply,[width(0)]),nl.
worker(invoke,Job) :-
    setup_call_cleanup(open(Job,read,S,[encoding(utf8)]),read_term(S,invoke(Host,Request),[]),close(S)),
    setup_call_cleanup(kb_kee:open_context(Host,T),
      kb_kee:invoke(T,Request,Reply),kb_kee:close_context(T)),
    json_write_dict(current_output,Reply,[width(0)]),nl.
