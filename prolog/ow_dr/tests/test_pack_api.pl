:- ensure_loaded(test_source_packs).
:- begin_tests(pack_api).
:- use_module('../kb_server', []).
:- use_module('../kb_urls').
:- use_module('../kb_source_packs', []).
:- use_module('../kb_store', []).
:- use_module(library(http/http_client)).
:- use_module(library(socket)).
:- use_module(library(readutil)).

fixture(context(State,Port)) :-
    plunit_source_packs:fixture(State),
    setup_call_cleanup(tcp_socket(Socket),tcp_bind(Socket,Port),tcp_close_socket(Socket)),
    kb_server:start_server(Port).
cleanup(context(State,_)) :-
    kb_server:stop_server,plunit_source_packs:cleanup(State).
url(Port,Path,URL) :-
    api_path(Path,Mounted),format(atom(URL),'http://127.0.0.1:~d~w',[Port,Mounted]).
get(Port,Path,Reply) :- url(Port,Path,URL),http_get(URL,Reply,[json_object(dict)]).
post(Port,Path,Body,Code,Reply) :-
    url(Port,Path,URL),http_post(URL,json(Body),Reply,[json_object(dict),status_code(Code)]).

test(explicit_http_pack_workflow_preserves_sources_and_checks_revisions,
     [setup(fixture(Context)),cleanup(cleanup(Context))]) :-
    Context=context(_,Port),
    plunit_source_packs:source_cache('KBs/root.krf',100,[(x_root:-and)],Source),
    read_file_to_string(Source,Before,[]),
    kb_source_packs:packs_file(Settings),
    get(Port,'kb/packs',Empty),assertion(Empty.packs==[]),assertion(Empty.revision=="none"),
    assertion(\+exists_file(Settings)),
    get(Port,'microtheories/inheritance',EmptyGraph),
    assertion(EmptyGraph.schema=="powder.loaded-mt-inheritance.v1"),assertion(EmptyGraph.nodes==[]),
    post(Port,'kb/packs/create',_{name:"Example",roots:["KBs/root.krf"],revision:"none"},200,Created),
    post(Port,'kb/packs/resolve',_{id:Created.pack.id,revision:Created.revision,choices:[]},200,Resolution),
    assertion(Resolution.ready==true),assertion(Resolution.pack.members=[_]),
    kb_source_packs:get_pack(Created.pack.id,Unchanged),assertion(Unchanged.pack.members==[]),
    post(Port,'kb/packs/save',_{pack:Resolution.pack,revision:Created.revision},200,Saved),
    post(Port,'kb/packs/save',_{pack:Resolution.pack,revision:Created.revision},409,Conflict),
    assertion(Conflict.error.code=="pack_conflict"),
    kb_store:generation(Generation),
    post(Port,'kb/packs/load',_{id:Saved.pack.id,revision:Saved.revision,generation:Generation},200,Loaded),
    assertion(Loaded.status.counts.assertions==1),assertion(is_dict(Loaded.status.startup)),
    post(Port,'kb/packs/load',_{id:Saved.pack.id,revision:Saved.revision,generation:Generation},409,Stale),
    assertion(Stale.error.code=="generation_conflict"),
    get(Port,'kb/packs?offset=0&limit=1',Listing),
    assertion(Listing.total==1),Listing.packs=[Item],assertion(Item.memberCount==1),assertion(Item.ready==true),
    post(Port,'kb/packs/providers/refresh',_{selection:["KBs/root.krf"]},200,Index),
    assertion(Index.sources==1),
    read_file_to_string(Source,After,[]),assertion(Before==After).

test(http_pack_inputs_and_origin_are_bounded,
     [setup(fixture(Context)),cleanup(cleanup(Context))]) :-
    Context=context(_,Port),
    post(Port,'kb/packs/create',_{name:"Escape",roots:["KBs/../outside.krf"],revision:"none"},403,Forbidden),
    assertion(Forbidden.error.code=="forbidden"),
    post(Port,'kb/packs/create',_{name:"Missing roots",revision:"none"},400,Missing),
    assertion(Missing.error.code=="invalid_input"),
    length(Paths,1025),maplist(=("KBs/root.krf"),Paths),
    post(Port,'kb/packs/create',_{name:"Too many",roots:Paths,revision:"none"},400,TooMany),
    assertion(TooMany.error.code=="invalid_input"),
    url(Port,'kb/packs/create',URL),
    http_post(URL,json(_{name:"Cross origin",roots:["KBs/root.krf"],revision:"none"}),CrossOrigin,
      [json_object(dict),status_code(403),request_header('Origin'='https://example.invalid')]),
    assertion(CrossOrigin.error.code=="forbidden"),
    kb_source_packs:packs_file(Settings),assertion(\+exists_file(Settings)).

:- end_tests(pack_api).
