:- module(kb_llm_transport,[discover_models/1,chat_completion/4,provider_json/5]).
:- use_module(kb_agent_settings).
:- use_module(library(http/http_open)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).
:- use_module(library(error)).
:- use_module(library(time)).
:- use_module(library(utf8)).
:- use_module(library(readutil)).

discover_models(Reply) :-
    agent_settings(Settings),
    call_with_time_limit(8,provider_json(get,Settings.baseURL,"models",none,Data)),
    (is_dict(Data),get_dict(data,Data,Rows),is_list(Rows),length(Rows,N),N=<2000->true;
     throw(error(llm_invalid_model_catalog,_))),
    findall(Id,(member(Row,Rows),is_dict(Row),get_dict(id,Row,Id),
                catch(validate_model(Id),_,fail)),Ids0),
    sort(Ids0,Ids),
    (memberchk(Settings.model,Ids)->Available=true;Available=false),
    Reply=_{items:Ids,selected:Settings.model,selectedAvailable:Available,
            baseURL:Settings.baseURL,notice:Settings.notice,source:"GET /v1/models"}.

chat_completion(Config,Messages,Tools,Reply) :-
    validate_model(Config.model),must_be(list,Messages),must_be(list,Tools),
    Payload0=_{model:Config.model,messages:Messages,stream:false,
               max_tokens:Config.budgets.tokens},
    (Tools==[]->Payload=Payload0;Payload=Payload0.put(tools,Tools)),
    call_with_time_limit(Config.budgets.seconds,
      provider_json(post,Config.baseURL,"chat/completions",Payload,Reply)).

provider_json(Method,Base,Route,Payload,Reply) :-
    host_provider(Approved),(Base==Approved->true;permission_error(connect,llm_route,unapproved)),
    (memberchk(Method-Route,[get-"models",post-"chat/completions"])->true;
     permission_error(connect,llm_route,unsupported)),
    atomic_list_concat([Base,'/',Route],URL),
    (Method==post->Extra=[post(json(Payload))];Extra=[]),
    append([method(Method),bypass_proxy(true),redirect(false),timeout(120),
            status_code(Status),request_header('Accept'='application/json'),
            connection(close)],Extra,Options),
    catch(call_with_time_limit(120,
      setup_call_cleanup(http_open(URL,Stream,Options),
        (set_stream(Stream,encoding(octet)),
         read_string(Stream,1048577,Raw),string_length(Raw,Size),
         (Size=<1048576->true;resource_error(llm_response_limit)),
         (Status>=200,Status<300->true;throw(error(llm_http_status(Status),_))),
         string_codes(Raw,Bytes),
         (phrase(utf8_codes(Codes),Bytes)->string_codes(Text,Codes);
          throw(error(llm_invalid_utf8,_))),
         atom_json_dict(Text,Reply,[])),
        close(Stream))),
      Error,transport_error(Error)).
transport_error(error(llm_http_status(Status),_)) :- !,throw(error(llm_http_status(Status),_)).
transport_error(error(resource_error(llm_response_limit),_)) :- !,resource_error(llm_response_limit).
transport_error(llm_cancelled) :- !,throw(llm_cancelled).
transport_error(time_limit_exceeded) :- !,throw(time_limit_exceeded).
transport_error(_) :- throw(error(llm_route_failed,_)).
