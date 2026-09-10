:- begin_tests(application_reload).
:- use_module('../kb_reload').
:- use_module('../kb_store').
:- use_module('../kb_paths').
:- use_module(library(filesex)).
:- use_module(library(uuid)).

reload_fixture(fixture(AppFile,Module,External,ExternalModule,Directory,Source)) :-
    uuid(Token),atom_concat(kb_reload_fixture_,Token,Module),
    atom_concat(Module,'.pl',Name),app_dir(App),directory_file_path(App,Name,AppFile),
    write_module(AppFile,Module,before),
    load_files(AppFile,[imports([])]),
    tmp_file(ow_reload,Directory),make_directory(Directory),
    directory_file_path(Directory,'external.pl',External),
    atom_concat(external_,Module,ExternalModule),write_module(External,ExternalModule,before),
    load_files(External,[imports([])]),
    directory_file_path(Directory,'source.krf',Source),
    setup_call_cleanup(open(Source,write,S),format(S,'(p A)~n',[]),close(S)),
    kb_compile:compile_source(Source,[state_dir(Directory),progress(none)],_),
    load_sources([Source],any,_),remember_loaded_code.

write_module(File,Module,Value) :-
    setup_call_cleanup(open(File,write,S),
      (format(S,':- module(~q,[value/1]).~n:- dynamic retained/1.~nvalue(~q).~n',[Module,Value]),
       format(S,':- initialization(flag(ow_reload_main_ran,_,1),main).~n',[])),close(S)).

cleanup_fixture(fixture(AppFile,_,External,_,Directory,Source)) :-
    generation(G),unload_source(Source,G,_),
    unload_file(AppFile),unload_file(External),
    retractall(kb_reload:failed_reload(_)),
    retractall(kb_reload:loaded_digest(_,_)),
    delete_file(AppFile),delete_directory_and_contents(Directory).

test(reloads_changed_application_only_and_preserves_kb,
     [setup(reload_fixture(F)),cleanup(cleanup_fixture(F))]) :-
    F=fixture(AppFile,Module,External,ExternalModule,_,Source),
    status(Before),kb_store:active_modules([NativeModule]),
    kb_runtime:module_assertion(NativeModule,Id,_,Ref),
    assertz(Module:retained(value)),flag(ow_reload_main_ran,_,0),
    write_module(AppFile,Module,after),write_module(External,ExternalModule,after),
    setup_call_cleanup(open(Source,append,S),format(S,'(q MustNotLoad)~n',[]),close(S)),
    reload_changed_files(Report),
    absolute_file_name(AppFile,Canonical),
    assertion(Report.reloaded==[Canonical]),assertion(Report.count=:=1),
    call(Module:value(after)),call(Module:retained(value)),call(ExternalModule:value(before)),
    flag(ow_reload_main_ran,MainRan,MainRan),assertion(MainRan=:=0),
    status(After),assertion(After =@= Before),
    kb_runtime:module_assertion(NativeModule,Id,_,Ref),
    reload_changed_files(Noop),assertion(Noop.count=:=0).

test(store_module_reload_keeps_runtime_generation_and_catalog,
     [setup(reload_fixture(F)),cleanup(cleanup_fixture(F))]) :-
    status(Before),microtheories(Contexts),
    source_file(kb_store:status(_),Store),
    retractall(kb_reload:loaded_digest(Store,_)),assertz(kb_reload:loaded_digest(Store,changed)),
    reload_changed_files(Report),assertion(Report.count=:=1),
    status(After),assertion(After =@= Before),microtheories(Contexts),
    findall(G,generation(G),[_]).

test(reload_syntax_failure_is_reported_and_can_be_retried,
     [setup(reload_fixture(F)),cleanup(cleanup_fixture(F))]) :-
    F=fixture(AppFile,Module,_,_,_,_),
    write_module(AppFile,Module,after),
    setup_call_cleanup(open(AppFile,append,S),format(S,'invalid( .~n',[]),close(S)),
    catch(reload_changed_files(_),error(application_reload_failed(Report),_),true),
    assertion(nonvar(Report)),assertion(Report.issues=[_]),
    assertion(sub_string(Report.message,_,_,_,"cannot be rolled back")),
    write_module(AppFile,Module,fixed),
    reload_changed_files(Retry),assertion(Retry.count=:=1),call(Module:value(fixed)).

test(no_request_can_supply_a_reload_target) :-
    forall(kb_reload:application_file(File),
      (assertion(\+sub_atom(File,_,_,_,'/.runtime/')),
       assertion(\+sub_atom(File,_,_,_,'/KBs/')))).

test(concurrent_reload_waits_for_other_reload_without_denial) :-
    thread_self(Main),
    setup_call_cleanup(thread_create(
      with_mutex(openworld_code_reload,
        (thread_send_message(Main,reload_locked),thread_get_message(release))),Worker,[]),
      (thread_get_message(reload_locked),
       setup_call_cleanup(thread_create(
         (reload_changed_files(Report),thread_send_message(Main,reloaded(Report))),Reloader,[]),
         (assertion(\+thread_get_message(Main,reloaded(_),[timeout(0.05)])),
          thread_send_message(Worker,release),thread_get_message(Main,reloaded(_),[timeout(3)])),
         thread_join(Reloader,true))),
      (thread_property(Worker,status(running))->thread_send_message(Worker,release),thread_join(Worker,true)
      ;thread_join(Worker,true))).

test(reload_runs_while_application_work_holds_store_lock,
     [setup(reload_fixture(F)),cleanup(cleanup_fixture(F))]) :-
    F=fixture(AppFile,Module,_,_,_,_),write_module(AppFile,Module,concurrent),
    thread_self(Main),
    setup_call_cleanup(thread_create(
      kb_activity:with_application(with_mutex(openworld_store,
        (thread_send_message(Main,application_active),thread_get_message(release)))),Worker,[]),
      (thread_get_message(application_active),
       setup_call_cleanup(thread_create(
         (reload_changed_files(Report),thread_send_message(Main,concurrent_reload(Report))),Reloader,[]),
         (thread_get_message(Main,concurrent_reload(Report),[timeout(3)]),
          assertion(Report.count=:=1),call(Module:value(concurrent))),
         (thread_send_message(Worker,release),thread_join(Reloader,true)))),
      thread_join(Worker,true)).
:- end_tests(application_reload).
