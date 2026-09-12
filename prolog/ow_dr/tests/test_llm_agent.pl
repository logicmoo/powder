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
:- use_module(library(http/http_open)).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(utf8)).
:- dynamic fixture_request/2,fixture_mode/1.
:- http_handler(root('v1/models'),fixture_models,[]).
:- http_handler(root('v1/chat/completions'),fixture_chat,[]).
:- http_handler(root('llm-unicode-reply'),fixture_unicode_reply,[]).
fixture_models(_Request) :-
    assertz(fixture_request(models,none)),
    (fixture_mode(redirect)->
       format('Status: 302 Found~nLocation: http://127.0.0.1:1/forbidden~nContent-Type: application/json~n~n{}');
     reply_json_dict(_{data:[_{id:"gpt-5.6-sol"},_{id:"fixture-other"}]})).
fixture_chat(Request) :-
    fixture_chat_body(Request,Body),assertz(fixture_request(chat,Body)),
    (fixture_mode(slow)->sleep(8);true),
    (fixture_mode(unicode)->unicode_fixture(Text),Message=_{role:"assistant",content:Text};
     fixture_mode(managed)->fixture_managed_message(Body.messages,Message);
     fixture_mode(tools),\+ (member(M,Body.messages),M.role=="tool")->
       Message=_{role:"assistant",content:null,tool_calls:[
         _{id:"fixture-call-1",type:"function",function:_{name:"not_registered",arguments:"{\"x\":1}"}}]}
    ;Message=_{role:"assistant",content:"Synthetic fixture response."}),
    Reply=_{choices:[_{message:Message}]},
    (fixture_mode(unicode)->kb_llm_http:respond(200,Reply);reply_json_dict(Reply)).
fixture_chat_body(Request,Body) :-
    fixture_mode(unicode),!,
    memberchk(input(In),Request),memberchk(content_length(Size),Request),
    stream_property(In,encoding(Encoding)),
    setup_call_cleanup(set_stream(In,encoding(octet)),
      read_string(In,Size,Raw),set_stream(In,encoding(Encoding))),
    string_codes(Raw,Bytes),assertz(fixture_request(chat_bytes,Bytes)),
    bytes_text(Bytes,Text),atom_json_dict(Text,Body,[]).
fixture_chat_body(Request,Body) :- http_read_json_dict(Request,Body).
unicode_fixture(Text) :- string_codes(Text,[128512]).
fixture_unicode_reply(_) :- unicode_fixture(Text),kb_llm_http:respond(200,_{value:Text}).
fixture_managed_message(Messages,Message) :-
    (member(M,Messages),get_dict(tool_call_id,M,"managed-create")->
       Message=_{role:"assistant",content:"Synthetic managed TODO was created."};
     member(M,Messages),get_dict(tool_call_id,M,"managed-ledger")->
       atom_json_dict(M.content,Result,[]),synthetic_task(Data),
       atom_json_dict(Args,_{revision:Result.result.revision,mt:null,data:Data},[as(string)]),
       Message=_{role:"assistant",content:null,tool_calls:[
         _{id:"managed-create",type:"function",function:_{name:"kee_todo_create",arguments:Args}}]};
     Message=_{role:"assistant",content:null,tool_calls:[
         _{id:"managed-ledger",type:"function",function:_{name:"kee_ledger_status",arguments:"{}"}}]}).

fixture_setup(State) :-
    source_file(fixture_setup(_),Source),file_directory_name(Source,Tests),
    uuid(Id),atom_concat('.llm-fixture-',Id,Name),directory_file_path(Tests,Name,Directory),
    make_directory(Directory),
    findall(Key-Value,(member(Key,['POWDER_AGENT_STATE','POWDER_LLM_BASE_URL','POWDER_KEE_STATE_DIR']),
      (getenv(Key,Value)->true;Value=absent)),Previous),
    http_server(http_dispatch,[port('127.0.0.1':Port),workers(1)]),
    format(atom(Base),'http://127.0.0.1:~d/v1',[Port]),
    setenv('POWDER_AGENT_STATE',Directory),setenv('POWDER_LLM_BASE_URL',Base),
    directory_file_path(Directory,'kee',KeeState),setenv('POWDER_KEE_STATE_DIR',KeeState),
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

:- begin_tests(llm_unicode,[setup(fixture_setup(State)),cleanup(fixture_cleanup(State))]).
test(atomic_json_persists_scalar_utf8_and_reloads) :-
    unicode_fixture(Text),agent_state_dir(Dir),directory_file_path(Dir,'unicode.json',File),
    atomic_json(File,_{value:Text}),read_bytes(File,100,Bytes),
    assertion(Bytes==[123,34,118,97,108,117,101,34,58,34,240,159,152,128,34,125]),
    retractall(kb_llm_files:json_cache(File,_,_)),read_json(File,Again),
    assertion(Again.value==Text).
test(canonical_hash_uses_scalar_utf8_not_cesu8) :-
    unicode_fixture(Text),kb_llm_kee:digest_json(_{value:Text},Hash),
    bytes_hash([123,34,118,97,108,117,101,34,58,34,240,159,152,128,34,125],Expected),
    atom_string(Expected,Hash).
test(byte_budget_counts_four_byte_scalar_and_escapes) :-
    unicode_fixture(Text),Value=_{value:Text},
    kb_llm_agent:bounded_json(Value,16),
    catch(kb_llm_agent:bounded_json(Value,15),error(resource_error(llm_payload_budget),_),Rejected=true),
    assertion(Rejected==true),
    kb_llm_agent:bounded_json(_{value:"\n"},14).
test(normalization_preserves_supplementary_keys_and_values) :-
    unicode_fixture(Text),atom_string(Key,Text),dict_create(Value,json,[Key-Text]),
    kb_llm_kee:json_normalize(Value,Again),get_dict(Key,Again,Actual),assertion(Actual==Text).
test(ascii_canonical_hash_is_unchanged) :-
    Value=_{a:"ASCII\nquoted \" text",b:[1,true,null]},
    atom_json_dict(Original,Value,[as(string),width(0)]),string_codes(Original,Codes),
    phrase(utf8_codes(Codes),Bytes),bytes_hash(Bytes,Expected),
    kb_llm_kee:digest_json(Value,Hash),atom_string(Expected,Hash).
test(provider_wire_uses_real_utf8_only,
     [setup(asserta(user:fixture_mode(unicode))),cleanup(retractall(user:fixture_mode(_)))]) :-
    unicode_fixture(Text),agent_settings(Config),
    chat_completion(Config,[_{role:"user",content:Text}],[],Reply),
    Reply.choices=[Choice],assertion(Choice.message.content==Text),
    fixture_request(chat_bytes,Bytes),
    assertion(append(_,[240,159,152,128|_],Bytes)),
    assertion(\+append(_,[237,160,189,237,184,128|_],Bytes)),
    fixture_request(chat,Request),assertion(member(_{role:"user",content:Text},Request.messages)).
test(local_http_response_has_scalar_utf8_and_headers) :-
    host_provider(Base),string_concat(Root,"/v1",Base),
    string_concat(Root,"/llm-unicode-reply",URL),
    setup_call_cleanup(http_open(URL,In,[timeout(5),bypass_proxy(true),redirect(false),
        status_code(Status),header(content_type,Type),header(cache_control,Cache)]),
      (set_stream(In,encoding(octet)),read_string(In,100,Raw)),close(In)),
    string_codes(Raw,Bytes),
    assertion(Status==200),assertion(sub_atom(Type,0,_,_,'application/json')),
    assertion(Cache=='no-store'),
    assertion(Bytes==[123,34,118,97,108,117,101,34,58,34,240,159,152,128,34,125]).
test(text_only_chat_roundtrip_with_supplementary_text,
     [setup(asserta(user:fixture_mode(unicode))),cleanup(retractall(user:fixture_mode(_)))]) :-
    unicode_fixture(Text),start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    start_chat(_{id:C.id,revision:C.revision,text:Text,approvedNonsensitive:true},_),
    wait_chat(C.id,After),assertion(After.status=="ready"),
    assertion(member(_{role:"user",content:Text},After.messages)),
    assertion(member(_{role:"assistant",content:Text},After.messages)),
    assertion(\+ (member(M,After.messages),get_dict(role,M,"tool"))).
:- end_tests(llm_unicode).

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
    wait_chat(C.id,A),assertion(A.status=="failed"),
    assertion(A.error.code=="grounding_not_approved"),
    A.calls=[Record],assertion(Record.id=="fixture-call-1"),
    assertion(Record.result.ok==false),
    member(ToolMessage,A.messages),ToolMessage.role=="tool",
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
test(model_mutation_suggestions_are_withheld_before_native_execution,
     [cleanup(retractall(user:fixture_mode(_)))]) :-
    assertz(user:fixture_mode(managed)),
    findall(B,fixture_request(chat,B),BeforeRequests),length(BeforeRequests,BeforeCount),
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    start_chat(_{id:C.id,revision:0,text:"Synthetic managed TODO fixture",approvedNonsensitive:true},_),
    wait_chat(C.id,A),assertion(A.status=="failed"),
    assertion(A.error.code=="grounding_not_approved"),
    A.calls=[Record],assertion(Record.name=="kee_ledger_status"),
    assertion(Record.result.ok==false),assertion(Record.result.outcome=="rejected"),
    local_todos(C.id,Local),assertion(Local.items==[]),
    findall(B,fixture_request(chat,B),AfterRequests),length(AfterRequests,AfterCount),
    assertion(AfterCount=:=BeforeCount+1),last(AfterRequests,Request),
    assertion(\+get_dict(tools,Request,_)),
    getenv('POWDER_KEE_STATE_DIR',KeeDir),assertion(\+exists_directory(KeeDir)).
test(lost_mutation_outcome_blocks_new_turns_without_reexecution) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),uuid(Run),
    Request=_{id:C.id,revision:0,text:"Synthetic lost receipt fixture",approvedNonsensitive:true},
    kb_llm_agent:update_document(C.id,kb_llm_agent:accept_chat(Request,Run)),
    kb_llm_agent:load_document(C.id,D),Config=D.config.put(conversation,D.id),
    setup_call_cleanup(kb_llm_kee:open_turn(Config,D.prompt,D.scope,H,_),
      (kee_fixture_call(H,"kee_ledger_status",_{},"before-lost",Status),synthetic_task(Data),
       atom_json_dict(Args,_{revision:Status.revision,mt:null,data:Data},[as(string)]),
       Call=_{id:"synthetic-lost",type:"function",function:_{name:"kee_todo_create",arguments:Args}},
       kb_llm_agent:reserve_call(C.id,Run,Call,"fixture-hash",new),
       kee_fixture_recorded_call(H,Call,Committed),assertion(Committed.committed==true),
       catch(kb_llm_agent:call_error(C.id,Run,Call,"fixture-hash",
         error(io_error(synthetic_lost_reply),_),_),
         error(llm_mutation_unconfirmed,_),Stopped=true),assertion(Stopped==true),
       kb_llm_agent:finish_error(C.id,Run,error(llm_mutation_unconfirmed,_)),
       conversation(C.id,After),After.calls=[Record],assertion(Record.state=="unknown"),
       findall(B,fixture_request(chat,B),BeforeRequests),
       catch(start_chat(_{id:C.id,revision:After.revision,text:"Synthetic retry",approvedNonsensitive:true},_),
         error(llm_call_outcome_unknown,_),Blocked=true),assertion(Blocked==true),
       findall(B,fixture_request(chat,B),AfterRequests),assertion(BeforeRequests=@=AfterRequests),
       kb_llm_kee:local_todos(H,Tasks),assertion(Tasks.total=:=1)),
      kb_llm_kee:close_turn(H)).
:- end_tests(llm_chat).
wait_http(Id) :-
    (kb_llm_agent:owned_run(Id,_,_,http)->true;sleep(0.05),wait_http(Id)).

:- begin_tests(llm_schema).
test(import_opens_no_listener_or_agent_worker) :-
    findall(Port,http_current_server(_,Port),Ports),
    assertion(Ports==[]),assertion(\+kb_llm_agent:owned_run(_,_,_,_)).
test(cancelled_validation_cannot_admit_an_http_phase) :-
    uuid(Run),thread_self(Thread),
    setup_call_cleanup(
      (assertz(kb_llm_agent:owned_run('synthetic-phase',Run,Thread,validating)),
       assertz(kb_llm_agent:cancelled(Run))),
      (catch(kb_llm_agent:set_phase('synthetic-phase',Run,http),llm_cancelled,Stopped=true),
       assertion(Stopped==true),assertion(\+kb_llm_agent:owned_run('synthetic-phase',Run,_,http))),
      (retractall(kb_llm_agent:owned_run('synthetic-phase',Run,_,_)),
       retractall(kb_llm_agent:cancelled(Run)))).
test(precommit_rejections_are_distinct_from_ambiguous_budget_or_io_failures) :-
    assertion(kb_llm_agent:definite_rejection(error(kee(ledger_conflict,json{}),_))),
    assertion(kb_llm_agent:definite_rejection(error(kee(resource_conflict,json{}),_))),
    assertion(\+kb_llm_agent:definite_rejection(error(kee(result_budget,json{}),_))),
    assertion(\+kb_llm_agent:definite_rejection(error(io_error(synthetic),_))).
test(unavailable_registry_never_bypasses_export_revalidation,
     [throws(error(llm_registry_unavailable,_))]) :-
    kb_llm_kee:verify_outgoing(none).
test(real_kee_registry_discovery_no_knowledge_execution) :-
    Config=_{conversation:"fixture-conversation",model:"gpt-5.6-sol",policyVersion:"llm-exact-grounding-v2",
      budgets:_{calls:4,seconds:5}},
    Prompt=_{revision:"fixture-prompt-v1",rawHash:"fixture-hash"},
    Scope=_{terms:["x_Fixture"],readMts:["x_FixtureMt"],writeMts:[]},
    setup_call_cleanup(kb_llm_kee:open_turn(Config,Prompt,Scope,Handle,Tools),
      (maplist(kb_llm_schema:tool_schema,Tools,Names),
       assertion(Names==[]),
       kb_llm_kee:registry_status(Status),assertion(Status.available==true),
       assertion(Status.mutationAvailable==true),assertion(Status.exportGateReady==false)),
      kb_llm_kee:close_turn(Handle)).
schema_fixture(_{type:"object",properties:_{name:_{type:"string",maxLength:8},
                 count:_{type:"integer",minimum:1,maximum:3}},
                 required:["name","count"],additionalProperties:false}).
test(valid_object) :- schema_fixture(S),validate_arguments(S,"{\"name\":\"a\",\"count\":2}",_).
test(nullable_canonical_schema_without_weakening_objects) :-
    S=_{type:"object",properties:_{mt:_{anyOf:[_{type:"string"},_{type:"null"}]}},
        required:["mt"],additionalProperties:false},
    kb_llm_schema:schema(S),validate_arguments(S,"{\"mt\":null}",A),assertion(A.mt==null),
    validate_arguments(S,"{\"mt\":\"x_FixtureMt\"}",_),
    catch(validate_arguments(S,"{\"mt\":1}",_),error(llm_arguments_mismatch,_),Rejected=true),
    assertion(Rejected==true).
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

kee_fixture_context(Scope,H,Tools) :-
    agent_settings(S),uuid(A),atom_string(A,Conversation),
    Config=S.put(_{conversation:Conversation,policyVersion:"llm-exact-grounding-v2",
                   budgets:S.budgets.put(calls,32)}),
    kb_llm_kee:open_turn(Config,_{revision:"synthetic-prompt",rawHash:"synthetic-hash"},Scope,H,Tools).
kee_fixture_call(H,Name,Args,Id,R) :-
    % Seed historical/local receipts through the real facade, never provider dispatch.
    H=kee(Token,_,_,_,Conversation),
    kb_llm_kee:json_normalize(Args,CheckedArgs),
    (kb_llm_kee:mutation_name(Name)->
       catch(kb_llm_kee:check_owned_mutation(Conversation,Name,CheckedArgs),Error,
         throw(error(llm_call_rejected,Error))),Mutation=true;Mutation=false),
    kb_kee:invoke(Token,_{tool:Name,schemaVersion:1,callId:Id,arguments:CheckedArgs},Raw),
    kb_llm_kee:json_normalize(Raw,Reply),
    (Mutation==true->kb_llm_kee:mutation_receipt(Token,Conversation,Reply.result,R);
     Name=="kee_ledger_status"->R=_{revision:Reply.result.revision};R=Reply.result).
kee_fixture_recorded_call(H,Call,R) :-
    atom_json_dict(Call.function.arguments,Args,[]),
    kee_fixture_call(H,Call.function.name,Args,Call.id,R).
synthetic_task(_{title:"Synthetic fixture task",description:"Synthetic fixture data",
  status:"open",priority:0,dependencies:[],evidence:[],acceptance:[],
  links:_{conversation:null,agent:null,changesets:[],assertions:[]}}).
fixture_create(H,Id,R) :-
    kee_fixture_call(H,"kee_ledger_status",_{},"ledger-before-fixture",Status),synthetic_task(Data),
    kee_fixture_call(H,"kee_todo_create",_{revision:Status.revision,mt:null,data:Data},Id,R).

:- begin_tests(llm_kee,[setup(fixture_setup(State)),cleanup(fixture_cleanup(State))]).
test(selected_term_alone_cannot_export_or_advertise_reads) :-
    Scope=_{terms:["x_Synthetic"],readMts:["x_FixtureMt"],writeMts:[]},
    setup_call_cleanup(kee_fixture_context(Scope,H,Tools),
      (assertion(\+ (member(T,Tools),get_dict(function,T,F),get_dict(name,F,"kee_definitions"))),
       catch(kb_llm_kee:verify_outgoing(H),error(llm_grounding_not_approved,_),Rejected=true),
       assertion(Rejected==true),assertion(\+fixture_request(_,_))),
      kb_llm_kee:close_turn(H)).
test(exact_preview_stays_local_and_incomplete_approval_cannot_enable_export) :-
    Scope=_{terms:[],readMts:[],writeMts:[]},
    kb_llm_kee:preview_grounding(_{scope:Scope,requests:[
      _{tool:"kee_todo_list",arguments:_{mt:null}}]},Preview),
    GrantScope=Scope.put(grant,Preview.id),
    assertion(\+kb_llm_kee:approved_document(GrantScope,_)),
    catch(kb_llm_kee:approve_grounding(
      _{id:Preview.id,hash:"wrong",approvedNonsensitive:true},_),
      error(llm_grounding_conflict,_),Conflict=true),assertion(Conflict==true),
    kb_llm_kee:grant_file(Preview.id,File),fixture_file_hash(File,Before),
    catch(kb_llm_kee:approve_grounding(_{id:Preview.id,hash:Preview.hash,approvedNonsensitive:true},_),
      error(llm_grounding_not_approved,_),Blocked=true),assertion(Blocked==true),
    fixture_file_hash(File,After),assertion(Before==After),
    catch(start_conversation(GrantScope,_),error(llm_grounding_not_approved,_),StartBlocked=true),
    assertion(StartBlocked==true),
    setup_call_cleanup(kee_fixture_context(GrantScope,H,Tools),
      (assertion(Tools==[]),
       catch(kb_llm_kee:verify_outgoing(H),error(llm_grounding_not_approved,_),Withheld=true),
       assertion(Withheld==true),assertion(\+fixture_request(_,_))),
      kb_llm_kee:close_turn(H)).
test(corrupt_preview_cannot_reuse_an_approved_hash) :-
    Scope=_{terms:[],readMts:[],writeMts:[]},
    kb_llm_kee:preview_grounding(_{scope:Scope,requests:[
      _{tool:"kee_todo_list",arguments:_{mt:null}}]},Preview),
    kb_llm_kee:grant_file(Preview.id,File),kb_llm_files:read_json(File,D),D.entries=[Entry],
    kb_llm_files:atomic_json(File,D.put(entries,[Entry.put(material,_{text:"Unapproved synthetic replacement"})])),
    catch(kb_llm_kee:approve_grounding(_{id:Preview.id,hash:Preview.hash,approvedNonsensitive:true},_),
          error(llm_grounding_corrupt,_),Corrupt=true),assertion(Corrupt==true).
test(preview_cannot_read_an_unselected_term,[throws(error(llm_export_scope_denied,_))]) :-
    kb_llm_kee:preview_grounding(_{scope:_{terms:["x_A"],readMts:["x_Mt"],writeMts:[]},
      requests:[_{tool:"kee_definitions",arguments:_{term:"x_B",mt:"x_Mt"}}]},_).
test(preview_cannot_be_a_mutation,[throws(error(permission_error(preview,llm_tool,unsupported),_))]) :-
    kb_llm_kee:preview_grounding(_{scope:_{terms:[],readMts:[],writeMts:[]},
      requests:[_{tool:"kee_todo_create",arguments:_{}}]},_).
test(real_todo_create_replay_update_undo_redo_and_local_inspection) :-
    setup_call_cleanup(kee_fixture_context(_{terms:[],readMts:[],writeMts:[]},H,_),
      (kee_fixture_call(H,"kee_ledger_status",_{},"s0",Status),synthetic_task(Data),
       Args=_{revision:Status.revision,mt:null,data:Data},
       kee_fixture_call(H,"kee_todo_create",Args,"create-exact",Created),
       assertion(Created.committed==true),assertion(Created.replayed==false),
       assertion(\+get_dict(data,Created,_)),get_dict(resourceRevision,Created,ResourceRevision),
       kee_fixture_call(H,"kee_todo_create",Args,"create-exact",Replay),
       assertion(Replay.replayed==true),assertion(Replay.result.id==Created.result.id),
       kee_fixture_call(H,"kee_todo_update",_{revision:Replay.currentRevision,id:Created.result.id,
         resourceRevision:ResourceRevision,mt:null,data:Data.put(title,"Synthetic changed")},"update-exact",Updated),
       kee_fixture_call(H,"kee_undo",_{revision:Updated.currentRevision,changeset:Updated.changeset},"undo-exact",Undo),
       kee_fixture_call(H,"kee_redo",_{revision:Undo.currentRevision,changeset:Undo.changeset},"redo-exact",Redo),
       assertion(Redo.committed==true),kb_llm_kee:local_todos(H,Local),
       Local.items=[Item],assertion(Item.result.resource.data.title=="Synthetic changed"),
       assertion(\+fixture_request(_,_))),
      kb_llm_kee:close_turn(H)).
test(other_conversation_task_and_done_attestation_are_denied) :-
    Scope=_{terms:[],readMts:[],writeMts:[]},
    setup_call_cleanup(kee_fixture_context(Scope,H,_),
      (fixture_create(H,"own-fixture",Created),
       setup_call_cleanup(kee_fixture_context(Scope,Other,_),
         (catch(kee_fixture_call(Other,"kee_todo_delete",_{revision:Created.currentRevision,
           id:Created.result.id,resourceRevision:Created.resourceRevision},"foreign-delete",_),
           error(llm_call_rejected,error(permission_error(mutate,todo,outside_conversation),_)),Blocked=true),
          assertion(Blocked==true)),
         kb_llm_kee:close_turn(Other)),
       synthetic_task(Data),
       catch(kee_fixture_call(H,"kee_todo_update",_{revision:Created.currentRevision,
          id:Created.result.id,resourceRevision:Created.resourceRevision,mt:null,
          data:Data.put(status,"done")},"forbidden-done",_),error(kee(_,_),_),Attestation=true),
       assertion(Attestation==true)),
      kb_llm_kee:close_turn(H)).
test(legacy_policy_never_exports,[throws(error(llm_conversation_policy_upgrade_required,_))]) :-
    agent_settings(S),
    kb_llm_kee:open_turn(S.put(conversation,"old"),_{revision:"p",rawHash:"h"},
      _{terms:[],readMts:[],writeMts:[]},_,_).
:- end_tests(llm_kee).

receipt_setup_conversation(Scope,C,Run,D,Config) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),uuid(Run),
    R=_{id:C.id,revision:0,text:"Synthetic receipt inspection fixture",approvedNonsensitive:true},
    kb_llm_agent:update_document(C.id,kb_llm_agent:accept_chat(R,Run)),
    kb_llm_agent:update_document(C.id,user:receipt_fixture_scope(Scope)),
    kb_llm_agent:load_document(C.id,D),Config=D.config.put(conversation,D.id).
receipt_fixture_scope(Scope,Before,After) :- After=Before.put(scope,Scope).
receipt_reservation(C,Run,Args,Call) :-
    atom_json_dict(Text,Args,[as(string)]),
    Call=_{id:"synthetic-inspected-call",type:"function",
           function:_{name:"kee_todo_create",arguments:Text}},
    kb_llm_agent:reserve_call(C.id,Run,Call,"synthetic-receipt-hash",new).
fixture_file_hash(File,Hash) :- read_bytes(File,33554432,Bytes),bytes_hash(Bytes,Hash).

:- begin_tests(llm_receipts,[setup(fixture_setup(State)),cleanup(fixture_cleanup(State))]).
test(unknown_probe_never_creates_native_state_or_changes_host_reservation) :-
    receipt_setup_conversation(_{terms:[],readMts:[],writeMts:[]},C,Run,_,_),
    receipt_reservation(C,Run,_{},Call),
    getenv('POWDER_KEE_STATE_DIR',KeeDir),assertion(\+exists_directory(KeeDir)),
    kb_llm_agent:conversation_file(C.id,File),fixture_file_hash(File,Before),
    local_receipt(C.id,Call.id,Reply),
    assertion(Reply.status=="unknown"),assertion(Reply.commit==null),
    assertion(Reply.localState=="reserved"),assertion(\+exists_directory(KeeDir)),
    fixture_file_hash(File,After),assertion(Before==After),assertion(\+fixture_request(_,_)).
test(committed_probe_preserves_ledger_snapshot_namespace_and_host_state) :-
    receipt_setup_conversation(_{terms:[],readMts:[],writeMts:[]},C,Run,D,Config),
    setup_call_cleanup(kb_llm_kee:open_turn(Config,D.prompt,D.scope,H,Tools),
      (assertion(\+ (member(T,Tools),get_dict(function,T,F),get_dict(name,F,"kee_call_status"))),
       kee_fixture_call(H,"kee_ledger_status",_{},"before-probe",S),synthetic_task(Data),
       receipt_reservation(C,Run,_{revision:S.revision,mt:null,data:Data},Call),
       kee_fixture_recorded_call(H,Call,Committed),
       getenv('POWDER_KEE_STATE_DIR',KeeDir),directory_file_path(KeeDir,'ledger.pl',Ledger),
       kb_llm_agent:conversation_file(C.id,File),fixture_file_hash(File,Before),
       fixture_file_hash(Ledger,LedgerBefore),directory_files(KeeDir,NamesBefore),
       local_receipt(C.id,Call.id,Reply),
       assertion(Reply.status=="committed"),assertion(Reply.localState=="reserved"),
       assertion(Reply.commit.recordedMetadataMatches==true),
       assertion(Reply.commit.result.id==Committed.result.id),
       assertion(\+get_dict(data,Reply.commit,_)),assertion(\+get_dict(actor,Reply.commit,_)),
       fixture_file_hash(File,After),fixture_file_hash(Ledger,LedgerAfter),
       directory_files(KeeDir,NamesAfter),assertion(NamesBefore==NamesAfter),
       assertion(Before==After),assertion(LedgerBefore==LedgerAfter),
       Record=_{id:Call.id,name:"kee_todo_create",state:"reserved"},
       kb_llm_kee:inspect_receipt(Config.put(model,"synthetic-other"),D.prompt,D.scope,Record,Changed),
       assertion(Changed.status=="committed"),assertion(Changed.commit.recordedMetadataMatches==false),
       kb_llm_kee:inspect_receipt(Config.put(conversation,"other-synthetic-conversation"),
         D.prompt,D.scope,Record,Other),assertion(Other.status=="unknown"),
       assertion(\+fixture_request(_,_))),
      kb_llm_kee:close_turn(H)).
test(receipt_requires_current_read_mt_ceiling) :-
    Scope=_{terms:[],readMts:["x_ReceiptFixtureMt"],writeMts:["x_ReceiptFixtureMt"]},
    receipt_setup_conversation(Scope,C,Run,D,Config),
    setup_call_cleanup(kb_llm_kee:open_turn(Config,D.prompt,D.scope,H,_),
      (kee_fixture_call(H,"kee_ledger_status",_{},"before-scoped-probe",S),synthetic_task(Data),
       receipt_reservation(C,Run,_{revision:S.revision,mt:"x_ReceiptFixtureMt",data:Data},Call),
       kee_fixture_recorded_call(H,Call,_),
       Record=_{id:Call.id,name:"kee_todo_create",state:"reserved"},
       catch(kb_llm_kee:inspect_receipt(Config,D.prompt,_{terms:[],readMts:[],writeMts:[]},Record,_),
         error(kee(mt_scope_denied,_),_),Denied=true),assertion(Denied==true)),
      kb_llm_kee:close_turn(H)).
test(arbitrary_unrecorded_call_id_is_rejected,[throws(error(llm_recorded_call_not_found,_))]) :-
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),local_receipt(C.id,"not-recorded",_).
test(missing_host_state_remains_missing) :-
    getenv('POWDER_AGENT_STATE',Existing),directory_file_path(Existing,'absent-read-only-state',Missing),
    setup_call_cleanup(setenv('POWDER_AGENT_STATE',Missing),
      (catch(local_receipt("00000000-0000-4000-8000-000000000000","none",_),
        error(existence_error(directory,_),_),Absent=true),
       assertion(Absent==true),assertion(\+exists_directory(Missing))),
      setenv('POWDER_AGENT_STATE',Existing)).
:- end_tests(llm_receipts).

fixture_history(Message,Before,After) :-
    append(Before.history,[Message],History),After=Before.put(history,History).

:- begin_tests(llm_export_hold,[setup(fixture_setup(State)),cleanup(fixture_cleanup(State))]).
test(current_registry_is_real_but_no_capability_is_an_export_grant) :-
    setup_call_cleanup(kee_fixture_context(_{terms:[],readMts:[],writeMts:[]},H,Tools),
      (H=kee(Token,_,_,_,_),kb_kee:registry(Token,Raw),kb_llm_kee:json_normalize(Raw,R),
       assertion((member(C,R.tools),get_dict(name,C,"kee_agent_run_event"))),
       forall(member(C,R.tools),
         (assertion(C.providerExport.rawResultAllowed==false),
          assertion(C.providerExport.gateImplemented==false))),
       assertion(Tools==[])),
      kb_llm_kee:close_turn(H)).
test(provider_call_rejected_before_native_state_creation) :-
    setup_call_cleanup(kee_fixture_context(_{terms:[],readMts:[],writeMts:[]},H,_),
      (Call=_{id:"must-not-dispatch",type:"function",
              function:_{name:"kee_todo_create",arguments:"{}"}},
       catch(kb_llm_kee:run_call(H,Call,_,_),
         error(llm_call_rejected,error(llm_grounding_not_approved,_)),Blocked=true),
       assertion(Blocked==true),
       getenv('POWDER_KEE_STATE_DIR',Directory),assertion(\+exists_directory(Directory)),
       assertion(\+fixture_request(_,_))),
      kb_llm_kee:close_turn(H)).
test(legacy_approved_document_is_not_upgraded_or_exported) :-
    Scope=_{terms:[],readMts:[],writeMts:[]},
    kb_llm_kee:preview_grounding(_{scope:Scope,requests:[
      _{tool:"kee_todo_list",arguments:_{mt:null}}]},P),
    kb_llm_kee:grant_file(P.id,File),kb_llm_files:read_json(File,D),
    kb_llm_files:atomic_json(File,D.put(status,"approved")),fixture_file_hash(File,Before),
    Selected=Scope.put(grant,P.id),
    setup_call_cleanup(kee_fixture_context(Selected,H,Tools),
      (assertion(Tools==[]),
       catch(kb_llm_kee:verify_outgoing(H),error(llm_grounding_not_approved,_),Blocked=true),
       assertion(Blocked==true),
       catch(kb_llm_kee:grounding_material(Selected,_),error(llm_grounding_not_approved,_),Material=true),
       assertion(Material==true),fixture_file_hash(File,After),assertion(Before==After),
       assertion(\+fixture_request(_,_))),
      kb_llm_kee:close_turn(H)).
test(legacy_tool_and_grounding_history_blocked_before_provider_admission) :-
    forall(member(Message,[
        _{role:"tool",tool_call_id:"old-call",content:"Synthetic private legacy payload"},
        _{role:"user",name:"approved_grounding",content:"Synthetic old preview payload"}]),
      (start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
       kb_llm_agent:update_document(C.id,user:fixture_history(Message)),
       catch(start_chat(_{id:C.id,revision:C.revision,text:"Synthetic next text",
                          approvedNonsensitive:true},_),error(llm_grounding_not_approved,_),Blocked=true),
       assertion(Blocked==true))),
    assertion(\+fixture_request(_,_)),assertion(\+kb_llm_agent:owned_run(_,_,_,_)),
    kb_activity:activity_status(Activity),assertion(Activity.active=:=0).
test(mt_selectors_are_not_export_consent) :-
    start_conversation(_{terms:[],readMts:["x_UnapprovedMt"],writeMts:[]},C),
    catch(start_chat(_{id:C.id,revision:C.revision,text:"Synthetic text",
                       approvedNonsensitive:true},_),error(llm_grounding_not_approved,_),Blocked=true),
    assertion(Blocked==true),assertion(\+fixture_request(_,_)).
test(safe_error_never_copies_backend_details) :-
    kb_llm_agent:safe_error(error(llm_grounding_not_approved,"Synthetic private detail"),Error),
    assertion(Error.code=="grounding_not_approved"),
    assertion(\+sub_string(Error.message,_,_,_,"Synthetic private detail")).
:- end_tests(llm_export_hold).
