:- module(kb_catalog, [catalog/1, authorize_sources/2, source_excerpt/3]).
:- use_module(kb_paths).
:- use_module(kb_store, []).
:- use_module(library(filesex)).
:- use_module(library(process)).
:- use_module(library(http/json)).
:- use_module(library(readutil)).
:- use_module(library(time)).
:- use_module(library(error)).
:- use_module(library(pairs)).
:- dynamic source_measure/4.

catalog(Catalog) :-
    native_catalog(Entries),
    statistics(walltime,[Start,_]),
    maplist(catalog_file(Start),Entries,Files),
    tree(Files,Nodes),
    kb_store:generation(G),
    findall(P,(kb_store:source_info(S,_),public_path(S,P)),Active),
    Catalog=_{root:'KBs',nodes:Nodes,generation:G,active:Active}.

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
    setup_call_cleanup(
        process_create(path(powershell),
          ['-NoProfile','-NonInteractive','-ExecutionPolicy','Bypass','-File',Script,
           '-Root',Root,'-Mode',Mode],
          [stdin(pipe(In)),stdout(pipe(Out)),stderr(std),process(PID)]),
        (call_cleanup(format(In,'~a',[JSON]),close(In)),
         call_cleanup(read_string(Out,_,Text),close(Out))),
        process_wait(PID,Exit)),
    ( Exit == exit(0) -> atom_json_dict(Text,Result,[])
    ; throw(error(permission_error(access,source_catalog,Mode),_)) ).

supported(File) :-
    file_name_extension(_,Ext0,File),downcase_atom(Ext0,Ext),
    memberchk(Ext,[kif,krf,metta]).

catalog_file(Start, Entry, Node) :-
    resolve_source(Entry.path,File),public_path(File,Public),
    source_lines(File,Entry.modified,Entry.sizeBytes,Start,Lines),
    file_base_name(Entry.path,Name),
    Node=_{path:Public,name:Name,type:file,lineCount:Lines,sizeBytes:Entry.sizeBytes}.

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
    Node=_{path:Path,name:Name,type:directory,children:Nodes}.

authorize_sources(Paths,Absolute) :-
    must_be(list,Paths),maplist(relative_source,Paths,Absolute0),sort(Absolute0,Absolute),
    ( current_prolog_flag(windows,true) ->
        windows_paths(authorize,Absolute,_)
    ; maplist(no_link_source,Absolute)
    ).
relative_source(Input,Absolute) :-
    atom_string(Path,Input),
    \+ sub_atom(Path,_,_,_,'\\'),
    atomic_list_concat(Parts,'/',Path),
    Parts=['KBs'|Rest],Rest\=[],
    forall(member(P,Rest),(P\=='.',P\=='..',P\=='',\+sub_atom(P,_,_,_,':'))),
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
    file_name_extension(_,Ext,File),(Ext==metta->Encoding=utf8;Encoding=iso_latin_1),
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
