:- module(kb_catalog_schema,
    [source_schema_evidence/3,build_catalog_schema/2,term_classification/4,
     definition_slots/3]).
:- use_module(kb_file_dependencies,[]).
:- use_module(kb_do_invocations,[do_invocation_symbol/1]).
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
       Proof=e(Source,Id,Line,Mt,Path)),Direct),
    indexed_slot_evidence(Source,Data,Sentences,Indexed),
    relation_declaration_evidence(Source,Data,Declared),
    append([Direct,Indexed,Declared],Evidence).
sentence_pair(S,N-S) :- S=s(N,_,_,_,_,_).
relation_declaration_evidence(Source,Data,Claims) :-
    (get_dict(dependencies,Data,D),is_list(D.declared)->Declarations=D.declared;Declarations=[]),
    findall(Id-S,(member(S,Data.sentences),S=s(_,Id,_,_,_,_)),Pairs),
    keysort(Pairs,Sorted),list_to_assoc(Sorted,ById),
    findall(claim(relation_declaration,Symbol,declared,E),
      (member(symbol(Symbol,_,_,_,Evidence),Declarations),
       member(e(Id,_,declaration,positive),Evidence),get_assoc(Id,ById,s(_,Id,Line,Mt,_,_)),
       E=e(Source,Id,Line,Mt,[args,0])),Claims).

indexed_slot_evidence(Source,Data,Sentences,Evidence) :-
    findall((N-ArgPath)-wanted(N,Path,Slot,Part),
      (member(a(N,Head,2,Path),Data.applications),
       Probe=..[Head,x_catalog_subject,x_catalog_type],
       kb_file_dependencies:typed_position(Probe,x_catalog_subject,Slot,x_catalog_type),
       (Part=subject,Index=0;Part=type,Index=1),append(Path,[args,Index],ArgPath)),Wants),
    grouped(Wants,Wanted),
    findall((N-Path-Slot)-part(Part,Key),
      (member(t(Key,_,_,_,_,_,Hits),Data.terms),member(h(N,ArgPath,_,semantic),Hits),
       get_assoc(N-ArgPath,Wanted,Matches),member(wanted(N,Path,Slot,Part),Matches)),Parts),
    grouped(Parts,Grouped),assoc_to_list(Grouped,Groups),
    findall(claim(target_slot,Subject,slot(Slot,Type),e(Source,Id,Line,Mt,Path)),
      (member((N-Path-Slot)-Values,Groups),
       memberchk(part(subject,Subject),Values),memberchk(part(type,Type),Values),
       get_assoc(N,Sentences,s(_,Id,Line,Mt,_,_))),Evidence).

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
    descendants(x_Relation,Children,RelationClasses),list_to_assoc(RelationClasses,RelationClassMap),
    findall(Subject-Proof,
      (member(claim(relation_declaration,Subject,_,Proof),Evidence);
       member(claim(genlPreds,A,B,Proof),Evidence),(Subject=A;Subject=B)),DeclaredRelations),
    grouped(DeclaredRelations,RelationDeclarations),
    Schema=taxonomy{types:Types,categories:Categories,metaRelations:MetaRelations,
      targetSlots:Slots,relationClasses:RelationClassMap,relationDeclarations:RelationDeclarations,
      invocationPolicy:literal_do_capital_v1,scope:catalog_taxonomy_not_mt_entailment},!.

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
    append(Typed,Observed,BasePairs),
    (do_invocation_symbol(Key),relation_evidence(Key,Types,BasePairs,Schema,Basis)->
       Pairs0=[do_invocations-named_relation_reference(Basis)|BasePairs];Pairs0=BasePairs),
    sort(Pairs0,Pairs),pairs_keys(Pairs,Groups0),sort(Groups0,Known),
    (Known==[]->(Types==[]->Groups=[unclassified];Groups=[typed_other]);Groups=Known),
    associated(Schema.metaRelations,Key,Meta),
    Reply=classification{groups:Groups,types:Types,evidence:Pairs,metaRelation:Meta,
      scope:Schema.scope,implementation:unknown}.
relation_evidence(_,_,Pairs,_,predicate) :- memberchk(predicates-_,Pairs),!.
relation_evidence(Key,_,_,Schema,declaration(Proofs)) :-
    get_assoc(Key,Schema.relationDeclarations,Proofs),!.
relation_evidence(_,Types,_,Schema,type(Type,Proof,Chain)) :-
    member(type(Type,Proof),Types),get_assoc(Type,Schema.relationClasses,Chain),!.
position_category(predicate_symbol,predicates).
position_category(constructor_symbol,functions).
position_category(microtheory_context,microtheories).
position_category(collection_type,collections).

definition_slots(Predicate,Schema,Slots) :-
    associated(Schema.targetSlots,Predicate,Evidence),
    findall(N,member(slot(N,_),Evidence),Numbers),sort(Numbers,Slots).
