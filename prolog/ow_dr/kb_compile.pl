:- module(kb_compile,
          [ compile_source/3,compile_sources/3,discover_sources/2,recover_sources/3,
            cache_identity/3,source_artifacts/2,implementation_hash/1,reader_progress/3,
            reader_diagnostic/1,warning_observer/2
          ]).

/** <module> Shared offline/runtime source compilation.

Options: force(true), state_dir(Directory), strict_mappings(true),
features(List), encoding(utf8), sumo_mappings(Boolean), diagnostics(false),
edit(true), editor(Command), progress(none|plain), recovery(normal|force).
Recovery is an explicit affected-artifact-only operation through recover_sources/3.
The default durable state directory is .logos-state beside this application.
All public result dictionaries are ground; busy is distinct from failure.
implementationHash fingerprints the converter, reader, mappings, cache, index,
ID and path modules once per invocation. A process whose implementation files
changed after loading must restart; it cannot tag old in-memory code with new
on-disk hashes. Durable occurrence ledgers are independent of this fingerprint.
*/

:- use_module(library(option)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(error)).
:- use_module(library(assoc)).
:- use_module(library(process)).
:- use_module(library(http/json)).
:- use_module(kb_cache).
:- use_module(kb_ids).
:- use_module(kb_index).
:- use_module(kb_editor).
:- use_module(kb_reader).
:- use_module(kb_paths, [repo_root/1,app_dir/1,cache_paths/3,
                        cache_source_base/2,cache_original_source/2]).

:- thread_local batch_state/1.
:- thread_local path_cache_active/0, source_name_cache/2.
:- thread_local implementation_identity_cache/1.
:- dynamic loaded_implementation_identity/1.
:- meta_predicate with_path_cache(0).

implementation_files(['kb_compile.pl','kb_reader.pl','kb_mappings.pl',
                      'kb_cache.pl','kb_index.pl','kb_ids.pl','kb_paths.pl','kb_symbols.pl']).

implementation_hash(Hash) :-
    (implementation_identity_cache(Hash)->true
    ;compute_implementation_identity(Current),
     (loaded_implementation_identity(Expected),Current==Expected
     ->Hash=Current,
       (path_cache_active->assertz(implementation_identity_cache(Hash));true)
     ;throw(error(implementation_changed_restart_required,
                  context(kb_compile,'Compiler Prolog files changed on disk; restart SWI-Prolog before compiling'))))).

compute_implementation_identity(Hash) :-
    implementation_files(Files),app_dir(App),
    maplist(implementation_file_hash(App),Files,Hashes),
    converter_version(Version),
    terms_digest([implementation(Version,Hashes)],Hash).

implementation_file_hash(App,Name,Name-Hash) :-
    directory_file_path(App,Name,File),file_digest(File,Hash).

initialize_implementation_identity :-
    compute_implementation_identity(Hash),
    retractall(loaded_implementation_identity(_)),
    assertz(loaded_implementation_identity(Hash)).

supported_source(Path) :-
    file_name_extension(_,Ext,Path),downcase_atom(Ext,Lower),
    memberchk(Lower,[kif,krf,meld,metta]).

source_absolute(Input,File) :-
    absolute_file_name(Input,Canonical,[access(none),file_errors(error)]),
    (current_prolog_flag(windows,true),
     (exists_directory(Canonical);exists_file(Canonical))
    ->preserve_source_case(Canonical,File)
    ;File=Canonical).

preserve_source_case(Canonical,File) :-
    repo_root(Repo),absolute_file_name(Repo,Root,[access(none)]),
    atom_concat(Root,'/',Prefix),
    (atom_concat(Prefix,Relative,Canonical)
    ->atomic_list_concat(Parts,'/',Relative),relative_source_case(Root,Parts,File)
    ;file_directory_name(Canonical,Dir),file_base_name(Canonical,Base),
     relative_source_case(Dir,[Base],File)).

relative_source_case(Dir,[],Dir).
relative_source_case(Dir,[Part|Parts],File) :-
    source_names(Dir,Names),downcase_atom(Part,Key),
    (get_assoc(Key,Names,Original)->true;Original=Part),
    directory_file_path(Dir,Original,Next),
    relative_source_case(Next,Parts,File).

source_names(Dir,Names) :-
    absolute_file_name(Dir,Key,[access(none)]),
    (source_name_cache(Key,Names)->true
    ;directory_files(Dir,Entries),remember_source_names(Key,Entries,Names)).

remember_source_names(Dir,Entries,Names) :-
    empty_assoc(A0),foldl(source_name_entry,Entries,A0,Names),
    (path_cache_active,\+source_name_cache(Dir,_)
    ->assertz(source_name_cache(Dir,Names));true).

source_name_entry(Name,A0,A) :-
    (Name\=='.',Name\=='..'
    ->downcase_atom(Name,Key),put_assoc(Key,A0,Name,A)
    ;A=A0).

with_path_cache(Goal) :-
    (path_cache_active->call(Goal)
    ;setup_call_cleanup(asserta(path_cache_active),Goal,
       (retractall(path_cache_active),retractall(source_name_cache(_,_)),
        retractall(implementation_identity_cache(_))))).

discover_sources(Paths,Files) :-
    with_path_cache(discover_sources_cached(Paths,Files)).

discover_sources_cached(Paths,Files) :-
    must_be(list,Paths),
    maplist(source_absolute,Paths,Abs),
    partition(exists_directory,Abs,Directories,ExplicitFiles),
    (current_prolog_flag(windows,true)
    ->windows_discover_sources(Directories,Discovered)
    ;empty_assoc(Seen),discover_queue(Directories,Seen,_,Discovered,[])),
    append(ExplicitFiles,Discovered,All),
    sort(All,Files).

windows_discover_sources(Paths,Files) :-
    windows_selection(Paths,Roots,SelectedFiles),
    maplist(windows_directory_sources,Roots,Groups),
    append(Groups,Discovered),
    forall(member(Path,SelectedFiles),
           (supported_source(Path)->true;existence_error(source_sink,Path))),
    append(SelectedFiles,Discovered,Files).

windows_selection(Paths,Roots,SelectedFiles) :-
    partition(exists_directory,Paths,Directories,SelectedFiles),
    predsort(compare_windows_paths,Directories,Sorted),
    minimal_directories(Sorted,none,Roots).

compare_windows_paths(Order,A,B) :-
    downcase_atom(A,LowerA),downcase_atom(B,LowerB),compare(Order,LowerA,LowerB).

minimal_directories([],_,[]).
minimal_directories([Dir|Dirs],Previous,Roots) :-
    (Previous\==none,directory_contains(Previous,Dir)
    ->minimal_directories(Dirs,Previous,Roots)
    ;Roots=[Dir|Rest],minimal_directories(Dirs,Dir,Rest)).

directory_contains(Parent,Child) :-
    (sub_atom(Parent,_,1,0,'/')->Prefix=Parent;atom_concat(Parent,'/',Prefix)),
    path_prefix(Prefix,Child).

windows_directory_sources(Root,Files) :-
    windows_native_entries(catalog,Root,Entries),
    maplist(native_source_path,Entries,Files).

native_source_path(Entry,File) :-
    native_entry_path(Entry,Path),
    source_absolute(Path,File),
    (supported_source(File)->true;domain_error(native_catalog_source,File)).

native_entry_path(Entry,Path) :-
    must_be(dict,Entry),get_dict(path,Entry,Raw),
    (atom(Raw)->Path=Raw;string(Raw)->atom_string(Path,Raw);type_error(text,Raw)).

windows_native_entries(Mode,Root,Entries) :-
    app_dir(App),directory_file_path(App,'windows_catalog.ps1',Script),
    setup_call_cleanup(
       process_create(path(powershell),
         ['-NoProfile','-NonInteractive','-ExecutionPolicy','Bypass','-File',Script,
          '-Root',Root,'-Mode',Mode],
         [stdin(null),stdout(pipe(Out,[encoding(utf8)])),
          stderr(std),window(false),process(Pid)]),
       call_cleanup(read_string(Out,_,Text),close(Out)),
       process_wait(Pid,Exit)),
    (Exit==exit(0)
    ->atom_json_dict(Text,Entries,[]),must_be(list,Entries)
    ;throw(error(native_source_discovery_failed(Root,Exit),_))).

discover_queue([],Seen,Seen,Tail,Tail).
discover_queue([Path|Paths],S0,S,Files,Tail) :-
    (get_assoc(Path,S0,_)
    ->discover_queue(Paths,S0,S,Files,Tail)
    ;put_assoc(Path,S0,true,S1),
     (exists_directory(Path)
     -> directory_files(Path,Names),
        absolute_file_name(Path,DirectoryKey,[access(none)]),
        remember_source_names(DirectoryKey,Names,_),
        findall(Child,(member(Name,Names),Name\=='.',Name\=='..',
                       directory_file_path(Path,Name,Child),
                       \+catch(read_link(Child,_,_),_,fail)),Children),
        discover_queue(Children,S1,S2,Files,Rest),
        discover_queue(Paths,S2,S,Rest,Tail)
     ;exists_file(Path)
     -> (supported_source(Path)->Files=[Path|Rest];Files=Rest),
        discover_queue(Paths,S1,S,Rest,Tail)
     ;supported_source(Path)
     ->Files=[Path|Rest],discover_queue(Paths,S1,S,Rest,Tail)
     ;throw(error(existence_error(source_sink,Path),_))
     )).

compile_source(Input,Options,Result) :-
    WarningState=compiler_warnings([]),
    with_path_cache(compile_source_cached(Input,
         [compiler_warning_state(WarningState)|Options],Result)).

compile_source_cached(Input,Options,Result) :-
    must_be(list,Options),
    implementation_hash(_),
    source_absolute(Input,File),
    (exists_directory(File)->type_error(file,File);true),
    monotonic_seconds(Start),
    cache_paths(File,Normal,Index),
    file_directory_name(Normal,CacheDirectory),make_directory_path(CacheDirectory),
    atom_concat(Normal,'.lock',LockPath),
    ( mutex_trylock(LockPath)
    -> setup_call_cleanup(true,
         (try_lock(LockPath,Lock),
          (Lock==busy -> busy_result(File,Normal,Index,Start,Options,Result)
          ; setup_call_cleanup(true,
                compile_owned(File,Normal,Index,Options,Start,Result),
                release_lock(Lock)))),
         mutex_unlock(LockPath))
    ; busy_result(File,Normal,Index,Start,Options,Result)
    ),!.

busy_result(File,Normal,Index,Start,Options,Result) :-
    diagnostic(Options,'BUSY: skipping file ~w~n',[File]),
    monotonic_seconds(End),Elapsed is max(0,End-Start),
    (exists_file(File)->size_file(File,Size);Size=0),
    Result=result{status:busy,source:File,normalized:Normal,index:Index,
                  count:0,warnings:[],lineCount:0,sizeBytes:Size,elapsed:Elapsed}.

compile_owned(File,Normal,Index,Options,Start,Result) :-
    atom_concat(Normal,'.tmp',Marker),
    source_artifacts(File,Abandoned),
    write_claim(Marker,File),
    setup_call_cleanup(true,
       owned_repair(File,Normal,Index,Options,Start,Abandoned,Result),
       remove_if_exists(Marker)).

write_claim(Marker,File) :-
    get_time(Time),current_prolog_flag(pid,Pid),
    setup_call_cleanup(open(Marker,write,S,[encoding(utf8),newline(posix)]),
       (write_one_line(S,kb_compile_claim(1,File,Pid,Time)),flush_output(S)),close(S)).

owned_repair(File,Normal,Index,Options,Start,Abandoned,Result) :-
    catch((once(owned_compile(File,Normal,Index,Options,Start,Abandoned,Result))
           -> true ; throw(error(compilation_failed(File),_))),
          Error,
          repair_or_throw(File,Normal,Index,Options,Start,Abandoned,Error,Result)).

repair_or_throw(File,Normal,Index,Options,Start,Abandoned,Error,Result) :-
    print_diagnostic(File,Error),
    (option(edit(true),Options),\+prompts_suppressed,
     \+ Error=error(resource_error(_),_)
    -> repair_action(File,Error,Options,Action,Paused),
       add_pause(Paused),
       (Action==retry
       -> owned_repair(File,Normal,Index,Options,Start,Abandoned,Result)
       ;Action==suppress
       ->suppress_prompts,throw_reported(File,Error,Options)
       ;Action==abort
       ->captured_warnings(Options,Warnings),throw(error(compilation_aborted(File,Warnings),_))
       ;throw_reported(File,Error,Options))
    ;throw_reported(File,Error,Options)
    ).

throw_reported(File,Error,Options) :-
    captured_warnings(Options,Warnings),
    throw(error(reported_source_error(File,Error,Warnings),_)).

captured_warnings(Options,Warnings) :-
    option(compiler_warning_state(State),Options),
    arg(1,State,Reversed),reverse(Reversed,Warnings).

owned_compile(File,Normal,Index,Options,Start,Abandoned,Result) :-
    memory_checkpoint(start,File,Options),
    option(compiler_warning_state(WarningState),Options),
    nb_setarg(1,WarningState,[]),set_current_warnings([]),
    (exists_file(File)->true;existence_error(source_sink,File)),
    progress_phase(normalization,File,0.02),
    cache_identity(File,Options,Identity),
    ( \+option(force(true),Options),
      current_cache(Normal,Identity,Header,Records)
    -> ensure_index(Index,Header,Records),
       report_cached_warnings(Header.warnings,Options),
       Status=cache_hit
    ; option(recovery(normal),Options),
      \+option(force(true),Options),
      usable_stage(Abandoned,Normal,Identity,Stage,Header,Records)
    -> ensure_index(Index,Header,Records),install_stage(Stage,Normal),
       report_cached_warnings(Header.warnings,Options),
       Status=generated
    ; kb_reader:read_source(File,
          [progress_callback(kb_compile:reader_progress(File)),
           diagnostic_handler(kb_compile:reader_diagnostic),
           warning_observer(kb_compile:warning_observer(WarningState))|Options],
          Assertions,Info),
      memory_checkpoint(parsed,File,Options),
      set_current_warnings(Info.warnings),
      source_unchanged(File,Identity.sourceHash),
      assign_ids(File,Assertions,Options,Ids),
      memory_checkpoint(ids,File,Options),
      maplist(assertion_record(File,Options),Assertions,Ids,Records),
      memory_checkpoint(records,File,Options),
      captured_warnings(Options,AllWarnings),
      reader_header(Identity,Info.put(warnings,AllWarnings),Header0),
      progress_phase(indexing,File,0.7),
      generate_pair(Normal,Index,Header0,Records,Header),
      Status=generated
    ),
    forall(member(Artifact,Abandoned),
           (Artifact==Normal->true;remove_if_exists(Artifact))),
    monotonic_seconds(End),Elapsed is max(0,End-Start),
    Result=result{status:Status,source:File,normalized:Normal,index:Index,
        count:Header.count,warnings:Header.warnings,lineCount:Header.lineCount,
        sizeBytes:Header.sizeBytes,elapsed:Elapsed},
    memory_checkpoint(finished,File,Options),
    progress_phase(aggregate,File,1).

memory_checkpoint(Phase,File,Options) :-
    (option(memory_progress(true),Options)->
      statistics(globalused,Global),statistics(localused,Local),statistics(trailused,Trail),
      format(user_error,'MEM ~w global=~d local=~d trail=~d ~w~n',[Phase,Global,Local,Trail,File]),
      flush_output(user_error)
    ;true).

source_unchanged(File,Expected) :-
    file_digest(File,Now),
    (Now==Expected->true;throw(error(source_changed_during_compilation(File),_))).

cache_identity(Input,Options,Identity) :-
    source_absolute(Input,File),
    file_digest(File,Hash),size_file(File,Size),
    source_dialect(File,Dialect),
    option(features(Features0),Options,[]),sort(Features0,Features),
    option(strict_mappings(Strict),Options,false),
    option(sumo_mappings(Sumo),Options,auto),
    option(semantic_shape_checks(ShapeChecks),Options,false),must_be(boolean,ShapeChecks),
    (Dialect==metta->Encoding=utf8;option(encoding(Encoding),Options,iso_latin_1)),
    mapping_identity(Dialect,MappingHash),
    converter_version(Converter),
    implementation_hash(ImplementationHash),
    cache_paths(File,NormalizedFile,_),
    Identity=cache{source:File,sourceHash:Hash,sizeBytes:Size,dialect:Dialect,
          normalizedFile:NormalizedFile,
         mappingHash:MappingHash,converter:Converter,mtPolicy:filename_v1,
         implementationHash:ImplementationHash,
         options:[encoding(Encoding),features(Features),strict_mappings(Strict),
                  sumo_mappings(Sumo),semantic_shape_checks(ShapeChecks)]}.

mapping_identity(kif,Hash) :- !,
    (current_predicate(kb_mappings:mapping_identity/1)
    ->kb_mappings:mapping_identity(Hash)
    ; source_file(kb_compile:compile_source(_,_,_),Here),
      file_directory_name(Here,Dir),
      directory_file_path(Dir,'docs',Docs),
      directory_file_path(Docs,'sumo-cycl-mapping.md',Table),
      file_digest(Table,Hash)).
mapping_identity(_,none).

reader_header(Identity,Info,Header) :-
    (Info.mappingHash==Identity.mappingHash
    ->true
    ;throw(error(mapping_identity_changed(Identity.mappingHash,Info.mappingHash),_))),
    Base=Identity.put(_{warnings:Info.warnings,lineCount:Info.lineCount}),
    (get_dict(comments,Info,Comments)
    ->must_be(list,Comments),must_be(ground,Comments),Header=Base.put(sourceComments,Comments)
    ;Header=Base).

current_cache(Path,Identity,Header,Records) :-
    exists_file(Path),catch(read_cache(Path,Header,Records),_,fail),
    identity_matches(Identity,Header).

identity_matches(Identity,Header) :-
    dict_pairs(Identity,_,Pairs),
    forall(member(K-V,Pairs),identity_field_matches(K,V,Header)).

identity_field_matches(normalizedFile,Expected,Header) :- !,
    (get_dict(normalizedFile,Header,Stored)->true
    ;atom(Header.source),cache_paths(Header.source,Stored,_)),
    same_absolute_path(Stored,Expected).
identity_field_matches(source,Expected,Header) :- !,
    get_dict(source,Header,Stored),same_absolute_path(Stored,Expected).
identity_field_matches(Key,Expected,Header) :-
    get_dict(Key,Header,Stored),Stored==Expected.

same_absolute_path(A,B) :-
    atom(A),atom(B),is_absolute_file_name(A),is_absolute_file_name(B),
    absolute_file_name(A,CanonicalA,[access(none)]),
    absolute_file_name(B,CanonicalB,[access(none)]),
    CanonicalA==CanonicalB.

usable_stage(Artifacts,Normal,Identity,Stage,Header,Records) :-
    atom_concat(Normal,'.stage.',Prefix),
    member(Stage,Artifacts),path_prefix(Prefix,Stage),
    current_cache(Stage,Identity,Header,Records),!.

assertion_record(File,assertion(Semantic,Names,Mt,Line,Props,_),Id,
                 Record) :-
    assertion_record(File,[],assertion(Semantic,Names,Mt,Line,Props,unused),Id,Record).

assertion_record(File,_Options,assertion(Semantic,Names,Mt,Line,Props,_),Id,
                 record(Id,Semantic,Metadata)) :-
    Base=[xc_microtheory(Id,Mt),xc_source_file(Id,File),
          xc_source_line(Id,Line),xc_kb_names(Id,Names)],
    maplist(property_terms(Id),Props,Lists),append(Lists,Extra),
    append(Base,Extra,Metadata).

property_terms(Id,Property-Value,Terms) :-
    property_name(Property,Name),
    (memberchk(Name,[xc_creator,xc_creation_date]),lisp_nil(Value)
    -> Terms=[]
    ;memberchk(Name,[xc_microtheory,xc_source_file,xc_source_line,xc_kb_names])
    ->throw(error(duplicate_assertion_property(Property),_))
    ;T=..[Name,Id,Value],
     (valid_metadata(Id,T)->Terms=[T];throw(error(invalid_assertion_property(T),_)))).

lisp_nil(nil). lisp_nil('NIL'). lisp_nil(x_nil). lisp_nil('x_NIL').

property_name(Property,Name) :-
    atom(Property),
    (atom_concat('cyc:',_,Property)->atom_concat(xc_,Property,Name)
    ;atom_concat(xc_,_,Property)->Name=Property
    ;downcase_atom(Property,Lower0),
     (atom_concat(':',Lower,Lower0)->true;Lower=Lower0),
     atomic_list_concat(Parts,'-',Lower),atomic_list_concat(Parts,'_',Canonical),
     atom_concat(xc_,Canonical,Name)).

generate_pair(Normal,Index,Header0,Records,Header) :-
    stage_path(Normal,Stage),stage_path(Index,IndexStage),
    setup_call_cleanup(true,
        ( write_cache(Stage,Header0,Records,Header),
          read_cache(Stage,Header,Checked),
          write_index(IndexStage,Header,Checked,_),
          read_index(IndexStage,_,_),
          install_pair(Stage,Normal,IndexStage,Index)
        ),
        (remove_if_exists(Stage),remove_if_exists(IndexStage))).

install_pair(Stage,Normal,IndexStage,Index) :-
    % Index goes first; a crash between renames leaves a complete old normalized
    % file with a mismatching index, which is rebuilt before reuse.
    install_stage(IndexStage,Index),
    install_stage(Stage,Normal).

ensure_index(Index,Header,Records) :-
    (exists_file(Index),catch(read_index(Index,IH,_),_,fail),
     IH.sourceHash==Header.sourceHash,IH.normalizedDigest==Header.normalizedDigest
    ->true
    ;stage_path(Index,Stage),
     setup_call_cleanup(true,
        (write_index(Stage,Header,Records,_),read_index(Stage,_,_),
         install_stage(Stage,Index)),remove_if_exists(Stage))).

report_cached_warnings(Warnings,Options) :-
    empty_assoc(A0),foldl(cached_warning(Options),Warnings,A0,_).

cached_warning(Options,Warning,A,A) :-
    option(semantic_shape_checks(ShapeChecks),Options,false),ShapeChecks\==true,
    historical_semantic_shape_warning(Warning),!.
cached_warning(Options,warning(File,Line,Column,Message),A0,A) :-
    Key=File-Message,(get_assoc(Key,A0,N0)->N is N0+1;N=1),
    put_assoc(Key,A0,N,A),
    (N=<10
    ->diagnostic(Options,'WARNING: ~w:~d:~d: ~w~n',[File,Line,Column,Message])
    ;N=:=11
    ->diagnostic(Options,'WARNING: further identical warnings suppressed for ~w (all retained in cache).~n',[File])
    ;true).

diagnostic(Options,Format,Args) :-
    (option(diagnostics(false),Options)->true
    ;clear_progress,format(user_error,Format,Args),flush_output(user_error)).

compile_sources(Paths,Options,Summary) :-
    with_path_cache(
       (implementation_hash(_),discover_sources(Paths,Files),
        batch_files(Files,Options,Summary))).

batch_files(Files,Options,Summary) :-
    with_path_cache(batch_files_cached(Files,Options,Summary)).

batch_files_cached(Files,Options,Summary) :-
    (batch_state(_)->throw(error(permission_error(nest,compiler_batch,Files),_));true),
    maplist(source_size,Files,Sizes),sum_list(Sizes,TotalSize),length(Files,Total),
    monotonic_seconds(Start),
    State=state{start:Start,paused:0,total:Total,totalSize:TotalSize,
           done:0,bytes:0,generated:0,cacheHits:0,busy:0,failures:0,warnings:0,
           currentWarnings:0,suppress:false,options:Options,lastProgress: -1,lastSpec:none},
    setup_call_cleanup(asserta(batch_state(State)),
       (batch_loop(Files,Options,Results),
        batch_state(Final),summary(Final,Results,Summary),clear_progress),
       retractall(batch_state(_))).

source_size(File,Size) :- (exists_file(File)->size_file(File,Size);Size=0).

batch_loop([],_,[]).
batch_loop([File|Files],Options,[Result|Results]) :-
    catch(compile_source(File,Options,Result),Error,
          failure_result(File,Options,Error,Result)),
    update_counters(Result),
    progress_phase(complete,File,0),
    (get_dict(aborted,Result,true)
    ->maplist(deferred_result,Files,Results)
    ;batch_loop(Files,Options,Results)).

failure_result(File,Options,Error,Result) :-
    (Error=error(reported_source_error(_,Cause,Warnings),_)->true
    ;Error=error(reported_source_error(_,Cause),_)->Warnings=[]
    ;Error=error(compilation_aborted(_,Warnings),_)->Cause=Error
    ;Warnings=[],Cause=Error,
     diagnostic(Options,'ERROR: ~w: ~q~n',[File,Error])),
    term_string(Cause,Message),
    failure_details(Cause,Detail,ErrorEvents),
    maplist(warning_event,Warnings,WarningEvents),
    append(ErrorEvents,WarningEvents,Events),
    kb_mappings:diagnostic_metadata(Events,Properties,Rows),
    (Error=error(compilation_aborted(_,_),_)->Aborted=true;Aborted=false),
    source_size(File,Size),
    cache_paths(File,Normal,Index),
    Result=result{status:failed,source:File,normalized:Normal,index:Index,
         count:0,warnings:Warnings,lineCount:0,sizeBytes:Size,elapsed:0,error:Message,
         errorDetail:Detail,properties:Properties,mapping_rows:Rows,aborted:Aborted},
    persist_failure(File,Options,Result).

failure_details(error(source_error(_,Line,Column,Message),_),
                _{kind:source,line:Line,column:Column,message:Message},
                [diagnostic(errors,Message)]) :- !.
failure_details(error(resource_error(Resource),_),
                _{kind:resource_limit,line:null,column:null,message:Message},[]) :- !,
    format(string(Message),'Compiler/runtime resource limit reached (~w); this is not a source syntax error.',[Resource]).
failure_details(Error,_{kind:Kind,line:null,column:null,message:Message},[]) :-
    Kind=compiler,
    message_to_string(Error,Message).
warning_event(warning(_,_,_,Message),diagnostic(warnings,Message)).

persist_failure(File,Options,Result) :-
    state_directory(Options,State),directory_file_path(State,failures,Directory),
    make_directory_path(Directory),terms_digest([File],Key),
    atom_concat(Key,'.data',Name),directory_file_path(Directory,Name,Final),
    atom_concat(Final,'.lock',LockPath),try_lock(LockPath,Lock),
    (Lock==busy->diagnostic(Options,'Failure report busy: ~w~n',[Final])
    ;setup_call_cleanup(true,
       (stage_path(Final,Stage),terms_digest([Result],Digest),
        setup_call_cleanup(true,
          (setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
             (write_one_line(S,kb_source_failure(1,Result,Digest)),flush_output(S)),close(S)),
           install_stage(Stage,Final)),remove_if_exists(Stage))),
       release_lock(Lock))).

deferred_result(File,Result) :-
    source_size(File,Size),
    cache_paths(File,Normal,Index),
    Result=result{status:failed,source:File,normalized:Normal,index:Index,
        count:0,warnings:[],lineCount:0,sizeBytes:Size,elapsed:0,
        error:"Batch aborted before this source",aborted:false}.

update_counters(R) :-
    retract(batch_state(S)),
    D is S.done+1,B is S.bytes+R.sizeBytes,length(R.warnings,WN),W is S.warnings+WN,
    (R.status==generated->G is S.generated+1;G=S.generated),
    (R.status==cache_hit->H is S.cacheHits+1;H=S.cacheHits),
    (R.status==busy->Busy is S.busy+1;Busy=S.busy),
    (memberchk(R.status,[failed,aborted])->F is S.failures+1;F=S.failures),
    assertz(batch_state(S.put(_{done:D,bytes:B,generated:G,cacheHits:H,busy:Busy,
                               failures:F,warnings:W,currentWarnings:0}))).

summary(S,Results,Summary) :-
    findall(R,(member(R,Results),memberchk(R.status,[failed,aborted])),Failed),
    length(Failed,Failures),
    (Failures>0->Code=1;S.busy>0->Code=3;Code=0),
    Summary=summary{generated:S.generated,cacheHits:S.cacheHits,busy:S.busy,
                    failures:Failures,warnings:S.warnings,results:Results,exitCode:Code}.

prompts_suppressed :- batch_state(S),S.suppress==true.
suppress_prompts :-
    (retract(batch_state(S))->assertz(batch_state(S.put(suppress,true)));true).
add_pause(Seconds) :-
    (retract(batch_state(S))->P is S.paused+Seconds,assertz(batch_state(S.put(paused,P)));true).

progress_phase(Phase,File,Fraction) :-
    (batch_state(S),\+option(progress(none),S.options),
     monotonic_seconds(Now),
     (Fraction=:=0;Fraction=:=1;Now-S.lastProgress>=0.2)
    -> source_size(File,Size),
       Processed is min(S.totalSize,S.bytes+Fraction*Size),
       (S.totalSize>0->Percent is 100*Processed/S.totalSize;Percent=100),
       Elapsed is max(0,Now-S.start-S.paused),
       WarningCount is S.warnings+S.currentWarnings,
       (Processed>0,Elapsed>0.05
       ->Eta is max(0,Elapsed*(S.totalSize-Processed)/Processed),format(atom(ETA),'~1fs',[Eta])
       ;ETA='?'),
       format(string(Text),
        '~w ~1f% ~d/~d files ~0f/~d bytes ~1fs ETA ~w gen=~d hit=~d warn=~d err=~d busy=~d ~w',
        [Phase,Percent,S.done,S.total,Processed,S.totalSize,Elapsed,ETA,
         S.generated,S.cacheHits,WarningCount,S.failures,S.busy,File]),
       emit_progress(Text,S.options),
       retract(batch_state(S)),
       assertz(batch_state(S.put(_{lastProgress:Now,lastSpec:progress(Phase,File,Fraction)})))
    ; true).

reader_progress(File,Processed,Total) :-
    (number(Processed),number(Total),Total>0
    ->Fraction is min(0.65,max(0.02,0.65*Processed/Total)),
      progress_phase(normalization,File,Fraction)
    ;true).

warning_observer(State,Warning) :-
    must_be(ground,Warning),
    arg(1,State,Warnings),nb_linkarg(1,State,[Warning|Warnings]),
    (retract(batch_state(S))
    ->Count is S.currentWarnings+1,assertz(batch_state(S.put(currentWarnings,Count)))
    ;true).

set_current_warnings(Warnings) :-
    (retract(batch_state(S))
    ->length(Warnings,Count),assertz(batch_state(S.put(currentWarnings,Count)))
    ;true).

reader_diagnostic(warning(File,Line,Column,Message)) :-
    clear_progress,
    format(user_error,'WARNING: ~w:~d:~d: ~w~n',[File,Line,Column,Message]),
    flush_output(user_error),
    (batch_state(S),stream_property(user_error,tty(true)),
     \+option(progress(none),S.options),\+option(progress(plain),S.options),
     S.lastSpec=progress(Phase,Current,Fraction)
    ->retract(batch_state(S)),assertz(batch_state(S.put(lastProgress,-1))),
      progress_phase(Phase,Current,Fraction)
    ;true).

emit_progress(Text,Options) :-
    (stream_property(user_error,tty(true)),\+option(progress(plain),Options)
    -> terminal_width(Width),
       string_length(Text,N),Take is min(N,Width),sub_string(Text,0,Take,_,Bounded),
       format(user_error,'\r~*c\r~s',[Width,32,Bounded])
    ;format(user_error,'~s~n',[Text])),
    flush_output(user_error).

clear_progress :-
    (batch_state(S),\+option(progress(none),S.options),
     stream_property(user_error,tty(true)),\+option(progress(plain),S.options)
    ->terminal_width(Width),format(user_error,'\r~*c\r',[Width,32]),flush_output(user_error)
    ;true).

terminal_width(Width) :-
    (catch(tty_size(_,Cols),_,fail),integer(Cols),Cols>1
    ->Width is min(150,Cols-1)
    ;Width=119).

source_artifacts(Source,Artifacts) :-
    cache_source_base(Source,CacheBase),
    file_directory_name(CacheBase,Dir),file_base_name(CacheBase,Base),
    (exists_directory(Dir)
    ->directory_files(Dir,Names),
      findall(Path,(member(Name,Names),artifact_source_name(Name,Candidate),
                    source_name_equal(Candidate,Base),
                    directory_file_path(Dir,Name,Path)),Artifacts)
    ;Artifacts=[]).

source_name_equal(A,B) :-
    (current_prolog_flag(windows,true)->downcase_atom(A,K),downcase_atom(B,K);A==B).
path_prefix(Prefix,Path) :-
    (current_prolog_flag(windows,true)
    ->downcase_atom(Prefix,P),downcase_atom(Path,F),atom_concat(P,_,F)
    ;atom_concat(Prefix,_,Path)).

artifact_source(Name,Source) :-
    artifact_source_name(Name,Source),supported_source(Source).
artifact_source_name(Name,Source) :-
    atom_concat(Source,'.data.tmp',Name),!.
artifact_source_name(Name,Source) :-
    member(Suffix,['.data.stage.','.index.data.stage.']),atom_length(Suffix,Length),
    sub_atom(Name,Before,Length,_,Suffix),sub_atom(Name,0,Before,_,Source),
    atom_concat(Source,Suffix,Prefix),
    atom_concat(Prefix,Token,Name),uuid_token(Token).

uuid_token(Token) :-
    atom_length(Token,36),atom_codes(Token,Codes),
    forall(member(C,Codes),(C==0'-;between(0'0,0'9,C);between(0'a,0'f,C))).

recover_sources(Paths,Options,Summary) :-
    with_path_cache(
       (implementation_hash(_),recover_sources_cached(Paths,Options,Summary))).

recover_sources_cached(Paths,Options,Summary) :-
    maplist(source_absolute,Paths,Abs),
    maplist(cache_source_base,Abs,CachePaths),
    (current_prolog_flag(windows,true)
    ->windows_recovery_sources(CachePaths,Raw)
    ;findall(Source,(member(Path,CachePaths),recovery_candidate(Path,Source)),Raw)),
    maplist(source_absolute,Raw,Normalized),sort(Normalized,Files),
    (option(recovery(force),Options)->Recovery=[force(true),recovery(force)|Options]
    ;Recovery=[recovery(normal)|Options]),
    batch_files(Files,Recovery,Summary).

windows_recovery_sources(Paths,Sources) :-
    windows_selection(Paths,Roots,SelectedFiles),
    maplist(windows_recovery_directory,Roots,Groups),
    append(Groups,Discovered),
    findall(File,(member(Base,SelectedFiles),cache_original_source(Base,File),
                  source_artifacts(File,Artifacts),Artifacts\=[]),Direct),
    append(Discovered,Direct,Sources).

windows_recovery_directory(Root,Sources) :-
    % Recovery needs file names even when no original source remains. Reuse the
    % shared native walk; never fall back to unsafe SWI junction recursion.
    windows_native_entries(files,Root,Entries),
    findall(Source,
       (member(Entry,Entries),native_entry_path(Entry,Path),
        file_base_name(Path,Name),artifact_source(Name,Base),
        file_directory_name(Path,Dir),directory_file_path(Dir,Base,CacheBase),
        cache_original_source(CacheBase,Source)),
       Sources).

recovery_candidate(Path,Source) :-
    exists_directory(Path),!,
    directory_files(Path,Names),member(Name,Names),Name\=='.',Name\=='..',
    directory_file_path(Path,Name,Child),
    (exists_directory(Child)
    -> \+catch(read_link(Child,_,_),_,fail),recovery_candidate(Child,Source)
    ;artifact_source(Name,Base),directory_file_path(Path,Base,CacheBase),
     cache_original_source(CacheBase,Source)).
recovery_candidate(Path,Source) :-
    cache_original_source(Path,Source),source_artifacts(Source,Artifacts),Artifacts\=[].

:- initialization(initialize_implementation_identity).
