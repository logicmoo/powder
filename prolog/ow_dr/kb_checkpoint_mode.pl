:- module(kb_checkpoint_mode,
          [seal_image/0, begin_restore/1, require_serving/0,
           permit_serving/0, resume_serving/0, enter_candidate/0, nonserving/0]).
:- use_module(library(socket),[]).
:- use_module(library(prolog_wrap)).
:- dynamic image_mode/1.
:- initialization(kb_checkpoint_mode:restore_network_fence,restore).

% This fact is deliberately saved: restore initializers start behind the fence,
% before the saved application's goal has inspected argv.
seal_image :-
    retractall(image_mode(_)),assertz(image_mode(dormant)),
    install_network_guards.
restore_network_fence :-
    catch((nonserving->
      (install_network_guards->true;throw(error(checkpoint_network_fence_failed,_)));true),
      Error,(print_message(error,Error),halt(1))).
install_network_guards :-
    forall(network_boundary(Head),
      wrap_predicate(Head,checkpoint_nonserving,Wrapped,
        (kb_checkpoint_mode:require_serving,call(Wrapped)))).
network_boundary(socket:tcp_socket(_)).
network_boundary(socket:udp_socket(_)).
network_boundary(socket:socket_create(_,_)).
network_boundary(socket:tcp_bind(_,_)).
network_boundary(socket:tcp_listen(_,_)).
network_boundary(socket:tcp_connect(_,_)).
network_boundary(socket:tcp_connect(_,_,_)).
network_boundary(socket:tcp_connect(_,_,_,_)).
network_boundary(socket:udp_send(_,_,_,_)).
begin_restore(Args) :-
    (Args=['--checkpoint-candidate',_]->enter_candidate;seal_image).
enter_candidate :- retractall(image_mode(_)),assertz(image_mode(candidate)).
nonserving :- image_mode(Mode),memberchk(Mode,[dormant,candidate]).
require_serving :-
    (nonserving->throw(error(permission_error(start,checkpoint_services,nonserving),_));true).
permit_serving :- retractall(image_mode(_)),assertz(image_mode(serving)).
resume_serving :-
    (image_mode(candidate)->
      throw(error(permission_error(resume,checkpoint_candidate,explicit_promotion_required),_));
      permit_serving).
