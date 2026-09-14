:- module(kb_llm_http,[llm_endpoint/2]).
:- use_module(kb_urls,[]).
:- use_module(kb_agent_settings).
:- use_module(kb_llm_prompt).
:- use_module(kb_llm_transport).
:- use_module(kb_llm_agent).
:- use_module(kb_llm_kee).
:- use_module(kb_kee_schema,[json_text/2]).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(library(time)).

:- http_handler(openworld_dr(api/llm/settings),llm_endpoint(settings),[method(get)]).
:- http_handler(openworld_dr(api/llm/settings/save),llm_endpoint(settings_save),[method(post)]).
:- http_handler(openworld_dr(api/llm/models),llm_endpoint(models),[method(get)]).
:- http_handler(openworld_dr(api/llm/prompt),llm_endpoint(prompt),[method(get)]).
:- http_handler(openworld_dr(api/llm/prompt/save),llm_endpoint(prompt_save),[method(post)]).
:- http_handler(openworld_dr(api/llm/registry),llm_endpoint(registry),[method(get)]).
:- http_handler(openworld_dr(api/llm/grounding/preview),llm_endpoint(grounding_preview),[method(post)]).
:- http_handler(openworld_dr(api/llm/grounding/approve),llm_endpoint(grounding_approve),[method(post)]).
:- http_handler(openworld_dr(api/llm/todos),llm_endpoint(todos),[method(get)]).
:- http_handler(openworld_dr(api/llm/receipt),llm_endpoint(receipt),[method(get)]).
:- http_handler(openworld_dr(api/llm/start),llm_endpoint(start),[method(post)]).
:- http_handler(openworld_dr(api/llm/conversation),llm_endpoint(conversation),[method(get)]).
:- http_handler(openworld_dr(api/llm/conversations),llm_endpoint(conversations),[method(get)]).
:- http_handler(openworld_dr(api/llm/todos/undo),llm_endpoint(todo_undo),[method(post)]).
:- http_handler(openworld_dr(api/llm/chat),llm_endpoint(chat),[method(post)]).
:- http_handler(openworld_dr(api/llm/queue/enqueue),llm_endpoint(queue_enqueue),[method(post)]).
:- http_handler(openworld_dr(api/llm/queue/resume),llm_endpoint(queue_resume),[method(post)]).
:- http_handler(openworld_dr(api/llm/queue/cancel),llm_endpoint(queue_cancel),[method(post)]).
:- http_handler(openworld_dr(api/llm/fork),llm_endpoint(fork),[method(post)]).
:- http_handler(openworld_dr(api/llm/interrupt),llm_endpoint(interrupt),[method(post)]).
:- http_handler(openworld_dr(api/llm/stop),llm_endpoint(stop),[method(post)]).

llm_endpoint(Action,Request) :-
    catch((authorize(Request),
           (once(action(Action,Request,Reply))->respond(200,Reply);throw(error(llm_invalid_request,_)))),
          Error,llm_error(Error)).
authorize(Request) :-
    memberchk(peer(ip(127,0,0,1)),Request),
    findall(Origin,member(origin(Origin),Request),Origins),
    (Origins\=[]->Origins=[Only],owned_origin(Only);
     memberchk(method(get),Request),memberchk(referer(Referer),Request),
     kb_server:server_port(Port),member(Host,[localhost,'127.0.0.1']),
     format(atom(Prefix),'http://~w:~d/',[Host,Port]),sub_atom(Referer,0,_,_,Prefix)),!.
authorize(_) :- throw(error(llm_forbidden,_)).
owned_origin(Origin) :-
    kb_server:server_port(Port),member(Host,[localhost,'127.0.0.1']),
    format(atom(Expected),'http://~w:~d',[Host,Port]),Origin==Expected,!.
body(Request,Body) :-
    \+memberchk(transfer_encoding(_),Request),
    memberchk(content_length(N),Request),integer(N),between(1,100000,N),!,
    call_with_time_limit(5,http_read_json_dict(Request,Body)).
body(_,_) :- throw(error(llm_invalid_body,_)).
action(settings,_,Reply) :- agent_settings(Reply).
action(settings_save,R,Reply) :-
    body(R,B),strict_keys(B,[revision,settings]),save_agent_settings(B.settings,B.revision,Reply).
action(models,_,Reply) :- discover_models(Reply).
action(prompt,_,Reply) :- prompt_document(Reply).
action(prompt_save,R,Reply) :-
    body(R,B),strict_keys(B,[content,revision]),save_prompt_document(B.content,B.revision,Reply).
action(registry,_,Reply) :- registry_status(Reply).
action(grounding_preview,R,Reply) :- body(R,B),preview_grounding(B,Reply).
action(grounding_approve,R,Reply) :- body(R,B),approve_grounding(B,Reply).
action(todos,R,Reply) :- http_parameters(R,[id(Id,[atom])]),local_todos(Id,Reply).
action(receipt,R,Reply) :-
    http_parameters(R,[id(Id,[atom]),callId(CallId,[string])]),local_receipt(Id,CallId,Reply).
action(start,R,Reply) :-
    body(R,B),strict_keys(B,[scope]),start_conversation(B.scope,Reply).
action(conversation,R,Reply) :-
    http_parameters(R,[id(Id,[atom])]),conversation(Id,Reply).
action(conversations,R,Reply) :-
    http_parameters(R,[offset(Offset,[integer,default(0),between(0,100000)]),
                       limit(Limit,[integer,default(25),between(1,50)])]),
    list_conversations(Offset,Limit,Reply).
action(todo_undo,R,Reply) :- body(R,B),undo_todo(B,Reply).
action(chat,R,Reply) :- body(R,B),start_chat(B,Reply).
action(queue_enqueue,R,Reply) :- body(R,B),enqueue_chat(B,Reply).
action(queue_resume,R,Reply) :- body(R,B),resume_queue(B,Reply).
action(queue_cancel,R,Reply) :- body(R,B),cancel_queued(B,Reply).
action(fork,R,Reply) :- body(R,B),fork_conversation(B,Reply).
action(interrupt,R,Reply) :- body(R,B),strict_keys(B,[id]),interrupt_chat(B.id,Reply).
action(stop,R,Reply) :- body(R,B),strict_keys(B,[id]),stop_conversation(B.id,Reply).
respond(Status,Reply) :-
    json_text(Reply,Text),
    format('Status: ~d~nCache-Control: no-store~nContent-Type: application/json; charset=UTF-8~n~n~s',
           [Status,Text]).
llm_error(Error) :-
    (Error=error(llm_forbidden,_)->Status=403;
     Error=error(agent_conversation_conflict,_)->Status=409;
     Error=error(agent_settings_conflict,_)->Status=409;
     Error=error(agent_prompt_conflict,_)->Status=409;
     Error=error(agent_conversation_busy,_)->Status=409;
     Error=error(llm_queue_call_conflict,_)->Status=409;
     Error=error(llm_queue_requires_active_turn,_)->Status=409;
     Error=error(llm_queue_resume_blocked,_)->Status=409;
     Error=error(llm_queue_item_started,_)->Status=409;
     Error=error(llm_queue_pending,_)->Status=409;
     Error=error(llm_fork_parent_busy_or_unknown,_)->Status=409;
     Error=error(llm_http_status(_),_)->Status=502;
     Error=error(llm_route_failed,_)->Status=502;
     Status=400),
    kb_llm_agent:safe_error(Error,Safe),respond(Status,_{error:Safe}).
