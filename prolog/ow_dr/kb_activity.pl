:- module(kb_activity, [with_application/1, with_exclusive_reload/1]).
:- meta_predicate with_application(0), with_exclusive_reload(0).
:- dynamic active/1, exclusive/0.
:- thread_local application_depth/1.

with_application(Goal) :-
    (application_depth(_)->call(Goal);
      setup_call_cleanup(
        with_mutex(powder_code_gate,
          (exclusive->throw(error(application_reload_busy,_));
           flag_active(1),asserta(application_depth(1),Ref))),
        Goal,
        (erase(Ref),with_mutex(powder_code_gate,flag_active(-1))))).

with_exclusive_reload(Goal) :-
    setup_call_cleanup(
      with_mutex(powder_code_gate,
        ((exclusive;active(N),N>0)->throw(error(application_reload_busy,_));asserta(exclusive,Ref))),
      Goal,erase(Ref)).

flag_active(Delta) :-
    (retract(active(Previous))->true;Previous=0),
    Next is Previous+Delta,assertz(active(Next)).
