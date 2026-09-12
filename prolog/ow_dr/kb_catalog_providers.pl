:- module(kb_catalog_providers,[source_provider_extensions/4]).

/** <module> Pure declaration evidence for catalog-backed source packs

source_provider_extensions(+Source,+Data,+Taxonomy,-Extensions) consumes the
validated source_catalog representation. Its claims and applications MUST be
the positive unconditional projections produced by kb_catalog_index. Arbitrary
semantic hits alone are not positive assertions and never establish providers.

Only local isa subjects with a predicates/functions taxonomy membership, and
atomic subjects at proven definition_slots/3 with an EXACT semantic hit path,
contribute declarations. Neither observed term roles nor predicate use defines
a provider. Compound targets remain explicitly unresolved, not their functors.

The ground JSON DTO has schema, source, status, declared, coverage and reasons.
Declared entries have symbol, arities, roles, polarities, evidenceCount and
evidence. Each evidence retains the local assertion location/names, all matching
type proofs or the complete target-slot proof. These are declarations, never
implementations or executable-rule claims. Source is a catalog path; historical
source paths absent from this projection are explicitly unknown.

No files, clocks, caches, global registries, query modules or KB bodies are read
or changed. Missing projection fields/taxonomy and unsupported dialects yield
explicit unavailable/unknown results, not successful empty provider lists.
*/

:- use_module(kb_catalog_schema,[definition_slots/3]).
:- use_module(library(assoc)).
:- use_module(library(apply)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

source_provider_extensions(Source0,Data,Taxonomy,Extensions) :-
    source_atom(Source0,Source),must_be(dict,Data),must_be(dict,Taxonomy),
    must_be(ground,Data),must_be(ground,Taxonomy),
    findall(Key,(required_data(Key),\+get_dict(Key,Data,_)),MissingData),
    findall(Key,(required_taxonomy(Key),\+get_dict(Key,Taxonomy,_)),MissingTaxonomy),
    (MissingData\=[];MissingTaxonomy\=[]),!,
    unavailable(Source,missing_projection_fields,
      details{data:MissingData,taxonomy:MissingTaxonomy},Extensions).
source_provider_extensions(Source0,Data,Taxonomy,Extensions) :-
    source_atom(Source0,Source),get_dict(dialect,Data,Dialect),
    (memberchk(Dialect,[kif,krf,meld])->
       supported_extensions(Source,Data,Taxonomy,Extensions)
    ;unavailable(Source,unsupported_definition_dialect,details{dialect:Dialect},Extensions)).

required_data(dialect).
required_data(sentences).
required_data(claims).
required_data(applications).
required_data(terms).
required_taxonomy(types).
required_taxonomy(categories).
required_taxonomy(metaRelations).
required_taxonomy(targetSlots).
source_atom(Source,Atom) :-
    (atom(Source)->Atom=Source;string(Source)->atom_string(Atom,Source);type_error(text,Source)).

unavailable(Source,Code,Details,Extensions) :-
    Extensions=provider_extensions{
      schema:'powder.catalog-provider-extensions.v1',source:Source,status:unavailable,
      declared:null,coverage:coverage{types:unknown,schemaTargets:unknown,
        scope:explicit_catalog_taxonomy,implements:false},
      reasons:[reason{code:Code,details:Details}]}.

supported_extensions(Source,Data,Taxonomy,Extensions) :-
    maplist(data_list(Data),[sentences,claims,applications,terms]),
    forall(required_taxonomy(Key),(get_dict(Key,Taxonomy,Map),
      (is_assoc(Map)->true;type_error(assoc,Map)))),
    maplist(sentence_pair,Data.sentences,Pairs),keysort(Pairs,Sorted),
    pairs_keys(Sorted,Keys),sort(Keys,Unique),
    (same_length(Keys,Unique)->true;domain_error(duplicate_sentence_ordinals,Keys)),
    list_to_assoc(Sorted,Sentences),
    findall(Symbol-Evidence,
      type_declaration(Source,Data.claims,Taxonomy,Sentences,Symbol,Evidence),Types),
    target_requests(Data.applications,Taxonomy,Requests),
    target_hits(Data.terms,Requests,Hits),
    findall(Symbol-Evidence,
      target_declaration(Source,Requests,Hits,Sentences,Symbol,Evidence),Targets),
    findall(Reason,target_gap(Source,Requests,Hits,Sentences,Reason),TargetGaps),
    findall(Reason,application_gap(Data.applications,Taxonomy,Reason),ApplicationGaps),
    findall(Reason,type_gap(Data.claims,Taxonomy,Sentences,Reason),TypeGaps),
    append(Types,Targets,All),group_declarations(All,Declared),
    append([TypeGaps,TargetGaps,ApplicationGaps],Reasons0),sort(Reasons0,Reasons),
    (Reasons==[]->Status=complete;Status=partial),
    (TypeGaps==[]->TypeCoverage=complete;TypeCoverage=partial),
    (TargetGaps==[],ApplicationGaps==[]->TargetCoverage=complete;TargetCoverage=partial),
    Extensions=provider_extensions{
      schema:'powder.catalog-provider-extensions.v1',source:Source,status:Status,
      declared:Declared,coverage:coverage{types:TypeCoverage,schemaTargets:TargetCoverage,
        scope:explicit_catalog_taxonomy,implements:false},reasons:Reasons}.
data_list(Data,Key) :- get_dict(Key,Data,Value),must_be(list,Value).
sentence_pair(S,N-S) :-
    S=s(N,Id,Line,Mt,Names,Offset),must_be(positive_integer,N),
    must_be(atom,Id),must_be(positive_integer,Line),must_be(atom,Mt),
    must_be(list,Names),maplist(must_be(string),Names),must_be(nonneg,Offset).

type_declaration(Source,Claims,Taxonomy,Sentences,Symbol,Evidence) :-
    member(c(isa,Symbol,Type,N,Path),Claims),provider_symbol(Symbol),
    get_assoc(Type,Taxonomy.categories,Memberships),
    member(membership(Group,Root,Chain),Memberships),
    callable_group(Type,Group),
    sentence_evidence(Source,Sentences,N,Path,Local),
    (get_assoc(Symbol,Taxonomy.types,AllTypes)->true;AllTypes=[]),
    findall(Proof,member(type(Type,Proof),AllTypes),TypeProofs),
    proof_json(Chain,Hierarchy),proof_json(TypeProofs,Assertions),
    Evidence=Local.put(evidence{kind:typed_declaration,role:declaration,polarity:positive,
      arity:null,type:Type,callableRole:Group,typeRoot:Root,
      typeHierarchy:Hierarchy,typeAssertions:Assertions,implementation:unknown}).
callable_group(_,predicates).
callable_group(Type,functions) :- Type\==x_MetaFunction.
provider_symbol(Symbol) :-
    atom(Symbol),atom_concat(x_,Tail,Symbol),Tail\=='',
    \+memberchk(Symbol,[x_cid,x_cid_io,x_cid_in,x_cid_out,x_aid]).

type_gap(Claims,Taxonomy,Sentences,Reason) :-
    member(c(isa,Symbol,Type,N,Path),Claims),
    get_assoc(Type,Taxonomy.categories,Memberships),
    member(membership(Group,_,_),Memberships),
    memberchk(Group,[predicates,functions]),
    (\+provider_symbol(Symbol)->Code=non_atomic_typed_subject
    ;Type==x_MetaFunction,Group==functions->Code=conflicting_metafunction_category
    ;\+get_assoc(N,Sentences,_)->Code=missing_sentence
    ;fail),
    Reason=reason{code:Code,ordinal:N,path:Path,subject:Symbol,type:Type}.

target_requests(Applications,Taxonomy,Requests) :-
    findall((N-TargetPath)-request(N,Head,Slot,Path,Proofs),
      (member(a(N,Head,Arity,Path),Applications),
       must_be(nonneg,Arity),must_be(list,Path),
       definition_slots(Head,Taxonomy,Slots),member(Slot,Slots),
       must_be(positive_integer,Slot),Slot=<Arity,
       get_assoc(Head,Taxonomy.targetSlots,SlotEvidence),
       findall(Proof,member(slot(Slot,Proof),SlotEvidence),Proofs),
       Index is Slot-1,append(Path,[args,Index],TargetPath)),Pairs),
    group_assoc(Pairs,Requests).
target_hits(Terms,Requests,Hits) :-
    findall((N-Path)-Symbol,
      (member(t(Symbol,_,_,_,_,_,Occurrences),Terms),
       member(h(N,Path,_,semantic),Occurrences),get_assoc(N-Path,Requests,_)),Pairs),
    group_assoc(Pairs,Hits).
application_gap(Applications,Taxonomy,Reason) :-
    member(a(N,Head,Arity,Path),Applications),
    definition_slots(Head,Taxonomy,Slots),
    (Slots==[],get_assoc(Head,Taxonomy.metaRelations,[_|_])->
       Reason=reason{code:unproven_target_slot,ordinal:N,path:Path,schemaPredicate:Head}
    ;member(Slot,Slots),Slot>Arity,
       Reason=reason{code:target_slot_out_of_range,ordinal:N,path:Path,
         schemaPredicate:Head,targetPosition:Slot,arity:Arity}).
target_declaration(Source,Requests,Hits,Sentences,Symbol,Evidence) :-
    gen_assoc(Key,Requests,Wants),get_assoc(Key,Hits,Symbols),member(Symbol,Symbols),
    provider_symbol(Symbol),member(request(N,Head,Slot,Path,Proofs),Wants),
    sentence_evidence(Source,Sentences,N,Path,Local),
    Key=(_-TargetPath),proof_json(Proofs,SlotProofs),
    Evidence=Local.put(evidence{kind:ontology_schema_declaration,role:declaration,
      polarity:positive,arity:null,schemaPredicate:Head,targetPosition:Slot,
      targetPath:TargetPath,targetSlotEvidence:SlotProofs,implementation:unknown}).
target_gap(Source,Requests,Hits,Sentences,Reason) :-
    gen_assoc(Key,Requests,Wants),member(request(N,Head,Slot,Path,_),Wants),
    (get_assoc(N,Sentences,_)->
       (get_assoc(Key,Hits,Symbols),include(provider_symbol,Symbols,[_|_])->fail
       ;Code=no_atomic_semantic_target)
    ;Code=missing_sentence),
    Reason=reason{code:Code,source:Source,ordinal:N,path:Path,
                  schemaPredicate:Head,targetPosition:Slot}.
sentence_evidence(Source,Sentences,N,Path,Evidence) :-
    get_assoc(N,Sentences,s(N,Id,Line,Mt,Names,_)),
    Evidence=evidence{id:Id,line:Line,mt:Mt,ordinal:N,path:Path,
      sourceFile:Source,sourcePathKind:catalog_source,originalSourceFile:null,
      variableNames:Names}.

group_assoc(Pairs,Map) :-
    sort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),list_to_assoc(Groups,Map).
group_declarations(Pairs,Declarations) :-
    sort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),maplist(declaration,Groups,Declarations).
declaration(Symbol-Evidence,Entry) :-
    length(Evidence,Count),
    Entry=symbol{symbol:Symbol,arities:[],roles:[declaration],polarities:[positive],
      evidenceCount:Count,evidence:Evidence,implementation:unknown}.

proof_json(Value,Json) :-
    (atomic(Value)->Json=Value
    ;is_list(Value)->maplist(proof_json,Value,Json)
    ;is_dict(Value)->dict_pairs(Value,_,Pairs),maplist(proof_pair,Pairs,Out),
       dict_pairs(Json,proof,Out)
    ;Value=e(Source,Id,Line,Mt,Path)->
       Json=proof{sourceFile:Source,id:Id,line:Line,mt:Mt,path:Path}
    ;Value=..[Name|Args],maplist(proof_json,Args,Arguments),
       Json=proof{functor:Name,arguments:Arguments}).
proof_pair(Key-Value,Key-Json) :- proof_json(Value,Json).
