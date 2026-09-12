:- module(kb_catalog_query,
    [build_query_catalog/1,catalog_query_status/1,catalog_query_search/2,
     catalog_query_term/2,catalog_query_assertion/4,source_pack_snapshot/1]).
:- use_module(kb_catalog_index,[]).
:- use_module(kb_catalog_schema).
:- use_module(kb_catalog_providers,[source_provider_extensions/4]).
:- use_module(kb_catalog,[authorize_sources/2,directory_manifest/3]).
:- use_module(kb_cache,[]).
:- use_module(kb_paths).
:- use_module(kb_store,[]).
:- use_module(kb_term_resolver,[term_input/3]).
:- use_module(kb_non_atomic).
:- use_module(kb_terms,[context_from_key/2,metadata_json/2]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

/** <module> Catalog query projection with direct-seek term postings.

Publication is explicit and offline. Immutable versioned per-file postings keep
old readers valid while a replacement is built. Requests read only the selected
term's posting in each matching source, not every source's full occurrence index.
The projection is an index of data, not an additional native KB generation.
*/

query_file(File) :-
    kb_catalog_index:catalog_paths(Catalog,_),file_directory_name(Catalog,Dir),
    directory_file_path(Dir,'query.data',File).
query_progress(File) :-
    query_file(Query),file_directory_name(Query,Dir),
    directory_file_path(Dir,'query-progress.data',File).
build_query_catalog(Report) :-
    query_file(File),atom_concat(File,'.lock',LockPath),kb_cache:try_lock(LockPath,Lock),
    (Lock==busy->throw(error(catalog_busy,_));true),
    query_progress(Progress),
    setup_call_cleanup(kb_catalog_index:begin_catalog_run(Progress,query),
      catch((build_query_locked(File,Report)->
               kb_catalog_index:write_progress(Progress,json{state:succeeded,phase:completed,
                 completed:Report.coverage.freshFiles,total:Report.coverage.expectedFiles,coverage:Report.coverage})
             ;throw(error(catalog_projection_failed,_))),
        Error,(kb_catalog_index:fail_catalog_run(Progress,Error),throw(Error))),
      kb_cache:release_lock(Lock)).
build_query_locked(File,Report) :-
    statistics(walltime,[Start,_]),nb_setval(powder_projection_started,Start),
    kb_catalog_index:catalog_paths(CatalogFile,_),
    kb_cache:file_digest(CatalogFile,Revision),
    kb_catalog_index:read_data(CatalogFile,catalog_snapshot(Catalog)),
    verify_catalog_manifest(Catalog.expected),
    include(fresh,Catalog.files,Files),
    length(Files,Total),nb_setval(powder_projection_total,Total),flag(powder_projection_completed,_,0),
    maplist(file_evidence(Total),Files,Chunks),append(Chunks,Evidence),
    projection_progress(taxonomy,'',Total,Total),
    build_catalog_schema(Evidence,Schema),
    kb_cache:terms_digest([catalog_query_v1,Schema],SchemaHash),
    file_directory_name(File,Dir),atomic_list_concat([Revision,'-',SchemaHash],Version),
    directory_file_path(Dir,Version,VersionDir),make_directory_path(VersionDir),
    flag(powder_projection_completed,_,0),
    empty_assoc(Empty),foldl(project_source(Schema,VersionDir),Files,
      projected(Empty,[]),projected(Terms,FilePairs)),
    maplist(classify_entry(Schema),Catalog.terms,Entries),
    maplist(entry_pair,Entries,EntryPairs),list_to_assoc(EntryPairs,ByTerm),
    maplist(rank,Entries,Ranked),keysort(Ranked,Sorted),pairs_values(Sorted,Order),
    keysort(FilePairs,SortedFiles),list_to_assoc(SortedFiles,ByFile),
    kb_cache:file_digest(CatalogFile,After),
    (After==Revision->true;throw(error(catalog_changed_during_projection,_))),
    verify_catalog_manifest(Catalog.expected),
    (forall(member(SourceFile,Files),file_stats_current(SourceFile))->true;
      throw(error(catalog_stale(source_changed_during_projection),_))),
    Projection=query_catalog{schema:catalog_query_v1,revision:Revision,
      taxonomy:SchemaHash,coverage:Catalog.coverage,verifiedAt:Catalog.verifiedAt,
      expected:Catalog.expected,terms:ByTerm,postings:Terms,ranked:Order,files:ByFile},
    kb_catalog_index:atomic_data(File,catalog_query(Projection)),
    statistics(walltime,[End,_]),Seconds is (End-Start)/1000,
    length(Entries,N),Report=json{terms:N,coverage:Catalog.coverage,revision:Revision,seconds:Seconds}.
verify_catalog_manifest(Expected) :-
    directory_manifest('KBs',_,Manifest),pairs_keys(Manifest,Paths),
    maplist(path_key,Paths,CurrentKeys0),sort(CurrentKeys0,CurrentKeys),
    maplist(path_key,Expected,ExpectedKeys0),sort(ExpectedKeys0,ExpectedKeys),
    (CurrentKeys==ExpectedKeys->true;throw(error(catalog_stale(source_manifest),_))).
fresh(File) :- File.status==fresh.
file_evidence(Total,File,Evidence) :-
    flag(powder_projection_completed,N,N),projection_progress(taxonomy_inputs,File.path,N,Total),
    kb_catalog_index:current_source(File),read_source(File,Data),
    source_schema_evidence(File.path,Data,Evidence),
    flag(powder_projection_completed,_,N+1).
projection_progress(Phase,Path,Completed,Total) :-
    query_progress(File),kb_catalog_index:check_catalog_cancel(File),
    (Total==null->nb_getval(powder_projection_total,Expected);Expected=Total),
    nb_getval(powder_projection_started,Start),statistics(walltime,[Now,_]),Elapsed is (Now-Start)/1000,
    kb_catalog_index:write_progress(File,json{phase:Phase,path:Path,completed:Completed,total:Expected,elapsed:Elapsed}).
read_source(File,Data) :-
    kb_catalog_index:read_data(File.cache,source_catalog(Data)),
    (Data.identity==File.identity->true;throw(error(catalog_stale(File.path),_))).

project_source(Schema,Directory,File,projected(Before,Files),projected(After,[Key-Info|Files])) :-
    flag(powder_projection_completed,N,N),projection_progress(postings,File.path,N,null),
    read_source(File,Data),source_views(Data,Sentences,Applications),
    crypto_data_hash(File.path,Name,[algorithm(sha256),encoding(utf8)]),
    atom_concat(Name,'.postings',Base),directory_file_path(Directory,Base,Path),
    kb_cache:stage_path(Path,Stage),
    setup_call_cleanup(true,
      (setup_call_cleanup(open(Stage,write,Stream,[encoding(utf8),newline(posix)]),
         (kb_cache:write_one_line(Stream,postings_header(1,File.identity)),
          foldl(write_posting(Stream,File.path,Sentences,Applications,Schema),Data.terms,
            posting_state(Before,[]),posting_state(After,Digests)),
          kb_cache:terms_digest(Digests,Digest),
          kb_cache:write_one_line(Stream,postings_footer(Digest)),flush_output(Stream)),
         close(Stream)),
       validate_postings(Stage,File.identity,Digest),
       kb_catalog_index:install_catalog_stage(Stage,Path,0)),
      kb_cache:remove_if_exists(Stage)),
    source_provider_extensions(File.path,Data,Schema,Extensions),
    path_key(File.path,Key),Info=File.put(json{postings:Path,postingsDigest:Digest,
      termSchema:Data.termSchema,dependencySummary:Data.dependencies,providerExtensions:Extensions}),
    flag(powder_projection_completed,_,N+1).
source_views(Data,Sentences,Applications) :-
    maplist(sentence_pair,Data.sentences,SentencePairs),list_to_assoc(SentencePairs,Sentences),
    findall((N-Path)-Head,member(a(N,Head,_,Path),Data.applications),AppPairs),
    keysort(AppPairs,Sorted),list_to_assoc(Sorted,Applications).
sentence_pair(S,N-S) :- S=s(N,_,_,_,_,_).
write_posting(Stream,Source,Sentences,Applications,Schema,Term,
              posting_state(T0,D0),posting_state(T,[Digest|D0])) :-
    Term=t(Key,Semantic,Occurrences,Contexts,_,_,Hits),
    findall(N-h(Path,Role,Facet),member(h(N,Path,Role,Facet),Hits),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
    maplist(posting_row(Sentences,Applications,Schema),Groups,Rows),
    include(has_definition,Rows,Defined),length(Defined,Definitions),
    stream_property(Stream,position(Position)),stream_position_data(byte_count,Position,Offset),
    Payload=posting(Key,Rows),kb_cache:terms_digest([Payload],Digest),
    kb_cache:write_one_line(Stream,posting(Key,Rows,Digest)),
    Post=p(Source,Offset,Semantic,Occurrences,Definitions,Contexts),
    (get_assoc(Key,T0,Old)->Next=[Post|Old];Next=[Post]),put_assoc(Key,T0,Next,T).
posting_row(Sentences,Apps,Schema,N-Hits,r(N,Id,Line,Mt,Names,Offset,Hits,Definitions)) :-
    get_assoc(N,Sentences,s(N,Id,Line,Mt,Names,Offset)),
    findall(Path,
      (member(h(Path,_,Facet),Hits),
       (Facet==definition
       ;Facet==semantic,append(Prefix,[args,Index],Path),integer(Index),
        get_assoc(N-Prefix,Apps,Predicate),
        definition_slots(Predicate,Schema,Slots),Slot is Index+1,memberchk(Slot,Slots))),
      Paths),sort(Paths,Definitions).
has_definition(r(_,_,_,_,_,_,_,[_|_])).

validate_postings(File,Identity,Digest) :-
    setup_call_cleanup(open(File,read,S,[encoding(utf8),newline(posix)]),
      (kb_catalog_index:safe_term(S,postings_header(1,Identity)),
       read_posting_digests(S,[],Digests,Found),
       kb_cache:terms_digest(Digests,Digest),Found==Digest),close(S)).
read_posting_digests(S,Before,Digests,Footer) :-
    kb_catalog_index:safe_term(S,Term),
    (Term=postings_footer(Footer)->read_term(S,end_of_file,[]),Digests=Before
    ;Term=posting(Key,Rows,Digest),atom(Key),is_list(Rows),
     kb_cache:terms_digest([posting(Key,Rows)],Digest),
     read_posting_digests(S,[Digest|Before],Digests,Footer)).

classify_entry(Schema,Key-Files,entry(Key,Groups,Types,Roles,Sentences,Occurrences)) :-
    findall(R,(member(f(_,_,_,_,_,Rs),Files),member(R,Rs)),RoleList),sort(RoleList,Roles),
    term_classification(Key,Roles,Schema,Classification),Groups=Classification.groups,
    findall(Type,member(type(Type,_),Classification.types),TypeList),sort(TypeList,Types),
    kb_catalog_index:global_counts(Files,Sentences,Occurrences,_).
entry_pair(Entry,Key-Entry) :- Entry=entry(Key,_,_,_,_,_).
rank(entry(Key,_,_,_,Sentences,_),Rank-Key) :- Rank is -Sentences.

catalog_query_status(Reply) :-
    kb_catalog_index:catalog_status(Status),query_file(File),
    (exists_file(File)->kb_catalog_index:file_stamp(File,stamp(Size,Time)),
       Projection=json{available:true,sizeBytes:Size,publishedAt:Time};
       Projection=json{available:false}),
    query_progress(Progress),kb_catalog_index:external_job_status(File,Progress,Job),
    Reply=Status.put(json{projection:Projection,projectionProgress:Job}).
source_pack_snapshot(Snapshot) :-
    query_file(File),
    (exists_file(File)->
       model(Model),
       (get_dict(expected,Model,Expected),
        forall(gen_assoc(_,Model.files,F),
          (get_dict(dependencySummary,F,_),get_dict(providerExtensions,F,_)))->
          directory_manifest('KBs',_,Manifest),pairs_keys(Manifest,Current),
          maplist(path_key,Current,CurrentKeys0),sort(CurrentKeys0,CurrentKeys),
          maplist(path_key,Expected,ExpectedKeys0),sort(ExpectedKeys0,ExpectedKeys),
          (CurrentKeys==ExpectedKeys,forall(gen_assoc(_,Model.files,F),file_stats_current(F))->
             State=available,Coverage=Model.coverage
          ;State=stale,Coverage=Model.coverage.put(json{complete:false,
             freshness:catalog_or_file_stats_changed})),
          Snapshot=source_pack_catalog{status:State,revision:Model.revision,taxonomy:Model.taxonomy,
            verifiedAt:Model.verifiedAt,coverage:Coverage,files:Model.files}
       ;empty_source_pack_snapshot(projection_requires_refresh,Snapshot))
    ;empty_source_pack_snapshot(query_projection_unavailable,Snapshot)).
empty_source_pack_snapshot(Reason,Snapshot) :-
    empty_assoc(Files),
    Snapshot=source_pack_catalog{status:unavailable,revision:none,taxonomy:none,verifiedAt:null,
      coverage:json{complete:false,reason:Reason},files:Files}.
file_stats_current(File) :-
    repo_root(Root),directory_file_path(Root,File.path,Source),
    exists_file(Source),exists_file(File.normalized),
    size_file(Source,Size),time_file(Source,Time),
    Size=:=File.sizeBytes,Time=:=File.modified,
    kb_catalog_index:file_stamp(File.normalized,Stamp),Stamp==File.normalizedStamp.
model(Model) :-
    query_file(File),kb_catalog_index:file_stamp(File,Stamp),
    (nb_current(powder_catalog_query,cache(File,Stamp,Model))->true
    ;catalog_read_capacity,
     kb_catalog_index:read_data(File,catalog_query(Read)),
     nb_linkval(powder_catalog_query,cache(File,Stamp,Read)),Model=Read).
catalog_read_capacity :-
    current_prolog_flag(stack_limit,Current),Required is 8*1024*1024*1024,
    (Current<Required->set_prolog_flag(stack_limit,Required);true).
active(Generation,Active) :-
    with_mutex(openworld_store,
      (kb_store:generation(Generation),
       findall(Key,(kb_store:source_info(Path,_),public_path(Path,Public),path_key(Public,Key)),Keys))),
    sort(Keys,Sorted),maplist(active_pair,Sorted,Pairs),list_to_assoc(Pairs,Active).
active_pair(Key,Key-true).
path_key(Path,Key) :- (current_prolog_flag(windows,true)->downcase_atom(Path,Key);Key=Path).
loaded(Source,Active,Value) :- path_key(Source,Key),(get_assoc(Key,Active,_)->Value=true;Value=false).
scope_file(all,_,_).
scope_file(loaded,Source,Active) :- loaded(Source,Active,true).
scope_file(unloaded,Source,Active) :- loaded(Source,Active,false).

options(Input,Options) :-
    must_be(dict,Input),
    Defaults=json{q:'',term:'',scope:all,group:all,facet:definition,source:'',mt:'',offset:0,limit:25},
    dict_pairs(Input,_,Pairs),
    forall(member(Key-_,Pairs),(get_dict(Key,Defaults,_)->true;domain_error(catalog_option,Key))),
    Options=Defaults.put(Input),
    must_be(nonneg,Options.offset),must_be(between(1,100),Options.limit),
    maplist(text_option(Options),[q,term,scope,group,facet,source,mt]),
    (memberchk(Options.scope,[all,loaded,unloaded])->true;domain_error(catalog_scope,Options.scope)),
    (memberchk(Options.group,[all,predicates,functions,collections,microtheories,
       external_symbols,do_invocations,individuals,unclassified])->true;domain_error(catalog_group,Options.group)),
    (memberchk(Options.facet,[semantic,definition,context])->true;domain_error(catalog_facet,Options.facet)).
text_option(Dict,Key) :- get_dict(Key,Dict,Value),must_be(atom,Value).

catalog_query_search(Input,Reply) :-
    options(Input,Options),model(Model),active(Generation,Active),
    downcase_atom(Options.q,Query),
    search_keys(Model,Options,Active,Generation,Query,Keys),
    kb_catalog_index:page(Keys,Options.offset,Options.limit,Selected,Total),
    maplist(search_key_json(Model,Active,Options.scope),Selected,Items),
    Reply=json{items:Items,total:Total,offset:Options.offset,limit:Options.limit,
      generation:Generation,coverage:Model.coverage,verifiedAt:Model.verifiedAt,
      revision:Model.revision,scope:Options.scope}.
search_keys(Model,Options,_,_,'',Keys) :-
    Options.scope==all,Options.group==all,!,Keys=Model.ranked.
search_keys(Model,Options,Active,Generation,Query,Keys) :-
    CacheKey=search(Model.revision,Model.taxonomy,Generation,Options.scope,Options.group,Query),
    (nb_current(powder_catalog_search,cache(CacheKey,Keys))->true;
     findall(Key,search_entry(Model,Options,Active,Query,Key),Keys),
     nb_linkval(powder_catalog_search,cache(CacheKey,Keys))).
search_entry(Model,Options,Active,Query,Key) :-
    member(Key,Model.ranked),
    (Query==''->true;downcase_atom(Key,Lower),once(sub_atom(Lower,_,_,_,Query))),
    (Options.group==all->true;
     get_assoc(Key,Model.terms,entry(_,Groups,_,_,_,_)),memberchk(Options.group,Groups)),
    (Options.scope==all->true;key_in_scope(Model,Options.scope,Active,Key)).
key_in_scope(Model,Scope,Active,Key) :-
    get_assoc(Key,Model.postings,Posts),
    once((member(p(Source,_,_,_,_,_),Posts),scope_file(Scope,Source,Active))).
search_key_json(Model,Active,Scope,Key,Row) :-
    get_assoc(Key,Model.terms,Entry),search_json(Model,Active,Scope,Key,Entry,Row).
search_json(Model,Active,Scope,Key,entry(_,Groups,Types,Roles,_,_),Row) :-
    get_assoc(Key,Model.postings,Posts),
    findall(p(S,O,N,C,D,M),(member(p(S,O,N,C,D,M),Posts),scope_file(Scope,S,Active)),Selected),
    findall(N,member(p(_,_,N,_,_,_),Selected),Ns),sum_list(Ns,Sentences),
    findall(N,member(p(_,_,_,N,_,_),Selected),Os),sum_list(Os,Occurrences),
    findall(N,member(p(_,_,_,_,N,_),Selected),Ds),sum_list(Ds,Definitions),
    length(Selected,FileCount),key_expression(Key,Expression),
    findall(json{term:T,expression:AST},(member(T,Types),key_expression(T,AST)),TypeEntries),
    Row=json{term:Key,expression:Expression,groups:Groups,types:Types,roles:Roles,
      typeEntries:TypeEntries,
      files:FileCount,sentences:Sentences,occurrences:Occurrences,definitions:Definitions}.
key_expression(Key,Expression) :-
    (atom_concat('nat:',_,Key)->non_atomic_from_key(Key,Term),annotated_context_ast(Term,Expression)
    ;Expression=json{type:symbol,value:Key}).

catalog_query_term(Input,Reply) :-
    options(Input,Options),canonical_key(Options.term,Key),model(Model),active(Generation,Active),
    (get_assoc(Key,Model.postings,Posts)->true;Posts=[]),
    findall(Source-Rows,(member(p(Source,Offset,_,_,_,_),Posts),
      source_filter(Options,Source,Active),
      file_for(Model,Source,File),read_posting(File,Offset,Key,All),
      include(row_matches(Options),All,Rows),Rows\=[]),UnsortedSourceRows),
    keysort(UnsortedSourceRows,SourceRows),
    findall(Source-Row,(member(Source-Rows,SourceRows),member(Row,Rows)),Rows),
    kb_catalog_index:page(Rows,Options.offset,Options.limit,Selected,Total),
    findall(N,(member(_-r(_,_,_,_,_,_,Hits,Defs),Rows),
      selected_positions(Options.facet,Hits,Defs,Positions),length(Positions,N)),Counts),
    sum_list(Counts,Occurrences),
    findall(json{source:Source,sentences:Count,loaded:Loaded},
      (member(Source-Found,SourceRows),length(Found,Count),loaded(Source,Active,Loaded)),Files),
    verified_page_files(Selected,Model),
    maplist(detail_row(Model,Active,Options.facet),Selected,Items),
    key_expression(Key,Expression),
    Reply=json{term:Key,expression:Expression,facet:Options.facet,scope:Options.scope,
      items:Items,total:Total,occurrences:Occurrences,files:Files,
      offset:Options.offset,limit:Options.limit,generation:Generation,
      coverage:Model.coverage,verifiedAt:Model.verifiedAt,revision:Model.revision}.
canonical_key(Input,Key) :-
    term_input(Input,Found,_),
    (atom_concat('mt:',_,Found)->context_from_key(Found,T),non_atomic_key(T,Key);Key=Found).
source_filter(Options,Source,Active) :-
    scope_file(Options.scope,Source,Active),
    (Options.source=='';path_key(Options.source,K),path_key(Source,K)).
file_for(Model,Source,File) :- path_key(Source,Key),get_assoc(Key,Model.files,File).
row_matches(Options,r(_,_,_,Mt,_,_,Hits,Defs)) :-
    (Options.mt=='';Options.mt==Mt),
    selected_positions(Options.facet,Hits,Defs,Positions),Positions\=[].
selected_positions(definition,_,Paths,Paths).
selected_positions(semantic,Hits,_,Paths) :- findall(P,member(h(P,_,semantic),Hits),Paths).
selected_positions(context,Hits,_,Paths) :- findall(P,member(h(P,_,context),Hits),Paths).
read_posting(File,Offset,Key,Rows) :-
    (setup_call_cleanup(open(File.postings,read,S,[encoding(utf8),newline(posix)]),
      (seek(S,Offset,bof,_),kb_catalog_index:safe_term(S,posting(Key,Rows,Digest)),
       kb_cache:terms_digest([posting(Key,Rows)],Digest)),close(S))->true;
     throw(error(invalid_catalog_posting(File.path,Key),_))).
verified_page_files(Selected,Model) :-
    pairs_keys(Selected,Sources),sort(Sources,Unique),
    authorize_sources(Unique,_),
    forall(member(Source,Unique),(file_for(Model,Source,File),kb_catalog_index:current_source(File))).
detail_row(Model,Active,Facet,Source-Row,Reply) :-
    file_for(Model,Source,File),row_detail(File,Row,Base),
    Row=r(_,_,_,_,_,_,Hits,Defs),selected_positions(Facet,Hits,Defs,Positions),
    loaded(Source,Active,Loaded),Reply=Base.put(json{source:Source,loaded:Loaded,positions:Positions}).
row_detail(File,r(_,Id,Line,Mt,Names,Offset,_,_),Reply) :-
    setup_call_cleanup(open(File.normalized,read,S,[encoding(utf8),newline(posix)]),
      (seek(S,Offset,bof,_),kb_cache:read_line_term(S,Clause,_),
       read_assertion_metadata(S,Id,Metadata)),close(S)),
    (kb_catalog_index:clause_identity(Clause,Id)->true;throw(error(catalog_stale(assertion_identity),_))),
    Clause=(Head:-Guard),
    (Guard=..[x_cid|_]->Semantic=Head;Guard=x_cid_io(_,Body,_,_),Semantic=(Head:-Body)),
    annotated_semantic_ast(Semantic,Names,File.termSchema,Expression),
    context_from_key(Mt,Context),annotated_context_ast(Context,MtExpression),
    metadata_json(Metadata,Properties),
    Reply=json{id:Id,line:Line,mt:Mt,mtExpression:MtExpression,names:Names,
      expression:Expression,origin:validated_catalog,properties:Properties}.
read_assertion_metadata(S,Id,Metadata) :-
    kb_cache:read_line_term(S,Term,_),
    (compound(Term),Term=..[Name,Id,_],atom_concat(xc_,_,Name)->
       Metadata=[Term|Rest],read_assertion_metadata(S,Id,Rest)
    ;Metadata=[]).
catalog_query_assertion(Input,Source,Id,Reply) :-
    canonical_key(Input,Key),model(Model),active(Generation,Active),
    get_assoc(Key,Model.postings,Posts),member(p(Source,Offset,_,_,_,_),Posts),
    file_for(Model,Source,File),read_posting(File,Offset,Key,Rows),
    member(Row,Rows),Row=r(_,Id,_,_,_,_,_,_),!,
    authorize_sources([Source],_),kb_catalog_index:current_source(File),
    detail_row(Model,Active,semantic,Source-Row,Data),
    Reply=Data.put(generation,Generation).
catalog_query_assertion(_,Source,Id,_) :- existence_error(catalog_assertion,Source-Id).
