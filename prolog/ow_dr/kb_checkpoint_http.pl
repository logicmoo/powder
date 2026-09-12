:- module(kb_checkpoint_http,
          [checkpoint_endpoint/2, checkpoint_catalog/1,
           submit_checkpoint_operation/3, checkpoint_operation/2,
           cancel_checkpoint_operation/2, checkpoint_http_snapshot_safe/0,
           checkpoint_operations_quiescent/0]).
:- use_module(kb_saved_state, []).
:- use_module(kb_checkpoint, []).
:- use_module(kb_checkpoint_policy, []).
:- use_module(kb_store, []).
:- use_module(kb_activity, []).
:- use_module(kb_urls, []).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_json)).
:- use_module(library(error)).
:- use_module(library(lists)).
:- use_module(library(uuid)).
:- use_module(library(time)).
:- use_module(library(aggregate)).
:- dynamic operation/3.
:- volatile operation/3.
:- dynamic mutation_epoch/1, mutation_receipt/4.
:- volatile mutation_epoch/1, mutation_receipt/4.
:- meta_predicate explicit_mutation(+, +, 0, -).

:- http_handler(openworld_dr('api/checkpoint/catalog'),checkpoint_endpoint(catalog),[method(get)]).
:- http_handler(openworld_dr('api/checkpoint/configuration'),checkpoint_endpoint(configuration),[method(get)]).
:- http_handler(openworld_dr('api/checkpoint/inspect'),checkpoint_endpoint(inspect),[method(get)]).
:- http_handler(openworld_dr('api/checkpoint/create'),checkpoint_endpoint(create),[method(post)]).
:- http_handler(openworld_dr('api/checkpoint/select'),checkpoint_endpoint(select),[method(post)]).
:- http_handler(openworld_dr('api/checkpoint/try'),checkpoint_endpoint(try),[method(post)]).
:- http_handler(openworld_dr('api/checkpoint/status'),checkpoint_endpoint(status),[method(get)]).
:- http_handler(openworld_dr('api/checkpoint/cancel'),checkpoint_endpoint(cancel),[method(post)]).
:- http_handler(openworld_dr('api/checkpoint/promote'),checkpoint_endpoint(promote),[method(post)]).
:- http_handler(openworld_dr('api/checkpoint/identity'),kb_checkpoint:checkpoint_identity_http,[method(get)]).

checkpoint_endpoint(Action,Request) :-
    catch((authorize(Request),
           (memberchk(Action,[create,select,try,promote]),
            current_predicate(kb_checkpoint_host:require_mutable_instance/0)->
              kb_checkpoint_host:require_mutable_instance;true),
           (action(Action,Request,Reply)->respond(200,Reply);
             throw(error(domain_error(checkpoint_request,Action),_)))),
          Error,endpoint_error(Error)).

authorize(Request) :-
    memberchk(peer(ip(127,0,0,1)),Request),
    findall(Host,member(host(Host),Request),[Host]),
    current_predicate(kb_server:server_port/1),
    kb_server:server_port(Port),member(Name,[localhost,'127.0.0.1']),
    format(atom(ExpectedHost),'~w:~d',[Name,Port]),
    (Host==ExpectedHost;Host==Name,memberchk(port(Port),Request);
      Host==Name,Port=:=80,\+memberchk(port(_),Request)),
    format(atom(Origin),'http://~w',[ExpectedHost]),
    findall(O,member(origin(O),Request),Origins),
    memberchk(method(Method),Request),
    (Method==get->(Origins==[];Origins==[Origin]);Origins==[Origin]), !.
authorize(_) :- throw(error(permission_error(access,checkpoint_api,origin),_)).

small_body(Request,Keys,Body) :-
    \+memberchk(transfer_encoding(_),Request),
    memberchk(content_length(N),Request),integer(N),between(2,4096,N),
    call_with_time_limit(5,http_read_json_dict(Request,Body,[value_string_as(atom)])),
    is_dict(Body),dict_pairs(Body,_,Pairs),pairs_keys(Pairs,Actual),
    sort(Keys,Actual), !.
small_body(_,_,_) :- throw(error(domain_error(checkpoint_json,body),_)).
pairs_keys([],[]).
pairs_keys([K-_|Pairs],[K|Keys]) :- pairs_keys(Pairs,Keys).
text(Value) :- must_be(atom,Value),atom_length(Value,N),between(1,120,N).
integer_field(Body,Key) :- get_dict(Key,Body,N),must_be(nonneg,N).

action(catalog,_,Reply) :- checkpoint_catalog(Reply).
action(configuration,_,Reply) :- kb_saved_state:effective_configuration(Reply).
action(inspect,Request,Reply) :-
    http_parameters(Request,[id(Id,[atom])]),kb_saved_state:saved_state_metadata(Id,Reply).
action(create,Request,Reply) :-
    mutation_body(create,Request,[name,generation,revision],Body),
    explicit_mutation(create,Body,submit_checkpoint_operation(create,Body,Reply),Reply).
action(try,Request,Reply) :-
    mutation_body(try,Request,[id,generation],Body),
    explicit_mutation(try,Body,submit_checkpoint_operation(try,Body,Reply),Reply).
action(select,Request,Reply) :-
    mutation_body(select,Request,[id,revision],Body),text(Body.id),text(Body.revision),
    explicit_mutation(select,Body,
      (kb_checkpoint_policy:require_checkpoint_execution(select),
       kb_activity:with_application(kb_saved_state:select_saved_state(Body.id,Body.revision,Reply))),Reply).
action(status,Request,Reply) :-
    http_parameters(Request,[operation(Operation,[atom,optional(true)]),run(Run,[atom,optional(true)])]),
    (nonvar(Operation),var(Run)->checkpoint_operation(Operation,Reply)
    ;nonvar(Run),var(Operation)->kb_checkpoint:checkpoint_status(Run,Reply)
    ;domain_error(checkpoint_status_selector,one_required)).
action(cancel,Request,Reply) :-
    mutation_body(cancel,Request,[kind,id],Body),text(Body.id),
    explicit_mutation(cancel,Body,
      (Body.kind==operation->cancel_checkpoint_operation(Body.id,Reply)
      ;Body.kind==trial->kb_checkpoint:cancel_checkpoint(Body.id,Reply)
      ;domain_error(checkpoint_cancel_kind,Body.kind)),Reply).
action(promote,Request,Reply) :-
    mutation_body(promote,Request,[run,revision,confirm],Body),
    (Body.confirm=='take-over-original-ports'->true;
      throw(error(permission_error(promote,checkpoint,explicit_consent_required),_))),
    text(Body.run),integer_field(Body,revision),
    explicit_mutation(promote,Body,
      kb_checkpoint:promote_checkpoint(Body.run,Body.revision,Reply),Reply).

mutation_body(Action,Request,Keys,Body) :-
    append([intent,checkpointRevision,requestId],Keys,Required),
    small_body(Request,Required,Body),require_intent(Action,Body).
require_intent(Action,Body) :-
    (expected_intent(Action,Body,Intent),Body.intent==Intent->true;
      throw(error(checkpoint_explicit_intent_required,_))).
expected_intent(create,_,'save-state').
expected_intent(select,_,'select-next-start').
expected_intent(try,_,'start-candidate').
expected_intent(promote,_,'promote-candidate').
expected_intent(cancel,Body,'stop-candidate') :- Body.kind==trial.
expected_intent(cancel,Body,'cancel-operation') :- Body.kind==operation.

request_epoch(Epoch) :-
    with_mutex(powder_checkpoint_mutations,
      (mutation_epoch(Epoch)->true;uuid(Epoch),assertz(mutation_epoch(Epoch)))).
explicit_mutation(Action,Body,Goal,Reply) :-
    require_intent(Action,Body),text(Body.checkpointRevision),text(Body.requestId),
    request_epoch(Epoch),
    (atomic_list_concat([Epoch,UUID],':',Body.requestId),request_uuid(UUID)->true;
      throw(error(checkpoint_request_expired,_))),
    with_mutex(powder_checkpoint_mutations,
      (mutation_receipt(Body.requestId,PriorAction,PriorBody,Outcome)->
        (PriorAction==Action,PriorBody=@=Body->receipt_reply(Outcome,Reply);
          throw(error(checkpoint_request_reused,_)))
      ;aggregate_all(count,mutation_receipt(_,_,_,_),Count),
       (Count<1024->true;throw(error(checkpoint_request_capacity,_))),
       setup_call_cleanup(
         assertz(mutation_receipt(Body.requestId,Action,Body,pending)),
         (kb_saved_state:saved_states(Catalog),
          (Catalog.revision==Body.checkpointRevision->true;
            throw(error(saved_state_revision_conflict,_))),
          (call(Goal)->true;throw(error(checkpoint_request_failed,_))),
          sig_atomic((retract(mutation_receipt(Body.requestId,Action,Body,pending)),
            assertz(mutation_receipt(Body.requestId,Action,Body,completed(Reply)))))),
         interrupt_receipt(Body.requestId,Action,Body)))).
request_uuid(UUID) :-
    atomic_list_concat(Parts,'-',UUID),maplist(atom_length,Parts,[8,4,4,4,12]),
    forall((member(Part,Parts),atom_codes(Part,Codes),member(C,Codes)),
      (between(0'0,0'9,C);between(0'a,0'f,C))).
receipt_reply(completed(Reply),Reply) :- !.
receipt_reply(_,_) :- throw(error(checkpoint_request_already_received,_)).
interrupt_receipt(Id,Action,Body) :-
    sig_atomic((retract(mutation_receipt(Id,Action,Body,pending))->
      assertz(mutation_receipt(Id,Action,Body,interrupted));true)).

checkpoint_catalog(Reply) :-
    kb_checkpoint_policy:checkpoint_policy(Policy),
    kb_saved_state:saved_states(Catalog),kb_store:generation(Generation),
    (kb_checkpoint:checkpoint_instance(Instance)->true;Instance=null),
    kb_checkpoint:checkpoint_runs(Runs),
    with_mutex(powder_checkpoint_operations,findall(Data,operation(_,Data,_),Operations)),
    request_epoch(Epoch),
    Reply=Catalog.put(_{generation:Generation,instance:Instance,runs:Runs,operations:Operations,
      mutationEpoch:Epoch,
      automation:Policy}).

submit_checkpoint_operation(Action,Body,Reply) :-
    kb_checkpoint_policy:require_checkpoint_execution(Action),
    validate_operation(Action,Body),
    kb_activity:with_application(kb_checkpoint_http:register_operation(Action,Body,Reply,Thread)),
    thread_send_message(Thread,go).
register_operation(Action,Body,Reply,Thread) :-
    with_mutex(powder_checkpoint_operations,
      ((operation(_,Active,_),memberchk(Active.phase,[running,cancelling]))->
        throw(error(checkpoint_operation_busy,_))
      ;uuid(Id),get_time(Now),
       Reply=operation{id:Id,action:Action,phase:running,startedAt:Now,
         message:"Working; the active KB and existing images remain intact.",result:null},
       thread_create(operation_worker(Id,Action,Body),Thread,[detached(true),inherit_from(main)]),
       assertz(operation(Id,Reply,Thread)))).
validate_operation(create,Body) :- !,
    text(Body.name),text(Body.revision),integer_field(Body,generation).
validate_operation(try,Body) :- !,text(Body.id),integer_field(Body,generation).
validate_operation(Action,_) :- domain_error(checkpoint_operation,Action).

operation_worker(Id,Action,Body) :-
    catch((thread_get_message(go),
          (perform(Action,Body,Result)->Outcome=completed(Result);
            throw(error(checkpoint_operation_failed,_))),
          complete_operation(Id,Outcome)),
      Error,(operation_outcome(Error,Failed),complete_operation(Id,Failed))).
complete_operation(Id,Outcome) :-
    sig_atomic(with_mutex(powder_checkpoint_operations,
      (operation(Id,Before,_),memberchk(Before.phase,[running,cancelling])->
       retract(operation(Id,Before,_)),get_time(Finished),
       outcome_data(Outcome,Phase,Message,ResultData),
       assertz(operation(Id,Before.put(_{phase:Phase,finishedAt:Finished,
         message:Message,result:ResultData}),none)),prune_operations
      ;true))).
perform(create,Body,Result) :-
    kb_saved_state:create_saved_state(Body.name,Body.generation,Body.revision,Result).
perform(try,Body,Result) :-
    kb_checkpoint:try_checkpoint(Body.id,Body.generation,Result),
    (Result.phase==failed->throw(error(checkpoint_trial_failed(Result.message),_));true).
operation_outcome(checkpoint_operation_cancelled,cancelled) :- !.
operation_outcome(unwind(Reason),_) :- !,throw(unwind(Reason)).
operation_outcome(Error,failed(Code,Message)) :-
    error_description(Error,Status,Code,Message),
    (Status>=500->print_message(error,Error);true).
outcome_data(completed(Result),completed,"Operation completed.",Result).
outcome_data(cancelled,cancelled,
  "Cancelled. An image already published before cancellation remains available in the catalog.",null).
outcome_data(failed(Code,Message),failed,Message,_{error:_{code:Code,message:Message}}).
prune_operations :-
    findall(Id,(operation(Id,D,_),\+memberchk(D.phase,[running,cancelling])),Completed),
    length(Completed,N),
    (N>40->Completed=[Old|_],retractall(operation(Old,_,_));true).
checkpoint_operation(Id,Reply) :-
    text(Id),with_mutex(powder_checkpoint_operations,
      (operation(Id,Reply,_)->true;existence_error(checkpoint_operation,Id))).
cancel_checkpoint_operation(Id,Reply) :-
    text(Id),
    with_mutex(powder_checkpoint_operations,
      (operation(Id,Before,Thread)->
        (Before.phase==running->
          retract(operation(Id,Before,Thread)),Reply=Before.put(phase,cancelling),
          assertz(operation(Id,Reply,Thread)),
          thread_signal(Thread,throw(checkpoint_operation_cancelled))
        ;Reply=Before)
      ;existence_error(checkpoint_operation,Id))).
checkpoint_http_snapshot_safe :-
    (operation(_,_,_)->throw(error(saved_state_unexpected_checkpoint_operation,_));true).
checkpoint_operations_quiescent :-
    with_mutex(powder_checkpoint_operations,
      (operation(Id,Data,_),memberchk(Data.phase,[running,cancelling])->
        throw(error(checkpoint_busy(operation(Id)),_));true)).

respond(Status,Reply) :- format('Cache-Control: no-store~n'),reply_json_dict(Reply,[status(Status)]).
endpoint_error(Error) :-
    error_description(Error,Status,Code,Message),
    (Status>=500->print_message(error,Error);true),
    respond(Status,_{error:_{code:Code,message:Message}}).
error_description(error(permission_error(access,checkpoint_api,origin),_),403,forbidden,
                  "An owned localhost origin and explicit consent are required.") :- !.
error_description(error(checkpoint_execution_paused(_),_),409,checkpoint_paused,
                  "Automatic checkpointing is OFF. Checkpoint execution is paused pending manual-only, non-serving candidate support.") :- !.
error_description(error(permission_error(promote,checkpoint,explicit_consent_required),_),403,forbidden,
                  "Explicit original-port takeover consent is required.") :- !.
error_description(error(checkpoint_explicit_intent_required,_),403,explicit_intent_required,
                  "Use the explicit checkpoint action; automatic candidate startup is not permitted.") :- !.
error_description(Error,409,request_conflict,
                  "Request already received, expired or unavailable. Refresh status; do not replay a start request.") :-
    Error=error(Reason,_),
    memberchk(Reason,[checkpoint_request_expired,checkpoint_request_reused,
      checkpoint_request_capacity,checkpoint_request_already_received]), !.
error_description(error(permission_error(modify,checkpoint_trial,_),_),409,trial_read_only,
                  "Trials are read-only until promoted from the original instance.") :- !.
error_description(error(permission_error(cancel,checkpoint_transition,_),_),409,transition_busy,
                  "Cancellation is unavailable during takeover or recovery.") :- !.
error_description(error(existence_error(_,Id),_),404,not_found,Message) :- !,
    format(string(Message),'Checkpoint or operation not found: ~w',[Id]).
error_description(error(type_error(_,_),_),400,invalid_input,"Invalid checkpoint request.") :- !.
error_description(error(domain_error(_,_),_),400,invalid_input,"Invalid checkpoint request.") :- !.
error_description(error(instantiation_error,_),400,invalid_input,"Missing checkpoint request field.") :- !.
error_description(error(checkpoint_trial_failed(Message),_),422,trial_failed,Message) :- !.
error_description(Error,409,conflict,Message) :-
    Error=error(Reason,_),functor(Reason,Name,_),
    memberchk(Name,[saved_state_busy,saved_state_revision_conflict,saved_state_name_exists,
      generation_conflict,checkpoint_operation_busy,checkpoint_busy,application_reload_busy,
      checkpoint_transition_busy,checkpoint_revision_conflict,
      source_pack_snapshot_authority_changed,source_pack_snapshot_revision_changed,
      source_pack_snapshot_content_changed,source_packs_changed_during_read,
      checkpoint_loaded_state_or_configuration_changed]), !,
    message_to_string(Error,Message).
error_description(Error,422,incompatible_state,Message) :-
    Error=error(Reason,_),functor(Reason,Name,_),
    memberchk(Name,[saved_state_incompatible,saved_state_image_hash_mismatch,
      saved_state_image_size_mismatch,saved_state_loaded_code_is_stale]), !,
    message_to_string(Error,Message).
error_description(_,500,checkpoint_failed,
  "Checkpoint operation failed. Existing KB and images are retained; inspect the local console for diagnostics.").
