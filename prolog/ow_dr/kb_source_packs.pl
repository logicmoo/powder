:- module(kb_source_packs,
          [list_packs/1,get_pack/2,create_pack/4,save_pack/3,
           resolve_pack/4,load_pack/4,refresh_provider_index/2,
           resolve_graph/4,packs_file/1]).

/** <module> Named, opt-in source compositions

Public operations use canonical KBs/... original-file paths, never directories.
list_packs/get_pack return {revision,packs|pack}. create_pack(Name,Roots,Revision,
Reply) and save_pack(Pack,Revision,Reply) use optimistic document revisions.
resolve_pack(Id,Revision,Choices,Resolution) is read-only: discard it to cancel,
or save_pack(Resolution.pack,Revision,Reply) to retain composition/choices.
Choices are [{symbol:x_predicate,files:[KBs/...]}]; [] explicitly declines.
load_pack(Id,Revision,Generation,Reply) requires that exact saved composition
to resolve without outstanding predicate questions and verifies its selected
source/cache hashes before additive native loading. It never compiles sources.

Pack fields: id, name, roots, choices, members, resolution. Members distinguish
root/dependency, preserve why[{symbol,kind,evidence}], and record sourceHash /
normalizedDigest identities. No MT dependency is automatically added.
Resolution reports ready, state, unresolved, changes, coverage, and separate
microtheoryDependencies. Declared-only support is explicitly identified.

refresh_provider_index(all|Paths,Reply) is an EXPLICIT potentially expensive
action: read existing cache metadata, verify source hashes, and persist a
reusable provider index. No refresh occurs while listing/getting/rendering.
A selected subset, missing cache, unsupported definition semantics, or changed
catalogue cannot establish global uniqueness. Such candidates require choice.
resolve_graph(Pack,Index,[analysis{path,info},...],Resolution) is filesystem-free.
Intrinsic logical-form operators are not external predicate dependencies.

Persistence is .logos-state/source-packs.json plus its .providers.json sibling.
POWDER_SOURCE_PACKS overrides the first path (also isolating the provider index).
Writes use a retained native lock file, same-directory staging, and revision
checks. Source files, adjacent statistics and corpus caches are never written.
*/

:- use_module(kb_paths).
:- use_module(kb_catalog,[authorize_sources/2,directory_manifest/3]).
:- use_module(kb_file_dependencies).
:- use_module(kb_inventory_rules,[logical_operator/1]).
:- use_module(kb_cache,[read_cache/3,file_digest/2,terms_digest/2,try_lock/2,release_lock/1,
                        stage_path/2,install_stage/2,remove_if_exists/1]).
:- use_module(kb_store,[]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(lists)).
:- use_module(library(ordsets)).
:- use_module(library(pairs)).
:- use_module(library(uuid)).

:- dynamic provider_memory/3.

packs_file(File) :-
    (getenv('POWDER_SOURCE_PACKS',Given),Given\==''->
      absolute_file_name(Given,File,[access(none)])
    ;app_dir(App),directory_file_path(App,'.logos-state',Dir),
     directory_file_path(Dir,'source-packs.json',File)).
providers_file(File) :- packs_file(Packs),atom_concat(Packs,'.providers.json',File).

list_packs(Reply) :-
    read_packs(Packs,Revision),Reply=packs{revision:Revision,packs:Packs}.
get_pack(Id0,Reply) :-
    pack_id(Id0,Id),read_packs(Packs,Revision),
    (member(Pack,Packs),Pack.id==Id->Reply=pack_reply{revision:Revision,pack:Pack}
    ;existence_error(source_pack,Id)).
create_pack(Name,Roots,Expected,Reply) :-
    uuid(UUID),atom_concat('pack-',UUID,Id),
    save_pack(pack{id:Id,name:Name,roots:Roots,choices:[],members:[],
                   resolution:resolution{ready:false,state:draft}},Expected,Reply).

save_pack(Input,Expected,Reply) :-
    normalize_pack(Input,Pack),read_packs(Before,Revision),check_revision(Expected,Revision),
    (member(Old,Before),Old.id==Pack.id->pack_paths(Old,OldPaths);OldPaths=[]),
    pack_paths(Pack,Paths),ord_subtract(Paths,OldPaths,Introduced),
    authorize_pack_sources(Introduced,_),
    exclude(same_pack(Pack.id),Before,Other),append(Other,[Pack],Packs),
    packs_file(File),
    write_document(File,Expected,packs_document{schema:'powder.source-packs.v1',packs:Packs},Next),
    Reply=pack_reply{revision:Next,pack:Pack}.
same_pack(Id,Pack) :- Pack.id==Id.

read_packs(Packs,Revision) :-
    packs_file(File),
    (exists_file(File)->
      file_digest(File,Revision),read_document(File,Data),file_digest(File,After),
      (Revision==After->true;throw(error(source_packs_changed_during_read,_))),
      (Data.schema=='powder.source-packs.v1'->true;domain_error(source_pack_schema,Data.schema)),
      must_be(list,Data.packs),maplist(normalize_pack,Data.packs,Packs),
      findall(Id,(member(P,Packs),Id=P.id),Ids),sort(Ids,Unique),
      (same_length(Ids,Unique)->true;domain_error(duplicate_pack_ids,Ids))
    ;Packs=[],Revision=none).
read_document(File,Data) :-
    size_file(File,Size),(Size=<67108864->true;resource_error(source_pack_document_size)),
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),
      (json_read_dict(S,Data,[value_string_as(atom),default_tag(json)]),
       read_string(S,_,Tail),
       (normalize_space(string(""),Tail)->true;domain_error(source_pack_json_trailing_data,File))),
      close(S)).
check_revision(Expected0,Actual) :-
    text_atom(Expected0,Expected),
    (Expected==Actual->true;throw(error(source_packs_conflict(Expected,Actual),_))).
write_document(File,Expected,Data,Revision) :-
    file_directory_name(File,Dir),make_directory_path(Dir),
    with_mutex(kb_source_packs,
      (atom_concat(File,'.lock',LockFile),try_lock(LockFile,Lock),
       (Lock==busy->throw(error(source_packs_busy,_));
        setup_call_cleanup(true,
          (document_revision(File,Current),check_revision(Expected,Current),
           stage_path(File,Stage),
           setup_call_cleanup(true,
             (setup_call_cleanup(open(Stage,write,S,[encoding(utf8),newline(posix)]),
                (json_write_dict(S,Data,[width(0)]),nl(S),flush_output(S)),close(S)),
              read_document(Stage,_),install_stage(Stage,File),file_digest(File,Revision)),
             remove_if_exists(Stage))),
          release_lock(Lock))))).
document_revision(File,Revision) :- (exists_file(File)->file_digest(File,Revision);Revision=none).

normalize_pack(Input,Pack) :-
    must_be(dict,Input),pack_id(Input.id,Id),pack_name(Input.name,Name),
    normalize_paths(Input.roots,Roots),
    (Roots\=[]->true;domain_error(source_pack_roots,Roots)),
    dict_default(Input,choices,[],Choices0),normalize_choices(Choices0,Choices),
    dict_default(Input,members,[],Members0),must_be(list,Members0),
    maplist(normalize_member,Members0,Members),
    findall(P,(member(M,Members),P=M.path),Ps),sort(Ps,Unique),
    (same_length(Ps,Unique)->true;domain_error(duplicate_pack_members,Ps)),
    dict_default(Input,resolution,resolution{ready:false,state:draft},Resolution),
    must_be(dict,Resolution),
    (memberchk(Resolution.ready,[true,false])->true;domain_error(pack_ready,Resolution.ready)),
    must_be(text,Resolution.state),
    json_ground(Resolution,GroundResolution),
    Pack=pack{id:Id,name:Name,roots:Roots,choices:Choices,members:Members,resolution:GroundResolution}.
normalize_member(Input,Member) :-
    must_be(dict,Input),pack_path(Input.path,Path),
    text_atom(Input.role,Role),(memberchk(Role,[root,dependency])->true;domain_error(pack_member_role,Role)),
    dict_default(Input,why,[],Why),dict_default(Input,identity,null,Identity),
    json_ground(Why,GroundWhy),json_ground(Identity,GroundIdentity),
    Member=member{path:Path,role:Role,why:GroundWhy,identity:GroundIdentity}.
normalize_choices(Input,Choices) :-
    must_be(list,Input),maplist(normalize_choice,Input,Choices),
    findall(S,(member(C,Choices),S=C.symbol),Ss),sort(Ss,Unique),
    (same_length(Ss,Unique)->true;domain_error(duplicate_predicate_choices,Ss)).
normalize_choice(Input,choice{symbol:Symbol,files:Files}) :-
    must_be(dict,Input),text_atom(Input.symbol,Symbol),
    atom_length(Symbol,L),(L>0,L=<8192->true;domain_error(predicate_symbol,Symbol)),
    normalize_paths(Input.files,Files).
normalize_paths(Input,Paths) :- must_be(list,Input),maplist(pack_path,Input,Ps),sort(Ps,Paths).
pack_paths(Pack,Paths) :-
    findall(P,(member(P,Pack.roots);member(M,Pack.members),P=M.path;
               member(C,Pack.choices),member(P,C.files)),Ps),sort(Ps,Paths).
pack_path(Input,Path) :-
    text_atom(Input,Path),
    (atom_length(Path,N),N=<4096,\+sub_atom(Path,_,_,_,'\\'),
     atomic_list_concat(['KBs'|Parts],'/',Path),Parts\=[],
     forall(member(P,Parts),(P\=='',P\=='.',P\=='..',\+sub_atom(P,_,_,_,':'))),
     file_name_extension(_,Ext,Path),downcase_atom(Ext,Lower),memberchk(Lower,[kif,krf,meld,metta])
    ->true;permission_error(access,source_pack_path,Path)).
pack_id(Input,Id) :-
    text_atom(Input,Id),atom_codes(Id,Codes),length(Codes,N),
    (N>0,N=<80,forall(member(C,Codes),(code_type(C,alnum);C=:=0'-))
    ->true;domain_error(source_pack_id,Id)).
pack_name(Input,Name) :-
    text_atom(Input,Atom),normalize_space(atom(Name),Atom),atom_codes(Name,Codes),length(Codes,N),
    (N>0,N=<120,forall(member(C,Codes),(C>=32,C=\=127))->true;domain_error(source_pack_name,Input)).
text_atom(Input,Atom) :-
    (atom(Input)->Atom=Input;string(Input)->atom_string(Atom,Input);type_error(text,Input)).
dict_default(Dict,Key,Default,Value) :- (get_dict(Key,Dict,Value)->true;Value=Default).
json_ground(Input,Output) :-
    (string(Input)->atom_string(Output,Input)
    ;is_dict(Input)->dict_pairs(Input,_,Pairs),maplist(json_pair,Pairs,Out),dict_pairs(Output,json,Out)
    ;is_list(Input)->maplist(json_ground,Input,Output)
    ;atomic(Input)->Output=Input
    ;type_error(json_data,Input)).
json_pair(Key-In,Key-Out) :- json_ground(In,Out).

refresh_provider_index(Selection,Reply) :-
    providers_file(File),document_revision(File,Expected),
    directory_manifest('KBs',_,Manifest),manifest_paths(Manifest,All),
    (Selection==all->Paths=All,Scope=all
    ;normalize_paths(Selection,Paths),Scope=selection),
    authorize_pack_sources(Paths,Absolute),
    maplist(index_analysis,Absolute,Analyses),
    catalogue_stamp(Manifest,Stamp),
    findall(Provider,(member(A,Analyses),analysis_provider(A,Provider)),Providers),
    (Paths==All,forall(member(A,Analyses),index_analysis_complete(A))->Complete=true;Complete=false),
    findall(Issue,
      (member(A,Analyses),\+index_analysis_complete(A),
       Issue=issue{path:A.path,reason:A.freshness}),Issues),
    Index=provider_index{schema:'powder.source-pack-providers.v1',stamp:Stamp,
      coverage:coverage{complete:Complete,scope:Scope,issues:Issues},
      providers:Providers},
    write_document(File,Expected,Index,Revision),
    retractall(provider_memory(_,_,_)),
    length(Analyses,SourceCount),length(Providers,ProviderCount),
    Reply=provider_index_reply{revision:Revision,sources:SourceCount,providers:ProviderCount,
                              coverage:Index.coverage}.
manifest_paths(Manifest,Paths) :- pairs_keys(Manifest,Raw),maplist(pack_path,Raw,Ps),sort(Ps,Paths).
catalogue_stamp(Manifest,Stamp) :-
    findall(Path-CacheStamp,
      (member(Path-_,Manifest),source_absolute(Path,Source),cache_paths(Source,Cache,_),
       cache_stamp(Cache,CacheStamp)),Caches),
    findall(File-Hash,
      (member(Goal,[kb_source_packs:resolve_graph(_,_,_,_),
                    kb_file_dependencies:analyze_records(_,_,_,_),
                    kb_inventory_rules:rule_classification(_,_),
                    kb_inventory:declaration_target(_,_,_,_)]),
       source_file(Goal,File),file_digest(File,Hash)),Analyzers),
    terms_digest([provider_analysis(1,Analyzers),Manifest,Caches],Stamp).
cache_stamp(File,Stamp) :-
    (exists_file(File)->size_file(File,Size),time_file(File,Time),Stamp=stat(Size,Time);Stamp=missing).
source_absolute(Path,Source) :- repo_root(Root),absolute_file_name(Path,Source,[relative_to(Root),access(none)]).
authorize_pack_sources([],[]) :- !.
authorize_pack_sources(Paths,Absolute) :- authorize_sources(Paths,Absolute).
pack_public(Source,Path) :-
    public_path(Source,Public),atomic_list_concat([First|Rest],'/',Public),downcase_atom(First,kbs),
    atomic_list_concat(['KBs'|Rest],'/',Path),pack_path(Path,Path).
index_analysis(Source,Analysis) :-
    pack_public(Source,Path),file_dependencies(Source,Info),
    (verified_source_info(Info,Source)->Freshness=verified
    ;Freshness=unverified_or_stale),
    Analysis=analysis{path:Path,info:Info,freshness:Freshness}.
verified_source_info(Info,Source) :-
    Info.status\==unavailable,get_dict(sha256,Info.source,Expected),Expected\==null,
    file_digest(Source,Hash),Hash==Expected.
index_analysis_complete(A) :- A.freshness==verified,analysis_complete(A).
analysis_complete(A) :-
    A.info.coverage.records==complete,A.info.coverage.definitions==complete,
    A.info.coverage.references==complete.
analysis_provider(A,Provider) :-
    A.info.status\==unavailable,
    (Kind=defined,Entries=A.info.symbols.defined;Kind=declared,Entries=A.info.symbols.declared),
    is_list(Entries),member(Entry,Entries),\+logical_operator(Entry.symbol),
    Provider=provider{symbol:Entry.symbol,path:A.path,kind:Kind,evidence:Entry.evidence}.

provider_index(Index) :-
    providers_file(File),
    (exists_file(File)->
      cache_stamp(File,Stamp),
      (provider_memory(File,Stamp,Saved)->true;
       read_document(File,Raw),validate_provider_index(Raw,Validated),provider_lookup(Validated,Saved),
       retractall(provider_memory(_,_,_)),assertz(provider_memory(File,Stamp,Saved))),
      directory_manifest('KBs',_,Manifest),catalogue_stamp(Manifest,Current),
      (Saved.stamp==Current->Index=Saved;
       Index=Saved.put(coverage,coverage{complete:false,scope:stale,
         issues:[issue{reason:provider_catalogue_changed}]}))
    ;Index=provider_index{coverage:coverage{complete:false,scope:absent,
                           issues:[issue{reason:provider_index_missing}]},providers:[]}).
validate_provider_index(Raw,Index) :-
    (Raw.schema=='powder.source-pack-providers.v1'->true;domain_error(provider_index_schema,Raw.schema)),
    must_be(list,Raw.providers),
    forall(member(P,Raw.providers),(pack_path(P.path,_),must_be(atom,P.symbol),
      (memberchk(P.kind,[defined,declared])->true;domain_error(provider_kind,P.kind)),
      must_be(list,P.evidence))),
    (memberchk(Raw.coverage.complete,[true,false])->Index=Raw;
     domain_error(provider_index_coverage,Raw.coverage.complete)).

resolve_pack(Id,Expected,Choices,Resolution) :-
    get_pack(Id,Saved),check_revision(Expected,Saved.revision),
    normalize_choices(Choices,Overrides),merge_choices(Saved.pack.choices,Overrides,Merged),
    Pack=Saved.pack.put(choices,Merged),provider_index(Index),
    pack_paths(Pack,Seeds),read_analyses(Seeds,Initial),
    resolve_live(Pack,Index,Initial,Plan),
    Resolution=Plan.put(revision,Saved.revision).
merge_choices(Old,Overrides,Merged) :-
    exclude(overridden(Overrides),Old,Kept),append(Kept,Overrides,Merged).
overridden(Overrides,C) :- member(New,Overrides),New.symbol==C.symbol,!.
read_analyses(Paths,Analyses) :-
    partition(existing_pack_source,Paths,Existing,Missing),
    catch((authorize_pack_sources(Existing,Absolute),Authorization=ok),Error,Authorization=error(Error)),
    (Authorization==ok->maplist(live_analysis,Absolute,Available)
    ;Authorization=error(E),message_to_string(E,Message),
     maplist(unavailable_analysis(authorization_failed,Message),Existing,Available)),
    maplist(unavailable_analysis(source_missing,"A saved root/provider no longer exists."),Missing,Absent),
    append(Available,Absent,Analyses).
existing_pack_source(Path) :- source_absolute(Path,Source),exists_file(Source).
live_analysis(Source,analysis{path:Path,info:Info}) :- pack_public(Source,Path),file_dependencies(Source,Info).
unavailable_analysis(Code,Message,Path,Analysis) :-
    Info=dependencies{status:unavailable,source:source{sha256:null},cache:cache_info{normalizedDigest:null},
      coverage:coverage{records:unknown,definitions:unknown,references:unknown},
      reasons:[reason{code:Code,message:Message}],
      symbols:symbols{defined:null,declared:null,referenced:null,outbound:null},
      microtheories:microtheories{outbound:null}},
    Analysis=analysis{path:Path,info:Info}.
resolve_live(Pack,Index,Analyses,Plan) :-
    resolve_graph(Pack,Index,Analyses,Next),
    findall(Path,(member(M,Next.pack.members),Path=M.path,\+analysis_at(Analyses,Path,_)),Needed),
    (Needed==[]->Plan=Next
    ;read_analyses(Needed,More),append(Analyses,More,All),resolve_live(Pack,Index,All,Plan)).

resolve_graph(Input,Index,Analyses,Resolution) :-
    normalize_pack(Input,Pack),provider_lookup(Index,Indexed),
    pack_paths(Pack,Seeds),closure(Seeds,Pack,Indexed,Analyses,Paths),
    pack_providers(Paths,Analyses,Providers),pack_references(Paths,Analyses,References),
    findall(U,(member(S,References),\+provider_symbol(Providers,S),
               unresolved_symbol(S,Pack,Indexed,U)),DependencyIssues),
    findall(U,choice_issue(Pack,Analyses,U),ChoiceIssues),
    findall(Issue,(member(P,Paths),analysis_issue(Analyses,P,Issue)),AnalysisIssues),
    append([DependencyIssues,ChoiceIssues,AnalysisIssues],Issues0),sort(Issues0,Issues),
    maplist(composition_member(Pack,Providers,References,Analyses),Paths,Members),
    findall(Change,
      (member(M,Members),member(Old,Pack.members),Old.path==M.path,
       json_ground(Old.identity,Before),json_ground(M.identity,After),Before\==After,
       Change=change{path:M.path,reason:member_snapshot_changed}),Changes),
    findall(support{symbol:S,providers:Ps},
      (member(S,References),\+member(provider{symbol:S,kind:defined,path:_,evidence:_},Providers),
       findall(P,(member(P,Providers),P.symbol==S,P.kind==declared),Ps),Ps\=[]),DeclaredOnly),
    findall(mt_dependencies{path:P,outbound:MT},
      (member(P,Paths),analysis_at(Analyses,P,A),MT=A.info.microtheories.outbound),MTDependencies),
    (Issues==[]->Ready=true,State=resolved;Ready=false,State=needs_resolution),
    Coverage=coverage{predicateAnalysis:Ready,globalProviders:Index.coverage,
      declaredOnly:DeclaredOnly,sourceFreshness:unverified_until_load,mtAutoResolution:false},
    Summary=resolution{ready:Ready,state:State,coverage:Coverage},
    Resolved=Pack.put(pack{members:Members,resolution:Summary}),
    Resolution=source_pack_resolution{pack:Resolved,ready:Ready,state:State,coverage:Coverage,
      unresolved:Issues,changes:Changes,microtheoryDependencies:MTDependencies}.
analysis_at(Analyses,Path,A) :- member(A,Analyses),A.path==Path,!.
analysis_issue(Analyses,Path,Issue) :-
    (analysis_at(Analyses,Path,A)->
      \+analysis_complete(A),
      Issue=issue{path:Path,reason:incomplete_predicate_analysis,
                  coverage:A.info.coverage,diagnostics:A.info.reasons}
    ;Issue=issue{path:Path,reason:incomplete_predicate_analysis,
                 diagnostics:[reason{code:analysis_not_available}]}).
pack_providers(Paths,Analyses,Providers) :-
    findall(P,(member(Path,Paths),analysis_at(Analyses,Path,A),analysis_provider(A,P)),Raw),sort(Raw,Providers).
pack_references(Paths,Analyses,References) :-
    findall(S,(member(Path,Paths),analysis_at(Analyses,Path,A),
      Entries=A.info.symbols.referenced,is_list(Entries),member(E,Entries),
      S=E.symbol,\+logical_operator(S)),Ss),sort(Ss,References).
provider_symbol(Providers,S) :- member(P,Providers),P.symbol==S,!.
closure(Paths,Pack,Index,Analyses,Final) :-
    pack_providers(Paths,Analyses,Providers),pack_references(Paths,Analyses,References),
    (forall(member(P,Paths),(analysis_at(Analyses,P,A),analysis_complete(A)))->Known=true;Known=false),
    findall(Path,(member(S,References),\+provider_symbol(Providers,S),
      \+member_choice(Pack,S,_),Index.coverage.complete==true,
      Known==true,
      candidates(Index,S,[Only]),Path=Only.path),Added),
    append(Paths,Added,All),sort(All,Next),
    (Next==Paths->Final=Paths;closure(Next,Pack,Index,Analyses,Final)).
member_choice(Pack,S,C) :- member(C,Pack.choices),C.symbol==S,!.
candidates(Index,S,Candidates) :-
    (get_assoc(S,Index.providerLookup,Providers)->true;Providers=[]),
    findall(Path-P,(member(P,Providers),Path=P.path),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
    findall(candidate{path:Path,providers:Evidence},member(Path-Evidence,Groups),Candidates).
provider_lookup(Index,Indexed) :-
    (get_dict(providerLookup,Index,_)->Indexed=Index;
     findall(S-P,(member(P,Index.providers),S=P.symbol),Pairs),
     keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
     list_to_assoc(Groups,Lookup),Indexed=Index.put(providerLookup,Lookup)).
unresolved_symbol(S,Pack,Index,Issue) :-
    candidates(Index,S,Candidates),
    (member_choice(Pack,S,C)->
      (C.files==[]->Reason=declined;Reason=chosen_provider_unavailable)
    ;Index.coverage.complete\==true->Reason=incomplete_provider_index
    ;Candidates==[]->Reason=no_provider;Reason=ambiguous_providers),
    Issue=issue{symbol:S,reason:Reason,candidates:Candidates}.
choice_issue(Pack,Analyses,Issue) :-
    member(C,Pack.choices),member(Path,C.files),
    Symbol=C.symbol,\+chosen_provider(Analyses,Path,Symbol),
    Issue=issue{symbol:C.symbol,path:Path,reason:chosen_file_no_longer_provides_symbol}.
chosen_provider(Analyses,Path,Symbol) :-
    analysis_at(Analyses,Path,A),analysis_provider(A,P),P.symbol==Symbol,!.
composition_member(Pack,Providers,References,Analyses,Path,Member) :-
    (memberchk(Path,Pack.roots)->Role=root;Role=dependency),
    findall(Reason,
      (member(P,Providers),P.path==Path,memberchk(P.symbol,References),
       Reason=why{symbol:P.symbol,kind:P.kind,evidence:P.evidence}),Why),
    (analysis_at(Analyses,Path,A),A.info.status\==unavailable->
      Identity=identity{sourceHash:A.info.source.sha256,normalizedDigest:A.info.cache.normalizedDigest}
    ;Identity=null),
    Member=member{path:Path,role:Role,why:Why,identity:Identity}.

load_pack(Id,ExpectedRevision,ExpectedGeneration,Reply) :-
    get_pack(Id,Saved),check_revision(ExpectedRevision,Saved.revision),
    resolve_pack(Id,ExpectedRevision,[],Resolution),
    (Resolution.ready==true->true;throw(error(source_pack_unresolved(Resolution),_))),
    saved_composition(Saved.pack,Resolution.pack),
    findall(Path,(member(M,Resolution.pack.members),Path=M.path),Paths),
    authorize_pack_sources(Paths,Sources),
    maplist(verified_snapshot(Resolution.pack),Sources,Snapshots),
    packs_file(File),atom_concat(File,'.lock',LockFile),
    with_mutex(kb_source_packs,
      (try_lock(LockFile,Lock),
       (Lock==busy->throw(error(source_packs_busy,_));
        setup_call_cleanup(true,
          (get_pack(Id,BeforeLoad),check_revision(ExpectedRevision,BeforeLoad.revision),
           kb_store:add_cached_sources(Snapshots,ExpectedGeneration,Status0)),
          release_lock(Lock))))),
    json_ground(Status0,Status),
    Reply=source_pack_load{pack:Id,revision:Saved.revision,status:Status,
      coverage:Resolution.coverage.put(sourceFreshness,verified_selected_sources),
      microtheoryDependencies:Resolution.microtheoryDependencies}.
saved_composition(Saved,Resolved) :-
    json_ground(Saved.members,Before),json_ground(Resolved.members,After),
    (Before==After,Saved.resolution.ready==true->true;
     throw(error(source_pack_composition_not_saved,_))).
verified_snapshot(Pack,Source,Snapshot) :-
    pack_public(Source,Path),member(M,Pack.members),M.path==Path,!,
    file_digest(Source,Hash),
    (Hash==M.identity.sourceHash->true;throw(error(source_pack_source_changed(Path),_))),
    cache_paths(Source,Cache,_),file_digest(Cache,OutputHash),read_cache(Cache,Header,_),
    (Header.normalizedDigest==M.identity.normalizedDigest,Header.sourceHash==Hash->true;
     throw(error(source_pack_cache_changed(Path),_))),
    file_digest(Cache,After),
    (After==OutputHash->true;throw(error(source_pack_cache_changed(Path),_))),
    Snapshot=snapshot{source:Source,sourceHash:Hash,outputHash:OutputHash}.
