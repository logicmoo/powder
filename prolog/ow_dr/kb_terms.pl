:- module(kb_terms, [term_ast/3, semantic_ast/3, metadata_json/2, json_value/2]).
:- use_module(library(lists)).

term_ast(Term, Names, AST) :-
    term_variables(Term, Vars),
    pair_names(Vars, Names, 1, Pairs),
    ast(Term, Pairs, AST).

semantic_ast((Head :- Body), Names, AST) :- !,
    term_variables((Head :- Body), Vars), pair_names(Vars, Names, 1, Pairs),
    Body =.. [and|Goals], maplist(ast_with(Pairs), [Head|Goals], Args),
    AST = _{type:application,head:_{type:symbol,value:'x_<==='},args:Args}.
semantic_ast(Term, Names, AST) :- term_ast(Term, Names, AST).

pair_names([], _, _, []).
pair_names([V|Vs], [Name|Names], N, [V-Name|Pairs]) :- !,
    N1 is N+1, pair_names(Vs, Names, N1, Pairs).
pair_names([V|Vs], [], N, [V-Name|Pairs]) :-
    format(string(Name), '?V~d', [N]), N1 is N+1,
    pair_names(Vs, [], N1, Pairs).

ast_with(Pairs, Term, AST) :- ast(Term, Pairs, AST).
ast(Term, Pairs, AST) :- var(Term), !,
    variable_name(Term, Pairs, Name), AST = _{type:variable,value:Name}.
ast(Term, _, _{type:string,value:Term}) :- string(Term), !.
ast(Term, _, _{type:number,value:Term}) :- number(Term), !.
ast(Term, Pairs, _{type:map,entries:Entries}) :- is_dict(Term), !,
    dict_pairs(Term, _, Values), maplist(map_entry(Pairs), Values, Entries).
ast(Term, Pairs, _{type:list,items:Items}) :- is_list(Term), !,
    maplist(ast_with(Pairs), Term, Items).
ast(metta_value(Value), Pairs, _{type:value,value:AST}) :- !, ast(Value, Pairs, AST).
ast(metta_execute(Value), Pairs, _{type:execute,value:AST}) :- !, ast(Value, Pairs, AST).
ast(Term, _, _{type:symbol,value:Term}) :- atom(Term), !.
ast(Term, Pairs, _{type:application,head:Head,args:Args}) :-
    Term =.. [Functor|Values],
    ( Functor == t -> Values = [Predicate|Arguments]
    ; Predicate = Functor, Arguments = Values
    ),
    ast(Predicate, Pairs, Head), maplist(ast_with(Pairs), Arguments, Args).

variable_name(V, [Other-Name|_], Name) :- V == Other, !.
variable_name(V, [_|Rest], Name) :- variable_name(V, Rest, Name).
map_entry(Pairs, K-V, _{key:Key,value:Value}) :- ast(K,Pairs,Key), ast(V,Pairs,Value).

metadata_json(Terms, Values) :- maplist(metadata_item, Terms, Values).
metadata_item(Term, _{name:Name,value:Value}) :-
    Term =.. [Predicate,_,Raw], atom_concat(xc_, Name, Predicate),
    json_value(Raw, Value).
json_value(Raw, Raw) :- (atomic(Raw) ; is_dict(Raw)), !.
json_value(Raw, Values) :- is_list(Raw), !, maplist(json_value, Raw, Values).
json_value(Raw, Text) :- term_string(Raw, Text, [quoted(true),numbervars(false)]).
