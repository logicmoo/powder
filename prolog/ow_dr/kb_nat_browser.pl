:- module(kb_nat_browser,
          [build_nat_catalog/3,nat_page/5,nat_facet_page/6,browse_page/5,nat_item/3,
           term_type_assessment/4]).

/** <module> Categorized, bounded browsing of evidenced ground denoting terms

Pure helpers for kb_term_roles' single generation-scoped index. No source
reads, execution, extra live snapshot, global ontology typing or inheritance.

Public HTTP adapters are kb_term_roles:browse_nats/4, browse_term_groups/4
and nat_facets/5. Filters are a dict:
  q:"", match:substring|exact,
  constructors:[], types:[], categories:[],
  representation:all|unknown|nart|naut|conflicting,
  section:all|terms|non_atomic|external.
Singular constructor/type/category accepts one key instead of the respective
plural array. OR within a facet, AND across facets. Keys are canonical opaque
identities; compound constructors retain their entire application identity.
The types filter matches direct isa, declared resultIsa OR resultGenl targets.
It does NOT imply that resultGenl is an instance type. No category wins over
another. Unknown category applies only when there is no type/context evidence.

nat_page/5 returns schema,generation,items,total,overallTotal,offset,limit,
filters,facets,coverage. nat_facet_page/6 pages constructors/types/categories/
representations with counts of DISTINCT matching NAT identities per value.
Facet values may overlap: summing their counts is not a unique term count.
Limit is 1..100; facet previews are 20 rows, per-term category/type previews
32, evidence previews 8. Full type/category membership remains filterable and
accessible through paginated facets with an exact identity q filter.

browse_page/5 returns disjoint section ordering:
  terms -> non_atomic (NART / NAUT) -> external.
Its sectionOrder, sectionTotals, sectionTotal, overallTotal, matchingOverallTotal
and total remain separate; partition/filter precedes paging. Constructor/type/
category/representation filters exclude atomic sections rather than guessing
their NAT properties. Within a section: source count descending, identity.

Categories come ONLY from positive whole-term isa facts, positive constructor
resultIsa/resultGenl declarations (including positive conjunctions), and
observed compound MT roles. Evidence retains its actual assertion MT. A
constructor declaration is displayed as such, not converted into a new isa
assertion or silently inherited into another MT. Negative/quoted/conditional
typing, constructor-name suffixes, and argument symbols do not supply types.

NART versus NAUT is a SEPARATE representation facet. Neither a ground term, an
isa type, a constructor, nor a cache assertion ID establishes reification.
Current ordinary exports therefore remain unknown. A narrowly versioned,
optional exported metadata contract is recognized:
  xc_term_representation(AssertionId,
    term_representation{schema:'powder.term-representation.v1',
                        identity:CanonicalNatKey,representation:nart}).
representation may instead be naut. This metadata must target an already
evidenced NAT identity. Text, unversioned/reified flags, or assertion-wide
guesses are never interpreted. Malformed/orphan records are reported; conflicting
typed exports retain both values and status=conflicting, never pick a winner.
This module READS such records; it does not manufacture or persist them.
*/

:- use_module(kb_non_atomic).
:- use_module(kb_symbols,[encoded_symbol/1]).
:- use_module(kb_terms,[term_ast/3,context_key/2]).
:- use_module(kb_inventory_rules,[logical_operator/1]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

build_nat_catalog(Roles,Rows,Catalog) :-
    include(is_nat,Roles.entries,Nats),
    findall(Target-Claim,
      (member(Row,Rows),type_claim(Row,Target,Claim)),Claims),
    grouped_assoc(Claims,ClaimMap),
    representation_exports(Roles,Exports,Issues),
    grouped_assoc(Exports,ExportMap),
    maplist(catalog_entry(Roles,ClaimMap,ExportMap),Nats,Entries),
    maplist(entry_pair,Entries,Pairs),keysort(Pairs,SortedPairs),list_to_assoc(SortedPairs,ByIdentity),
    all_facets(Entries,Facets),
    length(Entries,Count),length(Issues,IssueCount),take(8,Issues,IssuePreview),
    (IssueCount=:=0->ExportStatus=complete;ExportStatus=partial),
    Coverage=Roles.coverage.put(nat_categories,nat_categories{
      categoryPolicy:positive_explicit_evidence,representationPolicy:typed_export_only,
      groundOnly:true,infersIsa:false,infersMtInheritance:false,
      representationIssues:IssuePreview,representationIssueCount:IssueCount,
      representationExportStatus:ExportStatus}),
    Catalog=nat_catalog{schema:'powder.nat-browse.v1',generation:Roles.generation,
      entries:Entries,byIdentity:ByIdentity,typeClaims:ClaimMap,total:Count,
      facets:Facets,coverage:Coverage}.
is_nat(E) :- E.kind==non_atomic.
entry_pair(E,Key-E) :- Key=E.summary.identity.
grouped_assoc(Pairs,Assoc) :-
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),list_to_assoc(Groups,Assoc).
associated(Map,Key,Values) :- (get_assoc(Key,Map,Values)->true;Values=[]).

type_claim(loaded(Id,Semantic,Mt,E),Target,Claim) :-
    positive_fact(Semantic,Fact,Path),Fact=..[Predicate,Subject,Type],
    memberchk(Predicate,[x_isa,x_resultIsa,x_resultGenl]),
    ground(Subject),ground(Type),type_identity(Type,TypeKey),
    (Predicate==x_isa->constructor_identity(Subject,SubjectKey),Target=term(SubjectKey),Scope=whole_term
    ;constructor_identity(Subject,SubjectKey),Target=constructor(SubjectKey),Scope=constructor_declaration),
    type_descriptor(Type,TypeKey,Description),
    context_key(Mt,MtKey),
    Claim=type_evidence{assertionId:Id,source:E.source,originalSource:E.originalSource,
      line:E.line,mt:MtKey,path:Path,predicate:Predicate,scope:Scope,
      type:TypeKey,description:Description}.
type_identity(Type,Key) :-
    (atom(Type),encoded_symbol(Type),\+downcase_atom(Type,nil)->Key=Type
    ;ground_nat_key(Type,Key),functor(Type,F,_),\+logical_operator(F),F\==x_quote).
constructor_identity(Term,Key) :-
    (atom(Term),encoded_symbol(Term)->Key=Term;ground_nat_key(Term,Key)).
ground_nat_key(Term,Key) :-
    ground(Term),compound(Term),catch(non_atomic_key(Term,Key),error(_,_),fail).
type_descriptor(Type,Key,Description) :-
    term_ast(Type,[],Raw),ground_json(Raw,AST),ast_label(AST,Label),
    Description=type_description{key:Key,identity:Key,label:Label,expression:AST}.

catalog_entry(Roles,Claims,Exports,Summary,Entry) :-
    non_atomic_from_key(Summary.identity,Term),
    (Term=..[t,Head|_]->true;functor(Term,Head,_)),
    (constructor_identity(Head,CKey)->true;CKey=null),
    ast_label(Summary.expression.head,CLabel),
    (atom(Head)->CKind=symbol;compound(Head)->CKind=non_atomic;CKind=literal),
    (get_assoc(CKey,Roles.terms,_)->Available=true;Available=false),
    Constructor=constructor{key:CKey,identity:CKey,label:CLabel,kind:CKind,
      expression:Summary.expression.head,available:Available},
    associated(Claims,term(Summary.identity),Direct),
    associated(Claims,constructor(CKey),Declared),append(Direct,Declared,All),
    sort(All,TypeEvidence),
    type_constraints(Roles,TypeEvidence,Types),
    categories(Summary,Types,Categories),
    associated(Exports,Summary.identity,ExportEvidence0),sort(ExportEvidence0,ExportEvidence),
    representation(ExportEvidence,Representation),
    get_assoc(Summary.identity,Roles.terms,Detail),
    include(context_evidence,Detail.evidence,ContextEvidence),
    Entry=nat_entry{summary:Summary,constructor:Constructor,types:Types,
      categories:Categories,typeEvidence:TypeEvidence,contextEvidence:ContextEvidence,
      representation:Representation,representationEvidence:ExportEvidence}.
context_evidence(E) :- memberchk(E.role,[microtheory_context,microtheory_reference]).

type_constraints(Roles,Evidence,Types) :-
    findall(Key-E,(member(E,Evidence),Key=E.type),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
    maplist(type_constraint(Roles),Groups,Types).
type_constraint(Roles,Key-Evidence,Type) :-
    Evidence=[First|_],
    findall(P,(member(E,Evidence),P=E.predicate),Ps),sort(Ps,Predicates),
    (get_assoc(Key,Roles.terms,_)->Available=true;Available=false),
    length(Evidence,Count),take(8,Evidence,Preview),
    Type=First.description.put(type_constraint{
      predicates:Predicates,evidence:Preview,evidenceCount:Count,available:Available}).
categories(Summary,Types,Categories) :-
    findall(Category,
      (member(Type,Types),type_category(Type,Category)),Typed),
    (Summary.contextKeys==[]->Context=[];Context=[
      category{key:compound_microtheory,kind:context,label:"Compound microtheories",
               type:null,predicates:[],available:false}]),
    append(Typed,Context,Combined),sort(Combined,Known),
    (Known==[]->Categories=[category{key:unknown,kind:unknown,label:"Unknown category",
                                     type:null,predicates:[],available:false}]
    ;Categories=Known).
type_category(Type,Category) :-
    include(instance_predicate,Type.predicates,Predicates),Predicates\=[],
    atom_concat('type:',Type.key,Key),
    Category=category{key:Key,kind:type_evidence,label:Type.label,type:Type.key,
                      predicates:Predicates,available:Type.available}.
type_category(Type,Category) :-
    memberchk(x_resultGenl,Type.predicates),
    atom_concat('resultGenl:',Type.key,Key),
    string_concat("Result collections under ",Type.label,Label),
    Category=category{key:Key,kind:result_generalization,label:Label,type:Type.key,
                      predicates:[x_resultGenl],available:Type.available}.
instance_predicate(x_isa).
instance_predicate(x_resultIsa).

representation_exports(Roles,Exports,Issues) :-
    assoc_to_values(Roles.assertions,Assertions),
    findall(Result,(member(A,Assertions),nth0(N,A.properties,P),
      is_dict(P),get_dict(name,P,Name),text_equal(Name,term_representation),
      property_ordinal(A,N,Ordinal),
      exported_representation(Roles,A,Ordinal,P,Result)),Results),
    findall(Key-E,member(export(Key,E),Results),Exports),
    findall(I,member(issue(I),Results),Issues).
property_ordinal(A,N,Ordinal) :-
    (get_dict(propertyProjection,A,Projection),
     get_dict(sourcePropertyPositions,Projection,Positions),nth0(N,Positions,Original)->
       Ordinal=Original
    ;Ordinal=N).
exported_representation(Roles,A,Position,P,Result) :-
    (get_dict(value,P,V),is_dict(V),
     get_dict(schema,V,Schema),text_equal(Schema,'powder.term-representation.v1'),
     get_dict(identity,V,Input),text_atom_if(Input,Key),
     atom_concat('nat:',_,Key),
     catch(non_atomic_from_key(Key,_),error(_,_),fail),
     get_dict(representation,V,Kind0),text_atom_if(Kind0,Kind),memberchk(Kind,[nart,naut])->
       (get_assoc(Key,Roles.terms,T),T.kind==non_atomic->
         E=representation_evidence{assertionId:A.id,source:A.source,
           originalSource:A.originalSource,line:A.line,mt:A.mt,propertyPosition:Position,
           property:term_representation,representation:Kind,identity:Key,
           schema:'powder.term-representation.v1'},
         Result=export(Key,E)
       ;Result=issue(issue{assertionId:A.id,propertyPosition:Position,
                            code:unobserved_representation_target}))
    ;Result=issue(issue{assertionId:A.id,propertyPosition:Position,
                       code:invalid_term_representation_export})).
text_equal(Value,Atom) :- text_atom_if(Value,Actual),Actual==Atom.
text_atom_if(Value,Atom) :- (atom(Value)->Atom=Value;string(Value)->atom_string(Atom,Value)).
representation(Evidence,Representation) :-
    findall(K,(member(E,Evidence),K=E.representation),Ks),sort(Ks,Kinds),
    (Kinds==[]->Status=unknown;Kinds=[_]->Status=known;Status=conflicting),
    Representation=representation{status:Status,kinds:Kinds}.

nat_page(Catalog,Input,Offset,Limit,Reply) :-
    filters(Input,F),nat_section(F),pagination(Offset,Limit),
    matching_nats(Catalog.entries,F,Matches),length(Matches,Total),
    page(Matches,Offset,Limit,Selected),maplist(nat_summary,Selected,Items),
    matching_facets(Catalog,F,Matches,Facets),facet_previews(Facets,Previews),
    Reply=nat_results{schema:Catalog.schema,generation:Catalog.generation,items:Items,
      total:Total,overallTotal:Catalog.total,offset:Offset,limit:Limit,filters:F,
      facets:Previews,coverage:Catalog.coverage}.
nat_facet_page(Catalog,Input,Kind0,Offset,Limit,Reply) :-
    filters(Input,F),nat_section(F),text_atom(Kind0,Kind),pagination(Offset,Limit),
    (memberchk(Kind,[constructors,types,categories,representations])->true;
      domain_error(nat_facet,Kind)),
    matching_nats(Catalog.entries,F,Matches),length(Matches,UniqueTerms),
    matching_facets(Catalog,F,Matches,Facets),get_dict(Kind,Facets,Values),
    length(Values,Total),page(Values,Offset,Limit,Items),
    Reply=nat_facets{generation:Catalog.generation,facet:Kind,items:Items,total:Total,
      uniqueTerms:UniqueTerms,offset:Offset,limit:Limit,filters:F,coverage:Catalog.coverage}.
browse_page(Roles,Input,Offset,Limit,Reply) :-
    filters(Input,F),pagination(Offset,Limit),Catalog=Roles.natCatalog,
    include(ordinary_atom,Roles.entries,Terms),include(external_entry,Roles.entries,External),
    maplist(atomic_browse_entry(terms),Terms,TermEntries),
    maplist(nat_browse_entry,Catalog.entries,NatEntries),
    maplist(atomic_browse_entry(external),External,ExternalEntries),
    append([TermEntries,NatEntries,ExternalEntries],Ordered),
    length(Terms,T),length(NatEntries,N),length(External,E),All is T+N+E,
    Totals=section_totals{all:All,terms:T,non_atomic:N,external:E},
    matching_nats(Catalog.entries,F,MatchingNats),
    findall(Key,(member(M,MatchingNats),Key=M.summary.identity),NatKeys),
    list_keys_assoc(NatKeys,MatchMap),
    include(browse_match(F,MatchMap),Ordered,AllMatches),
    include(section_match(F.section),AllMatches,Matches),
    length(AllMatches,MatchingOverall),length(Matches,Total),
    get_dict(F.section,Totals,SectionTotal),page(Matches,Offset,Limit,Selected),
    maplist(enrich_browse_entry(Catalog),Selected,Items),
    Reply=term_browse{schema:Catalog.schema,generation:Roles.generation,items:Items,
      sectionOrder:[terms,non_atomic,external],sectionTotals:Totals,
      total:Total,overallTotal:All,sectionTotal:SectionTotal,
      matchingOverallTotal:MatchingOverall,offset:Offset,limit:Limit,filters:F,
      coverage:Catalog.coverage}.
ordinary_atom(E) :- E.kind==symbol,E.external==false.
external_entry(E) :- E.external==true.
atomic_browse_entry(Section,E,Out) :- Out=E.put(section,Section).
nat_browse_entry(E,Out) :- Out=E.summary.put(section,non_atomic).
enrich_browse_entry(Catalog,E,Out) :-
    (E.section==non_atomic->nat_item(Catalog,E.identity,Out);Out=E).
nat_item(Catalog,Identity,Summary) :-
    (get_assoc(Identity,Catalog.byIdentity,Entry)->nat_summary(Entry,Summary)
    ;existence_error(indexed_non_atomic_term,Identity)).

% View-only type evidence: representation is deliberately not a semantic isa.
term_type_assessment(Roles,Catalog,Detail,Assessment) :-
    include(actual_context_evidence,Detail.evidence,Contexts),
    (get_assoc(Detail.identity,Catalog.byIdentity,Nat)->
       TypeEvidence=Nat.typeEvidence,Representation0=Nat.representation,
       ExportEvidence=Nat.representationEvidence
    ;associated(Catalog.typeClaims,term(Detail.identity),TypeEvidence),
     Representation0=representation{status:unknown,kinds:[]},ExportEvidence=[]),
    findall(E,(member(Source,Contexts),E=Source.put(basis,actual_context)),ContextProofs),
    length(Detail.contextAssertionIds,ContentCount),
    type_judgement(Roles,TypeEvidence,ContextProofs,ContentCount,x_Microtheory,Microtheory),
    cycl_term_classes(Classes),
    maplist(type_judgement(Roles,TypeEvidence,[],ContentCount),Classes,ClassAssessments),
    include(supported_judgement,[Microtheory|ClassAssessments],SemanticIsa),
    length(ExportEvidence,ExportCount),take(8,ExportEvidence,ExportPreview),
    Representation=Representation0.put(representation{
      semanticIsa:false,materialized:false,evidence:ExportPreview,evidenceCount:ExportCount}),
    Assessment=type_assessment{microtheory:Microtheory,representation:Representation,
      semanticIsa:SemanticIsa,classAssessments:ClassAssessments,
      policy:explicit_evidence_only,unknownIsNotFalse:true}.
actual_context_evidence(E) :- E.role==microtheory_context.
type_judgement(Roles,TypeEvidence,ExtraEvidence,ContentCount,Class,Judgement) :-
    findall(E,(member(Source,TypeEvidence),Source.type==Class,
      semantic_type_basis(Source.predicate,Basis),E=Source.put(basis,Basis)),TypeProofs),
    append(ExtraEvidence,TypeProofs,All),sort(All,Evidence),length(Evidence,N),
    findall(B,(member(E,Evidence),B=E.basis),Bs),sort(Bs,Bases),take(8,Evidence,Preview),
    (N>0->Status=supported;Status=unknown),
    (get_assoc(Class,Roles.terms,_)->LinkAvailable=true;LinkAvailable=false),
    atom_concat(x_,Name,Class),atom_string(Name,Label),
    Judgement=type_judgement{status:Status,type:Class,label:Label,
      typeLinkAvailable:LinkAvailable,bases:Bases,evidence:Preview,evidenceCount:N,
      contextAssertionCount:ContentCount,materialized:false}.
semantic_type_basis(x_isa,asserted_type).
semantic_type_basis(x_resultIsa,declared_result_type).
supported_judgement(J) :- J.status==supported.
cycl_term_classes([x_CycLNonAtomicTerm,x_CycLNonAtomicReifiedTerm,
                   'x_CycLNonAtomicTerm-ClosedFunctor','x_CycLNonAtomicTerm-Assertible',
                   'x_CycLNonAtomicTerm-Askable']).
section_match(all,_).
section_match(Section,E) :- Section\==all,E.section==Section.
browse_match(F,Map,E) :-
    (E.section==non_atomic->get_assoc(E.identity,Map,_)
    ;no_nat_filters(F),text_match(F,E)).
list_keys_assoc(Keys,Map) :-
    findall(K-true,member(K,Keys),Pairs),sort(Pairs,Sorted),list_to_assoc(Sorted,Map).

nat_summary(Entry,Summary) :-
    take(32,Entry.types,Types),length(Entry.types,TypeCount),
    take(32,Entry.categories,Categories),length(Entry.categories,CategoryCount),
    take(8,Entry.typeEvidence,TypeEvidence),length(Entry.typeEvidence,TypeEvidenceCount),
    take(8,Entry.contextEvidence,ContextEvidence),length(Entry.contextEvidence,ContextCount),
    take(8,Entry.representationEvidence,RepresentationEvidence),
    length(Entry.representationEvidence,RepresentationCount),
    (TypeCount>32->TypesTruncated=true;TypesTruncated=false),
    (CategoryCount>32->CategoriesTruncated=true;CategoriesTruncated=false),
    Summary=Entry.summary.put(nat_summary{section:non_atomic,constructor:Entry.constructor,
      typeConstraints:Types,typeCount:TypeCount,typeConstraintsTruncated:TypesTruncated,
      categories:Categories,categoryCount:CategoryCount,categoriesTruncated:CategoriesTruncated,
      typeEvidence:TypeEvidence,typeEvidenceCount:TypeEvidenceCount,
      contextEvidence:ContextEvidence,contextEvidenceCount:ContextCount,
      representation:Entry.representation,representationEvidence:RepresentationEvidence,
      representationEvidenceCount:RepresentationCount}).

filters(Input,F) :-
    must_be(dict,Input),dict_pairs(Input,_,Pairs),
    forall(member(K-_,Pairs),(memberchk(K,[q,match,constructor,constructors,type,types,
      category,categories,representation,section])->true;domain_error(nat_filter,K))),
    dict_default(Input,q,"",Q0),text_string(Q0,Q),string_length(Q,Length),
    (Length=<4096->true;domain_error(nat_search_length,Length)),
    dict_default(Input,match,substring,M0),text_atom(M0,M),
    (memberchk(M,[exact,substring])->true;domain_error(nat_match,M)),
    filter_keys(Input,constructor,constructors,Constructors),
    filter_keys(Input,type,types,Types),filter_keys(Input,category,categories,Categories),
    dict_default(Input,representation,all,R0),text_atom(R0,R),
    (memberchk(R,[all,unknown,nart,naut,conflicting])->true;domain_error(nat_representation,R)),
    dict_default(Input,section,all,S0),text_atom(S0,S),
    (memberchk(S,[all,terms,non_atomic,external])->true;domain_error(nat_section,S)),
    F=filters{q:Q,match:M,constructors:Constructors,types:Types,categories:Categories,
              representation:R,section:S}.
filter_keys(Input,Single,Plural,Keys) :-
    (get_dict(Single,Input,One)->
       (get_dict(Plural,Input,_)->domain_error(duplicate_nat_filter,Single);true),
       ((One==null;One=='';One=="")->Values=[];Values=[One])
    ;get_dict(Plural,Input,List)->must_be(list,List),Values=List
    ;Values=[]),
    length(Values,N),(N=<32->true;domain_error(nat_filter_key_count,N)),
    maplist(filter_key,Values,Atoms),sort(Atoms,Keys).
filter_key(Input,Key) :-
    text_atom(Input,Key),atom_length(Key,N),
    (N>0,N=<262144->true;domain_error(nat_filter_key,Input)).
nat_section(F) :-
    (memberchk(F.section,[all,non_atomic])->true;domain_error(nat_only_section,F.section)).
matching_nats(Entries,F,Matches) :- include(nat_match(F),Entries,Matches).
nat_match(F,E) :-
    text_match(F,E.summary),
    (F.constructors==[];memberchk(E.constructor.key,F.constructors)),
    keys_match(F.types,E.types),keys_match(F.categories,E.categories),
    representation_match(F.representation,E.representation).
keys_match([],_) :- !.
keys_match(Keys,Descriptors) :- member(D,Descriptors),memberchk(D.key,Keys),!.
representation_match(all,_) :- !.
representation_match(unknown,R) :- !,R.status==unknown.
representation_match(conflicting,R) :- !,R.status==conflicting.
representation_match(Kind,R) :- memberchk(Kind,R.kinds).
text_match(F,E) :-
    (F.q==""->true
    ;string_lower(F.q,Lower),
     (F.match==exact->(atom_string(E.identity,F.q);E.searchKey==Lower)
     ;sub_string(E.searchKey,_,_,_,Lower);atom_string(E.identity,Identity),
       string_lower(Identity,Normalized),sub_string(Normalized,_,_,_,Lower))),!.
no_nat_filters(F) :-
    F.constructors==[],F.types==[],F.categories==[],F.representation==all.
matching_facets(Catalog,F,Matches,Facets) :-
    (F.q=="",no_nat_filters(F)->Facets=Catalog.facets;all_facets(Matches,Facets)).
all_facets(Entries,Facets) :-
    facet_values(constructors,Entries,Constructors),facet_values(types,Entries,Types),
    facet_values(categories,Entries,Categories),facet_values(representations,Entries,Representations),
    Facets=facets{constructors:Constructors,types:Types,categories:Categories,
                  representations:Representations}.
facet_values(Kind,Entries,Values) :-
    findall(Key-hit(Id,Descriptor),
      (member(E,Entries),facet_descriptor(Kind,E,Descriptor),Key=Descriptor.key,Id=E.summary.identity),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
    maplist(facet_value,Groups,Values).
facet_descriptor(constructors,E,D) :- E.constructor.key\==null,D=E.constructor.
facet_descriptor(types,E,D) :-
    member(Type,E.types),
    D=facet_type{key:Type.key,identity:Type.identity,label:Type.label,
                 expression:Type.expression,available:Type.available}.
facet_descriptor(categories,E,D) :- member(D,E.categories).
facet_descriptor(representations,E,D) :-
    (E.representation.status==unknown->Key=unknown
    ;member(Key,E.representation.kinds);E.representation.status==conflicting,Key=conflicting),
    representation_label(Key,Label),D=facet_representation{key:Key,label:Label}.
representation_label(unknown,"Representation unknown").
representation_label(nart,"NART (explicit typed export)").
representation_label(naut,"NAUT (explicit typed export)").
representation_label(conflicting,"Conflicting typed exports").
facet_value(_-Hits,Value) :-
    Hits=[hit(_,Descriptor)|_],
    findall(Id,member(hit(Id,_),Hits),Ids0),sort(Ids0,Ids),length(Ids,Count),
    Base=Descriptor.put(count,Count),
    (get_dict(predicates,Descriptor,_)->
      findall(P,(member(hit(_,D),Hits),member(P,D.predicates)),Ps),sort(Ps,Predicates),
      Value=Base.put(predicates,Predicates)
    ;Value=Base).
facet_previews(Facets,Previews) :-
    dict_pairs(Facets,_,Pairs),maplist(facet_preview,Pairs,PreviewPairs),
    dict_pairs(Previews,facets,PreviewPairs).
facet_preview(Kind-Values,Kind-Preview) :-
    length(Values,Total),take(20,Values,Items),
    Preview=facet_page{items:Items,total:Total,offset:0,limit:20}.
pagination(Offset,Limit) :-
    must_be(nonneg,Offset),must_be(integer,Limit),
    (between(1,100,Limit)->true;domain_error(nat_page_limit,Limit)).
page(Values,Offset,Limit,Page) :- drop(Offset,Values,Rest),take(Limit,Rest,Page).
drop(0,Values,Values) :- !.
drop(_,[],[]) :- !.
drop(N,[_|Rest],Tail) :- Next is N-1,drop(Next,Rest,Tail).
take(0,_,[]) :- !.
take(_,[],[]) :- !.
take(N,[H|T],[H|Rest]) :- Next is N-1,take(Next,T,Rest).
dict_default(D,K,Default,V) :- (get_dict(K,D,V)->true;V=Default).
text_atom(V,A) :- (text_atom_if(V,A)->true;type_error(text,V)).
text_string(V,S) :- (string(V)->S=V;atom(V)->atom_string(V,S);type_error(text,V)).
ground_json(Value,Ground) :-
    (is_dict(Value)->dict_pairs(Value,_,Pairs),maplist(ground_pair,Pairs,New),dict_pairs(Ground,json,New)
    ;is_list(Value)->maplist(ground_json,Value,Ground)
    ;atomic(Value)->Ground=Value
    ;type_error(ground_json,Value)).
ground_pair(K-V,K-G) :- ground_json(V,G).
