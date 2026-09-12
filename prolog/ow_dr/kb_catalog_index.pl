:- module(kb_catalog_index,
    [refresh_catalog/2,catalog_status/1,catalog_search/4,catalog_term/5,
     catalog_assertion/3,catalog_paths/2,source_catalog/2,build_source_data/5]).
:- use_module(kb_paths).
:- use_module(kb_catalog,[directory_manifest/3,authorize_sources/2]).
:- use_module(kb_cache,[]).
:- use_module(kb_compile,[]).
:- use_module(kb_index,[]).
:- use_module(kb_non_atomic,[]).
:- use_module(kb_inventory,[declaration_target/4]).
:- use_module(kb_inventory_rules,[]).
:- use_module(kb_file_dependencies,[]).
:- use_module(kb_terms).
:- use_module(library(assoc)).
:- use_module(library(apply)).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(thread)).
:- dynamic loaded_catalog/3.

/** <module> Persistent catalog of compact per-source semantic locators.

This module never consults KB data, runs KB bodies, or changes the active store.
Sources must already have validated compiler/index companions. A missing, busy,
stale or failed source remains in the expected manifest and prevents completeness.
Each source artifact stores identities, sentence locators and structural paths,
not copies of formulas. Formula detail seeks its validated normalized clause.
*/

schema(powder_catalog_v1).
catalog_paths(Catalog,Progress) :-
    repo_root(Root),directory_file_path(Root,'tmp/catalog',Directory),
    directory_file_path(Directory,'terms.data',Catalog),
    directory_file_path(Directory,'progress.data',Progress).
source_path(Source,Path) :- cache_source_base(Source,Base),atom_concat(Base,'.catalog.data',Path).

refresh_catalog(Selection,Report) :-
    directory_manifest('KBs',_,Manifest),pairs_keys(Manifest,Expected),
    (Selection==all->Paths=Expected;must_be(list,Selection),sort(Selection,Paths)),
    authorize_sources(Paths,Absolute),
    catalog_paths(File,Progress),file_directory_name(File,Directory),make_directory_path(Directory),
    atom_concat(File,'.lock',LockFile),kb_cache:try_lock(LockFile,Lock),
    (Lock==busy->throw(error(catalog_busy,_));true),
    setup_call_cleanup(true,refresh_locked(Expected,Absolute,File,Progress,Report),kb_cache:release_lock(Lock)).
refresh_locked(Expected,Sources,File,Progress,Report) :-
    statistics(walltime,[Start,_]),length(Expected,Total),empty_assoc(Empty),
    kb_compile:implementation_hash(Implementation),
    flag(powder_catalog_completed,_,0),
    write_progress(Progress,json{phase:catalog,completed:0,total:Total,expected:Expected}),
    maplist(refresh_task(Implementation,Progress,Start,Total),Sources,Results,Goals),
    current_prolog_flag(stack_limit,StackLimit),
    (Goals==[]->true;concurrent(4,Goals,[stack_limit(StackLimit)])),
    foldl(merge_source,Results,work([],Empty,0),work(Reversed,Terms,Completed)),
    reverse(Reversed,Files),findall(P,(member(F,Files),P=F.path),Covered),
    findall(json{path:P,status:pending,message:"Not included in this refresh."},
      (member(P,Expected),\+memberchk(P,Covered)),Pending),
    append(Files,Pending,All),coverage(All,Coverage),get_time(At),
    schema(Schema),assoc_to_list(Terms,TermPairs),
    Snapshot=catalog{schema:Schema,expected:Expected,files:All,terms:TermPairs,
      coverage:Coverage,verifiedAt:At,sourcePolicy:original_sha256,normalizedPolicy:validated_payload_digest},
    atomic_data(File,catalog_snapshot(Snapshot)),retractall(loaded_catalog(_,_,_)),
    length(TermPairs,UniqueTerms),
    statistics(walltime,[End,_]),Seconds is (End-Start)/1000,
    Report=Coverage.put(json{completed:Completed,terms:UniqueTerms,seconds:Seconds}),
    write_progress(Progress,Report).

refresh_task(Implementation,Progress,Start,Total,Source,Result,
    kb_catalog_index:refresh_source(Implementation,Progress,Start,Total,Source,Result)).
refresh_source(Implementation,Progress,Start,Total,Source,result(Result,Terms)) :-
    public_path(Source,Public),
    source_progress(Progress,Start,Total,Public,indexing,false),
    catch((once(kb_compile:with_prepared_source(Source,Implementation,
            kb_catalog_index:source_catalog(Source,Data)))->source_summary(Public,Data,Result),
          findall(t(K,S,O,C,D,R,[]),member(t(K,S,O,C,D,R,_),Data.terms),Terms)
          ;throw(error(catalog_source_index_failed(Public),_))),
      Error,(error_source(Public,Error,Result),Terms=[])),
    source_progress(Progress,Start,Total,Public,Result.status,true),
    (Result.status==fresh->true;
     format(user_error,'CATALOG ~w: ~w: ~w~n',[Result.status,Public,Result.message]),flush_output(user_error)).
source_progress(Progress,Start,Total,Path,Status,Completed) :-
    with_mutex(powder_catalog_progress,
      ((Completed==true->flag(powder_catalog_completed,Before,Before+1),N is Before+1
       ;flag(powder_catalog_completed,N,N)),
      statistics(walltime,[Now,_]),Elapsed is (Now-Start)/1000,
      write_progress(Progress,json{phase:catalog,completed:N,total:Total,path:Path,
        status:Status,elapsed:Elapsed,workers:4}))).
merge_source(result(Result,Entries),work(Files,T0,N),work([Result|Files],T,N1)) :-
    foldl(add_global(Result.path),Entries,T0,T),N1 is N+1.

error_source(Path,error(catalog_source_busy,_),json{path:Path,status:busy,message:"Compiler owns this source."}) :- !.
error_source(Path,error(catalog_stale(Reason),_),json{path:Path,status:stale,message:Text}) :- !,
    term_string(Reason,Text).
error_source(Path,Error,json{path:Path,status:failed,message:Text}) :- message_to_string(Error,Text).

source_catalog(Input,Data) :-
    absolute_file_name(Input,Source,[access(read)]),cache_paths(Source,Normal,IndexFile),
    file_directory_name(Normal,Directory),make_directory_path(Directory),
    atom_concat(Normal,'.lock',LockFile),kb_cache:try_lock(LockFile,Lock),
    (Lock==busy->throw(error(catalog_source_busy,_));true),
    setup_call_cleanup(true,source_catalog_locked(Source,Normal,IndexFile,Data),kb_cache:release_lock(Lock)).
source_catalog_locked(Source,Normal,IndexFile,Data) :-
    peek_header(Normal,Recorded),
    kb_compile:cache_identity(Source,Recorded.options,CompilerIdentity),
    (kb_compile:identity_matches(CompilerIdentity,Recorded)->true;
     throw(error(catalog_stale(compiler_identity),_))),
    SourceHash=CompilerIdentity.sourceHash,Size=CompilerIdentity.sizeBytes,time_file(Source,Modified),
    crypto_file_hash(Source,RawSourceHash,[algorithm(sha256),encoding(octet)]),
    crypto_file_hash(Normal,NormalHash,[algorithm(sha256)]),
    crypto_file_hash(IndexFile,IndexHash,[algorithm(sha256)]),
    source_path(Source,Cache),schema(Schema),
    Identity=identity{schema:Schema,source:Source,sourceHash:SourceHash,normalizedHash:NormalHash,
      compiler:CompilerIdentity,indexHash:IndexHash,normalizedDigest:Recorded.normalizedDigest},
    file_stamp(Normal,NormalStamp),
    (saved_source(Cache,Identity,Saved)->
      Data=Saved.put(json{sizeBytes:Size,modified:Modified,normalizedStamp:NormalStamp,
        rawSourceHash:RawSourceHash})
    ;kb_cache:read_cache(Normal,Header,Records),
     (kb_compile:identity_matches(CompilerIdentity,Header),
      Header.normalizedDigest==Recorded.normalizedDigest->true;
       throw(error(catalog_stale(companion_identity),_))),
     clause_offsets(Normal,Offsets),
     build_source_data(Source,Header,Records,Offsets,Payload),
     Data=Payload.put(json{identity:Identity,sizeBytes:Size,modified:Modified,rawSourceHash:RawSourceHash,
       normalized:Normal,normalizedStamp:NormalStamp}),
     crypto_file_hash(Source,After,[algorithm(sha256)]),
     (After==SourceHash->true;throw(error(catalog_stale(source_changed_during_index),_))),
     atomic_data(Cache,source_catalog(Data))),
    kb_cache:file_digest(Source,FinalHash),
    (FinalHash==SourceHash->true;throw(error(catalog_stale(source_changed_during_index),_))).

peek_header(File,Header) :-
    setup_call_cleanup(open(File,read,S,[encoding(utf8),newline(posix)]),
     (kb_cache:read_line_term(S,_,_),kb_cache:read_line_term(S,kb_cache_header(Header),_)),
     close(S)),
    (ground(Header),is_dict(Header),is_list(Header.options)->true;
     throw(error(invalid_cache_header(File),_))).
saved_source(File,Identity,Data) :-
    exists_file(File),
    catch(read_data(File,source_catalog(Data)),error(Form,Context),
     (message_to_string(error(Form,Context),Message),
      format(user_error,'CATALOG rebuilding invalid artifact ~w: ~w~n',[File,Message]),
      flush_output(user_error),fail)),
    Data.identity==Identity.
clause_offsets(File,Offsets) :-
    setup_call_cleanup(open(File,read,S,[encoding(utf8),newline(posix)]),
     read_offsets(S,Pairs),close(S)),keysort(Pairs,Sorted),list_to_assoc(Sorted,Offsets),
    assoc_to_keys(Offsets,Ids),(same_length(Ids,Pairs)->true;throw(error(duplicate_catalog_ids,_))).
read_offsets(S,Pairs) :-
    at_end_of_stream(S),!,Pairs=[].
read_offsets(S,Pairs) :-
    stream_property(S,position(Position)),stream_position_data(byte_count,Position,Offset),
    kb_cache:read_line_term(S,Term,_),
    (clause_identity(Term,Id)->Pairs=[Id-Offset|Rest];Pairs=Rest),
    read_offsets(S,Rest).
clause_identity((_:-Guard),Id) :-
    nonvar(Guard),Guard=..[Name,Id|_],memberchk(Name,[x_cid,x_cid_io]),kb_cache:valid_assertion_id(Id).

build_source_data(Source,Header,Records,Offsets,Data) :-
    findall(S,member(record(_,S,_),Records),Semantics),kb_non_atomic:term_schema(Semantics,Schema),
    findall(Sentence,(nth1(N,Records,Record),sentence_entry(N,Record,Offsets,Sentence)),Sentences),
    findall(Key-Hit,(nth1(N,Records,Record),record_hit(Record,Schema,Key,Path,Role,Facet),
      Hit=h(N,Path,Role,Facet)),Hits0),
    sort(Hits0,Hits),group_pairs_by_key(Hits,Groups),
    maplist(term_summary,Groups,Terms),
    kb_file_dependencies:analyze_records(Source,Header,Records,Dependencies),
    compact_dependencies(Dependencies,DependencySummary),
    findall(a(N,Head,Arity,Path),
      (nth1(N,Records,record(_,Semantic,_)),kb_non_atomic:positive_fact(Semantic,Fact,Path),
      compound_name_arity(Fact,Head,Arity)),Applications),
    findall(c(Kind,Subject,Value,N,Path),
      (nth1(N,Records,record(_,Semantic,_)),kb_non_atomic:positive_fact(Semantic,Fact,Path),
      schema_claim(Fact,Kind,Subject,Value)),Claims),
    public_path(Source,Public),
    Data=source{path:Public,sentences:Sentences,terms:Terms,dependencies:DependencySummary,
      claims:Claims,applications:Applications,termSchema:Schema,
      dialect:Header.dialect,assertionCount:Header.count,
      typeCoverage:source_local_explicit_evidence}.

schema_claim(x_isa(S,T),isa,Subject,Type) :- entity_key(S,Subject),entity_key(T,Type).
schema_claim(x_genls(S,T),genls,Subject,Type) :- entity_key(S,Subject),entity_key(T,Type).
schema_claim(x_genlPreds(S,T),genlPreds,Subject,Type) :- entity_key(S,Subject),entity_key(T,Type).
schema_claim(Fact,argIsa,Predicate,slot(N,Type)) :-
    kb_non_atomic:formula_signature(Fact,Predicate,N),
    Fact=..[_|Args],last(Args,T),entity_key(T,Type).
schema_claim(x_argIsa(P,N,T),target_slot,Predicate,slot(N,Type)) :-
    entity_key(P,Predicate),integer(N),N>0,entity_key(T,Type).
entity_key(Term,Key) :-
    ground(Term),
    (atom(Term),atom_concat(x_,_,Term)->Key=Term
    ;compound(Term),\+is_list(Term),\+is_dict(Term),kb_non_atomic:non_atomic_key(Term,Key)).

sentence_entry(N,record(Id,_,Metadata),Offsets,s(N,Id,Line,Context,Names,Offset)) :-
    memberchk(xc_source_line(Id,Line),Metadata),memberchk(xc_microtheory(Id,Mt),Metadata),
    memberchk(xc_kb_names(Id,Names),Metadata),context_key(Mt,Context),
    get_assoc(Id,Offsets,Offset).

record_hit(record(_,Semantic,_),Schema,Key,Path,Role,semantic) :-
    kb_index:semantic_constants(Semantic,Constants),
    kb_non_atomic:semantic_position(Semantic,Schema,Term,Position),
    Path=Position.path,Role=Position.kind,
    (atom(Term),memberchk(Term,Constants)->Key=Term
    ;ground(Term),kb_non_atomic:denoting_position(Term,Position,Schema,_),
     kb_non_atomic:non_atomic_key(Term,Key)).
record_hit(record(Id,_,Metadata),_,Key,[],microtheory_context,context) :-
    memberchk(xc_microtheory(Id,Mt),Metadata),
    entity_key(Mt,Key).
record_hit(record(_,Semantic,_),_,Key,Path,definition,definition) :-
    kb_non_atomic:positive_fact(Semantic,Fact,Before),
    definition_subject(Fact,Subject),
    entity_key(Subject,Key),append(Before,[args,0],Path).
definition_subject(Fact,Subject) :- declaration_target(Fact,Subject,_,_),!.
definition_subject(Fact,Subject) :-
    compound(Fact),Fact=..[Name,Subject,_],
    memberchk(Name,[x_isa,x_genls,x_genlPreds,x_genlMt,x_defnIff,x_defnNecessary,x_defnSufficient]),
    nonvar(Subject).

term_summary(Key-Hits,t(Key,SemanticCount,OccurrenceCount,ContextCount,Definitions,Roles,Hits)) :-
    findall(N,member(h(N,_,_,semantic),Hits),Ns),sort(Ns,Ids),length(Ids,SemanticCount),
    findall(1,member(h(_,_,_,semantic),Hits),Occurrences),length(Occurrences,OccurrenceCount),
    findall(N,member(h(N,_,_,context),Hits),Cs),sort(Cs,CIds),length(CIds,ContextCount),
    findall(N,member(h(N,_,_,definition),Hits),Ds),sort(Ds,Definitions),
    findall(R,member(h(_,_,R,_),Hits),Rs),sort(Rs,Roles).

compact_dependencies(Info,dependencies{coverage:Info.coverage,status:Info.status,
      reasons:Info.reasons,defined:Defined,declared:Declared,referenced:Referenced,outbound:Outbound,
      unresolved:Info.symbols.unresolved,microtheories:Info.microtheories}) :-
    compact_symbol_list(Info.symbols.defined,Defined),
    compact_symbol_list(Info.symbols.declared,Declared),
    compact_symbol_list(Info.symbols.referenced,Referenced),
    compact_symbol_list(Info.symbols.outbound,Outbound).
compact_symbol_list(null,null) :- !.
compact_symbol_list(Items,Compact) :- maplist(compact_symbol,Items,Compact).
compact_symbol(Item,symbol(Item.symbol,Item.arities,Item.roles,Item.polarities,Evidence)) :-
    findall(e(Id,Line,Role,Polarity),
      (member(E,Item.evidence),get_dict(id,E,Id),get_dict(line,E,Line),
       (get_dict(role,E,Role)->true;Role=unknown),
       (get_dict(polarity,E,Polarity)->true;Polarity=unknown)),Evidence).

source_summary(Path,Data,Summary) :-
    source_path_from_public(Path,Cache),
    length(Data.terms,Terms),
    Summary=json{path:Path,status:fresh,identity:Data.identity,cache:Cache,
      assertions:Data.assertionCount,terms:Terms,sizeBytes:Data.sizeBytes,
      rawSourceHash:Data.rawSourceHash,
      modified:Data.modified,normalized:Data.normalized,normalizedStamp:Data.normalizedStamp}.
source_path_from_public(Path,Cache) :- repo_root(Root),
    directory_file_path(Root,Path,Source),source_path(Source,Cache).
add_global(Source,t(Key,Sentences,Occurrences,Contexts,Definitions,Roles,_),Before,After) :-
    length(Definitions,DefinitionCount),
    Entry=f(Source,Sentences,Occurrences,Contexts,DefinitionCount,Roles),
    (get_assoc(Key,Before,Old)->Values=[Entry|Old];Values=[Entry]),
    put_assoc(Key,Before,Values,After).
coverage(Files,Report) :-
    length(Files,Total),include(fresh_source,Files,Fresh),length(Fresh,N),
    findall(F,(member(F,Files),F.status\==fresh),Issues),
    (N=:=Total->Complete=true;Complete=false),
    Report=json{expectedFiles:Total,freshFiles:N,complete:Complete,issues:Issues}.
fresh_source(F) :- F.status==fresh.

atomic_data(File,Term) :-
    validate_payload(Term),
    file_directory_name(File,Directory),make_directory_path(Directory),
    kb_cache:stage_path(File,Stage),
    setup_call_cleanup(true,
      (kb_cache:terms_digest([Term],Digest),
       setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
         (kb_cache:write_one_line(S,catalog_header(1)),
          kb_cache:write_one_line(S,Term),kb_cache:write_one_line(S,catalog_footer(Digest)),
          flush_output(S)),close(S)),
      read_data(Stage,Term),install_catalog_stage(Stage,File,0)),
      kb_cache:remove_if_exists(Stage)).
install_catalog_stage(Stage,File,Attempt) :-
    catch(kb_cache:install_stage(Stage,File),
      error(permission_error(rename,file,Blocked),Context),
      (current_prolog_flag(windows,true),exists_file(Stage),Attempt<20->
        (Attempt=:=0->format(user_error,'CATALOG waiting for native file replacement: ~w~n',[File]),
                      flush_output(user_error);true),
        sleep(0.1),Next is Attempt+1,install_catalog_stage(Stage,File,Next)
      ;throw(error(permission_error(rename,file,Blocked),Context)))).
read_data(File,Term) :-
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
      (safe_term(S,catalog_header(1)),safe_term(S,Term),safe_term(S,catalog_footer(Digest)),
       read_term(S,end_of_file,[]),kb_cache:terms_digest([Term],Digest),
       validate_payload(Term)),close(S)),!.
read_data(File,_) :- throw(error(invalid_catalog_file(File),_)).
safe_term(S,Term) :-
    read_term(S,Term,[syntax_errors(error),double_quotes(string),cycles(false),quasi_quotations(Q)]),
    (Q==[],ground(Term),acyclic_term(Term)->true;throw(error(invalid_catalog_term,_))).
file_stamp(File,stamp(Size,Time)) :- size_file(File,Size),time_file(File,Time).
write_progress(File,Data) :- atomic_data(File,catalog_progress(Data)).

validate_payload(Term) :-
    (ground(Term),acyclic_term(Term),valid_payload(Term)->true;
     throw(error(invalid_catalog_payload,_))).
valid_payload(catalog_progress(Data)) :- is_dict(Data).
valid_payload(catalog_query(Data)) :-
    is_dict(Data,query_catalog),Data.schema==catalog_query_v1,
    is_assoc(Data.terms),is_assoc(Data.postings),is_assoc(Data.files),
    is_list(Data.ranked),assoc_to_keys(Data.terms,Keys),sort(Data.ranked,Keys),
    same_length(Keys,Data.ranked),is_dict(Data.coverage).
valid_payload(catalog_snapshot(Data)) :-
    is_dict(Data,catalog),schema(Data.schema),is_list(Data.expected),
    maplist(atom,Data.expected),is_list(Data.files),is_list(Data.terms),
    coverage(Data.files,Coverage),Coverage==Data.coverage,
    findall(P,(member(F,Data.files),P=F.path),Paths),
    sort(Paths,Sorted),sort(Data.expected,Sorted),same_length(Paths,Sorted).
valid_payload(source_catalog(Data)) :-
    is_dict(Data,source),is_dict(Data.identity,identity),schema(Data.identity.schema),
    atom(Data.path),integer(Data.assertionCount),Data.assertionCount>=0,
    length(Data.sentences,Data.assertionCount),
    maplist(valid_sentence,Data.sentences),
    findall(N,member(s(N,_,_,_,_,_),Data.sentences),Numbers),
    (Data.assertionCount=:=0->Expected=[];numlist(1,Data.assertionCount,Expected)),Numbers==Expected,
    findall(Id,member(s(_,Id,_,_,_,_),Data.sentences),Ids),
    sort(Ids,UniqueIds),same_length(Ids,UniqueIds),
    maplist(valid_term_entry(Data.assertionCount),Data.terms),
    findall(Key,member(t(Key,_,_,_,_,_,_),Data.terms),Keys),sort(Keys,Keys),
    ground(Data.claims),ground(Data.applications).
valid_sentence(s(N,Id,Line,Mt,Names,Offset)) :-
    integer(N),N>0,kb_cache:valid_assertion_id(Id),integer(Line),Line>0,
    atom(Mt),is_list(Names),maplist(string,Names),integer(Offset),Offset>=0.
valid_term_entry(Count,Entry) :-
    Entry=t(Key,_,_,_,_,_,Hits),atom(Key),is_list(Hits),
    maplist(valid_hit(Count),Hits),
    term_summary(Key-Hits,Expected),Expected==Entry.
valid_hit(Count,h(N,Path,Role,Facet)) :-
    integer(N),between(1,Count,N),is_list(Path),atom(Role),
    memberchk(Facet,[semantic,definition,context]).

catalog_status(Reply) :-
    catalog_paths(File,ProgressFile),
    (exists_file(File)->read_catalog(Catalog),
       Base=Catalog.coverage.put(json{verifiedAt:Catalog.verifiedAt,
         freshness:explicit_refresh_snapshot});
      Base=json{complete:false,freshFiles:0,expectedFiles:null,issues:[]}),
    (exists_file(ProgressFile)->read_data(ProgressFile,catalog_progress(P));P=null),
    Reply=Base.put(progress,P).
read_catalog(Catalog) :-
    catalog_paths(File,_),file_stamp(File,Stamp),
    (loaded_catalog(File,Stamp,Catalog)->true;
     read_data(File,catalog_snapshot(Catalog)),
     retractall(loaded_catalog(_,_,_)),assertz(loaded_catalog(File,Stamp,Catalog))).

catalog_search(Query,Offset,Limit,Reply) :-
    page_bounds(Offset,Limit),read_catalog(Catalog),text_atom(Query,Q),downcase_atom(Q,Lower),
    findall(json{term:Key,files:FileCount,sentences:Sentences,occurrences:Occurrences,definitions:Definitions},
      (member(Key-Entries,Catalog.terms),downcase_atom(Key,Search),sub_atom(Search,_,_,_,Lower),
       length(Entries,FileCount),global_counts(Entries,Sentences,Occurrences,Definitions)),All),
    page(All,Offset,Limit,Items,Total),
    Reply=json{items:Items,total:Total,offset:Offset,limit:Limit,coverage:Catalog.coverage}.
global_counts(Entries,S,O,D) :-
    findall(N,member(f(_,N,_,_,_,_),Entries),Ss),sum_list(Ss,S),
    findall(N,member(f(_,_,N,_,_,_),Entries),Os),sum_list(Os,O),
    findall(N,member(f(_,_,_,_,N,_),Entries),Ds),sum_list(Ds,D).
catalog_term(Input,Facet,Offset,Limit,Reply) :-
    page_bounds(Offset,Limit),text_atom(Input,Key),
    (memberchk(Facet,[semantic,definition,context])->true;domain_error(occurrence_facet,Facet)),
    read_catalog(Catalog),
    (memberchk(Key-Entries,Catalog.terms)->true;Entries=[]),
    findall(Row,(member(f(Source,_,_,_,_,_),Entries),matching_source(Catalog,Source,Key,Facet,Row)),Rows),
    page(Rows,Offset,Limit,Items,Total),
    Reply=json{term:Key,facet:Facet,items:Items,total:Total,offset:Offset,limit:Limit,coverage:Catalog.coverage}.
matching_source(Catalog,Source,Key,Facet,Row) :-
    member(File,Catalog.files),File.path==Source,File.status==fresh,
    current_source(File),read_data(File.cache,source_catalog(Data)),
    memberchk(t(Key,_,_,_,_,_,Hits),Data.terms),member(h(N,Path,Role,Facet),Hits),
    memberchk(s(N,Id,Line,Mt,_,_),Data.sentences),
    Row=json{id:Id,source:Source,line:Line,mt:Mt,path:Path,role:Role}.
current_source(File) :-
    repo_root(Root),directory_file_path(Root,File.path,Path),
    crypto_file_hash(Path,Hash,[algorithm(sha256)]),
    (Hash==File.identity.sourceHash->true;throw(error(catalog_stale(File.path),_))),
    (get_dict(rawSourceHash,File,ExpectedRaw)->
       crypto_file_hash(Path,RawHash,[algorithm(sha256),encoding(octet)]),
       (RawHash==ExpectedRaw->true;throw(error(catalog_stale(File.path),_)));true),
    crypto_file_hash(File.normalized,NormalHash,[algorithm(sha256)]),
    (NormalHash==File.identity.normalizedHash->true;throw(error(catalog_stale(normalized(File.path)),_))).

catalog_assertion(Source,Id,Reply) :-
    read_catalog(Catalog),member(File,Catalog.files),File.path==Source,File.status==fresh,!,
    current_source(File),read_data(File.cache,source_catalog(Data)),
    memberchk(s(_,Id,Line,Mt,Names,Offset),Data.sentences),
    setup_call_cleanup(open(Data.normalized,read,S,[encoding(utf8),newline(posix)]),
      (seek(S,Offset,bof,_),kb_cache:read_line_term(S,Clause,_)),close(S)),
    clause_identity(Clause,Id),Clause=(Head:-Guard),
    (Guard=..[x_cid|_]->Semantic=Head;Guard=x_cid_io(_,Body,_,_),Semantic=(Head:-Body)),
    kb_non_atomic:annotated_semantic_ast(Semantic,Names,Data.termSchema,Expression),
    context_from_key(Mt,Context),kb_non_atomic:annotated_context_ast(Context,MtExpression),
    Reply=json{id:Id,source:Source,line:Line,mt:Mt,mtExpression:MtExpression,names:Names,
      expression:Expression,origin:validated_normalized_cache}.
catalog_assertion(Source,Id,_) :- throw(error(existence_error(catalog_assertion,Source-Id),_)).
text_atom(T,A) :- (atom(T)->A=T;string(T)->atom_string(A,T);type_error(text,T)).
page_bounds(O,L) :- must_be(nonneg,O),must_be(between(1,200),L).
page(All,O,L,Items,Total) :-
    length(All,Total),Skip is min(O,Total),length(Prefix,Skip),append(Prefix,Tail,All),
    Count is min(L,Total-Skip),length(Items,Count),append(Items,_,Tail).
