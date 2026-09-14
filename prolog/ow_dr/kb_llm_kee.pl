:- module(kb_llm_kee,[validate_scope/1,registry_status/1,open_turn/5,close_turn/1,run_call/4,
                     preview_grounding/2,approve_grounding/2,verify_outgoing/1,verify_provider_input/2,
                     grounding_material/2,conversation_todos/4,inspect_receipt/5,
                     consume_grounding/4,local_undo/5,revoke_turn/1]).
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
:- dynamic disclosure_epoch/1.
:- volatile disclosure_epoch/1.
:- dynamic live_turn_context/2.
:- volatile live_turn_context/2.
:- initialization(init_disclosure_epoch).

init_disclosure_epoch :-
    uuid:uuid(U,[version(4)]),atom_string(U,Epoch),
    retractall(disclosure_epoch(_)),assertz(disclosure_epoch(Epoch)).

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
       Status=_{available:true,adapter:"exact selected-material Teacher projection",
         mutationAvailable:MutationsAvailable,mutationTools:Mutations,managedKbAssertions:false,
         providerTools:[],exportGateReady:true,
         limitation:"Only exact, expiring, one-turn approved projections are exportable. Automatic changes are limited to this conversation's audited TODOs. Mutation receipts stop the model loop and stay local. General KB CRUD, symbolic delegation and operators are unavailable."}
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
        turn_tools(Scope,Registry,Tools),
        Handle=kee(Token,Registry.revision,Scope,Tools,Config.conversation),
        (get_dict(run,Config,_)->with_mutex(powder_llm_contexts,
           assertz(live_turn_context(Config.conversation,Token)));true)),
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
close_turn(kee(Token,_,_,_,_)) :-
    with_mutex(powder_llm_contexts,retractall(live_turn_context(_,Token))),
    kb_kee:close_context(Token).
revoke_turn(Conversation) :-
    with_mutex(powder_llm_contexts,
      (findall(Token,retract(live_turn_context(Conversation,Token)),Tokens),
       maplist(kb_kee:close_context,Tokens))).

turn_tools(Scope,Registry,Tools) :-
    (get_dict(grant,Scope,Id),Id\==null->
      grant_file(Id,F),kb_llm_files:read_json(F,Stored),
      (get_dict(schema,Stored,3)->approved_document(Scope,D),
        (D.binding.registryRevision==Registry.revision->Tools=D.tools;throw(error(llm_grounding_conflict,_)));
        Tools=[]);
      Tools=[]).

run_call(Handle,Call,Safe,Audit) :-
    catch((once(validate_dispatch(Handle,Call,Args,Mutation))->true;
           throw(error(llm_grounding_not_approved,_))),
          Error,throw(error(llm_call_rejected,Error))),
    Handle=kee(Token,_,Scope,_,Conversation),Name=Call.function.name,
    (Mutation==true->
      kb_kee:invoke(Token,_{tool:Name,schemaVersion:1,callId:Call.id,arguments:Args},Raw),
      json_normalize(Raw,Reply),mutation_receipt(Token,Conversation,Reply.result,Safe),
      Audit=_{tool:Name,mutation:true,providerExport:false,receipt:Safe};
      approved_entry(Scope,_{tool:Name,arguments:Args},Entry),
      % Read results are the approved snapshot, never an unconstrained fresh result.
      Safe=Entry.material,Audit=_{tool:Name,mutation:false,projectionHash:Entry.hash}).
validate_dispatch(Handle,Call,Args,Mutation) :-
    Handle=kee(_,_,Scope,Tools,Conversation),verify_outgoing(Handle),
    validate_call(Call,Tools),member(T,Tools),T.function.name==Call.function.name,
    validate_arguments(T.function.parameters,Call.function.arguments,Args),
    (mutation_name(Call.function.name)->
      check_owned_mutation(Conversation,Call.function.name,Args),Mutation=true;
      approved_entry(Scope,_{tool:Call.function.name,arguments:Args},_),Mutation=false).

mutation_name(Name) :-
    memberchk(Name,["kee_todo_create","kee_todo_update","kee_todo_delete","kee_undo","kee_redo"]).

% These endpoints are local host UI actions, never model-callable KEE functions.
preview_grounding(Request,Reply) :-
    get_dict(conversation,Request,_),!,preview_bound(Request,Reply).
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
approve_grounding(Request,Reply) :-
    strict_keys(Request,[approvedNonsensitive,hash,id]),
    (Request.approvedNonsensitive==true->true;permission_error(export,grounding,approval_required)),
    grant_file(Request.id,File),
    kb_llm_files:locked_file(File,kb_llm_kee:
      (kb_llm_files:read_json(File,D),
       validate_grant(D),
       (D.hash==Request.hash->true;throw(error(llm_grounding_conflict,_))),
       (get_dict(schema,D,3)->
         current_binding(D),revalidate_entries(D),
         (D.status=="pending"->true;throw(error(llm_grounding_conflict,_))),
         kb_llm_files:atomic_json(File,D.put(status,"approved")),
         Reply=_{id:D.id,hash:D.hash,expiresAt:D.expiresAt,status:"approved"};
         throw(error(llm_grounding_not_approved,_))))).
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
    (get_dict(schema,D,3)->
      memberchk(D.status,["approved","consumed"]),current_binding(D),Base=D.binding.scope;
      (D.status=="approved"->throw(error(llm_grounding_not_approved,_));fail)),
    Base.terms==Scope.terms,Base.readMts==Scope.readMts,Base.writeMts==Scope.writeMts.
validate_grant(D) :-
    get_dict(schema,D,3),!,
    strict_keys(D,[schema,id,status,binding,entries,tools,messages,hash,expiresAt,run]),
    (forall(member(E,D.entries),valid_entry_hash(E)),grant_hash(D,D.hash)->true;
     throw(error(llm_grounding_corrupt,_))).
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
                           "kee_todo_get","kee_todo_list","kee_audit","kee_ledger_status"])->true;
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
       (K==source->Key=sourceIdentity,digest_json(V,Value);Key=K,Value=V);
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
verify_outgoing(kee(Token,Revision,Scope,_,Conversation)) :-
    kb_kee:registry(Token,Raw),json_normalize(Raw,Registry),
    (Registry.revision==Revision->true;throw(error(llm_grounding_conflict,_))),
    (get_dict(grant,Scope,G),G\==null->
      (approved_document(Scope,D),D.binding.conversation==Conversation->
        revalidate_entries(D);throw(error(llm_grounding_not_approved,_)));
      verify_provider_input(Scope,[])).
verify_provider_input(Scope,History) :-
    get_dict(grant,Scope,G),G\==null,!,
    (approved_document(Scope,D),append(D.messages,Tail,History),
     safe_continuation(Tail,D)->true;throw(error(llm_grounding_not_approved,_))).
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
    get_dict(grant,Scope,G),G\==null,!,
    (approved_document(Scope,D)->Material=D.entries;throw(error(llm_grounding_not_approved,_))).
grounding_material(Scope,Material) :-
    (Scope.terms==[],\+ (get_dict(grant,Scope,G),G\==null)->Material=[];
     throw(error(llm_grounding_not_approved,_))).

preview_bound(R,Reply) :-
    strict_keys(R,[automaticTodos,conversation,mode,requests,revision,text]),
    memberchk(R.mode,["chat","generate_comment"]),memberchk(R.automaticTodos,[true,false]),
    must_be(string,R.text),string_length(R.text,L),between(1,8192,L),
    must_be(list,R.requests),length(R.requests,N),between(0,8,N),
    kb_llm_agent:load_document(R.conversation,C),
    (C.revision=:=R.revision,\+memberchk(C.status,["running","closed"])->true;
     throw(error(agent_conversation_conflict,_))),
    Scope=C.scope,validate_scope(Scope),
    forall(member(Request,R.requests),validate_preview_selection(Scope,Request)),
    (R.mode=="generate_comment",R.requests==[]->throw(error(llm_grounding_required,_));true),
    uuid:uuid(UUID,[version(4)]),atom_string(UUID,Id),
    kb_activity:with_application(kb_llm_kee:
     setup_call_cleanup(local_context(Scope,C.id,Token),
       (maplist(preview_entry(Token),R.requests,Entries),
        kb_kee:registry(Token,Raw),json_normalize(Raw,ReadRegistry)),kb_kee:close_context(Token))),
    Config=C.config.put(conversation,C.id),
    setup_call_cleanup(open_turn(Config,C.prompt,Scope,H,_),
     (H=kee(T,_,_,_,_),kb_kee:registry(T,Reg0),json_normalize(Reg0,Registry),
      approved_tools(Registry,Entries,R,Tools)),close_turn(H)),
    Registry.revision==ReadRegistry.revision,
    digest_json(C.config,ConfigHash),get_time(Now),Expires is Now+300,
    kb_agent_settings:provider_notice(Notice),
    disclosure_epoch(Epoch),
    Binding=_{conversation:C.id,revision:C.revision,configHash:ConfigHash,hostSession:Epoch,
      actor:"local-user",agent:"llm-knowledge",policyVersion:C.config.policyVersion,
     provider:C.config.baseURL,model:C.config.model,settingsRevision:C.config.revision,
     budgets:C.config.budgets,
     promptHash:C.prompt.rawHash,scope:Scope,text:R.text,mode:R.mode,
     automaticTodos:R.automaticTodos,notice:Notice,registryRevision:Registry.revision},
    grounding_messages(C.history,Entries,R,Messages),
    D0=_{schema:3,id:Id,status:"pending",binding:Binding,entries:Entries,
     tools:Tools,messages:Messages,expiresAt:Expires,run:null},
    grant_hash(D0,Hash),Document=D0.put(hash,Hash),
    kb_llm_agent:bounded_json(Messages,C.config.budgets.historyBytes),
    kb_llm_agent:bounded_json(Document,524288),
    grant_file(Id,File),kb_llm_files:locked_file(File,kb_llm_files:atomic_json(File,Document)),
    Reply=Document.put(notice,"LOCAL ONLY. Review all messages, exact evidence and tool schemas. Approval applies to one explicit turn, expires in five minutes, and grants no raw future reads/results. TODO results remain local; Generate Comment is an unsaved proposal.").
approved_tools(Registry,Entries,R,Tools) :-
    findall(Tool,
     (member(C,Registry.tools),C.available==true,
      (member(E,Entries),E.request.tool==C.name;
       R.mode=="chat",R.automaticTodos==true,mutation_name(C.name)),
      Tool=_{type:"function",function:_{name:C.name,description:C.description,parameters:C.inputSchema}}),Raw),
    sort(Raw,Tools),validate_tools(Tools).
grounding_messages(History,Entries,R,Messages) :-
    (Entries==[]->Base=History;
     json_text(Entries,Text),append(History,
       [_{role:"user",name:"approved_grounding",content:Text}],Base)),
    (R.mode=="generate_comment"->
     string_concat("Generate an UNSAVED AI comment proposal from only the approved evidence. Do not write or claim a saved comment. Request: ",R.text,Input);
     Input=R.text),
    append(Base,[_{role:"user",content:Input}],Messages).
grant_hash(D,Hash) :-
    digest_json(_{schema:D.schema,id:D.id,binding:D.binding,entries:D.entries,
                 tools:D.tools,messages:D.messages,expiresAt:D.expiresAt},Hash).
current_binding(D) :-
    get_time(Now),(Now<D.expiresAt->true;throw(error(llm_grounding_expired,_))),
    kb_llm_agent:load_document(D.binding.conversation,C),
    digest_json(C.config,Hash),kb_agent_settings:agent_settings(Current0),json_normalize(Current0,Current),
    kb_agent_settings:provider_notice(Notice),
    (disclosure_epoch(D.binding.hostSession),
     Hash==D.binding.configHash,C.prompt.rawHash==D.binding.promptHash,
     Current.baseURL==D.binding.provider,Current.model==D.binding.model,
     Current.revision==D.binding.settingsRevision,Notice==D.binding.notice,
     (D.status=="consumed"->C.activeTurn==D.run;C.revision=:=D.binding.revision)
     ->true;throw(error(llm_grounding_conflict,_))).
revalidate_entries(D) :-
    setup_call_cleanup(local_context(D.binding.scope,D.binding.conversation,T),
     forall(member(E,D.entries),
       (preview_entry(T,E.request,Current),
        (Current.hash==E.hash->true;throw(error(llm_grounding_stale,_))))),
     kb_kee:close_context(T)).
consume_grounding(Id,C,Request,Run) :-
    grant_file(Id,File),kb_llm_files:locked_file(File,kb_llm_kee:
     (kb_llm_files:read_json(File,D),validate_grant(D),current_binding(D),
      (D.status=="approved",D.binding.conversation==C.id,
       D.binding.revision=:=C.revision,D.binding.text==Request.text->true;
       throw(error(llm_grounding_conflict,_))),
      revalidate_entries(D),atom_string(Run,RunText),
      kb_llm_files:atomic_json(File,D.put(_{status:"consumed",run:RunText})))).
safe_continuation([], _).
safe_continuation([M|Rest],D) :-
    (M.role=="assistant"->true;
     M.role=="tool",atom_json_dict(M.content,R,[]),R.ok==true,
     member(E,D.entries),digest_json(E.material,H),digest_json(R.result,H)),
    safe_continuation(Rest,D).

local_undo(Config,Prompt,Scope,R,Reply) :-
    strict_keys(R,[changeset,revision,action,callId]),
    (memberchk(R.action,["kee_undo","kee_redo"])->true;domain_error(local_undo_action,R.action)),
    setup_call_cleanup(open_turn(Config,Prompt,Scope,H,_),
     (H=kee(Token,_,_,_,Conversation),Args=_{changeset:R.changeset,revision:R.revision},
      check_owned_mutation(Conversation,R.action,Args),
      kb_kee:invoke(Token,_{tool:R.action,schemaVersion:1,callId:R.callId,arguments:Args},Raw),
      json_normalize(Raw,Result),mutation_receipt(Token,Conversation,Result.result,Reply)),
     close_turn(H)).

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
    local_undo_actions(Token,Own,Actions),
    Reply=_{available:true,items:Items,total:Total,limit:25,undoActions:Actions,
      note:"Local application TODOs with durable audit/undo; not KB assertions and not exported by this inspector."}.
local_undo_actions(Token,Own,Actions) :-
    kb_kee_auth:principal(Token,P),
    findall(MT,(MT=null;member(A,P.readMts),atom_string(A,MT)),Mts),
    findall(Seq-Action,
      (member(MT,Mts),
       kb_kee:invoke(Token,_{tool:"kee_audit",schemaVersion:1,callId:"local-undo-options",
         arguments:_{mt:MT,offset:0,limit:25}},Raw),json_normalize(Raw,R),
       member(E,R.result.items),memberchk(E.id,Own.changesets),
       (E.tool=="kee_undo"->Name="kee_redo";mutation_name(E.tool),Name="kee_undo"),
       Seq=E.sequence,Action=_{action:Name,changeset:E.id,revision:R.result.revision}),Rows),
    sort(0,@>=,Rows,Sorted),
    findall(A,(nth0(N,Sorted,_-A),N<5),Actions).

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
