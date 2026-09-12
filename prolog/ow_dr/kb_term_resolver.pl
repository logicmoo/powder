:- module(kb_term_resolver,[term_input/3]).

/** <module> Data-only input adapter for the canonical loaded-term resolver

term_input(Input,LookupKey,Description) accepts an existing canonical nat:/mt:
key, normalized atomic identity, an actual ground normalized Prolog compound,
canonical native text x_Fn(x_arg), or one human CycL expression (Fn arg).
Human input uses kb_reader:normalize_query/3, the SAME grammar used by
kb_terms:context_input/2; no additional S-expression parser is introduced.
Native inputs bypass normalization/remapping. Keys use kb_non_atomic and
kb_terms' existing canonical data codecs. Nothing is consulted or executed.

This adapter establishes syntax/groundness only, NOT denotation, existence,
microtheory membership or type. kb_term_roles:resolve_term/2 performs the
authoritative generation-scoped lookup. Multiple human expressions and syntax
errors retain the existing reader's located errors; nonground/native invalid
inputs raise typed errors. An unobserved well-formed term is not auto-indexed.
*/

:- use_module(kb_non_atomic,[non_atomic_key/2,non_atomic_from_key/2]).
:- use_module(kb_terms,[context_from_key/2]).
:- use_module(kb_reader,[normalize_query/3]).
:- use_module(kb_symbols,[encoded_symbol/1]).
:- use_module(library(error)).

term_input(Input,Key,Description) :-
    (var(Input)->instantiation_error(Input)
    ;\+acyclic_term(Input)->domain_error(acyclic_term_input,Input)
    ;compound(Input),\+string(Input)->
       ground_input(Input),non_atomic_key(Input,Key),Kind=native_term
    ;text_atom(Input,Atom),trim_atom(Atom,Trimmed),
     (Trimmed==''->domain_error(nonempty_term_input,Input)
     ;atom_concat('nat:',_,Trimmed)->
        non_atomic_from_key(Trimmed,_),Key=Trimmed,Kind=canonical_nat
     ;atom_concat('mt:',_,Trimmed)->
        context_from_key(Trimmed,_),Key=Trimmed,Kind=canonical_mt
     ;native_application_text(Trimmed)->
        atom_concat('nat:',Trimmed,NativeKey),non_atomic_from_key(NativeKey,_),
        Key=NativeKey,Kind=native_text
     ;canonical_symbol_text(Trimmed)->
        Key=Trimmed,Kind=canonical_symbol
     ;atom_string(Trimmed,Text),normalize_query(Text,Term,_),
      ground_input(Term),normalized_key(Term,Key),Kind=human_cycl)),
    Description=term_input{inputKind:Kind,identity:Key}.
native_application_text(Text) :-
    atom_concat(x_,_,Text),sub_atom(Text,_,1,_,'(').
canonical_symbol_text(Text) :-
    encoded_symbol(Text),atom_codes(Text,Codes),
    \+ (member(C,Codes),(code_type(C,space);memberchk(C,[0'(,0'),0';]))).
normalized_key(Term,Key) :-
    (atom(Term),encoded_symbol(Term)->Key=Term;non_atomic_key(Term,Key)).
ground_input(Term) :-
    (ground(Term)->true;domain_error(ground_term_input,Term)).
text_atom(Input,Atom) :-
    (atom(Input)->Atom=Input;string(Input)->atom_string(Atom,Input);type_error(term_input,Input)).
trim_atom(Atom,Trimmed) :-
    atom_codes(Atom,Codes),trim_left(Codes,Left),reverse(Left,Reversed),
    trim_left(Reversed,Right),reverse(Right,Result),atom_codes(Trimmed,Result).
trim_left([C|Cs],Out) :- code_type(C,space),!,trim_left(Cs,Out).
trim_left(Codes,Codes).
