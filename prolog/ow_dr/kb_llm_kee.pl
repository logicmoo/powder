:- module(kb_llm_kee,[validate_scope/1,registry_status/1,open_turn/5,close_turn/1,run_call/4]).
:- use_module(kb_agent_settings,[strict_keys/2]).
:- use_module(kb_llm_schema).
:- use_module(library(error)).
:- use_module(library(http/json)).
:- use_module(kb_kee,[]).

validate_scope(S) :-
    strict_keys(S,[readMts,terms,writeMts]),
    maplist(selected_keys,[S.terms,S.readMts,S.writeMts]),
    forall(member(MT,S.writeMts),memberchk(MT,S.readMts)).
selected_keys(Keys) :-
    must_be(list,Keys),length(Keys,N),(N=<32->true;resource_error(llm_scope_limit)),
    forall(member(Key,Keys),(must_be(string,Key),string_length(Key,L),between(1,4096,L))),
    sort(Keys,Unique),(same_length(Keys,Unique)->true;domain_error(duplicate_scope_keys,Keys)).
registry_status(Status) :-
    (current_predicate(kb_kee:registry/2),current_predicate(kb_kee:invoke/3)->
       Status=_{available:true,adapter:"selected-term read tools",
         mutationAvailable:false,
         limitation:"Only actual selected-term read capabilities are connected; managed mutation/audit/undo bridge is not yet available to this adapter."}
    ;Status=_{available:false,mutationAvailable:false,
       limitation:"The typed KEE registry is not loaded. No tools are advertised."}).

open_turn(Config,Prompt,Scope,Handle,Tools) :-
    validate_scope(Scope),registry_status(Status),
    (Status.available==false->Handle=none,Tools=[];
     get_time(Now),Expires is Now+Config.budgets.seconds+5,
     Calls is max(1,Config.budgets.calls),Seconds is min(30,Config.budgets.seconds),
     Principal=_{authenticated:true,actor:"local-user",kind:"llm",agent:"llm-knowledge",
       conversation:Config.conversation,policyVersion:"llm-selected-nonsensitive-v1",
       model:Config.model,promptVersion:Prompt.revision,promptHash:Prompt.rawHash,
       permissions:["knowledge.read"],readMts:Scope.readMts,writeMts:Scope.writeMts,
       effects:["knowledge_read"],expiresAt:Expires,
       budgets:_{calls:Calls,mutations:0,resultBytes:65536,seconds:Seconds}},
     json_normalize(Principal,CheckedPrincipal),
     setup_call_catcher_cleanup(kb_kee:open_context(CheckedPrincipal,Token),
       (kb_kee:registry(Token,Raw),json_normalize(Raw,Registry),
        findall(Tool,
          (member(C,Registry.tools),C.available==true,connected(C.name,Scope),
           Tool=_{type:"function",function:_{name:C.name,description:C.description,
                                           parameters:C.inputSchema}}),Tools),
        validate_tools(Tools),Handle=kee(Token,Registry.revision,Scope,Tools)),
       Catcher,(Catcher==exit->true;kb_kee:close_context(Token)))).
connected("kee_catalog_status",_).
connected(Name,Scope) :-
    memberchk(Name,["kee_definitions","kee_occurrences"]),Scope.terms\=[],Scope.readMts\=[].
close_turn(none).
close_turn(kee(Token,_,_,_)) :- kb_kee:close_context(Token).

run_call(none,_,_,_) :- throw(error(llm_tool_unavailable,_)).
run_call(kee(Token,Revision,Scope,Tools),Call,Result,Audit) :-
    (validate_call(Call,Tools)->true;throw(error(llm_tool_unavailable,_))),
    member(Tool,Tools),Tool.function.name==Call.function.name,
    validate_arguments(Tool.function.parameters,Call.function.arguments,Arguments),
    (Call.function.name=="kee_catalog_status"->true;
     (memberchk(Arguments.term,Scope.terms),memberchk(Arguments.mt,Scope.readMts))->true;
     throw(error(llm_export_scope_denied,_))),
    kb_kee:registry(Token,Current),json_normalize(Current,Registry),
    (Registry.revision==Revision->true;throw(error(llm_registry_changed,_))),
    kb_kee:invoke(Token,_{tool:Call.function.name,schemaVersion:1,
                        callId:Call.id,arguments:Arguments},Raw),
    json_normalize(Raw,Reply),project(Reply.result,Result),
    Audit=_{callId:Call.id,tool:Call.function.name,registryRevision:Revision,
            mutation:false,outcome:Reply.ok}.

% Source paths and arbitrary metadata are not exportable merely because KEE can read them.
project(Input,Output) :-
    is_dict(Input),!,dict_pairs(Input,_,Pairs),
    findall(Key-Value,(member(Key-Raw,Pairs),export_key(Key),project(Raw,Value)),Safe),
    dict_create(Output,json,Safe).
project(Input,Output) :- is_list(Input),!,maplist(project,Input,Output).
project(Input,Input) :- (string(Input);number(Input);memberchk(Input,[true,false,null])).
export_key(Key) :-
    memberchk(Key,[items,definitions,assertions,expression,expressions,id,mt,term,text,
      name,kind,type,value,args,head,children,values,entries,body,variable,variables,
      predicate,count,total,offset,limit,revision,generation,available,state,
      coverage,complete,published,sourceCount,assertionCount,termCount,sourceLine,
      definition,roles,role,key,arity]).
json_normalize(In,Out) :- atom_json_dict(Text,In,[]),atom_json_dict(Text,Out,[]).
