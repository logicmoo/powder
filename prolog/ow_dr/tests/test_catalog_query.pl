:- ensure_loaded(test_catalog_index).
:- begin_tests(catalog_query).
:- use_module('../kb_catalog_query').
:- use_module('../kb_catalog_index').
:- use_module('../kb_catalog_schema').
:- use_module('../kb_store',[]).
:- use_module('../kb_server',[]).
:- use_module(library(http/json)).
:- use_module(library(http/http_client)).
:- use_module(library(socket)).

fixture(S) :-
    plunit_catalog_index:fixture(S),nb_delete(powder_catalog_query).
cleanup(S) :-
    nb_delete(powder_catalog_query),plunit_catalog_index:cleanup(S).
compiled(Name,Text,Source) :- plunit_catalog_index:compiled(Name,Text,Source).
build :-
    refresh_catalog(all,C),assertion(C.complete==true),
    build_query_catalog(R),assertion(R.coverage.complete==true).

test(all_files_definition_not_loaded_usage_and_repeated_counts,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(p a a a)\n(arity p 3)\n(isa p Predicate)\n",_),
    compiled('b.krf',"(p b b b)\n(arity p 3)\n",_),
    build,
    catalog_query_search(json{q:x_p},Search),
    once((member(P,Search.items),P.term==x_p)),
    assertion(P.sentences==5),assertion(P.definitions==3),
    catalog_query_term(json{term:x_p,facet:definition,limit:1},Definitions),
    assertion(Definitions.total==3),assertion(Definitions.items=[_]),
    Definitions.items=[First],assertion(First.line==2),assertion(First.loaded==false),
    catalog_query_term(json{term:x_a,facet:semantic},Uses),
    assertion(Uses.total==1),assertion(Uses.occurrences==3),
    Uses.items=[Use],assertion(Use.positions==[[args,0],[args,1],[args,2]]),
    catalog_query_search(json{scope:loaded},Empty),assertion(Empty.total==0),
    catalog_query_term(json{term:x_p,source:'KBs/b.krf'},OneFile),
    assertion(OneFile.total==1),
    with_output_to(string(_),json_write_dict(current_output,Definitions)).
test(ontology_target_second_slot_and_source_order,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(isa aboutRelation MetaRelation)\n(argIsa aboutRelation 2 Relation)\n",_),
    compiled('b.krf',"(aboutRelation Wrong p)\n(aboutRelation p Wrong)\n",_),
    build,catalog_query_term(json{term:x_p},R),
    assertion(R.total==1),R.items=[Item],assertion(Item.line==1),
    assertion(Item.positions==[[args,1]]).
test(indexed_arg_isa_supplies_proven_schema_target_role,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(isa aboutRelation MetaRelation)\n(arg2Isa aboutRelation Relation)\n",_),
    compiled('b.krf',"(aboutRelation Wrong p)\n(aboutRelation p Wrong)\n",_),
    build,catalog_query_term(json{term:x_p},R),
    assertion(R.total==1),R.items=[Item],assertion(Item.line==1),
    assertion(Item.positions==[[args,1]]).
test(meta_function_type_and_declaration_groups,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(genls MetaFunction MetaRelation)\n(genls MetaRelation Predicate)\n(isa resultIsa MetaFunction)\n",_),
    build,catalog_query_search(json{q:x_resultIsa},R),
    R.items=[Item],assertion(Item.groups==[predicates]),assertion(Item.types==[x_MetaFunction]).
test(exact_nat_human_input_and_constructor_definitions_differ,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(isa (Fn A) Collection)\n(arity Fn 1)\n",_),
    build,catalog_query_term(json{term:'(Fn A)'},R),
    assertion(R.term=='nat:x_Fn(x_A)'),assertion(R.total==1),
    R.items=[Item],assertion(Item.line==1),
    catalog_query_term(json{term:x_Fn},Constructor),
    assertion(Constructor.total==1),Constructor.items=[Ctor],assertion(Ctor.line==2),
    catalog_query_assertion(R.term,'KBs/a.krf',Item.id,Detail),
    assertion(Detail.id==Item.id).
test(empty_query_does_not_repeat_terms,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(p aaa bbb)\n",_),build,
    catalog_query_search(json{},R),
    findall(Key,(member(Item,R.items),Key=Item.term),Keys),sort(Keys,Unique),
    assertion(same_length(Keys,Unique)),length(Keys,N),assertion(R.total==N).
test(search_cache_keeps_filters_and_pages_distinct,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(p aaa bbb)\n(arity p 2)\n",_),build,
    catalog_query_search(json{q:x_,limit:1},First),
    catalog_query_search(json{q:x_,offset:1,limit:1},Second),
    assertion(First.total==Second.total),
    First.items=[A],Second.items=[B],assertion(A.term\==B.term),
    catalog_query_search(json{q:x_,scope:loaded},Loaded),assertion(Loaded.total==0),
    catalog_query_search(json{q:x_p},Only),Only.items=[P],assertion(P.term==x_p).
test(legacy_typed_remainder_never_claims_ontological_individual,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(isa item UnclassifiedKind)\n",_),build,
    kb_catalog_query:model(Model),kb_catalog_query:active(_,Active),
    kb_catalog_query:search_json(Model,Active,all,x_item,
      entry(x_item,[individuals],[x_UnclassifiedKind],[],1,1),Legacy),
    assertion(Legacy.groups==[typed_other]),
    catalog_query_search(json{group:typed_other,q:x_item},Reply),Reply.items=[Item],
    assertion(Item.types==[x_UnclassifiedKind]),assertion(Item.groups==[typed_other]),
    assertion(Item.typeEvidenceCoverage==summary_only).
test(repeated_projection_reuses_validated_postings_and_taxonomy,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(p a a)\n(arity p 2)\n",_),build,
    catalog_query_term(json{term:x_a,facet:semantic},Before),
    kb_catalog_query:model(Model),assoc_to_values(Model.files,[File]),
    time_file(File.postings,Stamp),
    build_query_catalog(_),time_file(File.postings,AfterStamp),
    assertion(Stamp=:=AfterStamp),
    nb_delete(powder_catalog_query),
    catalog_query_term(json{term:x_a,facet:semantic},After),
    assertion(After.total==Before.total),assertion(After.occurrences==Before.occurrences),
    assertion(After.items=@=Before.items).
test(definition_publication_does_not_require_provider_enrichment,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(isa aboutRelation MetaRelation)\n(arg2Isa aboutRelation Relation)\n",_),
    compiled('b.krf',"(aboutRelation Other p)\n",_),refresh_catalog(all,_),
    build_query_catalog(false,Report),assertion(Report.coverage.complete==true),
    assertion(Report.providerCoverage==pending),
    catalog_query_term(json{term:x_p},Definitions),
    assertion(Definitions.total==1),Definitions.items=[Item],
    assertion(Item.loaded==false),assertion(Item.positions==[[args,1]]),
    source_pack_snapshot(Pack),assertion(Pack.status==unavailable),
    assertion(Pack.coverage.reason==provider_enrichment_pending).
test(readers_do_not_leave_native_file_handles,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(arity p 1)\n",_),build,
    forall(between(1,5,_),catalog_query_term(json{term:x_p},_)),
    S=state(Root,_),
    findall(File,(stream_property(_,file_name(File)),sub_atom(File,0,_,_,Root)),Open),
    assertion(Open==[]).

test(real_http_definition_and_coverage_routes_without_kb_loading,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(arity p 1)\n",_),build,
    tcp_socket(Socket),tcp_bind(Socket,Port),tcp_close_socket(Socket),
    kb_store:generation(Generation),
    setup_call_cleanup(kb_server:start_server(Port),
      (format(atom(StatusURL),'http://localhost:~d/swish/openworld_dr/api/catalog/status',[Port]),
       http_get(StatusURL,Status,[json_object(dict)]),
       assertion(Status.projection.available==true),
       format(atom(TermURL),'http://localhost:~d/swish/openworld_dr/api/catalog/term?term=x_p',[Port]),
       http_get(TermURL,Term,[json_object(dict)]),
       assertion(Term.total==1),Term.items=[Item],assertion(Item.loaded==false),
       assertion(Item.properties\==[])),
      kb_server:stop_server),
    kb_store:generation(Generation),assertion(\+kb_store:source_info(_,_)).
test(catalog_do_filter_uses_same_naming_and_relation_rule,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(doAttack a)\n(domain a)\n(mentions doSomething)\n(arity doDeclared 1)\n(isa doCollection Collection)\n",_),
    build,catalog_query_search(json{group:do_invocations},R),
    findall(Key,(member(Item,R.items),Key=Item.term),Keys),sort(Keys,Sorted),
    assertion(Sorted==[x_doAttack,x_doDeclared]).
test(source_pack_accessor_is_current_and_detects_removed_source,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(isa p Predicate)\n",Source),build,
    source_pack_snapshot(Snapshot),assertion(Snapshot.status==available),
    assoc_to_values(Snapshot.files,[File]),
    assertion(File.providerExtensions.declared=[_]),
    assertion(is_dict(File.dependencySummary)),
    delete_file(Source),source_pack_snapshot(Stale),assertion(Stale.status==stale),
    assertion(Stale.coverage.complete==false).
test(removed_sources_prevent_republishing_ghost_global_providers,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(arity p 1)\n",Source),build,
    kb_catalog_query:query_file(File),kb_cache:file_digest(File,Before),
    delete_file(Source),
    catch(build_query_catalog(_),Error,true),
    assertion(Error=error(catalog_stale(source_manifest),_)),
    kb_cache:file_digest(File,Before).
test(query_publication_has_measured_elapsed_and_known_denominator,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(arity p 1)\n",_),refresh_catalog(all,_),
    build_query_catalog(Report),assertion(Report.seconds>=0),
    catalog_query_status(Status),
    assertion(Status.projectionProgress.total==1),
    assertion(Status.projectionProgress.completed==1),
    assertion(Status.projectionProgress.state==succeeded).
test(changed_defining_file_invalidates_cached_types_then_retracts_cross_file_categories,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('mentions.krf',"(mentions entity)\n",A),
    compiled('types.krf',"(isa entity Kind)\n(genls Kind Predicate)\n(genls Kind Function)\n",_),
    build,catalog_query_search(json{q:x_entity},Before),Before.items=[Typed],
    assertion(Typed.groups==[functions,predicates]),
    kb_catalog_index:source_path(A,ACache),kb_cache:file_digest(ACache,AHash),
    compiled('types.krf',"(isa entity OtherKind)\n",_),
    refresh_catalog(['KBs/types.krf'],Refresh),assertion(Refresh.complete==true),
    catch(catalog_query_search(json{q:x_entity},_),SearchError,true),
    assertion(SearchError=error(catalog_stale(query_revision),_)),
    catch(catalog_query_term(json{term:x_entity},_),DetailError,true),
    assertion(DetailError=error(catalog_directory_stale,_)),
    kb_catalog_directory:directory_status(Stale),assertion(Stale.state==stale),
    build_query_catalog(false,_),
    catalog_query_search(json{q:x_entity},After),After.items=[Changed],
    assertion(Changed.groups==[typed_other]),assertion(Changed.types==[x_OtherKind]),
    assertion(Changed.files==2),kb_cache:file_digest(ACache,AHash),
    catalog_query_term(json{term:x_entity},Definitions),
    Definitions.items=[Definition],assertion(Definition.source=='KBs/types.krf'),
    current_taxonomy(Schema),
    get_assoc(x_entity,Schema.types,[type(x_OtherKind,e('KBs/types.krf',Id,_,_,_))]),
    assertion(Id==Definition.id).
test(stale_type_source_cannot_leave_other_file_classifications_fresh,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('mentions.krf',"(mentions entity)\n",_),
    compiled('types.krf',"(isa entity Predicate)\n",B),build,
    plunit_catalog_index:write_text(B,"(isa entity Function)\n"),
    refresh_catalog(['KBs/mentions.krf'],R),
    assertion(R.complete==false),assertion(R.freshFiles==1),
    build_query_catalog(false,_),
    catalog_query_search(json{q:x_entity},After),After.items=[Item],
    assertion(Item.groups==[unclassified]),assertion(Item.types==[]),
    assertion(Item.files==1),assertion(After.coverage.complete==false),
    catalog_query_term(json{term:x_entity},Definitions),assertion(Definitions.total==0).
test(removed_type_source_retracts_categories_and_preserves_remaining_mentions,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('mentions.krf',"(mentions entity)\n",_),
    compiled('types.krf',"(isa entity Predicate)\n",B),build,
    delete_file(B),refresh_catalog([],R),
    assertion(R.complete==true),assertion(R.expectedFiles==1),
    build_query_catalog(false,_),
    catalog_query_search(json{q:x_entity},After),After.items=[Item],
    assertion(Item.groups==[unclassified]),assertion(Item.types==[]),
    assertion(Item.files==1).
test(unload_last_file_keeps_disk_membership_types_and_assertion_ids,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('a.krf',"(isa entity Predicate)\n",Source),build,
    catalog_query_term(json{term:x_entity},Before),Before.items=[Original],
    kb_catalog_query:query_file(Query),kb_cache:file_digest(Query,QueryHash),
    kb_store:generation(Generation),
    setup_call_cleanup(kb_store:load_sources([Source],Generation,Loaded),
      (catalog_query_search(json{q:x_entity,scope:loaded},InMemory),
       assertion(InMemory.total==1),
       kb_store:unload_source(Source,Loaded.generation,_),
       catalog_query_search(json{q:x_entity,scope:loaded},Empty),assertion(Empty.total==0),
       catalog_query_search(json{q:x_entity,scope:unloaded},Disk),Disk.items=[Item],
       assertion(Item.groups==[predicates]),assertion(Item.files==1),
       catalog_query_term(json{term:x_entity,scope:unloaded},After),After.items=[Same],
       assertion(Same.id==Original.id),assertion(Same.loaded==false),
       kb_cache:file_digest(Query,QueryHash)),
      unload_fixture_if_loaded(Source)).
current_taxonomy(Schema) :-
    kb_catalog_index:catalog_revision(Revision),
    kb_catalog_index:catalog_paths(Catalog,_),file_directory_name(Catalog,Directory),
    atom_concat(Revision,'.taxonomy',Name),directory_file_path(Directory,Name,Path),
    kb_catalog_index:read_data(Path,catalog_taxonomy(Revision,Schema)).
unload_fixture_if_loaded(Source) :-
    (kb_store:source_info(Source,_)->kb_store:generation(G),kb_store:unload_source(Source,G,_);true).
test(large_catalog_read_capacity_is_thread_local) :-
    current_prolog_flag(stack_limit,Before),
    thread_create((kb_catalog_query:catalog_read_capacity,current_prolog_flag(stack_limit,Limit),
      thread_exit(Limit)),Reader,[]),
    thread_join(Reader,exited(Allocated)),assertion(Allocated>=8589934592),
    current_prolog_flag(stack_limit,After),assertion(After==Before).

:- end_tests(catalog_query).
