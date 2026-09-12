:- begin_tests(symbolic_agent_kee).
:- use_module('../kb_symbolic_agent_kee',[]).
:- use_module('../kb_kee',[]).
:- use_module('../kb_kee_registry',[]).
:- use_module('../kb_store',[]).
:- use_module('../kb_runtime',[]).
:- use_module('../kb_cache',[]).
:- use_module('../kb_symbolic_agent_knowledge',[]).
:- use_module('../kb_symbolic_agent_program',[]).
:- use_module('../kb_symbolic_agent_engine',[]).
:- use_module(symbolic_agent_fixture).
:- use_module(library(filesex)).
:- use_module(library(uuid)).
:- use_module(library(prolog_wrap)).
:- use_module(library(http/http_open),[]).
:- use_module(library(http/http_client),[]).
:- use_module(library(process),[]).

principal(Kind,Principal) :-
    get_time(Now),Expiry is Now+600,
    Principal=json{authenticated:true,actor:"symbolic-test-user",kind:Kind,
      agent:"symbolic-fixture",conversation:"symbolic-test-conversation",
      policyVersion:"test-policy-v1",model:null,promptVersion:null,promptHash:null,
      permissions:["knowledge.read","knowledge.query"],readMts:["x_SymbolicTestWorldMt"],
      writeMts:[],effects:["knowledge_read","query","telemetry","network","llm","agent_proxy"],
      expiresAt:Expiry,budgets:json{calls:100,mutations:0,resultBytes:65536,seconds:2}}.
context(Token) :- principal("symbolic",P),kb_kee:open_context(P,Token).
llm_context(Token) :-
    principal("llm",P0),
    P=P0.put(_{model:"fixture-noncontact-model",promptVersion:"v1",promptHash:"fixture"}),
    kb_kee:open_context(P,Token).

native_fixture(Fixture) :-
    native_fixture_records([kb(a71,x_SymbolicTestWorldMt,x_isa(x_Ada,x_Dog))],Fixture).
native_fixture_records(Records,fixture(Directory,Source,Native,Module,Ids)) :-
    source_file(plunit_symbolic_agent_kee:native_fixture(_),Here),
    file_directory_name(Here,Tests),uuid(UUID),atom_concat('.symbolic-kee-',UUID,Name),
    directory_file_path(Tests,Name,Directory),make_directory(Directory),
    directory_file_path(Directory,'fixture.krf',Source),
    directory_file_path(Directory,'native.data',Native),
    atom_concat(symbolic_kee_,UUID,Module),kb_cache:helper_path(Helper),
    findall(Id,member(kb(Id,_,_),Records),Ids),
    setup_call_cleanup(open(Native,write,S,[encoding(utf8)]),
      (kb_cache:write_one_line(S,(:-use_module(Helper),kb_tail_loader:load_remaining)),
       forall(nth1(Line,Records,kb(Id,Mt,Semantic)),
         (metadata(Id,Mt,Source,Line,Semantic,Metadata),
          kb_cache:guarded_clause(Id,Semantic,Clause),
          kb_cache:write_one_line(S,Clause),maplist(kb_cache:write_one_line(S),Metadata)))),close(S)),
    kb_runtime:native_load(Native,Module),
    assertz(kb_store:source_module(Source,Module,Native)),
    length(Records,Count),
    assertz(kb_store:source_info(Source,info{source:Source,count:Count,sourceOrigin:non_sumo,
      lineCount:Count,sizeBytes:0,status:cache_hit,warnings:[],elapsed:0})),
    forall(nth1(Line,Records,kb(Id,Mt,Semantic)),
      (metadata(Id,Mt,Source,Line,Semantic,Metadata),
       kb_store:activate_record(Source,Module,record(Id,Semantic,Metadata)))).
metadata(Id,Mt,Source,Line,Semantic,Metadata) :-
    term_variables(Semantic,Vars),length(Vars,N),
    findall(Name,(between(1,N,I),format(string(Name),'?V~d',[I])),Names),
    Metadata=[xc_microtheory(Id,Mt),xc_kb_names(Id,Names),
      xc_source_file(Id,Source),xc_source_line(Id,Line)].
cleanup_native(fixture(Directory,Source,Native,_,Ids)) :-
    forall(member(Id,Ids),
      (retractall(kb_store:assertion(Id,_)),retractall(kb_store:constant_locator(_,Id)),
       retractall(kb_store:mt_locator(_,Id)))),
    retractall(kb_store:source_module(Source,_,_)),retractall(kb_store:source_info(Source,_)),
    kb_runtime:native_unload(Native),delete_directory_and_contents(Directory).

snapshot_context(Token) :-
    principal("symbolic",P0),
    P=P0.put(_{agent:"symbolic-audit-fixture",readMts:"all"}),
    kb_kee:open_context(P,Token).
full_fixture(Fixture) :-
    fixture_records(Records),native_fixture_records(Records,Fixture).
snapshot_arguments(Overrides,Args) :-
    kb_store:generation(G),
    Base=json{agent:"x_SymbolicTestAgent",mt:"x_SymbolicTestAgentMt",generation:G,
      linkedMts:["x_SymbolicTestLexiconMt","x_SymbolicTestGrammarMt","x_SymbolicTestDialogueMt",
        "x_SymbolicTestTemplatesMt","x_SymbolicTestPlansMt","x_SymbolicTestGoalsMt",
        "x_SymbolicTestPolicyMt","x_SymbolicTestStateMt","x_SymbolicTestWorldMt"],
      maxRecords:8192,maxBytes:1048576},
    Args=Base.put(Overrides).

test(real_registry_discovery_respects_host_scope,
     [setup(context(Token)),cleanup(kb_kee:close_context(Token))]) :-
    kb_symbolic_agent_kee:capabilities(Token,Capabilities),
    assertion(Capabilities.hostCeiling.model==false),
    assertion(Capabilities.hostCeiling.network==false),
    get_dict(tools,Capabilities,Tools),assertion(Tools\=[]),
    forall(member(Tool,Tools),(get_dict(available,Tool,Available),assertion(Available==true))),
    assertion(\+ (member(T,Tools),get_dict(name,T,kee_find_terms))).

test(real_loaded_assertion_via_typed_registry,
     [setup((native_fixture(F),context(Token))),
      cleanup((kb_kee:close_context(Token),cleanup_native(F)))]) :-
    kb_store:generation(G),
    Intent=intent{capability:"kee_assertion",
      arguments:json{id:"a71",mt:"x_SymbolicTestWorldMt",generation:G}},
    kb_symbolic_agent_kee:invoke(Token,["kee_assertion"],Intent,"run-test/action-1",Reply),
    assertion(Reply.ok==true),assertion(Reply.result.id=="a71"),
    assertion(Reply.result.generation==G).

test(real_query_and_proofs_with_network_and_processes_trapped,
     [setup((native_fixture(F),context(Token))),
      cleanup((kb_kee:close_context(Token),cleanup_native(F)))]) :-
    kb_store:generation(G),
    Intent=intent{capability:"kee_query",arguments:json{
      query:"(#$isa ?Who #$Dog)",mt:"x_SymbolicTestWorldMt",generation:G,limit:3,seconds:1}},
    setup_call_cleanup(trap_transports,
      (kb_symbolic_agent_kee:invoke(Token,["kee_query"],Intent,"run-test/action-2",Reply),
       assertion(Reply.ok==true),assertion(Reply.result.solutions\=[]),
       flag(symbolic_external_calls,Count,Count),assertion(Count==0)),
      untrap_transports).

trap_transports :-
    flag(symbolic_external_calls,_,0),
    wrap_predicate(http_open:http_open(_,_,_),symbolic_network,_,plunit_symbolic_agent_kee:external_call),
    wrap_predicate(http_client:http_post(_,_,_,_),symbolic_network,_,plunit_symbolic_agent_kee:external_call),
    wrap_predicate(process:process_create(_,_,_),symbolic_network,_,plunit_symbolic_agent_kee:external_call).
untrap_transports :-
    unwrap_predicate(http_open:http_open(_,_,_),symbolic_network),
    unwrap_predicate(http_client:http_post(_,_,_,_),symbolic_network),
    unwrap_predicate(process:process_create(_,_,_),symbolic_network).
external_call :-
    flag(symbolic_external_calls,N,N+1),throw(error(symbolic_test_forbidden_transport,_)).

test(mutable_grants_cannot_enable_llm_or_proxy_calls,
     [setup(context(Token)),cleanup(kb_kee:close_context(Token))]) :-
    setup_call_cleanup(trap_transports,
      forall(member(Name,["GenerateComment","kee_generate_comment","kee_agent_proxy",
                         "llm_chat","http_get","shell","prolog","kee_load_files"]),
        (catch(kb_symbolic_agent_kee:invoke(Token,[Name],
           intent{capability:Name,arguments:json{}},"denied",_),Error,true),
         assertion(nonvar(Error)),
         assertion(Error=error(symbolic_forbidden_capability(_),_)))),
      untrap_transports),
    flag(symbolic_external_calls,Count,Count),assertion(Count==0).

test(llm_identity_cannot_be_used_for_symbolic_execution,
     [setup(llm_context(Token)),
      cleanup(kb_kee:close_context(Token)),throws(error(symbolic_context_required,_))]) :-
    kb_symbolic_agent_kee:authorize(Token,["kee_query"],"kee_query",_).

test(missing_knowledge_permission_does_not_default_to_allow,
     [setup(context(Token)),cleanup(kb_kee:close_context(Token)),
      throws(error(symbolic_policy_denied("kee_query"),_))]) :-
    kb_symbolic_agent_kee:authorize(Token,[],"kee_query",_).

test(indirect_and_unknown_effects_are_denied,
     [setup(context(Token)),cleanup(kb_kee:close_context(Token))]) :-
    kb_kee_registry:capability(kee_query,Query),kb_kee_registry:capability(kee_assertion,Assertion),
    Poisoned=Query.put(dependencies,[kee_assertion]),
    Proxy=Assertion.put(effects,[knowledge_read,agent_proxy]),
    setup_call_cleanup(
      wrap_predicate(kb_kee_registry:capability(Name,C),symbolic_effect_test,Wrapped,
        (Name==kee_query->C=Poisoned;Name==kee_assertion->C=Proxy;call(Wrapped))),
      (catch(kb_symbolic_agent_kee:authorize(Token,["kee_query"],"kee_query",_),Error,true),
       assertion(nonvar(Error)),
       assertion(Error=error(symbolic_forbidden_capability(kee_assertion),_))),
      unwrap_predicate(kb_kee_registry:capability(_,_),symbolic_effect_test)).

test(revoked_context_fails_before_dispatch,
     [throws(error(kee(invalid_context,_),_))]) :-
    context(Token),kb_kee:close_context(Token),
    kb_symbolic_agent_kee:invoke(Token,["kee_query"],
      intent{capability:"kee_query",arguments:json{}},"revoked",_).

test(real_pinned_knowledge_snapshot_preserves_grammar_sharing,
     [setup((full_fixture(F),snapshot_context(Token))),
      cleanup((kb_kee:close_context(Token),cleanup_native(F)))]) :-
    kb_kee_auth:principal(Token,P),snapshot_arguments(json{},Args),
    assertion(P.agent\=="x_SymbolicTestAgent"),
    kb_symbolic_agent_knowledge:read_snapshot(P,Args,Snapshot),
    assertion(Snapshot.complete==true),
    kb_symbolic_agent_knowledge:decode_snapshot(Snapshot,Records),
    kb_symbolic_agent_program:compile_program(Records,x_SymbolicTestAgent,x_SymbolicTestAgentMt,Program),
    kb_symbolic_agent_program:initial_state(Program,State),
    kb_symbolic_agent_engine:step(Program,State,text("mark Boreal as cat"),[],Result),
    assertion(member(text("Boreal is cat .",_),Result.events)),
    assertion(\+kb_store:query_snapshot(_,_,_,_)).

test(snapshot_checks_all_linked_mts_before_returning_knowledge,
     [setup((full_fixture(F),context(Token))),
      cleanup((kb_kee:close_context(Token),cleanup_native(F))),
      throws(error(kee(mt_scope_denied,_),_))]) :-
    kb_kee_auth:principal(Token,P0),
    P=P0.put(_{agent:"x_SymbolicTestAgent",readMts:[x_SymbolicTestAgentMt]}),
    snapshot_arguments(json{},Args),
    kb_symbolic_agent_knowledge:read_snapshot(P,Args,_).

test(snapshot_limit_is_not_reported_as_complete,
     [setup((full_fixture(F),snapshot_context(Token))),
      cleanup((kb_kee:close_context(Token),cleanup_native(F))),
      throws(error(symbolic_snapshot_limit(1),_))]) :-
    kb_kee_auth:principal(Token,P),snapshot_arguments(json{maxRecords:1},Args),
    kb_symbolic_agent_knowledge:read_snapshot(P,Args,_).

:- end_tests(symbolic_agent_kee).
