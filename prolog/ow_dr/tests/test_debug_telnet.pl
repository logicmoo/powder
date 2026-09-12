:- begin_tests(debug_telnet).
:- use_module('../kb_debug_telnet').

test(import_is_disabled) :-
    debug_telnet_status(S),assertion(S.enabled==false),debug_snapshot_safe.
test(default_port) :-
    kb_debug_telnet:configuration([],C),assertion(C.port=:=3051).
test(port_boundaries,[forall(member(P,[1,65535]))]) :-
    kb_debug_telnet:configuration([port(P)],_).
test(invalid_port,[throws(error(domain_error(debug_limit,0),_))]) :-
    kb_debug_telnet:configuration([port(0)],_).
test(no_remote_address_option,[throws(error(domain_error(debug_option,_),_))]) :-
    kb_debug_telnet:configuration([host('0.0.0.0')],_).
test(duplicate_options,[throws(error(domain_error(duplicate_debug_options,_),_))]) :-
    kb_debug_telnet:configuration([port(1),port(2)],_).
test(auth_timeout_bounded,[throws(error(domain_error(debug_timeout,0),_))]) :-
    kb_debug_telnet:configuration([auth_timeout(0)],_).
test(owner_state_volatile,[forall(member(P,[service/6,auth_digest/2,client/5,attempts/3]))]) :-
    P=Name/Arity,functor(Head,Name,Arity),
    assertion(predicate_property(kb_debug_telnet:Head,volatile)).
test(comparison_matches) :- kb_debug_telnet:xor_codes([1,2],[1,2],0,0).
test(comparison_mismatch) :-
    kb_debug_telnet:xor_codes([1,2],[1,3],0,N),assertion(N=\=0).
test(disable_is_idempotent) :-
    start_debug_telnet([enabled(false)]),stop_debug_telnet,debug_snapshot_safe.
:- end_tests(debug_telnet).
