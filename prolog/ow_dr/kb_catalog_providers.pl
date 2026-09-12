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
evidence. Each evidence retains its local assertion location/names and one
representative justification per callable category or definition slot.
Alternative global taxonomy proofs are not multiplied into local occurrences;
proofAlternativesExhaustive is explicitly false. The authoritative catalog still
retains those global claims. These are declarations, never implementations or
executable-rule claims. Historical source paths absent from this projection are
explicitly unknown.

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
    (acyclic_term(Data),acyclic_term(Taxonomy)->true;domain_error(acyclic_provider_input,Source)),
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
    sort(Data.claims,Claims),sort(Data.applications,Applications),
    type_templates(Claims,Taxonomy,TypeTemplates),
    slot_templates(Applications,Taxonomy,SlotTemplates),
    findall(Symbol-Evidence,
      type_declaration(Source,Claims,TypeTemplates,Sentences,Symbol,Evidence),Types),
    target_requests(Applications,SlotTemplates,Requests),
    target_hits(Data.terms,Requests,Hits),
    findall(Symbol-Evidence,
      target_declaration(Source,Requests,Hits,Sentences,SlotTemplates,Symbol,Evidence),Targets),
    findall(Reason,target_gap(Source,Requests,Hits,Sentences,Reason),TargetGaps),
    findall(Reason,application_gap(Applications,Taxonomy,Reason),ApplicationGaps),
    findall(Reason,type_gap(Claims,Taxonomy,Sentences,Reason),TypeGaps),
    append(Types,Targets,All),group_declarations(All,Declared),
    append([TypeGaps,TargetGaps,ApplicationGaps],Reasons0),sort(Reasons0,Reasons),
    (Reasons==[]->Status=complete;Status=partial),
    (TypeGaps==[]->TypeCoverage=complete;TypeCoverage=partial),
    (TargetGaps==[],ApplicationGaps==[]->TargetCoverage=complete;TargetCoverage=partial),
    Extensions=provider_extensions{
      schema:'powder.catalog-provider-extensions.v1',source:Source,status:Status,
      declared:Declared,coverage:coverage{types:TypeCoverage,schemaTargets:TargetCoverage,
        scope:explicit_catalog_taxonomy,implements:false,
        proofAlternativesExhaustive:false,proofPolicy:representative_justification},
      reasons:Reasons}.
data_list(Data,Key) :- get_dict(Key,Data,Value),must_be(list,Value).
sentence_pair(S,N-S) :-
    S=s(N,Id,Line,Mt,Names,Offset),must_be(positive_integer,N),
    must_be(atom,Id),must_be(positive_integer,Line),must_be(atom,Mt),
    must_be(list,Names),maplist(must_be(string),Names),must_be(nonneg,Offset).

type_declaration(Source,Claims,Templates,Sentences,Symbol,Evidence) :-
    member(c(isa,Symbol,Type,N,Path),Claims),provider_symbol(Symbol),
    get_assoc(Type,Templates,Memberships),
    member(type_witness(Group,Root,Hierarchy),Memberships),
    sentence_evidence(Source,Sentences,N,Path,Local),
    proof_json(e(Source,Local.id,Local.line,Local.mt,Path),Assertion),
    Evidence=Local.put(evidence{kind:typed_declaration,role:declaration,polarity:positive,
      arity:null,type:Type,callableRole:Group,typeRoot:Root,
      typeHierarchy:Hierarchy,typeAssertions:[Assertion],
      proofAlternativesExhaustive:false,implementation:unknown}).

% Templates are compacted once before joining them to local assertion slots.
% Global duplicate declarations are not copied into every local declaration.
type_templates(Claims,Taxonomy,Templates) :-
    findall(Type,member(c(isa,_,Type,_,_),Claims),Raw),sort(Raw,Types),
    empty_assoc(Empty),foldl(type_template(Taxonomy),Types,Empty,Templates).
type_template(Taxonomy,Type,Before,After) :-
    (get_assoc(Type,Taxonomy.categories,Memberships)->
      empty_assoc(Empty),foldl(type_witness(Type),Memberships,Empty,Witnesses),
      assoc_to_values(Witnesses,Values),put_assoc(Type,Before,Values,After)
    ;After=Before).
type_witness(Type,membership(Group,Root,Chain),Before,After) :-
    (callable_group(Type,Group),\+get_assoc(Group,Before,_)->
      unique_path(Chain,Unique),proof_json(Unique,Hierarchy),
      put_assoc(Group,Before,type_witness(Group,Root,Hierarchy),After)
    ;After=Before).

slot_templates(Applications,Taxonomy,Templates) :-
    findall(Head,member(a(_,Head,_,_),Applications),Raw),sort(Raw,Heads),
    empty_assoc(Empty),foldl(slot_template(Taxonomy),Heads,Empty,Templates).
slot_template(Taxonomy,Head,Before,After) :-
    (get_assoc(Head,Taxonomy.targetSlots,Slots)->
      empty_assoc(Empty),foldl(slot_witness,Slots,Empty,Witnesses),
      assoc_to_list(Witnesses,Values),put_assoc(Head,Before,Values,After)
    ;After=Before).
slot_witness(slot(Slot,Proof),Before,After) :-
    (\+get_assoc(Slot,Before,_)->
      representative_proof(Proof,Representative),proof_json(Representative,Json),
      put_assoc(Slot,Before,Json,After)
    ;After=Before).
representative_proof(target_evidence(Declaration,Meta,Types,Sub),Representative) :- !,
    first_witness(Meta,MetaWitness),first_witness(Types,TypeWitness),
    unique_path(Sub,SubWitness),
    Representative=target_evidence(Declaration,MetaWitness,TypeWitness,SubWitness).
representative_proof(Proof,Proof).
first_witness([],[]).
first_witness([meta(Type,Path)|_],[meta(Type,Unique)]) :- !,unique_path(Path,Unique).
first_witness([First|_],[Unique]) :- unique_path(First,Unique).
unique_path(Path,Unique) :- (is_list(Path)->list_to_set(Path,Unique);Unique=Path).
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

target_requests(Applications,Templates,Requests) :-
    findall((N-TargetPath)-request(N,Head,Slot,Path),
      (member(a(N,Head,Arity,Path),Applications),
       must_be(nonneg,Arity),must_be(list,Path),
       get_assoc(Head,Templates,Slots),member(Slot-_,Slots),
       must_be(positive_integer,Slot),Slot=<Arity,
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
target_declaration(Source,Requests,Hits,Sentences,Templates,Symbol,Evidence) :-
    gen_assoc(Key,Requests,Wants),get_assoc(Key,Hits,Symbols),member(Symbol,Symbols),
    provider_symbol(Symbol),member(request(N,Head,Slot,Path),Wants),
    sentence_evidence(Source,Sentences,N,Path,Local),
    Key=(_-TargetPath),get_assoc(Head,Templates,Slots),memberchk(Slot-Representative,Slots),
    Evidence=Local.put(evidence{kind:ontology_schema_declaration,role:declaration,
      polarity:positive,arity:null,schemaPredicate:Head,targetPosition:Slot,
      targetPath:TargetPath,targetSlotEvidence:[Representative],
      proofAlternativesExhaustive:false,implementation:unknown}).
target_gap(Source,Requests,Hits,Sentences,Reason) :-
    gen_assoc(Key,Requests,Wants),member(request(N,Head,Slot,Path),Wants),
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
