:- module(kb_symbols, [encode_symbol/2, encoded_symbol/1, lisp_symbol/1,
                      list_data_slot/2, list_data_slot/3]).
:- use_module(library(error)).

encode_symbol(Symbol,Encoded) :-
    must_be(atom,Symbol),
    (encoded_symbol(Symbol)->Encoded=Symbol;atom_concat(x_,Symbol,Encoded)).

encoded_symbol(Symbol) :-
    atom(Symbol),(atom_concat(x_,_,Symbol);lisp_symbol(Symbol)), !.

lisp_symbol(Symbol) :-
    atom(Symbol),
    ( downcase_atom(Symbol,nil)
    ; sub_atom(Symbol,_,1,_,':')
    ; atom_concat('?',_,Symbol)
    ), !.

list_data_slot(Symbol,Position) :-
    (atom_concat(x_,Name,Symbol)->true;Name=Symbol),
    Name==genFormat,Position=3.

list_data_slot(Symbol,Arguments,Position) :-
    (list_data_slot(Symbol,Position)->true;
      (atom_concat(x_,Name,Symbol)->true;Name=Symbol),
      atom_concat(do,_,Name),Arguments=[First|_],
      string_argument(First),Position=2).

string_argument(Value) :- string(Value), !.
string_argument(n(_,_,str(Value))) :- string(Value).
