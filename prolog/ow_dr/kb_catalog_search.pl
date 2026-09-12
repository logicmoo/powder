:- module(kb_catalog_search,
    [build_search_directory/1,write_model_search/4,search_page/6,search_status/2,
     public_groups/3]).
:- use_module(kb_catalog_index,[]).
:- use_module(kb_cache,[]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(fastrw)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(ordsets)).
:- use_module(library(pairs)).
:- use_module(library(uuid)).

/** <module> Compact ranked search view of the published query directory.

Only keys, category bits and source ordinals are resident during broad search.
Selected results still use the authoritative directory entries and postings.
The binary file is a disposable SWI-version-bound projection, never source data.
*/

build_search_directory(Report) :-
    kb_catalog_directory:paths(_,Manifest),
    kb_catalog_directory:acquire(Manifest,Lock),
    setup_call_cleanup(kb_catalog_directory:begin_progress(Manifest),
      catch(build_locked(Manifest,Report),Error,
        (kb_catalog_directory:failed_progress(Error),throw(Error))),
      kb_cache:release_lock(Lock)).
build_locked(Manifest,Report) :-
    statistics(walltime,[Start,_]),kb_catalog_directory:manifest(Header),
    kb_catalog_directory:progress(search_sources,0,Header.fileCount),
    directory_files(Header.directory,Names),
    findall(Key,
      (member(Name,Names),file_name_extension(_,source,Name),
       directory_file_path(Header.directory,Name,Path),
       kb_catalog_directory:read_record(Path,
         catalog_source_descriptor(Header.revision,Header.taxonomy,File)),
       kb_catalog_directory:source_key(File.path,Key)),Keys),
    sort(Keys,Files),length(Files,Header.fileCount),source_ordinals(Files,Ordinals),
    include(term_bucket,Names,Buckets),length(Buckets,Total),
    read_buckets(Buckets,Header,Ordinals,0,Total,Ranked,[]),
    keysort(Ranked,Sorted),pairs_values(Sorted,Rows),
    write_search(Header.directory,Header,Files,Rows,Info),
    setup_call_catcher_cleanup(true,
      (kb_catalog_directory:manifest(Current),
       (Current==Header->true;throw(error(catalog_directory_stale,_))),
       kb_catalog_directory:write_record(Manifest,catalog_directory(Header.put(search,Info)))),
      Catcher,(Catcher==exit->true;kb_cache:remove_if_exists(Info.path))),
    statistics(walltime,[End,_]),Seconds is (End-Start)/1000,
    Report=json{revision:Header.revision,terms:Header.termCount,files:Header.fileCount,
      sizeBytes:Info.sizeBytes,seconds:Seconds},
    kb_catalog_directory:progress(completed,Header.termCount,Header.termCount).
term_bucket(Name) :- file_name_extension(_,terms,Name).
read_buckets([],_,_,_,_,Tail,Tail).
read_buckets([Name|Rest],Header,Ordinals,N,Total,Rows,Tail) :-
    kb_catalog_directory:progress(search_buckets,N,Total),
    directory_file_path(Header.directory,Name,Path),
    kb_catalog_directory:read_record(Path,catalog_bucket(Header.revision,Header.taxonomy,Entries)),
    assoc_to_list(Entries,Pairs),
    bucket_rows(Pairs,Ordinals,Rows,Next),After is N+1,
    read_buckets(Rest,Header,Ordinals,After,Total,Next,Tail).
bucket_rows([],_,Tail,Tail).
bucket_rows([Key-row(Entry,Posts)|Rest],Ordinals,[(Rank-Key)-Row|Rows],Tail) :-
    Entry=entry(_,_,_,_,Sentences,_),Rank is -Sentences,
    compact_row(Key,Entry,Posts,Ordinals,Row),
    bucket_rows(Rest,Ordinals,Rows,Tail).

write_model_search(Directory,Model,Header,Info) :-
    assoc_to_keys(Model.files,Files),source_ordinals(Files,Ordinals),
    maplist(model_row(Model,Ordinals),Model.ranked,Rows),
    write_search(Directory,Header,Files,Rows,Info).
source_ordinals(Files,Ordinals) :-
    findall(Key-N,nth0(N,Files,Key),Pairs),list_to_assoc(Pairs,Ordinals).
model_row(Model,Ordinals,Key,Row) :-
    get_assoc(Key,Model.terms,Entry),get_assoc(Key,Model.postings,Posts),
    compact_row(Key,Entry,Posts,Ordinals,Row).
compact_row(Key,entry(_,Stored,_,_,_,_),Posts,Ordinals,s(Key,Mask,Files)) :-
    public_groups(Key,Stored,Groups),foldl(group_bit,Groups,0,Mask),
    findall(N,(member(p(Source,_,_,_,_,_),Posts),
      kb_catalog_directory:source_key(Source,Path),get_assoc(Path,Ordinals,N)),Numbers),
    sort(Numbers,Files).
group_bit(Group,Before,After) :- group_number(Group,N),After is Before \/ (1<<N).
group_number(predicates,0).
group_number(functions,1).
group_number(collections,2).
group_number(microtheories,3).
group_number(external_symbols,4).
group_number(do_invocations,5).
group_number(typed_other,6).
group_number(unclassified,7).
group_number(lexical_words,8).
public_groups(Key,Stored,Groups) :-
    maplist(public_group,Stored,Known),
    (atom_concat('x_',Word,Key),atom_concat(Stem,'-TheWord',Word),Stem\==''->
       sort([lexical_words|Known],Groups);sort(Known,Groups)).
public_group(individuals,typed_other) :- !.
public_group(Group,Group).

write_search(Directory,Header,Files,Rows,Info) :-
    length(Rows,Header.termCount),length(Files,Header.fileCount),
    current_prolog_flag(version_data,Version),current_prolog_flag(arch,Arch),
    uuid(Id),atomic_list_concat(['search-',Id,'.bin'],Name),
    directory_file_path(Directory,Name,Path),kb_cache:stage_path(Path,Stage),
    Payload=catalog_search(1,Version,Arch,Header.revision,Header.taxonomy,Files,Rows),
    setup_call_cleanup(true,
      (setup_call_cleanup(open(Stage,write,S,[type(binary)]),
         (fast_write(S,Payload),fast_write(S,search_end(Header.termCount)),flush_output(S)),close(S)),
       crypto_file_hash(Stage,Hash,[algorithm(sha256),encoding(octet)]),size_file(Stage,Size),
       Info=search{schema:catalog_search_v1,path:Path,digest:Hash,sizeBytes:Size},
       read_search(Stage,Info,Header,_),
       kb_catalog_index:install_catalog_stage(Stage,Path,0)),
      kb_cache:remove_if_exists(Stage)).
read_search(Path,Info,Header,search(Files,Rows)) :-
    crypto_file_hash(Path,Hash,[algorithm(sha256),encoding(octet)]),
    (Hash==Info.digest->true;throw(error(invalid_catalog_search(Path),_))),
    current_prolog_flag(version_data,Version),current_prolog_flag(arch,Arch),
    (setup_call_cleanup(open(Path,read,S,[type(binary)]),
       (fast_read(S,Payload),ground(Payload),acyclic_term(Payload),
        Payload=catalog_search(1,Version,Arch,Header.revision,Header.taxonomy,Files,Rows),
        fast_read(S,search_end(Header.termCount)),at_end_of_stream(S),
        length(Files,Header.fileCount),length(Rows,Header.termCount),
        maplist(atom,Files),valid_rows(Rows,Header.fileCount)),close(S))->true;
      throw(error(invalid_catalog_search(Path),_))).
valid_rows([],_).
valid_rows([s(Key,Mask,Files)|Rows],Count) :-
    atom(Key),integer(Mask),Mask>=0,Mask=<511,
    valid_ordinals(Files,-1,Count),valid_rows(Rows,Count).
valid_ordinals([],_,_).
valid_ordinals([N|Rest],Before,Count) :-
    integer(N),N>Before,N<Count,valid_ordinals(Rest,N,Count).
search_status(Header,Status) :-
    (get_dict(search,Header,Info),exists_file(Info.path),
       size_file(Info.path,Info.sizeBytes)->
       Status=json{available:true,schema:Info.schema,sizeBytes:Info.sizeBytes};
       Status=json{available:false,state:pending}).
search_model(Header,Search) :-
    (get_dict(search,Header,Info)->true;throw(error(catalog_search_pending,_))),
    kb_catalog_index:file_stamp(Info.path,Stamp),
    Cache=cache(Info.path,Stamp,Info.digest,Header.revision,Header.taxonomy,Search),
    (nb_current(powder_catalog_compact_search,Cache)->true;
      read_search(Info.path,Info,Header,Search),nb_linkval(powder_catalog_compact_search,Cache)).
search_page(Header,Options,Active,Keys,Total,Projection) :-
    search_model(Header,Projection),Projection=search(Files,Rows),
    active_ordinals(Files,Active,Loaded),
    downcase_atom(Options.q,Query),public_group(Options.group,Group),
    (Group==all->Mask=0;group_number(Group,N),Mask is 1<<N),
    Filter=filter(Header.revision,Header.taxonomy,Options.scope,Mask,Query,Loaded),
    (Options.scope==all,Mask=:=0,Query==''->
       kb_catalog_index:page(Rows,Options.offset,Options.limit,Selected,Total),
       maplist(row_key,Selected,Keys)
    ;(nb_current(powder_catalog_compact_matches,cache(Filter,Matches))->true;
       findall(Key,(member(s(Key,Bits,Members),Rows),
         (Mask=:=0;Bits /\ Mask=\=0),
         (Query==''->true;once(sub_atom_icasechk(Key,_,Query))),
         scope_matches(Options.scope,Members,Loaded)),Matches),
       nb_linkval(powder_catalog_compact_matches,cache(Filter,Matches))),
     kb_catalog_index:page(Matches,Options.offset,Options.limit,Keys,Total)).
row_key(s(Key,_,_),Key).
active_ordinals(Files,Active,Loaded) :-
    findall(N,(nth0(N,Files,Key),get_assoc(Key,Active,_)),Loaded).
scope_matches(all,_,_).
scope_matches(loaded,Files,Loaded) :- once((member(N,Files),ord_memberchk(N,Loaded))).
scope_matches(unloaded,Files,Loaded) :- once((member(N,Files),\+ord_memberchk(N,Loaded))).
