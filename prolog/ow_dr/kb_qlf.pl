:- module(kb_qlf, [convert_companion/3, discover_companions/2, load_prebuilt/4,
                   release_staging/1, prebuilt_status/2, runtime_prebuilt_status/2,
                   load_prebuilt_status/4]).
:- use_module(kb_cache).
:- use_module(kb_compile, []).
:- use_module(kb_load_policy).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(uuid)).
:- use_module(library(pairs)).
:- thread_local building/0, build_error/1.
:- dynamic staging_users/3.
:- dynamic loaded_builder_identity/1.
:- multifile user:message_hook/3.
user:message_hook(Term,error,_) :-
    kb_qlf:building,assertz(kb_qlf:build_error(Term)),fail.

qlf_schema(powder_dynamic_qlf_v1).

companion_path(Input,File) :-
    absolute_file_name(Input,File,[access(read)]),
    (file_name_extension(Source,pl,File),file_name_extension(_,Dialect,Source),
     memberchk(Dialect,[krf,kif,metta])->true;domain_error(compiled_kb_companion,Input)).
paths(File,QLF,Metadata,StageSource) :-
    (file_name_extension(Base,pl,File)->true;Base=File),
    file_name_extension(Base,qlf,QLF),atom_concat(QLF,'.meta.pl',Metadata),
    atom_concat(QLF,'-stage.pl',StageSource).
abi(abi(Version,Arch,Bits)) :-
    current_prolog_flag(version_data,Version),current_prolog_flag(arch,Arch),
    current_prolog_flag(address_bits,Bits).
builder_identity(Hash) :-
    loaded_builder_identity(Hash).
:- initialization(initialize_builder_hash).
initialize_builder_hash :-
    source_file(kb_qlf:qlf_schema(_),File),file_digest(File,Hash),
    retractall(loaded_builder_identity(_)),assertz(loaded_builder_identity(Hash)).

convert_companion(Input,Options,Result) :-
    require_offline(kb_qlf:convert_companion/3),
    statistics(walltime,[Start,_]),
    companion_path(Input,File),paths(File,QLF,Metadata,StageSource),
    atom_concat(QLF,'.lock',LockFile),try_lock(LockFile,Lock),
    (Lock==busy->Base=_{source:File,qlf:QLF,status:busy}
    ;setup_call_cleanup(true,once(convert_owned(File,Options,QLF,Metadata,StageSource,Base)),release_lock(Lock))),
    statistics(walltime,[End,_]),Elapsed is (End-Start)/1000,size_file(File,SourceBytes),
    (exists_file(QLF)->size_file(QLF,Bytes);Bytes=0),
    Result=Base.put(_{elapsedSeconds:Elapsed,sourceBytes:SourceBytes,outputBytes:Bytes}).

convert_owned(File,Options,QLF,Metadata,StageSource,Result) :-
    require_owned_outputs(File,QLF,Metadata,StageSource),
    prebuilt_status(File,Status),
    (Status.state==current,\+memberchk(force(true),Options)->
      Result=_{source:File,qlf:QLF,status:cache_hit,count:Status.count}
    ;(source_file_property(StageSource,module(_))->permission_error(compile,loaded_qlf_staging,StageSource);true),
     file_digest(File,SourceHash),read_input(File,Header,Records),
     uuid(Token),atomic_list_concat([powder_qlf,Token],'_',StageModule),
     stage_path(StageSource,Temporary),
     setup_call_cleanup(true,
       (write_staging(Temporary,StageModule,File,Header,Records),
        install_stage(Temporary,StageSource)),remove_if_exists(Temporary)),
     file_name_extension(Base,pl,StageSource),file_name_extension(Base,qlf,Generated),
     setup_call_cleanup(true,
       (compile_stage(StageSource),
            (validate_staging(StageModule,Records)->true;
             throw(error(qlf_staging_mismatch(File),_))),
            unchanged_input(File,SourceHash),
            file_digest(Generated,BinaryHash),file_digest(StageSource,StageHash),
            abi(ABI),builder_identity(Builder),length(Records,Count),qlf_schema(Schema),
            Meta=qlf_cache{schema:Schema,origin:File,sourceHash:SourceHash,
                 normalizedDigest:Header.normalizedDigest,count:Count,abi:ABI,
                 builder:Builder,binaryHash:BinaryHash,stageSource:StageSource,stageHash:StageHash,
                 stageModule:StageModule},
            stage_path(Metadata,MetaStage),
            setup_call_cleanup(true,
              (setup_call_cleanup(open(MetaStage,write,S,[encoding(utf8),newline(posix)]),
                 (write_one_line(S,kb_qlf_cache(Meta)),flush_output(S)),close(S)),
               install_stage(Generated,QLF),install_stage(MetaStage,Metadata)),
              remove_if_exists(MetaStage)),
            Result=_{source:File,qlf:QLF,status:generated,count:Count}),
       (remove_if_exists(Generated),unload_file(StageSource)))).

unchanged_input(File,Expected) :-
    file_digest(File,Actual),
    (Actual==Expected->true;throw(error(qlf_input_changed(File),_))).

require_owned_outputs(File,QLF,Metadata,StageSource) :-
    (exists_file(Metadata)->
      (read_metadata(Metadata,Meta),qlf_schema(Meta.schema),Meta.origin==File->true;
       permission_error(replace,unowned_qlf_metadata,Metadata))
    ;exists_file(QLF)->permission_error(replace,unowned_qlf,QLF);true),
    (exists_file(StageSource)->
      (setup_call_cleanup(open(StageSource,read,S,[encoding(utf8)]),
        (read_term(S,(:-module(Module,[])),[quasi_quotations([])]),atom_concat(powder_qlf,_,Module),
         read_term(S,(:-dynamic(qlf_owner/1)),[]),read_term(S,(:-multifile(qlf_owner/1)),[]),
         read_term(S,qlf_owner(File),[])),close(S))->true;
       permission_error(replace,unowned_qlf_staging,StageSource))
    ;true).

compile_stage(Source) :-
    require_offline(kb_qlf:compile_stage/1),
    setup_call_cleanup(asserta(building,Ref),
      ((qcompile(Source,[silent(true)])->true;throw(error(qlf_compilation_failed(Source),_))),
       findall(E,build_error(E),Errors),
       (Errors=[]->true;throw(error(qlf_compilation_errors(Source,Errors),_)))),
      (erase(Ref),retractall(build_error(_)))).

read_input(File,Header,Records) :-
    setup_call_cleanup(open(File,read,S,[encoding(utf8),newline(posix)]),
      (kb_cache:read_line_term(S,Directive,_),kb_cache:trusted_header(Directive),
       kb_cache:read_line_term(S,kb_cache_header(Header),_),
       ground(Header),Header.schema==logos_cache_v1,
       crypto_context_new(Start,[algorithm(sha256),encoding(utf8)]),
       kb_cache:read_payload(S,Terms,Start,End,Footer),
       read_line_to_string(S,end_of_file),
       crypto_context_hash(End,Digest),Digest==Header.normalizedDigest,
       terms_digest([Header],HeaderDigest),
       Footer==footer{count:Header.count,digest:Digest,headerDigest:HeaderDigest},
       kb_cache:parse_records(Terms,Records),length(Records,Header.count),
       maplist(kb_cache:validate_record,Records)),
      close(S)),!.
read_input(File,_,_) :- throw(error(invalid_compiled_qlf_input(File),_)).

write_staging(File,Module,Origin,Header,Records) :-
    findall(Name/Arity,
      (member(record(Id,Semantic,Metadata),Records),
       (guarded_clause(Id,Semantic,(Head:-_)),functor(Head,Name,Arity);
        member(Term,Metadata),functor(Term,Name,Arity))),Raw),
    sort([qlf_owner/1,qlf_origin/2,qlf_location/4|Raw],Signatures),
    setup_call_cleanup(open(File,write,S,[encoding(utf8),newline(posix)]),
      (write_one_line(S,(:-module(Module,[]))),
       write_one_line(S,(:-dynamic(qlf_owner/1))),write_one_line(S,(:-multifile(qlf_owner/1))),
       write_one_line(S,qlf_owner(Origin)),
       forall(member(Signature,Signatures),
         (write_one_line(S,(:-dynamic(Signature))),write_one_line(S,(:-multifile(Signature))))),
       write_one_line(S,qlf_origin(Origin,Header)),
       write_records(S,Records,3),flush_output(S)),close(S)).
write_records(_,[],_).
write_records(S,[record(Id,Semantic,Metadata)|Rest],Line) :-
    stream_property(S,position(Position)),stream_position_data(line_count,Position,Here),
    StageLine is Here+1,
    write_one_line(S,qlf_location(Id,Line,Metadata,StageLine)),
    guarded_clause(Id,Semantic,Clause),write_one_line(S,Clause),
    maplist(write_one_line(S),Metadata),
    length(Metadata,N),Next is Line+N+1,write_records(S,Rest,Next).

validate_staging(Module,Records) :-
    forall(member(record(Id,Semantic,_),Records),
      (guarded_clause(Id,Semantic,(Head:-_)),
       predicate_property(Module:Head,dynamic),predicate_property(Module:Head,multifile))),
    staging_records(Module,Loaded),length(Records,N),length(Loaded,N).

prebuilt_status(Input,Status) :-
    absolute_file_name(Input,File,[access(none)]),paths(File,QLF,Metadata,_),
    (exists_file(QLF),exists_file(Metadata)->
      catch((read_metadata(Metadata,Meta),valid_identity(File,QLF,Meta)->
              Status=_{state:current,qlf:QLF,metadata:Meta,count:Meta.count}
            ;Status=_{state:stale,qlf:QLF,reason:"Source, builder, staging data, or SWI ABI differs."}),
        Error,(message_to_string(Error,Message),Status=_{state:stale,qlf:QLF,reason:Message}))
    ;Status=_{state:absent,qlf:QLF}).
read_metadata(File,Meta) :-
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
      (read_term(S,kb_qlf_cache(Meta),[syntax_errors(error),quasi_quotations([])]),
       read_term(S,end_of_file,[syntax_errors(error)])),close(S)),
    ground(Meta),is_dict(Meta,qlf_cache).
valid_identity(File,QLF,Meta) :-
    qlf_schema(Meta.schema),abi(Meta.abi),builder_identity(Meta.builder),
    atom_concat(powder_qlf_,_,Meta.stageModule),
    Meta.origin==File,file_digest(File,Meta.sourceHash),
    file_digest(QLF,Meta.binaryHash),file_digest(Meta.stageSource,Meta.stageHash).

% Runtime admission checks the artifact, not the compiler or original source.
% Offline freshness remains stricter in prebuilt_status/2.
runtime_prebuilt_status(Input,Status) :-
    absolute_file_name(Input,File,[access(none)]),runtime_paths(File,QLF,Metadata),
    (exists_file(QLF),exists_file(Metadata)->
      catch((read_metadata(Metadata,Meta),valid_runtime_identity(File,QLF,Meta)->
        Status=_{state:current,qlf:QLF,metadata:Meta,count:Meta.count}
      ;Status=_{state:stale,qlf:QLF,reason:"Unsupported or invalid prebuilt QLF artifact."}),
        Error,(message_to_string(Error,Message),Status=_{state:stale,qlf:QLF,reason:Message}))
    ;Status=_{state:absent,qlf:QLF}).

runtime_paths(File,QLF,Metadata) :-
    paths(File,Canonical,CanonicalMetadata,_),
    (exists_file(Canonical);exists_file(CanonicalMetadata)),!,
    QLF=Canonical,Metadata=CanonicalMetadata.
runtime_paths(File,QLF,Metadata) :-
    atom_concat(File,'.qlf',Legacy),atom_concat(Legacy,'.meta.pl',LegacyMetadata),
    exists_file(Legacy),exists_file(LegacyMetadata),!,
    QLF=Legacy,Metadata=LegacyMetadata.
runtime_paths(File,QLF,Metadata) :- paths(File,QLF,Metadata,_).

valid_runtime_identity(File,QLF,Meta) :-
    qlf_schema(Meta.schema),abi(Meta.abi),Meta.origin==File,
    atom(Meta.stageModule),atom_concat(powder_qlf_,_,Meta.stageModule),
    integer(Meta.count),Meta.count>=0,
    kb_cache:sha256_atom(Meta.sourceHash),kb_cache:sha256_atom(Meta.normalizedDigest),
    kb_cache:sha256_atom(Meta.binaryHash),file_digest(QLF,Meta.binaryHash).

load_prebuilt(Origin,ExpectedHash,StageModule,Records) :-
    prebuilt_status(Origin,Status),Status.state==current,
    Status.metadata.sourceHash==ExpectedHash,
    load_prebuilt_status(Status,StageModule,_,Records).

load_prebuilt_status(Status,StageModule,Header,Records) :-
    with_runtime_load(load_prebuilt_status_locked(Status,StageModule,Header,Records)).

load_prebuilt_status_locked(Status,StageModule,Header,Records) :-
    StageModule=Status.metadata.stageModule,
    with_mutex(powder_qlf_staging,
      (staging_users(StageModule,Status.metadata.binaryHash,Users)->
        loaded_records(Status,StageModule,Header,Records),
        retract(staging_users(StageModule,Status.metadata.binaryHash,Users)),
        Next is Users+1,assertz(staging_users(StageModule,Status.metadata.binaryHash,Next))
      ;(staging_users(StageModule,_,_)->throw(error(conflicting_qlf_module(StageModule),_));true),
       catch(((load_files(Status.qlf,[imports([]),silent(true),if(true),register(false)]),
              file_digest(Status.qlf,Status.metadata.binaryHash),
              loaded_records(Status,StageModule,Header,Records))->true;
                throw(error(invalid_prebuilt_qlf(Status.qlf),_))),
              Error,(clear_staging(StageModule),throw(Error))),
       assertz(staging_users(StageModule,Status.metadata.binaryHash,1)))).

loaded_records(Status,StageModule,Header,Records) :-
    call(StageModule:qlf_origin(Status.metadata.origin,Header)),
    kb_cache:validate_header(Header),
    Header.normalizedDigest==Status.metadata.normalizedDigest,
    Header.count=:=Status.count,
    staging_records(StageModule,Records),length(Records,Status.count).

staging_records(Module,Records) :-
    findall(Line-native_record(Id,Semantic,Metadata,Ref),
      (current_predicate(Module:Name/Arity),functor(Head,Name,Arity),
       predicate_property(Module:Head,implementation_module(Module)),
       \+predicate_property(Module:Head,imported_from(_)),
       Name\==qlf_location,Name\==qlf_origin,Name\==qlf_owner,\+atom_concat(xc_,_,Name),
       clause(Module:Head,Qualified,Ref),unqualify(Qualified,Guard),
       kb_cache:decode_clause((Head:-Guard),Id,Semantic),
       clause_property(Ref,line_count(StageLine)),
       call(Module:qlf_location(Id,Line,Metadata,StageLine))),
      Pairs),
    keysort(Pairs,Sorted),pairs_values(Sorted,Records).
unqualify(_:Guard,Guard) :- !.
unqualify(Guard,Guard).

release_staging(Module) :-
    with_mutex(powder_qlf_staging,
      (retract(staging_users(Module,Hash,N))->(N>1->Next is N-1,assertz(staging_users(Module,Hash,Next));clear_staging(Module))
      ;clear_staging(Module))).
clear_staging(Module) :-
    forall((current_predicate(Module:Name/Arity),functor(Head,Name,Arity),
            predicate_property(Module:Head,implementation_module(Module)),
            \+predicate_property(Module:Head,built_in)),
           abolish(Module:Name/Arity)).

discover_companions(Inputs,Files) :-
    findall(File,(member(Input,Inputs),input_companion(Input,File)),Raw),sort(Raw,Files).
input_companion(Input,File) :-
    (exists_directory(Input),current_prolog_flag(windows,true)->
      kb_compile:windows_native_entries(files,Input,Entries),member(Entry,Entries),
      atom_string(Child,Entry.path),
      file_name_extension(Source,pl,Child),file_name_extension(_,D,Source),
      memberchk(D,[kif,krf,metta]),companion_path(Child,File)
    ;exists_directory(Input)->
      directory_files(Input,Names),member(Name,Names),Name\=='.',Name\=='..',
      directory_file_path(Input,Name,Child),
      (exists_directory(Child)-> \+read_link(Child,_,_),input_companion(Child,File)
      ;file_name_extension(Source,pl,Child),file_name_extension(_,D,Source),
       memberchk(D,[kif,krf,metta]),companion_path(Child,File))
    ;companion_path(Input,File)).
