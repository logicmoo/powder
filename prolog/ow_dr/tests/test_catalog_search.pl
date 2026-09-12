:- ensure_loaded(test_catalog_query).
:- begin_tests(catalog_search).
:- use_module('../kb_catalog_search').
:- use_module('../kb_catalog_query').
:- use_module('../kb_catalog_directory').
:- use_module(library(prolog_wrap)).

fixture(S) :-
    plunit_catalog_query:fixture(S),
    plunit_catalog_query:compiled('a.krf',
      "(p dog-TheWord)\n(p cat-TheWord)\n(arity p 1)\n",_),
    plunit_catalog_query:compiled('b.krf',"(p dog-TheWord)\n(q Fish-TheWord)\n",_),
    plunit_catalog_query:build.
cleanup(S) :-
    forall(member(Name,[powder_catalog_compact_search,powder_catalog_compact_matches]),
      (nb_current(Name,_)->nb_delete(Name);true)),
    plunit_catalog_query:cleanup(S).

test(search_uses_compact_projection_with_model_forbidden,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    setup_call_cleanup(
      wrap_predicate(kb_catalog_query:model(_),search_no_model,_,throw(monolithic_search)),
      (catalog_query_search(json{q:'WoRd',group:lexical_words},R),
       assertion(R.total==3),R.items=[First|_],assertion(First.term== 'x_dog-TheWord'),
       assertion(First.files==2),assertion(First.sentences==2),
       assertion(memberchk(lexical_words,First.groups)),
       catalog_query_search(json{group:lexical_words,offset:1,limit:1},Page),
       assertion(Page.total==3),assertion(length(Page.items,1)),
       catalog_query_search(json{q:'word',scope:loaded},Empty),assertion(Empty.total==0),
       catalog_query_search(json{q:'word',scope:unloaded},All),assertion(All.total==3)),
      unwrap_predicate(kb_catalog_query:model(_),search_no_model)).
test(upgrade_reuses_buckets_and_postings_without_query_read,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_catalog_directory:paths(_,Manifest),
    kb_catalog_directory:read_record(Manifest,catalog_directory(Header)),
    del_dict(search,Header,Old,Legacy),
    kb_catalog_directory:write_record(Manifest,catalog_directory(Legacy)),
    kb_catalog_index:file_stamp(Old.path,Before),
    setup_call_cleanup(
      wrap_predicate(kb_catalog_query:model(_),search_no_upgrade_model,_,throw(monolithic_upgrade)),
      build_search_directory(R),
      unwrap_predicate(kb_catalog_query:model(_),search_no_upgrade_model)),
    assertion(R.terms==Header.termCount),assertion(R.revision==Header.revision),
    kb_catalog_index:file_stamp(Old.path,Before),
    kb_catalog_directory:manifest(New),assertion(New.directory==Header.directory),
    catalog_query_search(json{q:'word'},Result),assertion(Result.total==3).
test(missing_search_does_not_fall_back_to_monolithic_model,
     [setup(fixture(S)),cleanup(cleanup(S)),throws(error(catalog_search_pending,_))]) :-
    kb_catalog_directory:paths(_,Manifest),
    kb_catalog_directory:read_record(Manifest,catalog_directory(Header)),
    del_dict(search,Header,_,Legacy),
    kb_catalog_directory:write_record(Manifest,catalog_directory(Legacy)),
    catalog_query_search(json{},_).
test(corrupt_binary_search_is_rejected,
     [setup(fixture(S)),cleanup(cleanup(S)),throws(error(invalid_catalog_search(_),_))]) :-
    kb_catalog_directory:manifest(Header),
    setup_call_cleanup(open(Header.search.path,append,Out,[type(binary)]),put_byte(Out,0),close(Out)),
    catalog_query_search(json{},_).
test(lexical_convention_does_not_invent_ontology_type) :-
    public_groups('x_dog-TheWord',[unclassified],Groups),
    assertion(Groups==[lexical_words,unclassified]),
    public_groups('x_dog-TheWordish',[unclassified],[unclassified]),
    public_groups('x_-TheWord',[unclassified],[unclassified]),
    public_groups('x_dog-TheWord',[collections],Both),
    assertion(Both==[collections,lexical_words]).

:- end_tests(catalog_search).
