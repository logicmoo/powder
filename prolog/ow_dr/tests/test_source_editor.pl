:- begin_tests(source_editor).
:- use_module('../kb_source_editor').
:- use_module('../kb_paths').
:- use_module('../kb_cache', [file_digest/2,try_lock/2,release_lock/1]).
:- use_module('../kb_store', []).
:- use_module(library(filesex)).
:- use_module(library(readutil)).
:- use_module(library(uuid)).
:- use_module(library(crypto)).
:- use_module(library(process)).

fixture(Repo,Old) :-
    app_dir(Old),uuid(Id),directory_file_path(Old,'tests/artifacts',Artifacts),
    directory_file_path(Artifacts,Id,Repo),
    directory_file_path(Repo,'prolog/ow_dr',App),make_directory_path(App),
    directory_file_path(Old,'windows_catalog.ps1',Script),
    directory_file_path(App,'windows_catalog.ps1',Copy),copy_file(Script,Copy),
    directory_file_path(Repo,'KBs',Root),make_directory_path(Root),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(App)).
cleanup(Repo,Old) :-
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(Old)),
    delete_directory_and_contents(Repo).
write_source(Name,Bytes,File) :-
    kb_root(Root),directory_file_path(Root,Name,File),
    setup_call_cleanup(open(File,write,S,[encoding(octet),newline(posix)]),
      format(S,'~s',[Bytes]),close(S)).
raw(File,Bytes) :-
    setup_call_cleanup(open(File,read,S,[encoding(octet),newline(posix)]),
      read_string(S,_,Bytes),close(S)).
capture_error(Goal,Code) :- catch((Goal,fail),Error,(editor_error(Error,Code,_))).

test(latin1_crlf_unchanged_and_atomic_save,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('example.krf',"(p caf\u00e9)\r\n",File),
    kb_store:generation(G),
    editor_read("KBs/example.krf",Before),
    assertion(Before.text=="(p caf\u00e9)\r\n"),assertion(Before.newline==crlf),
    editor_save(_{path:"KBs/example.krf",text:Before.text,expectedRevision:Before.revision},Same),
    assertion(Same.unchanged==true),
    raw(File,"(p caf\u00e9)\r\n"),
    editor_save(_{path:"KBs/example.krf",text:"(p caf\u00e9)\r\n(q a)\r\n",expectedRevision:Before.revision},Saved),
    assertion(Saved.saved==true),assertion(Saved.revision\==Before.revision),
    raw(File,"(p caf\u00e9)\r\n(q a)\r\n"),
    kb_store:generation(G),
    editor_read("KBs/example.krf",After),assertion(After.revision==Saved.revision).

test(utf8_bom_roundtrip,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('unicode.metta',"\u00ef\u00bb\u00bf(p \u00f0\u009f\u0098\u0080)\n",File),
    editor_read("KBs/unicode.metta",Before),
    assertion(Before.bom==true),assertion(Before.text=="(p \U0001f600)\n"),
    editor_save(_{path:Before.path,text:Before.text,expectedRevision:Before.revision},Same),
    assertion(Same.unchanged==true),
    editor_save(_{path:Before.path,text:"(p \U0001f600)\n(q)\n",expectedRevision:Before.revision},_),
    raw(File,"\u00ef\u00bb\u00bf(p \u00f0\u009f\u0098\u0080)\n(q)\n").

test(canonical_alias_and_same_size_stat_invalidation,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('MiXeD.krf',"(old)\n",File),
    editor_read("KBs/mixed.krf",Before),assertion(Before.path=='KBs/MiXeD.krf'),
    time_file(File,T0),
    editor_save(_{path:Before.path,text:"(new)\n",expectedRevision:Before.revision},_),
    time_file(File,T1),assertion(T1-T0>=0.002),
    raw(File,"(new)\n").

test(cr_and_no_newline_roundtrips,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('cr.kif',"(a)\r(b)\r",File),editor_read("KBs/cr.kif",D),
    assertion(D.newline==cr),
    editor_save(_{path:D.path,text:"(c)\r(b)\r",expectedRevision:D.revision},_),
    raw(File,"(c)\r(b)\r"),
    write_source('empty.metta',"",Empty),editor_read("KBs/empty.metta",E),
    assertion(E.newline==none),
    editor_save(_{path:E.path,text:E.text,expectedRevision:E.revision},Same),
    assertion(Same.unchanged==true),raw(Empty,"").

test(conflict_contains_current_revision,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('conflict.kif',"(old)\n",File),editor_read("KBs/conflict.kif",Before),
    write_source('conflict.kif',"(external)\n",_),
    catch(editor_save(_{path:Before.path,text:"(mine)\n",expectedRevision:Before.revision},_),Error,true),
    assertion(nonvar(Error)),editor_error(Error,409,Reply),
    file_digest(File,Current),assertion(Reply.error.details.revision==Current),
    raw(File,"(external)\n").

test(mixed_newline_read_only_preserves_unchanged,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('mixed.krf',"(a)\r\n(b)\n",File),editor_read("KBs/mixed.krf",D),
    assertion(D.editable==false),assertion(D.newline==mixed),
    editor_save(_{path:D.path,text:D.text,expectedRevision:D.revision},Same),
    assertion(Same.unchanged==true),
    capture_error(editor_save(_{path:D.path,text:"(changed)\n",expectedRevision:D.revision},_),422),
    raw(File,"(a)\r\n(b)\n").

test(reject_invalid_utf8_and_legacy_bom,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('invalid.metta',"\u00c0\u00af",_),
    capture_error(editor_read("KBs/invalid.metta",_),422),
    write_source('nul.krf',"\u0000",_),
    capture_error(editor_read("KBs/nul.krf",_),422),
    write_source('bom.krf',"\u00ef\u00bb\u00bf(p)\n",_),
    capture_error(editor_read("KBs/bom.krf",_),422).

test(unrepresentable_save_and_newline_conversion_rejected,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('latin.meld',"(a)\r\n",File),editor_read("KBs/latin.meld",D),
    capture_error(editor_save(_{path:D.path,text:"(p \U0001f600)\r\n",expectedRevision:D.revision},_),422),
    capture_error(editor_save(_{path:D.path,text:"(p)\n",expectedRevision:D.revision},_),422),
    raw(File,"(a)\r\n").

test(path_escape_and_companion_rejected,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('ok.krf',"(ok)",_),
    forall(member(Path,["KBs/../ok.krf","KBs\\ok.krf","KBs/ok.krf.data",
                       "C:/other.krf","KBs/ok.krf:stream","KBs//ok.krf"]),
      (capture_error(editor_read(Path,_),403),
       capture_error(editor_save(_{path:Path,text:"x",expectedRevision:"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"},_),403))).

test(native_pinned_read_denies_external_write,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('pin.krf',"(ok)",File),kb_root(Root),editor_limit(Max),
    setup_call_cleanup(kb_source_editor:editor_native_begin(Root,File,Max,Lease,_,_),
      (catch(open(File,write,S),WriteError,true),
       (var(WriteError)->close(S),fail;true)),
      kb_source_editor:editor_native_end(Lease)),
    raw(File,"(ok)").

test(managed_write_failure_preserves_original,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('readonly.krf',"(old)\n",File),editor_read("KBs/readonly.krf",D),
    runtime_root(Runtime),file_directory_name(Runtime,Parent),make_directory_path(Parent),
    setup_call_cleanup(open(Runtime,write,S),write(S,obstruction),close(S)),
    catch(editor_save(_{path:D.path,text:"(new)\n",expectedRevision:D.revision},_),Error,true),
    assertion(nonvar(Error)),raw(File,"(old)\n").

test(managed_artifacts_not_under_sources,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('cache.krf',"(a)\n",_),editor_read("KBs/cache.krf",D),
    editor_save(_{path:D.path,text:"(b)\n",expectedRevision:D.revision},_),
    kb_root(KBs),directory_files(KBs,Entries),sort(Entries,['.','..','cache.krf']),
    runtime_root(Runtime),directory_file_path(Runtime,'source-editor',Managed),
    directory_files(Managed,Files),exclude(dot,Files,Locks),
    assertion(Locks=[_]),Locks=[Lock],file_name_extension(_,lock,Lock).

test(cross_process_lock_is_busy_without_source_changes,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('busy.krf',"(old)\n",File),editor_read("KBs/busy.krf",D),
    editor_save(_{path:D.path,text:D.text,expectedRevision:D.revision},_),
    runtime_root(Runtime),directory_file_path(Runtime,'source-editor',Managed),
    downcase_atom(File,Key),crypto_data_hash(Key,Hash,[algorithm(sha256)]),
    atomic_list_concat([Managed,'/',Hash,'.lock'],Lock),
    source_file(plunit_source_editor:fixture(_,_),Here),file_directory_name(Here,Tests),
    directory_file_path(Tests,'test_concurrency.pl',Script),
    current_prolog_flag(executable,Exe),
    setup_call_cleanup(
      (process_create(Exe,['-q','-s',Script,'--',hold,Lock],
        [process(Pid),stdin(pipe(In)),stdout(pipe(Out)),stderr(std)]),
       read_line_to_string(Out,"ready")),
      (capture_error(editor_save(_{path:D.path,text:"(mine)\n",expectedRevision:D.revision},_),423),
       raw(File,"(old)\n")),
      (format(In,'release~n',[]),flush_output(In),close(In),close(Out),process_wait(Pid,exit(0)))).

test(final_identity_recheck_rejects_replaced_source,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('replace.krf',"(old)\n",File),kb_root(Root),editor_limit(Max),
    runtime_root(Runtime),directory_file_path(Runtime,'source-editor',Managed),
    setup_call_cleanup(kb_source_editor:editor_native_begin(Root,File,Max,Lease,_,_),
      (atom_concat(File,'.moved',Moved),rename_file(File,Moved),
       write_source('replace.krf',"(external)\n",_),
       directory_file_path(Managed,'stage.owned',Stage),
       capture_error(kb_source_editor:editor_native_publish(Lease,Managed,Stage,"(mine)\n"),409),
       raw(File,"(external)\n"),assertion(\+exists_file(Stage))),
      kb_source_editor:editor_native_end(Lease)).

test(junctions_are_rejected_before_managed_side_effects,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    directory_file_path(R,outside,Outside),make_directory_path(Outside),
    directory_file_path(Outside,'escape.krf',External),
    setup_call_cleanup(open(External,write,S,[encoding(octet),newline(posix)]),
      format(S,'(outside)~n',[]),close(S)),
    kb_root(KBs),directory_file_path(KBs,escape,Link),
    setup_call_cleanup(
      filesystem_fixture(junction,Link,Outside),
      (capture_error(editor_read("KBs/escape/escape.krf",_),403),
       directory_file_path(Link,'escape.krf',NativePath),editor_limit(Max),
       capture_error(setup_call_cleanup(
         kb_source_editor:editor_native_begin(KBs,NativePath,Max,Lease,_,_),
         true,kb_source_editor:editor_native_end(Lease)),403),
       capture_error(editor_save(_{path:"KBs/escape/escape.krf",text:"(bad)",
         expectedRevision:"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"},_),403),
       runtime_root(Runtime),assertion(\+exists_directory(Runtime)),
       raw(External,"(outside)\n")),
      delete_directory(Link)).

filesystem_fixture(Mode,Path,Target) :-
    source_file(plunit_source_editor:fixture(_,_),Here),file_directory_name(Here,Tests),
    directory_file_path(Tests,'source_editor_fixture.ps1',Script),
    (Mode==junction->Extra=['-Target',Target];Extra=[]),
    append(['-NoProfile','-NonInteractive','-ExecutionPolicy','Bypass',
      '-File',Script,'-Mode',Mode,'-Path',Path],Extra,Arguments),
    process_create(path(powershell),Arguments,[process(Pid)]),
    process_wait(Pid,exit(0)).

test(readonly_source_write_failure_preserves_original,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('readonly.krf',"(old)\n",File),editor_read("KBs/readonly.krf",D),
    setup_call_cleanup(filesystem_fixture(readonly,File,''),
      (capture_error(editor_save(_{path:D.path,text:"(new)\n",expectedRevision:D.revision},_),403),
       raw(File,"(old)\n")),
      filesystem_fixture(writable,File,'')).

test(explicit_64_mib_bound_is_not_a_partial_read,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    write_source('huge.krf',"",File),editor_limit(Max),
    setup_call_cleanup(open(File,write,S,[type(binary)]),
      (seek(S,Max,bof,_),put_byte(S,10)),close(S)),
    capture_error(editor_read("KBs/huge.krf",_),413).

test(default_scale_complete_native_read,
     [setup(fixture(R,O)),cleanup(cleanup(R,O))]) :-
    kb_root(Root),directory_file_path(Root,'large.krf',File),
    setup_call_cleanup(open(File,write,S,[encoding(octet),newline(posix)]),
      forall(between(1,126000,_),
        format(S,'(large predicate symbol value property data more text data 123456)~n',[])),
      close(S)),
    statistics(walltime,[Start,_]),editor_read("KBs/large.krf",D),
    statistics(walltime,[End,_]),Milliseconds is End-Start,
    string_length(D.text,8442000),assertion(D.sizeBytes==8442000),
    format(user_error,'~nSource editor complete 8,442,000-byte fixture read: ~d ms~n',[Milliseconds]).
dot('.').
dot('..').
:- end_tests(source_editor).
