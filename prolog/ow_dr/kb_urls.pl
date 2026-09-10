:- module(kb_urls, [app_base/1, app_mount/1, app_path/2, api_base/1, api_path/2]).
:- use_module(kb_paths).
:- use_module(library(http/json)).
:- use_module(library(error)).
:- dynamic configured_base/1.

load_base :-
    app_dir(App),directory_file_path(App,'web/paths.json',File),
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),json_read_dict(S,Definition),close(S)),
    atom_string(Base,Definition.appBase),
    atomic_list_concat([''|Parts],'/',Base),append(Segments,[''],Parts),
    (Segments\=[],forall(member(Segment,Segments),
      (Segment\=='',atom_codes(Segment,Codes),maplist(path_character,Codes)))->true;
      domain_error(application_base_path,Base)),
    retractall(configured_base(_)),assertz(configured_base(Base)).
path_character(Code) :- code_type(Code,alnum), !.
path_character(0'-).
path_character(0'_).
:- initialization(load_base).

app_base(Base) :- configured_base(Base).
app_mount(Mount) :- app_base(Base),atom_concat(Mount,'/',Base).
app_path(Path,URL) :- app_base(Base),atom_concat(Base,Path,URL).
api_base(Base) :- app_path('api/',Base).
api_path(Path,URL) :- api_base(Base),atom_concat(Base,Path,URL).
