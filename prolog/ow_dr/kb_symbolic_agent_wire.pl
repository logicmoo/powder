:- module(kb_symbolic_agent_wire,[encode_term/2,decode_term/2,query_text/2,json_arguments/2]).
:- use_module(kb_terms,[]).
:- use_module(kb_reader,[]).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).

encode_term(Term,Wire) :-
    (acyclic_term(Term)->true;domain_error(acyclic_symbolic_term,Term)),
    term_size(Term,Cells),(Cells=<16384->true;domain_error(symbolic_term_cells,Cells)),
    term_variables(Term,Variables),length(Variables,N),
    (N=<4096->true;domain_error(symbolic_variable_count,N)),
    supported_tree(Term,0),encode(Term,Variables,Node),
    Wire=json{schema:'powder.symbolic-term.v1',term:Node}.
decode_term(Wire,Term) :-
    keys(Wire,[schema,term]),
    (text_equal(Wire.schema,'powder.symbolic-term.v1')->true;domain_error(symbolic_term_schema,Wire.schema)),
    term_size(Wire,Cells),(Cells=<131072->true;domain_error(symbolic_wire_cells,Cells)),
    empty_assoc(Variables),decode(Wire.term,Variables,_,Term,0).

supported_tree(Term,Depth) :-
    (Depth=<128->true;domain_error(symbolic_wire_depth,Depth)),
    Next is Depth+1,
    (var(Term)->true;atomic(Term)->true;
     is_list(Term)->bounded_list(Term),maplist(supported_at(Next),Term);
     is_dict(Term)->dict_pairs(Term,Tag,Pairs),supported_tree(Tag,Next),
       forall(member(_-Value,Pairs),supported_tree(Value,Next));
     compound_name_arguments(Term,_,Args),length(Args,N),
       (between(1,256,N)->true;domain_error(symbolic_compound_arity,N)),
       maplist(supported_at(Next),Args)).
supported_at(Depth,Term) :- supported_tree(Term,Depth).
bounded_list(Items) :-
    length(Items,N),(N=<4096->true;domain_error(symbolic_list_length,N)).

encode(Value,Variables,json{type:variable,id:Index}) :- var(Value),!,
    variable_index(Value,Variables,1,Index).
encode([],_,json{type:nil}) :- !.
encode(Value,_,json{type:string,value:Value}) :- string(Value),!.
encode(Value,_,json{type:number,value:Value}) :- number(Value),!,finite(Value).
encode(Value,_,json{type:symbol,value:Text}) :- atom(Value),!,atom_string(Value,Text).
encode(Value,Variables,json{type:list,items:Items}) :- is_list(Value),!,
    maplist(encode_with(Variables),Value,Items).
encode(Value,Variables,json{type:dict,tag:TagNode,entries:Entries}) :- is_dict(Value),!,
    dict_pairs(Value,Tag,Pairs),encode(Tag,Variables,TagNode),
    maplist(encode_pair(Variables),Pairs,Entries).
encode(Value,Variables,json{type:compound,functor:Name,args:Arguments}) :-
    compound_name_arguments(Value,Functor,Args),atom_string(Functor,Name),
    maplist(encode_with(Variables),Args,Arguments).
encode_with(Variables,Term,Node) :- encode(Term,Variables,Node).
encode_pair(Variables,Key-Value,json{key:KeyNode,value:ValueNode}) :-
    encode(Key,Variables,KeyNode),encode(Value,Variables,ValueNode).
variable_index(V,[Other|_],N,N) :- V==Other,!.
variable_index(V,[_|Rest],N,Index) :- Next is N+1,variable_index(V,Rest,Next,Index).

decode(Node,S0,S,Term,Depth) :-
    (Depth=<128->true;domain_error(symbolic_wire_depth,Depth)),
    must_be(dict,Node),text_atom(Node.type,Type),Next is Depth+1,
    decode_type(Type,Node,S0,S,Term,Next).
decode_type(variable,Node,S0,S,Var,_) :- !,
    keys(Node,[id,type]),must_be(integer,Node.id),
    (between(1,4096,Node.id)->true;domain_error(symbolic_variable_id,Node.id)),
    (get_assoc(Node.id,S0,Var)->S=S0;put_assoc(Node.id,S0,Var,S)).
decode_type(nil,Node,S,S,[],_) :- !,keys(Node,[type]).
decode_type(string,Node,S,S,Text,_) :- !,
    keys(Node,[type,value]),must_be(string,Node.value),Text=Node.value.
decode_type(number,Node,S,S,Number,_) :- !,
    keys(Node,[type,value]),must_be(number,Node.value),finite(Node.value),Number=Node.value.
decode_type(symbol,Node,S,S,Atom,_) :- !,
    keys(Node,[type,value]),must_be(string,Node.value),atom_string(Atom,Node.value).
decode_type(list,Node,S0,S,Items,Depth) :- !,
    keys(Node,[items,type]),must_be(list,Node.items),bounded_list(Node.items),
    decode_nodes(Node.items,S0,S,Items,Depth).
decode_type(compound,Node,S0,S,Term,Depth) :- !,
    keys(Node,[args,functor,type]),must_be(string,Node.functor),
    must_be(list,Node.args),length(Node.args,N),
    (between(1,256,N)->true;domain_error(symbolic_compound_arity,N)),
    decode_nodes(Node.args,S0,S,Arguments,Depth),
    atom_string(Functor,Node.functor),compound_name_arguments(Term,Functor,Arguments).
decode_type(dict,Node,S0,S,Term,Depth) :- !,
    keys(Node,[entries,tag,type]),must_be(list,Node.entries),
    decode(Node.tag,S0,S1,Tag,Depth),
    ((var(Tag);atom(Tag))->true;domain_error(symbolic_dict_tag,Tag)),
    decode_pairs(Node.entries,S1,S,Pairs,Depth),
    pairs_keys(Pairs,Keys),sort(Keys,Unique),
    (same_length(Keys,Unique)->true;domain_error(duplicate_symbolic_dict_keys,Keys)),
    dict_pairs(Term,Tag,Pairs).
decode_type(Type,_,_,_,_,_) :- domain_error(symbolic_wire_type,Type).
decode_nodes([],S,S,[],_).
decode_nodes([N|Ns],S0,S,[T|Ts],Depth) :-
    decode(N,S0,S1,T,Depth),decode_nodes(Ns,S1,S,Ts,Depth).
decode_pairs([],S,S,[],_).
decode_pairs([Entry|Rest],S0,S,[Key-Value|Pairs],Depth) :-
    keys(Entry,[key,value]),decode(Entry.key,S0,S1,Key,Depth),
    ((atom(Key);integer(Key))->true;domain_error(symbolic_dict_key,Key)),
    decode(Entry.value,S1,S2,Value,Depth),decode_pairs(Rest,S2,S,Pairs,Depth).
pairs_keys([],[]).
pairs_keys([Key-_|Pairs],[Key|Keys]) :- pairs_keys(Pairs,Keys).
keys(Dict,Expected) :-
    must_be(dict,Dict),dict_pairs(Dict,_,Pairs),pairs_keys(Pairs,Actual),sort(Expected,Sorted),
    (Actual==Sorted->true;domain_error(symbolic_wire_fields,Actual)).
text_equal(Text,Atom) :- text_atom(Text,Atom).
text_atom(Text,Atom) :- (atom(Text)->Atom=Text;must_be(string,Text),atom_string(Atom,Text)).
finite(Number) :-
    (integer(Number)->true;
      float_class(Number,Class),
      (memberchk(Class,[zero,subnormal,normal])->true;domain_error(finite_symbolic_number,Number))).

query_text(Term,Text) :-
    encode_term(Term,_),term_variables(Term,Variables),
    with_output_to(string(Text),write_sexpr(Term,Variables)),
    string_length(Text,N),(N=<16384->true;domain_error(symbolic_query_characters,N)),
    kb_reader:normalize_query(Text,Read,_),
    (Term=@=Read->true;domain_error(lossless_symbolic_query,Term)).
write_sexpr(Term,Variables) :- var(Term),!,
    variable_index(Term,Variables,1,Index),format('?V~d',[Index]).
write_sexpr(Term,_) :- string(Term),!,write_escaped(Term,0'").
write_sexpr(Term,_) :- number(Term),!,finite(Term),write(Term).
write_sexpr(Term,_) :- atom(Term),!,
    (atom_concat(x_,Bare,Term)->atom_concat('#$',Bare,Symbol);Symbol=Term),
    atom_string(Symbol,Text),write_escaped(Text,0'|).
write_sexpr(Term,Variables) :-
    (is_dict(Term);is_list(Term)),!,domain_error(kif_query_structure,Term-Variables).
write_sexpr(Term,Variables) :-
    compound_name_arguments(Term,Functor,Arguments),
    (Functor==t->Arguments=[Head|Args];Head=Functor,Args=Arguments),
    put_char('('),write_sexpr(Head,Variables),
    forall(member(Arg,Args),(put_char(' '),write_sexpr(Arg,Variables))),put_char(')').
write_escaped(Text,Delimiter) :-
    put_code(Delimiter),string_codes(Text,Codes),
    forall(member(Code,Codes),escaped_code(Code,Delimiter)),put_code(Delimiter).
escaped_code(Code,Delimiter) :-
    (Code=:=Delimiter;Code=:=0'\\),!,put_code(0'\\),put_code(Code).
escaped_code(10,0'") :- !,write('\\n').
escaped_code(13,0'") :- !,write('\\r').
escaped_code(9,0'") :- !,write('\\t').
escaped_code(Code,_) :- put_code(Code).

json_arguments(Term,Arguments) :-
    encode_term(Term,_),json_value(Term,Arguments,0),
    (is_dict(Arguments)->true;domain_error(symbolic_argument_object,Term)).
json_value(_,_,Depth) :- Depth>32,!,domain_error(symbolic_arguments_depth,Depth).
json_value(Value,_,_) :- var(Value),!,instantiation_error(Value).
json_value(Value,Value,_) :- string(Value),!.
json_value(Value,Value,_) :- number(Value),!,finite(Value).
json_value(x_True,true,_) :- !.
json_value(x_False,false,_) :- !.
json_value(x_Null,null,_) :- !.
json_value(x_symbolicContextKey(Context),Text,_) :- !,
    kb_terms:context_key(Context,Key),atom_string(Key,Text).
json_value(x_symbolicSExpression(Formula),Text,_) :- !,query_text(Formula,Text).
json_value(x_symbolicTerm(Term),Wire,_) :- !,encode_term(Term,Wire).
json_value(x_symbolicArray(Sequence),Items,Depth) :- !,
    sequence(Sequence,Values),Next is Depth+1,maplist(json_at(Next),Values,Items).
json_value(x_symbolicObject(Sequence),Object,Depth) :- !,
    sequence(Sequence,Fields),Next is Depth+1,maplist(json_field(Next),Fields,Pairs),
    pairs_keys(Pairs,Keys),sort(Keys,Unique),
    (same_length(Keys,Unique)->true;domain_error(duplicate_symbolic_argument_keys,Keys)),
    dict_pairs(Object,json,Pairs).
json_value(Value,_,_) :- domain_error(symbolic_json_value,Value).
json_at(Depth,Term,Value) :- json_value(Term,Value,Depth).
json_field(Depth,x_symbolicField(Text,Raw),Key-Value) :- !,
    must_be(string,Text),string_length(Text,N),
    (between(1,128,N)->true;domain_error(symbolic_argument_key,Text)),
    atom_string(Key,Text),json_value(Raw,Value,Depth).
json_field(_,Field,_) :- domain_error(symbolic_argument_field,Field).
sequence(Term,_) :- var(Term),!,instantiation_error(Term).
sequence(x_TheList,[]) :- !.
sequence(Term,Items) :- compound(Term),Term=..[x_TheList|Items],!.
sequence(Term,_) :- domain_error(symbolic_TheList,Term).
