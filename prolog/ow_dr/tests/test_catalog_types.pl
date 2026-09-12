:- ensure_loaded(test_catalog_query).
:- begin_tests(catalog_types).
:- use_module('../kb_catalog_types').
:- use_module('../kb_catalog_query').
:- use_module(library(prolog_wrap)).
:- use_module(library(http/json)).

fixture(S) :-
    plunit_catalog_query:fixture(S),
    plunit_catalog_query:compiled('a.krf',
      "(in-microtheory DeclarationMt)\n(isa p Custom)\n(isa p Collection)\n",_),
    plunit_catalog_query:compiled('b.krf',
      "(in-microtheory TaxonomyMt)\n(genls Custom Predicate)\n",_),
    plunit_catalog_query:compiled('c.krf',"(p a)\n",_),
    plunit_catalog_query:build.
cleanup(S) :-
    (nb_current(powder_catalog_type_classes,_)->nb_delete(powder_catalog_type_classes);true),
    plunit_catalog_query:cleanup(S).
test(type_and_hierarchy_proofs_retain_distinct_source_ids_and_mts,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    setup_call_cleanup(
      wrap_predicate(kb_catalog_query:model(_),types_no_model,_,throw(monolithic_types)),
      (catalog_query_types(json{term:x_p},R),
       assertion(R.total==2),assertion(R.scope==catalog_taxonomy_not_mt_entailment),
       assertion(R.proofAlternativesExhaustive==false),
       member(Item,R.items),Item.type==x_Custom,
       assertion(Item.declaration.source=='KBs/a.krf'),
       assertion(Item.declaration.microtheory==x_DeclarationMt),
       assertion(Item.declaration.line==2),
       Item.categories=[Category],assertion(Category.group==predicates),
       Category.steps=[Step],assertion(Step.source=='KBs/b.krf'),
       assertion(Step.microtheory==x_TaxonomyMt),assertion(Step.id\==Item.declaration.id),
       with_output_to(string(_),json_write_dict(current_output,R))),
      unwrap_predicate(kb_catalog_query:model(_),types_no_model)).
test(type_pagination_and_unknowns_remain_explicit,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    catalog_query_types(json{term:x_p,offset:0,limit:1},First),
    catalog_query_types(json{term:x_p,offset:1,limit:1},Second),
    assertion(First.total==2),assertion(Second.total==2),
    First.items=[A],Second.items=[B],assertion(A.type\==B.type),
    catalog_query_types(json{term:x_missing},Missing),assertion(Missing.total==0),
    assertion(Missing.implementation==unknown).
test(changed_declaration_retracts_type_support_but_retains_other_source,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    plunit_catalog_query:compiled('a.krf',"(isa p Collection)\n",_),
    kb_catalog_index:refresh_catalog(['KBs/a.krf'],_),
    build_query_catalog(false,_),
    catalog_query_types(json{term:x_p},R),assertion(R.total==1),
    R.items=[Item],assertion(Item.type==x_Collection),
    catalog_query_term(json{term:x_Custom},Hierarchy),
    assertion(Hierarchy.total==1),Hierarchy.items=[H],assertion(H.source=='KBs/b.krf').
test(legacy_upgrade_preserves_query_search_and_posting_identity,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_catalog_directory:paths(_,Manifest),kb_catalog_directory:manifest(Header),
    del_dict(types,Header,_,Legacy),
    kb_catalog_directory:write_record(Manifest,catalog_directory(Legacy)),
    build_type_directory(Report),assertion(Report.claims==2),
    kb_catalog_directory:manifest(After),assertion(After.directory==Header.directory),
    assertion(After.inputHash==Header.inputHash),assertion(After.search==Header.search),
    catalog_query_types(json{term:x_p},R),assertion(R.total==2).
test(native_unload_does_not_remove_catalog_type_provenance,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    catalog_query_types(json{term:x_p},Before),
    kb_catalog:authorize_sources(['KBs/a.krf'],[Source]),kb_store:generation(G),
    kb_store:load_sources([Source],G,Loaded),
    kb_store:unload_source(Source,Loaded.generation,_),
    catalog_query_types(json{term:x_p},After),
    assertion(Before.items==After.items),assertion(Before.revision==After.revision).

test(publication_records_the_expected_type_buckets,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_catalog_directory:manifest(Header),
    kb_catalog_directory:bucket_id(x_p,Bucket),
    assertion(Header.types.bucketKeys==[Bucket]).
test(missing_expected_bucket_is_not_an_empty_type_answer,
     [setup(fixture(S)),cleanup(cleanup(S)),
      throws(error(catalog_type_bucket_missing(_),_))]) :-
    kb_catalog_directory:manifest(Header),
    kb_catalog_directory:bucket_id(x_p,Bucket),
    kb_catalog_types:bucket_path(Header.types.directory,Bucket,Path),
    delete_file(Path),
    catalog_query_types(json{term:x_p},_).
test(unpopulated_bucket_needs_no_payload_read,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_catalog_directory:manifest(Header),
    kb_catalog_directory:bucket_id(x_missing,Bucket),
    assertion(\+memberchk(Bucket,Header.types.bucketKeys)),
    setup_call_cleanup(
      wrap_predicate(kb_catalog_directory:read_record(_,_),no_empty_type_payload,_,
        throw(unexpected_type_payload_read)),
      (type_page(Header,x_missing,0,25,Reply),
       assertion(Reply.items==[]),assertion(Reply.total==0)),
      unwrap_predicate(kb_catalog_directory:read_record(_,_),no_empty_type_payload)).
test(missing_projection_directory_is_not_an_empty_type_answer,
     [setup(fixture(S)),cleanup(cleanup(S)),
      throws(error(catalog_type_directory_missing(_),_))]) :-
    kb_catalog_directory:manifest(Header),
    delete_directory_and_contents(Header.types.directory),
    type_page(Header,x_missing,0,25,_).
test(legacy_existing_bucket_stays_readable,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_catalog_directory:manifest(Header),
    del_dict(bucketKeys,Header.types,_,Legacy),
    type_page(Header.put(types,Legacy),x_p,0,25,Reply),
    assertion(Reply.total==2).
test(legacy_absent_bucket_is_explicitly_unverified,
     [setup(fixture(S)),cleanup(cleanup(S)),
      throws(error(catalog_type_bucket_inventory_missing(_),_))]) :-
    kb_catalog_directory:manifest(Header),
    del_dict(bucketKeys,Header.types,_,Legacy),
    type_page(Header.put(types,Legacy),x_missing,0,25,_).
test(legacy_inventory_upgrade_preserves_other_projection_identities,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_catalog_directory:paths(_,Manifest),kb_catalog_directory:manifest(Header),
    del_dict(bucketKeys,Header.types,_,LegacyTypes),
    kb_catalog_directory:write_record(Manifest,catalog_directory(Header.put(types,LegacyTypes))),
    setup_call_cleanup(
      wrap_predicate(kb_catalog_query:model(_),no_inventory_upgrade_model,_,
        throw(monolithic_inventory_upgrade)),
      build_type_directory(_),
      unwrap_predicate(kb_catalog_query:model(_),no_inventory_upgrade_model)),
    kb_catalog_directory:manifest(After),
    assertion(After.revision==Header.revision),assertion(After.directory==Header.directory),
    assertion(After.inputHash==Header.inputHash),assertion(After.search==Header.search),
    kb_catalog_directory:bucket_id(x_p,Bucket),
    assertion(After.types.bucketKeys==[Bucket]),
    type_page(After,x_missing,0,25,Reply),assertion(Reply.total==0).
test(invalid_bucket_inventory_is_not_an_empty_type_answer,
     [setup(fixture(S)),cleanup(cleanup(S)),
      throws(error(domain_error(catalog_type_bucket_inventory,_),_))]) :-
    kb_catalog_directory:manifest(Header),
    Invalid=Header.types.put(bucketKeys,[not_a_bucket]),
    type_page(Header.put(types,Invalid),x_missing,0,25,_).

:- end_tests(catalog_types).
