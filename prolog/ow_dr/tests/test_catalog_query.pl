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

:- end_tests(catalog_query).
