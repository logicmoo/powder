:- module(kb_file_dependencies,
          [file_dependencies/2,analyze_records/4,clear_dependency_cache/0]).

/** <module> Read-only, per-file static dependency evidence

file_dependencies(+Source,-Info) reads an existing normalized .data file with
kb_cache:read_cache/3, never source text or indexes, and never invokes compilation
or the KB runtime. declaration_target/4 is reused from the inventory module.
analyze_records(+Source,+Header,+Records,-Info) is its filesystem-free analysis.
The latter accepts the record(Id,Semantic,Metadata) representation of read_cache.
It reports incomplete record counts/metadata as partial, not as an empty KB.

All results are ground JSON dictionaries, schema powder.file-dependencies.v1:

  * status: complete | partial | unavailable; reasons: [{code,message},...].
  * source: requested path and original cached path/hash/dialect/size.
  * cache: recorded identity, validation, freshness, current size/mtime.
  * coverage: records, definitions, references, contexts, microtheories.
  * symbols: defined, declared, referenced, outbound, unresolved.
    Concrete entries are grouped by symbol, not arity, with arities, roles,
    polarities, evidenceCount and at most 12 provenance evidence samples.
  * microtheories: provided, referenced, outbound, missingImplied.
    MT entries use canonical context keys (including compound MTs).

Unavailable sets are null. For MeTTa, definitions/declarations/outbound are
null: syntax alone does not establish its definition semantics. For KIF/KRF,
outbound means referenced minus providers IN THIS FILE, never globally missing.
Two-equals rule shapes are inventory data, not reverse implication/execution.

MT references use recorded context values, explicit isa Microtheory declarations,
ist/genlMt positions, and locally asserted argIsa/domain/argNIsa signatures,
including local type/subpredicate schema. No MT inheritance is inferred.
Unknown external schemas and discarded declaration-only directives make MT
coverage partial. missingImplied is about actual cached assertion contexts,
not declarations or a guessed fallback context.

Source freshness is deliberately unverified: stat incompatibility rejects a
snapshot, but compatible stats cannot prove a source hash without reading it.
Historical source/normalized paths remain provenance, not rewritten identities.
The request cache holds at most eight results / two million term cells, keyed
by source and cache size/mtime. It is lazy, process-local, and mutex protected;
no whole-corpus or per-catalog-row reads are needed. Clear it explicitly when
external tooling preserves timestamps while replacing files.
*/

:- use_module(kb_cache,[read_cache/3,term_line/2]).
:- use_module(kb_paths,[cache_paths/3,repo_root/1]).
:- use_module(kb_inventory,[declaration_target/4]).
:- use_module(kb_inventory_rules).
:- use_module(kb_symbols,[encoded_symbol/1,encode_symbol/2]).
:- use_module(kb_terms,[context_key/2]).
:- use_module(library(apply)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(terms),[term_size/2]).
:- use_module(library(ugraphs)).

:- dynamic remembered/4.

clear_dependency_cache :-
    with_mutex(kb_file_dependencies,retractall(remembered(_,_,_,_))).

file_dependencies(Input,Info) :-
    catch(file_dependencies_safe(Input,Info),Error,error_result(Input,Error,Info)),!.

file_dependencies_safe(Input,Info) :-
    must_be(text,Input),repo_root(Root),
    absolute_file_name(Input,Source,[relative_to(Root),access(none)]),
    cache_paths(Source,Cache,_),
    file_stamp(Source,SourceStamp),file_stamp(Cache,CacheStamp),
    Key=identity(Source,SourceStamp,Cache,CacheStamp),
    with_mutex(kb_file_dependencies,
      (remembered(Key,Saved,Cells,_)->
         get_time(Now),retractall(remembered(Key,_,_,_)),
         assertz(remembered(Key,Saved,Cells,Now)),Info=Saved
      ;read_dependencies(Source,Cache,SourceStamp,CacheStamp,Result),
       file_stamp(Source,AfterSource),file_stamp(Cache,AfterCache),
       (AfterSource==SourceStamp,AfterCache==CacheStamp->
          Info=Result,remember_result(Key,Info)
       ;unavailable(Source,cache_changed_during_read,
          "Source or cache changed while dependency evidence was being read.",Info)))).

file_stamp(Path,Stamp) :-
    (exists_file(Path)->size_file(Path,Size),time_file(Path,Modified),
       Stamp=stamp(Size,Modified)
    ;Stamp=missing).

remember_result(Key,Info) :-
    term_size(Info,Cells),
    (Cells=<2000000->
      get_time(Now),assertz(remembered(Key,Info,Cells,Now)),trim_results
    ;true).
trim_results :-
    findall(Time-(Key-Cells),remembered(Key,_,Cells,Time),Entries),
    length(Entries,Count),findall(N,member(_-(_-N),Entries),Sizes),sum_list(Sizes,Total),
    (Count>8;Total>2000000),!,
    keysort(Entries,[_-(Old-_)|_]),retractall(remembered(Old,_,_,_)),trim_results.
trim_results.

read_dependencies(Source,_,missing,_,Info) :- !,
    unavailable(Source,source_missing,"The requested original source is missing.",Info).
read_dependencies(Source,_,_,missing,Info) :- !,
    unavailable(Source,cache_missing,"No normalized data cache exists; compilation was not requested.",Info).
read_dependencies(Source,Cache,stamp(Size,SourceTime),stamp(CacheSize,CacheTime),Info) :-
    read_cache(Cache,Header,Records),
    cache_identity(Header,Cache,Identity),
    ((Size=\=Header.sizeBytes;SourceTime>CacheTime)->
      unavailable(Source,cache_stale,
        "Source size or modification time is incompatible with the cached snapshot.",Base),
      Info=Base.put(cache,Identity.put(validation,validated))
    ;analyze_records(Source,Header,Records,Base),
     Reason=reason{code:source_freshness_unverified,
       message:"Only filesystem stats were checked. Source bytes and current converter/mapping identity were not reread."},
     append(Base.reasons,[Reason],Reasons),
     Info=Base.put(dependencies{status:partial,reasons:Reasons,
       source:Base.source.put(currentStat,stat{sizeBytes:Size,modified:SourceTime}),
       cache:Identity.put(cache_info{validation:validated,freshness:stat_compatible_unverified,
                                     sizeBytes:CacheSize,modified:CacheTime})})).

error_result(Input,Error,Info) :-
    message_to_string(Error,Message),
    error_code(Error,Code),safe_text(Input,Source),
    unavailable(Source,Code,Message,Base),
    term_line(Error,Detail),Info=Base.put(error,error{code:Code,message:Message,detail:Detail}).
error_code(error(invalid_cache(_),_),invalid_cache) :- !.
error_code(error(syntax_error(_),_),invalid_cache) :- !.
error_code(error(existence_error(_,_),_),file_unavailable) :- !.
error_code(error(permission_error(_,_,_),_),file_access_denied) :- !.
error_code(_,dependency_analysis_failed).
safe_text(Value,Value) :- (atom(Value);string(Value)),!.
safe_text(Value,Text) :- term_line(Value,Text).

unavailable(Source,Code,Message,Info) :-
    implied_candidate(Source,Candidate),
    Info=dependencies{schema:'powder.file-dependencies.v1',status:unavailable,
      source:source{path:Source},cache:null,
      coverage:coverage{records:unknown,definitions:unknown,references:unknown,
                        contexts:unknown,microtheories:unknown},
      reasons:[reason{code:Code,message:Message}],
      symbols:symbols{defined:null,declared:null,referenced:null,outbound:null,unresolved:null},
      microtheories:microtheories{provided:null,referenced:null,outbound:null,
        missingImplied:implied{candidate:Candidate,status:unknown,scope:cached_assertion_contexts,
                               contentAssertions:null}}}.

analyze_records(Source,Header,Records,Info) :-
    must_be(text,Source),must_be(dict,Header),must_be(list,Records),
    maplist(record_shape,Records),
    header_value(Header,dialect,unknown,Dialect),
    record_coverage(Header,Records,RecordCoverage,RecordReasons),
    findall(E,(member(R,Records),record_event(Dialect,R,E)),Events),
    symbol_analysis(Dialect,Records,Events,Symbols,D0,R0,SymbolReasons),
    bounded_coverage(RecordCoverage,D0,Definitions),bounded_coverage(RecordCoverage,R0,References),
    candidate_source_name(Source,Header,CandidateSource),
    mt_analysis(CandidateSource,Dialect,Records,Events,RecordCoverage,MTs,Contexts,MTReasons),
    append([RecordReasons,SymbolReasons,MTReasons],Reasons0),sort(Reasons0,Reasons),
    (Reasons==[]->Status=complete;Status=partial),
    source_identity(Source,Header,SourceInfo),cache_identity(Header,null,CacheInfo),
    header_value(Header,count,null,Count),
    Info=dependencies{schema:'powder.file-dependencies.v1',status:Status,
      source:SourceInfo,cache:CacheInfo,assertionCount:Count,
      coverage:coverage{records:RecordCoverage,definitions:Definitions,references:References,
                        contexts:Contexts,microtheories:partial},
      reasons:Reasons,symbols:Symbols,microtheories:MTs}.

bounded_coverage(complete,State,State) :- !.
bounded_coverage(_,unknown,unknown) :- !.
bounded_coverage(_,_,partial).

record_shape(record(Id,Semantic,Metadata)) :-
    atom(Id),nonvar(Semantic),acyclic_term(Semantic),is_list(Metadata),ground(Metadata),!.
record_shape(Record) :- domain_error(dependency_record,Record).

header_value(Header,Key,Default,Value) :-
    (get_dict(Key,Header,Value)->must_be(ground,Value);Value=Default).
source_identity(Source,Header,Info) :-
    header_value(Header,source,null,Original),header_value(Header,sourceHash,null,Hash),
    header_value(Header,dialect,unknown,Dialect),header_value(Header,sizeBytes,null,Size),
    Info=source{path:Source,originalPath:Original,sha256:Hash,dialect:Dialect,sizeBytes:Size}.
cache_identity(Header,Path,Info) :-
    header_value(Header,normalizedFile,null,Original),
    header_value(Header,normalizedDigest,null,Digest),header_value(Header,schema,null,Schema),
    header_value(Header,converter,null,Converter),header_value(Header,mappingHash,null,Mapping),
    header_value(Header,implementationHash,null,Implementation),
    Info=cache_info{path:Path,originalPath:Original,normalizedDigest:Digest,schema:Schema,
                   converter:Converter,mappingHash:Mapping,implementationHash:Implementation,
                   validation:provided_records,freshness:unknown}.
record_coverage(Header,Records,State,Reasons) :-
    length(Records,N),
    (get_dict(count,Header,Count),integer(Count),Count=:=N->
      State=complete,Reasons=[]
    ;State=partial,Reasons=[reason{code:incomplete_records,
       message:"No matching complete cache assertion count was supplied."}]).

record_evidence(record(Id,_,Metadata),E) :-
    metadata_value(Metadata,xc_source_file,Id,null,File),
    metadata_value(Metadata,xc_source_line,Id,null,Line),
    metadata_value(Metadata,xc_kb_names,Id,[],Names),
    E=evidence{id:Id,sourceFile:File,line:Line,variableNames:Names}.
metadata_value(Metadata,Name,Id,Default,Value) :-
    (member(Term,Metadata),compound(Term),Term=..[Name,Id,Found]->Value=Found;Value=Default).

record_event(Dialect,Record,Event) :-
    Record=record(_,Semantic,_),record_evidence(Record,E),
    (Dialect==metta->Role=inert_data;Role=assertion),
    semantic_node(Semantic,formula,Role,positive,Node,Context,NodeRole,Polarity),
    node_event(Node,Context,NodeRole,Polarity,E,Event).

semantic_node(Term,Context,Role,Polarity,Term,Context,Role,Polarity).
semantic_node(Term,Context,Role,Polarity,Node,ChildContext,ChildRole,ChildPolarity) :-
    nonvar(Term),
    semantic_child(Term,Context,Role,Polarity,Child,NextContext,NextRole,NextPolarity),
    semantic_node(Child,NextContext,NextRole,NextPolarity,Node,ChildContext,ChildRole,ChildPolarity).

semantic_child((Head:-Body),_,_,P,Child,formula,Role,P) :- !,
    (Child=Head,Role=head;nonvar(Body),Body=..[and|Goals],member(Child,Goals),Role=antecedent).
semantic_child(Term,_,R,P,Child,value,R,P) :-
    is_dict(Term),!,dict_pairs(Term,_,Pairs),(member(Child-_,Pairs);member(_-Child,Pairs)).
semantic_child(Term,_,R,P,Child,value,R,P) :- is_list(Term),!,member(Child,Term).
semantic_child(Term,_,R,P,Child,Context,Role,Polarity) :-
    compound(Term),Term=..[Name|Args],
    child_role(Name,Args,R,P,Child,Context,Role,Polarity).

child_role(Name,[Binder,Child],R,P,Child,formula,R,P) :-
    quantifier(Name),valid_binder(Binder),!.
child_role(Name,[A,B],_,P,Child,formula,Role,P) :-
    memberchk(Name,[x_implies,'x_=>']),!,
    (Child=A,Role=antecedent;Child=B,Role=consequent).
child_role(Name,[A,B],_,P,Child,formula,Role,P) :-
    memberchk(Name,[x_equiv,'x_<=>']),!,
    (Child=A,Role=left;Child=B,Role=right).
child_role('x_<==',[Head|Body],_,P,Child,formula,Role,P) :- !,
    (Child=Head,Role=head;member(Child,Body),Role=antecedent).
child_role(Name,Args,R,P,Child,formula,R,P) :- memberchk(Name,[x_and,x_or]),!,member(Child,Args).
child_role(x_not,[Child],R,P,Child,formula,R,Opposite) :- !,opposite(P,Opposite).
child_role(t,[Predicate|Args],R,P,Child,value,R,P) :- !,
    (Child=Predicate;member(Child,Args)).
child_role(Name,Args,R,P,Child,value,R,P) :-
    \+memberchk(Name,[':-',x_cid,x_cid_io]),member(Child,Args).
opposite(positive,negative).
opposite(negative,positive).

node_event(Node,formula,R,P,E,unresolved(Detail)) :- var(Node),!,
    Detail=E.put(evidence{role:R,polarity:P,kind:variable_formula,canonical:"variable"}).
node_event(Node,_,R,P,E,unresolved(Detail)) :-
    nonvar(Node),compound(Node),Node=..[t,Predicate|Args],
    \+symbol_atom(Predicate),!,
    term_line(Predicate,Text),length(Args,Arity),
    (var(Predicate)->Kind=variable_predicate;Kind=compound_or_unsupported_predicate),
    Detail=E.put(evidence{role:R,polarity:P,kind:Kind,arity:Arity,canonical:Text}).
node_event(Node,formula,R,P,E,unresolved(Detail)) :-
    nonvar(Node),\+Node=(_:-_),\+node_symbol(Node,formula,_,_),
    \+ (compound(Node),functor(Node,Name,_),
        memberchk(Name,[t,metta_value,metta_exec,metta_expression])),
    term_line(Node,Text),
    Detail=E.put(evidence{role:R,polarity:P,kind:unsupported_formula,canonical:Text}).
node_event(Node,Context,R,P,E,reference(Symbol,Arity,R,P,E)) :-
    node_symbol(Node,Context,Symbol,Arity).
node_event(Node,value,R,P,E,constant(Node,R,P,E)) :- symbol_atom(Node).
node_event(Node,_,R,P,E,application(Node,R,P,E)) :-
    compound(Node),\+is_list(Node),\+is_dict(Node),Node\=(_:-_).

node_symbol(Node,formula,Node,0) :- symbol_atom(Node),!.
node_symbol(Node,_,Symbol,Arity) :-
    compound(Node),\+is_list(Node),\+is_dict(Node),Node=..[Name|Args],
    (Name==t->Args=[Symbol|Rest],symbol_atom(Symbol),length(Rest,Arity)
    ;symbol_atom(Name),Symbol=Name,length(Args,Arity)).
symbol_atom(Symbol) :-
    encoded_symbol(Symbol),\+memberchk(Symbol,[nil,'NIL',':',':-','?-',x_cid,x_cid_io]).

symbol_analysis(Dialect,Records,Events,Symbols,Definitions,References,Reasons) :-
    findall(U,member(unresolved(U),Events),Unresolved),
    findall(S-A-R-P-E,member(reference(S,A,R,P,E),Events),Syntactic),
    (memberchk(Dialect,[kif,krf,meld])->
      findall(S-A-R-P-E,definition_evidence(Records,S,A,R,P,E),DefinedEvents),
      findall(S-A-declaration-positive-E,declaration_evidence(Records,S,A,E),DeclaredEvents),
      append(DefinedEvents,DeclaredEvents,ProviderEvents),
      findall(S,member(S-_-_-_-_,ProviderEvents),Providers0),sort(Providers0,Providers),
      findall(S-null-R-P-E,(member(constant(S,R,P,E),Events),memberchk(S,Providers)),ValueRefs),
      append([Syntactic,DeclaredEvents,ValueRefs],ReferenceEvents),
      group_symbols(DefinedEvents,Defined),group_symbols(DeclaredEvents,Declared),
      group_symbols(ReferenceEvents,Referenced),
      exclude(provided_symbol(Providers),Referenced,Outbound),
      (Unresolved==[]->Definitions=complete,References=complete,Reasons=[]
      ;Definitions=partial,References=partial,Reasons=[reason{code:unresolved_predicate_positions,
         message:"Variable or compound predicate/formula positions do not establish a concrete provider symbol."}])
    ;Defined=null,Declared=null,Outbound=null,Definitions=unknown,References=partial,
     group_symbols(Syntactic,Referenced),
     Reasons=[reason{code:unsupported_definition_dialect,
       message:"Only inert syntactic references are reported; this dialect has no established dependency-definition semantics."}]),
    Symbols=symbols{defined:Defined,declared:Declared,referenced:Referenced,
                    outbound:Outbound,unresolved:Unresolved}.
provided_symbol(Providers,Entry) :- memberchk(Entry.symbol,Providers).

definition_evidence(Records,S,A,R,P,E) :-
    member(Record,Records),Record=record(_,Semantic,_),
    rule_classification(Semantic,Info),member(Head,Info.heads),
    S=Head.predicate,symbol_atom(S),\+logical_operator(S),
    A=Head.arity,R=Head.role,P=Head.polarity,record_evidence(Record,Base),
    E=Base.put(via,Info.kind).
declaration_evidence(Records,S,A,E) :-
    asserted_fact(Records,Fact,Base),
    declaration_target(Fact,S,A,Name),symbol_atom(S),
    E=Base.put(via,Name).

asserted_fact(Records,Fact,E) :-
    member(Record,Records),Record=record(_,Semantic,_),
    record_evidence(Record,E),unconditional_fact(Semantic,Fact).
unconditional_fact(Term,Fact) :-
    nonvar(Term),
    (compound(Term),Term=..[Name,Binder,Inner],quantifier(Name),valid_binder(Binder)->
       unconditional_fact(Inner,Fact)
    ;compound(Term),Term=..[x_and|Args]->member(Child,Args),unconditional_fact(Child,Fact)
    ;compound(Term),functor(Term,Name,_),symbol_atom(Name),\+logical_operator(Name),Fact=Term).

group_symbols(Events,Entries) :-
    findall(S-detail(A,R,P,E),member(S-A-R-P-E,Events),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),maplist(symbol_entry,Groups,Entries).
symbol_entry(Symbol-Details,Entry) :-
    findall(A,(member(detail(A,_,_,_),Details),integer(A)),As),sort(As,Arities),
    findall(R,member(detail(_,R,_,_),Details),Rs),sort(Rs,Roles),
    findall(P,member(detail(_,_,P,_),Details),Ps),sort(Ps,Polarities),
    findall(Evidence,(member(detail(A,R,P,E),Details),
       Evidence=E.put(evidence{arity:A,role:R,polarity:P})),AllEvidence),
    sort(AllEvidence,Unique),length(Unique,Count),take_samples(Unique,Evidence),
    Entry=symbol{symbol:Symbol,arities:Arities,roles:Roles,polarities:Polarities,
                 evidenceCount:Count,evidence:Evidence}.
take_samples(List,Sample) :- length(Prefix,12),(append(Prefix,_,List)->Sample=Prefix;Sample=List).

mt_analysis(Source,Dialect,Records,Events,RecordCoverage,MTs,Contexts,Reasons) :-
    findall(Mt-E,context_evidence(Records,Mt,E),Content),
    length(Records,Count),length(Content,ContextCount),
    (RecordCoverage==complete,ContextCount=:=Count->Contexts=complete;Contexts=partial),
    local_mt_schema(Records,Types,Positions),
    (Dialect==metta->Declared=[],Refs=null,Outbound=null
    ;findall(Mt-E,mt_declaration(Records,Types,Mt,E),Declared),
     append(Content,Declared,Known0),pairs_keys(Known0,Known1),sort(Known1,Known),
     findall(Mt-E,mt_reference(Events,Known,Positions,Mt,E),RefEvents),group_mts(RefEvents,Refs)),
    append(Content,Declared,ProvidedEvents),group_mts(ProvidedEvents,Provided),
    (Refs==null->true;exclude(provided_mt(Provided),Refs,Outbound)),
    implied_candidate(Source,Candidate),implied_state(Candidate,Content,Contexts,Implied),
    MTs=microtheories{provided:Provided,referenced:Refs,outbound:Outbound,missingImplied:Implied},
    Base=[reason{code:external_mt_schema_unknown,
       message:"MT references use recorded MT values and established/local schema, not filename suffix guesses or a global ontology scan."},
      reason{code:declaration_only_contexts_not_retained,
       message:"Caches do not retain empty in-microtheory directives; provider/context evidence is limited to cached assertions."}],
    (Contexts==complete->Reasons=Base
    ;Reasons=[reason{code:incomplete_context_evidence,
         message:"A complete record set with one valid MT per assertion was not supplied."}|Base]).

context_evidence(Records,Mt,E) :-
    member(Record,Records),Record=record(Id,_,Metadata),
    findall(M,member(xc_microtheory(Id,M),Metadata),[Mt]),
    usable_mt(Mt),record_evidence(Record,Base),E=Base.put(via,assertion_context).
usable_mt(Mt) :-
    ground(Mt),(atom(Mt);compound(Mt)),\+is_list(Mt),\+is_dict(Mt),
    catch(context_key(Mt,_),error(domain_error(microtheory_term,_),_),fail).

local_mt_schema(Records,Types,Positions) :-
    findall(Super-Sub,(asserted_fact(Records,Fact,_),Fact=x_genls(Sub,Super),
                      atom(Sub),atom(Super)),TypeEdges),
    vertices_edges_to_ugraph([x_Microtheory],TypeEdges,TypeGraph),
    reachable(x_Microtheory,TypeGraph,Types),
    findall(Super-Sub,(asserted_fact(Records,Fact,_),Fact=x_genlPreds(Sub,Super),
                      atom(Sub),atom(Super)),PredEdges),
    vertices_edges_to_ugraph([],PredEdges,PredGraph),
    findall(position(P,N,Via),
      (asserted_fact(Records,Fact,E),typed_position(Fact,Super,N,Type),
       memberchk(Type,Types),(reachable(Super,PredGraph,Descendants)->true;Descendants=[]),
       sort([Super|Descendants],Predicates),member(P,Predicates),
       Via=schema_evidence{declaration:E,predicate:Super,position:N,valueType:Type}),Local),
    append([position(x_ist,1,established_ist_context),
            position(x_genlMt,1,established_genlMt_argument),
            position(x_genlMt,2,established_genlMt_argument)],Local,Positions).
typed_position(Fact,P,N,Type) :-
    compound(Fact),Fact=..[Name,P|Args],atom(P),
    (memberchk(Name,[x_argIsa,x_domain]),Args=[N,Type]
    ;atom_concat(x_arg,Rest,Name),atom_concat(Digits,'Isa',Rest),Args=[Type],
     atom_codes(Digits,Codes),Codes\=[],maplist(decimal_digit,Codes),atom_number(Digits,N)),
    integer(N),N>0,atom(Type).
decimal_digit(C) :- between(0'0,0'9,C).

mt_declaration(Records,Types,Mt,E) :-
    asserted_fact(Records,Fact,Base),Fact=x_isa(Mt,Type),
    atom(Type),memberchk(Type,Types),usable_mt(Mt),E=Base.put(via,microtheory_declaration).
mt_reference(Events,Known,_,Mt,E) :-
    member(constant(Mt,R,P,Base),Events),memberchk(Mt,Known),
    E=Base.put(evidence{via:known_mt_value,role:R,polarity:P}).
mt_reference(Events,Known,_,Mt,E) :-
    member(application(Mt,R,P,Base),Events),ground(Mt),memberchk(Mt,Known),
    E=Base.put(evidence{via:known_mt_value,role:R,polarity:P}).
mt_reference(Events,_,Positions,Mt,E) :-
    member(application(Term,R,P,Base),Events),Term=..[Name|Args],
    member(position(Name,N,Schema),Positions),nth1(N,Args,Mt),usable_mt(Mt),
    E=Base.put(evidence{via:typed_mt_argument,role:R,polarity:P,position:N,schema:Schema}).

group_mts(Events,Entries) :-
    findall(Key-(Mt-E),(member(Mt-E,Events),context_key(Mt,Key)),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),maplist(mt_entry,Groups,Entries).
mt_entry(Key-Pairs,Entry) :-
    Pairs=[Mt-_|_],term_line(Mt,Canonical),
    pairs_values(Pairs,Evidence0),sort(Evidence0,Unique),length(Unique,Count),
    take_samples(Unique,Evidence),
    Entry=microtheory{key:Key,canonical:Canonical,evidenceCount:Count,evidence:Evidence}.
provided_mt(Provided,Entry) :- member(Local,Provided),Local.key==Entry.key,!.
implied_candidate(Source,Candidate) :-
    atom_string(File,Source),file_base_name(File,Base),
    (file_name_extension(Stem,_,Base)->true;Stem=Base),
    downcase_atom(Stem,Lower),
    (member(Suffix,[psc,mt,microtheory,kb]),atom_concat(_,Suffix,Lower)->
       Full=Stem
    ;atom_concat(Stem,'Mt',Full)),
    encode_symbol(Full,Candidate).
candidate_source_name(Source,Header,Name) :-
    % Windows canonical paths lose case. Recover only the spelling of the same
    % basename from provenance; never use a historical, differently named file.
    (current_prolog_flag(windows,true),get_dict(source,Header,Original),atom(Original),
     atom_string(Path,Source),file_base_name(Path,Base),file_base_name(Original,Recorded),
     downcase_atom(Base,Lower),downcase_atom(Recorded,Lower)->Name=Recorded
    ;Name=Source).
implied_state(Candidate,Content,Coverage,Info) :-
    findall(E,(member(Mt-E,Content),Mt==Candidate),Evidence),length(Evidence,Count),
    (Count>0->Status=present,Number=Count
    ;Coverage==complete->Status=missing,Number=0
    ;Status=unknown,Number=null),
    Info=implied{candidate:Candidate,status:Status,scope:cached_assertion_contexts,
                 contentAssertions:Number}.
