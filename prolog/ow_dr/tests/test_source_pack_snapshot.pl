:- begin_tests(source_pack_snapshot).
:- use_module('../kb_source_packs').
:- use_module('../kb_activity',[]).
:- use_module('../kb_paths',[]).
:- use_module('../kb_saved_state',[]).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(process)).
:- use_module(library(prolog_wrap)).
:- use_module(library(qsave)).
:- use_module(library(uuid)).
:- dynamic image_state/1.
:- meta_predicate no_sources(0),no_authority_io(0).

fixture(C) :-
    source_file(plunit_source_pack_snapshot:fixture(_),Here),file_directory_name(Here,Tests),
    uuid(Id),atom_concat('.pack-snapshot-',Id,Name),
    directory_file_path(Tests,Name,D),make_directory(D),
    directory_file_path(D,'packs.json',File),
    (getenv('POWDER_SOURCE_PACKS',Old)->Previous=some(Old);Previous=none),
    (getenv('POWDER_SERVER_SETTINGS',OldSettings)->SettingsPrevious=some(OldSettings);SettingsPrevious=none),
    directory_file_path(D,'settings.json',SettingsFile),
    findall(S,kb_source_packs:restored_pack_snapshot(S),Stored),
    retractall(kb_source_packs:restored_pack_snapshot(_)),
    setenv('POWDER_SOURCE_PACKS',File),
    setenv('POWDER_SERVER_SETTINGS',SettingsFile),
    C=case{directory:D,file:File,previous:Previous,settingsPrevious:SettingsPrevious,stored:Stored}.
cleanup(C) :-
    retractall(kb_source_packs:restored_pack_snapshot(_)),
    forall(member(S,C.stored),assertz(kb_source_packs:restored_pack_snapshot(S))),
    (C.previous=some(Old)->setenv('POWDER_SOURCE_PACKS',Old);unsetenv('POWDER_SOURCE_PACKS')),
    (C.settingsPrevious=some(OldSettings)->setenv('POWDER_SERVER_SETTINGS',OldSettings);
      unsetenv('POWDER_SERVER_SETTINGS')),
    delete_directory_and_contents(C.directory).
pack(pack{id:'pack-fixture',name:'Fixture',roots:['KBs/root.krf'],
    choices:[choice{symbol:x_parent,files:['KBs/root.krf']},
             choice{symbol:x_generated,files:['KBs/dependency.krf'],origin:generated,
                    witness:[json{path:'KBs/root.krf',symbol:x_generated}]}],
    members:[member{path:'KBs/root.krf',role:root,why:[],identity:null},
             member{path:'KBs/dependency.krf',role:dependency,origin:generated,
                    why:[json{symbol:x_generated,kind:defined}],identity:json{sourceHash:abc},
                    witness:[json{path:'KBs/root.krf',symbol:x_generated}]}],
    resolution:json{ready:false,state:provisional,assignments:1293,
      evidence:json{
        bySymbol:json{x_parent:json{variables:['?X','?X'],defined:false,
          fragments:[json{line:7,text:'([x] "quoted")'},json{line:8,text:null}]}},
        unavailable:['KBs/missing.krf'],alternatives:[],weight:2.5}}}).
write_packs(File,Packs) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),
      json_write_dict(S,_{schema:'powder.source-packs.v1',packs:Packs},[width(0)]),close(S)).
seed(C,State) :- pack(P),write_packs(C.file,[P]),export_source_pack_snapshot(State).
no_sources(Goal) :-
    setup_call_cleanup(
      (wrap_predicate(kb_source_packs:authorize_pack_sources(_,_),snapshot_no_sources,_,
         throw(error(unexpected_original_source_read,_))),
       wrap_predicate(kb_cache:read_cache(_,_,_),snapshot_no_sources,_,
         throw(error(unexpected_cache_read,_))),
       wrap_predicate(kb_catalog_query:source_pack_snapshot(_),snapshot_no_sources,_,
         throw(error(unexpected_derived_catalog_read,_)))),
      Goal,
      (unwrap_predicate(kb_source_packs:authorize_pack_sources(_,_),snapshot_no_sources),
       unwrap_predicate(kb_cache:read_cache(_,_,_),snapshot_no_sources),
       unwrap_predicate(kb_catalog_query:source_pack_snapshot(_),snapshot_no_sources))).
no_authority_io(Goal) :-
    setup_call_cleanup(
      (wrap_predicate(kb_source_packs:packs_file(_),snapshot_no_authority,_,
         throw(error(unexpected_sidecar_configuration_read,_))),
       wrap_predicate(kb_paths:repo_root(_),snapshot_no_authority,_,
         throw(error(unexpected_repository_lookup,_)))),
      Goal,
      (unwrap_predicate(kb_source_packs:packs_file(_),snapshot_no_authority),
       unwrap_predicate(kb_paths:repo_root(_),snapshot_no_authority))).

test(capture_preserves_document_and_origin_semantics,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    pack(P),write_packs(C.file,[P]),directory_files(C.directory,Before),
    no_sources(export_source_pack_snapshot(State)),
    assertion(ground(State)),State.packs=[Copy],assertion(Copy==P),
    Copy.choices=[Legacy,Generated],assertion(\+get_dict(origin,Legacy,_)),
    kb_source_packs:selection_origin(Legacy,user),assertion(Generated.origin==generated),
    assertion(Copy.resolution.assignments=:=1293),
    directory_files(C.directory,After),assertion(After==Before),
    assertion(\+kb_source_packs:restored_pack_snapshot(_)).

test(import_and_inspect_are_memory_only,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),delete_file(C.file),directory_files(C.directory,Before),
    no_sources(no_authority_io((import_source_pack_snapshot(State),
      restored_source_pack_snapshot(Read)))),
    assertion(Read==State),directory_files(C.directory,After),assertion(After==Before),
    no_sources(list_packs(Reply)),assertion(Reply.packs==State.packs),
    assertion(Reply.revision==none),
    export_source_pack_snapshot(Current),assertion(Current.revision==none).

test(present_sidecar_wins_without_adoption,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),write_packs(C.file,[]),
    no_sources(list_packs(Current)),assertion(Current.packs==[]),
    assertion(Current.revision\==State.revision),
    restored_source_pack_snapshot(Old),assertion(Old==State).

test(malformed_present_sidecar_is_not_fallback,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),
    setup_call_cleanup(open(C.file,write,S),write(S,'{'),close(S)),
    catch(list_packs(_),Error,true),assertion(nonvar(Error)),
    restored_source_pack_snapshot(Old),assertion(Old==State).

test(nonfile_sidecar_is_not_absence,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),delete_file(C.file),make_directory(C.file),
    catch(list_packs(_),Error,true),
    assertion(Error=error(type_error(source_pack_document,_),_)),
    catch(kb_saved_state:effective_configuration(_),BridgeError,true),
    assertion(BridgeError=error(type_error(source_pack_document,_),_)),
    restored_source_pack_snapshot(Old),assertion(Old==State).

test(conflicting_sidecar_is_not_fallback,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),State.packs=[P],write_packs(C.file,[P,P]),
    catch(list_packs(_),Error,true),
    assertion(Error=error(domain_error(duplicate_pack_ids,_),_)),
    restored_source_pack_snapshot(Old),assertion(Old==State).

test(authority_mismatch_is_not_an_empty_selection,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),delete_file(C.file),
    directory_file_path(C.directory,'other.json',Other),setenv('POWDER_SOURCE_PACKS',Other),
    catch(list_packs(_),Error,true),
    assertion(Error=error(source_pack_snapshot_authority_changed(_,_),_)).

test(live_verifier_rejects_revision_and_configuration_drift,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),verify_source_pack_snapshot_authority(State),
    write_packs(C.file,[]),
    catch(verify_source_pack_snapshot_authority(State),Changed,true),
    assertion(Changed=error(source_pack_snapshot_revision_changed(_,_),_)),
    directory_file_path(C.directory,'other.json',Other),write_packs(Other,[]),
    setenv('POWDER_SOURCE_PACKS',Other),
    catch(verify_source_pack_snapshot_authority(State),Authority,true),
    assertion(Authority=error(source_pack_snapshot_authority_changed(_,_),_)).

test(owner_can_import_and_capture_but_cannot_mutate_documents,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),
    setup_call_cleanup(kb_activity:begin_admission_lease(Lease),
      (import_source_pack_snapshot(State),export_source_pack_snapshot(Copy),assertion(Copy==State),
       State.packs=[P],catch(save_pack(P,State.revision,_),SaveError,true),
       assertion(SaveError=error(application_reload_busy,_)),
       directory_file_path(C.directory,'not-created.json',Missing),
       catch(kb_source_packs:write_document(Missing,none,_{},_),WriteError,true),
       assertion(WriteError=error(application_reload_busy,_)),
       assertion(\+exists_file(Missing)),assertion(kb_activity:owns_admission_lease)),
      kb_activity:end_admission_lease(Lease)).

test(other_thread_cannot_import_during_owned_lease,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),thread_self(Parent),
    setup_call_cleanup(kb_activity:begin_admission_lease(Lease),
      (thread_create(catch(import_source_pack_snapshot(State),Error,
         thread_send_message(Parent,blocked(Error))),Thread,[]),
       thread_join(Thread,true),
       thread_get_message(Parent,blocked(error(application_reload_busy,_)),[timeout(2)])),
      kb_activity:end_admission_lease(Lease)).

test(invalid_import_preserves_existing_fallback,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),
    catch(import_source_pack_snapshot(State.put(packs,[_{id:invalid}])),Error,true),
    assertion(nonvar(Error)),restored_source_pack_snapshot(Old),assertion(Old==State).

test(invalid_schema_and_revision_preserve_existing_fallback,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),
    forall(member(Invalid,[State.put(schema,invalid),State.put(revision,bad),
                          State.put(authority,State.authority.put(repositoryRoot,'relative'))]),
      (catch(import_source_pack_snapshot(Invalid),Error,true),assertion(nonvar(Error)))),
    restored_source_pack_snapshot(Old),assertion(Old==State).

test(cyclic_import_is_rejected_without_mutation,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),Cycle=json{self:Cycle},
    catch(import_source_pack_snapshot(State.put(packs,[Cycle])),Error,true),
    assertion(Error=error(type_error(acyclic_source_pack_snapshot,_),_)),
    restored_source_pack_snapshot(Old),assertion(Old==State).

test(saved_bridge_rejects_conflicting_snapshot_before_mutation,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),
    Meta=state{sourcePackSnapshot:State,configuration:configuration{sourcePacks:[]}},
    catch(kb_saved_state:restore_source_pack_configuration(Meta),Error,true),
    assertion(Error=error(saved_state_source_pack_snapshot_mismatch,_)),
    restored_source_pack_snapshot(Old),assertion(Old==State).

test(saved_bridge_uses_memory_integrity_not_current_document_authority,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),delete_file(C.file),
    Meta=state{sourcePackSnapshot:State,configuration:configuration{sourcePacks:State.packs}},
    no_sources(no_authority_io(kb_saved_state:restore_source_pack_configuration(Meta))),
    no_sources(no_authority_io(kb_saved_state:verify_saved_source_packs(Meta))),
    catch(verify_source_pack_snapshot_authority(State),Error,true),
    assertion(Error=error(source_pack_snapshot_revision_changed(_,none),_)),
    no_sources(kb_saved_state:effective_configuration(Current)),
    assertion(Current.sourcePacks.packs==State.packs),
    assertion(Current.sourcePacks.revision==none).

test(first_write_after_missing_sidecar_uses_none_revision,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),import_source_pack_snapshot(State),delete_file(C.file),
    list_packs(Before),assertion(Before.revision==none),
    kb_source_packs:write_document(C.file,none,
      _{schema:'powder.source-packs.v1',packs:State.packs},Revision),
    list_packs(After),assertion(After.revision==Revision),assertion(After.packs==State.packs).

test(real_qsave_requires_explicit_reimport_of_volatile_fallback,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    seed(C,State),delete_file(C.file),
    directory_file_path(C.directory,'transport.term',Transport),
    directory_file_path(C.directory,'packs.state',Image),
    directory_file_path(C.directory,'restored.json',Report),
    setup_call_cleanup(open(Transport,write,T,[encoding(utf8)]),
      write_term(T,State,[quoted(true),fullstop(true),nl(true)]),close(T)),
    current_prolog_flag(executable,SWI),
    source_file(plunit_source_pack_snapshot:builder_main,Tests),
    process_create(SWI,['-q','-f',none,'-s',Tests,'-g','plunit_source_pack_snapshot:builder_main',
      '-t','halt(1)','--',Transport,Image],[process(Builder)]),
    process_wait(Builder,Built),assertion(Built==exit(0)),delete_file(Transport),
    process_create(SWI,['-q','-f',none,'-x',Image,'--',Report],[process(Child)]),
    process_wait(Child,Exit),assertion(Exit==exit(0)),
    kb_source_packs:read_document(Report,Reply),
    assertion(Reply.revision==none),assertion(Reply.packs\=[]),
    kb_source_packs:validate_pack_snapshot(State.put(packs,Reply.packs),Roundtrip),
    assertion(Roundtrip==State),
    assertion(\+exists_file(C.file)).

builder_main :-
    current_prolog_flag(argv,[Transport,Image]),
    setup_call_cleanup(open(Transport,read,S,[encoding(utf8)]),read_term(S,State,[]),close(S)),
    Meta=state{sourcePackSnapshot:State,configuration:configuration{sourcePacks:State.packs}},
    no_sources(no_authority_io(kb_saved_state:restore_source_pack_configuration(Meta))),
    assertz(image_state(Meta)),
    qsave_program(Image,[class(development),goal(plunit_source_pack_snapshot:restored_main),
      toplevel(halt),init_file(none),stand_alone(false),autoload(false),foreign(no_save),packs(false)]),
    halt.
restored_main :-
    current_prolog_flag(argv,[Report]),
    \+restored_source_pack_snapshot(_),image_state(Meta),State=Meta.sourcePackSnapshot,
    no_sources(no_authority_io((kb_saved_state:restore_source_pack_configuration(Meta),
      restored_source_pack_snapshot(Stored)))),
    Stored==State,setenv('POWDER_SOURCE_PACKS',State.authority.sidecar),
    no_sources(list_packs(Reply)),
    setup_call_cleanup(open(Report,write,S,[encoding(utf8)]),
      json_write_dict(S,Reply,[width(0)]),close(S)),halt.

:- end_tests(source_pack_snapshot).
