:- begin_tests(dynamic_qlf).
:- use_module('../kb_qlf').
:- use_module('../kb_cache').
:- use_module('../kb_runtime',[native_load/2,native_load/3,native_unload/1,
                               native_load_format/2,xc_form_handle/2,query_modules/6]).
:- use_module(library(filesex)).

fixture(Directory,Input) :-
    tmp_file(powder_qlf,Directory),make_directory(Directory),
    directory_file_path(Directory,'sample.krf.pl',Input),
    terms_digest([fixture],Hash),converter_version(Converter),
    Header=cache{source:'sample.krf',sourceHash:Hash,dialect:krf,mappingHash:none,
      options:[],converter:Converter,mtPolicy:filename_v1,implementationHash:Hash,
      lineCount:3,sizeBytes:100,warnings:[]},
    metadata(a701,x_A,M1),metadata(a702,x_A,M2),metadata(a703,x_B,M3),
    write_cache(Input,Header,[record(a701,x_p(x_a),M1),record(a702,x_p(x_a),M2),
                              record(a703,x_p(x_b),M3)],_).
metadata(Id,Mt,[xc_microtheory(Id,Mt),xc_source_file(Id,'sample.krf'),
                xc_source_line(Id,1),xc_kb_names(Id,[])]).

test(qlf_replaces_data_or_legacy_pl_extension_for_every_source_dialect,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D))]) :-
    forall((member(Dialect,[kif,krf,meld,metta]),member(Extension,[data,pl])),
      (atomic_list_concat([sample,Dialect,Extension],'.',Input),
       atomic_list_concat([sample,Dialect,qlf],'.',Output),
       kb_qlf:paths(Input,Output,_,_))),
    convert_companion(F,[],Result),
    directory_file_path(D,'sample.krf.qlf',Expected),
    assertion(same_file(Result.qlf,Expected)),
    atom_concat(F,'.qlf',Legacy),assertion(\+exists_file(Legacy)).

test(legacy_qlf_remains_readable_but_canonical_takes_precedence,
     [setup(fixture(D,F)),cleanup((native_unload(F),delete_directory_and_contents(D)))]) :-
    convert_companion(F,[],_),
    kb_qlf:paths(F,QLF,Metadata,_),
    atom_concat(F,'.qlf',Legacy),atom_concat(Legacy,'.meta.pl',LegacyMetadata),
    rename_file(QLF,Legacy),rename_file(Metadata,LegacyMetadata),
    native_load(F,legacy_qlf),native_load_format(F,Format),assertion(Format.format==qlf),
    native_unload(F),copy_file(Legacy,QLF),copy_file(LegacyMetadata,Metadata),
    runtime_prebuilt_status(F,Status),assertion(same_file(Status.qlf,QLF)),
    assertion(exists_file(Legacy)),assertion(exists_file(LegacyMetadata)).

test(offline_roundtrip_preserves_duplicates_ids_and_mutability,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D))]) :-
    file_digest(F,Before),
    convert_companion(F,[],Cold),assertion(Cold.status==generated),assertion(Cold.count=:=3),
    convert_companion(F,[],Warm),assertion(Warm.status==cache_hit),
    setup_call_cleanup(load_prebuilt(F,Before,Module,Records),
      (assertion(Records=[native_record(a701,x_p(x_a),_,_),native_record(a702,x_p(x_a),_,_),
                          native_record(a703,x_p(x_b),_,_)]),
       predicate_property(Module:x_p(_),dynamic),predicate_property(Module:x_p(_),multifile),
       assertz(Module:x_added(example),Ref),clause(Module:x_added(example),true,Ref),erase(Ref),
       assertz(Module:x_p(x_c),Added),erase(Added),
       file_digest(F,Before)),
      release_staging(Module)).

test(data_staging_and_metadata_have_exact_native_locations,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D))]) :-
    convert_companion(F,[],Result),file_digest(F,Hash),
    atom_concat(Result.qlf,'.meta.data',Metadata),assertion(exists_file(Metadata)),
    atom_concat(Result.qlf,'-stage.data',Stage),assertion(exists_file(Stage)),
    setup_call_cleanup(load_prebuilt(F,Hash,Module,Records),
      (Records=[native_record(_,_,_,Ref)|_],
      clause_property(Ref,file(Native)),assertion(same_file(Native,Stage)),
      clause_property(Ref,line_count(Line)),assertion(Line>1)),
      release_staging(Module)).

test(changed_input_bypasses_old_qlf,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D))]) :-
    convert_companion(F,[],_),
    setup_call_cleanup(open(F,append,S),format(S,'% changed input~n',[]),close(S)),
    prebuilt_status(F,Status),assertion(Status.state==stale).

test(changed_snapshot_is_an_explicit_error,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D)),
      throws(error(qlf_input_changed(_),_))]) :-
    file_digest(F,Expected),
    setup_call_cleanup(open(F,append,S),format(S,'% replacement~n',[]),close(S)),
    kb_qlf:unchanged_input(F,Expected).

test(installation_failure_releases_loaded_staging,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D))]) :-
    kb_qlf:paths(F,Output,_,_),make_directory(Output),
    catch(convert_companion(F,[],_),Error,true),assertion(nonvar(Error)),
    atom_concat(Output,'-stage.data',Stage),
    assertion(\+source_file_property(Stage,module(_))),
    atom_concat(Output,'-stage.qlf',Generated),assertion(\+exists_file(Generated)),
    assertion(exists_directory(Output)).

test(refuses_unknown_output,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D)),
      throws(error(permission_error(replace,unowned_qlf,_),_))]) :-
    kb_qlf:paths(F,Output,_,_),
    setup_call_cleanup(open(Output,write,S),format(S,'user file~n',[]),close(S)),
    convert_companion(F,[],_).

test(native_qlf_interning_and_owned_snapshot_leases,
    [setup(fixture(D,F)),cleanup((native_unload(F),delete_directory_and_contents(D)))]) :-
    convert_companion(F,[],_),
    native_load(F,qlf_native_one),
    absolute_file_name(F,Absolute),native_load_format(Absolute,Format),
    assertion(Format.format==qlf),
    predicate_property(qlf_native_one:x_p(_),dynamic),
    predicate_property(qlf_native_one:x_p(_),multifile),
    xc_form_handle(a701,Shared),xc_form_handle(a702,Shared),
    findall(Id,kb_forms:mt_record(_,x_A,Id),[a701]),
    assertz(kb_forms:x_p(x_mutable),Added),erase(Added),
    directory_file_path(D,'lease.krf.pl',Lease),copy_file(F,Lease),
    setup_call_cleanup(native_load(Lease,qlf_native_two,[qlf_origin(F)]),
     (native_unload(F),xc_form_handle(a701,Shared),
      query_modules([qlf_native_two],x_p(x_a),x_A,1,2,[_]),
      kb_runtime:module_assertion(qlf_native_two,a701,_,Ref),
      clause_property(Ref,line_count(_)),clause_property(Ref,file(_))),
     native_unload(Lease)),
    assertion(\+kb_forms:mt_record(_,x_A,_)).

test(native_pl_fallback_stays_dynamic_and_multifile,
    [setup(fixture(D,F)),cleanup((native_unload(F),delete_directory_and_contents(D)))]) :-
    native_load(F,qlf_fallback),
    absolute_file_name(F,Absolute),native_load_format(Absolute,Format),
    assertion(Format.format==pl),
    predicate_property(qlf_fallback:x_p(_),dynamic),
    predicate_property(qlf_fallback:x_p(_),multifile).

test(cache_import_prefers_qlf_without_a_readable_pl_companion,
     [setup(fixture(D,F)),cleanup((native_unload(F),delete_directory_and_contents(D)))]) :-
    convert_companion(F,[],_),delete_file(F),
    kb_runtime:import_cache(F,qlf_import),
    native_load_format(F,Format),assertion(Format.format==qlf),
    query_modules([qlf_import],x_p(x_a),x_A,1,2,[_]).

test(runtime_qlf_admission_is_independent_of_builder_identity,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D))]) :-
    convert_companion(F,[],_),
    setup_call_cleanup(
      (retract(kb_qlf:loaded_builder_identity(Original)),assertz(kb_qlf:loaded_builder_identity(changed))),
      (prebuilt_status(F,Offline),assertion(Offline.state==stale),
       runtime_prebuilt_status(F,Runtime),assertion(Runtime.state==current)),
      (retractall(kb_qlf:loaded_builder_identity(_)),assertz(kb_qlf:loaded_builder_identity(Original)))).

test(invalid_qlf_falls_back_to_pl_without_rebuilding,
     [setup(fixture(D,F)),cleanup((native_unload(F),delete_directory_and_contents(D)))]) :-
    convert_companion(F,[],_),kb_qlf:paths(F,QLF,_,_),
    setup_call_cleanup(open(QLF,append,S,[type(binary)]),put_byte(S,0),close(S)),
    file_digest(QLF,Before),native_load(F,invalid_qlf_fallback),
    native_load_format(F,Format),assertion(Format.format==pl),
    file_digest(QLF,Before).

test(rule_body_variables_groups_and_mt_isolation_survive_qlf,
     [setup(fixture(D,F)),cleanup((native_unload(F),delete_directory_and_contents(D)))]) :-
    read_cache(F,Header,_),
    metadata(a710,x_A,M1),metadata(a711,x_A,M2),metadata(a713,x_B,M3),
    RuleMetadata=[xc_microtheory(a712,x_A),xc_source_file(a712,'sample.krf'),
                  xc_source_line(a712,3),xc_kb_names(a712,["?X","?Y","?Z"])],
    write_cache(F,Header,
      [record(a710,x_parent(x_a,x_b),M1),record(a711,x_parent(x_b,x_c),M2),
       record(a712,(x_grandparent(X,Y):-and(x_parent(X,Z),x_parent(Z,Y))),RuleMetadata),
       record(a713,x_parent(x_b,x_d),M3)],_),
    convert_companion(F,[],_),file_digest(F,Hash),
    setup_call_cleanup(load_prebuilt(F,Hash,Staging,Records),
      (member(native_record(a712,Semantic,RuleMetadata,_),Records),
       Semantic=(x_grandparent(A,B):-and(x_parent(C,D0),x_parent(E,G))),
       assertion(A==C),assertion(B==G),assertion(D0==E),
       term_variables(Semantic,Vars),assertion(length(Vars,3)),
       guarded_clause(a712,Semantic,(_:-Guard)),
       Guard=x_cid_io(a712,_,Inputs,Locals),
       assertion(Inputs==vs(A,B)),assertion(Locals==vs(D0))),
      release_staging(Staging)),
    native_load(F,qlf_rule),
    query_modules([qlf_rule],x_grandparent(_,_),x_A,10,2,Solutions),
    assertion(Solutions=[solution(x_A,[x_a,x_c],_)]),
    predicate_property(qlf_rule:x_grandparent(_,_),dynamic),
    predicate_property(qlf_rule:x_grandparent(_,_),multifile).
:- end_tests(dynamic_qlf).
