:- begin_tests(startup_defaults).
:- use_module('../kb_config').
:- use_module('../kb_paths').
:- use_module(library(filesex)).

fixture(Root,OldApp,OldEnv) :-
    app_dir(OldApp),
    (getenv('POWDER_SERVER_SETTINGS',Env)->OldEnv=some(Env);OldEnv=none),
    tmp_file(powder_startup,Root),make_directory(Root),
    directory_file_path(Root,'prolog/ow_dr',App),make_directory_path(App),
    directory_file_path(OldApp,'windows_catalog.ps1',Helper),
    directory_file_path(App,'windows_catalog.ps1',Copy),copy_file(Helper,Copy),
    directory_file_path(Root,'KBs/nested',Nested),make_directory_path(Nested),
    directory_file_path(Root,'settings.json',Settings),setenv('POWDER_SERVER_SETTINGS',Settings),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(App)),
    forall(member(Name,['a.krf','b.kif','c.metta','a.krf.pl','a.krf.qlf','a.krf.pl.qlf','a.krf.index.pl','a.krf.inventory.json']),
      (directory_file_path(Nested,Name,File),setup_call_cleanup(open(File,write,S),true,close(S)))).
cleanup(Root,OldApp,OldEnv) :-
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(OldApp)),
    (OldEnv=some(Env)->setenv('POWDER_SERVER_SETTINGS',Env);unsetenv('POWDER_SERVER_SETTINGS')),
    delete_directory_and_contents(Root).

test(all_original_sources_when_unset_but_empty_subset_and_cli_win,
     [setup(fixture(R,A,E)),cleanup(cleanup(R,A,E))]) :-
    server_settings(Initial),
    assertion(Initial.startupConfigured==false),
    assertion(length(Initial.startupFiles,3)),
    startup_selection([],Initial,Selected),assertion(Selected==Initial.startupFiles),
    Selected=[First|_],startup_selection([First],Initial,[First]),
    save_server_settings(Initial.put(_{startupConfigured:true,startupFiles:[First]}),Initial.revision,Subset),
    startup_selection([],Subset,[First]),
    save_server_settings(Subset.put(startupFiles,[]),Subset.revision,Empty),
    server_settings(Reread),assertion(Reread.startupFiles==[]),
    startup_selection([],Empty,[]),
    forall(member(Pool,[loader,inference,http]),
      (get_dict(Pool,Empty.pools,After),get_dict(Pool,Initial.pools,Before),
       assertion(After.start=:=Before.start),assertion(After.max=:=Before.max),
       assertion(After.spare=:=Before.spare))).
:- end_tests(startup_defaults).
