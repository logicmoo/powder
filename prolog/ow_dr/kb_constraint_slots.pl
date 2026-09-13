:- module(kb_constraint_slots,[constraint_slot/2,constraint_family/3,replace_marker/4]).
:- use_module(library(lists)).
:- use_module(library(error)).

/** <module> Record-slot keys, not logical negation or ontology inference.

The value column is deliberately absent from each key, even for a ground
candidate. Conditional keys retain the triggering type and both positions.
Only the explicitly supported numbered/generic argument families are aliases.
*/

constraint_slot(Term,slot(Family,Keys)) :-
    nonvar(Term),compound(Term),compound_name_arguments(Term,Head,Args),
    atom_concat(x_,Name,Head),
    slot_arguments(Name,Args,Family,Keys).

constraint_family(Term,Family,Target) :-
    nonvar(Term),compound(Term),compound_name_arguments(Term,Head,[Target|_]),
    atom_concat(x_,Name,Head),once(slot_arguments(Name,_,Family,_)).

slot_arguments(Name,[P,N,_],Name,[P,N]) :-
    memberchk(Name,[argIsa,argGenl,argQuotedIsa,argFormat]),position(N).
slot_arguments(Name,[P,_],Family,[P,N]) :-
    numbered_argument(Name,Family,N).
slot_arguments(Name,[P,N,_],Name,[P,N]) :-
    memberchk(Name,[argAndRestIsa,argAndRestGenl,argAndRestQuotedIsa]),position(N).
slot_arguments(Name,[P,_],Name,[P]) :-
    memberchk(Name,[arity,arityMin,arityMax,argsIsa,argsGenl,argsQuotedIsa,
      resultIsa,resultGenl,resultQuotedIsa,evaluationResultQuotedIsa,
      resultIsaArg,resultGenlArg]).
slot_arguments(Name,[P,FromType,_],Family,[P,From,To,FromType]) :-
    conditional_name(Name,Family,From,To).
slot_arguments(interArgDifferent,[P,A,B],interArgDifferent,[P,A,B]) :-
    position(A),position(B).

position(N) :- var(N),!.
position(N) :- integer(N),N>0.
numbered_argument(Name,Family,N) :-
    member(Suffix,['Isa','Genl','QuotedIsa','Format']),
    atom_concat(arg,DigitsSuffix,Name),atom_concat(Digits,Suffix,DigitsSuffix),
    positive_digits(Digits,N),atom_concat(arg,Suffix,Family).
conditional_name(Name,Family,From,To) :-
    member(Family,[interArgIsa,interArgNotIsa,interArgGenl]),
    atom_concat(Family,Positions,Name),
    atomic_list_concat([Left,Right],'-',Positions),
    positive_digits(Left,From),positive_digits(Right,To).
positive_digits(Atom,N) :-
    Atom\=='',atom_codes(Atom,Codes),maplist(digit,Codes),
    atom_number(Atom,N),N>0.
digit(C) :- between(0'0,0'9,C).

% This is structural substitution, NOT destructive setarg or Prolog execution.
% Reusing one fresh prototype for both substitutions preserves value sharing.
replace_marker(Term,Marker,Replacement,Result) :-
    must_be(ground,Marker),
    replace(Term,Marker,Replacement,Result).
replace(Term,Marker,Replacement,Result) :-
    (var(Term)->Result=Term
    ;Term==Marker->Result=Replacement
    ;compound(Term)->
      compound_name_arguments(Term,F,Args),
      maplist(replace_with(Marker,Replacement),Args,Values),
      compound_name_arguments(Result,F,Values)
    ;Result=Term).
replace_with(Marker,Replacement,Term,Result) :- replace(Term,Marker,Replacement,Result).
