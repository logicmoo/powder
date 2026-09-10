:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:113,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:480,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:e171ef8818f388de7a315bae0ef9634a4fa144842e1f7ccedc156e683bd28307,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:20864,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf',sourceHash:fb09edfe10c52c7e401ab01024b2d21632c97d6eaf6848062a5dc1dc8714c47a,warnings:[]}).
x_isa(x_verifyViaUser,x_ComplexActionPredicate) :- x_cid(a65b125dfb0b89).
xc_microtheory(a65b125dfb0b89,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b89,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b89,21).
xc_kb_names(a65b125dfb0b89,[]).
xc_mapping_rows(a65b125dfb0b89,[]).
x_arity(x_verifyViaUser,2) :- x_cid(a65b125dfb0b8a).
xc_microtheory(a65b125dfb0b8a,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b8a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b8a,22).
xc_kb_names(a65b125dfb0b8a,[]).
xc_mapping_rows(a65b125dfb0b8a,[]).
x_arg1Isa(x_verifyViaUser,x_Microtheory) :- x_cid(a65b125dfb0b8b).
xc_microtheory(a65b125dfb0b8b,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b8b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b8b,23).
xc_kb_names(a65b125dfb0b8b,[]).
xc_mapping_rows(a65b125dfb0b8b,[]).
x_arg2Isa(x_verifyViaUser,x_CycLExpression) :- x_cid(a65b125dfb0b8c).
xc_microtheory(a65b125dfb0b8c,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b8c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b8c,24).
xc_kb_names(a65b125dfb0b8c,[]).
xc_mapping_rows(a65b125dfb0b8c,[]).
x_comment(x_verifyViaUser,"(verifyViaUser ?context ?hypothesis) is a complex action task to ask the user to confirm a hypothesis.") :- x_cid(a65b125dfb0b8d).
xc_microtheory(a65b125dfb0b8d,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b8d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b8d,25).
xc_kb_names(a65b125dfb0b8d,[]).
xc_mapping_rows(a65b125dfb0b8d,[]).
x_preconditionForMethod(x_and(x_numAnswers(1,x_localAgent(V1)),x_numAnswers(1,x_currentSessionReasoner(V2)),x_equals(V2,V1),x_numAnswers(1,x_currentInteractionMgr(V3))),x_methodForAction(x_verifyViaUser(V4,V5),x_actionSequence(x_TheList(x_doRemoteAgentPlan(V3,x_actionSequence(x_TheList(x_requestConfirmation(V4,V5)))))))) :- x_cid(a65b125dfb0b8e,V1,V2,V3,V4,V5).
xc_microtheory(a65b125dfb0b8e,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b8e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b8e,27).
xc_kb_names(a65b125dfb0b8e,["?local-agent","?session-reasoner","?im","?context","?hypothesis"]).
xc_mapping_rows(a65b125dfb0b8e,[]).
x_isa(x_assimilateUserStatement,x_ComplexActionPredicate) :- x_cid(a65b125dfb0b8f).
xc_microtheory(a65b125dfb0b8f,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b8f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b8f,48).
xc_kb_names(a65b125dfb0b8f,[]).
xc_mapping_rows(a65b125dfb0b8f,[]).
x_arity(x_assimilateUserStatement,4) :- x_cid(a65b125dfb0b90).
xc_microtheory(a65b125dfb0b90,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b90,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b90,49).
xc_kb_names(a65b125dfb0b90,[]).
xc_mapping_rows(a65b125dfb0b90,[]).
x_arg1Isa(x_assimilateUserStatement,x_Microtheory) :- x_cid(a65b125dfb0b91).
xc_microtheory(a65b125dfb0b91,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b91,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b91,50).
xc_kb_names(a65b125dfb0b91,[]).
xc_mapping_rows(a65b125dfb0b91,[]).
x_arg2Isa(x_assimilateUserStatement,x_PerceptualAgentEvent) :- x_cid(a65b125dfb0b92).
xc_microtheory(a65b125dfb0b92,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b92,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b92,51).
xc_kb_names(a65b125dfb0b92,[]).
xc_mapping_rows(a65b125dfb0b92,[]).
x_arg3Isa(x_assimilateUserStatement,x_CycLExpression) :- x_cid(a65b125dfb0b93).
xc_microtheory(a65b125dfb0b93,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b93,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b93,52).
xc_kb_names(a65b125dfb0b93,[]).
xc_mapping_rows(a65b125dfb0b93,[]).
x_arg4Isa(x_assimilateUserStatement,x_TimeInterval) :- x_cid(a65b125dfb0b94).
xc_microtheory(a65b125dfb0b94,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b94,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b94,53).
xc_kb_names(a65b125dfb0b94,[]).
xc_mapping_rows(a65b125dfb0b94,[]).
x_comment(x_assimilateUserStatement,"(assimilateUserStatement ?mt ?evt ?info ?when) assimilates a user statement.") :- x_cid(a65b125dfb0b95).
xc_microtheory(a65b125dfb0b95,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b95,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b95,54).
xc_kb_names(a65b125dfb0b95,[]).
xc_mapping_rows(a65b125dfb0b95,[]).
x_preconditionForMethod(x_and(x_operatorFormulas(x_decisionTask,V1),x_priorCommand(V2,V3,V4),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V2,x_infoTransferred(V4,V5)))))),x_methodForAction(x_assimilateUserStatement(V2,V3,x_confirmed(V1),V6),x_actionSequence(x_TheList(x_recordNewDecisionTask(V2,V4,V5,V1,V6))))) :- x_cid(a65b125dfb0b96,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125dfb0b96,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b96,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b96,57).
xc_kb_names(a65b125dfb0b96,["?prop","?mt","?evt","?cmd","?operator","?year"]).
xc_mapping_rows(a65b125dfb0b96,[]).
x_preconditionForMethod(x_and(x_operatorFormulas(x_decisionTask,V1),x_priorCommand(V2,V3,V4),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V2,x_infoTransferred(V4,V5)))))),x_methodForAction(x_assimilateUserStatement(V2,V3,x_disconfirmed(V1),V6),x_actionSequence(x_TheList(x_rejectDecisionTask(V2,V4,V5,V1,V6))))) :- x_cid(a65b125dfb0b97,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125dfb0b97,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b97,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b97,72).
xc_kb_names(a65b125dfb0b97,["?prop","?mt","?evt","?cmd","?operator","?year"]).
xc_mapping_rows(a65b125dfb0b97,[]).
x_preconditionForMethod(x_and(x_numAnswers(1,x_priorDomainEvent(V1,V2,V3)),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(V2,V4))))),x_evaluate(V5,x_TheClosedRetrievalSetOf(V6,'x_ist-Information'(V1,x_immediatelyPrecedingDomainEvents(V1,V3,V6,V4)))),x_mostSpecificSalientEvent(V1,V5,V7),x_numAnswers(1,x_localOnly('x_ist-Information'(V1,x_currentPlayer(V8))))),x_methodForAction(x_assimilateUserStatement(V1,V2,x_hasEvaluativeQuantity(V9,x_MediumToVeryHighAmountFn('x_Badness-Generic')),V10),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V1,x_negativeOutcomeForActor(V7,V8))),x_generalizeNegativeEvent(V1,V7,V8))))) :- x_cid(a65b125dfb0b98,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125dfb0b98,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b98,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b98,91).
xc_kb_names(a65b125dfb0b98,["?mt","?evt","?latest-evt","?when","?possible-referents","?prior-evt","?bad-evt","?player","?something","?year"]).
xc_mapping_rows(a65b125dfb0b98,[]).
x_isa(x_immediatelyPrecedingDomainEvents,x_QuaternaryPredicate) :- x_cid(a65b125dfb0b99).
xc_microtheory(a65b125dfb0b99,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b99,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b99,119).
xc_kb_names(a65b125dfb0b99,[]).
xc_mapping_rows(a65b125dfb0b99,[]).
x_arity(x_immediatelyPrecedingDomainEvents,4) :- x_cid(a65b125dfb0b9a).
xc_microtheory(a65b125dfb0b9a,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b9a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b9a,120).
xc_kb_names(a65b125dfb0b9a,[]).
xc_mapping_rows(a65b125dfb0b9a,[]).
x_arg1Isa(x_immediatelyPrecedingDomainEvents,x_Microtheory) :- x_cid(a65b125dfb0b9b).
xc_microtheory(a65b125dfb0b9b,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b9b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b9b,121).
xc_kb_names(a65b125dfb0b9b,[]).
xc_mapping_rows(a65b125dfb0b9b,[]).
x_arg2Isa(x_immediatelyPrecedingDomainEvents,x_PerceptualAgentEvent) :- x_cid(a65b125dfb0b9c).
xc_microtheory(a65b125dfb0b9c,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b9c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b9c,122).
xc_kb_names(a65b125dfb0b9c,[]).
xc_mapping_rows(a65b125dfb0b9c,[]).
x_arg3Isa(x_immediatelyPrecedingDomainEvents,x_PerceptualAgentEvent) :- x_cid(a65b125dfb0b9d).
xc_microtheory(a65b125dfb0b9d,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b9d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b9d,123).
xc_kb_names(a65b125dfb0b9d,[]).
xc_mapping_rows(a65b125dfb0b9d,[]).
x_arg4Isa(x_immediatelyPrecedingDomainEvents,x_TimeInterval) :- x_cid(a65b125dfb0b9e).
xc_microtheory(a65b125dfb0b9e,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b9e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b9e,124).
xc_kb_names(a65b125dfb0b9e,[]).
xc_mapping_rows(a65b125dfb0b9e,[]).
x_comment(x_immediatelyPrecedingDomainEvents,"(immediatelyPrecedingDomainEvents ?mt ?later ?earlier ?when) binds ?earlier to the prior domain event (ie, not a command or linguistic utterance) within the same turn, not separated by commands.") :- x_cid(a65b125dfb0b9f).
xc_microtheory(a65b125dfb0b9f,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0b9f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0b9f,125).
xc_kb_names(a65b125dfb0b9f,[]).
xc_mapping_rows(a65b125dfb0b9f,[]).
'x_<=='(x_immediatelyPrecedingDomainEvents(V1,V2,V3,V4),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_followsInProgression(V2,V3,V1))))),x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(V3,V4)))),x_domainEvent(V1,V3)) :- x_cid(a65b125dfb0ba0,V1,V2,V3,V4).
xc_microtheory(a65b125dfb0ba0,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba0,129).
xc_kb_names(a65b125dfb0ba0,["?mt","?later","?prior-event","?when"]).
xc_mapping_rows(a65b125dfb0ba0,[]).
'x_<=='(x_immediatelyPrecedingDomainEvents(V1,V2,V2,V3)) :- x_cid(a65b125dfb0ba1,V1,V2,V3).
xc_microtheory(a65b125dfb0ba1,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba1,142).
xc_kb_names(a65b125dfb0ba1,["?mt","?event","?when"]).
xc_mapping_rows(a65b125dfb0ba1,[]).
x_isa(x_mostSpecificSalientEvent,x_TernaryPredicate) :- x_cid(a65b125dfb0ba2).
xc_microtheory(a65b125dfb0ba2,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba2,144).
xc_kb_names(a65b125dfb0ba2,[]).
xc_mapping_rows(a65b125dfb0ba2,[]).
x_arity(x_mostSpecificSalientEvent,3) :- x_cid(a65b125dfb0ba3).
xc_microtheory(a65b125dfb0ba3,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba3,145).
xc_kb_names(a65b125dfb0ba3,[]).
xc_mapping_rows(a65b125dfb0ba3,[]).
x_comment(x_mostSpecificSalientEvent,"(mostSpecificSalientEvent ?mt ?event-set ?event) binds ?event to the most most specific, salient event of the set, where salience might be determined by whether the event was accompanied by a text message.") :- x_cid(a65b125dfb0ba4).
xc_microtheory(a65b125dfb0ba4,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba4,146).
xc_kb_names(a65b125dfb0ba4,[]).
xc_mapping_rows(a65b125dfb0ba4,[]).
'x_<=='(x_mostSpecificSalientEvent(V1,V2,V3),x_groundExpression(V2),x_unifies(x_TheSet(V3),V2)) :- x_cid(a65b125dfb0ba5,V1,V2,V3).
xc_microtheory(a65b125dfb0ba5,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba5,149).
xc_kb_names(a65b125dfb0ba5,["?mt","?events","?event"]).
xc_mapping_rows(a65b125dfb0ba5,[]).
'x_<=='(x_mostSpecificSalientEvent(V1,V2,V3),x_groundExpression(V2),x_not(x_unifies(x_TheSet(V3),V2)),x_communicatedEvents(V1,V2,V4),x_evaluate(V5,x_SetToListFn(V4)),x_numAnswers(1,x_mostSpecificInstance(V1,V5,V3))) :- x_cid(a65b125dfb0ba6,V1,V2,V3,V4,V5).
xc_microtheory(a65b125dfb0ba6,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba6,153).
xc_kb_names(a65b125dfb0ba6,["?mt","?events","?event","?communicated-events","?evt-list"]).
xc_mapping_rows(a65b125dfb0ba6,[]).
x_isa(x_communicatedEvents,x_TernaryPredicate) :- x_cid(a65b125dfb0ba7).
xc_microtheory(a65b125dfb0ba7,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba7,160).
xc_kb_names(a65b125dfb0ba7,[]).
xc_mapping_rows(a65b125dfb0ba7,[]).
x_comment(x_communicatedEvents,"(communicatedEvents ?mt ?event-set ?event-subset) preference filters those events that are accompanied by text messages.") :- x_cid(a65b125dfb0ba8).
xc_microtheory(a65b125dfb0ba8,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba8,161).
xc_kb_names(a65b125dfb0ba8,[]).
xc_mapping_rows(a65b125dfb0ba8,[]).
'x_<=='(x_communicatedEvents(V1,V2,V3),x_unifies(V4,x_Kappa(t(V5),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_textMessageFor(V5,V6))))))),x_preferenceFilterBy(V2,V4,V3)) :- x_cid(a65b125dfb0ba9,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125dfb0ba9,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0ba9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0ba9,163).
xc_kb_names(a65b125dfb0ba9,["?mt","?events","?event-subset","?has-msg-pred","?evt","?what"]).
xc_mapping_rows(a65b125dfb0ba9,[]).
x_isa(x_moreSpecificEvent,x_QuaternaryPredicate) :- x_cid(a65b125dfb0baa).
xc_microtheory(a65b125dfb0baa,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0baa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0baa,167).
xc_kb_names(a65b125dfb0baa,[]).
xc_mapping_rows(a65b125dfb0baa,[]).
x_comment(x_moreSpecificEvent,"(moreSpecificEvent ?mt ?evt1 ?evt2 ?spec-evt) binds ?spec-evt to the instance of the more specific type.") :- x_cid(a65b125dfb0bab).
xc_microtheory(a65b125dfb0bab,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bab,168).
xc_kb_names(a65b125dfb0bab,[]).
xc_mapping_rows(a65b125dfb0bab,[]).
'x_<=='(x_moreSpecificEvent(V1,V2,V3,V4),x_lookupOnly(x_localOnly(x_kbOnly('x_ist-Information'(V1,x_isa(V2,V5))))),x_lookupOnly(x_localOnly(x_kbOnly('x_ist-Information'(V1,x_isa(V3,V6))))),x_moreSpecificType(V1,V5,V6,V2,V3,V4)) :- x_cid(a65b125dfb0bac,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125dfb0bac,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bac,170).
xc_kb_names(a65b125dfb0bac,["?mt","?evt1","?evt2","?spec-evt","?type1","?type2"]).
xc_mapping_rows(a65b125dfb0bac,[]).
x_isa(x_moreSpecificType,x_Predicate) :- x_cid(a65b125dfb0bad).
xc_microtheory(a65b125dfb0bad,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bad,183).
xc_kb_names(a65b125dfb0bad,[]).
xc_mapping_rows(a65b125dfb0bad,[]).
x_arity(x_moreSpecificType,6) :- x_cid(a65b125dfb0bae).
xc_microtheory(a65b125dfb0bae,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bae,184).
xc_kb_names(a65b125dfb0bae,[]).
xc_mapping_rows(a65b125dfb0bae,[]).
x_comment(x_moreSpecificType,"(moreSpecificType ?mt ?type1 ?type2 ?inst1 ?inst2 ?instance) compares collections ?type1 and ?type2 and returns the correspondingly more specific of the two instances.") :- x_cid(a65b125dfb0baf).
xc_microtheory(a65b125dfb0baf,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0baf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0baf,185).
xc_kb_names(a65b125dfb0baf,[]).
xc_mapping_rows(a65b125dfb0baf,[]).
'x_<=='(x_moreSpecificType(V1,V2,V3,V4,V5,V4),x_different(V2,V3),x_groundExpression(V2),x_groundExpression(V3),x_lookupOnly('x_ist-Information'(V1,x_genls(V2,V3)))) :- x_cid(a65b125dfb0bb0,V1,V2,V3,V4,V5).
xc_microtheory(a65b125dfb0bb0,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb0,187).
xc_kb_names(a65b125dfb0bb0,["?mt","?type1","?type2","?inst1","?inst2"]).
xc_mapping_rows(a65b125dfb0bb0,[]).
'x_<=='(x_moreSpecificType(V1,V2,V3,V4,V5,V5),x_different(V2,V3),x_groundExpression(V2),x_groundExpression(V3),x_lookupOnly('x_ist-Information'(V1,x_genls(V3,V2)))) :- x_cid(a65b125dfb0bb1,V1,V2,V3,V4,V5).
xc_microtheory(a65b125dfb0bb1,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb1,195).
xc_kb_names(a65b125dfb0bb1,["?mt","?type1","?type2","?inst1","?inst2"]).
xc_mapping_rows(a65b125dfb0bb1,[]).
x_isa(x_mostSpecificInstance,x_TernaryPredicate) :- x_cid(a65b125dfb0bb2).
xc_microtheory(a65b125dfb0bb2,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb2,203).
xc_kb_names(a65b125dfb0bb2,[]).
xc_mapping_rows(a65b125dfb0bb2,[]).
'x_<=='(x_mostSpecificInstance(V1,x_TheList(V2),V2)) :- x_cid(a65b125dfb0bb3,V1,V2).
xc_microtheory(a65b125dfb0bb3,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb3,205).
xc_kb_names(a65b125dfb0bb3,["?mt","?inst"]).
xc_mapping_rows(a65b125dfb0bb3,[]).
'x_<=='(x_mostSpecificInstance(V1,V2,V3),x_different(V2,x_TheList),x_evaluate(V4,x_FirstInListFn(V2)),x_evaluate(V5,x_SecondInListFn(V2)),x_numAnswers(1,x_moreSpecificEvent(V1,V4,V5,V6)),x_evaluate(V7,x_JoinListsFn(x_TheList(V6),x_RestOfListFn(x_RestOfListFn(V2)))),x_numAnswers(1,x_mostSpecificInstance(V1,V7,V3))) :- x_cid(a65b125dfb0bb4,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125dfb0bb4,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb4,208).
xc_kb_names(a65b125dfb0bb4,["?mt","?inst-list","?inst","?first","?second","?item","?remainder"]).
xc_mapping_rows(a65b125dfb0bb4,[]).
x_isa(x_generalizeNegativeEvent,x_ComplexActionPredicate) :- x_cid(a65b125dfb0bb5).
xc_microtheory(a65b125dfb0bb5,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb5,229).
xc_kb_names(a65b125dfb0bb5,[]).
xc_mapping_rows(a65b125dfb0bb5,[]).
x_arity(x_generalizeNegativeEvent,3) :- x_cid(a65b125dfb0bb6).
xc_microtheory(a65b125dfb0bb6,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb6,230).
xc_kb_names(a65b125dfb0bb6,[]).
xc_mapping_rows(a65b125dfb0bb6,[]).
x_arg1Isa(x_generalizeNegativeEvent,x_Microtheory) :- x_cid(a65b125dfb0bb7).
xc_microtheory(a65b125dfb0bb7,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb7,231).
xc_kb_names(a65b125dfb0bb7,[]).
xc_mapping_rows(a65b125dfb0bb7,[]).
x_arg2Isa(x_generalizeNegativeEvent,x_PerceptualAgentEvent) :- x_cid(a65b125dfb0bb8).
xc_microtheory(a65b125dfb0bb8,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb8,232).
xc_kb_names(a65b125dfb0bb8,[]).
xc_mapping_rows(a65b125dfb0bb8,[]).
x_arg3Isa(x_generalizeNegativeEvent,'x_Agent-Generic') :- x_cid(a65b125dfb0bb9).
xc_microtheory(a65b125dfb0bb9,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bb9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bb9,233).
xc_kb_names(a65b125dfb0bb9,[]).
xc_mapping_rows(a65b125dfb0bb9,[]).
x_comment(x_generalizeNegativeEvent,"(generalizeNegativeEvent ?mt ?bad-evt ?actor) generalizes event and spawns learning goals to find out how to prevent it.") :- x_cid(a65b125dfb0bba).
xc_microtheory(a65b125dfb0bba,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bba,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bba,234).
xc_kb_names(a65b125dfb0bba,[]).
xc_mapping_rows(a65b125dfb0bba,[]).
x_preconditionForMethod(x_and(x_generalizedEventSpec(V1,V2,V3,V4),x_unifies(V5,x_negativeOutcomeForActor(V4,x_IndexicalFn(x_currentRole))),x_unifies(V6,x_PreventFn(V5)),x_numAnswers(1,x_currentDomain(V7)),x_unifies(V8,x_StrategyModelMtFn(V7))),x_methodForAction(x_generalizeNegativeEvent(V1,V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V8,x_negativeOutcomeForActor(V4,x_IndexicalFn(x_currentRole)))),x_reifyPreventionGoal(V8,V6,x_GoalFn(0)),x_doAgentPlan(x_invokePlanRepair(V1,V8,V2,V3,V6)))))) :- x_cid(a65b125dfb0bbb,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125dfb0bbb,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bbb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bbb,236).
xc_kb_names(a65b125dfb0bbb,["?mt","?evt","?actor","?generalized-event","?prop","?prevent-goal","?domain","?lkmt"]).
xc_mapping_rows(a65b125dfb0bbb,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_generalizeNegativeEvent(V1,V2,V3),x_actionSequence(x_TheList))) :- x_cid(a65b125dfb0bbc,V1,V2,V3).
xc_microtheory(a65b125dfb0bbc,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bbc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bbc,257).
xc_kb_names(a65b125dfb0bbc,["?mt","?evt","?actor"]).
xc_mapping_rows(a65b125dfb0bbc,[]).
'x_<=='(x_preferInContext(x_generalizeNegativeEvent(V1,V2,V3),V4,V5),x_different(V4,x_actionSequence(x_TheList))) :- x_cid(a65b125dfb0bbd,V1,V2,V3,V4,V5).
xc_microtheory(a65b125dfb0bbd,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bbd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bbd,264).
xc_kb_names(a65b125dfb0bbd,["?mt","?evt","?actor","?seq1","?seq2"]).
xc_mapping_rows(a65b125dfb0bbd,[]).
x_isa(x_generalizedEventSpec,x_Predicate) :- x_cid(a65b125dfb0bbe).
xc_microtheory(a65b125dfb0bbe,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bbe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bbe,268).
xc_kb_names(a65b125dfb0bbe,[]).
xc_mapping_rows(a65b125dfb0bbe,[]).
x_arity(x_generalizedEventSpec,4) :- x_cid(a65b125dfb0bbf).
xc_microtheory(a65b125dfb0bbf,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bbf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bbf,269).
xc_kb_names(a65b125dfb0bbf,[]).
xc_mapping_rows(a65b125dfb0bbf,[]).
x_arg1Isa(x_generalizedEventSpec,x_Microtheory) :- x_cid(a65b125dfb0bc0).
xc_microtheory(a65b125dfb0bc0,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc0,270).
xc_kb_names(a65b125dfb0bc0,[]).
xc_mapping_rows(a65b125dfb0bc0,[]).
x_arg2Isa(x_generalizedEventSpec,x_PerceptualAgentEvent) :- x_cid(a65b125dfb0bc1).
xc_microtheory(a65b125dfb0bc1,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc1,271).
xc_kb_names(a65b125dfb0bc1,[]).
xc_mapping_rows(a65b125dfb0bc1,[]).
x_arg3Isa(x_generalizedEventSpec,'x_Agent-Generic') :- x_cid(a65b125dfb0bc2).
xc_microtheory(a65b125dfb0bc2,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc2,272).
xc_kb_names(a65b125dfb0bc2,[]).
xc_mapping_rows(a65b125dfb0bc2,[]).
x_arg4Isa(x_generalizedEventSpec,x_PerceptualAgentEvent) :- x_cid(a65b125dfb0bc3).
xc_microtheory(a65b125dfb0bc3,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc3,273).
xc_kb_names(a65b125dfb0bc3,[]).
xc_mapping_rows(a65b125dfb0bc3,[]).
x_comment(x_generalizedEventSpec,"(generalizedEventSpec ?mt ?event ?actor ?generalized-event) lifts and generalizes an event instance to the type level.") :- x_cid(a65b125dfb0bc4).
xc_microtheory(a65b125dfb0bc4,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc4,274).
xc_kb_names(a65b125dfb0bc4,[]).
xc_mapping_rows(a65b125dfb0bc4,[]).
'x_<=='(x_generalizedEventSpec(V1,V2,V3,V4),x_groundExpression(V2),x_lookupOnly(x_localOnly(x_nonTransitiveInference('x_ist-Information'(V1,x_isa(V2,V5))))),x_different(V5,x_PerceptualAgentEvent),x_evaluate(V6,x_TheClosedRetrievalSetOf(V7,x_roleRelationInst(V1,V2,V8,V7))),x_interArgRelations(V1,V3,V6,V9),x_different(V9,x_TheSet),x_entityLiftingBlist(V3,V6,V10),x_unifies(V11,x_TheSet(t(V3,x_IndexicalFn(x_currentPlayer)),t(V2,V12))),x_evaluate(V13,x_SetOrCollectionUnion(V11,V10)),x_evaluate(V14,x_SublisFn(V13,x_MakeFormulaFn(x_and,x_JoinListsFn(x_TheList(x_lookupOnly(x_isa(V12,V5))),x_SetToListFn(V6),x_SetToListFn(V9))))),x_unifies(V4,x_GenericInstanceFn(x_CollectionSubsetFn(V5,x_TheSetOf(V12,V14))))) :- x_cid(a65b125dfb0bc5,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b125dfb0bc5,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc5,282).
xc_kb_names(a65b125dfb0bc5,["?mt","?evt","?actor","?generalized-event","?event-type","?roles","?rel","?type","?relns","?lifting-blist","?given-blist","?evt-var","?blist","?set-spec"]).
xc_mapping_rows(a65b125dfb0bc5,[]).
x_isa(x_roleRelationInst,x_QuaternaryPredicate) :- x_cid(a65b125dfb0bc6).
xc_microtheory(a65b125dfb0bc6,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc6,314).
xc_kb_names(a65b125dfb0bc6,[]).
xc_mapping_rows(a65b125dfb0bc6,[]).
x_arity(x_roleRelationInst,4) :- x_cid(a65b125dfb0bc7).
xc_microtheory(a65b125dfb0bc7,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc7,315).
xc_kb_names(a65b125dfb0bc7,[]).
xc_mapping_rows(a65b125dfb0bc7,[]).
x_arg1Isa(x_roleRelationInst,x_Microtheory) :- x_cid(a65b125dfb0bc8).
xc_microtheory(a65b125dfb0bc8,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc8,316).
xc_kb_names(a65b125dfb0bc8,[]).
xc_mapping_rows(a65b125dfb0bc8,[]).
x_arg2Isa(x_roleRelationInst,x_PerceptualAgentEvent) :- x_cid(a65b125dfb0bc9).
xc_microtheory(a65b125dfb0bc9,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bc9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bc9,317).
xc_kb_names(a65b125dfb0bc9,[]).
xc_mapping_rows(a65b125dfb0bc9,[]).
x_arg3Isa(x_roleRelationInst,x_Collection) :- x_cid(a65b125dfb0bca).
xc_microtheory(a65b125dfb0bca,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bca,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bca,318).
xc_kb_names(a65b125dfb0bca,[]).
xc_mapping_rows(a65b125dfb0bca,[]).
x_arg4Isa(x_roleRelationInst,x_BinaryRelation) :- x_cid(a65b125dfb0bcb).
xc_microtheory(a65b125dfb0bcb,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bcb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bcb,319).
xc_kb_names(a65b125dfb0bcb,[]).
xc_mapping_rows(a65b125dfb0bcb,[]).
x_comment(x_roleRelationInst,"(roleRelationInst ?mt ?evt ?evt-type ?rel) binds the binary relation ?rel to bound role relations on ?evt.") :- x_cid(a65b125dfb0bcc).
xc_microtheory(a65b125dfb0bcc,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bcc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bcc,320).
xc_kb_names(a65b125dfb0bcc,[]).
xc_mapping_rows(a65b125dfb0bcc,[]).
'x_<=='(x_roleRelationInst(V1,V2,V3,V4),x_rolesForEventType(V3,V5),x_lookupOnly(x_localOnly('x_ist-Information'(V1,t(V5,V2,V6)))),x_unifies(V4,t(V5,V2,V6))) :- x_cid(a65b125dfb0bcd,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125dfb0bcd,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bcd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bcd,322).
xc_kb_names(a65b125dfb0bcd,["?mt","?evt","?evt-type","?rel","?role","?thing"]).
xc_mapping_rows(a65b125dfb0bcd,[]).
x_isa(x_interArgRelations,x_QuaternaryPredicate) :- x_cid(a65b125dfb0bce).
xc_microtheory(a65b125dfb0bce,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bce,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bce,331).
xc_kb_names(a65b125dfb0bce,[]).
xc_mapping_rows(a65b125dfb0bce,[]).
x_arity(x_interArgRelations,4) :- x_cid(a65b125dfb0bcf).
xc_microtheory(a65b125dfb0bcf,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bcf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bcf,332).
xc_kb_names(a65b125dfb0bcf,[]).
xc_mapping_rows(a65b125dfb0bcf,[]).
x_arg1Isa(x_interArgRelations,x_Microtheory) :- x_cid(a65b125dfb0bd0).
xc_microtheory(a65b125dfb0bd0,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd0,333).
xc_kb_names(a65b125dfb0bd0,[]).
xc_mapping_rows(a65b125dfb0bd0,[]).
x_arg2Isa(x_interArgRelations,'x_Agent-Generic') :- x_cid(a65b125dfb0bd1).
xc_microtheory(a65b125dfb0bd1,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd1,334).
xc_kb_names(a65b125dfb0bd1,[]).
xc_mapping_rows(a65b125dfb0bd1,[]).
x_arg3Isa(x_interArgRelations,'x_Set-Mathematical') :- x_cid(a65b125dfb0bd2).
xc_microtheory(a65b125dfb0bd2,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd2,335).
xc_kb_names(a65b125dfb0bd2,[]).
xc_mapping_rows(a65b125dfb0bd2,[]).
x_arg4Isa(x_interArgRelations,'x_Set-Mathematical') :- x_cid(a65b125dfb0bd3).
xc_microtheory(a65b125dfb0bd3,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd3,336).
xc_kb_names(a65b125dfb0bd3,[]).
xc_mapping_rows(a65b125dfb0bd3,[]).
x_comment(x_interArgRelations,"(interArgRelations ?mt ?actor ?roles ?rels) binds ?rels, the binary domain relations that holds (or held) between ?actor and the other ?roles of some event.") :- x_cid(a65b125dfb0bd4).
xc_microtheory(a65b125dfb0bd4,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd4,337).
xc_kb_names(a65b125dfb0bd4,[]).
xc_mapping_rows(a65b125dfb0bd4,[]).
'x_<=='(x_interArgRelations(V1,V2,V3,V4),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_and(x_lookupOnly(x_elementOf(V6,V3)),x_unifies(t(V7,V8,V9),V6),x_different(V9,V2),x_priorDomainRelationBetween(V10,V9,V2),x_unifies(V5,t(V10,V9,V2)))))) :- x_cid(a65b125dfb0bd5,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125dfb0bd5,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd5,340).
xc_kb_names(a65b125dfb0bd5,["?mt","?actor","?roles","?rels","?rel","?role","?pred","?evt","?entity","?rel-pred"]).
xc_mapping_rows(a65b125dfb0bd5,[]).
x_isa(x_entityLiftingBlist,x_TernaryPredicate) :- x_cid(a65b125dfb0bd6).
xc_microtheory(a65b125dfb0bd6,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd6,349).
xc_kb_names(a65b125dfb0bd6,[]).
xc_mapping_rows(a65b125dfb0bd6,[]).
x_arity(x_entityLiftingBlist,3) :- x_cid(a65b125dfb0bd7).
xc_microtheory(a65b125dfb0bd7,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd7,350).
xc_kb_names(a65b125dfb0bd7,[]).
xc_mapping_rows(a65b125dfb0bd7,[]).
x_arg1Isa(x_entityLiftingBlist,'x_Agent-Generic') :- x_cid(a65b125dfb0bd8).
xc_microtheory(a65b125dfb0bd8,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd8,351).
xc_kb_names(a65b125dfb0bd8,[]).
xc_mapping_rows(a65b125dfb0bd8,[]).
x_arg2Isa(x_entityLiftingBlist,'x_Set-Mathematical') :- x_cid(a65b125dfb0bd9).
xc_microtheory(a65b125dfb0bd9,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bd9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bd9,352).
xc_kb_names(a65b125dfb0bd9,[]).
xc_mapping_rows(a65b125dfb0bd9,[]).
x_arg3Isa(x_entityLiftingBlist,'x_Set-Methematical') :- x_cid(a65b125dfb0bda).
xc_microtheory(a65b125dfb0bda,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bda,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bda,353).
xc_kb_names(a65b125dfb0bda,[]).
xc_mapping_rows(a65b125dfb0bda,[]).
'x_<=='(x_entityLiftingBlist(V1,V2,V3),x_evaluate(V4,x_SetToListFn(x_TheClosedRetrievalSetOf(V5,x_and(x_lookupOnly(x_elementOf(V6,V2)),x_unifies(t(V7,V8,V5),V6),x_different(V5,V1))))),x_evaluate(V9,x_LengthOfListFn(V4)),x_evaluate(V3,x_TheClosedRetrievalSetOf(V10,x_and(x_integerBetween(1,V11,V9),x_varBindingFor(V11,V4,V10))))) :- x_cid(a65b125dfb0bdb,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125dfb0bdb,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bdb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bdb,355).
xc_kb_names(a65b125dfb0bdb,["?actor","?roles","?blist","?entities","?entity","?role","?pred","?evt","?len","?binding","?pos"]).
xc_mapping_rows(a65b125dfb0bdb,[]).
x_isa(x_varBindingFor,x_TernaryPredicate) :- x_cid(a65b125dfb0bdc).
xc_microtheory(a65b125dfb0bdc,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bdc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bdc,370).
xc_kb_names(a65b125dfb0bdc,[]).
xc_mapping_rows(a65b125dfb0bdc,[]).
x_arity(x_varBindingFor,3) :- x_cid(a65b125dfb0bdd).
xc_microtheory(a65b125dfb0bdd,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bdd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bdd,371).
xc_kb_names(a65b125dfb0bdd,[]).
xc_mapping_rows(a65b125dfb0bdd,[]).
x_arg1Isa(x_varBindingFor,x_Integer) :- x_cid(a65b125dfb0bde).
xc_microtheory(a65b125dfb0bde,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bde,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bde,372).
xc_kb_names(a65b125dfb0bde,[]).
xc_mapping_rows(a65b125dfb0bde,[]).
x_arg2Isa(x_varBindingFor,x_List) :- x_cid(a65b125dfb0bdf).
xc_microtheory(a65b125dfb0bdf,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bdf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bdf,373).
xc_kb_names(a65b125dfb0bdf,[]).
xc_mapping_rows(a65b125dfb0bdf,[]).
x_arg3Isa(x_varBindingFor,x_CycLTerm) :- x_cid(a65b125dfb0be0).
xc_microtheory(a65b125dfb0be0,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be0,374).
xc_kb_names(a65b125dfb0be0,[]).
xc_mapping_rows(a65b125dfb0be0,[]).
x_comment(x_varBindingFor,"(varBindingFor ?position ?entity-list ?binding-pair) makes an anonymous variable corresponding to position and binds the corresponding entity to it in ?binding-pair.") :- x_cid(a65b125dfb0be1).
xc_microtheory(a65b125dfb0be1,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be1,375).
xc_kb_names(a65b125dfb0be1,[]).
xc_mapping_rows(a65b125dfb0be1,[]).
'x_<=='(x_varBindingFor(V1,V2,V3),x_evaluate(V4,x_NthInListFn(V1,V2)),x_evaluate(V5,x_SymbolConcatenateFn(x_TheList("?var",V1))),x_unifies(V3,t(V4,V5))) :- x_cid(a65b125dfb0be2,V1,V2,V3,V4,V5).
xc_microtheory(a65b125dfb0be2,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be2,377).
xc_kb_names(a65b125dfb0be2,["?pos","?entities","?binding","?item","?var"]).
xc_mapping_rows(a65b125dfb0be2,[]).
x_isa(x_reifyPreventionGoal,x_ComplexActionPredicate) :- x_cid(a65b125dfb0be3).
xc_microtheory(a65b125dfb0be3,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be3,383).
xc_kb_names(a65b125dfb0be3,[]).
xc_mapping_rows(a65b125dfb0be3,[]).
x_arity(x_reifyPreventionGoal,3) :- x_cid(a65b125dfb0be4).
xc_microtheory(a65b125dfb0be4,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be4,384).
xc_kb_names(a65b125dfb0be4,[]).
xc_mapping_rows(a65b125dfb0be4,[]).
x_arg1Isa(x_reifyPreventionGoal,x_Microtheory) :- x_cid(a65b125dfb0be5).
xc_microtheory(a65b125dfb0be5,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be5,385).
xc_kb_names(a65b125dfb0be5,[]).
xc_mapping_rows(a65b125dfb0be5,[]).
x_arg2Isa(x_reifyPreventionGoal,x_Goal) :- x_cid(a65b125dfb0be6).
xc_microtheory(a65b125dfb0be6,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be6,386).
xc_kb_names(a65b125dfb0be6,[]).
xc_mapping_rows(a65b125dfb0be6,[]).
x_arg3Isa(x_reifyPreventionGoal,x_Goal) :- x_cid(a65b125dfb0be7).
xc_microtheory(a65b125dfb0be7,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be7,387).
xc_kb_names(a65b125dfb0be7,[]).
xc_mapping_rows(a65b125dfb0be7,[]).
x_comment(x_reifyPreventionGoal,"(reifyPreventionGoal ?mt ?pgoal ?parent-goal) writes out a goal to prevent a general proposition.") :- x_cid(a65b125dfb0be8).
xc_microtheory(a65b125dfb0be8,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be8,388).
xc_kb_names(a65b125dfb0be8,[]).
xc_mapping_rows(a65b125dfb0be8,[]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_goalName(V2,V3))))),x_reifiedGoalName(V1,V4,V3,V3),x_pgoalToRecognitionRule(V4,V3,V5)),x_methodForAction(x_reifyPreventionGoal(V1,V3,V6),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V1,x_goalName(V4,V3))),x_doRecord('x_ist-Information'(V1,x_subgoal(V6,V4))),x_doRecord('x_ist-Information'(V1,V5)),x_doAnnounce("~%Learned new goal: (goalName ~s ~s)",[V4,V3]),x_doAnnounce("~%Learned new rule: ~s",[V5]))))) :- x_cid(a65b125dfb0be9,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125dfb0be9,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0be9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0be9,395).
xc_kb_names(a65b125dfb0be9,["?lkmt","?named-goal","?goal-rep","?name","?recognition-rule","?parent-goal"]).
xc_mapping_rows(a65b125dfb0be9,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 416, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 417, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125dfb0be9,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 416, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 417, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_goalName(V2,V3))))),x_methodForAction(x_reifyPreventionGoal(V1,V3,V4),x_actionSequence(x_TheList))) :- x_cid(a65b125dfb0bea,V1,V2,V3,V4).
xc_microtheory(a65b125dfb0bea,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bea,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bea,420).
xc_kb_names(a65b125dfb0bea,["?mt","?named-goal","?goal-rep","?parent-goal"]).
xc_mapping_rows(a65b125dfb0bea,[]).
x_isa(x_pgoalToRecognitionRule,x_TernaryPredicate) :- x_cid(a65b125dfb0beb).
xc_microtheory(a65b125dfb0beb,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0beb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0beb,431).
xc_kb_names(a65b125dfb0beb,[]).
xc_mapping_rows(a65b125dfb0beb,[]).
x_arity(x_pgoalToRecognitionRule,3) :- x_cid(a65b125dfb0bec).
xc_microtheory(a65b125dfb0bec,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bec,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bec,432).
xc_kb_names(a65b125dfb0bec,[]).
xc_mapping_rows(a65b125dfb0bec,[]).
x_arg1Isa(x_pgoalToRecognitionRule,x_Goal) :- x_cid(a65b125dfb0bed).
xc_microtheory(a65b125dfb0bed,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bed,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bed,433).
xc_kb_names(a65b125dfb0bed,[]).
xc_mapping_rows(a65b125dfb0bed,[]).
x_arg2Isa(x_pgoalToRecognitionRule,x_Goal) :- x_cid(a65b125dfb0bee).
xc_microtheory(a65b125dfb0bee,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bee,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bee,434).
xc_kb_names(a65b125dfb0bee,[]).
xc_mapping_rows(a65b125dfb0bee,[]).
x_arg3Isa(x_pgoalToRecognitionRule,x_CycLExpression) :- x_cid(a65b125dfb0bef).
xc_microtheory(a65b125dfb0bef,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bef,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bef,435).
xc_kb_names(a65b125dfb0bef,[]).
xc_mapping_rows(a65b125dfb0bef,[]).
x_comment(x_pgoalToRecognitionRule,"(pgoalToRecognitionRule ?goal-name ?propositional-goal ?recognition-rule) generates a horn clause to recognize the proposition in a goal.") :- x_cid(a65b125dfb0bf0).
xc_microtheory(a65b125dfb0bf0,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf0,436).
xc_kb_names(a65b125dfb0bf0,[]).
xc_mapping_rows(a65b125dfb0bf0,[]).
'x_<=='(x_pgoalToRecognitionRule(V1,V2,V3),x_goalProposition(V2,V4),x_unifies(t(V5,x_GenericInstanceFn(x_CollectionSubsetFn(V6,V7)),x_IndexicalFn(V8)),V4),x_formulaArgument(V7,1,V9),x_formulaArgument(V7,2,V10),x_operatorFormulas(x_and,V10),x_unifies(V11,x_eventTriggersResponse(V9,x_respondToGoalFailure(V12,V13,V9,V1))),x_unifies(V14,x_executionContext(V12)),x_unifies(V15,t(V8,V13)),x_evaluate(V16,x_SubstituteFormulaFn(V13,x_IndexicalFn(V8),x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V17,V18),x_contextualizeIfNecessary(V12,V17,V18))),x_MakeFormulaFn(x_TheList,V10)))),x_evaluate(V3,x_MakeFormulaFn('x_<==',x_JoinListsFn(x_TheList(V11,V14,V15),V16)))) :- x_cid(a65b125dfb0bf1,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18).
xc_microtheory(a65b125dfb0bf1,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf1,439).
xc_kb_names(a65b125dfb0bf1,["?goal-name","?pgoal","?rule","?prop","?pred","?type","?set-spec","?role-pred","?v","?conj","?conse","?mt","?role%","?ante1","?ante2","?antes","?in","?out"]).
xc_mapping_rows(a65b125dfb0bf1,[]).
x_isa(x_contextualizeIfNecessary,x_TernaryPredicate) :- x_cid(a65b125dfb0bf2).
xc_microtheory(a65b125dfb0bf2,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf2,459).
xc_kb_names(a65b125dfb0bf2,[]).
xc_mapping_rows(a65b125dfb0bf2,[]).
x_arity(x_contextualizeIfNecessary,3) :- x_cid(a65b125dfb0bf3).
xc_microtheory(a65b125dfb0bf3,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf3,460).
xc_kb_names(a65b125dfb0bf3,[]).
xc_mapping_rows(a65b125dfb0bf3,[]).
x_arg1Isa(x_contextualizeIfNecessary,x_Microtheory) :- x_cid(a65b125dfb0bf4).
xc_microtheory(a65b125dfb0bf4,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf4,461).
xc_kb_names(a65b125dfb0bf4,[]).
xc_mapping_rows(a65b125dfb0bf4,[]).
x_arg2Isa(x_contextualizeIfNecessary,'x_CycLSentence-Askable') :- x_cid(a65b125dfb0bf5).
xc_microtheory(a65b125dfb0bf5,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf5,462).
xc_kb_names(a65b125dfb0bf5,[]).
xc_mapping_rows(a65b125dfb0bf5,[]).
x_arg3Isa(x_contextualizeIfNecessary,'x_CycLSentence-Askable') :- x_cid(a65b125dfb0bf6).
xc_microtheory(a65b125dfb0bf6,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf6,463).
xc_kb_names(a65b125dfb0bf6,[]).
xc_mapping_rows(a65b125dfb0bf6,[]).
x_comment(x_contextualizeIfNecessary,"(contextualizeIfNecessary ?mt ?stmt ?contextualized-stmt) contextualizes ?stmt if the predicate is not global.") :- x_cid(a65b125dfb0bf7).
xc_microtheory(a65b125dfb0bf7,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf7,464).
xc_kb_names(a65b125dfb0bf7,[]).
xc_mapping_rows(a65b125dfb0bf7,[]).
'x_<=='(x_contextualizeIfNecessary(V1,V2,V2),x_not(x_variableExpression(V2)),x_operatorFormulas(V3,V2),x_globalPredicate(V3)) :- x_cid(a65b125dfb0bf8,V1,V2,V3).
xc_microtheory(a65b125dfb0bf8,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf8,466).
xc_kb_names(a65b125dfb0bf8,["?mt","?stmt","?pred"]).
xc_mapping_rows(a65b125dfb0bf8,[]).
'x_<=='(x_contextualizeIfNecessary(V1,V2,V3),x_not(x_variableExpression(V2)),x_operatorFormulas(V4,V2),x_not(x_globalPredicate(V4)),x_unifies(V3,'x_ist-Information'(V1,V2))) :- x_cid(a65b125dfb0bf9,V1,V2,V3,V4).
xc_microtheory(a65b125dfb0bf9,x_PerceptualAgentMt).
xc_source_file(a65b125dfb0bf9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/instruction.krf').
xc_source_line(a65b125dfb0bf9,471).
xc_kb_names(a65b125dfb0bf9,["?mt","?stmt","?output","?pred"]).
xc_mapping_rows(a65b125dfb0bf9,[]).
kb_cache_footer(footer{count:113,digest:e171ef8818f388de7a315bae0ef9634a4fa144842e1f7ccedc156e683bd28307,headerDigest:'90c49dfdc6bd9f561d8e65232f7fb90f9174ab0dbba9be70c2a28f54909d92b4'}).
