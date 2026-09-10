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

test(changed_input_bypasses_old_qlf,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D))]) :-
    convert_companion(F,[],_),
    setup_call_cleanup(open(F,append,S),format(S,'% changed input~n',[]),close(S)),
    prebuilt_status(F,Status),assertion(Status.state==stale).

test(refuses_unknown_output,
     [setup(fixture(D,F)),cleanup(delete_directory_and_contents(D)),
      throws(error(permission_error(replace,unowned_qlf,_),_))]) :-
    atom_concat(F,'.qlf',Output),
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
:- end_tests(dynamic_qlf).
