:- module(kb_legacy,
          [ read_legacy/2,
            parse_metadata_comments/3,
            legacy_annotation/2
          ]).

/** <module> powder: inert legacy provenance adapter.

read_legacy(+File,-Records) reads UTF-8 Prolog *data*, producing
legacy_record(Clause,Properties). Clause variables remain fresh and shared
exactly as read. Properties are ground Property-Value pairs.

Recognized %-comment properties describe the next assertion. last_clause/1
and last_clause/2 annotate the previous assertion, even across inert
directives. Unknown properties in explicit last_clause annotations are
preserved; ordinary prose comments are ignored. kb_file_line becomes
source_line. Identical property repetitions coalesce; conflicts are errors.

Directives are returned as legacy_record(Directive,[]) without execution.
This API grants NO permission to consult its output, does not validate a
modern cache, and does not install operators, modules, term expansions or
encoding directives. Quasi quotations are captured without invoking their
handlers and then rejected. Custom source-declared operators are unsupported.

A loader's source_data(File,legacy,Records) may delegate here, then validate
and dispatch only its explicitly supported headers, clauses and metadata.
It must keep this path separate from strict modern-cache validation.

parse_metadata_comments(+Comments,+File,-Properties) consumes the standard
read_term/3 Position-Text comment list without maintaining attachment state.
legacy_annotation(+Term,-Properties) recognizes validated last_clause terms;
it fails for other terms and throws legacy_metadata_error(Message) for bad
annotations. Native-loader adapters own stream scoping, attachment direction
and orphan checks; neither helper executes input or creates trusted caches.
*/

:- use_module(library(apply)).
:- use_module(library(error)).
:- use_module(library(lists)).

read_legacy(File,Records) :-
    must_be(atom,File),
    setup_call_cleanup(
        open(File,read,Stream,[encoding(utf8),type(text)]),
        once(read_records(Stream,File,none,[],Records)),
        close(Stream)).

parse_metadata_comments(Comments,File,Properties) :-
    must_be(list,Comments),must_be(atom,File),
    comment_properties(Comments,File,unbounded,0,Located),
    merge_properties(Located,[],File,Properties), !.

legacy_annotation(Term,Properties) :-
    must_be(nonvar,Term),
    annotation_term(Term),
    catch(( annotation_properties(Term,'<annotation>',1,1,Located),
            merge_properties(Located,[],'<annotation>',Properties) ),
          error(source_error(_,_,_,Message),_),
          throw(error(legacy_metadata_error(Message),
                      context(kb_legacy:legacy_annotation/2,'Invalid inert legacy annotation')))), !.

read_records(Stream,File,Previous,Pending,Records) :-
    stream_location(Stream,FallbackLine,FallbackColumn),
    catch(read_data(Stream,Term,Comments,Position,Kind),
          Error,read_error(Error,File,FallbackLine,FallbackColumn)),
    position_location(Position,Line,Column),
    comment_properties(Comments,File,Line,Column,CommentProperties),
    append(Pending,CommentProperties,Forward),
    ( Kind==eof
    -> require_no_orphans(Forward,File),
       flush_previous(Previous,Records,[])
    ; annotation_term(Term)
    -> annotate_previous(Term,Previous,File,Line,Column,Updated),
       read_records(Stream,File,Updated,Forward,Records)
    ; directive_term(Term)
    -> retain_directive(Term,Previous,Updated,Records,Tail),
       read_records(Stream,File,Updated,Forward,Tail)
    ; merge_properties(Forward,[],File,Properties),
      flush_previous(Previous,Records,Tail),
      read_records(Stream,File,previous(Term,Properties,Aux,Aux),[],Tail)
    ).

read_data(Stream,Term,Comments,Position,Kind) :-
    read_term(Stream,Term,
              [ module(kb_legacy), syntax_errors(error), comments(Comments),
                term_position(Position), quasi_quotations(Quotations),
                cycles(false), double_quotes(string)
              ]),
    ( Quotations==[] -> true
    ; throw(error(legacy_quasi_quotation,context(kb_legacy,'Quasi quotations are not inert clauses'))) ),
    stream_property(Stream,position(After)),
    stream_position_data(char_count,Position,StartChar),
    stream_position_data(char_count,After,EndChar),
    % SWI positions its synthetic EOF token at the final character (or -1
    % for an empty stream). A literal end_of_file. consumes a full term.
    ( Term==end_of_file, StartChar>=EndChar-1 -> Kind=eof ; Kind=term ).

annotation_term(Term) :-
    nonvar(Term), functor(Term,last_clause,_).
directive_term(Term) :-
    nonvar(Term),
    ( functor(Term,':-',1); functor(Term,'?-',1) ).

retain_directive(Term,none,none,[legacy_record(Term,[])|Tail],Tail).
retain_directive(Term,previous(Clause,Props,Head,Last),
                 previous(Clause,Props,Head,Next),Records,Records) :-
    Last=[legacy_record(Term,[])|Next].

flush_previous(none,Tail,Tail).
flush_previous(previous(Clause,Props,Aux,End),
               [legacy_record(Clause,Props)|Aux],End).

annotate_previous(_,none,File,Line,Column,_) :- !,
    legacy_error(File,Line,Column,'Orphan last_clause annotation: no preceding assertion').
annotate_previous(Term,previous(Clause,Before,Aux,End),File,Line,Column,
                  previous(Clause,After,Aux,End)) :-
    annotation_properties(Term,File,Line,Column,Properties),
    merge_properties(Properties,Before,File,After).

annotation_properties(last_clause(Items),File,Line,Column,Properties) :-
    is_list(Items), !,
    maplist(annotation_item(File,Line,Column),Items,Properties).
annotation_properties(last_clause(Property,Value),File,Line,Column,[Located]) :- !,
    located_property(Property,Value,File,Line,Column,Located).
annotation_properties(_,File,Line,Column,_) :-
    legacy_error(File,Line,Column,'Malformed last_clause annotation: expected a property list or (Property,Value)').

annotation_item(File,Line,Column,Term,Located) :-
    ( nonvar(Term), compound(Term), compound_name_arguments(Term,Property,[Value])
    -> located_property(Property,Value,File,Line,Column,Located)
    ; legacy_error(File,Line,Column,'Malformed last_clause list item: expected Property(Value)') ).

located_property(Raw,Value,File,Line,Column,at(Property,Value,Line,Column)) :-
    ( atom(Raw), Raw\==''
    -> normalize_property(Raw,Property)
    ; legacy_error(File,Line,Column,'Metadata property name must be an atom') ),
    ( ground(Value), acyclic_term(Value)
    -> true ; legacy_error(File,Line,Column,'Metadata values must be ground, acyclic data') ),
    validate_value(Property,Value,File,Line,Column).

normalize_property(kb_file_line,source_line) :- !.
normalize_property(Property,Property).

validate_value(source_line,Value,File,Line,Column) :- !,
    ( integer(Value),Value>0 -> true
    ; legacy_error(File,Line,Column,'source_line must be a positive integer') ).
validate_value(mapping_rows,Value,File,Line,Column) :- !,
    ( is_list(Value) -> true
    ; legacy_error(File,Line,Column,'mapping_rows must be a proper ground list') ).
validate_value(kb_names,Value,File,Line,Column) :- !,
    ( is_list(Value), maplist(string,Value) -> true
    ; legacy_error(File,Line,Column,'kb_names must be a list of original variable-name strings') ).
validate_value(_,_,_,_,_).

merge_properties([],Properties,_,Properties).
merge_properties([at(Key,Value,Line,Column)|More],Before,File,After) :-
    add_property(Key,Value,Before,File,Line,Column,Next),
    merge_properties(More,Next,File,After).

add_property(Key,Value,[],_,_,_,[Key-Value]).
add_property(Key,Value,[Existing-Old|Rest],File,Line,Column,Result) :-
    ( Key==Existing
    -> ( Value==Old -> Result=[Existing-Old|Rest]
       ; format(string(Message),'Conflicting legacy metadata for ~w',[Key]),
         legacy_error(File,Line,Column,Message) )
    ; Result=[Existing-Old|Tail],
      add_property(Key,Value,Rest,File,Line,Column,Tail) ).

require_no_orphans([],_) :- !.
require_no_orphans([at(Property,_,Line,Column)|_],File) :-
    format(string(Message),'Orphan metadata comment for ~w: no following assertion',[Property]),
    legacy_error(File,Line,Column,Message).

comment_properties([],_,_,_,[]).
comment_properties([Position-Text|Comments],File,TermLine,TermColumn,Properties) :-
    position_location(Position,Line,Column),
    ( sub_string(Text,0,1,_,"%")
    -> split_string(Text,"\n","\r",Lines),
       comment_lines(Lines,File,Line,Column,TermLine,TermColumn,Here)
    ; Here=[] ),
    append(Here,Tail,Properties),
    comment_properties(Comments,File,TermLine,TermColumn,Tail).

comment_lines([],_,_,_,_,_,[]).
comment_lines([Text|Lines],File,Line,Column,TermLine,TermColumn,Properties) :-
    ( percent_body(Text,Body), recognized_comment(Body,Expected)
    -> ( TermLine==unbounded -> true
       ; (Line<TermLine ; Line=:=TermLine, Column=<TermColumn) -> true
       ; legacy_error(File,Line,Column,'Metadata comment must precede a complete assertion, not occur inside it') ),
       parse_comment_property(Body,Expected,File,Line,Column,Property),
       Properties=[Property|Tail]
    ; Properties=Tail ),
    NextLine is Line+1,
    comment_lines(Lines,File,NextLine,1,TermLine,TermColumn,Tail).

percent_body(Text,Body) :-
    string_codes(Text,Codes),
    drop_space(Codes,Start), Start=[0'%|_],
    drop_percent(Start,AfterPercent), drop_space(AfterPercent,Content),
    string_codes(Body,Content).
drop_space([C|Cs],Rest) :- code_type(C,space), !, drop_space(Cs,Rest).
drop_space(Cs,Cs).
drop_percent([0'%|Cs],Rest) :- !, drop_percent(Cs,Rest).
drop_percent(Cs,Cs).

recognized_comment(Body,Property) :-
    comment_property(Property),
    atom_string(Property,Prefix),
    string_concat(Prefix,Rest,Body),
    ( Rest=="" ; string_codes(Rest,[C|_]), (C=:=0'(;C=:=0'.;code_type(C,space)) ), !.

comment_property(source_line).
comment_property(kb_file_line).
comment_property(mapping_rows).
comment_property(source_file).
comment_property(microtheory).
comment_property(kb_names).
comment_property(direction).
comment_property(monotonicity).
comment_property(creator).
comment_property(creation_date).

parse_comment_property(Text,Expected,File,Line,Column,Located) :-
    catch(setup_call_cleanup(
              open_string(Text,Stream),
              ( read_data(Stream,Term,_,_,FirstKind),
                read_data(Stream,_,_,_,LastKind) ),
              close(Stream)),
          Error,
          ( message_to_string(Error,Why),
            format(string(Message),'Malformed metadata comment: ~s',[Why]),
            legacy_error(File,Line,Column,Message) )),
    ( FirstKind==term, LastKind==eof, nonvar(Term), compound(Term),
      compound_name_arguments(Term,Expected,[Value])
    -> located_property(Expected,Value,File,Line,Column,Located)
    ; legacy_error(File,Line,Column,'Malformed metadata comment: expected exactly one Property(Value). term') ).

stream_location(Stream,Line,Column) :-
    stream_property(Stream,position(Position)),position_location(Position,Line,Column).
position_location(Position,Line,Column) :-
    stream_position_data(line_count,Position,Line),
    stream_position_data(line_position,Position,ZeroColumn),
    Column is ZeroColumn+1.

read_error(Error,File,FallbackLine,FallbackColumn) :-
    ( Error=error(_,file(_,Line,ZeroColumn,_)), integer(Line),integer(ZeroColumn)
    -> Column is ZeroColumn+1
    ; Error=error(_,stream(_,Line,ZeroColumn,_)), integer(Line),integer(ZeroColumn)
    -> Column is ZeroColumn+1
    ; Line=FallbackLine,Column=FallbackColumn ),
    message_to_string(Error,Why),
    format(string(Message),'Invalid legacy Prolog data: ~s',[Why]),
    legacy_error(File,Line,Column,Message).

legacy_error(File,Line,Column,Message) :-
    throw(error(source_error(File,Line,Column,Message),
                context(kb_legacy,'Legacy input is data, never executable code'))).
