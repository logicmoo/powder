:- module(llm_transport_ids_tests,[]).
:- use_module('../kb_llm_transport',[]).
:- use_module(library(plunit)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_json)).
:- dynamic observed/2.

fixture_request(Request) :-
    memberchk(path(Path),Request),
    (Path=='/v1/models'->
      assertz(observed(models,none)),
      reply_json_dict(_{data:[_{id:"gpt-5.6-sol"}]})
    ;Path=='/v1/chat/completions'->
      http_read_json_dict(Request,Body),assertz(observed(chat,Body)),
      findall(Name-Value,(member(Header,Request),compound(Header),
        compound_name_arguments(Header,Name,[Value]),sub_atom(Name,0,1,_,x)),Headers),
      assertz(observed(headers,Headers)),
      (Body.model=="openai/gpt-5.6-sol"->
        reply_json_dict(_{choices:[_{message:_{role:"assistant",content:"Synthetic accepted alias."}}]})
      ;reply_json_dict(_{error:_{code:"model_not_found",message:"Synthetic rejected model."}},[status(400)]))
    ;reply_json_dict(_{error:_{code:"not_found"}},[status(404)])).

setup_fixture(state(Port,Old),Config) :-
    (getenv('POWDER_LLM_BASE_URL',Old)->true;Old=absent),
    retractall(observed(_,_)),
    http_server(llm_transport_ids_tests:fixture_request,[port('127.0.0.1':Port),workers(1)]),
    format(atom(Base),'http://127.0.0.1:~d/v1',[Port]),
    setenv('POWDER_LLM_BASE_URL',Base),atom_string(Base,Text),
    Config=_{baseURL:Text,model:"openai/gpt-5.6-sol",budgets:_{seconds:5,tokens:16}}.
cleanup_fixture(state(Port,Old)) :-
    http_stop_server('127.0.0.1':Port,[]),
    (Old==absent->unsetenv('POWDER_LLM_BASE_URL');setenv('POWDER_LLM_BASE_URL',Old)).

:- begin_tests(llm_explicit_transport).
test(unlisted_alias_is_sent_exactly_once_without_discovery,
     [setup(setup_fixture(State,Config)),cleanup(cleanup_fixture(State))]) :-
    kb_llm_transport:chat_completion(Config,
      [_{role:"user",content:"Synthetic fixture input."}],[],Reply),
    assertion(Reply.choices\=[]),
    findall(Model,(observed(chat,Body),Model=Body.model),Models),
    assertion(Models==["openai/gpt-5.6-sol"]),
    assertion(\+observed(models,_)),
    observed(chat,Sent),assertion(Sent.stream==false).
test(provider_rejection_never_renames_or_retries,
     [setup(setup_fixture(State,Config)),cleanup(cleanup_fixture(State))]) :-
    catch(kb_llm_transport:chat_completion(Config.put(model,"fixture-unknown"),
      [_{role:"user",content:"Synthetic rejected request."}],[],_),Error,true),
    assertion(Error=error(llm_http_status(400),_)),
    findall(Model,(observed(chat,Body),Model=Body.model),Models),
    assertion(Models==["fixture-unknown"]),
    assertion(\+observed(models,_)).
test(knowledge_requests_use_the_same_exact_alias_transport,
     [setup(setup_fixture(State,Config)),cleanup(cleanup_fixture(State))]) :-
    Tools=[_{type:"function",function:_{name:"fixture_lookup",
      parameters:_{type:"object",properties:_{},additionalProperties:false}}}],
    kb_llm_transport:chat_completion(Config,
      [_{role:"user",content:"Synthetic approved fixture context."}],Tools,_),
    observed(chat,Sent),assertion(Sent.model=="openai/gpt-5.6-sol"),
    assertion(Sent.tools\=[]),assertion(\+observed(models,_)).
test(correlation_headers_do_not_change_model_or_add_preflight,
     [setup(setup_fixture(State,Config)),cleanup(cleanup_fixture(State))]) :-
    kb_llm_transport:chat_completion(Config.put(_{requestId:"fixture-request-1",conversation:"fixture-conversation-1"}),
      [_{role:"user",content:"Synthetic correlation fixture."}],[],_),
    observed(headers,Headers),
    assertion(member(x_request_id-'fixture-request-1',Headers)),
    assertion(member(x_emullm_client_id-'fixture-conversation-1',Headers)),
    observed(chat,Sent),assertion(Sent.model=="openai/gpt-5.6-sol"),
    assertion(\+observed(models,_)).
:- end_tests(llm_explicit_transport).
