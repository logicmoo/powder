:- begin_tests(advisory_compilation).
:- use_module('../kb_compile').
:- use_module('../kb_cache').
:- use_module('../kb_runtime', []).
:- use_module(library(filesex)).
:- use_module(library(memfile)).
:- use_module(library(prolog_wrap)).
:- use_module(library(uuid)).
:- meta_predicate capture_stderr(0,-), without_shape_analysis(0).

test(compound_microtheory_is_valid_data) :-
    Mt=x_CommonsenseMicrostoryMtFn('x_ViolentImpact-Harm'),
    Semantic=x_genlMt(Mt,x_CommonsenseMicrostoryMt),
    kb_compile:assertion_record('microstories-for-copa.krf',
      assertion(Semantic,[],Mt,44,[],key),a44,Record),
    kb_cache:validate_record(Record),
    Record=record(a44,Retained,Metadata),
    assertion(Retained==Semantic),
    assertion(memberchk(xc_microtheory(a44,Mt),Metadata)),
    assertion(\+member(xc_warnings(_,_),Metadata)).

test(unexpected_shape_is_retained_without_automatic_warning) :-
    Mt=x_ContextFn(x_Test),
    kb_compile:assertion_record('example.krf',
      assertion(x_data(t(1,2)),[],Mt,9,[],key),a45,Record),
    Record=record(a45,Retained,Metadata),
    assertion(Retained==x_data(t(1,2))),
    assertion(\+member(xc_warnings(_,_),Metadata)),
    assertion(\+member(xc_mapping_rows(_,_),Metadata)),
    kb_cache:validate_record(Record).

test(original_metadata_is_preserved_without_analysis) :-
    without_shape_analysis(
      kb_compile:assertion_record('example.krf',[],
        assertion(x_data(t(1,2)),[],[x_UnusualMt],9,
                  [warnings-["Original warning"],mapping_rows-[source_row]],key),
        a46,record(a46,x_data(t(1,2)),Metadata))),
    assertion(memberchk(xc_microtheory(a46,[x_UnusualMt]),Metadata)),
    assertion(memberchk(xc_warnings(a46,["Original warning"]),Metadata)),
    assertion(memberchk(xc_mapping_rows(a46,[source_row]),Metadata)).

test(explicit_validators_are_still_real_checks) :-
    assertion(\+kb_cache:valid_semantic(x_data(t(1,2)))),
    assertion(\+kb_cache:normalized_microtheory([x_UnusualMt])),
    assertion(kb_cache:valid_semantic(x_data(x_a))).

fixture(Directory,File,Options) :-
    source_file(plunit_advisory_compilation:fixture(_,_,_),Here),
    file_directory_name(Here,Tests),directory_file_path(Tests,artifacts,Artifacts),
    uuid(Token),directory_file_path(Artifacts,Token,Directory),make_directory_path(Directory),
    directory_file_path(Directory,'source.krf',File),
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),
      format(S,'(ordinary (4 a))~n',[]),close(S)),
    directory_file_path(Directory,state,State),
    Options=[state_dir(State),progress(none)].

without_shape_analysis(Goal) :-
    setup_call_cleanup(
      wrap_predicate(kb_cache:valid_semantic(_),no_automatic_semantic_shape,_,
                     throw(error(automatic_semantic_shape_check,_))),
      setup_call_cleanup(
        wrap_predicate(kb_cache:normalized_microtheory(_),no_automatic_mt_shape,_,
                       throw(error(automatic_microtheory_shape_check,_))),
        Goal,
        unwrap_predicate(kb_cache:normalized_microtheory(_),no_automatic_mt_shape)),
      unwrap_predicate(kb_cache:valid_semantic(_),no_automatic_semantic_shape)).

test(compile_cache_index_and_native_load_do_not_call_shape_validators,
     [setup(fixture(D,F,O)),cleanup(delete_directory_and_contents(D))]) :-
    capture_stderr(without_shape_analysis(
      (compile_source(F,O,Fresh),assertion(Fresh.status==generated),
       read_cache(Fresh.normalized,_,[record(_,x_ordinary(t(4,x_a)),_)]),
       compile_source(F,O,Warm),assertion(Warm.status==cache_hit),
       setup_call_cleanup(kb_runtime:native_load(Warm.normalized,advisory_disabled),
         once(kb_runtime:module_assertion(advisory_disabled,_,x_ordinary(t(4,x_a)),_)),
         kb_runtime:native_unload(Warm.normalized)))),Output),
    assertion(Output=="").

test(historical_shape_warnings_are_not_replayed_but_other_warnings_remain,
     [setup(fixture(D,F,O)),cleanup(delete_directory_and_contents(D))]) :-
    Message="Unexpected normalized semantic shape; retained unchanged as assertion data.",
    atom_string(AtomMessage,Message),
    Warnings=[warning(F,1,1,Message),warning(F,1,1,AtomMessage),
              warning(F,1,1,"Non-symbol predicate position retained as application data"),
              warning(F,1,1,'Empty expression outside a declared list-data slot; retained unchanged'),
              warning(F,1,1,"Mapping shape mismatch must remain visible")],
    capture_stderr(without_shape_analysis(
      (compile_source(F,O,Fresh),read_cache(Fresh.normalized,Header,[record(Id,Semantic,Original)]),
       select(xc_mapping_rows(Id,Rows),Original,Other),
       append(Rows,[warnings(Message)],HistoricalRows),
       Metadata=[xc_warnings(Id,[Message]),xc_mapping_rows(Id,HistoricalRows)|Other],
       write_cache(Fresh.normalized,Header.put(warnings,Warnings),
                   [record(Id,Semantic,Metadata)],_),
       compile_source(F,O,Warm),
       assertion(Warm.status==cache_hit),assertion(Warm.warnings==Warnings),
       setup_call_cleanup(kb_runtime:native_load(Warm.normalized,advisory_history),
         kb_runtime:module_metadata(advisory_history,warnings,Id,[Message]),
         kb_runtime:native_unload(Warm.normalized)),
       read_cache(Warm.normalized,_,[record(Id,Semantic,Metadata)]))),Output),
    assertion(\+sub_string(Output,_,_,_,"Unexpected normalized semantic shape")),
    assertion(\+sub_string(Output,_,_,_,"Non-symbol predicate position")),
    assertion(\+sub_string(Output,_,_,_,"Empty expression outside a declared list-data slot")),
    findall(Before,sub_string(Output,Before,_,_,"Mapping shape mismatch must remain visible"),Matches),
    assertion(length(Matches,2)).

test(shape_replay_filter_is_prefix_specific) :-
    assertion(historical_semantic_shape_warning(warning(file,1,1,
      "Unexpected normalized semantic shape: additional legacy detail"))),
    assertion(\+historical_semantic_shape_warning(warning(file,1,1,
      "Mapping mismatch: Non-symbol predicate position is not a matching mapping shape"))).

test(shape_analysis_option_is_part_of_cache_identity,
     [setup(fixture(D,F,O)),cleanup(delete_directory_and_contents(D))]) :-
    cache_identity(F,O,Default),
    assertion(memberchk(semantic_shape_checks(false),Default.options)),
    cache_identity(F,[semantic_shape_checks(false)|O],ExplicitDefault),
    assertion(ExplicitDefault==Default),
    cache_identity(F,[semantic_shape_checks(true)|O],Analysis),
    assertion(memberchk(semantic_shape_checks(true),Analysis.options)),
    assertion(Analysis\==Default),
    capture_stderr(without_shape_analysis(
      (compile_source(F,O,First),assertion(First.warnings==[]),
       read_cache(First.normalized,_,[record(Id,_,_)]),
       compile_source(F,[semantic_shape_checks(true)|O],Enabled),
       assertion(Enabled.status==generated),assertion(Enabled.warnings\==[]),
       read_cache(Enabled.normalized,_,[record(Id,_,_)]),
       compile_source(F,O,Disabled),
       assertion(Disabled.status==generated),assertion(Disabled.warnings==[]),
       read_cache(Disabled.normalized,_,[record(Id,_,_)]))),_).

test(explicit_shape_warning_replay_is_opt_in,
     [setup(fixture(D,F,O)),cleanup(delete_directory_and_contents(D))]) :-
    Messages=["Non-symbol predicate position retained as data",
              "Empty expression outside a declared list-data slot; retained",
              "Unexpected normalized semantic shape: retained"],
    findall(warning(F,1,1,M),member(M,Messages),Warnings),
    capture_stderr(without_shape_analysis(
      (compile_source(F,O,Fresh),read_cache(Fresh.normalized,Header,Records),
       write_cache(Fresh.normalized,Header.put(warnings,Warnings),Records,_),
       kb_compile:report_cached_warnings(Warnings,[semantic_shape_checks(true)]),
       setup_call_cleanup(
         kb_runtime:native_load(Fresh.normalized,advisory_explicit,[semantic_shape_checks(true)]),
         true,
         kb_runtime:native_unload(Fresh.normalized)))),Output),
    forall(member(Message,Messages),
      (findall(Before,sub_string(Output,Before,_,_,Message),Matches),
       assertion(length(Matches,2)))).

capture_stderr(Goal,Text) :-
    current_input(In),current_output(Out),stream_property(Err,alias(user_error)),
    setup_call_cleanup(new_memory_file(Memory),
      (setup_call_cleanup(open_memory_file(Memory,write,Capture,[encoding(utf8)]),
         setup_call_cleanup(set_prolog_IO(In,Out,Capture),
           once(Goal),set_prolog_IO(In,Out,Err)),
         close(Capture)),
       memory_file_to_string(Memory,Text)),
      free_memory_file(Memory)).

test(guard_boundary_remains_enforced,[fail]) :-
    kb_cache:storable_semantic(((:-shell(unsafe)) :- and)).
:- end_tests(advisory_compilation).
