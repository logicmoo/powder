:- use_module('../kb_agents_http',[]).
:- use_module(library(plunit)).

:- begin_tests(agents_descriptor).
test(four_distinct_roles_no_provider_start) :-
    kb_agents_http:agents_descriptor(D),
    findall(Id,(member(Role,D.agents),Id=Role.id),Ids),
    assertion(Ids==["teacher","cyc","copilot","codex"]),
    assertion(D.operatorBridge.autoStart==false),
    assertion(D.operatorBridge.origin=="http://operator.localhost:8063"),
    once((member(Cyc,D.agents),Cyc.id=="cyc")),
    assertion(Cyc.llmAllowed==false).
test(configured_port,[setup(setenv('POWDER_OPERATOR_PORT','18063')),
                      cleanup(unsetenv('POWDER_OPERATOR_PORT'))]) :-
    kb_agents_http:agents_descriptor(D),
    assertion(D.operatorBridge.origin=="http://operator.localhost:18063").
test(reject_non_port_route,[setup(setenv('POWDER_OPERATOR_PORT','http://example.com')),
                          cleanup(unsetenv('POWDER_OPERATOR_PORT')),
                          throws(error(domain_error(operator_bridge_port,_),_))]) :-
    kb_agents_http:agents_descriptor(_).
:- end_tests(agents_descriptor).
