:- module(kb_term_categories,
          [build_category_catalog/4,category_page/5,category_section_pages/4,
           category_facet_page/6,category_item/3]).

/** <module> Multi-membership term categories from the active semantic snapshot

This is a pure derived index, NOT another browser facade or server. It is built
once with kb_term_roles' generation index, never reads sources or executes KB
forms. Public adapters live in kb_term_roles:

  category_terms(Filters,Offset,Limit,Reply)
  category_sections(Filters,Requests,Reply)
  category_facets(Filters,Facet,Offset,Limit,Reply)

Group order/keys:
  predicates, functions, collections, microtheories, the_word,
  external_symbols, do_invocations, individuals, unclassified.

Every matching group is retained. These are evidence-backed browsing roles,
NOT synthesized isa facts, local-provider definitions, or execution claims.
Individuals is the typed-instance remainder; Unclassified is the remaining
untyped remainder. Neither asserts ontological disjointness under open world.

Filters: q,match(exact|substring), group OR groups(array), scope(all|ordinary|
external), atomicity(all|atomic|non_atomic), representation(all|unknown|nart|
naut|conflicting), externalMethodsOnly(boolean), constructor OR constructors,
type OR types. Arrays are OR, different facets AND. Defaults are empty/all.
Reification is also accepted as an alias for representation. Representation
filters other than all apply only to non-atomic terms. Groundness and class
claims never establish reification.

External Methods is a subset of External Symbols. Memberships are NOT erased
when an external symbol also has predicate/function/etc evidence. Instead the
orthogonal scope:ordinary excludes every external symbol; scope:all retains
every matching category. Legacy query_terms/6 retains its original method-only
external section. New response external/externalSymbol flags have broader
External Symbols meaning; externalMethod is the narrower callback-slot flag.

The *-TheWord bucket is an explicitly marked, case-insensitive lexical suffix
heuristic on atomic symbol identities, never an isa claim. doInvocations needs
an actual unquoted application of the reader-tested doAnnounce vocabulary
(arity >= 2), or the existing reader's do-format/list-descriptor pattern
(string argument 1, list/NIL argument 2). A do prefix, standalone symbol,
comment, or quoted form alone supplies no membership or execution confidence.
No general ontology inheritance or MT inheritance is invented.

Reply items are unique identities BEFORE paging; groups contain all memberships
with bounded evidence. overallTotal is the distinct eligible snapshot universe,
scopeTotal applies scope only, filteredTotal applies nongroup filters, total
also applies selected groups. groupCounts count distinct identities in each
matching group BEFORE the group selection. Their SUM IS NOT an overall total.
Metadata-only MTs and constructor references are admitted to their evidenced
groups, but count/ranking uses semanticAssertionCount, not MT context counts.
occurrenceAssertionCount and contextAssertionCount are explicitly separate.

category_sections accepts up to 9 UNIQUE requests {group,offset,limit}; filters
must not also select groups. Sections intentionally repeat multi-members across
groups. total is the distinct union of requested groups before paging;
displayedDistinctTotal deduplicates only the returned pages. No per-row index
fetch is necessary. Page limits 1..100; membership evidence previews 8.

Facets: groups, atomicity, representation, types, constructors. Counts are unique
terms per value and may overlap. Microtheory items include canonical mt,
mtExpression, contextAssertionCount, zeroContextContent and mtEvidenceKinds;
declared and referenced MTs stay present with ZERO content. MT membership does
not on its own upgrade the separate inferredIsa judgement.
*/

:- use_module(kb_non_atomic).
:- use_module(kb_nat_browser,[nat_item/3]).
:- use_module(kb_inventory,[declaration_target/4]).
:- use_module(kb_inventory_rules,[logical_operator/1]).
:- use_module(kb_symbols,[encoded_symbol/1,list_data_slot/3]).
:- use_module(kb_terms,[context_key/2,term_ast/3]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

group(predicates,"Predicates").
group(functions,"Functions").
group(collections,"Collections").
group(microtheories,"Microtheories").
group(the_word,"*-TheWord").
group(external_symbols,"External Symbols").
group(do_invocations,"doInvocations").
group(individuals,"Individuals").
group(unclassified,"Unclassified").

build_category_catalog(Roles,Rows,Schema,Catalog) :-
    findall(Key-Evidence,
      (member(Row,Rows),position_evidence(Row,Schema,Key,Evidence),
       get_assoc(Key,Roles.terms,_)),PositionPairs),
    grouped_assoc(PositionPairs,PositionMap),
    assoc_to_values(Roles.terms,Details),
    findall(Entry,(member(D,Details),categorized_entry(Roles,PositionMap,D,Entry)),Unsorted),
    maplist(rank_entry,Unsorted,Ranked),keysort(Ranked,Ordered),pairs_values(Ordered,Entries),
    maplist(entry_pair,Entries,EntryPairs),keysort(EntryPairs,Sorted),list_to_assoc(Sorted,ByIdentity),
    length(Entries,Total),findall(Key,group(Key,_),Order),
    group_counts(Entries,Counts),
    Coverage=Roles.natCatalog.coverage.put(term_categories,category_coverage{
      policy:every_matching_group,createsAssertions:false,createsProviders:false,
      executesInvocations:false,inheritsTypes:false,
      lexicalWordBucket:explicit_heuristic,doCoverage:documented_vocabulary_and_pattern_only,
      relationDeclarations:"Generic arity/argument declarations do not choose predicate versus function.",
      remainder:"Typed/untyped browsing remainder, not exclusive Individual isa assertions."}),
    Catalog=category_catalog{schema:'powder.term-categories.v1',generation:Roles.generation,
      entries:Entries,byIdentity:ByIdentity,total:Total,groupOrder:Order,groupCounts:Counts,
      coverage:Coverage}.
rank_entry(E,Rank-E) :- Negative is -E.semanticAssertionCount,Rank=Negative-E.identity.
entry_pair(E,Key-E) :- Key=E.identity.
grouped_assoc(Pairs,Map) :-
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),list_to_assoc(Groups,Map).
associated(Map,Key,Values) :- (get_assoc(Key,Map,Values)->true;Values=[]).

position_evidence(loaded(Id,Semantic,Context,E),Schema,Key,Proof) :-
    semantic_position(Semantic,Schema,Term,Pos),Pos.kind\==data,
    position_group(Term,Pos,Schema,Key,Group,Basis,Details),
    source_evidence(Id,Context,E,Pos,Group,Basis,false,Details,Proof).
position_evidence(loaded(Id,_,Context,E),Schema,Key,Proof) :-
    context_position(Context,Schema,Term,Pos),Pos.kind\==data,
    (denoting_position(Term,Pos,Schema,_),application_head(Term,Head,_),entity_key(Head,Key),
       Group=functions,Basis=constructor_position,Details=details{metadataContext:true}
    ;function_reference(Term,Symbol,Kind),entity_key(Symbol,Key),
       Group=external_symbols,Basis=external_reference,
       Details=details{referenceKind:Kind,metadataContext:true}),
    source_evidence(Id,Context,E,Pos,Group,Basis,false,Details,Proof).
position_group(Term,Pos,Schema,Key,predicates,predicate_position,details{arity:Arity}) :-
    Pos.kind==formula,\+denoting_position(Term,Pos,Schema,_),
    application_head(Term,Head,Args),predicate_head(Head),entity_key(Head,Key),
    length(Args,Arity).
position_group(Term,Pos,Schema,Key,functions,constructor_position,details{}) :-
    denoting_position(Term,Pos,Schema,_),application_head(Term,Head,_),entity_key(Head,Key).
position_group(Term,Pos,_,Key,collections,collection_position,details{predicate:Name,argument:N}) :-
    Pos.kind==formula,compound(Term),Term=..[Name|Args],
    collection_slot(Name,Args,N,Value),entity_key(Value,Key).
position_group(Term,Pos,_,Key,functions,function_schema_reference,details{predicate:Name}) :-
    Pos.kind==formula,function_schema(Term,Target,Name),entity_key(Target,Key).
position_group(Term,_,_,Key,external_symbols,external_reference,details{referenceKind:Kind}) :-
    function_reference(Term,Symbol,Kind),entity_key(Symbol,Key).
position_group(Term,Pos,_,Key,do_invocations,documented_invocation_shape,
               details{predicate:Name,arity:Arity,pattern:Pattern,execution:unknown,analysisExecuted:false}) :-
    Pos.kind==formula,compound(Term),Term=..[Name|Args],
    do_invocation(Name,Args,Pattern),length(Args,Arity),entity_key(Name,Key).
application_head(Term,Head,Args) :-
    nonvar(Term),
    (atom(Term)->Head=Term,Args=[]
    ;compound(Term),\+is_list(Term),\+is_dict(Term),Term=..[Name|Values],
     (Name==t->Values=[Head|Args];Head=Name,Args=Values)).
predicate_head(Head) :-
    (atom(Head)->encoded_symbol(Head),\+logical_operator(Head),
      \+memberchk(Head,[x_quote,'x_metta=',metta_value,metta_exec,metta_expression])
    ;compound(Head)).
entity_key(Term,Key) :-
    ground(Term),
    (atom(Term),encoded_symbol(Term),\+downcase_atom(Term,nil)->Key=Term
    ;compound(Term),catch(non_atomic_key(Term,Key),error(_,_),fail)).

collection_slot(x_isa,[_,Type],2,Type).
collection_slot(x_genls,[A,B],N,T) :- (N=1,T=A;N=2,T=B).
collection_slot(Name,Args,N,Type) :-
    declaration_shape(Name,Args,Declaration),
    (memberchk(Declaration,[resultIsa,resultGenl,range,rangeSubclass]),Args=[_,Type]->N=2
    ;memberchk(Declaration,[argIsa,argGenl,argAndRestIsa,argAndRestGenl,domain,domainSubclass]),
       Args=[_,_,Type]->N=3
    ;indexed_type_declaration(Declaration),Args=[_,Type],N=2).
declaration_shape(Name,[_|Rest],Declaration) :-
    Probe=..[Name,x_category_subject|Rest],
    declaration_target(Probe,x_category_subject,_,Declaration).
indexed_type_declaration(Name) :-
    atom_concat(arg,Tail,Name),
    (atom_concat(Digits,'Isa',Tail);atom_concat(Digits,'Genl',Tail)),
    atom_codes(Digits,Codes),Codes\=[],maplist(decimal_digit,Codes).
decimal_digit(C) :- between(0'0,0'9,C).
function_schema(Term,Target,Name) :-
    compound(Term),Term=..[Name,Target,Type],
    declaration_shape(Name,[Target,Type],Declaration),
    memberchk(Declaration,[resultIsa,resultGenl,range,rangeSubclass]).
do_invocation(x_doAnnounce,[_,_|_],reader_documented_doAnnounce).
do_invocation(Name,[Text,Values|Rest],reader_format_descriptor_pattern) :-
    Name\==x_doAnnounce,atom(Name),atom_concat(x_do,_,Name),string(Text),
    (is_list(Values);Values=='NIL';Values==nil),
    list_data_slot(Name,[Text,Values|Rest],2).
source_evidence(Id,Context,E,Pos,Group,Basis,Heuristic,Details,Proof) :-
    context_key(Context,Mt),
    Proof=category_evidence{group:Group,basis:Basis,heuristic:Heuristic,
      assertionId:Id,source:E.source,originalSource:E.originalSource,line:E.line,
      mt:Mt,path:Pos.path,positionRole:Pos.role,polarity:Pos.polarity,details:Details}.

categorized_entry(Roles,Positions,D,Entry) :-
    associated(Positions,D.identity,PositionEvidence),
    term_types(Roles,D,Types,Representation,Constructor),
    findall(E,(member(T,Types),type_group(T,Group,Basis),
               E=T.put(category_evidence{group:Group,basis:Basis,heuristic:false})),TypeEvidence),
    findall(E,(member(P,D.evidence),role_group(P.role,Group,Basis),
               E=P.put(category_evidence{group:Group,basis:Basis,heuristic:false})),RoleEvidence),
    lexical_evidence(D,Lexical),
    append([PositionEvidence,TypeEvidence,RoleEvidence,Lexical],All),sort(All,Known),
    (Known\==[]->Evidence=Known
    ;D.listed==true->remainder_evidence(D,Types,Evidence)
    ;fail),
    memberships(Evidence,Memberships),findall(K,(member(M,Memberships),K=M.group),Groups),
    (memberchk(external_symbols,Groups)->External=true;External=false),
    (memberchk(external_method,D.roles)->Method=true;Method=false),
    (D.kind==non_atomic->Atomicity=non_atomic;Atomicity=atomic),
    length(D.semanticAssertionIds,SemanticCount),length(D.contextAssertionIds,ContextCount),
    type_keys(Types,TypeKeys),
    mt_descriptor(D,Groups,Evidence,ContextCount,Mt,MtAST,MtKinds),
    (ContextCount=:=0->ZeroContent=true;ZeroContent=false),
    Entry=category_entry{identity:D.identity,term:D.identity,kind:D.kind,atomicity:Atomicity,
      symbol:D.symbol,label:D.label,searchKey:D.searchKey,expression:D.expression,
      roles:D.roles,groups:Groups,memberships:Memberships,
      external:External,externalSymbol:External,externalMethod:Method,
      count:SemanticCount,semanticAssertionCount:SemanticCount,
      occurrenceAssertionCount:D.count,contextAssertionCount:ContextCount,
      zeroContextContent:ZeroContent,mt:Mt,mtExpression:MtAST,mtEvidenceKinds:MtKinds,
      representation:Representation,constructor:Constructor,typeKeys:TypeKeys,
      originalTypeEvidence:Types}.
term_types(Roles,D,Types,Representation,Constructor) :-
    (get_assoc(D.identity,Roles.natCatalog.byIdentity,Nat)->
       Types=Nat.typeEvidence,Representation=Nat.representation,Constructor=Nat.constructor
    ;associated(Roles.natCatalog.typeClaims,term(D.identity),Types),
     Representation=representation{status:unknown,kinds:[]},Constructor=null).
type_group(T,Group,explicit_type) :-
    memberchk(T.predicate,[x_isa,x_resultIsa]),class_group(T.type,Group).
type_group(T,collections,collection_valued_result) :- T.predicate==x_resultGenl.
class_group(Type,predicates) :-
    memberchk(Type,[x_Predicate,x_UnaryPredicate,x_BinaryPredicate,x_TernaryPredicate,
      x_QuaternaryPredicate,x_QuintaryPredicate,x_TransitiveBinaryPredicate,
      x_SymmetricBinaryPredicate,x_AsymmetricBinaryPredicate,
      x_ReflexiveBinaryPredicate,x_IrreflexiveBinaryPredicate]).
class_group(Type,functions) :- function_type(Type).
class_group(Type,collections) :-
    memberchk(Type,[x_Collection,x_FirstOrderCollection,x_SecondOrderCollection,x_ThirdOrderCollection]).
class_group(x_Microtheory,microtheories).
class_group(Type,external_symbols) :- memberchk(Type,[x_ExternalSymbol,x_SubLSymbol]).
role_group(microtheory_context,microtheories,loaded_context).
role_group(microtheory_reference,microtheories,context_reference).
role_group(external_method,external_symbols,callback_method_reference).
lexical_evidence(D,[E]) :-
    D.kind==symbol,downcase_atom(D.identity,Lower),atom_concat(_,'-theword',Lower),!,
    D.evidence=[First|_],
    E=First.put(category_evidence{group:the_word,basis:lexical_suffix,heuristic:true,
      pattern:"*-TheWord",caseSensitive:false}).
lexical_evidence(_,[]).
remainder_evidence(D,Types,[E]) :-
    (member(T,Types),memberchk(T.predicate,[x_isa,x_resultIsa])->Group=individuals,
       E=T.put(category_evidence{group:Group,basis:typed_instance_remainder,heuristic:false})
    ;D.evidence=[First|_],
     E=First.put(category_evidence{group:unclassified,basis:unclassified_remainder,heuristic:false})).
memberships(Evidence,Memberships) :-
    findall(M,(group(Key,Label),include(evidence_group(Key),Evidence,Es),Es\=[],
      length(Es,Count),take(8,Es,Preview),
      findall(B,(member(E,Es),B=E.basis),Bs),sort(Bs,Bases),
      (member(E,Es),E.heuristic==true->Heuristic=true;Heuristic=false),
      M=membership{group:Key,label:Label,bases:Bases,heuristic:Heuristic,
                   evidence:Preview,evidenceCount:Count}),Memberships).
evidence_group(Group,E) :- E.group==Group.
type_keys(Types,Keys) :- findall(K,(member(T,Types),K=T.type),All),sort(All,Keys).
mt_descriptor(D,Groups,Evidence,_,Mt,AST,Kinds) :-
    memberchk(microtheories,Groups),!,
    (D.kind==non_atomic->
      non_atomic_from_key(D.identity,Term),
      (catch(non_atomic_context_key(Term,Key),error(_,_),fail)->Mt=Key;Mt=null),
      AST=D.expression
    ;Mt=D.identity,term_ast(D.identity,[],Raw),ground_json(Raw,AST)),
    findall(K,(member(E,Evidence),E.group==microtheories,mt_basis(E.basis,K)),Ks),sort(Ks,Kinds).
mt_descriptor(_,_,_,_,null,null,[]).
mt_basis(loaded_context,loaded_context).
mt_basis(context_reference,context_reference).
mt_basis(explicit_type,declared_type).

category_item(Catalog,Identity,Item) :-
    (get_assoc(Identity,Catalog.byIdentity,E)->public_entry(E,Item)
    ;existence_error(categorized_term,Identity)).
public_entry(E,Item) :-
    del_dict(originalTypeEvidence,E,_,Base),length(E.typeKeys,N),take(32,E.typeKeys,Keys),
    Item=Base.put(category_item{typeKeys:Keys,typeCount:N}).

category_page(Catalog,Input,Offset,Limit,Reply) :-
    filters(Input,F),pagination(Offset,Limit),
    filtered(Catalog,F,Scoped,Base),include(selected_groups(F.groups),Base,Matches),
    length(Matches,Total),page(Matches,Offset,Limit,Selected),maplist(public_entry,Selected,Items),
    reply_base(Catalog,F,Scoped,Base,Header),
    Reply=Header.put(category_page{items:Items,total:Total,offset:Offset,limit:Limit}).
category_section_pages(Catalog,Input,Requests,Reply) :-
    filters(Input,F),(F.groups==[]->true;domain_error(section_group_selection,F.groups)),
    must_be(list,Requests),length(Requests,N),(N=<9->true;domain_error(category_section_count,N)),
    maplist(section_request,Requests,Specs),
    findall(G,member(request(G,_,_),Specs),Groups),sort(Groups,Unique),
    (same_length(Groups,Unique)->true;domain_error(duplicate_category_section,Groups)),
    filtered(Catalog,F,Scoped,Base),
    maplist(section_page(Base),Specs,Sections),
    (Groups==[]->Matches=[];include(selected_groups(Groups),Base,Matches)),
    length(Matches,Total),
    findall(Id,(member(S,Sections),member(I,S.items),Id=I.identity),Shown0),
    sort(Shown0,Shown),length(Shown,Displayed),
    reply_base(Catalog,F,Scoped,Base,Header),
    Reply=Header.put(category_sections{sections:Sections,total:Total,displayedDistinctTotal:Displayed}).
category_facet_page(Catalog,Input,Facet0,Offset,Limit,Reply) :-
    filters(Input,F),text_atom(Facet0,Facet),pagination(Offset,Limit),
    (memberchk(Facet,[groups,atomicity,representation,types,constructors])->true;
      domain_error(category_facet,Facet)),
    filtered(Catalog,F,Scoped,Base),include(selected_groups(F.groups),Base,Matches),
    length(Matches,UniqueTerms),facet_values(Facet,Matches,Values),
    length(Values,Total),page(Values,Offset,Limit,Items),
    reply_base(Catalog,F,Scoped,Base,Header),
    Reply=Header.put(category_facets{facet:Facet,items:Items,total:Total,
      uniqueTerms:UniqueTerms,offset:Offset,limit:Limit}).
reply_base(Catalog,F,Scoped,Base,Reply) :-
    length(Scoped,ScopeCount),length(Base,Filtered),group_counts(Base,Counts),
    Reply=category_results{schema:Catalog.schema,generation:Catalog.generation,
      overallTotal:Catalog.total,scopeTotal:ScopeCount,filteredTotal:Filtered,
      groupOrder:Catalog.groupOrder,groupCounts:Counts,filters:F,
      membershipPolicy:every_matching_group,groupCountsOverlap:true,
      coverage:Catalog.coverage}.
filtered(Catalog,F,Scoped,Base) :-
    include(in_scope(F.scope),Catalog.entries,Scoped),include(entry_match(F),Scoped,Base).
in_scope(all,_).
in_scope(ordinary,E) :- E.externalSymbol==false.
in_scope(external,E) :- E.externalSymbol==true.
entry_match(F,E) :-
    text_match(F,E),
    (F.atomicity==all;F.atomicity==E.atomicity),
    (F.externalMethodsOnly==false;E.externalMethod==true),
    representation_match(F.representation,E),
    constructor_match(F.constructors,E),
    any_key(F.types,E.typeKeys).
selected_groups([],_) :- !.
selected_groups(Keys,E) :- any_key(Keys,E.groups).
any_key([],_) :- !.
any_key(Keys,Values) :- member(V,Values),memberchk(V,Keys),!.
representation_match(all,_) :- !.
representation_match(Kind,E) :-
    E.atomicity==non_atomic,
    (Kind==unknown->E.representation.status==unknown
    ;Kind==conflicting->E.representation.status==conflicting
    ;memberchk(Kind,E.representation.kinds)).
constructor_match([],_) :- !.
constructor_match(Keys,E) :-
    get_dict(constructor,E,C),is_dict(C),get_dict(key,C,Key),memberchk(Key,Keys).
text_match(F,E) :-
    (F.q==""->true
    ;F.match==exact->(atom_string(E.identity,F.q);E.searchKey==F.searchKey)
    ;sub_string(E.searchKey,_,_,_,F.searchKey);atom_string(E.identity,S),
     string_lower(S,Lower),sub_string(Lower,_,_,_,F.searchKey)),!.
group_counts(Entries,Counts) :-
    findall(Count,(group(Key,Label),include(in_group(Key),Entries,Members),length(Members,N),
      Count=category_count{key:Key,label:Label,total:N}),Counts).
in_group(Group,E) :- memberchk(Group,E.groups).
section_request(Input,request(Group,Offset,Limit)) :-
    must_be(dict,Input),dict_pairs(Input,_,Pairs),
    forall(member(K-_,Pairs),(memberchk(K,[group,offset,limit])->true;domain_error(category_section_field,K))),
    group_key(Input.group,Group),dict_default(Input,offset,0,Offset),
    dict_default(Input,limit,20,Limit),pagination(Offset,Limit).
section_page(Base,request(Group,Offset,Limit),Section) :-
    include(in_group(Group),Base,Members),length(Members,Total),
    page(Members,Offset,Limit,Selected),maplist(public_entry,Selected,Items),group(Group,Label),
    Section=category_section{group:Group,label:Label,items:Items,total:Total,offset:Offset,limit:Limit}.

facet_values(groups,Entries,Values) :- !,
    group_counts(Entries,Counts),maplist(group_facet,Counts,Values).
facet_values(Facet,Entries,Values) :-
    findall(Key-Hit,
      (member(E,Entries),facet_descriptor(Facet,E,Key,D),Hit=hit(E.identity,D)),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),maplist(facet_count,Groups,Values).
group_facet(C,Result) :- Result=facet{key:C.key,label:C.label,count:C.total}.
facet_descriptor(atomicity,E,E.atomicity,facet{key:E.atomicity,label:E.atomicity}).
facet_descriptor(representation,E,Key,facet{key:Key,label:Key}) :-
    E.atomicity==non_atomic,
    (E.representation.status==unknown->Key=unknown
    ;member(Key,E.representation.kinds);E.representation.status==conflicting,Key=conflicting).
facet_descriptor(types,E,Key,D) :-
    member(Key,E.typeKeys),type_description(Key,E.originalTypeEvidence,D).
facet_descriptor(constructors,E,Key,D) :-
    get_dict(constructor,E,D),is_dict(D),get_dict(key,D,Key),Key\==null.
type_description(Key,Types,D) :- member(T,Types),T.type==Key,!,D=T.description.
facet_count(_-Hits,Result) :-
    Hits=[hit(_,D)|_],findall(Id,member(hit(Id,_),Hits),Ids0),sort(Ids0,Ids),
    length(Ids,N),Result=D.put(count,N).

filters(Input,F) :-
    must_be(dict,Input),dict_pairs(Input,_,Pairs),
    forall(member(K-_,Pairs),(memberchk(K,[q,match,group,groups,scope,atomicity,
      representation,reification,externalMethodsOnly,constructor,constructors,type,types])->true;
      domain_error(category_filter,K))),
    dict_default(Input,q,"",Q0),text_string(Q0,Q),string_length(Q,Length),
    (Length=<4096->true;domain_error(category_search_length,Length)),string_lower(Q,Search),
    enum(Input,match,substring,[exact,substring],Match),
    enum(Input,scope,all,[all,ordinary,external],Scope),
    enum(Input,atomicity,all,[all,atomic,non_atomic],Atomicity),
    (get_dict(reification,Input,R0)->
       (get_dict(representation,Input,_)->domain_error(duplicate_representation_filter,Input);true),
       RInput=Input.put(representation,R0)
    ;RInput=Input),
    enum(RInput,representation,all,[all,unknown,nart,naut,conflicting],Representation),
    dict_default(Input,externalMethodsOnly,false,Methods0),bool(Methods0,Methods),
    key_filter(Input,group,groups,GroupInputs),maplist(group_key,GroupInputs,Groups0),sort(Groups0,Groups),
    key_filter(Input,constructor,constructors,Constructors),key_filter(Input,type,types,Types),
    F=category_filters{q:Q,searchKey:Search,match:Match,scope:Scope,groups:Groups,
      atomicity:Atomicity,representation:Representation,externalMethodsOnly:Methods,
      constructors:Constructors,types:Types}.
key_filter(Input,Single,Plural,Keys) :-
    (get_dict(Single,Input,One)->
       (get_dict(Plural,Input,_)->domain_error(duplicate_category_filter,Single);true),
       ((One==null;One=='';One=="")->Raw=[];Raw=[One])
    ;get_dict(Plural,Input,List)->must_be(list,List),Raw=List
    ;Raw=[]),
    length(Raw,N),(N=<32->true;domain_error(category_filter_key_count,N)),
    maplist(key_atom,Raw,Atoms),sort(Atoms,Keys).
key_atom(Input,Atom) :-
    text_atom(Input,Atom),atom_length(Atom,N),
    (N>0,N=<262144->true;domain_error(category_key,Input)).
group_key(Input,Group) :-
    text_atom(Input,Atom),
    (Atom==doInvocations->Group=do_invocations;Group=Atom),
    (group(Group,_)->true;domain_error(term_category_group,Input)).
enum(Input,Key,Default,Allowed,Value) :-
    dict_default(Input,Key,Default,Raw),text_atom(Raw,Value),
    (memberchk(Value,Allowed)->true;domain_error(Key,Raw)).
bool(true,true) :- !.
bool(false,false) :- !.
bool("true",true) :- !.
bool("false",false) :- !.
bool(Value,_) :- domain_error(boolean,Value).
pagination(Offset,Limit) :-
    must_be(nonneg,Offset),must_be(integer,Limit),
    (between(1,100,Limit)->true;domain_error(category_page_limit,Limit)).
page(Values,Offset,Limit,Page) :- drop(Offset,Values,Rest),take(Limit,Rest,Page).
drop(0,Values,Values) :- !.
drop(_,[],[]) :- !.
drop(N,[_|Rest],Tail) :- Next is N-1,drop(Next,Rest,Tail).
take(0,_,[]) :- !.
take(_,[],[]) :- !.
take(N,[H|T],[H|Rest]) :- Next is N-1,take(Next,T,Rest).
dict_default(D,K,Default,V) :- (get_dict(K,D,V)->true;V=Default).
text_atom(V,A) :- (atom(V)->A=V;string(V)->atom_string(A,V);type_error(text,V)).
text_string(V,S) :- (string(V)->S=V;atom(V)->atom_string(V,S);type_error(text,V)).
ground_json(Value,Ground) :-
    (is_dict(Value)->dict_pairs(Value,_,Pairs),maplist(ground_pair,Pairs,New),dict_pairs(Ground,json,New)
    ;is_list(Value)->maplist(ground_json,Value,Ground)
    ;atomic(Value)->Ground=Value
    ;type_error(ground_json,Value)).
ground_pair(K-V,K-G) :- ground_json(V,G).
