:- module(kb_symbolic_agent_state,[encode_cursor/2,decode_cursor/2]).
:- use_module(kb_symbolic_agent_wire,[]).
:- use_module(library(http/json)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).

% A postorder node table keeps ordinary long continuations within KEE's JSON
% depth ceiling. It is data only; references can point only to earlier nodes.
encode_cursor(Cursor,JSON) :-
    must_be(dict,Cursor),kb_symbolic_agent_wire:encode_term(Cursor,Wire),
    phrase(flat_node(Wire.term,0,Count,Root),Nodes),
    (Count=<8192->true;domain_error(symbolic_cursor_nodes,Count)),
    Data=json{schema:"powder.symbolic-cursor.v1",root:Root,nodes:Nodes},
    with_output_to(string(JSON),json_write_dict(current_output,Data,[width(0)])),
    string_length(JSON,Size),
    (Size=<65536->true;domain_error(symbolic_cursor_characters,Size)).

decode_cursor(JSON,Cursor) :-
    must_be(string,JSON),string_length(JSON,Size),
    (Size=<65536->true;domain_error(symbolic_cursor_characters,Size)),
    atom_json_dict(JSON,Data,[]),must_be(dict,Data),
    dict_pairs(Data,_,Pairs),findall(K,member(K-_,Pairs),Keys),
    (Keys==[nodes,root,schema],Data.schema=="powder.symbolic-cursor.v1"->true;
      domain_error(symbolic_cursor_schema,Data)),
    must_be(list,Data.nodes),must_be(integer,Data.root),length(Data.nodes,N),
    (between(1,8192,N),Data.root=:=N-1->true;domain_error(symbolic_cursor_root,Data.root)),
    empty_assoc(Empty),decode_rows(Data.nodes,0,Empty,Table),
    get_assoc(Data.root,Table,node(Node,_)),
    kb_symbolic_agent_wire:decode_term(json{schema:"powder.symbolic-term.v1",term:Node},Cursor),
    must_be(dict,Cursor).

flat_node(Node,N0,N,Ref) -->
    flat_value(Node.type,Node,N0,N1,Row),
    {Ref=N1,N is N1+1},[Row].
flat_value(variable,V,N,N,["v",V.id]) --> [].
flat_value(nil,_,N,N,["z"]) --> [].
flat_value(string,V,N,N,["s",V.value]) --> [].
flat_value(number,V,N,N,["n",V.value]) --> [].
flat_value(symbol,V,N,N,["a",V.value]) --> [].
flat_value(list,V,N0,N,["l",Refs]) --> flat_children(V.items,N0,N,Refs).
flat_value(compound,V,N0,N,["c",V.functor,Refs]) --> flat_children(V.args,N0,N,Refs).
flat_value(dict,V,N0,N,["d",Tag,Entries]) -->
    flat_node(V.tag,N0,N1,Tag),flat_pairs(V.entries,N1,N,Entries).
flat_children([],N,N,[]) --> [].
flat_children([Child|Rest],N0,N,[Ref|Refs]) -->
    flat_node(Child,N0,N1,Ref),flat_children(Rest,N1,N,Refs).
flat_pairs([],N,N,[]) --> [].
flat_pairs([Pair|Rest],N0,N,[[K,V]|Pairs]) -->
    flat_node(Pair.key,N0,N1,K),flat_node(Pair.value,N1,N2,V),
    flat_pairs(Rest,N2,N,Pairs).

decode_rows([],_,Table,Table).
decode_rows([Row|Rest],Index,T0,Table) :-
    row_node(Row,Index,T0,Node,Cost),
    (Cost=<16384->true;domain_error(symbolic_cursor_expansion,Cost)),
    put_assoc(Index,T0,node(Node,Cost),T1),Next is Index+1,
    decode_rows(Rest,Next,T1,Table).
row_node(["v",Id],_,_,json{type:variable,id:Id},1) :- !.
row_node(["z"],_,_,json{type:nil},1) :- !.
row_node(["s",Value],_,_,json{type:string,value:Value},1) :- !.
row_node(["n",Value],_,_,json{type:number,value:Value},1) :- !.
row_node(["a",Value],_,_,json{type:symbol,value:Value},1) :- !.
row_node(["l",Refs],Index,Table,json{type:list,items:Nodes},Cost) :- !,
    referenced(Refs,Index,Table,Nodes,Children),Cost is Children+1.
row_node(["c",Name,Refs],Index,Table,json{type:compound,functor:Name,args:Nodes},Cost) :- !,
    referenced(Refs,Index,Table,Nodes,Children),Cost is Children+1.
row_node(["d",TagRef,Entries],Index,Table,json{type:dict,tag:Tag,entries:Pairs},Cost) :- !,
    reference(TagRef,Index,Table,Tag,TagCost),
    must_be(list,Entries),maplist(referenced_pair(Index,Table),Entries,Pairs,Costs),
    sum_list(Costs,Children),Cost is Children+TagCost+1.
row_node(Row,_,_,_,_) :- domain_error(symbolic_cursor_node,Row).
referenced(Refs,Index,Table,Nodes,Cost) :-
    must_be(list,Refs),maplist(reference_at(Index,Table),Refs,Nodes,Costs),
    sum_list(Costs,Cost).
reference_at(Index,Table,Ref,Node,Cost) :- reference(Ref,Index,Table,Node,Cost).
reference(Ref,Index,Table,Node,Cost) :-
    (integer(Ref),Ref>=0,Ref<Index,get_assoc(Ref,Table,node(Node,Cost))->true;
      domain_error(symbolic_cursor_reference,Ref)).
referenced_pair(Index,Table,[K,V],json{key:Key,value:Value},Cost) :- !,
    reference(K,Index,Table,Key,KCost),reference(V,Index,Table,Value,VCost),Cost is KCost+VCost.
referenced_pair(_,_,Pair,_,_) :- domain_error(symbolic_cursor_pair,Pair).
