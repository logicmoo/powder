:- module(kb_urls, [app_base/1, app_mount/1, app_path/2, api_base/1, api_path/2, reload_base/0]).
:- use_module(kb_paths).
:- use_module(library(http/json)).
:- use_module(library(error)).
:- use_module(library(http/http_path),[http_clean_location_cache/0]).
:- dynamic configured_base/1.
:- multifile http:location/3.
http:location(openworld_dr,Base,[]) :- kb_urls:app_base(Base).

reload_base :-
    app_dir(App),directory_file_path(App,'web/paths.json',File),
    setup_call_cleanup(open(File,read,S,[encoding(utf8)]),json_read_dict(S,Definition),close(S)),
    atom_string(Base,Definition.appBase),
    atomic_list_concat([''|Parts],'/',Base),append(Segments,[''],Parts),
    (Segments\=[],forall(member(Segment,Segments),
      (Segment\=='',atom_codes(Segment,Codes),maplist(path_character,Codes)))->true;
      domain_error(application_base_path,Base)),
    retractall(configured_base(_)),assertz(configured_base(Base)),
    http_clean_location_cache.
path_character(Code) :- code_type(Code,alnum), !.
path_character(0'-).
path_character(0'_).
load_base :- reload_base.
:- initialization(reload_base).

app_base(Base) :- configured_base(Base).
app_mount(Mount) :- app_base(Base),atom_concat(Mount,'/',Base).
app_path(Path,URL) :- app_base(Base),atom_concat(Base,Path,URL).
api_base(Base) :- app_path('api/',Base).
api_path(Path,URL) :- api_base(Base),atom_concat(Base,Path,URL).
