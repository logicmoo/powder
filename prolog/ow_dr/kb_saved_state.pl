:- module(kb_saved_state,
          [saved_states/1, create_saved_state/4, select_saved_state/3,
           saved_state_metadata/2, startup_saved_state/2, run_saved_state/3,
           saved_state_root/1, restore_saved_data/1, resume_entry/0,
           builder_main/0, resume_application/2, current_snapshot_identity/1,
           configuration_identity/1, checkpoint_stamp/1, runtime_probe/1,
           saved_snapshot_digest/2, effective_configuration/1,
           restored_server_settings/1, restored_source_packs/1]).
:- use_module(kb_paths).
:- use_module(kb_config, [settings_file/1,server_settings/1]).
:- use_module(kb_store, []).
:- use_module(kb_runtime, []).
:- use_module(kb_rule_utility, []).
:- use_module(kb_native_annotations, []).
:- use_module(kb_source_packs, []).
:- use_module(kb_console_launch, []).
:- use_module(kb_jobs, []).
:- use_module(kb_activity, []).
:- use_module(kb_metadata_policy, []).
:- use_module(kb_cache, []).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(lists)).
:- use_module(library(process)).
:- use_module(library(qsave)).
:- use_module(library(readutil)).
:- use_module(library(uuid)).
:- use_module(kb_checkpoint, []).
:- dynamic image_manifest/1, image_builder_root/1, restored/0, resume_started/0.
:- volatile restored/0, resume_started/0.
:- thread_local building/0.
:- thread_local builder_load_error/0.
:- multifile resume_application/2, checkpoint_stamp/1, user:term_expansion/2,prolog:message_hook/3.
:- meta_predicate with_catalog_lock(0), with_snapshot_lock(0), try_mutex(+,0), snapshot_quiescent(0).

state_format(1).

saved_state_root(Root) :-
    settings_file(Settings),file_directory_name(Settings,Directory),
    directory_file_path(Directory,'saved-states',Root).

% Only identifiers, never caller-provided paths, cross the public API.
state_id(Input,Id) :-
    atom_string(Id,Input),atom_codes(Id,[0's,0'-|Codes]),length(Codes,36),
    forall(member(C,Codes),(between(0'a,0'f,C);between(0'0,0'9,C);C=:=0'-)), !.
state_id(Input,_) :- domain_error(saved_state_id,Input).
state_directory(Id,Directory) :-
    state_id(Id,Safe),saved_state_root(Root),directory_file_path(Root,Safe,Directory).
catalog_path(File) :- saved_state_root(Root),directory_file_path(Root,'catalog.json',File).

safe_path(Path) :- safe_paths([Path]).
safe_paths(Paths) :-
    (current_prolog_flag(windows,true)->
      % GetAttributes detects junctions too. Paths are JSON on stdin, never
      % interpolated into executable PowerShell. Check each operation in a batch.
      Script="[Console]::InputEncoding=[Text.Encoding]::UTF8; $paths=ConvertFrom-Json ([Console]::In.ReadToEnd()); foreach ($p in $paths) { while ($p) { if ([IO.File]::Exists($p) -or [IO.Directory]::Exists($p)) { if (([IO.File]::GetAttributes($p) -band [IO.FileAttributes]::ReparsePoint) -ne 0) { exit 9 } }; $n=[IO.Path]::GetDirectoryName($p); if ($n -eq $p) { break }; $p=$n } }; exit 0",
      setup_call_cleanup(
        process_create(path(powershell),['-NoProfile','-NonInteractive','-Command',Script],
          [stdin(pipe(In)),stdout(null),stderr(std),process(PID)]),
        (setup_call_cleanup(true,
          (set_stream(In,encoding(utf8)),json_write_dict(In,Paths,[width(0)])),close(In)),
         process_wait(PID,Exit)),
        terminate_child(PID)),
      (Exit==exit(0)->true;throw(error(permission_error(access,saved_state_path,Paths),_)))
    ;maplist(no_links,Paths)).
no_links(Path) :-
    (read_link(Path,_,_)->throw(error(permission_error(access,saved_state_path,Path),_));true),
    file_directory_name(Path,Parent),(Parent==Path->true;no_links(Parent)).

with_catalog_lock(Goal) :-
    saved_state_root(Root),directory_file_path(Root,'catalog.lock',File),
    safe_paths([Root,File]),make_directory_path(Root),
    kb_cache:try_lock(File,Lock),
    (Lock==busy->throw(error(saved_state_busy,_));
      setup_call_cleanup(true,Goal,kb_cache:release_lock(Lock))).

read_catalog(Catalog,Revision) :-
    catalog_path(File),
    (exists_file(File)->
      safe_path(File),read_catalog_consistent(File,3,Catalog,Revision)
    ;Catalog=states{format:1,selected:none,states:[]},Revision=none).
read_catalog_consistent(_,0,_,_) :- !,throw(error(saved_state_catalog_changing,_)).
read_catalog_consistent(File,Attempts,Catalog,Revision) :-
    kb_cache:file_digest(File,Before),read_json(File,Read),
    kb_cache:file_digest(File,After),
    (Before==After->validate_catalog(Read),Catalog=Read,Revision=After;
      Left is Attempts-1,read_catalog_consistent(File,Left,Catalog,Revision)).
validate_catalog(Catalog) :-
    must_be(dict,Catalog),state_format(Catalog.format),must_be(list,Catalog.states),
    forall(member(M,Catalog.states),(must_be(dict,M),state_id(M.id,_))),
    findall(Id,(member(M,Catalog.states),text_atom(M.id,Id)),Ids),
    sort(Ids,Unique),same_length(Ids,Unique),
    text_atom(Catalog.selected,Selected),
    (Selected==none;memberchk(Selected,Ids)), !.
validate_catalog(_) :- throw(error(saved_state_catalog_invalid,_)).
read_json(File,Data) :-
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
      (json_read_dict(S,Data,[value_string_as(atom)]),read_string(S,_,Tail),
       normalize_space(string(Trimmed),Tail),
       (Trimmed==""->true;throw(error(saved_state_trailing_json(File),_)))),close(S)).
write_json(File,Data) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8),newline(posix)]),
      (json_write_dict(S,Data,[width(0)]),nl(S),flush_output(S)),close(S)).
write_catalog(Catalog) :-
    catalog_path(File),kb_cache:stage_path(File,Stage),
    setup_call_cleanup(true,(write_json(Stage,Catalog),rename_file(Stage,File)),
      kb_cache:remove_if_exists(Stage)).
expected_revision(Expected,Actual) :-
    text_atom(Expected,E),
    (E==Actual->true;throw(error(saved_state_revision_conflict(E,Actual),_))).
text_atom(Text,Atom) :- (atom(Text)->Atom=Text;atom_string(Atom,Text)).

saved_states(Result) :-
    read_catalog(Catalog,Revision),
    maplist(state_summary(Catalog.selected),Catalog.states,Items),
    Result=_{revision:Revision,selected:Catalog.selected,items:Items}.
state_summary(Selected,Metadata,Summary) :-
    text_atom(Selected,S),text_atom(Metadata.id,Id),
    (S==Id->Chosen=true;Chosen=false),
    catch((validate_artifact(Metadata,false,_),Available=true,Issue=null),Error,
      (Error=error(_,_)->Available=false,message_to_string(Error,Issue);throw(Error))),
    Summary=Metadata.put(_{selectedNextStart:Chosen,available:Available,issue:Issue}).

saved_state_metadata(Id0,Metadata) :-
    state_id(Id0,Id),read_catalog(Catalog,_),
    (member(Metadata,Catalog.states),text_atom(Metadata.id,Id)->true;
      throw(error(existence_error(saved_state,Id),_))).

select_saved_state(Input,Expected,Result) :-
    text_atom(Input,Id),(Id==none->true;state_id(Id,_)),
    with_catalog_lock(
      (read_catalog(Catalog,Revision),expected_revision(Expected,Revision),
       (Id==none->true;
         (member(M,Catalog.states),text_atom(M.id,Id)->validate_artifact(M,true,_);
          throw(error(existence_error(saved_state,Id),_)))),
       write_catalog(Catalog.put(selected,Id)))),
    saved_states(Result).

startup_saved_state(ExplicitSources,Choice) :-
    must_be(list,ExplicitSources),
    (ExplicitSources\=[]->Choice=sources(ExplicitSources)
    ;read_catalog(Catalog,_),text_atom(Catalog.selected,Id),
     (Id==none->Choice=none;
       member(M,Catalog.states),text_atom(M.id,Id),
       validate_artifact(M,true,Path),Choice=saved(Path,M))).

run_saved_state(Id,Args,Exit) :-
    must_be(list,Args),maplist(must_be(atom),Args),
    saved_state_metadata(Id,Metadata),validate_artifact(Metadata,true,Path),
    current_prolog_flag(executable,SWI),working_directory(Directory,Directory),
    append(['-q','-f',none,'-x',Path,'--'],Args,Command),
    setup_call_cleanup(
      kb_console_launch:launch_new_console(SWI,Command,Directory,PID),
      kb_console_launch:process_control(wait,PID,infinite,Exit),
      kb_console_launch:release_process(PID)).

create_saved_state(Name0,ExpectedGeneration,ExpectedRevision,Metadata) :-
    atom_string(Name,Name0),atom_length(Name,N),between(1,100,N),
    must_be(integer,ExpectedGeneration),
    with_catalog_lock(create_locked(Name,ExpectedGeneration,ExpectedRevision,Metadata)), !.
create_saved_state(Name,_,_,_) :- domain_error(saved_state_name,Name).

create_locked(Name,Expected,ExpectedRevision,Result) :-
    read_catalog(Catalog,Revision),expected_revision(ExpectedRevision,Revision),
    downcase_atom(Name,Lower),
    (member(Old,Catalog.states),text_atom(Old.name,OldName),downcase_atom(OldName,Lower)->
      throw(error(saved_state_name_exists(Name),_));true),
    with_snapshot_lock(
      (kb_store:generation(Current),
       (Current=:=Expected->true;throw(error(generation_conflict(Expected,Current),_))))),
    compatibility(Compatibility),check_loaded_code,
    uuid(UUID),atom_concat('s-',UUID,Id),state_directory(Id,Final),
    saved_state_root(Root),atom_concat('.building-',UUID,WorkName),
    directory_file_path(Root,WorkName,Work),
    setup_call_cleanup(make_directory(Work),
      (create_work(Name,Id,Expected,Compatibility,Work,Final,Catalog,Result)->true;
       throw(error(saved_state_creation_failed,_))),
      cleanup_directory(Work)).

create_work(Name,Id,Expected,Compatibility,Work,Final,Catalog,Result) :-
    with_snapshot_lock((snapshot(Expected,Sources,Summary),
      native_snapshot(Native),configuration_with_native(Native,Configuration),capture_checkpoint_stamp(Stamp),
      utility_snapshot(Utility))),
    snapshot_digest(Sources,SnapshotDigest),
    utility_summary(Utility,UtilitySummary),
    kb_metadata_policy:retention_policy(RetentionPolicy),
    get_time(Created),
    Meta=state{format:1,id:Id,name:Name,createdAt:Created,
      generation:Summary.generation,files:Summary.files,counts:Summary.counts,
      compatibility:Compatibility,snapshotDigest:SnapshotDigest,
      configuration:Configuration,checkpoint:Stamp,ruleUtility:UtilitySummary,
      retentionPolicy:RetentionPolicy},
    directory_file_path(Work,'snapshot.term',Snapshot),
    write_term_file(Snapshot,snapshot(Meta,Sources,Utility,Native)),
    directory_file_path(Work,'image.state',Image),
    directory_file_path(Work,'builder.log',Log),
    current_prolog_flag(executable,SWI),module_property(kb_saved_state,file(ModuleFile)),
    run_child(SWI,['-q','-f',none,'-s',ModuleFile,'-g','kb_saved_state:builder_main','-t',halt,
                  '--',Snapshot,Image],Log,600),
    % Builder inputs and native snapshots are gone BEFORE the actual restore test.
    kb_cache:remove_if_exists(Snapshot),cleanup_native_inputs(Work),
    directory_file_path(Work,'validation.json',Report),
    run_child(SWI,['-q','-f',none,'-x',Image,'--','--saved-state-verify',Report],Log,180),
    read_json(Report,Verified),
    (Verified.validated==true,Verified.generation=:=Expected,
     text_atom(Verified.snapshotDigest,SnapshotDigest),
     Verified.counts.assertions=:=Meta.counts.assertions->true;
      throw(error(saved_state_restore_validation_failed(Verified),_))),
    compatibility(Current),(Current==Compatibility->true;
      throw(error(saved_state_code_changed_during_creation,_))),
    kb_cache:file_digest(Image,Hash),size_file(Image,Size),
    kb_cache:file_digest(Report,ValidationHash),
    directory_file_path(Final,'image.state',FinalImage),public_path(FinalImage,PublicImage),
    Metadata=Meta.put(_{stateFile:'image.state',stateHash:Hash,sizeBytes:Size,
      retainedSnapshotDigest:Verified.retainedSnapshotDigest,
      path:PublicImage,validationHash:ValidationHash,validated:true}),
    directory_file_path(Work,'metadata.json',MetadataFile),write_json(MetadataFile,Metadata),
    kb_cache:remove_if_exists(Log),
    ((exists_directory(Final);exists_file(Final))->throw(error(saved_state_already_exists(Id),_));true),
    rename_file(Work,Final),
    append(Catalog.states,[Metadata],States),
    catch(write_catalog(Catalog.put(states,States)),Error,
      (rename_file(Final,Work),throw(Error))),
    catalog_path(CatalogFile),kb_cache:file_digest(CatalogFile,Revision),
    Result=Metadata.put(_{revision:Revision,selectedNextStart:false}).

capture_checkpoint_stamp(Stamp) :-
    (once(checkpoint_stamp(Found))->must_be(ground,Found),Stamp=Found;Stamp=none).
utility_snapshot(Snapshot) :-
    kb_rule_utility:export_telemetry(Snapshot),must_be(ground,Snapshot),
    (portable_term(Snapshot)->true;throw(error(saved_state_nonportable_rule_utility,_))).
utility_summary(Snapshot,Summary) :-
    kb_cache:terms_digest([Snapshot],Digest),length(Snapshot.rows,Count),
    Summary=utility{schema:Snapshot.schema,digest:Digest,ruleIdentities:Count,
      completedQueries:Snapshot.completedQueries}.
verify_saved_utility(Metadata,Summary) :-
    utility_snapshot(Snapshot),utility_summary(Snapshot,Summary),
    (json_value_equal(Metadata.ruleUtility,Summary)->true;
      throw(error(saved_state_rule_utility_mismatch,_))).
configuration_identity(Identity) :-
    native_snapshot(Native),configuration_with_native(Native,Identity).
native_snapshot(State) :-
    kb_native_annotations:export_native_snapshot(State),
    must_be(ground,State),
    (portable_term(State)->true;throw(error(saved_state_nonportable_native_annotations,_))).
native_summary(State,Summary) :-
    length(State.records,Count),
    Summary=native_annotations{schema:State.schema,revision:State.revision,
      sequence:State.sequence,records:Count}.
verify_saved_native(Metadata,Summary) :-
    kb_native_annotations:restored_native_snapshot(State),native_summary(State,Summary),
    (json_value_equal(Metadata.configuration.nativeTVA,Summary)->true;
      throw(error(saved_state_native_annotations_mismatch,_))).
configuration_with_native(Native,Identity) :-
    effective_configuration(Effective),Settings=Effective.settings,
    Config=configuration{startupConfigured:Settings.startupConfigured,
      startupFiles:Settings.startupFiles,pools:Settings.pools},
    native_summary(Native,NativeSummary),
    Material=configuration{settings:Config,nativeTVA:NativeSummary,
      sourcePacks:Effective.sourcePacks.packs},
    atom_json_dict(JSON,Material,[as(atom),width(0)]),
    crypto_data_hash(JSON,Hash,[algorithm(sha256),encoding(utf8)]),
    Identity=Material.put(hash,Hash).
effective_configuration(Configuration) :-
    settings_file(SettingsFile),
    (exists_file(SettingsFile)->server_settings(Settings)
    ;restored_server_settings(Settings)->true;server_settings(Settings)),
    kb_source_packs:packs_file(PacksFile),
    (exists_file(PacksFile)->kb_source_packs:list_packs(Packs)
    ;restored_source_packs(Packs)->true;kb_source_packs:list_packs(Packs)),
    Configuration=configuration{settings:Settings,sourcePacks:Packs}.
% Immutable image data is only a missing-sidecar fallback, never a second
% mutable registry. Existing validated sidecars remain authoritative.
restored_server_settings(Settings) :-
    image_manifest(Metadata),
    Settings=Metadata.configuration.settings.put(_{revision:none,issues:[]}).
restored_source_packs(Packs) :-
    image_manifest(Metadata),
    Packs=packs{revision:none,packs:Metadata.configuration.sourcePacks}.
current_snapshot_identity(Identity) :-
    with_snapshot_lock((kb_store:generation(G),snapshot(G,Sources,Status),
      configuration_identity(Configuration),capture_checkpoint_stamp(Stamp))),
    snapshot_digest(Sources,Digest),
    Identity=identity{generation:G,snapshotDigest:Digest,configuration:Configuration,
      checkpoint:Stamp,files:Status.files,counts:Status.counts}.

with_snapshot_lock(Goal) :-
    (current_predicate(kb_jobs:with_saved_state_snapshot/1)->
      (kb_activity:owns_admission_lease->
        kb_jobs:with_saved_state_snapshot(kb_saved_state:snapshot_quiescent(Goal))
      ;setup_call_cleanup(kb_jobs:begin_checkpoint_drain(Lease),
         kb_jobs:with_saved_state_snapshot(kb_saved_state:snapshot_quiescent(Goal)),
         kb_jobs:end_checkpoint_drain(Lease)))
    ;current_predicate(kb_jobs:job/4)->
      throw(error(saved_state_quiescence_hook_required,_))
    ;try_mutex(openworld_code_reload,try_mutex(openworld_store,Goal))).
snapshot_quiescent(Goal) :-
    (current_predicate(kb_debug_telnet:debug_require_admission_quiescence/0)->
      kb_debug_telnet:debug_require_admission_quiescence;true),
    (current_predicate(kb_interactive_control:interactive_context_active/0),
     kb_interactive_control:interactive_context_active->
      throw(error(saved_state_busy(interactive_session),_));true),
    call(Goal).
try_mutex(Name,Goal) :-
    (mutex_trylock(Name)->setup_call_cleanup(true,Goal,mutex_unlock(Name));
      throw(error(saved_state_busy(Name),_))).

snapshot(Expected,Sources,Summary) :- collect_snapshot(retained,Expected,Sources,Summary).
raw_snapshot(Expected,Sources,Summary) :- collect_snapshot(raw,Expected,Sources,Summary).
collect_snapshot(Mode,Expected,Sources,Summary) :-
    kb_store:generation(Current),
    (Current=:=Expected->true;throw(error(generation_conflict(Expected,Current),_))),
    (kb_runtime:native_file(File,OtherModule),\+kb_store:source_module(_,OtherModule,_)->
      throw(error(saved_state_unmanaged_native_source(File,OtherModule),_));true),
    (validate_restored_store->true;throw(error(saved_state_store_inconsistent,_))),
    findall(source(Source,Info,Records),
      (kb_store:source_module(Source,Module,_),kb_store:source_info(Source,OriginalInfo),
       portable_term(OriginalInfo),
       (Mode==raw->Info=OriginalInfo,RecordMode=raw;
         retained_source_info(Source,OriginalInfo,Info,Origin),RecordMode=retain(Origin)),
       module_records(RecordMode,Module,Records),length(Records,SourceCount),
       (SourceCount=:=Info.count->true;throw(error(saved_state_source_count(Source),_)))),Sources),
    kb_store:status(Summary),
    findall(Id,(member(source(_,_,Records),Sources),member(record(Id,_,_),Records)),Ids),
    length(Ids,Count),sort(Ids,Unique),
    (Count=:=Summary.counts.assertions,same_length(Ids,Unique)->true;
      throw(error(saved_state_store_inconsistent,_))).

module_records(Module,Records) :- module_records(raw,Module,Records).
module_records(Mode,Module,Records) :-
    findall(record(Id,Semantic,Metadata),
      (kb_runtime:module_assertion(Module,Id,Semantic,Ref),
       clause(NativeHead,NativeGuard,Ref),strip_module(NativeHead,_,Head),
       strip_module(NativeGuard,_,Guard),kb_cache:guarded_clause(Id,Semantic,Expected),
       ((Head:-Guard)=@=Expected->true;throw(error(saved_state_invalid_guard(Id),_))),
       kb_runtime:module_metadata_terms(Module,Id,OriginalMetadata),
       validate_record(record(Id,Semantic,OriginalMetadata)),
       (Mode==raw->Metadata=OriginalMetadata;
         Mode=retain(Origin),kb_metadata_policy:filter_metadata(Origin,OriginalMetadata,Metadata)),
       validate_record(record(Id,Semantic,Metadata))),Records).
retained_source_info(Source,Info,Retained,Origin) :-
    (get_dict(sourceOrigin,Info,Known)->Hint=Known
    ;get_dict(mappingMode,Info,Mode)->
      must_be(atom,Mode),
      (kb_metadata_policy:mapping_origin(Mode,Hint)->true;
        throw(error(saved_state_unknown_mapping_mode(Mode),_)))
    ;(file_name_extension(_,Extension,Source)->downcase_atom(Extension,Dialect);Dialect=unknown),
     (get_dict(options,Info,Options),is_list(Options)->true;Options=[]),
     must_be(ground,Options),
     kb_metadata_policy:source_mapping_mode(Source,Dialect,"",Options,Mode),
     (Mode==sumo->Hint=sumo;Hint=unknown)),
    % A stored hint prevents origin_context's legacy source-reading fallback.
    Context=Info.put(_{source:Source,sourceOrigin:Hint}),
    kb_metadata_policy:origin_context(Context,Origin),
    kb_metadata_policy:retention_policy(Policy),
    Retained=Context.put(_{sourceOrigin:Origin,retentionPolicy:Policy}).
retain_snapshot_source(source(Source,Info,Records),source(Source,Retained,Filtered)) :-
    maplist(validate_record,Records),retained_source_info(Source,Info,Retained,Origin),
    kb_metadata_policy:filter_records(Origin,Records,Filtered),
    maplist(validate_record,Filtered).
saved_snapshot_digest(Metadata,Digest) :-
    (get_dict(retainedSnapshotDigest,Metadata,Stored)->true;Stored=Metadata.snapshotDigest),
    text_atom(Stored,Digest).
verify_snapshot_digest(Sources,Expected) :-
    snapshot_digest(Sources,Digest),text_atom(Expected,ExpectedAtom),
    (Digest==ExpectedAtom->true;throw(error(saved_state_snapshot_mismatch,_))).
snapshot_digest(Sources,Digest) :-
    findall(Source-Records,
      (member(source(Source,_,Input),Sources),
       maplist(canonical_record,Input,Rows),sort(Rows,Records)),Data),
    sort(Data,Sorted),kb_cache:terms_digest(Sorted,Digest).
canonical_record(record(Id,Semantic,Metadata),record(Id,Semantic,Sorted)) :-
    sort(Metadata,Sorted).
validate_record(Record) :-
    (kb_cache:validate_record(Record),portable_term(Record)->true;
      throw(error(saved_state_invalid_record,_))).
portable_term(Term) :-
    acyclic_term(Term),term_attvars(Term,[]),
    forall(sub_term(Sub,Term),(var(Sub);Sub==[];number(Sub);string(Sub);compound(Sub);blob(Sub,text))), !.

write_term_file(File,Term) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8),newline(posix)]),
      (write_term(S,Term,[quoted(true),ignore_ops(true),fullstop(true),nl(true)]),flush_output(S)),
      close(S)).
read_term_file(File,Term) :-
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
      (read_term(S,Term,[syntax_errors(error)]),read_term(S,end_of_file,[])),close(S)).

% This is an isolated process entry, not an HTTP goal or live-stack snapshot.
builder_main :-
    catch((current_prolog_flag(argv,[Snapshot,Image]),
           (build_image(Snapshot,Image)->Code=0;throw(error(saved_state_builder_failed,_)))),
      Error,child_failure(Error,Code)),
    halt(Code).
child_failure(unwind(Reason),_) :- !,throw(unwind(Reason)).
child_failure(Error,1) :- print_message(error,Error).
build_image(Snapshot,Image) :-
    file_directory_name(Image,Work),
    app_dir(App),directory_file_path(App,'app.pl',Application),
    directory_file_path(App,'kb_checkpoint_host.pl',HostApplication),
    setup_call_cleanup(asserta(building,BuildRef),
      (load_files(user:Application,[silent(true)]),
       use_module(HostApplication,[]),
       (builder_load_error->throw(error(saved_state_backend_load_errors,_));true)),
      (erase(BuildRef),retractall(builder_load_error))),
    clean_builder_resources,
    install_image_data(Snapshot,Work,Metadata),
    canonical_native_path(Work,BuilderRoot),
    retractall(image_builder_root(_)),assertz(image_builder_root(BuilderRoot)),
    forall(kb_store:source_module(_,Module,Native),require_builder_source(Module,Native)),
    assertz(image_manifest(Metadata)),
    (validate_restored_store->true;throw(error(saved_state_builder_store_invalid,_))),
    clean_builder_resources,
    kb_jobs:prepare_saved_state,
    volatile(kb_runtime:native_handle/4),
    volatile(kb_runtime:native_signature/4),
    volatile(kb_runtime:native_file/2),
    qsave_program(Image,[class(development),goal(kb_saved_state:resume_entry),
      toplevel(halt),init_file(none),stand_alone(false),autoload(false),
      foreign(no_save),packs(false)]).
install_image_data(Snapshot,Work,Metadata) :-
    read_term_file(Snapshot,snapshot(InputMetadata,OriginalSources,Utility,Native)),
    adapt_snapshot_data(InputMetadata,OriginalSources,Metadata,Sources),
    compatibility(Current),require_compatible(Metadata.compatibility,Current),
    maplist(install_snapshot_source(Work),Sources),
    kb_store:rebuild_rankings,
    retractall(kb_store:generation(_)),assertz(kb_store:generation(Metadata.generation)),
    kb_rule_utility:import_telemetry(Utility),verify_saved_utility(Metadata,_),
    kb_native_annotations:import_native_state(Native),verify_saved_native(Metadata,_),
    retain_restored_metadata.
adapt_snapshot_data(InputMetadata,OriginalSources,Metadata,Sources) :-
    forall(member(source(_,_,Records),OriginalSources),maplist(validate_record,Records)),
    verify_snapshot_digest(OriginalSources,InputMetadata.snapshotDigest),
    maplist(retain_snapshot_source,OriginalSources,Sources),
    snapshot_digest(Sources,RetainedDigest),
    kb_metadata_policy:retention_policy(Policy),
    Metadata=InputMetadata.put(_{retentionPolicy:Policy,retainedSnapshotDigest:RetainedDigest}).
retain_restored_metadata :-
    setup_call_cleanup(kb_jobs:begin_checkpoint_drain(Lease),
      kb_jobs:with_saved_state_snapshot(kb_store:apply_metadata_retention_locked(_)),
      kb_jobs:end_checkpoint_drain(Lease)).

clean_builder_resources :-
    (nb_current(powder_rule_query,_)->
      throw(error(saved_state_unexpected_rule_query,_));true),
    (current_predicate(kb_lifecycle:console_snapshot_safe/0)->
      kb_lifecycle:console_snapshot_safe;true),
    (current_predicate(kb_console_launch:launcher_snapshot_safe/0)->
      kb_console_launch:launcher_snapshot_safe;true),
    (current_predicate(kb_debug_telnet:debug_snapshot_safe/0)->
      kb_debug_telnet:debug_snapshot_safe;true),
    (current_predicate(kb_checkpoint_http:checkpoint_http_snapshot_safe/0)->
      kb_checkpoint_http:checkpoint_http_snapshot_safe;true),
    (current_predicate(kb_checkpoint_host:host_snapshot_safe/0)->
      kb_checkpoint_host:host_snapshot_safe;true),
    kb_checkpoint:snapshot_safe,
    kb_jobs:save_quiescence(Jobs),
    (Jobs.state==ready,Jobs.registeredPools=:=0,Jobs.recordedJobs=:=0,
     Jobs.httpAttachments=:=0->true;
      throw(error(saved_state_unexpected_job_resources(Jobs),_))),
    (current_predicate(kb_server:http_current_server/2),
     kb_server:http_current_server(_,Port)->
      throw(error(saved_state_unexpected_http_listener(Port),_));true),
    forall(ephemeral_predicate(Module,Name,Arity),
      (functor(Head,Name,Arity),
       (current_predicate(Module:Name/Arity),clause(Module:Head,_)->
         throw(error(saved_state_unexpected_resource(Module:Name/Arity),_));true))).
ephemeral_predicate(kb_server,server_port,1).
ephemeral_predicate(kb_lifecycle,console_owner,1).
ephemeral_predicate(kb_prolog,bridge_ref,3).

user:term_expansion((:- initialization(_,main)),[]) :-
    kb_saved_state:building.
prolog:message_hook(_,error,_) :-
    kb_saved_state:building,
    (kb_saved_state:builder_load_error->true;assertz(kb_saved_state:builder_load_error)),
    fail.

install_snapshot_source(Work,Input) :-
    retain_snapshot_source(Input,source(Source,Info,Records)),
    must_be(atom,Source),must_be(dict,Info),maplist(validate_record,Records),
    uuid(UUID),atom_concat('native-',UUID,Part),directory_file_path(Work,Part,Directory),
    make_directory(Directory),directory_file_path(Directory,'clauses.data',Native),
    atom_concat(ow_saved_,UUID,Module),
    setup_call_cleanup(open(Native,write,S,[encoding(utf8),newline(posix)]),
      write_native_snapshot(S,Records),close(S)),
    kb_runtime:native_load(Native,Module,[metadata_context(Info),diagnostics(false)]),
    kb_store:activate_source(entry(Source,Info,Module,Native,Records,false)).
write_native_snapshot(S,Records) :-
    app_dir(App),directory_file_path(App,'kb_tail_loader.pl',Helper),
    kb_cache:write_one_line(S,(:-use_module(Helper),kb_tail_loader:load_remaining)),
    forall(member(record(Id,Semantic,Metadata),Records),
      (kb_cache:guarded_clause(Id,Semantic,(Head:-Guard)),
       kb_runtime:valid_guarded_clause(Head,Guard),
       kb_cache:write_one_line(S,(Head:-Guard)),
       forall(member(Term,Metadata),kb_cache:write_one_line(S,Term)))),
    flush_output(S).

restore_saved_data(Metadata) :-
    image_manifest(Metadata),
    with_mutex(powder_saved_restore,
      (restored->true;
       compatibility(Current),require_compatible(Metadata.compatibility,Current),
       clean_builder_resources,
       rebuild_native_registry,
       raw_snapshot(Metadata.generation,RawSources,_),
       saved_snapshot_digest(Metadata,ExpectedDigest),
       verify_snapshot_digest(RawSources,ExpectedDigest),
       retain_restored_metadata,
       kb_rule_utility:reset_transient,
       verify_saved_utility(Metadata,_),
       verify_saved_native(Metadata,_),
       (validate_restored_store->true;throw(error(saved_state_restored_store_invalid,_))),
       snapshot(Metadata.generation,Sources,_),verify_snapshot_digest(Sources,ExpectedDigest),
       kb_jobs:restore_saved_state,
       assertz(restored))).
rebuild_native_registry :-
    retractall(kb_runtime:native_handle(_,_,_,_)),
    retractall(kb_runtime:native_signature(_,_,_,_)),
    retractall(kb_runtime:native_file(_,_)),
    forall(kb_store:source_module(Source,Module,OldNative),
      (require_builder_source(Module,OldNative),
       findall(File,
         (current_predicate(Module:Name/Arity),kb_runtime:semantic_functor(Name),
          functor(Head,Name,Arity),\+predicate_property(Module:Head,imported_from(_)),
          clause(Module:Head,Guard,Ref),kb_runtime:guard_semantic(Guard,_,Head,_),
          clause_property(Ref,source(File))),Files0),
       sort(Files0,Files),
       (Files=[Native]->true;
        Files=[]->
          (kb_store:source_info(Source,Info),Info.count=:=0->Native=OldNative;
            throw(error(saved_state_missing_native_source(Source,Module),_)));
        throw(error(saved_state_native_sources(Module,Files),_))),
       require_builder_source(Module,Native),
       kb_runtime:register_native(Native,Module),
       retract(kb_store:source_module(Source,Module,OldNative)),
       assertz(kb_store:source_module(Source,Module,Native)))).
canonical_native_path(Path,Canonical) :-
    absolute_file_name(Path,Absolute,[access(none)]),
    (current_prolog_flag(windows,true)->downcase_atom(Absolute,Canonical);Canonical=Absolute).
require_builder_source(Module,Native) :-
    (image_builder_root(Root),atom_concat(ow_saved_,UUID,Module),
     atom_concat('s-',UUID,Id),state_id(Id,_),
     atom_concat('native-',UUID,Part),directory_file_path(Root,Part,Directory),
     directory_file_path(Directory,'clauses.data',Expected),
     canonical_native_path(Expected,ExpectedKey),canonical_native_path(Native,ActualKey),
     ActualKey==ExpectedKey->true;
      throw(error(saved_state_native_path_not_owned(Module,Native),_))).
validate_restored_store :-
    snapshot_count(Count),
    kb_store:status(Status),
    (Count=:=Status.counts.assertions->true;
      throw(error(saved_state_restored_count(Count,Status.counts.assertions),_))),
    forall(kb_store:assertion(Id,Data),
      (kb_runtime:module_assertion(Data.module,Id,Semantic,Ref),
       clause_property(Ref,file(_)),clause_property(Ref,line_count(Line)),integer(Line),
       kb_runtime:module_metadata(Data.module,kb_names,Id,Names),
       term_variables(Semantic,Variables),same_length(Names,Variables),
       (Semantic=(Head:-_)->true;Head=Semantic),
       predicate_property(Data.module:Head,dynamic),
       kb_index:semantic_constants(Semantic,Constants),Constants==Data.constants)).
snapshot_count(Count) :-
    findall(Id,(kb_store:active_modules(Modules),member(M,Modules),
      kb_runtime:module_assertion(M,Id,_,_)),Ids),
    length(Ids,Count),sort(Ids,Unique),same_length(Ids,Unique).

resume_entry :-
    catch(((restore_saved_data(Metadata)->true;throw(error(saved_state_restore_failed,_))),
           current_prolog_flag(argv,Args),
           (Args=['--saved-state-verify',Report]->
             verification_report(Metadata,Report)
           ;Args=['--checkpoint-candidate',Request]->
             kb_checkpoint:candidate_entry(Request,Metadata)
           ;start_resumed_application(Args,Metadata)),Code=0),
      Error,child_failure(Error,Code)),
    halt(Code).
start_resumed_application(Args,Metadata) :-
    with_mutex(powder_saved_resume,
      (resume_started->throw(error(saved_state_already_resumed,_));assertz(resume_started))),
    (clause(resume_application(_,_),_)->
      (once(resume_application(Args,Metadata))->true;
       throw(error(saved_state_resume_application_failed,_)))
    ;throw(error(saved_state_resume_application_hook_missing,_))).
verification_report(Metadata,Report) :-
    restore_saved_data(_), % Prove idempotence; do not create application resources.
    kb_store:status(Status),
    verify_native_mutability,
    runtime_probe(Probe),
    verify_saved_utility(Metadata,Utility),
    verify_saved_native(Metadata,Native),
    effective_configuration(Configuration),
    kb_store:assertions(Ordered),findall(Id,(member(Item,Ordered),Id=Item.id),Ids),
    write_json(Report,_{validated:true,generation:Metadata.generation,
      counts:Status.counts,files:Status.files,assertionIds:Ids,
      snapshotDigest:Metadata.snapshotDigest,retainedSnapshotDigest:Metadata.retainedSnapshotDigest,
      retentionPolicy:Metadata.retentionPolicy,ruleUtility:Utility,nativeTVA:Native,
      runtimeProbe:Probe,configuration:Configuration,resourcesStarted:false}).
runtime_probe(Probe) :-
    (once((kb_store:assertion(Id,Data),
           kb_runtime:module_assertion(Data.module,Id,Semantic,_),
           Semantic\=(_:-_),ground(Semantic),functor(Semantic,Name,_),
           \+memberchk(Name,[x_and,x_or]))) ->
      kb_runtime:module_metadata(Data.module,microtheory,Id,Mt),
      kb_store:generation(Generation),
      setup_call_cleanup(true,
        kb_runtime:query_modules_report([Data.module],Semantic,Mt,1,2,
          [generation(Generation),telemetry(false)],Solutions,_),
        kb_rule_utility:reset_transient),
      (Solutions=[solution(_,_,[_|_])]->true;throw(error(saved_state_query_probe_failed(Id),_))),
      kb_runtime:xc_clause_handle(Id,Ref),
      clause_property(Ref,file(File)),clause_property(Ref,line_count(Line)),
      Probe=probe{assertion:Id,query:true,provenance:true,nativeFile:File,nativeLine:Line}
    ;Probe=probe{query:not_applicable,reason:no_ground_ordinary_fact}).
verify_native_mutability :-
    (kb_store:assertion(Id,Data),kb_runtime:module_assertion(Data.module,Id,_,Ref)->
      clause(Head,Guard,Ref),strip_module(Head,_,SemanticHead),
      setup_call_cleanup(assertz(Data.module:(SemanticHead:-Guard),Copy),true,erase(Copy))
    ;true).

compatibility(Compatibility) :-
    current_prolog_flag(version_data,Version),term_string(Version,VersionText),
    current_prolog_flag(arch,Arch),current_prolog_flag(address_bits,Bits),
    current_prolog_flag(executable,SWI),kb_cache:file_digest(SWI,SWIHash),
    current_prolog_flag(home,Home),app_dir(App),repo_root(Repo),
    findall(Relative-Hash,(compatibility_file(App,File),
      relative_file_name(File,App,Relative),kb_cache:file_digest(File,Hash)),Pairs0),
    sort(Pairs0,Pairs),with_output_to(string(Text),write_canonical(Pairs)),
    crypto_data_hash(Text,CodeHash,[algorithm(sha256),encoding(utf8)]),
    state_format(Format),kb_cache:cache_schema(CacheSchema),
    external_dependencies(App,Home,Dependencies),
    native_dependencies(Home,SWI,Arch,NativeLibraries),
    kb_metadata_policy:retention_policy(RetentionPolicy),
    Compatibility=compatibility{format:Format,runtimeDataSchema:6,retentionPolicy:RetentionPolicy,
      cacheSchema:CacheSchema,codeHash:CodeHash,
      swi:VersionText,architecture:Arch,addressBits:Bits,swiHash:SWIHash,
      swiHome:Home,application:App,repository:Repo,externalDependencies:Dependencies,
      nativeLibraries:NativeLibraries}.
native_dependencies(Home,Executable,Arch,Dependencies) :-
    file_directory_name(Executable,Bin),directory_file_path(Home,lib,Lib),
    directory_file_path(Lib,Arch,ArchLib),sort([Bin,Lib,ArchLib],Directories),
    findall(Canonical-Hash,
      (member(Directory,Directories),exists_directory(Directory),
       directory_files(Directory,Names),member(Name,Names),
       file_name_extension(_,Extension,Name),memberchk(Extension,[dll,so,dylib]),
       directory_file_path(Directory,Name,File),exists_file(File),
       kb_cache:file_digest(File,Hash),
       (current_prolog_flag(windows,true)->downcase_atom(File,Canonical);Canonical=File)),Found),
    sort(Found,Sorted),findall(dependency{path:F,hash:H},member(F-H,Sorted),Dependencies).
external_dependencies(App,Home,Dependencies) :-
    findall(File-Hash,
      (source_file(File),file_name_extension(_,pl,File),
       \+under_directory(File,App),\+under_directory(File,Home),
       exists_file(File),kb_cache:file_digest(File,Hash)),Found),
    sort(Found,Sorted),findall(dependency{path:F,hash:H},member(F-H,Sorted),Dependencies).
under_directory(File,Directory) :-
    atom_concat(Directory,'/',Prefix),atom_concat(Prefix,_,File).
compatibility_file(App,File) :-
    directory_files(App,Names),member(Name,Names),file_name_extension(_,Ext,Name),
    memberchk(Ext,[pl,ps1,dll]),directory_file_path(App,Name,File),exists_file(File).
compatibility_file(App,File) :-
    directory_file_path(App,web,Web),
    web_asset_file(Web,File),
    file_name_extension(_,Ext,File),memberchk(Ext,[html,css,js,mjs,json]).
compatibility_file(App,File) :-
    directory_file_path(App,'docs/sumo-cycl-mapping.md',File),exists_file(File).
web_asset_file(Directory,File) :-
    directory_files(Directory,Names),member(Name,Names),
    \+memberchk(Name,['.','..',node_modules,'.git']),
    directory_file_path(Directory,Name,Path),\+read_link(Path,_,_),
    (exists_directory(Path)->web_asset_file(Path,File);exists_file(Path),File=Path).
require_compatible(Expected,Actual) :-
    % JSON atom/string roundtrips do not change compatibility semantics.
    atom_json_dict(A,Expected,[as(atom),width(0)]),
    atom_json_dict(B,Actual,[as(atom),width(0)]),
    (A==B->true;
      dict_pairs(Expected,_,ExpectedPairs),dict_pairs(Actual,_,ActualPairs),
      findall(Key,
        (member(Key-Value,ExpectedPairs),
         (get_dict(Key,Actual,Other),json_value_equal(Value,Other)->fail;true)),Different),
      findall(Key,(member(Key-_,ActualPairs),\+get_dict(Key,Expected,_)),Extra),
      append(Different,Extra,Changed0),sort(Changed0,Changed),
      throw(error(saved_state_incompatible(fields(Changed),recreate_with_current_backend),_))).
json_value_equal(A,B) :-
    atom_json_dict(TextA,A,[as(atom),width(0)]),
    atom_json_dict(TextB,B,[as(atom),width(0)]),TextA==TextB.
check_loaded_code :-
    app_dir(App),
    forall((source_file(File),file_directory_name(File,App),
            file_name_extension(_,pl,File),exists_file(File)),
      (current_predicate(kb_reload:loaded_digest/2),kb_reload:loaded_digest(File,Loaded)->
        kb_cache:file_digest(File,Now),
        (Loaded==Now->true;throw(error(saved_state_loaded_code_is_stale(File),_)))
      ;source_file_property(File,modified(LoadedTime)),time_file(File,NowTime),
       (LoadedTime=:=NowTime->true;throw(error(saved_state_loaded_code_is_stale(File),_))))).

validate_artifact(Metadata,HashImage,Image) :-
    (validate_artifact_data(Metadata,HashImage,Image)->true;
      throw(error(saved_state_artifact_invalid(Metadata.id),_))).
validate_artifact_data(Metadata,HashImage,Image) :-
    state_format(Metadata.format),Metadata.validated==true,
    state_directory(Metadata.id,Directory),
    directory_file_path(Directory,'metadata.json',MetaFile),
    directory_file_path(Directory,'image.state',Image),
    directory_file_path(Directory,'validation.json',Report),
    safe_paths([Directory,MetaFile,Image,Report]),read_json(MetaFile,Disk),
    (Disk=Metadata->true;throw(error(saved_state_metadata_mismatch(Metadata.id),_))),
    size_file(Image,Size),(Size=:=Metadata.sizeBytes->true;
      throw(error(saved_state_image_size_mismatch(Metadata.id),_))),
    kb_cache:file_digest(Report,ValidationHash),text_atom(Metadata.validationHash,ValidationHash),
    read_json(Report,Verified),Verified.validated==true,
    compatibility(Current),require_compatible(Metadata.compatibility,Current),
    (HashImage==true->
      kb_cache:file_digest(Image,Hash),text_atom(Metadata.stateHash,ExpectedHash),
      (Hash==ExpectedHash->true;throw(error(saved_state_image_hash_mismatch(Metadata.id),_)))
    ;true).

run_child(Program,Args,Log,Seconds) :-
    setup_call_cleanup(open(Log,append,Output,[encoding(utf8)]),
      setup_call_cleanup(
         process_create(Program,Args,
           [stdin(null),stdout(stream(Output)),stderr(stream(Output)),process(PID)]),
         (process_wait(PID,Exit,[timeout(Seconds)]),
          (Exit==exit(0)->true;
            flush_output(Output),
            read_file_to_string(Log,Message,[]),
            throw(error(saved_state_child_failed(Args,Exit,Message),_)))),
         terminate_child(PID)),
      close(Output)).
terminate_child(PID) :-
    catch((process_wait(PID,State,[timeout(0)]),
      (State==timeout->process_kill(PID,term),process_wait(PID,_);true)),_,true).
cleanup_native_inputs(Work) :-
    directory_files(Work,Names),
    forall((member(Name,Names),atom_concat('native-',_,Name)),
      (directory_file_path(Work,Name,Directory),cleanup_directory(Directory))).
cleanup_directory(Directory) :-
    (exists_directory(Directory)->delete_directory_and_contents(Directory);true).
