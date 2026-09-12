:- begin_tests(settings_snapshot).
:- use_module('../kb_config').
:- use_module('../kb_limits',[]).
:- use_module('../kb_activity',[]).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(process)).
:- use_module(library(prolog_wrap)).
:- use_module(library(qsave)).
:- use_module(library(readutil)).
:- use_module(library(uuid)).
:- meta_predicate no_source_probes(0).

fixture(Case) :-
    source_file(plunit_settings_snapshot:fixture(_),Here),file_directory_name(Here,Tests),
    uuid(Id),atom_concat('.settings-snapshot-',Id,Name),
    directory_file_path(Tests,Name,Directory),make_directory(Directory),
    directory_file_path(Directory,'settings.json',File),
    (getenv('POWDER_SERVER_SETTINGS',Value)->Previous=some(Value);Previous=none),
    findall(S,kb_config:settings_snapshot(S),Stored),
    retractall(kb_config:settings_snapshot(_)),
    setenv('POWDER_SERVER_SETTINGS',File),
    Case=case{directory:Directory,file:File,previous:Previous,stored:Stored}.
cleanup(Case) :-
    retractall(kb_config:settings_snapshot(_)),
    forall(member(S,Case.stored),assertz(kb_config:settings_snapshot(S))),
    (Case.previous=some(Value)->setenv('POWDER_SERVER_SETTINGS',Value);
      unsetenv('POWDER_SERVER_SETTINGS')),
    delete_directory_and_contents(Case.directory).
snapshot(Settings,settings_snapshot{schema:1,settings:Settings,revision:none}).
server_defaults(Settings) :-
    kb_limits:server_defaults(Input),kb_config:validate_snapshot_settings(Input,Settings).
write_settings(File,Settings) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),
      (json_write_dict(S,Settings,[width(0)]),nl(S)),close(S)).
flip_settings(File,Settings) :-
    (Settings.startupConfigured==true->Next=false;Next=true),
    write_settings(File,Settings.put(startupConfigured,Next)).
no_source_probes(Goal) :-
    setup_call_cleanup(
      (wrap_predicate(kb_config:canonical_source(_,_),snapshot_no_source_probe,_,
         throw(error(unexpected_source_canonicalization,_))),
       wrap_predicate(kb_config:source_issues(_,_),snapshot_no_source_probe,_,
         throw(error(unexpected_source_existence_probe,_)))),
      Goal,
      (unwrap_predicate(kb_config:canonical_source(_,_),snapshot_no_source_probe),
       unwrap_predicate(kb_config:source_issues(_,_),snapshot_no_source_probe))).

test(copy_only_export_and_memory_only_import,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),
    directory_files(C.directory,Before),
    no_source_probes((import_settings_snapshot(Input),
      restored_settings_snapshot(Stored),export_settings_snapshot(Exported))),
    assertion(ground(Stored)),assertion(Stored==Exported),
    directory_files(C.directory,After),assertion(After==Before),
    assertion(\+exists_file(C.file)).

test(absent_sidecar_preserves_missing_directory_without_source_probes,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    directory_file_path(C.directory,'directory-no-longer-present',Missing),
    server_defaults(Default),
    Settings=Default.put(_{startupConfigured:true,startupFiles:[Missing]}),
    snapshot(Settings,Input),import_settings_snapshot(Input),
    no_source_probes((server_settings(Current),export_settings_snapshot(Exported))),
    assertion(Current.startupFiles==[Missing]),assertion(Current.revision==none),
    assertion(Current.issues==[]),assertion(Exported.settings==Settings),
    startup_selection([],Current,Selected),assertion(Selected==[Missing]).

test(present_sidecar_wins_without_adopting_it,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),import_settings_snapshot(Input),
    Changed=Default.put(startupConfigured,true),write_settings(C.file,Changed),
    no_source_probes(export_settings_snapshot(Exported)),
    server_settings(Current),restored_settings_snapshot(Stored),
    assertion(Exported.settings.startupConfigured==true),
    assertion(Current.startupConfigured==true),assertion(Current.revision\==none),
    assertion(Exported.revision==Current.revision),
    assertion(Stored.settings.startupConfigured==false),
    delete_file(C.file),
    no_source_probes(server_settings(Fallback)),
    assertion(Fallback.startupConfigured==false),assertion(Fallback.revision==none).

test(malformed_present_sidecar_never_uses_fallback,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),import_settings_snapshot(Input),
    setup_call_cleanup(open(C.file,write,S),write(S,'{'),close(S)),
    catch(export_settings_snapshot(_),ExportError,true),
    catch(server_settings(_),ReadError,true),
    assertion(nonvar(ExportError)),assertion(nonvar(ReadError)),
    restored_settings_snapshot(Still),assertion(Still.settings==Default).

test(invalid_present_settings_are_errors_not_fallback,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),import_settings_snapshot(Input),
    write_settings(C.file,Default.put(startupConfigured,invalid)),
    catch(export_settings_snapshot(_),Error,true),
    assertion(Error=error(domain_error(boolean,"invalid"),_)),
    write_settings(C.file,Default.put(pools,pools{})),
    catch(export_settings_snapshot(_),Missing,true),
    assertion(Missing=error(existence_error(settings_pool,loader),_)).

test(trailing_sidecar_data_is_rejected,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),import_settings_snapshot(Input),
    write_settings(C.file,Default),
    setup_call_cleanup(open(C.file,append,S),write(S,'{}'),close(S)),
    catch(export_settings_snapshot(_),Error,true),
    assertion(Error=error(syntax_error(trailing_server_settings_data),_)).

test(directory_at_sidecar_location_is_not_absence,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),import_settings_snapshot(Input),
    make_directory(C.file),
    catch(export_settings_snapshot(_),Error,true),
    assertion(Error=error(type_error(server_settings_file,_),_)).

test(changing_present_file_is_not_a_fallback,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),import_settings_snapshot(Input),
    write_settings(C.file,Default),
    setup_call_cleanup(
      wrap_predicate(kb_config:read_settings_document(_File,D),changing_settings_snapshot,Wrapped,
        (call(Wrapped),plunit_settings_snapshot:flip_settings(C.file,D))),
      catch(export_settings_snapshot(_),Error,true),
      unwrap_predicate(kb_config:read_settings_document(_,_),changing_settings_snapshot)),
    assertion(Error=error(server_settings_changing,_)),
    restored_settings_snapshot(Still),assertion(Still.settings==Default).

test(import_preserves_state_on_validation_error,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),import_settings_snapshot(Input),
    Bad=Input.put(settings,Default.put(pools,Default.pools.put(http,profile{start:0,max:8,spare:0}))),
    catch(import_settings_snapshot(Bad),Error,true),assertion(nonvar(Error)),
    restored_settings_snapshot(Still),assertion(Still==Input).

test(import_reuses_owner_lease_and_rejects_other_threads,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),
    setup_call_cleanup(kb_activity:begin_admission_lease(Lease),
      (import_settings_snapshot(Input),assertion(kb_activity:owns_admission_lease),
       thread_self(Parent),
       thread_create(catch(import_settings_snapshot(Input),Error,
         thread_send_message(Parent,blocked(Error))),Thread,[]),
       thread_join(Thread,true),
       thread_get_message(Parent,blocked(error(application_reload_busy,_)),[timeout(2)])),
      kb_activity:end_admission_lease(Lease)).

test(existing_optimistic_native_write_contract,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    server_defaults(Default),snapshot(Default,Input),import_settings_snapshot(Input),
    save_server_settings(Default.put(startupConfigured,true),none,Saved),
    catch(save_server_settings(Default,none,_),Error,true),
    assertion(Error=error(server_settings_conflict,_)),
    server_settings(After),assertion(After.revision==Saved.revision),
    assertion(After.startupConfigured==true),
    restored_settings_snapshot(Still),assertion(Still.settings==Default).

test(actual_qsave_restores_missing_sources_and_sidecar,
     [setup(fixture(C)),cleanup(cleanup(C))]) :-
    directory_file_path(C.directory,'original-directory',Source),make_directory(Source),
    directory_file_path(Source,'original.krf',Original),
    setup_call_cleanup(open(Original,write,S),write(S,'(fixture original)'),close(S)),
    server_defaults(Default),
    save_server_settings(Default.put(_{startupConfigured:true,startupFiles:[Source]}),none,_),
    no_source_probes(export_settings_snapshot(Snapshot)),import_settings_snapshot(Snapshot),
    delete_directory_and_contents(Source),delete_file(C.file),
    directory_file_path(C.directory,'settings.state',Image),
    directory_file_path(C.directory,'restored.json',Report),
    directory_file_path(C.directory,'transport.term',Transport),
    setup_call_cleanup(open(Transport,write,T,[encoding(utf8)]),
      write_term(T,Snapshot,[quoted(true),fullstop(true),nl(true)]),close(T)),
    current_prolog_flag(executable,SWI),
    source_file(plunit_settings_snapshot:builder_main,TestFile),
    process_create(SWI,['-q','-f',none,'-s',TestFile,
      '-g','plunit_settings_snapshot:builder_main','-t','halt(1)','--',Transport,Image],
      [process(Builder)]),
    process_wait(Builder,Built),assertion(Built==exit(0)),
    delete_file(Transport),
    process_create(SWI,['-q','-f',none,'-x',Image,'--',C.file,Report],[process(PID)]),
    process_wait(PID,Exit),assertion(Exit==exit(0)),
    setup_call_cleanup(open(Report,read,R),json_read_dict(R,Restored),close(R)),
    maplist(atom_string,Snapshot.settings.startupFiles,Expected),
    assertion(Restored.settings.startupFiles==Expected),
    assertion(Restored.settings.revision=="none"),assertion(Restored.settings.issues==[]),
    assertion(\+exists_file(C.file)),assertion(\+exists_directory(Source)).

builder_main :-
    current_prolog_flag(argv,[Transport,Image]),
    setup_call_cleanup(open(Transport,read,S,[encoding(utf8)]),read_term(S,Snapshot,[]),close(S)),
    no_source_probes(import_settings_snapshot(Snapshot)),
    qsave_program(Image,[class(development),goal(plunit_settings_snapshot:restored_main),
      toplevel(halt),init_file(none),stand_alone(false),autoload(false),foreign(no_save),packs(false)]),
    halt.

restored_main :-
    current_prolog_flag(argv,[File,Report]),setenv('POWDER_SERVER_SETTINGS',File),
    no_source_probes((restored_settings_snapshot(Snapshot),server_settings(Settings),
      export_settings_snapshot(Copy))),
    Snapshot.settings==Copy.settings,
    setup_call_cleanup(open(Report,write,S,[encoding(utf8)]),
      json_write_dict(S,_{settings:Settings,snapshot:Snapshot},[width(0)]),close(S)),
    halt.

:- end_tests(settings_snapshot).
