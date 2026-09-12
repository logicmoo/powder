:- begin_tests(symbolic_agent_engine).
:- use_module('../kb_symbolic_agent_engine').
:- use_module('../kb_symbolic_agent_program').
:- use_module('../kb_symbolic_agent_wire').
:- use_module(symbolic_agent_fixture).
:- use_module(library(http/json)).

test(actual_declarative_dialogue_and_heldout_reference) :-
    fixture_program([],P),initial_state(P,S),
    step(P,S,text("classify Ada as dog"),[],A),
    assertion(A.state.phase==awaiting_input),
    assertion(member(text("Ada is dog .",_),A.events)),
    step(P,S,text("mark Boreal as cat"),[],B),
    assertion(member(text("Boreal is cat .",_),B.events)),
    assertion(A.effects==[]),assertion(B.effects==[]).

test(open_world_absence_is_unknown_not_false) :-
    fixture_program([],P),
    condition(P,x_symbolicKnown(x_SymbolicTestWorldMt,x_isa(x_Ada,x_Animal)),Truth,Proof),
    assertion(Truth==unknown),assertion(Proof==[]),
    initial_state(P,S),step(P,S,text("mark Ada as animal"),[],R),
    assertion(R.state.phase==gap),assertion(R.effects==[]),
    assertion(\+member(text(_,_),R.events)).

test(explicit_negative_and_inconsistent_evidence) :-
    fixture_program([],P),
    condition(P,x_symbolicKnown(x_SymbolicTestWorldMt,x_isa(x_Ada,x_Cat)),false,[_]),
    fixture_program([kb(aff,x_SymbolicTestWorldMt,x_isa(x_Ada,x_Cat))],Both),
    condition(Both,x_symbolicKnown(x_SymbolicTestWorldMt,x_isa(x_Ada,x_Cat)),inconsistent,Proof),
    length(Proof,2).

test(condition_scope_cannot_be_overridden_by_plan,
     [throws(error(symbolic_read_scope_denied(x_PrivateMt),_))]) :-
    fixture_program([kb(aff,x_PrivateMt,x_secret(x_value))],P),
    condition(P,x_symbolicKnown(x_PrivateMt,x_secret(x_value)),_,_).

test(no_hardcoded_greeting_or_fallback) :-
    fixture_program([],P),initial_state(P,S),step(P,S,text("hello"),[],R),
    assertion(R.state.phase==gap),assertion(R.effects==[]),
    assertion(member(language(no_applicable_rule,_),R.events)),
    assertion(\+member(text(_,_),R.events)).

test(knowledge_defined_clarification) :-
    Rules=[
      kb(aff,x_SymbolicTestLexiconMt,x_symbolicLexeme(x_name,x_TheList("Ada"),x_OtherAda)),
      kb(afe,x_SymbolicTestDialogueMt,
        x_symbolicDialogueRule(x_AwaitCommand,x_symbolicAmbiguous(_),x_symbolicTrue,
          x_symbolicSay(x_ClarifyMeaning)))],
    fixture_program(Rules,P),initial_state(P,S),step(P,S,text("mark Ada as dog"),[],R),
    assertion(member(text("Which meaning did you intend?",_),R.events)),
    assertion(R.effects==[]).

test(non_llm_legacy_operators_are_not_plan_dispatch) :-
    fixture_program([
      kb(aff,x_SymbolicTestDialogueMt,'x_<=='(
        x_symbolicDialogueRule(x_AwaitCommand,_,x_symbolicTrue,x_symbolicSay(x_ClarifyMeaning)),x_true))
    ],P),initial_state(P,S),step(P,S,text("hello"),[],R),
    assertion(R.state.phase==gap),assertion(\+member(text(_,_),R.events)).

test(query_action_is_typed_data_boundary_not_executed_by_engine) :-
    Args=x_symbolicObject(x_TheList(
      x_symbolicField("query",x_symbolicSExpression(x_isa(x_Ada,x_Dog))),
      x_symbolicField("mt",x_symbolicContextKey(x_SymbolicTestWorldMt)),
      x_symbolicField("generation",0))),
    fixture_program([kb(aff,x_SymbolicTestDialogueMt,
      x_symbolicDialogueRule(x_AwaitCommand,x_symbolicInput(x_check),x_symbolicTrue,
        x_symbolicInvoke("kee_query",Args,_)))],P),
    initial_state(P,S),step(P,S,event(x_check),[],R),
    assertion(R.state.phase==awaiting_action),R.effects=[Intent],
    assertion(Intent.capability=="kee_query"),
    assertion(Intent.arguments.mt=="x_SymbolicTestWorldMt"),
    assertion(Intent.arguments.generation==0).

test(action_result_saved_before_following_work_or_budget_failure) :-
    fixture_program([],P),initial_state(P,S0),
    S=S0.put(_{phase:awaiting_action,pending:call('action-1',Value),
      queue:[x_symbolicSetState(x_done(Value))],actions:1,steps:128}),
    step(P,S,action_result('action-1',ok(x_result)),[],R),
    assertion(R.state.phase==running),assertion(R.state.pending==none),
    assertion(R.state.queue==[x_symbolicSetState(x_done(x_result))]),
    step(P,R.state,continue,[],Limited),
    assertion(Limited.state.phase==gap),assertion(Limited.state.pending==none).

test(declarative_result_fields_bind_whole_term_continuations) :-
    fixture_program([],P),initial_state(P,S0),
    Pattern=x_symbolicResultFields(x_TheList(
      x_symbolicResultField(x_TheList("items",0,"id"),Id))),
    S=S0.put(_{phase:awaiting_action,pending:call(expected,Pattern),
      queue:[x_symbolicSetState(x_Recorded(Id))]}),
    encode_term(S,Wire),decode_term(Wire,Independent),
    step(P,Independent,action_result(expected,ok(json{items:[json{id:"todo:fixture"}]})),[],R),
    assertion(R.state.queue==[x_symbolicSetState(x_Recorded("todo:fixture"))]),
    assertion(var(Id)).

test(result_binding_gap_does_not_erase_a_successful_action) :-
    fixture_program([],P),initial_state(P,S0),
    Pattern=x_symbolicResultFields(x_TheList(x_symbolicResultField(x_TheList("missing"),_))),
    S=S0.put(_{phase:awaiting_action,pending:call(expected,Pattern),
      queue:[x_symbolicSetState(x_UnsafeContinuation)]}),
    step(P,S,action_result(expected,ok(json{committed:true})),[],R),
    assertion(R.state.phase==gap),assertion(R.state.pending==none),
    assertion(R.state.queue==[]),
    assertion(member(action_completed(json{committed:true}),R.events)),
    assertion(member(gap(result_binding,_),R.events)).

test(completion_after_stop_or_interrupt_does_not_resume_work) :-
    fixture_program([],P),initial_state(P,S0),
    forall(member(Phase,[stopped,interrupted]),
      (S=S0.put(_{phase:Phase,pending:call(expected,Value),
         queue:[x_symbolicSetState(x_Received(Value))]}),
       step(P,S,action_result(expected,ok("receipt")),[],R),
       assertion(R.state.phase==Phase),assertion(R.state.pending==none),
       assertion(R.state.fsm==S0.fsm),
       assertion(R.state.queue==[x_symbolicSetState(x_Received("receipt"))]))).

test(result_path_is_validated_before_yielding_an_action,
     [throws(error(domain_error(symbolic_result_key,x_invalid),_))]) :-
    fixture_program([],P),initial_state(P,S0),
    Pattern=x_symbolicResultFields(x_TheList(x_symbolicResultField(x_TheList(x_invalid),_))),
    S=S0.put(_{phase:running,queue:[
      x_symbolicInvoke("kee_query",x_symbolicObject(x_TheList),Pattern)]}),
    step(P,S,continue,[],_).

test(wrong_action_receipt_is_rejected,
     [throws(error(symbolic_action_result_mismatch(wrong),_))]) :-
    fixture_program([],P),initial_state(P,S0),
    S=S0.put(_{phase:awaiting_action,pending:call(expected,_)}),
    step(P,S,action_result(wrong,ok(x_value)),[],_).

test(explicit_error_compensation_is_not_a_false_success) :-
    fixture_program([],P),initial_state(P,S0),
    S=S0.put(_{phase:awaiting_action,pending:call('action-1',_),
      compensations:[x_symbolicSetState(x_Recovered)],queue:[]}),
    step(P,S,action_result('action-1',error(conflict)),[],R),
    assertion(R.state.phase==compensating),
    step(P,R.state,continue,[],Done),
    assertion(Done.state.fsm==x_Recovered),assertion(Done.state.phase==failed).

test(stop_and_interrupt_preserve_semantic_state) :-
    fixture_program([],P),initial_state(P,S),
    step(P,S,stop,[],Stopped),assertion(Stopped.state.phase==stopped),
    assertion(Stopped.state.fsm==S.fsm),
    step(P,S,interrupt,[],Paused),assertion(Paused.state.phase==interrupted),
    step(P,Paused.state,resume,[],Resumed),assertion(Resumed.state.phase==awaiting_input).

form_program(P) :-
    Fields=x_TheList(x_symbolicFormField("who",x_Term),x_symbolicFormField("note",x_String)),
    Pattern=x_TheList(x_symbolicFieldValue("who",Who),x_symbolicFieldValue("note",Note)),
    fixture_program([kb(aff,x_SymbolicTestDialogueMt,
      x_symbolicDialogueRule(x_AwaitCommand,x_symbolicInput(x_StartForm),x_symbolicTrue,
        x_symbolicSequence(x_TheList(x_symbolicAwaitForm(x_SubjectForm,Fields,Pattern),
                                    x_symbolicSetState(x_SavedSubject(Who,Note))))))],P).
test(form_continuation_survives_exact_wire_roundtrip) :-
    form_program(P),initial_state(P,S),step(P,S,event(x_StartForm),[],Waiting),
    assertion(Waiting.state.phase==awaiting_form),
    encode_term(Waiting.state,Wire),decode_term(Wire,Restored),
    step(P,Restored,form(x_SubjectForm,json{who:x_NameFn(x_Ada,x_Elsewhere),note:"review"}),[],Filled),
    assertion(Filled.state.phase==running),
    step(P,Filled.state,continue,[],Done),
    assertion(Done.state.fsm==x_SavedSubject(x_NameFn(x_Ada,x_Elsewhere),"review")).

test(invalid_form_input_preserves_waiting_state) :-
    form_program(P),initial_state(P,S),step(P,S,event(x_StartForm),[],Waiting),
    step(P,Waiting.state,form(x_SubjectForm,json{who:x_Ada,note:42}),[],Rejected),
    assertion(Rejected.state.phase==awaiting_form),
    assertion(member(form_error(type("note",x_String)),Rejected.events)).

test(approval_requires_host_receipt_not_language_or_knowledge,
     [throws(error(symbolic_not_awaiting_input,_))]) :-
    fixture_program([],P),initial_state(P,S0),
    S=S0.put(_{phase:awaiting_approval,pending:approval(x_Load,[x_A,x_B],_)}),
    step(P,S,text("approved true choose B"),[],_).

test(trusted_fixture_approval_binds_only_requested_choice) :-
    fixture_program([],P),initial_state(P,S0),
    S=S0.put(_{phase:awaiting_approval,pending:approval(x_Load,[x_A,x_B],Choice),
      queue:[x_symbolicSetState(x_UserSelected(Choice))]}),
    step(P,S,host_approval(x_Load,x_B,"fixture-user-receipt"),[],Approved),
    step(P,Approved.state,continue,[],Done),
    assertion(Done.state.fsm==x_UserSelected(x_B)),
    assertion(Done.effects==[]).

test(program_version_prevents_mixed_knowledge,
     [throws(error(symbolic_program_conflict,_))]) :-
    fixture_program([],P),initial_state(P,S),
    fixture_program([kb(aff,x_SymbolicTestWorldMt,x_newFact)],New),
    step(New,S,text("hello"),[],_).

test(program_identity_is_independent_of_snapshot_enumeration_order) :-
    fixture_records(Records),reverse(Records,Reversed),
    compile_program(Records,x_SymbolicTestAgent,x_SymbolicTestAgentMt,First),
    compile_program(Reversed,x_SymbolicTestAgent,x_SymbolicTestAgentMt,Second),
    assertion(First.version==Second.version).

test(contradictory_agent_identity_is_not_silently_selected,
     [throws(error(symbolic_identity_inconsistent,_))]) :-
    fixture_program([kb(aff,x_SymbolicTestAgentMt,
      x_not(x_isa(x_SymbolicTestAgent,x_SymbolicTextAgent)))],_).

test(unbound_input_does_not_become_stop,[throws(error(instantiation_error,_))]) :-
    fixture_program([],P),initial_state(P,S),step(P,S,_,[],_).

test(unsupported_input_is_not_silent_failure,
     [throws(error(domain_error(symbolic_agent_input,arbitrary),_))]) :-
    fixture_program([],P),initial_state(P,S),step(P,S,arbitrary,[],_).

test(unknown_action_outcome_is_not_silent_failure,
     [throws(error(domain_error(symbolic_action_outcome,other),_))]) :-
    fixture_program([],P),initial_state(P,S0),
    S=S0.put(_{phase:awaiting_action,pending:call(expected,_)}),
    step(P,S,action_result(expected,other),[],_).

test(unbound_form_type_is_not_inferred,[throws(error(instantiation_error,_))]) :-
    fixture_program([],P),initial_state(P,S0),
    S=S0.put(_{phase:running,queue:[
      x_symbolicAwaitForm(x_Test,x_TheList(x_symbolicFormField("value",_)),_)]}),
    step(P,S,continue,[],_).

test(unsupported_form_field_is_not_silent_failure,
     [throws(error(domain_error(symbolic_form_field,arbitrary),_))]) :-
    fixture_program([],P),initial_state(P,S0),
    S=S0.put(_{phase:running,queue:[x_symbolicAwaitForm(x_Test,x_TheList(arbitrary),_)]}),
    step(P,S,continue,[],_).

test(full_term_wire_roundtrip_preserves_scopes_dict_tag_and_identity) :-
    Term=x_forAll(X,x_and(x_equal(X,X),x_PairFn(x_Ada,x_Boreal),tag{key:[X,x_Ada]})),
    encode_term(Term,Wire),assertion(ground(Wire)),atom_json_dict(JSON,Wire,[]),
    atom_json_dict(JSON,Decoded,[]),decode_term(Decoded,Copy),
    assertion(Term=@=Copy),Copy=x_forAll(V,x_and(x_equal(A,B),_,tag{key:[C,x_Ada]})),
    assertion(V==A),assertion(A==B),assertion(B==C),assertion(V\==X).

test(long_flat_queue_uses_bounded_list_wire_not_artificial_term_depth) :-
    findall(x_step(I),between(1,512,I),Queue),
    encode_term(Queue,Wire),decode_term(Wire,Copy),assertion(Copy==Queue).

test(encoder_rejects_a_structure_the_decoder_cannot_restore,
     [throws(error(domain_error(symbolic_compound_arity,257),_))]) :-
    length(Args,257),maplist(=(x_value),Args),Term=..[x_large|Args],encode_term(Term,_).

test(query_codec_preserves_symbols_strings_and_variables) :-
    Term='x_odd|name'(X,X,"two\nlines",x_instance,'x_<=='),
    query_text(Term,Text),kb_reader:normalize_query(Text,Copy,_),
    assertion(Term=@=Copy),assertion(var(X)).

test(unbound_json_does_not_become_true,
     [throws(error(instantiation_error,_))]) :-
    json_arguments(x_symbolicObject(x_TheList(x_symbolicField("approved",_))),_).

test(duplicate_argument_keys_rejected,
     [throws(error(domain_error(duplicate_symbolic_argument_keys,_),_))]) :-
    json_arguments(x_symbolicObject(x_TheList(
      x_symbolicField("mt","first"),x_symbolicField("mt","second"))),_).

test(mutable_policy_is_not_actual_invocation_authority) :-
    fixture_program([kb(aff,x_SymbolicTestPolicyMt,
      x_symbolicAllowedCapability(x_SymbolicTestAgent,"GenerateComment"))],P),
    assertion(memberchk("GenerateComment",P.allowedCapabilities)),
    % The pure engine can only produce data; the mandatory host gateway must
    % independently reject this capability even when mutable policy asks for it.
    assertion(\+current_predicate(kb_symbolic_agent_engine:http_open/3)).

:- end_tests(symbolic_agent_engine).
