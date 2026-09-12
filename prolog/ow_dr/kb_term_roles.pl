:- module(kb_term_roles,
          [query_terms/6,term_roles/2,term_occurrences/5,assertion_role_ast/2,assertion_role_asts/2,
            browse_nats/4,browse_term_groups/4,nat_facets/5,
            resolve_term/2,resolve_index_term/3,
            category_terms/4,category_sections/3,category_facets/5,
           loaded_term_index/1,clear_term_role_cache/0,
           build_term_index/3,query_index/7,index_term/3,index_occurrences/6,index_assertions/3]).

/** <module> Generation-scoped, evidence-based semantic term roles

No source/cache files are opened by these APIs. Only active kb_store entries
and kb_runtime's clause accessor are copied, under openworld_store's mutex.
The ground semantic index is reused for a generation, rebuilt lazily after
load/unload, and never adds KB assertions, providers, isa facts or execution.
Property snapshots use kb_role_metadata's compact, non-authoritative projection:
redundant representations and oversized values are deferred, not copied into
every derived index. Assertion propertyProjection and coverage.metadataProperties
report omissions. The authoritative store is unchanged. Typed representation
markers retain their source property ordinals and conflicting kinds. The derived
cache is volatile (excluded from qsave images) and can also be explicitly cleared
with clear_term_role_cache/0 after metadata cleanup. Cache reuse validates the
role schema and shared retention-policy tag; publication rechecks policy and
generation before replacing the cache. A stale category projection alone is
upgraded once from the cached entries, roles, types and assertion AST locators;
the occurrence/NAT index and native semantics are not reread or rebuilt.

query_terms(Text,Match,Section,Offset,Limit,Reply): Match exact|substring;
Section all|ordinary|external|non_atomic. Roles are computed and sections
partitioned BEFORE paging. Reply includes overallTotal, sectionTotal, total
(matching in section), matchingOverallTotal, totals and generation.
External-bearing symbols appear only in external, even when they also have
ordinary roles; one identity retains all its roles/evidence. Non-atomic terms
are part of ordinary, with an additional non_atomic filtered view. Context-
only atomic MTs remain accessible by identity but do not inflate term search.

term_roles(Identity,Reply) gives a ground term summary and evidence.
externalEvidence is separately bounded so frequent ordinary occurrences never
hide the callback evidence that established an external-method role.
term_occurrences(Identity,Section,Offset,Limit,Reply): all|semantic|properties|context
selects real assertion references before paging. Rows include annotated ASTs
and a compact projection of loaded properties, never synthesized properties.
propertyProjection reports omitted values; this API does not restore them.
assertion_role_ast(Id,Reply) provides annotated expression and MT ASTs.
assertion_role_asts(Ids,Reply) batches up to 100 IDs from a page, reading the
generation index once rather than calling the single-ID adapter per row.

browse_nats(Filters,Offset,Limit,Reply) and nat_facets/5 retain the full NAT/
type facets used by the existing facade. category_terms/4, category_sections/3,
and category_facets/5 implement the superseding EVERY MATCHING taxonomy in
kb_term_categories. browse_term_groups/4 is an alias for category_terms/4.
The original query_terms/6 contract remains unchanged, including its legacy
method-only external section. No facade/server is duplicated here.
term_roles/2 additionally exposes nat (a bounded categorized item, or null).

resolve_term(Input,Reply) handles one human CycL expression, native normalized
ground compound/text, or canonical identity through kb_term_resolver; it uses
the same reader/codec as the MT aliases, then requires loaded identity evidence.
Reply = {generation,resolvedAs,canonicalKey,term,mt,expression,input,information,
nat,inferredIsa,coverage}. resolvedAs = microtheory for evidenced loaded,
declared or referenced addressable MTs, including zero-content MTs
(canonicalKey/term/mt are the complete mt: key for
compound MTs); otherwise non_atomic or term. expression is the full shared AST.
No stripping or constructor-only route is needed. information is term_roles'
normal reply. A well-formed but unobserved formula is an existence_error.

term_roles/2 and resolve_term/2 expose inferredIsa.microtheory:
{status:supported|unknown,type:x_Microtheory,typeLinkAvailable,bases,evidence,
evidenceCount,contextAssertionCount,materialized:false}. Supported bases are
actual_context, asserted_type, declared_result_type; resultGenl or mere MT
references do not establish this judgement. This is view-only evidence, never
a synthesized stored assertion or inferred inheritance. Unknown is not false.
inferredIsa.representation is DISTINCT: {status,kinds,evidence,evidenceCount,
semanticIsa:false,materialized:false}. Only typed representation exports supply
NART/NAUT; never render all three labels by default.

inferredIsa.semanticIsa contains ONLY supported judgements for Microtheory and
the exact vocabulary CycLNonAtomicTerm, CycLNonAtomicReifiedTerm,
CycLNonAtomicTerm-ClosedFunctor, CycLNonAtomicTerm-Assertible, and
CycLNonAtomicTerm-Askable. inferredIsa.classAssessments exposes the five CycL
checks, including explicit unknown states. These require their OWN positive
isa/resultIsa evidence: no class follows merely from parentheses, groundness,
constructor spelling, another class, or a representation flag. Conversely a
CycLNonAtomicReifiedTerm class claim does not establish actual reification.
Render supported semanticIsa entries; keep representation displayed separately.

Pure counterparts: build_term_index(Generation,Rows,Index), query_index/7,
index_term/3 and index_occurrences/6. Rows use loaded(Id,Semantic,Context,Evidence)
as in kb_mt_graph; Evidence may also carry names and existing properties.
Index contains internal ground assocs and is NOT itself an HTTP JSON payload.

External methods require a SubLQuoteFn or Lisp function-reference expression
in argument 2 of afterAdding/afterRemoving/evaluationDefn/definition, arity 2.
Unquoted semantic formula positions supply evidence; their polarity/role are
retained, not converted into activation or existence claims. Quotes, strings,
formatting data, uppercase spelling and suffixes cannot supply this role.

NAT identities and position-aware AST annotations come from kb_non_atomic.
Unknown function/formula argument schemas and nonground denoting applications
are reported as limitations. This is descriptive syntax evidence, not a type
checker, ontology entailment, local-provider index or execution engine.

Adapter contract:

  * query_terms/6 returns {schema,generation,items,section,match,query,offset,
    limit,total,overallTotal,sectionTotal,matchingOverallTotal,totals,coverage}.
    totals = {all,ordinary,external,nonAtomic}. These are unfiltered section
    counts; total is the filtered count BEFORE pagination. exact matches a
    canonical identity case-sensitively or an entire display label ignoring
    case. Empty text means all entries. Ordering is count descending, then
    canonical identity ascending.
  * items contain {identity,term,kind,symbol,label,expression,roles,external,
    count,searchKey,evidenceCount,externalEvidenceCount,contextKeys}. identity
    and term are identical canonical keys, never constructor-only NAT keys.
    kind = symbol|non_atomic; symbol/expression is null where not applicable.
    count counts distinct source assertion occurrences, not roles or slots.
  * term_roles/2 adds evidence/externalEvidence (at most 12 each), their full
    counts, contextRelationships, and numeric totals {all,semantic,properties,
    context}. Evidence includes role, assertionId, source, originalSource,
    line, variableNames, mt, path, positionRole, polarity; callback evidence
    adds predicate, slot and referenceKind. NAT evidence adds
    denotationEvidence. No source text or inferred assertion is created.
  * term_occurrences/5 returns {generation,identity,section,items,total,offset,
    limit,totals,coverage}. all includes semantic and metadata-context
    occurrences. properties means an actual nonlogical predicate assertion
    with this term as its first argument, not arbitrary nested mentions.
    context counts assertions whose metadata MT IS this term; merely being a
    subterm of a compound MT does not give it content. Facets can overlap.
  * Assertion items contain {id,expression,mt,mtExpression,source,
    originalSource,line,names,properties,propertyProjection,available,issue}.
    Original names and provenance survive; properties are the reported compact
    projection. assertion_role_asts/2 returns these as
    {generation,items,coverage} in requested ID order. Use this batch adapter
    for existing assertion pages, not one index fetch per row.
  * coverage.status = complete|partial concerns available native semantics,
    not inferred ontology completeness. Its contextRelationships field
    separately carries the positive-inheritance graph's coverage. Missing
    native clauses retain context metadata with available=false.

Pagination is 0-based with a 1..100 limit. Unknown identities/IDs throw
existence_error; malformed keys/options throw typed errors. nat: keys require
actual indexed denotation evidence. mt: aliases additionally require actual
context, type, declaration or recognized MT-reference evidence. Context-only atomic MTs are available to term_roles/2
without being added to ordinary semantic search rankings.
*/

:- use_module(kb_store,[]).
:- use_module(kb_runtime,[]).
:- use_module(kb_index,[semantic_constants/2]).
:- use_module(kb_symbols,[encoded_symbol/1]).
:- use_module(kb_terms,[context_key/2,context_from_key/2]).
:- use_module(kb_non_atomic).
:- use_module(kb_nat_browser).
:- use_module(kb_term_categories).
:- use_module(kb_role_metadata,[project_properties/3]).
:- use_module(kb_metadata_policy,[retention_policy/1]).
:- use_module(kb_term_resolver,[term_input/3]).
:- use_module(kb_mt_graph,[analyze_inheritance/3]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).

:- dynamic cached_index/2.
:- volatile cached_index/2.

role_cache_version(6).
current_cached_index(Index) :-
    reusable_role_index(Index),get_dict(categoryCatalog,Index,Catalog),current_category_catalog(Catalog).
reusable_role_index(Index) :-
    is_dict(Index),get_dict(cacheVersion,Index,Version),role_cache_version(Version),
    retention_policy(Policy),get_dict(metadataPolicy,Index,Policy).
clear_term_role_cache :- with_mutex(openworld_store,retractall(cached_index(_,_))).
loaded_term_index(Index) :- current_index(3,Index).
current_index(Attempts,Index) :-
    with_mutex(openworld_store,snapshot_or_cached(State)),
    (State=ready(Index)->true
    ;build_index_snapshot(State,Generation,Policy,Built),
     with_mutex(openworld_store,
       (kb_store:generation(Current),retention_policy(CurrentPolicy),
        (Current=:=Generation,CurrentPolicy==Policy,Built.metadataPolicy==Policy,current_cached_index(Built)->
          (cached_index(Current,Existing),current_cached_index(Existing)->Result=ready(Existing);
           retractall(cached_index(_,_)),assertz(cached_index(Current,Built)),Result=ready(Built))
        ;Result=changed))),
     (Result=ready(Index)->true;
      Attempts>1->Next is Attempts-1,current_index(Next,Index);
      throw(error(term_role_generation_changed,_)))).
build_index_snapshot(snapshot(Generation,Policy,Rows),Generation,Policy,Built) :-
    build_term_index(Generation,Rows,Built).
build_index_snapshot(categories(Generation,Policy,Existing),Generation,Policy,Built) :-
    refresh_category_catalog(Existing,Existing.categoryCatalog,Category),
    Built=Existing.put(categoryCatalog,Category).
snapshot_or_cached(ready(Index)) :-
    kb_store:generation(G),cached_index(G,Index),current_cached_index(Index),!.
snapshot_or_cached(categories(G,Policy,Index)) :-
    kb_store:generation(G),cached_index(G,Index),reusable_role_index(Index),
    get_dict(categoryCatalog,Index,_),!,Policy=Index.metadataPolicy.
snapshot_or_cached(snapshot(Generation,Policy,Rows)) :-
    kb_store:generation(Generation),retention_policy(Policy),
    findall(Row,(kb_store:assertion(Id,Data),snapshot_row(Id,Data,Row)),Rows).
snapshot_row(Id,Data,Row) :-
    context_from_key(Data.mt,Context),
    (member(P,Data.properties),P.name==source_file->Original=P.value;Original=Data.source),
    project_properties(Data.properties,Properties,Projection),
    Evidence=evidence{source:Data.source,originalSource:Original,line:Data.line,
                      names:Data.names,properties:Properties,propertyProjection:Projection},
    catch(findall(T,kb_runtime:module_assertion(Data.module,Id,T,_),Terms),
          Error,Terms=error(Error)),
    (Terms=[Semantic]->Row=loaded(Id,Semantic,Context,Evidence);
     Terms=error(Exception)->message_to_string(Exception,Message),
       Row=unavailable(Id,Context,Evidence,reason{code:native_read_failed,message:Message});
     length(Terms,N),Row=unavailable(Id,Context,Evidence,reason{code:native_clause_count,count:N})).

query_terms(Text,Match,Section,Offset,Limit,Reply) :-
    loaded_term_index(Index),query_index(Index,Text,Match,Section,Offset,Limit,Reply).
browse_nats(Filters,Offset,Limit,Reply) :-
    loaded_term_index(Index),nat_page(Index.natCatalog,Filters,Offset,Limit,Reply).
browse_term_groups(Filters,Offset,Limit,Reply) :-
    category_terms(Filters,Offset,Limit,Reply).
category_terms(Filters,Offset,Limit,Reply) :-
    loaded_term_index(Index),category_page(Index.categoryCatalog,Filters,Offset,Limit,Reply).
category_sections(Filters,Requests,Reply) :-
    loaded_term_index(Index),category_section_pages(Index.categoryCatalog,Filters,Requests,Reply).
category_facets(Filters,Facet,Offset,Limit,Reply) :-
    loaded_term_index(Index),category_facet_page(Index.categoryCatalog,Filters,Facet,Offset,Limit,Reply).
nat_facets(Filters,Kind,Offset,Limit,Reply) :-
    loaded_term_index(Index),nat_facet_page(Index.natCatalog,Filters,Kind,Offset,Limit,Reply).
resolve_term(Input,Reply) :-
    loaded_term_index(Index),resolve_index_term(Index,Input,Reply).
resolve_index_term(Index,Input,Reply) :-
    (text_atom_if(Input,Exact),get_assoc(Exact,Index.terms,_)->
       Key=Exact,InputInfo=term_input{inputKind:canonical_identity,identity:Exact}
    ;term_input(Input,Key,InputInfo)),
    index_term(Index,Key,Info),
    (resolved_category_mt(Info,Mt)->
       As=microtheory,Canonical=Mt
    ;Info.term.kind==non_atomic->As=non_atomic,Mt=null,Canonical=Info.term.identity
    ;As=term,Mt=null,Canonical=Info.term.identity),
    (Info.term.expression==null->kb_terms:term_ast(Info.term.identity,[],Raw),ground_json(Raw,AST)
    ;AST=Info.term.expression),
    Reply=term_resolution{generation:Index.generation,resolvedAs:As,canonicalKey:Canonical,
      term:Canonical,mt:Mt,expression:AST,input:InputInfo,information:Info,
      nat:Info.nat,inferredIsa:Info.inferredIsa,coverage:Info.coverage}.
resolved_category_mt(Info,Mt) :-
    get_dict(category,Info,Category),is_dict(Category),get_dict(mt,Category,Mt),Mt\==null.
text_atom_if(Value,Atom) :- (atom(Value)->Atom=Value;string(Value)->atom_string(Atom,Value)).
term_roles(Identity,Reply) :- loaded_term_index(Index),index_term(Index,Identity,Reply).
term_occurrences(Identity,Section,Offset,Limit,Reply) :-
    loaded_term_index(Index),index_occurrences(Index,Identity,Section,Offset,Limit,Reply).
assertion_role_ast(Id0,Reply) :-
    text_atom(Id0,Id),loaded_term_index(Index),
    (get_assoc(Id,Index.assertions,Assertion)->
       Reply=assertion_roles{generation:Index.generation,assertion:Assertion,coverage:Index.coverage}
    ;existence_error(loaded_assertion,Id)).
assertion_role_asts(Ids,Reply) :-
    loaded_term_index(Index),index_assertions(Index,Ids,Reply).
index_assertions(Index,Inputs,Reply) :-
    must_be(list,Inputs),length(Inputs,N),
    (N=<100->true;domain_error(term_role_batch_limit,N)),
    maplist(text_atom,Inputs,Ids),maplist(required_assertion(Index.assertions),Ids,Items),
    Reply=assertion_role_asts{generation:Index.generation,items:Items,coverage:Index.coverage}.
required_assertion(Map,Id,Assertion) :-
    (get_assoc(Id,Map,Assertion)->true;existence_error(loaded_assertion,Id)).

build_term_index(Generation,Rows,Index) :-
    must_be(nonneg,Generation),must_be(list,Rows),retention_policy(MetadataPolicy),
    maplist(normalize_row,Rows,Normalized),
    findall(Id,member(row(Id,_,_,_,_),Normalized),Ids),sort(Ids,Unique),
    (same_length(Ids,Unique)->true;domain_error(duplicate_loaded_assertion_ids,Ids)),
    findall(T,member(row(_,known(T),_,_,_),Normalized),Semantics),term_schema(Semantics,Schema),
    findall(Event,(member(Row,Normalized),row_event(Row,Schema,Event)),Events),
    findall(Key-E,(member(E,Events),Key=E.identity),EventPairs),
    keysort(EventPairs,Sorted),group_pairs_by_key(Sorted,Groups),
    maplist(term_detail,Groups,Details),
    findall(Key-D,(member(D,Details),Key=D.identity),DetailPairs),list_to_assoc(DetailPairs,Terms),
    findall(Rank-Entry,(member(D,Details),D.listed==true,summary_entry(D,Entry),
                       Negative is -D.count,Rank=Negative-D.identity),Ranked),
    keysort(Ranked,Ordered),pairs_values(Ordered,Entries),
    maplist(assertion_entry(Schema),Normalized,Assertions0),
    keysort(Assertions0,Assertions),list_to_assoc(Assertions,AssertionMap),
    analyze_inheritance(Generation,Rows,Graph),
    findall(Issue,(member(row(Id,unknown,_,_,Reason),Normalized),
                  Issue=issue{assertionId:Id,reason:Reason}),Unavailable),
    findall(Id-Path,(member(Row,Normalized),nonground_denotation(Row,Schema,Id,Path)),Nonground),
    length(Nonground,NongroundCount),
    length(Semantics,SemanticCount),
    metadata_projection_summary(Normalized,MetadataCoverage),
    (Unavailable==[]->State=complete;State=partial),
    Coverage=coverage{status:State,scope:active_generation,staticEvidenceOnly:true,
      assertions:Graph.counts.assertions,semanticAssertions:SemanticCount,unavailable:Unavailable,
      contextRelationships:Graph.coverage,
      nongroundDenotingPositions:NongroundCount,createsProviderAssertions:false,
      executesMethods:false,
      metadataProperties:MetadataCoverage,
      limitations:["Unrecognized callback/reference shapes have no external-method role.",
                   "Unknown function/formula argument schemas use normalized nested-term position evidence.",
                   "Nonground denoting terms have no persistent NAT identity."]},
    role_cache_version(CacheVersion),
    Base=term_index{schema:'powder.loaded-term-roles.v1',generation:Generation,cacheVersion:CacheVersion,
      metadataPolicy:MetadataPolicy,
      entries:Entries,terms:Terms,assertions:AssertionMap,mtGraph:Graph,coverage:Coverage},
    build_nat_catalog(Base,Rows,NatCatalog),WithNats=Base.put(natCatalog,NatCatalog),
    build_category_catalog(WithNats,Rows,Schema,CategoryCatalog),
    Index=WithNats.put(categoryCatalog,CategoryCatalog).
metadata_projection_summary(Rows,Summary) :-
    findall(P,(member(row(_,_,_,E,_),Rows),P=E.propertyProjection),Reports),
    findall(1,(member(P,Reports),P.complete==false),Incomplete),length(Incomplete,Affected),
    findall(N,(member(P,Reports),N=P.policyDroppedCount),Dropped),sum_list(Dropped,PolicyDropped),
    findall(N,(member(P,Reports),N=P.deferredCount),Deferred),sum_list(Deferred,DeferredCount),
    findall(N,(member(P,Reports),N=P.condensedMarkerCount),Condensed),sum_list(Condensed,CondensedCount),
    (Affected=:=0->Complete=true;Complete=false),
    Summary=metadata_projection{mode:compact_index,complete:Complete,
      affectedAssertions:Affected,policyDroppedProperties:PolicyDropped,
      deferredProperties:DeferredCount,condensedMarkers:CondensedCount,
      authoritative:false}.

normalize_row(loaded(Id,Semantic,Context,Evidence0),row(Id,known(Semantic),Context,Evidence,none)) :- !,
    must_be(atom,Id),(acyclic_term(Semantic)->true;domain_error(acyclic_semantic,Id)),
    normalize_evidence(Evidence0,Evidence),must_be(ground,Context).
normalize_row(unavailable(Id,Context,Evidence0,Reason0),row(Id,unknown,Context,Evidence,Reason)) :- !,
    must_be(atom,Id),normalize_evidence(Evidence0,Evidence),ground_json(Reason0,Reason),
    must_be(ground,Context).
normalize_row(Row,_) :- domain_error(loaded_term_role_row,Row).
normalize_evidence(Input,Evidence) :-
    must_be(dict,Input),must_be(text,Input.source),must_be(text,Input.originalSource),
    (Input.line==null->true;must_be(positive_integer,Input.line)),
    dict_default(Input,names,[],Names),must_be(list,Names),maplist(must_be(string),Names),
    dict_default(Input,properties,[],Properties0),
    (get_dict(propertyProjection,Input,Projection0)->
       ground_json(Projection0,Projection),ground_json(Properties0,Properties)
    ;project_properties(Properties0,Properties,Projection)),
    Evidence=evidence{source:Input.source,originalSource:Input.originalSource,
                      line:Input.line,names:Names,properties:Properties,propertyProjection:Projection}.

row_event(row(Id,known(Semantic),Context,E,_),_,Event) :-
    semantic_constants(Semantic,Symbols),member(Symbol,Symbols),
    evidence(Id,Context,E,[],semantic,positive,Base),
    symbol_event(Symbol,semantic_symbol,semantic,Base,Event).
row_event(row(Id,known(Semantic),Context,E,_),Schema,Event) :-
    semantic_position(Semantic,Schema,Term,Pos),
    evidence(Id,Context,E,Pos.path,Pos.role,Pos.polarity,Base),
    (atom(Term),Pos.kind==context,semantic_symbol(Term)->
       symbol_event(Term,microtheory_reference,semantic,Base,Initial),
       Event=Initial.put(contextKey,Term)
    ;atom(Term),symbol_position_role(Pos.kind,Role)->
       semantic_symbol(Term),symbol_event(Term,Role,semantic,Base,Event)
    ;denoting_position(Term,Pos,Schema,Reason),ground(Term),
     catch(non_atomic_key(Term,Key),error(_,_),fail)->
       non_atomic_ast(Term,Schema,AST),
       (Pos.kind==context->Role=microtheory_reference,context_key(Term,MtKey);Role=non_atomic,MtKey=null),
       Event=event{identity:Key,kind:non_atomic,symbol:null,expression:AST,role:Role,
                   facet:semantic,contextKey:MtKey,evidence:Base.put(denotationEvidence,Reason)}
    ;fail).
row_event(row(Id,known(Semantic),Context,E,_),Schema,Event) :-
    semantic_position(Semantic,Schema,Term,Pos),Pos.kind==formula,
    callback_method(Term,Method,Predicate,Slot,ReferenceKind),
    evidence(Id,Context,E,Pos.path,Pos.role,Pos.polarity,Base),
    Detail=Base.put(callback{predicate:Predicate,slot:Slot,referenceKind:ReferenceKind}),
    symbol_event(Method,external_method,semantic,Detail,Event).
row_event(row(Id,known(Semantic),Context,E,_),Schema,Event) :-
    nonvar(Semantic),compound(Semantic),Semantic=..[Name,Subject|_],
    \+memberchk(Name,[:-,x_quote,x_not,x_implies,'x_=>',x_equiv,'x_<=>',x_and,x_or,
                     x_forAll,x_forall,x_exists,x_thereExists,metta_value,metta_exec,
                     metta_expression,'x_metta=','x_<===']),
    \+memberchk(Name,Schema.functions),
    evidence(Id,Context,E,[args,0],property_subject,positive,Base),
    Detail=Base.put(propertyPredicate,Name),
    (atom(Subject),semantic_symbol(Subject)->symbol_event(Subject,property_subject,properties,Detail,Event)
    ;semantic_position(Semantic,Schema,Found,Pos),Pos.path==[args,0],Found==Subject,
     denoting_position(Subject,Pos,Schema,_),ground(Subject),
     non_atomic_key(Subject,Key),non_atomic_ast(Subject,Schema,AST),
     Event=event{identity:Key,kind:non_atomic,symbol:null,expression:AST,role:property_subject,
                 facet:properties,contextKey:null,evidence:Detail}).
row_event(row(Id,_,Context,E,_),Schema,Event) :-
    context_key(Context,ContextKey),
    context_position(Context,Schema,Term,Pos),
    evidence(Id,Context,E,Pos.path,microtheory_context,positive,Base),
    (Pos.path==[],atom(Term)->
       symbol_event(Term,microtheory_context,context,Base,Initial),
       Event=Initial.put(contextKey,ContextKey)
    ;atom(Term),symbol_position_role(Pos.kind,Role),semantic_symbol(Term)->
       symbol_event(Term,Role,context_value,Base,Event)
    ;denoting_position(Term,Pos,Schema,Reason),ground(Term),
     non_atomic_key(Term,Key),non_atomic_ast(Term,Schema,AST),
     (Pos.path==[]->Role=microtheory_context,MtKey=ContextKey,Facet=context;
      Role=non_atomic,MtKey=null,Facet=context_value),
     Event=event{identity:Key,kind:non_atomic,symbol:null,expression:AST,role:Role,
                 facet:Facet,contextKey:MtKey,evidence:Base.put(denotationEvidence,Reason)}).

symbol_position_role(predicate_symbol,predicate_reference).
symbol_position_role(constructor_symbol,constructor_reference).
symbol_position_role(value,term_reference).
symbol_position_role(typed_value,term_reference).
symbol_position_role(collection_value,term_reference).
symbol_position_role(collection_type,term_reference).
semantic_symbol(Symbol) :-
    atom(Symbol),encoded_symbol(Symbol),\+downcase_atom(Symbol,nil),
    \+memberchk(Symbol,[x_cid,x_cid_io,x_cid_in,x_cid_out,x_aid]).
symbol_event(Symbol,Role,Facet,Evidence,
             event{identity:Symbol,kind:symbol,symbol:Symbol,expression:null,role:Role,
                   facet:Facet,contextKey:null,evidence:Evidence}).
callback_method(Term,Method,Predicate,2,Kind) :-
    nonvar(Term),compound(Term),Term=..[Predicate,_,Reference],
    memberchk(Predicate,[x_afterAdding,x_afterRemoving,x_evaluationDefn,x_definition]),
    function_reference(Reference,Method,Kind).
evidence(Id,Context,E,Path,Role,Polarity,Evidence) :-
    context_key(Context,MtKey),
    Evidence=evidence{assertionId:Id,source:E.source,originalSource:E.originalSource,
      line:E.line,variableNames:E.names,mt:MtKey,path:Path,
      positionRole:Role,polarity:Polarity}.
nonground_denotation(row(Id,known(Term),_,_,_),Schema,Id,Path) :-
    semantic_position(Term,Schema,Value,Pos),denoting_position(Value,Pos,Schema,_),
    \+ground(Value),Path=Pos.path.

term_detail(Key-Events,Detail) :-
    Events=[First|_],findall(R,(member(E,Events),R=E.role),Rs),sort(Rs,Roles),
    findall(Evidence,(member(E,Events),Evidence=E.evidence.put(role,E.role)),Es),
    sort(Es,Evidence),
    include(external_role_evidence,Evidence,ExternalEvidence),
    findall(Id,(member(E,Events),Id=E.evidence.assertionId),Ids0),sort(Ids0,Ids),length(Ids,Count),
    facet_ids(Events,semantic,SemanticIds),facet_ids(Events,properties,PropertyIds),
    facet_ids(Events,context,ContextIds),
    findall(K,(member(E,Events),K=E.contextKey,K\==null),Ks),sort(Ks,ContextKeys),
    (memberchk(external_method,Roles)->External=true;External=false),
    ((First.kind==non_atomic;memberchk(semantic_symbol,Roles);External==true)->Listed=true;Listed=false),
    detail_label(First,Label),string_lower(Label,SearchKey),
    Detail=term{identity:Key,term:Key,kind:First.kind,symbol:First.symbol,
      expression:First.expression,label:Label,searchKey:SearchKey,roles:Roles,
      external:External,listed:Listed,count:Count,assertionIds:Ids,evidence:Evidence,
      externalEvidence:ExternalEvidence,
      semanticAssertionIds:SemanticIds,propertyAssertionIds:PropertyIds,
      contextAssertionIds:ContextIds,contextKeys:ContextKeys}.
external_role_evidence(Evidence) :- Evidence.role==external_method.
facet_ids(Events,Facet,Ids) :-
    findall(Id,(member(E,Events),E.facet==Facet,Id=E.evidence.assertionId),All),sort(All,Ids).
detail_label(Event,Label) :-
    (Event.kind==symbol->
       (atom_concat(x_,Name,Event.symbol)->atom_string(Name,Label);atom_string(Event.symbol,Label))
    ;ast_label(Event.expression,Label)).
summary_entry(Detail,Entry) :-
    length(Detail.evidence,N),
    length(Detail.externalEvidence,ExternalCount),
    Entry=term_summary{identity:Detail.identity,term:Detail.term,kind:Detail.kind,
      symbol:Detail.symbol,label:Detail.label,expression:Detail.expression,
      roles:Detail.roles,external:Detail.external,count:Detail.count,
      searchKey:Detail.searchKey,evidenceCount:N,externalEvidenceCount:ExternalCount,
      contextKeys:Detail.contextKeys}.

assertion_entry(Schema,row(Id,State,Context,E,Reason),Id-Assertion) :-
    (State=known(Term)->annotated_semantic_ast(Term,E.names,Schema,AST),Available=true;
     AST=null,Available=false),
    non_atomic_ast(Context,Schema,MtAST),context_key(Context,Mt),
    Assertion=assertion{id:Id,expression:AST,mt:Mt,mtExpression:MtAST,
      source:E.source,originalSource:E.originalSource,line:E.line,names:E.names,
      properties:E.properties,propertyProjection:E.propertyProjection,
      available:Available,issue:Reason}.

query_index(Index,Text0,Match,Section,Offset,Limit,Reply) :-
    text_string(Text0,Text),validate_match(Match),validate_section(Section),pagination(Offset,Limit),
    string_lower(Text,Needle),
    include(in_section(Section),Index.entries,SectionEntries),
    include(matches(Text,Needle,Match),Index.entries,AllMatches),
    include(matches(Text,Needle,Match),SectionEntries,Matches),
    length(Index.entries,Overall),length(SectionEntries,SectionTotal),
    length(AllMatches,MatchingOverall),length(Matches,Total),page(Matches,Offset,Limit,Items),
    section_totals(Index.entries,Totals),
    Reply=term_results{schema:Index.schema,generation:Index.generation,items:Items,
      section:Section,match:Match,query:Text,offset:Offset,limit:Limit,total:Total,
      overallTotal:Overall,sectionTotal:SectionTotal,matchingOverallTotal:MatchingOverall,
      totals:Totals,coverage:Index.coverage}.
validate_match(Match) :- must_be(atom,Match),(memberchk(Match,[exact,substring])->true;domain_error(term_match,Match)).
validate_section(S) :- must_be(atom,S),(memberchk(S,[all,ordinary,external,non_atomic])->true;domain_error(term_section,S)).
in_section(all,_).
in_section(ordinary,E) :- E.external==false.
in_section(external,E) :- E.external==true.
in_section(non_atomic,E) :- E.kind==non_atomic.
matches("",_,_,_) :- !.
matches(Text,Needle,exact,E) :- !,
    (atom_string(E.identity,Text);E.searchKey==Needle).
matches(_,Needle,substring,E) :-
    (sub_string(E.searchKey,_,_,_,Needle);atom_string(E.identity,Identity),
     string_lower(Identity,Lower),sub_string(Lower,_,_,_,Needle)),!.
section_totals(Entries,Totals) :-
    length(Entries,All),include(in_section(external),Entries,External),length(External,E),
    include(in_section(non_atomic),Entries,Nats),length(Nats,N),
    Ordinary is All-E,Totals=totals{all:All,ordinary:Ordinary,external:E,nonAtomic:N}.

index_term(Index,Input,Reply) :-
    lookup_term(Index,Input,Detail),summary_entry(Detail,Summary),
    length(Detail.evidence,EvidenceCount),take(12,Detail.evidence,Evidence),
    length(Detail.externalEvidence,ExternalCount),take(12,Detail.externalEvidence,ExternalEvidence),
    context_relationships(Index,Detail,Relationships),
    length(Detail.semanticAssertionIds,S),length(Detail.propertyAssertionIds,P),
    length(Detail.contextAssertionIds,C),
    (Detail.kind==non_atomic->nat_item(Index.natCatalog,Detail.identity,Nat);Nat=null),
    term_type_assessment(Index,Index.natCatalog,Detail,TypeAssessment),
    (get_assoc(Detail.identity,Index.categoryCatalog.byIdentity,_)->
      category_item(Index.categoryCatalog,Detail.identity,Category)
    ;Category=null),
    Reply=term_roles{generation:Index.generation,term:Summary,evidence:Evidence,
      evidenceCount:EvidenceCount,contextRelationships:Relationships,
      externalEvidence:ExternalEvidence,externalEvidenceCount:ExternalCount,
      totals:totals{all:Detail.count,semantic:S,properties:P,context:C},nat:Nat,
      inferredIsa:TypeAssessment,category:Category,
      coverage:Index.natCatalog.coverage}.
lookup_term(Index,Input,Detail) :-
    text_atom(Input,Identity),
    (atom_concat('nat:',_,Identity)->
       non_atomic_from_key(Identity,Term),non_atomic_key(Term,Key)
    ;atom_concat('mt:',_,Identity)->
       context_from_key(Identity,Context),non_atomic_key(Context,Key)
    ;Key=Identity),
    (get_assoc(Key,Index.terms,Found),
     (\+atom_concat('mt:',_,Identity);known_context_alias(Index,Key,Identity))->
       Detail=Found
    ;existence_error(loaded_term_identity,Identity)).
known_context_alias(Index,Key,Identity) :-
    get_assoc(Key,Index.categoryCatalog.byIdentity,Entry),Entry.mt==Identity.
context_relationships(Index,Detail,Relations) :-
    findall(E,(member(E,Index.mtGraph.edges),
      (memberchk(E.child,Detail.contextKeys);memberchk(E.parent,Detail.contextKeys))),All),
    sort(All,Relations).
index_occurrences(Index,Identity,Section,Offset,Limit,Reply) :-
    must_be(atom,Section),pagination(Offset,Limit),lookup_term(Index,Identity,Detail),
    occurrence_ids(Section,Detail,Ids),length(Ids,Total),
    page(Ids,Offset,Limit,Selected),maplist(assertion_at(Index.assertions),Selected,Items),
    length(Detail.semanticAssertionIds,S),length(Detail.propertyAssertionIds,P),
    length(Detail.contextAssertionIds,C),
    Reply=term_occurrences{generation:Index.generation,identity:Detail.identity,section:Section,
      items:Items,total:Total,offset:Offset,limit:Limit,
      totals:totals{all:Detail.count,semantic:S,properties:P,context:C},
      coverage:Index.coverage}.
occurrence_ids(all,D,D.assertionIds) :- !.
occurrence_ids(semantic,D,D.semanticAssertionIds) :- !.
occurrence_ids(properties,D,D.propertyAssertionIds) :- !.
occurrence_ids(context,D,D.contextAssertionIds) :- !.
occurrence_ids(Section,_,_) :- domain_error(term_occurrence_section,Section).
assertion_at(Map,Id,Assertion) :- get_assoc(Id,Map,Assertion).
pagination(Offset,Limit) :-
    must_be(nonneg,Offset),must_be(integer,Limit),
    (between(1,100,Limit)->true;domain_error(term_role_page_limit,Limit)).
page(List,Offset,Limit,Page) :- drop(Offset,List,Rest),take(Limit,Rest,Page).
drop(0,List,List) :- !.
drop(_,[],[]) :- !.
drop(N,[_|Rest],Result) :- Next is N-1,drop(Next,Rest,Result).
take(0,_,[]) :- !.
take(_,[],[]) :- !.
take(N,[H|T],[H|Rest]) :- Next is N-1,take(Next,T,Rest).
dict_default(Dict,Key,Default,Value) :- (get_dict(Key,Dict,Value)->true;Value=Default).
text_atom(Value,Atom) :-
    (atom(Value)->Atom=Value;string(Value)->atom_string(Atom,Value);type_error(text,Value)).
text_string(Value,String) :-
    (string(Value)->String=Value;atom(Value)->atom_string(Value,String);type_error(text,Value)).
ground_json(Value,Ground) :-
    (is_dict(Value)->dict_pairs(Value,_,Pairs),maplist(ground_pair,Pairs,New),dict_pairs(Ground,json,New)
    ;is_list(Value)->maplist(ground_json,Value,Ground)
    ;atomic(Value)->Ground=Value
    ;type_error(ground_json,Value)).
ground_pair(Key-Value,Key-Ground) :- ground_json(Value,Ground).
