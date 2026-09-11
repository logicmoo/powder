:- module(kb_statistics, [source_statistics/2, source_statistics_detail/6,
                          microtheory_statistics/5, directory_statistics/3,
                          source_predicate_arities/6, microtheory_predicate_arities/5,
                          source_dependencies/5, selected_statistics/4]).
:- use_module(kb_catalog, [authorize_statistics/2, authorize_microtheory_files/2, directory_manifest/3]).
:- use_module(kb_paths, [public_path/2, repo_root/1,cache_paths/3]).
:- use_module(kb_file_dependencies,[file_dependencies/2]).
:- use_module(kb_terms, [context_from_key/2,term_ast/3]).
:- use_module(library(http/json)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(time)).
:- use_module(library(assoc)).
:- use_module(library(terms)).
:- use_module(library(ordsets)).
:- use_module(library(uuid)).
:- use_module(library(crypto)).
:- dynamic summary_cache/4.
:- dynamic mt_catalog_cache/3, mt_snapshot_cache/5.
:- dynamic membership_cache/5, directory_job/8.

projection_version(2).

% Explicit Properties requests only: never run this during catalog enumeration.
source_dependencies(Path,Section,Offset,Limit,Reply) :-
    bounded_paths([Path]),must_be(atom,Section),must_be(integer,Offset),must_be(integer,Limit),
    (memberchk(Section,[summary,defined,declared,predicate_references,outbound_predicates,
                       provided_mts,referenced_mts,outbound_mts,unresolved])->true;
      throw(error(domain_error(dependency_section,Section),_))),
    (Offset>=0,Limit>=1,Limit=<100->true;
      throw(error(domain_error(statistics_pagination,Offset-Limit),_))),
    kb_catalog:file_information([Path],Admission),Admission.items=[File],
    dependency_snapshot(File,Info),
    dependency_summary(File.path,Info,Summary),
    dependency_set(Section,Info,Rows),
    (is_list(Rows)->slice(Rows,Offset,Limit,Selected,Total),
      maplist(dependency_row(Section),Selected,Items)
    ;Total=null,Items=[]),
    Reply=_{path:File.path,summary:Summary,section:Section,items:Items,
      total:Total,offset:Offset,limit:Limit,generation:Admission.generation}.

dependency_snapshot(File,Info) :-
    (File.states.cached==true->
      repo_root(Root),absolute_file_name(File.path,Source,[relative_to(Root),access(none)]),
      cache_paths(Source,Cache,_),
      catch((size_file(Cache,Bytes),
        (Bytes=<67108864->call_with_time_limit(15,file_dependencies(Source,Info));
          dependency_unavailable(cache_read_limit,"The normalized cache exceeds the 64 MiB Properties read limit.",Info))),
        Error,(message_to_string(Error,Message),dependency_unavailable(dependency_read_failed,Message,Info)))
    ;File.states.cached==false->
      dependency_unavailable(cache_missing,"No normalized data cache is present. Nothing was compiled or loaded.",Info)
    ;dependency_unavailable(cache_unavailable,"The data artifact could not be authorized as a safe regular file.",Info)).
dependency_unavailable(Code,Message,
    _{schema:'powder.file-dependencies.v1',status:unavailable,source:_{dialect:unknown},cache:null,
      reasons:[_{code:Code,message:Message}],
      coverage:_{records:unknown,definitions:unknown,references:unknown,contexts:unknown,microtheories:unknown},
      symbols:_{defined:null,declared:null,referenced:null,outbound:null,unresolved:null},
      microtheories:_{provided:null,referenced:null,outbound:null,
        missingImplied:_{candidate:null,status:unknown,scope:cached_assertion_contexts,contentAssertions:null}}}).
dependency_summary(Path,Info,Summary) :-
    findall(Section-Count,
      (member(Section,[defined,declared,predicate_references,outbound_predicates,provided_mts,referenced_mts,outbound_mts,unresolved]),
       dependency_set(Section,Info,Values),(is_list(Values)->length(Values,Count);Count=null)),Counts0),
    dict_pairs(Counts,counts,Counts0),
    field_value(Info.source,dialect,unknown,Dialect),
    Implied0=Info.microtheories.missingImplied,
    (text(Implied0.candidate)->mt_expression(Implied0.candidate,Expression);Expression=null),
    Summary=_{schema:Info.schema,path:Path,status:Info.status,coverage:Info.coverage,counts:Counts,
      dialect:Dialect,reasons:Info.reasons,cache:Info.cache,
      impliedMT:Implied0.put(mtExpression,Expression)}.
dependency_set(summary,_,null).
dependency_set(defined,I,I.symbols.defined).
dependency_set(declared,I,I.symbols.declared).
dependency_set(predicate_references,I,I.symbols.referenced).
dependency_set(outbound_predicates,I,I.symbols.outbound).
dependency_set(provided_mts,I,I.microtheories.provided).
dependency_set(referenced_mts,I,I.microtheories.referenced).
dependency_set(outbound_mts,I,I.microtheories.outbound).
dependency_set(unresolved,I,I.symbols.unresolved).
dependency_row(unresolved,Raw,Row) :- !,dependency_evidence(Raw,Row).
dependency_row(_,Raw,Row) :-
    field_value(Raw,evidence,[],Evidence0),take(12,Evidence0,First),
    maplist(dependency_evidence,First,Evidence),
    (get_dict(symbol,Raw,Symbol)->
      length(Raw.arities,ArityCount),take(32,Raw.arities,Arities),
      Row=_{symbol:Symbol,arities:Arities,arityCount:ArityCount,roles:Raw.roles,
        polarities:Raw.polarities,evidenceCount:Raw.evidenceCount,evidence:Evidence}
    ;mt_expression(Raw.key,Expression),
      Row=_{key:Raw.key,mtExpression:Expression,evidenceCount:Raw.evidenceCount,evidence:Evidence}).
dependency_evidence(Raw,Row) :-
    field_value(Raw,sourceFile,"",Source),source_reference(Source,Reference),
    findall(Key-Value,(member(Key,[id,line,role,polarity,kind,arity,via,position]),
      get_dict(Key,Raw,Value)),Pairs),
    dict_pairs(Fields,evidence,Pairs),
    field_value(Raw,variableNames,[],Names),length(Names,Count),take(32,Names,Sample),
    (get_dict(canonical,Raw,Canonical)->format(string(Text),'~w',[Canonical]),
      string_length(Text,N),Length is min(N,512),sub_string(Text,0,Length,_,Preview)
    ;Preview=null),
    Row=Fields.put(_{path:Reference.path,recordedPath:Source,variableNames:Sample,
      variableNameCount:Count,canonical:Preview}).

% This is a read-only projection of inventory snapshots, not an inventory
% generator. In particular, recorded KIF names have already been translated.
source_statistics(Paths,_{items:Items}) :-
    bounded_paths(Paths),authorize_statistics(Paths,Entries),
    maplist(entry_summary,Entries,Items).

source_statistics_detail(Path,Section,Mt,Offset,Limit,Reply) :-
    bounded_paths([Path]),
    (source_statistics_section(Section)->true;
      throw(error(domain_error(statistics_section,Section),_))),
    must_be(integer,Offset),must_be(integer,Limit),
    (Offset>=0,Limit>=1,Limit=<100->true;
      throw(error(domain_error(statistics_pagination,Offset-Limit),_))),
    authorize_statistics([Path],[Entry]),
    entry_detail(Entry,Section,Mt,Offset,Limit,Reply).

source_statistics_section(Section) :- memberchk(Section,[content,references,predicates]), !.
source_statistics_section(arities(Symbol)) :- statistics_symbol(Symbol).
statistics_symbol(Symbol) :-
    must_be(atom,Symbol),atom_length(Symbol,N),
    (N>0,N=<8192->true;throw(error(domain_error(statistics_symbol,Symbol),_))).
source_predicate_arities(Path,Symbol,Mt,Offset,Limit,Reply) :-
    source_statistics_detail(Path,arities(Symbol),Mt,Offset,Limit,Data),
    Reply=Data.put(_{section:arities,symbol:Symbol}).
microtheory_predicate_arities(Mt,Symbol,Offset,Limit,Reply) :-
    microtheory_statistics(Mt,arities(Symbol),Offset,Limit,Data),
    Reply=Data.put(_{section:arities,symbol:Symbol}).

bounded_paths(Paths) :-
    must_be(list,Paths),length(Paths,N),
    (N=<16->true;throw(error(domain_error(statistics_batch_limit(16),N),_))),
    forall(member(Path,Paths),
      (text(Path),atom_string(A,Path),atom_length(A,L),
       (L=<4096->true;throw(error(domain_error(source_path_length,L),_))))).

entry_summary(Entry,Summary) :-
    entry_file(Entry,Source,Public),
    ( Entry.availability=="available" ; Entry.availability==available ), !,
    catch(read_summary(Source,Public,Summary),Error,unavailable(Public,Error,Summary)).
entry_summary(Entry,Summary) :-
    entry_file(Entry,_,Public),
    ( Entry.availability=="missing" ; Entry.availability==missing ), !,
    empty_summary(Public,missing,"No inventory snapshot is recorded for this source.",Summary).
entry_summary(Entry,Summary) :-
    entry_file(Entry,_,Public),
    empty_summary(Public,unavailable,"The inventory sidecar is not a safe regular file.",Summary).

entry_file(Entry,Source,Public) :-
    atom_string(Input,Entry.path),
    absolute_file_name(Input,Source,[access(read)]),public_path(Source,Public).

read_summary(Source,Public,Summary) :-
    inventory_identity(Source,Identity),
    ( with_mutex(kb_statistics_cache,summary_cache(Source,Identity,Summary,_)) -> true
    ; call_with_time_limit(8,
        (read_inventory(Source,Data),snapshot_summary(Source,Public,Data,Summary),
         snapshot_members(Data,Summary,Members))),
      inventory_identity(Source,After),
      (Identity==After->remember_summary(Source,Identity,Summary),remember_members(Source,Identity,Members);
       throw(error(resource_error(changing_inventory),_)))
    ).

inventory_identity(Source,by_symbol(Version,identity(Size,Time,SourceSize,SourceTime))) :-
    projection_version(Version),
    atom_concat(Source,'.inventory.json',File),
    size_file(File,Size),time_file(File,Time),
    size_file(Source,SourceSize),time_file(Source,SourceTime).
remember_summary(Source,Identity,Summary) :-
    get_time(Now),
    with_mutex(kb_statistics_cache,
      (retractall(summary_cache(Source,_,_,_)),
       assertz(summary_cache(Source,Identity,Summary,Now)),
       findall(T-S,summary_cache(S,_,_,T),Pairs),
       keysort(Pairs,Sorted),length(Sorted,N),Drop is max(0,N-256),
       length(Old,Drop),append(Old,_,Sorted),
       forall(member(_-S,Old),retractall(summary_cache(S,_,_,_))))).

entry_detail(Entry,Section,Mt,Offset,Limit,Reply) :-
    entry_file(Entry,Source,Public),
    ( (Entry.availability=="available";Entry.availability==available) ->
      catch(call_with_time_limit(8,
        (inventory_identity(Source,Before),read_inventory(Source,Data),
         snapshot_summary(Source,Public,Data,Fresh),
         (section_available(Fresh,Section)->
           detail_rows(Data,Section,Mt,Rows),slice(Rows,Offset,Limit,RawPage,Total),
           public_statistics_rows(Section,RawPage,Page)
         ;Page=[],Total=null),
         inventory_identity(Source,After),
         (Before==After->true;throw(error(resource_error(changing_inventory),_))),
         remember_summary(Source,Before,Fresh),
         snapshot_members(Data,Fresh,Members),remember_members(Source,Before,Members),
         Reply=_{summary:Fresh,section:Section,items:Page,total:Total,offset:Offset,limit:Limit})),
        Error,(unavailable(Public,Error,Failure),
          Reply=_{summary:Failure,section:Section,items:[],total:null,offset:Offset,limit:Limit}))
    ; entry_summary(Entry,Summary),
      Reply=_{summary:Summary,section:Section,items:[],total:null,offset:Offset,limit:Limit}
    ).
section_available(Summary,references) :- Summary.coverage.references\==unavailable.
section_available(Summary,content) :- Summary.counts.contentMTs\==null.
section_available(Summary,predicates) :- Summary.counts.predicateFunctions\==null.
section_available(Summary,arities(_)) :- section_available(Summary,predicates).

empty_summary(Path,State,Message,
    _{path:Path,state:State,generatedAt:null,dialect:null,recordedStatus:null,
      counts:_{assertions:null,contentMTs:null,referencedMTs:null,predicateFunctions:null},
      coverage:_{content:unavailable,references:unavailable,predicateFunctions:unavailable},
      freshness:unknown,messages:[Message] }).
unavailable(Path,Error,Summary) :-
    (Error==time_limit_exceeded->Message="Inventory reading exceeded the time budget. Retry this file.";
     Error=error(resource_error(statistics_size),_)->Message="Inventory exceeds the 64 MiB read budget.";
     Error=error(resource_error(changing_inventory),_)->Message="The source or inventory changed during reading. Retry this file.";
     Message="Inventory could not be read or validated. Its counts are unavailable."),
    empty_summary(Path,unavailable,Message,Summary).

snapshot_summary(Source,Public,Data,Summary) :-
    (field_value(Data,schema,"","powder.kb-inventory.v1")->true;
      throw(error(domain_error(inventory_schema,unknown),_))),
    source_dialect(Source,Dialect),
    field_value(Data,source,_{},RecordedSource),
    field_value(RecordedSource,dialect,"",RecordedDialect),
    (compatible_dialect(Dialect,RecordedDialect)->DialectOK=true;DialectOK=false),
    valid_contexts(Data,Contexts,ContentCoverage),
    (DialectOK==true,ContentCoverage\==unavailable->
      include(has_content,Contexts,Content),findall(K,(member(C,Content),K=C.key),Keys),
      sort(Keys,Unique),length(Unique,ContentCount),
      predicate_rows(Content,Predicates),predicate_names(Predicates,Names),length(Names,PredicateCount)
    ;ContentCount=null,PredicateCount=null),
    field_value(Data,counts,_{},Counts),
    count_field(Counts,semanticAssertionCount,Assertions),
    reference_rows(Data,References,ReferenceCoverage),
    (ReferenceCoverage==unavailable->ReferenceCount=null;length(References,ReferenceCount)),
    field_value(Data,generatedAt,null,Generated0),
    (number(Generated0),Generated0>=0->Generated=Generated0;Generated=null),
    field_value(Data,status,unknown,Status0),
    (memberchk(Status0,["complete","partial","unstable","error"])->RecordedStatus=Status0;RecordedStatus=unknown),
    (marked_stale(Data)->Freshness=stale;freshness(Source,RecordedSource,Freshness)),
    snapshot_state(Data,DialectOK,ContentCoverage,ReferenceCoverage,Generated,Freshness,State),
    findall(Message,summary_message(Dialect,DialectOK,ContentCoverage,ReferenceCoverage,Freshness,Data,Message),Messages),
    Summary=_{path:Public,state:State,generatedAt:Generated,dialect:Dialect,recordedStatus:RecordedStatus,predicateGrouping:symbol,
      counts:_{assertions:Assertions,contentMTs:ContentCount,referencedMTs:ReferenceCount,predicateFunctions:PredicateCount},
      coverage:_{content:ContentCoverage,references:ReferenceCoverage,predicateFunctions:recorded_heads_and_declarations},
      freshness:Freshness,messages:Messages}.

field_value(Dict,Key,Default,Value) :- (is_dict(Dict),get_dict(Key,Dict,V)->Value=V;Value=Default).
count_field(Dict,Key,Value) :-
    field_value(Dict,Key,null,V),(integer(V),V>=0->Value=V;Value=null).
text(Value) :- (atom(Value);string(Value)),!.
text(Value) :- throw(error(type_error(text,Value),_)).
valid_text(Value) :- (atom(Value);string(Value)),Value\==null,Value\=="".
source_dialect(Source,Dialect) :-
    file_name_extension(_,Ext,Source),downcase_atom(Ext,Dialect).
compatible_dialect(meld,"krf") :- !.
compatible_dialect(Dialect,Recorded) :- atom_string(Dialect,Recorded).

marked_stale(Data) :- field_value(Data,stale,false,true).
marked_stale_message(Data,Message) :-
    field_value(Data,staleReason,null,Reason),
    (string(Reason),Reason\==""->
      string_length(Reason,N),Length is min(N,1024),sub_string(Reason,0,Length,_,Preview),
      format(string(Message),'Inventory explicitly marked stale: ~s Counts and context links are historical, not current.',[Preview])
    ;Message="Inventory explicitly marked stale. Counts and context links are historical, not current.").

freshness(Source,Recorded,Freshness) :-
    size_file(Source,Size),time_file(Source,Modified),
    field_value(Recorded,sizeBytes,null,OldSize),field_value(Recorded,modified,null,OldTime),
    (integer(OldSize),number(OldTime)->
      (Size=:=OldSize,abs(Modified-OldTime)<0.002->Freshness=size_time_match;Freshness=stale)
    ;Freshness=unknown).
snapshot_state(_,_,_,_,_,stale,stale) :- !.
snapshot_state(Data,true,complete,relation_endpoints,Generated,size_time_match,snapshot) :-
    field_value(Data,stale,false,false),
    Generated\==null,field_value(Data,status,unknown,"complete"),
    field_value(Data,issues,[],[]),field_value(Data,counts,_{},Counts),
    count_field(Counts,semanticAssertionCount,N),integer(N),
    findall(A,(member(C,Data.microtheories),A=C.assertionCount),Numbers),
    sum_list(Numbers,N), !.
snapshot_state(_,_,_,_,_,_,partial).

summary_message(_,_,_,_,_,_,
    "Recorded on-disk occurrences, not the active KB. Predicates/functions count distinct canonical symbols from heads and declarations in content MTs, combining all arities, including unknown declaration arities. Details retain arity occurrences; nested-only heads may be absent.").
summary_message(kif,true,_,_,_,_,
    "KIF symbols are the post-translation inventory symbols; no additional mapping is applied here.").
summary_message(Dialect,true,_,_,_,_,
    "KRF/.meld and MeTTa snapshots are unmapped; MeTTa remains inert data.") :- Dialect\==kif.
summary_message(_,false,_,_,_,_,
    "Snapshot dialect does not match this source; symbol and context counts are unavailable.").
summary_message(_,_,Content,_,_,_,
    "Content MT coverage is missing or partial.") :- Content\==complete.
summary_message(_,_,_,relation_endpoints,_,_,
    "Referenced MTs count only endpoints of recorded schema-evidenced MT relations, not all semantic references.").
summary_message(_,_,_,partial,_,_,
    "Referenced MTs are only the observed relation endpoints in a partial projection; this is a lower bound.").
summary_message(_,_,_,unavailable,_,_,
    "MT-reference coverage was not recorded; unavailable does not mean zero.").
summary_message(_,_,_,_,stale,Data,Message) :-
    (marked_stale(Data)->marked_stale_message(Data,Message);
      Message="Source size or modification time differs from the snapshot. Counts are historical, not current.").
summary_message(_,_,_,_,unknown,_,
    "Source identity is incomplete; snapshot freshness cannot be established.").
summary_message(_,_,_,_,size_time_match,_,
    "Source size and modification time match the snapshot; the source hash was not rechecked.").
summary_message(_,_,_,_,_,Data,
    "The recorded inventory is incomplete or contains issues.") :-
    (field_value(Data,status,unknown,S),S\=="complete";field_value(Data,issues,[],I),I\==[]), !.

valid_contexts(Data,Contexts,Coverage) :-
    field_value(Data,microtheories,null,Raw),
    (is_list(Raw)->
      include(valid_context,Raw,Contexts),
      (same_length(Raw,Contexts),field_value(Data,status,unknown,"complete"),
       field_value(Data,counts,_{},Counts),count_field(Counts,semanticAssertionCount,N),integer(N),
       findall(A,(member(C,Contexts),A=C.assertionCount),Numbers),sum_list(Numbers,N)->
        Coverage=complete;Coverage=partial)
    ;Contexts=[],Coverage=unavailable).
valid_context(C) :-
    is_dict(C),get_dict(key,C,K),valid_text(K),
    get_dict(assertionCount,C,N),integer(N),N>=0,
    get_dict(predicates,C,Ps),is_list(Ps),maplist(valid_predicate,Ps).
has_content(C) :- C.assertionCount>0.
valid_predicate(P) :-
    is_dict(P),get_dict(name,P,N),valid_text(N),get_dict(arity,P,A),
    (A==null;integer(A),A>=0).

predicate_rows(Contexts,Rows) :-
    findall(Key-Row,
      (member(C,Contexts),member(P,C.predicates),
       field_value(P,label,P.name,Label),
       count_field(P,headOccurrenceCount,Heads),count_field(P,declarationReferenceCount,Declarations),
       Row=_{name:P.name,label:Label,arity:P.arity,mt:C.key,
             headOccurrenceCount:Heads,declarationReferenceCount:Declarations},
       Key=P.name-P.arity-C.key),Pairs),
    keysort(Pairs,Sorted),pairs_values(Sorted,Rows).

predicate_names(Rows,Names) :-
    findall(Name,(member(Row,Rows),Name=Row.name),All),sort(All,Names).
predicate_groups(Rows,Groups) :-
    findall(Name-Row,(member(Row,Rows),Name=Row.name),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Grouped),
    maplist(predicate_group,Grouped,Groups).
predicate_group(Name-Rows,Group) :-
    findall(A,(member(Row,Rows),A=Row.arity),AllArities),sort(AllArities,Arities),
    predicate_count_sum(Rows,headOccurrenceCount,Heads),
    predicate_count_sum(Rows,declarationReferenceCount,Declarations),
    (forall(member(Row,Rows),field_value(Row,dialect,null,metta))->Dialect=metta;Dialect=null),
    Base=_{name:Name,arities:Arities,dialect:Dialect,arityBreakdown:Rows,
      headOccurrenceCount:Heads,declarationReferenceCount:Declarations},
    (Arities=[Arity]->Group=Base.put(arity,Arity);Group=Base).
predicate_count_sum(Rows,Key,Total) :-
    findall(N,(member(Row,Rows),get_dict(Key,Row,N),integer(N)),Counts),
    (same_length(Rows,Counts)->sum_list(Counts,Total);Total=null).
public_statistics_rows(predicates,Rows,Public) :- !,maplist(public_predicate_group,Rows,Public).
public_statistics_rows(_,Rows,Rows).
public_predicate_group(Group,Public) :-
    del_dict(arityBreakdown,Group,Rows,Brief),length(Rows,Total),
    length(Group.arities,ArityCount),take(8,Group.arities,Arities),
    Public=Brief.put(_{arityBreakdownTotal:Total,arityCount:ArityCount,arities:Arities}).
predicate_matches(Symbol,Row) :- atom_string(Symbol,Row.name).

reference_rows(Data,Rows,Coverage) :-
    field_value(Data,relationProjection,_{},Projection),
    field_value(Projection,schema,"",Schema),
    field_value(Data,mtRelationAssertions,null,Edges),
    (Schema=="powder.mt-links.v1",is_list(Edges)->
      include(valid_edge,Edges,Valid),
      findall(Key,(member(E,Valid),(Key=E.arg1;Key=E.arg2)),Keys),
      msort(Keys,Sorted),clumped(Sorted,Counts),
      findall(_{key:Key,relationEndpointOccurrences:N},member(Key-N,Counts),Rows),
      (same_length(Edges,Valid),field_value(Projection,status,unknown,"complete"),
       field_value(Projection,issues,[],[])->Coverage=relation_endpoints;Coverage=partial)
    ;Rows=[],Coverage=unavailable).
valid_edge(E) :-
    is_dict(E),get_dict(arg1,E,A),valid_text(A),get_dict(arg2,E,B),valid_text(B),
    get_dict(predicate,E,P),valid_text(P).

detail_rows(Data,content,_,Rows) :-
    valid_contexts(Data,Contexts,_),
    findall(Key-Row,
      (member(C,Contexts),has_content(C),Key=C.key,
       field_value(C,label,Key,Label),predicate_names(C.predicates,Names),length(Names,N),
       Row=_{key:Key,label:Label,assertionCount:C.assertionCount,predicateFunctions:N}),Pairs),
    keysort(Pairs,Sorted),pairs_values(Sorted,Rows).
detail_rows(Data,references,_,Rows) :- reference_rows(Data,Rows,_).
detail_rows(Data,predicates,Mt,Rows) :-
    valid_contexts(Data,Contexts,_),include(has_content,Contexts,Content),
    (Mt==''->Selected=Content;include(context_matches(Mt),Content,Selected)),
    predicate_rows(Selected,Recorded),predicate_groups(Recorded,Rows).
detail_rows(Data,arities(Symbol),Mt,Rows) :-
    valid_contexts(Data,Contexts,_),include(has_content,Contexts,Content),
    (Mt==''->Selected=Content;include(context_matches(Mt),Content,Selected)),
    predicate_rows(Selected,Recorded),include(predicate_matches(Symbol),Recorded,Rows).
context_matches(Mt,C) :- atom_string(Mt,C.key).
slice(Rows,Offset,Limit,Page,Total) :-
    length(Rows,Total),
    (Offset>=Total->Page=[];
     length(Skip,Offset),append(Skip,Rest,Rows),take(Limit,Rest,Page)).
take(0,_,[]) :- !.
take(_,[],[]) :- !.
take(N,[X|Xs],[X|Ys]) :- Next is N-1,take(Next,Xs,Ys).

snapshot_members(Data,Summary,members(Content,References,Predicates)) :-
    valid_contexts(Data,Contexts,_),include(has_content,Contexts,WithContent),
    (Summary.counts.contentMTs==null->Content=[],Predicates=[];
     findall(K,(member(C,WithContent),K=C.key),Keys),sort(Keys,Content),
     predicate_rows(WithContent,Rows),predicate_names(Rows,Predicates)),
    (Summary.counts.referencedMTs==null->References=[];
     reference_rows(Data,Refs,_),findall(K,(member(R,Refs),K=R.key),RefKeys),sort(RefKeys,References)).
remember_members(Source,Identity,Members) :-
    term_size(Members,Words),get_time(Now),
    with_mutex(kb_statistics_cache,
      (retractall(membership_cache(Source,_,_,_,_)),
       (Words=<2097152->assertz(membership_cache(Source,Identity,Members,Words,Now));true),
       findall(T-(S-W),membership_cache(S,_,_,W,T),Pairs),keysort(Pairs,Sorted),pairs_values(Sorted,Old),
       length(Old,N),findall(W,member(_-W,Old),Sizes),sum_list(Sizes,Total),trim_members(Old,N,Total))).
trim_members(_,N,Words) :- N=<256,Words=<2097152, !.
trim_members([Source-W|Rest],N,Words) :-
    retractall(membership_cache(Source,_,_,_,_)),Next is N-1,Left is Words-W,trim_members(Rest,Next,Left).
entry_members(Entry,Summary,Members) :-
    atom_string(Path,Entry.path),repo_root(Repo),
    absolute_file_name(Path,Source,[relative_to(Repo),access(none)]),public_path(Source,Public),
    catch((memberchk(Entry.availability,[available,"available"])->
      inventory_identity(Source,Identity),
      (with_mutex(kb_statistics_cache,
        (summary_cache(Source,Identity,Summary,_),membership_cache(Source,Identity,Members,_,_)))->true;
       call_with_time_limit(8,
         (read_inventory(Source,Data),snapshot_summary(Source,Public,Data,Summary),snapshot_members(Data,Summary,Members))),
       inventory_identity(Source,After),
       (Identity==After->true;throw(error(resource_error(changing_inventory),_))),
       remember_summary(Source,Identity,Summary),remember_members(Source,Identity,Members))
    ;entry_summary(Entry,Summary),Members=members([],[],[])),
      Error,(unavailable(Public,Error,Summary),Members=members([],[],[]))).

% A directory cursor advances at most 16 sources and about five seconds of
% reading per request. The browser can stop between batches. No files are
% written; only inventory-derived sets and an authorized manifest are kept.
% selected_statistics(+Files,+Scope,+Cursor,-Reply) uses an explicit original-file
% set, never directory expansion. Scope is nonempty opaque UI text (up to 256 characters).
% Cursor='' starts/rechecks a snapshot; otherwise the cursor is bound to Scope
% and the deduplicated file set. Responses add kind=selected_files, path=null,
% selectionRevision (set identity), and revision (source/sidecar stat identity).
% Zero files is a known-zero snapshot without filesystem discovery.
selected_statistics(Input,ScopeInput,Cursor,Reply) :-
    selected_paths(Input,Paths,Keys),
    statistics_scope(ScopeInput,Scope),
    text(Cursor),atom_string(Token0,Cursor),atom_length(Token0,TokenLength),
    (TokenLength=<128->true;throw(error(domain_error(selected_statistics_cursor,Cursor),_))),
    statistics_digest(selection(Keys),SelectionRevision),
    JobScope=selection_scope(Scope,SelectionRevision),
    with_mutex(kb_directory_statistics,
      (expire_directory_jobs,
       (Token0==''->start_selected_job(Paths,JobScope,Token);
        Token=Token0,
        (directory_job(Token,JobScope,_,_,_,Previous,_,_),symbol_directory_result(Previous)->true;
          throw(error(domain_error(selected_statistics_cursor,Token),_)))),
       advance_directory_job(Token,Reply),prune_directory_jobs)).

statistics_scope(Input,Scope) :-
    text(Input),atom_string(Scope,Input),atom_length(Scope,N),atom_codes(Scope,Codes),
    (N>0,N=<256,forall(member(C,Codes),(C>=32,C=\=127))->true;
      throw(error(domain_error(selected_statistics_scope,Input),_))).
selected_paths(Input,Paths,Keys) :-
    must_be(list,Input),length(Input,N),
    (N=<4096->true;throw(error(domain_error(selected_statistics_limit(4096),N),_))),
    maplist(selected_path,Input,Normalized),sort(Normalized,Unique),
    map_list_to_pairs(selected_path_key,Unique,Pairs),keysort(Pairs,Sorted),
    group_pairs_by_key(Sorted,Groups),pairs_keys(Groups,Keys),
    findall(Path,member(_-[Path|_],Groups),Paths).
selected_path(Input,Path) :-
    text(Input),atom_string(Path,Input),
    (atom_length(Path,N),N=<4096,
     atomic_list_concat(['KBs'|Parts],'/',Path),Parts\=[],
     forall(member(Part,Parts),(Part\=='',Part\=='.',Part\=='..',
       \+sub_atom(Part,_,_,_,':'),\+sub_atom(Part,_,_,_,'\\'),\+sub_atom(Part,_,_,_,'\u0000'))),
     file_name_extension(_,Extension,Path),downcase_atom(Extension,Lower),
     memberchk(Lower,[kif,krf,meld,metta])->true;
      throw(error(permission_error(access,selected_source,Input),_))).
selected_path_key(Path,Key) :-
    (current_prolog_flag(windows,true)->downcase_atom(Path,Key);Key=Path).
statistics_digest(Term,Hash) :-
    term_string(Term,Text,[quoted(true)]),crypto_data_hash(Text,Hash,[algorithm(sha256),encoding(utf8)]).
start_selected_job(Paths,Scope,Token) :-
    selected_manifest(Paths,Manifest),
    (directory_job(Token,Scope,Manifest,[],_,Cached,_,_),symbol_directory_result(Cached),Cached.state==snapshot->true;
      uuid(Token,[version(4)]),get_time(Now),pairs_keys(Manifest,Pending),directory_accumulator(Acc),
      assertz(directory_job(Token,Scope,Manifest,Pending,Acc,null,Now,Now))).
selected_manifest([],[]) :- !.
selected_manifest(Paths,Manifest) :-
    authorize_statistics(Paths,Entries),maplist(selected_manifest_entry,Entries,Rows),sort(Rows,Manifest).
selected_manifest_entry(Entry,Public-identity(Size,Time,Availability,InventorySize,InventoryTime)) :-
    entry_file(Entry,Source,Public),size_file(Source,Size),time_file(Source,Time),
    (memberchk(Entry.availability,[available,"available"])->
      atom_concat(Source,'.inventory.json',Inventory),
      (catch((size_file(Inventory,InventorySize),time_file(Inventory,InventoryTime)),_,fail)->Availability=available;
        Availability=changed,InventorySize=null,InventoryTime=null)
    ;memberchk(Entry.availability,[missing,"missing"])->
      Availability=missing,InventorySize=null,InventoryTime=null
    ;Availability=unsafe,InventorySize=null,InventoryTime=null).
current_statistics_manifest(selection_scope(_,_),Previous,Current) :- !,
    pairs_keys(Previous,Paths),selected_manifest(Paths,Current).
current_statistics_manifest(Path,_,Current) :- directory_manifest(Path,_,Current).

directory_statistics(Input,Cursor,Reply) :-
    text(Input),text(Cursor),atom_string(Path,Input),atom_string(Token0,Cursor),
    (atom_length(Path,N),N=<4096->true;throw(error(domain_error(directory_path,Input),_))),
    with_mutex(kb_directory_statistics,
      (expire_directory_jobs,
       (Token0==''->start_directory_job(Path,Token);
        Token=Token0,
        (directory_job(Token,Path,_,_,_,Previous,_,_),symbol_directory_result(Previous)->true;
          throw(error(domain_error(directory_statistics_cursor,Token),_)))),
       advance_directory_job(Token,Reply),prune_directory_jobs)).
start_directory_job(Path,Token) :-
    directory_manifest(Path,Public,Manifest),
    (directory_job(Token,Public,Manifest,[],_,Cached,_,_),symbol_directory_result(Cached),Cached.state==snapshot->true;
      uuid(Token,[version(4)]),get_time(Now),pairs_keys(Manifest,Pending),directory_accumulator(Acc),
      assertz(directory_job(Token,Public,Manifest,Pending,Acc,null,Now,Now))).
symbol_directory_result(Result) :-
    is_dict(Result),get_dict(predicateGrouping,Result,symbol),
    projection_version(Version),get_dict(projectionVersion,Result,Version).
directory_accumulator(acc(Counters,0,[],[],[],null,null)) :-
    Counters=_{processedFiles:0,snapshotFiles:0,missingFiles:0,unavailableFiles:0,partialFiles:0,staleFiles:0,
      assertionFiles:0,contentMTFiles:0,referenceMTFiles:0,predicateFiles:0,
      completeContentFiles:0,completeReferenceFiles:0,completePredicateFiles:0}.
advance_directory_job(Token,Reply) :-
    directory_job(Token,Path,Manifest,Pending,Before,Previous,Started,_),get_time(Now),
    (Previous\==null,Pending==[]->Reply=Previous,After=Before,Rest=[];
     take(16,Pending,Batch),
     (Batch==[]->Entries=[];
      catch(authorize_statistics(Batch,Entries),_,
        findall(_{path:P,availability:batch_unavailable},member(P,Batch),Entries))),
     statistics(walltime,[Begin,_]),directory_batch(Entries,Begin,Before,Acc,Read),
     subtract(Pending,Read,Rest),
     (Rest==[]->
       (catch(current_statistics_manifest(Path,Manifest,Current),_,fail),Current==Manifest->Changed=false;Changed=true),
       directory_result(Token,Path,Manifest,Acc,Started,true,Changed,Reply),After=finished
     ;directory_result(Token,Path,Manifest,Acc,Started,false,false,Reply),After=Acc)),
    term_size(Manifest-Rest-After,Words),
    (Words=<4194304->true;throw(error(resource_error(directory_statistics_memory),_))),
    retractall(directory_job(Token,_,_,_,_,_,_,_)),
    assertz(directory_job(Token,Path,Manifest,Rest,After,Reply,Started,Now)).
directory_batch([],_,Acc,Acc,[]).
directory_batch([Entry|Entries],Begin,Before,After,Read) :-
    statistics(walltime,[Now,_]),
    (Now-Begin>=5000->After=Before,Read=[];
     entry_members(Entry,Summary,Members),
     add_directory_member(Summary,Members,Before,Next),
     Read=[Summary.path|Tail],directory_batch(Entries,Begin,Next,After,Tail)).
add_directory_member(Summary,members(Content,References,Predicates),
                     acc(C0,A0,M0,R0,P0,Old0,New0),acc(C,A,M,R,P,Old,New)) :-
    directory_state_counter(Summary.state,StateKey),increment(C0,processedFiles,C1),increment(C1,StateKey,C2),
    count_contribution(Summary.counts.assertions,assertionFiles,C2,C3),
    count_contribution(Summary.counts.contentMTs,contentMTFiles,C3,C4),
    count_contribution(Summary.counts.referencedMTs,referenceMTFiles,C4,C5),
    count_contribution(Summary.counts.predicateFunctions,predicateFiles,C5,C6),
    (Summary.coverage.content==complete->increment(C6,completeContentFiles,C7);C7=C6),
    (Summary.coverage.references==relation_endpoints->increment(C7,completeReferenceFiles,C8);C8=C7),
    (Summary.coverage.content==complete,integer(Summary.counts.predicateFunctions)->
      increment(C8,completePredicateFiles,C);C=C8),
    (integer(Summary.counts.assertions)->A is A0+Summary.counts.assertions;A=A0),
    ord_union(M0,Content,M),ord_union(R0,References,R),ord_union(P0,Predicates,P),
    (number(Summary.generatedAt)->
      (Old0==null->Old=Summary.generatedAt;Old is min(Old0,Summary.generatedAt)),
      (New0==null->New=Summary.generatedAt;New is max(New0,Summary.generatedAt))
    ;Old=Old0,New=New0).
directory_state_counter(snapshot,snapshotFiles) :- !.
directory_state_counter(partial,partialFiles) :- !.
directory_state_counter(stale,staleFiles) :- !.
directory_state_counter(missing,missingFiles) :- !.
directory_state_counter(_,unavailableFiles).
increment(Dict,Key,Next) :- get_dict(Key,Dict,N),More is N+1,Next=Dict.put(Key,More).
count_contribution(N,Key,Before,After) :-
    (integer(N),N>=0->increment(Before,Key,After);After=Before).
directory_result(Token,Path,Manifest,acc(Counters,Sum,Content,References,Predicates,Old,New),
                 Started,Done,Changed,Reply) :-
    length(Manifest,Total),length(Content,NM),length(References,NR),length(Predicates,NP),
    aggregate_count(Counters.assertionFiles,Total,Sum,Assertions),
    aggregate_count(Counters.contentMTFiles,Total,NM,ContentCount),
    aggregate_count(Counters.referenceMTFiles,Total,NR,ReferenceCount),
    aggregate_count(Counters.predicateFiles,Total,NP,PredicateCount),
    (Done==false->State=collecting;
     Changed==false,Counters.snapshotFiles==Total,Counters.completeContentFiles==Total,
     Counters.completeReferenceFiles==Total,Counters.completePredicateFiles==Total->State=snapshot;
     State=partial),
    Coverage=Counters.put(_{totalFiles:Total,manifestChanged:Changed}),
    projection_version(Version),
    Base=_{path:Path,token:Token,done:Done,state:State,capturedAt:Started,predicateGrouping:symbol,projectionVersion:Version,
      oldestSnapshotAt:Old,newestSnapshotAt:New,coverage:Coverage,
      counts:_{assertions:Assertions,contentMTs:ContentCount,referencedMTs:ReferenceCount,predicateFunctions:PredicateCount},
      messages:["All descendant supported originals are counted once, independent of checkbox selection.",
        "Assertions sum recorded occurrences; content MTs, referenced MTs and canonical predicate/function symbols are distinct unions. All arities of a symbol count together.",
        "References cover recorded MT-relation endpoints only. Missing, stale or partial children make these observed totals incomplete.",
        "The source/inventory size-and-time manifest is rechecked at completion; source hashes are not rechecked."]},
    statistics_result_scope(Path,Manifest,Base,Reply).
statistics_result_scope(selection_scope(Scope,SelectionRevision),Manifest,Base,Reply) :- !,
    projection_version(Version),statistics_digest(snapshot(Version,Manifest),Revision),
    Base.messages=[_|Messages],
    Reply=Base.put(_{path:null,kind:selected_files,scope:Scope,
      selectionRevision:SelectionRevision,revision:Revision,
      messages:["Only the explicit deduplicated source-file set is counted. Scope is a private UI label, not a filesystem path. No directory is expanded."|Messages]}).
statistics_result_scope(_,_,Reply,Reply).
aggregate_count(Known,Total,Value,Count) :- (Known>0;Total==0), !,Count=Value.
aggregate_count(_,_,_,null).
expire_directory_jobs :-
    get_time(Now),Cutoff is Now-600,
    forall((directory_job(T,_,_,_,_,_,_,Time),Time<Cutoff),retractall(directory_job(T,_,_,_,_,_,_,_))).
prune_directory_jobs :-
    findall(Time-(Token-Words),(directory_job(Token,_,M,P,A,_,_,Time),term_size(M-P-A,Words)),Pairs),
    keysort(Pairs,Sorted),pairs_values(Sorted,Old),length(Old,N),
    findall(W,member(_-W,Old),Sizes),sum_list(Sizes,Words),trim_directory_jobs(Old,N,Words).
trim_directory_jobs(_,N,Words) :- N=<8,Words=<4194304, !.
trim_directory_jobs([Token-W|Rest],N,Words) :-
    retractall(directory_job(Token,_,_,_,_,_,_,_)),Next is N-1,Left is Words-W,
    trim_directory_jobs(Rest,Next,Left).

% MT keys select catalog entries, never filenames. Each request reads at most
% one MT snapshot; the client expands graph branches explicitly.
microtheory_statistics(Input,Section,Offset,Limit,Reply) :-
    text(Input),atom_string(Key,Input),atom_length(Key,Length),
    (Length=<8192->true;throw(error(domain_error(microtheory_key_length,Length),_))),
    (mt_statistics_section(Section)->true;
      throw(error(domain_error(mt_statistics_section,Section),_))),
    must_be(integer,Offset),must_be(integer,Limit),
    (Offset>=0,Limit>=1,Limit=<100->true;
      throw(error(domain_error(statistics_pagination,Offset-Limit),_))),
    catch((call_with_time_limit(20,
      (mt_request_snapshot(Key,Snapshot),
       mt_reply(Snapshot,Section,Offset,Limit,Reply)))->true;
      throw(error(domain_error(mt_inventory_structure,Key),_))),
      Error,mt_failure(Key,Section,Offset,Limit,Error,Reply)).
mt_statistics_section(Section) :- memberchk(Section,[overview,parents,children,predicates,files,relations]), !.
mt_statistics_section(arities(Symbol)) :- statistics_symbol(Symbol).

mt_request_snapshot(Key,Snapshot) :-
    (with_mutex(kb_statistics_cache,mt_catalog_cache(OldFile,OldIdentity,Catalog)),
     get_assoc(Key,Catalog,Entry)->
      authorize_microtheory_files(['_catalog.json',Entry.filename],[CatalogEntry,MtEntry]),
      safe_inventory_entry(CatalogEntry,File),json_identity(File,Identity),
      (File==OldFile,Identity==OldIdentity->
        safe_inventory_entry(MtEntry,MtFile),
        authorized_mt_snapshot(Key,Entry,File-Identity,Catalog,MtFile,Snapshot)
      ; fresh_mt_snapshot(Key,Snapshot))
    ;fresh_mt_snapshot(Key,Snapshot)).
fresh_mt_snapshot(Key,Snapshot) :-
    mt_catalog(CatalogIdentity,Catalog),
    (get_assoc(Key,Catalog,Entry)->true;throw(error(existence_error(mt_snapshot,Key),_))),
    mt_snapshot(Key,Entry,CatalogIdentity,Catalog,Snapshot).

mt_catalog(Identity,Catalog) :-
    authorize_microtheory_files(['_catalog.json'],[Entry]),safe_inventory_entry(Entry,File),
    json_identity(File,FileIdentity),Identity=File-FileIdentity,
    (with_mutex(kb_statistics_cache,mt_catalog_cache(File,FileIdentity,Catalog))->true;
      read_projection(File,mt_catalog,Data),
      field_value(Data,schema,"","powder.kb-inventory.v1"),
      field_value(Data,type,"","microtheory_catalog"),
      get_dict(entries,Data,Entries),must_be(list,Entries),length(Entries,N),N=<20000,
      maplist(mt_catalog_pair,Entries,Pairs),
      keysort(Pairs,Sorted),pairs_keys(Sorted,Keys),sort(Keys,Distinct),same_length(Keys,Distinct),
      list_to_assoc(Sorted,Catalog),
      json_identity(File,FileIdentity),
      with_mutex(kb_statistics_cache,
        (retractall(mt_catalog_cache(_,_,_)),assertz(mt_catalog_cache(File,FileIdentity,Catalog))))).
mt_catalog_pair(Row,Key-Entry) :-
    is_dict(Row),get_dict(key,Row,RawKey),text(RawKey),atom_string(Key,RawKey),
    atom_length(Key,N),N=<8192,
    get_dict(filename,Row,Filename),kb_catalog:microtheory_file(Filename,_),
    field_value(Row,label,RawKey,Label),text(Label),string_length(Label,L),L=<8192,
    count_field(Row,assertionCount,Count),
    Entry=_{key:Key,label:Label,filename:Filename,assertionCount:Count}.
safe_inventory_entry(Entry,File) :-
    atom_string(Raw,Entry.path),absolute_file_name(Raw,File,[access(none)]),
    (memberchk(Entry.availability,[available,"available"])->true;
     memberchk(Entry.availability,[missing,"missing"])->throw(error(existence_error(mt_inventory,File),_));
     throw(error(permission_error(access,mt_inventory,File),_))).
json_identity(File,identity(Size,Modified)) :- size_file(File,Size),time_file(File,Modified).

mt_snapshot(Key,Entry,CatalogIdentity,Catalog,Snapshot) :-
    authorize_microtheory_files([Entry.filename],[Authorized]),safe_inventory_entry(Authorized,File),
    authorized_mt_snapshot(Key,Entry,CatalogIdentity,Catalog,File,Snapshot).
authorized_mt_snapshot(Key,Entry,CatalogIdentity,Catalog,File,Snapshot) :-
    json_identity(File,FileIdentity),projection_version(Version),Identity=by_symbol(Version,FileIdentity-CatalogIdentity),
    (with_mutex(kb_statistics_cache,mt_snapshot_cache(File,Identity,Snapshot,_,_))->true;
      read_projection(File,mt,Data),
      field_value(Data,schema,"","powder.kb-inventory.v1"),get_dict(key,Data,RawKey),atom_string(Key,RawKey),
      mt_projection(Key,Entry,Data,Catalog,FileIdentity,Snapshot),
      json_identity(File,FileIdentity),remember_mt_snapshot(File,Identity,Snapshot)).
remember_mt_snapshot(File,Identity,Snapshot) :-
    term_size(Snapshot,Words),get_time(Now),
    with_mutex(kb_statistics_cache,
      (retractall(mt_snapshot_cache(File,_,_,_,_)),
       (Words=<4194304->assertz(mt_snapshot_cache(File,Identity,Snapshot,Words,Now));true),
       findall(T-(F-W),mt_snapshot_cache(F,_,_,W,T),Pairs),
       keysort(Pairs,Sorted),pairs_values(Sorted,Oldest),length(Oldest,N),
       findall(W,member(_-W,Oldest),Sizes),sum_list(Sizes,Total),
       trim_mt_cache(Oldest,N,Total))).
trim_mt_cache(_,N,Words) :- N=<32,Words=<4194304, !.
trim_mt_cache([File-Size|Rest],N,Words) :-
    retractall(mt_snapshot_cache(File,_,_,_,_)),Next is N-1,Left is Words-Size,
    trim_mt_cache(Rest,Next,Left).

mt_projection(Key,Entry,Data,Catalog,identity(_,Modified),Snapshot) :-
    count_field(Data,assertionCount,Assertions),
    mt_files(Data,Files,FileCoverage,ReferenceCoverage),
    findall(S,(member(F,Files),F.role==content,S=F.identity),Content0),sort(Content0,Content),
    findall(S,(member(F,Files),F.role==referenced_only,S=F.identity),Referenced0),sort(Referenced0,Referenced),
    (FileCoverage==unavailable->ContentCount=null;length(Content,ContentCount)),
    (ReferenceCoverage==complete,FileCoverage==complete->length(Referenced,ReferenceCount);ReferenceCount=null),
    mt_predicates(Data,Predicates,PredicateCoverage),
    (PredicateCoverage==unavailable->PredicateCount=null;length(Predicates,PredicateCount)),
    field_value(Data,genlMt,_{},GenlMt),
    mt_neighbors(GenlMt,asArg1,Catalog,Parents,ParentCoverage),
    mt_neighbors(GenlMt,asArg2,Catalog,Children,ChildCoverage),
    mt_relations(Data,Catalog,Relations,RelationCoverage),
    field_value(Data,generatedAt,null,Generated0),
    (number(Generated0),Generated0>=0->Generated=Generated0;Generated=null),
    mt_expression(Key,Expression),
    (marked_stale(Data)->State=stale,Freshness=stale;
     Freshness=unverified,
     (FileCoverage==complete,PredicateCoverage==complete,ParentCoverage==complete,ChildCoverage==complete,
     ReferenceCoverage==complete,RelationCoverage==complete,integer(Assertions),Assertions==Entry.assertionCount,
     field_value(Data,status,"complete","complete"),field_value(Data,issues,[],[]),
     field_value(Data,stale,false,false),
     field_value(Data,hierarchySchema,"","powder.mt-links.v1")->State=snapshot;State=partial)),
    BaseMessages=["Recorded inheritance is data browsing only. No transitive inference, compilation or KB loading is performed.",
     "Parents are genlMt(this MT, parent); children are genlMt(child, this MT). Other MT relations do not imply inheritance.",
     "Files with assertions contribute content. Referenced-only files have recorded MT-relation references but no content contribution in this snapshot.",
     "Predicates/functions count distinct canonical symbols from recorded heads and declarations, combining all arities. Details retain arity occurrences; nested-only functions may be absent.",
     "Source freshness is unverified: aggregate MT inventories do not record all contributing source identities. File-modified time is not a snapshot-generation timestamp."],
    (marked_stale(Data)->marked_stale_message(Data,StaleMessage),Messages=[StaleMessage|BaseMessages];Messages=BaseMessages),
    Summary=_{mt:Key,mtExpression:Expression,label:Entry.label,state:State,generatedAt:Generated,predicateGrouping:symbol,
     inventoryModified:Modified,freshness:Freshness,
      counts:_{assertions:Assertions,contentFiles:ContentCount,referencedOnlyFiles:ReferenceCount,
               predicateFunctions:PredicateCount},
      coverage:_{files:FileCoverage,references:ReferenceCoverage,predicates:PredicateCoverage,
                 parents:ParentCoverage,children:ChildCoverage,relations:RelationCoverage},
      messages:Messages},
    Snapshot=_{summary:Summary,parents:Parents,children:Children,predicates:Predicates,files:Files,relations:Relations}.
mt_expression(Key,Expression) :-
    (catch((context_from_key(Key,Context),term_ast(Context,[],AST)),_,fail)->Expression=AST;Expression=null).

mt_predicates(Data,Rows,Coverage) :-
    field_value(Data,predicates,null,Raw),
    (is_list(Raw)->
      include(valid_predicate,Raw,Valid),
      findall(Name-Arity-Row,(member(P,Valid),Name=P.name,Arity=P.arity,
        count_field(P,headOccurrenceCount,Heads),count_field(P,declarationReferenceCount,Declarations),
        predicate_dialect(P,Dialect),
        Row=_{name:Name,arity:Arity,dialect:Dialect,headOccurrenceCount:Heads,declarationReferenceCount:Declarations}),Pairs),
      keysort(Pairs,Sorted),findall(Row,member(_-_-Row,Sorted),Recorded),predicate_groups(Recorded,Rows),
      (same_length(Raw,Valid)->Coverage=complete;Coverage=partial)
    ;Rows=[],Coverage=unavailable).
predicate_dialect(P,metta) :-
    get_dict(files,P,Files),is_list(Files),Files\=[],
    forall(member(F,Files),(is_dict(F),get_dict(source,F,S),valid_text(S),
      atom_string(Path,S),file_name_extension(_,Ext,Path),downcase_atom(Ext,metta))), !.
predicate_dialect(_,null).

mt_files(Data,Rows,Coverage,ReferenceCoverage) :-
    field_value(Data,files,null,Raw),field_value(Data,referencedInFiles,null,References),
    (is_list(Raw)->include(valid_mt_file,Raw,Valid),
      (same_length(Raw,Valid),count_field(Data,assertionCount,Count),integer(Count),
       findall(N,(member(F,Valid),N=F.assertionCount),Numbers),sum_list(Numbers,Count)->
        Coverage=complete;Coverage=partial);
      Valid=[],Coverage=unavailable),
    findall(Row,(member(F,Valid),F.source\=="",mt_file_row(F,Row)),Contributors),
    findall(Id,(member(F,Contributors),Id=F.identity),Contributing),
    (is_list(References)->include(valid_text,References,ValidReferences),
      (same_length(References,ValidReferences)->ReferenceCoverage=complete;ReferenceCoverage=partial);
      ValidReferences=[],ReferenceCoverage=unavailable),
    findall(Row,(member(Source,ValidReferences),source_reference(Source,Ref),
      \+memberchk(Ref.identity,Contributing),
      (Coverage==complete->Role=referenced_only;Role=reference_unclassified),
      Row=Ref.put(_{role:Role,assertionCount:null,line:null})),Referenced),
    findall(Id,(member(Source,ValidReferences),source_reference(Source,Ref),Id=Ref.identity),ReferenceIds),
    maplist(mark_referenced_declaration(ReferenceIds),Contributors,Marked),
    append(Marked,Referenced,All),
    findall(Id-Row,(member(Row,All),Id=Row.identity),Pairs),sort(Pairs,Sorted),pairs_values(Sorted,Rows).
mark_referenced_declaration(References,Row,Marked) :-
    (Row.role==declaration_only,memberchk(Row.identity,References)->Marked=Row.put(role,referenced_only);Marked=Row).
valid_mt_file(F) :-
    is_dict(F),get_dict(source,F,S),(string(S);atom(S)),
    get_dict(assertionCount,F,N),integer(N),N>=0.
mt_file_row(F,Row) :-
    source_reference(F.source,Ref),
    (F.assertionCount>0->Role=content;Role=declaration_only),
    field_value(F,declarationLines,[],Lines),
    (is_list(Lines),member(Line0,Lines),integer(Line0),Line0>0->Line=Line0;Line=null),
    Row=Ref.put(_{role:Role,assertionCount:F.assertionCount,line:Line}).
source_reference(Recorded,_{identity:Identity,path:Public,recordedPath:Recorded}) :-
    (recorded_public_source(Recorded,Safe)->Public=Safe,Identity=Safe;
      Public=null,Identity=Recorded).
recorded_public_source(Recorded,Public) :-
    text(Recorded),Recorded\=="",repo_root(Root),
    catch(absolute_file_name(Recorded,Absolute,[relative_to(Root),access(none)]),_,fail),
    public_path(Absolute,Public),atom_concat('KBs/',_,Public),
    \+sub_atom(Public,_,_,_,'..'),kb_catalog:supported(Public).

mt_neighbors(Data,Position,Catalog,Rows,Coverage) :-
    field_value(Data,Position,null,Raw),
    (is_list(Raw)->include(valid_neighbor,Raw,Valid),
      maplist(mt_neighbor(Catalog),Valid,Unsorted),
      findall(K-R,(member(R,Unsorted),K=R.mt),Pairs),keysort(Pairs,Sorted),pairs_values(Sorted,Rows),
      (same_length(Raw,Valid)->Coverage=complete;Coverage=partial)
    ;Rows=[],Coverage=unavailable).
valid_neighbor(N) :- is_dict(N),get_dict(key,N,Key),valid_text(Key).
mt_neighbor(Catalog,Raw,Neighbor) :-
    atom_string(Key,Raw.key),mt_expression(Key,Expression),count_field(Raw,supportCount,Supports),
    (get_assoc(Key,Catalog,Entry)->Label=Entry.label,Count=Entry.assertionCount,Catalogued=true;
      field_value(Raw,label,Raw.key,Label),Count=null,Catalogued=false),
    field_value(Raw,supports,[],Evidence),
    (is_list(Evidence)->take(3,Evidence,First);First=[]),
    findall(Ref,(member(E,First),is_dict(E),get_dict(source,E,S),valid_text(S),
      source_reference(S,Source),count_field(E,line,Line),Ref=Source.put(line,Line)),SourceRefs),
    Neighbor=_{mt:Key,mtExpression:Expression,label:Label,assertionCount:Count,
      catalogued:Catalogued,supportCount:Supports,evidence:SourceRefs}.
mt_relations(Data,Catalog,Rows,Coverage) :-
    field_value(Data,mtRelations,null,Raw),
    (is_list(Raw)->include(valid_mt_relation,Raw,Valid),
      findall(Row,(member(R,Valid),member(Position,[asArg1,asArg2]),
        mt_neighbors(R,Position,Catalog,Neighbors,_),member(N,Neighbors),
        Row=N.put(_{predicate:R.predicate,position:Position})),Rows),
      (same_length(Raw,Valid)->Coverage=complete;Coverage=partial)
    ;Rows=[],Coverage=unavailable).
valid_mt_relation(R) :-
    is_dict(R),get_dict(predicate,R,P),valid_text(P),
    get_dict(asArg1,R,A),is_list(A),maplist(valid_neighbor,A),
    get_dict(asArg2,R,B),is_list(B),maplist(valid_neighbor,B).

mt_reply(Snapshot,overview,Offset,Limit,Reply) :- !,
    mt_section_page(Snapshot,parents,Offset,Limit,Parents),
    mt_section_page(Snapshot,children,Offset,Limit,Children),
    Reply=_{summary:Snapshot.summary,section:overview,parents:Parents,children:Children}.
mt_reply(Snapshot,Section,Offset,Limit,Reply) :-
    mt_section_page(Snapshot,Section,Offset,Limit,Page),Reply=Page.put(_{summary:Snapshot.summary,section:Section}).
mt_section_page(Snapshot,Section,Offset,Limit,Page) :-
    Section=arities(Symbol), !,
    (Snapshot.summary.coverage.predicates==unavailable->Items=[],Total=null;
      (member(Group,Snapshot.predicates),predicate_matches(Symbol,Group)->Rows=Group.arityBreakdown;Rows=[]),
      slice(Rows,Offset,Limit,Items,Total)),
    Page=_{items:Items,total:Total,offset:Offset,limit:Limit}.
mt_section_page(Snapshot,Section,Offset,Limit,Page) :-
    get_dict(Section,Snapshot,Rows),
    (get_dict(Section,Snapshot.summary.coverage,unavailable)->Items=[],Total=null;
      slice(Rows,Offset,Limit,RawPage,Total),public_statistics_rows(Section,RawPage,Items)),
    Page=_{items:Items,total:Total,offset:Offset,limit:Limit}.
mt_failure(Key,Section,Offset,Limit,Error,Reply) :-
    (Error=error(existence_error(_,_),_)->State=missing,Message="No catalogued inventory snapshot is available for this microtheory.";
     Error==time_limit_exceeded->State=unavailable,Message="Reading this MT snapshot exceeded the 20-second budget. Retry to check for an updated snapshot.";
     State=unavailable,Message="The microtheory inventory could not be safely read or validated. Retry to check for an updated snapshot."),
    mt_expression(Key,Expression),
    Summary=_{mt:Key,mtExpression:Expression,state:State,generatedAt:null,inventoryModified:null,
      counts:_{assertions:null,contentFiles:null,referencedOnlyFiles:null,predicateFunctions:null},
      messages:[Message]},
    Empty=_{items:[],total:null,offset:Offset,limit:Limit},
    (Section==overview->Reply=_{summary:Summary,section:Section,parents:Empty,children:Empty};
      Reply=Empty.put(_{summary:Summary,section:Section})).

% Read only the fields used by the projection. Large compiled warning arrays
% are validated and skipped without retaining them, and never read as Prolog.
read_inventory(Source,Data) :-
    atom_concat(Source,'.inventory.json',File),read_projection(File,source,Data).
read_projection(File,Kind,Data) :-
    size_file(File,Size),
    (Size=<67108864->true;throw(error(resource_error(statistics_size),_))),
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
      ((expect(S,0'{),object_fields(S,Kind,[],Pairs),space(S),
        get_code(S,-1),dict_create(Data,inventory,Pairs))->true;
       throw(error(syntax_error(inventory_json),_))),close(S)).
kept_field(source,Key) :-
    memberchk(Key,[schema,source,generatedAt,status,stale,staleReason,counts,microtheories,issues,
                   relationProjection,mtRelationAssertions,evidence]).
kept_field(mt_catalog,Key) :- memberchk(Key,[schema,type,entries]).
kept_field(mt,Key) :-
    memberchk(Key,[schema,key,label,assertionCount,predicates,files,referencedInFiles,
                  genlMt,mtRelations,hierarchySchema,generatedAt,status,stale,staleReason,issues]).
object_fields(S,Kind,Seen,Pairs) :-
    space(S),peek_code(S,C),
    (C=:=0'}->get_code(S,_),Pairs=[];
     json_read_dict(S,KeyString),string(KeyString),atom_string(Key,KeyString),
     (memberchk(Key,Seen)->throw(error(domain_error(duplicate_json_key,Key),_));true),
     expect(S,0':),
     (kept_field(Kind,Key)->json_read_dict(S,Value),Pairs=[Key-Value|Tail];
       skip_value(S,0),Pairs=Tail),
     space(S),get_code(S,Separator),
     (Separator=:=0'}->Tail=[];
      Separator=:=0',->object_fields_nonempty(S,Kind,[Key|Seen],Tail);
      throw(error(syntax_error(inventory_json),_)))).
object_fields_nonempty(S,Kind,Seen,Pairs) :-
    space(S),peek_code(S,0'"),object_fields(S,Kind,Seen,Pairs).
space(S) :-
    peek_code(S,C),(memberchk(C,[32,9,10,13])->get_code(S,_),space(S);true).
expect(S,C) :- space(S),get_code(S,Actual),
    (Actual=:=C->true;throw(error(syntax_error(inventory_json),_))).
skip_value(S,Depth) :-
    (Depth<256->true;throw(error(resource_error(json_depth),_))),
    space(S),peek_code(S,C),Next is Depth+1,
    (C=:=0'{->get_code(S,_),skip_members(S,Next)
    ;C=:=0'[->get_code(S,_),skip_array(S,Next)
    ;C=:=0'"->json_read_dict(S,_)
    ;json_read_dict(S,Value),(atomic(Value)->true;throw(error(syntax_error(inventory_json),_)))).
skip_members(S,Depth) :-
    space(S),peek_code(S,C),
    (C=:=0'}->get_code(S,_);
     json_read_dict(S,Key),string(Key),expect(S,0':),skip_value(S,Depth),
     space(S),get_code(S,End),
     (End=:=0'}->true;End=:=0',->space(S),peek_code(S,0'"),skip_members(S,Depth);
      throw(error(syntax_error(inventory_json),_)))).
skip_array(S,Depth) :-
    space(S),peek_code(S,C),
    (C=:=0']->get_code(S,_);skip_value(S,Depth),skip_array_tail(S,Depth)).
skip_array_tail(S,Depth) :-
    space(S),get_code(S,C),
    (C=:=0']->true;C=:=0',->skip_value(S,Depth),skip_array_tail(S,Depth);
      throw(error(syntax_error(inventory_json),_))).
