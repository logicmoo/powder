:- module(kb_llm_transport,[discover_models/1,chat_completion/4,provider_json/5]).
:- use_module(kb_agent_settings).
:- use_module(kb_llm_files,[json_bytes/2]).
:- use_module(library(http/http_open)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).
:- use_module(library(error)).
:- use_module(library(time)).
:- use_module(library(utf8)).
:- use_module(library(readutil)).
:- use_module(library(uuid)).

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
    completion_headers(Config,Headers),
    % Discovery is a suggestion catalog, not an acceptance gate for explicit aliases.
    call_with_time_limit(Config.budgets.seconds,
      provider_request(post,Config.baseURL,"chat/completions",Payload,Headers,Reply)).

completion_headers(Config,Headers) :-
    (get_dict(requestId,Config,RequestId)->true;uuid(RequestId)),
    header_value(RequestId,RequestText),
    Base=[request_header('X-Request-ID'=RequestText)],
    (get_dict(conversation,Config,Conversation)->
      header_value(Conversation,Client),append(Base,[request_header('X-EmuLLM-Client-ID'=Client)],Headers);
      Headers=Base).
header_value(Value,Text) :-
    (string(Value)->Text=Value;must_be(atom,Value),atom_string(Value,Text)),
    string_length(Text,N),string_codes(Text,Codes),
    (between(1,200,N),forall(member(C,Codes),between(33,126,C))->true;
      domain_error(request_correlation_id,Value)).

provider_json(Method,Base,Route,Payload,Reply) :-
    provider_request(Method,Base,Route,Payload,[],Reply).
provider_request(Method,Base,Route,Payload,Headers,Reply) :-
    host_provider(Approved),(Base==Approved->true;permission_error(connect,llm_route,unapproved)),
    (memberchk(Method-Route,[get-"models",post-"chat/completions"])->true;
     permission_error(connect,llm_route,unsupported)),
    atomic_list_concat([Base,'/',Route],URL),
    (Method==post->json_bytes(Payload,RequestBytes),Extra=[post(bytes('application/json',RequestBytes))];Extra=[]),
    append([method(Method),bypass_proxy(true),redirect(false),timeout(120),
            status_code(Status),request_header('Accept'='application/json'),
            connection(close)|Headers],Extra,Options),
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
