:- ensure_loaded(test_source_editor).
:- begin_tests(startup_badge).
:- use_module('../kb_startup_settings').
:- use_module('../kb_config',[]).
:- use_module('../kb_store',[]).
:- use_module(library(filesex)).

fixture(fixture(Repo,Old,Env)) :-
    plunit_source_editor:fixture(Repo,Old),
    (getenv('POWDER_SERVER_SETTINGS',Value)->Env=some(Value);Env=none),
    directory_file_path(Repo,'settings.json',Config),setenv('POWDER_SERVER_SETTINGS',Config),
    plunit_source_editor:write_source('tinyKB.krf',"(p A)\n",_),
    plunit_source_editor:write_source('other.krf',"(q B)\n",_).
cleanup(fixture(Repo,Old,Env)) :-
    (Env=some(Value)->setenv('POWDER_SERVER_SETTINGS',Value);unsetenv('POWDER_SERVER_SETTINGS')),
    plunit_source_editor:cleanup(Repo,Old).
test(enable_preserves_fallback_file_and_other_settings_without_loading,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    kb_config:server_settings(Before),kb_store:generation(G),
    enable_startup_source('KBs/other.krf',Before.revision,R),
    assertion(R.changed==true),kb_config:server_settings(After),
    assertion(After.startupConfigured==true),
    forall(member(Key,[loader,inference,http]),
      (get_dict(Key,Before.pools,OldProfile),get_dict(Key,After.pools,NewProfile),
       kb_config:pool_profile(Key,OldProfile,Normalized),assertion(NewProfile==Normalized))),
    assertion(length(After.startupFiles,2)),kb_store:generation(G),
    enable_startup_source('KBs/other.krf',After.revision,Again),
    assertion(Again.changed==false),assertion(Again.revision==After.revision).
test(directory_inherited_selection_is_not_expanded_or_rewritten,
     [setup(fixture(F)),cleanup(cleanup(F))]) :-
    F=fixture(Repo,_,_),directory_file_path(Repo,'KBs',Directory),
    kb_config:server_settings(B),
    kb_config:save_server_settings(B.put(_{startupConfigured:true,startupFiles:[Directory]}),B.revision,S),
    enable_startup_source('KBs/other.krf',S.revision,R),
    assertion(R.changed==false),kb_config:server_settings(A),
    assertion(A.startupFiles==S.startupFiles).
test(conflict_does_not_replace_another_saved_selection,
     [setup(fixture(F)),cleanup(cleanup(F)),throws(error(server_settings_conflict,_))]) :-
    kb_config:server_settings(B),
    enable_startup_source('KBs/other.krf',B.revision,_),
    enable_startup_source('KBs/tinyKB.krf',B.revision,_).
:- end_tests(startup_badge).
