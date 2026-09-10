:- begin_tests(full_prolog_console).
:- use_module('../kb_prolog').
:- use_module('../kb_server',[]).
:- use_module('../kb_questions').
:- use_module('../kb_store').
:- use_module(library(filesex)).
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(socket)).

test(bindings_and_both_output_streams) :-
    run_prolog("write('hello'), format(user_error, 'warning', []), member(X, [a,b]).",_,10,3,Result),
    assertion(Result.status==success),assertion(Result.output=="hellowarning"),
    assertion(Result.errorOutput==""),
    assertion(Result.solutions=[_{bindings:[_{name:'X',value:"a"}]},_{bindings:[_{name:'X',value:"b"}]}]).

test(side_effect_is_not_repeated_for_counting) :-
    flag(powder_test_counter,_,0),
    run_prolog("flag(powder_test_counter, N, N+1), member(X, [a,b,c]).",_,2,3,Result),
    flag(powder_test_counter,Count,Count),assertion(Count=:=1),
    assertion(Result.status==limit),assertion(length(Result.solutions,2)).

test(side_effects_survive_failure_and_unqualified_assertions_persist) :-
    run_prolog("assertz(saved_console_value(example)), fail.",_,10,3,First),
    assertion(First.status==failure),
    run_prolog("retract(saved_console_value(X)).",_,10,3,Second),
    assertion(Second.solutions=[_{bindings:[_{name:'X',value:"example"}]}]).

test(exception_retains_prior_output_and_solutions) :-
    run_prolog("write(before), (X=a; throw(test_exception)).",_,10,3,Result),
    assertion(Result.status==exception),assertion(Result.output=="before"),
    assertion(Result.solutions=[_{bindings:[_{name:'X',value:"a"}]}]),
    assertion(Result.exception.term=="test_exception").

test(timeout_does_not_become_success) :-
    run_prolog("repeat, fail.",_,10,0.02,Result),
    assertion(Result.status==timeout),assertion(Result.exception.term=="time_limit_exceeded").

test(named_variables_and_cyclic_binding) :-
    run_prolog("X = f(X).",_,1,3,Result),
    assertion(Result.status==limit),Result.solutions=[S],
    S.bindings=[Binding],assertion(Binding.name=='X'),assertion(string(Binding.value)).

test(local_authorization_rejects_remote_and_rebinding,
     [throws(error(permission_error(execute,prolog_query,untrusted_origin),_))]) :-
    kb_server:trusted_local_request([peer(ip(192,0,2,1)),host(localhost),port(3050)]).
test(local_authorization_requires_exact_host_and_same_origin) :-
    setup_call_cleanup(assertz(kb_server:server_port(3050),Ref),
      (kb_server:trusted_local_request([peer(ip(127,0,0,1)),host(localhost),port(3050),sec_fetch_site('same-origin')]),
       catch(kb_server:trusted_local_request([peer(ip(127,0,0,1)),host('attacker.example'),port(3050)]),Error,true),
       assertion(nonvar(Error)),
       catch(kb_server:trusted_local_request([peer(ip(127,0,0,1)),host(localhost),port(3050),sec_fetch_site('cross-site')]),Cross,true),
       assertion(nonvar(Cross))),
      erase(Ref)).

console_fixture(Directory,Source) :-
    tmp_file(powder_console_kb,Directory),make_directory(Directory),
    directory_file_path(Directory,'questions.krf',Source),
    setup_call_cleanup(open(Source,write,Stream),
      format(Stream,'(in-microtheory (TestMtFn Test))~n(p A)~n(test_Qs "T1" "Which item?" (and (p ?X) (p ?X)))~n',[]),close(Stream)),
    load_sources([Source],any,_).
cleanup_console_fixture(Directory,Source) :-
    generation(G),unload_source(Source,G,_),delete_directory_and_contents(Directory).

test(kb_bridges_and_actual_question_schema,
     [setup(console_fixture(D,S)),cleanup(cleanup_console_fixture(D,S))]) :-
    Mt=x_TestMtFn(x_Test),
    run_prolog("x_p(X).",Mt,10,3,Result),
    assertion(Result.solutions=[_{bindings:[_{name:'X',value:"x_A"}]}]),
    run_prolog("x_p(X).",_,10,3,NoContext),
    assertion(NoContext.status==exception),
    stored_questions([Question]),
    assertion(Question.identifier=="T1"),assertion(Question.question=="Which item?"),
    assertion(Question.variables=[_{prolog:'V1',source:"?X"}]),
    assertion(Question.mtExpression.head.value==x_TestMtFn),
    run_prolog(Question.prolog,Mt,10,3,Answer),
    assertion(Answer.solutions=[_{bindings:[_{name:'V1',value:"x_A"}]}]).

test(question_selection_serialization_is_inert) :-
    flag(powder_question_not_executed,_,0),
    question_prolog(x_flag(x_powder_question_not_executed,X,1),Text,Names),
    assertion(var(X)),assertion(Names=['V1'=_]),
    assertion(sub_string(Text,_,_,_,"x_flag")),
    flag(powder_question_not_executed,Value,Value),assertion(Value=:=0).

test(real_http_requires_token_and_captures_output) :-
    tcp_socket(Socket),tcp_bind(Socket,'127.0.0.1':Port),tcp_close_socket(Socket),
    setup_call_cleanup(kb_server:start_server(Port),
      (kb_urls:api_path('prolog/access',AccessPath),kb_urls:api_path('prolog/query',QueryPath),
       format(atom(AccessURL),'http://127.0.0.1:~d~w',[Port,AccessPath]),
       format(atom(QueryURL),'http://127.0.0.1:~d~w',[Port,QueryPath]),
       http_get(AccessURL,Access,[json_object(dict)]),
       http_post(QueryURL,json(_{query:"write(visible), X=ok.",limit:2,timeout:3}),Denied,
         [json_object(dict),status_code(DeniedStatus)]),
       assertion(DeniedStatus=:=403),assertion(Denied.error.code=="forbidden"),
       http_post(QueryURL,json(_{query:"write(visible), X=ok.",limit:2,timeout:3}),Reply,
         [request_header('X-Powder-Local-Token'=Access.token),json_object(dict),status_code(Status)]),
       assertion(Status=:=200),assertion(Reply.output=="visible"),
       assertion(Reply.status=="success")),
      kb_server:stop_server).
:- end_tests(full_prolog_console).
