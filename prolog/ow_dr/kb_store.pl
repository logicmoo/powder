:- module(kb_store, [load_sources/3, unload_source/3, status/1, active_modules/1,
                    assertion/2, assertions/1, terms/1, predicates/1,
                    generation/1, source_info/2, query_text/5,
                    term_assertions/2, mt_assertions/2, term_exists/1, microtheories/1,
                    load_sources_worker/3, unload_source_worker/2, with_generation/1, lookup_assertion/2]).
:- use_module(kb_paths).
:- use_module(kb_runtime, []).
:- use_module(kb_compile, []).
:- use_module(kb_cache, []).
:- use_module(kb_index, []).
:- use_module(kb_reader, []).
:- use_module(kb_terms).
:- use_module(kb_activity).
:- use_module(kb_forms, []).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(lists)).
:- use_module(library(error)).
:- use_module(library(pairs)).
:- use_module(library(crypto)).
:- dynamic generation/1, source_info/2, source_module/3, assertion/2.
:- dynamic term_rank/1, predicate_rank/1.
:- dynamic generation_timing/1.
:- dynamic microtheory_catalog/1.
:- dynamic term_count/2, constant_locator/2, mt_locator/2, ordered_assertions/1, current_counts/1.
:- dynamic native_readers/2, retired_native/1.
:- meta_predicate with_generation(2).
initialize_store :-
    forall(member(Fact,[generation(0),term_rank([]),predicate_rank([]),
      microtheory_catalog([]),generation_timing(_{loadSeconds:0}),ordered_assertions([]),
      current_counts(_{assertions:0,terms:0,predicates:0,microtheories:0})]),
      (functor(Fact,Name,Arity),functor(Existing,Name,Arity),
       (call(Existing)->true;assertz(Fact)))).
:- initialization(initialize_store).
:- at_halt(cleanup_owned_runtime).

cleanup_owned_runtime :-
    forall(source_module(_,_,Native),
      catch(cleanup_native(Native),Error,print_message(error,Error))).

load_sources(Paths, Expected, Status) :-
    (current_predicate(kb_jobs:pools_started/0),kb_jobs:pools_started,\+kb_jobs:in_loader->
      kb_jobs:submit_load(Paths,Expected,Job),kb_jobs:await_result(Job.jobId,Status)
    ;with_application(load_sources_locked(Paths,Expected,[],Status))).

load_sources_worker(Paths,Id,Status) :-
    prepare_sources(Paths,[progress_observer(kb_jobs:loader_progress(Id))],Prepared,Start),
    kb_jobs:wait_loader_turn(Id),kb_jobs:mark_publishing(Id),
    install_generation(Prepared,any,Start,Status).

load_sources_locked(Paths, Expected, Options, Status) :-
    prepare_sources(Paths,Options,Prepared,Start),
    install_generation(Prepared,Expected,Start,Status).

prepare_sources(Paths,Options,Prepared,Start) :-
    statistics(walltime,[Start,_]),
    must_be(list, Paths),
    maplist(kb_paths:resolve_source, Paths, Absolute),
    kb_compile:compile_sources(Absolute, [progress(none),preserve_order(true)|Options], Summary),
    ( Summary.failures =:= 0, Summary.busy =:= 0 -> true
    ; throw(error(compile_incomplete(Summary), _))
    ),
    maplist(prepare_source, Summary.results, Prepared).

prepare_source(Info, prepared(Source, WithHash, Records)) :-
    absolute_file_name(Info.source,Source,[access(read)]),
    kb_cache:read_cache(Info.normalized, _, Records),
    crypto_file_hash(Info.normalized,Hash,[algorithm(sha256)]),
    WithHash=Info.put(outputHash,Hash).

install_generation(Prepared, Expected, Start, Status) :-
    with_mutex(openworld_store,
      (generation(Current),
       ((Expected==any;Expected=:=Current)->true;throw(error(generation_conflict(Expected,Current),_))))),
    stage_sources(Prepared, Staged),
    catch(with_mutex(openworld_store,
      (generation(Now),
       (Now=:=Current->true;throw(error(generation_conflict(Current,Now),_))),
       (commit_generation(Staged,Current)->true;throw(error(generation_install_failed,_))),
       statistics(walltime,[End,_]),Elapsed is (End-Start)/1000,
       retractall(generation_timing(_)),assertz(generation_timing(_{loadSeconds:Elapsed})),
       status(Status))), Error,
          (cleanup_staged(Staged), throw(Error))),
    !.

stage_sources(Prepared, Staged) :-
    stage_sources(Prepared, [], Staged).
stage_sources([], Acc, Staged) :- reverse(Acc, Staged).
stage_sources([P|Ps], Acc, Staged) :-
    catch((stage_source(P, Entry)->true;throw(error(source_stage_failed,_))),
          E, (cleanup_staged(Acc), throw(E))),
    stage_sources(Ps, [Entry|Acc], Staged).

stage_source(prepared(Source,Info,Records), entry(Source,Info,Module,Native,Records,Reuse)) :-
    ( source_info(Source,Old), source_module(Source,Module,Native),
      Old.outputHash == Info.outputHash ->
        Reuse = true
    ; Reuse = false,
      uuid(Uuid), atom_concat(ow_source_, Uuid, Module),
      app_dir(App), directory_file_path(App,'.runtime',Root),
      directory_file_path(Root,Uuid,Directory), make_directory_path(Directory),
      file_base_name(Info.normalized,Base), directory_file_path(Directory,Base,Native),
      catch((copy_file(Info.normalized,Native),
             crypto_file_hash(Native,ActualHash,[algorithm(sha256)]),
             (ActualHash==Info.outputHash->true;throw(error(snapshot_mismatch(Source),_))),
             kb_runtime:native_load(Native,Module,[diagnostics(false),generation_snapshot(true)])),
            E, (cleanup_native(Native), throw(E)))
    ).

commit_generation(Staged, Current) :-
    findall(Native, (source_module(S,_,Native), \+ member(entry(S,_,_,Native,_,_),Staged)), Obsolete),
    transaction((
        retractall(source_info(_,_)), retractall(source_module(_,_,_)),
        retractall(assertion(_,_)),retractall(constant_locator(_,_)),retractall(mt_locator(_,_)),
        maplist(activate_source, Staged),
        rebuild_rankings,
        retractall(generation(_)), Next is Current+1, assertz(generation(Next))
    )),
    maplist(retire_native, Obsolete).

activate_source(entry(Source,Info,Module,Native,Records,_)) :-
    assertz(source_info(Source,Info)), assertz(source_module(Source,Module,Native)),
    kb_runtime:activate_native(Native),
    maplist(activate_record(Source,Module), Records).
activate_record(Source, Module, record(Occurrence,Semantic,Original)) :-
    once(kb_forms:contribution(Module,_,Occurrence,Id,_,Ref)),
    memberchk(xc_microtheory(Occurrence,Mt), Original),
    memberchk(xc_source_line(Occurrence,Line), Original),
    memberchk(xc_kb_names(Occurrence,Names), Original),
    maplist(primary_metadata(Id),Original,Metadata),
    context_key(Mt,MtKey),term_ast(Mt,[],MtExpression),
    (memberchk(xc_mapping_rows(Id,Mapping),Metadata) -> true ; Mapping=[]),
    mapping_rows_json(Mapping,MappingJSON),
    record_messages(Metadata,Id,notices,Notices),
    record_messages(Metadata,Id,warnings,Warnings),
    record_messages(Metadata,Id,errors,Errors),
    semantic_ast(Semantic,Names,AST),
    metadata_json(Metadata,Properties),
    kb_index:semantic_constants(Semantic,Constants),
    signature(Semantic,Predicate),
    public_path(Source,Public),
    metadata_json(Original,OriginalProperties),
    clause_property(Ref,file(Generated)),clause_property(Ref,line_count(NativeLine)),
    Contribution=_{sourceId:Occurrence,source:Public,line:Line,mt:MtKey,mtExpression:MtExpression,
                  names:Names,properties:OriginalProperties,module:Module,
                  generatedFile:Generated,generatedLine:NativeLine},
    Data=_{id:Id,expression:AST,mt:MtKey,mtExpression:MtExpression,source:Public,
            line:Line,names:Names,properties:Properties,mappingRows:MappingJSON,
            notices:Notices,warnings:Warnings,errors:Errors,
            predicate:Predicate,module:Module,constants:Constants,
            aliases:[Occurrence],contributions:[Contribution],sameForm:[]},
    (retract(assertion(Id,Existing))->join_assertion(Existing,Data,Joined),assertz(assertion(Id,Joined))
    ;assertz(assertion(Id,Data)),
     forall(member(C,Constants),assertz(constant_locator(C,Id))),assertz(mt_locator(Mt,Id))).

primary_metadata(Id,Term,Primary) :- Term=..[Name,_,Value],Primary=..[Name,Id,Value].
join_assertion(Existing,Incoming,Joined) :-
    foldl(join_data_field(Incoming),[properties,mappingRows,notices,warnings,errors,aliases,contributions],Existing,Joined).
join_data_field(Incoming,Key,Before,After) :-
    get_dict(Key,Before,A),get_dict(Key,Incoming,B),append(A,B,All),unique_json_values(All,[],Values),
    After=Before.put(Key,Values).
unique_json_values([],_,[]).
unique_json_values([Value|Rest],Seen,Values) :-
    (member(Existing,Seen),Value =@= Existing->unique_json_values(Rest,Seen,Values)
    ;Values=[Value|Tail],unique_json_values(Rest,[Value|Seen],Tail)).

refresh_assertions :-
    retractall(assertion(_,_)),retractall(constant_locator(_,_)),retractall(mt_locator(_,_)),
    forall((source_module(Source,Module,Native),
            kb_forms:contribution(Module,Native,Occurrence,Id,Metadata,_),
            kb_forms:form_record(Id,Semantic,_,_)),
      activate_record(Source,Module,record(Occurrence,Semantic,Metadata))),
    rebuild_rankings.

record_messages(Metadata,Id,Property,Messages) :-
    atom_concat(xc_,Property,Name),Fact=..[Name,Id,Values],
    (memberchk(Fact,Metadata)->maplist(json_value,Values,Messages);Messages=[]).

signature((Head :- _), Signature) :- !, signature(Head,Signature).
signature(Head, _{term:Name,arity:Arity}) :-
    functor(Head,Name0,A0),
    ( Name0 == t -> arg(1,Head,P),
      ( atom(P) -> Name=P ; Name=t ), Arity is A0-1
    ; Name=Name0, Arity=A0).

cleanup_staged([]).
cleanup_staged([entry(_,_,_,Native,_,Reuse)|Rest]) :-
    ( Reuse == true -> true ; cleanup_native(Native) ),
    cleanup_staged(Rest).
cleanup_native(Native) :-
    kb_runtime:native_unload(Native),
    ( exists_file(Native) -> delete_file(Native) ; true ),
    file_directory_name(Native,Directory),
    ( exists_directory(Directory) -> delete_directory(Directory) ; true ).

unload_source(Path, Expected, Status) :-
    (current_predicate(kb_jobs:pools_started/0),kb_jobs:pools_started,\+kb_jobs:in_loader->
      atom_string(Atom,Path),kb_jobs:submit_unload(Atom,Expected,Job),kb_jobs:await_result(Job.jobId,Status)
    ;unload_source_direct(Path,Expected,Status)).
unload_source_worker(Path,Status) :- generation(G),unload_source_direct(Path,G,Status).
unload_source_direct(Path, Expected, Status) :-
    atom_string(Input,Path),repo_root(Root),
    absolute_file_name(Input,Absolute,[relative_to(Root),access(none)]),
    with_mutex(openworld_store, unload_locked(Absolute, Expected, Status)).
unload_locked(Path, Expected, Status) :-
    generation(Current),
    ( Expected =:= Current -> true
    ; throw(error(generation_conflict(Expected,Current),_)) ),
    ( source_module(Path,_,Native) -> true
    ; throw(error(existence_error(active_source,Path),_)) ),
    transaction((
        retractall(source_module(Path,_,_)),retractall(source_info(Path,_)),
        refresh_assertions,retractall(generation(_)),
        Next is Current+1,assertz(generation(Next))
    )),
    retire_native(Native), status(Status).

retire_native(File) :-
    (native_readers(File,N),N>0->
      (retired_native(File)->true;assertz(retired_native(File)))
    ;cleanup_native(File)).

with_generation(Goal) :-
    setup_call_cleanup(
      with_mutex(openworld_store,
        (generation(Generation),active_modules(Modules),
         findall(File,source_module(_,_,File),Files),maplist(acquire_native,Files))),
      call(Goal,Modules,Generation),
      with_mutex(openworld_store,maplist(release_native,Files))).
acquire_native(File) :-
    (retract(native_readers(File,N))->true;N=0),
    Next is N+1,assertz(native_readers(File,Next)).
release_native(File) :-
    retract(native_readers(File,N)),Next is N-1,
    (Next>0->assertz(native_readers(File,Next))
    ;retract(retired_native(File))->cleanup_native(File);true).

active_modules(Modules) :- findall(M,source_module(_,M,_),Modules).
lookup_assertion(Id,Data) :-
    (assertion(Id,Data)->true;
      active_modules(Modules),kb_forms:resolve_id(Modules,Id,Primary),assertion(Primary,Data)).
assertions(Items) :-
    ordered_assertions(Ids),maplist(assertion,Ids,Items).
term_assertions(Term,Items) :-
    findall(Key-D,(constant_locator(Term,Id),assertion(Id,D),Key=D.source-D.line),Pairs),
    keysort(Pairs,Sorted),pairs_values(Sorted,Items).
mt_assertions(Mt,Items) :-
    findall(Key-D,(mt_locator(Mt,Id),assertion(Id,D),Key=D.source-D.line),Pairs),
    keysort(Pairs,Sorted),pairs_values(Sorted,Items).
term_exists(Term) :- term_count(Term,_).
terms(Terms) :- term_rank(Terms).
predicates(Predicates) :- predicate_rank(Predicates).
microtheories(Items) :- microtheory_catalog(Items).

microtheory_item(Mt-Count,_{mt:Key,mtExpression:Expression,count:Count}) :-
    context_key(Mt,Key),term_ast(Mt,[],Expression).

rebuild_rankings :-
    active_modules(Modules),
    forall(assertion(Id,Data),
      (findall(Other,kb_forms:same_form(Modules,Id,Other),Related0),sort(Related0,Related),
       retract(assertion(Id,Data)),assertz(assertion(Id,Data.put(sameForm,Related))))),
    findall(C,(assertion(_,Data),member(C,Data.constants)),Constants),
    msort(Constants,Sorted), clumped(Sorted,Counts),
    retractall(term_count(_,_)),forall(member(C-N,Counts),assertz(term_count(C,N))),
    findall((-N-C)-_{term:C,count:N,searchKey:Key},
      (member(C-N,Counts),downcase_atom(C,Key)),Ranked),
    keysort(Ranked,Ordered),pairs_values(Ordered,Terms),
    retractall(term_rank(_)),assertz(term_rank(Terms)),
    findall(P-A,(assertion(_,D),P=D.predicate.term,A=D.predicate.arity),Ps),
    msort(Ps,PSorted),clumped(PSorted,PCounts),
    findall((-N-P-A)-_{term:P,arity:A,count:N},member((P-A)-N,PCounts),PRanked),
    keysort(PRanked,POrdered),pairs_values(POrdered,Predicates),
    retractall(predicate_rank(_)),assertz(predicate_rank(Predicates)),
    findall(Key-Id,(assertion(Id,D),Key=D.source-D.line),SourcePairs),
    keysort(SourcePairs,SourceSorted),pairs_values(SourceSorted,Ids),
    retractall(ordered_assertions(_)),assertz(ordered_assertions(Ids)),
    length(Ids,Count),length(Terms,TermCount),length(Predicates,PredicateCount),
    findall(Mt,mt_locator(Mt,_),Mts),msort(Mts,SortedMts),clumped(SortedMts,MtCounts),
    maplist(microtheory_item,MtCounts,Contexts),length(Contexts,MtCount),
    retractall(microtheory_catalog(_)),assertz(microtheory_catalog(Contexts)),
    retractall(current_counts(_)),
    kb_forms:form_count(Modules,FormCount),
    findall(N,(assertion(_,Data),length(Data.contributions,N)),ContributionCounts),sum_list(ContributionCounts,Occurrences),
    assertz(current_counts(_{assertions:Count,forms:FormCount,occurrences:Occurrences,
                            terms:TermCount,predicates:PredicateCount,microtheories:MtCount})).

status(Status) :-
    generation(G),
    findall(F,(source_info(Path,Info),public_path(Path,Public),
      F=_{path:Public,count:Info.count,lineCount:Info.lineCount,sizeBytes:Info.sizeBytes,
          cache:Info.status,compileSeconds:Info.elapsed}),Files),
    current_counts(Counts),
    findall(W,(source_info(_,I),member(Warning,I.warnings),json_value(Warning,W)),Warnings),
    findall(Text,(assertion(_,D),member(M,D.notices),diagnostic_text(D,M,Text)),Notices),
    findall(Text,(assertion(_,D),member(M,D.errors),diagnostic_text(D,M,Text)),Errors),
    generation_timing(Timing),
    Status=_{generation:G,files:Files,
             counts:Counts,
             notices:Notices,warnings:Warnings,errors:Errors,timing:Timing}.
diagnostic_text(Data,Message,Text) :-
    format(string(Text),'~w:~d: ~w',[Data.source,Data.line,Message]).

query_text(Text, MT, Limit, Timeout, Result) :-
    (current_predicate(kb_jobs:pools_started/0),kb_jobs:pools_started,\+kb_jobs:in_inference->
      (var(MT)->Scope=none;Scope=context(MT)),
      kb_jobs:submit_inference(kb,query(Text,Scope,Limit,Timeout),Job),kb_jobs:await_result(Job.jobId,Result)
    ;with_application(with_generation(query_snapshot(Text,MT,Limit,Timeout,Result)))).
query_snapshot(Text,MT,Limit,Timeout,Result,Modules,Generation) :-
    kb_reader:normalize_query(Text,Semantic,Names),
    kb_runtime:query_modules(Modules,Semantic,MT,Limit,Timeout,Solutions),
    maplist(solution_json(Names,Modules),Solutions,Values), Result=_{solutions:Values,generation:Generation}.
solution_json(Names,Modules,solution(Mt,Variables,Steps),
              _{mt:MtKey,mtExpression:MtExpression,bindings:Bindings,proof:Proof}) :-
    context_key(Mt,MtKey),term_ast(Mt,[],MtExpression),
    maplist(binding_json,Names,Variables,Bindings),
    maplist(step_json(Modules),Steps,Proof).
binding_json(Name,Value,_{name:Name,value:AST}) :- term_ast(Value,[Name],AST).
step_json(Modules,step(Id,Kind,Slots,Before,After),JSON) :-
    kb_forms:form_record(Id,Semantic,Mt,_),
    kb_runtime:assertion_contributions(Modules,Id,Contributions),
    Contributions=[contribution(_,_,Occurrence,Metadata,_)|_],
    memberchk(xc_kb_names(Occurrence,Names),Metadata),
    maplist(proof_contribution,Contributions,Evidence),
    context_key(Mt,MtKey),term_ast(Mt,[],MtExpression),
    maplist(binding_json,Names,Slots,Bindings),
    bound_semantic_ast(Semantic,Names,Slots,Expression),
    JSON=_{id:Id,kind:Kind,expression:Expression,mt:MtKey,mtExpression:MtExpression,
           before:Before,after:After,bindings:Bindings,contributions:Evidence}.
proof_contribution(contribution(_,_,Occurrence,Metadata,_),Evidence) :-
    memberchk(xc_source_file(Occurrence,Source),Metadata),
    memberchk(xc_source_line(Occurrence,Line),Metadata),
    memberchk(xc_microtheory(Occurrence,Mt),Metadata),
    memberchk(xc_kb_names(Occurrence,Names),Metadata),
    context_key(Mt,Key),public_path(Source,Public),metadata_json(Metadata,Properties),
    Evidence=_{sourceId:Occurrence,source:Public,line:Line,mt:Key,names:Names,properties:Properties}.
