:- module(kb_metadata_audit,
          [audit/2,start/2,status/2,cancel/1,collect_current/2,
           source_origin/3,source_ids/2]).
:- use_module(kb_activity, []).
:- use_module(kb_runtime, []).
:- use_module(kb_metadata_policy, []).
:- use_module(kb_cache, [terms_digest/2]).
:- use_module(library(aggregate)).
:- use_module(library(assoc)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(memfile)).
:- use_module(library(nb_set)).
:- use_module(library(option)).
:- use_module(library(pairs)).
:- use_module(library(time)).
:- use_module(library(uuid)).

/** <module> Coherent metadata allocation audit without a long store lock

audit(+Options,-Report) pins native modules using the existing query lease and
reads native facts and JSON assertion rows in one SWI database snapshot. Only
snapshot acquisition/release uses the store mutex. No payload/index is retained.
start/2, status/2 and cancel/1 provide bounded console calls for larger audits.
There is one detached, time-limited audit worker, and at most four small completed
reports. The registry is volatile; an active audit blocks saved-state capture
through the normal application/query leases.

Options: seconds(30) (0.01..120), serialized(none|redundant|all), default redundant.
clause_property(size) measures SWI's actual clause storage; predicate_property
size also includes indexes/administrative/possibly not-yet-reclaimed storage.
Neither is RSS or complete process memory. term_size counts the reconstructed
term's heap cells, excluding external atom storage, NOT stored clause bytes.
Serialization is an optional separate measurement, never a memory-saving claim.
*/

:- dynamic audit_job/4.
:- volatile audit_job/4.
:- thread_local audit_current_job/1.

audit(Options,Report) :-
    audit_options(Options,Seconds,_),
    call_with_time_limit(Seconds,
      kb_activity:with_application(kb_metadata_audit:pinned_audit(Options,Base))),
    kb_store:generation(Current),
    (Base.identity.generation=:=Current->Stale=false;Stale=true),
    Report=Base.put(_{currentGeneration:Current,stale:Stale}).

pinned_audit(Options,Report) :-
    setup_call_cleanup(kb_store:acquire_query_snapshot(Pin),
      snapshot(((kb_store:generation(Pin.generation)->true;
                 throw(error(metadata_audit_generation_changed,_))),
                collect_current(Options,Report))),
      kb_store:release_query_snapshot(Pin)).

audit_options(Options,Seconds,Serialized) :-
    must_be(list,Options),option(seconds(Seconds),Options,30),
    must_be(number,Seconds),
    (Seconds>=0.01,Seconds=<120->true;domain_error(metadata_audit_seconds,Seconds)),
    option(serialized(Serialized),Options,redundant),
    must_be(oneof([none,redundant,all]),Serialized),
    forall(member(Option,Options),
      (nonvar(Option),(Option=seconds(_);Option=serialized(_))->true;
       domain_error(metadata_audit_option,Option))).

start(Options,Ticket) :-
    audit_options(Options,_,_),uuid(UUID),atom_concat(metadata_audit_,UUID,Id),
    get_time(Started),
    with_mutex(powder_metadata_audit_jobs,register_job(Id,Started,Options)),
    Ticket=_{id:Id,state:queued}.

register_job(Id,Started,Options) :-
    findall(Other,(audit_job(Other,_,State,_),memberchk(State,[queued,running])),Active),
    (Active=[]->true;throw(error(metadata_audit_busy(Active),_))),
    trim_completed_jobs,assertz(audit_job(Id,Started,queued,none)),
    catch(thread_create(audit_worker(Id,Options),_,[alias(Id),detached(true)]),
      Error,(retractall(audit_job(Id,_,_,_)),throw(Error))).

audit_worker(Id,Options) :-
    catch((set_prolog_IO(user_input,user_output,user_error),
           set_job_result(Id,running,none),
           (thread_peek_message(metadata_audit_cancel(Id))->throw(metadata_audit_cancelled);true),
           (setup_call_cleanup(asserta(audit_current_job(Id),JobRef),
              audit(Options,Report),erase(JobRef))->Outcome=completed-Report;
            Outcome=failed-_{message:"Audit failed without a report."})),
      Error,audit_error(Error,Outcome)),
    Outcome=State-Result,set_job_result(Id,State,Result).

audit_error(metadata_audit_cancelled,cancelled-_{message:"Audit cancelled; leases released."}) :- !.
audit_error(time_limit_exceeded,timed_out-_{message:"Audit time limit exceeded; leases released."}) :- !.
audit_error(Error,failed-_{message:Message}) :-
    message_to_string(Error,Text),
    (string_length(Text,N),N>2000->sub_string(Text,0,2000,_,Message);Message=Text).

set_job_result(Id,State,Result) :-
    with_mutex(powder_metadata_audit_jobs,
      (retract(audit_job(Id,Started,_,_)),assertz(audit_job(Id,Started,State,Result)))).

status(Id,Reply) :-
    must_be(atom,Id),
    with_mutex(powder_metadata_audit_jobs,
      (audit_job(Id,Started,State,Result)->true;existence_error(metadata_audit,Id))),
    get_time(Now),Elapsed is max(0,Now-Started),
    Reply=_{id:Id,state:State,elapsedSeconds:Elapsed,result:Result}.

cancel(Id) :-
    must_be(atom,Id),
    with_mutex(powder_metadata_audit_jobs,
      (audit_job(Id,_,State,_)->true;existence_error(metadata_audit,Id))),
    (memberchk(State,[queued,running])->
      catch(thread_send_message(Id,metadata_audit_cancel(Id)),
        error(existence_error(Kind,Id),Context),
        (memberchk(Kind,[thread,message_queue]),status(Id,After),
         \+memberchk(After.state,[queued,running])->true;
         throw(error(existence_error(Kind,Id),Context))))
    ;true).

check_cancelled :-
    (audit_current_job(Id),thread_peek_message(metadata_audit_cancel(Id))->
      throw(metadata_audit_cancelled);true).

trim_completed_jobs :-
    findall(Id,(audit_job(Id,_,State,_),\+memberchk(State,[queued,running])),Completed),
    length(Completed,N),
    (N>=4,Completed=[Old|_]->retractall(audit_job(Old,_,_,_)),trim_completed_jobs;true).

% Pure: never inspect original/cache files, including legacy missing hints.
source_origin(Source,Info,Origin) :-
    (get_dict(sourceOrigin,Info,Hint)->true
    ;get_dict(mappingMode,Info,Mode)->kb_metadata_policy:mapping_origin(Mode,Hint)
    ;(get_dict(dialect,Info,Dialect)->true;
       file_name_extension(_,Ext,Source),downcase_atom(Ext,Dialect)),
     (get_dict(options,Info,Options)->true;Options=[]),
     kb_metadata_policy:source_mapping_mode(Source,Dialect,"",Options,Mode),
     (Mode==sumo->Hint=sumo;Mode==none->Hint=non_sumo;
      option(sumo_mappings(false),Options,true)->Hint=non_sumo;Hint=unknown)),
    kb_metadata_policy:origin_context(Info.put(_{source:Source,sourceOrigin:Hint}),Origin).

source_ids(Module,Ids) :-
    findall(Id,(kb_runtime:native_handle(Module,_,Id,Ref),
                \+clause_property(Ref,erased)),Ids).

% Internal host API: caller supplies either a DB snapshot + pinned modules or
% the exclusive source-mutation gate and both code/store mutexes.
collect_current(Options,Report) :-
    audit_options(Options,_,Serialized),
    statistics(walltime,[Start,_]),kb_store:generation(Generation),
    findall(source(Source,Module,Native),kb_store:source_module(Source,Module,Native),Registered),
    maplist(source_context,Registered,Sources),
    findall(Module-Origin,member(source(_,Module,_,Origin),Sources),ModulePairs),
    keysort(ModulePairs,SortedModules),list_to_assoc(SortedModules,ModuleOrigins),
    assoc_to_keys(ModuleOrigins,UniqueModules),length(UniqueModules,ModuleCount),
    length(Sources,FileCount),
    (ModuleCount=:=FileCount->true;throw(error(metadata_audit_duplicate_modules,_))),
    findall(Id-Module,(member(source(_,Module,_,_),Sources),
                      source_ids(Module,Ids),member(Id,Ids)),IdPairs),
    keysort(IdPairs,SortedIds),list_to_assoc(SortedIds,Ids),
    assoc_to_keys(Ids,UniqueIds),length(IdPairs,Count),length(UniqueIds,UniqueCount),
    (Count=:=UniqueCount->true;throw(error(metadata_audit_duplicate_assertion_ids,_))),
    sort(Sources,Manifest),
    terms_digest([Manifest],ManifestDigest),terms_digest([SortedIds],IdDigest),
    kb_metadata_policy:retention_policy(Policy),
    Identity=identity{generation:Generation,files:FileCount,assertions:Count,
      manifestDigest:ManifestDigest,assertionIdsDigest:IdDigest,policy:Policy},
    new_counters(Counters),
    setup_call_cleanup(new_memory_file(Buffer),
      (forall(member(source(_,Module,_,Origin),Sources),
         measure_native(Module,Origin,Counters,Serialized,Buffer)),
       measure_json(ModuleOrigins,Ids,Counters,Serialized,Buffer,RowCount)),
      free_memory_file(Buffer)),
    (RowCount=:=Count->true;
      throw(error(metadata_audit_assertion_count(Count,RowCount),_))),
    maplist(counter_report(Serialized),Counters,Rows),
    metadata_allocation(Counters,NativeAllocation),
    (predicate_property(kb_store:assertion(_,_),size(RowAllocation))->true;RowAllocation=0),
    current_prolog_flag(address_bits,Bits),WordBytes is Bits//8,
    statistics(walltime,[End,_]),Elapsed is max(0,(End-Start)/1000),
    Report=_{schema:'powder.metadata-audit.v1',identity:Identity,byOrigin:Rows,
      serialized:Serialized,termCellBytes:WordBytes,elapsedSeconds:Elapsed,
      runtimeAllocation:_{nativeMetadataPredicates:NativeAllocation,
                         assertionRowPredicate:RowAllocation,
                         metric:swipl_predicate_property_size},
      metrics:_{liveClauseBytes:swipl_clause_property_size,
                termCells:reconstructed_term_heap_cells,
                serializedBytes:canonical_prolog_utf8,
                rssMeasured:false}}.

source_context(source(Source,Module,Native),source(Source,Module,Native,Origin)) :-
    findall(Info,kb_store:source_info(Source,Info),Infos),
    (Infos=[Info]->source_origin(Source,Info,Origin);
      throw(error(metadata_audit_source_info(Source),_))).

new_counters(Rows) :-
    findall(row(Origin,Store,c(0,0,0,0,0,0,0,0,0,0)),
      (member(Origin,[sumo,non_sumo,unknown]),member(Store,[native,json])),Rows).
counter(Rows,Origin,Store,C) :- memberchk(row(Origin,Store,C),Rows).
increment(C,Slot,N) :- arg(Slot,C,Before),After is Before+N,nb_setarg(Slot,C,After).

measure_native(Module,Origin,Counters,Serialized,Buffer) :-
    check_cancelled,
    counter(Counters,Origin,native,C),source_ids(Module,Ids),
    length(Ids,Count),increment(C,1,Count),
    forall(native_property_predicate(Module,Name,Head),
      (predicate_property(Module:Head,size(Allocated)),increment(C,10,Allocated),
       (Origin\==sumo,kb_metadata_policy:redundant_property(Name)->Drop=true;Drop=false),
       forall(clause(Module:Head,true,Ref),
         (clause_property(Ref,size(Bytes)),increment(C,4,Bytes),
          (Drop==true->increment(C,5,Bytes);true),
          measure_property(Head,Drop,C,Serialized,Buffer))))).

native_property_predicate(Module,Name,Head) :-
    current_predicate(Module:Name/2),atom_concat(xc_,_,Name),
    functor(Head,Name,2),\+predicate_property(Module:Head,imported_from(_)),
    \+memberchk(Name,[xc_src,xc_clause_handle,xc_plvars,xc_indexed_constant]).

measure_json(ModuleOrigins,Ids,Counters,Serialized,Buffer,Count) :-
    empty_nb_set(Seen),Rows=count(0,Seen),
    forall(clause(kb_store:assertion(Id,Data),true,Ref),
      measure_json_row(ModuleOrigins,Ids,Counters,Serialized,Buffer,Rows,Id,Data,Ref)),
    arg(1,Rows,Count).

measure_json_row(ModuleOrigins,Ids,Counters,Serialized,Buffer,Rows,Id,Data,Ref) :-
    check_cancelled,
    (get_assoc(Data.module,ModuleOrigins,Origin),get_assoc(Id,Ids,Data.module)->true;
     throw(error(metadata_audit_unmanaged_assertion(Id),_))),
    arg(2,Rows,Seen),add_nb_set(Id,Seen,New),
    (New==true->true;throw(error(metadata_audit_duplicate_json_assertion(Id),_))),
    counter(Counters,Origin,json,C),increment(C,1,1),increment(Rows,1,1),
    clause_property(Ref,size(Bytes)),increment(C,4,Bytes),
    forall(member(Property,Data.properties),
      ((Origin\==sumo,kb_metadata_policy:redundant_property(Property.name)->Drop=true;Drop=false),
       measure_property(Property,Drop,C,Serialized,Buffer))).

measure_property(Term,Drop,C,Serialized,Buffer) :-
    check_cancelled,
    increment(C,2,1),term_size(Term,Cells),increment(C,6,Cells),
    (Drop==true->increment(C,3,1),increment(C,7,Cells);true),
    ((Serialized==all;Serialized==redundant,Drop==true)->
      serialized_bytes(Buffer,Term,Bytes),
      (Serialized==all->increment(C,8,Bytes);true),
      (Drop==true->increment(C,9,Bytes);true)
    ;true).

serialized_bytes(Buffer,Term,Bytes) :-
    copy_term(Term,Copy),numbervars(Copy,0,_),
    setup_call_cleanup(open_memory_file(Buffer,write,S,[encoding(utf8)]),
      write_term(S,Copy,[quoted(true),ignore_ops(true),numbervars(true),fullstop(true),nl(true)]),
      close(S)),
    size_memory_file(Buffer,Bytes,octet).

counter_report(Serialized,row(Origin,Store,C),Report) :-
    C=c(Assertions,Properties,Redundant,ClauseBytes,RedundantClauseBytes,
        Cells,RedundantCells,SerializedAll,SerializedRedundant,Allocated),
    ((Serialized==all;Properties=:=0)->AllBytes=SerializedAll;AllBytes=null),
    ((Serialized\==none;Redundant=:=0)->RedundantBytes=SerializedRedundant;RedundantBytes=null),
    counter_dict(Origin,Store,Assertions,Properties,Redundant,ClauseBytes,RedundantClauseBytes,
      Cells,RedundantCells,AllBytes,RedundantBytes,Allocated,Report).

counter_dict(Origin,Store,Assertions,Properties,Redundant,ClauseBytes,RedundantClauseBytes,
             Cells,RedundantCells,SerializedAll,SerializedRedundant,Allocated,Report) :-
    (Store==native->Scope=metadata_facts,RemovableBytes=RedundantClauseBytes,
                   AllocatedBytes=Allocated;
      Scope=whole_assertion_rows,RemovableBytes=null,AllocatedBytes=null),
    Report=_{origin:Origin,store:Store,assertions:Assertions,propertyCount:Properties,
      redundantPropertyCount:Redundant,liveClauseBytes:ClauseBytes,liveClauseScope:Scope,
      redundantLiveClauseBytes:RemovableBytes,predicateAllocatedBytes:AllocatedBytes,
      termCells:Cells,redundantTermCells:RedundantCells,
      serializedUtf8Bytes:SerializedAll,redundantSerializedUtf8Bytes:SerializedRedundant}.

metadata_allocation(Counters,Bytes) :-
    findall(N,(member(row(_,native,C),Counters),arg(10,C,N)),Ns),sum_list(Ns,Bytes).
