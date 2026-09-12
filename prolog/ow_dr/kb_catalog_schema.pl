:- module(kb_catalog_schema,
    [source_schema_evidence/3,build_catalog_schema/2,term_classification/4,
     definition_slots/3]).
:- use_module(library(assoc)).
:- use_module(library(apply)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

/** <module> Evidence-backed catalog taxonomy, not query inference.

Only positive source claims participate. Cross-file taxonomy paths keep their
original assertion/MT provenance. This classifies catalog entries; it does not
make one MT's facts true in another MT or invent an implementation of a symbol.
MetaRelation membership alone never supplies a definition argument slot.
*/

source_schema_evidence(Source,Data,Evidence) :-
    maplist(sentence_pair,Data.sentences,Pairs),list_to_assoc(Pairs,Sentences),
    findall(claim(Kind,Subject,Value,Proof),
      (member(c(Kind,Subject,Value,N,Path),Data.claims),
       get_assoc(N,Sentences,s(_,Id,Line,Mt,_,_)),
       Proof=e(Source,Id,Line,Mt,Path)),Evidence).
sentence_pair(S,N-S) :- S=s(N,_,_,_,_,_).

build_catalog_schema(Evidence,Schema) :-
    findall(Parent-edge(Child,Proof),member(claim(genls,Child,Parent,Proof),Evidence),Edges),
    grouped(Edges,Children),
    findall(Class-membership(Group,Root,Proofs),
      (category_root(Root,Group),descendants(Root,Children,Paths),
       member(Class-Proofs,Paths)),CategoryPairs),
    grouped(CategoryPairs,Categories),
    findall(Subject-type(Type,Proof),member(claim(isa,Subject,Type,Proof),Evidence),TypePairs),
    grouped(TypePairs,Types),
    descendants(x_MetaRelation,Children,MetaClasses),
    list_to_assoc(MetaClasses,MetaClassMap),
    findall(P-meta(Type,[Proof|Chain]),
      (member(claim(isa,P,Type,Proof),Evidence),get_assoc(Type,MetaClassMap,Chain)),MetaPairs),
    grouped(MetaPairs,MetaRelations),
    findall(Parent-edge(Child,Proof),
      member(claim(genlPreds,Child,Parent,Proof),Evidence),PredicateEdges),
    grouped(PredicateEdges,PredicateChildren),
    findall(Type-Proofs,
      (member(Root,[x_Relation,x_Predicate,x_Function,'x_Function-Denotational']),
       descendants(Root,Children,Paths),member(Type-Proofs,Paths)),RelationTypes),
    grouped(RelationTypes,RelationTypeMap),
    findall(P-slot(N,Proofs),
      (member(claim(target_slot,Parent,slot(N,Type),Declaration),Evidence),
       get_assoc(Parent,MetaRelations,MetaProofs),
       get_assoc(Type,RelationTypeMap,TypeProofs),
       descendants(Parent,PredicateChildren,Specializations),
       member(P-SubProofs,Specializations),
       Proofs=target_evidence(Declaration,MetaProofs,TypeProofs,SubProofs)),SlotPairs),
    grouped(SlotPairs,Slots),
    Schema=taxonomy{types:Types,categories:Categories,metaRelations:MetaRelations,
      targetSlots:Slots,scope:catalog_taxonomy_not_mt_entailment},!.

category_root(x_Predicate,predicates).
category_root(x_Function,functions).
category_root('x_Function-Denotational',functions).
category_root(x_Collection,collections).
category_root(x_Microtheory,microtheories).
category_root(x_ExternalSymbol,external_symbols).
category_root(x_SubLSymbol,external_symbols).

grouped(Pairs,Map) :-
    sort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),list_to_assoc(Groups,Map).
associated(Map,Key,Values) :- (get_assoc(Key,Map,Values)->true;Values=[]).

% A shortest evidence path per reachable class bounds cycles and diamond graphs.
descendants(Root,Children,Pairs) :-
    empty_assoc(Empty),put_assoc(Root,Empty,[],Seen),
    walk([Root],[],Children,Seen,Complete),assoc_to_list(Complete,Pairs).
walk([],[],_,Seen,Seen).
walk([],Back,Children,Seen,Complete) :-
    Back\=[],reverse(Back,Front),walk(Front,[],Children,Seen,Complete).
walk([Parent|Front],Back,Children,Seen,Complete) :-
    get_assoc(Parent,Seen,Chain),associated(Children,Parent,Edges),
    foldl(visit_child(Chain),Edges,queue(Back,Seen),queue(NextBack,NextSeen)),
    walk(Front,NextBack,Children,NextSeen,Complete).
visit_child(Chain,edge(Child,Proof),queue(Back,Seen),queue(NextBack,NextSeen)) :-
    (get_assoc(Child,Seen,_)->NextBack=Back,NextSeen=Seen
    ;put_assoc(Child,Seen,[Proof|Chain],NextSeen),NextBack=[Child|Back]).

term_classification(Key,Roles,Schema,Reply) :-
    associated(Schema.types,Key,Types),
    findall(Group-type_evidence(Type,Declaration,Root,Chain),
      (member(type(Type,Declaration),Types),
       get_assoc(Type,Schema.categories,Memberships),
       member(membership(Group,Root,Chain),Memberships)),Typed),
    findall(Group-position_evidence(Role),
      (member(Role,Roles),position_category(Role,Group)),Observed),
    append(Typed,Observed,Pairs0),sort(Pairs0,Pairs),pairs_keys(Pairs,Groups0),sort(Groups0,Known),
    (Known==[]->(Types==[]->Groups=[unclassified];Groups=[individuals]);Groups=Known),
    associated(Schema.metaRelations,Key,Meta),
    Reply=classification{groups:Groups,types:Types,evidence:Pairs,metaRelation:Meta,
      scope:Schema.scope,implementation:unknown}.
position_category(predicate_symbol,predicates).
position_category(constructor_symbol,functions).
position_category(microtheory_context,microtheories).
position_category(collection_type,collections).

definition_slots(Predicate,Schema,Slots) :-
    associated(Schema.targetSlots,Predicate,Evidence),
    findall(N,member(slot(N,_),Evidence),Numbers),sort(Numbers,Slots).
