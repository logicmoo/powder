:- begin_tests(logos_compiler).

:- use_module('../kb_cache').
:- use_module('../kb_compile').
:- use_module('../kb_ids').
:- use_module('../kb_index').
:- use_module('../kb_editor').
:- use_module('../kb_runtime', []).
:- use_module('../compile_kb', [parse_arguments/3]).
:- use_module(library(filesex)).
:- use_module(library(readutil)).
:- use_module(library(process)).
:- use_module(library(uuid)).
:- use_module(library(memfile)).
:- use_module(library(prolog_wrap)).

test_dir(Dir) :-
    source_file(plunit_logos_compiler:test_dir(_),Here),
    file_directory_name(Here,Tests),
    directory_file_path(Tests,artifacts,Artifacts),
    make_directory_path(Artifacts),uuid(Token),
    directory_file_path(Artifacts,Token,Dir),make_directory_path(Dir).
clean_dir(Dir) :- delete_directory_and_contents(Dir).
fixture(Dir,Name,Text,File) :-
    directory_file_path(Dir,Name,File),
    setup_call_cleanup(open(File,write,S,[encoding(utf8),newline(posix)]),
                       format(S,'~s',[Text]),close(S)).
opts(Dir,[state_dir(State),progress(none),diagnostics(false)]) :-
    directory_file_path(Dir,state,State).

test(process_allocator_override_is_isolated_and_explicit_options_win,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    (getenv('POWDER_STATE_DIR',Value)->Previous=some(Value);Previous=none),
    directory_file_path(D,environment,Environment),directory_file_path(D,explicit,Explicit),
    setup_call_cleanup(setenv('POWDER_STATE_DIR',Environment),
      (state_directory([],Actual),same_file(Actual,Environment),
       state_directory([state_dir(Explicit)],Selected),same_file(Selected,Explicit)),
      (Previous=some(Value)->setenv('POWDER_STATE_DIR',Value);unsetenv('POWDER_STATE_DIR'))).

header(File,Header) :-
    terms_digest([fixture],Hash),converter_version(Converter),
    Header=cache{source:File,sourceHash:Hash,dialect:kif,mappingHash:none,
        options:[],converter:Converter,mtPolicy:filename_v1,
        implementationHash:Hash,
        lineCount:3,sizeBytes:50,warnings:[]}.
metadata(Id,Names,[xc_microtheory(Id,x_TestMt),xc_source_file(Id,'test.kif'),
                  xc_source_line(Id,1),xc_kb_names(Id,Names)]).

test(one_line_real_variable_roundtrip,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'fixture.pl',"",P),header('test.kif',H),
    metadata(a123,["??Foo-Bar"],M),
    S=x_note(X,x_nested(X,"first\nsecond\rthird")),
    write_cache(P,H,[record(a123,S,M)],Written),
    assertion(var(X)),
    read_cache(P,Written,[record(a123,Read,Metadata)]),
    Read=x_note(Y,x_nested(Z,Text)),assertion(Y==Z),assertion(var(Y)),
    assertion(Text=="first\nsecond\rthird"),
    assertion(memberchk(xc_kb_names(a123,["??Foo-Bar"]),Metadata)),
    read_file_to_string(P,Raw,[]),split_string(Raw,"\n","",Lines),
    length(Lines,9),
    assertion(\+sub_string(Raw,_,_,_,"$VAR")).

test(streaming_digest_preserves_exact_line_bytes) :-
    Terms=[x_text("first\n\nlast\r\n",'\nquoted\r',X,X),
           x_unicode("\u03bb \U0001f600"),[],x_empty(""),x_slashes("\\n\\r")],
    maplist(legacy_term_line,Terms,LegacyLines),
    atomic_list_concat(LegacyLines,'',LegacyText),
    kb_cache:crypto_data_hash(LegacyText,Expected,[algorithm(sha256),encoding(utf8)]),
    terms_digest(Terms,Actual),assertion(Actual==Expected),
    maplist(term_line,Terms,Lines),assertion(Lines==LegacyLines),
    terms_digest([],Empty),
    kb_cache:crypto_data_hash("",ExpectedEmpty,[algorithm(sha256),encoding(utf8)]),
    assertion(Empty==ExpectedEmpty),assertion(var(X)).

test(record_validation_does_not_retain_batch_choicepoints) :-
    metadata(a123,[],M),Record=record(a123,x_p(x_a),M),
    call_cleanup(kb_cache:validate_record(Record),Deterministic=true),
    assertion(Deterministic==true),
    length(Records,10000),maplist(=(Record),Records),
    call_cleanup(maplist(kb_cache:validate_record,Records),BatchDeterministic=true),
    assertion(BatchDeterministic==true).

test(imported_cache_ids_are_checked_for_conflicts,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'first.pl',"",First),fixture(D,'second.pl',"",Second),
    header(First,H1),header(Second,H2),
    M1=[xc_microtheory(a123,x_TestMt),xc_source_file(a123,First),
        xc_source_line(a123,1),xc_kb_names(a123,[])],
    M2=[xc_microtheory(a123,x_TestMt),xc_source_file(a123,First),
        xc_source_line(a123,1),xc_kb_names(a123,[])],
    write_cache(First,H1,[record(a123,x_imported(x_first),M1)],_),
    write_cache(Second,H2,[record(a123,x_imported(x_second),M2)],_),
    setup_call_cleanup(kb_runtime:import_cache(First,ow_import_first),
      (catch(kb_runtime:import_cache(Second,ow_import_second),Error,true),
       assertion(nonvar(Error)),
       kb_runtime:query_modules([ow_import_first],x_imported(_),x_TestMt,1,3,
         [solution(x_TestMt,[x_first],_)]),
       assertion(\+kb_runtime:module_assertion(ow_import_second,_,_,_))),
      kb_runtime:native_unload(First)).

test(source_id_properties_remain_provenance,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'source.krf',"(p a)\n",File),opts(D,Options),
    A=assertion(x_p(x_a),[],x_TestMt,1,[id-a123],source_id_fixture),
    assign_ids(File,[A],Options,[Id]),assertion(Id\==a123),
    kb_compile:assertion_record(File,A,Id,record(Id,x_p(x_a),Metadata)),
    assertion(memberchk(xc_id(Id,a123),Metadata)).

legacy_term_line(Term,Line) :-
    safe_variable_names(Term,Names),
    with_output_to(string(Text),
      kb_cache:write_term_text(Term,[quoted(true),character_escapes(true),numbervars(false),
                                  variable_names(Names),cycles(false)])),
    string_codes(Text,Codes),phrase(kb_cache:escaped_lines(Codes),Escaped),
    string_codes(Single,Escaped),string_concat(Single,".\n",Line).

test(rule_fixed_groups) :-
    S=(x_grandparent(X,Y):-and(x_parent(X,Z),x_parent(Z,Y))),
    guarded_clause(a123,S,Clause),
    assertion(Clause==(x_grandparent(X,Y):-x_cid_io(a123,and(x_parent(X,Z),x_parent(Z,Y)),vs(X,Y),vs(Z)))),
    assertion(var(X)),assertion(var(Y)),assertion(var(Z)).

test(empty_rule_groups) :-
    guarded_clause(a123,(x_true:-and),Clause),
    assertion(Clause==(x_true:-x_cid_io(a123,and,vs,vs))).

test(constants_nested_and_structures) :-
    S=(t(x_functor(x_a),X,metta_map{x_key:x_val},[x_a,x_z]):-and(x_q(X,x_ContextMt))),
    semantic_constants(S,Cs),
    assertion(Cs==['x_ContextMt',x_a,x_functor,x_key,x_q,x_val,x_z]),
    assertion(var(X)),
    semantic_signature(S,signature(compound_predicate,3)).

test(metta_structural_wrappers_are_exact) :-
    assertion(valid_semantic(metta_value(metta_expression([])))),
    assertion(valid_semantic(metta_exec(x_task(x_arg)))),
    assertion(\+valid_semantic(metta_execution(x_task))),
    assertion(\+valid_semantic(kb_metta_value(x_a))),
    assertion(\+valid_semantic(metta_value(metta_expression(x_a)))),
    assertion(\+valid_semantic(metta_value(metta_exec(x_a,x_b)))).

test(genformat_third_list_contains_only_structural_literals) :-
    Term=x_genFormat(x_p,"~a",[1,[2,'A-THE-WORD'],x_literal,X]),
    assertion(valid_semantic(Term)),
    semantic_constants(Term,Constants),
    assertion(Constants==[x_genFormat,x_p]),assertion(var(X)),
    assertion(\+valid_semantic(x_other([1,'A-THE-WORD']))),
    Application=x_genFormat(x_p,"~a",[x_application(x_a)]),
    assertion(valid_semantic(Application)),
    semantic_constants(Application,ApplicationConstants),
    assertion(ApplicationConstants==[x_a,x_application,x_genFormat,x_p]),
    semantic_constants(x_other([x_literal]),Ordinary),
    assertion(Ordinary==[x_literal,x_other]).

test(rejects_untrusted_header,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'bad.pl',":- shell('unsafe').\n",P),
    assertion(catch((read_cache(P,_,_),fail),_,true)).

test(digest_detects_tampering,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'cache.pl',"",P),header('test.kif',H),metadata(a123,[],M),
    write_cache(P,H,[record(a123,x_p(x_a),M)],_),
    read_file_to_string(P,Text,[]),
    re_replace_literal(Text,"x_a","x_b",Bad),
    fixture(D,'cache.pl',Bad,P),
    assertion(catch((read_cache(P,_,_),fail),_,true)).

re_replace_literal(Text,From,To,Result) :-
    sub_string(Text,Before,_,After,From),!,
    sub_string(Text,0,Before,_,Prefix),sub_string(Text,_,After,0,Suffix),
    atomics_to_string([Prefix,To,Suffix],Result).

test(stable_occurrences_and_duplicates,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    opts(D,Options),
    As=[assertion(x_p,[],x_Mt,1,[],key(p)),
        assertion(x_p,[],x_Mt,2,[],key(p)),
        assertion(x_q,[],x_Mt,3,[],key(q))],
    assign_ids(source,As,Options,Ids),
    Ids=[A,B,C],assertion(A\==B),assertion(B\==C),
    As2=[assertion(x_p,[],x_Mt,10,[],key(p)),
         assertion(x_p,[],x_Mt,20,[],key(p)),
         assertion(x_q,[],x_Mt,30,[],key(q))],
    assign_ids(source,As2,Options,Again),assertion(Ids==Again),
    maplist(valid_assertion_id,Ids).

test(highwater_clock_rollback,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    Future=9000000000000000,
    terms_digest([highwater(Future)],Hash),
    directory_file_path(D,'allocator.journal',J),
    setup_call_cleanup(open(J,write,S,[encoding(utf8)]),
       write_one_line(S,reservation(Future,Hash)),close(S)),
    reserve_ids(D,2,[A,B]),
    format(atom(ExpectedA),'a~16r',[Future+1]),
    format(atom(ExpectedB),'a~16r',[Future+2]),
    assertion(A==ExpectedA),assertion(B==ExpectedB).

test(highwater_recovers_torn_tail,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    reserve_ids(D,1,[First]),
    directory_file_path(D,'allocator.journal',J),
    setup_call_cleanup(open(J,append,S),format(S,'reservation(12345',[ ]),close(S)),
    reserve_ids(D,1,[Second]),reserve_ids(D,1,[Third]),
    assertion(First\==Second),assertion(Second\==Third).

test(repair_inputs) :-
    forall(member(Text-Action,[""-edit," \t "-edit,"s"-skip,"S"-suppress,
                              "q"-abort,"quit"-abort,"Q"-invalid,end_of_file-abort]),
           assertion(parse_repair_response(Text,Action))).

test(cli_options) :-
    parse_arguments(['--force','--no-progress','--state-dir=C:\\state','A.kif','B.krf'],
                    [force(true),progress(none),state_dir('C:\\state')],['A.kif','B.krf']).

test(cli_usage_failure_and_success_exit_codes,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'bad.krf',"(unclosed",F),
    directory_file_path(D,state,State),atom_concat('--state-dir=',State,StateArg),
    cli_exit(['--bad-option'],2),
    cli_exit(['--no-progress',StateArg,F],1),
    fixture(D,'good.krf',"(isa a b)\n",Good),
    cli_exit(['--no-progress',StateArg,Good],0).

test(compile_kif_and_warm_forced_ids,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'tinyKB.kif',"(instance Fido Dog)\n(instance ?X Dog)\n(<=== (grandparent ?X ?Y) (parent ?X ?Z) (parent ?Z ?Y))\n",F),
    opts(D,Options),
    compile_source(F,Options,A),assertion(A.status==generated),
    read_cache(A.normalized,_,Records),
    Records=[record(Id1,x_isa(x_Fido,x_Dog),M),record(Id2,x_isa(X,x_Dog),_),record(Id3,Rule,_)],
    assertion(var(X)),assertion(memberchk(xc_kb_names(Id1,[]),M)),
    assertion(memberchk(xc_microtheory(Id1,x_tinyKB),M)),
    Rule=(x_grandparent(P,Q):-and(x_parent(P,R),x_parent(R,Q))),
    compile_source(F,Options,B),assertion(B.status==cache_hit),
    compile_source(F,[force(true)|Options],C),assertion(C.status==generated),
    read_cache(C.normalized,_,New),
    findall(Id,member(record(Id,_,_),New),[Id1,Id2,Id3]),
    read_index(C.index,_,Idx),assertion(same_file(Idx.source,F)).

test(old_converter_cache_is_rebuilt_with_numeric_values,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'numbers.krf',"(numberValue .5)\n",F),opts(D,Options),
    compile_source(F,Options,Initial),
    read_cache(Initial.normalized,Header,[record(Id,x_numberValue(0.5),Metadata)]),
    guarded_clause(Id,x_numberValue('x_.5'),OldClause),
    Terms=[OldClause|Metadata],terms_digest(Terms,Digest),
    OldHeader=Header.put(_{converter:logos_compiler_v1,normalizedDigest:Digest}),
    terms_digest([OldHeader],HeaderDigest),
    kb_cache:helper_path(Helper),
    setup_call_cleanup(open(Initial.normalized,write,S,[encoding(utf8),newline(posix)]),
       (write_one_line(S,(:-use_module(Helper),kb_tail_loader:load_remaining)),
        write_one_line(S,kb_cache_header(OldHeader)),
        forall(member(Term,Terms),write_one_line(S,Term)),
        write_one_line(S,kb_cache_footer(footer{count:1,digest:Digest,headerDigest:HeaderDigest}))),
       close(S)),
    assertion(catch((read_cache(Initial.normalized,_,_),fail),_,true)),
    compile_source(F,Options,Rebuilt),
    assertion(Rebuilt.status==generated),
    read_cache(Rebuilt.normalized,Current,[record(Id,x_numberValue(0.5),_)]),
    converter_version(Current.converter).

test(implementation_fingerprint_invalidates_cache_without_changing_ids,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'fingerprint.krf',"(p ?X)\n",F),opts(D,Options),
    compile_source(F,Options,Initial),
    read_cache(Initial.normalized,Header,Records),
    implementation_hash(Current),assertion(Header.implementationHash==Current),
    terms_digest([previous_implementation],Previous),
    assertion(Previous\==Current),
    write_cache(Initial.normalized,Header.put(implementationHash,Previous),Records,_),
    compile_source(F,Options,Rebuilt),
    assertion(Rebuilt.status==generated),
    read_cache(Rebuilt.normalized,Fresh,Copied),
    assertion(Fresh.implementationHash==Current),
    assertion(Copied =@= Records).

test(implementation_fingerprint_is_invocation_local) :-
    kb_compile:with_path_cache(
       once((implementation_hash(Hash),implementation_hash(Hash),
             findall(H,kb_compile:implementation_identity_cache(H),Cached),
             assertion(Cached==[Hash])))),
    assertion(\+kb_compile:implementation_identity_cache(_)).

test(stale_loaded_implementation_requires_restart_before_claim,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'restart.krf',"(p a)\n",F),opts(D,Options),
    terms_digest([previous_loaded_code],Previous),
    setup_call_cleanup(
       (retract(kb_compile:loaded_implementation_identity(Loaded)),
        assertz(kb_compile:loaded_implementation_identity(Previous))),
       once((catch(compile_source(F,Options,_),
                   error(implementation_changed_restart_required,_),Caught=true),
             assertion(Caught==true))),
       (retractall(kb_compile:loaded_implementation_identity(_)),
        assertz(kb_compile:loaded_implementation_identity(Loaded)))),
    atom_concat(F,'.pl.lock',Lock),assertion(\+exists_file(Lock)).

test(krf_never_maps_and_metta_inert,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'tinyKB.krf',"(instance Item Class)\n(exists (IndexicalFn currentRole))\n(<== (p ?X) (q ?X))\n",K),
    fixture(D,'data.metta',"!(danger $x)\n([] a b)\n((a b) (c d))\n()\n",M),
    opts(D,Options),
    compile_source(K,Options,KR),read_cache(KR.normalized,_,KRs),
    KRs=[record(_,x_instance(x_Item,x_Class),_)|_],
    member(record(_,'x_<=='(_,_),_),KRs),
    compile_source(M,Options,MR),read_cache(MR.normalized,_,MRs),
    assertion(MR.count==4),
    assertion(member(record(_,metta_value(metta_expression([])),_),MRs)),
    findall(C,(member(record(_,Sem,_),MRs),semantic_constants(Sem,C)),Cs),
    assertion(\+member([metta_map],Cs)).

test(layout_edits_preserve_real_occurrence_ids,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'layout.krf',"(isa ?X Dog)\n(isa ?X Dog)\n",F),opts(D,O),
    compile_source(F,O,First),read_cache(First.normalized,_,A),
    fixture(D,'layout.krf',"; a harmless comment\n\n( isa\n  ?X Dog )\n\n(isa ?X Dog)\n",F),
    compile_source(F,O,Second),read_cache(Second.normalized,_,B),
    findall(Id,member(record(Id,_,_),A),Ids),
    findall(Id,member(record(Id,_,_),B),Ids),
    Ids=[One,Two],assertion(One\==Two).

test(mapping_warning_cache_and_strict_preserve_source,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'tinyKB.kif',"(part a b c)\n",F),opts(D,O),
    file_digest(F,Original),
    compile_source(F,O,R),assertion(R.warnings=[warning(_,1,_,_)]),
    read_cache(R.normalized,_,[record(_,x_part(x_a,x_b,x_c),_)]),
    file_digest(R.normalized,GoodCache),
    compile_source(F,O,Warm),assertion(Warm.status==cache_hit),
    assertion(Warm.warnings==R.warnings),
    compile_sources([F],[strict_mappings(true)|O],Strict),
    assertion(Strict.failures==1),
    file_digest(F,Original),file_digest(R.normalized,GoodCache).

test(failed_source_retains_all_warning_counts,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    directory_file_path(D,'tinyKB.kif',F),
    setup_call_cleanup(open(F,write,S,[encoding(utf8),newline(posix)]),
       (forall(between(1,12,_),format(S,'(part a b c)~n',[])),
        format(S,'(unfinished',[])),close(S)),
    opts(D,Options),compile_sources([F],Options,R),
    assertion(R.failures==1),assertion(R.warnings==12),
    R.results=[Failed],assertion(Failed.status==failed),
    length(Failed.warnings,12),
    forall(member(warning(_,_,_,Message),Failed.warnings),
           assertion(\+sub_string(Message,_,_,_,"suppressed"))).

test(cache_hit_never_reanalyzes_shapes_or_replays_stored_warnings,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'shapes.krf',"(p (4 a))\n",F),opts(D,Options),
    compile_source(F,Options,Cold),assertion(Cold.warnings\=[]),
    file_digest(Cold.normalized,NormalHash),file_digest(Cold.index,IndexHash),
    select(diagnostics(false),Options,VisibleOptions),
    setup_call_cleanup(
      (wrap_predicate(kb_reader:read_source(_,_,_,_),cache_hit_probe,_,
          throw(error(cache_hit_entered_reader,_))),
       wrap_predicate(kb_cache:valid_semantic(_),cache_hit_probe,_,
          throw(error(cache_hit_entered_semantic_analysis,_))),
       wrap_predicate(kb_compile:generate_pair(_,_,_,_,_),cache_hit_probe,_,
          throw(error(cache_hit_entered_cache_builder,_))),
       wrap_predicate(kb_index:build_index(_,_,_),cache_hit_probe,_,
          throw(error(cache_hit_entered_index_builder,_)))),
      (capture_stderr(compile_sources([F],VisibleOptions,Warm),Text),
       assertion(Text==""),assertion(Warm.cacheHits=:=1),
       assertion(Warm.generated=:=0),assertion(Warm.failures=:=0),
       length(Cold.warnings,Count),assertion(Warm.warnings=:=Count),
       Warm.results=[Result],assertion(Result.warnings==Cold.warnings),
       file_digest(Cold.normalized,NormalHash),file_digest(Cold.index,IndexHash)),
      (unwrap_predicate(kb_reader:read_source(_,_,_,_),cache_hit_probe),
       unwrap_predicate(kb_cache:valid_semantic(_),cache_hit_probe),
       unwrap_predicate(kb_compile:generate_pair(_,_,_,_,_),cache_hit_probe),
       unwrap_predicate(kb_index:build_index(_,_,_),cache_hit_probe))).

capture_stderr(Goal,Text) :-
    current_input(In),current_output(Out),stream_pair(user_error,_,Err),
    setup_call_cleanup(new_memory_file(Memory),
      (setup_call_cleanup(open_memory_file(Memory,write,Capture,[encoding(utf8)]),
        setup_call_cleanup(set_prolog_IO(In,Out,Capture),once(Goal),set_prolog_IO(In,Out,Err)),
        close(Capture)),memory_file_to_string(Memory,Text)),
      free_memory_file(Memory)).

test(metadata_nil_and_unknown_properties,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    Text="(:DIRECTION :FORWARD :CREATOR NIL :CREATION-DATE NIL :MICROTHEORY BaseKB :Custom-Property (literal nil \"\") :KIF (p))\n",
    fixture(D,'metadata.krf',Text,F),opts(D,O),compile_source(F,O,R),
    read_cache(R.normalized,_,[record(Id,x_p,M)]),
    assertion(memberchk(xc_direction(Id,':FORWARD'),M)),
    assertion(memberchk(xc_kb_names(Id,[]),M)),
    assertion(\+member(xc_creator(_,_),M)),assertion(\+member(xc_creation_date(_,_),M)),
    member(Unknown,M),functor(Unknown,'xc_cyc::Custom-Property',2),!.

test(rejects_footer_without_final_newline,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'cache.pl',"",P),header('test.kif',H),metadata(a123,[],M),
    write_cache(P,H,[record(a123,x_p(x_a),M)],_),
    read_file_to_string(P,Text,[]),string_concat(Truncated,"\n",Text),
    fixture(D,'cache.pl',Truncated,P),
    assertion(catch((read_cache(P,_,_),fail),_,true)).

test(batch_continues_and_preserves_old,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'a.kif',"(broken",A),
    fixture(D,'b.krf',"(isa a b)\n",B),
    fixture(D,'c.kif',")",C),
    fixture(D,'d.krf',"(isa c d)\n",E),
    opts(D,Options),
    compile_sources([A,B,C,E],Options,S),
    assertion(S.failures==2),assertion(S.generated==2),assertion(S.exitCode==1),
    atom_concat(B,'.pl',P),file_digest(P,Before),
    fixture(D,'b.krf',"(broken",B),
    compile_sources([B],Options,S2),assertion(S2.failures==1),
    file_digest(P,After),assertion(Before==After).

test(batch_continues_after_missing_selected_source,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    directory_file_path(D,'missing.krf',Missing),
    fixture(D,'good.krf',"(isa a b)\n",Good),opts(D,Options),
    compile_sources([Missing,Good],Options,R),
    assertion(R.generated==1),assertion(R.failures==1),assertion(R.exitCode==1).

test(native_rule_roundtrip_reload_unload,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    Text="(in-microtheory FamilyMt)\n(parent alice bob)\n(parent bob carol)\n(<=== (grandparent ?X ?Y) (parent ?X ?Z) (parent ?Z ?Y))\n(<== (p ?X) (q ?X))\n",
    fixture(D,'family.krf',Text,F),opts(D,Options),compile_source(F,Options,R),
    Module=logos_compiler_native_fixture,
    setup_call_cleanup(kb_runtime:native_load(R.normalized,Module),
       once((kb_runtime:query_modules([Module],x_grandparent(x_alice,_Y),x_FamilyMt,5,5,Solutions),
        assertion(Solutions=[solution(x_FamilyMt,[x_carol],_)]),
        kb_runtime:module_assertion(Module,_,_,Ref),
        clause_property(Ref,file(NativeFile)),assertion(same_file(NativeFile,R.normalized)),
        clause_property(Ref,line_count(Line)),assertion(Line>1),
        kb_runtime:native_load(R.normalized,Module),
        findall(Id,kb_runtime:module_assertion(Module,Id,_,_),Ids),length(Ids,4))),
       kb_runtime:native_unload(R.normalized)),
    assertion(\+kb_runtime:module_assertion(Module,_,_,_)).

test(cache_and_index_accept_immutable_snapshot_paths,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'source.krf',"(isa ?X Dog)\n",F),opts(D,Options),
    compile_source(F,Options,R),
    directory_file_path(D,'renamed-snapshot.pl',Snapshot),
    directory_file_path(D,'renamed-snapshot.index.pl',SnapshotIndex),
    copy_file(R.normalized,Snapshot),copy_file(R.index,SnapshotIndex),
    read_cache(R.normalized,Header,Original),
    read_cache(Snapshot,Header,Copied),
    assertion(Copied =@= Original),
    assertion(same_file(Header.source,F)),
    read_index(SnapshotIndex,IndexHeader,_),
    assertion(IndexHeader.normalizedDigest==Header.normalizedDigest).

test(windows_repository_relative_case_is_preserved,
     [condition(current_prolog_flag(windows,true)),
      setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    directory_file_path(D,'MixedFolder',Mixed),
    directory_file_path(Mixed,'DeeperKB',Nested),make_directory_path(Nested),
    fixture(Nested,'ContextMt.krf',"(isa a b)\n",F),opts(D,Options),
    downcase_atom(F,Lower),
    compile_source(Lower,Options,R),
    assertion(R.source==F),
    read_cache(R.normalized,Header,[record(Id,_,Metadata)]),
    assertion(Header.source==F),
    assertion(memberchk(xc_microtheory(Id,x_ContextMt),Metadata)),
    discover_sources([Mixed,Lower,F],Files),assertion(Files==[F]),
    compile_source(Lower,Options,Warm),assertion(Warm.status==cache_hit).

test(windows_discovery_skips_real_directory_junction,
     [condition(current_prolog_flag(windows,true)),
      setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'safe.krf',"(isa a b)\n",F),
    directory_file_path(D,'Loop',Junction),
    setup_call_cleanup(junction_action(junction,Junction,D),
       once((discover_sources([D,D,Junction,F],Files),
             assertion(Files==[F]),
             assertion(catch((discover_sources([Junction],_),fail),_,true)))),
       junction_action('remove-junction',Junction,D)),
    assertion(exists_file(F)).

test(recovery_only_affected_and_stage_promotion,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'a.krf',"(isa a b)\n",F),
    fixture(D,'unrelated.krf',"(isa c d)\n",Other),
    opts(D,Options),compile_source(F,Options,R),
    stage_path(R.normalized,Stage),copy_file(R.normalized,Stage),
    delete_file(R.normalized),
    atom_concat(R.normalized,'.tmp',Marker),
    setup_call_cleanup(open(Marker,write,S),write_one_line(S,kb_compile_claim(1,F,0,0)),close(S)),
    recover_sources([D],Options,Summary),
    assertion(Summary.generated==1),assertion(Summary.failures==0),
    assertion(exists_file(R.normalized)),assertion(\+exists_file(Stage)),
    atom_concat(Other,'.pl',OtherCache),assertion(\+exists_file(OtherCache)),
    recover_sources([D],Options,Empty),assertion(Empty.results==[]).

test(real_process_native_lock_busy,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'busy.krf',"(isa a b)\n",F),opts(D,Options),
    atom_concat(F,'.pl.lock',Lock),
    worker([hold,Lock],Pid,In,Out),
    read_line_to_string(Out,"ready"),
    monotonic_seconds(Start),compile_source(F,Options,R),monotonic_seconds(End),
    assertion(R.status==busy),assertion(End-Start<1),
    cli_exit(['--no-progress',F],3),
    format(In,'release~n',[]),flush_output(In),close(In),close(Out),
    process_wait(Pid,exit(0)),
    compile_source(F,Options,Good),assertion(Good.status==generated).

test(real_process_allocator_uniqueness,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    directory_file_path(D,'one.out',A),directory_file_path(D,'two.out',B),
    worker([allocate,D,A,'200'],P1,I1,O1),
    worker([allocate,D,B,'200'],P2,I2,O2),
    close(I1),close(I2),read_string(O1,_,_),read_string(O2,_,_),close(O1),close(O2),
    process_wait(P1,exit(0)),process_wait(P2,exit(0)),
    read_file_to_terms(A,[IdsA],[]),read_file_to_terms(B,[IdsB],[]),
    append(IdsA,IdsB,Ids),sort(Ids,Unique),length(Unique,400).

test(two_real_compilers_early_busy,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    heavy_fixture(D,F),directory_file_path(D,state,State),
    atom_concat(F,'.pl.tmp',Marker),
    worker([compile,F,State],P1,I1,O1),
    close(I1),wait_exists(Marker,300),
    worker([compile,F,State],P2,I2,O2),close(I2),
    read_string(O2,_,Text2),close(O2),process_wait(P2,exit(0)),
    assertion(sub_string(Text2,_,_,_,"busy")),
    read_string(O1,_,Text1),close(O1),process_wait(P1,exit(0)),
    assertion(sub_string(Text1,_,_,_,"generated")),
    atom_concat(F,'.pl',Cache),read_cache(Cache,Header,_),
    assertion(Header.count==12000),assertion(\+exists_file(Marker)).

test(warning_flushed_before_later_file_finishes,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'a-warning.kif',";; logos: sumo-mappings\n(part a b c)\n",First),
    heavy_fixture(D,Second),directory_file_path(D,state,State),
    worker_stderr([batch,First,Second,State],Pid,In,Out,Err),close(In),
    first_warning(Err,Warning),
    assertion(sub_string(Warning,_,_,_,"WARNING")),
    atom_concat(Second,'.pl',Cache),
    assertion(\+exists_file(Cache)),
    read_string(Out,_,_),close(Out),read_string(Err,_,_),close(Err),
    process_wait(Pid,exit(0)),assertion(exists_file(Cache)).

test(recovery_skips_active_marker,[setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'busy.krf',"(isa a b)\n",F),opts(D,Options),
    atom_concat(F,'.pl.tmp',Marker),atom_concat(F,'.pl.lock',Lock),
    setup_call_cleanup(open(Marker,write,S),write_one_line(S,kb_compile_claim(1,F,0,0)),close(S)),
    worker([hold,Lock],Pid,In,Out),read_line_to_string(Out,"ready"),
    recover_sources([D],Options,R),
    assertion(R.busy==1),assertion(R.exitCode==3),assertion(exists_file(Marker)),
    format(In,'release~n',[]),flush_output(In),close(In),close(Out),process_wait(Pid,exit(0)).

test(killed_writer_preserves_final_and_recovers,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'interrupted.krf',"(isa Old Class)\n",F),opts(D,Options),
    compile_source(F,Options,Original),file_digest(Original.normalized,OldHash),
    setup_call_cleanup(open(F,write,S,[encoding(utf8),newline(posix)]),
        forall(between(1,3000,_),format(S,'(isa New Class)~n',[])),close(S)),
    directory_file_path(D,state,State),atom_concat(F,'.pl.tmp',Marker),
    worker([compile,F,State],Pid,In,Out),close(In),
    wait_exists(Marker,300),process_kill(Pid,term),process_wait(Pid,_),
    read_string(Out,_,_),close(Out),
    file_digest(Original.normalized,OldHash),
    assertion(exists_file(Marker)),
    recover_sources([D],Options,R),
    assertion(R.generated==1),assertion(R.failures==0),
    read_cache(Original.normalized,Header,_),assertion(Header.count==3000),
    assertion(\+exists_file(Marker)).

test(force_recovery_and_unrelated_temporary,
     [setup(test_dir(D)),cleanup(clean_dir(D))]) :-
    fixture(D,'a.krf',"(isa a b)\n",F),opts(D,Options),compile_source(F,Options,R),
    fixture(D,'user.tmp',"keep this unrelated file",Unrelated),
    stage_path(R.index,Stage),copy_file(R.index,Stage),
    recover_sources([D],[recovery(force)|Options],Recovered),
    assertion(Recovered.generated==1),assertion(Recovered.cacheHits==0),
    assertion(exists_file(Unrelated)),assertion(\+exists_file(Stage)).

heavy_fixture(D,F) :-
    directory_file_path(D,'heavy.krf',F),
    setup_call_cleanup(open(F,write,S,[encoding(utf8),newline(posix)]),
       forall(between(1,12000,_),format(S,'(isa Item Class)~n',[])),close(S)).

wait_exists(Path,N) :-
    (exists_file(Path)->true
    ;N>0,sleep(0.01),Next is N-1,wait_exists(Path,Next)).

first_warning(S,Line) :-
    read_line_to_string(S,Text),Text\==end_of_file,
    (sub_string(Text,_,_,_,"WARNING")->Line=Text;first_warning(S,Line)).

worker(Args,Pid,In,Out) :-
    source_file(plunit_logos_compiler:worker(_,_,_,_),Here),
    file_directory_name(Here,Dir),
    directory_file_path(Dir,'test_concurrency.pl',Script),
    current_prolog_flag(executable,Exe),
    append(['-q','-s',Script,'--'],Args,All),
    process_create(Exe,All,[process(Pid),stdin(pipe(In)),stdout(pipe(Out)),stderr(std)]).

worker_stderr(Args,Pid,In,Out,Err) :-
    source_file(plunit_logos_compiler:worker(_,_,_,_),Here),
    file_directory_name(Here,Dir),
    directory_file_path(Dir,'test_concurrency.pl',Script),
    current_prolog_flag(executable,Exe),
    append(['-q','-s',Script,'--'],Args,All),
    process_create(Exe,All,[process(Pid),stdin(pipe(In)),stdout(pipe(Out)),stderr(pipe(Err))]).

cli_exit(Args,Expected) :-
    source_file(plunit_logos_compiler:worker(_,_,_,_),Here),
    file_directory_name(Here,Tests),file_directory_name(Tests,App),
    directory_file_path(App,'compile_kb.pl',Script),
    current_prolog_flag(executable,Exe),
    append(['-q',Script,'--'],Args,All),
    process_create(Exe,All,[process(Pid),stdin(null),stdout(null),stderr(null)]),
    process_wait(Pid,exit(Expected)).

junction_action(Action,Path,Target) :-
    source_file(plunit_logos_compiler:worker(_,_,_,_),Here),
    file_directory_name(Here,Tests),
    directory_file_path(Tests,'test_concurrency.ps1',Script),
    process_create(path(powershell),
      ['-NoProfile','-NonInteractive','-ExecutionPolicy','Bypass','-File',Script,
       '-Action',Action,'-Path',Path,'-Target',Target],
      [stdin(null),stdout(null),stderr(std),process(Pid)]),
    process_wait(Pid,exit(0)).

:- end_tests(logos_compiler).
