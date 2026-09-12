:- use_module('../kb_agent_settings').
:- use_module('../kb_llm_prompt').
:- use_module('../kb_llm_transport').
:- use_module('../kb_llm_files').
:- use_module(library(plunit)).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(utf8)).
:- dynamic fixture_request/2,fixture_mode/1.
:- http_handler(root('v1/models'),fixture_models,[]).
:- http_handler(root('v1/chat/completions'),fixture_chat,[]).
fixture_models(_Request) :-
    assertz(fixture_request(models,none)),
    (fixture_mode(redirect)->
       format('Status: 302 Found~nLocation: http://127.0.0.1:1/forbidden~nContent-Type: application/json~n~n{}');
     reply_json_dict(_{data:[_{id:"gpt-5.6-sol"},_{id:"fixture-other"}]})).
fixture_chat(Request) :-
    http_read_json_dict(Request,Body),assertz(fixture_request(chat,Body)),
    reply_json_dict(_{choices:[_{message:_{role:"assistant",content:"Synthetic fixture response."}}]}).

fixture_setup(State) :-
    source_file(fixture_setup(_),Source),file_directory_name(Source,Tests),
    uuid(Id),atom_concat('.llm-fixture-',Id,Name),directory_file_path(Tests,Name,Directory),
    make_directory(Directory),
    findall(Key-Value,(member(Key,['POWDER_AGENT_STATE','POWDER_LLM_BASE_URL']),
      (getenv(Key,Value)->true;Value=absent)),Previous),
    http_server(http_dispatch,[port('127.0.0.1':Port),workers(1)]),
    format(atom(Base),'http://127.0.0.1:~d/v1',[Port]),
    setenv('POWDER_AGENT_STATE',Directory),setenv('POWDER_LLM_BASE_URL',Base),
    retractall(fixture_request(_,_)),retractall(fixture_mode(_)),
    State=state(Directory,Port,Previous).
fixture_cleanup(state(Directory,Port,Previous)) :-
    http_stop_server(Port,[]),
    forall(member(Key-Value,Previous),(Value==absent->unsetenv(Key);setenv(Key,Value))),
    delete_directory_and_contents(Directory).

:- begin_tests(llm_settings,[setup(fixture_setup(State)),cleanup(fixture_cleanup(State))]).
test(default_persisted_explicit_model_no_network) :-
    agent_settings(S),assertion(S.model=="gpt-5.6-sol"),
    agent_state_dir(D),directory_file_path(D,'llm-knowledge.json',F),
    assertion(exists_file(F)),assertion(\+fixture_request(_,_)),
    agent_settings(Again),assertion(Again.revision==S.revision).
test(actual_model_picker_and_saved_choice) :-
    discover_models(M),assertion(M.selectedAvailable==true),
    assertion(member("fixture-other",M.items)),agent_settings(S),
    save_agent_settings(_{model:"fixture-other",budgets:S.budgets},S.revision,Saved),
    assertion(Saved.model=="fixture-other"),discover_models(Other),
    assertion(Other.selected=="fixture-other"),
    assertion(\+fixture_request(chat,_)).
test(missing_model_preserved_no_fallback) :-
    agent_settings(S),
    save_agent_settings(_{model:"missing-model",budgets:S.budgets},S.revision,_),
    discover_models(M),assertion(M.selected=="missing-model"),
    assertion(M.selectedAvailable==false).
test(revision_conflict,[throws(error(agent_settings_conflict,_))]) :-
    agent_settings(S),save_agent_settings(_{model:"fixture-other",budgets:S.budgets},"old",_).
test(browser_cannot_change_route,[throws(error(domain_error(agent_fields,_),_))]) :-
    agent_settings(S),
    save_agent_settings(_{model:"fixture-other",budgets:S.budgets,baseURL:"http://example.com"},"old",_).
test(disallow_redirect,[throws(error(llm_http_status(302),_)),cleanup(retractall(user:fixture_mode(_)))]) :-
    assertz(user:fixture_mode(redirect)),discover_models(_).
test(explicit_model_every_request) :-
    agent_settings(S),
    chat_completion(S,[_{role:"user",content:"Synthetic fixture hello."}],[],Reply),
    assertion(Reply.choices\=[]),fixture_request(chat,Request),
    assertion(Request.model==S.model),assertion(Request.stream==false).
test(no_arbitrary_route,[throws(error(permission_error(connect,llm_route,unsupported),_))]) :-
    host_provider(Base),provider_json(get,Base,"../secret",none,_).
test(prompt_bytes_and_layout_hash) :-
    agent_state_dir(D),directory_file_path(D,'prompt.md',F),
    string_codes("Synthetic Ω fixture.\r\n",Codes),phrase(utf8_codes(Codes),Bytes),
    atomic_bytes(F,Bytes),kb_llm_prompt:snapshot_file(F,P),
    assertion(P.content=="Synthetic Ω fixture.\r\n"),bytes_hash(Bytes,Hash),
    assertion(P.rawHash==Hash).
test(prompt_snapshot_immutable_archive) :-
    prompt_snapshot(A),agent_state_dir(D),directory_file_path(D,'prompts',PD),
    atom_concat(A.rawHash,'.md',Name),directory_file_path(PD,Name,F),
    read_bytes(F,65536,Bytes),bytes_hash(Bytes,A.rawHash),
    prompt_snapshot(B),assertion(A=@=B).
test(prompt_edit_conflict_preserves_bytes) :-
    agent_state_dir(D),directory_file_path(D,'editable-prompt.md',F),
    atomic_bytes(F,[65,13,10]),bytes_hash([65,13,10],Expected),
    catch(kb_llm_prompt:save_prompt_file(F,[66],"wrong"),
          error(agent_prompt_conflict,_),Rejected=true),
    assertion(Rejected==true),read_bytes(F,64,Before),assertion(Before==[65,13,10]),
    kb_llm_prompt:save_prompt_file(F,[66],Expected),
    read_bytes(F,64,After),assertion(After==[66]).
:- end_tests(llm_settings).
