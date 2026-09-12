:- begin_tests(catalog_index).
:- use_module('../kb_catalog_index').
:- use_module('../kb_compile',[]).
:- use_module('../kb_cache',[]).
:- use_module('../kb_paths').
:- use_module('../kb_store',[]).
:- use_module(library(assoc)).
:- use_module(library(filesex)).
:- use_module(library(http/json)).
:- use_module(library(uuid)).

fixture(state(Root,OldApp)) :-
    app_dir(OldApp),uuid(Uuid),
    directory_file_path(OldApp,'tests/artifacts',Artifacts),make_directory_path(Artifacts),
    directory_file_path(Artifacts,Uuid,Root),
    directory_file_path(Root,'prolog/ow_dr',App),make_directory_path(App),
    kb_compile:implementation_files(Implementation),
    append(Implementation,['windows_catalog.ps1'],Files),
    forall(member(Name,Files),
      (directory_file_path(OldApp,Name,From),directory_file_path(App,Name,To),copy_file(From,To))),
    directory_file_path(Root,'KBs',KBs),make_directory_path(KBs),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(App)),
    retractall(kb_catalog_index:loaded_catalog(_,_,_)).
cleanup(state(Root,OldApp)) :-
    retractall(kb_catalog_index:loaded_catalog(_,_,_)),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(OldApp)),
    delete_directory_and_contents(Root).
write_text(Path,Text) :-
    setup_call_cleanup(open(Path,write,S,[encoding(utf8),newline(posix)]),
      format(S,'~s',[Text]),close(S)).
compiled(Name,Text,Source) :-
    kb_root(KBs),directory_file_path(KBs,Name,Path),write_text(Path,Text),
    absolute_file_name(Path,Source,[access(read)]),
    repo_root(Root),directory_file_path(Root,state,State),
    kb_compile:compile_source(Source,[state_dir(State),diagnostics(false)],Result),
    assertion(Result.status==generated).
record(Id,Semantic,record(Id,Semantic,Metadata)) :-
    term_variables(Semantic,Vars),length(Vars,N),
    findall(Name,(between(1,N,K),format(string(Name),'?V~d',[K])),Names),
    Metadata=[xc_source_file(Id,'KBs/f.krf'),xc_source_line(Id,1),
      xc_microtheory(Id,x_TestMt),xc_kb_names(Id,Names)].
pure(Terms,Data) :-
    findall(Id-Term,(nth1(N,Terms,Term),format(atom(Id),'a~16r',[N])),Pairs),
    maplist(pair_record,Pairs,Records),length(Records,N),
    findall(Id-0,member(Id-_,Pairs),Offsets0),keysort(Offsets0,Sorted),list_to_assoc(Sorted,Offsets),
    build_source_data('KBs/f.krf',cache{dialect:krf,count:N},Records,Offsets,Data).
pair_record(Id-Term,Record) :- record(Id,Term,Record).

test(repeated_positions_and_sentence_counts_are_separate) :-
    pure([x_p(x_a,x_f(x_a),x_a)],Data),
    memberchk(t(x_a,1,3,0,[],_,Hits),Data.terms),
    assertion(Hits=[h(1,[args,0],value,semantic),
                    h(1,[args,1,args,0],value,semantic),
                    h(1,[args,2],value,semantic)]).
test(variables_not_indexed_or_bound_and_metadata_mt_is_separate) :-
    pure([x_p(X,X)],Data),
    assertion(var(X)),memberchk(t(x_TestMt,0,0,1,[],_,_),Data.terms),
    findall(Key,member(t(Key,_,_,_,_,_,_),Data.terms),Keys),
    assertion(Keys==[x_TestMt,x_p]).
test(definition_target_not_usage_or_nested_implication) :-
    pure([x_p(x_a),x_arity(x_p,1),x_isa(x_p,x_Predicate),
          'x_=>'(x_arity(x_p,2),x_resultIsa(x_p,x_Thing)),
          x_not(x_arity(x_p,3))],Data),
    memberchk(t(x_p,5,6,0,Definitions,_,_),Data.terms),
    assertion(Definitions==[2,3]).
test(isa_whole_term_separate_from_constructor) :-
    pure([x_isa(x_Fn(x_a),x_Collection)],Data),
    memberchk(t('nat:x_Fn(x_a)',1,1,0,[1],_,_),Data.terms),
    memberchk(t(x_Fn,1,1,0,[],_,_),Data.terms),
    assertion(Data.claims=[c(isa,'nat:x_Fn(x_a)',x_Collection,1,[])]).
test(positive_conjunction_has_exact_definition_paths) :-
    pure([x_and(x_arity(x_p,1),x_isa(x_p,x_Predicate))],Data),
    memberchk(t(x_p,1,2,0,[1],_,Hits),Data.terms),
    assertion(memberchk(h(1,[args,0,args,0],definition,definition),Hits)),
    assertion(memberchk(h(1,[args,1,args,0],definition,definition),Hits)).
test(meta_function_kept_as_type_not_function_name_heuristic) :-
    pure([x_isa(x_resultIsa,x_MetaFunction),x_isa(x_resultIsa,x_BinaryPredicate)],Data),
    assertion(Data.claims=[c(isa,x_resultIsa,x_MetaFunction,1,[]),
                           c(isa,x_resultIsa,x_BinaryPredicate,2,[])]).
test(inert_metta_equation_never_definition) :-
    pure(['x_metta='(x_f(x_a),x_a)],Data),
    memberchk(t(x_f,1,1,0,[],_,_),Data.terms).

test(compiled_roundtrip_offsets_names_unloaded_and_unchanged_sources,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    Text="(p a (f a) a)\n(arity p 3)\n(p ?X ?X z)\n",
    compiled('a.krf',Text,Source),kb_cache:file_digest(Source,Before),
    kb_store:generation(Generation),refresh_catalog(all,R),
    assertion(R.complete==true),assertion(R.freshFiles==1),assertion(number(R.seconds)),
    catalog_term(x_a,semantic,0,20,Occurrences),
    assertion(Occurrences.total==3),
    catalog_term(x_p,definition,0,20,Definitions),Definitions.items=[Definition],
    catalog_assertion('KBs/a.krf',Definition.id,Detail),
    assertion(Detail.line==2),assertion(Detail.expression.head.value==x_arity),
    source_catalog(Source,Data),Data.sentences=[_,_,s(_,VariableId,_,_,["?X"],_)],
    catalog_assertion('KBs/a.krf',VariableId,Variables),
    Variables.expression.args=[Left,Right,_],assertion(Left==Right),
    kb_store:generation(Generation),assertion(\+kb_store:source_info(Source,_)),
    kb_cache:file_digest(Source,Before),
    with_output_to(string(_),json_write_dict(current_output,R)).
test(warm_reuse_stable_and_empty_source,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('empty.krf',"; only a comment\n",Source),
    source_catalog(Source,First),source_catalog(Source,Second),
    assertion(First==Second),assertion(First.sentences==[]),assertion(First.terms==[]).
test(raw_source_sha_is_separate_from_legacy_high_bit_fingerprint,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_root(KBs),directory_file_path(KBs,'latin.krf',Source),
    setup_call_cleanup(open(Source,write,Out,[type(binary)]),
      maplist(put_byte(Out),[59,233,10,40,112,32,97,41,10]),close(Out)),
    repo_root(Root),directory_file_path(Root,state,State),
    kb_compile:compile_source(Source,[state_dir(State),diagnostics(false)],Compiled),
    assertion(Compiled.status==generated),source_catalog(Source,Data),
    crypto_file_hash(Source,Raw,[algorithm(sha256),encoding(octet)]),
    assertion(Data.rawSourceHash==Raw),assertion(Data.identity.sourceHash\==Raw).
test(changed_source_rejected,
     [setup(fixture(S)),cleanup(cleanup(S)),throws(error(catalog_stale(compiler_identity),_))]) :-
    compiled('a.krf',"(p a)\n",Source),source_catalog(Source,_),
    write_text(Source,"(p b)\n"),source_catalog(Source,_).
test(changed_normalized_bytes_rejected_at_detail,
     [setup(fixture(S)),cleanup(cleanup(S)),throws(error(catalog_stale(normalized(_)),_))]) :-
    compiled('a.krf',"(p a)\n",Source),refresh_catalog(all,_),
    source_catalog(Source,Data),Data.sentences=[s(_,Id,_,_,_,_)],
    cache_paths(Source,Normal,_),write_text(Normal,"invalid\n"),
    catalog_assertion('KBs/a.krf',Id,_).
test(same_bytes_other_source_cannot_borrow_ids,
     [setup(fixture(S)),cleanup(cleanup(S)),throws(error(catalog_stale(compiler_identity),_))]) :-
    compiled('a.krf',"(p a)\n",A),compiled('b.krf',"(p a)\n",B),
    cache_paths(A,AN,AI),cache_paths(B,BN,BI),copy_file(AN,BN),copy_file(AI,BI),
    source_catalog(B,_).
test(missing_companion_does_not_hide_expected_file_or_stop_good_files,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('good.krf',"(p a)\n",_),
    kb_root(KBs),directory_file_path(KBs,'missing.krf',Missing),write_text(Missing,"(q b)\n"),
    refresh_catalog(all,R),
    assertion(R.complete==false),assertion(R.expectedFiles==2),assertion(R.freshFiles==1),
    assertion(R.issues=[_]),R.issues=[Issue],assertion(Issue.path=='KBs/missing.krf'),
    catalog_search("x_a",0,10,Search),assertion(Search.total==1).
test(subset_refresh_keeps_completion_denominator,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(p a)\n",_),compiled('b.krf',"(p b)\n",_),
    refresh_catalog(['KBs/a.krf'],R),
    assertion(R.expectedFiles==2),assertion(R.freshFiles==1),assertion(R.complete==false),
    R.issues=[Issue],assertion(Issue.status==pending).
test(corrupt_artifact_is_diagnosed_then_rebuilt,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(p a)\n",Source),source_catalog(Source,Before),
    kb_catalog_index:source_path(Source,Artifact),write_text(Artifact,"catalog_header(1).\n"),
    source_catalog(Source,After),assertion(After==Before).
test(partial_payload_never_replaces_final,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(p a)\n",Source),source_catalog(Source,_),
    kb_catalog_index:source_path(Source,File),kb_cache:file_digest(File,Before),
    catch(kb_catalog_index:atomic_data(File,source_catalog(source{})),Error,true),
    assertion(nonvar(Error)),kb_cache:file_digest(File,Before).
test(native_replacement_retry_does_not_hide_permanent_failure,
     [condition(current_prolog_flag(windows,true)),
      setup(fixture(S)),cleanup(cleanup(S)),throws(error(permission_error(rename,file,_),_))]) :-
    repo_root(Root),directory_file_path(Root,'missing-stage',Missing),
    directory_file_path(Root,'output.data',Final),
    kb_catalog_index:install_catalog_stage(Missing,Final,20).
test(out_of_order_durable_ids_keep_exact_offsets,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(p a)\n(p b)\n",Source),
    repo_root(Root),directory_file_path(Root,state,State),
    write_text(Source,"(p b)\n(p a)\n"),
    kb_compile:compile_source(Source,[state_dir(State),diagnostics(false)],Result),
    assertion(Result.status==generated),source_catalog(Source,Data),
    assertion(Data.assertionCount==2),refresh_catalog(all,_),
    catalog_term(x_b,semantic,0,10,Rows),Rows.items=[Row],
    catalog_assertion('KBs/a.krf',Row.id,Detail),
    assertion(Detail.line==1),assertion(Detail.expression.args=[json{type:symbol,value:x_b}]).

:- end_tests(catalog_index).
