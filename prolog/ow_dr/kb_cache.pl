:- module(kb_cache,
          [ read_cache/3, write_cache/4, cache_schema/1, converter_version/1,
            guarded_clause/3, valid_semantic/1, valid_metadata/2,
            write_one_line/2, term_line/2, terms_digest/2,
            file_digest/2, try_lock/2, release_lock/1,
            stage_path/2, install_stage/2, remove_if_exists/1,
            safe_variable_names/2, valid_assertion_id/1, format_literal_data/1
          ]).

/** <module> Non-executing, strict normalized-cache I/O.

After the one trusted absolute helper directive comes kb_cache_header(cache{...}).
The payload is guarded native clauses and ground binary xc_* metadata records.
kb_cache_footer(footer{count,digest,headerDigest}) terminates the file.
SHA-256 covers every payload line including its LF; the footer also authenticates
the canonical structured header against accidental changes. This is an integrity
checksum, not a signature. Readers validate guards, variable slots, source names,
ID uniqueness, physical line boundaries and the complete footer before returning.
*/

:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(readutil)).
:- use_module(library(lists)).
:- use_module(library(uuid)).
:- use_module(kb_symbols).

cache_schema(logos_cache_v1).
converter_version(logos_compiler_v2).

file_digest(File, Digest) :-
    crypto_file_hash(File, Digest, [algorithm(sha256)]).

terms_digest(Terms, Digest) :-
    maplist(term_line, Terms, Lines),
    lines_digest(Lines, Digest).

lines_digest(Lines, Digest) :-
    atomic_list_concat(Lines, '', Text),
    crypto_data_hash(Text, Digest, [algorithm(sha256),encoding(utf8)]).

safe_variable_names(Term, Names) :-
    term_variables(Term, Vars),
    variable_names(Vars, 1, Names).

variable_names([], _, []).
variable_names([V|Vs], N, [Name=V|Rest]) :-
    atom_concat('V', N, Name), N1 is N+1,
    variable_names(Vs, N1, Rest).

term_line(Term, Line) :-
    safe_variable_names(Term, Names),
    with_output_to(string(Text),
                   write_term_text(Term,
                       [quoted(true),character_escapes(true),numbervars(false),
                        variable_names(Names),cycles(false)])),
    % SWI deliberately emits literal newlines in quoted text; cache terms may not.
    string_codes(Text, Codes),
    phrase(escaped_lines(Codes), Escaped),
    string_codes(Single, Escaped),
    string_concat(Single, ".\n", Line).

write_term_text(Term,Options) :-
    nonvar(Term),Term=(Head :- Body),!,
    write_term(Head,[ignore_ops(true)|Options]),
    write(' :- '),
    write_term(Body,[ignore_ops(true)|Options]).
write_term_text(Term,Options) :-
    nonvar(Term),Term=(:- Directive),!,
    write(':- '),write_term(Directive,[ignore_ops(false),module(kb_cache)|Options]).
write_term_text(Term,Options) :- write_term(Term,[ignore_ops(true)|Options]).

escaped_lines([]) --> [].
escaped_lines([10|Cs]) --> !, "\\n", escaped_lines(Cs).
escaped_lines([13|Cs]) --> !, "\\r", escaped_lines(Cs).
escaped_lines([C|Cs]) --> [C], escaped_lines(Cs).

write_one_line(Stream, Term) :-
    term_line(Term, Line), format(Stream, '~s', [Line]).

try_lock(Path, Lock) :-
    catch(open(Path, append, Stream,
               [type(binary),lock(write),wait(false),close_on_abort(true)]),
          error(permission_error(lock,source_sink,_),_),
          Stream = busy),
    ( Stream == busy -> Lock=busy ; Lock=locked(Stream) ).

release_lock(locked(Stream)) :- close(Stream).

stage_path(Final, Stage) :-
    uuid(Token),
    atomic_list_concat([Final,'.stage.',Token], Stage).

remove_if_exists(File) :-
    ( exists_file(File) -> delete_file(File) ; true ).

install_stage(Stage, Final) :-
    % rename_file uses the native replacement operation, keeping the old file
    % intact if installation fails (including a Windows sharing violation).
    rename_file(Stage, Final).

guarded_clause(Id, Semantic, (Head :- Guard)) :-
    ( nonvar(Semantic), Semantic = (Head :- Body)
    -> term_variables(Head, HeadVars),
       term_variables(Semantic, AllVars),
       exclude(identical_member(HeadVars), AllVars, BodyVars),
       compound_group(vs, HeadVars, HV),
       compound_group(vs, BodyVars, BV),
       Guard = x_cid_io(Id,Body,HV,BV)
    ; Head = Semantic,
      term_variables(Head, Vars),
      Guard =.. [x_cid,Id|Vars]
    ).

identical_member(Vars, V) :- member(X, Vars), X == V, !.
compound_group(Name, [], Name) :- !.
compound_group(Name, Vars, Group) :- Group =.. [Name|Vars].

write_cache(Path, Header0, Records, Header) :-
    must_be(list, Records), maplist(validate_record, Records),
    records_terms(Records, Terms),
    maplist(term_line, Terms, Lines),
    lines_digest(Lines, Digest),
    length(Records, Count),
    cache_schema(Schema),
    Header = Header0.put(_{schema:Schema,count:Count,normalizedDigest:Digest}),
    validate_header(Header),
    terms_digest([Header], HeaderDigest),
    Footer = footer{count:Count,digest:Digest,headerDigest:HeaderDigest},
    helper_path(Helper),
    setup_call_cleanup(
        open(Path, write, Stream, [encoding(utf8),newline(posix)]),
        ( write_one_line(Stream, (:- use_module(Helper),kb_tail_loader:load_remaining)),
          write_one_line(Stream, kb_cache_header(Header)),
          forall(member(Line, Lines), format(Stream, '~s', [Line])),
          write_one_line(Stream, kb_cache_footer(Footer)),
          flush_output(Stream)
        ),
        close(Stream)),!.

helper_path(Path) :-
    source_file(kb_cache:cache_schema(_), Here),
    file_directory_name(Here, Dir),
    directory_file_path(Dir, 'kb_tail_loader.pl', Path).

records_terms([], []).
records_terms([record(Id,Semantic,Metadata)|Records], [Clause|Terms]) :-
    guarded_clause(Id, Semantic, Clause),
    append(Metadata, Rest, Terms),
    records_terms(Records, Rest).

read_cache(Path, Header, Records) :-
    setup_call_cleanup(
        open(Path, read, Stream, [encoding(utf8),newline(posix)]),
        read_cache_stream(Stream, Header, Records),
        close(Stream)),
    !.
read_cache(Path, _, _) :-
    throw(error(invalid_cache(Path),kb_cache:read_cache/3)).

read_cache_stream(Stream, Header, Records) :-
    read_line_term(Stream, Directive, _),
    trusted_header(Directive),
    read_line_term(Stream, kb_cache_header(Header), _),
    validate_header(Header),
    read_payload(Stream, Terms, Lines, Footer),
    read_line_to_string(Stream, end_of_file),
    lines_digest(Lines, Digest),
    Digest == Header.normalizedDigest,
    terms_digest([Header], HeaderDigest),
    Footer == footer{count:Header.count,digest:Digest,headerDigest:HeaderDigest},
    parse_records(Terms, Records),
    length(Records, Header.count),
    maplist(validate_record, Records),
    findall(Id,member(record(Id,_,_),Records), Ids),
    sort(Ids, Unique), length(Ids, N), length(Unique, N).

trusted_header((:- use_module(Helper),kb_tail_loader:load_remaining)) :-
    atom(Helper), helper_path(Expected), Helper == Expected.
trusted_header((:- include(Helper))) :-
    atom(Helper),
    source_file(kb_cache:cache_schema(_), Here),
    file_directory_name(Here, Dir),
    directory_file_path(Dir, 'kb_dynamic_assert.pl', Expected),
    Helper == Expected.

read_line_term(Stream, Term, Line) :-
    stream_property(Stream,position(Before)),
    stream_position_data(line_count,Before,L0),
    read_line_to_string(Stream, Text),
    Text \== end_of_file,
    stream_property(Stream,position(After)),
    stream_position_data(line_count,After,L1),
    L1 =:= L0+1,
    string_concat(Text, "\n", Line),
    setup_call_cleanup(
        open_string(Text, In),
        ( read_term(In, Term, [syntax_errors(error),double_quotes(string)]),
          Term \== end_of_file,
          read_term(In, end_of_file, [syntax_errors(error)])
        ),
        close(In)).

read_payload(Stream, Terms, Lines, Footer) :-
    read_line_term(Stream, Term, Line),
    ( nonvar(Term), Term = kb_cache_footer(Footer)
    -> Terms=[], Lines=[]
    ; Terms=[Term|Rest], Lines=[Line|More],
      read_payload(Stream, Rest, More, Footer)
    ).

validate_header(Header) :-
    is_dict(Header,cache), ground(Header),
    cache_schema(Header.schema),
    converter_version(Header.converter),
    Header.mtPolicy == filename_v1,
    atom(Header.source), sha256_atom(Header.sourceHash),
    sha256_atom(Header.implementationHash),
    memberchk(Header.dialect,[kif,krf,metta]),
    (Header.mappingHash==none;sha256_atom(Header.mappingHash)),
    is_list(Header.options),
    integer(Header.count), Header.count >= 0,
    integer(Header.lineCount), Header.lineCount >= 0,
    integer(Header.sizeBytes), Header.sizeBytes >= 0,
    is_list(Header.warnings),maplist(valid_warning,Header.warnings),
    sha256_atom(Header.normalizedDigest).

sha256_atom(Hash) :-
    atom(Hash),atom_length(Hash,64),atom_codes(Hash,Codes),
    forall(member(C,Codes),(between(0'0,0'9,C);between(0'a,0'f,C))).

valid_warning(warning(File,Line,Column,Message)) :-
    atom(File),integer(Line),Line>0,integer(Column),Column>0,
    (atom(Message);string(Message)).

parse_records([], []).
parse_records([Clause|Terms], [record(Id,Semantic,Metadata)|Records]) :-
    decode_clause(Clause, Id, Semantic),
    take_metadata(Terms, Id, Metadata, Rest),
    parse_records(Rest, Records).

decode_clause((Head :- Guard), Id, Semantic) :-
    nonvar(Guard),
    ( Guard = x_cid_io(Id,Body,HV,BV)
    -> Semantic = (Head :- Body),
       guarded_clause(Id, Semantic, Expected),
       Expected == (Head :- Guard),
       nonvar(HV),nonvar(BV)
    ; compound(Guard), compound_name_arguments(Guard,x_cid,[Id|Slots]),
      term_variables(Head, Vars), Vars == Slots, Semantic = Head
    ),
    valid_assertion_id(Id), storable_semantic(Semantic).

take_metadata([Term|Terms], Id, [Term|More], Rest) :-
    valid_metadata(Id, Term), !,
    take_metadata(Terms, Id, More, Rest).
take_metadata(Terms, _, [], Terms).

validate_record(record(Id, Semantic, Metadata)) :-
    valid_assertion_id(Id), storable_semantic(Semantic),
    is_list(Metadata),maplist(valid_metadata(Id), Metadata),
    exactly_one(xc_microtheory, Id, Metadata, Mt), ground(Mt), acyclic_term(Mt),
    exactly_one(xc_source_file, Id, Metadata, File), atom(File),
    exactly_one(xc_source_line, Id, Metadata, Line), integer(Line),Line > 0,
    exactly_one(xc_kb_names, Id, Metadata, Names),
    is_list(Names),maplist(string,Names),
    term_variables(Semantic, Vars), same_length(Vars, Names).

exactly_one(Name, Id, Metadata, Value) :-
    findall(V,(member(T,Metadata),T=..[Name,Id,V]),[Value]).

valid_assertion_id(Id) :-
    atom(Id),atom_codes(Id,[0'a|Hex]),Hex\=[],
    forall(member(C,Hex),(between(0'0,0'9,C);between(0'a,0'f,C))).

valid_metadata(Id, Term) :-
    ground(Term),acyclic_term(Term),compound(Term),compound_name_arguments(Term,Name,[Other,_]),
    Other == Id, atom_concat(xc_,Suffix,Name), Suffix \== '',
    \+ memberchk(Name,[xc_src,xc_clause_handle,xc_plvars,xc_indexed_constant]).

valid_semantic(Semantic) :-
    acyclic_term(Semantic), nonvar(Semantic),
    ( Semantic = (Head :- Body)
    -> valid_head(Head), conjunction(Body,Goals), maplist(valid_head,Goals)
    ; valid_head(Semantic)
    ).

% Semantic vocabulary checks are advisory. Cache admission checks only the
% inert clause envelope; nested terms are data, never consulted or called.
storable_semantic(Semantic) :-
    acyclic_term(Semantic),nonvar(Semantic),
    (Semantic=(Head :- Body)->storable_head(Head),conjunction(Body,_)
    ;storable_head(Semantic)).
storable_head(Head) :-
    nonvar(Head),callable(Head),\+is_dict(Head),
    functor(Head,Name,_),
    \+memberchk(Name,[':-','?-',':',',',';',x_cid,x_cid_io]),
    (encoded_symbol(Name);memberchk(Name,[t,metta_value,metta_exec,metta_expression])).

normalized_microtheory(Mt) :-
    ground(Mt),acyclic_term(Mt),callable(Mt),\+is_list(Mt),\+is_dict(Mt),
    valid_value(Mt).

conjunction(and, []) :- !.
conjunction(Body, Goals) :-
    compound(Body), compound_name_arguments(Body,and,Goals).

valid_head(Head) :-
    nonvar(Head), callable(Head), \+ is_dict(Head),
    functor(Head, Name, Arity),
    ( semantic_symbol(Name)
    ; Name == t, Arity >= 1, arg(1,Head,Predicate),
      (var(Predicate);compound(Predicate))
    ; memberchk(Name,[metta_value,metta_exec,metta_expression]),
      Arity == 1
    ),
    valid_value(Head).

valid_value(Term) :- var(Term), !.
valid_value(Term) :- string(Term), !.
valid_value(Term) :- number(Term), !.
valid_value([]) :- !.
valid_value(Term) :- atom(Term), !, semantic_symbol(Term).
valid_value(Term) :-
    is_dict(Term), !,
    dict_pairs(Term, metta_map, Pairs),
    maplist(valid_pair,Pairs).
valid_value([H|T]) :- !, valid_value(H), valid_value(T).
valid_value(Term) :-
    compound_name_arguments(Term,Functor,Args),list_data_slot(Functor,Position),
    nth1(Position,Args,Data,OtherArgs),
    format_literal_data(Data),!,
    maplist(valid_value,OtherArgs).
valid_value(Term) :-
    compound_name_arguments(Term, Name, Args),
    (semantic_symbol(Name);memberchk(Name,[t,metta_value,metta_exec,metta_expression])),
    (Name==t -> Args=[Predicate|_],(var(Predicate);compound(Predicate));true),
    (memberchk(Name,[metta_value,metta_exec,metta_expression])->Args=[_];true),
    (Name==metta_expression->Args==[[]];true),
    maplist(valid_value, Args).

format_literal_data(Data) :- is_list(Data),maplist(valid_format_item,Data).

valid_format_item(Item) :- var(Item),!.
valid_format_item(Item) :- atomic(Item),!.
valid_format_item(Item) :- is_list(Item),maplist(valid_format_item,Item).

valid_pair(Key-Value) :-
    (integer(Key);semantic_symbol(Key)), valid_value(Value).

semantic_symbol(Atom) :-
    encoded_symbol(Atom),
    \+ memberchk(Atom,[x_cid,x_cid_io,x_cid_in,x_cid_out,x_aid]).
