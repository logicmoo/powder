:- use_module('../kb_agent_settings').
:- use_module('../kb_llm_prompt').
:- use_module('../kb_llm_transport').
:- use_module('../kb_llm_files').
:- use_module('../kb_llm_agent').
:- use_module('../kb_llm_schema').
:- use_module('../kb_llm_http',[]).
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
    (fixture_mode(slow)->sleep(8);true),
    (fixture_mode(tools),\+ (member(M,Body.messages),M.role=="tool")->
       Message=_{role:"assistant",content:null,tool_calls:[
         _{id:"fixture-call-1",type:"function",function:_{name:"not_registered",arguments:"{\"x\":1}"}}]}
    ;Message=_{role:"assistant",content:"Synthetic fixture response."}),
    reply_json_dict(_{choices:[_{message:Message}]}).

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
test(unavailable_model_never_posts,[throws(error(llm_model_unavailable,_))]) :-
    agent_settings(S),
    chat_completion(S.put(model,"missing-model"),
      [_{role:"user",content:"Synthetic unavailable-model fixture"}],[],_).
test(revision_conflict,[throws(error(agent_settings_conflict,_))]) :-
    agent_settings(S),save_agent_settings(_{model:"fixture-other",budgets:S.budgets},"old",_).
test(browser_cannot_change_route,[throws(error(domain_error(agent_fields,_),_))]) :-
    agent_settings(S),
    save_agent_settings(_{model:"fixture-other",budgets:S.budgets,baseURL:"http://example.com"},"old",_).
test(disallow_redirect,[throws(error(llm_http_status(302),_)),cleanup(retractall(user:fixture_mode(_)))]) :-
    assertz(user:fixture_mode(redirect)),discover_models(_).
test(explicit_model_every_request) :-
    agent_settings(Before),
    save_agent_settings(_{model:"gpt-5.6-sol",budgets:Before.budgets},Before.revision,S),
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

wait_chat(Id,Reply) :-
    call_with_time_limit(90,wait_chat_loop(Id,Reply)).
wait_chat_loop(Id,Reply) :-
    kb_llm_agent:id_atom(Id,Atom),
    (kb_llm_agent:owned_run(Atom,_,_,_)->sleep(0.1),wait_chat_loop(Id,Reply);
     conversation(Id,Reply)).
:- begin_tests(llm_chat,[setup(fixture_setup(State)),cleanup(fixture_cleanup(State))]).
test(start_snapshots_without_completion_and_chat_is_explicit) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    assertion(\+fixture_request(_,_)),assertion(C.status=="ready"),
    start_chat(_{id:C.id,revision:C.revision,text:"Synthetic fixture Ω",approvedNonsensitive:true},_),
    wait_chat(C.id,After),assertion(After.status=="ready"),
    assertion(After.promptHash==C.promptHash),
    assertion(member(_{role:"assistant",content:"Synthetic fixture response."},After.messages)).
test(export_requires_real_action_ack,[throws(error(permission_error(export,llm_input,approval_required),_))]) :-
    start_chat(_{id:"not-used",revision:0,text:"fixture",approvedNonsensitive:false},_).
test(tool_protocol_preserved_and_unknown_calls_never_execute,
     [cleanup(retractall(user:fixture_mode(_)))]) :-
    assertz(user:fixture_mode(tools)),
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    start_chat(_{id:C.id,revision:0,text:"Synthetic tool fixture",approvedNonsensitive:true},_),
    wait_chat(C.id,A),assertion(A.status=="ready"),
    A.calls=[Record],assertion(Record.id=="fixture-call-1"),
    assertion(Record.result.ok==false),
    user:fixture_request(chat,Request),
    member(ToolMessage,Request.messages),ToolMessage.role=="tool",
    assertion(ToolMessage.tool_call_id=="fixture-call-1"),!.
test(stop_during_http_discards_late_response,
     [cleanup(retractall(user:fixture_mode(_)))]) :-
    assertz(user:fixture_mode(slow)),
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    start_chat(_{id:C.id,revision:0,text:"Synthetic cancellation fixture",approvedNonsensitive:true},_),
    kb_llm_agent:id_atom(C.id,Id),
    call_with_time_limit(30,wait_http(Id)),
    interrupt_chat(C.id,_),wait_chat(C.id,A),
    assertion(A.status=="interrupted"),assertion(A.calls==[]),
    findall(Role,(member(M,A.messages),get_dict(role,M,Role)),Roles),
    assertion(\+member("assistant",Roles)),
    kb_activity:activity_status(Activity),assertion(Activity.active=:=0).
test(durable_call_reservation_refuses_unknown_and_reuses_completed) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),uuid(Run,[version(4)]),
    Request=_{id:C.id,revision:0,text:"Synthetic journal fixture",approvedNonsensitive:true},
    kb_llm_agent:update_document(C.id,kb_llm_agent:accept_chat(Request,Run)),
    Call=_{id:"fixture-journal-call",type:"function",
           function:_{name:"fixture",arguments:"{}"}},
    kb_llm_agent:reserve_call(C.id,Run,Call,"fixture-hash",new),
    catch(kb_llm_agent:reserve_call(C.id,Run,Call,"fixture-hash",_),
          error(llm_call_outcome_unknown,_),Refused=true),
    assertion(Refused==true),
    kb_llm_agent:store_call(C.id,Run,Call,"fixture-hash",_{ok:true,fixture:true},_{mutation:false}),
    kb_llm_agent:reserve_call(C.id,Run,Call,"fixture-hash",completed(Result)),
    assertion(Result.fixture==true),
    catch(kb_llm_agent:reserve_call(C.id,Run,Call,"different",_),
          error(llm_call_id_conflict,_),Conflict=true),
    assertion(Conflict==true).
:- end_tests(llm_chat).
wait_http(Id) :-
    (kb_llm_agent:owned_run(Id,_,_,http)->true;sleep(0.05),wait_http(Id)).

:- begin_tests(llm_schema).
test(import_opens_no_listener_or_agent_worker) :-
    findall(Port,http_current_server(_,Port),Ports),
    assertion(Ports==[]),assertion(\+kb_llm_agent:owned_run(_,_,_,_)).
test(real_kee_registry_discovery_no_knowledge_execution) :-
    Config=_{conversation:"fixture-conversation",model:"gpt-5.6-sol",
      budgets:_{calls:4,seconds:5}},
    Prompt=_{revision:"fixture-prompt-v1",rawHash:"fixture-hash"},
    Scope=_{terms:["x_Fixture"],readMts:["x_FixtureMt"],writeMts:[]},
    setup_call_cleanup(kb_llm_kee:open_turn(Config,Prompt,Scope,Handle,Tools),
      (maplist(kb_llm_schema:tool_schema,Tools,Names),
       assertion(member("kee_definitions",Names)),
       assertion(member("kee_occurrences",Names)),
       assertion(\+member("kee_find_terms",Names))),
      kb_llm_kee:close_turn(Handle)).
schema_fixture(_{type:"object",properties:_{name:_{type:"string",maxLength:8},
                 count:_{type:"integer",minimum:1,maximum:3}},
                 required:["name","count"],additionalProperties:false}).
test(valid_object) :- schema_fixture(S),validate_arguments(S,"{\"name\":\"a\",\"count\":2}",_).
test(extra_field,[throws(error(llm_arguments_mismatch,_))]) :-
    schema_fixture(S),validate_arguments(S,"{\"name\":\"a\",\"count\":2,\"approved\":true}",_).
test(wrong_type,[throws(error(llm_arguments_mismatch,_))]) :-
    schema_fixture(S),validate_arguments(S,"{\"name\":\"a\",\"count\":\"2\"}",_).
test(root_must_object,[throws(error(type_error(dict,_),_))]) :-
    schema_fixture(S),validate_arguments(S,"[1,2]",_).
test(required_field,[throws(error(llm_arguments_mismatch,_))]) :-
    schema_fixture(S),validate_arguments(S,"{\"name\":\"a\"}",_).
test(duplicate_json_keys_are_rejected) :-
    schema_fixture(S),
    catch(validate_arguments(S,"{\"name\":\"a\",\"name\":\"b\",\"count\":2}",_),_,Rejected=true),
    assertion(Rejected==true).
test(result_projection_drops_private_paths_and_diagnostics) :-
    kb_llm_kee:project(_{items:[_{id:"fixture",expression:_{type:"symbol",value:"x_Fixture"},
        source:"private-file",message:"private diagnostic"}]},Safe),
    Safe.items=[Item],assertion(\+get_dict(source,Item,_)),assertion(\+get_dict(message,Item,_)).
test(http_rejects_missing_origin_without_browser_referrer,
     [throws(error(llm_forbidden,_))]) :-
    kb_llm_http:authorize([method(post),peer(ip(127,0,0,1))]).
test(http_rejects_nonloopback,
     [throws(error(llm_forbidden,_))]) :-
    kb_llm_http:authorize([method(post),peer(ip(203,0,113,1)),origin('http://localhost:3050')]).
:- end_tests(llm_schema).
