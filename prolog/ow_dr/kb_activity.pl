:- module(kb_activity, [with_application/1, with_exclusive_reload/1]).
:- meta_predicate with_application(0), with_exclusive_reload(0).
:- dynamic active/1.
:- thread_local application_depth/1.

with_application(Goal) :-
    (application_depth(_)->call(Goal);
      setup_call_cleanup(
        with_mutex(powder_code_gate,
          (flag_active(1),asserta(application_depth(1),Ref))),
        Goal,
        (erase(Ref),with_mutex(powder_code_gate,flag_active(-1))))).

with_exclusive_reload(Goal) :-
    % Serialize code reloads only. SWI retains active calls across recompilation.
    with_mutex(openworld_code_reload,Goal).

flag_active(Delta) :-
    (retract(active(Previous))->true;Previous=0),
    Next is Previous+Delta,assertz(active(Next)).
