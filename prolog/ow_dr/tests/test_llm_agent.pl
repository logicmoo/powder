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
    (fixture_mode(managed)->fixture_managed_message(Body.messages,Message);
     fixture_mode(tools),\+ (member(M,Body.messages),M.role=="tool")->
       Message=_{role:"assistant",content:null,tool_calls:[
         _{id:"fixture-call-1",type:"function",function:_{name:"not_registered",arguments:"{\"x\":1}"}}]}
    ;Message=_{role:"assistant",content:"Synthetic fixture response."}),
    reply_json_dict(_{choices:[_{message:Message}]}).
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
test(actual_managed_tool_rounds_and_matching_receipt_ids,
     [cleanup(retractall(user:fixture_mode(_)))]) :-
    assertz(user:fixture_mode(managed)),
    start_conversation(_{terms:[],readMts:[],writeMts:[]},C),
    start_chat(_{id:C.id,revision:0,text:"Synthetic managed TODO fixture",approvedNonsensitive:true},_),
    wait_chat(C.id,A),assertion(A.status=="ready"),
    member(Record,A.calls),Record.id=="managed-create",assertion(Record.result.result.committed==true),
    assertion(\+get_dict(data,Record.result.result,_)),
    local_todos(C.id,Local),Local.items=[Task],
    assertion(Task.result.resource.data.title=="Synthetic fixture task"),
    fixture_request(chat,Request),member(Tool,Request.messages),
    get_dict(tool_call_id,Tool,"managed-create"),!,
    atom_json_dict(Tool.content,Receipt,[]),assertion(Receipt.result.committed==true),
    assertion(\+get_dict(data,Receipt.result,_)).
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
       kb_llm_kee:run_call(H,Call,Committed,_),assertion(Committed.committed==true),
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
       assertion(member("kee_todo_create",Names)),
       assertion(member("kee_undo",Names)),
       assertion(\+member("kee_definitions",Names)),
       assertion(\+member("kee_occurrences",Names)),
       assertion(\+member("kee_find_terms",Names))),
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
    atom_json_dict(Encoded,Args,[as(string)]),
    kb_llm_kee:run_call(H,_{id:Id,type:"function",function:_{name:Name,arguments:Encoded}},R,_).
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
       catch(kb_llm_kee:verify_outgoing(H),error(llm_export_approval_required,_),Rejected=true),
       assertion(Rejected==true),assertion(\+fixture_request(_,_))),
      kb_llm_kee:close_turn(H)).
test(exact_preview_is_local_and_pending_is_not_approval) :-
    Scope=_{terms:[],readMts:[],writeMts:[]},
    kb_llm_kee:preview_grounding(_{scope:Scope,requests:[
      _{tool:"kee_todo_list",arguments:_{mt:null}}]},Preview),
    GrantScope=Scope.put(grant,Preview.id),
    assertion(\+kb_llm_kee:approved_document(GrantScope,_)),
    catch(kb_llm_kee:approve_grounding(
      _{id:Preview.id,hash:"wrong",approvedNonsensitive:true},_),
      error(llm_grounding_conflict,_),Conflict=true),assertion(Conflict==true),
    kb_llm_kee:approve_grounding(_{id:Preview.id,hash:Preview.hash,approvedNonsensitive:true},_),
    start_conversation(GrantScope,Conversation),Conversation.messages=[Grounding],
    assertion(Grounding.name=="approved_grounding"),
    assertion(sub_string(Grounding.content,_,_,_,"Untrusted data")),
    setup_call_cleanup(kee_fixture_context(GrantScope,H,Tools),
      (assertion((member(T,Tools),get_dict(function,T,F),get_dict(name,F,"kee_todo_list"))),
       kb_llm_kee:verify_outgoing(H),
       kee_fixture_call(H,"kee_todo_list",_{mt:null},"approved-read",_),
       fixture_create(H,"change-preview-fixture",_),
       catch(kb_llm_kee:verify_outgoing(H),error(llm_grounding_changed,_),Changed=true),
       assertion(Changed==true),assertion(\+fixture_request(_,_))),
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
