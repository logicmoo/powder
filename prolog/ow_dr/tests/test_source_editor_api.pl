:- ensure_loaded(test_source_editor).
:- begin_tests(source_editor_api).
:- use_module('../kb_source_editor').
:- use_module('../kb_store', []).
:- use_module('../kb_paths').
:- use_module('../kb_compile', []).
:- use_module(library(filesex)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_client)).
:- use_module(library(socket)).

:- http_handler('/editor-fixture',editor_handler,[methods([get,post])]).
editor_handler(Request) :-
    catch((memberchk(method(post),Request)->
      http_read_json_dict(Request,Body),editor_save(Body,Reply),reply_json_dict(Reply)
    ;http_parameters(Request,[path(Path,[string])]),editor_read(Path,Reply),reply_json_dict(Reply)),
      Error,(editor_error(Error,Status,Failure),reply_json_dict(Failure,[status(Status)]))).
fixture(fixture(Repo,Old,Port)) :-
    plunit_source_editor:fixture(Repo,Old),
    app_dir(App),kb_compile:implementation_files(Names),
    forall(member(Name,Names),(directory_file_path(Old,Name,From),
      directory_file_path(App,Name,To),copy_file(From,To))),
    setup_call_cleanup(tcp_socket(Socket),tcp_bind(Socket,Port),tcp_close_socket(Socket)),
    http_server(http_dispatch,[port('127.0.0.1':Port),workers(2)]).
cleanup(fixture(Repo,Old,Port)) :-
    http_stop_server('127.0.0.1':Port,[]),
    kb_store:generation(G),kb_store:load_sources([],G,_),
    plunit_source_editor:cleanup(Repo,Old).
url(Port,URL) :- format(atom(URL),'http://127.0.0.1:~d/editor-fixture',[Port]).

test(http_complete_read_save_conflict_does_not_change_kg,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,Port),url(Port,URL),atom_concat(URL,'?path=KBs/http.krf',ReadURL),
    plunit_source_editor:write_source('http.krf',"(old)\r\n",File),
    kb_store:generation(Initial),kb_store:load_sources([File],Initial,Loaded),
    assertion(Loaded.counts.assertions==1),
    kb_store:generation(G),findall(Id,kb_store:assertion(Id,_),Ids),
    http_get(ReadURL,Read,[json_object(dict),status_code(200)]),
    assertion(Read.path=="KBs/http.krf"),assertion(Read.text=="(old)\r\n"),
    http_post(URL,json(_{path:Read.path,text:"(incomplete\r\n",expectedRevision:Read.revision}),
      Saved,[json_object(dict),status_code(200)]),
    assertion(Saved.saved==true),assertion(Saved.revision\==Read.revision),
    http_post(URL,json(_{path:Read.path,text:"(stale)\r\n",expectedRevision:Read.revision}),
      Conflict,[json_object(dict),status_code(409)]),
    assertion(Conflict.error.code=="conflict"),
    assertion(Conflict.error.details.revision==Saved.revision),
    plunit_source_editor:raw(File,"(incomplete\r\n"),
    kb_store:generation(G),findall(Id,kb_store:assertion(Id,_),Ids).

test(http_invalid_requests_cannot_escape_or_partially_save,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(_,_,Port),url(Port,URL),
    plunit_source_editor:write_source('http.krf',"(original)\n",File),
    http_post(URL,json(_{path:"KBs/../outside.krf",text:"x",
      expectedRevision:"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"}),
      Forbidden,[json_object(dict),status_code(403)]),
    assertion(Forbidden.error.code=="forbidden"),
    http_post(URL,json(_{path:"KBs/http.krf",text:"x"}),
      Invalid,[json_object(dict),status_code(400)]),
    assertion(Invalid.error.code=="invalid_request"),
    plunit_source_editor:raw(File,"(original)\n").
:- end_tests(source_editor_api).
