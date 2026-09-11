:- module(kb_terms, [term_ast/3, semantic_ast/3, bound_semantic_ast/4,
                     metadata_json/2, json_value/2, context_key/2,
                     context_from_key/2, context_input/2, mapping_rows_json/2]).
:- use_module(library(lists)).
:- use_module(library(error)).
:- use_module(kb_reader, []).
:- use_module(kb_symbols).

context_key(Context,Key) :-
    valid_context(Context),
    (atom(Context),\+atom_concat('mt:',_,Context)->Key=Context;
      term_string(Context,Text,[quoted(true),ignore_ops(true),numbervars(false)]),
      atom_string(Encoded,Text),atom_concat('mt:',Encoded,Key)).
context_from_key(Input,Context) :-
    atom_string(Key,Input),
    (atom_concat('mt:',Encoded,Key)->
      catch(read_term_from_atom(Encoded,Context,
        [module(kb_terms),syntax_errors(error),double_quotes(string),cycles(false),quasi_quotations(Quotes)]),
        error(syntax_error(_),_),throw(error(domain_error(microtheory_key,Key),_))),
      (Quotes=[]->true;throw(error(domain_error(microtheory_key,Key),_))),
      context_key(Context,Canonical),
      (Canonical==Key->true;throw(error(domain_error(microtheory_key,Key),_)))
    ; Context=Key,valid_context(Context)).
context_input(Input,Context) :-
    atom_string(Atom,Input),
    (sub_atom(Atom,0,1,_,'(')->
      atom_string(Atom,Text),kb_reader:normalize_query(Text,Context,_),
      valid_context(Context)
    ; context_from_key(Atom,Context)).

valid_context(Context) :-
    must_be(ground,Context),
    (atom(Context),encoded_symbol(Context)->true
    ;compound(Context),functor(Context,Name,_),(encoded_symbol(Name);Name==t),
     Context=..[_|Args],maplist(context_value,Args)->true
    ;throw(error(domain_error(microtheory_term,Context),_))).
context_value(Value) :-
    (number(Value);string(Value);atom(Value)), !.
context_value(Value) :- is_list(Value), !,maplist(context_value,Value).
context_value(Value) :- valid_context(Value).

term_ast(Term, Names, AST) :-
    term_variables(Term, Vars),
    pair_names(Vars, Names, 1, Pairs),
    ast(Term, Pairs, AST).

semantic_ast((Head :- Body), Names, AST) :- !,
    term_variables((Head :- Body), Vars), pair_names(Vars, Names, 1, Pairs),
    Body =.. [and|Goals], maplist(ast_with(Pairs), [Head|Goals], Args),
    AST = _{type:application,head:_{type:symbol,value:'x_<==='},args:Args}.
semantic_ast(Term, Names, AST) :- term_ast(Term, Names, AST).

bound_semantic_ast(Semantic, Names, Slots, AST) :-
    term_variables(Semantic, Vars), pair_names(Vars,Names,1,Pairs),
    Vars=Slots,
    ( Semantic=(Head :- Body) ->
      Body=..[and|Goals],maplist(ast_with(Pairs),[Head|Goals],Args),
      AST=_{type:application,head:_{type:symbol,value:'x_<==='},args:Args}
    ; ast(Semantic,Pairs,AST) ).

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
ast(metta_exec(Value), Pairs, _{type:execute,value:AST}) :- !, ast(Value, Pairs, AST).
ast(metta_expression([]), _, _{type:empty}) :- !.
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
metadata_item(xc_microtheory(_,Context),_{name:microtheory,value:AST}) :- !,
    term_ast(Context,[],AST).
metadata_item(xc_mapping_rows(_,Rows),_{name:mapping_rows,value:Values}) :- !,
    mapping_rows_json(Rows,Values).
metadata_item(xc_comments(_,Comments),_{name:comments,value:Values}) :-
    is_list(Comments), !, maplist(comment_json,Comments,Values).
metadata_item(Term, _{name:Name,value:Value}) :-
    Term =.. [Predicate,_,Raw], atom_concat(xc_, Name, Predicate),
    json_value(Raw, Value).
comment_json(Comment,_{line:Line,column:Column,text:Text}) :-
    nonvar(Comment),Comment=comment(Line,Column,Text),
    integer(Line),Line>0,integer(Column),Column>0,string(Text), !.
comment_json(Comment,Value) :- json_value(Comment,Value).
mapping_rows_json(Rows,Values) :- maplist(mapping_row_json,Rows,Values).
mapping_row_json(Row,Value) :- diagnostic_row(Row,Kind,Message), !,
    json_value(Message,Text),Value=_{type:Kind,message:Text}.
mapping_row_json(Row,Row) :- atomic(Row), !.
mapping_row_json(Row,_{type:data,value:AST}) :- term_ast(Row,[],AST).
diagnostic_row(Row,Kind,Message) :-
    nonvar(Row),compound(Row),Row=..[Kind,Message],memberchk(Kind,[note,warnings,errors]).

json_value(Raw, Raw) :- atomic(Raw), !.
json_value(Raw, Value) :- diagnostic_row(Raw,Kind,Message), !,
    json_value(Message,Text),Value=_{type:Kind,message:Text}.
json_value(Raw, Value) :- is_dict(Raw), !,
    dict_pairs(Raw,Tag,Pairs),maplist(json_pair,Pairs,JSON),dict_pairs(Value,Tag,JSON).
json_value(Raw, Values) :- is_list(Raw), !, maplist(json_value, Raw, Values).
json_value(Raw, Text) :- term_string(Raw, Text, [quoted(true),numbervars(false)]).
json_pair(Key-Raw,Key-Value) :- json_value(Raw,Value).
