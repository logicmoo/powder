:- use_module('../kb_llm_files').
:- use_module('../kb_paths',[app_dir/1,repo_root/1]).
:- use_module(library(plunit)).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(prolog_wrap)).
:- use_module(library(process)).
:- use_module(library(http/json)).
:- use_module(library(lists)).
:- use_module(library(readutil)).
:- dynamic llm_file_process/0.

llm_file_fixture(Directory,File) :-
    app_dir(App),directory_file_path(App,tests,Tests),uuid(Id,[version(4)]),
    atom_concat('.llm-files-',Id,Name),directory_file_path(Tests,Name,Directory),
    make_directory(Directory),directory_file_path(Directory,'conversation.json',File).
llm_file_cleanup(Directory) :-
    retractall(kb_llm_files:json_cache(_,_,_)),
    delete_directory_and_contents(Directory).
llm_file_document(Doc) :-
    length(Codes,65536),maplist(=(0'a),Codes),string_codes(Text,Codes),
    Doc=_{id:"synthetic-file-benchmark",revision:0,history:[_{role:"user",content:Text}],
      queue:_{items:[_{callId:"synthetic-pending",text:"Preserve this queued text",status:"queued"}]},
      calls:[_{id:"synthetic-call",state:"completed",result:_{ok:true}}],
      audit:[_{operation:"synthetic-observation",revision:1}]}.
llm_file_save(File) :-
    locked_file(File,
      (read_json(File,Before),Revision is Before.revision+1,
       atomic_json(File,Before.put(revision,Revision)))).
llm_file_sample(File,Millis) :-
    get_time(Start),llm_file_save(File),get_time(End),Millis is (End-Start)*1000.
benchmark_llm_files :-
    setup_call_cleanup(llm_file_fixture(Directory,File),
      (llm_file_document(Doc),atomic_json(File,Doc),
       retractall(llm_file_process),
       setup_call_cleanup(
         wrap_predicate(process:process_create(_,_,_),llm_file_benchmark_process,Wrapped,
           (assertz(user:llm_file_process),call(Wrapped))),
         findall(Millis,(between(1,5,_),llm_file_sample(File,Millis)),Samples),
         unwrap_predicate(process:process_create(_,_,_),llm_file_benchmark_process)),
       read_json(File,After),assertion(After.revision=:=5),
       assertion(After.queue.items=[_]),assertion(After.calls=[_]),assertion(After.audit=[_]),
       findall(1,llm_file_process,Processes),length(Processes,ProcessCount),
       sum_list(Samples,Total),Mean is Total/5,msort(Samples,Sorted),nth1(3,Sorted,Median),
       format('Five locked read/update/atomic saves, 64 KiB synthetic history.~n'),
       format('samplesMs=~q meanMs=~3f medianMs=~3f subprocesses=~d~n',
         [Samples,Mean,Median,ProcessCount])),
      llm_file_cleanup(Directory)).
llm_file_junction(Link,Target) :-
    getenv('SystemRoot',Windows),
    directory_file_path(Windows,'System32/WindowsPowerShell/v1.0/powershell.exe',Exe),
    Script="$ErrorActionPreference='Stop'; [Console]::InputEncoding=[Text.Encoding]::UTF8; $p=ConvertFrom-Json -InputObject ([Console]::In.ReadToEnd()); New-Item -ItemType Junction -Path $p.link -Value $p.target | Out-Null",
    atom_json_dict(Text,_{link:Link,target:Target},[as(string)]),
    setup_call_cleanup(
      process_create(Exe,['-NoProfile','-NonInteractive','-Command',Script],
        [stdin(pipe(In)),stdout(null),stderr(std),process(PID)]),
      (set_stream(In,encoding(utf8)),format(In,'~s',[Text]),close(In),process_wait(PID,exit(0))),
      catch(close(In),_,true)).
llm_file_rejected(Goal) :-
    catch((call(Goal),Result=accepted),error(permission_error(access,agent_path,_),_),Result=rejected),
    assertion(Result==rejected).
:- meta_predicate llm_file_rejected(0).
llm_file_lock_child(File,Script) :-
    source_file(kb_llm_files:locked_file(_,_),Module),
    setup_call_cleanup(open(Script,write,S,[encoding(utf8)]),
      (write_term(S,(:- use_module(Module)),[quoted(true),fullstop(true),nl(true)]),
       write_term(S,(:- initialization(main,main)),[quoted(true),fullstop(true),nl(true)]),
       write_term(S,(main :- catch(locked_file(File,true),error(agent_state_busy,_),Busy=true),
         (Busy==true->halt(0);halt(1))),[quoted(true),fullstop(true),nl(true)])),
      close(S)).
llm_file_finish_child(PID,Exit) :-
    (nonvar(Exit),Exit\==timeout->true;
     process_wait(PID,Status,[timeout(0)]),
     (Status==timeout->process_kill(PID,term),process_wait(PID,_);true)).

:- begin_tests(llm_files).
test(utf8_size_bounds_and_cached_identity,
     [setup(llm_file_fixture(D,F)),cleanup(llm_file_cleanup(D))]) :-
    string_codes(Text,[65,937,128512,10]),
    atomic_json(F,_{revision:1,text:Text}),read_json(F,First),
    assertion(First.text==Text),read_json(F,Again),assertion(Again==First),
    catch(read_bytes(F,1,_),error(resource_error(agent_file_limit),_),Bounded=true),
    assertion(Bounded==true),
    atomic_json(F,_{revision:2,text:Text}),read_json(F,Next),assertion(Next.revision=:=2).
test(installation_failure_preserves_complete_final_and_cleans_stage,
     [setup(llm_file_fixture(D,F)),cleanup(llm_file_cleanup(D))]) :-
    atomic_bytes(F,[65]),
    setup_call_cleanup(
      wrap_predicate(kb_cache:install_stage(_,_),llm_file_install_failure,_,throw(error(synthetic_install_failure,_))),
      catch(atomic_bytes(F,[66]),error(synthetic_install_failure,_),Failed=true),
      unwrap_predicate(kb_cache:install_stage(_,_),llm_file_install_failure)),
    assertion(Failed==true),read_bytes(F,10,Bytes),assertion(Bytes==[65]),
    directory_files(D,Files),assertion(\+ (member(Name,Files),sub_atom(Name,_,_,_,'.stage.'))).
test(partial_stage_error_preserves_final,
     [setup(llm_file_fixture(D,F)),cleanup(llm_file_cleanup(D))]) :-
    atomic_bytes(F,[65]),catch(atomic_bytes(F,[66,999]),_,Failed=true),assertion(Failed==true),
    read_bytes(F,10,Bytes),assertion(Bytes==[65]),
    directory_files(D,Files),assertion(\+ (member(Name,Files),sub_atom(Name,_,_,_,'.stage.'))).
test(repository_boundary_is_checked_before_access) :-
    repo_root(Root),atom_concat(Root,'-not-owned/absent.json',Outside),
    catch(safe_owned_path(Outside),error(permission_error(access,agent_path,outside_repository),_),Rejected=true),
    assertion(Rejected==true).
test(cached_json_is_not_a_cached_path_approval,
     [condition(current_prolog_flag(windows,true)),setup(llm_file_fixture(D,_)),cleanup(llm_file_cleanup(D))]) :-
    directory_file_path(D,'original',Original),make_directory(Original),
    directory_file_path(D,'target',Target),make_directory(Target),
    directory_file_path(Original,'same.json',File),directory_file_path(Target,'same.json',Other),
    atomic_json(File,_{sentinel:"synthetic cached data"}),read_json(File,Cached),
    atomic_json(Other,Cached),directory_file_path(D,'held',Held),rename_file(Original,Held),
    setup_call_cleanup(llm_file_junction(Original,Target),
      (llm_file_rejected(read_json(File,_)),
       llm_file_rejected(kb_llm_files:windows_no_reparse_fallback(File))),
      delete_directory(Original)),
    read_json(Other,Still),assertion(Still==Cached).
test(dangling_junction_is_rejected_without_exists_shortcuts,
     [condition(current_prolog_flag(windows,true)),setup(llm_file_fixture(D,_)),cleanup(llm_file_cleanup(D))]) :-
    directory_file_path(D,'target',Target),make_directory(Target),
    directory_file_path(D,'junction',Link),
    setup_call_cleanup(llm_file_junction(Link,Target),
      (delete_directory(Target),directory_file_path(Link,'future.json',Future),
       llm_file_rejected(safe_owned_path(Future)),
       llm_file_rejected(kb_llm_files:windows_no_reparse_fallback(Future))),
      delete_directory(Link)).
test(native_and_fallback_reject_windows_device_aliases_and_streams,
     [condition(current_prolog_flag(windows,true)),setup(llm_file_fixture(D,_)),cleanup(llm_file_cleanup(D))]) :-
    forall(member(Name,['NUL.json','CON','COM1.txt','data:stream','trailing.']),
      (directory_file_path(D,Name,File),
       llm_file_rejected(safe_owned_path(File)),
       llm_file_rejected(kb_llm_files:windows_no_reparse_fallback(File)))).
test(unicode_and_quoted_paths_work_in_native_and_fallback_guards,
     [condition(current_prolog_flag(windows,true)),setup(llm_file_fixture(D,_)),cleanup(llm_file_cleanup(D))]) :-
    string_codes(Name,[937,128512,32,39,38,46,106,115,111,110]),atom_string(Atom,Name),
    directory_file_path(D,Atom,File),atomic_json(File,_{value:"synthetic Unicode filename"}),
    safe_owned_path(File),kb_llm_files:windows_no_reparse_fallback(File),
    read_json(File,Doc),assertion(Doc.value=="synthetic Unicode filename").
test(regular_file_is_never_an_approved_missing_parent,
     [condition(current_prolog_flag(windows,true)),setup(llm_file_fixture(D,F)),cleanup(llm_file_cleanup(D))]) :-
    atomic_bytes(F,[65]),directory_file_path(F,'child.json',Child),
    llm_file_rejected(safe_owned_path(Child)),
    llm_file_rejected(kb_llm_files:windows_no_reparse_fallback(Child)).
test(native_failures_propagate_without_shell_fallback,
     [condition(current_predicate(kb_llm_files:agent_native_no_reparse/1)),
      setup(llm_file_fixture(D,F)),cleanup(llm_file_cleanup(D))]) :-
    setup_call_cleanup(
      wrap_predicate(kb_llm_files:agent_native_no_reparse(_),llm_file_native_failure,_,
        throw(error(permission_error(access,agent_path,synthetic_native_denial),win32(5)))),
      setup_call_cleanup(
        wrap_predicate(process:process_create(_,_,_),llm_file_unexpected_fallback,_,
          throw(error(unexpected_shell_fallback,_))),
        (catch(safe_owned_path(F),Error,true),
         assertion(Error==error(permission_error(access,agent_path,synthetic_native_denial),win32(5)))),
        unwrap_predicate(process:process_create(_,_,_),llm_file_unexpected_fallback)),
      unwrap_predicate(kb_llm_files:agent_native_no_reparse(_),llm_file_native_failure)).
test(native_save_path_has_no_subprocesses,
     [condition(current_predicate(kb_llm_files:agent_native_no_reparse/1)),
      setup(llm_file_fixture(D,F)),cleanup(llm_file_cleanup(D))]) :-
    setup_call_cleanup(
      wrap_predicate(process:process_create(_,_,_),llm_file_no_processes,_,throw(error(unexpected_process,_))),
      (atomic_json(F,_{revision:1}),llm_file_save(F),read_json(F,Doc),assertion(Doc.revision=:=2)),
      unwrap_predicate(process:process_create(_,_,_),llm_file_no_processes)).
test(json_size_limit_precedes_hashing,
     [setup(llm_file_fixture(D,F)),cleanup(llm_file_cleanup(D))]) :-
    setup_call_cleanup(open(F,write,S,[type(binary)]),(seek(S,1048576,bof,_),put_byte(S,0)),close(S)),
    setup_call_cleanup(
      wrap_predicate(crypto:crypto_file_hash(_,_,_),llm_file_unexpected_hash,_,throw(error(unexpected_hash,_))),
      (catch(read_json(F,_),error(resource_error(agent_file_limit),_),Rejected=true),assertion(Rejected==true)),
      unwrap_predicate(crypto:crypto_file_hash(_,_,_),llm_file_unexpected_hash)).
test(real_second_process_observes_existing_native_lock,
     [setup(llm_file_fixture(D,F)),cleanup(llm_file_cleanup(D))]) :-
    directory_file_path(D,'lock-child.pl',Script),llm_file_lock_child(F,Script),
    locked_file(F,
      setup_call_cleanup(
        process_create(path(swipl),['-q','-f',Script],[stdout(null),stderr(std),process(PID)]),
        (process_wait(PID,Exit,[timeout(15)]),assertion(Exit==exit(0))),
        llm_file_finish_child(PID,Exit))).
:- end_tests(llm_files).
