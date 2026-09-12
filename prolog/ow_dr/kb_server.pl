:- module(kb_server, [start_server/1, stop_server/0]).
:- use_module(kb_paths).
:- use_module(kb_urls).
:- use_module(kb_store, []).
:- use_module(kb_catalog).
:- use_module(kb_catalog_http).
:- use_module(kb_debug_admin,[]).
:- use_module(kb_statistics).
:- use_module(kb_source_packs, []).
:- use_module(kb_mt_graph, []).
:- use_module(kb_term_navigation).
:- use_module(kb_term_browser,[]).
:- use_module(kb_assertion_view,[]).
:- use_module(kb_rule_utility_http,[]).
:- use_module(kb_native_annotations,[]).
:- use_module(kb_pool_settings,[]).
:- use_module(kb_jobs,[]).
:- use_module(kb_startup_settings,[]).
:- use_module(kb_config,[]).
:- use_module(kb_source_editor,[]).
:- use_module(kb_terms).
:- use_module(kb_messages).
:- use_module(kb_limits).
:- use_module(kb_reload).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_header)).
:- use_module(library(crypto)).
:- use_module(library(lists)).
:- use_module(library(error)).
:- use_module(library(time)).
:- dynamic server_port/1.
:- http_handler(openworld_dr(api/status), endpoint(status), []).
:- http_handler(openworld_dr(api/search), endpoint(search), []).
:- http_handler(openworld_dr(api/predicates), endpoint(predicates), []).
:- http_handler(openworld_dr(api/term), endpoint(term), []).
:- http_handler(openworld_dr(api/term/info), endpoint(term_info), [method(get)]).
:- http_handler(openworld_dr(api/assertions/annotations), endpoint(annotations), [method(post)]).
:- http_handler(openworld_dr(api/nats), endpoint(nats), [method(get)]).
:- http_handler(openworld_dr(api/nats/facets), endpoint(nat_facets), [method(get)]).
:- http_handler(openworld_dr(api/microtheory), endpoint(microtheory), []).
:- http_handler(openworld_dr(api/microtheory/statistics), endpoint(mt_statistics), [method(get)]).
:- http_handler(openworld_dr(api/microtheory/statistics/arities), endpoint(mt_statistics_arities), [method(get)]).
:- http_handler(openworld_dr(api/microtheories), endpoint(microtheories), []).
:- http_handler(openworld_dr(api/microtheories/inheritance), endpoint(loaded_inheritance), [method(get)]).
:- http_handler(openworld_dr(api/assertion), endpoint(assertion), []).
:- http_handler(openworld_dr(api/assertion/compiled), endpoint(compiled_assertion), [method(get)]).
:- http_handler(openworld_dr(api/tva/status), endpoint(tva_status), [method(get)]).
:- http_handler(openworld_dr(api/tva/summary), endpoint(tva_summary), [method(post)]).
:- http_handler(openworld_dr(api/tva/detail), endpoint(tva_detail), [method(post)]).
:- http_handler(openworld_dr(api/tva/settings), endpoint(tva_settings), [method(get)]).
:- http_handler(openworld_dr(api/tva/settings/save), endpoint(tva_settings_save), [method(post)]).
:- http_handler(openworld_dr(api/tva/pairs), endpoint(tva_pairs), [method(get)]).
:- http_handler(openworld_dr(api/tva/pairs/save), endpoint(tva_pairs_save), [method(post)]).
:- http_handler(openworld_dr(api/tva/assertion), endpoint(tva_assertion), [method(post)]).
:- http_handler(openworld_dr(api/tva/assertion/save), endpoint(tva_assertion_save), [method(post)]).
:- http_handler(openworld_dr(api/tva/initialize), endpoint(tva_initialize), [method(post)]).
:- http_handler(openworld_dr(api/tva/reset), endpoint(tva_reset), [method(post)]).
:- http_handler(openworld_dr(api/tva/interpretation), endpoint(tva_interpretation), [method(post)]).
:- http_handler(openworld_dr(api/tva/interpretations), endpoint(tva_interpretations), [method(post)]).
:- http_handler(openworld_dr(api/terms/sections), endpoint(term_sections), [method(post)]).
:- http_handler(openworld_dr(api/pools), endpoint(pools), [method(get)]).
:- http_handler(openworld_dr(api/pools/save), endpoint(pools_save), [method(post)]).
:- http_handler(openworld_dr(api/pools/apply), endpoint(pools_apply), [method(post)]).
:- http_handler(openworld_dr(api/pools/start), endpoint(pools_start), [method(post)]).
:- http_handler(openworld_dr(api/tasks), endpoint(tasks), [method(get)]).
:- http_handler(openworld_dr(api/tasks/detail), endpoint(task_detail), [method(get)]).
:- http_handler(openworld_dr(api/tasks/result), endpoint(task_result), [method(get)]).
:- http_handler(openworld_dr(api/tasks/cancel), endpoint(task_cancel), [method(post)]).
:- http_handler(openworld_dr(api/kb/queue), endpoint(queue_load), [method(post)]).
:- http_handler(openworld_dr(api/kb/index), endpoint(queue_index), [method(post)]).
:- http_handler(openworld_dr(api/kb/startup), endpoint(startup_status), [method(get)]).
:- http_handler(openworld_dr(api/kb/startup/add), endpoint(startup_add), [method(post)]).
:- http_handler(openworld_dr(api/kb/statistics/selected), endpoint(selected_statistics), [method(post)]).
:- http_handler(openworld_dr(api/source/editor), endpoint(editor), [methods([get,post])]).
:- http_handler(openworld_dr(api/kb/catalog), endpoint(catalog), []).
:- http_handler(openworld_dr('api/kb/file-info'), endpoint(file_information), [method(get)]).
:- http_handler(openworld_dr(api/kb/dependencies), endpoint(dependencies), [method(get)]).
:- http_handler(openworld_dr(api/kb/packs), endpoint(pack_list), [method(get)]).
:- http_handler(openworld_dr(api/kb/pack), endpoint(pack_get), [method(get)]).
:- http_handler(openworld_dr(api/kb/packs/create), endpoint(pack_create), [method(post)]).
:- http_handler(openworld_dr(api/kb/packs/save), endpoint(pack_save), [method(post)]).
:- http_handler(openworld_dr(api/kb/packs/resolve), endpoint(pack_resolve), [method(post)]).
:- http_handler(openworld_dr(api/kb/packs/load), endpoint(pack_load), [method(post)]).
:- http_handler(openworld_dr(api/kb/packs/providers/refresh), endpoint(pack_index), [method(post)]).
:- http_handler(openworld_dr(api/kb/statistics), endpoint(statistics), [method(get)]).
:- http_handler(openworld_dr(api/kb/statistics/detail), endpoint(statistics_detail), [method(get)]).
:- http_handler(openworld_dr(api/kb/statistics/arities), endpoint(statistics_arities), [method(get)]).
:- http_handler(openworld_dr(api/kb/statistics/directory), endpoint(directory_statistics), [method(get)]).
:- http_handler(openworld_dr(api/kb/load), endpoint(load), [method(post)]).
:- http_handler(openworld_dr(api/kb/unload), endpoint(unload), [method(post)]).
:- http_handler(openworld_dr(api/query), endpoint(query), [method(post)]).
:- http_handler(openworld_dr(api/source), endpoint(source), []).
:- http_handler(openworld_dr(api/mappings), endpoint(mappings), []).
:- http_handler(openworld_dr(api/version), endpoint(version), []).
:- http_handler(openworld_dr(api/app/reload), endpoint(reload_application), [method(post)]).
:- http_handler(openworld_dr(api), unknown_api, []).
:- http_handler(openworld_dr('api/'), unknown_api, [prefix]).
:- http_handler(openworld_dr(.), static, [prefix]).
:- initialization(register_mount_redirect).

register_mount_redirect :-
    kb_urls:reload_base,
    ignore(http_delete_handler(id(openworld_dr_mount))),
    app_mount(Mount),http_handler(Mount,kb_server:redirect_mount,[id(openworld_dr_mount)]),
    register_legacy_entry('/swish/openworld_dr',openworld_dr_previous_mount),
    register_legacy_entry('/swish/openworld_dr/',openworld_dr_previous_entry),
    ignore(http_delete_handler(id(openworld_dr_legacy_root))),
    (foreign_root_handler->true;
      http_handler('/',kb_server:legacy_root_redirect,[id(openworld_dr_legacy_root),priority(-10000)])), !.
register_legacy_entry(Path,Id) :-
    ignore(http_delete_handler(id(Id))),
    app_base(Base),app_mount(Mount),
    (Path==Base;Path==Mount;foreign_exact_handler(Path)), !.
register_legacy_entry(Path,Id) :-
    http_handler(Path,kb_server:legacy_entry_redirect(Path,Id),[id(Id)]), !.
legacy_entry_redirect(Path,Id,Request) :-
    (foreign_exact_handler(Path)->
      ignore(http_delete_handler(id(Id))),http_dispatch(Request)
    ;redirect_mount(Request)).
foreign_exact_handler(Path) :-
    http_current_handler(Found,Module:_),Found==Path,Module\==kb_server, !.
foreign_root_handler :-
    http_current_handler(Path,Module:Handler),Path=='/',
    \+ (Module==kb_server,Handler==legacy_root_redirect), !.
% Exact routes outrank prefix routes, including a host root registered later.
legacy_root_redirect(Request) :-
    (foreign_root_handler->
      ignore(http_delete_handler(id(openworld_dr_legacy_root))),http_dispatch(Request)
    ;redirect_mount(Request)).
redirect_mount(Request) :- app_base(Base),http_redirect(moved,Base,Request).
unknown_api(_) :-
    reply_json_dict(_{error:_{code:not_found,message:"Unknown API route."}},[status(404)]).

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
      (owned_origin(Origin)->true;throw(error(forbidden_origin,_)))
    ; true ).
owned_origin(Origin) :-
    server_port(Port),member(Host,[localhost,'127.0.0.1']),
    format(atom(Expected),'http://~w:~d',[Host,Port]),Origin==Expected, !.

api_error(error(source_editor_reply(Status,Reply),_)) :- !,reply_json_dict(Reply,[status(Status)]).
api_error(Error) :-
    error_response(Error,Status,Code),
    (Error=error(application_reload_failed(Report),_),is_dict(Report)->
      Payload=_{code:Code,message:Report.message,issues:Report.issues}
    ;Error=error(source_pack_unresolved(_),_)->
      Payload=_{code:Code,message:"This pack has unresolved dependencies. Resolve, review and save its composition before loading."}
    ;Error=error(compile_incomplete(Summary),_)->
      compile_report(Summary,Report),
      Payload=_{code:Code,message:Report.message,issues:Report.issues,counts:Report.counts}
    ;message_to_string(Error,Message),Payload=_{code:Code,message:Message}),
    reply_json_dict(_{error:Payload},[status(Status)]).
error_response(error(generation_conflict(_,_),_),409,generation_conflict) :- !.
error_response(error(native_tva_revision_conflict(_,_),_),409,native_revision_conflict) :- !.
error_response(error(native_tva_record_revision_conflict(_,_),_),409,native_record_changed) :- !.
error_response(error(native_tva_persistence_conflict(_,_),_),409,native_persistence_conflict) :- !.
error_response(error(native_tva_busy,_),503,native_store_busy) :- !.
error_response(error(native_assertion_identity_conflict,_),409,assertion_identity_conflict) :- !.
error_response(error(native_pair_replacement_required(_,_),_),409,native_pair_replacement_required) :- !.
error_response(error(server_settings_conflict,_),409,settings_conflict) :- !.
error_response(error(server_settings_busy,_),503,settings_busy) :- !.
error_response(error(task_queue_full(_),_),429,queue_full) :- !.
error_response(error(source_packs_conflict(_,_),_),409,pack_conflict) :- !.
error_response(error(source_packs_changed_during_read,_),409,pack_conflict) :- !.
error_response(error(source_packs_busy,_),409,pack_busy) :- !.
error_response(error(source_pack_composition_not_saved,_),409,pack_not_saved) :- !.
error_response(error(source_pack_source_changed(_),_),409,pack_source_changed) :- !.
error_response(error(source_pack_cache_changed(_),_),409,pack_cache_changed) :- !.
error_response(error(source_pack_unresolved(_),_),422,pack_unresolved) :- !.
error_response(error(application_reload_busy,_),409,reload_busy) :- !.
error_response(error(application_reload_failed(_),_),500,application_reload_failed) :- !.
error_response(error(compile_incomplete(S),_),422,compile_failed) :- S.failures>0, !.
error_response(error(compile_incomplete(_),_),503,busy) :- !.
error_response(error(permission_error(_,_,_),_),403,forbidden) :- !.
error_response(error(forbidden_origin,_),403,forbidden) :- !.
error_response(error(existence_error(procedure,_),_),500,internal_error) :- !.
error_response(error(existence_error(_,_),_),404,not_found) :- !.
error_response(time_limit_exceeded,408,query_timeout) :- !.
error_response(error(type_error(_,_),_),400,invalid_input) :- !.
error_response(error(domain_error(_,_),_),400,invalid_input) :- !.
error_response(error(instantiation_error,_),400,invalid_input) :- !.
error_response(error(source_error(_,_,_,_),_),400,invalid_expression) :- !.
error_response(_,500,internal_error).

action(status,_,Reply) :-
    with_mutex(openworld_store,(kb_store:status(Status),status_file_information(Status,Reply))).
action(tva_status,_,Reply) :-
    kb_native_annotations:native_status(Status),native_generation(Status,Reply).
action(tva_summary,Request,Reply) :-
    native_body(Request,[entities,context,options],Body),
    kb_native_annotations:native_batch(Body.entities,Body.context,Body.options,Result),
    native_generation(Result,Reply).
action(tva_detail,Request,Reply) :-
    native_body(Request,[entity,context,family,property,recordRevision],Body),
    kb_native_annotations:native_detail(Body.entity,Body.context,Body.family,Body.property,Body.recordRevision,Result),
    native_generation(Result,Reply).
action(tva_settings,Request,Reply) :-
    http_parameters(Request,[context(Context,[atom,optional(true)])]),
    (var(Context)->Scope=null;Scope=Context),
    kb_native_annotations:native_settings(Scope,Result),native_generation(Result,Reply).
action(tva_settings_save,Request,Reply) :-
    native_body(Request,[context,patch,revision],Body),
    kb_native_annotations:save_native_settings(Body.context,Body.patch,Body.revision,Result),
    native_generation(Result,Reply).
action(tva_pairs,Request,Reply) :-
    http_parameters(Request,[context(Context,[atom,optional(true)])]),
    (var(Context)->Scope=null;Scope=Context),
    kb_native_annotations:native_pair_settings(Scope,Result),native_generation(Result,Reply).
action(tva_pairs_save,Request,Reply) :-
    native_write_request(Request),native_body(Request,[context,family,pair,revision,replace],Body),
    kb_native_annotations:save_native_pair(Body.context,Body.family,Body.pair,Body.revision,Body.replace,Result),
    native_generation(Result,Reply).
action(tva_assertion,Request,Reply) :-
    native_body(Request,[entity,context],Body),
    kb_native_annotations:assertion_annotation_settings(Body.entity,Body.context,Reply).
action(tva_assertion_save,Request,Reply) :-
    native_write_request(Request),
    native_body(Request,[entity,context,patch,revision,generation,identity],Body),
    Expected=_{revision:Body.revision,generation:Body.generation,identity:Body.identity},
    kb_native_annotations:save_assertion_annotations(Body.entity,Body.context,Body.patch,Expected,Reply).
action(tva_initialize,Request,Reply) :-
    native_body(Request,[revision],Body),
    kb_native_annotations:initialize_defaults(Body.revision,Result),native_generation(Result,Reply).
action(tva_reset,Request,Reply) :-
    native_body(Request,[revision],Body),
    kb_native_annotations:reset_global_defaults(Body.revision,Result),native_generation(Result,Reply).
action(tva_interpretation,Request,Reply) :-
    native_body(Request,[entity,context],Body),
    kb_native_annotations:assertion_interpretation(Body.entity,Body.context,Reply).
action(tva_interpretations,Request,Reply) :-
    native_body(Request,[entities,context],Body),
    kb_native_annotations:assertion_interpretations(Body.entities,Body.context,Reply).
action(term_sections,Request,Reply) :-
    native_body(Request,[filters,requests],Body),
    kb_term_roles:category_sections(Body.filters,Body.requests,Reply).
action(pools,_,Reply) :- kb_pool_settings:pool_settings(Reply).
action(pools_save,Request,Reply) :-
    native_body(Request,[updates,revision],Body),
    kb_pool_settings:save_pool_settings(Body.updates,Body.revision,Reply).
action(pools_apply,Request,Reply) :-
    native_body(Request,[revision],Body),kb_pool_settings:apply_pool_settings(Body.revision,Reply).
action(pools_start,Request,Reply) :-
    native_body(Request,[],_),kb_config:server_settings(Settings),
    kb_jobs:start_pools(Settings),kb_pool_settings:pool_settings(Reply).
action(tasks,Request,Reply) :-
    http_parameters(Request,[pool(Pool,[atom,default(all)]),state(State,[atom,default(active)]),
      offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(25)])]),
    kb_pool_settings:task_list(_{pool:Pool,state:State,offset:Offset,limit:Limit},Reply).
action(task_detail,Request,Reply) :-
    http_parameters(Request,[id(Id,[atom]),section(Section,[atom,default(files)]),
      offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(25)])]),
    kb_pool_settings:task_details(Id,_{section:Section,offset:Offset,limit:Limit},Data),
    (Section==files->maplist(public_task_file,Data.items,Items),Reply=Data.put(items,Items);Reply=Data).
action(task_result,Request,Reply) :-
    http_parameters(Request,[id(Id,[atom])]),kb_jobs:job_status(Id,Reply).
action(task_cancel,Request,Reply) :-
    native_body(Request,[id],Body),kb_pool_settings:cancel_task(Body.id,Reply).
action(queue_load,Request,Reply) :-
    native_body(Request,[files,generation],Body),must_be(integer,Body.generation),
    authorize_sources(Body.files,Paths),kb_jobs:queue_load(Paths,Body.generation,Reply).
action(queue_index,Request,Reply) :-
    native_body(Request,[files],Body),authorize_sources(Body.files,Paths),
    kb_jobs:queue_index(Paths,[],Reply).
action(startup_status,_,Reply) :-
    kb_config:server_settings(Settings),startup_sources(Startup),
    Reply=_{revision:Settings.revision,startup:Startup}.
action(startup_add,Request,Reply) :-
    native_body(Request,[path,revision],Body),
    kb_startup_settings:enable_startup_source(Body.path,Body.revision,Reply).
action(selected_statistics,Request,Reply) :-
    native_body(Request,[paths,scope,token],Body),
    kb_statistics:selected_statistics(Body.paths,Body.scope,Body.token,Reply).
action(editor_read,Request,Reply) :-
    http_parameters(Request,[path(Path,[atom])]),
    catch(kb_source_editor:editor_read(Path,Reply),Error,editor_exception(Error)).
action(editor,Request,Reply) :-
    (memberchk(method(post),Request)->action(editor_save,Request,Reply);action(editor_read,Request,Reply)).
action(editor_save,Request,Reply) :-
    kb_source_editor:editor_limit(Limit),Max is Limit*6+8192,
    (memberchk(content_length(Size),Request),Size>Max->throw(error(domain_error(request_size,Size),_));true),
    http_read_json_dict(Request,Body),must_be(dict,Body),required_fields(Body,[path,text,expectedRevision]),
    catch(kb_source_editor:editor_save(Body,Reply),Error,editor_exception(Error)).
action(reload_application,Request,Reply) :-
    body(Request,Body),
    (dict_pairs(Body,_,[])->true;throw(error(domain_error(empty_reload_request,Body),_))),
    kb_activity:with_exclusive_reload(kb_reload:reload_changed_files(Reply)),
    (member(File,Reply.reloaded),file_base_name(File,Name),
     memberchk(Name,['kb_term_roles.pl','kb_non_atomic.pl'])->
      kb_term_roles:clear_term_role_cache;true).
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
    http_parameters(Request,[term(Input,[atom])]),
    compound_term_input(Input), !,
    term_filters(Request,Filters),
    http_parameters(Request,[view(View,[atom,default(auto)])]),
    (memberchk(View,[auto,references])->true;throw(error(domain_error(term_view,View),_))),
    kb_term_browser:resolve_compound(Input,Context,_),
    (catch(context_key(Context,Key),error(_,_),fail)->true;Key=none),
    term_ast(Context,[],Expression),
    with_mutex(openworld_store,
      (kb_store:microtheories(Contexts),
       (View==auto,unfiltered_term(Filters),member(Item,Contexts),Item.mt==Key->
         kb_store:generation(Generation),
         Resolved=_{resolvedAs:microtheory,term:Key,mt:Key,expression:Expression,
           mtExpression:Expression,total:Item.count,generation:Generation}
       ;Resolved=none))),
    (Resolved\==none->Reply=Resolved;
     paging(Request,Offset,Limit),
     kb_term_browser:browse_compound(Input,Offset,Limit,Filters,Browsed),
     (View==auto,unfiltered_term(Filters),get_dict(microtheory,Browsed,Mt)->
       Reply=Browsed.put(_{resolvedAs:microtheory,mt:Mt});
      Reply=Browsed)).
action(term,Request,Reply) :-
    http_parameters(Request,[term(Term,[atom])]),
    paging(Request,Offset,Limit),
    term_filters(Request,Filters),
    with_mutex(openworld_store,
      (kb_store:term_assertions(Term,Items),
       term_navigation(Term,Items,Navigation),
       filter_term_assertions(Term,Items,Filters,Filtered),
       page(Filtered,Offset,Limit,P),kb_store:generation(Generation),
       maplist(assertion_presentation,P.items,Presented),
       Reply=P.put(_{term:Term,navigation:Navigation,generation:Generation,items:Presented}))).
action(term_info,Request,Reply) :-
    http_parameters(Request,[term(Term,[atom])]),
    kb_term_browser:term_information(Term,Reply).
action(annotations,Request,Reply) :-
    body(Request,Body),required_fields(Body,[ids]),kb_term_browser:annotate_page(Body.ids,Reply).
action(nats,Request,Reply) :-
    nat_request(Request,Filters,Offset,Limit),
    kb_term_roles:browse_nats(Filters,Offset,Limit,Reply).
action(nat_facets,Request,Reply) :-
    nat_request(Request,Filters,Offset,Limit),
    http_parameters(Request,[facet(Facet,[atom])]),
    kb_term_roles:nat_facets(Filters,Facet,Offset,Limit,Reply).
action(microtheory,Request,Reply) :-
    http_parameters(Request,[mt(MtKey,[atom])]),paging(Request,Offset,Limit),
    context_input(MtKey,Mt),context_key(Mt,CanonicalKey),term_ast(Mt,[],MtExpression),
    with_mutex(openworld_store,
      (kb_store:mt_assertions(Mt,Items),
       page(Items,Offset,Limit,P),maplist(assertion_presentation,P.items,Presented),
       kb_store:generation(Generation),
       Reply=P.put(_{mt:CanonicalKey,mtExpression:MtExpression,items:Presented,generation:Generation}))).
action(microtheories,_,Reply) :-
    kb_term_browser:microtheory_catalog(Reply).
action(loaded_inheritance,_,Reply) :-
    call_with_time_limit(15,kb_mt_graph:loaded_inheritance(Reply)).
action(pack_list,Request,Reply) :-
    paging(Request,Offset,Limit),kb_source_packs:list_packs(All),
    page(All.packs,Offset,Limit,Page),maplist(pack_list_item,Page.items,Items),
    Reply=_{revision:All.revision,packs:Items,total:Page.total,offset:Offset,limit:Limit}.
action(pack_get,Request,Reply) :-
    http_parameters(Request,[id(Id,[atom])]),kb_source_packs:get_pack(Id,Reply).
action(pack_create,Request,Reply) :-
    pack_body(Request,[name,roots,revision],Body),pack_path_batch(Body.roots),
    kb_source_packs:create_pack(Body.name,Body.roots,Body.revision,Reply).
action(pack_save,Request,Reply) :-
    pack_body(Request,[pack,revision],Body),must_be(dict,Body.pack),
    required_fields(Body.pack,[roots,choices,members]),
    pack_path_batch(Body.pack.roots),pack_choice_batch(Body.pack.choices),
    bounded_pack_list(Body.pack.members,1024),
    kb_source_packs:save_pack(Body.pack,Body.revision,Reply).
action(pack_resolve,Request,Reply) :-
    pack_body(Request,[id,revision,choices],Body),pack_choice_batch(Body.choices),
    call_with_time_limit(60,kb_source_packs:resolve_pack(Body.id,Body.revision,Body.choices,Reply)).
action(pack_load,Request,Reply) :-
    pack_body(Request,[id,revision,generation],Body),must_be(integer,Body.generation),
    kb_source_packs:load_pack(Body.id,Body.revision,Body.generation,Loaded),
    action(status,[],Status),Reply=Loaded.put(status,Status).
action(pack_index,Request,Reply) :-
    pack_body(Request,[selection],Body),
    (memberchk(Body.selection,[all,"all"])->Selection=all;
      pack_path_batch(Body.selection),Selection=Body.selection),
    call_with_time_limit(120,kb_source_packs:refresh_provider_index(Selection,Reply)).
action(mt_statistics,Request,Reply) :-
    http_parameters(Request,[mt(Input,[atom]),section(Section,[atom,default(overview)]),
      offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(25)])]),
    (atom_length(Input,Length),Length=<8192->true;
      throw(error(domain_error(microtheory_key_length,Input),_))),
    context_input(Input,Context),context_key(Context,Key),
    microtheory_statistics(Key,Section,Offset,Limit,Reply).
action(mt_statistics_arities,Request,Reply) :-
    http_parameters(Request,[mt(Input,[atom]),symbol(Symbol,[atom]),
      offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(25)])]),
    (atom_length(Input,Length),Length=<8192->true;
      throw(error(domain_error(microtheory_key_length,Input),_))),
    context_input(Input,Context),context_key(Context,Key),
    microtheory_predicate_arities(Key,Symbol,Offset,Limit,Reply).
action(assertion,Request,Reply) :-
    http_parameters(Request,[id(Id,[atom])]),
    with_mutex(openworld_store,
      (kb_store:assertion(Id,Data)->assertion_presentation(Data,Presented),
        kb_store:generation(Generation),Reply=Presented.put(generation,Generation);
       throw(error(existence_error(assertion,Id),_)))).
action(compiled_assertion,Request,Reply) :-
    http_parameters(Request,[id(Id,[atom]),generation(Generation,[integer,optional(true)])]),
    (var(Generation)->Expected=any;Expected=Generation),
    kb_assertion_view:compiled_assertion(Id,Expected,Reply).
action(catalog,_,Reply) :- catalog(Reply).
action(dependencies,Request,Reply) :-
    http_parameters(Request,[path(Path,[atom]),section(Section,[atom,default(summary)]),
      offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(25)])]),
    source_dependencies(Path,Section,Offset,Limit,Reply).
action(file_information,Request,Reply) :-
    http_parameters(Request,[paths(Text,[atom])]),
    (atom_length(Text,N),N=<65536->true;throw(error(domain_error(file_information_request_size,Text),_))),
    catch(atom_json_term(Text,Paths,[]),_,throw(error(domain_error(file_information_paths_json,Text),_))),
    file_information(Paths,Reply).
action(statistics,Request,Reply) :-
    http_parameters(Request,[paths(Text,[atom])]),
    (atom_length(Text,N),N=<65536->true;throw(error(domain_error(statistics_request_size,Text),_))),
    catch(atom_json_term(Text,Paths,[]),_,throw(error(domain_error(statistics_paths_json,Text),_))),
    source_statistics(Paths,Reply).
action(statistics_detail,Request,Reply) :-
    http_parameters(Request,[path(Path,[atom]),section(Section,[atom,default(content)]),
      mt(Mt,[atom,default('')]),offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(50)])]),
    source_statistics_detail(Path,Section,Mt,Offset,Limit,Reply).
action(statistics_arities,Request,Reply) :-
    http_parameters(Request,[path(Path,[atom]),symbol(Symbol,[atom]),mt(Mt,[atom,default('')]),
      offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(25)])]),
    source_predicate_arities(Path,Symbol,Mt,Offset,Limit,Reply).
action(directory_statistics,Request,Reply) :-
    http_parameters(Request,[path(Path,[atom]),token(Token,[atom,default('')])]),
    directory_statistics(Path,Token,Reply).
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
    setting_default(queryLimit,DefaultLimit),field(Body,limit,DefaultLimit,Limit),field(Body,timeout,3,Seconds),
    (get_dict(mt,Body,Mt0),Mt0\=="",Mt0\==null->context_input(Mt0,Mt);true),
    validate_result_limit(queryLimit,Limit),
    must_be(number,Seconds),Seconds>0,Seconds=<30,
    kb_store:query_text(Body.query,Mt,Limit,Seconds,Reply).
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
native_body(Request,Fields,Body) :-
    body(Request,Body),required_fields(Body,Fields),dict_pairs(Body,_,Pairs),
    forall(member(Key-_,Pairs),
      (memberchk(Key,Fields)->true;throw(error(domain_error(native_request_field,Key),_)))).
native_generation(Result,Reply) :-
    with_mutex(openworld_store,kb_store:generation(Generation)),
    Reply=Result.put(generation,Generation).
native_write_request(Request) :-
    valid_origin(Request),
    (memberchk(peer(ip(127,0,0,1)),Request);memberchk(peer(ip(0,0,0,0,0,0,0,1)),Request)), !.
native_write_request(_) :- throw(error(permission_error(write,native_annotations,remote_peer),_)).
editor_exception(Error) :-
    kb_source_editor:editor_error(Error,Status,Reply),
    throw(error(source_editor_reply(Status,Reply),_)).
public_task_file(Item,Public) :- kb_paths:public_path(Item.path,Path),Public=Item.put(path,Path).
pack_body(Request,Fields,Body) :- body(Request,Body),required_fields(Body,Fields).
required_fields(Body,Fields) :-
    forall(member(Field,Fields),
      (get_dict(Field,Body,_)->true;throw(error(domain_error(required_field,Field),_)))).
bounded_pack_list(Items,Maximum) :-
    must_be(list,Items),length(Items,Count),
    (Count=<Maximum->true;throw(error(domain_error(source_pack_batch_limit(Maximum),Count),_))).
pack_path_batch(Paths) :-
    bounded_pack_list(Paths,1024),
    forall(member(Path,Paths),(must_be(string,Path),string_length(Path,N),
      (N=<4096->true;throw(error(domain_error(source_path_length,N),_))))).
pack_choice_batch(Choices) :-
    bounded_pack_list(Choices,1024),
    forall(member(Choice,Choices),
      (must_be(dict,Choice),required_fields(Choice,[symbol,files]),pack_path_batch(Choice.files))).
pack_list_item(Pack,Item) :-
    length(Pack.roots,Roots),length(Pack.members,Members),
    Item=_{id:Pack.id,name:Pack.name,rootCount:Roots,memberCount:Members,
      ready:Pack.resolution.ready,state:Pack.resolution.state}.
field(Dict,Key,Default,Value) :- (get_dict(Key,Dict,V)->Value=V;Value=Default).
compound_term_input(Input) :-
    (sub_atom(Input,0,1,_,'(');sub_atom(Input,0,3,_,'mt:');sub_atom(Input,0,4,_,'nat:');
     sub_atom(Input,0,2,_,'x_'),sub_atom(Input,_,1,_,'(')), !.
compound_context_input(Input,Context) :-
    (sub_atom(Input,0,2,_,'x_')->atom_concat('mt:',Input,Key),context_from_key(Key,Context)
    ;context_input(Input,Context)).
term_filters(Request,_{section:Section,arg:Arg,predicate:Predicate,mt:Mt,source:Source}) :-
    http_parameters(Request,[section(Section,[atom,default(all)]),
      arg(Arg,[integer,default(0)]),predicate(Predicate,[atom,default('')]),
      mt(Mt,[atom,default('')]),source(Source,[atom,default('')])]).
unfiltered_term(F) :- F.section==all,F.arg=:=0,F.predicate=='',F.mt=='',F.source==''.
nat_request(Request,_{q:Q,match:Match,constructor:Constructor,type:Type,category:Category,representation:Representation},Offset,Limit) :-
    http_parameters(Request,[q(Q,[atom,default('')]),match(Match,[atom,default(substring)]),constructor(Constructor,[atom,default('')]),
      type(Type,[atom,default('')]),category(Category,[atom,default('')]),
      representation(Representation,[atom,default(all)]),
      offset(Offset,[integer,default(0)]),limit(Limit,[integer,default(25)])]),
    must_be(nonneg,Offset),
    (between(1,100,Limit)->true;throw(error(domain_error(nat_page_limit,Limit),_))).
assertion_presentation(Data,Reply) :-
    (kb_runtime:module_assertion(Data.module,Data.id,Semantic,_)->
      (Semantic=(_ :- _)->Kind=rule;Kind=fact),Reply=Data.put(kind,Kind)
    ;Reply=Data).
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
    app_base(Base),atom_concat(Base,Relative,Path),
    (Relative==''->Name='index.html';Name=Relative),
    ( web_name(Name) ->
      app_dir(App),directory_file_path(App,web,Web),directory_file_path(Web,Name,File),
      (exists_file(File)->true;throw(http_reply(not_found(Path)))),
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
asset_options(Name,[mime_type('application/json')]) :-
    file_name_extension(_,json,Name), !.
asset_options(_,[]).
