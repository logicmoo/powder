:- module(kb_do_invocations,[do_invocation_symbol/1]).
:- use_module(kb_symbols,[encode_symbol/2]).

/** Naming only; callers must independently require predicate/relation evidence. */
do_invocation_symbol(Input) :-
    (atom(Input)->Symbol=Input;string(Input)->atom_string(Symbol,Input);fail),
    (atom_concat('#$',Bare,Symbol)->true;Bare=Symbol),
    encode_symbol(Bare,Encoded),
    (atom_concat(x_,Visible,Encoded)->true;Visible=Encoded),
    atom_codes(Visible,[0'd,0'o,Capital|_]),
    between(0'A,0'Z,Capital).
