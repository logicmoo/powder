:- module(kb_definitional_patches,[preview/5,apply/5]).
:- use_module(kb_constraint_slots).
:- use_module(kb_reader,[]).
:- use_module(kb_runtime,[]).
:- use_module(kb_store,[]).
:- use_module(kb_compile,[]).
:- use_module(kb_cache,[]).
:- use_module(kb_ids,[]).
:- use_module(kb_metadata_policy,[]).
:- use_module(kb_paths,[]).
:- use_module(kb_catalog,[]).
:- use_module(kb_catalog_index,[]).
:- use_module(kb_activity,[]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(pairs)).
:- use_module(library(filesex)).
:- use_module(library(time)).
:- use_module(library(uuid)).

/** <module> Explicit, trusted, bounded record-completion workflow.

preview(+ProgramFile,+MT,+manifest(Root,Files)|catalog,+Generation,-Report).
apply/5 has the same arguments and publishes an immutable derived cache source.
Neither predicate is a KEE/web capability. Loading/indexing the program is inert.
There is no call/eval primitive; supported authored rules are validated as data.
Absence is relative to the explicit, fully read evidence manifest, never negation.
*/

preview(Program,Mt,Scope,Expected,Report) :-
    guarded(plan(Program,Mt,Scope,Expected,_,Report)).
apply(Program,Mt,Scope,Expected,Report) :-
    guarded(apply_locked(Program,Mt,Scope,Expected,Report)).

:- meta_predicate guarded(0).
guarded(Goal) :-
    kb_activity:with_application(
      with_mutex(openworld_code_reload,with_mutex(openworld_store,Goal))).

plan(Program0,Mt,Scope,Expected,Plan,Report) :-
    must_be(integer,Expected),must_be(ground,Mt),
    kb_store:checked_generation(Expected,_),
    call_with_time_limit(15,
      build_plan(Program0,Mt,Scope,Expected,Plan,Report)).

build_plan(Program0,Mt,Scope,Expected,Plan,Report) :-
    absolute_file_name(Program0,Program,[access(read)]),
    read_program(Program,Rules,Prototypes,ProgramHash),
    (kb_store:source_info(Program,ProgramInfo),ProgramInfo.sourceHash\==ProgramHash->
      patch_error(stale_loaded_program(Program));true),
    native_rows(Mt,Native),
    evidence(Scope,Mt,Native,Rows,Checks,Coverage),
    closure(Rules,Prototypes,Rows,Candidates,Decisions),
    length(Candidates,Count),
    Plan=plan{program:Program,programHash:ProgramHash,checks:Checks,
      candidates:Candidates,coverage:Coverage,mt:Mt},
    Report=patches{status:preview,generation:Expected,coverage:Coverage,
      additions:Candidates,count:Count,decisions:Decisions}.

read_program(File,Rules,Prototypes,Hash) :-
    kb_cache:file_digest(File,Hash),
    kb_reader:read_source(File,[diagnostics(false)],Assertions,Info),
    (Info.dialect==krf,Info.warnings==[]->true;patch_error(program_dialect_or_warnings(File))),
    check_hash(File,Hash),
    source_refs(File,Assertions,Refs),
    maplist(program_item,Assertions,Refs,Items),
    findall(R,member(rule(R),Items),Rules),
    findall(P,member(proto(P),Items),RawPrototypes),
    findall(C,member(constructor(C),Items),Constructors),
    findall(Rel,(member(R,Rules),Rel=R.relation),Relations0),sort(Relations0,Relations),
    (Relations==[x_genlFuncts,x_genlPreds],length(Rules,2),
      Constructors=[Constructor],RawPrototypes\==[]->true;patch_error(incomplete_patch_program(File))),
    % Constructor provenance is kept even though its primitive expansion is fixed.
    maplist(with_constructor(Constructor),RawPrototypes,Prototypes).
with_constructor(Constructor,Proto,WithConstructor) :-
    WithConstructor=Proto.put(constructor,Constructor).

program_item(assertion(Term,_,_,_,Props,_),Ref,Item) :-
    (forward_rule(Term,Relation)->
      require_direction(Props,':FORWARD',Ref),
      Item=rule(rule{relation:Relation,ref:Ref})
    ;constructor_rule(Term)->
      require_direction(Props,':BACKWARD',Ref),Item=constructor(Ref)
    ;nonvar(Term),Term='x_constraintTemplate-Proto'(Prototype)->
      require_direction(Props,':BACKWARD',Ref),
      (constraint_slot(Prototype,_),arg(1,Prototype,':P')->true;
        patch_error(unsupported_prototype(Ref,Prototype))),
      Item=proto(proto{term:Prototype,ref:Ref,constructor:_})
    ;patch_error(unsupported_patch_statement(Ref,Term))).

forward_rule(Term,Relation) :-
    member(Relation,[x_genlPreds,x_genlFuncts]),
    Edge=..[Relation,Specific,General],
    Expected='x_<=='(Post,x_constraintTemplate(General,Specific,Pre,Post),
      Edge,Pre,x_missingConstraintSlot(Post)),
    Term =@= Expected.
constructor_rule(Term) :-
    Term =@= 'x_<=='(x_constraintTemplate(General,Specific,Pre,Post),
      'x_constraintTemplate-Proto'(Orig),
      x_replaceMarker(Orig,':P',General,Pre),
      x_replaceMarker(Orig,':P',Specific,Post)).
require_direction(Props,Direction,Ref) :-
    (memberchk(direction-Direction,Props)->true;patch_error(direction_required(Ref,Direction))).

native_rows(Mt,Rows) :-
    findall(e(Term,Mt,Ref,loaded,Kind),
      (kb_store:source_info(Source,Info),
       kb_store:source_module(Source,Module,_),
       kb_runtime:module_assertion(Module,Id,Term,_),
       kb_runtime:module_metadata(Module,microtheory,Id,Context),Context==Mt,
       kb_runtime:module_metadata(Module,source_line,Id,Line),
       (get_dict(definitionalPatch,Info,true)->Kind=derived;Kind=authored),
       Ref=ref{source:Source,line:Line,id:Id}),Rows).

evidence(manifest(Root0,Inputs),Mt,Native,Rows,Checks,Coverage) :- !,
    absolute_file_name(Root0,Root,[file_type(directory),access(read)]),
    must_be(list,Inputs),maplist(absolute_source,Inputs,Paths0),sort(Paths0,Paths),
    verify_manifest(Root,Paths),
    require_loaded_coverage(Native,Paths),
    maplist(read_evidence(Mt),Paths,Chunks,CheckGroups),append(Chunks,Parsed),
    append(CheckGroups,Checks),
    verify_native_rows(Parsed,Native),
    include(derived_row,Native,Derived),append(Parsed,Derived,Rows),
    Coverage=coverage{kind:directory_manifest,complete:true,root:Root,sources:Paths,mt:Mt},
    verify_loaded_sources(Paths,Checks).
evidence(catalog,Mt,Native,Rows,Checks,Coverage) :- !,
    % This adapter reuses the authoritative catalog identity/locators, not a
    % second mapping or parser. Every source is validated before asserting absence.
    catalog_snapshot(Catalog,Revision),
    (Catalog.coverage.complete==true->true;patch_error(incomplete_catalog(Catalog.coverage))),
    kb_catalog:directory_manifest('KBs',_,Manifest),pairs_keys(Manifest,Paths),
    sort(Paths,Sorted),sort(Catalog.expected,SortedExpected),
    (Sorted==SortedExpected->true;patch_error(stale_catalog_manifest)),
    kb_compile:implementation_hash(Implementation),
    maplist(verify_catalog_file(Implementation),Catalog.files,CheckGroups),
    append(CheckGroups,Checks),
    findall(P,(member(File,Catalog.files),P=File.identity.source),Absolute),
    require_loaded_coverage(Native,Absolute),
    verify_loaded_sources(Absolute,Checks),
    % Exact-term postings cannot prove absence: a variable target or a
    % higher-order executable head need not mention the candidate's symbol.
    % Read all unloaded validated records, or hit the budget and fail closed.
    maplist(catalog_rows(Mt),Catalog.files,Chunks),append(Chunks,Providers),
    append(Native,Providers,Rows),
    Coverage=coverage{kind:catalog,complete:true,revision:Revision,mt:Mt}.
evidence(Scope,_,_,_,_,_) :- patch_error(unsupported_coverage(Scope)).

absolute_source(Input,Path) :-
    absolute_file_name(Input,Path,[access(read)]),
    kb_reader:source_dialect(Path,Dialect),
    (memberchk(Dialect,[kif,krf,metta])->true;patch_error(source_dialect(Path))).
derived_row(e(_,_,_,_,derived)).
require_loaded_coverage(Native,Paths) :-
    forall(member(e(_,_,Ref,loaded,authored),Native),
      (memberchk(Ref.source,Paths)->true;patch_error(uncovered_loaded_source(Ref.source)))).

read_evidence(Mt,Path,Rows,[check(Path,Hash),compiler(Path,Identity)]) :-
    kb_compile:cache_identity(Path,[],Identity),Hash=Identity.sourceHash,
    kb_reader:read_source(Path,[diagnostics(false)],Assertions,Info),
    (Info.warnings==[]->true;patch_error(source_warnings(Path,Info.warnings))),
    (Info.mappingHash==Identity.mappingHash->true;patch_error(mapping_changed(Path))),
    check_hash(Path,Hash),
    (kb_store:source_info(Path,_)->Loaded=loaded;Loaded=unloaded),
    source_refs(Path,Assertions,Refs),
    findall(e(Term,Mt,Ref,Loaded,authored),
      (nth1(N,Assertions,assertion(Term,_,Context,_,_,_)),Context==Mt,
       nth1(N,Refs,Ref)),Rows).
source_refs(Path,Assertions,Refs) :-
    empty_assoc(Counts),kb_ids:occurrence_keys(Assertions,Counts,_,Keys),
    (kb_store:source_module(Path,Module,_)->
      % Native physical order disambiguates duplicates, including same-line forms.
      findall(Physical-native(Id,Term,Mt,Line,Names),
        (kb_runtime:module_assertion(Module,Id,Term,Handle),
         clause_property(Handle,line_count(Physical)),
         kb_runtime:module_metadata(Module,microtheory,Id,Mt),
         kb_runtime:module_metadata(Module,source_line,Id,Line),
         kb_runtime:module_metadata(Module,kb_names,Id,Names)),Pairs),
      keysort(Pairs,Ordered),pairs_values(Ordered,Records),
      (maplist(native_source_ref(Path),Assertions,Keys,Records,Refs)->true;
        patch_error(stale_native_semantics))
    ;maplist(unloaded_source_ref(Path),Assertions,Keys,Refs)).
native_source_ref(Path,assertion(Term,Names,Mt,Line,_,_),Key,
                  native(Id,Native,Context,Location,OriginalNames),Ref) :-
    Term =@= Native,Mt==Context,Line==Location,Names==OriginalNames,
    Ref=ref{source:Path,line:Line,id:Id,occurrence:Key}.
unloaded_source_ref(Path,assertion(_,_,_,Line,_,_),Key,
                    ref{source:Path,line:Line,occurrence:Key}).
verify_loaded_sources(Paths,Checks) :-
    forall((member(Path,Paths),kb_store:source_info(Path,Info),memberchk(check(Path,Hash),Checks)),
      ((get_dict(sourceHash,Info,Hash)->true;patch_error(stale_loaded_source(Path))),
       (Info.warnings==[]->true;patch_error(loaded_source_warnings(Path))))).
verify_native_rows(Parsed,Native) :-
    findall(Row,(member(e(Term,_,Ref,loaded,authored),Parsed),Row=source(Ref.source,Ref.line,Term)),Expected),
    findall(Row,(member(e(Term,_,Ref,loaded,authored),Native),Row=source(Ref.source,Ref.line,Term)),Actual),
    canonical_rows(Expected,ExpectedKeys),canonical_rows(Actual,ActualKeys),
    (ExpectedKeys==ActualKeys->true;patch_error(stale_native_semantics)).
canonical_rows(Rows,Keys) :-
    maplist(row_digest,Rows,Keys0),msort(Keys0,Keys).
row_digest(Row,Digest) :- kb_cache:terms_digest([Row],Digest).
verify_catalog_file(Implementation,File,
                    [check(Path,Hash),check(Normal,NormalHash),compiler(Path,Recorded)]) :-
    (File.status==fresh->true;
      patch_error(stale_catalog_compiler(File.path))),
    kb_catalog_index:current_source(File),
    Path=File.identity.source,Hash=File.identity.sourceHash,
    Recorded=File.identity.compiler,
    verify_compiler(Implementation,Path,Recorded),
    Normal=File.normalized,NormalHash=File.identity.normalizedHash,
    (kb_store:source_info(Path,Info),Info.outputHash\==NormalHash->
      patch_error(stale_native_semantics);true).
catalog_snapshot(Catalog,Revision) :-
    kb_catalog_index:catalog_paths(Path,_),kb_cache:file_digest(Path,Revision),
    kb_catalog_index:read_catalog(Catalog),check_hash(Path,Revision).
catalog_rows(Mt,File,Rows) :-
    Path=File.identity.source,
    (kb_store:source_info(Path,_)->Rows=[];
      kb_cache:read_cache(File.normalized,Header,Records),
      (Header.warnings==[]->true;patch_error(source_warnings(Path,Header.warnings))),
      findall(e(Term,Mt,ref{source:Path,line:Line,id:Id},unloaded,authored),
        (member(record(Id,Term,Meta),Records),memberchk(xc_microtheory(Id,Context),Meta),Context==Mt,
         memberchk(xc_source_line(Id,Line),Meta)),Rows)).

closure(Rules,Prototypes,Rows,Added,Decisions) :-
    candidate_closure(Rules,Prototypes,Rows,Rows,[],Candidates,Blocked),
    exclude(conflicting_candidate(Candidates),Candidates,Safe),
    supported_closure(Safe,[],Added),
    maplist(candidate_decision(Candidates,Added),Candidates,Outcomes),
    append(Blocked,Outcomes,All),sort(All,Decisions).

% Tentative values are alternatives, never authoritative slot occupancy.
% Flat dependency references keep cycles finite until conflicts are resolved.
candidate_closure(Rules,Prototypes,Base,Rows,Seen,Candidates,Blocked) :-
    findall(C,candidate(Rules,Prototypes,Rows,C),Raw),sort(Raw,Current),
    partition_candidates(Current,Base,Eligible,Round),
    append(Seen,Eligible,Combined),sort(Combined,Next),
    (Next==Seen->Candidates=Seen,Blocked=Round
    ;maplist(candidate_signature,Next,Signatures),sort(Signatures,Unique),
     length(Unique,N),(N=<100->true;patch_error(addition_budget(100))),
     maplist(tentative_row,Next,Temp0),sort(Temp0,Temp),append(Base,Temp,More),
     candidate_closure(Rules,Prototypes,Base,More,Next,Candidates,Later),
     append(Round,Later,Blocked)).

partition_candidates([],_,[],[]).
partition_candidates([C|Rest],Rows,Eligible,Decisions) :-
    findall(Reason,blocking_row(C,Rows,Reason),Reasons0),sort(Reasons0,Reasons),
    (Reasons==[]->Eligible=[C|Tail],Decisions=Remaining
    ;Eligible=Tail,
     Decisions=[decision{post:C.post,key:C.key,status:blocked,reasons:Reasons}|Remaining]),
    partition_candidates(Rest,Rows,Tail,Remaining).
candidate_signature(C,slot_value(C.key,C.value)).
tentative_row(C,e(C.post,C.mt,ref{candidate:Signature,post:C.post},loaded,tentative)) :-
    candidate_signature(C,Signature).
conflicting_candidate(All,C) :-
    member(Other,All),Other.key==C.key,Other.value\==C.value,!.

supported_closure(Candidates,Accepted,Added) :-
    findall(Signature-Resolved,
      (member(C,Candidates),candidate_signature(C,Signature),
       \+accepted_signature(Accepted,Signature,_),
       resolve_candidate(C,Accepted,Resolved)),Pairs),
    keysort(Pairs,Sorted),group_pairs_by_key(Sorted,Groups),
    findall(C,member(_-[C|_],Groups),New),
    (New==[]->Added=Accepted
    ;append(Accepted,New,Next),supported_closure(Candidates,Next,Added)).
accepted_signature(Accepted,Signature,C) :-
    member(C,Accepted),candidate_signature(C,Existing),Existing==Signature,!.
resolve_candidate(C,Accepted,Resolved) :-
    C.basis=[Rule,Constructor,Proto,Edge,Premise],
    (get_dict(candidate,Premise,Signature)->
      accepted_signature(Accepted,Signature,Parent),
      candidate_row(Parent,e(_,_,Ref,_,_))
    ;Ref=Premise),
    Resolved=C.put(basis,[Rule,Constructor,Proto,Edge,Ref]).
candidate_decision(All,Accepted,C,Decision) :-
    findall(Post,(member(Other,All),Other.key==C.key,Other.value\==C.value,
      Post=Other.post),Alternatives0),sort(Alternatives0,Alternatives),
    (Alternatives\==[]->Status=conflict,Reasons=Alternatives
    ;candidate_signature(C,Signature),accepted_signature(Accepted,Signature,_)->
      Status=add,Reasons=[]
    ;Status=blocked,last(C.basis,Premise),
     Reasons=[unresolved_dependency{provider:Premise}]),
    Decision=decision{post:C.post,key:C.key,status:Status,reasons:Reasons}.

candidate(Rules,Prototypes,Rows,Candidate) :-
    member(Rule,Rules),Relation=Rule.relation,
    member(e(Edge,Mt,EdgeRef,loaded,_),Rows),ground(Edge),
    compound(Edge),compound_name_arguments(Edge,Relation,[Specific,General]),
    ground(Specific-General),Specific\==General,
    member(Proto0,Prototypes),copy_term(Proto0,Proto),
    replace_marker(Proto.term,':P',General,Pre),
    replace_marker(Proto.term,':P',Specific,Post),
    member(e(Fact,Mt,FactRef,loaded,_),Rows),
    compound(Fact),\+is_formula(Fact),copy_term(Fact,Fresh),Pre=Fresh,
    (ground(Post)->true;patch_error(nonground_candidate(Proto.ref,Post))),
    (constraint_slot(Post,Key),ground(Key)->true;patch_error(unsupported_candidate(Post))),
    compound_name_arguments(Post,_,Arguments),last(Arguments,Value),
    Candidate=candidate{post:Post,key:Key,mt:Mt,
      premise:Pre,edge:Edge,value:Value,
      basis:[Rule.ref,Proto.constructor,Proto.ref,EdgeRef,FactRef]}.

is_formula(Term) :-
    functor(Term,Head,_),memberchk(Head,[':-','x_<==',x_implies,'x_=>',x_equiv,'x_<=>',
      x_not,x_and,x_or,x_forAll,x_forall,x_thereExists,x_exists]).

candidate_row(C,e(C.post,C.mt,Ref,loaded,derived)) :-
    Ref=ref{derivedFrom:C.basis,post:C.post}.

blocking_row(C,Rows,Reason) :-
    member(e(Term,Mt,Ref,Loaded,_),Rows),Mt==C.mt,
    (constraint_slot(Term,Slot),unifiable(Slot,C.key,_)->
      Reason=occupied{provider:Ref,visibility:Loaded,expression:Term}
    ;(uncertain_slot(Term,C.key);malformed_slot(Term,C.key))->
      Reason=unknown{provider:Ref,visibility:Loaded,expression:Term}).
blocking_row(C,Rows,unknown_premise{provider:Ref,expression:Term}) :-
    constraint_slot(C.premise,Key),
    member(e(Term,Mt,Ref,_,_),Rows),Mt==C.mt,
    (uncertain_slot(Term,Key);malformed_slot(Term,Key)).
blocking_row(C,Rows,unknown_edge{provider:Ref,expression:Term}) :-
    member(e(Term,Mt,Ref,_,_),Rows),Mt==C.mt,
    (higher_order_target(Term,C.edge)
    ;compound(Term),is_formula(Term),sub_term(Sub,Term),nonvar(Sub),
     (unifiable(Sub,C.edge,_);higher_order_target(Sub,C.edge))).

uncertain_slot(Term,Key) :-
    Key=slot(_,[Target|_]),
    (higher_order_target(Term,target(Target))
    ;compound(Term),is_formula(Term),
     (sub_term(Sub,Term),nonvar(Sub),
      (constraint_slot(Sub,Slot),unifiable(Slot,Key,_)
      ;malformed_slot(Sub,Key)
      ;higher_order_target(Sub,target(Target)))
     ;Term=(Head:-_),var(Head))),!.
malformed_slot(Term,slot(Family,[Target|_])) :-
    constraint_family(Term,Family,ExistingTarget),unifiable(ExistingTarget,Target,_),
    \+constraint_slot(Term,_).
higher_order_target(Term,Pattern) :-
    nonvar(Term),compound(Term),compound_name_arguments(Term,t,[_Predicate|Args]),
    Args=[Target|_],arg(1,Pattern,Expected),unifiable(Target,Expected,_),
    (functor(Pattern,target,1)->true;
      compound_name_arguments(Pattern,_,ExpectedArgs),unifiable(Args,ExpectedArgs,_)).

apply_locked(Program,Mt,Scope,Expected,Report) :-
    plan(Program,Mt,Scope,Expected,Plan,Preview),
    (Plan.candidates==[]->Report=Preview.put(status,unchanged)
    ;verify_plan(Plan),publish(Plan,Expected,Output,Status),
      Report=Preview.put(_{status:applied,generation:Status.generation,source:Output})).
verify_plan(Plan) :-
    check_hash(Plan.program,Plan.programHash),
    kb_compile:implementation_hash(Implementation),
    maplist(verify_check(Implementation),Plan.checks),
    (Plan.coverage.kind==directory_manifest->
      verify_manifest(Plan.coverage.root,Plan.coverage.sources)
    ;catalog_snapshot(Catalog,Revision),
     (Revision==Plan.coverage.revision->true;patch_error(catalog_revision_changed)),
     kb_catalog:directory_manifest('KBs',_,Manifest),pairs_keys(Manifest,Paths),
     sort(Paths,Sorted),sort(Catalog.expected,Expected),
     (Sorted==Expected->true;patch_error(stale_catalog_manifest))).
verify_check(_,check(Path,Hash)) :- check_hash(Path,Hash).
verify_check(Implementation,compiler(Path,Recorded)) :-
    verify_compiler(Implementation,Path,Recorded).
verify_compiler(Implementation,Path,Recorded) :-
    kb_compile:with_prepared_source(Path,Implementation,
     kb_compile:cache_identity(Path,Recorded.options,Current)),
    (kb_compile:identity_matches(Current,Recorded)->true;
     patch_error(stale_catalog_compiler(Path))).
verify_manifest(Root,Paths) :-
    kb_compile:discover_sources([Root],Discovered),
    maplist(absolute_source,Discovered,Current0),sort(Current0,Current),
    (Current==Paths->true;patch_error(incomplete_directory_manifest(Root,Current))).
check_hash(Path,Hash) :-
    kb_cache:file_digest(Path,Current),
    (Current==Hash->true;patch_error(source_changed(Path))).

publish(Plan,Expected,Output,Status) :-
    kb_paths:app_dir(App),directory_file_path(App,'.logos-state/definitional-patches',Directory),
    make_directory_path(Directory),uuid(UUID),atom_concat(UUID,'.pl',Name),
    directory_file_path(Directory,Name,Output),
    directory_file_path(App,'.logos-state',IdDir),make_directory_path(IdDir),
    length(Plan.candidates,Count),
    kb_ids:reserve_ids(IdDir,Count,Ids),
    maplist(patch_record(Plan),Plan.candidates,Ids,Records),
    kb_compile:implementation_hash(Implementation),
    Header=cache{source:Plan.program,sourceHash:Plan.programHash,
      normalizedFile:Output,implementationHash:Implementation,dialect:krf,
      mappingHash:none,mtPolicy:filename_v1,options:[],lineCount:0,sizeBytes:0,
      warnings:[],sourceOrigin:non_sumo,patchCoverage:Plan.coverage,
      patchInputs:Plan.checks,patchSchema:slot_presence_v1},
    kb_cache:stage_path(Output,Stage),
    setup_call_cleanup(true,
      (kb_cache:write_cache(Stage,Header,Records,Written),
       kb_cache:read_cache(Stage,_,_),verify_plan(Plan),
       kb_cache:install_stage(Stage,Output),
       kb_cache:file_digest(Output,OutputHash),
       kb_metadata_policy:retention_policy(Policy),
       Info=result{source:Output,normalized:Output,outputHash:OutputHash,
         sourceHash:OutputHash,status:generated,count:Count,warnings:[],lineCount:0,
         sizeBytes:0,elapsed:0,sourceOrigin:non_sumo,retentionPolicy:Policy,
         definitionalPatch:true,patchCoverage:Written.patchCoverage},
       kb_store:stage_source(prepared(Output,Info,Records),Entry),
       setup_call_cleanup(true,
         (verify_plan(Plan),kb_store:publish_staged_addition([Entry],Expected,Status)),
         kb_store:cleanup_staged([Entry]))),
      kb_cache:remove_if_exists(Stage)).
patch_record(Plan,C,Id,record(Id,C.post,Metadata)) :-
    C.basis=[Rule|_],
    Metadata=[xc_microtheory(Id,C.mt),xc_source_file(Id,Plan.program),
      xc_source_line(Id,Rule.line),xc_kb_names(Id,[]),
      xc_creator(Id,'powder:definitional-patches'),xc_monotonicity(Id,':DEFAULT'),
      xc_patch_generated(Id,true),xc_patch_slot(Id,C.key),
      xc_patch_basis(Id,C.basis),xc_patch_program_hash(Id,Plan.programHash)].

patch_error(Reason) :- throw(error(definitional_patch(Reason),_)).
