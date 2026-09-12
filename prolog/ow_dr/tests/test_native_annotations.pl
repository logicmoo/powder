:- begin_tests(native_annotations).
:- use_module('../kb_native_annotations').
:- use_module('../kb_cache',[]).
:- use_module('../kb_store',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(process)).
:- use_module(library(http/json)).
:- use_module(library(prolog_wrap)).

fixture(fixture(Directory,File,Previous)) :-
    source_file(plunit_native_annotations:fixture(_),Here),file_directory_name(Here,Tests),
    uuid(U),atom_concat('.native-tva-',U,Name),directory_file_path(Tests,Name,Directory),
    make_directory(Directory),directory_file_path(Directory,'native.pl',File),
    (getenv('POWDER_NATIVE_TVA_FILE',Old)->Previous=some(Old);Previous=none),
    clear_memory,setenv('POWDER_NATIVE_TVA_FILE',File).
dispose(fixture(Directory,_,Previous)) :-
    clear_memory,
    (Previous=some(Old)->setenv('POWDER_NATIVE_TVA_FILE',Old);unsetenv('POWDER_NATIVE_TVA_FILE')),
    delete_directory_and_contents(Directory).
clear_memory :-
    retractall(kb_native_annotations:nars_tva(_,_)),
    retractall(kb_native_annotations:oc_tva(_,_)),
    retractall(kb_native_annotations:cyc_bayes_value(_,_,_)),
    retractall(kb_native_annotations:baseline(_,_,_,_)),
    kb_native_annotations:reset_transient,
    retractall(kb_store:assertion(a123,_)),retractall(kb_store:assertion(a124,_)).
revision(R) :- native_status(S),R=S.revision.
put(F,E,P,V) :- revision(R),upsert_native(F,E,P,V,R,_).
remove(F,E,P) :- revision(R),clear_native(F,E,P,R,_).
cyc(S,Prop,E) :-
    atom_string(Prop,Name),member(Item,S.families.cyc.properties),Item.property==Name,!,E=Item.effective.
roundtrip_json(Term) :- atom_json_dict(_,Term,[]).
source_fixture(Direction,Monotonicity) :-
    source_fixture(x_known_assertion(x_A),Direction,Monotonicity).
source_fixture(Semantic,Direction,Monotonicity) :-
    append(Direction,Monotonicity,Properties),
    kb_terms:term_ast(Semantic,[],Expression),
    assertz(kb_store:assertion(a123,_{properties:Properties,expression:Expression,
      source:'KBs/fixture.krf',line:9})).

test(module_and_empty_reads_no_seeding,[setup(fixture(F)),cleanup(dispose(F))]) :-
    F=fixture(_,File,_),native_status(S),assertion(S.recordCount==0),
    native_summary(x_Unseen,null,R),
    assertion(R.families.nars.effective.status==uninitialized),
    assertion(R.families.opencog.effective.status==uninitialized),
    assertion(R.families.cyc.properties==[]),
    native_settings(null,Settings),assertion(Settings.effective.utility.status==uninitialized),
    assertion(\+exists_file(File)),roundtrip_json(S),roundtrip_json(R),roundtrip_json(Settings).

test(whole_family_fallbacks_zero_false_empty,[setup(fixture(F)),cleanup(dispose(F))]) :-
    forall(member(Family,[nars,opencog]),
      (put(Family,default,null,native(default,0,false,[])),
       native_summary(x_A,null,S0),get_dict(Family,S0.families,D0),
       assertion(D0.effective.origin==default),
       put(Family,x_Mt,null,0),
       native_summary(x_A,x_Mt,S1),get_dict(Family,S1.families,D1),
       assertion(D1.effective.origin==mt),assertion(D1.effective.summary.value==0),
       put(Family,x_A,null,false),
       native_summary(x_A,x_Mt,S2),get_dict(Family,S2.families,D2),
       assertion(D2.effective.origin==atom),assertion(D2.effective.summary.value==false),
       put(Family,x_A,null,[]),
       native_summary(x_A,x_Mt,S3),get_dict(Family,S3.families,D3),
       assertion(D3.effective.status==initialized),assertion(D3.effective.summary.kind==list),
       native_detail(x_A,x_Mt,Family,null,D3.effective.recordRevision,Detail),
       assertion(Detail.records=[_{data:_{type:list,items:[]},text:_}]),
       remove(Family,x_A,null),native_summary(x_A,x_Mt,S4),get_dict(Family,S4.families,D4),
       assertion(D4.effective.origin==mt))),
    export_native_state(State),assertion(length(State.records,4)).

test(cyc_union_independent_properties,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(cyc,default,utility,0.5),put(cyc,default,noise,-3),
    put(cyc,x_Mt,evidence,false),put(cyc,x_A,utility,0),
    native_summary(x_A,x_Mt,S),cyc(S,utility,U),cyc(S,evidence,E),cyc(S,noise,N),
    assertion(U.origin==atom),assertion(U.summary.value==0),
    assertion(E.origin==mt),assertion(E.summary.value==false),
    assertion(N.origin==default),assertion(N.summary.value== -3),
    assertion(length(S.families.cyc.properties,3)),roundtrip_json(S),
    native_status(Before),native_summary(x_Another,x_Mt,_),native_status(After),
    assertion(Before=@=After),assertion(After.recordCount==4).

test(context_is_explicit_never_source_or_last_context,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(nars,x_Mt,null,nars_truth_value(0.9,0.7)),
    native_summary(x_A,x_Mt,Scoped),assertion(Scoped.families.nars.effective.origin==mt),
    native_summary(x_A,null,Unscoped),assertion(Unscoped.families.nars.effective.status==uninitialized).

test(identity_compound_context_case_assertion_default,[setup(fixture(F)),cleanup(dispose(F))]) :-
    MT=x_MtFn('x_Case',"keep Case",x_Nested(x_B)),
    native_entity(MT,MT,Key),kb_terms:context_key(MT,ContextKey),
    put(nars,MT,null,nars_truth_value(0.3,0.0)),
    native_summary(x_A,ContextKey,R),assertion(R.families.nars.effective.supplier==Key),
    native_summary(Key,ContextKey,Same),assertion(Same.families.nars.effective.origin==atom),
    put(cyc,a60a2418202240,'MiXeD',false),
    native_summary("a60a2418202240",null,Id),cyc(Id,'MiXeD',I),assertion(I.summary.value==false),
    put(opencog,default,null,stv(0.5,0)),
    native_summary(default,null,Default),assertion(Default.families.opencog.effective.origin==atom),
    native_entity('x_CASE',_,Upper),native_entity('x_case',_,Lower),assertion(Upper\==Lower).

test(invalid_context_not_uninitialized,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(domain_error(canonical_native_entity,garbage),_))]) :-
    native_summary(x_A,garbage,_).
test(nonground_record,[setup(fixture(F)),cleanup(dispose(F)),throws(error(instantiation_error,_))]) :-
    put(nars,x_A,null,truth(_)).
test(cyclic_record,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(domain_error(acyclic_native_record,_),_))]) :-
    Cyclic=loop(Cyclic),put(nars,x_A,null,Cyclic).
test(cyclic_key,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(domain_error(acyclic_native_entity,_),_))]) :-
    Cyclic=x_fn(Cyclic),native_summary(Cyclic,null,_).
test(nonfinite_record,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(domain_error(finite_native_number,_),_))]) :-
    put(opencog,x_A,null,1.0Inf).
test(opaque_record,[setup(fixture(F)),cleanup(dispose(F))]) :-
    assertz(kb_native_annotations:nars_tva(x_A,1),Ref),
    catch(native_record_dto(Ref,_),error(type_error(_,_),_),Caught=true),
    assertion(Caught==true),erase(Ref).

test(repl_duplicate_conflict_not_first_winner,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(nars,default,null,nars_truth_value(0.5,0)),
    assertz(kb_native_annotations:nars_tva(x_A,first)),
    assertz(kb_native_annotations:nars_tva(x_A,second)),
    native_summary(x_A,null,R),E=R.families.nars.effective,
    assertion(E.status==conflict),assertion(E.origin==atom),assertion(E.recordCount==2),
    native_detail(x_A,null,nars,null,E.recordRevision,D),assertion(length(D.records,2)),
    native_status(S),assertion(S.conflictCount==1),
    upsert_native(nars,x_A,null,repaired,S.revision,After),assertion(After.conflictCount==0),
    findall(V,nars_tva(x_A,V),Values),assertion(Values==[repaired]).

test(identical_duplicates_still_ambiguous,[setup(fixture(F)),cleanup(dispose(F))]) :-
    assertz(kb_native_annotations:cyc_bayes_value(x_Mt,utility,0)),
    assertz(kb_native_annotations:cyc_bayes_value(x_Mt,utility,0)),
    native_summary(x_A,x_Mt,R),cyc(R,utility,E),assertion(E.status==conflict).

test(revision_safe_updates_and_noops,[setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R0),upsert_native(cyc,x_A,utility,0,R0,S1),assertion(S1.revision\==R0),
    catch(upsert_native(cyc,x_A,utility,1,R0,_),
      error(native_tva_revision_conflict(R0,_),_),Conflict=true),assertion(Conflict==true),
    upsert_native(cyc,x_A,utility,0,S1.revision,S2),assertion(S1.revision==S2.revision),
    native_summary(x_A,null,R),cyc(R,utility,E),assertion(E.summary.value==0).

test(lazy_detail_stale_context_and_record,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(nars,default,null,nars_truth_value(0.5,0.0)),
    native_summary(x_A,null,S),Token=S.families.nars.effective.recordRevision,
    put(cyc,x_Unrelated,utility,0),
    native_detail(x_A,null,nars,null,Token,D),assertion(D.effective.status==initialized),
    catch(native_detail(x_A,x_Mt,nars,null,Token,_),
      error(native_tva_record_revision_conflict(_,_),_),ContextConflict=true),
    assertion(ContextConflict==true),
    put(nars,x_A,null,nars_truth_value(0.8,0.2)),
    catch(native_detail(x_A,null,nars,null,Token,_),
      error(native_tva_record_revision_conflict(_,_),_),RecordConflict=true),
    assertion(RecordConflict==true).

test(unknown_records_lossless_no_payload_in_summary,[setup(fixture(F)),cleanup(dispose(F))]) :-
    length(Codes,12000),maplist(=(0'a),Codes),string_codes(Long,Codes),
    Record=vendor_truth(native{label:"Keep\n\"<>",atom:'MiXeD',values:[false,0,[],Long]},extra(a,b)),
    put(opencog,x_A,null,Record),native_summary(x_A,null,S),
    atom_json_dict(Small,S,[]),atom_length(Small,N),assertion(N<3000),
    native_detail(x_A,null,opencog,null,S.families.opencog.effective.recordRevision,D),
    D.records=[R],read_term_from_atom(R.text,Roundtrip,[]),assertion(Roundtrip==Record),
    assertion(R.data.functor=="vendor_truth"),roundtrip_json(D),
    export_native_state(State),assertion(memberchk(oc_tva(x_A,Record),State.records)).

test(whole_records_not_field_merged,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(nars,default,null,nars_truth_value(0.9,0.8)),
    put(nars,x_Mt,null,vendor_truth(frequency(0.0))),
    native_summary(x_A,x_Mt,R),E=R.families.nars.effective,
    assertion(E.summary.renderer==native_data),assertion(\+get_dict(confidence,E.summary,_)),
    native_detail(x_A,x_Mt,nars,null,E.recordRevision,D),
    D.records=[Detail],assertion(Detail.data.functor=="vendor_truth").

test(batch_bounded_numeric_filter_sort_origin,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(cyc,default,utility,0.5),put(cyc,x_A,utility,0),put(cyc,x_B,utility,false),
    put(cyc,x_C,utility,0.8),
    native_batch([x_C,x_B,x_A,x_D,x_A],null,
      _{family:cyc,property:utility,sort:value,min:0,max:0.6},R),
    findall(E,(member(I,R.items),E=I.entity),Entities),assertion(Entities==[x_A,x_D]),
    native_batch([x_A,x_D],null,_{family:cyc,property:utility,origin:default},Inherited),
    assertion(Inherited.total==1),roundtrip_json(R).
test(batch_limit,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(resource_error(native_batch_limit),_))]) :-
    length(Entities,201),maplist(=(x_A),Entities),native_batch(Entities,null,_{},_).
test(batch_unsafe_sort,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(domain_error(native_sort,call),_))]) :-
    native_batch([x_A],null,_{sort:call},_).

test(initialize_authorized_defaults_preserves_others,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(nars,x_A,null,own),put(cyc,default,monotonic_strength,0),
    put(cyc,x_Mt,utility,0),revision(R),initialize_defaults(R,S),
    assertion(S.recordCount==10),
    assertion(nars_tva(default,nars_truth_value(0.5,0.0))),
    assertion(oc_tva(default,stv(0.5,0.0))),assertion(cyc_bayes_value(default,utility,0.5)),
    assertion(cyc_bayes_value(default,monotonic_strength,0)),
    assertion(cyc_bayes_value(default,default_strength,0.7)),
    assertion(cyc_bayes_value(default,asserted_positive_truth,1.0)),
    assertion(cyc_bayes_value(default,asserted_monotonic_confidence,0.97)),
    assertion(cyc_bayes_value(default,asserted_default_confidence,0.66)),
    assertion(\+cyc_bayes_value(default,direction,_)),assertion(nars_tva(x_A,own)),
    initialize_defaults(S.revision,Same),assertion(S.revision==Same.revision).

test(settings_independent_zero_clear_global_propagation,[setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R),initialize_defaults(R,_),native_settings(x_Mt,Start),
    save_native_settings(x_Mt,_{monotonic_strength:0},Start.revision,Override),
    assertion(Override.effective.monotonic_strength.summary.value==0),
    assertion(Override.effective.monotonic_strength.origin==mt),
    assertion(Override.effective.default_strength.summary.value==0.7),
    save_native_settings(null,_{monotonic_strength:0.4,default_strength:0.9},
      Override.revision,Global),
    native_settings(x_Mt,Inherited),
    assertion(Inherited.effective.monotonic_strength.summary.value==0),
    assertion(Inherited.effective.default_strength.summary.value==0.9),
    save_native_settings(x_Mt,_{monotonic_strength:null},Global.revision,Cleared),
    assertion(Cleared.effective.monotonic_strength.summary.value==0.4),
    assertion(Cleared.overrides.monotonic_strength==false),
    assertion(\+cyc_bayes_value(x_Mt,monotonic_strength,_)).
test(settings_invalid_existing_not_uninitialized,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(cyc,x_Mt,direction,wrong),native_settings(x_Mt,S),
    assertion(S.effective.direction.status==invalid),assertion(S.effective.direction.origin==mt).
test(settings_invalid_save,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(domain_error(unit_interval,-0.1),_))]) :-
    revision(R),save_native_settings(null,_{utility: -0.1},R,_).

test(source_explicit_direction_and_strength_display_only,[setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([_{name:direction,value:":FORWARD"}],[_{name:monotonicity,value:':DEFAULT'}]),
    revision(R),initialize_defaults(R,_),native_settings(null,S),
    save_native_settings(null,_{direction:":BACKWARD"},S.revision,_),
    native_status(Before),assertion_interpretation(a123,null,D),
    assertion(D.direction.origin==source),assertion(D.direction.summary.value==":FORWARD"),
    assertion(D.mappedStrength.summary.value==0.7),assertion(D.mappedStrength.interpretation==display_only),
    assertion(D.monotonicity==[':DEFAULT']),native_status(After),assertion(Before=@=After),
    assertion(\+cyc_bayes_value(a123,direction,_)),roundtrip_json(D).
test(source_native_own_disagreement_flagged,[setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([_{name:direction,value:':FORWARD'}],[]),
    put(cyc,a123,direction,':BACKWARD'),assertion_interpretation(a123,x_Mt,D),
    assertion(D.direction.status==conflict),
    assertion(D.direction.reason==source_native_direction_conflict).
test(source_native_own_agreement,[setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([_{name:direction,value:':FORWARD'}],[]),
    put(cyc,a123,direction,':FORWARD'),assertion_interpretation(a123,null,D),
    assertion(D.direction.status==initialized),assertion(D.direction.origin==source).
test(no_source_direction_missing_is_uninitialized,[setup(fixture(F)),cleanup(dispose(F))]) :-
    assertion_interpretation(a123,null,D),
    assertion(D.direction.status==uninitialized),assertion(D.mappedStrength.status==uninitialized).

test(repl_snapshot_detects_and_persists_changes,[setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R0),assertz(kb_native_annotations:cyc_bayes_value(x_A,utility,0)),
    native_status(S1),assertion(S1.revision\==R0),
    retract(kb_native_annotations:cyc_bayes_value(x_A,utility,0)),native_status(S2),
    assertion(S2.revision\==S1.revision),assertion(S2.recordCount==0),
    F=fixture(_,File,_),assertion(exists_file(File)),
    clear_memory,native_status(Restart),assertion(Restart.revision==S2.revision).
test(raw_predicate_rule_never_executed,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(domain_error(native_data_fact,_),_))]) :-
    assertz(kb_native_annotations:(nars_tva(x_A,0):-throw(executed_bad_body))),
    native_summary(x_A,null,_).

test(export_import_ground_no_io,[setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R),initialize_defaults(R,_),export_native_state(State),assertion(ground(State)),
    F=fixture(_,File,_),delete_file(File),clear_memory,import_native_state(State),
    native_status(S),assertion(S.persistence==snapshot_only),
    assertion(S.revision==State.revision),assertion(\+exists_file(File)),
    persist_native_state(P),assertion(P.persistence==durable),assertion(exists_file(File)).
test(import_bad_revision,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(native_tva_invalid_revision,_))]) :-
    export_native_state(State),import_native_state(State.put(revision,wrong)).

test(real_restart,[setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R),initialize_defaults(R,_),
    child_goal("native_status(S),get_dict(recordCount,S,8),nars_tva(default,nars_truth_value(0.5,0.0)),oc_tva(default,stv(0.5,0.0)),cyc_bayes_value(default,utility,0.5),cyc_bayes_value(default,asserted_positive_truth,1.0),cyc_bayes_value(default,asserted_monotonic_confidence,0.97),cyc_bayes_value(default,asserted_default_confidence,0.66)",Goal),
    run_child(Goal,exit(0)).
test(real_qsave_restore_without_sidecar,[setup(fixture(F)),cleanup(dispose(F))]) :-
    F=fixture(Directory,File,_),revision(R),initialize_defaults(R,_),export_native_state(State),
    directory_file_path(Directory,'restore.state',Save),
    directory_file_path(Directory,'qsave-builder.pl',Builder),
    source_file(kb_native_annotations:native_status(_),Module),
    setup_call_cleanup(open(Builder,write,S,[encoding(utf8)]),
      (format(S,':- use_module(~q).~n',[Module]),
       kb_cache:write_one_line(S,saved_data(State)),
       kb_cache:write_one_line(S,(main:-saved_data(X),import_native_state(X),
         qsave_program(Save,[goal(restored),stand_alone(false),toplevel(halt)]),halt)),
       kb_cache:write_one_line(S,(restored:-
         native_status(Status),get_dict(recordCount,Status,8),
         nars_tva(default,nars_truth_value(0.5,0.0)),cyc_bayes_value(default,utility,0.5),
         cyc_bayes_value(default,asserted_monotonic_confidence,0.97),halt)),
       kb_cache:write_one_line(S,(:-initialization(main,main)))),close(S)),
    process_create(path(swipl),['-q',Builder],[process(Build)]),process_wait(Build,exit(0)),
    delete_file(File),
    process_create(path(swipl),['-q','-x',Save],[process(Restore)]),process_wait(Restore,exit(0)).

child_goal(Body,Goal) :-
    source_file(kb_native_annotations:native_status(_),Module),
    format(atom(Goal),'use_module(~q),(~s->halt(0);halt(4))',[Module,Body]).
run_child(Goal,Status) :-
    process_create(path(swipl),['-q','-g',Goal],[process(Pid)]),process_wait(Pid,Status).

test(native_lock_busy_other_process,[setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R),F=fixture(_,File,_),atom_concat(File,'.lock',LockPath),
    setup_call_cleanup(kb_cache:try_lock(LockPath,Lock),
      (format(string(Body),
        "catch(upsert_native(nars,x_A,null,0,~q,_),error(native_tva_busy,_),Caught=true),Caught==true",[R]),
       child_goal(Body,Goal),run_child(Goal,exit(0)),
       assertion(\+exists_file(File))),kb_cache:release_lock(Lock)).

test(external_write_refresh_and_unsynced_conflict,[setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R0),format(string(Body),"upsert_native(nars,x_External,null,0,~q,_)",[R0]),
    child_goal(Body,Goal),run_child(Goal,exit(0)),
    native_status(S1),assertion(S1.recordCount==1),
    assertz(kb_native_annotations:oc_tva(x_Local,0)),
    format(string(Other),"upsert_native(cyc,x_External,utility,0.5,~q,_)",[S1.revision]),
    child_goal(Other,Goal2),run_child(Goal2,exit(0)),
    catch(native_status(_),error(native_tva_persistence_conflict(_,_),_),Conflict=true),
    assertion(Conflict==true),assertion(oc_tva(x_Local,0)).

test(corrupt_file_not_uninitialized_and_preserves_bytes,[setup(fixture(F)),cleanup(dispose(F))]) :-
    F=fixture(_,File,_),
    setup_call_cleanup(open(File,write,S),write(S,':- throw(executed).\n'),close(S)),
    kb_cache:file_digest(File,Before),
    catch(native_summary(x_A,null,_),error(domain_error(native_state_header,_),_),Caught=true),
    assertion(Caught==true),kb_cache:file_digest(File,After),assertion(Before==After).

test(large_integer_and_rational_dto_exact,[setup(fixture(F)),cleanup(dispose(F))]) :-
    Big is 2^80+1,Rational is 1 rdiv 3,
    put(nars,x_A,null,native_numbers(Big,Rational)),
    native_summary(x_A,null,S),
    native_detail(x_A,null,nars,null,S.families.nars.effective.recordRevision,D),
    D.records=[Record],Record.data.args=[IntegerDTO,RationalDTO],
    assertion(IntegerDTO.type==integer),assertion(RationalDTO.type==rational),
    number_string(IB,IntegerDTO.text),term_string(RB,RationalDTO.text),
    assertion(IB==Big),assertion(RB==Rational),roundtrip_json(D).

test(large_functor_summary_bounded,[setup(fixture(F)),cleanup(dispose(F))]) :-
    length(Codes,2000),maplist(=(0'a),Codes),atom_codes(Functor,Codes),
    Record=..[Functor,1],put(nars,x_A,null,Record),native_summary(x_A,null,S),
    assertion(S.families.nars.effective.summary.functorTruncated==true),
    assertion(S.families.nars.effective.summary.functorLength==2000),
    atom_json_dict(Text,S,[]),atom_length(Text,N),assertion(N<1600).

test(missing_established_file_not_uninitialized,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(native_tva_storage_missing,_))]) :-
    put(nars,x_A,null,0),F=fixture(_,File,_),delete_file(File),native_summary(x_A,null,_).

test(invalid_import_tag_clear_error,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(domain_error(native_state_tag,bogus),_))]) :-
    export_native_state(State),dict_pairs(State,_,Pairs),dict_pairs(Bad,bogus,Pairs),
    import_native_state(Bad).

test(validation_failure_preserves_disk_and_memory,[setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R),initialize_defaults(R,S),F=fixture(_,File,_),kb_cache:file_digest(File,Before),
    catch(native_update([put(nars,x_A,null,okay),put(opencog,x_B,null,stv(0.5,2))],S.revision,_),
      error(domain_error(unit_interval,2),_),Caught=true),
    assertion(Caught==true),kb_cache:file_digest(File,After),assertion(Before==After),
    native_status(Current),assertion(Current.revision==S.revision),assertion(\+nars_tva(x_A,_)).

test(metadata_does_not_touch_native_kg_or_source_bytes,[setup(fixture(F)),cleanup(dispose(F))]) :-
    F=fixture(Directory,_,_),directory_file_path(Directory,'original.krf',Source),
    setup_call_cleanup(open(Source,write,S,[encoding(iso_latin_1)]),
      format(S,'(isa Fido Dog)~n',[]),close(S)),
    directory_file_path(Directory,'source.krf.pl',Native),
    source_file(kb_cache:write_one_line(_,_),CacheModule),
    file_directory_name(CacheModule,App),directory_file_path(App,'kb_tail_loader.pl',Helper),
    setup_call_cleanup(open(Native,write,Out,[encoding(utf8)]),
      maplist(kb_cache:write_one_line(Out),
        [(:-use_module(Helper),kb_tail_loader:load_remaining),
         (x_isa(x_Fido,x_Dog):-x_cid(a456)),xc_microtheory(a456,x_FixtureMt),
         xc_kb_names(a456,[]),xc_source_file(a456,Source),xc_source_line(a456,1)]),close(Out)),
    kb_cache:file_digest(Source,SourceBefore),kb_cache:file_digest(Native,NativeBefore),
    setup_call_cleanup(kb_runtime:native_load(Native,ow_native_annotations_fixture),
      (kb_runtime:query_modules([ow_native_annotations_fixture],x_isa(x_Fido,_),x_FixtureMt,10,2,Before),
       revision(R),initialize_defaults(R,_),put(cyc,x_FixtureMt,direction,':FORWARD'),
       put(nars,a456,null,nars_truth_value(0,0)),native_summary(a456,x_FixtureMt,_),
       kb_runtime:query_modules([ow_native_annotations_fixture],x_isa(x_Fido,_),x_FixtureMt,10,2,After),
       assertion(Before=@=After),
       kb_cache:file_digest(Source,SourceAfter),kb_cache:file_digest(Native,NativeAfter),
       assertion(SourceBefore==SourceAfter),assertion(NativeBefore==NativeAfter)),
      kb_runtime:native_unload(Native)).

test(microtheory_strength_source_and_explicit_native_independent,[setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([],[_{name:monotonicity,value:':MONOTONIC'}]),
    revision(R),initialize_defaults(R,_),native_settings(x_Mt,S),
    save_native_settings(x_Mt,_{monotonic_strength:0,direction:":BACKWARD"},S.revision,_),
    put(opencog,a123,null,stv(0.9,0.8)),assertion_interpretation(a123,x_Mt,I),
    assertion(I.mappedStrength.summary.value==0),assertion(I.mappedStrength.origin==mt),
    assertion(I.direction.summary.value==":BACKWARD"),assertion(I.direction.origin==mt),
    native_summary(a123,x_Mt,N),assertion(N.families.opencog.effective.origin==atom),
    assertion(N.families.opencog.effective.summary.strength==0.9).

test(source_duplicate_and_invalid_direction,[setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([_{name:direction,value:':FORWARD'},_{name:direction,value:':FORWARD'}],[]),
    assertion_interpretation(a123,null,D),assertion(D.direction.status==conflict),
    retractall(kb_store:assertion(a123,_)),
    source_fixture([_{name:direction,value:':UNKNOWN'}],[]),
    put(cyc,default,direction,':BACKWARD'),assertion_interpretation(a123,null,I),
    assertion(I.direction.status==invalid),assertion(I.direction.origin==source).

test(compound_mt_settings_and_cleared_utility,[setup(fixture(F)),cleanup(dispose(F))]) :-
    MT=x_ContextFn(x_A,x_B),revision(R),initialize_defaults(R,_),native_settings(MT,S),
    save_native_settings(MT,_{utility:0,default_strength:0},S.revision,U),
    assertion(U.effective.utility.summary.value==0),assertion(U.effective.utility.origin==mt),
    save_native_settings(MT,_{utility:null},U.revision,C),
    assertion(C.effective.utility.origin==default),assertion(C.effective.utility.summary.value==0.5),
    assertion(C.effective.default_strength.summary.value==0).

test(direct_qsave_native_facts_survive_restore,[setup(fixture(F)),cleanup(dispose(F))]) :-
    F=fixture(Directory,File,_),revision(R),initialize_defaults(R,_),
    directory_file_path(Directory,'direct.state',Save),
    directory_file_path(Directory,'direct-builder.pl',Builder),
    source_file(kb_native_annotations:native_status(_),Module),
    setup_call_cleanup(open(Builder,write,S,[encoding(utf8)]),
      (format(S,':- use_module(~q).~n',[Module]),
       kb_cache:write_one_line(S,(main:-native_status(Initial),get_dict(schema,Initial,1),
         qsave_program(Save,[goal(restored),stand_alone(false),toplevel(halt)]),halt)),
       kb_cache:write_one_line(S,(restored:-
         native_status(Status),get_dict(recordCount,Status,8),
         get_dict(persistence,Status,snapshot_only),oc_tva(default,stv(0.5,0.0)),
         cyc_bayes_value(default,asserted_default_confidence,0.66),halt)),
       kb_cache:write_one_line(S,(:-initialization(main,main)))),close(S)),
    process_create(path(swipl),['-q',Builder],[process(Build)]),process_wait(Build,exit(0)),
    delete_file(File),
    process_create(path(swipl),['-q','-x',Save],[process(Restore)]),process_wait(Restore,exit(0)).

test(variable_context_is_error,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(instantiation_error,_))]) :-
    native_summary(x_A,_,_).
test(variable_settings_context_is_error,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(instantiation_error,_))]) :-
    revision(R),save_native_settings(_,_{utility:0},R,_).
test(variable_setting_cannot_clear,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(cyc,default,utility,0.5),revision(R),
    catch(save_native_settings(null,_{utility:_},R,_),error(instantiation_error,_),Caught=true),
    assertion(Caught==true),assertion(cyc_bayes_value(default,utility,0.5)).

test(json_literal_named_atoms_and_properties_remain_text,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(cyc,default,'null',0),put(nars,default,null,native(null,true,false)),
    native_summary(x_A,null,S),cyc(S,'null',C),assertion(C.summary.value==0),
    atom_json_dict(JSON,S,[]),atom_json_dict(JSON,Parsed,[]),
    Parsed.families.cyc.properties=[P],assertion(P.property=="null"),
    native_detail(x_A,null,nars,null,S.families.nars.effective.recordRevision,D),
    D.records=[R],R.data.args=[Null,True,False],
    assertion(Null.value=="null"),assertion(True.value=="true"),assertion(False.value=="false"),
    native_batch([x_A],null,_{family:cyc,property:"null",sort:value},B),assertion(B.total==1).

test(atomic_names_are_not_reparsed_or_flattened,[setup(fixture(F)),cleanup(dispose(F))]) :-
    put(nars,'x_Spaced Name(A)',null,native),
    native_entity("x_Spaced Name(A)",Term,Key),
    assertion(Term=='x_Spaced Name(A)'),assertion(Key=='x_Spaced Name(A)'),
    native_summary(Key,null,S),assertion(S.families.nars.effective.origin==atom),
    native_entity("x_Fn(x_a)",Atom,AtomKey),native_entity(x_Fn(x_a),Compound,NatKey),
    assertion(Atom=='x_Fn(x_a)'),assertion(Compound==x_Fn(x_a)),assertion(AtomKey\==NatKey).

test(explicit_missing_cyc_property_has_backend_uninitialized_row,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    native_batch([x_A],null,_{family:cyc,property:utility},B),B.items=[S],
    cyc(S,utility,E),assertion(E.status==uninitialized),
    assertion(E.origin==null),assertion(E.supplierExpression==null),
    native_detail(x_A,null,cyc,utility,E.recordRevision,D),assertion(D.records==[]),
    native_summary(x_A,null,Ordinary),assertion(Ordinary.families.cyc.properties==[]),
    native_status(Status),assertion(Status.recordCount==0),
    F=fixture(_,File,_),assertion(\+exists_file(File)).

test(requested_cyc_property_retains_union_without_duplicates,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    put(cyc,default,noise,false),put(cyc,x_Mt,utility,0),
    native_batch([x_A],x_Mt,_{family:cyc,property:utility},B),B.items=[S],
    findall(P,(member(I,S.families.cyc.properties),P=I.property),Props),
    assertion(Props==["noise","utility"]),
    cyc(S,utility,E),assertion(E.origin==mt),assertion(E.summary.value==0),
    native_status(Status),assertion(Status.recordCount==2).

test(full_identity_and_supplier_ast_are_shared_codec_shapes,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    Entity=x_TermFn('x_Case',"text"),MT=x_MtFn(x_A,x_B),
    put(nars,MT,null,nars_truth_value(0.5,0)),
    native_summary(Entity,MT,S),kb_terms:term_ast(Entity,[],EntityAST),
    kb_terms:term_ast(MT,[],ContextAST),
    assertion(S.entityExpression=@=EntityAST),assertion(S.contextExpression=@=ContextAST),
    E=S.families.nars.effective,assertion(E.supplierExpression=@=ContextAST),
    native_detail(Entity,MT,nars,null,E.recordRevision,D),
    assertion(D.contextExpression=@=ContextAST),assertion(D.entityExpression=@=EntityAST),
    native_settings(MT,Settings),assertion(Settings.contextExpression=@=ContextAST),
    native_batch([Entity],MT,_{},B),assertion(B.contextExpression=@=ContextAST),
    roundtrip_json(S),roundtrip_json(D),roundtrip_json(Settings),roundtrip_json(B).

test(asserted_priors_separate_from_native_fallback,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([],[_{name:monotonicity,value:':MONOTONIC'}]),
    revision(R),initialize_defaults(R,_),native_status(Before),
    assertion_interpretation(a123,null,I),P=I.assertionPrior,
    assertion(P.kind==configured_assertion_prior),assertion(P.polarity==positive),
    assertion(P.status==initialized),assertion(P.truth.summary.value==1.0),
    assertion(P.confidence.summary.value==0.97),assertion(P.truth.origin==default),
    assertion(P.observed==false),assertion(P.affectsNativeTVA==false),
    native_summary(a123,null,Native),
    assertion(Native.families.nars.effective.summary.frequency==0.5),
    assertion(Native.families.nars.effective.summary.confidence==0.0),
    assertion(Native.families.opencog.effective.summary.strength==0.5),
    assertion(Native.families.opencog.effective.summary.confidence==0.0),
    cyc(Native,utility,Utility),assertion(Utility.summary.value==0.5),
    native_status(After),assertion(Before=@=After),
    assertion(\+nars_tva(a123,_)),assertion(\+oc_tva(a123,_)),
    assertion(\+cyc_bayes_value(a123,asserted_positive_truth,_)),roundtrip_json(I).

test(asserted_default_confidence_not_numeric_strength,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([],[_{name:monotonicity,value:':DEFAULT'}]),
    revision(R),initialize_defaults(R,_),assertion_interpretation(a123,null,I),
    assertion(I.assertionPrior.truth.summary.value==1.0),
    assertion(I.assertionPrior.confidence.summary.value==0.66),
    assertion(I.assertionPrior.confidence.property==asserted_default_confidence),
    assertion(I.mappedStrength.summary.value==0.7),assertion(I.monotonicity==[':DEFAULT']).

test(asserted_prior_mt_zero_clear_and_independent_global_propagation,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    MT=x_MtFn(x_Prior,x_Test),source_fixture([],[_{name:monotonicity,value:':MONOTONIC'}]),
    revision(R),initialize_defaults(R,_),native_settings(MT,Initial),
    save_native_settings(MT,_{asserted_positive_truth:0},Initial.revision,S1),
    assertion_interpretation(a123,MT,I1),assertion(I1.assertionPrior.truth.summary.value==0),
    assertion(I1.assertionPrior.truth.origin==mt),
    assertion(I1.assertionPrior.confidence.summary.value==0.97),
    save_native_settings(null,_{asserted_monotonic_confidence:0.25,asserted_positive_truth:0.8},
      S1.revision,S2),
    assertion_interpretation(a123,MT,I2),assertion(I2.assertionPrior.truth.summary.value==0),
    assertion(I2.assertionPrior.confidence.summary.value==0.25),
    save_native_settings(MT,_{asserted_positive_truth:null,asserted_monotonic_confidence:0},
      S2.revision,S3),
    assertion(S3.overrides.asserted_positive_truth==false),
    assertion_interpretation(a123,MT,I3),
    assertion(I3.assertionPrior.truth.summary.value==0.8),assertion(I3.assertionPrior.truth.origin==default),
    assertion(I3.assertionPrior.confidence.summary.value==0),assertion(I3.assertionPrior.confidence.origin==mt).

test(asserted_prior_ignores_native_own_config_property_but_native_resolves_it,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([],[_{name:monotonicity,value:':MONOTONIC'}]),
    revision(R),initialize_defaults(R,_),
    put(cyc,a123,asserted_positive_truth,0.2),
    put(nars,x_Mt,null,nars_truth_value(0.7,0.1)),put(opencog,a123,null,stv(0.4,0.3)),
    assertion_interpretation(a123,x_Mt,I),assertion(I.assertionPrior.truth.summary.value==1.0),
    native_summary(a123,x_Mt,N),cyc(N,asserted_positive_truth,Explicit),
    assertion(Explicit.origin==atom),assertion(Explicit.summary.value==0.2),
    assertion(N.families.nars.effective.origin==mt),
    assertion(N.families.nars.effective.summary.frequency==0.7),
    assertion(N.families.opencog.effective.origin==atom),
    assertion(N.families.opencog.effective.summary.strength==0.4).

test(canonical_negative_prior_unsupported_no_inversion,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    Semantic=x_not(x_known_assertion(x_A)),
    source_fixture(Semantic,[],[_{name:monotonicity,value:':DEFAULT'}]),
    revision(R),initialize_defaults(R,_),put(nars,a123,null,nars_truth_value(0.2,0.4)),
    kb_store:assertion(a123,Before),assertion_interpretation(a123,null,I),P=I.assertionPrior,
    assertion(P.status==unsupported),assertion(P.polarity==negative),
    assertion(P.reason==negative_assertion_prior_unspecified),
    assertion(P.truth==null),assertion(P.confidence==null),
    native_summary(a123,null,N),assertion(N.families.nars.effective.summary.frequency==0.2),
    assertion(\+nars_tva(x_known_assertion(x_A),_)),
    kb_store:assertion(a123,After),assertion(Before=@=After),
    assertion(I.monotonicity==[':DEFAULT']).

test(asserted_prior_missing_invalid_and_conflict_states,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([],[_{name:monotonicity,value:':MONOTONIC'}]),
    assertion_interpretation(a123,null,Missing),assertion(Missing.assertionPrior.status==uninitialized),
    put(cyc,default,asserted_positive_truth,false),
    assertion_interpretation(a123,null,Invalid),assertion(Invalid.assertionPrior.status==invalid),
    put(cyc,default,asserted_positive_truth,1),
    assertz(kb_native_annotations:cyc_bayes_value(default,asserted_positive_truth,0)),
    assertion_interpretation(a123,null,Conflict),assertion(Conflict.assertionPrior.status==conflict).

test(asserted_prior_unknown_source_or_category_unsupported,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R),initialize_defaults(R,_),
    assertion_interpretation(x_Term,null,Term),assertion(Term.assertionPrior.status==unsupported),
    assertion(Term.assertionPrior.reason==not_loaded_assertion),
    source_fixture([],[]),assertion_interpretation(a123,null,Unknown),
    assertion(Unknown.assertionPrior.status==unsupported),
    assertion(Unknown.assertionPrior.reason==unsupported_source_monotonicity).

test(initialization_preserves_explicit_assertion_prior_settings,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    put(cyc,default,asserted_positive_truth,0),put(cyc,default,asserted_default_confidence,0.8),
    revision(R),initialize_defaults(R,_),native_settings(null,S),
    assertion(S.effective.asserted_positive_truth.summary.value==0),
    assertion(S.effective.asserted_default_confidence.summary.value==0.8),
    assertion(S.effective.asserted_monotonic_confidence.summary.value==0.97).

test(asserted_prior_settings_reject_out_of_range,
     [setup(fixture(F)),cleanup(dispose(F)),throws(error(domain_error(unit_interval,1.01),_))]) :-
    revision(R),save_native_settings(null,_{asserted_monotonic_confidence:1.01},R,_).

test(interpretation_batch_matches_single_dtos_and_common_snapshots,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([_{name:direction,value:':FORWARD'}],[_{name:monotonicity,value:':MONOTONIC'}]),
    kb_store:assertion(a123,First),
    assertz(kb_store:assertion(a124,First.put(_{line:10,
      properties:[_{name:monotonicity,value:':DEFAULT'}]}))),
    revision(R),initialize_defaults(R,_),native_settings(x_Mt,S),
    save_native_settings(x_Mt,_{asserted_default_confidence:0,direction:":BACKWARD"},S.revision,_),
    assertion_interpretation(a123,x_Mt,One),assertion_interpretation(a124,x_Mt,Two),
    assertion_interpretations([a123,a124,a123],x_Mt,Batch),
    assertion(Batch.items=@=[One,Two]),assertion(Batch.context==x_Mt),
    forall(member(Item,Batch.items),
      (assertion(Item.revision==Batch.revision),assertion(Item.generation==Batch.generation))),
    native_settings(x_Mt,Before),
    save_native_settings(x_Mt,_{asserted_default_confidence:0.2,default_strength:0},Before.revision,_),
    assertion_interpretations([a123,a124],x_Mt,Changed),
    assertion(Changed.revision\==Batch.revision),Changed.items=[_,Second],
    assertion(Second.assertionPrior.confidence.summary.value==0.2),
    assertion(Second.mappedStrength.summary.value==0),roundtrip_json(Batch),roundtrip_json(Changed).

test(interpretation_batch_limit,[setup(fixture(F)),cleanup(dispose(F)),
     throws(error(resource_error(native_interpretations_limit),_))]) :-
    length(Inputs,201),maplist(=(a123),Inputs),assertion_interpretations(Inputs,null,_).

test(interpretation_batch_empty_and_canonical_dedup,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    assertion_interpretations([],null,Empty),assertion(Empty.items==[]),
    assertion(Empty.context==null),
    MT=x_MtFn(x_A,x_B),kb_terms:context_key(MT,MTKey),native_entity(MT,_,NatKey),
    assertion_interpretations([NatKey,MTKey,x_A,x_A],MT,Batch),
    Batch.items=[Compound,Atomic],assertion(Compound.entity==NatKey),assertion(Atomic.entity==x_A),
    assertion(Compound.assertionPrior.reason==not_loaded_assertion),
    assertion(Compound.context==MTKey),roundtrip_json(Batch).

bump_probe(Name) :- nb_getval(Name,N),Next is N+1,nb_setval(Name,Next).
test(interpretation_batch_synchronizes_and_reads_native_disk_once,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    revision(R),initialize_defaults(R,_),
    findall(Id,(between(1,200,N),format(atom(Id),'a~16r',[N])),Entities),
    setup_call_cleanup(
      (nb_setval(tva_disk_reads,0),nb_setval(tva_synchronizations,0),
       wrap_predicate(kb_native_annotations:read_state(_,_,_),tva_batch_disk_probe,Read,
         (plunit_native_annotations:bump_probe(tva_disk_reads),call(Read))),
       wrap_predicate(kb_native_annotations:synchronize(_),tva_batch_sync_probe,Sync,
         (plunit_native_annotations:bump_probe(tva_synchronizations),call(Sync)))),
      (assertion_interpretations(Entities,null,Batch),assertion(length(Batch.items,200)),
       nb_getval(tva_disk_reads,Reads),assertion(Reads==1),
       nb_getval(tva_synchronizations,Syncs),assertion(Syncs==1),
       forall(member(Item,Batch.items),
         (assertion(Item.revision==Batch.revision),assertion(Item.generation==Batch.generation)))),
      (unwrap_predicate(kb_native_annotations:read_state(_,_,_),tva_batch_disk_probe),
       unwrap_predicate(kb_native_annotations:synchronize(_),tva_batch_sync_probe),
       nb_delete(tva_disk_reads),nb_delete(tva_synchronizations))).

source_snapshot_writer(Commands,Events,Generation) :-
    thread_get_message(Commands,Command),
    (Command==mutate->
      thread_send_message(Events,started),
      with_mutex(openworld_store,transaction(
        (forall(member(Id,[a123,a124]),
           (retract(kb_store:assertion(Id,Row)),
            assertz(kb_store:assertion(Id,Row.put(properties,
              [_{name:monotonicity,value:':DEFAULT'}]))))),
         retractall(kb_store:generation(_)),Next is Generation+1,
         assertz(kb_store:generation(Next)))))
    ;true).
source_snapshot_probe(Entity,Commands,Events) :-
    assertion(kb_store:owns_store_mutex),
    (Entity==a123->thread_send_message(Commands,mutate),thread_get_message(Events,started);true).
test(interpretation_batch_source_generation_coherent_against_writer,
     [setup(fixture(F)),cleanup(dispose(F))]) :-
    source_fixture([],[_{name:monotonicity,value:':MONOTONIC'}]),
    kb_store:assertion(a123,Row),assertz(kb_store:assertion(a124,Row.put(line,10))),
    kb_store:generation(Original),revision(R),initialize_defaults(R,_),
    setup_call_cleanup(
      (message_queue_create(Commands),message_queue_create(Events),
       thread_create(source_snapshot_writer(Commands,Events,Original),Writer,[]),
       wrap_predicate(kb_native_annotations:capture_source_data(Entity,_),tva_source_snapshot_probe,Capture,
         (call(Capture),plunit_native_annotations:source_snapshot_probe(Entity,Commands,Events)))),
      (assertion_interpretations([a123,a124],null,Batch),
       assertion(Batch.generation==Original),
       forall(member(Item,Batch.items),
         (assertion(Item.generation==Original),assertion(Item.monotonicity==[':MONOTONIC']),
          assertion(Item.assertionPrior.confidence.summary.value==0.97)))),
      (unwrap_predicate(kb_native_annotations:capture_source_data(_,_),tva_source_snapshot_probe),
       thread_send_message(Commands,stop),thread_join(Writer,_),
       message_queue_destroy(Commands),message_queue_destroy(Events),
       with_mutex(openworld_store,
         (retractall(kb_store:generation(_)),assertz(kb_store:generation(Original)))))).

:- end_tests(native_annotations).
