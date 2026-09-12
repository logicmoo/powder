:- ensure_loaded(test_catalog_query).
:- begin_tests(catalog_directory).
:- use_module('../kb_catalog_directory').
:- use_module('../kb_catalog_query').
:- use_module('../kb_catalog_index',[]).
:- use_module(library(prolog_wrap)).

test(exact_lookup_never_loads_the_monolithic_query_model,
     [setup(plunit_catalog_query:fixture(S)),cleanup(plunit_catalog_query:cleanup(S))]) :-
    plunit_catalog_query:compiled('a.krf',"(arity p 1)\n",_),
    plunit_catalog_query:compiled('b.krf',"(p a)\n",_),
    plunit_catalog_query:build,
    setup_call_cleanup(
      wrap_predicate(kb_catalog_query:model(_),no_monolithic_read,_,
        throw(error(monolithic_model_for_exact_lookup,_))),
      (catalog_query_term(json{term:x_p,scope:unloaded},R),
       assertion(R.total==1),R.items=[Item],assertion(Item.source=='KBs/a.krf'),
       catalog_query_assertion(x_p,'KBs/a.krf',Item.id,Detail),assertion(Detail.id==Item.id)),
      unwrap_predicate(kb_catalog_query:model(_),no_monolithic_read)).
test(changed_query_projection_invalidates_directory,
     [setup(plunit_catalog_query:fixture(S)),cleanup(plunit_catalog_query:cleanup(S)),
      throws(error(catalog_directory_stale,_))]) :-
    plunit_catalog_query:compiled('a.krf',"(arity p 1)\n",_),
    plunit_catalog_query:build,
    kb_catalog_directory:paths(Query,_),
    setup_call_cleanup(open(Query,append,Out),nl(Out),close(Out)),
    lookup_term(x_p,_,_).
test(pending_provider_gate_does_not_parse_large_model,
     [setup(plunit_catalog_query:fixture(S)),cleanup(plunit_catalog_query:cleanup(S))]) :-
    plunit_catalog_query:compiled('a.krf',"(arity p 1)\n",_),
    kb_catalog_index:refresh_catalog(all,_),
    kb_catalog_query:build_query_catalog(false,_),
    setup_call_cleanup(
      wrap_predicate(kb_catalog_query:model(_),no_pending_model_read,_,
        throw(error(monolithic_model_for_pending_providers,_))),
      (source_pack_snapshot(R),assertion(R.status==unavailable),
       assertion(R.coverage.reason==provider_enrichment_pending)),
      unwrap_predicate(kb_catalog_query:model(_),no_pending_model_read)).
test(distinct_symbol_and_nat_keys_share_the_same_directory,
     [setup(plunit_catalog_query:fixture(S)),cleanup(plunit_catalog_query:cleanup(S))]) :-
    plunit_catalog_query:compiled('a.krf',"(arity Fn 1)\n(isa (Fn a) Collection)\n",_),
    plunit_catalog_query:build,
    catalog_query_term(json{term:x_Fn},Constructor),
    catalog_query_term(json{term:'(Fn a)'},Full),
    assertion(Constructor.total==1),assertion(Full.total==1),
    Constructor.items=[C],Full.items=[F],assertion(C.id\==F.id),
    directory_status(Status),assertion(Status.available==true).

:- end_tests(catalog_directory).
