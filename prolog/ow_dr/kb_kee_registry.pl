:- module(kb_kee_registry,[capability/2,capabilities/1,effect_closure/2,registry_revision/1,write_reference/1]).
:- use_module(kb_kee_schema).
:- use_module(kb_cache,[]).
:- use_module(library(lists)).
:- use_module(library(http/json)).

tool(kee_catalog_status,catalog_status,'Inspect catalog coverage and freshness',[knowledge_read],all_metadata).
tool(kee_find_terms,catalog_search,'Find terms in the published all-file catalog',[knowledge_read],all_read_mts).
tool(kee_definitions,definitions,'Read source-verified definitions in one explicit MT',[knowledge_read],read_mt).
tool(kee_occurrences,occurrences,'Read semantic occurrences in one explicit MT',[knowledge_read],read_mt).
tool(kee_catalog_assertion,catalog_assertion,'Read one source-verified catalog assertion',[knowledge_read],read_mt).
tool(kee_assertion,assertion,'Read one loaded assertion at an expected generation',[knowledge_read],read_mt).
tool(kee_query,query,'Execute bounded KB inference in one explicit MT',[knowledge_read,query,telemetry],read_mt).

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
    (Operation==query->Permission='knowledge.query';Permission='knowledge.read'),
    json_schema(Spec,Schema),
    Capability=capability{name:Name,schemaVersion:1,operation:Operation,description:Description,
      inputSpec:Spec,inputSchema:Schema,permission:Permission,effects:Effects,dependencies:[],
      scope:Scope,mutation:false,symbolic:true,seconds:30}.
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
    format(S,'| `~w` | ~d | `~w` | `~w` | `~w` |~n',[C.name,C.schemaVersion,C.permission,C.scope,C.effects]).
write_capability_schema(S,C) :-
    format(S,'~n## `~w`~n~n~w.~n~n```json~n',[C.name,C.description]),
    json_write_dict(S,C.inputSchema,[width(100)]),format(S,'~n```~n',[]).
