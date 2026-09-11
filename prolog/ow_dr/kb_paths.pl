:- module(kb_paths, [app_dir/1, repo_root/1, default_source/1, kb_root/1,
                     resolve_source/2, public_path/2,
                     cache_paths/3, cache_source_base/2, cache_original_source/2,
                     cache_root/1, runtime_root/1]).
:- use_module(library(filesex)).

:- dynamic app_directory/1.
:- prolog_load_context(directory, App), retractall(app_directory(_)), asserta(app_directory(App)).

app_dir(Path) :- app_directory(Path).
repo_root(Root) :-
    app_dir(App), file_directory_name(App, Prolog),
    file_directory_name(Prolog, Root).
kb_root(Root) :- repo_root(Repo), directory_file_path(Repo, 'KBs', Root).
default_source(Source) :-
    kb_root(Root), directory_file_path(Root, 'tinyKB.krf', Source).

cache_root(Root) :- generated_root('KBs', Root).
runtime_root(Root) :- generated_root(runtime, Root).

generated_root(Name, Root) :-
    repo_root(Repo), directory_file_path(Repo, tmp, Tmp),
    directory_file_path(Tmp, Name, Path), canonical_path(Path, Root).

cache_paths(Source, Normal, Index) :-
    cache_source_base(Source, Base),
    atom_concat(Base, '.data', Normal), atom_concat(Base, '.index.data', Index).

cache_source_base(Source, Base) :-
    canonical_path(Source, Absolute), kb_root(KBs), canonical_path(KBs, Root),
    ( relative_path_under(Root, Absolute, Relative) ->
      cache_root(Cache), append_relative(Cache, Relative, Base)
    ; Base = Absolute
    ).

% Invert a cache base (without .data/.index.data/.stage suffixes), including
% missing originals, so recovery reports the source rather than a cache file.
cache_original_source(Base, Source) :-
    canonical_path(Base, Absolute), cache_root(Cache),
    ( relative_path_under(Cache, Absolute, Relative) ->
      kb_root(KBs), canonical_path(KBs, Root), append_relative(Root, Relative, Source)
    ; Source = Absolute
    ).

canonical_path(Input, Absolute) :-
    repo_root(Repo),
    absolute_file_name(Input, Absolute, [relative_to(Repo), access(none)]).

relative_path_under(Root, Root, '') :- !.
relative_path_under(Root, Path, Relative) :-
    atom_concat(Root, '/', Prefix), atom_concat(Prefix, Relative, Path).

append_relative(Root, '', Root) :- !.
append_relative(Root, Relative, Path) :- directory_file_path(Root, Relative, Path).

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
