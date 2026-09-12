:- ensure_loaded(test_catalog_query).
:- begin_tests(catalog_search).
:- use_module('../kb_catalog_search').
:- use_module('../kb_catalog_query').
:- use_module('../kb_catalog_directory').
:- use_module(library(prolog_wrap)).
:- use_module(library(socket)).
:- use_module(library(http/http_client)).

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
test(warm_bucket_cache_is_bounded_and_file_stamp_sensitive,
     [setup(fixture(S)),cleanup(cleanup(S))]) :-
    kb_catalog_directory:manifest(Header),
    kb_catalog_directory:bucket_id(x_p,Bucket),
    kb_catalog_directory:read_bucket(Header,Bucket,_),
    setup_call_cleanup(
      wrap_predicate(kb_catalog_directory:read_record(_,_),
        cached_bucket_read,_,throw(unexpected_bucket_read)),
      (kb_catalog_directory:read_bucket(Header,Bucket,_),
       kb_catalog_directory:bucket_path(Header.directory,Bucket,Path),
       setup_call_cleanup(open(Path,append,Out),nl(Out),close(Out)),
       catch(kb_catalog_directory:read_bucket(Header,Bucket,_),Error,true),
       assertion(Error==unexpected_bucket_read)),
      unwrap_predicate(kb_catalog_directory:read_record(_,_),cached_bucket_read)),
    numlist(1,30,Many),kb_catalog_directory:bounded_buckets(15,Many,Kept),
    assertion(length(Kept,15)).

test(real_cold_search_http_never_reads_the_monolithic_model,
     [condition(getenv('OPENWORLD_CATALOG_REAL_PROBE','1'))]) :-
    tcp_socket(Socket),tcp_bind(Socket,Port),tcp_close_socket(Socket),
    kb_store:generation(Generation),
    setup_call_cleanup(
      wrap_predicate(kb_catalog_query:model(_),real_search_no_model,_,throw(monolithic_real_search)),
      setup_call_cleanup(kb_server:start_server(Port),
        (format(atom(Base),'http://127.0.0.1:~d/swish/openworld_dr/api/catalog/search',[Port]),
         atom_concat(Base,'?limit=10',OverviewURL),
         timed_get(overview_cold,OverviewURL,Overview),
         assertion(Overview.total==1007236),assertion(length(Overview.items,10)),
         atom_concat(Base,'?q=diplomaticState&scope=unloaded&limit=10',QueryURL),
         timed_get(substring_warm,QueryURL,Found),
         assertion((member(Term,Found.items),get_dict(term,Term,"x_diplomaticState"))),
         atom_concat(Base,'?group=lexical_words&limit=5',WordsURL),
         timed_get(lexical_category,WordsURL,Words),
         assertion(Words.total>0),assertion(length(Words.items,5))),
        kb_server:stop_server),
      unwrap_predicate(kb_catalog_query:model(_),real_search_no_model)),
    kb_store:generation(Generation).
timed_get(Label,URL,Reply) :-
    statistics(walltime,[Start,_]),
    http_get(URL,Reply,[json_object(dict),timeout(20),status_code(Code),request_header('Connection'=close)]),
    (Code=:=200->true;throw(error(catalog_search_http(Code,Reply),_))),
    statistics(walltime,[End,_]),Ms is End-Start,
    format(user_error,'REAL_CATALOG_SEARCH ~w ~d ms~n',[Label,Ms]).

:- end_tests(catalog_search).
