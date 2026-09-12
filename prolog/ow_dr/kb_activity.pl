:- module(kb_activity, [with_application/1, with_exclusive_reload/1,
                        acquire_application/1,release_application/1,activity_status/1,
                        begin_admission_lease/1,end_admission_lease/1,owns_admission_lease/0]).
:- use_module(library(error)).
:- use_module(library(uuid)).
:- meta_predicate with_application(0), with_exclusive_reload(0).
:- dynamic active/1, exclusive/0.
:- dynamic application_ticket/1.
:- dynamic admission_lease/3.
:- thread_local application_depth/1.
:- volatile active/1,exclusive/0,application_ticket/1,application_depth/1.
:- volatile admission_lease/3.

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

acquire_application(Id) :-
    must_be(atom,Id),
    with_mutex(powder_code_gate,
      (exclusive->throw(error(application_reload_busy,_))
      ;application_ticket(Id)->throw(error(duplicate_application_ticket(Id),_))
      ;assertz(application_ticket(Id)),flag_active(1))).
release_application(Id) :-
    must_be(atom,Id),
    with_mutex(powder_code_gate,
      (retract(application_ticket(Id))->flag_active(-1);true)).

activity_status(Status) :-
    with_mutex(powder_code_gate,
      ((active(Count)->true;Count=0),
      (exclusive->Exclusive=true;Exclusive=false),
      (admission_lease(_,_,_)->Leased=true;Leased=false),
      findall(Id,application_ticket(Id),Tickets),
      Status=activity{active:Count,exclusive:Exclusive,leased:Leased,tickets:Tickets})).

begin_admission_lease(Token) :-
    must_be(var,Token),uuid(Token),thread_self(Owner),
    with_mutex(powder_code_gate,transaction(
      ((exclusive;active(N),N>0;application_ticket(_))->
       throw(error(application_reload_busy,_));
      asserta(exclusive,Ref),assertz(admission_lease(Token,Owner,Ref))))).
end_admission_lease(Token) :-
    must_be(atom,Token),
    with_mutex(powder_code_gate,transaction(
      (retract(admission_lease(Token,_,Ref))->erase(Ref);true))).
owns_admission_lease :-
    thread_self(Owner),admission_lease(_,Owner,_).
