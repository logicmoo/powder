:- module(kb_config, [server_settings/1, save_server_settings/3, startup_selection/3, settings_file/1]).
:- use_module(kb_limits).
:- use_module(kb_paths).
:- use_module(kb_cache, [file_digest/2,try_lock/2,release_lock/1,stage_path/2,install_stage/2,remove_if_exists/1]).
:- use_module(library(http/json)).
:- use_module(library(filesex)).
:- use_module(library(error)).

settings_file(File) :-
    (getenv('POWDER_SERVER_SETTINGS',Given),Given\==''->
      absolute_file_name(Given,File,[access(none)])
    ;app_dir(App),directory_file_path(App,'.logos-state/server-settings.json',File)).

server_settings(Settings) :-
    settings_file(File),
    (exists_file(File)->
      setup_call_cleanup(open(File,read,S,[encoding(utf8)]),json_read_dict(S,Saved),close(S)),
      validate_settings(Saved,Config),file_digest(File,Revision)
    ;server_defaults(Config),Revision=none),
    findall(_{path:Path,message:"Source is missing; startup will report a failed load."},
      (member(Path,Config.startupFiles),\+exists_file(Path)),Issues),
    Settings=Config.put(_{revision:Revision,issues:Issues}).

save_server_settings(Input,Expected,Settings) :-
    validate_settings(Input,Config),settings_file(File),
    file_directory_name(File,Directory),make_directory_path(Directory),
    atom_concat(File,'.lock',LockFile),try_lock(LockFile,Lock),
    (Lock==busy->throw(error(server_settings_busy,_));
      setup_call_cleanup(true,
        ( (exists_file(File)->file_digest(File,Revision);Revision=none),
          atom_string(ExpectedAtom,Expected),
          (ExpectedAtom==Revision->true;throw(error(server_settings_conflict,_))),
          stage_path(File,Stage),
          setup_call_cleanup(true,
            (setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
               (json_write_dict(S,Config,[width(0)]),nl(S),flush_output(S)),close(S)),
             install_stage(Stage,File)),remove_if_exists(Stage))),
        release_lock(Lock))),
    server_settings(Settings).

validate_settings(Input,Settings) :-
    must_be(dict,Input),
    (memberchk(Input.startupConfigured,[true,false])->true;domain_error(boolean,Input.startupConfigured)),
    must_be(list,Input.startupFiles),maplist(canonical_source,Input.startupFiles,Paths),
    unique_order(Paths,[],Unique),
    maplist(pool_setting(Input.pools),[loader,inference,http],Pairs),
    dict_pairs(Pools,pools,Pairs),
    Settings=server_settings{startupConfigured:Input.startupConfigured,startupFiles:Unique,pools:Pools}.

canonical_source(Input,Source) :-
    atom_string(Path,Input),repo_root(Root),
    absolute_file_name(Path,Source,[relative_to(Root),access(none)]),
    file_name_extension(_,Ext,Source),downcase_atom(Ext,Lower),
    (memberchk(Lower,[kif,krf,metta]),\+exists_directory(Source)->true;
      domain_error(startup_source_file,Input)).
unique_order([],_,[]).
unique_order([Path|Paths],Seen,Unique) :-
    (memberchk(Path,Seen)->unique_order(Paths,Seen,Unique)
    ;Unique=[Path|Rest],unique_order(Paths,[Path|Seen],Rest)).

pool_setting(Pools,Name,Name-Profile) :-
    get_dict(Name,Pools,P),
    maplist(must_be(integer),[P.start,P.max,P.spare]),
    (between(1,128,P.start),between(1,128,P.max),P.start=<P.max,
     P.spare>=0,P.spare=<P.max->true;domain_error(pool_profile(Name),P)),
    Profile=profile{start:P.start,max:P.max,spare:P.spare}.

startup_selection(Explicit,Settings,Sources) :-
    (Explicit\=[]->Sources=Explicit
    ;Settings.startupConfigured==true->Sources=Settings.startupFiles
    ;default_source(Source),Sources=[Source]).
