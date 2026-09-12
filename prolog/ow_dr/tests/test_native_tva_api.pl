:- begin_tests(native_tva_api).
:- ensure_loaded(test_native_annotations).
:- use_module('../kb_server',[]).
:- use_module(library(http/json)).
:- meta_predicate request(+, +, -).

request(Action,Body,Reply) :-
    atom_json_dict(JSON,Body,[]),atom_length(JSON,Length),
    setup_call_cleanup(open_string(JSON,Stream),
      kb_server:action(Action,[method(post),peer(ip(127,0,0,1)),input(Stream),
        content_type('application/json'),content_length(Length)],Reply),close(Stream)).
setup(F) :- plunit_native_annotations:fixture(F).
cleanup(F) :- plunit_native_annotations:dispose(F).

test(summary_reads_do_not_seed_or_change_kb,[setup(setup(F)),cleanup(cleanup(F))]) :-
    kb_store:status(Before),
    request(tva_summary,_{entities:["x_A"],context:null,options:_{}},R),
    R.items=[Row],assertion(Row.families.opencog.effective.status==uninitialized),
    kb_store:status(After),assertion(After=@=Before),
    kb_native_annotations:native_status(S),assertion(S.recordCount==0).
test(approved_defaults_persist_only_at_default,[setup(setup(F)),cleanup(cleanup(F))]) :-
    kb_server:action(tva_status,[],Before),
    request(tva_initialize,_{revision:Before.revision},Saved),assertion(Saved.recordCount==10),
    request(tva_summary,_{entities:["x_A"],context:null,options:_{}},R),
    R.items=[A],assertion(A.families.opencog.effective.origin==default),
    assertion(A.families.opencog.effective.summary.strength=:=0.5),
    assertion(A.families.opencog.effective.summary.confidence=:=0),
    assertion(\+kb_native_annotations:oc_tva(x_A,_)).
test(zero_and_false_override_defaults_without_merging,[setup(setup(F)),cleanup(cleanup(F))]) :-
    plunit_native_annotations:put(opencog,default,null,stv(0.5,0)),
    plunit_native_annotations:put(opencog,x_A,null,false),
    plunit_native_annotations:put(cyc,default,utility,0.5),
    plunit_native_annotations:put(cyc,x_A,utility,0),
    request(tva_summary,_{entities:["x_A"],context:null,options:_{}},R),
    R.items=[A],assertion(A.families.opencog.effective.origin==atom),
    assertion(A.families.opencog.effective.summary.value==false),
    A.families.cyc.properties=[U],assertion(U.effective.summary.value==0).
test(settings_are_revision_safe_and_preserve_other_keys,[setup(setup(F)),cleanup(cleanup(F))]) :-
    kb_server:action(tva_settings,[],Before),
    request(tva_settings_save,_{context:null,patch:_{utility:0.2},revision:Before.revision},Saved),
    assertion(Saved.effective.utility.summary.value=:=0.2),
    catch(request(tva_settings_save,_{context:null,patch:_{direction:":FORWARD"},revision:Before.revision},_),Error,true),
    kb_server:error_response(Error,409,native_revision_conflict),
    assertion(\+kb_native_annotations:cyc_bayes_value(default,direction,_)).
test(unexpected_fields_do_not_become_an_editor,[setup(setup(F)),cleanup(cleanup(F)),
      throws(error(domain_error(native_request_field,execute),_))]) :-
    request(tva_summary,_{entities:["x_A"],context:null,options:_{},execute:"halt"},_).
test(detail_revision_conflict_is_structured) :-
    kb_server:error_response(error(native_tva_record_revision_conflict(a,b),kb_native_annotations),409,native_record_changed).
test(typed_assertion_and_pair_routes,[setup(setup(F)),cleanup(cleanup(F))]) :-
    plunit_native_annotations:source_fixture([],[]),
    request(tva_assertion,_{entity:"a123",context:null},S),
    request(tva_assertion_save,_{entity:"a123",context:null,patch:_{direction:":FORWARD"},
      revision:S.revision,generation:S.generation,identity:S.identity},Saved),
    assertion(Saved.effective.direction.origin==atom),
    request(tva_pairs_save,_{context:null,family:"nars",pair:_{frequency:0,confidence:0.9},
      revision:Saved.revision,replace:false},Pair),
    assertion(Pair.families.nars.effective.summary.frequency==0).
test(typed_writes_reject_nonlocal_peer,
     [throws(error(permission_error(write,native_annotations,remote_peer),_))]) :-
    kb_server:action(tva_pairs_save,[peer(ip(10,0,0,2))],_).
test(reload_gate_keeps_the_reload_module_context) :-
    kb_reload:remember_loaded_code,
    request(reload_application,_{},R),
    assertion(R.count=:=0).
:- end_tests(native_tva_api).
