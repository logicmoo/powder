:- module(kb_store, [load_sources/3, unload_source/3, status/1, active_modules/1,
                    assertion/2, assertions/1, terms/1, predicates/1,
                    generation/1, source_info/2, query_text/5,
                    term_assertions/2, mt_assertions/2, term_exists/1, microtheories/1]).
:- use_module(kb_paths).
:- use_module(kb_runtime, []).
:- use_module(kb_compile, []).
:- use_module(kb_cache, []).
:- use_module(kb_index, []).
:- use_module(kb_reader, []).
:- use_module(kb_terms).
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
    with_mutex(openworld_code_reload,load_sources_locked(Paths,Expected,Status)).

load_sources_locked(Paths, Expected, Status) :-
    statistics(walltime,[Start,_]),
    must_be(list, Paths),
    maplist(kb_paths:resolve_source, Paths, Absolute),
    kb_compile:discover_sources(Absolute, Files),
    kb_compile:compile_sources(Files, [progress(none)], Summary),
    ( Summary.failures =:= 0, Summary.busy =:= 0 -> true
    ; throw(error(compile_incomplete(Summary), _))
    ),
    maplist(prepare_source, Summary.results, Prepared),
    validate_unique_ids(Prepared),
    with_mutex(openworld_store, install_generation(Prepared, Expected, Start, Status)).

prepare_source(Info, prepared(Source, WithHash, Records)) :-
    absolute_file_name(Info.source,Source,[access(read)]),
    kb_cache:read_cache(Info.normalized, _, Records),
    crypto_file_hash(Info.normalized,Hash,[algorithm(sha256)]),
    WithHash=Info.put(outputHash,Hash).

validate_unique_ids(Prepared) :-
    findall(Id, (member(prepared(_,_,Records),Prepared), member(record(Id,_,_),Records)), Ids),
    msort(Ids, Sorted),
    ( append(_, [Id,Id|_], Sorted) ->
        throw(error(conflicting_assertion_id(Id), _))
    ; true).

install_generation(Prepared, Expected, Start, Status) :-
    generation(Current),
    ( Expected == any ; Expected =:= Current ), !,
    stage_sources(Prepared, Staged),
    catch((commit_generation(Staged, Current)->true;throw(error(generation_install_failed,_))), Error,
          (cleanup_staged(Staged), throw(Error))),
    statistics(walltime,[End,_]),Elapsed is (End-Start)/1000,
    retractall(generation_timing(_)),assertz(generation_timing(_{loadSeconds:Elapsed})),
    status(Status).
install_generation(_, Expected, _, _) :-
    generation(Current), throw(error(generation_conflict(Expected,Current), _)).

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
      runtime_root(Root),
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
    maplist(cleanup_native, Obsolete).

activate_source(entry(Source,Info,Module,Native,Records,_)) :-
    assertz(source_info(Source,Info)), assertz(source_module(Source,Module,Native)),
    maplist(activate_record(Source,Module), Records).
activate_record(Source, Module, record(Id,Semantic,Metadata)) :-
    memberchk(xc_microtheory(Id,Mt), Metadata),
    memberchk(xc_source_line(Id,Line), Metadata),
    memberchk(xc_kb_names(Id,Names), Metadata),
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
    assertz(assertion(Id, _{id:Id,expression:AST,mt:MtKey,mtExpression:MtExpression,source:Public,
            line:Line,names:Names,properties:Properties,mappingRows:MappingJSON,
            notices:Notices,warnings:Warnings,errors:Errors,
            predicate:Predicate,module:Module,constants:Constants})),
    forall(member(C,Constants),assertz(constant_locator(C,Id))),
    assertz(mt_locator(Mt,Id)).

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
        public_path(Path,Public),
        forall((assertion(Id,Data),Data.source==Public),
          (retractall(assertion(Id,_)),retractall(constant_locator(_,Id)),retractall(mt_locator(_,Id)))),
        rebuild_rankings,retractall(generation(_)),
        Next is Current+1,assertz(generation(Next))
    )),
    cleanup_native(Native), status(Status).

active_modules(Modules) :- findall(M,source_module(_,M,_),Modules).
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
    assertz(current_counts(_{assertions:Count,terms:TermCount,predicates:PredicateCount,microtheories:MtCount})).

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
    kb_reader:normalize_query(Text,Semantic,Names),
    active_modules(Modules),
    kb_runtime:query_modules(Modules,Semantic,MT,Limit,Timeout,Solutions),
    maplist(solution_json(Names),Solutions,Values), Result=_{solutions:Values}.
solution_json(Names,solution(Mt,Variables,Steps),
              _{mt:MtKey,mtExpression:MtExpression,bindings:Bindings,proof:Proof}) :-
    context_key(Mt,MtKey),term_ast(Mt,[],MtExpression),
    maplist(binding_json,Names,Variables,Bindings),
    maplist(step_json,Steps,Proof).
binding_json(Name,Value,_{name:Name,value:AST}) :- term_ast(Value,[Name],AST).
step_json(step(Id,Kind,Slots,Before,After),JSON) :-
    assertion(Id,Data),
    maplist(binding_json,Data.names,Slots,Bindings),
    kb_runtime:module_assertion(Data.module,Id,Semantic,_),
    bound_semantic_ast(Semantic,Data.names,Slots,Expression),
    JSON=_{id:Id,kind:Kind,expression:Expression,mt:Data.mt,mtExpression:Data.mtExpression,
           before:Before,after:After,bindings:Bindings}.
