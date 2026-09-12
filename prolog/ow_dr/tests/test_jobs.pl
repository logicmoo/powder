:- begin_tests(worker_jobs).
:- use_module('../kb_jobs').
:- use_module('../kb_config').
:- use_module('../kb_store').
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(http/json)).

fixture(Directory,Previous) :-
    (getenv('POWDER_SERVER_SETTINGS',Old)->Previous=value(Old);Previous=none),
    source_file(plunit_worker_jobs:fixture(_,_),Here),file_directory_name(Here,Tests),
    directory_file_path(Tests,artifacts,Artifacts),make_directory_path(Artifacts),
    uuid(Id),directory_file_path(Artifacts,Id,Directory),make_directory(Directory),
    directory_file_path(Directory,'settings.json',File),setenv('POWDER_SERVER_SETTINGS',File),
    kb_limits:server_defaults(Default),
    Profiles=_{loader:_{start:1,max:3,spare:1},
               inference:_{start:1,max:3,spare:1},http:_{start:1,max:3,spare:1}},
    save_server_settings(Default.put(pools,Profiles),none,Settings),start_pools(Settings).
cleanup(Directory,Previous) :-
    stop_pools,
    findall(Path,source_info(Path,_),Paths),
    forall(member(Path,Paths),(generation(G),unload_source(Path,G,_))),
    retractall(kb_jobs:job(_,_,_,_)),
    (Previous=value(Old)->setenv('POWDER_SERVER_SETTINGS',Old);unsetenv('POWDER_SERVER_SETTINGS')),
    delete_directory_and_contents(Directory).
source(Directory,Name,Value,File) :-
    directory_file_path(Directory,Name,File),
    setup_call_cleanup(open(File,write,S),
      format(S,'(in-microtheory M)~n(p ~w)~n',[Value]),close(S)).

test(settings_are_durable_ordered_and_next_start_only,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    source(D,'a.krf',first,A),source(D,'b.krf',second,B),
    server_settings(Before),generation(G),
    save_server_settings(Before.put(_{startupConfigured:true,startupFiles:[B,A,B]}),Before.revision,After),
    assertion(After.startupFiles=[_,_]),server_settings(Read),
    assertion(Read.startupFiles==After.startupFiles),
    startup_selection([],Read,Read.startupFiles),startup_selection([A],Read,[A]),
    generation(G),assertion(\+source_info(_,_)),
    save_server_settings(Read.put(startupFiles,[]),Read.revision,Empty),
    startup_selection([],Empty,[]).

test(legacy_start_alias_selects_independent_saved_profiles,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    file_pool_started,inference_pool_started,task_overview(Overview),
    once((member(Pool,Overview.pools),Pool.pool==file)),
    once((member(Inference,Overview.pools),Inference.pool==inference)),
    assertion(Pool.pool==file),assertion(Pool.total==1),
    assertion(Pool.profile.start==1),assertion(Pool.profile.max==3),
    assertion(Inference.profile.start==1),assertion(Inference.profile.max==3).

test(legacy_submit_aliases_use_the_shared_file_pool,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    source(D,'alias.krf',value,File),directory_file_path(D,state,State),
    queue_index([File],[state_dir(State),diagnostics(false)],Index),await_result(Index.jobId,_),
    generation(G),submit_load([File],G,Load),await_result(Load.jobId,Loaded),
    assertion(Loaded.counts.assertions==1),assertion(Load.pool==file),
    submit_unload(File,Loaded.generation,Unload),await_result(Unload.jobId,Empty),
    assertion(Empty.files==[]).

test(failed_compile_summary_is_complete_json_with_native_diagnostics) :-
    Warning=warnings("Mapping shape mismatch"),
    Summary=summary{generated:0,cacheHits:0,busy:0,failures:1,warnings:1,exitCode:1,
      results:[result{source:'KBs/example.krf',status:failed,error:"Resource limit",
        warnings:[Warning],mapping_rows:[Warning],elapsed:0,count:0}]},
    kb_jobs:error_details(error(compile_incomplete(Summary),_),Details),
    with_output_to(string(Text),json_write_dict(current_output,Details)),
    atom_json_dict(Text,Read,[]),
    assertion(Read.summary.failures==1),
    Read.summary.results=[Result],Result.mapping_rows=[Mapped],
    assertion(Mapped.type=="warnings"),assertion(Mapped.message=="Mapping shape mismatch").

test(successful_index_summary_also_normalizes_native_diagnostics) :-
    Meta=job{id:'json-fixture',progress:json{}},
    kb_jobs:detail_status(Meta,result(json{mapping_rows:[warnings("Shape mismatch")]}),Status),
    with_output_to(string(Text),json_write_dict(current_output,Status)),
    atom_json_dict(Text,Read,[]),
    Read.result.mapping_rows=[Mapped],assertion(Mapped.type=="warnings").

:- end_tests(worker_jobs).
