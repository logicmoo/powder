:- begin_tests(kb_lifecycle).
:- use_module('../kb_lifecycle').
:- use_module(library(time)).

:- dynamic called/1.

script([],_,_).
script([pause(Seconds)|Rest],Events,Stop) :- !,
    sleep(Seconds),script(Rest,Events,Stop).
script([stop|Rest],Events,Stop) :- !,
    thread_send_message(Stop,stop),script(Rest,Events,Stop).
script([Event|Rest],Events,Stop) :-
    thread_send_message(Events,Event),script(Rest,Events,Stop).

run_events(Script,Callbacks,Text) :-
    run_events(Script,Callbacks,idle,Text).
run_events(Script,Callbacks,State,Text) :-
    setup_call_cleanup(
      (message_queue_create(Events),message_queue_create(Stop)),
      setup_call_cleanup(
        thread_create(script(Script,Events,Stop),Sender,[]),
        with_output_to(string(Text),
          (current_output(Output),
           call_with_time_limit(3,
             (State==start ->
                kb_lifecycle:start_loop(events(Events),Output,0.02,Callbacks,Stop)
             ; kb_lifecycle:control_loop(events(Events),Output,0.02,Callbacks,Stop,State))))),
        thread_join(Sender,_)),
      (message_queue_destroy(Events),message_queue_destroy(Stop))).

none(callbacks(none,none)).
hits(Text,Needle,Count) :-
    findall(Start,sub_string(Text,Start,_,_,Needle),Starts),length(Starts,Count).
ok_restart :- assertz(called(restart)).
ok_bind(Port) :- assertz(called(bind(Port))).
ok_make :- assertz(called(make)),format('CALLBACK_MAKE~n',[]),flush_output.
bad_make :- assertz(called(make)),fail.
throw_make :- throw(error(make_test,context(callback,test))).
bad_restart :- assertz(called(restart)),fail.
throw_restart :- throw(error(restart_test,context(callback,test))).
bad_bind(_) :- fail.

test(idle_is_blocking_and_stop_bounded) :-
    none(C),statistics(cputime,C0),statistics(inferences,I0),get_time(T0),
    run_events([pause(0.24),stop],C,Text),
    get_time(T1),statistics(cputime,C1),statistics(inferences,I1),
    Elapsed is T1-T0,CPU is C1-C0,Steps is I1-I0,
    assertion(Elapsed>=0.20),assertion(Elapsed<1),
    assertion(CPU<0.12),assertion(Steps<10000),assertion(Text=="").
test(startup_and_continue_have_no_automatic_hint_or_prompt) :-
    none(C),run_events([pause(0.08),key(0'c),pause(0.08),stop],C,start,Text),
    assertion(Text=="\nSelected: (C) CONTINUE\n").

test(stop_after_help_returns_to_scanner) :-
    none(C),run_events([key(0'?),pause(0.08),stop],C,Text),
    hits(Text,"POWDER CONTROLS",N),assertion(N=:=1).
test(stop_after_ctrl_c_help_returns_to_scanner) :-
    none(C),run_events([interrupt,pause(0.08),stop],C,Text),
    hits(Text,"POWDER CONTROLS",N),assertion(N=:=1).
test(stop_while_port_buffer_pending) :-
    none(C),run_events([key(0'?),key(0'b),key(0'8),key(0'0),pause(0.08),stop],C,Text),
    assertion(sub_string(Text,_,_,_,"80")).
test(help_timeouts_never_select_or_repeat) :-
    none(C),run_events([interrupt,pause(0.12),key(0'x)],C,Text),
    hits(Text,"POWDER CONTROLS",N),assertion(N=:=1),
    hits(Text,"Selected:",Selections),assertion(Selections=:=1),
    assertion(sub_string(Text,_,_,_,"Selected: (X) EXIT")).
test(each_explicit_help_request_returns_to_same_scanner) :-
    none(C),run_events([interrupt,interrupt,key(3),key(0'?),timeout,key(0'c),
                       interrupt,key(0'x)],C,Text),
    hits(Text,"POWDER CONTROLS",N),assertion(N=:=5),
    hits(Text,"Selected: (C) CONTINUE",Continues),assertion(Continues=:=1).
test(ctrl_c_and_question_mark_have_identical_nonmodal_help) :-
    none(C),run_events([interrupt,key(0'x)],C,Interrupt),
    run_events([key(0'?),key(0'x)],C,Question),
    assertion(Interrupt==Question),
    assertion(\+sub_string(Question,_,_,_,"> ")),
    assertion(\+sub_string(Question,_,_,_,"Choice:")).
test(obsolete_confirmation_keys_and_old_exit_do_not_select) :-
    none(C),run_events([interrupt,key(10),key(0'y),key(0'n),key(0'e),
                       pause(0.05),stop],C,Text),
    assertion(\+sub_string(Text,_,_,_,"Selected:")),
    assertion(\+sub_string(Text,_,_,_,"Exit powder gracefully?")).
test(continue_and_exit_work_directly_without_help) :-
    none(C),run_events([key(0'c),key(0'x)],C,Text),
    assertion(sub_string(Text,_,_,_,"Selected: (C) CONTINUE")),
    assertion(sub_string(Text,_,_,_,"Selected: (X) EXIT")),
    assertion(\+sub_string(Text,_,_,_,"POWDER CONTROLS")).
test(unrecognized_idle_keys_and_timeouts_are_quiet) :-
    none(C),run_events([key(0'z),key(0'y),key(0'n),key(0'e),key(27),
                       key(0'1),key(10),key(13),timeout,pause(0.05),stop],C,Text),
    assertion(Text=="").

test(successful_host_callbacks_once,[cleanup(retractall(called(_)))]) :-
    C=callbacks(some(plunit_kb_lifecycle:ok_restart),some(plunit_kb_lifecycle:ok_bind)),
    run_events([key(0'r),key(0'b),key(0'8),key(0'0),key(0'8),key(0'0),
                key(13),key(0'x)],C,Text),
    findall(X,called(X),Calls),assertion(Calls==[restart,bind(8080)]),
    assertion(sub_string(Text,_,_,_,"RESTART completed")),
    assertion(sub_string(Text,_,_,_,"BIND completed")),
    assertion(\+sub_string(Text,_,_,_,"POWDER CONTROLS")).
test(callback_failures_leave_controls_usable,[cleanup(retractall(called(_)))]) :-
    C=callbacks(some(plunit_kb_lifecycle:bad_restart),some(plunit_kb_lifecycle:bad_bind)),
    run_events([key(0'?),key(0'r),key(0'b),key(0'1),key(13),key(0'x)],C,Text),
    findall(X,called(X),Calls),assertion(Calls==[restart]),
    assertion(sub_string(Text,_,_,_,"RESTART failed")),
    assertion(sub_string(Text,_,_,_,"BIND failed")).
test(callback_exception_leaves_controls_usable) :-
    C=callbacks(some(plunit_kb_lifecycle:throw_restart),none),
    run_events([key(0'?),key(0'r),key(0'x)],C,Text),
    assertion(sub_string(Text,_,_,_,"RESTART failed")).
test(missing_callbacks_report_unavailable) :-
    none(C),run_events([key(0'?),key(0'm),key(0'r),key(0'b),key(0'1),key(13),key(0'x)],C,Text),
    hits(Text,"unavailable",N),assertion(N=:=3).

test(make_acknowledged_before_single_callback,[cleanup(retractall(called(_)))]) :-
    C=callbacks(none,none,some(plunit_kb_lifecycle:ok_make)),
    run_events([key(0'M),key(0'x)],C,Text),
    findall(X,called(X),Calls),assertion(Calls==[make]),
    before(Text,"Selected: (M) MAKE","CALLBACK_MAKE"),
    before(Text,"CALLBACK_MAKE","Selected: (X) EXIT"),
    assertion(\+sub_string(Text,_,_,_,"POWDER CONTROLS")).
test(make_failure_leaves_controls_usable,[cleanup(retractall(called(_)))]) :-
    C=callbacks(none,none,some(plunit_kb_lifecycle:bad_make)),
    run_events([interrupt,key(0'm),key(0'x)],C,Text),
    assertion(called(make)),before(Text,"Selected: (M) MAKE","MAKE failed").
test(make_exception_leaves_controls_usable) :-
    C=callbacks(none,none,some(plunit_kb_lifecycle:throw_make)),
    run_events([interrupt,key(0'm),key(0'x)],C,Text),
    before(Text,"Selected: (M) MAKE","MAKE failed").
test(failed_acknowledgement_prevents_callback,[cleanup(retractall(called(_)))]) :-
    C=callbacks(none,none,some(plunit_kb_lifecycle:ok_make)),
    catch(kb_lifecycle:key_action(menu,0'm,missing_lifecycle_stream,C,_),Error,true),
    assertion(nonvar(Error)),assertion(\+called(_)).
test(every_direct_action_has_canonical_acknowledgement) :-
    none(C),
    run_events([key(0'C),key(0'M),key(0'R),
                key(0'B),key(27),key(0'T),key(0'P),key(0'S),key(0'X)],C,Text),
    forall(member(Label,["(C) CONTINUE","(X) EXIT","(M) MAKE",
                        "(R) RESTART SERVER","(B) BIND LOOPBACK PORT","(T) LIST ACTIVE THREADS",
                        "(P) PROLOG","(S) SHELL"]),
      (string_concat("Selected: ",Label,Ack),hits(Text,Ack,N),assertion(N=:=1))),
    before(Text,"Selected: (B) BIND LOOPBACK PORT","Loopback port ("),
    before(Text,"Selected: (T) LIST ACTIVE THREADS","ID  Alias  Status"),
    assertion(\+sub_string(Text,_,_,_,"POWDER CONTROLS")).
test(legacy_modal_states_become_quiet_scanning,
     [forall(member(State,[menu,confirm(port([0'8]))]))]) :-
    none(C),run_events([timeout,key(0'y),key(0'n),key(0'x)],C,State,Text),
    hits(Text,"POWDER CONTROLS",N),assertion(N=:=0),
    hits(Text,"Selected:",Selections),assertion(Selections=:=1),
    assertion(sub_string(Text,_,_,_,"Selected: (X) EXIT")).

before(Text,First,Second) :-
    once(sub_string(Text,A,_,_,First)),once(sub_string(Text,B,_,_,Second)),
    assertion(A<B).

test(valid_ports,[forall(member(Port,[1,80,3050,65535]))]) :-
    number_codes(Port,Codes),assertion(kb_lifecycle:valid_port(Codes,Port)).
test(invalid_ports,[forall(member(Text,["","0","65536","100000","000001","-1","3.5","1e2","halt"]))]) :-
    string_codes(Text,Codes),assertion(\+kb_lifecycle:valid_port(Codes,_)).
test(invalid_port_keeps_buffer_control_then_cancel,[cleanup(retractall(called(_)))]) :-
    C=callbacks(none,some(plunit_kb_lifecycle:ok_bind)),
    run_events([key(0'?),key(0'b),key(13),key(0'0),key(13),key(0'z),key(27),key(0'x)],C,Text),
    assertion(\+called(_)),hits(Text,"Port must be",N),assertion(N=:=2),
    assertion(sub_string(Text,_,_,_,"Digits only")).
test(overlong_port_is_not_silently_truncated,[cleanup(retractall(called(_)))]) :-
    C=callbacks(none,some(plunit_kb_lifecycle:ok_bind)),
    run_events([key(0'?),key(0'b),key(0'1),key(0'2),key(0'3),key(0'4),
                key(0'5),key(0'6),key(0'7),key(13),key(27),key(0'x)],C,Text),
    assertion(\+called(_)),assertion(sub_string(Text,_,_,_,"Port must be")).
test(backspace_preserves_port_slots,[cleanup(retractall(called(_)))]) :-
    C=callbacks(none,some(plunit_kb_lifecycle:ok_bind)),
    run_events([key(0'?),key(0'b),key(0'9),key(8),key(0'8),
                key(0'0),key(13),key(0'x)],C,_),
    assertion(called(bind(80))).
test(help_requests_cancel_port_buffer_without_nested_prompts,
     [forall(member(Opener,[interrupt,key(0'?)])),cleanup(retractall(called(_)))]) :-
    C=callbacks(none,some(plunit_kb_lifecycle:ok_bind)),
    run_events([key(0'?),key(0'b),key(0'8),Opener,key(0'b),key(0'1),
                key(13),key(0'x)],C,Text),
    findall(X,called(X),Calls),assertion(Calls==[bind(1)]),
    assertion(\+sub_string(Text,_,_,_,"Exit powder gracefully?")).

test(eof_disables_input_without_exit_or_spin) :-
    none(C),get_time(Start),
    run_events([eof,pause(0.12),stop],C,Text),get_time(End),
    assertion(End-Start>=0.10),hits(Text,"no interactive console",N),assertion(N=:=1).
test(input_error_is_reported_once_then_stop) :-
    none(C),run_events([input_error(closed),pause(0.08),stop],C,Text),
    hits(Text,"Console input unavailable",N),assertion(N=:=1).
test(headless_interrupt_never_confirms_or_exits) :-
    with_output_to(string(Text),
      (current_output(Out),
       kb_lifecycle:handle_event(interrupt,headless,Out,callbacks(none,none),idle,Next,B))),
    assertion(Next==idle),assertion(B==headless),
    assertion(sub_string(Text,_,_,_,"exit not selected")).

test(unrelated_stop_queue_messages_preserved) :-
    setup_call_cleanup(message_queue_create(Queue),
      (thread_send_message(Queue,unrelated),thread_send_message(Queue,stop),
       assertion(kb_lifecycle:stop_requested(Queue)),
       assertion(thread_get_message(Queue,unrelated,[timeout(0)]))),
      message_queue_destroy(Queue)).
test(signal_handler_only_sets_one_flag,[cleanup(retractall(kb_lifecycle:interrupt_pending))]) :-
    kb_lifecycle:note_interrupt(int),kb_lifecycle:note_interrupt(int),
    findall(x,kb_lifecycle:interrupt_pending,Flags),assertion(Flags==[x]).
test(callback_options_preserve_calling_module) :-
    kb_lifecycle:callbacks([restart(ok_restart),bind(ok_bind),make(ok_make),
                           prolog(ok_make),shell(ok_restart)],plunit_kb_lifecycle,C),
    assertion(C==callbacks(some(plunit_kb_lifecycle:ok_restart),
                          some(plunit_kb_lifecycle:ok_bind),some(plunit_kb_lifecycle:ok_make),
                          some(plunit_kb_lifecycle:ok_make),some(plunit_kb_lifecycle:ok_restart))).

test(handoff_requires_fresh_driver_scope,[cleanup(retractall(called(_)))]) :-
    C=callbacks(none,none,none,some(plunit_kb_lifecycle:ok_make),some(plunit_kb_lifecycle:ok_restart)),
    run_events([key(0'p),key(0's),key(0'x)],C,Text),
    assertion(\+called(_)),
    hits(Text,"re-enter wait_for_stop/1",N),assertion(N=:=2).
test(handoff_unwinds_instead_of_running_inside_raw_scope,
     [cleanup(retractall(called(_)))]) :-
    C=callbacks(none,none,none,some(plunit_kb_lifecycle:ok_make),none),
    setup_call_cleanup(asserta(kb_lifecycle:handoff_allowed,Ref),
      catch(with_output_to(string(_),
        (current_output(Output),kb_lifecycle:key_action(idle,0'p,Output,C,_))),
        Transfer,true),
      erase(Ref)),
    assertion(Transfer=='$kb_lifecycle_handoff'(prolog,plunit_kb_lifecycle:ok_make)),
    assertion(\+called(_)).
test(interactive_context_restores_signal_flags_and_streams_after_exception,
     [condition(current_prolog_flag(windows,true))]) :-
    on_signal(int,Signal,Signal),
    current_prolog_flag(tty_control,Tty),
    current_prolog_flag(toplevel_goal,Toplevel),
    stream_property(user_input,timeout(Timeout)),
    current_output(Output),
    catch(kb_interactive_control:with_interactive_context(
      (on_signal(int,_,ignore),set_prolog_flag(tty_control,false),
       set_prolog_flag(toplevel_goal,default),set_stream(user_input,timeout(0.37)),
       set_output(user_error),throw(interactive_test_exception))),Error,true),
    assertion(Error==interactive_test_exception),
    on_signal(int,Restored,Restored),assertion(Restored==Signal),
    assertion(current_prolog_flag(tty_control,Tty)),
    assertion(current_prolog_flag(toplevel_goal,Toplevel)),
    assertion(stream_property(user_input,timeout(Timeout))),
    current_output(After),assertion(After==Output).
test(interactive_context_restores_on_failure,
     [condition(current_prolog_flag(windows,true))]) :-
    on_signal(int,Signal,Signal),
    assertion(\+kb_interactive_control:with_interactive_context((on_signal(int,_,ignore),fail))),
    on_signal(int,After,After),assertion(After==Signal).
test(native_callbacks_use_standard_zero_arity_predicates) :-
    clause(kb_interactive_control:prolog_console,Prolog),
    assertion(sub_term(prolog,Prolog)),assertion(\+sub_term(break,Prolog)),
    clause(kb_interactive_control:os_shell,Shell),
    assertion(sub_term(shell,Shell)),
    assertion(\+(sub_term(Term,Shell),compound(Term),functor(Term,process_create,3))).
test(native_callbacks_reject_calls_outside_handoff,
     [forall(member(Goal,[prolog_console,os_shell])),
      throws(error(permission_error(control,interactive_console,handoff_required),_))]) :-
    call(kb_interactive_control:Goal).
test(context_rejects_a_still_owned_raw_scanner,
     [throws(error(permission_error(control,interactive_console,scanner_still_owns_input),_))]) :-
    setup_call_cleanup(asserta(kb_lifecycle:handoff_allowed,Ref),
      kb_interactive_control:with_interactive_context(true),erase(Ref)).
test(console_snapshot_accepts_only_quiescent_lifecycle) :-
    kb_lifecycle:console_snapshot_safe.
test(console_snapshot_rejects_active_owner,
     [throws(error(permission_error(save,console_lifecycle,active),_))]) :-
    setup_call_cleanup(asserta(kb_lifecycle:console_owner(main),Ref),
      kb_lifecycle:console_snapshot_safe,erase(Ref)).
test(console_snapshot_rejects_interactive_handoff,
     [throws(error(permission_error(save,console_lifecycle,active),_))]) :-
    setup_call_cleanup(asserta(kb_interactive_control:interactive_context_active,Ref),
      kb_lifecycle:console_snapshot_safe,erase(Ref)).
test(console_runtime_ownership_is_volatile) :-
    assertion(predicate_property(kb_lifecycle:console_owner(_),volatile)),
    assertion(predicate_property(kb_lifecycle:interrupt_pending,volatile)),
    assertion(predicate_property(kb_lifecycle:handoff_allowed,volatile)),
    assertion(predicate_property(kb_interactive_control:interactive_context_active,volatile)).

test(thread_listing_is_concise_and_excludes_exception_details) :-
    setup_call_cleanup(thread_create(throw(secret_query_payload),Id,[]),
      (sleep(0.03),thread_snapshot(Rows),
       once((member(Main,Rows),Main.alias==main)),assertion(Main.role==console),
       with_output_to(string(Text),write_canonical(Rows)),
       assertion(\+sub_string(Text,_,_,_,"secret_query_payload")),
       once((member(Failed,Rows),Failed.status==exception))),
      thread_join(Id,_)).
test(direct_thread_listing_returns_to_scanner) :-
    none(C),run_events([key(0't),key(0'x)],C,Text),
    assertion(sub_string(Text,_,_,_,"ID  Alias  Status  Role/pool")),
    hits(Text,"POWDER CONTROLS",N),assertion(N=:=0).
test(thread_exit_races_are_tolerated) :-
    forall(between(1,15,_),
      setup_call_cleanup(thread_create(true,Id,[]),
        thread_snapshot(_),thread_join(Id,_))).

test(public_loop_restores_signal_and_ownership,
     [condition(current_prolog_flag(windows,true))]) :-
    setup_call_cleanup(message_queue_create(Queue),
      (thread_send_message(Queue,stop),on_signal(int,Before,Before),
       with_output_to(string(_),
         (current_output(Output),wait_for_stop([stop_queue(Queue),output(Output)]))),
       on_signal(int,After,After),assertion(After==Before),
       assertion(\+kb_lifecycle:console_owner(_))),
      message_queue_destroy(Queue)).
test(public_loop_restores_on_output_exception,
     [condition(current_prolog_flag(windows,true))]) :-
    on_signal(int,Before,Before),
    catch(wait_for_stop([output(missing_lifecycle_stream)]),Error,true),
    assertion(nonvar(Error)),on_signal(int,After,After),assertion(After==Before),
    assertion(\+kb_lifecycle:console_owner(_)),
    kb_lifecycle:windows_console_open(_),kb_lifecycle:windows_console_close.
test(public_loop_restores_on_timeout,
     [condition(current_prolog_flag(windows,true))]) :-
    on_signal(int,Before,Before),
    catch(call_with_time_limit(0.08,
      with_output_to(string(_),
        (current_output(Output),wait_for_stop([output(Output),timeout(0.02)])))),
      Error,true),
    assertion(Error==time_limit_exceeded),
    on_signal(int,After,After),assertion(After==Before),
    assertion(\+kb_lifecycle:console_owner(_)),
    kb_lifecycle:windows_console_open(_),kb_lifecycle:windows_console_close.
test(invalid_timeout_is_rejected,
     [throws(error(domain_error(console_timeout,0),_))]) :-
    wait_for_stop([timeout(0)]).
test(unknown_options_are_rejected,
     [throws(error(domain_error(console_option,eval(halt)),_))]) :-
    wait_for_stop([eval(halt)]).
test(worker_cannot_take_global_console) :-
    setup_call_cleanup(thread_create(wait_for_stop,Id,[]),
      thread_join(Id,Status),true),
    assertion(Status=exception(error(permission_error(control,main_console,_),_))).

:- end_tests(kb_lifecycle).
