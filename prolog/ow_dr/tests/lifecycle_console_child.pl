:- use_module('../kb_lifecycle').
:- use_module('../kb_interactive_control').
:- use_module(library(time)).
:- initialization(main,main).
:- dynamic initial_console/2.

main(Args) :-
    catch(check_console(Args),Error,
      (print_message(error,Error),halt(1))).

check_console(Args) :-
    (Args=[Mode|Rest] -> true;Mode=normal,Rest=[]),
    kb_lifecycle:ensure_windows_adapter,
    (Mode==closed -> close(user_input);true),
    kb_lifecycle:windows_console_mode(Before),
    kb_interactive_control:native_snapshot(NativeModes),
    on_signal(int,Signal,Signal),
    assertz(initial_console(Before,Signal)),
    current_prolog_flag(toplevel_goal,Toplevel),
    stream_timeout(Timeout),
    current_prolog_flag(tty_control,Tty),
    statistics(cputime,CPU0),get_time(Start),
    setup_call_cleanup(
      start_timer(Mode,Rest,Timer),
      invoke(Mode),
      finish_timer(Timer)),
    get_time(End),statistics(cputime,CPU1),
    kb_lifecycle:windows_console_mode(After),
    kb_interactive_control:native_snapshot(RestoredNativeModes),
    on_signal(int,RestoredSignal,RestoredSignal),
    stream_timeout(RestoredTimeout),
    current_prolog_flag(tty_control,RestoredTty),
    current_prolog_flag(toplevel_goal,RestoredToplevel),
    (Before==After,Signal==RestoredSignal,Timeout==RestoredTimeout,Tty==RestoredTty,
     Toplevel==RestoredToplevel,NativeModes==RestoredNativeModes,
     \+kb_lifecycle:console_owner(_) -> true;
     throw(error(console_restore_failed(Before,After,Signal,RestoredSignal,
                                        Timeout,RestoredTimeout,Tty,RestoredTty,
                                        Toplevel,RestoredToplevel),_))),
    Elapsed is End-Start,CPU is CPU1-CPU0,
    format('RESTORED mode=~w signal=ok stream=ok native_modes=ok~nWALL=~6f CPU=~6f~nLIFECYCLE_DONE~n',
           [After,Elapsed,CPU]),flush_output.

stream_timeout(Timeout) :-
    (catch(stream_property(user_input,timeout(Value)),_,fail) -> Timeout=Value;
     Timeout=closed).
start_timer(Mode,Rest,Timer) :-
    (memberchk(Mode,[auto,closed,interactive_stop]) ->
      (Rest=[Value] -> atom_number(Value,Seconds); Seconds=0.3),
      thread_create((sleep(Seconds),thread_send_message(main,stop)),Timer,[])
    ;Timer=none).
finish_timer(none) :- !.
finish_timer(Timer) :- thread_join(Timer,true).

invoke(fault) :- !,
    catch(wait_for_stop([output(nonexistent_console_output)]),Error,true),
    (nonvar(Error) -> true;throw(missing_expected_error)).
invoke(timeout) :- !,
    catch(call_with_time_limit(0.25,wait_for_stop([timeout(0.05)])),
          Error,true),
    (Error==time_limit_exceeded -> true;throw(unexpected_timeout_result(Error))).
invoke(legacy) :- !,
    setup_call_cleanup(kb_lifecycle:claim_console(main),
      setup_call_cleanup(on_signal(int,Previous,kb_lifecycle:note_interrupt),
        kb_lifecycle:with_console(user_error,0.05,
          callbacks(some(user:restart(reload)),some(user:bind)),main),
        kb_lifecycle:restore_signal(Previous)),
      kb_lifecycle:release_console).
invoke(Mode) :-
    wait_for_stop([timeout(0.05),make(make(Mode)),restart(restart(Mode)),bind(bind),
                   prolog(native_prolog(Mode)),shell(native_shell(Mode))]).
restart(failing) :- !,throw(error(simulated_listener_failure,_)).
restart(reload) :- !,format('CALLBACK_RESTART~n',[]),flush_output,reload_lifecycle.
restart(_) :- format('CALLBACK_RESTART~n',[]),flush_output.
bind(13) :- !,fail.
bind(Port) :- format('CALLBACK_BIND=~d~n',[Port]),flush_output.
make(failing) :- !,throw(error(simulated_make_failure,_)).
make(reload) :- !,format('CALLBACK_MAKE~n',[]),flush_output,reload_lifecycle.
make(_) :- format('CALLBACK_MAKE~n',[]),flush_output.
reload_lifecycle :-
    source_file(kb_lifecycle:wait_for_stop,File),
    load_files(File,[if(true),silent(true)]),
    format('CALLBACK_RELOADED~n',[]),flush_output.

handoff_probe(Label) :-
    kb_lifecycle:windows_console_mode(Mode),
    on_signal(int,Signal,Signal),
    (initial_console(Mode,Signal) -> true;
     throw(error(handoff_not_restored(Label,Mode,Signal),_))),
    \+kb_lifecycle:handoff_allowed,
    current_prolog_flag(pid,Pid),
    format('HANDOFF_~w MODE=~w PID=~d~n',[Label,Mode,Pid]),flush_output.
native_prolog(handoff_failure) :- !,
    handoff_probe(prolog_failure),change_console_state,
    throw(error(handoff_test_failure,_)).
native_prolog(_) :-
    handoff_probe(prolog_begin),
    kb_interactive_control:prolog_console,
    format('HANDOFF_prolog_return~n',[]),flush_output,
    (current_predicate(user:lifecycle_live_probe/1),user:lifecycle_live_probe(shared) ->
      format('LIVE_KB_STATE_PRESERVED~n',[]),flush_output;true).
native_shell(handoff_failure) :- !,handoff_probe(shell_failure),change_console_state,fail.
native_shell(_) :-
    handoff_probe(shell_begin),
    kb_interactive_control:os_shell,
    format('HANDOFF_shell_return~n',[]),flush_output.
change_console_state :-
    kb_interactive_control:interactive_console_modes(console_modes(In,Out,Err)),
    ChangedIn is In xor 16,ChangedOut is Out xor 4,ChangedErr is Err xor 4,
    kb_interactive_control:interactive_restore_console_modes(console_modes(ChangedIn,ChangedOut,ChangedErr)),
    on_signal(int,_,ignore),set_prolog_flag(tty_control,false),
    set_stream(user_input,timeout(0.37)).
