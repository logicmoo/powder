:- begin_tests(debug_admin).
:- use_module('../kb_debug_admin').

test(default_is_disabled) :-
    debug_cli_options(['--port=3080','fixture.krf'],Rest,Options),
    assertion(Rest==['--port=3080','fixture.krf']),
    assertion(Options==[enabled(false),port(3051)]).
test(explicit_port_enables) :-
    debug_cli_options(['--debug-port=3051','--','fixture.krf'],Rest,Options),
    assertion(Rest==['--','fixture.krf']),
    assertion(Options==[enabled(true),port(3051)]).
test(last_option_wins) :-
    debug_cli_options(['--debug-port=4444','--debug-off'],[],A),
    assertion(A==[enabled(false),port(4444)]),
    debug_cli_options(['--debug-off','--debug-port=4445'],[],B),
    assertion(B==[enabled(true),port(4445)]).
test(invalid_ports,[forall(member(V,['','0','65536','1.0','1e3','-1','abc','+3051']))]) :-
    atom_concat('--debug-port=',V,Arg),
    catch(debug_cli_options([Arg],_,_),E,true),
    assertion(E=error(domain_error(debug_port,V),_)).
test(default_status_is_whitelisted) :-
    debug_admin_status(S),dict_pairs(S,_,Pairs),pairs_keys(Pairs,Keys),
    assertion(Keys==[enabled,host,maxSessions,pid,port,sessions,state]),
    assertion(S.enabled==false),assertion(S.host=="127.0.0.1").
test(missing_origin_is_forbidden,[throws(debug_admin(forbidden))]) :-
    kb_debug_admin:authorize([peer(ip(127,0,0,1))]).
test(nonloopback_is_forbidden,[throws(debug_admin(forbidden))]) :-
    kb_debug_admin:authorize([peer(ip(10,0,0,1)),origin('http://localhost:3050')]).
test(duplicate_origin_is_forbidden,[throws(debug_admin(forbidden))]) :-
    kb_debug_admin:authorize([peer(ip(127,0,0,1)),
      origin('http://localhost:3050'),origin('http://localhost:3050')]).
:- end_tests(debug_admin).
