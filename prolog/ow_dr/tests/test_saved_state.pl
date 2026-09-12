:- begin_tests(saved_application_state).
:- use_module('../kb_saved_state').
:- use_module('../kb_compile', []).
:- use_module('../kb_cache', []).
:- use_module('../kb_store', []).
:- use_module('../kb_runtime', []).
:- use_module(library(filesex)).
:- use_module(library(process)).
:- use_module(library(uuid)).
:- use_module(library(http/json)).
:- use_module(library(readutil)).
:- use_module(library(time)).
:- dynamic test_directory/1, test_metadata_ref/1.

fixture(Directory,Source) :-
    kb_rule_utility:reset_telemetry,
    source_file(plunit_saved_application_state:fixture(_,_),Here),
    file_directory_name(Here,Tests),uuid(Id),atom_concat('.saved-state-test-',Id,Name),
    directory_file_path(Tests,Name,Directory),make_directory(Directory),
    assertz(test_directory(Directory)),
    directory_file_path(Directory,'server-settings.json',Settings),
    setenv('POWDER_SERVER_SETTINGS',Settings),
    directory_file_path(Directory,'native-tva.pl',Annotations),
    setenv('POWDER_NATIVE_TVA_FILE',Annotations),
    directory_file_path(Directory,'source-packs.json',Packs),
    setenv('POWDER_SOURCE_PACKS',Packs),
    directory_file_path(Directory,'fixture.krf',Source),
    setup_call_cleanup(open(Source,write,S,[encoding(utf8)]),
      format(S,'(in-microtheory FirstMt)~n(:CREATOR TestAuthor :DIRECTION :FORWARD :KIF (pair ?X ?X))~n(parent Alice Bob)~n(parent Bob Carol)~n(<=== (grandparent ?X ?Y) (parent ?X ?Z) (parent ?Z ?Y))~n(in-microtheory OtherMt)~n(parent Eve Nobody)~n',[]),
      close(S)),
    directory_file_path(Directory,'ids',IDs),
    kb_compile:compile_source(Source,[state_dir(IDs),progress(none)],Info),
    kb_store:prepare_source(Info,prepared(Source,Prepared,Records)),
    kb_saved_state:install_snapshot_source(Directory,source(Source,Prepared,Records)),
    kb_store:rebuild_rankings.
second_fixture(Directory,Source) :-
    directory_file_path(Directory,'other.kif',Source),
    setup_call_cleanup(open(Source,write,S,[encoding(utf8)]),
      format(S,';; logos: sumo-mappings~n(in-microtheory ThirdMt)~n(parent Ethel Fiona)~n',[]),close(S)),
    directory_file_path(Directory,'ids',IDs),
    kb_compile:compile_source(Source,[state_dir(IDs),progress(none)],Info),
    kb_store:prepare_source(Info,prepared(Source,Prepared,Records)),
    kb_saved_state:install_snapshot_source(Directory,source(Source,Prepared,Records)),
    kb_store:rebuild_rankings.
empty_fixture(Directory,Source) :-
    directory_file_path(Directory,'Empty-Source.KRF',Given),
    setup_call_cleanup(open(Given,write,S,[encoding(utf8)]),
      format(S,'; Empty source retained in the manifest~n(in-microtheory EmptyMt)~n',[]),close(S)),
    directory_file_path(Directory,ids,IDs),
    kb_compile:compile_source(Given,[state_dir(IDs),progress(none)],Info),
    kb_store:prepare_source(Info,prepared(Source,Prepared,[])),
    kb_saved_state:install_snapshot_source(Directory,source(Source,Prepared,[])),
    kb_store:rebuild_rankings.
cleanup(Directory) :-
    forall(retract(test_metadata_ref(Ref)),catch(erase(Ref),_,true)),
    kb_rule_utility:reset_telemetry,kb_rule_utility:reset_transient,
    forall(kb_store:source_module(_,_,Native),kb_runtime:native_unload(Native)),
    forall(member(PI,[source_module/3,source_info/2,assertion/2,constant_locator/2,mt_locator/2]),
      (PI=Name/Arity,functor(Term,Name,Arity),retractall(kb_store:Term))),
    kb_store:rebuild_rankings,
    retractall(kb_saved_state:image_builder_root(_)),
    forall(member(PI,[nars_tva/2,oc_tva/2,cyc_bayes_value/3,baseline/4]),
      (PI=Name/Arity,functor(Term,Name,Arity),retractall(kb_native_annotations:Term))),
    kb_native_annotations:reset_transient,unsetenv('POWDER_NATIVE_TVA_FILE'),
    unsetenv('POWDER_SOURCE_PACKS'),
    unsetenv('POWDER_SERVER_SETTINGS'),
    (exists_directory(Directory)->delete_directory_and_contents(Directory);true),
    retractall(test_directory(Directory)).

test(actual_qsave_restore_without_original_cache_or_snapshot,
     [setup(fixture(D,F)),cleanup(cleanup(D))]) :-
    second_fixture(D,F2),
    empty_fixture(D,F3),
    kb_native_annotations:native_status(NativeEmpty),
    kb_native_annotations:initialize_defaults(NativeEmpty.revision,_),
    kb_native_annotations:export_native_snapshot(NativeBefore),
    getenv('POWDER_NATIVE_TVA_FILE',NativeFile),kb_cache:file_digest(NativeFile,NativeFileDigest),
    kb_config:server_settings(Settings),
    kb_config:save_server_settings(Settings.put(_{startupConfigured:true,startupFiles:[F,F2,F3]}),
      Settings.revision,_),
    uuid(PackUUID),atom_concat('pack-',PackUUID,PackId),
    Pack=_{id:PackId,name:"Captured source composition",roots:['KBs/unavailable.krf'],
      choices:[_{symbol:x_parent,files:['KBs/dependency.krf'],origin:user}],members:[],
      resolution:_{ready:false,state:draft}},
    getenv('POWDER_SOURCE_PACKS',PackFile),
    kb_saved_state:write_json(PackFile,_{schema:'powder.source-packs.v1',packs:[Pack]}),
    kb_source_packs:list_packs(PackBefore),
    kb_store:source_module(F,Module,_),
    once(kb_runtime:module_assertion(Module,LegacyId,_,_)),
    Legacy='xc_cyc::original-prolog'(LegacyId,"legacy duplicated original payload"),
    dynamic(Module:'xc_cyc::original-prolog'/2),
    assertz(Module:Legacy,LegacyRef),assertz(test_metadata_ref(LegacyRef)),
    kb_store:source_module(F2,SumoModule,_),
    kb_store:source_info(F2,SumoInfo),assertion(SumoInfo.sourceOrigin==sumo),
    once(kb_runtime:module_assertion(SumoModule,SumoId,_,_)),
    SumoOriginal='xc_cyc::original-formula'(SumoId,"header-only SUMO original"),
    dynamic(SumoModule:'xc_cyc::original-formula'/2),
    assertz(SumoModule:SumoOriginal,SumoRef),assertz(test_metadata_ref(SumoRef)),
    kb_store:status(Before),saved_states(Empty),Empty.items==[],
    kb_store:assertions(OrderedBefore),
    findall(Id,(member(Item,OrderedBefore),Id=Item.id),ExpectedIds),
    kb_store:active_modules(Modules),OtherGeneration is Before.generation+10,
    forall(member(ObservationGeneration,[Before.generation,OtherGeneration]),
      (kb_runtime:query_modules_report(Modules,x_grandparent(x_Alice,_),x_FirstMt,10,2,
         [generation(ObservationGeneration)],Solutions,_),Solutions=[_|_])),
    kb_rule_utility:export_telemetry(UtilityBefore),
    length(UtilityBefore.rows,2),UtilityBefore.completedQueries=:=2,
    kb_saved_state:snapshot(Before.generation,Sources,_),
    \+ (member(source(_,_,Rs),Sources),member(record(_,_,Ms),Rs),member(Legacy,Ms)),
    assertion((member(source(F2,_,SumoRecords),Sources),
      member(record(SumoId,_,SumoProperties),SumoRecords),memberchk(SumoOriginal,SumoProperties))),
    create_saved_state("fixture image",Before.generation,Empty.revision,State),
    assertion(State.validated==true),assertion(State.counts.assertions=:=6),
    assertion(State.counts.microtheories=:=3),length(State.files,3),
    assertion((member(EmptyFile,State.files),get_dict(count,EmptyFile,0))),
    assertion(State.ruleUtility.ruleIdentities=:=2),
    assertion(State.ruleUtility.completedQueries=:=2),
    kb_native_annotations:export_native_snapshot(NativeAfter),assertion(NativeAfter==NativeBefore),
    kb_cache:file_digest(NativeFile,NativeFileDigest),
    kb_rule_utility:export_telemetry(UtilityAfter),assertion(UtilityAfter==UtilityBefore),
    assertion(clause(Module:Legacy,true,LegacyRef)),
    kb_store:status(After),assertion(Before=@=After),
    kb_saved_state:state_directory(State.id,Directory),
    directory_file_path(Directory,'image.state',Image),assertion(exists_file(Image)),
    delete_file(F),kb_paths:cache_paths(F,Cache,Index),delete_file(Cache),delete_file(Index),
    delete_file(F2),kb_paths:cache_paths(F2,Cache2,Index2),delete_file(Cache2),delete_file(Index2),
    delete_file(F3),kb_paths:cache_paths(F3,Cache3,Index3),delete_file(Cache3),delete_file(Index3),
    findall(Native,kb_store:source_module(_,_,Native),Natives),
    forall(member(Native,Natives),(exists_file(Native)->delete_file(Native);true)),
    delete_file(NativeFile),
    delete_file(PackFile),kb_config:settings_file(SettingsFile),delete_file(SettingsFile),
    directory_file_path(D,'external-restore.json',Report),
    directory_file_path(D,'external-restore.log',Log),
    current_prolog_flag(executable,SWI),
    kb_saved_state:run_child(SWI,['-q','-f',none,'-x',Image,'--','--saved-state-verify',Report],Log,60),
    kb_saved_state:read_json(Report,Verified),
    assertion(Verified.validated==true),assertion(Verified.counts.assertions=:=6),
    assertion(Verified.resourcesStarted==false),
    assertion(Verified.ruleUtility.digest==State.ruleUtility.digest),
    assertion(Verified.ruleUtility.completedQueries=:=2),
    assertion(Verified.ruleUtility.ruleIdentities=:=2),
    assertion(Verified.nativeTVA.revision==NativeBefore.revision),
    assertion(Verified.configuration.settings.startupFiles==[F,F2,F3]),
    assertion(kb_saved_state:json_value_equal(Verified.configuration.sourcePacks.packs,PackBefore.packs)),
    length(NativeBefore.records,NativeCount),assertion(Verified.nativeTVA.records=:=NativeCount),
    assertion(Verified.retainedSnapshotDigest==State.retainedSnapshotDigest),
    assertion(Verified.retentionPolicy==non_sumo_originals_v1),
    assertion(Verified.assertionIds==ExpectedIds),
    kb_saved_state:snapshot_digest(Sources,Digest),assertion(State.snapshotDigest==Digest),
    saved_states(List),select_saved_state(State.id,List.revision,Selected),
    assertion(Selected.selected==State.id),
    startup_saved_state([],saved(Image,_)),
    startup_saved_state(['explicit.krf'],sources(['explicit.krf'])),
    select_saved_state(none,Selected.revision,Cleared),assertion(Cleared.selected==none),
    startup_saved_state([],none),
    saved_states(Ready),
    catch(create_saved_state("fixture image",Before.generation,Ready.revision,_),Duplicate,true),
    assertion(Duplicate=error(saved_state_name_exists(_),_)),
    setup_call_cleanup(open(Image,read,S,[type(binary)]),read_stream_to_codes(S,Bytes),close(S)),
    length(Bytes,Length),Half is Length//2,length(Truncated,Half),append(Truncated,_,Bytes),
    setup_call_cleanup(open(Image,write,O,[type(binary)]),maplist(put_byte(O),Truncated),close(O)),
    catch(select_saved_state(State.id,Ready.revision,_),Corrupt,true),
    assertion(Corrupt=error(saved_state_image_size_mismatch(_),_)),
    startup_saved_state([],none),
    catch(kb_saved_state:run_child(SWI,
      ['-q','-f',none,'-x',Image,'--','--saved-state-verify',Report],Log,30),InvalidImage,true),
    assertion(InvalidImage=error(saved_state_child_failed(_,_,_),_)),
    Bytes=[First|Rest],Changed is First xor 1,
    setup_call_cleanup(open(Image,write,CorruptOut,[type(binary)]),
      maplist(put_byte(CorruptOut),[Changed|Rest]),close(CorruptOut)),
    catch(select_saved_state(State.id,Ready.revision,_),HashError,true),
    assertion(HashError=error(saved_state_image_hash_mismatch(_),_)),
    setup_call_cleanup(open(Image,write,RestoreOut,[type(binary)]),
      maplist(put_byte(RestoreOut),Bytes),close(RestoreOut)),
    directory_file_path(Directory,'validation.json',SavedValidation),delete_file(SavedValidation),
    saved_states(Incomplete),Incomplete.items=[Unavailable],
    assertion(Unavailable.available==false),
    kb_store:status(Unchanged),assertion(Unchanged=@=Before).

test(failure_preserves_live_generation_and_catalog,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    kb_store:status(Before),saved_states(Empty),
    Bad is Before.generation+1,
    catch(create_saved_state("stale",Bad,Empty.revision,_),Failure,true),
    assertion(Failure=error(generation_conflict(_,_),_)),
    kb_store:status(After),assertion(Before=@=After),
    saved_states(StillEmpty),assertion(StillEmpty.items==[]),
    catch(select_saved_state(none,"outdated",_),Conflict,true),
    assertion(Conflict=error(saved_state_revision_conflict(_,_),_)).

test(utility_integrity_is_separate_from_knowledge_identity,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    current_snapshot_identity(Before),
    kb_saved_state:utility_snapshot(Empty),
    kb_saved_state:utility_summary(Empty,OriginalUtility),
    kb_store:active_modules(Modules),
    kb_runtime:query_modules_report(Modules,x_grandparent(x_Alice,_),x_FirstMt,10,2,
      [generation(Before.generation)],[_|_],_),
    current_snapshot_identity(After),assertion(After=@=Before),
    catch(kb_saved_state:verify_saved_utility(state{ruleUtility:OriginalUtility},_),
      Mismatch,true),
    assertion(Mismatch=error(saved_state_rule_utility_mismatch,_)),
    kb_saved_state:utility_snapshot(Completed),
    kb_rule_utility:reset_transient,
    kb_saved_state:utility_snapshot(Retained),assertion(Retained==Completed),
    kb_saved_state:utility_summary(Retained,CurrentUtility),
    kb_saved_state:verify_saved_utility(state{ruleUtility:CurrentUtility},_).

test(native_annotation_changes_change_checkpoint_identity,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    current_snapshot_identity(Before),
    kb_native_annotations:native_status(Empty),
    kb_native_annotations:initialize_defaults(Empty.revision,_),
    current_snapshot_identity(After),
    assertion(After.snapshotDigest==Before.snapshotDigest),
    assertion(After.configuration.hash\==Before.configuration.hash),
    catch(kb_saved_state:verify_saved_native(state{configuration:Before.configuration},_),
      Failure,true),
    assertion(Failure=error(saved_state_native_annotations_mismatch,_)).

test(restored_configuration_falls_back_only_when_sidecars_are_absent,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    kb_saved_state:effective_configuration(Initial),
    directory_file_path(D,'missing.krf',Missing),
    Captured=configuration{startupConfigured:true,startupFiles:[Missing],pools:Initial.settings.pools},
    Packs=[pack{id:'pack-restored',name:restored,roots:['KBs/missing.krf'],
      choices:[],members:[],resolution:resolution{ready:false,state:draft}}],
    kb_source_packs:export_source_pack_snapshot(EmptyPackSnapshot),
    PackSnapshot=EmptyPackSnapshot.put(packs,Packs),
    Meta=state{configuration:configuration{settings:Captured,sourcePacks:Packs},
      sourcePackSnapshot:PackSnapshot},
    setup_call_cleanup(
      (asserta(kb_saved_state:image_manifest(Meta),Ref),
       kb_config:import_settings_snapshot(settings_snapshot{schema:1,settings:Captured,revision:none}),
       kb_saved_state:restore_source_pack_configuration(Meta)),
      (kb_saved_state:effective_configuration(Restored),
       assertion(Restored.settings.startupFiles==[Missing]),
       assertion(Restored.settings.revision==none),
       assertion(kb_saved_state:json_value_equal(Restored.sourcePacks.packs,Packs)),
       kb_saved_state:verify_saved_source_packs(Meta),
       kb_saved_state:verify_saved_settings(Meta),
       Changed=Meta.put(configuration,Meta.configuration.put(settings,Captured.put(startupConfigured,false))),
       catch(kb_saved_state:verify_saved_settings(Changed),Mismatch,true),
       assertion(Mismatch=error(saved_state_settings_snapshot_mismatch,_)),
       kb_config:save_server_settings(Initial.settings,none,_),
       kb_saved_state:effective_configuration(Disk),
       assertion(Disk.settings.startupFiles==Initial.settings.startupFiles),
       getenv('POWDER_SOURCE_PACKS',PackFile),
       kb_saved_state:write_json(PackFile,_{schema:invalid,packs:[]}),
       catch(kb_saved_state:effective_configuration(_),Error,true),
       assertion(Error=error(domain_error(source_pack_schema,invalid),_))),
      (erase(Ref),retractall(kb_config:settings_snapshot(_)),
       retractall(kb_source_packs:restored_pack_snapshot(_)))).

test(retention_reuses_and_preserves_the_callers_admission_lease,
     [setup(fixture(Directory,_)),cleanup(cleanup(Directory))]) :-
    setup_call_cleanup(kb_jobs:begin_checkpoint_drain(Lease),
      (kb_saved_state:retain_restored_metadata,
       assertion(kb_activity:owns_admission_lease)),
      kb_jobs:end_checkpoint_drain(Lease)),
    assertion(\+kb_activity:owns_admission_lease),
    kb_activity:activity_status(After),assertion(After.exclusive==false).

test(retention_rejects_anonymous_exclusive_ownership,
     [setup(fixture(Directory,_)),cleanup(cleanup(Directory))]) :-
    kb_activity:with_exclusive_reload(
      catch(kb_saved_state:retain_restored_metadata,Error,true)),
    assertion(Error=error(checkpoint_busy(application),_)),
    kb_activity:activity_status(After),assertion(After.exclusive==false).

test(retention_verifies_raw_identity_before_adapting_old_payload,
     [setup(fixture(D,F)),cleanup(cleanup(D))]) :-
    kb_store:source_module(F,Module,_),kb_store:source_info(F,Info),
    kb_saved_state:module_records(Module,[record(Id,Semantic,Properties)|_]),
    Original='xc_cyc::original-prolog'(Id,"old original payload"),
    Cnf=xc_cnf(Id,canonical_cnf),
    Record=record(Id,Semantic,[Original,Cnf|Properties]),
    Raw=[source(F,Info,[Record])],kb_saved_state:snapshot_digest(Raw,OriginalDigest),
    kb_saved_state:adapt_snapshot_data(state{snapshotDigest:OriginalDigest},Raw,Meta,Retained),
    assertion(Meta.snapshotDigest==OriginalDigest),
    assertion(Meta.retainedSnapshotDigest\==OriginalDigest),
    Retained=[source(_,_,[record(Id,Preserved,Kept)])],
    assertion(Preserved==Semantic),assertion(memberchk(Cnf,Kept)),
    assertion(\+memberchk(Original,Kept)),
    kb_saved_state:saved_snapshot_digest(Meta,Effective),
    kb_saved_state:snapshot_digest(Retained,Effective),
    Altered=[source(F,Info,[record(Id,Semantic,
      ['xc_cyc::original-prolog'(Id,"tampered but otherwise disposable"),Cnf|Properties])])],
    catch(kb_saved_state:adapt_snapshot_data(state{snapshotDigest:OriginalDigest},
      Altered,_,_),Mismatch,true),
    assertion(Mismatch=error(saved_state_snapshot_mismatch,_)),
    SumoInfo=Info.put(_{sourceOrigin:sumo,dialect:kif}),
    kb_saved_state:retain_snapshot_source(source('missing-sumo.kif',SumoInfo,[Record]),
      source(_,_,[record(_,_,SumoProperties)])),
    assertion(memberchk(Original,SumoProperties)),
    kb_saved_state:retain_snapshot_source(source(F,SumoInfo,[Record]),
      source(_,KrfInfo,[record(_,_,KrfProperties)])),
    assertion(KrfInfo.sourceOrigin==non_sumo),
    assertion(\+memberchk(Original,KrfProperties)).

test(retention_never_reads_legacy_source_headers,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    directory_file_path(D,'opaque-custom.kif',Source),
    setup_call_cleanup(open(Source,write,S),write(S,'#| deliberately unterminated'),close(S)),
    Info=info{count:0,options:[],dialect:kif},
    kb_saved_state:retain_snapshot_source(source(Source,Info,[]),source(Source,Retained,[])),
    assertion(Retained.sourceOrigin==unknown).

test(snapshot_excludes_imported_metadata_helpers,
     [setup(fixture(D,F)),cleanup(cleanup(D))]) :-
    kb_store:source_module(F,Module,_),
    once(kb_runtime:module_assertion(Module,Id,_,NativeRef)),
    uuid(UUID),atom_concat(saved_metadata_helpers_,UUID,Helpers),
    dynamic(Helpers:xc_imported_probe/2),
    assertz(Helpers:xc_imported_probe(Id,NativeRef),Ref),
    assertz(test_metadata_ref(Ref)),
    Helpers:export(xc_imported_probe/2),
    Module:import(Helpers:xc_imported_probe/2),
    assertion(predicate_property(Module:xc_imported_probe(_,_),imported_from(Helpers))),
    kb_saved_state:module_records(Module,Records),
    assertion(\+ (member(record(_,_,Metadata),Records),
                   member(xc_imported_probe(_,_),Metadata))).

test(native_rebind_preserves_source_info_and_rejects_foreign_paths,
     [condition(current_prolog_flag(windows,true)),setup(fixture(D,F)),cleanup(cleanup(D))]) :-
    assertz(kb_saved_state:image_builder_root(D)),
    kb_store:source_module(F,Module,BeforeNative),kb_store:source_info(F,BeforeInfo),
    upcase_atom(BeforeNative,OriginalCase),
    retract(kb_store:source_module(F,Module,BeforeNative)),
    assertz(kb_store:source_module(F,Module,OriginalCase)),
    kb_saved_state:rebuild_native_registry,
    kb_store:source_module(F,Module,Rebound),kb_store:source_info(F,AfterInfo),
    assertion(AfterInfo=@=BeforeInfo),
    once(kb_runtime:module_assertion(Module,_,_,Ref)),clause_property(Ref,source(Actual)),
    assertion(Rebound==Actual),
    directory_file_path(D,'parent-runtime.data',Foreign),
    catch(kb_saved_state:require_builder_source(Module,Foreign),Error,true),
    assertion(Error=error(saved_state_native_path_not_owned(Module,Foreign),_)).

test(nonempty_source_cannot_use_empty_native_fallback,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    empty_fixture(D,F),assertz(kb_saved_state:image_builder_root(D)),
    kb_store:source_module(F,Module,_),retract(kb_store:source_info(F,Info)),
    assertz(kb_store:source_info(F,Info.put(count,1))),
    catch(kb_saved_state:rebuild_native_registry,Error,true),
    assertion(Error=error(saved_state_missing_native_source(F,Module),_)).

test(output_identifier_cannot_escape,[throws(error(domain_error(saved_state_id,_),_))]) :-
    saved_state_metadata('../../outside',_).

test(incompatible_metadata_is_rejected,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    kb_saved_state:compatibility(Current),Bad=Current.put(codeHash,changed),
    catch(kb_saved_state:require_compatible(Bad,Current),Failure,true),
    assertion(Failure=error(saved_state_incompatible(_,_),_)).

test(unexpected_runtime_handles_are_not_serializable,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    dynamic(kb_prolog:bridge_ref/3),
    setup_call_cleanup(assertz(kb_prolog:bridge_ref(example,none,opaque),Ref),
      catch(kb_saved_state:clean_builder_resources,Failure,true),erase(Ref)),
    assertion(Failure=error(saved_state_unexpected_resource(kb_prolog:bridge_ref/3),_)),
    setup_call_cleanup(kb_rule_utility:begin_query([],[telemetry(false)],_),
      catch(kb_saved_state:clean_builder_resources,ActiveQuery,true),
      kb_rule_utility:reset_transient),
    assertion(ActiveQuery=error(saved_state_unexpected_rule_query,_)).

test(catalog_native_lock_is_nonblocking,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    saved_state_root(Root),make_directory_path(Root),
    directory_file_path(Root,'catalog.lock',LockFile),
    kb_cache:try_lock(LockFile,Lock),
    directory_file_path(D,'lock-child.log',Log),
    current_prolog_flag(executable,SWI),module_property(kb_saved_state,file(Module)),
    setup_call_cleanup(true,
      catch(kb_saved_state:run_child(SWI,['-q','-f',none,'-s',Module,'-g',
        "kb_saved_state:select_saved_state(none,none,_)",'-t',halt],Log,20),Failure,true),
      kb_cache:release_lock(Lock)),
    assertion(nonvar(Failure)),Failure=error(saved_state_child_failed(_,exit(2),Message),_),
    assertion(sub_string(Message,_,_,_,"saved_state_busy")).

test(resume_resources_callback_runs_once,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    dynamic(kb_saved_state:resume_application/2),
    setup_call_cleanup(
      asserta(kb_saved_state:(resume_application(_,_) :-
        message_queue_create(Queue),message_queue_destroy(Queue)),Ref),
      (kb_saved_state:start_resumed_application([],state{}),
       catch(kb_saved_state:start_resumed_application([],state{}),Failure,true),
       assertion(Failure=error(saved_state_already_resumed,_))),
      (erase(Ref),retractall(kb_saved_state:resume_started))).

test(empty_loaded_generation_does_not_reload_default,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    forall(kb_store:source_module(_,_,Native),kb_runtime:native_unload(Native)),
    retractall(kb_store:source_module(_,_,_)),retractall(kb_store:source_info(_,_)),
    retractall(kb_store:assertion(_,_)),retractall(kb_store:constant_locator(_,_)),
    retractall(kb_store:mt_locator(_,_)),kb_store:rebuild_rankings,
    kb_store:generation(G),saved_states(Catalog),
    create_saved_state("Empty knowledge base",G,Catalog.revision,State),
    assertion(State.counts.assertions=:=0),assertion(State.files==[]),
    assertion(State.validated==true).

test(cancellation_reaps_owned_child_and_keeps_catalog,
     [setup(fixture(D,_)),cleanup(cleanup(D))]) :-
    saved_states(Before),kb_store:status(BeforeKB),
    directory_file_path(D,'cancel.log',Log),current_prolog_flag(executable,SWI),
    catch(call_with_time_limit(0.5,
      kb_saved_state:run_child(SWI,['-q','-f',none,'-g','sleep(20),halt'],Log,30)),
      Error,true),
    assertion(Error==time_limit_exceeded),
    saved_states(After),assertion(Before=@=After),
    kb_store:status(AfterKB),assertion(BeforeKB=@=AfterKB).

:- end_tests(saved_application_state).
