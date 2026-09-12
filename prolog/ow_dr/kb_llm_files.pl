:- module(kb_llm_files,
          [agent_state_dir/1, safe_owned_path/1, read_bytes/3, bytes_text/2,
           bytes_hash/2, atomic_bytes/2, read_json/2, atomic_json/2, locked_file/2]).
:- use_module(kb_paths,[app_dir/1,repo_root/1]).
:- use_module(kb_cache,[try_lock/2,release_lock/1,stage_path/2,install_stage/2,remove_if_exists/1]).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(process)).
:- use_module(library(readutil)).
:- use_module(library(utf8)).
:- meta_predicate locked_file(+,0).

agent_state_dir(Directory) :-
    (getenv('POWDER_AGENT_STATE',Given),Given\==''->
       absolute_file_name(Given,Directory,[access(none)])
    ;app_dir(App),directory_file_path(App,'.logos-state/agents',Directory)),
    safe_owned_path(Directory),
    (exists_directory(Directory)->true;make_directory_path(Directory),safe_owned_path(Directory)).

% Only trusted host code chooses paths. No browser/model input reaches this API.
safe_owned_path(Path) :-
    repo_root(Root),absolute_file_name(Path,Absolute,[access(none)]),
    atom_concat(Root,'/',Prefix),
    (Absolute==Root;sub_atom(Absolute,0,_,_,Prefix)),!,
    (current_prolog_flag(windows,true)->windows_no_reparse(Absolute);
     no_symlink_ancestors(Absolute)).
safe_owned_path(_) :- throw(error(permission_error(access,agent_path,outside_repository),_)).
no_symlink_ancestors(Path) :-
    (catch(read_link(Path,_,_),_,fail)->throw(error(permission_error(access,agent_path,symlink),_));true),
    file_directory_name(Path,Parent),
    (Parent==Path->true;no_symlink_ancestors(Parent)).
windows_no_reparse(Path) :-
    getenv('SystemRoot',Windows),
    directory_file_path(Windows,'System32/WindowsPowerShell/v1.0/powershell.exe',Exe),
    Script="$ErrorActionPreference='Stop'; [Console]::InputEncoding=[Text.Encoding]::UTF8; try { $p=[Console]::In.ReadToEnd(); while($p) { if([IO.File]::Exists($p) -or [IO.Directory]::Exists($p)) { if(([IO.File]::GetAttributes($p) -band [IO.FileAttributes]::ReparsePoint) -ne 0){exit 2} }; $p=[IO.Path]::GetDirectoryName($p) }; exit 0 } catch {exit 3}",
    setup_call_cleanup(
      process_create(Exe,['-NoProfile','-NonInteractive','-Command',Script],
                     [stdin(pipe(In)),stdout(null),stderr(null),process(PID)]),
      (set_stream(In,encoding(utf8)),format(In,'~w',[Path]),close(In),process_wait(PID,Exit,[timeout(5)]),
       (Exit==exit(0)->true;throw(error(permission_error(access,agent_path,reparse_or_unverifiable),_)))),
      (catch(close(In),_,true),
       catch((process_wait(PID,Status,[timeout(0)]),
              (Status==timeout->process_kill(PID,term),process_wait(PID,_);true)),_,true))).

read_bytes(File,Limit,Bytes) :-
    safe_owned_path(File),
    size_file(File,Size),(Size=<Limit->true;resource_error(agent_file_limit)),
    setup_call_cleanup(open(File,read,S,[type(binary)]),
      (Max is Limit+1,read_string(S,Max,Text),string_codes(Text,Bytes),
       length(Bytes,N),(N=<Limit->true;resource_error(agent_file_limit))),close(S)).
bytes_text(Bytes,Text) :-
    (phrase(utf8_codes(Codes),Bytes)->string_codes(Text,Codes);domain_error(utf8,agent_file)).
bytes_hash(Bytes,Hash) :- crypto_data_hash(Bytes,Hash,[algorithm(sha256),encoding(octet)]).
read_json(File,JSON) :-
    read_bytes(File,1048576,Bytes),bytes_text(Bytes,Text),atom_json_dict(Text,JSON,[]).
atomic_json(File,JSON) :-
    atom_json_dict(Text,JSON,[as(string),width(0)]),string_codes(Text,Codes),
    phrase(utf8_codes(Codes),Bytes),atomic_bytes(File,Bytes).
atomic_bytes(File,Bytes) :-
    safe_owned_path(File),stage_path(File,Stage),
    setup_call_cleanup(true,
      (setup_call_cleanup(open(Stage,write,S,[type(binary)]),
         (maplist(put_byte(S),Bytes),flush_output(S)),close(S)),
       install_stage(Stage,File)),remove_if_exists(Stage)).
locked_file(File,Goal) :-
    atom_concat(File,'.lock',LockFile),safe_owned_path(LockFile),try_lock(LockFile,Lock),
    (Lock==busy->throw(error(agent_state_busy,_));
     setup_call_cleanup(true,Goal,release_lock(Lock))).
