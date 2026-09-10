:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:141,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:638,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'1a181c4e9f7b4864e5efa3f4549ada8c52b40cac8abafc862f47bc4f95f2ba0a',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:25477,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf',sourceHash:aa4025b5d0f2b4b33c375f36abf31f5e31e0d21b11b8528f30bbba3f2139fe93,warnings:[]}).
x_preconditionForMethod(x_currentPlayer(V1),x_methodForAction(x_planStrategicGoalActions(x_when,V2),x_actionSequence(x_TheList(x_respondToThreats(V2,V1))))) :- x_cid(a65b125e17ff0f,V1,V2).
xc_microtheory(a65b125e17ff0f,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff0f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff0f,41).
xc_kb_names(a65b125e17ff0f,["?player","?mt"]).
xc_mapping_rows(a65b125e17ff0f,[]).
'x_<=='(x_preferInContext(x_planStrategicGoalActions(V1),V2,V3),x_someArgumentHasPredicate(V2,x_respondToThreats)) :- x_cid(a65b125e17ff10,V1,V2,V3).
xc_microtheory(a65b125e17ff10,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff10,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff10,49).
xc_kb_names(a65b125e17ff10,["?mt","?seq1","?seq2"]).
xc_mapping_rows(a65b125e17ff10,[]).
x_isa(x_respondToThreats,x_ComplexActionPredicate) :- x_cid(a65b125e17ff11).
xc_microtheory(a65b125e17ff11,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff11,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff11,52).
xc_kb_names(a65b125e17ff11,[]).
xc_mapping_rows(a65b125e17ff11,[]).
x_arity(x_respondToThreats,2) :- x_cid(a65b125e17ff12).
xc_microtheory(a65b125e17ff12,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff12,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff12,53).
xc_kb_names(a65b125e17ff12,[]).
xc_mapping_rows(a65b125e17ff12,[]).
x_preconditionForMethod(x_and(x_activeAssignedGoals(V1,V2,V3),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,'x_ist-Information'(V1,x_agentPosesThreat(V5,V6)))),x_evaluate(V7,x_TheClosedRetrievalSetOf(V8,x_and(x_lookupOnly(x_elementOf(V5,V4)),x_unifies(V8,x_AchieveFn(x_agentsExistentialStatus(V5,x_AgentNowTerminated))),x_uninferredSentence(x_goalMember(V1,V8,V2))))),x_different(V7,x_TheSet),x_evaluate(V9,x_TheClosedRetrievalSetOf(t(V10,V11),x_and(x_assignableActorOfType(V10,V11),x_uninferredSentence(x_lookupOnly(x_elementOf(V10,V3))),x_uninferredSentence(x_busyActor(V10))))),x_different(V9,x_TheSet),x_evaluate(V12,x_SetToListFn(V7))),x_methodForAction(x_respondToThreats(V1,V6),x_actionSequence(x_TheList(x_doForEach(V13,V7,x_reifyThreatGoal(V1,V13,x_GoalFn(0))),x_doForEach(V5,V4,x_reifyThreatIsa(V1,V5,V6)),x_doAgentPlan(x_allocateAgentsToThreats(V1,V6,V12,V9)))))) :- x_cid(a65b125e17ff13,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125e17ff13,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff13,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff13,56).
xc_kb_names(a65b125e17ff13,["?mt","?active-goals","?active-actors","?threats","?threat","?player","?goals","?goal-rep","?assignable-actors","?actor","?type","?goal-list","?goal"]).
xc_mapping_rows(a65b125e17ff13,[]).
x_isa(x_allocateAgentsToThreats,x_ComplexActionPredicate) :- x_cid(a65b125e17ff14).
xc_microtheory(a65b125e17ff14,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff14,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff14,93).
xc_kb_names(a65b125e17ff14,[]).
xc_mapping_rows(a65b125e17ff14,[]).
x_arity(x_allocateAgentsToThreats,4) :- x_cid(a65b125e17ff15).
xc_microtheory(a65b125e17ff15,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff15,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff15,94).
xc_kb_names(a65b125e17ff15,[]).
xc_mapping_rows(a65b125e17ff15,[]).
x_comment(x_allocateAgentsToThreats,"(allocateAgentsToThreats ?mt ?player ?goal-list ?actor-type-pairs)") :- x_cid(a65b125e17ff16).
xc_microtheory(a65b125e17ff16,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff16,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff16,95).
xc_kb_names(a65b125e17ff16,[]).
xc_mapping_rows(a65b125e17ff16,[]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_FirstInListFn(V2)),x_evaluate(V3,x_RestOfListFn(V2)),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_achievableByRole(V5,V1))),x_filteredActorsByRoles(V6,V4,V7)),x_methodForAction(x_allocateAgentsToThreats(V8,V9,V2,V6),x_actionSequence(x_TheList(x_allocateAgentToThreat(V8,V9,V3,V6,V1,V7))))) :- x_cid(a65b125e17ff17,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e17ff17,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff17,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff17,103).
xc_kb_names(a65b125e17ff17,["?goal","?goal-list","?rest-goals","?roles","?role","?actor-type-pairs","?filtered-pairs","?mt","?player"]).
xc_mapping_rows(a65b125e17ff17,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_allocateAgentsToThreats(V1,V2,x_TheList,V3),x_actionSequence(x_TheList(x_doAgentPlan(x_defeasiblyAssignActorsToGoals(V1,V3)))))) :- x_cid(a65b125e17ff18,V1,V2,V3).
xc_microtheory(a65b125e17ff18,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff18,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff18,121).
xc_kb_names(a65b125e17ff18,["?mt","?player","?actor-type-pairs"]).
xc_mapping_rows(a65b125e17ff18,[]).
x_isa(x_defeasiblyAssignActorsToGoals,x_ComplexActionPredicate) :- x_cid(a65b125e17ff19).
xc_microtheory(a65b125e17ff19,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff19,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff19,130).
xc_kb_names(a65b125e17ff19,[]).
xc_mapping_rows(a65b125e17ff19,[]).
x_arity(x_defeasiblyAssignActorsToGoals,2) :- x_cid(a65b125e17ff1a).
xc_microtheory(a65b125e17ff1a,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff1a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff1a,131).
xc_kb_names(a65b125e17ff1a,[]).
xc_mapping_rows(a65b125e17ff1a,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_defeasiblyAssignActorsToGoals(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e17ff1b,V1,V2).
xc_microtheory(a65b125e17ff1b,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff1b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff1b,133).
xc_kb_names(a65b125e17ff1b,["?mt","?actor-type-pairs"]).
xc_mapping_rows(a65b125e17ff1b,[]).
x_preconditionForMethod(x_evaluate(V1,x_SetToListFn(x_TheClosedRetrievalSetOf(V2,x_and(x_assignableActorOfType(V2,V3),x_uninferredSentence(x_busyActor(V2)))))),x_methodForAction(x_defeasiblyAssignActorsToGoals(V4,V5),x_actionSequence(x_TheList(x_doForEach(V2,V1,x_assignActor(V4,V2)))))) :- x_cid(a65b125e17ff1c,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e17ff1c,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff1c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff1c,141).
xc_kb_names(a65b125e17ff1c,["?assignable-actors","?actor","?type","?mt","?actor-type-pairs"]).
xc_mapping_rows(a65b125e17ff1c,[]).
'x_<=='(x_preferInContext(x_defeasiblyAssignActorsToGoals(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e17ff1d,V1,V2,V3,V4).
xc_microtheory(a65b125e17ff1d,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff1d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff1d,154).
xc_kb_names(a65b125e17ff1d,["?mt","?actor-type-pairs","?seq1","?seq2"]).
xc_mapping_rows(a65b125e17ff1d,[]).
x_isa(x_allocateAgentToThreat,x_ComplexActionPredicate) :- x_cid(a65b125e17ff1e).
xc_microtheory(a65b125e17ff1e,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff1e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff1e,158).
xc_kb_names(a65b125e17ff1e,[]).
xc_mapping_rows(a65b125e17ff1e,[]).
x_arity(x_allocateAgentToThreat,6) :- x_cid(a65b125e17ff1f).
xc_microtheory(a65b125e17ff1f,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff1f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff1f,159).
xc_kb_names(a65b125e17ff1f,[]).
xc_mapping_rows(a65b125e17ff1f,[]).
x_preconditionForMethod(x_and(x_bestAssignment(V1,V2,V3,V4),x_unifies(t(V5,V6),V4),'x_ist-Information'(V1,x_taskAchieves(V5,V3,V7)),x_groundExpression(V7),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_goalName(V8,V3))))),x_evaluate(V9,x_SetMinusFn(V10,V4))),x_methodForAction(x_allocateAgentToThreat(V1,V11,V12,V10,V3,V2),x_actionSequence(x_TheList(x_takeAction(V1,V5,V8,V7,x_TheList(V7)),x_reifyThreatAssignment(V1,V5,V8,V7),x_doAgentPlan(x_allocateAgentsToThreats(V1,V11,V12,V9)))))) :- x_cid(a65b125e17ff20,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125e17ff20,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff20,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff20,166).
xc_kb_names(a65b125e17ff20,["?mt","?candidate-actors","?goal","?actor-type-pair","?actor","?type","?action","?goal-name","?remaining-actor-type-pairs","?actor-type-pairs","?player","?rest-goals"]).
xc_mapping_rows(a65b125e17ff20,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_allocateAgentToThreat(V1,V2,V3,V4,V5,V6),x_actionSequence(x_TheList(x_allocateAgentsToThreats(V1,V2,V3,V4))))) :- x_cid(a65b125e17ff21,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e17ff21,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff21,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff21,189).
xc_kb_names(a65b125e17ff21,["?mt","?player","?rest-goals","?actor-type-pairs","?goal","?candidate-actors"]).
xc_mapping_rows(a65b125e17ff21,[]).
'x_<=='(x_preferInContext(x_allocateAgentToThreat(V1,V2,V3,V4,V5,V6),V7,V8),x_someArgumentHasPredicate(V7,x_takeAction)) :- x_cid(a65b125e17ff22,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e17ff22,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff22,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff22,197).
xc_kb_names(a65b125e17ff22,["?mt","?player","?rest-goals","?actor-type-pairs","?goal","?candidate-actors","?seq1","?seq2"]).
xc_mapping_rows(a65b125e17ff22,[]).
x_isa(x_reifyThreatGoal,x_ComplexActionPredicate) :- x_cid(a65b125e17ff23).
xc_microtheory(a65b125e17ff23,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff23,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff23,200).
xc_kb_names(a65b125e17ff23,[]).
xc_mapping_rows(a65b125e17ff23,[]).
x_arity(x_reifyThreatGoal,3) :- x_cid(a65b125e17ff24).
xc_microtheory(a65b125e17ff24,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff24,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff24,201).
xc_kb_names(a65b125e17ff24,[]).
xc_mapping_rows(a65b125e17ff24,[]).
x_arg1Isa(x_reifyThreatGoal,x_Microtheory) :- x_cid(a65b125e17ff25).
xc_microtheory(a65b125e17ff25,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff25,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff25,202).
xc_kb_names(a65b125e17ff25,[]).
xc_mapping_rows(a65b125e17ff25,[]).
x_arg2Isa(x_reifyThreatGoal,x_Goal) :- x_cid(a65b125e17ff26).
xc_microtheory(a65b125e17ff26,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff26,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff26,203).
xc_kb_names(a65b125e17ff26,[]).
xc_mapping_rows(a65b125e17ff26,[]).
x_arg3Isa(x_reifyThreatGoal,x_Goal) :- x_cid(a65b125e17ff27).
xc_microtheory(a65b125e17ff27,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff27,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff27,204).
xc_kb_names(a65b125e17ff27,[]).
xc_mapping_rows(a65b125e17ff27,[]).
x_comment(x_reifyThreatGoal,"(reifyThreatGoal ?mt ?threat ?parent-goal) writes out a goal to address a particular threat.") :- x_cid(a65b125e17ff28).
xc_microtheory(a65b125e17ff28,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff28,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff28,205).
xc_kb_names(a65b125e17ff28,[]).
xc_mapping_rows(a65b125e17ff28,[]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_goalName(V2,V3))))),x_reifiedScenarioGoal(V1,V4,V3,V5)),x_methodForAction(x_reifyThreatGoal(V1,V3,V6),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V1,x_goalName(V4,V5))),x_doRecord('x_ist-Information'(V1,x_subgoal(V6,V4))),x_doRecord('x_ist-Information'(V1,x_goalDecomposition(V6,V4,x_agentPosesThreat))))))) :- x_cid(a65b125e17ff29,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e17ff29,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff29,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff29,211).
xc_kb_names(a65b125e17ff29,["?mt","?named-goal","?goal-probe","?name","?goal-rep","?parent-goal"]).
xc_mapping_rows(a65b125e17ff29,[]).
x_preconditionForMethod(x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_goalName(V2,V3))))),x_methodForAction(x_reifyThreatGoal(V1,V3,V4),x_actionSequence(x_TheList))) :- x_cid(a65b125e17ff2a,V1,V2,V3,V4).
xc_microtheory(a65b125e17ff2a,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff2a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff2a,233).
xc_kb_names(a65b125e17ff2a,["?mt","?named-goal","?goal-rep","?parent-goal"]).
xc_mapping_rows(a65b125e17ff2a,[]).
x_isa(x_reifiedScenarioGoal,x_QuaternaryPredicate) :- x_cid(a65b125e17ff2b).
xc_microtheory(a65b125e17ff2b,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff2b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff2b,244).
xc_kb_names(a65b125e17ff2b,[]).
xc_mapping_rows(a65b125e17ff2b,[]).
x_arity(x_reifiedScenarioGoal,4) :- x_cid(a65b125e17ff2c).
xc_microtheory(a65b125e17ff2c,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff2c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff2c,245).
xc_kb_names(a65b125e17ff2c,[]).
xc_mapping_rows(a65b125e17ff2c,[]).
x_arg1Isa(x_reifiedScenarioGoal,x_Microtheory) :- x_cid(a65b125e17ff2d).
xc_microtheory(a65b125e17ff2d,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff2d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff2d,246).
xc_kb_names(a65b125e17ff2d,[]).
xc_mapping_rows(a65b125e17ff2d,[]).
x_arg2Isa(x_reifiedScenarioGoal,x_CycLTerm) :- x_cid(a65b125e17ff2e).
xc_microtheory(a65b125e17ff2e,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff2e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff2e,247).
xc_kb_names(a65b125e17ff2e,[]).
xc_mapping_rows(a65b125e17ff2e,[]).
x_arg3Isa(x_reifiedScenarioGoal,x_Goal) :- x_cid(a65b125e17ff2f).
xc_microtheory(a65b125e17ff2f,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff2f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff2f,248).
xc_kb_names(a65b125e17ff2f,[]).
xc_mapping_rows(a65b125e17ff2f,[]).
x_arg4Isa(x_reifiedScenarioGoal,x_Goal) :- x_cid(a65b125e17ff30).
xc_microtheory(a65b125e17ff30,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff30,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff30,249).
xc_kb_names(a65b125e17ff30,[]).
xc_mapping_rows(a65b125e17ff30,[]).
x_comment(x_reifiedScenarioGoal,"(reifiedScenarioGoal ?mt ?name ?goal-probe ?goal) finds or makes a reifiable NAT name for ?goal representation.") :- x_cid(a65b125e17ff31).
xc_microtheory(a65b125e17ff31,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff31,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff31,250).
xc_kb_names(a65b125e17ff31,[]).
xc_mapping_rows(a65b125e17ff31,[]).
'x_<=='(x_reifiedScenarioGoal(V1,V2,V3,V4),x_scenarioMicrotheory(V1),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_goalName(V2,V3))))),x_unifies(V4,V3)) :- x_cid(a65b125e17ff32,V1,V2,V3,V4).
xc_microtheory(a65b125e17ff32,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff32,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff32,252).
xc_kb_names(a65b125e17ff32,["?mt","?name","?goal-probe","?goal"]).
xc_mapping_rows(a65b125e17ff32,[]).
'x_<=='(x_reifiedScenarioGoal(V1,V2,V3,V4),x_scenarioMicrotheory(V1),x_uninferredSentence(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_goalName(V5,V3))))),x_numAnswers(1,x_nextCounterValue(x_SGoalFn,V6)),x_unifies(t(V2,V4),t(x_SGoalFn(V6),V3))) :- x_cid(a65b125e17ff33,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e17ff33,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff33,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff33,261).
xc_kb_names(a65b125e17ff33,["?mt","?name","?goal-probe","?goal","?some-name","?count"]).
xc_mapping_rows(a65b125e17ff33,[]).
x_isa(x_reifyThreatIsa,x_ComplexActionPredicate) :- x_cid(a65b125e17ff34).
xc_microtheory(a65b125e17ff34,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff34,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff34,273).
xc_kb_names(a65b125e17ff34,[]).
xc_mapping_rows(a65b125e17ff34,[]).
x_arity(x_reifyThreatIsa,3) :- x_cid(a65b125e17ff35).
xc_microtheory(a65b125e17ff35,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff35,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff35,274).
xc_kb_names(a65b125e17ff35,[]).
xc_mapping_rows(a65b125e17ff35,[]).
x_arg1Isa(x_reifyThreatIsa,x_Microtheory) :- x_cid(a65b125e17ff36).
xc_microtheory(a65b125e17ff36,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff36,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff36,275).
xc_kb_names(a65b125e17ff36,[]).
xc_mapping_rows(a65b125e17ff36,[]).
x_arg2Isa(x_reifyThreatIsa,x_SomethingExisting) :- x_cid(a65b125e17ff37).
xc_microtheory(a65b125e17ff37,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff37,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff37,276).
xc_kb_names(a65b125e17ff37,[]).
xc_mapping_rows(a65b125e17ff37,[]).
x_arg3Isa(x_reifyThreatIsa,'x_Agent-Generic') :- x_cid(a65b125e17ff38).
xc_microtheory(a65b125e17ff38,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff38,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff38,277).
xc_kb_names(a65b125e17ff38,[]).
xc_mapping_rows(a65b125e17ff38,[]).
x_comment(x_reifyThreatIsa,"(reifyThreatIsa ?mt ?thing ?actor) reifies the isa of ?thing in ?mt, along with the ThreatDetected event.") :- x_cid(a65b125e17ff39).
xc_microtheory(a65b125e17ff39,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff39,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff39,278).
xc_kb_names(a65b125e17ff39,[]).
xc_mapping_rows(a65b125e17ff39,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_reifyThreatIsa(V1,V2,V3),x_actionSequence(x_TheList))) :- x_cid(a65b125e17ff3a,V1,V2,V3).
xc_microtheory(a65b125e17ff3a,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff3a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff3a,282).
xc_kb_names(a65b125e17ff3a,["?mt","?thing","?actor"]).
xc_mapping_rows(a65b125e17ff3a,[]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_kbOnly(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_isa(V2,V3)))))),x_numAnswers(1,x_mostSpecificIsa(V1,V2,V4)),'x_ist-Information'(V1,x_objectFoundInLocation(V2,V5)),x_unifies(V6,x_TheList(V7,V2,V5))),x_methodForAction(x_reifyThreatIsa(V1,V2,V7),x_actionSequence(x_TheList(x_doRecordEvent(x_ThreatDetectedEvent,V6),x_doRecord('x_ist-Information'(V1,x_isa(V2,V4))))))) :- x_cid(a65b125e17ff3b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e17ff3b,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff3b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff3b,289).
xc_kb_names(a65b125e17ff3b,["?mt","?threat","?what","?something","?where","?event-roles","?who"]).
xc_mapping_rows(a65b125e17ff3b,[]).
'x_<=='(x_preferInContext(x_reifyThreatIsa(V1,V2,V3),V4,V5),x_different(V4,x_actionSequence(x_TheList))) :- x_cid(a65b125e17ff3c,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e17ff3c,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff3c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff3c,309).
xc_kb_names(a65b125e17ff3c,["?mt","?thing","?actor","?seq1","?seq2"]).
xc_mapping_rows(a65b125e17ff3c,[]).
x_isa(x_mostSpecificIsa,x_TernaryPredicate) :- x_cid(a65b125e17ff3d).
xc_microtheory(a65b125e17ff3d,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff3d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff3d,312).
xc_kb_names(a65b125e17ff3d,[]).
xc_mapping_rows(a65b125e17ff3d,[]).
x_arity(x_mostSpecificIsa,3) :- x_cid(a65b125e17ff3e).
xc_microtheory(a65b125e17ff3e,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff3e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff3e,313).
xc_kb_names(a65b125e17ff3e,[]).
xc_mapping_rows(a65b125e17ff3e,[]).
x_arg1Isa(x_mostSpecificIsa,x_Microtheory) :- x_cid(a65b125e17ff3f).
xc_microtheory(a65b125e17ff3f,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff3f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff3f,314).
xc_kb_names(a65b125e17ff3f,[]).
xc_mapping_rows(a65b125e17ff3f,[]).
x_arg2Isa(x_mostSpecificIsa,x_Individual) :- x_cid(a65b125e17ff40).
xc_microtheory(a65b125e17ff40,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff40,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff40,315).
xc_kb_names(a65b125e17ff40,[]).
xc_mapping_rows(a65b125e17ff40,[]).
x_arg3Isa(x_mostSpecificIsa,x_Collection) :- x_cid(a65b125e17ff41).
xc_microtheory(a65b125e17ff41,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff41,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff41,316).
xc_kb_names(a65b125e17ff41,[]).
xc_mapping_rows(a65b125e17ff41,[]).
x_comment(x_mostSpecificIsa,"(mostSpecificIsa ?mt ?inst ?type) binds ?type to the most specific isa of ?inst.") :- x_cid(a65b125e17ff42).
xc_microtheory(a65b125e17ff42,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff42,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff42,317).
xc_kb_names(a65b125e17ff42,[]).
xc_mapping_rows(a65b125e17ff42,[]).
'x_<=='(x_mostSpecificIsa(V1,V2,V3),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_inferenceAllowed(x_nonTransitiveInference(x_allFactsAllowed(x_contextEnvAllowed('x_ist-Information'(V1,x_isa(V2,V5)))))))),x_numAnswers(1,x_mostSpecificType(V1,V4,V3))) :- x_cid(a65b125e17ff43,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e17ff43,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff43,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff43,319).
xc_kb_names(a65b125e17ff43,["?mt","?inst","?type","?types","?isa"]).
xc_mapping_rows(a65b125e17ff43,[]).
x_isa(x_mostSpecificType,x_TernaryPredicate) :- x_cid(a65b125e17ff44).
xc_microtheory(a65b125e17ff44,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff44,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff44,331).
xc_kb_names(a65b125e17ff44,[]).
xc_mapping_rows(a65b125e17ff44,[]).
x_arity(x_mostSpecificType,3) :- x_cid(a65b125e17ff45).
xc_microtheory(a65b125e17ff45,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff45,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff45,332).
xc_kb_names(a65b125e17ff45,[]).
xc_mapping_rows(a65b125e17ff45,[]).
x_arg1Isa(x_mostSpecificType,x_Microtheory) :- x_cid(a65b125e17ff46).
xc_microtheory(a65b125e17ff46,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff46,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff46,333).
xc_kb_names(a65b125e17ff46,[]).
xc_mapping_rows(a65b125e17ff46,[]).
x_arg2Isa(x_mostSpecificType,'x_Set-Mathematical') :- x_cid(a65b125e17ff47).
xc_microtheory(a65b125e17ff47,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff47,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff47,334).
xc_kb_names(a65b125e17ff47,[]).
xc_mapping_rows(a65b125e17ff47,[]).
x_arg3Isa(x_mostSpecificType,x_Collection) :- x_cid(a65b125e17ff48).
xc_microtheory(a65b125e17ff48,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff48,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff48,335).
xc_kb_names(a65b125e17ff48,[]).
xc_mapping_rows(a65b125e17ff48,[]).
x_comment(x_mostSpecificType,"(mostSpecificType ?mt ?types ?type) binds ?type to the most specific type.") :- x_cid(a65b125e17ff49).
xc_microtheory(a65b125e17ff49,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff49,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff49,336).
xc_kb_names(a65b125e17ff49,[]).
xc_mapping_rows(a65b125e17ff49,[]).
'x_<=='(x_mostSpecificType(V1,V2,V3),x_evaluate(V3,x_FirstInListFn(x_SortFn(V2,x_genls,x_IdentityFn)))) :- x_cid(a65b125e17ff4a,V1,V2,V3).
xc_microtheory(a65b125e17ff4a,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff4a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff4a,340).
xc_kb_names(a65b125e17ff4a,["?mt","?types","?type"]).
xc_mapping_rows(a65b125e17ff4a,[]).
x_isa(x_bestAssignment,x_Predicate) :- x_cid(a65b125e17ff4b).
xc_microtheory(a65b125e17ff4b,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff4b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff4b,345).
xc_kb_names(a65b125e17ff4b,[]).
xc_mapping_rows(a65b125e17ff4b,[]).
x_arity(x_bestAssignment,4) :- x_cid(a65b125e17ff4c).
xc_microtheory(a65b125e17ff4c,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff4c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff4c,346).
xc_kb_names(a65b125e17ff4c,[]).
xc_mapping_rows(a65b125e17ff4c,[]).
x_comment(x_bestAssignment,"(bestAssignment ?mt ?candidate-actors ?goal ?actor-type-pair)") :- x_cid(a65b125e17ff4d).
xc_microtheory(a65b125e17ff4d,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff4d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff4d,347).
xc_kb_names(a65b125e17ff4d,[]).
xc_mapping_rows(a65b125e17ff4d,[]).
'x_<=='(x_bestAssignment(V1,V2,V3,V4),x_different(V2,x_TheSet),x_not(x_matches(x_AchieveFn(x_agentsExistentialStatus(V5,V6)),V3)),x_formulaArgument(V2,1,V4)) :- x_cid(a65b125e17ff4e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e17ff4e,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff4e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff4e,352).
xc_kb_names(a65b125e17ff4e,["?mt","?candidate-actors","?goal","?actor-type-pair","?threat","?status"]).
xc_mapping_rows(a65b125e17ff4e,[]).
'x_<=='(x_bestAssignment(V1,V2,x_AchieveFn(x_agentsExistentialStatus(V3,x_AgentNowTerminated)),V4),x_different(V2,x_TheSet),x_closestActorPair(V2,V3,V4)) :- x_cid(a65b125e17ff4f,V1,V2,V3,V4).
xc_microtheory(a65b125e17ff4f,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff4f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff4f,357).
xc_kb_names(a65b125e17ff4f,["?mt","?candidate-actors","?threat","?actor-type-pair"]).
xc_mapping_rows(a65b125e17ff4f,[]).
x_isa(x_closestActorPair,x_TernaryPredicate) :- x_cid(a65b125e17ff50).
xc_microtheory(a65b125e17ff50,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff50,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff50,363).
xc_kb_names(a65b125e17ff50,[]).
xc_mapping_rows(a65b125e17ff50,[]).
x_arity(x_closestActorPair,3) :- x_cid(a65b125e17ff51).
xc_microtheory(a65b125e17ff51,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff51,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff51,364).
xc_kb_names(a65b125e17ff51,[]).
xc_mapping_rows(a65b125e17ff51,[]).
x_arg1Isa(x_closestActorPair,'x_Set-Mathematical') :- x_cid(a65b125e17ff52).
xc_microtheory(a65b125e17ff52,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff52,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff52,365).
xc_kb_names(a65b125e17ff52,[]).
xc_mapping_rows(a65b125e17ff52,[]).
x_arg2Isa(x_closestActorPair,x_SomethingExisting) :- x_cid(a65b125e17ff53).
xc_microtheory(a65b125e17ff53,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff53,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff53,366).
xc_kb_names(a65b125e17ff53,[]).
xc_mapping_rows(a65b125e17ff53,[]).
x_arg3Isa(x_closestActorPair,x_CycLTerm) :- x_cid(a65b125e17ff54).
xc_microtheory(a65b125e17ff54,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff54,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff54,367).
xc_kb_names(a65b125e17ff54,[]).
xc_mapping_rows(a65b125e17ff54,[]).
x_comment(x_closestActorPair,"(closestActorPair ?pairs ?target ?pair) identifies the (<instance> <type>) element of ?pairs that is closest to ?target.") :- x_cid(a65b125e17ff55).
xc_microtheory(a65b125e17ff55,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff55,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff55,368).
xc_kb_names(a65b125e17ff55,[]).
xc_mapping_rows(a65b125e17ff55,[]).
'x_<=='(x_closestActorPair(V1,V2,V3),x_evaluate(V4,x_SortFn(V1,x_lessThan,x_FunctionToArg(2,x_Kappa(t(V3,V5),x_and(x_unifies(t(V6,V7),V3),x_distanceBetween(V6,V2,V8),x_numericMagnitude(V8,V5)))))),x_evaluate(V3,x_FirstInListFn(V4))) :- x_cid(a65b125e17ff56,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e17ff56,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff56,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff56,370).
xc_kb_names(a65b125e17ff56,["?pairs","?target","?pair","?sorted-pairs","?magnitude","?actor","?type","?distance"]).
xc_mapping_rows(a65b125e17ff56,[]).
x_isa(x_numericMagnitude,x_BinaryPredicate) :- x_cid(a65b125e17ff57).
xc_microtheory(a65b125e17ff57,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff57,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff57,381).
xc_kb_names(a65b125e17ff57,[]).
xc_mapping_rows(a65b125e17ff57,[]).
'x_<=='(x_numericMagnitude(V1,V2),x_groundExpression(V1),x_unifies(t(V3,V2),V1),x_isa(V2,'x_Number-General')) :- x_cid(a65b125e17ff58,V1,V2,V3).
xc_microtheory(a65b125e17ff58,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff58,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff58,383).
xc_kb_names(a65b125e17ff58,["?quantity","?number","?functor"]).
xc_mapping_rows(a65b125e17ff58,[]).
'x_<=='(x_numericMagnitude(V1,V1),x_groundExpression(V1),x_atomicTerm(V1),x_isa(V1,'x_Number-General')) :- x_cid(a65b125e17ff59,V1).
xc_microtheory(a65b125e17ff59,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff59,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff59,388).
xc_kb_names(a65b125e17ff59,["?number"]).
xc_mapping_rows(a65b125e17ff59,[]).
x_isa(x_assignedToGoal,x_TernaryPredicate) :- x_cid(a65b125e17ff5a).
xc_microtheory(a65b125e17ff5a,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff5a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff5a,393).
xc_kb_names(a65b125e17ff5a,[]).
xc_mapping_rows(a65b125e17ff5a,[]).
x_arity(x_assignedToGoal,3) :- x_cid(a65b125e17ff5b).
xc_microtheory(a65b125e17ff5b,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff5b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff5b,394).
xc_kb_names(a65b125e17ff5b,[]).
xc_mapping_rows(a65b125e17ff5b,[]).
x_arg1Isa(x_assignedToGoal,x_Goal) :- x_cid(a65b125e17ff5c).
xc_microtheory(a65b125e17ff5c,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff5c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff5c,395).
xc_kb_names(a65b125e17ff5c,[]).
xc_mapping_rows(a65b125e17ff5c,[]).
x_arg2Isa(x_assignedToGoal,'x_Agent-Generic') :- x_cid(a65b125e17ff5d).
xc_microtheory(a65b125e17ff5d,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff5d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff5d,396).
xc_kb_names(a65b125e17ff5d,[]).
xc_mapping_rows(a65b125e17ff5d,[]).
x_arg3Isa(x_assignedToGoal,x_Task) :- x_cid(a65b125e17ff5e).
xc_microtheory(a65b125e17ff5e,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff5e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff5e,397).
xc_kb_names(a65b125e17ff5e,[]).
xc_mapping_rows(a65b125e17ff5e,[]).
x_comment(x_assignedToGoal,"(assignedToGoal ?goal ?actor ?task) means ?actor is pursuing ?goal via ?task.") :- x_cid(a65b125e17ff5f).
xc_microtheory(a65b125e17ff5f,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff5f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff5f,398).
xc_kb_names(a65b125e17ff5f,[]).
xc_mapping_rows(a65b125e17ff5f,[]).
x_isa(x_reifyThreatAssignment,x_ComplexActionPredicate) :- x_cid(a65b125e17ff60).
xc_microtheory(a65b125e17ff60,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff60,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff60,400).
xc_kb_names(a65b125e17ff60,[]).
xc_mapping_rows(a65b125e17ff60,[]).
x_arity(x_reifyThreatAssignment,4) :- x_cid(a65b125e17ff61).
xc_microtheory(a65b125e17ff61,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff61,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff61,401).
xc_kb_names(a65b125e17ff61,[]).
xc_mapping_rows(a65b125e17ff61,[]).
x_arg1Isa(x_reifyThreatAssignment,x_Microtheory) :- x_cid(a65b125e17ff62).
xc_microtheory(a65b125e17ff62,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff62,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff62,402).
xc_kb_names(a65b125e17ff62,[]).
xc_mapping_rows(a65b125e17ff62,[]).
x_arg2Isa(x_reifyThreatAssignment,'x_Agent-Generic') :- x_cid(a65b125e17ff63).
xc_microtheory(a65b125e17ff63,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff63,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff63,403).
xc_kb_names(a65b125e17ff63,[]).
xc_mapping_rows(a65b125e17ff63,[]).
x_arg3Isa(x_reifyThreatAssignment,x_Goal) :- x_cid(a65b125e17ff64).
xc_microtheory(a65b125e17ff64,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff64,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff64,404).
xc_kb_names(a65b125e17ff64,[]).
xc_mapping_rows(a65b125e17ff64,[]).
x_arg4Isa(x_reifyThreatAssignment,x_Task) :- x_cid(a65b125e17ff65).
xc_microtheory(a65b125e17ff65,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff65,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff65,405).
xc_kb_names(a65b125e17ff65,[]).
xc_mapping_rows(a65b125e17ff65,[]).
x_comment(x_reifyThreatAssignment,"(reifyThreatAssignment ?mt ?actor ?goal ?task) writes out a goal assignment and goal activation event.") :- x_cid(a65b125e17ff66).
xc_microtheory(a65b125e17ff66,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff66,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff66,406).
xc_kb_names(a65b125e17ff66,[]).
xc_mapping_rows(a65b125e17ff66,[]).
x_preconditionForMethod('x_ist-Information'(V1,x_gameTurn(V2)),x_methodForAction(x_reifyThreatAssignment(V1,V3,V4,V5),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V1,x_holdsIn(V2,x_assignedToGoal(V4,V3,V5)))),x_doNotifyPA(V4,x_GoalActivationEvent))))) :- x_cid(a65b125e17ff67,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e17ff67,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff67,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff67,408).
xc_kb_names(a65b125e17ff67,["?mt","?when","?actor","?goal","?task"]).
xc_mapping_rows(a65b125e17ff67,[]).
x_isa(x_activeAssignedGoals,x_TernaryPredicate) :- x_cid(a65b125e17ff68).
xc_microtheory(a65b125e17ff68,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff68,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff68,426).
xc_kb_names(a65b125e17ff68,[]).
xc_mapping_rows(a65b125e17ff68,[]).
x_arity(x_activeAssignedGoals,3) :- x_cid(a65b125e17ff69).
xc_microtheory(a65b125e17ff69,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff69,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff69,427).
xc_kb_names(a65b125e17ff69,[]).
xc_mapping_rows(a65b125e17ff69,[]).
x_arg1Isa(x_activeAssignedGoals,x_Microtheory) :- x_cid(a65b125e17ff6a).
xc_microtheory(a65b125e17ff6a,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff6a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff6a,428).
xc_kb_names(a65b125e17ff6a,[]).
xc_mapping_rows(a65b125e17ff6a,[]).
x_arg2Isa(x_activeAssignedGoals,'x_Set-Mathematical') :- x_cid(a65b125e17ff6b).
xc_microtheory(a65b125e17ff6b,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff6b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff6b,429).
xc_kb_names(a65b125e17ff6b,[]).
xc_mapping_rows(a65b125e17ff6b,[]).
x_arg3Isa(x_activeAssignedGoals,'x_Set-Mathematical') :- x_cid(a65b125e17ff6c).
xc_microtheory(a65b125e17ff6c,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff6c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff6c,430).
xc_kb_names(a65b125e17ff6c,[]).
xc_mapping_rows(a65b125e17ff6c,[]).
x_comment(x_activeAssignedGoals,"(activeAssignedGoals ?mt ?active-goals ?active-actors)") :- x_cid(a65b125e17ff6d).
xc_microtheory(a65b125e17ff6d,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff6d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff6d,431).
xc_kb_names(a65b125e17ff6d,[]).
xc_mapping_rows(a65b125e17ff6d,[]).
'x_<=='(x_activeAssignedGoals(V1,V2,V3),x_evaluate(V4,x_TheClosedRetrievalSetOf(t(V5,V6),x_and(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_assignedToGoal(V5,V6,V7)))),x_uninferredSentence(x_deactivatedGoal(V1,V5))))),x_evaluate(V2,x_TheClosedRetrievalSetOf(V5,x_and(x_lookupOnly(x_elementOf(V8,V4)),x_unifies(t(V5,V6),V8)))),x_evaluate(V3,x_TheClosedRetrievalSetOf(V6,x_and(x_lookupOnly(x_elementOf(V8,V4)),x_unifies(t(V5,V6),V8))))) :- x_cid(a65b125e17ff6e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e17ff6e,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff6e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff6e,433).
xc_kb_names(a65b125e17ff6e,["?mt","?active-goals","?active-actors","?pairs","?goal","?actor","?task","?pair"]).
xc_mapping_rows(a65b125e17ff6e,[]).
x_isa(x_deactivatedGoal,x_BinaryPredicate) :- x_cid(a65b125e17ff6f).
xc_microtheory(a65b125e17ff6f,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff6f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff6f,451).
xc_kb_names(a65b125e17ff6f,[]).
xc_mapping_rows(a65b125e17ff6f,[]).
x_arity(x_deactivatedGoal,2) :- x_cid(a65b125e17ff70).
xc_microtheory(a65b125e17ff70,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff70,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff70,452).
xc_kb_names(a65b125e17ff70,[]).
xc_mapping_rows(a65b125e17ff70,[]).
x_arg1Isa(x_deactivatedGoal,x_Microtheory) :- x_cid(a65b125e17ff71).
xc_microtheory(a65b125e17ff71,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff71,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff71,453).
xc_kb_names(a65b125e17ff71,[]).
xc_mapping_rows(a65b125e17ff71,[]).
x_arg2Isa(x_deactivatedGoal,x_Goal) :- x_cid(a65b125e17ff72).
xc_microtheory(a65b125e17ff72,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff72,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff72,454).
xc_kb_names(a65b125e17ff72,[]).
xc_mapping_rows(a65b125e17ff72,[]).
x_comment(x_deactivatedGoal,"(deactivatedGoal ?mt ?goal) means ?goal has been the object of a GoalDeactivatedEvent in ?mt.") :- x_cid(a65b125e17ff73).
xc_microtheory(a65b125e17ff73,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff73,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff73,455).
xc_kb_names(a65b125e17ff73,[]).
xc_mapping_rows(a65b125e17ff73,[]).
'x_<=='(x_deactivatedGoal(V1,V2),x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_objectOfStateChange(V3,V2)))),x_lookupOnly(x_localOnly(x_useTransitiveInference(x_allFactsAllowed('x_ist-Information'(V1,x_isa(V3,x_GoalDeactivationEvent))))))) :- x_cid(a65b125e17ff74,V1,V2,V3).
xc_microtheory(a65b125e17ff74,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff74,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff74,458).
xc_kb_names(a65b125e17ff74,["?mt","?goal","?goal-event"]).
xc_mapping_rows(a65b125e17ff74,[]).
x_isa(x_goalMember,x_TernaryPredicate) :- x_cid(a65b125e17ff75).
xc_microtheory(a65b125e17ff75,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff75,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff75,471).
xc_kb_names(a65b125e17ff75,[]).
xc_mapping_rows(a65b125e17ff75,[]).
x_arity(x_goalMember,3) :- x_cid(a65b125e17ff76).
xc_microtheory(a65b125e17ff76,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff76,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff76,472).
xc_kb_names(a65b125e17ff76,[]).
xc_mapping_rows(a65b125e17ff76,[]).
x_arg1Isa(x_goalMember,x_Microtheory) :- x_cid(a65b125e17ff77).
xc_microtheory(a65b125e17ff77,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff77,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff77,473).
xc_kb_names(a65b125e17ff77,[]).
xc_mapping_rows(a65b125e17ff77,[]).
x_arg2Isa(x_goalMember,x_Goal) :- x_cid(a65b125e17ff78).
xc_microtheory(a65b125e17ff78,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff78,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff78,474).
xc_kb_names(a65b125e17ff78,[]).
xc_mapping_rows(a65b125e17ff78,[]).
x_arg3Isa(x_goalMember,'x_Set-Mathematical') :- x_cid(a65b125e17ff79).
xc_microtheory(a65b125e17ff79,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff79,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff79,475).
xc_kb_names(a65b125e17ff79,[]).
xc_mapping_rows(a65b125e17ff79,[]).
x_comment(x_goalMember,"(goalMember ?mt ?goal-rep ?goal-name-set) succeeds if ?goal-rep has a name in ?mt that is an element of ?goal-name-set.") :- x_cid(a65b125e17ff7a).
xc_microtheory(a65b125e17ff7a,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff7a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff7a,476).
xc_kb_names(a65b125e17ff7a,[]).
xc_mapping_rows(a65b125e17ff7a,[]).
'x_<=='(x_goalMember(V1,V2,V3),x_numAnswers(1,x_lookupOnly('x_ist-Information'(V1,x_goalName(V4,V2)))),x_lookupOnly(x_elementOf(V4,V3))) :- x_cid(a65b125e17ff7b,V1,V2,V3,V4).
xc_microtheory(a65b125e17ff7b,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff7b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff7b,478).
xc_kb_names(a65b125e17ff7b,["?mt","?goal-rep","?goal-set","?goal"]).
xc_mapping_rows(a65b125e17ff7b,[]).
x_isa(x_respondToGoalFailure,x_ComplexActionPredicate) :- x_cid(a65b125e17ff7c).
xc_microtheory(a65b125e17ff7c,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff7c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff7c,509).
xc_kb_names(a65b125e17ff7c,[]).
xc_mapping_rows(a65b125e17ff7c,[]).
x_arity(x_respondToGoalFailure,4) :- x_cid(a65b125e17ff7d).
xc_microtheory(a65b125e17ff7d,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff7d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff7d,510).
xc_kb_names(a65b125e17ff7d,[]).
xc_mapping_rows(a65b125e17ff7d,[]).
x_arg1Isa(x_respondToGoalFailure,x_Microtheory) :- x_cid(a65b125e17ff7e).
xc_microtheory(a65b125e17ff7e,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff7e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff7e,511).
xc_kb_names(a65b125e17ff7e,[]).
xc_mapping_rows(a65b125e17ff7e,[]).
x_arg2Isa(x_respondToGoalFailure,'x_Agent-Generic') :- x_cid(a65b125e17ff7f).
xc_microtheory(a65b125e17ff7f,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff7f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff7f,512).
xc_kb_names(a65b125e17ff7f,[]).
xc_mapping_rows(a65b125e17ff7f,[]).
x_arg3Isa(x_respondToGoalFailure,x_PerceptualAgentEvent) :- x_cid(a65b125e17ff80).
xc_microtheory(a65b125e17ff80,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff80,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff80,513).
xc_kb_names(a65b125e17ff80,[]).
xc_mapping_rows(a65b125e17ff80,[]).
x_arg4Isa(x_respondToGoalFailure,x_Goal) :- x_cid(a65b125e17ff81).
xc_microtheory(a65b125e17ff81,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff81,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff81,514).
xc_kb_names(a65b125e17ff81,[]).
xc_mapping_rows(a65b125e17ff81,[]).
x_comment(x_respondToGoalFailure,"(respondToGoalFailure ?mt ?actor ?event ?goal) attempts to salvage a situation from a goal failure or learn how to avoid it in the future.") :- x_cid(a65b125e17ff82).
xc_microtheory(a65b125e17ff82,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff82,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff82,515).
xc_kb_names(a65b125e17ff82,[]).
xc_mapping_rows(a65b125e17ff82,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_respondToGoalFailure(V1,V2,V3,V4),x_actionSequence(x_TheList(x_doNotifyPA(V4,x_GoalActivationEvent),x_repairPlanWRTGoalFailure(V1,V2,V3,V4))))) :- x_cid(a65b125e17ff83,V1,V2,V3,V4).
xc_microtheory(a65b125e17ff83,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff83,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff83,517).
xc_kb_names(a65b125e17ff83,["?mt","?actor","?event","?goal"]).
xc_mapping_rows(a65b125e17ff83,[]).
x_isa('x_OODA-Observe',x_ComplexActionPredicate) :- x_cid(a65b125e17ff84).
xc_microtheory(a65b125e17ff84,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff84,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff84,541).
xc_kb_names(a65b125e17ff84,[]).
xc_mapping_rows(a65b125e17ff84,[]).
x_isa('x_OODA-Orient',x_ComplexActionPredicate) :- x_cid(a65b125e17ff85).
xc_microtheory(a65b125e17ff85,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff85,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff85,543).
xc_kb_names(a65b125e17ff85,[]).
xc_mapping_rows(a65b125e17ff85,[]).
x_isa('x_OODA-Decide',x_ComplexActionPredicate) :- x_cid(a65b125e17ff86).
xc_microtheory(a65b125e17ff86,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff86,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff86,545).
xc_kb_names(a65b125e17ff86,[]).
xc_mapping_rows(a65b125e17ff86,[]).
x_isa('x_OODA-Act',x_ComplexActionPredicate) :- x_cid(a65b125e17ff87).
xc_microtheory(a65b125e17ff87,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff87,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff87,547).
xc_kb_names(a65b125e17ff87,[]).
xc_mapping_rows(a65b125e17ff87,[]).
x_isa(x_operationalizeAbstractStrategy,x_ComplexActionPredicate) :- x_cid(a65b125e17ff88).
xc_microtheory(a65b125e17ff88,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff88,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff88,585).
xc_kb_names(a65b125e17ff88,[]).
xc_mapping_rows(a65b125e17ff88,[]).
x_arity(x_operationalizeAbstractStrategy,3) :- x_cid(a65b125e17ff89).
xc_microtheory(a65b125e17ff89,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff89,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff89,586).
xc_kb_names(a65b125e17ff89,[]).
xc_mapping_rows(a65b125e17ff89,[]).
x_arg1Isa(x_operationalizeAbstractStrategy,x_Microtheory) :- x_cid(a65b125e17ff8a).
xc_microtheory(a65b125e17ff8a,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff8a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff8a,587).
xc_kb_names(a65b125e17ff8a,[]).
xc_mapping_rows(a65b125e17ff8a,[]).
x_arg2Isa(x_operationalizeAbstractStrategy,x_Strategy) :- x_cid(a65b125e17ff8b).
xc_microtheory(a65b125e17ff8b,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff8b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff8b,588).
xc_kb_names(a65b125e17ff8b,[]).
xc_mapping_rows(a65b125e17ff8b,[]).
x_arg3Isa(x_operationalizeAbstractStrategy,'x_Set-Mathematical') :- x_cid(a65b125e17ff8c).
xc_microtheory(a65b125e17ff8c,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff8c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff8c,589).
xc_kb_names(a65b125e17ff8c,[]).
xc_mapping_rows(a65b125e17ff8c,[]).
x_comment(x_operationalizeAbstractStrategy,"(operationalizeAbstractStrategy ?mt ?strategy ?resources)") :- x_cid(a65b125e17ff8d).
xc_microtheory(a65b125e17ff8d,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff8d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff8d,590).
xc_kb_names(a65b125e17ff8d,[]).
xc_mapping_rows(a65b125e17ff8d,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_operationalizeAbstractStrategy(V1,V2,V3),x_actionSequence(x_TheList))) :- x_cid(a65b125e17ff8e,V1,V2,V3).
xc_microtheory(a65b125e17ff8e,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff8e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff8e,592).
xc_kb_names(a65b125e17ff8e,["?mt","?strategy","?resources"]).
xc_mapping_rows(a65b125e17ff8e,[]).
x_isa(x_generateInitialStrategyFor,x_ComplexActionPredicate) :- x_cid(a65b125e17ff8f).
xc_microtheory(a65b125e17ff8f,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff8f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff8f,599).
xc_kb_names(a65b125e17ff8f,[]).
xc_mapping_rows(a65b125e17ff8f,[]).
x_arity(x_generateInitialStrategyFor,2) :- x_cid(a65b125e17ff90).
xc_microtheory(a65b125e17ff90,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff90,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff90,600).
xc_kb_names(a65b125e17ff90,[]).
xc_mapping_rows(a65b125e17ff90,[]).
x_arg1Isa(x_generateInitialStrategyFor,x_Microtheory) :- x_cid(a65b125e17ff91).
xc_microtheory(a65b125e17ff91,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff91,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff91,601).
xc_kb_names(a65b125e17ff91,[]).
xc_mapping_rows(a65b125e17ff91,[]).
x_arg2Isa(x_generateInitialStrategyFor,x_Goal) :- x_cid(a65b125e17ff92).
xc_microtheory(a65b125e17ff92,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff92,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff92,602).
xc_kb_names(a65b125e17ff92,[]).
xc_mapping_rows(a65b125e17ff92,[]).
x_comment(x_generateInitialStrategyFor,"(generateInitialStrategyFor ?mt ?goal) produces an initial strategy for achieving ?goal.") :- x_cid(a65b125e17ff93).
xc_microtheory(a65b125e17ff93,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff93,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff93,603).
xc_kb_names(a65b125e17ff93,[]).
xc_mapping_rows(a65b125e17ff93,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_generateInitialStrategyFor(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e17ff94,V1,V2).
xc_microtheory(a65b125e17ff94,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff94,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff94,606).
xc_kb_names(a65b125e17ff94,["?mt","?goal"]).
xc_mapping_rows(a65b125e17ff94,[]).
x_isa(x_reviseStrategy,x_ComplexActionPredicate) :- x_cid(a65b125e17ff95).
xc_microtheory(a65b125e17ff95,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff95,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff95,613).
xc_kb_names(a65b125e17ff95,[]).
xc_mapping_rows(a65b125e17ff95,[]).
x_arity(x_reviseStrategy,3) :- x_cid(a65b125e17ff96).
xc_microtheory(a65b125e17ff96,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff96,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff96,614).
xc_kb_names(a65b125e17ff96,[]).
xc_mapping_rows(a65b125e17ff96,[]).
x_arg1Isa(x_reviseStrategy,x_Microtheory) :- x_cid(a65b125e17ff97).
xc_microtheory(a65b125e17ff97,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff97,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff97,615).
xc_kb_names(a65b125e17ff97,[]).
xc_mapping_rows(a65b125e17ff97,[]).
x_arg2Isa(x_reviseStrategy,x_Goal) :- x_cid(a65b125e17ff98).
xc_microtheory(a65b125e17ff98,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff98,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff98,616).
xc_kb_names(a65b125e17ff98,[]).
xc_mapping_rows(a65b125e17ff98,[]).
x_arg3Isa(x_reviseStrategy,x_Strategy) :- x_cid(a65b125e17ff99).
xc_microtheory(a65b125e17ff99,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff99,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff99,617).
xc_kb_names(a65b125e17ff99,[]).
xc_mapping_rows(a65b125e17ff99,[]).
x_comment(x_reviseStrategy,"(reviseStrategy ?mt ?goal ?strategy) updates failing ?strategy to better achieve ?goal.") :- x_cid(a65b125e17ff9a).
xc_microtheory(a65b125e17ff9a,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff9a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff9a,618).
xc_kb_names(a65b125e17ff9a,[]).
xc_mapping_rows(a65b125e17ff9a,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_reviseStrategy(V1,V2,V3),x_actionSequence(x_TheList))) :- x_cid(a65b125e17ff9b,V1,V2,V3).
xc_microtheory(a65b125e17ff9b,x_PerceptualAgentMt).
xc_source_file(a65b125e17ff9b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/reflective-player.krf').
xc_source_line(a65b125e17ff9b,623).
xc_kb_names(a65b125e17ff9b,["?mt","?goal","?strategy"]).
xc_mapping_rows(a65b125e17ff9b,[]).
kb_cache_footer(footer{count:141,digest:'1a181c4e9f7b4864e5efa3f4549ada8c52b40cac8abafc862f47bc4f95f2ba0a',headerDigest:'6c72d88812fc1d514e1610d60beb6d59bd1a819f1f0886ebd6d1602b67b70f00'}).
