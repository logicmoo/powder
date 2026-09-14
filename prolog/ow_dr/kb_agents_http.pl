:- module(kb_agents_http,[agents_descriptor/1]).
:- use_module(kb_urls,[]).
:- use_module(kb_llm_http,[]).
:- use_module(library(http/http_dispatch)).
:- use_module(library(error)).

:- http_handler(openworld_dr(api/agents),agents_endpoint,[method(get)]).

agents_endpoint(Request) :-
    catch((kb_llm_http:authorize(Request),agents_descriptor(Reply),
           kb_llm_http:respond(200,Reply)),
          Error,kb_llm_http:llm_error(Error)).

agents_descriptor(Reply) :-
    operator_port(Port),
    format(string(Origin),'http://operator.localhost:~d',[Port]),
    string_concat(Origin,'/',Recovery),
    Reply=_{schema:"powder.agents.v1",modality:"text",
      agents:[
        _{id:"teacher",name:"Teacher",type:"llm",provider:"emullm",api:"llm",
          providerChecked:false},
        _{id:"cyc",name:"Cyc",type:"symbolic",api:"symbolic",llmAllowed:false},
        _{id:"copilot",name:"Copilot",type:"operator",provider:"copilot"},
        _{id:"codex",name:"Codex",type:"operator",provider:"codex"}],
      operatorBridge:_{origin:Origin,embedPath:"/embed",recoveryURL:Recovery,
        authentication:"isolated operator origin",autoStart:false}}.

operator_port(Port) :-
    (getenv('POWDER_OPERATOR_PORT',Text),Text\==''->
      (catch(atom_number(Text,Value),_,fail),integer(Value),between(1024,65535,Value)->
        Port=Value;domain_error(operator_bridge_port,Text))
    ;Port=8063).
