:- begin_tests(file_dependencies).
:- use_module('../kb_file_dependencies').
:- use_module('../kb_cache',[write_cache/4,read_cache/3,file_digest/2,converter_version/1]).
:- use_module('../kb_paths',[cache_paths/3]).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(uuid)).

record(N,Semantic,Mt,Record) :-
    format(atom(Id),'a~16r',[N]),term_variables(Semantic,Vars),
    names(Vars,1,Names),
    Record=record(Id,Semantic,[xc_microtheory(Id,Mt),xc_source_file(Id,'Original.kif'),
                              xc_source_line(Id,N),xc_kb_names(Id,Names)]).
names([],_,[]).
names([_|Vars],N,[Name|Names]) :-
    format(string(Name),'?Original-~d',[N]),Next is N+1,names(Vars,Next,Names).
records(Terms,Records) :- records(Terms,1,Records).
records([],_,[]).
records([Term|Terms],N,[Record|Records]) :-
    record(N,Term,x_TestMt,Record),Next is N+1,records(Terms,Next,Records).
analyze(Terms,Info) :- analyze(kif,Terms,Info).
analyze(Dialect,Terms,Info) :-
    records(Terms,Records),length(Records,N),
    analyze_records('Test.kif',cache{dialect:Dialect,count:N},Records,Info),
    assertion(ground(Info)),
    with_output_to(string(_),json_write_dict(current_output,Info)).
symbols(Entries,Symbols) :- findall(S,(member(E,Entries),S=E.symbol),Symbols).
has_symbol(Entries,Symbol) :- member(E,Entries),E.symbol==Symbol,!.
has_reason(Info,Code) :- member(R,Info.reasons),R.code==Code,!.

test(ordinary_fact_references_but_does_not_define) :-
    analyze([x_p(x_a)],I),
    assertion(I.symbols.defined==[]),assertion(I.symbols.declared==[]),
    symbols(I.symbols.referenced,[x_p]),symbols(I.symbols.outbound,[x_p]).

test(implication_uses_consequent_not_antecedent) :-
    analyze([x_implies(x_q(X),x_p(X))],I),
    symbols(I.symbols.defined,[x_p]),
    assertion(has_symbol(I.symbols.outbound,x_q)),
    assertion(\+has_symbol(I.symbols.outbound,x_p)),assertion(var(X)).

test(krf_operator_implication_has_same_static_direction_without_remapping) :-
    analyze(krf,['x_=>'(x_instance(X,x_Class),x_result(X))],I),
    symbols(I.symbols.defined,[x_result]),
    assertion(has_symbol(I.symbols.outbound,x_instance)),
    assertion(\+has_symbol(I.symbols.referenced,x_isa)).

test(declaration_subjects_not_schema_operators_are_local_providers) :-
    analyze([x_arg2Isa(x_p,x_Thing),x_resultIsa(x_fn,x_Thing),
             x_arg3Genl(x_collectionFn,x_Collection),x_resultGenl(x_setFn,x_Collection),
             x_arity(x_p,2),x_p(x_a,x_fn(x_b))],I),
    symbols(I.symbols.declared,[x_collectionFn,x_fn,x_p,x_setFn]),
    assertion(I.symbols.defined==[]),
    assertion(\+has_symbol(I.symbols.outbound,x_p)),
    assertion(\+has_symbol(I.symbols.outbound,x_fn)),
    assertion(has_symbol(I.symbols.outbound,x_arg2Isa)),
    assertion(has_symbol(I.symbols.outbound,x_resultIsa)).

test(antecedent_schema_is_not_an_asserted_local_declaration) :-
    analyze([x_implies(x_argIsa(x_p,1,x_Thing),x_q(x_a))],I),
    assertion(I.symbols.declared==[]),symbols(I.symbols.defined,[x_q]).

test(equivalence_defines_both_directions) :-
    forall(member(Name,[x_equiv,'x_<=>']),
      (Term=..[Name,x_p(X),x_q(X)],analyze([Term],I),
       symbols(I.symbols.defined,[x_p,x_q]),
       assertion(\+has_symbol(I.symbols.outbound,x_p)),
       assertion(\+has_symbol(I.symbols.outbound,x_q)))).

test(mixed_conjunction_disjunction_negation_heads) :-
    analyze([x_implies(x_q(X),x_and(x_p(X),x_or(x_r(X),x_not(x_s(X)))))],I),
    symbols(I.symbols.defined,[x_p,x_r,x_s]),
    member(S,I.symbols.defined),S.symbol==x_s,assertion(S.polarities==[negative]).

test(quantified_whole_rules_and_head_wrappers) :-
    forall(member(Q,[x_forAll,x_forall,x_thereExists,x_exists]),
      (Head=..[Q,X,x_not(x_p(X))],
       Whole=..[Q,X,x_implies(x_q(X),Head)],
       analyze([Whole],I),symbols(I.symbols.defined,[x_p]),
       assertion(var(X)),assertion(I.coverage.definitions==complete))).

test(quantified_and_grouped_ordinary_facts_are_not_definitions) :-
    analyze([x_forAll(X,x_p(X)),x_exists(Y,x_q(Y)),x_and(x_r(x_a),x_s(x_a)),
             x_or(x_u(x_a),x_v(x_b))],I),
    assertion(I.symbols.defined==[]).

test(grouped_rules_preserve_ordinary_fact_roles) :-
    analyze([x_and(x_p(x_a),x_exists(X,x_implies(x_q(X),x_r(X))))],I),
    symbols(I.symbols.defined,[x_r]),assertion(has_symbol(I.symbols.outbound,x_p)).

test(negated_whole_rules_do_not_define_their_conclusions) :-
    analyze([x_not(x_implies(x_q(X),x_p(X)))],I),
    assertion(I.symbols.defined==[]),assertion(var(X)).

test(variable_and_compound_heads_are_partial_not_invented_symbols) :-
    analyze([x_implies(x_q(X),t(P,X)),x_implies(x_r(X),t(x_predicateFn(X),X))],I),
    assertion(I.symbols.defined==[]),assertion(I.coverage.definitions==partial),
    assertion(I.coverage.references==partial),assertion(I.symbols.unresolved\==[]),
    assertion(has_symbol(I.symbols.referenced,x_predicateFn)),
    assertion(var(P)),assertion(var(X)).

test(symbol_grouping_preserves_all_arities_including_two_equals_data) :-
    analyze(['x_<=='(x_p(X),x_q(X)),'x_<=='(x_p(X,x_a),x_q(X),x_r(X))],I),
    findall(E,(member(E,I.symbols.referenced),E.symbol=='x_<=='),[Operator]),
    assertion(Operator.arities==[2,3]),
    findall(D,(member(D,I.symbols.defined),D.symbol==x_p),[Definition]),
    assertion(Definition.arities==[1,2]),
    assertion(has_symbol(I.symbols.outbound,x_q)).

test(executable_envelopes_are_only_inspected_never_called) :-
    analyze([(x_p(X):-and(x_q(X),throw(should_never_run)))],I),
    symbols(I.symbols.defined,[x_p]),
    assertion(has_symbol(I.symbols.outbound,x_q)),
    assertion(I.coverage.references==partial),assertion(var(X)).

test(metta_definitions_and_outbound_are_unknown_not_guessed) :-
    analyze(metta,['x_metta='(x_f(X),x_g(X)),
                   'x_<==='(x_p(X),x_q(X)),
                   metta_exec(x_system("never execute")),
                   metta_value(metta_map{x_a:x_value(x_b)})],I),
    assertion(I.symbols.defined==null),assertion(I.symbols.declared==null),
    assertion(I.symbols.outbound==null),assertion(I.coverage.definitions==unknown),
    assertion(has_symbol(I.symbols.referenced,'x_metta=')),
    assertion(has_symbol(I.symbols.referenced,x_f)),assertion(var(X)).

test(mt_outbound_is_reference_minus_this_files_content_and_declarations) :-
    analyze([x_isa(x_LocalMt,x_Microtheory),x_genlMt(x_LocalMt,x_ExternalMt),
             x_ist(x_TestMt,x_p(x_a))],I),
    findall(K,(member(M,I.microtheories.outbound),K=M.key),[x_ExternalMt]),
    findall(K,(member(M,I.microtheories.provided),K=M.key),[x_LocalMt,x_TestMt]).

test(mt_reference_types_are_evidence_based_not_suffix_guesses) :-
    analyze([x_p(x_ImaginedMt,x_Thing),x_arg1Isa(x_link,x_Microtheory),
             x_link(x_External),x_other(x_External)],I),
    findall(K,(member(M,I.microtheories.outbound),K=M.key),[x_External]),
    assertion(I.coverage.microtheories==partial),
    assertion(has_reason(I,external_mt_schema_unknown)).

test(mt_local_subtype_and_subpredicate_schemas_are_used_without_mt_inheritance) :-
    analyze([x_genls(x_SpecialContext,x_Microtheory),
             x_argIsa(x_link,2,x_SpecialContext),
             x_genlPreds(x_childLink,x_link),x_childLink(x_a,x_Outside)],I),
    findall(K,(member(M,I.microtheories.outbound),K=M.key),[x_Outside]).

test(conditional_mt_type_declarations_do_not_create_providers) :-
    analyze([x_implies(x_q(x_a),x_isa(x_ExternalMt,x_Microtheory)),
             x_ist(x_ExternalMt,x_p(x_a))],I),
    findall(K,(member(M,I.microtheories.outbound),K=M.key),[x_ExternalMt]).

test(compound_context_identity_is_preserved) :-
    Mt=x_MtFn(x_a),record(1,x_ist(Mt,x_p(x_a)),Mt,R),
    analyze_records('Test.kif',cache{dialect:kif,count:1},[R],I),
    assertion(ground(I)),assertion(I.microtheories.outbound==[]),
    I.microtheories.provided=[Entry],
    assertion(sub_atom(Entry.key,0,3,_,'mt:')).

test(implied_mt_is_based_on_actual_contexts_not_default_fallback) :-
    record(1,x_p(x_a),x_Elsewhere,R),
    analyze_records('Expected.kif',cache{dialect:kif,count:1},[R],I),
    assertion(I.microtheories.missingImplied.candidate==x_ExpectedMt),
    assertion(I.microtheories.missingImplied.status==missing),
    assertion(I.microtheories.missingImplied.contentAssertions==0).

test(implied_mt_declaration_does_not_prove_content_in_it) :-
    record(1,x_isa(x_ExpectedMt,x_Microtheory),x_Elsewhere,R),
    analyze_records('Expected.kif',cache{dialect:kif,count:1},[R],I),
    assertion(I.microtheories.missingImplied.status==missing).

test(pure_analysis_does_not_change_reader_directory_cache) :-
    findall(A-B-C,kb_reader:source_case_cache(A,B,C),Before),
    analyze([x_p(x_a)],_),
    findall(A-B-C,kb_reader:source_case_cache(A,B,C),After),
    assertion(Before==After).

test(migrated_windows_path_retains_recorded_basename_case,
     [condition(current_prolog_flag(windows,true))]) :-
    record(1,x_p(x_a),x_tinyKB,R),
    analyze_records('tinykb.kif',cache{dialect:kif,count:1,source:'KBs/tinyKB.kif'},[R],I),
    assertion(I.microtheories.missingImplied.candidate==x_tinyKB),
    assertion(I.microtheories.missingImplied.status==present).

test(incomplete_context_evidence_is_unknown_not_empty) :-
    analyze_records('Expected.kif',cache{dialect:kif,count:2},[],I),
    assertion(I.coverage.records==partial),
    assertion(I.coverage.definitions==partial),
    assertion(I.microtheories.missingImplied.status==unknown),
    assertion(I.microtheories.missingImplied.contentAssertions==null).

test(missing_mt_metadata_does_not_become_a_filename_context) :-
    R=record(a1,x_p(x_a),[xc_source_file(a1,'Expected.kif'),xc_source_line(a1,1),
                           xc_kb_names(a1,[])]),
    analyze_records('Expected.kif',cache{dialect:kif,count:1},[R],I),
    assertion(I.coverage.contexts==partial),
    assertion(I.microtheories.provided==[]),
    assertion(I.microtheories.missingImplied.status==unknown).

test(provenance_and_variable_names_are_preserved_without_mutation) :-
    R=record(a1,x_implies(x_q(X),x_p(X)),[xc_microtheory(a1,x_TestMt),
      xc_source_file(a1,'KBs/old-name.kif'),xc_source_line(a1,13514),
      xc_kb_names(a1,["??Foo-Bar"])]),
    analyze_records('New.kif',cache{dialect:kif,count:1,source:'KBs/old-name.kif'},[R],I),
    I.symbols.defined=[Definition],Definition.evidence=[E],
    assertion(E.id==a1),assertion(E.sourceFile=='KBs/old-name.kif'),
    assertion(E.line==13514),assertion(E.variableNames==["??Foo-Bar"]),
    assertion(I.source.originalPath=='KBs/old-name.kif'),assertion(var(X)).

test(evidence_samples_are_bounded_but_counts_are_not) :-
    findall(x_p(N),between(1,30,N),Terms),analyze(Terms,I),
    I.symbols.referenced=[P],assertion(P.evidenceCount==30),length(P.evidence,12).

fixture_dir(Dir) :-
    source_file(plunit_file_dependencies:fixture_dir(_),Here),
    file_directory_name(Here,Tests),directory_file_path(Tests,artifacts,Artifacts),
    make_directory_path(Artifacts),uuid(Uuid),directory_file_path(Artifacts,Uuid,Dir),
    make_directory_path(Dir),clear_dependency_cache.
cleanup_dir(Dir) :- clear_dependency_cache,delete_directory_and_contents(Dir).
write_text(File,Text) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),format(S,'~s',[Text]),close(S)).
cache_fixture(Dir,Source,Cache) :-
    directory_file_path(Dir,'broken-source.kif',Source),
    write_text(Source,"THIS IS DELIBERATELY INVALID KIF ((("),
    cache_paths(Source,Cache,_),file_digest(Source,Hash),size_file(Source,Size),
    converter_version(Version),
    H=cache{source:'KBs/historical-location.kif',sourceHash:Hash,dialect:kif,
      mappingHash:none,options:[],converter:Version,mtPolicy:filename_v1,
      implementationHash:Hash,lineCount:1,sizeBytes:Size,warnings:[]},
    record(1,x_implies(x_q(X),x_p(X)),x_TestMt,R),write_cache(Cache,H,[R],_).

test(serialized_cache_is_read_as_data_without_compiling_source,
     [setup(fixture_dir(D)),cleanup(cleanup_dir(D))]) :-
    cache_fixture(D,Source,Cache),file_digest(Source,Before),
    file_dependencies(Source,I),assertion(ground(I)),
    assertion(I.cache.validation==validated),assertion(I.status==partial),
    symbols(I.symbols.defined,[x_p]),
    assertion(I.source.originalPath=='KBs/historical-location.kif'),
    assertion(has_reason(I,source_freshness_unverified)),
    file_dependencies(Source,Again),assertion(Again==I),
    file_digest(Source,After),assertion(Before==After),
    cache_paths(Source,_,Index),assertion(\+exists_file(Index)),
    read_cache(Cache,_,_),directory_files(D,Files),sort(Files,Sorted),
    assertion(Sorted==['.','..','broken-source.kif','broken-source.kif.data']).

test(missing_cache_is_unavailable_without_creating_artifacts,
     [setup(fixture_dir(D)),cleanup(cleanup_dir(D))]) :-
    directory_file_path(D,'not-compiled.krf',Source),write_text(Source,"(p a)"),
    file_dependencies(Source,I),assertion(I.status==unavailable),
    assertion(I.symbols.outbound==null),assertion(has_reason(I,cache_missing)),
    cache_paths(Source,Cache,_),assertion(\+exists_file(Cache)).

test(stale_cache_is_unavailable_and_does_not_recompile,
     [setup(fixture_dir(D)),cleanup(cleanup_dir(D))]) :-
    cache_fixture(D,Source,Cache),file_dependencies(Source,Before),
    assertion(Before.status==partial),
    file_digest(Cache,Hash),write_text(Source,"changed"),
    file_dependencies(Source,I),assertion(I.status==unavailable),
    assertion(has_reason(I,cache_stale)),assertion(I.symbols.defined==null),
    file_digest(Cache,Same),assertion(Hash==Same).

test(invalid_cache_reports_typed_error_without_running_directives,
     [setup(fixture_dir(D)),cleanup(cleanup_dir(D))]) :-
    cache_fixture(D,Source,Cache),
    write_text(Cache,":- throw(should_never_execute).\n"),
    file_dependencies(Source,I),assertion(I.status==unavailable),
    assertion(has_reason(I,invalid_cache)),assertion(I.error.code==invalid_cache).

test(cache_replacement_invalidates_derived_result,
     [setup(fixture_dir(D)),cleanup(cleanup_dir(D))]) :-
    cache_fixture(D,Source,Cache),file_dependencies(Source,Before),
    symbols(Before.symbols.defined,[x_p]),read_cache(Cache,H,_),
    record(2,x_other(x_value),x_TestMt,R),write_cache(Cache,H,[R],_),
    file_dependencies(Source,After),assertion(After.symbols.defined==[]),
    symbols(After.symbols.referenced,[x_other]).

:- end_tests(file_dependencies).
