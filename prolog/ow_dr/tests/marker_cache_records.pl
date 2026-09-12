:- module(marker_cache_records,[]).
:- use_module('../kb_cache',[]).
:- use_module('../kb_terms').
:- use_module(library(http/json)).
:- initialization(main,main).

main([Cache]) :-
    kb_cache:read_cache(Cache,_,Records),
    findall(Row,
      (member(record(Id,Semantic,Metadata),Records),
       member(Original,Metadata),Original=..[Name,Id,Value],
       memberchk(Name,['xc_cyc::original-tv','xc_original-tv']),
       memberchk(Value,[':FALSE-DEF',":FALSE-DEF"]),
       memberchk(xc_kb_names(Id,Names),Metadata),
       semantic_ast(Semantic,Names,Expression),
       include(marker_property,Metadata,Compact),metadata_json(Compact,Properties),
       Row=_{id:Id,source:'KBs/tinykb.krf',expression:Expression,properties:Properties}),Rows),
    json_write_dict(current_output,_{items:Rows},[width(0)]),nl,halt.
marker_property(Term) :-
    functor(Term,Name,2),
    memberchk(Name,[xc_monotonicity,xc_direction,'xc_cyc::original-tv','xc_original-tv']).
