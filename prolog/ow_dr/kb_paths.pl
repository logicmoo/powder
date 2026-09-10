:- module(kb_paths, [app_dir/1, repo_root/1, default_source/1, kb_root/1,
                     resolve_source/2, public_path/2]).
:- use_module(library(filesex)).

:- dynamic app_directory/1.
:- prolog_load_context(directory, App), retractall(app_directory(_)), asserta(app_directory(App)).

app_dir(Path) :- app_directory(Path).
repo_root(Root) :-
    app_dir(App), file_directory_name(App, Prolog),
    file_directory_name(Prolog, Root).
kb_root(Root) :- repo_root(Repo), directory_file_path(Repo, 'KBs', Root).
default_source(Source) :- kb_root(Root), directory_file_path(Root, 'tinyKB.kif', Source).

resolve_source(Input, Absolute) :-
    atom_string(Path, Input),
    ( exists_file(Path) ; exists_directory(Path) ), !,
    absolute_file_name(Path, Absolute, [access(read)]).
resolve_source(Input, Absolute) :-
    atom_string(Path, Input), repo_root(Root),
    absolute_file_name(Path, Absolute, [relative_to(Root), access(read)]).

public_path(Absolute, Public) :-
    repo_root(Root), atom_concat(Root, '/', Prefix),
    ( atom_concat(Prefix, Relative, Absolute) ->
      ( atom_concat('kbs/', Rest, Relative) -> atom_concat('KBs/',Rest,Public)
      ; Public=Relative )
    ; Public = Absolute
    ).
