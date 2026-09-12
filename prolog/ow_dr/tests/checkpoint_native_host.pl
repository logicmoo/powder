:- module(checkpoint_native_fixture,[fixture_main/0,allow_bind/0,record_error/1]).
:- use_module('../kb_checkpoint_host',[]).
:- use_module('../kb_checkpoint_http',[]).
:- use_module('../kb_saved_state',[]).
:- use_module('../kb_config',[]).
:- use_module('../kb_store',[]).
:- use_module('../kb_paths',[]).
:- use_module('../kb_jobs',[]).
:- use_module('../kb_activity',[]).
:- use_module('../kb_native_annotations',[]).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(filesex)).
:- use_module(library(readutil)).
:- use_module(library(crypto),[crypto_data_hash/3]).
:- dynamic fixture_error/1.
:- volatile fixture_error/1.
record_error(Error) :- message_to_string(Error,Text),assertz(fixture_error(Text)).

% Loaded only by a copied, disposable fixture app. Never import from app.pl.
:- http_handler('/_checkpoint_fixture/info',fixture_info,[]).
:- http_handler('/_checkpoint_fixture/stop',fixture_stop,[method(post)]).
:- http_handler('/_checkpoint_fixture/busy',fixture_busy,[method(post)]).

case_dir(Directory) :- getenv('POWDER_CHECKPOINT_FIXTURE',Directory).
allow_bind :-
    case_dir(D),directory_file_path(D,'reject-candidate-bind',Marker),
    (kb_checkpoint_host:host(H),H.mode==candidate,exists_file(Marker)->
      throw(error(fixture_rejected_candidate_bind,_));true).
fixture_main :-
    catch_with_backtrace(fixture_run,Error,(print_message(error,Error),throw(Error))),halt.
fixture_run :-
    case_dir(D),kb_paths:repo_root(Root),directory_file_path(Root,'KBs',KBs),
    make_directory_path(KBs),
    directory_file_path(KBs,'native-one.krf',One),
    directory_file_path(KBs,'native-two.krf',Two),
    write_source(One,"(in-microtheory OneMt)\n(:CREATOR FixtureAuthor :KIF (pair ?X ?X))\n(parent Alice Bob)\n(parent Bob Carol)\n(<=== (grandparent ?X ?Y) (parent ?X ?Z) (parent ?Z ?Y))\n"),
    write_source(Two,"(in-microtheory TwoMt)\n(parent Eve Nobody)\n"),
    kb_config:server_settings(Defaults),
    kb_config:save_server_settings(Defaults.put(_{startupConfigured:true,startupFiles:[One,Two]}),
      Defaults.revision,Settings),
    kb_store:load_sources([One,Two],any,_),
    kb_native_annotations:native_status(Empty),
    kb_native_annotations:initialize_defaults(Empty.revision,Initialized),
    kb_native_annotations:upsert_native(cyc,x_OneMt,utility,0.75,Initialized.revision,_),
    kb_source_packs:create_pack("Native saved composition",['KBs/native-one.krf'],none,CreatedPack),
    Composition=CreatedPack.pack.put(_{
      choices:[choice{symbol:x_parent,files:['KBs/native-two.krf'],origin:user}],
      members:[member{path:'KBs/native-one.krf',role:root,why:[],identity:null}]}),
    kb_source_packs:save_pack(Composition,CreatedPack.revision,_),
    kb_checkpoint_host:free_loopback_port(DebugPort),
    setup_call_cleanup(kb_checkpoint_host:start_host(Primary,Settings,
      [enabled(true),port(DebugPort),max_sessions(3),query_timeout(2)],main),
      (kb_checkpoint_host:open_listener(Extra,Settings.pools.http),
       directory_file_path(D,'owner.json',Ready),
       current_prolog_flag(pid,PID),
       kb_checkpoint:instance(Instance),kb_checkpoint:control_secret(Token),
       Credentials=credentials{instance:Instance.id,port:Instance.control,token:Token},
       findall(Cache,(member(Source,[One,Two]),kb_paths:cache_paths(Source,N,I),member(Cache,[N,I])),Caches),
       kb_saved_state:write_json(Ready,_{primary:Primary,extra:Extra,pid:PID,
         credentials:Credentials,sources:[One,Two],caches:Caches}),
       kb_checkpoint_host:wait_host(main)),
      kb_checkpoint_host:stop_host).
write_source(File,Text) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),write(S,Text),close(S)).
fixture_info(_) :-
    case_dir(D),current_prolog_flag(pid,PID),kb_store:status(Status),
    kb_jobs:task_overview(Jobs),
    (stream_property(user_input,tty(true))->TTY=true;TTY=false),
    findall(T,kb_lifecycle:console_owner(T),Console),
    kb_checkpoint:checkpoint_instance(Instance),
    kb_saved_state:effective_configuration(Configuration),
    findall(Error,fixture_error(Error),Errors),
    findall(_{run:Run,status:Text},
      (kb_checkpoint:transition_thread(Run,Thread),thread_property(Thread,status(State)),
       term_string(State,Text)),Transitions),
    kb_native_annotations:restored_native_snapshot(Native),kb_saved_state:native_summary(Native,NativeSummary),
    term_string(Native.records,NativeRecords),
    kb_debug_telnet:debug_resume_profile(Debug),
    (kb_debug_telnet:debug_credentials_file(CredentialsFile)->
      kb_saved_state:read_json(CredentialsFile,Credentials),
      crypto_data_hash(Credentials.token,CredentialHash,[algorithm(sha256),encoding(utf8)])
    ;CredentialHash=null),
    reply_json_dict(_{fixture:D,pid:PID,status:Status,jobs:Jobs,tty:TTY,console:Console,
      instance:Instance,nativeTVA:NativeSummary,nativeRecords:NativeRecords,
      debug:Debug,credentialHash:CredentialHash,configuration:Configuration,
      errors:Errors,transitions:Transitions}).
fixture_stop(_) :-
    kb_checkpoint_host:host(H),thread_send_message(H.stopQueue,stop),
    reply_json_dict(_{stopping:true}).
fixture_busy(Request) :-
    http_read_json_dict(Request,Body),
    (Body.busy==true->kb_activity:acquire_application(checkpoint_fixture_busy)
    ;kb_activity:release_application(checkpoint_fixture_busy)),
    reply_json_dict(_{busy:Body.busy}).
