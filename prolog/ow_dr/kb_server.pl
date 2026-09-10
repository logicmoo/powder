:- module(kb_server, [start_server/1, start_server/2, stop_server/0, queue_startup/3]).
:- use_module(kb_paths).
:- use_module(kb_store, []).
:- use_module(kb_catalog).
:- use_module(kb_terms).
:- use_module(kb_messages).
:- use_module(kb_limits).
:- use_module(kb_reload).
:- use_module(kb_prolog).
:- use_module(kb_questions).
:- use_module(kb_urls).
:- use_module(kb_config).
:- use_module(kb_jobs).
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
:- dynamic prolog_access_token/1.
:- dynamic startup_task/1, startup_config_error/1.
:- dynamic registered_route/1.

api_route(status,status,[]).
api_route(search,search,[]).
api_route(predicates,predicates,[]).
api_route(term,term,[]).
api_route(microtheory,microtheory,[]).
api_route(microtheories,microtheories,[]).
api_route(assertion,assertion,[]).
api_route('kb/catalog',catalog,[]).
api_route('kb/load',load,[method(post)]).
api_route('kb/unload',unload,[method(post)]).
api_route(query,query,[method(post)]).
api_route(source,source,[]).
api_route(mappings,mappings,[]).
api_route(version,version,[]).
api_route('app/reload',reload_application,[method(post)]).
api_route('prolog/access',prolog_access,[]).
api_route('prolog/query',prolog_query,[method(post)]).
api_route('test-questions',test_questions,[]).
api_route('server/settings',server_settings,[]).
api_route('server/settings/save',save_server_settings,[method(post)]).
api_route(tasks,tasks,[]).
api_route('tasks/detail',task_detail,[]).
api_route('tasks/cancel',cancel_task,[method(post)]).

register_routes :-
    forall(retract(registered_route(Path)),http_delete_handler(Path)),
    forall(api_route(Name,Action,Options),
      (api_path(Name,Path),register_route(Path,endpoint(Action),Options))),
    api_base(API),register_route(API,unknown_api,[prefix]),
    app_base(Base),register_route(Base,static,[prefix]),
    app_mount(Mount),register_route(Mount,canonical_mount,[]).
register_route(Path,Handler,Options) :-
    http_handler(Path,Handler,Options),assertz(registered_route(Path)).
:- initialization(register_routes).

canonical_mount(Request) :- app_base(Base),http_redirect(moved,Base,Request).
unknown_api(Request) :-
    memberchk(path(Path),Request),
    reply_json_dict(_{error:_{code:not_found,message:"Unknown powder API route",path:Path}},[status(404)]).

start_server(Port) :-
    effective_server_settings(Settings),
    start_server(Port,Settings).
start_server(Port,Settings) :-
    must_be(integer,Port),between(1,65535,Port),
    start_pools(Settings),
    http_server(http_dispatch,[port('127.0.0.1':Port),workers(Settings.pools.http.start)]),
    attach_http(Port,Settings.pools.http),
    assertz(server_port(Port)).
stop_server :-
    forall(retract(server_port(Port)),
      (detach_http(Port),http_stop_server(Port,[]))),
    stop_pools,retractall(startup_task(_)),retractall(startup_config_error(_)).

queue_startup(Explicit,Settings,Task) :-
    startup_selection(Explicit,Settings,Sources),retractall(startup_task(_)),
    (Sources=[]->Task=_{accepted:false}
    ;submit_load(Sources,any,Task),assertz(startup_task(Task.jobId))).

effective_server_settings(Settings) :-
    catch(server_settings(Settings),Error,
      (message_to_string(Error,Message),retractall(startup_config_error(_)),
       print_message(error,Error),
       assertz(startup_config_error(Message)),server_defaults(Default),
       kb_config:settings_file(File),(exists_file(File)->kb_cache:file_digest(File,Revision);Revision=none),
       Settings=Default.put(_{startupConfigured:true,startupFiles:[],revision:Revision,issues:[_{message:Message}]}))).

endpoint(Name,Request) :-
    catch((valid_origin(Request),
           ( action(Name,Request,Reply) -> reply_api(Name,Reply)
           ; throw(error(domain_error(api_input,Name),_)) )),
          Error,api_error(Error)).

reply_api(_,Reply) :-
    get_dict(accepted,Reply,true),!,reply_json_dict(Reply,[status(202)]).
reply_api(prolog_query,Reply) :-
    memberchk(Reply.status,[exception,timeout]),!,
    (Reply.status==timeout->Status=408,Code=prolog_timeout;Status=422,Code=prolog_exception),
    reply_json_dict(_{error:_{code:Code,message:Reply.exception.message,execution:Reply}},[status(Status)]).
reply_api(_,Reply) :- reply_json_dict(Reply).

valid_origin(Request) :-
    ( memberchk(origin(Origin),Request) ->
      server_port(Port),
      format(atom(Local),'http://localhost:~d',[Port]),
      format(atom(IP),'http://127.0.0.1:~d',[Port]),
      (memberchk(Origin,[Local,IP])->true;throw(error(forbidden_origin,_)))
    ; true ).

api_error(Error) :-
    error_response(Error,Status,Code),
    (Error=error(application_reload_failed(Report),_),is_dict(Report)->
      Payload=_{code:Code,message:Report.message,issues:Report.issues}
    ;Error=error(compile_incomplete(Summary),_)->
      compile_report(Summary,Report),
      Payload=_{code:Code,message:Report.message,issues:Report.issues,counts:Report.counts}
    ;message_to_string(Error,Message),Payload=_{code:Code,message:Message}),
    reply_json_dict(_{error:Payload},[status(Status)]).
error_response(error(generation_conflict(_,_),_),409,generation_conflict) :- !.
error_response(error(application_reload_busy,_),409,reload_busy) :- !.
error_response(error(server_settings_conflict,_),409,settings_conflict) :- !.
error_response(error(server_settings_busy,_),409,settings_busy) :- !.
error_response(error(task_queue_full(_),_),429,queue_full) :- !.
error_response(error(task_pools_require_startup,_),503,restart_required) :- !.
error_response(error(application_reload_failed(_),_),500,application_reload_failed) :- !.
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
error_response(error(syntax_error(_),_),400,invalid_prolog_syntax) :- !.
error_response(_,500,internal_error).

action(status,_,Reply) :-
    with_mutex(openworld_store,kb_store:status(Status)),
    (startup_task(Id),catch(job_status(Id,Task),error(existence_error(task,_),_),fail)->
      Reply=Status.put(startup,Task)
    ;startup_config_error(Message)->Reply=Status.put(startup,_{state:failed,error:_{message:Message}})
    ;Reply=Status).
action(reload_application,Request,Reply) :-
    body(Request,Body),
    (dict_pairs(Body,_,[])->true;throw(error(domain_error(empty_reload_request,Body),_))),
    reload_changed_files(Reply).
action(prolog_access,Request,_{token:Token}) :-
    trusted_local_request(Request),
    with_mutex(powder_prolog_token,
      (prolog_access_token(Token)->true;
        crypto_n_random_bytes(32,Bytes),crypto_data_hash(Bytes,Token,[encoding(octet)]),
        assertz(prolog_access_token(Token)))).
action(prolog_query,Request,Reply) :-
    require_local_admin(Request),
    body(Request,Body),must_be(string,Body.query),
    setting_default(queryLimit,Default),field(Body,limit,Default,Limit),field(Body,timeout,3,Seconds),
    validate_result_limit(queryLimit,Limit),validate_seconds(Seconds),
    query_scope(Body,Scope),
    submit_inference(prolog,query(Body.query,Scope,Limit,Seconds),Reply).
action(test_questions,Request,Reply) :-
    paging(Request,Offset,Limit),search_text(Request,Search),
    with_mutex(openworld_store,
      (stored_questions(All),include(question_matches(Search),All,Matches),
       page(Matches,Offset,Limit,Page),kb_store:generation(Generation),
       Reply=Page.put(generation,Generation))).

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
    context_input(MtKey,Mt),context_key(Mt,CanonicalKey),term_ast(Mt,[],MtExpression),
    with_mutex(openworld_store,
      (kb_store:mt_assertions(Mt,Items),
       page(Items,Offset,Limit,P),Reply=P.put(_{mt:CanonicalKey,mtExpression:MtExpression}))).
action(microtheories,_,Reply) :-
    with_mutex(openworld_store,
      (kb_store:microtheories(Items),length(Items,Total),kb_store:generation(Generation),
       Reply=_{items:Items,total:Total,generation:Generation})).
action(assertion,Request,Reply) :-
    http_parameters(Request,[id(Id,[atom])]),
    with_mutex(openworld_store,
      (kb_store:assertion(Id,Reply)->true;throw(error(existence_error(assertion,Id),_)))).
action(catalog,_,Reply) :- catalog(Reply).
action(load,Request,Reply) :-
    body(Request,Body),must_be(list,Body.files),must_be(integer,Body.generation),
    authorize_sources(Body.files,Paths),
    submit_load(Paths,Body.generation,Reply).
action(unload,Request,Reply) :-
    body(Request,Body),must_be(integer,Body.generation),
    atom_string(Path,Body.path),submit_unload(Path,Body.generation,Reply).
action(query,Request,Reply) :-
    body(Request,Body),must_be(string,Body.query),
    string_length(Body.query,N),N=<65536,
    setting_default(queryLimit,DefaultLimit),field(Body,limit,DefaultLimit,Limit),field(Body,timeout,3,Seconds),
    validate_result_limit(queryLimit,Limit),
    validate_seconds(Seconds),query_scope(Body,Scope),
    submit_inference(kb,query(Body.query,Scope,Limit,Seconds),Reply).
action(server_settings,Request,Reply) :-
    trusted_local_request(Request),effective_server_settings(Reply).
action(save_server_settings,Request,Reply) :-
    require_local_admin(Request),body(Request,Body),
    save_server_settings(Body.settings,Body.revision,Reply),
    retractall(startup_config_error(_)).
action(tasks,Request,Reply) :-
    trusted_local_request(Request),task_overview(Reply).
action(task_detail,Request,Reply) :-
    trusted_local_request(Request),http_parameters(Request,[id(Id,[atom])]),job_status(Id,Reply).
action(cancel_task,Request,Reply) :-
    require_local_admin(Request),body(Request,Body),atom_string(Id,Body.id),
    cancel_job(Id),job_status(Id,Reply).
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
    setting_default(pageSize,Default),
    http_parameters(Request,[offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(Default)])]),
    (Offset>=0->true;throw(error(domain_error(pagination_offset,Offset),_))),
    validate_result_limit(pageSize,Limit).
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
    app_base(Base),
    (Path==Base->Name='index.html';atom_concat(Base,Name,Path)),
    ( web_name(Name) ->
      app_dir(App),directory_file_path(App,web,Web),directory_file_path(Web,Name,File),
      asset_options(Name,MimeOptions),
      append(MimeOptions,[cache(false),unsafe(true),headers([cache_control('no-store')])],Options),
      http_reply_file(File,Options,Request)
    ; throw(http_reply(not_found(Path))) ).
web_name(Name) :-
    atom(Name),file_base_name(Name,Name),
    \+sub_atom(Name,_,_,_,'\\'),\+sub_atom(Name,_,_,_,'..'),
    file_name_extension(_,Ext,Name),
    (memberchk(Ext,[html,css,js,mjs]);memberchk(Name,['settings.json','paths.json'])).
asset_options(Name,[mime_type('application/javascript')]) :-
    file_name_extension(_,Ext,Name),memberchk(Ext,[js,mjs]), !.
asset_options(_,[]).

trusted_local_request(Request) :-
    memberchk(peer(Peer),Request),
    memberchk(Peer,[ip(127,0,0,1),ip(0,0,0,0,0,0,0,1)]),
    memberchk(host(Host),Request),memberchk(Host,[localhost,'127.0.0.1','[::1]']),
    memberchk(port(Port),Request),server_port(Port),
    (memberchk(sec_fetch_site(Site),Request)->memberchk(Site,['same-origin',none]);true),
    valid_origin(Request),!.
trusted_local_request(_) :-
    throw(error(permission_error(execute,prolog_query,untrusted_origin),_)).

question_matches('',_) :- !.
question_matches(Search,Question) :-
    atomic_list_concat([Question.identifier,Question.question,Question.source,Question.prolog],' ',Text),
    downcase_atom(Text,Lower),sub_atom(Lower,_,_,_,Search).

require_local_admin(Request) :-
    trusted_local_request(Request),
    (memberchk(x_powder_local_token(Token),Request),prolog_access_token(Token)->true;
      throw(error(permission_error(execute,local_administration,missing_local_token),_))).
query_scope(Body,Scope) :-
    (get_dict(mt,Body,Value),Value\=="",Value\==null->context_input(Value,Mt),Scope=context(Mt);Scope=none).
validate_seconds(Seconds) :-
    must_be(number,Seconds),
    (Seconds>0,Seconds=<30->true;domain_error(query_timeout,Seconds)).
