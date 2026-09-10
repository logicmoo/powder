:- begin_tests(ow_api).
:- use_module('../kb_catalog').
:- use_module('../kb_server').
:- use_module('../kb_paths').
:- use_module('../kb_urls').
:- use_module(library(http/http_client)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(socket)).

test(traversal_rejected,[throws(error(permission_error(access,kb_source,_),_))]) :-
    authorize_sources(['KBs/../AGENTS.md'],_).
test(absolute_rejected,[throws(error(permission_error(access,kb_source,_),_))]) :-
    repo_root(Root),authorize_sources([Root],_).
test(backslash_rejected,[throws(error(permission_error(access,kb_source,_),_))]) :-
    authorize_sources(['KBs\\tinyKB.kif'],_).
test(page_limits) :-
    kb_server:page([a,b,c],1,1,_{items:[b],total:3,offset:1,limit:1}).
test(empty_page) :-
    kb_server:page([a],50,10,_{items:[],total:1,offset:50,limit:10}).
test(no_generated_assets) :-
    assertion(\+kb_server:web_name('../AGENTS.md')),
    assertion(\+kb_server:web_name('app.pl')),
    assertion(kb_server:web_name('app.js')).
test(result_limits_share_400_defaults) :-
    kb_server:paging([],0,400),
    kb_server:paging([search([limit='400'])],0,400),
    kb_limits:setting_default(queryLimit,400),
    kb_limits:validate_result_limit(queryLimit,400).
test(result_limit_rejects_excess_without_silent_clamp,
     [throws(error(domain_error(result_limit(pageSize,1,400),401),_))]) :-
    kb_server:paging([search([limit='401'])],_,_).

mount_url(Port,Path,URL) :- format(atom(URL),'http://127.0.0.1:~d~w',[Port,Path]).
parent_page(_) :- format('Content-type: text/plain~n~nSWISH parent untouched').

test(nested_mount_static_api_and_parent_routes) :-
    tcp_socket(Socket),tcp_bind(Socket,'127.0.0.1':Port),tcp_close_socket(Socket),
    setup_call_cleanup(
      (http_handler('/swish/',parent_page,[prefix]),kb_server:start_server(Port)),
      (app_base(Base),app_mount(Mount),mount_url(Port,Mount,Bare),
       http_get(Bare,_,[to(string),redirect(false),status_code(Redirect),header(location,Location)]),
       assertion(Redirect=:=301),assertion(Location==Base),
       forall(member(Asset-Type,['index.html'-'text/html','style.css'-'text/css',
                                'app.js'-'application/javascript','paths.json'-'application/json',
                                'settings.json'-'application/json']),
         (app_path(Asset,Path),mount_url(Port,Path,URL),
          http_get(URL,_,[to(string),status_code(Code),header(content_type,Mime)]),
          assertion(Code=:=200),assertion(sub_atom(Mime,0,_,_,Type)))),
       api_path(status,StatusPath),mount_url(Port,StatusPath,StatusURL),
       http_get(StatusURL,Status,[json_object(dict)]),assertion(is_dict(Status.counts)),
       api_path('does-not-exist',MissingPath),mount_url(Port,MissingPath,MissingURL),
       http_get(MissingURL,Missing,[json_object(dict),status_code(MissingCode)]),
       assertion(MissingCode=:=404),assertion(Missing.error.code=="not_found"),
       kb_server:register_routes,
       mount_url(Port,'/swish/sibling',Sibling),
       http_get(Sibling,Parent,[to(string)]),assertion(Parent=="SWISH parent untouched"),
       mount_url(Port,'/api/status',OldURL),
       http_get(OldURL,Old,[to(string),status_code(OldCode)]),assertion(OldCode=:=404),
       assertion(\+sub_string(Old,_,_,_,'<title>powder')),
       findall(Name,kb_server:api_route(Name,_,_),Names),length(Names,23),
       forall(member(Name,Names),(api_path(Name,Path),http_current_handler(Path,_)))),
      (kb_server:stop_server,http_delete_handler('/swish/'))).
:- end_tests(ow_api).
