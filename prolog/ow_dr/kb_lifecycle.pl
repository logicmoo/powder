:- module(kb_lifecycle,
          [wait_for_stop/0, wait_for_stop/1, thread_snapshot/1, console_snapshot_safe/0]).

/** <module> Blocking, bounded application-console controls

Host integration (main thread, with no other reader of standard input):

    setup_call_cleanup(
        kb_server:start_server(Port),
        kb_lifecycle:wait_for_stop([
            make(kb_listener_control:make_application),
            prolog(kb_interactive_control:prolog_console),
            shell(kb_interactive_control:os_shell),
            restart(kb_server:restart_listeners),
            bind(kb_server:bind_loopback_listener)
        ]),
        kb_server:stop_server).

make/0, restart/0 and bind/1 are TRUSTED host callbacks, invoked once. They must
preserve the KB generation, listener settings and owned additional ports;
restart must not duplicate pools/managers. They must either succeed, fail or
throw, and leave a usable host on failure. This module never manipulates
listeners or KBs. Make must reload only changed application code safely,
without rerunning main or compiling the corpus. The host supplies this policy;
this module never calls Prolog make/0 itself.
Do not pass console-entered Prolog as a callback.

Options: make(Goal), restart(Goal), bind(Closure), prolog(Goal), shell(Goal),
timeout(Seconds) (default .25,
.01..1), output(Stream) (default user_error), stop_queue(Queue) (default
calling thread). Send the atom stop to that queue. Unrelated messages stay
queued. The helper succeeds only for graceful exit or a stop message; it
never calls halt/0. Callbacks should themselves be bounded.

The continuous scanner accepts (C) CONTINUE, E(X)IT, (M) MAKE,
(R) RESTART SERVER, (B) BIND LOOPBACK PORT, (T) LIST ACTIVE THREADS,
(P)ROLOG and (S)HELL. Lowercase input is also accepted.
These keys work immediately without ? or Enter. Every selected action is
acknowledged and flushed before it runs. Ctrl+C and ? print the same help,
then return to the scanner; there is no modal menu or choice prompt. They
cancel an unfinished port entry. Startup, timeouts and unknown idle keys are
silent. Continue emits only its acknowledgement, not a hint or another prompt.

Prolog-only hot reload preserves the controller predicate signatures. Older
live callbacks/2 and callbacks/3 terms and confirm(_) states are accepted; the
obsolete menu/confirmation states become idle scanning (Y/N have no meaning).
Missing Make/P/S callbacks report unavailable until the host re-enters
wait_for_stop/1 with the appropriate options. Reload does not replace an existing
invocation's callbacks. No native adapter rebuild is needed for menu changes.

P/S are explicitly requested input-ownership handoffs, not ordinary callbacks:
the complete raw-terminal and signal scopes unwind before the trusted goal
runs. The same main thread then reacquires them without a banner. No scanner
reader remains active during a handoff. kb_interactive_control supplies native
same-process Prolog and same-console shell implementations. While either owns
input, stop messages remain queued until it returns; no input stealing,
forced halt, process kill, or claimed bounded cancellation is used.

Windows: build the adjacent DLL once with build_lifecycle_windows.ps1.
SWI's wait_for_input/3 and stream timeouts support Windows SOCKETS, not
console handles. The narrow native adapter uses a blocking native timed
wait, disables cooked/echo/processed input, and handles physical Ctrl+C as
a key. It also intercepts native CTRL_C_EVENT without invoking the SWI
debugger. Both the exact original input mode and replaced handlers are
restored. No helper process/thread is created. A missing DLL is an explicit
setup error, not an unreliable polling fallback.

POSIX: with_tty_raw/1 restores terminal mode around wait_for_input/3 and
get_code/2. on_signal/3 only records an interrupt; it never runs a nested
prompt. Redirected/closed stdin is not consumed and EOF disables reading.
Headless execution waits for stop, never treats EOF/Ctrl+C as consent.

Focused checks from the repository root:

    swipl -q -g run_tests -t halt prolog\ow_dr\tests\test_lifecycle.pl
    python prolog\ow_dr\tests\windows_lifecycle_console.py -v

The Windows test harness uses an isolated ConPTY and a per-test Windows job
to clean up only its own children. It tests raw Ctrl+C AND a native
GenerateConsoleCtrlEvent event, plus exact mode/signal/stream restoration.
Physical keyboard use in the user's cmd.exe and POSIX terminals are not
claimed as manually verified. The DLL is a generated build product.

Saved-state builders must use an isolated, quiescent process and call
console_snapshot_safe/0 before saving. Never invoke wait_for_stop/1 in the
builder. On resume, restore KB data and start the host's listeners/pools, then
call wait_for_stop/1 once on main inside the host's setup_call_cleanup/3.
It acquires fresh terminal/signal ownership; there is no earlier console
initializer to replay. Ownership facts are volatile, and native handles are
private C state, not Prolog terms to persist.
*/

:- use_module(library(error)).
:- use_module(library(option)).
:- use_module(library(lists)).
:- use_module(library(shlib)).
:- use_module(kb_interactive_control,[with_interactive_context/1]).
:- meta_predicate wait_for_stop(:).
:- dynamic console_owner/1.
:- volatile console_owner/1.
:- thread_local interrupt_pending/0.
:- thread_local handoff_allowed/0.

wait_for_stop :- wait_for_stop([]).

console_snapshot_safe :-
    (console_owner(_);interrupt_pending;handoff_allowed;
     kb_interactive_control:interactive_context_active;
     current_signal(int,_,kb_lifecycle:note_interrupt)),!,
    permission_error(save,console_lifecycle,active).
console_snapshot_safe :-
    (current_predicate(kb_console_launch:launcher_snapshot_safe/0) ->
       kb_console_launch:launcher_snapshot_safe
    ;true).

wait_for_stop(Qualified) :-
    strip_module(Qualified, Caller, Options),
    must_be(list, Options),
    maplist(valid_option, Options),
    option(timeout(Time), Options, 0.25),
    must_be(number, Time),
    (Time>=0.01,Time=<1 -> Timeout is float(Time);
     domain_error(console_timeout, Time)),
    option(output(Output), Options, user_error),
    (stream_property(Output,output) -> true;permission_error(output,stream,Output)),
    thread_self(Self),
    (Self==main -> true; permission_error(control, main_console, Self)),
    option(stop_queue(StopQueue), Options, Self),
    callbacks(Options, Caller, Callbacks),
    setup_call_cleanup(
        claim_console(Self),
        scanner_cycles(Output, Timeout, Callbacks, StopQueue),
        release_console).

scanner_cycles(Output, Timeout, Callbacks, Queue) :-
    catch(
      setup_call_cleanup(asserta(handoff_allowed,Ref),
        setup_call_cleanup(
          on_signal(int,Previous,kb_lifecycle:note_interrupt),
          with_console(Output,Timeout,Callbacks,Queue),
          restore_signal(Previous)),
        erase(Ref)),
      '$kb_lifecycle_handoff'(Name,Goal),
      Transfer=handoff(Name,Goal)),
    (nonvar(Transfer) ->
      Transfer=handoff(Operation,Callback),
      operation(Operation,some(with_interactive_context(Callback)),Output),
      (stop_requested(Queue) -> true;scanner_cycles(Output,Timeout,Callbacks,Queue))
    ;true).

valid_option(Option) :-
    nonvar(Option),
    functor(Option, Name, 1),
    memberchk(Name, [make,restart,bind,prolog,shell,timeout,output,stop_queue]), !.
valid_option(Option) :- domain_error(console_option, Option).

callbacks(Options, Caller, callbacks(Restart, Bind, Make, Prolog, Shell)) :-
    callback_option(restart, Options, Caller, Restart),
    callback_option(bind, Options, Caller, Bind),
    callback_option(make, Options, Caller, Make),
    callback_option(prolog, Options, Caller, Prolog),
    callback_option(shell, Options, Caller, Shell).
callback_option(Name, Options, Caller, Callback) :-
    Option=..[Name,Goal],
    (memberchk(Option,Options) ->
      must_be(callable,Goal),strip_module(Caller:Goal,M,G),Callback=some(M:G)
    ; Callback=none).

claim_console(Self) :-
    with_mutex(powder_lifecycle,
      (console_owner(Owner) -> permission_error(acquire,console,Owner);
       assertz(console_owner(Self)))).
release_console :-
    retractall(interrupt_pending),
    retractall(handoff_allowed),
    with_mutex(powder_lifecycle,retractall(console_owner(_))).
note_interrupt(_) :-
    (interrupt_pending -> true; asserta(interrupt_pending)).
restore_signal(Previous) :-
    on_signal(int, _, Previous),
    retractall(interrupt_pending).

with_console(Output, Timeout, Callbacks, Queue) :-
    (current_prolog_flag(windows,true) ->
      ensure_windows_adapter,
      setup_call_cleanup(windows_console_open(Native),
        ((Native==headless -> Backend=windows_headless; Backend=Native),
         start_loop(Backend,Output,Timeout,Callbacks,Queue)),
        windows_console_close)
    ; catch(stream_property(user_input,tty(true)),_,fail) ->
      with_tty_raw(start_loop(posix,Output,Timeout,Callbacks,Queue))
    ; start_loop(headless,Output,Timeout,Callbacks,Queue)).

ensure_windows_adapter :-
    (current_predicate(windows_console_open/1) -> true;
     source_file(kb_lifecycle:wait_for_stop,File),
     file_directory_name(File,Directory),
     directory_file_path(Directory,'kb_lifecycle_windows.dll',DLL),
     (exists_file(DLL) -> load_foreign_library(DLL);
      existence_error(windows_console_adapter,
                      'Run prolog\\ow_dr\\build_lifecycle_windows.ps1'))).

start_loop(Backend, Output, Timeout, Callbacks, Queue) :-
    control_loop(Backend,Output,Timeout,Callbacks,Queue,idle).

control_loop(Backend, Output, Timeout, Callbacks, Queue, State) :-
    (stop_requested(Queue) -> true;
     next_event(Backend,Queue,Timeout,Event),
     (stop_requested(Queue) -> true;
      handle_event(Event,Backend,Output,Callbacks,State,Next,NextBackend),
      (Next==stop -> true;
       control_loop(NextBackend,Output,Timeout,Callbacks,Queue,Next)))).

stop_requested(Queue) :- thread_get_message(Queue,stop,[timeout(0)]).

next_event(_, _, _, interrupt) :- retract(interrupt_pending), !.
next_event(headless, Queue, Timeout, Event) :- !,
    (thread_get_message(Queue,stop,[timeout(Timeout)]) ->
      Event=stop
    ; Event=timeout).
next_event(windows_headless, _, Timeout, Event) :- !,
    catch(windows_console_read(Timeout,Event),Error,input_failure(Error,Event)).
next_event(windows, _, Timeout, Event) :- !,
    catch(windows_console_read(Timeout,Event),Error,input_failure(Error,Event)).
next_event(posix, _, Timeout, Event) :- !,
    catch((wait_for_input([user_input],Ready,Timeout),
           (Ready==[] -> Event=timeout;
            get_code(user_input,Code),(Code=:= -1 -> Event=eof;Event=key(Code)))),
          Error, input_failure(Error,Event)).
% Private event source for deterministic controller tests; not a user option.
next_event(events(Events), _, Timeout, Event) :-
    (thread_get_message(Events,Received,[timeout(Timeout)]) -> Event=Received;
     Event=timeout).

input_failure(Error, input_error(Error)) :-
    Error=error(Formal,_),
    (Formal=windows_console(_,_); Formal=io_error(_,_); Formal=existence_error(stream,_);
     Formal=permission_error(input,stream,_); Formal=domain_error(waitable_stream,_)), !.
input_failure(Error, _) :- throw(Error).

handle_event(stop, Backend, _, _, _, stop, Backend) :- !.
handle_event(eof, _, Output, _, _, idle, headless) :- !, no_console(Output).
handle_event(input_error(_), _, Output, _, _, idle, headless) :- !,
    emit(Output,'~nConsole input unavailable; waiting for a host stop message.~n',[]).
% An older suspended control_loop/6 may resume with its former state term.
handle_event(Event, Backend, Output, Callbacks, confirm(_), Next, B) :- !,
    handle_event(Event,Backend,Output,Callbacks,idle,Next,B).
handle_event(Event, Backend, Output, Callbacks, menu, Next, B) :- !,
    handle_event(Event,Backend,Output,Callbacks,idle,Next,B).
handle_event(timeout, Backend, _, _, State, State, Backend) :- !.
handle_event(interrupt, Backend, Output, _, State, State, Backend) :-
    headless_backend(Backend),!,
    emit(Output,'~nNo interactive console: exit not selected; send a host stop message.~n',[]).
handle_event(interrupt, Backend, Output, _, _, idle, Backend) :- !,
    menu(Output).
handle_event(key(3), Backend, Output, Callbacks, State, Next, B) :- !,
    handle_event(interrupt,Backend,Output,Callbacks,State,Next,B).
handle_event(key(0'?), Backend, Output, Callbacks, State, Next, B) :- !,
    handle_event(interrupt,Backend,Output,Callbacks,State,Next,B).
handle_event(key(Key), Backend, Output, Callbacks, State, Next, Backend) :-
    key_action(State,Key,Output,Callbacks,Next).

key_action(idle, 0'?, Output, _, idle) :- !, menu(Output).
key_action(idle, Key, Output, Callbacks, Next) :- !,
    (menu_choice(Key,Choice) ->
       acknowledge(Choice,Output),perform_choice(Choice,Output,Callbacks,Next)
    ;Next=idle).
key_action(confirm(_), Key, Output, Callbacks, Next) :- !,
    key_action(idle,Key,Output,Callbacks,Next).
key_action(menu, Key, Output, Callbacks, Next) :- !,
    key_action(idle,Key,Output,Callbacks,Next).
key_action(port(Digits), Key, Output, Callbacks, Next) :-
    (Key=:=27 -> Next=idle
    ;memberchk(Key,[8,127]) ->
       (append(Short,[_],Digits) -> true;Short=[]),
       Next=port(Short),port_prompt(Short,Output)
    ;memberchk(Key,[10,13]) ->
       (valid_port(Digits,Port) ->
         selected_callback(bind,Callbacks,Bind),bind_callback(Bind,Port,Goal),
         acknowledge(bind,Output),
         operation(bind,Goal,Output),Next=idle
       ; emit(Output,'~nPort must be 1..65535; try again or Escape to cancel.~n',[]),
         Next=port([]),port_prompt([],Output))
    ;Key>=0'0,Key=<0'9 ->
       (length(Digits,N),N<6 -> append(Digits,[Key],More),emit(Output,'~c',[Key]);
        More=Digits,emit(Output,'~nToo many digits; Backspace or Escape.~n',[])),
       Next=port(More)
    ;emit(Output,'~nDigits only; Enter submits, Escape cancels.~n',[]),
     Next=port(Digits),port_prompt(Digits,Output)).

menu_choice(Key,Choice) :-
    between(0'A,0'Z,Key),!,Lower is Key+32,menu_choice(Lower,Choice).
menu_choice(0'c,continue).
menu_choice(0'x,exit).
menu_choice(0'm,make).
menu_choice(0'r,restart).
menu_choice(0'b,bind).
menu_choice(0't,threads).
menu_choice(0'p,prolog).
menu_choice(0's,shell).

acknowledge(Choice,Output) :-
    choice_label(Choice,Label),emit(Output,'~nSelected: ~w~n',[Label]).
choice_label(continue,'(C) CONTINUE').
choice_label(exit,'(X) EXIT').
choice_label(make,'(M) MAKE').
choice_label(restart,'(R) RESTART SERVER').
choice_label(bind,'(B) BIND LOOPBACK PORT').
choice_label(threads,'(T) LIST ACTIVE THREADS').
choice_label(prolog,'(P) PROLOG').
choice_label(shell,'(S) SHELL').

perform_choice(continue,_,_,idle).
perform_choice(exit,_,_,stop).
perform_choice(bind,Output,_,port([])) :- port_prompt([],Output).
perform_choice(threads,Output,_,idle) :- list_threads(Output).
perform_choice(make,Output,Callbacks,idle) :-
    selected_callback(make,Callbacks,Make),operation(make,Make,Output).
perform_choice(restart,Output,Callbacks,idle) :-
    selected_callback(restart,Callbacks,Restart),operation(restart,Restart,Output).
perform_choice(prolog,Output,Callbacks,idle) :-
    selected_callback(prolog,Callbacks,Prolog),request_handoff(prolog,Prolog,Output).
perform_choice(shell,Output,Callbacks,idle) :-
    selected_callback(shell,Callbacks,Shell),request_handoff(shell,Shell,Output).

request_handoff(Name,none,Output) :- !,operation(Name,none,Output).
request_handoff(Name,some(Goal),Output) :-
    (handoff_allowed -> throw('$kb_lifecycle_handoff'(Name,Goal));
     upcase_atom(Name,Label),
     emit(Output,'~n~w unavailable: re-enter wait_for_stop/1 to enable safe handoff.~n',[Label])).

% Keep old live-loop callback terms usable across a Prolog-only hot reload.
selected_callback(restart,callbacks(Restart,_,_,_,_),Restart).
selected_callback(bind,callbacks(_,Bind,_,_,_),Bind).
selected_callback(make,callbacks(_,_,Make,_,_),Make).
selected_callback(prolog,callbacks(_,_,_,Prolog,_),Prolog).
selected_callback(shell,callbacks(_,_,_,_,Shell),Shell).
selected_callback(restart,callbacks(Restart,_,_),Restart).
selected_callback(bind,callbacks(_,Bind,_),Bind).
selected_callback(make,callbacks(_,_,Make),Make).
selected_callback(restart,callbacks(Restart,_),Restart).
selected_callback(bind,callbacks(_,Bind),Bind).
selected_callback(make,callbacks(_,_),none).
selected_callback(prolog,callbacks(_,_,_),none).
selected_callback(shell,callbacks(_,_,_),none).
selected_callback(prolog,callbacks(_,_),none).
selected_callback(shell,callbacks(_,_),none).

valid_port(Digits,Port) :-
    Digits\=[],length(Digits,Length),Length=<5,maplist(digit_code,Digits),
    number_codes(Port,Digits),integer(Port),between(1,65535,Port).
digit_code(Code) :- integer(Code),between(0'0,0'9,Code).
bind_callback(none, _, none).
bind_callback(some(Closure), Port, some(call(Closure,Port))).

operation(Name, none, Output) :- !,
    upcase_atom(Name,Label),
    emit(Output,'~n~w unavailable: no host callback configured.~n',[Label]).
operation(Name, some(Goal), Output) :-
    upcase_atom(Name,Label),
    catch((once(Goal) -> Result=ok;Result=failed),Error,operation_error(Error,Result)),
    (Result==ok -> emit(Output,'~n~w completed.~n',[Label]);
     Result==failed -> emit(Output,'~n~w failed; controls remain available.~n',[Label]);
     Result=error(Error),
     message_to_string(Error,Message),
     emit(Output,'~n~w failed: ~s~n',[Label,Message])).
operation_error(Error, _) :-
    (Error==time_limit_exceeded;Error=='$aborted'),!,throw(Error).
operation_error(Error, error(Error)).

open_menu(_,Output) :- menu(Output).
menu(Output) :-
    emit(Output,'~nPOWDER CONTROLS~n(C) CONTINUE  E(X)IT  (M) MAKE~n(R) RESTART SERVER  (B) BIND LOOPBACK PORT  (T) LIST ACTIVE THREADS~n(P)ROLOG  (S)HELL~n',[]).
port_prompt(Digits,Output) :-
    emit(Output,'~nLoopback port (1..65535; ENTER submits, ESCAPE cancels): ~s',[Digits]).
% Retained only for a pre-reload frame that has not yet returned to the loop.
confirmation(Output) :- menu(Output).
resume_prompt(_,Output) :- menu(Output).
no_console(Output) :-
    emit(Output,'powder: stdin has no interactive console; waiting for a host stop message.~n',[]).
emit(Output, Format, Args) :- format(Output,Format,Args),flush_output(Output).
headless_backend(headless).
headless_backend(windows_headless).

thread_snapshot(Rows) :-
    findall(Id-Row,
      (thread_property(Thread,id(Id)),catch(thread_row(Thread,Id,Row),_,fail)),Pairs),
    keysort(Pairs,Sorted),pairs_rows(Sorted,Rows).
pairs_rows([],[]).
pairs_rows([_-Row|Rest],[Row|Rows]) :- pairs_rows(Rest,Rows).
thread_row(Thread,Id,thread{id:Id,alias:Alias,status:State,role:Role}) :-
    thread_property(Thread,status(Status)),
    (thread_property(Thread,alias(Alias)) -> true; Alias='-'),
    (atom(Status) -> State=Status;functor(Status,State,_)),
    known_role(Thread,Alias,Role).
known_role(_, main, console) :- !.
known_role(Thread,_,Role) :-
    current_predicate(kb_jobs:worker/3),
    catch(kb_jobs:worker(Pool,Thread,_),_,fail),atom(Pool),!,
    atom_concat(Pool,' worker',Role).
known_role(Thread,_,manager) :-
    current_predicate(kb_jobs:manager/2),
    catch(kb_jobs:manager(Thread,_),_,fail),!.
known_role(Thread,_,Role) :-
    catch(thread_property(Thread,class(Class)),_,fail),atom(Class),!,Role=Class.
known_role(_,_,unknown).
list_threads(Output) :-
    thread_snapshot(Rows),
    emit(Output,'~nID  Alias  Status  Role/pool~n',[]),
    forall(member(Row,Rows),
      emit(Output,'~d  ~q  ~w  ~q~n',[Row.id,Row.alias,Row.status,Row.role])).
