:- module(kb_config, [server_settings/1, save_server_settings/3, startup_selection/3,
                       settings_file/1,pool_profile/3,
                       export_settings_snapshot/1,import_settings_snapshot/1,
                       restored_settings_snapshot/1]).
:- use_module(kb_limits).
:- use_module(kb_paths).
:- use_module(kb_activity,[with_application/1]).
:- use_module(kb_cache, [file_digest/2,try_lock/2,release_lock/1,stage_path/2,install_stage/2,remove_if_exists/1]).
:- use_module(library(http/json)).
:- use_module(library(filesex)).
:- use_module(library(error)).
:- dynamic settings_snapshot/1.

settings_file(File) :-
    (getenv('POWDER_SERVER_SETTINGS',Given),Given\==''->
      absolute_file_name(Given,File,[access(none)])
    ;app_dir(App),directory_file_path(App,'.logos-state/server-settings.json',File)).

server_settings(Settings) :-
    settings_file(File),
    (exists_file(File)->
      read_settings_consistent(File,3,Config,Revision),source_issues(Config,Issues)
    ;require_absent_settings_file(File),
     (restored_settings_snapshot(Snapshot)->Config=Snapshot.settings,Issues=[]
     ;server_defaults(Config),source_issues(Config,Issues)),
     Revision=none),
    Settings=Config.put(_{revision:Revision,issues:Issues}).

read_settings_consistent(File,Attempts,Config,Revision) :-
    read_settings_data(File,Attempts,Saved,Revision),validate_settings(Saved,Config).
read_settings_data(_,0,_,_) :- !,throw(error(server_settings_changing,_)).
read_settings_data(File,Attempts,Saved,Revision) :-
    file_digest(File,Before),
    read_settings_document(File,Read),
    file_digest(File,After),
    (Before==After->Saved=Read,Revision=After;
     Left is Attempts-1,read_settings_data(File,Left,Saved,Revision)).
read_settings_document(File,Saved) :-
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
      (json_read_dict(S,Saved),read_string(S,_,Tail),string_codes(Tail,Codes),
       (forall(member(C,Codes),memberchk(C,[9,10,13,32]))->true;
         syntax_error(trailing_server_settings_data))),
      close(S)).
source_issues(Config,Issues) :-
    findall(_{path:Path,message:"Source is missing; startup will report a failed load."},
      (member(Path,Config.startupFiles),\+exists_file(Path)),Issues).
require_absent_settings_file(File) :-
    (exists_file(File)->throw(error(server_settings_changing,_))
    ;exists_directory(File)->type_error(server_settings_file,File)
    ;read_link(File,_,_)->type_error(server_settings_file,File)
    ;catch(setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
        throw(error(server_settings_changing,_)),close(S)),
      error(existence_error(source_sink,_),_),true)).

export_settings_snapshot(Snapshot) :-
    settings_file(File),
    (exists_file(File)->
       read_settings_data(File,3,Saved,Revision),
       validate_snapshot_settings(Saved,Settings)
    ;require_absent_settings_file(File),
     (restored_settings_snapshot(Restored)->Settings=Restored.settings
     ;server_defaults(Defaults),validate_snapshot_settings(Defaults,Settings)),
     Revision=none),
    Snapshot=settings_snapshot{schema:1,settings:Settings,revision:Revision}.
import_settings_snapshot(Input) :-
    validate_settings_snapshot(Input,Validated),
    Snapshot=Validated.put(revision,none),
    (kb_activity:owns_admission_lease->
      install_settings_snapshot(Snapshot)
    ;with_application(install_settings_snapshot(Snapshot))).
install_settings_snapshot(Snapshot) :-
    with_mutex(powder_settings_snapshot,
      transaction((retractall(settings_snapshot(_)),assertz(settings_snapshot(Snapshot))))).
restored_settings_snapshot(Snapshot) :-
    with_mutex(powder_settings_snapshot,
      (findall(S,settings_snapshot(S),Stored),
       (Stored=[]->fail;Stored=[One]->validate_settings_snapshot(One,Snapshot)
       ;throw(error(server_settings_snapshot_conflict,_))))).
validate_settings_snapshot(Input,Snapshot) :-
    must_be(dict,Input),dict_pairs(Input,_,Pairs),
    findall(Key,member(Key-_,Pairs),Keys),
    (Keys==[revision,schema,settings]->true;domain_error(settings_snapshot_fields,Keys)),
    (Input.schema==1->true;domain_error(settings_snapshot_schema,Input.schema)),
    snapshot_revision(Input.revision,Revision),
    validate_snapshot_settings(Input.settings,Settings),
    Snapshot=settings_snapshot{schema:1,settings:Settings,revision:Revision},
    must_be(ground,Snapshot).
snapshot_revision(Input,Revision) :-
    (atom(Input)->Revision=Input;string(Input)->atom_string(Revision,Input);
      type_error(text,Input)),
    (valid_snapshot_revision(Revision)->true;domain_error(settings_snapshot_revision,Input)).
valid_snapshot_revision(none) :- !.
valid_snapshot_revision(Revision) :-
    atom_codes(Revision,Codes),length(Codes,64),
    forall(member(C,Codes),(between(0'0,0'9,C);between(0'a,0'f,C))).
validate_snapshot_settings(Input,Settings) :-
    must_be(dict,Input),
    (Input.startupConfigured==true->true;Input.startupConfigured==false->true;
      domain_error(boolean,Input.startupConfigured)),
    must_be(list,Input.startupFiles),maplist(snapshot_source,Input.startupFiles,Paths),
    unique_order(Paths,[],Unique),
    must_be(dict,Input.pools),
    maplist(snapshot_pool(Input.pools),[loader,inference,http],Pairs),
    dict_pairs(Pools,pools,Pairs),
    Settings=server_settings{startupConfigured:Input.startupConfigured,startupFiles:Unique,pools:Pools}.
snapshot_pool(Pools,Name,Pair) :-
    (get_dict(Name,Pools,_)->pool_setting(Pools,Name,Pair);
      existence_error(settings_pool,Name)).
snapshot_source(Input,Source) :-
    (atom(Input)->Path=Input;string(Input)->atom_string(Path,Input);type_error(text,Input)),
    atom_codes(Path,Codes),
    (Codes\=[],forall(member(C,Codes),C>=32)->true;domain_error(startup_source_path,Input)),
    (is_absolute_file_name(Path)->Source=Path;
      repo_root(Root),directory_file_path(Root,Path,Source)).

save_server_settings(Input,Expected,Settings) :-
    with_application(save_settings_guarded(Input,Expected,Settings)).
save_settings_guarded(Input,Expected,Settings) :-
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
    (exists_directory(Source)->true;
     memberchk(Lower,[kif,krf,meld,metta])->true;
      domain_error(startup_source_file,Input)).
unique_order([],_,[]).
unique_order([Path|Paths],Seen,Unique) :-
    (memberchk(Path,Seen)->unique_order(Paths,Seen,Unique)
    ;Unique=[Path|Rest],unique_order(Paths,[Path|Seen],Rest)).

pool_setting(Pools,Name,Name-Profile) :-
    get_dict(Name,Pools,P),pool_profile(Name,P,Profile).
pool_profile(Name,P,Profile) :-
    (memberchk(Name,[loader,inference,http])->true;domain_error(pool_name,Name)),
    must_be(dict,P),
    maplist(must_be(integer),[P.start,P.max,P.spare]),
    (between(1,128,P.start),between(1,128,P.max),P.start=<P.max,
     P.spare>=0,P.spare=<P.max->true;domain_error(pool_profile(Name),P)),
    Base=profile{start:P.start,max:P.max,spare:P.spare},
    (get_dict(queueCapacity,P,Capacity)->
      (Name==http->domain_error(http_queue_capacity,Capacity);true),
      must_be(integer,Capacity),
      (between(1,1000,Capacity)->true;domain_error(pool_queue_capacity,Capacity)),
      Profile=Base.put(queueCapacity,Capacity)
    ;Profile=Base).

startup_selection(Explicit,Settings,Sources) :-
    (Explicit\=[]->Sources=Explicit
    ;Settings.startupConfigured==true->Sources=Settings.startupFiles
    ;default_source(Source),Sources=[Source]).
