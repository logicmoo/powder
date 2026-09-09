:- module(kb_tail_loader, [load_remaining/0, enable_includer/0]).
:- use_module(kb_runtime, []).
:- multifile user:term_expansion/2.
:- thread_local owned_stream/4.

load_remaining :-
    prolog_load_context(stream, Stream),
    prolog_load_context(module, Module),
    prolog_load_context(file, File),
    enable(Stream, Module, File).

enable_includer :-
    % SWI's public source context is outermost, not the immediate includer.
    % This narrow adapter selects the current include frame, never a file stream.
    prolog_load_context(module, Module),
    system:'$input_context'([input(include, Source, _, _)|_]),
    retractall(pending_include(Module, Source)),
    asserta(pending_include(Module, Source)).

:- thread_local pending_include/2.

enable(Stream, Module, File) :-
    prolog_load_context(source, Owner),
    retractall(owned_stream(Stream, _, _, _)),
    asserta(owned_stream(Stream, Module, File, Owner)).

expand_owned(end_of_file, []) :-
    prolog_load_context(file, Owner),prolog_load_context(module, Module),
    owned_stream(_,Module,_,Owner), !,
    kb_runtime:register_native(Owner,Module),
    retractall(owned_stream(_,Module,_,Owner)).
expand_owned(Term, Expanded) :-
    prolog_load_context(stream, Stream),
    prolog_load_context(module, Module),
    prolog_load_context(file, File),
    ( owned_stream(Stream, Module, File, _)
    ; pending_include(Module, File),
      \+ helper_file(File),
      retract(pending_include(Module, File)),
      enable(Stream, Module, File)
    ),
    expand_term_data(Term, Module, Stream, Expanded).

helper_file(File) :- file_base_name(File, 'kb_dynamic_assert.pl').

expand_term_data(end_of_file, _, Stream, []) :- !,
    retractall(owned_stream(Stream, _, _, _)).
expand_term_data(kb_cache_header(_), _, _, []) :- !.
expand_term_data(kb_cache_footer(_), _, _, []) :- !.
expand_term_data((Head :- Guard), Module, _, Expanded) :- !,
    kb_runtime:valid_guarded_clause(Head, Guard),
    functor(Head, Name, Arity),
    kb_runtime:install_guard(Module, Guard),
    Expanded = [(:- dynamic(Name/Arity)), (:- multifile(Name/Arity)),
                (Head :- Guard)].
expand_term_data(Metadata, _, _, Expanded) :-
    compound(Metadata), functor(Metadata, Name, 2),
    atom_concat(xc_, _, Name), ground(Metadata), !,
    Expanded = [(:- dynamic(Name/2)), (:- multifile(Name/2)), Metadata].
expand_term_data(Term, _, _, _) :-
    throw(error(domain_error(guarded_kb_term, Term), _)).

user:term_expansion(Term, Expanded) :-
    kb_tail_loader:expand_owned(Term, Expanded).
