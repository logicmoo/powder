:- module(kb_kee_registry,[capability/2,capabilities/1,effect_closure/2,registry_revision/1,write_reference/1]).
:- use_module(kb_kee_schema).
:- use_module(kb_cache,[]).
:- use_module(kb_kee_todo_schema,[]).
:- use_module(kb_kee_agent_schema,[]).
:- use_module(library(lists)).
:- use_module(library(http/json)).

tool(kee_catalog_status,catalog_status,'Inspect catalog coverage and freshness',[knowledge_read],all_metadata).
tool(kee_find_terms,catalog_search,'Find terms in the published all-file catalog',[knowledge_read],all_read_mts).
tool(kee_definitions,definitions,'Read source-verified definitions in one explicit MT',[knowledge_read],read_mt).
tool(kee_occurrences,occurrences,'Read semantic occurrences in one explicit MT',[knowledge_read],read_mt).
tool(kee_catalog_assertion,catalog_assertion,'Read one source-verified catalog assertion',[knowledge_read],read_mt).
tool(kee_assertion,assertion,'Read one loaded assertion at an expected generation',[knowledge_read],read_mt).
tool(kee_query,query,'Execute bounded KB inference in one explicit MT',[knowledge_read,query,telemetry],read_mt).
tool(kee_ledger_status,ledger_status,'Inspect managed application ledger revision and counts',[application_read],all_metadata).
tool(kee_call_status,ledger_call_status,'Inspect a durable call receipt without retrying or reserving a mutation',[application_read],resource_read).
tool(kee_todo_list,todo_list,'List persistent application TODOs in one scope',[application_read],read_mt).
tool(kee_todo_get,todo_get,'Inspect one persistent application TODO',[application_read],resource_read).
tool(kee_todo_create,todo_create,'Create an audited application TODO automatically',[application_write],write_mt).
tool(kee_todo_update,todo_update,'Replace an application TODO at an expected revision',[application_write],write_mt).
tool(kee_todo_delete,todo_delete,'Tombstone an application TODO without deleting its audit history',[application_write],resource_write).
tool(kee_audit,ledger_audit,'Read MT-authorized managed application changesets',[application_read],read_mt).
tool(kee_undo,ledger_undo,'Undo a TODO changeset only when affected versions still match',[application_write],resource_write).
tool(kee_redo,ledger_redo,'Redo an undo changeset only when affected versions still match',[application_write],resource_write).
tool(kee_agent_run_create,agent_run_create,'Create durable agent lifecycle data without starting an agent',[application_write,agent_state_control],write_mt).
tool(kee_agent_run_get,agent_run_get,'Read owned durable agent state',[application_read],resource_read).
tool(kee_agent_run_list,agent_run_list,'List authorized agent state summaries in one MT',[application_read],read_mt).
tool(kee_agent_run_event,agent_run_event,'Atomically CAS agent state and its inert event without executing an action',[application_write,agent_state_control],resource_write).
tool(kee_agent_run_events,agent_run_events,'Read authorized ordered agent events and outcome links',[application_read],resource_read).

input(Operation,Spec) :- kb_kee_todo_schema:input_spec(Operation,Spec),!.
input(Operation,Spec) :- kb_kee_agent_schema:input_spec(Operation,Spec),!.
input(catalog_status,obj([])).
input(catalog_search,obj([req(q,str(0,256)),opt(scope,enum([all,loaded,unloaded])),
    opt(group,enum([all,predicates,functions,collections,microtheories,external_symbols,
      do_invocations,typed_other,individuals,unclassified])),
    opt(offset,int(0,1000000)),opt(limit,int(1,100))])).
input(definitions,Spec) :- term_input(Spec).
input(occurrences,Spec) :- term_input(Spec).
input(catalog_assertion,obj([req(term,str(1,4096)),req(source,str(1,4096)),
    req(id,str(1,128)),req(mt,str(1,4096))])).
input(assertion,obj([req(id,str(1,128)),req(mt,str(1,4096)),req(generation,int(0,9007199254740991))])).
input(query,obj([req(query,str(1,16384)),req(mt,str(1,4096)),
    req(generation,int(0,9007199254740991)),opt(limit,int(1,100)),opt(seconds,num(0.01,30))])).
term_input(obj([req(term,str(1,4096)),req(mt,str(1,4096)),
    opt(scope,enum([all,loaded,unloaded])),opt(offset,int(0,1000000)),opt(limit,int(1,100))])).

capability(Name,Capability) :-
    tool(Name,Operation,Description,Effects,Scope),input(Operation,Spec),
    requirements(Operation,Permission,Extra,Mutation,Domain),
    json_schema(Spec,Schema),
    Capability=capability{name:Name,schemaVersion:1,operation:Operation,description:Description,
      inputSpec:Spec,inputSchema:Schema,permission:Permission,permissions:[Permission|Extra],
      effects:Effects,dependencies:[],domain:Domain,
      scope:Scope,mutation:Mutation,symbolic:true,seconds:30}.
requirements(Operation,Permission,Extra,Mutation,application_todo) :-
    kb_kee_todo_schema:input_spec(Operation,_),!,
    (memberchk(Operation,[todo_create,todo_update,todo_delete])->
      Permission='todo.write',Extra=[],Mutation=true
    ;memberchk(Operation,[ledger_undo,ledger_redo])->
      Permission='changeset.undo',Extra=['todo.write'],Mutation=true
    ;memberchk(Operation,[ledger_status,ledger_call_status,ledger_audit])->
      Permission='changeset.read',Extra=[],Mutation=false
    ;Permission='todo.read',Extra=[],Mutation=false).
requirements(Operation,Permission,[],Mutation,agent_control) :-
    kb_kee_agent_schema:input_spec(Operation,_),!,
    (memberchk(Operation,[agent_run_create,agent_run_event])->
      Permission='agent.run.write',Mutation=true;Permission='agent.run.read',Mutation=false).
requirements(query,'knowledge.query',[],false,knowledge) :- !.
requirements(_,'knowledge.read',[],false,knowledge).
capabilities(Capabilities) :-
    findall(C,capability(_,C),Capabilities),
    findall(N,(member(C,Capabilities),get_dict(name,C,N)),Names),
    sort(Names,Unique),(same_length(Names,Unique)->true;throw(error(duplicate_kee_tool,_))).
effect_closure(Name,Effects) :- closure(Name,[],Raw),sort(Raw,Effects).
closure(Name,Seen,Effects) :-
    (memberchk(Name,Seen)->reject(registry_cycle,json{tool:Name});true),
    (capability(Name,C)->true;reject(unknown_tool,json{tool:Name})),
    findall(E,(member(Dependency,C.dependencies),closure(Dependency,[Name|Seen],Nested),member(E,Nested)),Inherited),
    append(C.effects,Inherited,Effects).
registry_revision(Revision) :- capabilities(C),kb_cache:terms_digest([kee_registry_v1|C],Revision).
write_reference(Path) :-
    capabilities(Capabilities),registry_revision(Revision),
    setup_call_cleanup(open(Path,write,S,[encoding(utf8)]),
      (format(S,'# KEE callable reference~n~nGenerated from `kb_kee_registry.pl`; revision `~w`.~n~n',[Revision]),
       format(S,'| Tool | Schema | Permission | Scope | Effects |~n|---|---|---|---|---|~n',[]),
       forall(member(C,Capabilities),write_capability_line(S,C)),
       forall(member(C,Capabilities),write_capability_schema(S,C))),
      close(S)).
write_capability_line(S,C) :-
    format(S,'| `~w` | ~d | `~w` | `~w` | `~w` |~n',[C.name,C.schemaVersion,C.permissions,C.scope,C.effects]).
write_capability_schema(S,C) :-
    format(S,'~n## `~w`~n~n~w.~n~n```json~n',[C.name,C.description]),
    json_write_dict(S,C.inputSchema,[width(100)]),format(S,'~n```~n',[]).
