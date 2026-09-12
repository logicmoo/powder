:- begin_tests(source_packs).
:- use_module('../kb_source_packs').
:- use_module('../kb_file_dependencies').
:- use_module('../kb_paths').
:- use_module('../kb_cache',[write_cache/4,read_cache/3,file_digest/2,converter_version/1]).
:- use_module('../kb_store',[]).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(http/json)).
:- use_module(library(assoc)).
:- use_module(library(crypto)).
:- use_module(library(prolog_wrap)).
:- use_module('../kb_catalog_index',[]).
:- use_module('../kb_catalog_schema',[]).
:- use_module('../kb_catalog_providers',[]).

empty_pack(Roots,pack{id:'pack-test',name:'Example',roots:Roots,choices:[],members:[]}).
records(Terms,Start,Source,Records) :- records_(Terms,Start,Source,Records).
records_([],_,_,[]).
records_([Term|Terms],N,Source,[record(Id,Term,Meta)|Records]) :-
    format(atom(Id),'a~16r',[N]),term_variables(Term,Vars),length(Vars,Count),
    findall(Name,(between(1,Count,K),format(string(Name),'?V~d',[K])),Names),
    Meta=[xc_source_file(Id,Source),xc_source_line(Id,N),xc_microtheory(Id,x_TestMt),xc_kb_names(Id,Names)],
    Next is N+1,records_(Terms,Next,Source,Records).
analysis(Path,Terms,analysis{path:Path,info:Info}) :-
    records(Terms,1,Path,Records),length(Records,N),
    analyze_records(Path,cache{count:N,dialect:krf,source:Path,sourceHash:hash,
                               normalizedDigest:digest},Records,Info).
index(Complete,Analyses,provider_index{coverage:coverage{complete:Complete},providers:Providers}) :-
    findall(P,(member(A,Analyses),kb_source_packs:analysis_provider(A,P)),Providers).
member_paths(Resolution,Paths) :- findall(P,(member(M,Resolution.pack.members),P=M.path),Paths).
issue(Resolution,Reason) :- member(U,Resolution.unresolved),U.reason==Reason,!.
basic_graph(Pack,[Root,Provider]) :-
    empty_pack(['KBs/root.krf'],Pack),
    analysis('KBs/root.krf',[(x_root:-and(x_need))],Root),
    analysis('KBs/provider.krf',[(x_need:-and)],Provider).

test(unique_provider_closure_keeps_root_and_dependency_distinct) :-
    basic_graph(Pack,Analyses),index(true,Analyses,Index),resolve_graph(Pack,Index,Analyses,R),
    assertion(R.ready==true),member_paths(R,['KBs/provider.krf','KBs/root.krf']),
    once((member(M,R.pack.members),M.path=='KBs/provider.krf')),assertion(M.role==dependency),
    assertion(M.why=[why{symbol:x_need,kind:defined,evidence:_}]).
test(cycles_terminate_and_deduplicate) :-
    empty_pack(['KBs/a.krf'],P),
    analysis('KBs/a.krf',[(x_a:-and(x_b))],A),
    analysis('KBs/b.krf',[(x_b:-and(x_a))],B),
    index(true,[A,B],I),resolve_graph(P,I,[A,B],R),
    assertion(R.ready==true),member_paths(R,['KBs/a.krf','KBs/b.krf']).
test(whole_growing_pack_satisfies_initially_ambiguous_predicate) :-
    empty_pack(['KBs/root.krf'],P),
    analysis('KBs/root.krf',[(x_root:-and(x_p,x_q))],Root),
    analysis('KBs/both.krf',[(x_p:-and),(x_q:-and)],Both),
    analysis('KBs/other.krf',[(x_q:-and)],Other),
    index(true,[Root,Both,Other],I),resolve_graph(P,I,[Root,Both,Other],R),
    assertion(R.ready==true),member_paths(R,['KBs/both.krf','KBs/root.krf']).
test(ambiguity_does_not_choose_first_or_all) :-
    basic_graph(P,[Root,A]),analysis('KBs/second.krf',[(x_need:-and)],B),
    index(true,[Root,A,B],I),resolve_graph(P,I,[Root,A,B],R),
    assertion(R.ready==false),member_paths(R,['KBs/root.krf']),
    assertion(issue(R,ambiguous_providers)).
test(user_can_choose_multiple_provider_files) :-
    basic_graph(Base,[Root,A]),analysis('KBs/second.krf',[(x_need:-and)],B),
    P=Base.put(choices,[choice{symbol:x_need,files:['KBs/provider.krf','KBs/second.krf']}]),
    index(false,[Root,A,B],I),resolve_graph(P,I,[Root,A,B],R),
    assertion(R.ready==true),member_paths(R,['KBs/provider.krf','KBs/root.krf','KBs/second.krf']).
test(explicit_zero_choice_remains_unresolved) :-
    basic_graph(Base,As),P=Base.put(choices,[choice{symbol:x_need,files:[]}]),
    index(true,As,I),resolve_graph(P,I,As,R),
    assertion(R.ready==false),assertion(issue(R,declined)).
test(one_known_provider_is_not_globally_unique_with_incomplete_index) :-
    basic_graph(P,As),index(false,As,I),resolve_graph(P,I,As,R),
    assertion(R.ready==false),assertion(issue(R,incomplete_provider_index)),
    member_paths(R,['KBs/root.krf']).
test(declared_and_defined_support_are_reported_separately) :-
    empty_pack(['KBs/root.krf'],P),
    analysis('KBs/root.krf',[(x_root:-and(x_need(x_a))),(x_arg1Isa(_,_):-and)],Root),
    analysis('KBs/provider.krf',[x_arg1Isa(x_need,x_Thing)],Provider),
    index(true,[Root,Provider],I),resolve_graph(P,I,[Root,Provider],R),
    assertion(R.ready==true),
    R.coverage.declaredOnly=[Support],assertion(Support.symbol==x_need),
    once((member(M,R.pack.members),M.role==dependency)),
    assertion(M.why=[why{symbol:x_need,kind:declared,evidence:_}]).
test(chosen_provider_not_replaced_when_its_definition_disappears) :-
    basic_graph(Base,[Root,Old]),analysis('KBs/replacement.krf',[(x_need:-and)],Other),
    index(true,[Root,Old,Other],I),
    analysis('KBs/provider.krf',[x_notAProvider(x_a)],Changed),
    P=Base.put(choices,[choice{symbol:x_need,files:['KBs/provider.krf']}]),
    resolve_graph(P,I,[Root,Changed,Other],R),
    assertion(R.ready==false),assertion(issue(R,chosen_file_no_longer_provides_symbol)),
    member_paths(R,['KBs/provider.krf','KBs/root.krf']).
test(metta_unknown_analysis_is_not_an_all_dependencies_loaded_claim) :-
    empty_pack(['KBs/data.metta'],P),
    records(['x_metta='(x_f(X),X)],1,'KBs/data.metta',Records),
    analyze_records('KBs/data.metta',cache{count:1,dialect:metta},Records,Info),
    A=analysis{path:'KBs/data.metta',info:Info},index(false,[A],I),
    resolve_graph(P,I,[A],R),assertion(R.ready==false),
    assertion(issue(R,incomplete_predicate_analysis)),assertion(var(X)).
test(mt_dependencies_do_not_expand_membership) :-
    empty_pack(['KBs/root.krf'],P),
    analysis('KBs/root.krf',[(x_root:-and(x_genlMt(x_Here,x_Outside))),(x_genlMt(_,_):-and)],A),
    index(true,[A],I),resolve_graph(P,I,[A],R),
    assertion(R.ready==true),member_paths(R,['KBs/root.krf']),
    assertion(R.microtheoryDependencies\==[]),assertion(R.coverage.mtAutoResolution==false).
test(saved_dependency_members_are_kept_independent_of_active_store) :-
    basic_graph(P,As),index(true,As,I),resolve_graph(P,I,As,First),
    index(false,[],NoIndex),resolve_graph(First.pack,NoIndex,As,Second),
    assertion(Second.ready==true),member_paths(Second,['KBs/provider.krf','KBs/root.krf']).
test(resolution_is_ground_json_and_does_not_mutate_shared_variables) :-
    empty_pack(['KBs/root.krf'],P),
    analysis('KBs/root.krf',[(x_p(X):-and(x_p(X)))],A),
    index(true,[A],I),resolve_graph(P,I,[A],R),assertion(ground(R)),
    assertion(var(X)),with_output_to(string(_),json_write_dict(current_output,R)).

fixture(State) :-
    app_dir(OldApp),
    (getenv('POWDER_SOURCE_PACKS',Old)->Env=some(Old);Env=none),
    source_file(plunit_source_packs:fixture(_),Here),file_directory_name(Here,Tests),
    directory_file_path(Tests,artifacts,Artifacts),make_directory_path(Artifacts),
    uuid(Uuid),directory_file_path(Artifacts,Uuid,Root),make_directory_path(Root),
    directory_file_path(Root,prolog,Prolog),directory_file_path(Prolog,ow_dr,App),make_directory_path(App),
    directory_file_path(OldApp,'windows_catalog.ps1',Helper),
    directory_file_path(App,'windows_catalog.ps1',Copy),copy_file(Helper,Copy),
    directory_file_path(Root,'KBs',KBs),make_directory_path(KBs),
    directory_file_path(Root,'isolated-packs.json',Settings),setenv('POWDER_SOURCE_PACKS',Settings),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(App)),
    clear_dependency_cache,retractall(kb_source_packs:provider_memory(_,_,_)),
    State=state(Root,OldApp,Env).
cleanup(state(Root,OldApp,Env)) :-
    findall(S,kb_store:source_info(S,_),Sources),
    forall(member(S,Sources),(kb_store:generation(G),kb_store:unload_source(S,G,_))),
    retractall(kb_paths:app_directory(_)),assertz(kb_paths:app_directory(OldApp)),
    (Env=some(Old)->setenv('POWDER_SOURCE_PACKS',Old);unsetenv('POWDER_SOURCE_PACKS')),
    clear_dependency_cache,retractall(kb_source_packs:provider_memory(_,_,_)),
    delete_directory_and_contents(Root).
write_text(File,Text) :-
    setup_call_cleanup(open(File,write,S,[encoding(utf8)]),format(S,'~s',[Text]),close(S)).
source_cache(Path,Start,Terms,Source) :-
    repo_root(Root),directory_file_path(Root,Path,Given),
    file_directory_name(Given,Directory),make_directory_path(Directory),
    write_text(Given,"INTENTIONALLY INVALID SOURCE ((("),
    absolute_file_name(Given,Source,[access(read)]),
    cache_paths(Source,Cache,_),file_directory_name(Cache,CacheDir),make_directory_path(CacheDir),
    file_digest(Source,Hash),size_file(Source,Size),converter_version(Version),
    records(Terms,Start,Source,Records),
    H=cache{source:Source,sourceHash:Hash,dialect:krf,mappingHash:none,
      options:[],converter:Version,mtPolicy:filename_v1,implementationHash:Hash,
      sizeBytes:Size,lineCount:1,warnings:[]},
    write_cache(Cache,H,Records,_).
snapshot(Source,snapshot{source:Source,sourceHash:SourceHash,outputHash:Hash}) :-
    file_digest(Source,SourceHash),cache_paths(Source,Cache,_),file_digest(Cache,Hash).
real_graph(Root,Provider) :-
    source_cache('KBs/root.krf',100,[(x_root:-and(x_need))],Root),
    source_cache('KBs/provider.krf',200,[(x_need:-and)],Provider).
create_example(Saved) :- list_packs(L),create_pack('Illustrative test only',['KBs/root.krf'],L.revision,Saved).

test(create_get_list_persist_and_optimistic_revision,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    source_cache('KBs/root.krf',100,[(x_root:-and)],_),
    list_packs(Empty),assertion(Empty.revision==none),assertion(Empty.packs==[]),
    create_example(Saved),get_pack(Saved.pack.id,Read),assertion(Read.pack.name=='Illustrative test only'),
    list_packs(List),assertion(List.packs=[_]),
    catch(save_pack(Saved.pack.put(name,'New name'),none,_),Error,true),
    assertion(Error=error(source_packs_conflict(_,_),_)),
    get_pack(Saved.pack.id,Unchanged),assertion(Unchanged.revision==Saved.revision).
test(native_persistence_lock_prevents_a_second_writer,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    source_cache('KBs/root.krf',100,[(x_root:-and)],_),create_example(Saved),
    packs_file(File),atom_concat(File,'.lock',LockFile),kb_cache:try_lock(LockFile,Lock),
    setup_call_cleanup(true,
      (catch(save_pack(Saved.pack.put(name,'Changed'),Saved.revision,_),Error,true),
       assertion(Error=error(source_packs_busy,_))),
      kb_cache:release_lock(Lock)),
    get_pack(Saved.pack.id,After),assertion(After.revision==Saved.revision).
test(resolve_can_be_cancelled_without_saving_loading_or_compiling,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,_),create_example(Saved),
    packs_file(File),file_digest(File,Before),kb_store:generation(G),
    resolve_pack(Saved.pack.id,Saved.revision,[],R),
    assertion(R.ready==false),file_digest(File,After),assertion(After==Before),
    kb_store:generation(G),cache_paths(Root,_,Index),assertion(\+exists_file(Index)).
test(explicit_provider_index_then_saved_resolution_loads_only_members,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),refresh_provider_index(all,Index),assertion(Index.coverage.complete==true),
    create_example(Saved),resolve_pack(Saved.pack.id,Saved.revision,[],R),
    assertion(R.ready==true),save_pack(R.pack,Saved.revision,Ready),
    kb_store:generation(G),load_pack(Ready.pack.id,Ready.revision,G,Loaded),
    assertion(Loaded.status.counts.assertions==2),
    assertion(Loaded.coverage.sourceFreshness==verified_selected_sources),
    kb_store:query_text("(root)",x_TestMt,5,2,Q),assertion(Q.solutions=[_]),
    file_digest(Root,RootHash),file_digest(Provider,ProviderHash),
    assertion(RootHash==ProviderHash).
test(unsaved_resolution_is_not_authorized_for_load,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(_,_),refresh_provider_index(all,_),create_example(Saved),
    kb_store:generation(G),
    catch(load_pack(Saved.pack.id,Saved.revision,G,_),Error,true),
    assertion(Error=error(source_pack_composition_not_saved,_)),
    kb_store:generation(G).
test(selected_provider_index_cannot_establish_global_uniqueness,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(_,_),refresh_provider_index(['KBs/provider.krf'],Index),
    assertion(Index.coverage.complete==false),create_example(Saved),
    resolve_pack(Saved.pack.id,Saved.revision,[],R),
    assertion(R.ready==false),assertion(issue(R,incomplete_provider_index)).
test(missing_cache_makes_full_provider_index_incomplete_without_compilation,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(_,_),repo_root(Root),directory_file_path(Root,'KBs/missing.krf',Missing),
    write_text(Missing,"(p a)"),refresh_provider_index(all,Index),
    assertion(Index.coverage.complete==false),
    cache_paths(Missing,Cache,_),assertion(\+exists_file(Cache)),
    create_example(Saved),resolve_pack(Saved.pack.id,Saved.revision,[],R),
    assertion(issue(R,incomplete_provider_index)).
test(changed_catalogue_requires_choice_instead_of_assuming_uniqueness,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(_,_),refresh_provider_index(all,_),
    source_cache('KBs/later.krf',300,[(x_need:-and)],_),
    create_example(Saved),resolve_pack(Saved.pack.id,Saved.revision,[],R),
    assertion(R.ready==false),assertion(R.coverage.globalProviders.scope==stale).
test(chosen_provider_missing_is_visible_and_not_replaced,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(_,Provider),source_cache('KBs/other.krf',300,[(x_need:-and)],_),
    create_example(Saved),
    Choices=[choice{symbol:x_need,files:['KBs/provider.krf']}],
    resolve_pack(Saved.pack.id,Saved.revision,Choices,R),assertion(R.ready==true),
    save_pack(R.pack,Saved.revision,Ready),delete_file(Provider),
    resolve_pack(Ready.pack.id,Ready.revision,[],Again),
    assertion(Again.ready==false),assertion(issue(Again,chosen_file_no_longer_provides_symbol)),
    member_paths(Again,['KBs/provider.krf','KBs/root.krf']).
test(stale_selected_source_cannot_load_its_previous_dependency_snapshot,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(_,Provider),create_example(Saved),
    resolve_pack(Saved.pack.id,Saved.revision,[choice{symbol:x_need,files:['KBs/provider.krf']}],R),
    save_pack(R.pack,Saved.revision,Ready),write_text(Provider,"changed"),
    kb_store:generation(G),catch(load_pack(Ready.pack.id,Ready.revision,G,_),Error,true),
    assertion(Error=error(source_pack_unresolved(_),_)),kb_store:generation(G).
test(load_hash_verification_detects_same_size_and_restored_timestamp_changes,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(_,Provider),create_example(Saved),
    resolve_pack(Saved.pack.id,Saved.revision,[choice{symbol:x_need,files:['KBs/provider.krf']}],R),
    save_pack(R.pack,Saved.revision,Ready),
    time_file(Provider,Stamp),size_file(Provider,Size),
    length(Codes,Size),maplist(=(0'Z),Codes),string_codes(Text,Codes),
    write_text(Provider,Text),set_time_file(Provider,_,[modified(Stamp)]),
    kb_store:generation(G),catch(load_pack(Ready.pack.id,Ready.revision,G,_),Error,true),
    assertion(Error=error(source_pack_source_changed(_),_)),kb_store:generation(G).
test(additive_loading_preserves_unrelated_modified_external_live_source,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    source_cache('outside.krf',900,[x_external(x_original)],External),
    snapshot(External,Old),kb_store:add_cached_sources([Old],any,Initial),
    kb_store:source_module(External,Module,Native),kb_store:source_info(External,OldInfo),
    write_text(External,"BROKEN AND MODIFIED SOURCE"),
    real_graph(_,_),refresh_provider_index(all,_),create_example(Saved),
    resolve_pack(Saved.pack.id,Saved.revision,[],R),save_pack(R.pack,Saved.revision,Ready),
    load_pack(Ready.pack.id,Ready.revision,Initial.generation,Loaded),
    assertion(Loaded.status.counts.assertions==3),
    kb_store:source_module(External,Module,Native),kb_store:source_info(External,NowInfo),
    assertion(OldInfo=@=NowInfo),
    kb_store:query_text("(external ?X)",x_TestMt,5,2,Q),
    assertion(Q.solutions=[_]).
test(already_loaded_provider_stays_saved_and_can_load_in_a_fresh_store,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(_,Provider),snapshot(Provider,Snap),kb_store:add_cached_sources([Snap],any,Initial),
    kb_store:source_module(Provider,Module,Native),
    refresh_provider_index(all,_),create_example(Saved),
    resolve_pack(Saved.pack.id,Saved.revision,[],R),save_pack(R.pack,Saved.revision,Ready),
    member_paths(R,['KBs/provider.krf','KBs/root.krf']),
    load_pack(Ready.pack.id,Ready.revision,Initial.generation,Loaded),
    kb_store:source_module(Provider,Module,Native),
    assertion(Loaded.status.counts.assertions==2),
    kb_store:status(Current),
    load_pack(Ready.pack.id,Ready.revision,Current.generation,Again),
    assertion(Again.status.generation==Current.generation),
    findall(P,kb_store:source_info(P,_),Paths),
    forall(member(P,Paths),(kb_store:generation(G),kb_store:unload_source(P,G,_))),
    kb_store:generation(Empty),load_pack(Ready.pack.id,Ready.revision,Empty,Fresh),
    assertion(Fresh.status.counts.assertions==2).
test(additive_generation_conflict_leaves_native_handles_unchanged,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),snapshot(Root,One),snapshot(Provider,Two),
    kb_store:add_cached_sources([One],any,Loaded),kb_store:source_module(Root,M,N),
    Stale is Loaded.generation-1,
    catch(kb_store:add_cached_sources([Two],Stale,_),Error,true),
    assertion(Error=error(generation_conflict(_,_),_)),
    kb_store:source_module(Root,M,N),assertion(\+kb_store:source_module(Provider,_,_)).
test(additive_explicit_replacement_keeps_other_missing_original_live,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    source_cache('outside.krf',900,[x_external(x_original)],External),
    source_cache('KBs/update.krf',100,[x_value(x_before)],Update),
    snapshot(External,E),snapshot(Update,U),
    kb_store:add_cached_sources([E,U],any,Loaded),
    kb_store:source_module(External,Module,Native),delete_file(External),
    kb_store:source_module(Update,_,OldSnapshot),
    source_cache('KBs/update.krf',100,[x_value(x_after)],Update),
    snapshot(Update,New),kb_store:add_cached_sources([New],Loaded.generation,After),
    assertion(After.counts.assertions==2),kb_store:source_module(External,Module,Native),
    assertion(\+exists_file(OldSnapshot)),
    kb_store:query_text("(value after)",x_TestMt,5,2,Q),assertion(Q.solutions=[_]),
    kb_store:query_text("(value before)",x_TestMt,5,2,Old),assertion(Old.solutions==[]).
test(corrupt_addition_preserves_existing_native_generation,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),snapshot(Root,One),kb_store:add_cached_sources([One],any,Loaded),
    cache_paths(Provider,Cache,_),write_text(Cache,":- throw(must_not_run).\n"),
    snapshot(Provider,Bad),catch(kb_store:add_cached_sources([Bad],Loaded.generation,_),Error,true),
    assertion(nonvar(Error)),kb_store:status(After),
    assertion(After.generation==Loaded.generation),assertion(After.counts.assertions==1).
test(reusing_a_loaded_module_does_not_bypass_cached_source_hash_validation,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    source_cache('KBs/a.krf',100,[x_p(x_old)],Source),snapshot(Source,Before),
    kb_store:add_cached_sources([Before],any,Loaded),
    write_text(Source,"Different bytes"),snapshot(Source,Changed),
    catch(kb_store:add_cached_sources([Changed],Loaded.generation,_),Error,true),
    assertion(Error=error(source_pack_stale_cache(_),_)),
    kb_store:status(After),assertion(After.generation==Loaded.generation).
test(conflicting_ids_in_addition_do_not_replace_retained_assertions,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    source_cache('outside.krf',100,[x_existing],Old),
    source_cache('KBs/new.krf',100,[x_new],New),snapshot(Old,A),snapshot(New,B),
    kb_store:add_cached_sources([A],any,Loaded),
    catch(kb_store:add_cached_sources([B],Loaded.generation,_),Error,true),
    assertion(Error=error(conflicting_assertion_id(_),_)),
    kb_store:status(After),assertion(After.generation==Loaded.generation),
    assertion(After.counts.assertions==1).
test(paths_and_ids_are_data_not_executable_input,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    forall(member(Path,['KBs/../escape.krf','tmp/KBs/x.krf','KBs/a.krf.data','KBs\\a.krf']),
      (catch(create_pack('Test',[Path],none,_),E,true),assertion(nonvar(E)))),
    catch(get_pack('../bad',_),IdError,true),assertion(nonvar(IdError)),
    list_packs(Empty),assertion(Empty.packs==[]).

catalog_fixture_file(Source,File-Data) :-
    kb_source_packs:pack_public(Source,Path),cache_paths(Source,Cache,_),
    read_cache(Cache,H,Records),
    findall(Id-0,member(record(Id,_,_),Records),Pairs),list_to_assoc(Pairs,Offsets),
    kb_catalog_index:build_source_data(Source,H,Records,Offsets,Data),
    file_digest(Source,Hash),crypto_file_hash(Source,Raw,[algorithm(sha256),encoding(octet)]),
    file_digest(Cache,FileHash),size_file(Source,Size),time_file(Source,Time),
    kb_catalog_index:file_stamp(Cache,Stamp),
    File=file{path:Path,status:fresh,rawSourceHash:Raw,normalized:Cache,
      sizeBytes:Size,modified:Time,normalizedStamp:Stamp,
      identity:identity{sourceHash:Hash,normalizedDigest:H.normalizedDigest,normalizedHash:FileHash},
      dependencySummary:Data.dependencies}.
publish_catalog(Sources,Files) :-
    maplist(catalog_fixture_file,Sources,Pairs),
    findall(Claim,(member(File-Data,Pairs),
      kb_catalog_schema:source_schema_evidence(File.path,Data,Claims),member(Claim,Claims)),Evidence),
    kb_catalog_schema:build_catalog_schema(Evidence,Taxonomy),
    findall(Full,(member(File-Data,Pairs),
      kb_catalog_providers:source_provider_extensions(File.path,Data,Taxonomy,Extensions),
      Full=File.put(providerExtensions,Extensions)),Files),
    publish_catalog_files(Files).
publish_catalog_files(Files) :-
    findall(Key-File,(member(File,Files),kb_catalog_query:path_key(File.path,Key)),Pairs),list_to_assoc(Pairs,Map),
    findall(Path,(member(F,Files),Path=F.path),Expected),empty_assoc(Empty),
    length(Files,N),
    Model=query_catalog{schema:catalog_query_v1,revision:fixture_revision,taxonomy:fixture_taxonomy,
      verifiedAt:1,coverage:coverage{complete:true,expectedFiles:N,freshFiles:N,issues:[]},
      files:Map,expected:Expected,terms:Empty,postings:Empty,ranked:[]},
    kb_catalog_query:query_file(Path),kb_catalog_index:atomic_data(Path,catalog_query(Model)),
    (nb_current(powder_catalog_query,_)->nb_delete(powder_catalog_query);true).
blocked_catalog_goal(kb_cache:read_cache(_,_,_)).
blocked_catalog_goal(kb_file_dependencies:file_dependencies(_,_)).
blocked_catalog_goal(kb_compile:compile_source(_,_,_)).
guard_catalog_reads :-
    forall(blocked_catalog_goal(Head),
      wrap_predicate(Head,source_pack_no_full_reads,_,throw(error(unexpected_full_cache_or_compile_read,_)))),
    nb_setval(pack_snapshot_calls,0),nb_setval(pack_manifest_calls,0),
    wrap_predicate(kb_catalog_query:source_pack_snapshot(_),source_pack_count,Snap,
      (nb_getval(pack_snapshot_calls,N),Next is N+1,nb_setval(pack_snapshot_calls,Next),call(Snap))),
    wrap_predicate(kb_catalog:directory_manifest(_,_,_),source_pack_count,Manifest,
      (nb_getval(pack_manifest_calls,N),Next is N+1,nb_setval(pack_manifest_calls,Next),call(Manifest))).
unguard_catalog_reads :-
    forall(blocked_catalog_goal(Head),unwrap_predicate(Head,source_pack_no_full_reads)),
    unwrap_predicate(kb_catalog_query:source_pack_snapshot(_),source_pack_count),
    unwrap_predicate(kb_catalog:directory_manifest(_,_,_),source_pack_count).

test(catalog_resolution_captures_once_without_full_reads_or_writes,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),publish_catalog([Root,Provider],_),create_example(Saved),
    packs_file(File),file_digest(File,Before),kb_store:generation(G),
    setup_call_cleanup(guard_catalog_reads(),
      (resolve_pack(Saved.pack.id,Saved.revision,[],R),
       assertion(R.ready==true),nb_getval(pack_snapshot_calls,1),nb_getval(pack_manifest_calls,1)),
      unguard_catalog_reads()),
    member_paths(R,['KBs/provider.krf','KBs/root.krf']),
    file_digest(File,Before),kb_store:generation(G),
    assertion(R.coverage.globalProviders.scope==catalog_snapshot).
test(catalog_index_operation_reuses_one_snapshot_and_does_not_persist_duplicate_index,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),publish_catalog([Root,Provider],_),
    setup_call_cleanup(guard_catalog_reads(),
      (refresh_provider_index(all,I),assertion(I.coverage.complete==true),
       assertion(I.persisted==false),nb_getval(pack_snapshot_calls,1),nb_getval(pack_manifest_calls,1)),
      unguard_catalog_reads()),
    kb_source_packs:providers_file(File),assertion(\+exists_file(File)).
test(catalog_typed_subject_supplies_declaration_without_claiming_implementation,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    source_cache('KBs/root.krf',100,[(x_root:-and(x_doWork)),
      (x_isa(_,_):-and),(x_genls(_,_):-and),x_genls(x_BinaryPredicate,x_Predicate)],Root),
    source_cache('KBs/provider.krf',200,[x_isa(x_doWork,x_BinaryPredicate)],Provider),
    publish_catalog([Root,Provider],_),create_example(Saved),
    resolve_pack(Saved.pack.id,Saved.revision,[],R),assertion(R.ready==true),
    once((member(Support,R.coverage.declaredOnly),Support.symbol==x_doWork)),
    Support.providers=[P],assertion(P.rolePresentation.doInvocation==true),
    assertion(P.kind==declared),assertion(P.evidence=[_]),
    P.evidence=[Proof],assertion(Proof.variableNames==[]),assertion(Proof.implementation==unknown).
test(catalog_ambiguity_is_preserved_outside_reviewed_pack,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),source_cache('KBs/other.krf',300,[(x_need:-and)],Other),
    publish_catalog([Root,Provider,Other],_),create_example(Saved),
    resolve_pack(Saved.pack.id,Saved.revision,[],R),assertion(R.ready==false),
    assertion(issue(R,ambiguous_providers)),member_paths(R,['KBs/root.krf']).
test(catalog_ontology_target_slot_two_is_a_declaration_not_operator_use,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    source_cache('KBs/root.krf',100,[(x_root:-and(x_doneBy(x_event,x_actor))),
      (x_isa(_,_):-and),(x_genls(_,_):-and),(x_arg2Isa(_,_):-and),
      (x_rolesForEventType(_,_):-and),
      x_genls(x_MetaPredicate,x_MetaRelation),x_genls(x_BinaryPredicate,x_Predicate),
      x_isa(x_rolesForEventType,x_MetaPredicate),
      x_arg2Isa(x_rolesForEventType,x_BinaryPredicate)],Root),
    source_cache('KBs/provider.krf',200,[x_rolesForEventType(x_Event,x_doneBy)],Provider),
    publish_catalog([Root,Provider],_),create_example(Saved),
    resolve_pack(Saved.pack.id,Saved.revision,[],R),assertion(R.ready==true),
    once((member(Support,R.coverage.declaredOnly),Support.symbol==x_doneBy)),
    Support.providers=[P],P.evidence=[Proof],
    assertion(Proof.kind==ontology_schema_declaration),assertion(Proof.targetPosition==2),
    assertion(Proof.targetSlotEvidence\==[]),assertion(Proof.implementation==unknown).
test(stale_catalog_removed_provider_is_never_replaced_or_offered,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),publish_catalog([Root,Provider],_),create_example(Saved),
    Chosen=[choice{symbol:x_need,files:['KBs/provider.krf']}],delete_file(Provider),
    setup_call_cleanup(guard_catalog_reads(),
      resolve_pack(Saved.pack.id,Saved.revision,Chosen,R),unguard_catalog_reads()),
    assertion(R.ready==false),assertion(R.coverage.globalProviders.status==stale),
    member_paths(R,['KBs/provider.krf','KBs/root.krf']),
    assertion(issue(R,chosen_file_no_longer_provides_symbol)).
test(pre_extension_catalog_requires_refresh_instead_of_silent_legacy_fallback,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),publish_catalog([Root,Provider],[First,Second]),
    del_dict(providerExtensions,First,_,Old),publish_catalog_files([Old,Second]),create_example(Saved),
    setup_call_cleanup(guard_catalog_reads(),
      resolve_pack(Saved.pack.id,Saved.revision,[],R),unguard_catalog_reads()),
    assertion(R.ready==false),
    assertion(R.coverage.globalProviders.catalog.reason==projection_requires_refresh).
test(rebuilt_current_catalog_preserves_a_missing_saved_choice_without_replacement,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),source_cache('KBs/other.krf',300,[(x_need:-and)],Other),
    create_example(Saved),delete_file(Provider),publish_catalog([Root,Other],_),
    resolve_pack(Saved.pack.id,Saved.revision,
      [choice{symbol:x_need,files:['KBs/provider.krf']}],R),
    assertion(R.coverage.globalProviders.status==available),assertion(R.ready==false),
    assertion(issue(R,chosen_file_no_longer_provides_symbol)),
    member_paths(R,['KBs/provider.krf','KBs/root.krf']).
test(catalog_projection_corruption_is_typed_unavailable_and_does_not_fallback,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),publish_catalog([Root,Provider],_),create_example(Saved),
    kb_catalog_query:query_file(Path),write_text(Path,"corrupt"),
    setup_call_cleanup(guard_catalog_reads(),
      resolve_pack(Saved.pack.id,Saved.revision,[],R),unguard_catalog_reads()),
    assertion(R.ready==false),
    assertion(R.coverage.globalProviders.catalog.reason==snapshot_read_error).
test(catalog_load_retains_raw_and_normalized_hash_guards,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    real_graph(Root,Provider),publish_catalog([Root,Provider],_),create_example(Saved),
    resolve_pack(Saved.pack.id,Saved.revision,[],R),assertion(R.ready==true),
    save_pack(R.pack,Saved.revision,Ready),kb_store:generation(G),
    load_pack(Ready.pack.id,Ready.revision,G,Loaded),assertion(Loaded.status.counts.assertions==2),
    once((member(M,R.pack.members),M.path=='KBs/provider.krf')),
    assertion(get_dict(rawSourceHash,M.identity,_)),assertion(get_dict(normalizedHash,M.identity,_)),
    Bad=M.put(identity,M.identity.put(rawSourceHash,bad_hash)),
    BadPack=R.pack.put(members,[Bad]),
    catch(kb_source_packs:verified_snapshot(BadPack,Provider,_),Error,true),
    assertion(Error=error(source_pack_source_changed(_),_)).

:- end_tests(source_packs).
