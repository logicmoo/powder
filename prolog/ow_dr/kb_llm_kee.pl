:- module(kb_llm_kee,[validate_scope/1,registry_status/1,open_turn/5,close_turn/1,run_call/4,
                     preview_grounding/2,approve_grounding/2,verify_outgoing/1,verify_provider_input/2,
                     grounding_material/2,conversation_todos/4,inspect_receipt/5]).
:- use_module(kb_agent_settings,[strict_keys/2]).
:- use_module(kb_llm_schema).
:- use_module(library(error)).
:- use_module(library(http/json)).
:- use_module(kb_kee,[]).
:- use_module(kb_kee_schema,[json_text/2]).
:- use_module(kb_llm_files,[]).
:- use_module(kb_activity,[]).
:- use_module(library(uuid),[]).
:- use_module(library(crypto),[]).
:- use_module(library(utf8),[]).

validate_scope(S) :-
    (get_dict(grant,S,G)->strict_keys(S,[grant,readMts,terms,writeMts]),
      (G==null->true;must_be(string,G));strict_keys(S,[readMts,terms,writeMts])),
    maplist(selected_keys,[S.terms,S.readMts,S.writeMts]),
    (forall(member(MT,S.writeMts),memberchk(MT,S.readMts))->true;
     permission_error(write,llm_mt,outside_read_ceiling)).
selected_keys(Keys) :-
    must_be(list,Keys),length(Keys,N),(N=<32->true;resource_error(llm_scope_limit)),
    forall(member(Key,Keys),(must_be(string,Key),string_length(Key,L),between(1,4096,L))),
    sort(Keys,Unique),(same_length(Keys,Unique)->true;domain_error(duplicate_scope_keys,Keys)).
registry_status(Status) :-
    (catch(setup_call_cleanup(registry_context(Token),
            (kb_kee:registry(Token,Raw),json_normalize(Raw,Registry)),
            kb_kee:close_context(Token)),_,fail)->
       findall(Name,(member(C,Registry.tools),C.available==true,
                     get_dict(name,C,Name),mutation_name(Name)),Mutations),
       (length(Mutations,5)->MutationsAvailable=true;MutationsAvailable=false),
       Status=_{available:true,adapter:"local KEE inspection; provider tools withheld",
         mutationAvailable:MutationsAvailable,mutationTools:Mutations,managedKbAssertions:false,
         providerTools:[],exportGateReady:false,
         limitation:"The TODO backend is available, but no KEE tools are exposed to this chat. Grounding export is disabled pending authenticated, conversation/destination/model/logging/expiry-bound exact-material consent. Local previews and TODO/receipt inspection remain local."}
    ;Status=_{available:false,mutationAvailable:false,
       limitation:"Typed KEE discovery is unavailable. No tools are advertised."}).
registry_context(Token) :-
    get_time(Now),Expires is Now+5,
    kb_kee:open_context(json{authenticated:true,actor:"local-user",kind:"user",agent:"llm-registry",
      conversation:"local-discovery",policyVersion:"llm-discovery-v1",model:null,
      promptVersion:null,promptHash:null,permissions:["todo.read","todo.write","changeset.read","changeset.undo"],
      readMts:[],writeMts:[],effects:["application_read","application_write"],expiresAt:Expires,
      budgets:json{calls:1,mutations:1,resultBytes:65536,seconds:1}},Token).

open_turn(Config,Prompt,Scope,Handle,Tools) :-
    validate_scope(Scope),host_identity(Config,Prompt,Identity),registry_status(Status),
    (Status.available==false->throw(error(llm_registry_unavailable,_));
     get_time(Now),Expires is Now+Config.budgets.seconds+5,
     Calls is max(1,Config.budgets.calls),Seconds is min(30,Config.budgets.seconds),
     Principal=Identity.put(_{permissions:["knowledge.read","todo.read","todo.write","changeset.read","changeset.undo"],
       readMts:Scope.readMts,writeMts:Scope.writeMts,
       effects:["knowledge_read","application_read","application_write"],expiresAt:Expires,
       budgets:_{calls:Calls,mutations:Config.budgets.calls,resultBytes:65536,seconds:Seconds}}),
     json_normalize(Principal,CheckedPrincipal),
     setup_call_catcher_cleanup(kb_kee:open_context(CheckedPrincipal,Token),
       (kb_kee:registry(Token,Raw),json_normalize(Raw,Registry),
        % Local preview v2 is not the bound export grant required by KEE.
        Tools=[],Handle=kee(Token,Registry.revision,Scope,Tools,Config.conversation)),
       Catcher,(Catcher==exit->true;kb_kee:close_context(Token)))).
policy(Config,Policy) :-
    (get_dict(policyVersion,Config,Policy),Policy=="llm-exact-grounding-v2"->true;
     throw(error(llm_conversation_policy_upgrade_required,_))).
host_identity(Config,Prompt,Identity) :-
    policy(Config,Policy),
    Identity=_{authenticated:true,actor:"local-user",kind:"llm",agent:"llm-knowledge",
      conversation:Config.conversation,policyVersion:Policy,model:Config.model,
      promptVersion:Prompt.revision,promptHash:Prompt.rawHash}.

inspect_receipt(Config,Prompt,Scope,Record,Reply) :-
    validate_scope(Scope),host_identity(Config,Prompt,Identity0),json_normalize(Identity0,Identity),
    (mutation_name(Record.name)->true;permission_error(inspect,receipt,not_a_recorded_mutation)),
    get_time(Now),Expires is Now+10,
    Principal=Identity.put(_{permissions:["changeset.read"],readMts:Scope.readMts,writeMts:[],
      effects:["application_read"],expiresAt:Expires,
      budgets:_{calls:1,mutations:0,resultBytes:16384,seconds:5}}),
    setup_call_cleanup(kb_kee:open_context(Principal,Token),
      inspect_receipt_with_context(Token,Identity,Record,Reply),kb_kee:close_context(Token)).
inspect_receipt_with_context(Token,Identity,Record,Reply) :-
    kb_kee:registry(Token,R),json_normalize(R,Registry),
    (member(C,Registry.tools),C.name=="kee_call_status",C.available==true->true;
     throw(error(llm_receipt_unavailable,_))),
    kb_kee:invoke(Token,_{tool:"kee_call_status",schemaVersion:1,callId:"local-receipt-inspection",
                         arguments:_{callId:Record.id}},Raw),
    json_normalize(Raw,Response),Result=Response.result,
    (Result.callId==Record.id->true;throw(error(llm_invalid_receipt,_))),
    (Result.status=="committed"->
      Commit=Result.commit,
      (Commit.tool==Record.name,snapshot_matches(Identity,Commit.actor)->Matches=true;Matches=false),
      findall(K-V,(member(K,[action,id,undoOf,redoOf]),
        get_dict(K,Commit.result,V),string(V)),Pairs),dict_create(Summary,json,Pairs),
      Receipt=_{revision:Commit.revision,changeset:Commit.changeset,sequence:Commit.sequence,
        tool:Commit.tool,requestHash:Commit.requestHash,recordedMetadataMatches:Matches,result:Summary};
     Result.status=="unknown"->Receipt=null;
     throw(error(llm_invalid_receipt,_))),
    Reply=_{callId:Record.id,localState:Record.state,status:Result.status,
      observedRevision:Result.revision,commit:Receipt,
      notice:"Local read-only observation, not a retry or cancellation result. Unknown may still commit. Metadata agreement does not verify the original argument digest. No conversation is unblocked."}.
snapshot_matches(Identity,Actor) :-
    forall(member(K,[actor,kind,agent,conversation,policyVersion,model,promptVersion,promptHash]),
      (get_dict(K,Identity,V),get_dict(K,Actor,V))).
close_turn(none).
close_turn(kee(Token,_,_,_,_)) :- kb_kee:close_context(Token).

run_call(_,_,_,_) :-
    throw(error(llm_call_rejected,error(llm_grounding_not_approved,_))).

mutation_name(Name) :-
    memberchk(Name,["kee_todo_create","kee_todo_update","kee_todo_delete","kee_undo","kee_redo"]).

% These endpoints are local host UI actions, never model-callable KEE functions.
preview_grounding(Request,Reply) :-
    strict_keys(Request,[requests,scope]),validate_scope(Request.scope),
    must_be(list,Request.requests),length(Request.requests,N),between(1,8,N),
    forall(member(R,Request.requests),validate_preview_selection(Request.scope,R)),
    uuid:uuid(UUID,[version(4)]),atom_string(UUID,Id),
    kb_activity:with_application(kb_llm_kee:
      setup_call_cleanup(local_context(Request.scope,Id,Token),
        maplist(preview_entry(Token),Request.requests,Entries),kb_kee:close_context(Token))),
    digest_json(Entries,Hash),
    Document=_{id:Id,status:"pending",scope:Request.scope,entries:Entries,hash:Hash},
    grant_file(Id,File),kb_llm_files:locked_file(File,kb_llm_files:atomic_json(File,Document)),
    Reply=_{id:Id,hash:Hash,entries:Entries,
      notice:"LOCAL preview only. Approve exactly these nonsensitive fields, IDs and revisions before export. No provider request has occurred."}.
validate_preview_selection(Scope,R) :-
    strict_keys(R,[arguments,tool]),
    (memberchk(R.tool,["kee_definitions","kee_occurrences"])->
      (memberchk(R.arguments.term,Scope.terms),memberchk(R.arguments.mt,Scope.readMts)->true;
       throw(error(llm_export_scope_denied,_)));
     true).
approve_grounding(Request,_) :-
    strict_keys(Request,[approvedNonsensitive,hash,id]),
    (Request.approvedNonsensitive==true->true;permission_error(export,grounding,approval_required)),
    grant_file(Request.id,File),
    kb_llm_files:locked_file(File,kb_llm_kee:
      (kb_llm_files:read_json(File,D),
       validate_grant(D),
       (D.hash==Request.hash->true;throw(error(llm_grounding_conflict,_))),
       throw(error(llm_grounding_not_approved,_)))).
grant_file(Id,File) :- state_file('grounding-',Id,File).
state_file(Prefix,Id0,File) :-
    (string(Id0)->atom_string(Id,Id0);Id=Id0),must_be(atom,Id),
    atom_codes(Id,Codes),length(Codes,36),
    forall(member(C,Codes),(between(0'0,0'9,C);between(0'a,0'f,C);C=:=0'-)),
    kb_llm_files:agent_state_dir(Directory),
    atomic_list_concat([Prefix,Id,'.json'],Name),directory_file_path(Directory,Name,File).
approved_document(Scope,D) :-
    get_dict(grant,Scope,Id),Id\==null,grant_file(Id,File),kb_llm_files:read_json(File,D),
    validate_grant(D),D.id==Id,
    D.status=="approved",
    D.scope.terms==Scope.terms,D.scope.readMts==Scope.readMts,D.scope.writeMts==Scope.writeMts.
validate_grant(D) :-
    strict_keys(D,[entries,hash,id,scope,status]),validate_scope(D.scope),
    (memberchk(D.status,["pending","approved"]),is_list(D.entries),D.entries\=[],
     forall(member(E,D.entries),valid_entry_hash(E)),
     digest_json(D.entries,D.hash)->true;throw(error(llm_grounding_corrupt,_))).
valid_entry_hash(E) :-
    strict_keys(E,[evidence,hash,material,request]),
    digest_json(_{material:E.material,evidence:E.evidence},E.hash).
approved_entry(Scope,Request,Entry) :-
    (approved_document(Scope,D),member(Entry,D.entries),same_request(Request,Entry.request)->true;
     throw(error(llm_export_approval_required,_))).
same_request(A,B) :-
    normalize_request(A,NA),normalize_request(B,NB),digest_json(NA,Hash),digest_json(NB,Hash).
normalize_request(Request,Normalized) :-
    (memberchk(Request.tool,["kee_definitions","kee_occurrences"])->
       put_dict(Request.arguments,_{scope:"all",offset:0,limit:5},Args);
     memberchk(Request.tool,["kee_todo_list","kee_audit"])->
       put_dict(Request.arguments,_{offset:0,limit:5},Args);
     Args=Request.arguments),
    Normalized=_{tool:Request.tool,arguments:Args}.
preview_entry(Token,Request,Entry) :-
    strict_keys(Request,[arguments,tool]),
    (memberchk(Request.tool,["kee_catalog_status","kee_definitions","kee_occurrences",
                           "kee_todo_get","kee_todo_list","kee_audit"])->true;
     permission_error(preview,llm_tool,unsupported)),
    (get_dict(limit,Request.arguments,Limit),Limit>5->resource_error(llm_preview_limit);true),
    normalize_request(Request,Normalized),
    digest_json(Normalized,CallId),
    kb_kee:invoke(Token,_{tool:Normalized.tool,schemaVersion:1,callId:CallId,
                        arguments:Normalized.arguments},Raw),
    json_normalize(Raw,Reply),entry_result(Normalized,Reply.result,Entry).
entry_result(Request,Result,Entry) :-
    project(Result,Material),identity_evidence(Result,Evidence),
    digest_json(_{material:Material,evidence:Evidence},Hash),
    kb_llm_files:json_bytes(Material,Bytes),length(Bytes,N),
    (N=<16384->true;resource_error(llm_preview_limit)),
    Entry=_{request:Request,hash:Hash,material:Material,evidence:Evidence}.
identity_evidence(Value,Pairs) :-
    findall(_{field:Key,value:Item},
      evidence_field(Value,Key,Item),Pairs).
evidence_field(D,Key,Value) :-
    is_dict(D),dict_pairs(D,_,Pairs),member(K-V,Pairs),
    (memberchk(K,[id,source,sourceId,sourceHash,contentRevision,resourceRevision,revision,generation,mt])->
       Key=K,Value=V;
     evidence_field(V,Key,Value)).
evidence_field(List,Key,Value) :-
    is_list(List),member(D,List),evidence_field(D,Key,Value).
digest_json(Value,Hash) :-
    kb_llm_files:json_bytes(Value,Bytes),kb_llm_files:bytes_hash(Bytes,Atom),atom_string(Atom,Hash).
local_context(Scope,Conversation,Token) :-
    get_time(Now),Expires is Now+120,
    json_normalize(_{authenticated:true,actor:"local-user",kind:"user",agent:"llm-preview",
      conversation:Conversation,policyVersion:"llm-local-preview-v1",model:null,
      promptVersion:null,promptHash:null,permissions:["knowledge.read","todo.read","changeset.read"],
      readMts:Scope.readMts,writeMts:[],effects:["knowledge_read","application_read"],
      expiresAt:Expires,budgets:_{calls:32,mutations:0,resultBytes:65536,seconds:15}},Principal),
    kb_kee:open_context(Principal,Token).
verify_outgoing(none) :- throw(error(llm_registry_unavailable,_)).
verify_outgoing(kee(Token,_,Scope,_,_)) :-
    kb_kee:registry(Token,_),
    verify_provider_input(Scope,[]).
verify_provider_input(Scope,History) :-
    validate_scope(Scope),must_be(list,History),
    (Scope.terms==[],Scope.readMts==[],Scope.writeMts==[],
     \+ (get_dict(grant,Scope,G),G\==null),
     forall(member(Message,History),
      (is_dict(Message),get_dict(role,Message,Role),
       memberchk(Role,["system","user","assistant"]),
       \+get_dict(name,Message,"approved_grounding")))
     ->true;throw(error(llm_grounding_not_approved,_))).
grounding_material(Scope,Material) :-
    (Scope.terms==[],\+ (get_dict(grant,Scope,G),G\==null)->Material=[];
     throw(error(llm_grounding_not_approved,_))).

% Ordinary automatic mutations are limited to this conversation's own TODOs.
ownership_file(Conversation,File) :- state_file('todo-ownership-',Conversation,File).
ownership(Conversation,D) :-
    ownership_file(Conversation,File),
    (exists_file(File)->kb_llm_files:read_json(File,D);D=_{ids:[],changesets:[]}).
check_owned_mutation(Conversation,Name,Args) :-
    ownership(Conversation,Own),
    (Name=="kee_todo_create"->true;
     memberchk(Name,["kee_todo_update","kee_todo_delete"])->
       (memberchk(Args.id,Own.ids)->true;permission_error(mutate,todo,outside_conversation));
     (memberchk(Args.changeset,Own.changesets)->true;permission_error(undo,changeset,outside_conversation))),
    (get_dict(data,Args,Data)->forall(member(Id,Data.dependencies),
       (memberchk(Id,Own.ids)->true;permission_error(link,todo,outside_conversation)));true).
mutation_receipt(Token,Conversation,Raw,Receipt) :-
    (Raw.committed==true->true;throw(error(llm_mutation_outcome_unknown,_))),
    Base=_{committed:true,replayed:Raw.replayed,revision:Raw.revision,
      currentRevision:Raw.currentRevision,changeset:Raw.changeset,sequence:Raw.sequence,result:Raw.result},
    ownership_file(Conversation,File),
    kb_llm_files:locked_file(File,kb_llm_kee:
      (ownership(Conversation,Before),
       (get_dict(id,Raw.result,Id)->sort([Id|Before.ids],Ids);Ids=Before.ids),
       sort([Raw.changeset|Before.changesets],Changes),
       kb_llm_files:atomic_json(File,_{ids:Ids,changesets:Changes}))),
    (get_dict(id,Raw.result,ResourceId),
     catch((kb_kee:invoke(Token,_{tool:"kee_todo_get",schemaVersion:1,callId:ResourceId,
                                  arguments:_{id:ResourceId}},Get),
            get_dict(resource,Get.result,Resource),get_dict(revision,Resource,ResourceRevision)),_,fail)
     ->Receipt=Base.put(resourceRevision,ResourceRevision);Receipt=Base).
conversation_todos(Config,Prompt,Scope,Reply) :-
    Local=Config.put(budgets,Config.budgets.put(calls,1000)),
    setup_call_cleanup(open_turn(Local,Prompt,Scope,Handle,_),
      local_todos(Handle,Reply),close_turn(Handle)).
local_todos(kee(Token,_,_,_,Conversation),Reply) :-
    ownership(Conversation,Own),
    length(Own.ids,Total),findall(Id,(nth0(N,Own.ids,Id),N<25),Page),
    findall(Item,(member(Id,Page),
      catch((kb_kee:invoke(Token,_{tool:"kee_todo_get",schemaVersion:1,callId:Id,
                                 arguments:_{id:Id}},Raw),json_normalize(Raw,Item)),
            _,Item=_{id:Id,unavailable:true})),Items),
    Reply=_{available:true,items:Items,total:Total,limit:25,
      note:"Local application TODOs with durable audit/undo; not KB assertions and not exported by this inspector."}.

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
      definition,roles,role,key,arity,resource,resources,data,title,description,status,
      priority,dependencies,evidence,reference,note,acceptance,given,when,then,links,
      conversation,agent,changesets,deleted,sequence]).
json_normalize(In,Out) :- json_text(In,Text),atom_json_dict(Text,Out,[]).
