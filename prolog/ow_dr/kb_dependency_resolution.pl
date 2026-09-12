:- module(kb_dependency_resolution,
          [start_report/2,report_status/3,cancel_report/2,report_capabilities/1,
           run_report/2,clear_report_cache/0]).
:- use_module(kb_dependency_resolution_checks).
:- use_module(kb_dependency_resolution_catalog).
:- use_module(kb_dependency_resolution_policy).
:- use_module(kb_store,[]).
:- use_module(kb_runtime,[]).
:- use_module(kb_index,[]).
:- use_module(kb_activity,[]).
:- use_module(kb_catalog,[authorize_sources/2]).
:- use_module(kb_paths,[public_path/2,repo_root/1,cache_paths/3]).
:- use_module(kb_terms,[context_from_key/2,context_key/2]).
:- use_module(kb_non_atomic,[positive_fact/3]).
:- use_module(kb_catalog_schema,[]).
:- use_module(kb_cache,[terms_digest/2]).
:- use_module(library(apply)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(solution_sequences)).
:- use_module(library(time)).
:- use_module(library(uuid)).
:- dynamic report_job/4,cancellation/1.
:- volatile report_job/4,cancellation/1.
:- thread_local reporting_job/1.

/** Bounded, invocation-local analysis with one background worker. No HTTP routes
are installed here; the host wires the ready surface explicitly. The generation
lease retains native modules while analysis runs OUTSIDE the live-store mutex.
No compiler, query evaluator, provider builder or knowledge mutation is called. */

report_capabilities(Capabilities) :-
    default_policy(Policy),
    Capabilities=json{schema:'powder.dependency-resolution.v1',defaultPolicy:Policy,
    scopes:[loaded,selected],currentMtRequired:true,
    limits:json{terms:20,lookups:8,rowsPerLookup:25,seconds:60,history:8},
    policyPersistence:json{available:false,reason:authenticated_policy_save_not_registered},
    loading:json{available:false,reason:report_only_use_existing_source_pack_planner},
    globalAbsenceCertification:json{available:false,reason:bounded_pages_not_fresh_whole_catalog}}.

request(Input,Request) :-
    must_be(dict,Input),
    dict_pairs(Input,_,Pairs),
    forall(member(K-_,Pairs),(memberchk(K,[mt,term,roots,termLimit,termOffset,seconds,policy])->true;
       domain_error(dependency_report_option,K))),
    text_atom(Input.mt,Mt),context_from_key(Mt,_),
    option(Input,term,'',T0),text_atom(T0,T),
    (T==''->Term='';canonical_term(T,Term,_)),
    option(Input,roots,[],R0),must_be(list,R0),length(R0,RootsCount),
    (RootsCount=<16->true;domain_error(report_root_limit,RootsCount)),
    (R0==[]->Roots=[];authorize_sources(R0,Absolute),maplist(public_path,Absolute,Public),sort(Public,Roots)),
    option(Input,termLimit,10,Limit),must_be(between(1,20),Limit),
    option(Input,termOffset,0,Offset),must_be(between(0,480),Offset),
    option(Input,seconds,60,Seconds),must_be(number,Seconds),
    (Seconds>=1,Seconds=<60->true;domain_error(report_seconds,Seconds)),
    option(Input,policy,json{},P),normalize_policy(P,Policy),
    Request=request{mt:Mt,term:Term,roots:Roots,termLimit:Limit,
      termOffset:Offset,seconds:Seconds,policy:Policy}.

start_report(Input,Reply) :-
    request(Input,Request),catalog_identity(Catalog),
    with_mutex(openworld_store,kb_store:generation(Generation)),
    terms_digest([Request,Generation,Catalog],Key),get_time(Now),
    with_mutex(powder_dependency_reports,
      (prune_history(Now),start_locked(Key,Request,Catalog,Generation,Now,Id,Cached))),
    report_status(Id,json{},Status),Reply=Status.put(cacheHit,Cached).
start_locked(Key,_,_,_,_,Id,true) :-
    report_job(Id,Key,Meta,Report),
    (Meta.state==running;Meta.state==succeeded,resources_current(Report)),!.
start_locked(Key,Request,Catalog,Generation,Now,Id,false) :-
    (report_job(_,_,M,_),M.state==running->throw(error(dependency_report_busy,_));true),
    uuid(Id),
    Meta=job{id:Id,state:running,createdAt:Now,finishedAt:null,completedTerms:0,error:null},
    assertz(report_job(Id,Key,Meta,none)),
    catch(thread_create(worker(Id,Request,Catalog,Generation),_,
       [detached(true),stack_limit(536870912)]),Error,
       (retractall(report_job(Id,_,_,_)),throw(Error))).

worker(Id,Request,Catalog,Generation) :-
    catch(setup_call_cleanup(asserta(reporting_job(Id),Ref),
      kb_activity:with_application(
        kb_dependency_resolution:call_with_time_limit(Request.seconds,
          (run_checked(Id,Request,Catalog,Generation,_)->true;
             throw(error(dependency_analysis_failed,_))))),
      erase(Ref)),
      Error,job_error(Id,Error)).
run_report(Input,Report) :-
    request(Input,Request),catalog_identity(Catalog),
    kb_store:generation(Generation),
    kb_activity:with_application(
      kb_dependency_resolution:call_with_time_limit(Request.seconds,
        (run_checked(none,Request,Catalog,Generation,Report)->true;
           throw(error(dependency_analysis_failed,_))))).
run_checked(Id,Request,Catalog,Generation,Report) :-
    setup_call_cleanup(capture(Snapshot,Sources),
      (Snapshot.generation=:=Generation->analyze_snapshot(Id,Request,Catalog,Snapshot,Sources,Report);
       throw(error(dependency_generation_changed,_))),
      kb_store:release_query_snapshot(Snapshot)).
capture(Snapshot,Sources) :-
    with_mutex(openworld_store,
      (kb_store:acquire_query_snapshot(Pinned),
       catch(capture_metadata(Pinned,Snapshot,Sources),Error,
         (kb_store:release_query_snapshot(Pinned),throw(Error))))).
capture_metadata(Pinned,Snapshot,Sources) :-
       findall(source(Module,Public,Dialect),
         (kb_store:source_module(Path,Module,_),public_path(Path,Public),
          file_name_extension(_,Ext,Path),downcase_atom(Ext,Dialect)),Sources),
       findall(identity{source:Public,sourceHash:Hash,normalizedHash:Normal,
         fingerprintKind:legacy_compiler_fingerprint,rawSourceHash:Raw},
         (kb_store:source_info(Path,Info),public_path(Path,Public),
          option(Info,sourceHash,null,Hash),option(Info,outputHash,null,Normal),
          option(Info,rawSourceHash,null,Raw)),Identities),
       Snapshot=Pinned.put(sourceIdentities,Identities).

analyze_snapshot(Id,Request,Catalog,Snapshot,Sources,Report) :-
    (Request.roots==[]->ScopeKind=loaded,findall(P,member(source(_,P,_),Sources),Roots);
       ScopeKind=selected,Roots=Request.roots),
    selected_terms(Request,Catalog,Sources,Roots,Keys,Selection),
    Scope=scope{kind:ScopeKind,mt:Request.mt,roots:Roots,generation:Snapshot.generation,
      catalogRevision:Catalog.revision,taxonomyRevision:Catalog.taxonomy,
      loadedIdentities:Snapshot.sourceIdentities,
      semanticLayer:static_source_clauses_not_tva_entailment,
      selection:Selection,termOffset:Request.termOffset},
    native_rows([x_resultIsaArg],Sources,500,SchemaRows,SchemaState),
    Initial=state{lookups:0,seen:[],rows:SchemaRows,issues:[],nativeCoverage:SchemaState},
    analyze_keys(Keys,Id,Scope,Request,Catalog,Sources,Initial,_,[],Report),
    catalog_identity(After),
    (After==Catalog->true;throw(error(dependency_catalog_changed,_))),
    kb_store:generation(Current),
    (Current=:=Snapshot.generation->job_finish(Id,Report);
       throw(error(dependency_generation_changed,_))).

selected_terms(Request,Catalog,Sources,Roots,[Request.term],Selection) :-
    Request.term\=='',!,
    (native_use(Request.term,Request.mt,Sources,Roots)->Use=loaded,Usage=usage{state:loaded}
    ;Request.roots\==[],Catalog.available==true->
       root_usage(Request.term,Request.mt,Roots,Catalog,Usage),Use=Usage.state
    ;Use=not_established_in_loaded_roots,Usage=usage{state:Use}),
    Selection=selection{kind:single_term,term:Request.term,inUse:Use,usage:Usage,complete:true}.
selected_terms(Request,Catalog,Sources,Roots,Keys,Selection) :-
    Take is Request.termOffset+Request.termLimit+1,
    (Request.roots==[]->
       once(findnsols(Take,Key,distinct(Key,native_key(Sources,Roots,Request.mt,Key)),Candidates)),
       States=[loaded_index]
    ;findall(Result,(member(Root,Roots),check_cancel(none),
        source_terms(Root,Request.mt,Catalog,Take,Result)),Results),
     findall(Key,(member(Result,Results),member(Key,Result.terms)),Raw),
     list_to_set(Raw,Candidates),findall(S,(member(R,Results),S=R.coverage),States)),
    drop(Request.termOffset,Candidates,After),
    take(Request.termLimit,After,SemanticKeys),length(After,Count),
    (Count>Request.termLimit->More=true;More=false),
    Next is Request.termOffset+Request.termLimit,
    (More==true,Next=<480->NextOffset=Next;NextOffset=null),
    context_from_key(Request.mt,Context),canonical_term(Context,MtKey,_),
    (SemanticKeys==[]->Keys=[];list_to_set([MtKey|SemanticKeys],Keys)),
    Selection=selection{kind:in_use_slice,inUse:true,more:More,nextOffset:NextOffset,
      returned:SemanticKeys,sourceCoverage:States,complete:false}.
native_key(Sources,Roots,Mt,Key) :-
    member(source(Module,Path,_),Sources),memberchk(Path,Roots),
    kb_runtime:module_metadata(Module,microtheory,Id,Context),
    context_key(Context,Mt),
    native_assertion_key(Module,Id,Key).
native_assertion_key(_,Id,Key) :- kb_store:constant_locator(Key,Id).
native_assertion_key(Module,Id,Key) :-
    kb_store:assertion(Id,Data),Data.module==Module,ast_nat_key(Data.expression,Key).
ast_nat_key(AST,Key) :-
    is_dict(AST),
    (get_dict(denotesNat,AST,true),get_dict(natKey,AST,Key),atom(Key)
    ;dict_pairs(AST,_,Pairs),member(_-Value,Pairs),ast_nat_key(Value,Key)).
ast_nat_key(Values,Key) :- is_list(Values),member(Value,Values),ast_nat_key(Value,Key).
native_locator(Module,Key,Id) :-
    atom_concat('nat:',_,Key),!,
    canonical_term(Key,_,Term),
    (compound(Term),functor(Term,Head,_),atom_concat(x_,_,Head)->Seed=Head;
       kb_index:semantic_constants(Term,[Seed|_])),
    kb_store:constant_locator(Seed,Id),
    kb_store:assertion(Id,Data),Data.module==Module,once(ast_nat_key(Data.expression,Key)).
native_locator(_,Key,Id) :- kb_store:constant_locator(Key,Id).
native_use(Key,Mt,Sources,Roots) :-
    once((member(source(Module,Path,_),Sources),memberchk(Path,Roots),
      native_locator(Module,Key,Id),
      kb_runtime:module_metadata(Module,microtheory,Id,Context),context_key(Context,Mt)
    ;canonical_term(Key,_,Context),context_key(Context,Mt),
     member(source(Module,Path,_),Sources),memberchk(Path,Roots),
     kb_runtime:module_metadata(Module,microtheory,_,Context))).

analyze_keys([],_,Scope,Request,Catalog,_,State,State,Reports,Report) :-
    combined_report(Scope,Request,Catalog,State,Reports,Report).
analyze_keys([Key|Rest],Id,Scope,Request,Catalog,Sources,Before,After,Reports,Report) :-
    check_cancel(Id),
    collect_key(Key,Scope.mt,Catalog,Sources,Before,Collected),
    coverage(Catalog,Collected,Coverage),
    analyze_report(Scope,[Key],Collected.rows,Coverage,Request.policy,TermReport),
    append(Reports,[TermReport],Next),
    combined_report(Scope,Request,Catalog,Collected,Next,Partial),
    job_progress(Id,Partial),
    analyze_keys(Rest,Id,Scope,Request,Catalog,Sources,Collected,After,Next,Report).
collect_key(Key,Mt,Catalog,Sources,Before,After) :-
    collect_key_mode(term,Key,Mt,Catalog,Sources,Before,After).
collect_key_mode(_,Key,_,_,_,State,State) :- memberchk(Key,State.seen),!.
collect_key_mode(Mode,Key,Mt,Catalog,Sources,Before,After) :-
    cancel_checkpoint,
    native_rows([Key],Sources,1000,Native,NativeState),
    (Catalog.available==true,Before.lookups<8->
       catch(((catalog_evidence(Key,Catalog,25,Cached,Page)->true;
                throw(error(dependency_catalog_read_failed(Key),_))),Issue=none),
         Error,catalog_failure(Error,Cached,Page,Issue)),
       Count is Before.lookups+1
    ;Cached=[],Page=coverage{rows:partial},Issue=issue{code:catalog_lookup_unavailable_or_budget},
     Count=Before.lookups),
    merge_rows(Native,Cached,Rows,Conflicts),
    append(Before.rows,Rows,All),deduplicate_rows(All,Unique),
    findall(I,
      (I=Issue,I\==none
      ;member(I,Conflicts)
      ;Page.rows\==complete,I=issue{code:bounded_catalog_rows,term:Key}
      ;NativeState\==complete,I=issue{code:bounded_native_rows,term:Key}),Issues),
    append(Before.issues,Issues,AllIssues),
    Current=Before.put(state{seen:[Key|Before.seen],rows:Unique,issues:AllIssues,lookups:Count}),
    support_keys(Mode,Key,Mt,Rows,Parents),
    collect_parents(Parents,Mt,Catalog,Sources,Current,After).
collect_parents([],_,_,_,State,State).
collect_parents([wanted(Mode,Key)|Keys],Mt,Catalog,Sources,Before,After) :-
    (length(Before.seen,N),N<24,Key\==x_Thing->
       collect_key_mode(Mode,Key,Mt,Catalog,Sources,Before,Next);Next=Before),
    collect_parents(Keys,Mt,Catalog,Sources,Next,After).
support_keys(Mode,Key,Mt,Rows,Keys) :-
    findall(wanted(NextMode,Parent),
      (member(row(S,E),Rows),E.dialect\==metta,E.mt==Mt,positive_fact(S,F,_),
       F=..[Relation,Subject,Value],memberchk(Relation,[x_genls,x_isa]),
       ground(Subject-Value),canonical_term(Subject,K,_),K==Key,
       canonical_term(Value,Parent,_),
       (Relation==x_isa->NextMode=schema;NextMode=Mode),
       \+ (NextMode==schema,terminal_schema_type(Parent))),Raw),
    (canonical_term(Key,_,Term),compound(Term),functor(Term,Constructor,_)->
       sort([wanted(term,Constructor)|Raw],Keys);sort(Raw,Keys)).
terminal_schema_type(Key) :-
    (kb_catalog_schema:category_root(Key,_);memberchk(Key,[x_Relation,x_MetaRelation,x_Thing])).

native_rows(Keys,Sources,Limit,Rows,State) :-
    Take is Limit+1,
    once(findnsols(Take,row(Semantic,Evidence),
      distinct(Module-Id,
      (member(source(Module,Source,Dialect),Sources),member(Key,Keys),
       (native_locator(Module,Key,Id)
       ;canonical_term(Key,_,MtTerm),once(kb_runtime:module_metadata(Module,microtheory,Id,MtTerm))),
       kb_runtime:module_assertion(Module,Id,Semantic,_),
       kb_runtime:module_metadata(Module,microtheory,Id,Mt),context_key(Mt,MtKey),
       native_property(Module,source_file,Id,Original),native_property(Module,source_line,Id,Line),
       native_property(Module,kb_names,Id,Names),
       Evidence=evidence{id:Id,source:Source,originalSource:Original,line:Line,mt:MtKey,
         loaded:true,dialect:Dialect,names:Names,origin:loaded_generation})),Found)),
    length(Found,N),
    (N>Limit->take(Limit,Found,Rows),State=partial;Rows=Found,State=complete).
native_property(Module,Name,Id,Value) :-
    (kb_runtime:module_metadata(Module,Name,Id,Value)->true;Value=null).
merge_rows(Native,Cached,Rows,Conflicts) :-
    findall(Issue,
      (member(row(S,E),Native),member(row(T,C),Cached),E.id==C.id,
       same_path(E.source,C.source),(\+S=@=T;E.mt\==C.mt),
       Issue=issue{code:loaded_catalog_conflict,id:E.id,source:E.source}),Conflicts),
    exclude(native_duplicate(Native),Cached,Unloaded),append(Native,Unloaded,Rows).
native_duplicate(Native,row(S,C)) :-
    member(row(T,E),Native),E.id==C.id,same_path(E.source,C.source),S=@=T,E.mt==C.mt,!.
same_path(A,B) :- downcase_atom(A,Lower),downcase_atom(B,Lower).
deduplicate_rows(Rows,Unique) :-
    empty_assoc(Empty),foldl(unique_row,Rows,Empty,Index),assoc_to_values(Index,Unique).
unique_row(row(S,E),Before,After) :-
    put_assoc(E.source-E.id-E.origin,Before,row(S,E),After).
coverage(Catalog,State,coverage{catalogComplete:Complete,freshness:unknown,
    rows:partial,definitions:partial,relations:partial,returnInference:partial,
    mtDeclarations:partial,issues:Issues,lookups:State.lookups,
    providerCoverage:Catalog.providerCoverage,loadedRows:State.nativeCoverage,
    absencePolicy:fresh_complete_relevant_evidence_required}) :-
    (get_dict(complete,Catalog.coverage,true)->Complete=true;Complete=false),
    sort([issue{code:bounded_analysis_not_global_absence_proof}|State.issues],Issues).
combined_report(Scope,Request,Catalog,State,Reports,Report) :-
    coverage(Catalog,State,Coverage),
    findall(Item,(member(R,Reports),member(Item,R.items)),Items),
    length(Reports,Terms),length(Items,Count),
    Report=report{schema:'powder.dependency-resolution.v1',scope:Scope,coverage:Coverage,
      policy:Request.policy,policyRevision:Request.policy.revision,terms:Terms,total:Count,items:Items,
      readOnly:true,complete:false,
      limitations:[bounded_evidence_only,no_runtime_mt_inheritance,
        no_general_return_constraint_solver,no_native_implementation_verification,
        no_assertion_subset_or_fallback_declarations]}.

report_status(Input,Options,Reply) :-
    text_atom(Input,Id),
    with_mutex(powder_dependency_reports,
      (report_job(Id,_,Meta,Stored)->true;existence_error(dependency_report,Id))),
    (Stored==none->Report=null,Stale=false;
       report_page(Stored,Options,Report),kb_store:generation(Generation),
       catalog_identity(CurrentCatalog),
       (Generation=:=Stored.scope.generation,resources_current(Stored),
        CurrentCatalog.revision==Stored.scope.catalogRevision,
        CurrentCatalog.taxonomy==Stored.scope.taxonomyRevision->Stale=false;Stale=true)),
    Reply=json{job:Meta,report:Report,stale:Stale}.
cancel_report(Input,Reply) :-
    text_atom(Input,Id),
    with_mutex(powder_dependency_reports,
      ((report_job(Id,_,Meta,_)->true;existence_error(dependency_report,Id)),
       (Meta.state==running->
          (cancellation(Id)->true;assertz(cancellation(Id))),
          State=cancellation_requested;State=Meta.state))),
    Reply=json{id:Id,state:State}.
check_cancel(none) :- !.
check_cancel(Id) :- (cancellation(Id)->throw(error(dependency_report_cancelled,_));true).
job_progress(none,_) :- !.
job_progress(Id,Report) :-
    with_mutex(powder_dependency_reports,
      (retract(report_job(Id,Key,Meta,_)),
       assertz(report_job(Id,Key,Meta.put(completedTerms,Report.terms),Report)))).
job_finish(none,_) :- !.
job_finish(Id,Report) :-
    get_time(Now),
    with_mutex(powder_dependency_reports,
      (check_cancel(Id),retract(report_job(Id,Key,Meta,_)),
       Final=Meta.put(job{state:succeeded,finishedAt:Now,completedTerms:Report.terms}),
       assertz(report_job(Id,Key,Final,Report)),retractall(cancellation(Id)))).
job_error(Id,Error) :-
    typed_error(Error,Issue),get_time(Now),
    (Error=error(dependency_report_cancelled,_)->State=cancelled;
       deadline_error(Error)->State=timed_out;State=failed),
    with_mutex(powder_dependency_reports,
      (retract(report_job(Id,Key,Meta,Report)),
       Final=Meta.put(job{state:State,finishedAt:Now,error:Issue}),
       assertz(report_job(Id,Key,Final,Report)),retractall(cancellation(Id)))).
typed_error(Error,issue{code:Code,message:Message}) :-
    message_to_string(Error,Message),
    (Error=error(Form,_),compound(Form)->functor(Form,Code,_);
       Error=error(Form,_),atom(Form)->Code=Form;
       atom(Error)->Code=Error;Code=dependency_analysis_error).
catalog_failure(Error,_,_,_) :-
    (deadline_error(Error);Error=error(resource_error(_),_);
       Error=error(dependency_report_cancelled,_)),!,throw(Error).
catalog_failure(Error,[],coverage{rows:partial},Issue) :- typed_error(Error,Issue).
deadline_error(time_limit_exceeded).
deadline_error(time_limit_exceeded(_)).
deadline_error(error(time_limit_exceeded,_)).
deadline_error(error(time_limit_exceeded(_),_)).
cancel_checkpoint :-
    (reporting_job(Id)->check_cancel(Id);true).
resources_current(none) :- !.
resources_current(Report) :-
    findall(Source-Guard,
      ((member(F,Report.items),member(E,F.evidence);
        get_dict(selection,Report.scope,Selection),get_dict(usage,Selection,E)),
       get_dict(resourceGuard,E,Guard),Guard\==null,Source=E.source),Pairs),
    sort(Pairs,Unique),forall(member(Source-Guard,Unique),resource_current(Source,Guard)).
resource_current(Source,Guard) :-
    repo_root(Root),directory_file_path(Root,Source,Path),cache_paths(Path,Data,_),
    exists_file(Path),exists_file(Data),
    size_file(Path,Size),Size=:=Guard.sourceSize,
    time_file(Path,Time),Time=:=Guard.sourceModified,
    size_file(Data,DataSize),DataSize=:=Guard.dataSize,
    time_file(Data,DataTime),DataTime=:=Guard.dataModified.
prune_history(Now) :-
    forall((report_job(Id,_,M,_),M.state\==running,Now-M.finishedAt>300),
      (retractall(report_job(Id,_,_,_)),retractall(cancellation(Id)))),
    findall(Id,(report_job(Id,_,M,_),M.state\==running),Completed),
    length(Completed,N),Remove is max(0,N-7),take(Remove,Completed,Old),
    forall(member(Id,Old),(retractall(report_job(Id,_,_,_)),retractall(cancellation(Id)))).
clear_report_cache :-
    with_mutex(powder_dependency_reports,
      (report_job(_,_,M,_),M.state==running->throw(error(dependency_report_busy,_));
       retractall(report_job(_,_,_,_)),retractall(cancellation(_)))).
option(Dict,Key,Default,Value) :- (get_dict(Key,Dict,Value)->true;Value=Default).
text_atom(Input,Atom) :-
    (atom(Input)->Atom=Input;string(Input)->atom_string(Atom,Input);type_error(text,Input)).
take(0,_,[]) :- !.
take(_,[],[]) :- !.
take(N,[X|Xs],[X|Ys]) :- More is N-1,take(More,Xs,Ys).
drop(0,List,List) :- !.
drop(_,[],[]) :- !.
drop(N,[_|Xs],Ys) :- More is N-1,drop(More,Xs,Ys).
