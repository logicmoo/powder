:- module(kb_tail_loader, [load_remaining/0, enable_includer/0, release_source/2]).
:- use_module(kb_runtime, []).
:- use_module(kb_legacy, []).
:- multifile user:term_expansion/2.
:- multifile prolog:comment_hook/3.
:- thread_local owned_stream/4.
:- thread_local pending_properties/2, last_assertion/2, seen_property/4.
:- thread_local pending_origin/4.

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
    prolog_load_context(source, Owner),
    retractall(pending_include(Module, Source, _)),
    asserta(pending_include(Module, Source, Owner)).

:- thread_local pending_include/3.

enable(Stream, Module, File) :-
    prolog_load_context(source, Owner),
    retractall(owned_stream(Stream, _, _, _)),
    asserta(owned_stream(Stream, Module, File, Owner)).

release_source(Owner,Module) :-
    forall(retract(owned_stream(Stream,Module,_,Owner)),clear_stream(Stream)),
    retractall(pending_include(Module,_,Owner)).
clear_stream(Stream) :-
    retractall(pending_properties(Stream,_)),retractall(last_assertion(Stream,_)),
    retractall(pending_origin(Stream,_,_,_)),
    retractall(seen_property(Stream,_,_,_)).

expand_owned(end_of_file, []) :-
    prolog_load_context(file, Owner),prolog_load_context(module, Module),
    owned_stream(_,Module,_,Owner), !,
    forall(owned_stream(Stream,Module,File,Owner),no_orphan_comments(Stream,File)),
    kb_runtime:register_native(Owner,Module),
    release_source(Owner,Module).
expand_owned(Term, Expanded) :-
    current_owned_stream(Stream,Module,_),
    expand_term_data(Term, Module, Stream, Expanded).

current_owned_stream(Stream,Module,File) :-
    prolog_load_context(stream, Stream),
    prolog_load_context(module, Module),
    prolog_load_context(file, File),
    ( owned_stream(Stream, Module, File, _)
    ; pending_include(Module, File, _),
      \+ helper_file(File),
      retract(pending_include(Module, File, _)),
      enable(Stream, Module, File)
    ).

helper_file(File) :- file_base_name(File, 'kb_dynamic_assert.pl').

expand_term_data(end_of_file, _, Stream, []) :- !,
    owned_stream(Stream,_,File,_),no_orphan_comments(Stream,File),
    retractall(owned_stream(Stream, _, _, _)),clear_stream(Stream).
expand_term_data(kb_cache_header(Header), _, _, []) :- !,
    kb_runtime:cache_warnings(Header).
expand_term_data(kb_cache_footer(_), _, _, []) :- !.
expand_term_data((Head :- Guard), Module, Stream, Expanded) :- !,
    kb_runtime:valid_guarded_clause(Head, Guard),
    functor(Head, Name, Arity),
    kb_runtime:install_guard(Module, Guard),
    arg(1,Guard,Id),
    retractall(last_assertion(Stream,_)),assertz(last_assertion(Stream,Id)),
    retractall(seen_property(Stream,_,_,_)),
    (retract(pending_properties(Stream,Props))->true;Props=[]),
    retractall(pending_origin(Stream,_,_,_)),
    properties_terms(Props,Id,Stream,Metadata),
    metadata_expansions(Metadata,Declarations),
    Expanded = [(:- dynamic(Name/Arity)), (:- multifile(Name/Arity)),
                (Head :- Guard)|Declarations].
expand_term_data(Term, _, Stream, Expanded) :-
    nonvar(Term),functor(Term,last_clause,_), !,
    (last_assertion(Stream,Id)->true;native_error('Orphan last_clause metadata')),
    catch(kb_legacy:legacy_annotation(Term,Props),
          error(legacy_metadata_error(Message),_),native_error(Message)),
    properties_terms(Props,Id,Stream,Metadata),
    metadata_expansions(Metadata,Expanded).
expand_term_data(Metadata, _, Stream, Expanded) :-
    compound(Metadata), functor(Metadata, Name, 2),
    atom_concat(xc_, _, Name), ground(Metadata), !,
    Metadata=..[Name,Id,Value],atom_concat(xc_,Property,Name),
    properties_terms([Property-Value],Id,Stream,Terms),
    metadata_expansions(Terms,Expanded).
expand_term_data(Term, _, _, _) :-
    throw(error(domain_error(guarded_kb_term, Term), _)).

properties_terms([],_,_,[]).
properties_terms([Property-Value|Rest],Id,Stream,Terms) :-
    ( seen_property(Stream,Id,Property,Previous) ->
      (Previous==Value->Terms=Tail;native_error('Conflicting assertion metadata'))
    ; assertz(seen_property(Stream,Id,Property,Value)),
      atom_concat(xc_,Property,Name),Term=..[Name,Id,Value],Terms=[Term|Tail]
    ),
    properties_terms(Rest,Id,Stream,Tail).
metadata_expansions([],[]).
metadata_expansions([Term|Rest],[(:-dynamic(Name/2)),(:-multifile(Name/2)),Term|Tail]) :-
    functor(Term,Name,2),metadata_expansions(Rest,Tail).

capture_comments(Comments,Position,_) :-
    current_owned_stream(Stream,_,File),
    source_location(SourceFile,SourceLine),
    % Nested read_term/3 for inert provenance resets SWI's source location.
    setup_call_cleanup(true,
      capture_owned_comments(Stream,File,Comments,Position),
      system:'$set_source_location'(SourceFile,SourceLine)).
capture_owned_comments(Stream,File,Comments,Position) :-
    maplist(located_comments(File,Position),Comments,Groups),append(Groups,Props),
    (Props=[]->true;
      (retract(pending_properties(Stream,Before))->true;Before=[]),
      (Before=[]->
        once((nth0(N,Groups,[_|_]),nth0(N,Comments,At-_))),
        stream_position_data(line_count,At,Line),
        stream_position_data(line_position,At,Column0),Column is Column0+1,
        assertz(pending_origin(Stream,File,Line,Column));
        true),
      append(Before,Props,All),assertz(pending_properties(Stream,All))).
located_comments(File,TermPosition,Comment,Properties) :-
    kb_legacy:parse_metadata_comments([Comment],File,Properties),
    (Properties=[]->true;
      Comment=Position-_,
      stream_position_data(char_count,Position,Start),
      stream_position_data(char_count,TermPosition,TermStart),
      (Start=<TermStart->true;comment_error(File,Position,'Metadata comments must precede an assertion'))).
no_orphan_comments(Stream,File) :-
    (pending_properties(Stream,[_|_])->
      pending_origin(Stream,File,Line,Column),
      throw(error(source_error(File,Line,Column,'Orphan metadata comment at end of source'),_));
      true).
native_error(Message) :-
    prolog_load_context(file,File),prolog_load_context(term_position,Position),
    comment_error(File,Position,Message).
comment_error(File,Position,Message) :-
    stream_position_data(line_count,Position,Line),
    stream_position_data(line_position,Position,Column0),Column is Column0+1,
    throw(error(source_error(File,Line,Column,Message),_)).

user:term_expansion(Term, Expanded) :-
    kb_tail_loader:expand_owned(Term, Expanded).

prolog:comment_hook(Comments,Position,Term) :-
    kb_tail_loader:capture_comments(Comments,Position,Term).
