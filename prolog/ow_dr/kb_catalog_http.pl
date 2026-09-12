:- module(kb_catalog_http,[]).
:- use_module(kb_catalog_query).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).

:- http_handler(openworld_dr(api/catalog/status),catalog_endpoint(status),[method(get)]).
:- http_handler(openworld_dr(api/catalog/search),catalog_endpoint(search),[method(get)]).
:- http_handler(openworld_dr(api/catalog/term),catalog_endpoint(term),[method(get)]).
:- http_handler(openworld_dr(api/catalog/assertion),catalog_endpoint(assertion),[method(get)]).
:- http_handler(openworld_dr(api/catalog/cancel),catalog_endpoint(cancel),[method(post)]).

catalog_endpoint(Name,Request) :-
    catch((kb_server:valid_origin(Request),
           (catalog_action(Name,Request,Reply)->true;throw(error(catalog_read_failed,_))),
           reply_json_dict(Reply)),Error,catalog_error(Error)).
catalog_error(error(catalog_stale(Reason),_)) :- !,
    term_string(Reason,Text),
    reply_json_dict(json{error:json{code:catalog_stale,message:Text}},[status(409)]).
catalog_error(Error) :- kb_server:api_error(Error).
catalog_action(status,_,Reply) :- catalog_query_status(Reply).
catalog_action(cancel,Request,Reply) :-
    kb_server:native_body(Request,[phase,runId],Body),
    kb_catalog_index:request_catalog_cancel(Body.phase,Body.runId,Reply).
catalog_action(search,Request,Reply) :-
    http_parameters(Request,[q(Query,[atom,default('')]),scope(Scope,[atom,default(all)]),
      group(Group,[atom,default(all)]),offset(Offset,[integer,default(0)]),
      limit(Limit,[integer,default(25)])]),
    catalog_query_search(json{q:Query,scope:Scope,group:Group,offset:Offset,limit:Limit},Reply).
catalog_action(term,Request,Reply) :-
    http_parameters(Request,[term(Term,[atom]),scope(Scope,[atom,default(all)]),
      facet(Facet,[atom,default(definition)]),source(Source,[atom,default('')]),
      mt(Mt,[atom,default('')]),offset(Offset,[integer,default(0)]),
      limit(Limit,[integer,default(25)])]),
    catalog_query_term(json{term:Term,scope:Scope,facet:Facet,source:Source,mt:Mt,
      offset:Offset,limit:Limit},Reply).
catalog_action(assertion,Request,Reply) :-
    http_parameters(Request,[term(Term,[atom]),source(Source,[atom]),id(Id,[atom])]),
    catalog_query_assertion(Term,Source,Id,Reply).
