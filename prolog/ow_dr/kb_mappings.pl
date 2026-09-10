:- module(kb_mappings,
          [ mapping_rows/1,
            mapping_identity/1,
            mapping_hash/1,
            mapping_context/3,
            transform_ast/7,
            format_descriptor_head/1,
            format_data_slot/3,
            format_data_slot/4,
            emit_source_warning/3,
            diagnostic_metadata/3,
            validate_mapping_text/3
          ]).

/** <module> powder: canonical Markdown mappings.

The located reader AST is n(Line, Column, Value), where Value is sym/1,
quoted/1, var/2, num/1, lexnum/2, str/1, list/1, quote/1 or execute/1.  A rewritten
head is marked mapped/1; bound/3 represents a mapped quantifier.  No DSL
term is ever called.  A context is an immutable snapshot of the table.

diagnostic_metadata(+Events,-Properties,-Markers) records
diagnostic(notices|warnings|errors,Message) events into independent message
list properties and exact note/1, warnings/1, errors/1 discovery markers.
It is a creation-time recorder, not a getter deriving properties from rows.
*/

:- use_module(library(assoc)).
:- use_module(kb_symbols).
:- use_module(library(apply)).
:- use_module(library(crypto)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(option)).
:- use_module(library(readutil)).

:- dynamic table_cache/3.
:- prolog_load_context(directory, Here),
   directory_file_path(Here, 'docs', Docs),
   directory_file_path(Docs, 'sumo-cycl-mapping.md', Table),
   asserta(mapping_file(Table)).

mapping_rows(Rows) :-
    load_table(_, Rows, _), !.

mapping_identity(Hash) :-
    load_table(Hash, _, _), !.

mapping_hash(Hash) :-
    mapping_identity(Hash).

diagnostic_metadata(Events,Properties,Markers) :-
    must_be(list,Events),
    diagnostic_lists(Events,Markers,Notices,[],Warnings,[],Errors,[]),
    nonempty_diagnostic(notices,Notices,Properties,P1),
    nonempty_diagnostic(warnings,Warnings,P1,P2),
    nonempty_diagnostic(errors,Errors,P2,[]).

diagnostic_lists([],[],N,N,W,W,E,E).
diagnostic_lists([diagnostic(Kind,Message)|Events],[Marker|Markers],N0,N,W0,W,E0,E) :-
    must_be(oneof([notices,warnings,errors]),Kind),
    ( atom(Message);string(Message) ), !,
    ( Kind==notices
    -> Marker=note(Message),N0=[Message|N1],W0=W1,E0=E1
    ; Kind==warnings
    -> Marker=warnings(Message),W0=[Message|W1],N0=N1,E0=E1
    ; Marker=errors(Message),E0=[Message|E1],N0=N1,W0=W1 ),
    diagnostic_lists(Events,Markers,N1,N,W1,W,E1,E).
diagnostic_lists([Bad|_],_,_,_,_,_,_,_) :-
    throw(error(type_error(diagnostic_event,Bad),
                context(kb_mappings:diagnostic_metadata/3,'Expected a diagnostic kind and text message'))).

nonempty_diagnostic(_,[],Tail,Tail) :- !.
nonempty_diagnostic(Kind,Messages,[Kind-Messages|Tail],Tail).

mapping_context(none, none, none) :- !.
mapping_context(Mode, mappings(Mode, Rules), Hash) :-
    must_be(oneof([sumo,global]), Mode),
    load_table(Hash, _, Rules), !.

load_table(Hash, Rows, Rules) :-
    mapping_file(File),
    read_file_to_string(File, Text, [encoding(utf8)]),
    crypto_data_hash(Text, Hash, [algorithm(sha256),encoding(utf8)]),
    with_mutex(logos_mapping_table,
               cached_table(Hash, Text, Rows, Rules)).

cached_table(Hash, _, Rows, Rules) :-
    table_cache(Hash, Rows, Rules), !.
cached_table(Hash, Text, Rows, Rules) :-
    validate_mapping_text(Text, Rows, Rules),
    retractall(table_cache(_,_,_)),
    assertz(table_cache(Hash, Rows, Rules)).

validate_mapping_text(Text, Rows, Rules) :-
    must_be(string, Text),
    split_string(Text, "\n", "\r", Lines),
    table_lines(Lines, Body),
    parse_rows(Body, Rows, RuleList),
    ( Rows == [] -> mapping_error(empty_table) ; true ),
    maplist(row_id, Rows, Ids),
    unique_values(Ids, duplicate_id),
    findall(S, member(rule(_,S,_),RuleList), Sources),
    unique_values(Sources, ambiguous_source),
    validate_targets(RuleList),
    empty_assoc(A0),
    foldl(add_rule, RuleList, A0, Rules), !.

table_lines([Line|Lines], Body) :-
    normalize_space(string(Trim), Line),
    ( sub_string(Trim,0,_,_,"| ID |")
    -> table_cells(Trim, Header),
       Expected = ["ID","SUMO","CycL","Conversion","Category","Equivalence",
                   "Confidence","Basis","Notes / provenance"],
       ( Header == Expected -> true ; mapping_error(invalid_header(Header)) ),
       ( skip_empty(Lines, [Separator|Rest])
       -> true ; mapping_error(missing_separator) ),
       table_cells(Separator, Cells),
       ( length(Cells,9), maplist(separator_cell, Cells)
       -> Body=Rest ; mapping_error(invalid_separator(Separator)) )
    ; table_lines(Lines, Body)
    ), !.
table_lines([], _) :- mapping_error(missing_table_header).

skip_empty([Line|Lines], Rest) :-
    normalize_space(string(""), Line), !, skip_empty(Lines, Rest).
skip_empty(Lines, Lines).

separator_cell(Cell) :-
    string_codes(Cell, Codes),
    include(=(0'-), Codes, Dashes),
    length(Dashes,N), N>=3,
    forall(member(C,Codes),memberchk(C,[0'-,0':])).

table_cells(Line, Cells) :-
    split_string(Line, "|", " \t\r", Raw),
    ( append([""|Middle],[""],Raw), length(Middle,9)
    -> Cells=Middle
    ; mapping_error(invalid_table_row(Line)) ).

parse_rows([], [], []).
parse_rows([Line|Lines], Rows, Rules) :-
    normalize_space(string(Trim),Line),
    ( Trim == "" -> parse_rows(Lines,Rows,Rules)
    ; sub_string(Trim,0,1,_,"|")
    -> table_cells(Line,Cells),
       parse_row(Cells,Row,Rule),
       Rows=[Row|Tail], Rules=[Rule|RTail],
       parse_rows(Lines,Tail,RTail)
    ; mapping_error(unexpected_table_content(Line))
    ).

parse_row([I,S,C,D,Cat,Eq,Conf,Basis,Notes], Row, rule(Id,Source,Spec)) :-
    atom_string(Id,I), valid_id(Id),
    code_cell(S,SourceText), atom_string(Source,SourceText),
    code_cell(C,Cycl), code_cell(D,Conversion),
    parse_spec(Conversion,Spec),
    ( valid_symbol(Source) -> true ; mapping_error(invalid_source_symbol(Source)) ),
    atom_string(Category,Cat), enum(Category,[class,predicate,transform,logical,operator]),
    atom_string(Equivalence,Eq), enum(Equivalence,[exact,close,broader,narrower,transform]),
    atom_string(Confidence,Conf), enum(Confidence,[high,medium,low]),
    atom_string(Evidence,Basis), enum(Evidence,[evidence,guess]),
    Row=row{id:Id,sumo:Source,cycl:Cycl,conversion:Conversion,category:Category,
            equivalence:Equivalence,confidence:Confidence,basis:Evidence,notes:Notes}.

code_cell(Text,Content) :-
    ( sub_string(Text,0,1,_,"`"), sub_string(Text,_,1,0,"`"),
      string_length(Text,N), N>=2,
      L is N-2, sub_string(Text,1,L,1,Content)
    -> true ; mapping_error(missing_code_delimiters(Text)) ).

valid_id(Id) :-
    ( atom_codes(Id,Cs), Cs\=[],
      forall(member(C,Cs),(code_type(C,alnum);memberchk(C,[0'-,0'_])))
    -> true ; mapping_error(invalid_id(Id)) ).

enum(Value,Allowed) :-
    ( memberchk(Value,Allowed) -> true ; mapping_error(invalid_value(Value,Allowed)) ).

parse_spec(Text,Spec) :-
    string_concat(Text,".",TermText),
    catch(setup_call_cleanup(open_string(TermText,S),
                             (read_term(S,Spec,[syntax_errors(error),module(kb_mappings)]),
                              read_term(S,End,[syntax_errors(error),module(kb_mappings)])),
                             close(S)),
          Error, mapping_error(invalid_conversion(Text,Error))),
    ( End == end_of_file, ground(Spec), valid_spec(Spec)
    -> true ; mapping_error(unsupported_conversion(Text)) ).

valid_spec(global(Spec)) :- !, Spec \= global(_), valid_spec(Spec).
valid_spec(rename(Target,Shape)) :- valid_symbol(Target), valid_shape(Shape).
valid_spec(template(Symbol,Target,Arity,Args)) :-
    valid_symbol(Symbol), valid_symbol(Target), arity(Arity),
    is_list(Args), maplist(valid_arg(Arity),Args).
valid_spec(indexed_template(Symbol,Prefix,Position,Suffix,Arity,Args)) :-
    valid_symbol(Symbol), valid_symbol(Prefix), atom(Suffix),
    arity(Arity), position(Position,Arity),
    is_list(Args), maplist(valid_arg(Arity),Args).
valid_spec(quantifier(Target)) :- valid_symbol(Target).
valid_spec(predicate_application(Symbol,Position,Shape)) :-
    valid_symbol(Symbol), valid_shape(Shape), Shape \== constant,
    shape_minimum(Shape,Minimum), position(Position,Minimum).

valid_symbol(A) :-
    atom(A), A \== '', A \== '<===',
    \+ sub_atom(A,0,2,_,'x_'),
    \+ sub_atom(A,0,2,_,'#$').
arity(N) :- integer(N), N>=0.
position(P,N) :- integer(P), P>0, P=<N.
valid_shape(constant).
valid_shape(any).
valid_shape(N) :- arity(N).
valid_shape(variadic(N)) :- arity(N).
valid_shape(one_of(Ns)) :-
    is_list(Ns), Ns\=[], maplist(arity,Ns), sort(Ns,Unique),
    same_length(Ns,Unique).
shape_minimum(N,N) :- integer(N), !.
shape_minimum(variadic(N),N).
shape_minimum(one_of(Ns),N) :- min_list(Ns,N).
shape_minimum(any,1).
valid_arg(N,arg(P)) :- position(P,N).
valid_arg(_,fixed(atom(A))) :- atom(A).
valid_arg(_,fixed(number(N))) :- number(N).
valid_arg(_,fixed(string(S))) :- string(S).

row_id(Row,Id) :- Id=Row.id.
unique_values(Values,Reason) :-
    msort(Values,Sorted),
    ( append(_,[X,X|_],Sorted) -> mapping_error(Reason-X) ; true ).

add_rule(rule(Id,Source,Spec), A0, A) :-
    put_assoc(Source,A0,rule(Id,Source,Spec),A).

validate_targets(Rules) :-
    forall((member(rule(Id,S,Wrapped),Rules),
            unwrap(Wrapped,Spec), spec_target(Spec,T),
            member(rule(Other,OS,OW),Rules), Other\==Id),
           ( ( unwrap(OW,O), spec_target(O,T)
             -> mapping_error(target_collision(T,Id,Other)) ; true ),
             ( T==OS, \+ identity_spec(OS,OW)
             -> mapping_error(conversion_chain(S,T,Id,Other)) ; true ) )),
    forall((member(rule(Id,_,Wrapped),Rules), unwrap(Wrapped,Spec),
            Spec=indexed_template(_,Prefix,_,Suffix,_,_),
            member(rule(Other,S,OW),Rules), Other\==Id,
            (Candidate=S; unwrap(OW,O),spec_target(O,Candidate)),
            indexed_symbol(Prefix,Suffix,Candidate)),
           mapping_error(indexed_target_collision(Candidate,Id,Other))).

indexed_symbol(Prefix,Suffix,Atom) :-
    atom_concat(Prefix,Rest,Atom), atom_concat(Digits,Suffix,Rest),
    catch(atom_number(Digits,N),_,fail), integer(N), N>0.

identity_spec(Source,Wrapped) :-
    unwrap(Wrapped,rename(Source,_)).
unwrap(global(S),S) :- !.
unwrap(S,S).
spec_target(rename(T,_),T).
spec_target(template(S,_,_,_),S).
spec_target(template(_,T,_,_),T).
spec_target(indexed_template(S,_,_,_,_,_),S).
spec_target(quantifier(T),T).
spec_target(predicate_application(S,_,_),S).

mapping_error(Why) :-
    throw(error(mapping_error(Why),context(kb_mappings,'Invalid canonical mapping table'))).

transform_ast(AST,Context,File,Options,Out,Rows,Warnings) :-
    map_node(AST,Context,File,Options,Out,Rows,[],Warnings,[]), !.

map_node(AST,none,_,_,AST,R,R,W,W) :- !.
map_node(n(L,C,list([Head|Arguments])),Ctx,F,O,
         n(L,C,list([Head|Mapped])),R0,R,W0,W) :-
    format_data_slot(Head,Arguments,_,Position), nth1(Position,Arguments,_), !,
    map_format_arguments(Arguments,Position,Ctx,F,O,Mapped,R0,R,W0,W).
map_node(n(L,C,sym(A)),Ctx,_,_,n(L,C,mapped(Target)),[Id|R],R,W,W) :-
    selected_rule(Ctx,A,Id,Spec), symbol_target(Spec,Target), !.
map_node(n(L,C,quoted(A)),Ctx,_,_,n(L,C,mapped(Target)),[Id|R],R,W,W) :-
    selected_rule(Ctx,A,Id,Spec), symbol_target(Spec,Target), !.
map_node(n(L,C,list([Head|Args])),Ctx,F,O,Out,R0,R,W0,W) :- !,
    ( raw_symbol(Head,A), selected_rule(Ctx,A,Id,Spec)
    -> ( application_matches(Spec,Args)
       -> R0=[Id|R1],
          apply_spec(Spec,Head,Args,L,C,Ctx,F,O,Out,R1,R,W0,W)
       ; mismatch(F,L,C,Id,A,Args,O,Warning),
         W0=[Warning|W1],
         map_nodes(Args,Ctx,F,O,NewArgs,R0,R,W1,W),
         Out=n(L,C,list([Head|NewArgs]))
       )
    ; map_head(Head,Ctx,F,O,NewHead,R0,R1,W0,W1),
      map_nodes(Args,Ctx,F,O,NewArgs,R1,R,W1,W),
      Out=n(L,C,list([NewHead|NewArgs]))
    ).
map_node(n(L,C,quote(A)),Ctx,F,O,n(L,C,quote(B)),R0,R,W0,W) :- !,
    map_node(A,Ctx,F,O,B,R0,R,W0,W).
map_node(n(L,C,execute(A)),Ctx,F,O,n(L,C,execute(B)),R0,R,W0,W) :- !,
    map_node(A,Ctx,F,O,B,R0,R,W0,W).
map_node(AST,_,_,_,AST,R,R,W,W).

map_head(n(L,C,sym(A)),_,_,_,n(L,C,sym(A)),R,R,W,W) :- !.
map_head(n(L,C,quoted(A)),_,_,_,n(L,C,quoted(A)),R,R,W,W) :- !.
map_head(Head,Ctx,F,O,Out,R0,R,W0,W) :-
    map_node(Head,Ctx,F,O,Out,R0,R,W0,W).

raw_symbol(n(_,_,sym(A)),A).
raw_symbol(n(_,_,quoted(A)),A).

format_descriptor_head(Head) :-
    format_data_slot(Head,genFormat,3).

format_data_slot(n(_,_,Value),Name,Position) :-
    (Value=sym(Raw);Value=quoted(Raw);Value=mapped(Raw)),
    ( atom_concat('#$',Name,Raw) -> true
    ; atom_concat('x_',Name,Raw) -> true
    ; Name=Raw ),
    approved_format_slot(Name,Position).

format_data_slot(n(_,_,Value),Arguments,Name,Position) :-
    (Value=sym(Raw);Value=quoted(Raw);Value=mapped(Raw)),
    (atom_concat('#$',Name,Raw)->true;atom_concat(x_,Name,Raw)->true;Name=Raw),
    list_data_slot(Name,Arguments,Position).

approved_format_slot(Name,Position) :- list_data_slot(Name,Position).

map_format_arguments([Descriptor|Arguments],1,Ctx,F,O,[Descriptor|Mapped],R0,R,W0,W) :- !,
    map_nodes(Arguments,Ctx,F,O,Mapped,R0,R,W0,W).
map_format_arguments([Arg|Args],Position,Ctx,F,O,[Mapped|Rest],R0,R,W0,W) :-
    map_node(Arg,Ctx,F,O,Mapped,R0,R1,W0,W1),
    Next is Position-1,
    map_format_arguments(Args,Next,Ctx,F,O,Rest,R1,R,W1,W).

map_nodes([],_,_,_,[],R,R,W,W).
map_nodes([A|As],Ctx,F,O,[B|Bs],R0,R,W0,W) :-
    map_node(A,Ctx,F,O,B,R0,R1,W0,W1),
    map_nodes(As,Ctx,F,O,Bs,R1,R,W1,W).

selected_rule(mappings(Mode,Rules),Source,Id,Spec) :-
    \+ sub_atom(Source,0,2,_,'#$'),
    get_assoc(Source,Rules,rule(Id,_,Wrapped)),
    ( Wrapped=global(Spec) -> true ; Mode==sumo, Spec=Wrapped ).

symbol_target(rename(T,_),T).
symbol_target(template(T,_,_,_),T).
symbol_target(indexed_template(T,_,_,_,_,_),T).
symbol_target(quantifier(T),T).
symbol_target(predicate_application(T,_,_),T).

application_matches(rename(_,Shape),Args) :- length(Args,N), shape_matches(Shape,N).
application_matches(template(_,_,N,_),Args) :- length(Args,N).
application_matches(indexed_template(_,_,P,_,N,_),Args) :-
    length(Args,N), nth1(P,Args,Index),
    ( Index=n(_,_,var(_,_)) ; Index=n(_,_,num(K)), integer(K), K>0 ).
application_matches(quantifier(_),[Binder,Formula]) :-
    binder_nodes(Binder,_), formula_node(Formula).
application_matches(predicate_application(_,P,Shape),Args) :-
    length(Args,N), shape_matches(Shape,N), P=<N,
    nth1(P,Args,Predicate), predicate_node(Predicate).

formula_node(n(_,_,list([_|_]))).
formula_node(n(_,_,var(_,_))).
formula_node(n(_,_,sym(_))).
formula_node(n(_,_,quoted(_))).
predicate_node(Node) :- formula_node(Node).

shape_matches(any,_).
shape_matches(N,N) :- integer(N).
shape_matches(variadic(M),N) :- N>=M.
shape_matches(one_of(Ns),N) :- memberchk(N,Ns).

binder_nodes(n(_,_,var(Name,Kind)),[n(0,0,var(Name,Kind))]).
binder_nodes(n(_,_,list(Nodes)),Nodes) :-
    Nodes\=[], maplist(variable_node,Nodes),
    findall(Name,member(n(_,_,var(Name,_)),Nodes),Names),
    sort(Names,Unique), same_length(Names,Unique).
variable_node(n(_,_,var(_,_))).

apply_spec(rename(Target,_),_,Args,L,C,Ctx,F,O,
           n(L,C,list([n(L,C,mapped(Target))|NewArgs])),R0,R,W0,W) :-
    map_nodes(Args,Ctx,F,O,NewArgs,R0,R,W0,W).
apply_spec(template(_,Target,_,Selections),_,Args,L,C,Ctx,F,O,
           n(L,C,list([n(L,C,mapped(Target))|Selected])),R0,R,W0,W) :-
    map_nodes(Args,Ctx,F,O,NewArgs,R0,R,W0,W),
    maplist(select_arg(NewArgs,L,C),Selections,Selected).
apply_spec(indexed_template(Symbol,Prefix,P,Suffix,_,Selections),_,Args,L,C,Ctx,F,O,
           n(L,C,list([n(L,C,mapped(Target))|Selected])),R0,R,W0,W) :-
    nth1(P,Args,Index),
    map_nodes(Args,Ctx,F,O,NewArgs,R0,R,W0,W),
    ( Index=n(_,_,var(_,_))
    -> Target=Symbol, Selected=NewArgs
    ; Index=n(_,_,num(N)), atomic_list_concat([Prefix,N,Suffix],Target),
      maplist(select_arg(NewArgs,L,C),Selections,Selected) ).
apply_spec(quantifier(Target),_,[Binder,Formula],L,C,Ctx,F,O,
           n(L,C,bound(Target,Vars,NewFormula)),R0,R,W0,W) :-
    binder_nodes(Binder,Vars),
    map_node(Formula,Ctx,F,O,NewFormula,R0,R,W0,W).
apply_spec(predicate_application(_,Position,_),_,Args,L,C,Ctx,F,O,Out,R0,R,W0,W) :-
    nth1(Position,Args,Predicate,Rest),
    map_node(n(L,C,list([Predicate|Rest])),Ctx,F,O,Out,R0,R,W0,W).

select_arg(Args,_,_,arg(N),Value) :- nth1(N,Args,Value).
select_arg(_,L,C,fixed(atom(A)),n(L,C,mapped(A))).
select_arg(_,L,C,fixed(number(N)),n(L,C,num(N))).
select_arg(_,L,C,fixed(string(S)),n(L,C,str(S))).

mismatch(File,Line,Column,Id,Head,Args,Options,Warning) :-
    length(Args,N),
    format(string(Message),'Mapping ~w does not match ~w/~d; preserving original head and argument order',
           [Id,Head,N]),
    ( option(strict_mappings(true),Options,false)
    -> throw(error(source_error(File,Line,Column,Message),_))
    ; Warning=warning(File,Line,Column,Message),
      emit_source_warning(Warning,mapping(Id),Options)
    ).

emit_source_warning(Warning,Kind,Options) :-
    observe_warning(Options,Warning),
    ( option(diagnostics(false),Options,true) -> true
    ; diagnostic_budget(Options,Kind,Count),
      ( Count=<3
      -> diagnostic_output(Options,Warning)
      ; Count=:=4
      -> Warning=warning(File,Line,Column,_),
         suppression_message(Kind,Message),
         diagnostic_output(Options,warning(File,Line,Column,Message))
      ; true ),
      flush_output(user_error) ).

suppression_message(mapping(Id),Message) :- !,
    format(string(Message),
           'Further ~w mismatches suppressed on stderr; all are retained in cache metadata.',[Id]).
suppression_message(Kind,Message) :-
    format(string(Message),
           'Further ~w warnings suppressed on stderr; all are retained in cache metadata.',[Kind]).

observe_warning(Options,Warning) :-
    ( option(warning_observer(Handler),Options)
    -> must_be(callable,Handler),
       ( Handler=Module:Goal, atom(Module), callable(Goal)
       -> ( call(Handler,Warning) -> true
          ; throw(error(warning_observer_failed(Handler),_)) )
       ; throw(error(domain_error(module_qualified_warning_observer,Handler),_)) )
    ; true ).

diagnostic_output(Options,Warning) :-
    ( option(diagnostic_handler(Handler),Options)
    -> must_be(callable,Handler),
       ( Handler=Module:Goal, atom(Module), callable(Goal)
       -> ( call(Handler,Warning) -> true
          ; throw(error(diagnostic_handler_failed(Handler),_)) )
       ; throw(error(domain_error(module_qualified_diagnostic_handler,Handler),_)) )
    ; Warning=warning(File,Line,Column,Message),
      ( stream_property(user_error,tty(true)) -> nl(user_error) ; true ),
      format(user_error,'WARNING ~w:~d:~d: ~s~n',[File,Line,Column,Message])
    ).

diagnostic_budget(Options,Id,Count) :-
    ( option(warning_state(State),Options)
    -> arg(1,State,Counts),
       ( get_assoc(Id,Counts,Before) -> Count is Before+1 ; Count=1 ),
       put_assoc(Id,Counts,Count,New), nb_setarg(1,State,New)
    ; Count=1 ).
