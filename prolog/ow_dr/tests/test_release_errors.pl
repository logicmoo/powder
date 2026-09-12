:- begin_tests(release_errors).
:- use_module('../kb_server',[]).

test(missing_backend_procedure_is_not_a_missing_user_record) :-
    kb_server:error_response(error(existence_error(procedure,kb_activity:synchronize/1),_),
      Status,Code),
    assertion(Status==500),assertion(Code==internal_error).
test(missing_assertion_remains_a_real_resource_404) :-
    kb_server:error_response(error(existence_error(assertion,a123),_),Status,Code),
    assertion(Status==404),assertion(Code==not_found).

:- end_tests(release_errors).
