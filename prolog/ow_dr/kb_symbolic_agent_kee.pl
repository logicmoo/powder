:- module(kb_symbolic_agent_kee,[capabilities/2,authorize/4,invoke/5,host_ceiling/1]).
:- use_module(kb_kee,[]).
:- use_module(kb_kee_auth,[]).
:- use_module(kb_kee_registry,[]).
:- use_module(library(error)).
:- use_module(library(lists)).

host_ceiling(ceiling{version:'powder.symbolic-ceiling.v1',kind:symbolic,modality:text,
  model:false,network:false,delegation:false,audio:false,
  allowedEffects:[knowledge_read,query,telemetry]}).

% This is a host safety ceiling, not a second tool registry or a permission
% grant. Schemas, callable implementations and permissions come only from KEE.
ceiling_operation(catalog_status).
ceiling_operation(catalog_search).
ceiling_operation(definitions).
ceiling_operation(occurrences).
ceiling_operation(catalog_assertion).
ceiling_operation(assertion).
ceiling_operation(query).
ceiling_name(kee_catalog_status).
ceiling_name(kee_find_terms).
ceiling_name(kee_definitions).
ceiling_name(kee_occurrences).
ceiling_name(kee_catalog_assertion).
ceiling_name(kee_assertion).
ceiling_name(kee_query).

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
    (atom(Name),ceiling_name(Name),\+memberchk(Name,Seen),length(Seen,N),N<32->true;
      throw(error(symbolic_forbidden_capability(Name),_))),
    findall(C,kb_kee_registry:capability(Name,C),Capabilities),
    (Capabilities=[Capability],Capability.schemaVersion=:=1,
     Capability.symbolic==true,Capability.mutation==false,
     ceiling_operation(Capability.operation),is_list(Capability.dependencies)->true;
      throw(error(symbolic_forbidden_capability(Name),_))),
    host_ceiling(Ceiling),
    forall(member(Effect,Capability.effects),
      (memberchk(Effect,Ceiling.allowedEffects)->true;
        throw(error(symbolic_forbidden_capability(Name),_)))),
    forall(member(Dependency,Capability.dependencies),inspect_capability(Dependency,[Name|Seen],_)).

invoke(Token,KnowledgePolicy,Intent,CallId,Reply) :-
    must_be(dict,Intent),must_be(string,CallId),must_be(dict,Intent.arguments),
    authorize(Token,KnowledgePolicy,Intent.capability,_),
    Request=json{tool:Intent.capability,schemaVersion:1,callId:CallId,arguments:Intent.arguments},
    kb_kee:invoke(Token,Request,Raw),
    canonical_json(Raw,Reply).

canonical_json(Value,Value) :- (string(Value);number(Value);atom(Value)),!.
canonical_json(Value,JSON) :- is_list(Value),!,maplist(canonical_json,Value,JSON).
canonical_json(Value,JSON) :- is_dict(Value),!,
    dict_pairs(Value,_,Pairs),maplist(canonical_pair,Pairs,Out),dict_pairs(JSON,json,Out).
canonical_json(Value,_) :- domain_error(symbolic_kee_json,Value).
canonical_pair(Key-Value,Key-JSON) :- canonical_json(Value,JSON).
