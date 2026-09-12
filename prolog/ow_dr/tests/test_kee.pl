:- ensure_loaded(test_catalog_index).
:- begin_tests(kee).
:- use_module('../kb_kee').
:- use_module('../kb_kee_schema',[]).
:- use_module('../kb_kee_auth',[]).
:- use_module('../kb_kee_registry',[]).
:- use_module('../kb_catalog_query',[]).
:- use_module('../kb_catalog_index',[]).
:- use_module('../kb_cache',[]).
:- use_module('../kb_store',[]).
:- use_module(library(http/json)).

host(Host) :-
    get_time(Now),Expiry is Now+600,
    Host=json{authenticated:true,actor:"fixture-user",kind:"user",agent:"fixture-agent",
      conversation:"fixture-conversation",policyVersion:"policy-1",model:null,
      promptVersion:null,promptHash:null,permissions:["knowledge.read","knowledge.query"],
      readMts:["x_PublicMt"],writeMts:["x_PublicMt"],
      effects:["knowledge_read","query","telemetry"],expiresAt:Expiry,
      budgets:json{calls:100,mutations:20,resultBytes:262144,seconds:10}}.
context(Token) :- host(H),open_context(H,Token).
request(Name,Arguments,json{tool:Name,schemaVersion:1,callId:"fixture-call",arguments:Arguments}).
invoke_tool(Token,Name,Args,Reply) :- request(Name,Args,Request),invoke(Token,Request,Reply).
fixture(State) :-
    plunit_catalog_index:fixture(State),nb_delete(powder_catalog_query).
cleanup(State) :-
    findall(Path,kb_store:source_info(Path,_),Paths),
    forall(member(Path,Paths),unload_fixture(Path)),
    retractall(kb_kee_auth:context(_,_,_,_)),
    nb_delete(powder_catalog_query),plunit_catalog_index:cleanup(State).
unload_fixture(Path) :- kb_store:generation(G),kb_store:unload_source(Path,G,_).
compiled(Name,Text,Path) :- plunit_catalog_index:compiled(Name,Text,Path).
build :-
    kb_catalog_index:refresh_catalog(all,_),kb_catalog_query:build_query_catalog(false,_).
load_cached(Path) :-
    kb_paths:cache_paths(Path,Cache,_),kb_cache:file_digest(Path,SourceHash),
    kb_cache:file_digest(Cache,OutputHash),kb_store:generation(G),
    kb_store:add_cached_sources([json{source:Path,sourceHash:SourceHash,outputHash:OutputHash}],G,_).

test(registry_real_names_versions_and_strict_schemas,[setup(context(T)),cleanup(close_context(T))]) :-
    registry(T,R),assertion(R.registry==powder_kee),assertion(R.schemaVersion==1),
    findall(Name,(member(C,R.tools),get_dict(name,C,Name)),Names),
    sort(Names,Unique),assertion(same_length(Names,Unique)),
    forall(member(C,R.tools),(assertion(C.inputSchema.type==object),
      assertion(C.inputSchema.additionalProperties==false),assertion(C.schemaVersion==1),
      assertion(C.providerExport.rawResultAllowed==false),
      assertion(C.providerExport.projection==host_approved_only),
      assertion(C.providerExport.gateImplemented==false))),
    assertion(memberchk(kee_query,Names)),assertion(\+memberchk(debug,Names)),
    once((member(Search,R.tools),Search.name==kee_find_terms)),assertion(Search.available==false),
    assertion(member(json{capability:assertion_subset_load,reason:true_subset_backend_not_implemented},R.unavailable)),
    atom_json_dict(_,R,[]).

test(raw_json_requires_object,[setup(context(T)),cleanup(close_context(T))]) :-
    forall(member(Text,["null","[]","123","\"call(shell)\""]),
      (catch(invoke_json(T,Text,_),error(kee(invalid_json,_),_),Caught=true),assertion(Caught==true))).
test(unknown_envelope_and_arguments_rejected,[setup(context(T)),cleanup(close_context(T))]) :-
    request("kee_catalog_status",json{},R),
    catch(invoke(T,R.put(approved,true),_),error(kee(invalid_arguments,_),_),Outer=true),assertion(Outer==true),
    catch(invoke_tool(T,"kee_catalog_status",json{approved:true},_),error(kee(invalid_arguments,_),_),Inner=true),
    assertion(Inner==true).
test(no_unknown_tools_or_version_guessing,[setup(context(T)),cleanup(close_context(T))]) :-
    catch(invoke_tool(T,"call",json{},_),error(kee(unknown_tool,_),_),Unknown=true),assertion(Unknown==true),
    request("kee_query",json{},R),
    catch(invoke(T,R.put(schemaVersion,2),_),error(kee(invalid_arguments,_),_),Version=true),assertion(Version==true).
test(boolean_and_number_types_not_coerced) :-
    catch(kb_kee_schema:validate(boolean,"true",_),error(kee(invalid_arguments,_),_),B=true),assertion(B==true),
    catch(kb_kee_schema:validate(int(0,10),"0",_),error(kee(invalid_arguments,_),_),N=true),assertion(N==true),
    kb_kee_schema:validate(int(0,10),0,0),kb_kee_schema:validate(boolean,false,false).
test(authentication_is_not_tool_input) :-
    host(H),catch(open_context(H.put(authenticated,false),_),error(kee(unauthenticated,_),_),Denied=true),
    assertion(Denied==true).
test(llm_context_requires_host_prompt_snapshot) :-
    host(H),catch(open_context(H.put(kind,"llm"),_),error(kee(invalid_principal,_),_),Denied=true),
    assertion(Denied==true).
test(unbound_close_cannot_revoke_every_context,[setup(context(T)),cleanup(close_context(T))]) :-
    catch(close_context(_),error(kee(invalid_context,_),_),Rejected=true),assertion(Rejected==true),
    registry(T,_).
test(duplicate_json_properties_rejected,[setup(context(T)),cleanup(close_context(T))]) :-
    catch(invoke_json(T,"{\"tool\":\"kee_query\",\"tool\":\"call\"}",_),
      error(kee(invalid_json,_),_),Rejected=true),assertion(Rejected==true).
test(admitted_call_budget_is_shared_and_bounded) :-
    host(H),B=H.budgets.put(calls,1),
    setup_call_cleanup(open_context(H.put(budgets,B),T),
      (kb_kee_registry:capability(kee_query,C),kb_kee_auth:admit(T,C,_),
       catch(kb_kee_auth:admit(T,C,_),error(kee(call_budget,_),_),Denied=true),assertion(Denied==true)),
      close_context(T)).
test(symbolic_read_ceiling_and_volatile_authority) :-
    host(H),setup_call_cleanup(open_context(H.put(kind,"symbolic"),T),
      (registry(T,R),once((member(Q,R.tools),Q.name==kee_query)),assertion(Q.available==true),
       kb_kee_auth:principal(T,P),kb_kee_registry:capability(kee_query,C),
       catch(kb_kee_auth:authorize(P,C.put(symbolic,false)),
         error(kee(symbolic_effect_denied,_),_),Denied=true),assertion(Denied==true)),
      close_context(T)),
    assertion(predicate_property(kb_kee_auth:context(_,_,_,_),volatile)).
test(expired_and_revoked_contexts) :-
    host(H),catch(open_context(H.put(expiresAt,0),_),error(kee(context_expired,_),_),Expired=true),
    assertion(Expired==true),context(T),close_context(T),
    catch(registry(T,_),error(kee(invalid_context,_),_),Revoked=true),assertion(Revoked==true).
test(permission_and_effect_ceilings) :-
    host(H),setup_call_cleanup(open_context(H.put(permissions,[]),T),
      (catch(invoke_tool(T,"kee_catalog_status",json{},_),error(kee(permission_denied,_),_),Denied=true),
       assertion(Denied==true)),close_context(T)),
    setup_call_cleanup(open_context(H.put(effects,[]),E),
      (catch(invoke_tool(E,"kee_catalog_status",json{},_),error(kee(effect_denied,_),_),Blocked=true),
       assertion(Blocked==true)),close_context(E)).
test(explicit_mt_scope_denial_without_materialization,[setup(context(T)),cleanup(close_context(T))]) :-
    catch(invoke_tool(T,"kee_occurrences",json{term:"x_p",mt:"x_PrivateMt"},_),
      error(kee(mt_scope_denied,_),_),Denied=true),assertion(Denied==true),
    catch(invoke_tool(T,"kee_query",json{query:"(p ?X)",mt:null,generation:0},_),
      error(kee(invalid_arguments,_),_),Missing=true),assertion(Missing==true).
test(compound_mt_and_case_preserved) :-
    host(H),MT="mt:x_ContextFn(x_A,x_Case)",
    setup_call_cleanup(open_context(H.put(json{readMts:[MT],writeMts:[MT]}),T),
      (kb_kee_auth:principal(T,P),kb_kee_auth:authorize_mt(P,read,MT),
       catch(kb_kee_auth:authorize_mt(P,write,"mt:x_ContextFn(x_A,x_case)"),
         error(kee(mt_scope_denied,_),_),Case=true),assertion(Case==true),
       catch(kb_kee_auth:canonical_mt("mt:x_ContextFn(X)",_),
         error(kee(invalid_mt,_),_),Variable=true),assertion(Variable==true)),
      close_context(T)).
test(utf8_result_budget_counts_bytes) :-
    kb_kee_schema:json_size(json{text:"α"},Wide),
    kb_kee_schema:json_size(json{text:"a"},Narrow),assertion(Wide>Narrow).

test(real_catalog_definitions_occurrences_and_negative_mt,[setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('terms.krf',"(in-microtheory PublicMt)\n(arity p 1)\n(p a)\n(in-microtheory PrivateMt)\n(p secret)\n",Source),
    kb_cache:file_digest(Source,Before),build,context(T),
    invoke_tool(T,"kee_definitions",json{term:"x_p",mt:"x_PublicMt"},D),
    assertion(D.result.total==1),D.result.items=[Definition],assertion(Definition.line==2),
    invoke_tool(T,"kee_occurrences",json{term:"x_p",mt:"x_PublicMt"},O),
    assertion(O.result.total==2),
    forall(member(Item,O.result.items),assertion(Item.mt==x_PublicMt)),
    atom_string(Definition.id,Id),
    invoke_tool(T,"kee_catalog_assertion",
      json{term:"x_p",source:"KBs/terms.krf",id:Id,mt:"x_PublicMt"},A),
    assertion(A.result.id==Definition.id),
    kb_cache:file_digest(Source,After),assertion(Before==After),
    kb_store:status(KB),assertion(KB.counts.assertions==0),close_context(T).
test(real_loaded_query_and_assertion_generation_checks,[setup(fixture(S)),cleanup(cleanup(S))]) :-
    compiled('loaded.krf',"(in-microtheory PublicMt)\n(p a)\n(<=== (q ?X) (p ?X))\n(in-microtheory PrivateMt)\n(p secret)\n",Source),
    load_cached(Source),kb_store:generation(G),context(T),
    invoke_tool(T,"kee_query",json{query:"(q ?X)",mt:"x_PublicMt",generation:G},Q),
    assertion(Q.result.solutions=[_]),Q.result.solutions=[Solution],
    assertion(Solution.bindings=[json{name:"?X",value:json{type:symbol,value:x_a}}]),
    once((kb_store:assertion(Id,Row),Row.mt==x_PublicMt)),atom_string(Id,TextId),
    invoke_tool(T,"kee_assertion",json{id:TextId,mt:"x_PublicMt",generation:G},A),
    assertion(A.result.id==Id),assertion(\+get_dict(module,A.result,_)),
    Wrong is G+1,
    catch(invoke_tool(T,"kee_query",json{query:"(q ?X)",mt:"x_PublicMt",generation:Wrong},_),
      error(kee(generation_conflict,_),_),Conflict=true),assertion(Conflict==true),
    kb_store:generation(After),assertion(After==G),close_context(T).

:- end_tests(kee).
