:- module(kb_role_metadata,[project_properties/3]).

/** <module> Compact, non-authoritative metadata view for derived role indexes

The authoritative store retains its own origin-sensitive policy. This disposable
index does not need redundant source representations even for SUMO, so it uses
the shared policy's explicit unknown-origin token (never source/header probing).
Remaining ordinary values are retained losslessly only within a small JSON
budget. Deferred properties are reported, not silently represented as absent.
This projection never changes the store, caches, source files or semantic data.

Versioned term_representation records get priority and retain every conflicting
kind. Only their three defined scalar fields are copied; optional large payloads
are not evidence. No original formula/CNF text is parsed to invent markers.
Source property ordinals survive projection for typed-export provenance.
*/

:- use_module(kb_metadata_policy,[filter_json_properties/3,redundant_property/1,retention_policy/1]).
:- use_module(library(error)).
:- use_module(library(lists)).

project_properties(Properties,Projected,Report) :-
    must_be(list,Properties),retention_policy(Policy),
    project_list(Properties,0,budget(64,2048,32768),_,Projected,Positions,
                 Dropped,Deferred,Condensed,Names,Count),
    length(Projected,Retained),
    (Dropped=:=0,Deferred=:=0,Condensed=:=0->Complete=true;Complete=false),
    sort(Names,UniqueNames),take(16,UniqueNames,Preview),
    Report=property_projection{mode:compact_index,policy:Policy,complete:Complete,
      originalCount:Count,retainedCount:Retained,policyDroppedCount:Dropped,
      deferredCount:Deferred,condensedMarkerCount:Condensed,
      omittedNames:Preview,sourcePropertyPositions:Positions,
      authoritative:false}.
project_list([],N,B,B,[],[],0,0,0,[],N).
project_list([P|Ps],N,B0,B,Out,Positions,Dropped,Deferred,Condensed,Names,Count) :-
    must_be(dict,P),
    filter_json_properties(unknown,[P],Candidates),
    (redundant_property(P.name)->D0=1,Names0=[P.name];D0=0,Names0=[]),
    project_candidates(Candidates,N,B0,B1,Here,HerePositions,F0,C0,DeferredNames),
    Next is N+1,
    project_list(Ps,Next,B1,B,Rest,RestPositions,D1,F1,C1,OtherNames,Count),
    append(Here,Rest,Out),append(HerePositions,RestPositions,Positions),
    append([Names0,DeferredNames,OtherNames],Names),
    Dropped is D0+D1,Deferred is F0+F1,Condensed is C0+C1.
project_candidates([],_,B,B,[],[],0,0,[]).
project_candidates([P|Ps],Ordinal,B0,B,Out,Positions,Deferred,Condensed,Names) :-
    (compact_marker(P,Q,Changed)->
       Here=[Q],HerePositions=[Ordinal],B1=B0,F0=0,C0=Changed,Names0=[]
    ;ordinary_property(P,B0,B1,Q)->
       Here=[Q],HerePositions=[Ordinal],F0=0,C0=0,Names0=[]
    ;Here=[],HerePositions=[],B1=B0,F0=1,C0=0,Names0=[P.name]),
    project_candidates(Ps,Ordinal,B1,B,Rest,RestPositions,F1,C1,OtherNames),
    append(Here,Rest,Out),append(HerePositions,RestPositions,Positions),
    append(Names0,OtherNames,Names),Deferred is F0+F1,Condensed is C0+C1.

compact_marker(P,Q,Changed) :-
    text_atom(P.name,Name),Name==term_representation,
    get_dict(value,P,V),is_dict(V),
    get_dict(schema,V,Schema),text_atom(Schema,'powder.term-representation.v1'),
    get_dict(identity,V,Identity),bounded_text(Identity,262144),
    get_dict(representation,V,Kind),text_atom(Kind,K),memberchk(K,[nart,naut]),
    Q=json{name:P.name,value:json{schema:Schema,identity:Identity,representation:Kind}},
    compound_name_arity(V,_,Arity),(Arity>7->Changed=1;Changed=0),!.
ordinary_property(P,budget(P0,N0,C0),budget(P1,N,C),Q) :-
    P0>0,P1 is P0-1,
    compact_json(P,8,N0,N,C0,C),ground_json(P,Q).
bounded_text(Value,Limit) :-
    (atom(Value)->atom_length(Value,N);string(Value)->string_length(Value,N)),
    N>0,N=<Limit.
text_atom(Value,Atom) :-
    (atom(Value)->Atom=Value;string(Value)->atom_string(Atom,Value)).

compact_json(Value,Depth,N0,N,C0,C) :-
    Depth>=0,N0>0,N1 is N0-1,
    (string(Value)->string_length(Value,Length),Length=<8192,C is C0-Length,C>=0,N=N1
    ;atom(Value)->atom_length(Value,Length),Length=<8192,C is C0-Length,C>=0,N=N1
    ;number(Value)->bounded_number(Value),C is C0-32,C>=0,N=N1
    ;is_list(Value)->Next is Depth-1,compact_list(Value,Next,N1,N,C0,C)
    ;is_dict(Value)->
       compound_name_arity(Value,_,Arity),Arity=<129,
       dict_pairs(Value,_,Pairs),Next is Depth-1,compact_pairs(Pairs,Next,N1,N,C0,C)).
bounded_number(Value) :-
    (integer(Value)->Value> -(1<<4096),Value< (1<<4096)
    ;float(Value),float_class(Value,Class),memberchk(Class,[normal,subnormal,zero])).
compact_list([],_,N,N,C,C).
compact_list([V|Vs],Depth,N0,N,C0,C) :-
    compact_json(V,Depth,N0,N1,C0,C1),compact_list(Vs,Depth,N1,N,C1,C).
compact_pairs([],_,N,N,C,C).
compact_pairs([K-V|Pairs],Depth,N0,N,C0,C) :-
    compact_json(K,Depth,N0,N1,C0,C1),compact_json(V,Depth,N1,N2,C1,C2),
    compact_pairs(Pairs,Depth,N2,N,C2,C).
ground_json(Value,Ground) :-
    (is_dict(Value)->dict_pairs(Value,_,Pairs),maplist(ground_pair,Pairs,New),dict_pairs(Ground,json,New)
    ;is_list(Value)->maplist(ground_json,Value,Ground)
    ;atomic(Value)->Ground=Value
    ;type_error(ground_json,Value)).
ground_pair(K-V,K-G) :- ground_json(V,G).
take(0,_,[]) :- !.
take(_,[],[]) :- !.
take(N,[X|Xs],[X|Ys]) :- Next is N-1,take(Next,Xs,Ys).
