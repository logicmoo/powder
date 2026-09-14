:- module(kb_symbolic_agent_http,[symbolic_endpoint/2]).
:- use_module(kb_urls,[]).
:- use_module(kb_llm_http,[]).
:- use_module(kb_symbolic_agent_host,[]).
:- use_module(kb_symbolic_agent_kee,[]).
:- use_module(kb_kee_schema,[]).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(time)).

:- http_handler(openworld_dr(api/symbolic/status),symbolic_endpoint(status),[method(get)]).
:- http_handler(openworld_dr(api/symbolic/'request-status'),symbolic_endpoint(request_status),[method(get)]).
:- http_handler(openworld_dr(api/symbolic/start),symbolic_endpoint(start),[method(post)]).
:- http_handler(openworld_dr(api/symbolic/fork),symbolic_endpoint(fork),[method(post)]).
:- http_handler(openworld_dr(api/symbolic/conversation),symbolic_endpoint(conversation),[method(get)]).
:- http_handler(openworld_dr(api/symbolic/send),symbolic_endpoint(send),[method(post)]).
:- http_handler(openworld_dr(api/symbolic/continue),symbolic_endpoint(continue),[method(post)]).
:- http_handler(openworld_dr(api/symbolic/interrupt),symbolic_endpoint(interrupt),[method(post)]).
:- http_handler(openworld_dr(api/symbolic/resume),symbolic_endpoint(resume),[method(post)]).
:- http_handler(openworld_dr(api/symbolic/stop),symbolic_endpoint(stop),[method(post)]).
:- http_handler(openworld_dr(api/symbolic/form),symbolic_endpoint(form),[method(post)]).
:- http_handler(openworld_dr(api/symbolic/todos),symbolic_endpoint(todos),[method(get)]).
:- http_handler(openworld_dr(api/symbolic/audit),symbolic_endpoint(audit),[method(get)]).
:- http_handler(openworld_dr(api/symbolic/receipt),symbolic_endpoint(receipt),[method(get)]).

symbolic_endpoint(Action,Request) :-
    catch((kb_llm_http:authorize(Request),arguments(Action,Request,Args),
      (once(kb_symbolic_agent_host:request(Action,Args,Raw))->true;
        throw(error(symbolic_invalid_request,_))),
      respond(200,Raw)),Error,report_error(Error)).
arguments(status,_,json{}) :- !.
arguments(request_status,R,json{conversation:Conversation,callId:CallId}) :- !,
    http_parameters(R,[conversation(Conversation,[string]),callId(CallId,[string])]).
arguments(Action,R,Args) :-
    memberchk(Action,[conversation,todos,audit,receipt]),!,
    http_parameters(R,[id(Id,[string]),conversation(Conversation,[string]),
      offset(Offset,[integer,optional(true)]),limit(Limit,[integer,default(50)]),
      actionCallId(CallId,[string,optional(true)])]),
    (Action==receipt->Args=json{id:Id,conversation:Conversation,actionCallId:CallId};
      Base=json{id:Id,conversation:Conversation,limit:Limit},
      (nonvar(Offset)->Args=Base.put(offset,Offset);Args=Base)).
arguments(_,R,Body) :-
    (\+memberchk(transfer_encoding(_),R),
     memberchk(content_length(N),R),integer(N),between(1,65536,N)->true;
       throw(error(symbolic_invalid_body,_))),
    call_with_time_limit(5,http_read_json_dict(R,Body)).
respond(Status,Raw) :-
    kb_symbolic_agent_kee:canonical_json(Raw,Reply),kb_kee_schema:json_text(Reply,Text),
    format('Status: ~d~nCache-Control: no-store~nContent-Type: application/json; charset=UTF-8~n~n~s',
      [Status,Text]).
report_error(error(symbolic_form_invalid(length(Field,Min,Max)),_)) :- !,
    format(string(Message),'~s must contain ~d–~d characters. The form remains editable; nothing was dispatched by this request.',
      [Field,Min,Max]),
    respond(422,json{error:json{code:"symbolic_form_invalid",message:Message,
      field:Field,minLength:Min,maxLength:Max}}).
report_error(error(symbolic_action_not_dispatched(Cause),_)) :- !,
    message_to_string(Cause,Detail),
    string_concat("Action was not dispatched. ",Detail,Message),
    (Cause=error(kee(Code,Details),_)->Underlying=json{code:Code,details:Details};
      Underlying=json{message:Detail}),
    respond(422,json{error:json{code:"symbolic_action_not_dispatched",message:Message,
      cause:Underlying,dispatched:false}}).
report_error(error(symbolic_fork_outcome_unknown(_),_)) :- !,
    respond(500,json{error:json{code:"symbolic_fork_outcome_unknown",
     message:"The branch request may have committed. Inspect its saved request receipt; do not replay it."}}).
report_error(Error) :-
    error_status(Error,Status,Code),message_to_string(Error,Message),
    respond(Status,json{error:json{code:Code,message:Message}}).
error_status(error(symbolic_form_invalid(_),_),422,"symbolic_form_invalid") :- !.
error_status(error(symbolic_action_not_dispatched(_),_),422,"symbolic_action_not_dispatched") :- !.
error_status(error(llm_forbidden,_),403,"symbolic_forbidden") :- !.
error_status(error(symbolic_conflict(_),_),409,"symbolic_conflict") :- !.
error_status(error(symbolic_fork_unsafe(_),_),409,"symbolic_fork_unsafe") :- !.
error_status(error(symbolic_fork_outcome_unknown(_),_),500,"symbolic_fork_outcome_unknown") :- !.
error_status(error(symbolic_fork_authority_mismatch,_),403,"symbolic_fork_authority_mismatch") :- !.
error_status(error(symbolic_fork_parent_conflict,_),409,"symbolic_fork_parent_conflict") :- !.
error_status(error(symbolic_fork_conversation_exists,_),409,"symbolic_fork_conversation_exists") :- !.
error_status(error(symbolic_fork_request_conflict,_),409,"symbolic_fork_request_conflict") :- !.
error_status(error(symbolic_fork_history_unavailable,_),409,"symbolic_fork_history_unavailable") :- !.
error_status(error(symbolic_outcome_unknown_inspect_receipt,_),409,"symbolic_outcome_unknown") :- !.
error_status(error(kee(Code,_),_),409,Code) :- !.
error_status(error(symbolic_snapshot_definition_unavailable,_),422,"knowledge_unavailable") :- !.
error_status(error(symbolic_configuration_missing(_),_),422,"knowledge_unavailable") :- !.
error_status(_,400,"symbolic_request_failed").
