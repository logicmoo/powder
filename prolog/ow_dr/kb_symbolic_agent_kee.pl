:- module(kb_symbolic_agent_kee,[capabilities/2,authorize/4,preflight/4,invoke/5,action_outcome/2,host_ceiling/1]).
:- use_module(kb_kee,[]).
:- use_module(kb_kee_auth,[]).
:- use_module(kb_kee_registry,[]).
:- use_module(kb_kee_schema,[]).
:- use_module(library(error)).
:- use_module(library(lists)).

host_ceiling(ceiling{version:'powder.symbolic-ceiling.v2',kind:symbolic,modality:text,
  model:false,network:false,delegation:false,audio:false,
  allowedEffects:[knowledge_read,query,telemetry,application_read,application_write]}).

% This is a host safety ceiling, not a second tool registry or a permission
% grant. Schemas, callable implementations and permissions come only from KEE.
ceiling_capability(kee_catalog_status,catalog_status,knowledge,false).
ceiling_capability(kee_find_terms,catalog_search,knowledge,false).
ceiling_capability(kee_definitions,definitions,knowledge,false).
ceiling_capability(kee_occurrences,occurrences,knowledge,false).
ceiling_capability(kee_catalog_assertion,catalog_assertion,knowledge,false).
ceiling_capability(kee_assertion,assertion,knowledge,false).
ceiling_capability(kee_query,query,knowledge,false).
ceiling_capability(kee_ledger_status,ledger_status,application_todo,false).
ceiling_capability(kee_call_status,ledger_call_status,application_todo,false).
ceiling_capability(kee_todo_list,todo_list,application_todo,false).
ceiling_capability(kee_todo_get,todo_get,application_todo,false).
ceiling_capability(kee_todo_create,todo_create,application_todo,true).
ceiling_capability(kee_todo_update,todo_update,application_todo,true).
ceiling_capability(kee_todo_delete,todo_delete,application_todo,true).
ceiling_capability(kee_audit,ledger_audit,application_todo,false).
ceiling_capability(kee_undo,ledger_undo,application_todo,true).
ceiling_capability(kee_redo,ledger_redo,application_todo,true).

symbolic_principal(Token,Principal) :-
    kb_kee_auth:principal(Token,Principal),
    (Principal.kind==symbolic,Principal.model==null,
     Principal.promptVersion==null,Principal.promptHash==null->true;
      throw(error(symbolic_context_required,_))).

capabilities(Token,Reply) :-
    symbolic_principal(Token,_),kb_kee:registry(Token,Registry),
    findall(Tool,
      (member(Tool,Registry.tools),Tool.available==true,
       catch(checked_capability(Tool.name,_),error(symbolic_forbidden_capability(_),_),fail)),
      Tools),
    host_ceiling(Ceiling),
    Reply=capabilities{registryRevision:Registry.revision,hostCeiling:Ceiling,tools:Tools,
      unavailable:Registry.unavailable}.

authorize(Token,KnowledgePolicy,Capability,Checked) :-
    must_be(list,KnowledgePolicy),maplist(must_be(string),KnowledgePolicy),
    must_be(string,Capability),atom_string(Name,Capability),
    checked_capability(Name,Checked),
    (memberchk(Capability,KnowledgePolicy)->true;
      throw(error(symbolic_policy_denied(Capability),_))),
    symbolic_principal(Token,Principal),kb_kee_auth:authorize(Principal,Checked).

checked_capability(Name,Capability) :-
    inspect_capability(Name,[],Capability),
    kb_kee_registry:effect_closure(Name,Effects),host_ceiling(Ceiling),
    forall(member(Effect,Effects),
      (memberchk(Effect,Ceiling.allowedEffects)->true;
        throw(error(symbolic_forbidden_capability(Name),_)))).
inspect_capability(Name,Seen,Capability) :-
    (atom(Name),ceiling_capability(Name,Operation,Domain,Mutation),
     \+memberchk(Name,Seen),length(Seen,N),N<32->true;
      throw(error(symbolic_forbidden_capability(Name),_))),
    findall(C,kb_kee_registry:capability(Name,C),Capabilities),
    (Capabilities=[Capability],ground(Capability),Capability.name==Name,
     Capability.schemaVersion==1,Capability.symbolic==true,Capability.mutation==Mutation,
     Capability.operation==Operation,Capability.domain==Domain,is_list(Capability.dependencies)->true;
      throw(error(symbolic_forbidden_capability(Name),_))),
    host_ceiling(Ceiling),
    forall(member(Effect,Capability.effects),
      (memberchk(Effect,Ceiling.allowedEffects)->true;
        throw(error(symbolic_forbidden_capability(Name),_)))),
    forall(member(Dependency,Capability.dependencies),inspect_capability(Dependency,[Name|Seen],_)).

preflight(Token,KnowledgePolicy,Intent,CallId) :-
    prepare_request(Token,KnowledgePolicy,Intent,CallId,_,_).
prepare_request(Token,KnowledgePolicy,Intent,CallId,Capability,Request) :-
    must_be(dict,Intent),must_be(string,CallId),must_be(dict,Intent.arguments),
    authorize(Token,KnowledgePolicy,Intent.capability,Capability),
    kb_kee_schema:validate(str(1,128),CallId,_),
    kb_kee_schema:validate(Capability.inputSpec,Intent.arguments,Arguments),
    symbolic_principal(Token,Principal),
    (Capability.scope==read_mt->kb_kee_auth:authorize_mt(Principal,read,Arguments.mt);
      Capability.scope==write_mt->kb_kee_auth:authorize_mt(Principal,write,Arguments.mt);true),
    Request=json{tool:Intent.capability,schemaVersion:1,callId:CallId,arguments:Intent.arguments}.
invoke(Token,KnowledgePolicy,Intent,CallId,Reply) :-
    prepare_request(Token,KnowledgePolicy,Intent,CallId,Capability,Request),
    dispatch(Capability.mutation,Token,Request,Reply).

dispatch(false,Token,Request,Reply) :-
    execute_request(Token,Request,Raw),canonical_json(Raw,JSON),
    Reply=JSON.put(symbolicEffect,"not_mutation").
dispatch(true,Token,Request,Reply) :-
    catch(
      (execute_request(Token,Request,Raw),canonical_json(Raw,JSON),
       (JSON.ok==true,get_dict(result,JSON,Result),is_dict(Result),
        get_dict(committed,Result,true)->Effect="committed";Effect="unknown"),
       Reply=JSON.put(symbolicEffect,Effect)),
      Error,mutation_unknown(Request,Error,Reply)).
execute_request(Token,Request,Raw) :-
    (once(kb_kee:invoke(Token,Request,Raw))->true;throw(error(symbolic_operation_failed,_))).
mutation_unknown(Request,Error,Reply) :-
    message_to_string(Error,Message),
    Reply=json{ok:false,tool:Request.tool,callId:Request.callId,symbolicEffect:"unknown",
      error:json{code:"symbolic_mutation_outcome_unknown",message:Message}}.

action_outcome(Reply,Outcome) :-
    must_be(dict,Reply),
    (Reply.symbolicEffect=="unknown"->Outcome=unresolved(Reply);
     memberchk(Reply.symbolicEffect,["not_mutation","committed"]),
     Reply.ok==true,get_dict(result,Reply,Result)->Outcome=ok(Result);
     domain_error(symbolic_action_reply,Reply)).

canonical_json(Value,Value) :- (string(Value);number(Value)),!.
canonical_json(Value,JSON) :- atom(Value),!,
    (memberchk(Value,[true,false,null])->JSON=Value;atom_string(Value,JSON)).
canonical_json(Value,JSON) :- is_list(Value),!,maplist(canonical_json,Value,JSON).
canonical_json(Value,JSON) :- is_dict(Value),!,
    dict_pairs(Value,_,Pairs),maplist(canonical_pair,Pairs,Out),dict_pairs(JSON,json,Out).
canonical_json(Value,_) :- domain_error(symbolic_kee_json,Value).
canonical_pair(Key-Value,Key-JSON) :- canonical_json(Value,JSON).
