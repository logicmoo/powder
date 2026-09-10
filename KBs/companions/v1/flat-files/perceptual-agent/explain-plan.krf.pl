:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:154,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:649,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'2755259d927962856220c5813e81e67f32fddbdaebde283648f97666bf14d2f5',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:28087,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf',sourceHash:'74fb27b2bbeea9fdb6d40e4ac0cdf6d767837d8b52eef6dccbab43faef4219ee',warnings:[]}).
x_isa(x_explainPlan,x_ComplexActionPredicate) :- x_cid(a65b132a2cbf1c).
xc_microtheory(a65b132a2cbf1c,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf1c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf1c,32).
xc_kb_names(a65b132a2cbf1c,[]).
xc_mapping_rows(a65b132a2cbf1c,[]).
x_arity(x_explainPlan,4) :- x_cid(a65b132a2cbf1d).
xc_microtheory(a65b132a2cbf1d,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf1d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf1d,33).
xc_kb_names(a65b132a2cbf1d,[]).
xc_mapping_rows(a65b132a2cbf1d,[]).
x_arg1Isa(x_explainPlan,x_Microtheory) :- x_cid(a65b132a2cbf1e).
xc_microtheory(a65b132a2cbf1e,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf1e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf1e,34).
xc_kb_names(a65b132a2cbf1e,[]).
xc_mapping_rows(a65b132a2cbf1e,[]).
x_arg2Isa(x_explainPlan,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbf1f).
xc_microtheory(a65b132a2cbf1f,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf1f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf1f,35).
xc_kb_names(a65b132a2cbf1f,[]).
xc_mapping_rows(a65b132a2cbf1f,[]).
x_arg3Isa(x_explainPlan,'x_CycLSentence-Assertible') :- x_cid(a65b132a2cbf20).
xc_microtheory(a65b132a2cbf20,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf20,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf20,36).
xc_kb_names(a65b132a2cbf20,[]).
xc_mapping_rows(a65b132a2cbf20,[]).
x_arg4Isa(x_explainPlan,x_TimeInterval) :- x_cid(a65b132a2cbf21).
xc_microtheory(a65b132a2cbf21,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf21,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf21,37).
xc_kb_names(a65b132a2cbf21,[]).
xc_mapping_rows(a65b132a2cbf21,[]).
x_comment(x_explainPlan,"(explainPlan ?mt ?cmd ?operator ?when) attempts to explain a user action in terms of known goals and qualitative models.") :- x_cid(a65b132a2cbf22).
xc_microtheory(a65b132a2cbf22,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf22,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf22,38).
xc_kb_names(a65b132a2cbf22,[]).
xc_mapping_rows(a65b132a2cbf22,[]).
x_preconditionForMethod(x_continuationOfGoal(V1,V2,V3),x_methodForAction(x_explainPlan(V1,V2,V3,V4),x_actionSequence(x_TheList(x_doAnnounce("~%Continues prior plan.",[]))))) :- x_cid(a65b132a2cbf23,V1,V2,V3,V4).
xc_microtheory(a65b132a2cbf23,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf23,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf23,41).
xc_kb_names(a65b132a2cbf23,["?mt","?cmd","?operator","?when"]).
xc_mapping_rows(a65b132a2cbf23,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 47, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132a2cbf23,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 47, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_continuationOfGoal(V1,V2,V3)),x_numAnswers(1,x_currentDomain(V4)),x_unifies(V5,x_LearnedKnowledgeMtFn(V4)),x_operatorFormulas(V6,V3)),x_methodForAction(x_explainPlan(V1,V2,V3,V7),x_actionSequence(x_TheList(x_doAnnounce("~%Posting learning goals.",[]),x_postActionLearningGoal(V5,V6),x_postPurposeLearningGoal(V5,V6))))) :- x_cid(a65b132a2cbf24,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b132a2cbf24,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf24,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf24,51).
xc_kb_names(a65b132a2cbf24,["?mt","?cmd","?operator","?domain","?lkmt","?action-pred","?when"]).
xc_mapping_rows(a65b132a2cbf24,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 61, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132a2cbf24,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 61, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_explainPlan(V1,V2,V3,V4),x_actionSequence(x_TheList(x_predictAgentGoals(V1,V2,V3,V4),x_doAgentPlan(x_actionSequence(x_TheList(x_inferPlansFor(V1,V2,V3,V4)))))))) :- x_cid(a65b132a2cbf25,V1,V2,V3,V4).
xc_microtheory(a65b132a2cbf25,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf25,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf25,67).
xc_kb_names(a65b132a2cbf25,["?mt","?cmd","?operator","?when"]).
xc_mapping_rows(a65b132a2cbf25,[]).
x_preconditionForMethod(x_and(x_numAnswers(1,x_currentDomain(V1)),x_unifies(V2,x_LearnedKnowledgeMtFn(V1)),x_unifies(V3,x_SpindleMtFn(V1,x_Influences)),x_lookupOnly('x_ist-Information'(V4,x_performanceGoalForGame(V4,V5))),x_lookupOnly('x_ist-Information'(V4,x_goalName(V6,V5))),x_uninferredSentence(x_inactiveStartingGoal(V4,V6))),x_methodForAction(x_explainPlan(V4,V7,V8,V9),x_actionSequence(x_TheList(x_explainActionWRTGoal(V4,V3,V7,V8,x_TheSet(V6),x_TheSet,10),x_doAgentPlan(x_actionSequence(x_TheList(x_inferPlansFor(V4,V7,V8,V9)))))))) :- x_cid(a65b132a2cbf26,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b132a2cbf26,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf26,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf26,85).
xc_kb_names(a65b132a2cbf26,["?domain","?lkmt","?spindle","?mt","?goal-rep","?goal","?cmd","?operator","?when"]).
xc_mapping_rows(a65b132a2cbf26,[]).
'x_<=='(x_preferInContext(x_explainPlan(V1,V2,V3,V4),V5,V6),x_someArgumentHasPredicate(V5,x_doAnnounce),x_noArgumentHasPredicate(V5,x_postPurposeLearningGoal)) :- x_cid(a65b132a2cbf27,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b132a2cbf27,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf27,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf27,109).
xc_kb_names(a65b132a2cbf27,["?mt","?cmd","?operator","?when","?seq1","?seq2"]).
xc_mapping_rows(a65b132a2cbf27,[]).
'x_<=='(x_preferInContext(x_explainPlan(V1,V2,V3,V4),V5,V6),x_someArgumentHasPredicate(V5,x_predictAgentGoals)) :- x_cid(a65b132a2cbf28,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b132a2cbf28,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf28,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf28,113).
xc_kb_names(a65b132a2cbf28,["?mt","?cmd","?operator","?when","?seq1","?seq2"]).
xc_mapping_rows(a65b132a2cbf28,[]).
x_isa(x_predictAgentGoals,x_ComplexActionPredicate) :- x_cid(a65b132a2cbf29).
xc_microtheory(a65b132a2cbf29,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf29,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf29,116).
xc_kb_names(a65b132a2cbf29,[]).
xc_mapping_rows(a65b132a2cbf29,[]).
x_arity(x_predictAgentGoals,4) :- x_cid(a65b132a2cbf2a).
xc_microtheory(a65b132a2cbf2a,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf2a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf2a,117).
xc_kb_names(a65b132a2cbf2a,[]).
xc_mapping_rows(a65b132a2cbf2a,[]).
x_arg1Isa(x_predictAgentGoals,x_Microtheory) :- x_cid(a65b132a2cbf2b).
xc_microtheory(a65b132a2cbf2b,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf2b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf2b,118).
xc_kb_names(a65b132a2cbf2b,[]).
xc_mapping_rows(a65b132a2cbf2b,[]).
x_arg2Isa(x_predictAgentGoals,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbf2c).
xc_microtheory(a65b132a2cbf2c,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf2c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf2c,119).
xc_kb_names(a65b132a2cbf2c,[]).
xc_mapping_rows(a65b132a2cbf2c,[]).
x_arg3Isa(x_predictAgentGoals,x_CycLExpression) :- x_cid(a65b132a2cbf2d).
xc_microtheory(a65b132a2cbf2d,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf2d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf2d,120).
xc_kb_names(a65b132a2cbf2d,[]).
xc_mapping_rows(a65b132a2cbf2d,[]).
x_arg4Isa(x_predictAgentGoals,x_TimeInterval) :- x_cid(a65b132a2cbf2e).
xc_microtheory(a65b132a2cbf2e,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf2e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf2e,121).
xc_kb_names(a65b132a2cbf2e,[]).
xc_mapping_rows(a65b132a2cbf2e,[]).
x_comment(x_predictAgentGoals,"(predictAgentGoals ?mt ?cmd ?operator ?when) is bottom-up explanation of an action based on what plans it could be part of.") :- x_cid(a65b132a2cbf2f).
xc_microtheory(a65b132a2cbf2f,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf2f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf2f,122).
xc_kb_names(a65b132a2cbf2f,[]).
xc_mapping_rows(a65b132a2cbf2f,[]).
x_preconditionForMethod(x_and('x_ist-Information'(V1,x_operatorAssignsAgent(V2,V3)),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_and(x_hypothesizePlan(V2,V6),x_unifies(x_methodForAction(V7,V8),V6),x_complexTaskAchieves(V3,V5,V7)))),x_unifies(x_TheSet(V9),V4)),x_methodForAction(x_predictAgentGoals(V1,V10,V2,V11),x_actionSequence(x_TheList(x_doAnnounce("Most likely subgoal is ~s",[V9]),x_doRecord('x_ist-Information'(V1,x_hypothesizedGoal(V3,V10,V2,V9))))))) :- x_cid(a65b132a2cbf30,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b132a2cbf30,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf30,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf30,136).
xc_kb_names(a65b132a2cbf30,["?mt","?operator","?actor","?hyp-subgoals","?subgoal","?plan","?task","?meth","?hyp-goal","?cmd","?when"]).
xc_mapping_rows(a65b132a2cbf30,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 149, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132a2cbf30,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 149, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_TheClosedRetrievalSetOf(V2,x_and(x_explainsAction(V3,V4,V5,V6),x_unifies(V2,x_hypothesizedGoal(V7,V4,V8,V6))))),x_different(V1,x_TheSet)),x_methodForAction(x_predictAgentGoals(V3,V4,V8,V9),x_actionSequence(x_TheList(x_doRecordMembersInContext(V3,V1))))) :- x_cid(a65b132a2cbf31,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b132a2cbf31,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf31,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf31,163).
xc_kb_names(a65b132a2cbf31,["?goal-stmts","?goal-stmt","?mt","?cmd","?action","?goal","?actor","?operator","?when"]).
xc_mapping_rows(a65b132a2cbf31,[]).
x_isa(x_nonObviousGoals,x_TernaryPredicate) :- x_cid(a65b132a2cbf32).
xc_microtheory(a65b132a2cbf32,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf32,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf32,183).
xc_kb_names(a65b132a2cbf32,[]).
xc_mapping_rows(a65b132a2cbf32,[]).
x_arity(x_nonObviousGoals,3) :- x_cid(a65b132a2cbf33).
xc_microtheory(a65b132a2cbf33,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf33,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf33,184).
xc_kb_names(a65b132a2cbf33,[]).
xc_mapping_rows(a65b132a2cbf33,[]).
x_arg1Isa(x_nonObviousGoals,x_SimpleActionPredicate) :- x_cid(a65b132a2cbf34).
xc_microtheory(a65b132a2cbf34,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf34,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf34,185).
xc_kb_names(a65b132a2cbf34,[]).
xc_mapping_rows(a65b132a2cbf34,[]).
x_arg2Isa(x_nonObviousGoals,'x_Set-Mathematical') :- x_cid(a65b132a2cbf35).
xc_microtheory(a65b132a2cbf35,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf35,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf35,186).
xc_kb_names(a65b132a2cbf35,[]).
xc_mapping_rows(a65b132a2cbf35,[]).
x_arg3Isa(x_nonObviousGoals,'x_Set-Mathematical') :- x_cid(a65b132a2cbf36).
xc_microtheory(a65b132a2cbf36,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf36,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf36,187).
xc_kb_names(a65b132a2cbf36,[]).
xc_mapping_rows(a65b132a2cbf36,[]).
x_comment(x_nonObviousGoals,"(nonObviousGoals ?action-pred ?candidate-actions ?possible-goals) filters ?candidate-actions to (TheSet) if it includes ?action-pred.") :- x_cid(a65b132a2cbf37).
xc_microtheory(a65b132a2cbf37,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf37,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf37,188).
xc_kb_names(a65b132a2cbf37,[]).
xc_mapping_rows(a65b132a2cbf37,[]).
'x_<=='(x_nonObviousGoals(V1,V2,x_TheSet),x_lookupOnly(x_elementOf(V1,V2))) :- x_cid(a65b132a2cbf38,V1,V2).
xc_microtheory(a65b132a2cbf38,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf38,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf38,190).
xc_kb_names(a65b132a2cbf38,["?action-pred","?capabilities"]).
xc_mapping_rows(a65b132a2cbf38,[]).
'x_<=='(x_nonObviousGoals(V1,V2,V2),x_not(x_lookupOnly(x_elementOf(V1,V2)))) :- x_cid(a65b132a2cbf39,V1,V2).
xc_microtheory(a65b132a2cbf39,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf39,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf39,193).
xc_kb_names(a65b132a2cbf39,["?action-pred","?capabilities"]).
xc_mapping_rows(a65b132a2cbf39,[]).
x_isa(x_operatorAssignsAgent,x_BinaryPredicate) :- x_cid(a65b132a2cbf3a).
xc_microtheory(a65b132a2cbf3a,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf3a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf3a,196).
xc_kb_names(a65b132a2cbf3a,[]).
xc_mapping_rows(a65b132a2cbf3a,[]).
x_arity(x_operatorAssignsAgent,2) :- x_cid(a65b132a2cbf3b).
xc_microtheory(a65b132a2cbf3b,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf3b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf3b,197).
xc_kb_names(a65b132a2cbf3b,[]).
xc_mapping_rows(a65b132a2cbf3b,[]).
x_arg1Isa(x_operatorAssignsAgent,'x_CycLSentence-Assertible') :- x_cid(a65b132a2cbf3c).
xc_microtheory(a65b132a2cbf3c,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf3c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf3c,198).
xc_kb_names(a65b132a2cbf3c,[]).
xc_mapping_rows(a65b132a2cbf3c,[]).
x_arg2Isa(x_operatorAssignsAgent,'x_Agent-Generic') :- x_cid(a65b132a2cbf3d).
xc_microtheory(a65b132a2cbf3d,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf3d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf3d,199).
xc_kb_names(a65b132a2cbf3d,[]).
xc_mapping_rows(a65b132a2cbf3d,[]).
x_comment(x_operatorAssignsAgent,"(operatorAssignsAgent ?operator ?agent) means the primitive task ?operator assigns its first argument (an Agent-Generic) to do something.") :- x_cid(a65b132a2cbf3e).
xc_microtheory(a65b132a2cbf3e,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf3e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf3e,200).
xc_kb_names(a65b132a2cbf3e,[]).
xc_mapping_rows(a65b132a2cbf3e,[]).
'x_<=='(x_operatorAssignsAgent(V1,V2),x_formulaArgument(V1,1,V2),x_isa(V2,'x_Agent-Generic')) :- x_cid(a65b132a2cbf3f,V1,V2).
xc_microtheory(a65b132a2cbf3f,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf3f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf3f,202).
xc_kb_names(a65b132a2cbf3f,["?operator","?entity"]).
xc_mapping_rows(a65b132a2cbf3f,[]).
x_isa(x_uniqueCapability,x_BinaryPredicate) :- x_cid(a65b132a2cbf40).
xc_microtheory(a65b132a2cbf40,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf40,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf40,206).
xc_kb_names(a65b132a2cbf40,[]).
xc_mapping_rows(a65b132a2cbf40,[]).
x_arity(x_uniqueCapability,2) :- x_cid(a65b132a2cbf41).
xc_microtheory(a65b132a2cbf41,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf41,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf41,207).
xc_kb_names(a65b132a2cbf41,[]).
xc_mapping_rows(a65b132a2cbf41,[]).
x_arg1Isa(x_uniqueCapability,x_Thing) :- x_cid(a65b132a2cbf42).
xc_microtheory(a65b132a2cbf42,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf42,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf42,208).
xc_kb_names(a65b132a2cbf42,[]).
xc_mapping_rows(a65b132a2cbf42,[]).
x_arg2Isa(x_uniqueCapability,x_SimpleActionPredicate) :- x_cid(a65b132a2cbf43).
xc_microtheory(a65b132a2cbf43,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf43,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf43,209).
xc_kb_names(a65b132a2cbf43,[]).
xc_mapping_rows(a65b132a2cbf43,[]).
'x_<=='(x_uniqueCapability(V1,V2),x_executionContext(V3),'x_ist-Information'(V3,x_nonTransitiveInference(x_isa(V1,V4))),x_actionPrimitive(V2),x_arg1Isa(V2,V4)) :- x_cid(a65b132a2cbf44,V1,V2,V3,V4).
xc_microtheory(a65b132a2cbf44,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf44,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf44,214).
xc_kb_names(a65b132a2cbf44,["?entity","?pred","?mt","?entity-type"]).
xc_mapping_rows(a65b132a2cbf44,[]).
x_isa(x_continuationOfGoal,x_TernaryPredicate) :- x_cid(a65b132a2cbf45).
xc_microtheory(a65b132a2cbf45,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf45,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf45,228).
xc_kb_names(a65b132a2cbf45,[]).
xc_mapping_rows(a65b132a2cbf45,[]).
x_arity(x_continuationOfGoal,3) :- x_cid(a65b132a2cbf46).
xc_microtheory(a65b132a2cbf46,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf46,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf46,229).
xc_kb_names(a65b132a2cbf46,[]).
xc_mapping_rows(a65b132a2cbf46,[]).
x_arg1Isa(x_continuationOfGoal,x_Microtheory) :- x_cid(a65b132a2cbf47).
xc_microtheory(a65b132a2cbf47,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf47,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf47,230).
xc_kb_names(a65b132a2cbf47,[]).
xc_mapping_rows(a65b132a2cbf47,[]).
x_arg2Isa(x_continuationOfGoal,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbf48).
xc_microtheory(a65b132a2cbf48,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf48,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf48,231).
xc_kb_names(a65b132a2cbf48,[]).
xc_mapping_rows(a65b132a2cbf48,[]).
x_arg3Isa(x_continuationOfGoal,x_CycLExpression) :- x_cid(a65b132a2cbf49).
xc_microtheory(a65b132a2cbf49,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf49,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf49,232).
xc_kb_names(a65b132a2cbf49,[]).
xc_mapping_rows(a65b132a2cbf49,[]).
x_comment(x_continuationOfGoal,"(continuationOfGoal ?mt ?cmd ?operator) succeeds if ?operator continues pursuit of a prior goal.") :- x_cid(a65b132a2cbf4a).
xc_microtheory(a65b132a2cbf4a,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf4a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf4a,233).
xc_kb_names(a65b132a2cbf4a,[]).
xc_mapping_rows(a65b132a2cbf4a,[]).
'x_<=='(x_continuationOfGoal(V1,V2,V3),'x_ist-Information'(V1,x_operatorAssignsAgent(V3,V4)),x_latestHypothesizedGoalFor(V1,V4,V2,V5,V6),x_operatorFormulas(V7,V3),x_operatorFormulas(V7,V5),x_uninferredSentence(x_argumentSpecific(V6,V5,V3))) :- x_cid(a65b132a2cbf4b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b132a2cbf4b,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf4b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf4b,236).
xc_kb_names(a65b132a2cbf4b,["?mt","?cmd","?operator","?actor","?prior-op","?goal","?action-pred"]).
xc_mapping_rows(a65b132a2cbf4b,[]).
x_isa(x_argumentSpecific,x_TernaryPredicate) :- x_cid(a65b132a2cbf4c).
xc_microtheory(a65b132a2cbf4c,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf4c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf4c,245).
xc_kb_names(a65b132a2cbf4c,[]).
xc_mapping_rows(a65b132a2cbf4c,[]).
x_arity(x_argumentSpecific,3) :- x_cid(a65b132a2cbf4d).
xc_microtheory(a65b132a2cbf4d,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf4d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf4d,246).
xc_kb_names(a65b132a2cbf4d,[]).
xc_mapping_rows(a65b132a2cbf4d,[]).
x_arg1Isa(x_argumentSpecific,x_CycLFormula) :- x_cid(a65b132a2cbf4e).
xc_microtheory(a65b132a2cbf4e,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf4e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf4e,247).
xc_kb_names(a65b132a2cbf4e,[]).
xc_mapping_rows(a65b132a2cbf4e,[]).
x_arg2Isa(x_argumentSpecific,x_CycLFormula) :- x_cid(a65b132a2cbf4f).
xc_microtheory(a65b132a2cbf4f,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf4f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf4f,248).
xc_kb_names(a65b132a2cbf4f,[]).
xc_mapping_rows(a65b132a2cbf4f,[]).
x_arg3Isa(x_argumentSpecific,x_CycLFormula) :- x_cid(a65b132a2cbf50).
xc_microtheory(a65b132a2cbf50,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf50,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf50,249).
xc_kb_names(a65b132a2cbf50,[]).
xc_mapping_rows(a65b132a2cbf50,[]).
x_comment(x_argumentSpecific,"(argumentSpecific ?statement ?operator1 ?operator2) succeeds if some argument of ?op1 differs from the corresponding argument in ?op2 and is mentioned in ?statement.") :- x_cid(a65b132a2cbf51).
xc_microtheory(a65b132a2cbf51,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf51,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf51,250).
xc_kb_names(a65b132a2cbf51,[]).
xc_mapping_rows(a65b132a2cbf51,[]).
'x_<=='(x_argumentSpecific(V1,V2,V3),x_formulaArgument(V2,V4,V5),x_formulaArgument(V3,V4,V6),x_different(V5,V6),x_containsPattern(V5,V1)) :- x_cid(a65b132a2cbf52,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b132a2cbf52,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf52,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf52,253).
xc_kb_names(a65b132a2cbf52,["?goal","?op1","?op2","?n","?term","?other-term"]).
xc_mapping_rows(a65b132a2cbf52,[]).
x_isa(x_hypothesizePlan,x_BinaryPredicate) :- x_cid(a65b132a2cbf53).
xc_microtheory(a65b132a2cbf53,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf53,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf53,262).
xc_kb_names(a65b132a2cbf53,[]).
xc_mapping_rows(a65b132a2cbf53,[]).
x_arity(x_hypothesizePlan,2) :- x_cid(a65b132a2cbf54).
xc_microtheory(a65b132a2cbf54,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf54,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf54,263).
xc_kb_names(a65b132a2cbf54,[]).
xc_mapping_rows(a65b132a2cbf54,[]).
x_arg1Isa(x_hypothesizePlan,x_CycLExpression) :- x_cid(a65b132a2cbf55).
xc_microtheory(a65b132a2cbf55,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf55,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf55,264).
xc_kb_names(a65b132a2cbf55,[]).
xc_mapping_rows(a65b132a2cbf55,[]).
x_arg2Isa(x_hypothesizePlan,x_CycLExpression) :- x_cid(a65b132a2cbf56).
xc_microtheory(a65b132a2cbf56,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf56,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf56,265).
xc_kb_names(a65b132a2cbf56,[]).
xc_mapping_rows(a65b132a2cbf56,[]).
'x_<=='(x_hypothesizePlan(V1,V2),x_planningContext(V3),x_operatorFormulas(V4,V1),x_planReferences(V5,V4),x_subexpressionMatching(V1,V5,V6),x_formulaArgument(V1,1,V7),x_formulaArgument(V6,1,V8),x_unifies(V8,V7),x_unifies(V2,V5)) :- x_cid(a65b132a2cbf57,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b132a2cbf57,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf57,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf57,267).
xc_kb_names(a65b132a2cbf57,["?operator","?inst-plan","?ctxt","?prim","?plan","?expt","?inst-arg","?var-arg"]).
xc_mapping_rows(a65b132a2cbf57,[]).
x_isa(x_hypothesizedGoal,x_QuaternaryPredicate) :- x_cid(a65b132a2cbf58).
xc_microtheory(a65b132a2cbf58,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf58,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf58,304).
xc_kb_names(a65b132a2cbf58,[]).
xc_mapping_rows(a65b132a2cbf58,[]).
x_arity(x_hypothesizedGoal,4) :- x_cid(a65b132a2cbf59).
xc_microtheory(a65b132a2cbf59,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf59,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf59,305).
xc_kb_names(a65b132a2cbf59,[]).
xc_mapping_rows(a65b132a2cbf59,[]).
x_arg1Isa(x_hypothesizedGoal,'x_Agent-Generic') :- x_cid(a65b132a2cbf5a).
xc_microtheory(a65b132a2cbf5a,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf5a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf5a,306).
xc_kb_names(a65b132a2cbf5a,[]).
xc_mapping_rows(a65b132a2cbf5a,[]).
x_arg2Isa(x_hypothesizedGoal,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbf5b).
xc_microtheory(a65b132a2cbf5b,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf5b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf5b,307).
xc_kb_names(a65b132a2cbf5b,[]).
xc_mapping_rows(a65b132a2cbf5b,[]).
x_arg3Isa(x_hypothesizedGoal,'x_CycLSentence-Assertible') :- x_cid(a65b132a2cbf5c).
xc_microtheory(a65b132a2cbf5c,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf5c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf5c,308).
xc_kb_names(a65b132a2cbf5c,[]).
xc_mapping_rows(a65b132a2cbf5c,[]).
x_arg4Isa(x_hypothesizedGoal,x_PerformanceGoal) :- x_cid(a65b132a2cbf5d).
xc_microtheory(a65b132a2cbf5d,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf5d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf5d,309).
xc_kb_names(a65b132a2cbf5d,[]).
xc_mapping_rows(a65b132a2cbf5d,[]).
x_comment(x_hypothesizedGoal,"(hypothesizedGoal ?actor ?cmd ?operator ?performance-goal) records hypothesized goals.") :- x_cid(a65b132a2cbf5e).
xc_microtheory(a65b132a2cbf5e,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf5e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf5e,310).
xc_kb_names(a65b132a2cbf5e,[]).
xc_mapping_rows(a65b132a2cbf5e,[]).
x_isa(x_goalHierarchy,x_TernaryRelation) :- x_cid(a65b132a2cbf5f).
xc_microtheory(a65b132a2cbf5f,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf5f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf5f,314).
xc_kb_names(a65b132a2cbf5f,[]).
xc_mapping_rows(a65b132a2cbf5f,[]).
x_arity(x_goalHierarchy,3) :- x_cid(a65b132a2cbf60).
xc_microtheory(a65b132a2cbf60,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf60,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf60,315).
xc_kb_names(a65b132a2cbf60,[]).
xc_mapping_rows(a65b132a2cbf60,[]).
x_arg1Isa(x_goalHierarchy,x_Goal) :- x_cid(a65b132a2cbf61).
xc_microtheory(a65b132a2cbf61,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf61,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf61,316).
xc_kb_names(a65b132a2cbf61,[]).
xc_mapping_rows(a65b132a2cbf61,[]).
x_arg2Isa(x_goalHierarchy,x_Goal) :- x_cid(a65b132a2cbf62).
xc_microtheory(a65b132a2cbf62,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf62,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf62,317).
xc_kb_names(a65b132a2cbf62,[]).
xc_mapping_rows(a65b132a2cbf62,[]).
x_arg3Isa(x_goalHierarchy,x_List) :- x_cid(a65b132a2cbf63).
xc_microtheory(a65b132a2cbf63,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf63,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf63,318).
xc_kb_names(a65b132a2cbf63,[]).
xc_mapping_rows(a65b132a2cbf63,[]).
x_comment(x_goalHierarchy,"(goalHierarchyFor ?subgoal ?parent-goal ?goal-stack) represents the goal stack hierarchy from ?subgoal to ?parent-goal.") :- x_cid(a65b132a2cbf64).
xc_microtheory(a65b132a2cbf64,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf64,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf64,319).
xc_kb_names(a65b132a2cbf64,[]).
xc_mapping_rows(a65b132a2cbf64,[]).
x_isa(x_relevantPriorOperator,x_Predicate) :- x_cid(a65b132a2cbf65).
xc_microtheory(a65b132a2cbf65,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf65,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf65,339).
xc_kb_names(a65b132a2cbf65,[]).
xc_mapping_rows(a65b132a2cbf65,[]).
x_arity(x_relevantPriorOperator,6) :- x_cid(a65b132a2cbf66).
xc_microtheory(a65b132a2cbf66,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf66,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf66,340).
xc_kb_names(a65b132a2cbf66,[]).
xc_mapping_rows(a65b132a2cbf66,[]).
x_arg1Isa(x_relevantPriorOperator,x_Microtheory) :- x_cid(a65b132a2cbf67).
xc_microtheory(a65b132a2cbf67,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf67,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf67,341).
xc_kb_names(a65b132a2cbf67,[]).
xc_mapping_rows(a65b132a2cbf67,[]).
x_arg2Isa(x_relevantPriorOperator,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbf68).
xc_microtheory(a65b132a2cbf68,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf68,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf68,342).
xc_kb_names(a65b132a2cbf68,[]).
xc_mapping_rows(a65b132a2cbf68,[]).
x_arg3Isa(x_relevantPriorOperator,'x_CycLSentence-Assertible') :- x_cid(a65b132a2cbf69).
xc_microtheory(a65b132a2cbf69,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf69,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf69,343).
xc_kb_names(a65b132a2cbf69,[]).
xc_mapping_rows(a65b132a2cbf69,[]).
x_arg4Isa(x_relevantPriorOperator,x_TimeInterval) :- x_cid(a65b132a2cbf6a).
xc_microtheory(a65b132a2cbf6a,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf6a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf6a,344).
xc_kb_names(a65b132a2cbf6a,[]).
xc_mapping_rows(a65b132a2cbf6a,[]).
x_arg5Isa(x_relevantPriorOperator,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbf6b).
xc_microtheory(a65b132a2cbf6b,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf6b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf6b,345).
xc_kb_names(a65b132a2cbf6b,[]).
xc_mapping_rows(a65b132a2cbf6b,[]).
x_arg6Isa(x_relevantPriorOperator,'x_CycLSentence-Assertible') :- x_cid(a65b132a2cbf6c).
xc_microtheory(a65b132a2cbf6c,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf6c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf6c,346).
xc_kb_names(a65b132a2cbf6c,[]).
xc_mapping_rows(a65b132a2cbf6c,[]).
x_comment(x_relevantPriorOperator,"(relevantPriorOperator ?mt ?later-cmd ?later-operator ?when ?earlier-cmd ?earlier-operator) collects the fringe of operators that enabled the later operator") :- x_cid(a65b132a2cbf6d).
xc_microtheory(a65b132a2cbf6d,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf6d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf6d,347).
xc_kb_names(a65b132a2cbf6d,[]).
xc_mapping_rows(a65b132a2cbf6d,[]).
'x_<=='(x_relevantPriorOperator(V1,V2,V3,V4,V5,V6),x_resourceConsumedBy(V1,V2,V3,V7),x_resourceProducedBy(V1,V2,V3,V7,V5,V6),x_lookupOnly(x_localOnly(x_numAnswers(1,x_dateOfEvent(V5,V4))))) :- x_cid(a65b132a2cbf6e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b132a2cbf6e,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf6e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf6e,366).
xc_kb_names(a65b132a2cbf6e,["?mt","?later-cmd","?later-operator","?when","?earlier-cmd","?earlier-operator","?resource"]).
xc_mapping_rows(a65b132a2cbf6e,[]).
x_isa(x_resourceConsumedBy,x_QuaternaryPredicate) :- x_cid(a65b132a2cbf6f).
xc_microtheory(a65b132a2cbf6f,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf6f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf6f,375).
xc_kb_names(a65b132a2cbf6f,[]).
xc_mapping_rows(a65b132a2cbf6f,[]).
x_arity(x_resourceConsumedBy,4) :- x_cid(a65b132a2cbf70).
xc_microtheory(a65b132a2cbf70,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf70,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf70,376).
xc_kb_names(a65b132a2cbf70,[]).
xc_mapping_rows(a65b132a2cbf70,[]).
x_arg1Isa(x_resourceConsumedBy,x_Microtheory) :- x_cid(a65b132a2cbf71).
xc_microtheory(a65b132a2cbf71,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf71,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf71,377).
xc_kb_names(a65b132a2cbf71,[]).
xc_mapping_rows(a65b132a2cbf71,[]).
x_arg2Isa(x_resourceConsumedBy,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbf72).
xc_microtheory(a65b132a2cbf72,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf72,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf72,378).
xc_kb_names(a65b132a2cbf72,[]).
xc_mapping_rows(a65b132a2cbf72,[]).
x_arg3Isa(x_resourceConsumedBy,'x_CycLSentence-Assertible') :- x_cid(a65b132a2cbf73).
xc_microtheory(a65b132a2cbf73,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf73,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf73,379).
xc_kb_names(a65b132a2cbf73,[]).
xc_mapping_rows(a65b132a2cbf73,[]).
x_arg4Isa(x_resourceConsumedBy,x_SomethingExisting) :- x_cid(a65b132a2cbf74).
xc_microtheory(a65b132a2cbf74,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf74,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf74,380).
xc_kb_names(a65b132a2cbf74,[]).
xc_mapping_rows(a65b132a2cbf74,[]).
x_comment(x_resourceConsumedBy,"(resourceConsumedBy ?mt ?cmd ?operator ?resource) means ?actor was destroyed as a byproduct of performing ?operator.") :- x_cid(a65b132a2cbf75).
xc_microtheory(a65b132a2cbf75,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf75,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf75,381).
xc_kb_names(a65b132a2cbf75,[]).
xc_mapping_rows(a65b132a2cbf75,[]).
'x_<=='(x_resourceConsumedBy(V1,V2,V3,V4),x_formulaArgument(V3,V5,V4),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(V2,V6))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_inputsDestroyed(V7,V4))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(V7,V6))))),x_numAnswers(1,x_priorCommand(V1,V7,V2))) :- x_cid(a65b132a2cbf76,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b132a2cbf76,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf76,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf76,383).
xc_kb_names(a65b132a2cbf76,["?mt","?cmd","?operator","?resource","?argnum","?when","?evt"]).
xc_mapping_rows(a65b132a2cbf76,[]).
x_isa(x_resourceProducedBy,x_Predicate) :- x_cid(a65b132a2cbf77).
xc_microtheory(a65b132a2cbf77,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf77,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf77,407).
xc_kb_names(a65b132a2cbf77,[]).
xc_mapping_rows(a65b132a2cbf77,[]).
x_arity(x_resourceProducedBy,6) :- x_cid(a65b132a2cbf78).
xc_microtheory(a65b132a2cbf78,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf78,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf78,408).
xc_kb_names(a65b132a2cbf78,[]).
xc_mapping_rows(a65b132a2cbf78,[]).
x_arg1Isa(x_resourceProducedBy,x_Microtheory) :- x_cid(a65b132a2cbf79).
xc_microtheory(a65b132a2cbf79,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf79,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf79,409).
xc_kb_names(a65b132a2cbf79,[]).
xc_mapping_rows(a65b132a2cbf79,[]).
x_arg2Isa(x_resourceProducedBy,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbf7a).
xc_microtheory(a65b132a2cbf7a,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf7a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf7a,410).
xc_kb_names(a65b132a2cbf7a,[]).
xc_mapping_rows(a65b132a2cbf7a,[]).
x_arg3Isa(x_resourceProducedBy,'x_CycLSentence-Assertible') :- x_cid(a65b132a2cbf7b).
xc_microtheory(a65b132a2cbf7b,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf7b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf7b,411).
xc_kb_names(a65b132a2cbf7b,[]).
xc_mapping_rows(a65b132a2cbf7b,[]).
x_arg4Isa(x_resourceProducedBy,x_SomethingExisting) :- x_cid(a65b132a2cbf7c).
xc_microtheory(a65b132a2cbf7c,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf7c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf7c,412).
xc_kb_names(a65b132a2cbf7c,[]).
xc_mapping_rows(a65b132a2cbf7c,[]).
x_arg5Isa(x_resourceProducedBy,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbf7d).
xc_microtheory(a65b132a2cbf7d,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf7d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf7d,413).
xc_kb_names(a65b132a2cbf7d,[]).
xc_mapping_rows(a65b132a2cbf7d,[]).
x_arg6Isa(x_resourceProducedBy,'x_CycLSentence-Assertible') :- x_cid(a65b132a2cbf7e).
xc_microtheory(a65b132a2cbf7e,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf7e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf7e,414).
xc_kb_names(a65b132a2cbf7e,[]).
xc_mapping_rows(a65b132a2cbf7e,[]).
x_comment(x_resourceProducedBy,"(resourceProducedBy ?mt ?later-cmd ?later-operator ?resource ?earlier-cmd ?earlier-operator) means ?actor was destroyed as a byproduct of performing ?operator.") :- x_cid(a65b132a2cbf7f).
xc_microtheory(a65b132a2cbf7f,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf7f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf7f,415).
xc_kb_names(a65b132a2cbf7f,[]).
xc_mapping_rows(a65b132a2cbf7f,[]).
'x_<=='(x_resourceProducedBy(V1,V2,V3,V4,V5,V6),x_not(x_variableExpression(V4)),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_outputsCreated(V7,V4))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(V7,V8))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_doneBy(V7,V9))))),x_currentDomain(V10),x_unifies(V11,x_ActionModelMtFn(V10)),x_operatorFormulas(V12,V3),x_lookupOnly(x_localOnly(x_cacheComplete('x_ist-Information'(V11,x_enablementRelation(V13,x_resourceTypeAvailable(V14,V15),V12))))),'x_ist-Information'(V1,x_isa(V4,V15)),x_numAnswers(1,x_priorCommand(V1,V7,V16)),x_withBackchainingDepth(25,x_numAnswers(1,x_priorCommandBy(V1,V13,V9,V16,V5,V6)))) :- x_cid(a65b132a2cbf80,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16).
xc_microtheory(a65b132a2cbf80,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf80,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf80,418).
xc_kb_names(a65b132a2cbf80,["?mt","?later-cmd","?later-operator","?resource","?earlier-cmd","?earlier-operator","?evt","?date","?producer","?domain","?lkmt","?consuming-pred","?creation-pred","?actor","?type","?cmd"]).
xc_mapping_rows(a65b132a2cbf80,[]).
x_isa(x_producesResource,x_Predicate) :- x_cid(a65b132a2cbf81).
xc_microtheory(a65b132a2cbf81,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf81,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf81,457).
xc_kb_names(a65b132a2cbf81,[]).
xc_mapping_rows(a65b132a2cbf81,[]).
x_arity(x_producesResource,6) :- x_cid(a65b132a2cbf82).
xc_microtheory(a65b132a2cbf82,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf82,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf82,458).
xc_kb_names(a65b132a2cbf82,[]).
xc_mapping_rows(a65b132a2cbf82,[]).
'x_<=='(x_producesResource(V1,V2,V3,V4,V5,V6),x_formulaArgument(V3,1,V7),x_currentDomain(V8),x_unifies(V9,x_ActionModelMtFn(V8)),x_operatorFormulas(V10,V3),x_lookupOnly(x_localOnly(x_cacheComplete('x_ist-Information'(V9,x_enablementRelation(V10,x_resourceTypeAvailable(V11,V12),V13))))),x_withBackchainingDepth(100,x_nextCreationEvent(V1,V2,V7,V12,V14,V4))) :- x_cid(a65b132a2cbf83,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b132a2cbf83,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf83,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf83,461).
xc_kb_names(a65b132a2cbf83,["?mt","?earlier-cmd","?earlier-operator","?resource","?later-cmd","?later-operator","?actor","?domain","?lkmt","?creation-pred","?directing-actor","?type","?consuming-pred","?event"]).
xc_mapping_rows(a65b132a2cbf83,[]).
x_isa(x_nextCreationEvent,x_Predicate) :- x_cid(a65b132a2cbf84).
xc_microtheory(a65b132a2cbf84,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf84,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf84,474).
xc_kb_names(a65b132a2cbf84,[]).
xc_mapping_rows(a65b132a2cbf84,[]).
x_arity(x_nextCreationEvent,6) :- x_cid(a65b132a2cbf85).
xc_microtheory(a65b132a2cbf85,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf85,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf85,475).
xc_kb_names(a65b132a2cbf85,[]).
xc_mapping_rows(a65b132a2cbf85,[]).
x_arg1Isa(x_nextCreationEvent,x_Microtheory) :- x_cid(a65b132a2cbf86).
xc_microtheory(a65b132a2cbf86,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf86,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf86,476).
xc_kb_names(a65b132a2cbf86,[]).
xc_mapping_rows(a65b132a2cbf86,[]).
x_arg2Isa(x_nextCreationEvent,x_PerceptualAgentEvent) :- x_cid(a65b132a2cbf87).
xc_microtheory(a65b132a2cbf87,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf87,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf87,477).
xc_kb_names(a65b132a2cbf87,[]).
xc_mapping_rows(a65b132a2cbf87,[]).
x_arg3Isa(x_nextCreationEvent,'x_Agent-Generic') :- x_cid(a65b132a2cbf88).
xc_microtheory(a65b132a2cbf88,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf88,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf88,478).
xc_kb_names(a65b132a2cbf88,[]).
xc_mapping_rows(a65b132a2cbf88,[]).
x_arg4Isa(x_nextCreationEvent,x_Collection) :- x_cid(a65b132a2cbf89).
xc_microtheory(a65b132a2cbf89,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf89,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf89,479).
xc_kb_names(a65b132a2cbf89,[]).
xc_mapping_rows(a65b132a2cbf89,[]).
x_arg5Isa(x_nextCreationEvent,x_PerceptualAgentEvent) :- x_cid(a65b132a2cbf8a).
xc_microtheory(a65b132a2cbf8a,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf8a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf8a,480).
xc_kb_names(a65b132a2cbf8a,[]).
xc_mapping_rows(a65b132a2cbf8a,[]).
x_arg6Isa(x_nextCreationEvent,x_SomethingExisting) :- x_cid(a65b132a2cbf8b).
xc_microtheory(a65b132a2cbf8b,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf8b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf8b,481).
xc_kb_names(a65b132a2cbf8b,[]).
xc_mapping_rows(a65b132a2cbf8b,[]).
x_comment(x_nextCreationEvent,"(nextCreationEvent ?mt ?prior-event ?actor ?type ?creation-event ?resource) binds ?creation-event and ?resource if the if there is a creation event on actor following ?event but before the next command.") :- x_cid(a65b132a2cbf8c).
xc_microtheory(a65b132a2cbf8c,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf8c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf8c,482).
xc_kb_names(a65b132a2cbf8c,[]).
xc_mapping_rows(a65b132a2cbf8c,[]).
'x_<=='(x_nextCreationEvent(V1,V2,V3,V4,V2,V5),x_numAnswers(1,x_eventProducesResourceOfType(V1,V2,V4,V5))) :- x_cid(a65b132a2cbf8d,V1,V2,V3,V4,V5).
xc_microtheory(a65b132a2cbf8d,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf8d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf8d,487).
xc_kb_names(a65b132a2cbf8d,["?mt","?event","?actor","?type","?resource"]).
xc_mapping_rows(a65b132a2cbf8d,[]).
'x_<=='(x_nextCreationEvent(V1,V2,V3,V4,V5,V6),x_uninferredSentence(x_eventProducesResourceOfType(V1,V2,V4,V7)),x_nextEventOnActor(V1,V3,V2,V8),x_nextCreationEvent(V1,V8,V3,V4,V5,V6)) :- x_cid(a65b132a2cbf8e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b132a2cbf8e,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf8e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf8e,490).
xc_kb_names(a65b132a2cbf8e,["?mt","?evt","?actor","?type","?event","?resource","?res","?next-evt"]).
xc_mapping_rows(a65b132a2cbf8e,[]).
x_isa(x_nextEventOnActor,x_QuaternaryPredicate) :- x_cid(a65b132a2cbf8f).
xc_microtheory(a65b132a2cbf8f,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf8f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf8f,498).
xc_kb_names(a65b132a2cbf8f,[]).
xc_mapping_rows(a65b132a2cbf8f,[]).
x_arity(x_nextEventOnActor,4) :- x_cid(a65b132a2cbf90).
xc_microtheory(a65b132a2cbf90,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf90,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf90,499).
xc_kb_names(a65b132a2cbf90,[]).
xc_mapping_rows(a65b132a2cbf90,[]).
x_arg1Isa(x_nextEventOnActor,x_Microtheory) :- x_cid(a65b132a2cbf91).
xc_microtheory(a65b132a2cbf91,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf91,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf91,500).
xc_kb_names(a65b132a2cbf91,[]).
xc_mapping_rows(a65b132a2cbf91,[]).
x_arg2Isa(x_nextEventOnActor,'x_Agent-Generic') :- x_cid(a65b132a2cbf92).
xc_microtheory(a65b132a2cbf92,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf92,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf92,501).
xc_kb_names(a65b132a2cbf92,[]).
xc_mapping_rows(a65b132a2cbf92,[]).
x_arg3Isa(x_nextEventOnActor,x_PerceptualAgentEvent) :- x_cid(a65b132a2cbf93).
xc_microtheory(a65b132a2cbf93,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf93,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf93,502).
xc_kb_names(a65b132a2cbf93,[]).
xc_mapping_rows(a65b132a2cbf93,[]).
x_arg4Isa(x_nextEventOnActor,x_PerceptualAgentEvent) :- x_cid(a65b132a2cbf94).
xc_microtheory(a65b132a2cbf94,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf94,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf94,503).
xc_kb_names(a65b132a2cbf94,[]).
xc_mapping_rows(a65b132a2cbf94,[]).
x_comment(x_nextEventOnActor,"(nextEventOnActor ?mt actor ?earlier ?later) binds ?later to the next event after ?earlier.") :- x_cid(a65b132a2cbf95).
xc_microtheory(a65b132a2cbf95,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf95,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf95,504).
xc_kb_names(a65b132a2cbf95,[]).
xc_mapping_rows(a65b132a2cbf95,[]).
'x_<=='(x_nextEventOnActor(V1,V2,V3,V4),x_numAnswers(1,x_localOnly('x_ist-Information'(V1,x_followsInProgression(V5,V3,V1)))),x_futureEventOnActor(V1,V2,V5,V4)) :- x_cid(a65b132a2cbf96,V1,V2,V3,V4,V5).
xc_microtheory(a65b132a2cbf96,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf96,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf96,506).
xc_kb_names(a65b132a2cbf96,["?mt","?actor","?current-event","?later-event","?next-event"]).
xc_mapping_rows(a65b132a2cbf96,[]).
x_isa(x_futureEventOnActor,x_QuaternaryPredicate) :- x_cid(a65b132a2cbf97).
xc_microtheory(a65b132a2cbf97,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf97,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf97,513).
xc_kb_names(a65b132a2cbf97,[]).
xc_mapping_rows(a65b132a2cbf97,[]).
x_arity(x_futureEventOnActor,4) :- x_cid(a65b132a2cbf98).
xc_microtheory(a65b132a2cbf98,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf98,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf98,514).
xc_kb_names(a65b132a2cbf98,[]).
xc_mapping_rows(a65b132a2cbf98,[]).
x_arg1Isa(x_futureEventOnActor,x_Microtheory) :- x_cid(a65b132a2cbf99).
xc_microtheory(a65b132a2cbf99,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf99,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf99,515).
xc_kb_names(a65b132a2cbf99,[]).
xc_mapping_rows(a65b132a2cbf99,[]).
x_arg2Isa(x_futureEventOnActor,'x_Agent-Generic') :- x_cid(a65b132a2cbf9a).
xc_microtheory(a65b132a2cbf9a,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf9a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf9a,516).
xc_kb_names(a65b132a2cbf9a,[]).
xc_mapping_rows(a65b132a2cbf9a,[]).
x_arg3Isa(x_futureEventOnActor,x_PerceptualAgentEvent) :- x_cid(a65b132a2cbf9b).
xc_microtheory(a65b132a2cbf9b,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf9b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf9b,517).
xc_kb_names(a65b132a2cbf9b,[]).
xc_mapping_rows(a65b132a2cbf9b,[]).
x_arg4Isa(x_futureEventOnActor,x_PerceptualAgentEvent) :- x_cid(a65b132a2cbf9c).
xc_microtheory(a65b132a2cbf9c,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf9c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf9c,518).
xc_kb_names(a65b132a2cbf9c,[]).
xc_mapping_rows(a65b132a2cbf9c,[]).
x_comment(x_futureEventOnActor,"(futureEventOnActor ?mt ?actor ?earlier ?later) binds ?later to the next event after ?earlier.") :- x_cid(a65b132a2cbf9d).
xc_microtheory(a65b132a2cbf9d,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf9d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf9d,519).
xc_kb_names(a65b132a2cbf9d,[]).
xc_mapping_rows(a65b132a2cbf9d,[]).
'x_<=='(x_futureEventOnActor(V1,V2,V3,V4),x_uninferredSentence('x_ist-Information'(V1,x_doneBy(V3,V2))),x_nextEventOnActor(V1,V2,V3,V4)) :- x_cid(a65b132a2cbf9e,V1,V2,V3,V4).
xc_microtheory(a65b132a2cbf9e,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf9e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf9e,522).
xc_kb_names(a65b132a2cbf9e,["?mt","?actor","?evt","?later-event"]).
xc_mapping_rows(a65b132a2cbf9e,[]).
'x_<=='(x_futureEventOnActor(V1,V2,V3,V3),x_not(x_variableExpression(V3)),'x_ist-Information'(V1,x_doneBy(V3,V2)),x_not(x_matches(x_CommandFn(V1,V4),V3))) :- x_cid(a65b132a2cbf9f,V1,V2,V3,V4).
xc_microtheory(a65b132a2cbf9f,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbf9f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbf9f,528).
xc_kb_names(a65b132a2cbf9f,["?mt","?actor","?event","?num"]).
xc_mapping_rows(a65b132a2cbf9f,[]).
x_isa(x_eventProducesResourceOfType,x_QuaternaryPredicate) :- x_cid(a65b132a2cbfa0).
xc_microtheory(a65b132a2cbfa0,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa0,534).
xc_kb_names(a65b132a2cbfa0,[]).
xc_mapping_rows(a65b132a2cbfa0,[]).
x_arity(x_eventProducesResourcesOfType,4) :- x_cid(a65b132a2cbfa1).
xc_microtheory(a65b132a2cbfa1,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa1,535).
xc_kb_names(a65b132a2cbfa1,[]).
xc_mapping_rows(a65b132a2cbfa1,[]).
x_arg1Isa(x_eventProducesResourceOfType,x_Microtheory) :- x_cid(a65b132a2cbfa2).
xc_microtheory(a65b132a2cbfa2,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa2,536).
xc_kb_names(a65b132a2cbfa2,[]).
xc_mapping_rows(a65b132a2cbfa2,[]).
x_arg2Isa(x_eventProducesResourceOfType,x_PerceptualAgentEvent) :- x_cid(a65b132a2cbfa3).
xc_microtheory(a65b132a2cbfa3,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa3,537).
xc_kb_names(a65b132a2cbfa3,[]).
xc_mapping_rows(a65b132a2cbfa3,[]).
x_arg3Isa(x_eventProducesResourceOfType,x_Collection) :- x_cid(a65b132a2cbfa4).
xc_microtheory(a65b132a2cbfa4,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa4,538).
xc_kb_names(a65b132a2cbfa4,[]).
xc_mapping_rows(a65b132a2cbfa4,[]).
x_arg4Isa(x_eventProducesResourceOfType,x_SomethingExisting) :- x_cid(a65b132a2cbfa5).
xc_microtheory(a65b132a2cbfa5,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa5,539).
xc_kb_names(a65b132a2cbfa5,[]).
xc_mapping_rows(a65b132a2cbfa5,[]).
x_comment(x_eventProducesResourceOfType,"(eventProducesResourceOfType ?mt ?evt ?type ?res)") :- x_cid(a65b132a2cbfa6).
xc_microtheory(a65b132a2cbfa6,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa6,540).
xc_kb_names(a65b132a2cbfa6,[]).
xc_mapping_rows(a65b132a2cbfa6,[]).
'x_<=='(x_eventProducesResourceOfType(V1,V2,V3,V4),x_numAnswers(1,x_localOnly('x_ist-Information'(V1,x_outputsCreated(V2,V4)))),x_numAnswers(1,x_contextEnvAllowed('x_ist-Information'(V1,x_isa(V4,V3))))) :- x_cid(a65b132a2cbfa7,V1,V2,V3,V4).
xc_microtheory(a65b132a2cbfa7,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa7,542).
xc_kb_names(a65b132a2cbfa7,["?mt","?evt","?type","?res"]).
xc_mapping_rows(a65b132a2cbfa7,[]).
x_isa(x_priorCommandBy,x_Predicate) :- x_cid(a65b132a2cbfa8).
xc_microtheory(a65b132a2cbfa8,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa8,552).
xc_kb_names(a65b132a2cbfa8,[]).
xc_mapping_rows(a65b132a2cbfa8,[]).
x_arity(x_priorCommandBy,6) :- x_cid(a65b132a2cbfa9).
xc_microtheory(a65b132a2cbfa9,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfa9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfa9,553).
xc_kb_names(a65b132a2cbfa9,[]).
xc_mapping_rows(a65b132a2cbfa9,[]).
x_comment(x_priorCommandBy,"priorCommandBy ?mt ?pred ?actor ?cmd ?cmd ?operator)") :- x_cid(a65b132a2cbfaa).
xc_microtheory(a65b132a2cbfaa,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfaa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfaa,554).
xc_kb_names(a65b132a2cbfaa,[]).
xc_mapping_rows(a65b132a2cbfaa,[]).
'x_<=='(x_priorCommandBy(V1,V2,V3,V4,V4,V5),x_numAnswers(1,x_commandDoneBy(V1,V2,V3,V4,V5))) :- x_cid(a65b132a2cbfab,V1,V2,V3,V4,V5).
xc_microtheory(a65b132a2cbfab,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfab,556).
xc_kb_names(a65b132a2cbfab,["?mt","?pred","?actor","?cmd","?operator"]).
xc_mapping_rows(a65b132a2cbfab,[]).
'x_<=='(x_priorCommandBy(V1,V2,V3,V4,V5,V6),x_uninferredSentence(x_commandDoneBy(V1,V2,V3,V4,V7)),x_priorCommand(V1,V4,V8),x_numAnswers(1,x_priorCommandBy(V1,V2,V3,V8,V5,V6))) :- x_cid(a65b132a2cbfac,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b132a2cbfac,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfac,559).
xc_kb_names(a65b132a2cbfac,["?mt","?pred","?actor","?cmd","?earlier-cmd","?operator","?some-operator","?intermediate-cmd"]).
xc_mapping_rows(a65b132a2cbfac,[]).
x_isa(x_commandDoneBy,x_Predicate) :- x_cid(a65b132a2cbfad).
xc_microtheory(a65b132a2cbfad,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfad,565).
xc_kb_names(a65b132a2cbfad,[]).
xc_mapping_rows(a65b132a2cbfad,[]).
x_arity(x_commandDoneBy,5) :- x_cid(a65b132a2cbfae).
xc_microtheory(a65b132a2cbfae,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfae,566).
xc_kb_names(a65b132a2cbfae,[]).
xc_mapping_rows(a65b132a2cbfae,[]).
x_arg1Isa(x_commandDoneBy,x_Microtheory) :- x_cid(a65b132a2cbfaf).
xc_microtheory(a65b132a2cbfaf,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfaf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfaf,567).
xc_kb_names(a65b132a2cbfaf,[]).
xc_mapping_rows(a65b132a2cbfaf,[]).
x_arg2Isa(x_commandDoneBy,x_Predicate) :- x_cid(a65b132a2cbfb0).
xc_microtheory(a65b132a2cbfb0,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfb0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfb0,568).
xc_kb_names(a65b132a2cbfb0,[]).
xc_mapping_rows(a65b132a2cbfb0,[]).
x_arg3Isa(x_commandDoneBy,'x_Agent-Generic') :- x_cid(a65b132a2cbfb1).
xc_microtheory(a65b132a2cbfb1,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfb1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfb1,569).
xc_kb_names(a65b132a2cbfb1,[]).
xc_mapping_rows(a65b132a2cbfb1,[]).
x_arg4Isa(x_commandDoneBy,x_PerceptualAgentCommand) :- x_cid(a65b132a2cbfb2).
xc_microtheory(a65b132a2cbfb2,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfb2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfb2,570).
xc_kb_names(a65b132a2cbfb2,[]).
xc_mapping_rows(a65b132a2cbfb2,[]).
x_arg5Isa(x_commandDoneBy,x_CycLExpression) :- x_cid(a65b132a2cbfb3).
xc_microtheory(a65b132a2cbfb3,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfb3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfb3,571).
xc_kb_names(a65b132a2cbfb3,[]).
xc_mapping_rows(a65b132a2cbfb3,[]).
'x_<=='(x_commandDoneBy(V1,V2,V3,V4,V5),x_lookupOnly(x_localOnly(x_numAnswers(1,'x_ist-Information'(V1,x_infoTransferred(V4,V5))))),x_operatorFormulas(V2,V5),x_formulaArgument(V5,1,V3)) :- x_cid(a65b132a2cbfb4,V1,V2,V3,V4,V5).
xc_microtheory(a65b132a2cbfb4,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfb4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfb4,573).
xc_kb_names(a65b132a2cbfb4,["?mt","?pred","?actor","?cmd","?operator"]).
xc_mapping_rows(a65b132a2cbfb4,[]).
'x_<=='(x_startingDate(V1,V2),x_queryContext(V3),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V3,x_outputsCreated(V4,V1))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V3,x_dateOfEvent(V4,V2)))))) :- x_cid(a65b132a2cbfb5,V1,V2,V3,V4).
xc_microtheory(a65b132a2cbfb5,x_PerceptualAgentMt).
xc_source_file(a65b132a2cbfb5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-plan.krf').
xc_source_line(a65b132a2cbfb5,629).
xc_kb_names(a65b132a2cbfb5,["?thing","?date","?mt","?evt"]).
xc_mapping_rows(a65b132a2cbfb5,[]).
kb_cache_footer(footer{count:154,digest:'2755259d927962856220c5813e81e67f32fddbdaebde283648f97666bf14d2f5',headerDigest:e3ab91724c2d7ef04ce75da95091d8178e681d420a14763033a8ce9eea056858}).
