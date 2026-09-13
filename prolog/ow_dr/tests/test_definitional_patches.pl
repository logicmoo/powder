:- begin_tests(definitional_patches).
:- use_module('../kb_definitional_patches',[]).
:- use_module('../kb_constraint_slots').
:- use_module('../kb_reader',[]).
:- use_module('../kb_compile',[]).
:- use_module('../kb_cache',[]).
:- use_module('../kb_store',[]).
:- use_module('../kb_paths',[]).
:- use_module(library(filesex)).
:- use_module(library(readutil)).
:- use_module(library(time)).

:- prolog_load_context(directory,Here),
   directory_file_path(Here,'../../../KBs/DefinationalPatches.krf',Relative),
   absolute_file_name(Relative,Program,[access(read)]),
   asserta(program_file(Program)).

write_source(File,Text) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),format(S,'~s',[Text]),close(S)).
fixture(Text,C) :-
    tmp_file(definitional_patches,RawDir),make_directory(RawDir),
    absolute_file_name(RawDir,Dir,[file_type(directory),access(read)]),
    directory_file_path(Dir,'prolog/ow_dr',App),make_directory_path(App),
    kb_paths:app_dir(OldApp),
    kb_compile:implementation_files(Implementation),
    Modules=['windows_catalog.ps1'|Implementation],
    forall(member(Module,Modules),
      (directory_file_path(OldApp,Module,From),directory_file_path(App,Module,To),copy_file(From,To))),
    kb_mappings:mapping_file(OldMapping),
    directory_file_path(App,docs,Docs),make_directory(Docs),
    directory_file_path(Docs,'sumo-cycl-mapping.md',Mapping),copy_file(OldMapping,Mapping),
    retractall(kb_mappings:mapping_file(_)),assertz(kb_mappings:mapping_file(Mapping)),
    retractall(kb_paths:app_directory(_)),
    assertz(kb_paths:app_directory(App)),
    directory_file_path(Dir,'KBs',Root),make_directory(Root),
    directory_file_path(Root,'facts.krf',File),
    string_concat("(in-microtheory TestMt)\n",Text,Source),write_source(File,Source),
    install_files([File],Dir),
    program_file(Program),kb_store:generation(G),
    C=ctx{dir:Dir,root:Root,file:File,program:Program,oldApp:OldApp,
      oldMapping:OldMapping,mapping:Mapping,generation:G}.
install_files(Files,Dir) :-
    maplist(prepare(Dir),Files,Entries),get_time(Start),
    kb_store:publish_staged_sources(Entries,any,Start,_).
prepare(Dir,File,Entry) :-
    kb_compile:compile_source(File,[state_dir(Dir),progress(none)],Result),
    (Result.status==busy->throw(error(fixture_busy(File),_));true),
    kb_store:prepare_source(Result,Prepared),kb_store:stage_source(Prepared,Entry).
cleanup(C) :-
    findall(P,kb_store:source_info(P,_),Paths),
    forall(member(P,Paths),
      (kb_store:source_info(P,_)->kb_store:generation(G),kb_store:unload_source(P,G,_);true)),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(C.oldApp)),
    retractall(kb_mappings:mapping_file(_)),assertz(kb_mappings:mapping_file(C.oldMapping)),
    delete_directory_and_contents(C.dir).
scope(C,manifest(C.root,Files)) :- kb_compile:discover_sources([C.root],Files).
preview(C,Report) :-
    scope(C,Scope),kb_store:generation(G),
    kb_definitional_patches:preview(C.program,x_TestMt,Scope,G,Report).
apply(C,Report) :-
    scope(C,Scope),kb_store:generation(G),
    kb_definitional_patches:apply(C.program,x_TestMt,Scope,G,Report).
post(Report,Post) :- member(C,Report.additions),C.post==Post.

test(actual_authored_program_consumed,
    [setup(fixture("(genlPreds Specific General)\n(argIsa General 1 Type)",C)),cleanup(cleanup(C))]) :-
    kb_cache:file_digest(C.program,Before),
    preview(C,R),assertion(R.count==1),
    assertion(post(R,x_argIsa(x_Specific,1,x_Type))),
    R.additions=[A],assertion(ground(A)),A.basis=[Rule,Constructor,Prototype,_,_],
    assertion(Rule.source==C.program),assertion(Constructor.line==19),
    assertion(Prototype.line==36),
    kb_cache:file_digest(C.program,After),assertion(Before==After).

test(same_and_different_value_block_slot,
    [setup(fixture("(genlPreds Specific General)\n(argIsa General 1 OtherType)\n(argIsa Specific 1 ExistingType)",C)),
     cleanup(cleanup(C))]) :-
    preview(C,R),assertion(R.count==0),
    assertion(member(decision{post:_,key:_,status:blocked,reasons:_},R.decisions)),
    apply(C,A),assertion(A.status==unchanged),
    assertion(A.generation==C.generation).

test(same_value_blocks,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 Type)\n(argIsa S 1 Type)",C)),cleanup(cleanup(C))]) :-
    preview(C,R),assertion(R.count==0).

test(sibling_slot_and_family_independence,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 Type)\n(argIsa S 2 Other)\n(argGenl S 1 Collection)",C)),
     cleanup(cleanup(C))]) :-
    preview(C,R),assertion(post(R,x_argIsa(x_S,1,x_Type))),assertion(R.count==1).

test(numbered_aliases_block_both_directions,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)\n(arg1Isa S B)\n(arg2Genl G A)\n(argGenl S 2 B)\n(argFormat G 3 SingleEntry)\n(arg3Format S Other)",C)),
     cleanup(cleanup(C))]) :-
    preview(C,R),assertion(R.count==0).

test(conditional_keys_keep_trigger_type_and_positions,
    [setup(fixture("(genlPreds S G)\n(interArgIsa1-2 G Trigger New)\n(interArgIsa1-2 S Trigger Existing)\n(interArgIsa1-3 G Trigger T3)\n(interArgIsa1-2 G OtherTrigger T2)",C)),
     cleanup(cleanup(C))]) :-
    preview(C,R),assertion(R.count==2),
    assertion(post(R,'x_interArgIsa1-3'(x_S,x_Trigger,x_T3))),
    assertion(post(R,'x_interArgIsa1-2'(x_S,x_OtherTrigger,x_T2))).

test(genl_functs_spelling_and_result_slot,
    [setup(fixture("(genlFuncts S G)\n(resultIsa G Type)\n(genlFuncs Wrong G)",C)),cleanup(cleanup(C))]) :-
    preview(C,R),assertion(R.count==1),assertion(post(R,x_resultIsa(x_S,x_Type))).

test(unloaded_provider_blocks_without_loading,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 Type)",C)),cleanup(cleanup(C))]) :-
    directory_file_path(C.root,'unloaded.krf',Other),
    write_source(Other,"(in-microtheory TestMt)\n(arg1Isa S Existing)"),
    preview(C,R),assertion(R.count==0),
    member(D,R.decisions),member(Reason,D.reasons),
    assertion(Reason.visibility==unloaded),assertion(same_file(Reason.provider.source,Other)),
    absolute_file_name(Other,Canonical,[access(read)]),
    assertion(\+kb_store:source_info(Canonical,_)).

test(incomplete_manifest_is_not_absence,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 Type)",C)),cleanup(cleanup(C)),
     throws(error(definitional_patch(incomplete_directory_manifest(_,_)),_))]) :-
    directory_file_path(C.root,'unloaded.krf',Other),write_source(Other,"(p a)"),
    kb_definitional_patches:apply(C.program,x_TestMt,manifest(C.root,[C.file]),C.generation,_).

test(mt_visibility,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 Type)\n(in-microtheory OtherMt)\n(argIsa S 1 Existing)",C)),
     cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.count==1),
    kb_store:query_text("(argIsa S 1 ?C)",x_TestMt,10,3,Q),assertion(length(Q.solutions,1)),
    kb_store:query_text("(argIsa S 1 ?C)",x_OtherMt,10,3,Other),assertion(length(Other.solutions,1)).

test(prototype_substitution_sharing_nested_literal_and_freshness) :-
    Orig=x_argIsa(':P',N,x_Fn(':P',T,T)),
    replace_marker(Orig,':P',x_G,Pre),replace_marker(Orig,':P',x_S,Post),
    Pre=x_argIsa(x_G,2,x_Fn(x_G,x_Type,x_Type)),
    assertion(Post==x_argIsa(x_S,2,x_Fn(x_S,x_Type,x_Type))),
    assertion(N==2),assertion(T==x_Type),
    program_file(P),kb_definitional_patches:read_program(P,_,Protos,_),
    once((member(Prototype,Protos),Prototype.term=x_argIsa(':P',Position,Value))),
    copy_term(Prototype,Copy),Copy.term=x_argIsa(':P',1,x_Chosen),
    assertion(var(Position)),assertion(var(Value)).

test(conflicting_parent_values_do_not_choose_arbitrarily,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)\n(argIsa G 1 B)",C)),cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.count==0),assertion(R.status==unchanged),
    assertion(member(decision{post:_,key:_,status:conflict,reasons:_},R.decisions)).

test(negative_or_executable_target_evidence_is_not_absence,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)\n(not (argIsa S 1 B))\n(argIsa G 2 A)\n(<=== (argIsa S 2 X) (unsupported X))",C)),
     cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.count==0),assertion(R.status==unchanged).

test(negative_parent_evidence_blocks_inheritance,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)\n(not (argIsa G 1 A))",C)),cleanup(cleanup(C))]) :-
    preview(C,R),assertion(R.count==0).

test(unsupported_program_is_error_not_absence,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C)),
     throws(error(definitional_patch(unsupported_patch_statement(_,_)),_))]) :-
    directory_file_path(C.dir,'bad.krf',Bad),write_source(Bad,"(<== ?Post (call ?Post))"),
    scope(C,Scope),kb_definitional_patches:apply(Bad,x_TestMt,Scope,C.generation,_).

test(broken_unloaded_source_is_error_not_absence,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C)),
     throws(error(source_error(_,_,_,_),_))]) :-
    directory_file_path(C.root,'bad.krf',Bad),write_source(Bad,"(broken"),
    apply(C,_).

test(nonground_candidate_rejected,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 ?Anything)",C)),cleanup(cleanup(C)),
     throws(error(definitional_patch(nonground_candidate(_,_)),_))]) :-
    apply(C,_).

test(apply_native_provenance_idempotence_and_cycle,
    [setup(fixture("(genlPreds S G)\n(genlPreds T S)\n(genlPreds G T)\n(argIsa G 1 A)",C)),
     cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.status==applied),assertion(R.count==2),
    kb_cache:read_cache(R.source,_,Records),assertion(length(Records,2)),
    forall(member(record(Id,_,Meta),Records),
      (assertion(memberchk(xc_monotonicity(Id,':DEFAULT'),Meta)),
       assertion(memberchk(xc_patch_generated(Id,true),Meta)),
       assertion(memberchk(xc_kb_names(Id,[]),Meta)),
       assertion(kb_store:assertion(Id,_)))),
    kb_store:query_text("(argIsa S 1 A)",x_TestMt,10,3,Q),assertion(length(Q.solutions,1)),
    apply(C,Again),assertion(Again.status==unchanged),assertion(Again.count==0),
    assertion(Again.generation==R.generation).

test(concurrent_apply_has_one_commit,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    scope(C,Scope),message_queue_create(Q),
    setup_call_cleanup(true,
      (thread_create(apply_thread(C,Scope,Q),A,[]),
       thread_create(apply_thread(C,Scope,Q),B,[]),
       thread_join(A,true),thread_join(B,true),
       thread_get_message(Q,One),thread_get_message(Q,Two),
       assertion((One=ok(_),Two=error(generation_conflict(_,_));Two=ok(_),One=error(generation_conflict(_,_)))),
       kb_store:query_text("(argIsa S 1 A)",x_TestMt,10,3,R),assertion(length(R.solutions,1))),
      message_queue_destroy(Q)).
apply_thread(C,Scope,Q) :-
    catch((kb_definitional_patches:apply(C.program,x_TestMt,Scope,C.generation,R),Result=ok(R)),
      error(Reason,_),Result=error(Reason)),thread_send_message(Q,Result).

test(compiled_program_remains_inert,
    [setup(fixture("(p A)",C)),cleanup(cleanup(C))]) :-
    directory_file_path(C.root,'DefinationalPatches.krf',Copy),copy_file(C.program,Copy),
    prepare(C.dir,Copy,Entry),get_time(Now),
    kb_store:publish_staged_sources([Entry],any,Now,_),
    kb_store:status(S),assertion(S.counts.assertions==72),
    kb_store:predicates(Predicates),
    assertion(\+member(_{term:'x_set-direction',arity:1,count:_},Predicates)),
    catch(kb_store:query_text("(constraintTemplate G S ?Pre ?Post)",x_DefinationalPatchesMt,5,3,_),
      Error,true),
    assertion(Error=error(existence_error(kb_predicate,x_constraintTemplate/4),_)).

test(authored_addition_retires_default_overlay,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    apply(C,R),
    directory_file_path(C.root,'authored.krf',File),
    write_source(File,"(in-microtheory TestMt)\n(argIsa S 1 Authored)"),
    prepare(C.dir,File,Entry),
    kb_store:publish_staged_addition([Entry],R.generation,After),
    assertion(After.generation=:=R.generation+1),
    assertion(\+kb_store:source_info(R.source,_)),assertion(exists_file(R.source)),
    kb_store:query_text("(argIsa S 1 A)",x_TestMt,10,3,Q),assertion(Q.solutions==[]),
    kb_store:query_text("(argIsa S 1 Authored)",x_TestMt,10,3,A),assertion(length(A.solutions,1)).

test(failed_and_stale_publications_preserve_overlay,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    apply(C,R),
    directory_file_path(C.root,'bad.krf',Bad),write_source(Bad,"(broken"),
    catch(prepare(C.dir,Bad,_),Error,true),assertion(nonvar(Error)),
    assertion(kb_store:source_info(R.source,_)),kb_store:generation(R.generation),
    write_source(Bad,"(in-microtheory TestMt)\n(argIsa S 1 New)"),prepare(C.dir,Bad,Entry),
    setup_call_cleanup(true,
      (catch(kb_store:publish_staged_addition([Entry],C.generation,_),Stale,true),
       assertion(Stale=error(generation_conflict(_,_),_)),
       assertion(kb_store:source_info(R.source,_)),kb_store:generation(R.generation)),
      kb_store:cleanup_staged([Entry])).

test(unload_retires_only_derived_sources_and_preserves_pinned_query,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    apply(C,R),
    setup_call_cleanup(kb_store:acquire_query_snapshot(Snapshot),
      (kb_store:unload_source(C.file,R.generation,After),
       assertion(After.files==[]),assertion(exists_file(R.source)),
       kb_store:query_in_snapshot(Snapshot,x_argIsa(x_S,1,x_A),[],x_TestMt,10,3,Q),
       assertion(length(Q.solutions,1))),
      kb_store:release_query_snapshot(Snapshot)).

test(full_replacement_retires_overlay_without_auto_applying,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    apply(C,R),install_files([C.file],C.dir),
    assertion(\+kb_store:source_info(R.source,_)),
    kb_store:query_text("(argIsa S 1 A)",x_TestMt,10,3,Q),assertion(Q.solutions==[]).

test(changed_loaded_source_is_not_absence,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C)),
     throws(error(definitional_patch(stale_native_semantics),_))]) :-
    write_source(C.file,"(in-microtheory TestMt)\n(genlPreds S G)\n(argIsa G 1 B)"),
    apply(C,_).

test(timeout_is_not_absence_and_releases_locks,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    scope(C,Scope),
    catch(call_with_time_limit(0.001,
      kb_definitional_patches:apply(C.program,x_TestMt,Scope,C.generation,_)),Error,true),
    assertion(Error==time_limit_exceeded),
    kb_store:generation(C.generation),
    apply(C,R),assertion(R.status==applied).

test(all_authored_prototypes_have_slot_schema) :-
    program_file(P),kb_definitional_patches:read_program(P,_,Prototypes,_),
    assertion(length(Prototypes,69)),
    forall(member(Proto,Prototypes),assertion(constraint_slot(Proto.term,_))).

test(equivalent_parent_aliases_do_not_conflict_or_duplicate,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)\n(arg1Isa G A)",C)),cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.count==1),
    assertion(\+member(decision{post:_,key:_,status:conflict,reasons:_},R.decisions)).

test(malformed_existing_slot_is_unknown,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)\n(argIsa S InvalidPosition B)",C)),cleanup(cleanup(C))]) :-
    preview(C,R),assertion(R.count==0),
    member(D,R.decisions),member(Reason,D.reasons),assertion(is_dict(Reason,unknown)).

catalog_fixture(C,Text,Other) :-
    directory_file_path(C.root,'unloaded.krf',Other),write_source(Other,Text),
    kb_compile:compile_source(Other,[state_dir(C.dir),progress(none)],_),
    kb_catalog_index:refresh_catalog(all,Report),assertion(Report.complete==true).

test(real_catalog_unloaded_variable_target_blocks,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    catalog_fixture(C,"(in-microtheory TestMt)\n(argIsa ?AnyPredicate 1 B)",Other),
    kb_definitional_patches:preview(C.program,x_TestMt,catalog,C.generation,R),
    assertion(R.count==0),assertion(R.coverage.kind==catalog),
    member(D,R.decisions),member(Reason,D.reasons),
    assertion(Reason.visibility==unloaded),assertion(same_file(Reason.provider.source,Other)).

test(real_catalog_absent_slot_can_materialize,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    kb_catalog_index:refresh_catalog(all,Report),assertion(Report.complete==true),
    kb_definitional_patches:apply(C.program,x_TestMt,catalog,C.generation,R),
    assertion(R.count==1),assertion(R.status==applied).

test(real_catalog_stale_unloaded_source_is_not_absence,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C)),
     throws(error(catalog_stale(_),_))]) :-
    catalog_fixture(C,"(in-microtheory TestMt)\n(p ABC)",Other),
    write_source(Other,"(in-microtheory TestMt)\n(p DEF)"),
    kb_definitional_patches:apply(C.program,x_TestMt,catalog,C.generation,_).

test(real_catalog_incomplete_is_not_absence,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C)),
     throws(error(definitional_patch(incomplete_catalog(_)),_))]) :-
    directory_file_path(C.root,'pending.krf',Other),write_source(Other,"(p a)"),
    kb_catalog_index:refresh_catalog(all,_),
    kb_definitional_patches:apply(C.program,x_TestMt,catalog,C.generation,_).

test(higher_order_negative_loaded_evidence_blocks,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)\n(not (?Pred S 1 B))",C)),cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.count==0),assertion(R.status==unchanged),
    kb_store:generation(C.generation),
    member(D,R.decisions),member(Reason,D.reasons),assertion(is_dict(Reason,unknown)).

test(higher_order_direct_evidence_blocks,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)\n(?Pred S 1 B)",C)),cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.count==0),assertion(R.status==unchanged).

test(higher_order_negative_unloaded_catalog_evidence_blocks,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    catalog_fixture(C,"(in-microtheory TestMt)\n(not (?Pred S 1 B))",Other),
    kb_definitional_patches:apply(C.program,x_TestMt,catalog,C.generation,R),
    assertion(R.count==0),assertion(R.status==unchanged),
    member(D,R.decisions),member(Reason,D.reasons),is_dict(Reason,unknown),
    assertion(Reason.visibility==unloaded),assertion(same_file(Reason.provider.source,Other)).

test(negative_inheritance_edge_is_unknown,
    [setup(fixture("(genlPreds S G)\n(not (genlPreds S G))\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.count==0),assertion(R.status==unchanged),
    member(D,R.decisions),member(Reason,D.reasons),assertion(is_dict(Reason,unknown_edge)).

test(later_round_conflicts_invalidate_descendants,
    [setup(fixture("(genlPreds S G)\n(genlPreds S H)\n(genlPreds H J)\n(genlPreds T S)\n(genlPreds S T)\n(argIsa G 1 A)\n(argIsa J 1 B)",C)),
     cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.count==1),assertion(post(R,x_argIsa(x_H,1,x_B))),
    assertion(member(decision{post:x_argIsa(x_S,1,x_A),key:_,status:conflict,reasons:_},R.decisions)),
    assertion(\+post(R,x_argIsa(x_S,1,x_A))),assertion(\+post(R,x_argIsa(x_T,1,x_A))),
    kb_store:query_text("(argIsa S 1 ?Type)",x_TestMt,10,3,Q),assertion(Q.solutions==[]),
    apply(C,Again),assertion(Again.count==0),assertion(Again.status==unchanged).

test(later_round_same_value_is_not_a_conflict,
    [setup(fixture("(genlPreds S G)\n(genlPreds S H)\n(genlPreds H J)\n(argIsa G 1 A)\n(argIsa J 1 A)",C)),
     cleanup(cleanup(C))]) :-
    apply(C,R),assertion(R.count==2),
    assertion(post(R,x_argIsa(x_S,1,x_A))),assertion(post(R,x_argIsa(x_H,1,x_A))),
    assertion(\+member(decision{post:_,key:_,status:conflict,reasons:_},R.decisions)).

mapping_catalog(C) :-
    directory_file_path(C.root,'unloaded.kif',Other),
    write_source(Other,"(in-microtheory TestMt)\n(p ABC)"),
    kb_compile:compile_source(Other,[state_dir(C.dir),progress(none)],_),
    kb_catalog_index:refresh_catalog(all,Report),assertion(Report.complete==true).
change_mapping(C) :-
    read_file_to_string(C.mapping,Before,[encoding(utf8)]),
    string_concat(Before,"\n",After),write_source(C.mapping,After).

test(changed_mapping_invalidates_catalog_application,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    mapping_catalog(C),
    kb_definitional_patches:preview(C.program,x_TestMt,catalog,C.generation,Preview),
    assertion(Preview.count==1),change_mapping(C),
    catch(kb_definitional_patches:apply(C.program,x_TestMt,catalog,C.generation,_),Error,true),
    assertion(Error=error(definitional_patch(stale_catalog_compiler(_)),_)),
    kb_store:generation(C.generation).

test(changed_mapping_invalidates_final_plan_check,
    [setup(fixture("(genlPreds S G)\n(argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    mapping_catalog(C),
    kb_definitional_patches:plan(C.program,x_TestMt,catalog,C.generation,Plan,Preview),
    assertion(Preview.count==1),change_mapping(C),
    catch(kb_definitional_patches:verify_plan(Plan),Error,true),
    assertion(Error=error(definitional_patch(stale_catalog_compiler(_)),_)),
    kb_store:generation(C.generation).

test(same_line_provenance_and_duplicate_occurrences,
    [setup(fixture("(genlPreds S G) (argIsa G 1 A) (argIsa G 1 A)",C)),cleanup(cleanup(C))]) :-
    kb_definitional_patches:absolute_source(C.file,Path),
    kb_definitional_patches:read_evidence(x_TestMt,Path,Rows,_),
    findall(Id-Key,(member(e(x_argIsa(x_G,1,x_A),_,Ref,loaded,authored),Rows),
      Id=Ref.id,Key=Ref.occurrence),Pairs),
    assertion(Pairs=[First-occurrence(Hash,1),Second-occurrence(Hash,2)]),
    Pairs=[First-_,Second-_],assertion(First\==Second),
    apply(C,R),assertion(R.count==1),
    R.additions=[Candidate],Candidate.basis=[_,_,_,Edge,Antecedent],
    kb_store:source_module(Path,Module,_),
    assertion(kb_runtime:module_assertion(Module,Edge.id,x_genlPreds(x_S,x_G),_)),
    assertion(kb_runtime:module_assertion(Module,Antecedent.id,x_argIsa(x_G,1,x_A),_)),
    assertion(Edge.id\==Antecedent.id),
    kb_cache:read_cache(R.source,_,[record(Id,_,Meta)]),
    assertion(memberchk(xc_patch_basis(Id,Candidate.basis),Meta)),
    install_files([Path],C.dir),
    kb_definitional_patches:read_evidence(x_TestMt,Path,Reloaded,_),
    findall(ReloadedId-Occurrence,
      (member(e(x_argIsa(x_G,1,x_A),_,ReloadedRef,loaded,authored),Reloaded),
       ReloadedId=ReloadedRef.id,Occurrence=ReloadedRef.occurrence),Again),
    assertion(Again==Pairs).

:- end_tests(definitional_patches).
