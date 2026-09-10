:- module(kb_index,
          [semantic_constants/2,semantic_signature/2,
           build_index/3,write_index/4,read_index/3,index_schema/1]).

/** <module> Ground, persistent semantic indexes.

Each source index has a structured kb_index_header/1 and kb_index_footer/3,
bound to the source hash, normalized payload digest and logos_index_v1 schema.
kb_index_data/1 stores source locators, counts and pre-ranked overview lists.
Binary xc_indexed_constant/2 records contain distinct semantic constants per ID.
No executable directives, native handles or live variables are serialized.
*/

:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(kb_cache).
:- use_module(kb_symbols).
:- use_module(kb_load_policy).

index_schema(logos_index_v1).

semantic_constants(Semantic,Constants) :-
    constants(Semantic,All,[]),sort(All,Constants).

constants(T,L,L) :- var(T), !.
constants(T,L,L) :- string(T), !.
constants(T,L,L) :- number(T), !.
constants([],L,L) :- !.
constants(T,L,R) :- atom(T), !, symbol_constant(T,L,R).
constants(T,L,R) :-
    is_dict(T), !,dict_pairs(T,_,Pairs),pair_constants(Pairs,L,R).
constants([H|T],L,R) :- !, constants(H,L,M),constants(T,M,R).
constants(T,L,R) :-
    compound_name_arguments(T,Functor,Args),list_data_slot(Functor,Args,Position),
    nth1(Position,Args,Data,OtherArgs),
    format_literal_data(Data),!,
    L=[Functor|M],constants_list(OtherArgs,M,R).
constants(T,L,R) :-
    compound_name_arguments(T,Name,Args),
    symbol_constant(Name,L,M), constants_list(Args,M,R).

symbol_constant(Symbol,[Symbol|L],L) :-
    atom(Symbol), atom_concat(x_,_,Symbol),
    \+ memberchk(Symbol,[x_cid,x_cid_io,x_aid,x_cid_in,x_cid_out]),!.
symbol_constant(_,L,L).
constants_list([],L,L).
constants_list([T|Ts],L,R) :- constants(T,L,M),constants_list(Ts,M,R).
pair_constants([],L,L).
pair_constants([K-V|Ps],L,R) :-
    symbol_constant(K,L,M),constants(V,M,N),pair_constants(Ps,N,R).

semantic_signature(Semantic,signature(Predicate,Arity)) :-
    nonvar(Semantic),
    (Semantic=(Head :- _)->true;Head=Semantic),
    nonvar(Head),
    functor(Head,Name,N),
    ( Name==t,N>=1
    -> arg(1,Head,P),Arity is N-1,
       (atom(P),atom_concat(x_,_,P)->Predicate=P
       ;var(P)->Predicate=variable_predicate
       ;Predicate=compound_predicate)
    ; Predicate=Name,Arity=N).

build_index(Header,Records,Index) :-
    require_offline(kb_index:build_index/3),
    findall(entry(Id,Signature,Mt,File,Line,Constants),
        (member(record(Id,S,Metadata),Records),
         semantic_signature(S,Signature),semantic_constants(S,Constants),
         memberchk(xc_microtheory(Id,Mt),Metadata),
         memberchk(xc_source_file(Id,File),Metadata),
         memberchk(xc_source_line(Id,Line),Metadata)), Entries),
    findall(C,(member(entry(_,_,_,_,_,Cs),Entries),member(C,Cs)),AllConstants),
    msort(AllConstants,SortedConstants),clumped(SortedConstants,Counts),
    findall(N-C,member(C-N,Counts),Rank0),sort(0,@>=,Rank0,RankedConstants),
    findall(S,member(entry(_,S,_,_,_,_),Entries),Sigs),
    msort(Sigs,SS),clumped(SS,PredicateCounts),
    findall(N-S,member(S-N,PredicateCounts),PR0),sort(0,@>=,PR0,RankedPredicates),
    Index=index{source:Header.source,entries:Entries,constants:Counts,
                predicates:PredicateCounts,rankedConstants:RankedConstants,
                rankedPredicates:RankedPredicates}.

write_index(Path,CacheHeader,Records,Header) :-
    require_offline(kb_index:write_index/4),
    build_index(CacheHeader,Records,Index),
    index_terms(Index,Terms),
    terms_digest(Terms,Digest),
    length(Records,Count),
    index_schema(Schema),
    BaseHeader=index_header{schema:Schema,source:CacheHeader.source,
        sourceHash:CacheHeader.sourceHash,normalizedDigest:CacheHeader.normalizedDigest,
        count:Count,digest:Digest},
    (get_dict(normalizedFile,CacheHeader,Origin)->Header=BaseHeader.put(normalizedFile,Origin);Header=BaseHeader),
    terms_digest([Header],HD),
    setup_call_cleanup(open(Path,write,S,[encoding(utf8),newline(posix)]),
       (write_one_line(S,kb_index_header(Header)),
        forall(member(T,Terms),write_one_line(S,T)),
        write_one_line(S,kb_index_footer(Count,Digest,HD)),flush_output(S)),
       close(S)).

index_terms(Index,[kb_index_data(Index)|Constants]) :-
    findall(xc_indexed_constant(Id,C),
      (member(entry(Id,_,_,_,_,Cs),Index.entries),member(C,Cs)),Constants).

read_index(Path,Header,Index) :-
    setup_call_cleanup(open(Path,read,S,[encoding(utf8),newline(posix)]),
      read_index_stream(S,Header,Index),close(S)),!.
read_index(Path,_,_) :- throw(error(invalid_semantic_index(Path),_)).

read_index_stream(S,Header,Index) :-
    kb_cache:read_line_term(S,kb_index_header(Header),_),
    ground(Header),is_dict(Header,index_header),index_schema(Header.schema),
    atom(Header.source),kb_cache:sha256_atom(Header.sourceHash),
    (get_dict(normalizedFile,Header,Origin)->atom(Origin),is_absolute_file_name(Origin);true),
    kb_cache:sha256_atom(Header.normalizedDigest),kb_cache:sha256_atom(Header.digest),
    integer(Header.count),Header.count>=0,
    read_index_terms(S,Terms,Footer),
    read_line_to_string(S,end_of_file),
    terms_digest(Terms,Header.digest),terms_digest([Header],HD),
    Footer==kb_index_footer(Header.count,Header.digest,HD),
    Terms=[kb_index_data(Index)|Constants],
    ground(Index),is_dict(Index),Index.source==Header.source,
    length(Index.entries,Header.count),maplist(valid_entry,Index.entries),
    findall(Id,member(entry(Id,_,_,_,_,_),Index.entries),Ids),
    sort(Ids,UniqueIds),same_length(Ids,UniqueIds),
    index_terms(Index,Expected),Terms==Expected,
    forall(member(xc_indexed_constant(Id,C),Constants),
           (valid_assertion_id(Id),atom(C),atom_concat(x_,_,C))).

read_index_terms(S,Terms,Footer) :-
    kb_cache:read_line_term(S,T,_),
    (nonvar(T),T=kb_index_footer(_,_,_)
    ->Terms=[],Footer=T
    ;Terms=[T|Ts],read_index_terms(S,Ts,Footer)).

valid_entry(entry(Id,signature(P,N),Mt,File,Line,Cs)) :-
    valid_assertion_id(Id),atom(P),integer(N),N>=0,
    ground(Mt),acyclic_term(Mt),atom(File),integer(Line),Line>0,
    is_list(Cs),sort(Cs,Cs),
    forall(member(C,Cs),(atom(C),atom_concat(x_,_,C))).
