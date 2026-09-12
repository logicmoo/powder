:- module(kb_startup_settings,[enable_startup_source/3]).
:- use_module(kb_config,[]).
:- use_module(kb_catalog,[]).
:- use_module(kb_paths,[public_path/2]).
:- use_module(library(error)).

enable_startup_source(Input,Expected,Reply) :-
    kb_catalog:authorize_sources([Input],[Path]),
    kb_config:server_settings(Before),
    atom_string(Revision,Expected),
    (Revision==Before.revision->true;throw(error(server_settings_conflict,_))),
    kb_config:startup_selection([],Before,Selected),
    (selected_source(Selected,Path)->After=Before,Changed=false;
     append(Selected,[Path],Updated),
     kb_config:save_server_settings(Before.put(_{startupConfigured:true,startupFiles:Updated}),Expected,After),
     Changed=true),
    kb_catalog:startup_sources(Startup),public_path(Path,Public),
    Reply=_{path:Public,changed:Changed,revision:After.revision,startup:Startup,
      semantics:next_startup_only}.

selected_source(Selected,Path) :-
    member(Source,Selected),
    (Source==Path;exists_directory(Source),
     atom_concat(Source,'/',Prefix),atom_concat(Prefix,_,Path)), !.
