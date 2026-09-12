:- module(kb_catalog, [catalog/1, authorize_sources/2, authorize_statistics/2,
                       authorize_microtheory_files/2, directory_manifest/3, source_excerpt/3,
                       file_information/2, status_file_information/2, remember_startup_sources/0,
                       startup_sources/1]).
:- use_module(kb_paths).
:- use_module(kb_store, []).
:- use_module(kb_config,[server_settings/1,startup_selection/3]).
:- use_module(library(filesex)).
:- use_module(library(process)).
:- use_module(library(http/json)).
:- use_module(library(readutil)).
:- use_module(library(time)).
:- use_module(library(error)).
:- use_module(library(pairs)).
:- use_module(library(assoc)).
:- use_module(library(rbtrees),[rb_new/1,rb_visit/2]).
:- use_module(library(nb_rbtrees)).
:- dynamic source_measure/4.
:- dynamic initial_sources/1, diagnostic_index/2.

% Actual initial load, not draft selection or legacy saved preferences.
remember_startup_sources :-
    with_mutex(openworld_store,
      (initial_sources(_)->true;
       findall(P,(kb_store:source_info(S,_),public_path(S,P)),Paths0),
       sort(Paths0,Paths),assertz(initial_sources(Paths)))).
startup_sources(Startup) :-
    (initial_sources(InitialPaths)->InitialKnown=true;InitialKnown=false,InitialPaths=[]),
    Initial=_{known:InitialKnown,paths:InitialPaths,evidence:initial_successful_load},
    catch(configured_startup_sources(Configured),Error,
      (message_to_string(Error,Message),
       Configured=_{known:false,paths:[],evidence:configuration_unavailable,error:Message})),
    Startup=Configured.put(initial,Initial).

configured_startup_sources(Startup) :-
    server_settings(Settings),startup_selection([],Settings,Selected),
    findall(File,(member(Input,Selected),
      (exists_directory(Input)->kb_compile:discover_sources([Input],Children),member(File,Children);File=Input)),Concrete),
    maplist(startup_public_path,Concrete,Paths0),sort(Paths0,Paths),
    (Settings.startupConfigured==true->Evidence=configured_startup;Evidence=default_startup),
    Startup=_{known:true,paths:Paths,evidence:Evidence}.
startup_public_path(Input,Public) :-
    repo_root(Root),absolute_file_name(Input,Absolute,[relative_to(Root),access(none)]),
    public_path(Absolute,Public).

file_context(G,Active,Startup) :-
    kb_store:generation(G),startup_sources(Startup),
    live_diagnostics(G,Diagnostics),
    findall(P-D,(kb_store:source_info(S,Info),public_path(S,P),
                source_diagnostics(P,Info,Diagnostics,D)),Pairs),
    list_to_assoc(Pairs,Active).

% One in-memory projection per generation, never a scan for every displayed file.
live_diagnostics(G,Index) :- diagnostic_index(G,Index), !.
live_diagnostics(G,Index) :-
    rb_new(Tree),
    forall(kb_store:assertion(_,D),accumulate_diagnostics(Tree,D)),
    rb_visit(Tree,Totals),list_to_assoc(Totals,Index),
    retractall(diagnostic_index(_,_)),assertz(diagnostic_index(G,Index)).
accumulate_diagnostics(Tree,D) :-
    get_dict(source,D,Source),atom_string(Path,Source),
    recorded_count(D,warnings,W),recorded_count(D,errors,E),
    (nb_rb_get_node(Tree,Path,Node)->
      nb_rb_node_value(Node,Previous),add_diagnostics(counts(1,W,E),Previous,Next),
      nb_rb_set_node_value(Node,Next)
    ;nb_rb_insert(Tree,Path,counts(1,W,E))).
add_diagnostics(counts(N,W,E),counts(N0,W0,E0),counts(N1,W1,E1)) :-
    N1 is N+N0,known_sum(W,W0,W1),known_sum(E,E0,E1).
known_sum(A,B,Sum) :- (integer(A),integer(B)->Sum is A+B;Sum=null).
recorded_count(D,Key,N) :-
    (get_dict(Key,D,Values),is_list(Values)->length(Values,N);N=null).
source_diagnostics(Path,Info,Index,Diagnostics) :-
    (get_assoc(Path,Index,counts(N,AW,AE))->true;N=0,AW=0,AE=0),
    recorded_count(Info,warnings,CW),
    (get_dict(count,Info,N)->known_sum(CW,AW,W),E=AE;W=CW,E=null),
    Diagnostics=_{warnings:W,errors:E,evidence:live_recorded_entries,
      description:"Recorded compiler and assertion diagnostic entries; repeated entries are counted. No new validation is performed."}.

status_file_information(Status,Reply) :-
    with_mutex(openworld_store,
      (file_context(_,Active,Startup),maplist(file_membership(Active,Startup),Status.files,Files))),
    Reply=Status.put(_{files:Files,startup:Startup}).

file_information(Paths,Reply) :-
    must_be(list,Paths),length(Paths,N),
    (N=<16->true;throw(error(domain_error(file_information_batch,Paths),_))),
    authorize_sources(Paths,Sources),maplist(information_node,Sources,Nodes),
    catalog_artifacts(Nodes,Artifacts),
    with_mutex(openworld_store,
      (file_context(G,Active,Startup),maplist(file_membership(Active,Startup),Artifacts,Files))),
    get_time(Time),
    Reply=_{items:Files,generation:G,startup:Startup,observedAt:Time,
      cacheValidity:unchecked,indexValidity:unchecked}.
information_node(Source,_{path:Path,type:file,sizeBytes:null}) :- public_path(Source,Path).
file_membership(Active,Startup,Node,Tagged) :-
    (get_assoc(Node.path,Active,Diagnostics)->Loaded=true;
      Loaded=false,Diagnostics=_{warnings:null,errors:null,evidence:unavailable}),
    (Startup.known==true->(memberchk(Node.path,Startup.paths)->Initial=true;Initial=false);Initial=null),
    (get_dict(states,Node,States)->true;States=_{cached:null,indexed:null}),
    Tagged=Node.put(_{states:States.put(_{loaded:Loaded,startup:Initial}),diagnostics:Diagnostics}).

catalog(Catalog) :-
    native_catalog(Entries),
    statistics(walltime,[Start,_]),
    maplist(catalog_file(Start),Entries,Measured),
    catalog_artifacts(Measured,Artifacts),
    with_mutex(openworld_store,
      file_context(G,ActiveSet,Startup)),
    assoc_to_keys(ActiveSet,Active),
    maplist(file_membership(ActiveSet,Startup),Artifacts,Files),
    tree(Files,Nodes),
    get_time(ObservedAt),
    Catalog=_{root:'KBs',nodes:Nodes,generation:G,active:Active,startup:Startup,
              fileStates:_{observedAt:ObservedAt,artifactProbeLimit:4096,
                cacheEvidence:artifact_presence_only,indexEvidence:artifact_presence_only,
                cacheValidity:unchecked,indexValidity:unchecked,loadedEvidence:active_manifest},
              statistics:_{available:true,batchLimit:16,storage:adjacent_inventory_snapshots}}.

native_catalog(Entries) :-
    current_prolog_flag(windows,true), !,
    windows_paths(catalog,[],Entries).
native_catalog(Entries) :-
    kb_root(Root),
    findall(_{path:File,sizeBytes:Size,modified:Time},
      (directory_member(Root,File,[recursive(true),follow_links(false),file_type(regular)]),
       supported(File),size_file(File,Size),time_file(File,Time)),Entries).

windows_paths(Mode,Paths,Result) :-
    app_dir(App),directory_file_path(App,'windows_catalog.ps1',Script),kb_root(Root),
    atom_json_term(JSON,Paths,[]),
    (Mode==artifacts->cache_root(Cache),Extra=['-CacheRoot',Cache];Extra=[]),
    append(['-NoProfile','-NonInteractive','-ExecutionPolicy','Bypass','-File',Script,
            '-Root',Root,'-Mode',Mode],Extra,Arguments),
    setup_call_cleanup(
        process_create(path(powershell),Arguments,
          [stdin(pipe(In)),stdout(pipe(Out)),stderr(std),process(PID)]),
        (call_cleanup(format(In,'~a',[JSON]),close(In)),
         call_cleanup(read_string(Out,_,Text),close(Out))),
        process_wait(PID,Exit)),
    ( Exit == exit(0) -> atom_json_dict(Text,Result,[])
    ; throw(error(permission_error(access,source_catalog,Mode),_)) ).

supported(File) :-
    file_name_extension(_,Ext0,File),downcase_atom(Ext0,Ext),
    memberchk(Ext,[kif,krf,meld,metta]).

catalog_file(Start, Entry, Node) :-
    resolve_source(Entry.path,File),public_path(File,Public),
    source_lines(File,Entry.modified,Entry.sizeBytes,Start,Lines),
    file_base_name(Entry.path,Name),
    Node=_{path:Public,name:Name,type:file,lineCount:Lines,sizeBytes:Entry.sizeBytes}.

catalog_artifacts(Files,Tagged) :-
    length(Files,N),Bound is min(N,4096),length(First,Bound),append(First,Rest,Files),
    maplist(artifact_request,First,Requests),
    (Requests==[]->Results=[];
      catch((current_prolog_flag(windows,true)->windows_paths(artifacts,Requests,Results);
        maplist(portable_artifacts,Requests,Results)),_,fail)->true;Results=[]),
    (same_length(First,Results)->maplist(artifact_node,First,Results,Checked);
      maplist(unknown_artifact_node,First,Checked)),
    maplist(unknown_artifact_node,Rest,Unchecked),append(Checked,Unchecked,Tagged).
artifact_request(Node,_{source:Source,data:Data,index:Index}) :-
    repo_root(Repo),absolute_file_name(Node.path,Source,[relative_to(Repo),access(none)]),
    cache_paths(Source,Data,Index).
portable_artifacts(Request,_{cached:Cached,indexed:Indexed,sizeBytes:Size}) :-
    artifact_presence(Request.data,Cached),artifact_presence(Request.index,Indexed),
    (catch(size_file(Request.source,Size0),_,fail)->Size=Size0;Size=null).
artifact_presence(File,Presence) :-
    repo_root(Root),
    (catch(no_links_to_root(File,Root),_,fail)->
      (exists_directory(File)->Presence=null;exists_file(File)->Presence=true;Presence=false)
    ;Presence=null).
artifact_node(Node,Result,Tagged) :-
    (is_dict(Result),get_dict(cached,Result,C),memberchk(C,[true,false])->Cached=C;Cached=null),
    (is_dict(Result),get_dict(indexed,Result,I),memberchk(I,[true,false])->Indexed=I;Indexed=null),
    (get_dict(sizeBytes,Result,Size),integer(Size),Size>=0->Measured=Node.put(sizeBytes,Size);Measured=Node),
    Tagged=Measured.put(states,_{cached:Cached,indexed:Indexed}).
unknown_artifact_node(Node,Tagged) :- Tagged=Node.put(states,_{cached:null,indexed:null}).

source_lines(File,Modified,Size,_,Lines) :- source_measure(File,Modified,Size,Lines), !.
source_lines(File,Modified,Size,Start,Lines) :-
    statistics(walltime,[Now,_]),
    ( Size =< 1048576, Now-Start < 1000 ->
      catch(call_with_time_limit(0.15,count_lines(File,Count)),time_limit_exceeded,Count=null),
      Lines=Count
    ; Lines=null ),
    retractall(source_measure(File,_,_,_)),assertz(source_measure(File,Modified,Size,Lines)).
count_lines(File,Lines) :-
    setup_call_cleanup(open(File,read,S,[encoding(octet)]),count_stream(S,0,Lines),close(S)).
count_stream(S,N,Lines) :-
    read_line_to_codes(S,Codes),
    ( Codes==end_of_file -> Lines=N ; Next is N+1,count_stream(S,Next,Lines) ).

tree(Files,Nodes) :-
    maplist(file_components,Files,Items),tree_level(Items,'KBs',Nodes).
file_components(File,Parts-File) :-
    atomic_list_concat([_|Parts],'/',File.path).
tree_level(Items,Parent,Nodes) :-
    findall(Name-(Rest-File),member([Name|Rest]-File,Items),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
    maplist(tree_node(Parent),Groups,Nodes).
tree_node(_,_-[[]-File],File) :- !.
tree_node(Parent,Name-Children,Node) :-
    atomic_list_concat([Parent,Name],'/',Path),
    tree_level(Children,Path,Nodes),
    maplist(node_state_coverage,Nodes,Coverages),
    foldl(add_state_coverage,Coverages,
      _{total:0,cached:0,indexed:0,loaded:0,startup:0,
        cachedUnknown:0,indexedUnknown:0,loadedUnknown:0,startupUnknown:0,
        warnings:0,errors:0,sizeBytes:0,warningsUnknown:0,errorsUnknown:0,sizeBytesUnknown:0},Coverage),
    Node=_{path:Path,name:Name,type:directory,children:Nodes,stateCoverage:Coverage}.
node_state_coverage(Node,Coverage) :- Node.type==directory, !,Coverage=Node.stateCoverage.
node_state_coverage(Node,_{total:1,cached:C,indexed:I,loaded:L,startup:S,
    cachedUnknown:CU,indexedUnknown:IU,loadedUnknown:LU,startupUnknown:SU,
    warnings:W,errors:E,sizeBytes:B,warningsUnknown:WU,errorsUnknown:EU,sizeBytesUnknown:BU}) :-
    (get_dict(states,Node,States)->true;States=_{}),
    state_count(States,cached,C,CU),state_count(States,indexed,I,IU),
    state_count(States,loaded,L,LU),state_count(States,startup,S,SU),
    (get_dict(diagnostics,Node,Diagnostics)->true;Diagnostics=_{}),
    recorded_metric(Diagnostics,warnings,W,WU),recorded_metric(Diagnostics,errors,E,EU),
    recorded_metric(Node,sizeBytes,B,BU).
recorded_metric(Dict,Key,Value,Unknown) :-
    (get_dict(Key,Dict,N),integer(N),N>=0->Value=N,Unknown=0;Value=0,Unknown=1).
state_count(States,Key,Count,Unknown) :-
    (get_dict(Key,States,true)->Count=1,Unknown=0;
     get_dict(Key,States,false)->Count=0,Unknown=0;Count=0,Unknown=1).
add_state_coverage(A,B,Sum) :-
    dict_pairs(B,Tag,Pairs),maplist(add_state_count(A),Pairs,Added),dict_pairs(Sum,Tag,Added).
add_state_count(A,Key-B,Key-Sum) :- get_dict(Key,A,N),Sum is N+B.

authorize_sources(Paths,Absolute) :-
    concrete_sources(Paths,Absolute),
    ( current_prolog_flag(windows,true) ->
        windows_paths(authorize,Absolute,_)
    ; maplist(no_link_source,Absolute)
    ).
concrete_sources(Paths,Absolute) :-
    must_be(list,Paths),maplist(relative_source,Paths,Absolute0),sort(Absolute0,Absolute).

% Authorize originals and their fixed adjacent sidecars in one native batch.
% Callers cannot supply a JSON filename, nor follow a sidecar reparse point.
authorize_statistics(Paths,Entries) :-
    concrete_sources(Paths,Absolute),
    ( current_prolog_flag(windows,true) ->
        windows_paths(statistics,Absolute,Entries)
    ; maplist(no_link_source,Absolute),maplist(statistics_entry,Absolute,Entries)
    ).
statistics_entry(Source,_{path:Source,availability:Availability}) :-
    atom_concat(Source,'.inventory.json',Sidecar),
    ( \+catch(no_link_source(Sidecar),_,fail) -> Availability=unsafe
    ; exists_file(Sidecar) -> Availability=available
    ; exists_directory(Sidecar) -> Availability=unsafe
    ; Availability=missing ).

authorize_microtheory_files(Names,Entries) :-
    must_be(list,Names),maplist(microtheory_file,Names,Files),
    (current_prolog_flag(windows,true)->windows_paths(mt_statistics,Files,Entries);
     maplist(microtheory_file_entry,Files,Entries)).
microtheory_file(Input,File) :-
    atom_string(Name,Input),file_base_name(Name,Name),
    file_name_extension(Stem,json,Name),Stem\=='',
    \+sub_atom(Name,_,_,_,'/'),\+sub_atom(Name,_,_,_,'\\'),\+sub_atom(Name,_,_,_,':'),
    kb_root(Root),directory_file_path(Root,microtheory,Directory),
    directory_file_path(Directory,Name,File), !.
microtheory_file(Name,_) :- throw(error(permission_error(access,mt_inventory,Name),_)).
microtheory_file_entry(File,_{path:File,availability:Availability}) :-
    (\+catch(no_link_source(File),_,fail)->Availability=unsafe;
     exists_directory(File)->Availability=unsafe;
     exists_file(File)->Availability=available;Availability=missing).

directory_manifest(Input,Public,Manifest) :-
    atom_string(Path,Input),\+sub_atom(Path,_,_,_,'\\'),
    atomic_list_concat(['KBs'|Parts],'/',Path),
    forall(member(Part,Parts),(Part\=='',Part\=='.',Part\=='..',\+sub_atom(Part,_,_,_,':'))),
    repo_root(Repo),absolute_file_name(Path,Directory,[relative_to(Repo),file_type(directory),access(read)]),
    (Path=='KBs'->Public='KBs';public_path(Directory,Public)),
    (current_prolog_flag(windows,true)->windows_paths(directory_statistics,[Directory],Entries);
     (Path=='KBs'->no_links_to_root(Directory,Directory);no_link_source(Directory)),
     findall(Entry,(directory_member(Directory,File,[recursive(true),follow_links(false),file_type(regular)]),
       supported(File),no_link_source(File),directory_entry(File,Entry)),Entries)),
    maplist(manifest_entry,Entries,Rows),sort(Rows,Manifest), !.
directory_manifest(Input,_,_) :- throw(error(permission_error(access,kb_directory,Input),_)).
directory_entry(File,Entry) :-
    size_file(File,Size),time_file(File,Time),statistics_entry(File,Side),
    atom_concat(File,'.inventory.json',Inventory),
    (Side.availability==available->size_file(Inventory,ISize),time_file(Inventory,ITime);
     ISize=null,ITime=null),
    Entry=_{path:File,sizeBytes:Size,modified:Time,inventoryState:Side.availability,
            inventorySize:ISize,inventoryModified:ITime}.
manifest_entry(Entry,Public-identity(Entry.sizeBytes,Entry.modified,Entry.inventoryState,
                                   Entry.inventorySize,Entry.inventoryModified)) :-
    resolve_source(Entry.path,File),public_path(File,Public).
relative_source(Input,Absolute) :-
    atom_string(Path,Input),
    \+ sub_atom(Path,_,_,_,'\\'),
    atomic_list_concat(Parts,'/',Path),
    Parts=['KBs'|Rest],Rest\=[],
    forall(member(P,Rest),(P\=='.',P\=='..',P\=='',\+sub_atom(P,_,_,_,':'))),
    supported(Path),
    repo_root(Root),absolute_file_name(Path,Absolute,[relative_to(Root),access(read)]),
    supported(Absolute),exists_file(Absolute), !.
relative_source(Path,_) :- throw(error(permission_error(access,kb_source,Path),_)).
no_link_source(Path) :-
    kb_root(Root),atom_concat(Root,'/',Prefix),
    atom_concat(Prefix,_,Path),
    no_links_to_root(Path,Root), !.
no_link_source(Path) :- throw(error(permission_error(access,kb_source,Path),_)).
no_links_to_root(Path,Root) :-
    \+read_link(Path,_,_),
    (Path==Root -> true ; file_directory_name(Path,Parent),no_links_to_root(Parent,Root)).

source_excerpt(Path,Line,Result) :-
    must_be(integer,Line),Line>0,Line=<100000000,
    authorize_sources([Path],[File]),Start is max(1,Line-10),
    file_name_extension(_,Ext0,File),downcase_atom(Ext0,Ext),
    (Ext==metta->Encoding=utf8;Encoding=iso_latin_1),
    setup_call_cleanup(open(File,read,S,[encoding(Encoding)]),
                       call_with_time_limit(2,excerpt_stream(S,1,Start,25,Lines)),close(S)),
    Result=_{path:Path,line:Line,start:Start,lines:Lines}.
excerpt_stream(_,_,_,0,[]) :- !.
excerpt_stream(S,N,Start,Left,Lines) :-
    read_line_to_string(S,Line),
    (Line==end_of_file -> Lines=[]
    ; Next is N+1,
      (N<Start -> excerpt_stream(S,Next,Start,Left,Lines)
      ; Lines=[Line|Tail],More is Left-1,excerpt_stream(S,Next,Start,More,Tail))).
