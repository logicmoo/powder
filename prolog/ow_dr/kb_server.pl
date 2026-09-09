:- module(kb_server, [start_server/1, stop_server/0]).
:- use_module(kb_paths).
:- use_module(kb_store, []).
:- use_module(kb_catalog).
:- use_module(kb_terms).
:- use_module(kb_messages).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_header)).
:- use_module(library(crypto)).
:- use_module(library(lists)).
:- use_module(library(error)).
:- dynamic server_port/1.
:- http_handler(root(api/status), endpoint(status), []).
:- http_handler(root(api/search), endpoint(search), []).
:- http_handler(root(api/predicates), endpoint(predicates), []).
:- http_handler(root(api/term), endpoint(term), []).
:- http_handler(root(api/microtheory), endpoint(microtheory), []).
:- http_handler(root(api/assertion), endpoint(assertion), []).
:- http_handler(root(api/kb/catalog), endpoint(catalog), []).
:- http_handler(root(api/kb/load), endpoint(load), [method(post)]).
:- http_handler(root(api/kb/unload), endpoint(unload), [method(post)]).
:- http_handler(root(api/query), endpoint(query), [method(post)]).
:- http_handler(root(api/source), endpoint(source), []).
:- http_handler(root(api/mappings), endpoint(mappings), []).
:- http_handler(root(api/version), endpoint(version), []).
:- http_handler(root(.), static, [prefix]).

start_server(Port) :-
    must_be(integer,Port),between(1,65535,Port),
    http_server(http_dispatch,[port('127.0.0.1':Port),workers(4)]),
    assertz(server_port(Port)).
stop_server :-
    forall(retract(server_port(Port)),http_stop_server('127.0.0.1':Port,[])).

endpoint(Name,Request) :-
    catch((valid_origin(Request),
           ( action(Name,Request,Reply) -> reply_json_dict(Reply)
           ; throw(error(domain_error(api_input,Name),_)) )),
          Error,api_error(Error)).

valid_origin(Request) :-
    ( memberchk(origin(Origin),Request) ->
      server_port(Port),
      format(atom(Local),'http://localhost:~d',[Port]),
      format(atom(IP),'http://127.0.0.1:~d',[Port]),
      (memberchk(Origin,[Local,IP])->true;throw(error(forbidden_origin,_)))
    ; true ).

api_error(Error) :-
    error_response(Error,Status,Code),
    (Error=error(compile_incomplete(Summary),_)->
      compile_report(Summary,Report),
      Payload=_{code:Code,message:Report.message,issues:Report.issues,counts:Report.counts}
    ;message_to_string(Error,Message),Payload=_{code:Code,message:Message}),
    reply_json_dict(_{error:Payload},[status(Status)]).
error_response(error(generation_conflict(_,_),_),409,generation_conflict) :- !.
error_response(error(compile_incomplete(S),_),422,compile_failed) :- S.failures>0, !.
error_response(error(compile_incomplete(_),_),503,busy) :- !.
error_response(error(permission_error(_,_,_),_),403,forbidden) :- !.
error_response(error(forbidden_origin,_),403,forbidden) :- !.
error_response(error(existence_error(_,_),_),404,not_found) :- !.
error_response(time_limit_exceeded,408,query_timeout) :- !.
error_response(error(type_error(_,_),_),400,invalid_input) :- !.
error_response(error(domain_error(_,_),_),400,invalid_input) :- !.
error_response(error(instantiation_error,_),400,invalid_input) :- !.
error_response(error(source_error(_,_,_,_),_),400,invalid_expression) :- !.
error_response(_,500,internal_error).

action(status,_,Reply) :- with_mutex(openworld_store,kb_store:status(Reply)).
action(search,Request,Reply) :-
    paging(Request,Offset,Limit),search_text(Request,Q),
    with_mutex(openworld_store,
      (kb_store:terms(All),filter_terms(Q,All,Items),
       page(Items,Offset,Limit,Reply))).
action(predicates,Request,Reply) :-
    paging(Request,Offset,Limit),search_text(Request,Q),
    with_mutex(openworld_store,
      (kb_store:predicates(All),filter_terms(Q,All,Items),
       page(Items,Offset,Limit,Reply))).
action(term,Request,Reply) :-
    http_parameters(Request,[term(Term,[atom])]),
    paging(Request,Offset,Limit),
    with_mutex(openworld_store,
      (kb_store:term_assertions(Term,Items),
       page(Items,Offset,Limit,P),Reply=P.put(term,Term))).
action(microtheory,Request,Reply) :-
    http_parameters(Request,[mt(MtKey,[atom])]),paging(Request,Offset,Limit),
    context_from_key(MtKey,Mt),term_ast(Mt,[],MtExpression),
    with_mutex(openworld_store,
      (kb_store:mt_assertions(Mt,Items),
       page(Items,Offset,Limit,P),Reply=P.put(_{mt:MtKey,mtExpression:MtExpression}))).
action(assertion,Request,Reply) :-
    http_parameters(Request,[id(Id,[atom])]),
    with_mutex(openworld_store,
      (kb_store:assertion(Id,Reply)->true;throw(error(existence_error(assertion,Id),_)))).
action(catalog,_,Reply) :- catalog(Reply).
action(load,Request,Reply) :-
    body(Request,Body),must_be(list,Body.files),must_be(integer,Body.generation),
    authorize_sources(Body.files,Paths),
    kb_store:load_sources(Paths,Body.generation,Reply).
action(unload,Request,Reply) :-
    body(Request,Body),must_be(integer,Body.generation),
    kb_store:unload_source(Body.path,Body.generation,Reply).
action(query,Request,Reply) :-
    body(Request,Body),must_be(string,Body.query),
    string_length(Body.query,N),N=<65536,
    field(Body,limit,50,Limit),field(Body,timeout,3,Seconds),
    (get_dict(mt,Body,Mt0),Mt0\=="",Mt0\==null->context_input(Mt0,Mt);true),
    must_be(integer,Limit),between(1,1000,Limit),
    must_be(number,Seconds),Seconds>0,Seconds=<30,
    with_mutex(openworld_store,kb_store:query_text(Body.query,Mt,Limit,Seconds,Reply)).
action(source,Request,Reply) :-
    http_parameters(Request,[path(Path,[atom]),line(Line,[integer,default(1)])]),
    source_excerpt(Path,Line,Reply).
action(mappings,Request,Reply) :-
    paging(Request,Offset,Limit),search_text(Request,Q),
    http_parameters(Request,[category(Category,[atom,default('')]),
      equivalence(Equivalence,[atom,default('')]),confidence(Confidence,[atom,default('')]),
      basis(Basis,[atom,default('')])]),
    kb_mappings:mapping_rows(Rows),
    include(mapping_matches(Q,Category,Equivalence,Confidence,Basis),Rows,Matches),
    maplist(mapping_links,Matches,Items),page(Items,Offset,Limit,Reply).
action(version,_,_{version:Version}) :-
    app_dir(App),directory_file_path(App,web,Web),
    directory_files(Web,Names),
    findall(Name-Hash,(member(Name,Names),web_name(Name),
      directory_file_path(Web,Name,File),crypto_file_hash(File,Hash,[algorithm(sha256)])),Files),
    directory_file_path(App,'docs/sumo-cycl-mapping.md',Mapping),
    crypto_file_hash(Mapping,MapHash,[algorithm(sha256)]),
    term_string(Files-MapHash,Text),
    crypto_data_hash(Text,Version,[algorithm(sha256)]).

body(Request,Body) :-
    (memberchk(content_length(Length),Request),Length>1048576 ->
      throw(error(domain_error(request_size,Length),_));true),
    http_read_json_dict(Request,Body),must_be(dict,Body).
field(Dict,Key,Default,Value) :- (get_dict(Key,Dict,V)->Value=V;Value=Default).
paging(Request,Offset,Limit) :-
    http_parameters(Request,[offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(50)])]),
    (Offset>=0,between(1,200,Limit)->true;throw(error(domain_error(pagination,Offset-Limit),_))).
search_text(Request,Q) :- http_parameters(Request,[q(Text,[atom,default('')])]),downcase_atom(Text,Q).
filter_terms('',All,All) :- !.
filter_terms(Q,All,Items) :- include(term_matches(Q),All,Items).
term_matches(Q,Item) :-
    (get_dict(searchKey,Item,Lower)->true;downcase_atom(Item.term,Lower)),
    sub_atom(Lower,_,_,_,Q).

page(Items,Offset,Limit,_{items:Page,total:Total,offset:Offset,limit:Limit}) :-
    length(Items,Total),
    (Offset>=Total->Page=[];
      length(Skip,Offset),append(Skip,Tail,Items),take(Limit,Tail,Page)).
take(0,_,[]) :- !.
take(_,[],[]) :- !.
take(N,[X|Xs],[X|Ys]) :- N1 is N-1,take(N1,Xs,Ys).

mapping_matches(Q,C,E,Conf,B,Row) :-
    filter_field(C,Row.category),filter_field(E,Row.equivalence),
    filter_field(Conf,Row.confidence),filter_field(B,Row.basis),
    atomic_list_concat([Row.sumo,Row.cycl,Row.conversion,Row.notes,Row.id],' ',Text),
    downcase_atom(Text,Lower),sub_atom(Lower,_,_,_,Q).
filter_field('',_) :- !.
filter_field(Filter,Value) :- atom_string(Filter,S),atom_string(Value,S).
mapping_links(Row,Result) :-
    atom_concat(x_,Row.sumo,Source),
    (kb_store:term_exists(Source)->R=Row.put(sourceTerm,Source);R=Row),
    read_term_from_atom(Row.conversion,Spec,[syntax_errors(error)]),
    mapping_target(Spec,TargetName),atom_concat(x_,TargetName,Target),
    (kb_store:term_exists(Target)->Result=R.put(targetTerm,Target);Result=R).
mapping_target(global(Spec),Target) :- !,mapping_target(Spec,Target).
mapping_target(rename(Target,_),Target).
mapping_target(template(Target,_,_,_),Target).
mapping_target(indexed_template(Target,_,_,_,_,_),Target).
mapping_target(quantifier(Target),Target).
mapping_target(predicate_application(Target,_,_),Target).

static(Request) :-
    memberchk(path(Path),Request),
    (Path=='/'->Name='index.html';atom_concat('/',Name,Path)),
    ( web_name(Name) ->
      app_dir(App),directory_file_path(App,web,Web),directory_file_path(Web,Name,File),
      asset_options(Name,MimeOptions),
      append(MimeOptions,[cache(false),unsafe(true),headers([cache_control('no-store')])],Options),
      http_reply_file(File,Options,Request)
    ; throw(http_reply(not_found(Path))) ).
web_name(Name) :-
    atom(Name),file_base_name(Name,Name),
    \+sub_atom(Name,_,_,_,'\\'),\+sub_atom(Name,_,_,_,'..'),
    file_name_extension(_,Ext,Name),memberchk(Ext,[html,css,js,mjs]).
asset_options(Name,[mime_type('application/javascript')]) :-
    file_name_extension(_,Ext,Name),memberchk(Ext,[js,mjs]), !.
asset_options(_,[]).
