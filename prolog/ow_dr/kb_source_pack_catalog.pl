:- module(kb_source_pack_catalog,
          [catalog_analysis/3,catalog_provider_index/4,catalog_provider/2]).

/** <module> Pure bridge from one catalog snapshot to SourcePack data

No source/cache I/O or execution occurs here. The index contains internal
provider tokens, expanded only for requested candidates. Individual analyses
are reconstructed lazily. Compact e/4 records cannot recover executable kind,
original path, variable names, MT, per-evidence arity or total evidence count.
These omissions remain explicit; a static head is not an implementation.
*/
:- use_module(kb_inventory_rules,[logical_operator/1]).
:- use_module(kb_do_invocations,[do_invocation_symbol/1]).
:- use_module(library(assoc)).
:- use_module(library(apply)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

catalog_analysis(Snapshot,Path,Analysis) :-
    must_be(dict,Snapshot),must_be(atom,Path),path_key(Path,Key),
    (Snapshot.status\==available->
       unavailable(Path,catalog_not_available,Snapshot.status,Analysis)
    ;\+get_assoc(Key,Snapshot.files,_)->
       unavailable(Path,source_not_in_current_catalog,missing_or_unindexed,Analysis)
    ;get_assoc(Key,Snapshot.files,File),
     (file_projection(File)->file_analysis(Snapshot,Path,File,Analysis)
     ;unavailable(Path,invalid_catalog_file_projection,requires_refresh,Analysis))).

file_projection(File) :-
    is_dict(File),get_dict(path,File,Path),atom(Path),get_dict(status,File,fresh),
    get_dict(identity,File,I),is_dict(I),
    get_dict(sourceHash,I,H),atom(H),get_dict(normalizedDigest,I,D),atom(D),
    get_dict(dependencySummary,File,B),is_dict(B),
    forall(member(K,[status,coverage,reasons,defined,declared,referenced,unresolved,microtheories]),
           get_dict(K,B,_)),
    memberchk(B.status,[complete,partial,unavailable]),
    is_dict(B.coverage),is_list(B.reasons),is_dict(B.microtheories),
    forall(member(K,[records,definitions,references]),get_dict(K,B.coverage,_)),
    get_dict(outbound,B.microtheories,_),
    maplist(compact_list,[B.defined,B.declared,B.referenced]),
    get_dict(providerExtensions,File,E),is_dict(E),
    forall(member(K,[status,declared,coverage,reasons]),get_dict(K,E,_)),
    memberchk(E.status,[complete,partial,unavailable]),
    is_dict(E.coverage),is_list(E.reasons),
    (E.declared==null;is_list(E.declared),maplist(extension_entry,E.declared)).
compact_list(null) :- !.
compact_list(List) :- is_list(List),maplist(compact_entry,List).
compact_entry(symbol(Symbol,Arities,Roles,Polarities,Evidence)) :-
    atom(Symbol),maplist(is_list,[Arities,Roles,Polarities,Evidence]),
    forall(member(E,Evidence),(E=e(Id,_,Role,Polarity),atom(Id),atom(Role),atom(Polarity))).
extension_entry(E) :-
    is_dict(E),get_dict(symbol,E,S),atom(S),
    forall(member(K,[arities,roles,polarities,evidence]),(get_dict(K,E,V),is_list(V))).

file_analysis(Snapshot,Path,File,Analysis) :-
    B=File.dependencySummary,E=File.providerExtensions,
    compact_symbols(File.path,defined,B.defined,Defined),
    compact_symbols(File.path,declared,B.declared,BaseDeclared),
    compact_symbols(File.path,referenced,B.referenced,Referenced),
    merge_declarations(BaseDeclared,E.declared,Declared0),
    map_symbols(present(Defined,E.declared),Declared0,Declared),
    outbound(Defined,Declared,Referenced,Outbound),
    (E.status==complete->Definitions=B.coverage.definitions
    ;B.coverage.definitions==unknown->Definitions=unknown;Definitions=partial),
    Coverage=B.coverage.put(coverage{definitions:Definitions,
      providerExtensions:E.coverage,provenance:partial,executableClassification:unknown}),
    (B.status==unavailable->Status=unavailable
    ;B.status==complete,E.status==complete->Status=complete;Status=partial),
    append([B.reasons,E.reasons,
      [reason{code:compact_provenance_projection,
        message:"Original paths, names, MTs, executable kind, per-evidence arity and full evidence counts are not recoverable from compact e/4 records."}]],Reasons),
    default(File,rawSourceHash,null,Raw),default(File.identity,normalizedHash,null,FileHash),
    default(File.identity,indexHash,null,IndexHash),
    Info=dependencies{schema:'powder.file-dependencies.v1',status:Status,
      source:source{path:File.path,sha256:File.identity.sourceHash,rawSha256:Raw,
        fingerprintKind:legacy_compiler_fingerprint},
      cache:cache_info{normalizedDigest:File.identity.normalizedDigest,
        fileHash:FileHash,indexHash:IndexHash,validation:validated_catalog_projection,
        freshness:stat_compatible_hash_verification_required_on_load},
      catalog:catalog{revision:Snapshot.revision,taxonomy:Snapshot.taxonomy,
        verifiedAt:Snapshot.verifiedAt},
      coverage:Coverage,reasons:Reasons,
      symbols:symbols{defined:Defined,declared:Declared,referenced:Referenced,
        outbound:Outbound,unresolved:B.unresolved},
      microtheories:B.microtheories},
    Analysis=analysis{path:Path,info:Info,freshness:catalog_stat_compatible}.

unavailable(Path,Code,Detail,Analysis) :-
    Info=dependencies{status:unavailable,
      source:source{path:Path,sha256:null,rawSha256:null},
      cache:cache_info{normalizedDigest:null},
      coverage:coverage{records:unknown,definitions:unknown,references:unknown},
      reasons:[reason{code:Code,detail:Detail}],
      symbols:symbols{defined:null,declared:null,referenced:null,outbound:null,unresolved:null},
      microtheories:microtheories{outbound:null}},
    Analysis=analysis{path:Path,info:Info,freshness:unavailable}.

compact_symbols(_,_,null,null) :- !.
compact_symbols(Path,Kind,List,Entries) :-
    must_be(list,List),maplist(compact_symbol(Path,Kind),List,Entries).
compact_symbol(Path,Kind,symbol(Symbol,Arities,Roles,Polarities,Raw),Entry) :-
    must_be(atom,Symbol),maplist(must_be(list),[Arities,Roles,Polarities,Raw]),
    maplist(compact_evidence(Path,Kind),Raw,Evidence),length(Evidence,Count),
    (Kind==declared->PresentationKind=schema_declared;PresentationKind=Kind),
    role_presentation(Symbol,PresentationKind,[],Presentation),
    Entry=symbol{symbol:Symbol,arities:Arities,roles:Roles,polarities:Polarities,
      evidence:Evidence,evidenceCount:null,sampledEvidenceCount:Count,
      implementation:unknown,rolePresentation:Presentation}.
compact_evidence(Path,Kind,e(Id,Line,Role,Polarity),Evidence) :-
    (Kind==defined->SemanticKind=static_head;SemanticKind=Kind),
    Evidence=evidence{id:Id,line:Line,role:Role,polarity:Polarity,
      sourceFile:Path,sourcePathKind:catalog_source,originalSourceFile:null,
      variableNames:null,mt:null,arity:null,via:unknown,
      kind:SemanticKind,implementation:unknown}.

merge_declarations(null,_,null) :- !.
merge_declarations(Base,null,Base) :- !.
merge_declarations(Base,Extra,Merged) :-
    append(Base,Extra,All),maplist(symbol_pair,All,Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
    maplist(merge_symbol,Groups,Merged).
symbol_pair(Entry,Symbol-Entry) :- Symbol=Entry.symbol.
merge_symbol(Symbol-Entries,Merged) :-
    union_field(Entries,arities,Arities),union_field(Entries,roles,Roles),
    union_field(Entries,polarities,Polarities),
    findall(E,(member(Entry,Entries),member(E,Entry.evidence)),Evidence),
    length(Evidence,Count),
    (maplist(known_count,Entries,Counts)->sum_list(Counts,Total);Total=null),
    Merged=symbol{symbol:Symbol,arities:Arities,roles:Roles,polarities:Polarities,
      evidence:Evidence,evidenceCount:Total,sampledEvidenceCount:Count,implementation:unknown}.
known_count(Entry,Count) :- get_dict(evidenceCount,Entry,Count),integer(Count),Count>=0.
union_field(Entries,Key,Values) :-
    findall(V,(member(E,Entries),get_dict(Key,E,Vs),member(V,Vs)),All),sort(All,Values).
map_symbols(_,null,null) :- !.
map_symbols(Goal,Entries,Out) :- maplist(Goal,Entries,Out).
present(Defined,Extra,Entry,Out) :-
    (is_list(Defined),member(D,Defined),D.symbol==Entry.symbol->Kind=defined
    ;member(Declaration,Entry.evidence),get_dict(kind,Declaration,declared)->Kind=schema_declared
    ;Kind=declared),
    (is_list(Extra)->findall(E,(member(X,Extra),X.symbol==Entry.symbol,member(E,X.evidence)),Proofs)
    ;Proofs=[]),
    role_presentation(Entry.symbol,Kind,Proofs,Presentation),
    Out=Entry.put(rolePresentation,Presentation).
role_presentation(Symbol,Kind,Evidence,Presentation) :-
    (do_invocation_symbol(Symbol)->
       (memberchk(Kind,[defined,schema_declared])->Do=true
       ;member(E,Evidence),get_dict(callableRole,E,predicates)->Do=true
       ;Do=unknown)
    ;Do=false),
    Presentation=presentation{doInvocation:Do,implementation:unknown,
      scope:naming_plus_predicate_evidence_not_execution}.

outbound(Defined,Declared,Referenced,Outbound) :-
    (is_list(Defined),is_list(Declared),is_list(Referenced)->
       append(Defined,Declared,All),findall(S,(member(E,All),S=E.symbol),Symbols0),
       sort(Symbols0,Symbols),maplist(symbol_set_pair,Symbols,Pairs),list_to_assoc(Pairs,Set),
       exclude(locally_provided(Set),Referenced,Outbound)
    ;Outbound=null).
symbol_set_pair(Symbol,Symbol-true).
locally_provided(Set,Entry) :- get_assoc(Entry.symbol,Set,_).

catalog_provider_index(Snapshot,Selection,Index,Count) :-
    must_be(ground,Snapshot),
    (Snapshot.status==available->
       selected_files(Snapshot,Selection,Files,Missing),length(Files,Count),
       empty_assoc(Empty),foldl(index_file,Files,Empty,Lookup),
       findall(Issue,
         (member(File,Files),\+complete_file(File),
          Issue=issue{path:File.path,reason:partial_catalog_provider_analysis}),FileIssues),
       append(Missing,FileIssues,Issues),
       (Selection==all,Snapshot.coverage.complete==true,Issues==[]->Complete=true;Complete=false)
    ;empty_assoc(Lookup),Count=0,Complete=false,
     Issues=[issue{reason:catalog_not_available,status:Snapshot.status}]),
    Coverage=coverage{complete:Complete,scope:catalog_snapshot,status:Snapshot.status,
      revision:Snapshot.revision,taxonomy:Snapshot.taxonomy,verifiedAt:Snapshot.verifiedAt,
      catalog:Snapshot.coverage,issues:Issues,sourceFreshness:stat_compatible_until_load},
    Index=provider_index{mode:catalog,providerLookup:Lookup,coverage:Coverage}.
selected_files(Snapshot,all,Files,[]) :- !,assoc_to_values(Snapshot.files,Files).
selected_files(Snapshot,Paths,Files,Missing) :-
    must_be(list,Paths),
    findall(File,(member(Path,Paths),path_key(Path,K),get_assoc(K,Snapshot.files,File)),Files),
    findall(issue{path:Path,reason:source_not_in_current_catalog},
      (member(Path,Paths),path_key(Path,K),\+get_assoc(K,Snapshot.files,_)),Missing).
complete_file(File) :-
    file_projection(File),B=File.dependencySummary,
    B.status\==unavailable,B.coverage.records==complete,
    B.coverage.definitions==complete,B.coverage.references==complete,
    File.providerExtensions.status==complete.
index_file(File,Before,After) :-
    (file_projection(File),File.dependencySummary.status\==unavailable->
       B=File.dependencySummary,
       index_compact(B.defined,File.path,defined,Before,One),
       index_compact(B.declared,File.path,declared,One,Two),
       index_extensions(File.providerExtensions.declared,File.path,Two,After)
    ;After=Before).
index_compact(null,_,_,Before,Before) :- !.
index_compact(List,Path,Kind,Before,After) :-
    foldl(add_compact(Path,Kind),List,Before,After).
add_compact(Path,Kind,Entry,Before,After) :-
    Entry=symbol(Symbol,_,_,_,_),
    add_provider(Symbol,catalog_compact(Path,Kind,Entry),Before,After).
index_extensions(null,_,Before,Before) :- !.
index_extensions(List,Path,Before,After) :-
    foldl(add_extension(Path),List,Before,After).
add_extension(Path,Entry,Before,After) :-
    add_provider(Entry.symbol,catalog_extension(Path,Entry),Before,After).
add_provider(Symbol,Token,Before,After) :-
    (logical_operator(Symbol)->After=Before
    ;(get_assoc(Symbol,Before,Old)->true;Old=[]),put_assoc(Symbol,Before,[Token|Old],After)).
catalog_provider(catalog_compact(Path,Kind,Raw),Provider) :-
    compact_symbol(Path,Kind,Raw,Entry),
    Provider=provider{symbol:Entry.symbol,path:Path,kind:Kind,evidence:Entry.evidence,
      rolePresentation:Entry.rolePresentation}.
catalog_provider(catalog_extension(Path,Entry),Provider) :-
    role_presentation(Entry.symbol,declared,Entry.evidence,Presentation),
    Provider=provider{symbol:Entry.symbol,path:Path,kind:declared,evidence:Entry.evidence,
      rolePresentation:Presentation}.

default(Dict,Key,Fallback,Value) :- (get_dict(Key,Dict,Value)->true;Value=Fallback).
path_key(Path,Key) :-
    (current_prolog_flag(windows,true)->downcase_atom(Path,Key);Key=Path).
