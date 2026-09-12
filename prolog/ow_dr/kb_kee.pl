:- module(kb_kee,[open_context/2,close_context/1,registry/2,invoke/3,invoke_json/3]).
:- use_module(kb_kee_auth,[open_context/2,close_context/1]).
:- use_module(kb_kee_schema).
:- use_module(kb_kee_registry,[]).
:- use_module(kb_catalog_query,[]).
:- use_module(kb_store,[]).
:- use_module(kb_reader,[]).
:- use_module(kb_terms,[context_from_key/2]).
:- use_module(kb_activity,[]).
:- use_module(kb_cache,[]).
:- use_module(kb_kee_todos,[]).
:- use_module(library(time)).

registry(Token,Reply) :-
    kb_kee_auth:principal(Token,Principal),kb_kee_registry:capabilities(Caps),
    maplist(public_capability(Principal),Caps,Tools),
    kb_kee_registry:registry_revision(Revision),
    Reply=json{registry:powder_kee,schemaVersion:1,revision:Revision,tools:Tools,
      unavailable:[
        json{capability:managed_knowledge_editing,reason:atomic_managed_store_bridge_not_implemented},
        json{capability:annotation_mutation,reason:atomic_existing_store_audit_bridge_not_implemented},
        json{capability:assertion_subset_load,reason:true_subset_backend_not_implemented},
        json{capability:provider_file_load,reason:per_invocation_host_user_choice_bridge_required},
        json{capability:dependency_planning,reason:provider_bridge_not_integrated},
        json{capability:symbolic_run,reason:runner_not_implemented},
        json{capability:generate_comment,reason:explicit_model_host_bridge_not_implemented}]}.
public_capability(Principal,C,Public) :-
    (catch(kb_kee_auth:authorize(Principal,C),error(kee(_,Reason),_),Denied=Reason)->
       (var(Denied)->Available=true,Why=null;Available=false,Why=Denied)
    ;Available=false,Why=json{reason:not_authorized}),
    kb_kee_registry:effect_closure(C.name,Effects),
    (C.mutation==true->Cancellation=before_durable_commit;Cancellation=bounded_read),
    Public=json{name:C.name,schemaVersion:C.schemaVersion,description:C.description,
      inputSchema:C.inputSchema,permission:C.permission,permissions:C.permissions,scope:C.scope,effects:Effects,
      dependencies:C.dependencies,mutation:C.mutation,symbolic:C.symbolic,
      available:Available,unavailableReason:Why,
      cancellation:Cancellation,maximumSeconds:C.seconds}.
invoke_json(Token,JSON,Reply) :- decode_object(JSON,Request),invoke(Token,Request,Reply).
invoke(Token,Input,Reply) :-
    validate(obj([req(tool,str(1,64)),req(schemaVersion,int(1,1)),
      req(callId,str(1,128)),req(arguments,object)]),Input,_),
    invoke_checked(Token,Input,Reply).

% The envelope's arguments schema is selected only from this compiled registry.
invoke_checked(Token,Input,Reply) :-
    atom_string(Name,Input.tool),
    (kb_kee_registry:capability(Name,C)->true;reject(unknown_tool,json{tool:Name})),
    validate(C.inputSpec,Input.arguments,Arguments),
    kb_kee_auth:admit(Token,C,Principal),check_scope(C.scope,Principal,Arguments),
    Seconds is min(C.seconds,Principal.budgets.seconds),
    call_with_time_limit(Seconds,kb_kee:run_tool(C,Token,Principal,Input,Arguments,Result)),
    (C.mutation==true->true;
      kb_kee_auth:principal(Token,Current),
      (Current==Principal->true;reject(context_changed,json{}))),
    kb_kee_registry:registry_revision(Registry),
    Reply=json{ok:true,tool:Name,schemaVersion:1,callId:Input.callId,
      registryRevision:Registry,result:Result},
    json_size(Reply,Size),
    (Size=<Principal.budgets.resultBytes->true;reject(result_budget,json{maximum:Principal.budgets.resultBytes})).
check_scope(read_mt,Principal,Arguments) :- !,kb_kee_auth:authorize_mt(Principal,read,Arguments.mt).
check_scope(write_mt,Principal,Arguments) :- !,kb_kee_auth:authorize_mt(Principal,write,Arguments.mt).
check_scope(_,_,_).
run_tool(C,Token,P,Input,Args,Result) :-
    (C.domain==application_todo->
      Request=json{tool:Input.tool,schemaVersion:Input.schemaVersion,callId:Input.callId,arguments:Args},
      kb_kee_todos:run(C.operation,Token,P,Request,Args,Result)
    ;execute(C.operation,Args,Result)).

option(Args,Key,Default,Value) :- (get_dict(Key,Args,Value)->true;Value=Default).
catalog_options(Args,Facet,Options) :-
    option(Args,scope,all,Scope),option(Args,offset,0,Offset),option(Args,limit,25,Limit),
    kb_kee_auth:canonical_mt(Args.mt,MT),atom_string(Term,Args.term),
    Options=json{term:Term,mt:MT,facet:Facet,scope:Scope,offset:Offset,limit:Limit}.
execute(catalog_status,_,Result) :- kb_catalog_query:catalog_query_status(Result).
execute(catalog_search,Args,Result) :-
    option(Args,scope,all,Scope),option(Args,group,all,Group),
    option(Args,offset,0,Offset),option(Args,limit,25,Limit),
    atom_string(Query,Args.q),(string(Group)->atom_string(GroupKey,Group);GroupKey=Group),
    kb_catalog_query:catalog_query_search(json{q:Query,scope:Scope,group:GroupKey,offset:Offset,limit:Limit},Result).
execute(definitions,Args,Result) :-
    catalog_options(Args,definition,Options),kb_catalog_query:catalog_query_term(Options,Result).
execute(occurrences,Args,Result) :-
    catalog_options(Args,semantic,Options),kb_catalog_query:catalog_query_term(Options,Result).
execute(catalog_assertion,Args,Result) :-
    atom_string(Source,Args.source),atom_string(Id,Args.id),
    kb_catalog_query:catalog_query_assertion(Args.term,Source,Id,Result),
    check_result_mt(Args.mt,Result.mt).
execute(assertion,Args,Result) :-
    with_mutex(openworld_store,kb_kee:loaded_assertion(Args,Result)).
execute(query,Args,Result) :-
    kb_activity:with_application(kb_kee:pinned_query(Args,Result)).
loaded_assertion(Args,Result) :-
    kb_store:generation(Generation),expected_generation(Args.generation,Generation),
    atom_string(Id,Args.id),
    (kb_store:assertion(Id,Row)->true;reject(assertion_not_found,json{id:Id})),
    check_result_mt(Args.mt,Row.mt),
    (del_dict(module,Row,_,Public)->true;Public=Row),
    kb_cache:terms_digest([Id,Row.expression,Row.mt,Row.properties],Revision),
    Result=Public.put(json{generation:Generation,contentRevision:Revision}).
check_result_mt(Expected,Actual) :-
    kb_kee_auth:canonical_mt(Expected,E),kb_kee_auth:canonical_mt(Actual,A),
    (E==A->true;reject(mt_scope_denied,json{})).
expected_generation(Expected,Actual) :-
    (Expected=:=Actual->true;reject(generation_conflict,json{expected:Expected,actual:Actual})).
pinned_query(Args,Result) :-
    setup_call_cleanup(kb_store:acquire_query_snapshot(Snapshot),
      kb_kee:query_snapshot(Args,Snapshot,Result),kb_store:release_query_snapshot(Snapshot)).
query_snapshot(Args,Snapshot,Result) :-
    expected_generation(Args.generation,Snapshot.generation),
    kb_kee_auth:canonical_mt(Args.mt,Key),context_from_key(Key,MT),
    kb_reader:normalize_query(Args.query,Semantic,Names),
    option(Args,limit,20,Limit),option(Args,seconds,5,Seconds),
    kb_store:query_in_snapshot(Snapshot,Semantic,Names,MT,Limit,Seconds,Result).
