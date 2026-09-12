:- begin_tests(dependency_resolution_runtime).
:- use_module('../kb_dependency_resolution').
:- use_module('../kb_dependency_resolution_catalog').
:- use_module('../kb_cache').
:- use_module('../kb_runtime',[]).
:- use_module('../kb_store',[]).
:- use_module('../kb_index',[]).
:- use_module('../kb_non_atomic',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).

fixture(Dir,Source,Cache,Locator,File) :-
    source_file(plunit_dependency_resolution_runtime:fixture(_,_,_,_,_),Here),
    file_directory_name(Here,Tests),uuid(U),atom_concat('.dependency-report-',U,Name),
    directory_file_path(Tests,Name,Dir),make_directory_path(Dir),
    directory_file_path(Dir,'fixture.krf',Source),atom_concat(Source,'.data',Cache),
    setup_call_cleanup(open(Source,write,S,[encoding(utf8)]),
      write(S,'deliberately invalid source ((('),close(S)),
    file_digest(Source,Hash),size_file(Source,Size),
    H=cache{source:Source,sourceHash:Hash,dialect:krf,mappingHash:none,
      options:[],mtPolicy:filename_v1,implementationHash:Hash,lineCount:1,sizeBytes:Size,warnings:[]},
    Meta=[xc_microtheory(a1,x_TestMt),xc_source_file(a1,'KBs/original.krf'),
          xc_source_line(a1,12),xc_kb_names(a1,["?X","?X"])],
    Semantic=x_and(x_forAll(A,x_q(A)),x_forAll(B,x_p(B))),
    NatMeta=[xc_microtheory(a2,x_TestMt),xc_source_file(a2,'KBs/original.krf'),
             xc_source_line(a2,13),xc_kb_names(a2,[])],
    write_cache(Cache,H,[record(a1,Semantic,Meta),record(a2,x_uses(x_Fn(x_a)),NatMeta)],_),
    setup_call_cleanup(open(Cache,read,In,[encoding(utf8),newline(posix)]),
      (kb_cache:read_line_term(In,_,_),kb_cache:read_line_term(In,_,_),
       stream_property(In,position(Position)),stream_position_data(byte_count,Position,Offset)),close(In)),
    Locator=r(1,a1,12,x_TestMt,["?X","?X"],Offset,[],[]),
    File=file{path:Source,normalized:Cache}.
cleanup(Dir) :- delete_directory_and_contents(Dir).
native_fixture(Dir,Cache,Module,Refs) :-
    fixture(Dir,Source,Cache,_,_),uuid(U),atom_concat(dep_fixture_,U,Module),
    kb_runtime:native_load(Cache,Module),
    assertz(kb_store:source_module(Source,Module,Cache),SourceRef),
    assertz(kb_store:source_info(Source,json{sourceHash:fixture,outputHash:fixture}),InfoRef),
    findall(Ref,(kb_runtime:module_assertion(Module,Id,Semantic,_),
      kb_index:semantic_constants(Semantic,Constants),
      member(Key,Constants),assertz(kb_store:constant_locator(Key,Id),Ref)),IndexRefs),
    kb_non_atomic:term_schema([x_resultIsa(x_Fn,x_Thing)],Schema),
    kb_non_atomic:annotated_semantic_ast(x_uses(x_Fn(x_a)),[],Schema,AST),
    assertz(kb_store:assertion(a2,json{module:Module,expression:AST}),DataRef),
    Refs=[SourceRef,InfoRef,DataRef|IndexRefs].
cleanup_native(Dir,Cache,Refs) :-
    maplist(erase,Refs),kb_runtime:native_unload(Cache),cleanup(Dir).
posting_fixture(Text,Digest) :-
    Rows=[r(1,a1,12,x_TestMt,[],0,[h([head],predicate_symbol,semantic)],[])],
    kb_cache:terms_digest([posting(x_p,Rows)],RowDigest),
    kb_cache:terms_digest([RowDigest],Digest),
    with_output_to(string(Text),
      (write_one_line(current_output,postings_header(1,fixture)),
       write_one_line(current_output,posting(x_p,Rows,RowDigest)),
       write_one_line(current_output,postings_footer(Digest)))).
scan_posting_text(Text,Identity,Digest,Limit,Keys,State) :-
    setup_call_cleanup(open_string(Text,S),
      kb_dependency_resolution_catalog:scan_source_terms(S,Identity,Digest,x_TestMt,Limit,Keys,State),
      close(S)).

test(actual_serialized_seek_keeps_lexical_variable_identity,
     [setup(fixture(D,Source,Cache,L,File)),cleanup(cleanup(D))]) :-
    file_digest(Source,Before),read_cache(Cache,_,_),
    read_locator(File,L,false,row(S,E)),
    S=x_and(x_forAll(A,x_q(Q)),x_forAll(B,x_p(P))),
    assertion(A==Q),assertion(B==P),assertion(A\==B),
    assertion(var(A)),assertion(var(B)),assertion(E.names==["?X","?X"]),
    assertion(ground(E)),assertion(E.loaded==false),assertion(E.line==12),
    file_digest(Source,After),assertion(Before==After),
    directory_files(D,Files),sort(Files,Sorted),
    assertion(Sorted==['.','..','fixture.krf','fixture.krf.data']).
test(locator_wrong_id_fails_closed,
     [setup(fixture(D,_,_,L,File)),cleanup(cleanup(D)),
      throws(error(dependency_catalog_clause_identity(a2),_))]) :-
    L=r(N,_,Line,Mt,Names,Offset,Hits,Defs),
    read_locator(File,r(N,a2,Line,Mt,Names,Offset,Hits,Defs),false,_).
test(raw_directive_is_not_executed,
     [setup(fixture(D,_,Cache,_,File)),cleanup(cleanup(D)),
      throws(error(dependency_catalog_clause_identity(a1),_))]) :-
    setup_call_cleanup(open(Cache,write,S,[encoding(utf8)]),
      write(S,':- throw(must_not_execute).\n'),close(S)),
    read_locator(File,r(1,a1,1,x_TestMt,[],0,[],[]),false,_).
test(deadline_is_not_swallowed) :-
    catch(kb_dependency_resolution:catalog_failure(time_limit_exceeded,_,_,_),Error,true),
    assertion(Error==time_limit_exceeded).
test(compound_deadline_is_not_swallowed) :-
    catch(kb_dependency_resolution:catalog_failure(time_limit_exceeded(60),_,_,_),Error,true),
    assertion(Error==time_limit_exceeded(60)).
test(wrapped_deadline_is_not_swallowed) :-
    catch(kb_dependency_resolution:catalog_failure(error(time_limit_exceeded,host),_,_,_),Error,true),
    assertion(Error==error(time_limit_exceeded,host)).
test(cancellation_is_not_swallowed,[throws(error(dependency_report_cancelled,_))]) :-
    kb_dependency_resolution:catalog_failure(error(dependency_report_cancelled,none),_,_,_).
test(source_error_remains_typed) :-
    kb_dependency_resolution:catalog_failure(error(catalog_stale('KBs/test.krf'),none),Rows,Page,Issue),
    assertion(Rows==[]),assertion(Page.rows==partial),assertion(Issue.code==catalog_stale).
test(no_faked_mutation_or_absence_capability) :-
    report_capabilities(C),assertion(C.policyPersistence.available==false),
    assertion(C.loading.available==false),assertion(C.globalAbsenceCertification.available==false),
    assertion(ground(C)).
test(missing_mt_rejected,[throws(error(existence_error(key,mt,_),_))]) :-
    kb_dependency_resolution:request(json{term:x_p},_).
test(unbounded_term_scan_rejected,[throws(error(type_error(between(1,20),21),_))]) :-
    kb_dependency_resolution:request(json{mt:x_TestMt,termLimit:21},_).
test(failed_jobs_are_retryable) :-
    Meta=job{state:failed},
    setup_call_cleanup(assertz(kb_dependency_resolution:report_job(failed_id,same,Meta,none),Ref),
      assertion(\+kb_dependency_resolution:start_locked(same,_,_,_,_,failed_id,true)),erase(Ref)).
test(cancelled_job_observed_without_native_mutation) :-
    setup_call_cleanup(assertz(kb_dependency_resolution:cancellation(fixture),Ref),
      catch(kb_dependency_resolution:check_cancel(fixture),Error,true),erase(Ref)),
    assertion(Error=error(dependency_report_cancelled,_)).
test(native_snapshot_reads_indexed_semantics_and_releases_lease,
     [setup(native_fixture(D,Cache,_,Refs)),cleanup(cleanup_native(D,Cache,Refs))]) :-
    setup_call_cleanup(kb_dependency_resolution:capture(Snapshot,Sources),
      (kb_dependency_resolution:native_rows([x_p],Sources,10,Rows,State),
       assertion(State==complete),assertion(Rows\=[]),
       Rows=[row(S,E)|_],assertion(E.loaded==true),assertion(E.mt==x_TestMt),
       term_variables(S,Vars),assertion(Vars\=[]),
       kb_dependency_resolution:native_rows([x_p],Sources,10,[row(Again,_)|_],_),
       term_variables(Again,Other),Vars=[First|_],Other=[Fresh|_],assertion(First\==Fresh)),
      kb_store:release_query_snapshot(Snapshot)),
    assertion(\+kb_store:query_snapshot(Snapshot.id,_,_,_)).
test(native_snapshot_cleanup_on_exception,
     [setup(native_fixture(D,Cache,_,Refs)),cleanup(cleanup_native(D,Cache,Refs))]) :-
    catch(setup_call_cleanup(kb_dependency_resolution:capture(Snapshot,_),
      throw(fixture_exception),kb_store:release_query_snapshot(Snapshot)),fixture_exception,true),
    assertion(\+kb_store:query_snapshot(_,_,_,_)).
test(capture_failure_releases_native_lease,
     [setup(native_fixture(D,Cache,_,Refs)),cleanup(cleanup_native(D,Cache,Refs))]) :-
    file_name_extension(Source,data,Cache),
    setup_call_cleanup(assertz(kb_store:source_info(Source,invalid_info),Bad),
      catch(kb_dependency_resolution:capture(_,_),_,true),erase(Bad)),
    assertion(\+kb_store:query_snapshot(_,_,_,_)).
test(ordinary_indexed_facts_merge_without_instantiating_evidence) :-
    E=evidence{id:a1,source:'KBs/test.krf',origin:validated_catalog,mt:x_TestMt},
    kb_dependency_resolution:merge_rows([],[row(x_p(X),E)],Rows,Issues),
    assertion(Rows=[row(x_p(_),E)]),assertion(Issues==[]),assertion(var(X)).
test(catalogue_root_types_do_not_trigger_global_posting_scans) :-
    E=evidence{mt:x_TestMt,dialect:krf},
    kb_dependency_resolution:support_keys(term,x_p,x_TestMt,
      [row(x_isa(x_p,x_Predicate),E)],Keys),assertion(Keys==[]).
test(collection_hierarchy_still_follows_a_root_class_when_required) :-
    E=evidence{mt:x_TestMt,dialect:krf},
    kb_dependency_resolution:support_keys(term,x_Class,x_TestMt,
      [row(x_genls(x_Class,x_Collection),E)],Keys),
    assertion(Keys==[wanted(term,x_Collection)]).
test(oversized_term_postings_are_skipped_not_eagerly_parsed) :-
    assertion(\+kb_dependency_resolution_catalog:bounded_posting(p(source,0,2001,3000,1,0))),
    assertion(\+kb_dependency_resolution_catalog:bounded_posting(p(source,0,10,10001,1,0))),
    assertion(kb_dependency_resolution_catalog:bounded_posting(p(source,0,10,100,1,0))).
test(selected_source_reader_accepts_actual_posting_header_and_footer) :-
    posting_fixture(Text,Digest),
    scan_posting_text(Text,fixture,Digest,2,Keys,State),
    assertion(Keys==[x_p]),assertion(State==complete).
test(selected_source_reader_marks_a_prefix_bounded) :-
    posting_fixture(Text,Digest),
    scan_posting_text(Text,fixture,Digest,1,Keys,State),
    assertion(Keys==[x_p]),assertion(State==bounded).
test(selected_source_reader_rejects_wrong_identity,
     [throws(error(invalid_dependency_postings_header,_))]) :-
    posting_fixture(Text,Digest),scan_posting_text(Text,wrong,Digest,2,_,_).
test(selected_source_reader_rejects_wrong_footer,
     [throws(error(invalid_dependency_postings_footer,_))]) :-
    posting_fixture(Text,_),scan_posting_text(Text,fixture,wrong,2,_,_).
test(native_nat_uses_existing_annotation_and_loaded_constant_index,
     [setup(native_fixture(D,Cache,_,Refs)),cleanup(cleanup_native(D,Cache,Refs))]) :-
    kb_non_atomic:non_atomic_key(x_Fn(x_a),Key),
    setup_call_cleanup(kb_dependency_resolution:capture(Snapshot,Sources),
      (findall(P,member(source(_,P,_),Sources),Roots),
       assertion(kb_dependency_resolution:native_use(Key,x_TestMt,Sources,Roots)),
       kb_dependency_resolution:native_rows([Key,x_Fn],Sources,10,Rows,State),
       assertion(State==complete),assertion(Rows=[row(x_uses(x_Fn(x_a)),_)]),
       Rows=[row(_,E)],assertion(E.loaded==true),assertion(E.id==a2)),
      kb_store:release_query_snapshot(Snapshot)).
test(unevidenced_ast_application_is_not_a_nat) :-
    assertion(\+kb_dependency_resolution:ast_nat_key(
      json{denotesNat:false,natCandidate:true,natKey:null},_)).

:- end_tests(dependency_resolution_runtime).
