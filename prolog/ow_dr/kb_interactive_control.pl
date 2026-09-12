:- module(kb_interactive_control,
          [prolog_console/0, os_shell/0, with_interactive_context/1]).

/** <module> Explicit same-console interactive callbacks

Pass prolog(kb_interactive_control:prolog_console) and
shell(kb_interactive_control:os_shell) to kb_lifecycle:wait_for_stop/1.
The lifecycle driver must relinquish raw mode and its signal handlers first.
These predicates do not launch another application instance or reload any KB.
The generic with_interactive_context/1 boundary restores standard streams,
console flags, SIGINT and (on Windows) exact native input/output modes after
ANY trusted handoff callback. Build the separate Windows mode adapter with
build_lifecycle_windows.ps1 -Interactive. It does not replace a loaded scanner
DLL, so the running application's existing native reader is untouched.

PROLOG calls SWI's standard prolog/0 in the SAME process/thread/database. At a query
prompt, enter end_of_file. to return. Keyboard EOF is platform-dependent.
Finish any alternative-solution prompt with Enter first: SWI may terminate on
EOF at its "more answers" prompt. halt/0 explicitly terminates the application
and is NOT the return command. Arbitrary Prolog here is deliberate user access.
The application's toplevel_goal is temporarily default, then restored:
initialization(main,main) otherwise commonly sets it to halt.

SHELL calls SWI's standard shell/0 in the same console. Type exit to return.
POSIX shells also normally accept EOF; Windows cmd uses exit. This module does
not supply a command string, create a replacement terminal, or manage a custom
shell process.

Both handoffs intrinsically block the application's scanner. Queued stop is
honoured AFTER the standard native prompt/shell returns.
*/

:- use_module(library(error)).
:- use_module(library(shlib)).
:- meta_predicate with_interactive_context(0).
:- thread_local interactive_context_active/0.

with_interactive_context(Goal) :-
    thread_self(Thread),
    (Thread==main -> true;permission_error(control,interactive_console,Thread)),
    (interactive_context_active ->
      permission_error(control,interactive_console,nested_handoff);true),
    (current_predicate(kb_lifecycle:handoff_allowed/0),kb_lifecycle:handoff_allowed ->
      permission_error(control,interactive_console,scanner_still_owns_input);true),
    setup_call_cleanup(asserta(interactive_context_active,Ref),
      setup_call_cleanup(snapshot_context(Context),
        (prepare_context(Context),once(Goal)),restore_context(Context)),
      erase(Ref)).

require_handoff :-
    (interactive_context_active -> true;
     permission_error(control,interactive_console,handoff_required)).

snapshot_context(context(Native,Signal,Flags,Streams,CurrentIn,CurrentOut)) :-
    native_snapshot(Native),
    on_signal(int,Signal,Signal),
    findall(Name-Value,
      (member(Name,[tty_control,toplevel_goal,toplevel_prompt]),
       current_prolog_flag(Name,Value)),Flags),
    findall(stream(Alias,Stream,Properties),
      (member(Alias,[user_input,user_output,user_error]),
       stream_property(Stream,alias(Alias)),
       findall(Property,
         (member(Name,[encoding,eof_action,timeout,newline,buffer,tty]),
          Property=..[Name,_],stream_property(Stream,Property)),Properties)),Streams),
    current_input(CurrentIn),current_output(CurrentOut).

prepare_context(context(console_modes(In,Out,Err),_,_,_,_,_)) :-
    integer(In),!,
    % Win32 PROCESSED_INPUT, LINE_INPUT and ECHO_INPUT.
    Cooked is In \/ 7,
    interactive_restore_console_modes(console_modes(Cooked,Out,Err)).
prepare_context(_).

restore_context(context(Native,Signal,Flags,Streams,CurrentIn,CurrentOut)) :-
    findall(set_prolog_flag(Name,Value),member(Name-Value,Flags),FlagGoals),
    findall(restore_stream(Stream,Property),
      (member(stream(_,Stream,Properties),Streams),member(Property,Properties)),StreamGoals),
    findall(set_stream(Stream,alias(Alias)),member(stream(Alias,Stream,_),Streams),AliasGoals),
    append([[native_restore(Native)],FlagGoals,StreamGoals,AliasGoals,
            [set_input(CurrentIn),set_output(CurrentOut),on_signal(int,_,Signal)]],Goals),
    restore_all(Goals,Errors),
    (Errors=[First|_] -> throw(First);true).

restore_all([],[]).
restore_all([Goal|Goals],Errors) :-
    catch((once(Goal) -> true;throw(error(console_restore_failed(Goal),_))),Error,true),
    (nonvar(Error) -> Errors=[Error|Rest];Errors=Rest),
    restore_all(Goals,Rest).
restore_stream(Stream,Property) :-
    (stream_property(Stream,Property) -> true;set_stream(Stream,Property)).

native_snapshot(Modes) :-
    (current_prolog_flag(windows,true) ->
      ensure_mode_adapter,interactive_console_modes(Modes)
    ;Modes=none).
native_restore(none) :- !.
native_restore(Modes) :- interactive_restore_console_modes(Modes).
ensure_mode_adapter :-
    (current_predicate(interactive_console_modes/1) -> true;
     source_file(kb_interactive_control:prolog_console,File),
     file_directory_name(File,Directory),
     directory_file_path(Directory,'kb_interactive_windows.dll',DLL),
     (exists_file(DLL) -> load_foreign_library(DLL);
      existence_error(windows_handoff_adapter,
                      'Run prolog\\ow_dr\\build_lifecycle_windows.ps1 -Interactive'))).

%prolog_console :- prolog,!.
prolog_console :-
    require_handoff,
    current_prolog_flag(toplevel_goal,Previous),
    setup_call_cleanup(
      set_prolog_flag(toplevel_goal,default),
      (format(user_error,'~nPROLOG: same live process. Type end_of_file. at the query prompt to return; not halt.~n',[]),
       flush_output(user_error),
       prolog),
      set_prolog_flag(toplevel_goal,Previous)).

%os_shell :- shell,!.
os_shell :-
    require_handoff,
    format(user_error,'~nSHELL: same console. Type exit to return.~n',[]),
    flush_output(user_error),
    shell.
