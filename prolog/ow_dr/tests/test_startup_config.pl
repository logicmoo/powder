:- begin_tests(startup_configuration).
:- use_module('../kb_config').
:- use_module('../kb_catalog',[]).
:- use_module('../kb_paths').
:- use_module(library(filesex)).

fixture(D,Previous) :-
    (getenv('POWDER_SERVER_SETTINGS',Value)->Previous=some(Value);Previous=none),
    tmp_file(startup_selection,D),make_directory(D),
    directory_file_path(D,'settings.json',Settings),setenv('POWDER_SERVER_SETTINGS',Settings).
cleanup(D,Previous) :-
    (Previous=some(Value)->setenv('POWDER_SERVER_SETTINGS',Value);unsetenv('POWDER_SERVER_SETTINGS')),
    delete_directory_and_contents(D).

test(default_is_the_combined_krf_and_cli_selection_wins,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    default_source(Source),file_base_name(Source,'tinyKB.krf'),
    server_settings(Settings),startup_selection([],Settings,[Source]),
    startup_selection(['explicit.meld'],Settings,['explicit.meld']).

test(configured_startup_badge_does_not_depend_on_current_loaded_sources,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    server_settings(Before),default_source(Source),
    save_server_settings(Before.put(_{startupConfigured:true,startupFiles:[Source]}),Before.revision,_),
    kb_catalog:startup_sources(Startup),
    assertion(Startup.known==true),assertion(Startup.evidence==configured_startup),
    absolute_file_name(Source,Canonical),public_path(Canonical,Public),
    assertion(Startup.paths==[Public]),
    server_settings(Read),startup_selection([],Read,[Canonical]).

test(explicit_empty_startup_remains_known_and_empty,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    server_settings(Before),
    save_server_settings(Before.put(_{startupConfigured:true,startupFiles:[]}),Before.revision,_),
    kb_catalog:startup_sources(Startup),
    assertion(Startup.known==true),assertion(Startup.paths==[]).

test(broken_configuration_is_unknown_not_false_zero,
     [setup(fixture(D,P)),cleanup(cleanup(D,P))]) :-
    settings_file(File),
    setup_call_cleanup(open(File,write,S),write(S,'not-json'),close(S)),
    kb_catalog:startup_sources(Startup),
    assertion(Startup.known==false),
    assertion(Startup.evidence==configuration_unavailable),
    assertion(string(Startup.error)).

:- end_tests(startup_configuration).
