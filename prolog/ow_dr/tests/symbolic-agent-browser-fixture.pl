:- module(symbolic_agent_browser_fixture,[main/0]).
:- ensure_loaded(test_symbolic_agent_http).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_json)).
:- use_module(library(readutil)).

:- http_handler('/',asset('symbolic-agent-browser-fixture.html',tests,'text/html'),[priority(100)]).
:- http_handler('/symbolic-agent.js',asset('symbolic-agent.js',web,'text/javascript'),[]).
:- http_handler('/symbolic-agent.css',asset('symbolic-agent.css',web,'text/css'),[]).
:- http_handler('/style.css',asset('style.css',web,'text/css'),[]).
:- http_handler('/symbolic-fixture-config.js',configuration,[]).

asset(Name,Scope,Mime,Request) :-
    source_file(symbolic_agent_browser_fixture:main,Here),file_directory_name(Here,Tests),
    (Scope==tests->Directory=Tests;
      file_directory_name(Tests,App),directory_file_path(App,web,Directory)),
    directory_file_path(Directory,Name,File),
    http_reply_file(File,[mime_type(Mime),cache(false),unsafe(true)],Request).
configuration(_) :-
    kb_urls:api_base(Base),atom_string(Base,Text),
    kb_kee_schema:json_text(Text,JSON),
    plunit_symbolic_agent_http:start_args(Args),
    Profile=json{agent:Args.agent,definitionMt:Args.definitionMt,linkedMts:Args.linkedMts},
    kb_kee_schema:json_text(Profile,ProfileJSON),
    format('Content-type: text/javascript~n~nwindow.symbolicFixtureApiBase=~s;~nwindow.symbolicFixtureLoadedProfile=~s;',
      [JSON,ProfileJSON]).

main :-
    setup_call_cleanup(plunit_symbolic_agent_http:http_fixture(F,Port),
      setup_call_cleanup(plunit_symbolic_agent_todos:trap_transports,
        (kb_store:generation(Before),
         format('{"port":~d}~n',[Port]),flush_output,
         read_line_to_string(user_input,_),
         kb_store:generation(After),
         flag(symbolic_todo_external_calls,Calls,Calls),
         (Before=:=After,Calls=:=0->true;throw(error(symbolic_fixture_isolation_failed,_)))),
        plunit_symbolic_agent_todos:untrap_transports),
      plunit_symbolic_agent_http:http_cleanup(F,Port)).
