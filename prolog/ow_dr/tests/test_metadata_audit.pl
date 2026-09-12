:- begin_tests(metadata_audit).
:- use_module('../kb_store',[]).
:- use_module('../kb_metadata_audit',[]).
:- use_module('../kb_metadata_policy',[]).
:- use_module('../kb_runtime',[]).
:- use_module('../kb_cache',[]).
:- use_module('../kb_terms',[]).
:- use_module('../kb_activity',[]).
:- use_module('../kb_term_roles',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(prolog_wrap)).
:- use_module(library(time)).

fixture(Count,Origin,Raw,fixture(Directory,Source,Module,Native,Ids)) :-
    source_file(plunit_metadata_audit:fixture(_,_,_,_),Here),
    file_directory_name(Here,Tests),directory_file_path(Tests,artifacts,Root),
    make_directory_path(Root),uuid(UUID),directory_file_path(Root,UUID,Directory),
    make_directory_path(Directory),atom_concat(audit_fixture_,UUID,Module),
    (Origin==sumo->Name='custom.kif';Origin==unknown->Name='other.kif';Name='source.krf'),
    directory_file_path(Directory,Name,Source),
    directory_file_path(Directory,'native.data',Native),
    kb_cache:helper_path(Helper),
    flag(metadata_audit_fixture_ids,Offset,Offset+Count),
    findall(Id,(between(1,Count,N),Value is Offset+N+1048576,
                format(atom(Id),'a~16r',[Value])),Ids),
    setup_call_cleanup(open(Native,write,S,[encoding(utf8),newline(posix)]),
      (kb_cache:write_one_line(S,(:-use_module(Helper),kb_tail_loader:load_remaining)),
       forall(nth1(N,Ids,Id),
         (semantic(N,Semantic),kb_cache:guarded_clause(Id,Semantic,Clause),
          kb_cache:write_one_line(S,Clause),metadata(Id,Source,N,Metadata),
          maplist(kb_cache:write_one_line(S),Metadata)))),close(S)),
    kb_runtime:native_load(Native,Module),
    assertz(kb_store:source_info(Source,
      info{source:Source,sourceOrigin:Origin,count:Count,lineCount:Count,
           sizeBytes:0,status:cache_hit,warnings:[],elapsed:0})),
    assertz(kb_store:source_module(Source,Module,Native)),
    forall(nth1(N,Ids,Id),
      (semantic(N,Semantic),metadata(Id,Source,N,Metadata),
       kb_store:activate_record(Source,Module,record(Id,Semantic,Metadata)),
       (Raw==true->inject_original(Module,Id);true))).

semantic(N,x_fixture(N)).
metadata(Id,Source,N,[xc_microtheory(Id,x_AuditMt),xc_source_file(Id,Source),
  xc_source_line(Id,N),xc_kb_names(Id,[]),xc_creator(Id,alice),
  xc_cnf(Id,canonical([positive(p,a)]))]).
inject_original(Module,Id) :-
    length(Codes,2048),maplist(=(120),Codes),string_codes(Text,Codes),
    assertz(Module:'xc_cyc::original-formula'(Id,Text)),
    retract(kb_store:assertion(Id,Data)),
    assertz(kb_store:assertion(Id,
      Data.put(properties,[_{name:'cyc::original-formula',value:Text}|Data.properties]))).
dispose(fixture(Directory,Source,Module,Native,Ids)) :-
    forall(member(Id,Ids),
      (retractall(kb_store:assertion(Id,_)),retractall(kb_store:constant_locator(_,Id)),
       retractall(kb_store:mt_locator(_,Id)))),
    retractall(kb_store:source_module(Source,_,_)),retractall(kb_store:source_info(Source,_)),
    retractall(Module:'xc_cyc::original-formula'(_,_)),
    kb_runtime:native_unload(Native),delete_directory_and_contents(Directory).
row(Report,Origin,Store,Row) :-
    member(Row,Report.byOrigin),Row.origin==Origin,Row.store==Store,!.
no_leases :-
    assertion(\+kb_store:query_snapshot(_,_,_,_)),
    assertion(\+kb_store:native_query_refs(_,_)),
    kb_activity:activity_status(A),assertion(A.active==0),assertion(A.exclusive==false).

fixture_sources(Files,Assertions,Fixtures) :-
    Base is Assertions//Files,Extra is Assertions mod Files,
    findall(Count,(between(1,Files,N),(N=<Extra->Count is Base+1;Count=Base)),Counts),
    maplist(fixture_source,Counts,Fixtures).
fixture_source(Count,Fixture) :- fixture(Count,non_sumo,false,Fixture).

test(actual_native_allocation_and_separate_serialization,
     [setup(fixture(2,non_sumo,true,F)),cleanup(dispose(F))]) :-
    F=fixture(_,_,Module,_,_),
    kb_metadata_audit:audit([serialized(all)],Report),
    row(Report,non_sumo,native,Native),row(Report,non_sumo,json,Json),
    assertion(Native.propertyCount==14),assertion(Native.redundantPropertyCount==2),
    assertion(Json.propertyCount==14),assertion(Json.redundantPropertyCount==2),
    findall(Bytes,
      (kb_metadata_audit:native_property_predicate(Module,_,Head),
       clause(Module:Head,true,Ref),clause_property(Ref,size(Bytes))),Sizes),
    sum_list(Sizes,Actual),
    assertion(Native.liveClauseBytes==Actual),
    assertion(Native.predicateAllocatedBytes>=Actual),
    assertion(Native.serializedUtf8Bytes>Native.redundantSerializedUtf8Bytes),
    assertion(Native.redundantSerializedUtf8Bytes>4096),
    assertion(Json.redundantLiveClauseBytes==null),
    assertion(Json.predicateAllocatedBytes==null),
    assertion(Json.redundantTermCells>0),assertion(Report.metrics.rssMeasured==false),
    no_leases.

test(sumo_originals_and_intentional_cnf_remain,
     [setup(fixture(2,sumo,true,F)),cleanup(dispose(F))]) :-
    kb_metadata_audit:audit([],Before),row(Before,sumo,native,Native),
    assertion(Native.propertyCount==14),assertion(Native.redundantPropertyCount==0),
    kb_store:apply_metadata_retention(Before.identity,Result),
    assertion(Result.changed==false),assertion(Result.removed.nativeProperties==0),
    no_leases.

test(unknown_origin_uses_the_approved_drop_policy,
     [setup(fixture(1,unknown,true,F)),cleanup(dispose(F))]) :-
    kb_metadata_audit:audit([],Before),row(Before,unknown,native,Native),
    assertion(Native.redundantPropertyCount==1),
    kb_store:apply_metadata_retention(Before.identity,Result),
    assertion(Result.removed.nativeProperties==1),assertion(Result.removed.jsonProperties==1),
    F=fixture(_,_,Module,_,[Id]),
    kb_runtime:module_metadata(Module,cnf,Id,canonical([positive(p,a)])),no_leases.

test(pure_legacy_origin_does_not_read_sources) :-
    kb_metadata_audit:source_origin('missing.krf',_{sourceOrigin:sumo},non_sumo),
    kb_metadata_audit:source_origin('missing.metta',_{mappingMode:sumo},non_sumo),
    kb_metadata_audit:source_origin('tinyKB.kif',_{},sumo),
    kb_metadata_audit:source_origin('other.kif',_{},unknown),
    kb_metadata_audit:source_origin('other.kif',_{mappingMode:sumo},sumo).

test(serialization_is_utf8_and_buffer_reuse_truncates) :-
    setup_call_cleanup(kb_metadata_audit:new_memory_file(Buffer),
      (kb_metadata_audit:serialized_bytes(Buffer,"λ😀",UnicodeBytes),
       assertion(UnicodeBytes==10),
       kb_metadata_audit:serialized_bytes(Buffer,x,ShortBytes),
       assertion(ShortBytes==3)),
      kb_metadata_audit:free_memory_file(Buffer)).

test(cleanup_measures_actual_live_clause_reduction_and_preserves_semantics,
     [setup(fixture(2,non_sumo,true,F)),cleanup(dispose(F))]) :-
    F=fixture(_,_,Module,_,[Id|_]),
    kb_runtime:module_assertion(Module,Id,Semantic,Ref),
    kb_runtime:query_modules([Module],x_fixture(1),x_AuditMt,5,1,ProofBefore),
    kb_metadata_audit:audit([],Before),
    kb_store:apply_metadata_retention(Before.identity,Result),
    assertion(Result.changed==true),
    assertion(Result.removed.nativeProperties==2),assertion(Result.removed.jsonProperties==2),
    assertion(Result.after.identity==Result.before.identity),
    row(Result.before,non_sumo,native,NativeBefore),row(Result.after,non_sumo,native,NativeAfter),
    row(Result.before,non_sumo,json,JsonBefore),row(Result.after,non_sumo,json,JsonAfter),
    assertion(NativeAfter.liveClauseBytes<NativeBefore.liveClauseBytes),
    assertion(JsonAfter.liveClauseBytes<JsonBefore.liveClauseBytes),
    kb_runtime:module_assertion(Module,Id,Semantic,Ref),
    kb_runtime:module_metadata(Module,creator,Id,alice),
    kb_runtime:module_metadata(Module,cnf,Id,canonical([positive(p,a)])),
    kb_runtime:module_metadata(Module,kb_names,Id,[]),
    kb_runtime:query_modules([Module],x_fixture(1),x_AuditMt,5,1,ProofAfter),
    assertion(ProofBefore==ProofAfter),no_leases.

test(zero_removal_is_a_real_noop,
     [setup(fixture(1,non_sumo,false,F)),cleanup(dispose(F))]) :-
    F=fixture(_,Source,_,_,[Id]),
    clause(kb_store:assertion(Id,_),true,RowRef),
    clause(kb_store:source_info(Source,_),true,InfoRef),
    kb_metadata_audit:audit([],Before),
    kb_store:apply_metadata_retention(Before.identity,Result),
    assertion(Result.changed==false),assertion(Result.removed.nativeProperties==0),
    assertion(Result.removed.jsonProperties==0),
    clause(kb_store:assertion(Id,_),true,RowRef),
    clause(kb_store:source_info(Source,_),true,InfoRef),no_leases.

test(derived_cache_invalidation_only_after_actual_cleanup,
     [setup(fixture(1,non_sumo,true,F)),
      cleanup((kb_term_roles:clear_term_role_cache,dispose(F)))]) :-
    kb_store:generation(G),
    assertz(kb_term_roles:cached_index(G,legacy{original:"obsolete payload"}),OldRef),
    kb_metadata_audit:audit([],Before),
    clause(kb_term_roles:cached_index(_,_),true,OldRef),
    kb_store:apply_metadata_retention(Before.identity,Changed),
    assertion(Changed.changed==true),assertion(\+kb_term_roles:cached_index(_,_)),
    assertz(kb_term_roles:cached_index(G,fixture{compact:true}),NewRef),
    kb_store:apply_metadata_retention(Before.identity,Unchanged),
    assertion(Unchanged.changed==false),
    clause(kb_term_roles:cached_index(_,_),true,NewRef).

test(stale_audit_rejected,
     [setup(fixture(1,non_sumo,true,F)),cleanup(dispose(F)),
      throws(error(metadata_retention_stale_audit(_),_))]) :-
    kb_metadata_audit:audit([],Before),
    Stale=Before.identity.put(generation,-1),
    kb_store:apply_metadata_retention(Stale,_).

test(missing_source_info_is_an_error,
     [setup(fixture(1,non_sumo,false,F)),cleanup(dispose(F)),
      throws(error(metadata_audit_source_info(_),_))]) :-
    F=fixture(_,Source,_,_,_),retractall(kb_store:source_info(Source,_)),
    kb_metadata_audit:audit([],_).

test(duplicate_json_ids_cannot_hide_a_missing_row,
     [setup(fixture(2,non_sumo,false,F)),cleanup(dispose(F)),
      throws(error(metadata_audit_duplicate_json_assertion(_),_))]) :-
    F=fixture(_,_,_,_,[First,Second]),
    kb_store:assertion(First,Data),assertz(kb_store:assertion(First,Data)),
    retractall(kb_store:assertion(Second,_)),
    kb_metadata_audit:audit([],_).

test(application_admission_is_required,
     [setup(fixture(1,non_sumo,true,F)),cleanup(dispose(F))]) :-
    kb_metadata_audit:audit([],Before),
    setup_call_cleanup(kb_activity:acquire_application(audit_busy_test),
      (catch(kb_store:apply_metadata_retention(Before.identity,_),Error,true),
       assertion(Error=error(application_reload_busy,_))),
      kb_activity:release_application(audit_busy_test)),
    no_leases.

test(transaction_rolls_back_failed_cleanup,
     [setup(fixture(1,non_sumo,true,F)),cleanup(dispose(F))]) :-
    F=fixture(_,_,Module,_,[Id]),kb_metadata_audit:audit([],Before),
    setup_call_cleanup(
      wrap_predicate(kb_store:retain_source_metadata(_,_),audit_fail,Wrapped,
        (call(Wrapped),throw(audit_fixture_failure))),
      (catch(kb_store:apply_metadata_retention(Before.identity,_),Error,true),
       assertion(Error==audit_fixture_failure)),
      unwrap_predicate(kb_store:retain_source_metadata(_,_),audit_fail)),
    kb_runtime:module_metadata(Module,'cyc::original-formula',Id,_),
    kb_metadata_audit:audit([],After),
    row(Before,non_sumo,native,B),row(After,non_sumo,native,A),
    assertion(A.liveClauseBytes==B.liveClauseBytes),no_leases.

pause_audit(Main) :-
    thread_self(Worker),thread_send_message(Main,audit_entered(Worker)),
    thread_get_message(audit_continue).
wait_result(Id,Reply) :-
    call_with_time_limit(5,wait_result_loop(Id,Reply)).
wait_result_loop(Id,Reply) :-
    kb_metadata_audit:status(Id,Current),
    (memberchk(Current.state,[queued,running])->sleep(0.01),wait_result_loop(Id,Reply);Reply=Current).
pause_hook(Main) :-
    wrap_predicate(kb_metadata_audit:measure_native(_,_,_,_,_),audit_pause,Wrapped,
      (plunit_metadata_audit:pause_audit(Main),call(Wrapped))).
unpause_hook :- unwrap_predicate(kb_metadata_audit:measure_native(_,_,_,_,_),audit_pause).
finish_paused_audit(Ticket) :-
    (nonvar(Ticket)->
      kb_metadata_audit:cancel(Ticket.id),
      catch(thread_send_message(Ticket.id,audit_continue),
        error(existence_error(Kind,_),Context),
        (memberchk(Kind,[thread,message_queue])->true;
          throw(error(existence_error(Kind,Ticket.id),Context)))),
      wait_result(Ticket.id,_)
    ;true).

test(async_snapshot_short_locks_and_generation_coherence,
     [setup(fixture(1,non_sumo,true,F)),cleanup(dispose(F))]) :-
    F=fixture(_,_,_,_,[Id]),thread_self(Main),kb_store:generation(G),
    setup_call_cleanup(pause_hook(Main),
      (kb_metadata_audit:start([],Ticket),
       thread_get_message(Main,audit_entered(Worker),[timeout(2)]),
       assertion(mutex_trylock(openworld_store)),mutex_unlock(openworld_store),
       kb_metadata_audit:status(Ticket.id,Status),assertion(Status.state==running),
       catch(kb_store:apply_metadata_retention(identity{generation:G},_),Busy,true),
       assertion(Busy=error(application_reload_busy,_)),
       transaction((retract(kb_store:assertion(Id,D)),
         kb_metadata_policy:filter_json_properties(non_sumo,D.properties,P),
         assertz(kb_store:assertion(Id,D.put(properties,P))),
         retractall(kb_store:generation(_)),Next is G+1,assertz(kb_store:generation(Next)))),
       thread_send_message(Worker,audit_continue),wait_result(Ticket.id,Done),
       assertion(Done.state==completed),assertion(Done.result.stale==true),
       row(Done.result,non_sumo,json,Json),assertion(Json.redundantPropertyCount==1)),
      (unpause_hook,finish_paused_audit(Ticket),
       retractall(kb_store:generation(_)),assertz(kb_store:generation(G)))),
    no_leases.

test(async_cancellation_releases_snapshot,
     [setup(fixture(1,non_sumo,true,F)),cleanup(dispose(F))]) :-
    thread_self(Main),
    setup_call_cleanup(pause_hook(Main),
      (kb_metadata_audit:start([],Ticket),
       thread_get_message(Main,audit_entered(Worker),[timeout(2)]),
       catch(kb_metadata_audit:start([],_),Busy,true),assertion(Busy=error(metadata_audit_busy(_),_)),
       kb_metadata_audit:cancel(Ticket.id),thread_send_message(Worker,audit_continue),
       wait_result(Ticket.id,Done),assertion(Done.state==cancelled)),
      (unpause_hook,finish_paused_audit(Ticket))),no_leases.

test(timeout_releases_snapshot,
     [setup(fixture(1,non_sumo,true,F)),cleanup(dispose(F))]) :-
    setup_call_cleanup(
      wrap_predicate(kb_metadata_audit:measure_native(_,_,_,_,_),audit_timeout,Wrapped,
        (sleep(0.2),call(Wrapped))),
      (kb_metadata_audit:start([seconds(0.03)],Ticket),wait_result(Ticket.id,Done),
       assertion(Done.state==timed_out)),
      unwrap_predicate(kb_metadata_audit:measure_native(_,_,_,_,_),audit_timeout)),
    no_leases.

test(realistic_size_streaming_audit,
     [setup(fixture_sources(55,16815,Fixtures)),cleanup(maplist(dispose,Fixtures))]) :-
    kb_metadata_audit:audit([seconds(30)],Report),
    assertion(Report.identity.assertions==16815),assertion(Report.identity.files==55),
    row(Report,non_sumo,native,Native),row(Report,non_sumo,json,Json),
    assertion(Native.propertyCount==100890),assertion(Json.propertyCount==100890),
    assertion(Native.redundantPropertyCount==0),assertion(Json.redundantPropertyCount==0),
    format(user_error,'~n16,815-row audit: ~3fs, native ~d clause bytes, JSON ~d clause bytes.~n',
      [Report.elapsedSeconds,Native.liveClauseBytes,Json.liveClauseBytes]),
    no_leases.

:- end_tests(metadata_audit).
