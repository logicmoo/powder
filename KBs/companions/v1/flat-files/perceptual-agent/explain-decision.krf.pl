:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:98,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:563,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:a5cfe35d60b69cf3bc94f99eef1020768d68f6b1942662c022735ef273bc4bb3,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:26396,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf',sourceHash:'27312194d6ebd2e5395c9bd4e72771a2e6b9ed9f39cc92618ce058d16df54a34',warnings:[]}).
x_isa(x_explainDecision,x_ComplexActionPredicate) :- x_cid(a65b125de1da51).
xc_microtheory(a65b125de1da51,x_PerceptualAgentMt).
xc_source_file(a65b125de1da51,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da51,18).
xc_kb_names(a65b125de1da51,[]).
xc_mapping_rows(a65b125de1da51,[]).
x_arity(x_explainDecision,6) :- x_cid(a65b125de1da52).
xc_microtheory(a65b125de1da52,x_PerceptualAgentMt).
xc_source_file(a65b125de1da52,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da52,19).
xc_kb_names(a65b125de1da52,[]).
xc_mapping_rows(a65b125de1da52,[]).
x_arg1Isa(x_explainDecision,x_Microtheory) :- x_cid(a65b125de1da53).
xc_microtheory(a65b125de1da53,x_PerceptualAgentMt).
xc_source_file(a65b125de1da53,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da53,20).
xc_kb_names(a65b125de1da53,[]).
xc_mapping_rows(a65b125de1da53,[]).
x_arg2Isa(x_explainDecision,x_PerceptualAgentCommand) :- x_cid(a65b125de1da54).
xc_microtheory(a65b125de1da54,x_PerceptualAgentMt).
xc_source_file(a65b125de1da54,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da54,21).
xc_kb_names(a65b125de1da54,[]).
xc_mapping_rows(a65b125de1da54,[]).
x_arg3Isa(x_explainDecision,x_CycLExpression) :- x_cid(a65b125de1da55).
xc_microtheory(a65b125de1da55,x_PerceptualAgentMt).
xc_source_file(a65b125de1da55,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da55,22).
xc_kb_names(a65b125de1da55,[]).
xc_mapping_rows(a65b125de1da55,[]).
x_arg4Isa(x_explainDecision,x_Collection) :- x_cid(a65b125de1da56).
xc_microtheory(a65b125de1da56,x_PerceptualAgentMt).
xc_source_file(a65b125de1da56,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da56,23).
xc_kb_names(a65b125de1da56,[]).
xc_mapping_rows(a65b125de1da56,[]).
x_arg5Isa(x_explainDecision,x_FunctionalSlot) :- x_cid(a65b125de1da57).
xc_microtheory(a65b125de1da57,x_PerceptualAgentMt).
xc_source_file(a65b125de1da57,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da57,24).
xc_kb_names(a65b125de1da57,[]).
xc_mapping_rows(a65b125de1da57,[]).
x_arg6Isa(x_explainDecision,x_Date) :- x_cid(a65b125de1da58).
xc_microtheory(a65b125de1da58,x_PerceptualAgentMt).
xc_source_file(a65b125de1da58,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da58,25).
xc_kb_names(a65b125de1da58,[]).
xc_mapping_rows(a65b125de1da58,[]).
x_comment(x_explainDecision,"(explainDecision ?mt ?cmd ?operator ?actor-type ?slot ?when)") :- x_cid(a65b125de1da59).
xc_microtheory(a65b125de1da59,x_PerceptualAgentMt).
xc_source_file(a65b125de1da59,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da59,26).
xc_kb_names(a65b125de1da59,[]).
xc_mapping_rows(a65b125de1da59,[]).
x_preconditionForMethod(x_and(x_different(V1,x_currentPlan),x_uninferredSentence(x_priorExplanationFailure(V2,V3)),x_unifies(V4,x_GoalFn(0)),x_uninferredSentence(x_inactiveStartingGoal(V2,V4)),x_outsourcedOnly(x_currentDomain(V5)),x_unifies(V6,x_SpindleMtFn(V5,x_Influences))),x_methodForAction(x_explainDecision(V2,V7,V3,V8,V1,V9),x_actionSequence(x_TheList(x_doAnnounce("explainDecision: ~s ~s ~s ~s",[V3,V8,V1,V9]),x_indexDecisionCase(V2,V7,V3,x_DecisionFn(V1),V9),x_explainActionWRTGoal(V2,V6,V7,V3,x_TheSet(V4),x_TheSet,10))))) :- x_cid(a65b125de1da5a,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125de1da5a,x_PerceptualAgentMt).
xc_source_file(a65b125de1da5a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da5a,31).
xc_kb_names(a65b125de1da5a,["?slot","?mt","?action","?goal","?domain","?spindle","?cmd","?actor-type","?when"]).
xc_mapping_rows(a65b125de1da5a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 46, column 52), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de1da5a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 46, column 52), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_explainDecision(V1,V2,V3,V4,V5,V6),x_actionSequence(x_TheList(x_doAnnounce("Failure to explain decision ~s",[V3]))))) :- x_cid(a65b125de1da5b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125de1da5b,x_PerceptualAgentMt).
xc_source_file(a65b125de1da5b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da5b,53).
xc_kb_names(a65b125de1da5b,["?mt","?cmd","?action","?actor-type","?slot","?when"]).
xc_mapping_rows(a65b125de1da5b,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 59, column 54), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de1da5b,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 59, column 54), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_explainDecision(V1,V2,V3,V4,V5,V6),V7,V8),x_someArgumentHasPredicate(V7,x_explainActionWRTGoal)) :- x_cid(a65b125de1da5c,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125de1da5c,x_PerceptualAgentMt).
xc_source_file(a65b125de1da5c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da5c,61).
xc_kb_names(a65b125de1da5c,["?mt","?cmd","?action","?actor-type","?slot","?when","?seq1","?seq2"]).
xc_mapping_rows(a65b125de1da5c,[]).
x_isa(x_explainActionWRTGoal,x_ComplexActionPredicate) :- x_cid(a65b125de1da5d).
xc_microtheory(a65b125de1da5d,x_PerceptualAgentMt).
xc_source_file(a65b125de1da5d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da5d,87).
xc_kb_names(a65b125de1da5d,[]).
xc_mapping_rows(a65b125de1da5d,[]).
x_arity(x_explainActionWRTGoal,7) :- x_cid(a65b125de1da5e).
xc_microtheory(a65b125de1da5e,x_PerceptualAgentMt).
xc_source_file(a65b125de1da5e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da5e,88).
xc_kb_names(a65b125de1da5e,[]).
xc_mapping_rows(a65b125de1da5e,[]).
x_arg1Isa(x_explainActionWRTGoal,x_Microtheory) :- x_cid(a65b125de1da5f).
xc_microtheory(a65b125de1da5f,x_PerceptualAgentMt).
xc_source_file(a65b125de1da5f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da5f,89).
xc_kb_names(a65b125de1da5f,[]).
xc_mapping_rows(a65b125de1da5f,[]).
x_arg2Isa(x_explainActionWRTGoal,x_Microtheory) :- x_cid(a65b125de1da60).
xc_microtheory(a65b125de1da60,x_PerceptualAgentMt).
xc_source_file(a65b125de1da60,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da60,90).
xc_kb_names(a65b125de1da60,[]).
xc_mapping_rows(a65b125de1da60,[]).
x_arg3Isa(x_explainActionWRTGoal,x_PerceptualAgentCommand) :- x_cid(a65b125de1da61).
xc_microtheory(a65b125de1da61,x_PerceptualAgentMt).
xc_source_file(a65b125de1da61,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da61,91).
xc_kb_names(a65b125de1da61,[]).
xc_mapping_rows(a65b125de1da61,[]).
x_arg4Isa(x_explainActionWRTGoal,'x_CycLSentence-Assertible') :- x_cid(a65b125de1da62).
xc_microtheory(a65b125de1da62,x_PerceptualAgentMt).
xc_source_file(a65b125de1da62,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da62,92).
xc_kb_names(a65b125de1da62,[]).
xc_mapping_rows(a65b125de1da62,[]).
x_arg5Isa(x_explainActionWRTGoal,'x_Set-Mathematical') :- x_cid(a65b125de1da63).
xc_microtheory(a65b125de1da63,x_PerceptualAgentMt).
xc_source_file(a65b125de1da63,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da63,93).
xc_kb_names(a65b125de1da63,[]).
xc_mapping_rows(a65b125de1da63,[]).
x_arg6Isa(x_explainActionWRTGoal,'x_Set-Mathematical') :- x_cid(a65b125de1da64).
xc_microtheory(a65b125de1da64,x_PerceptualAgentMt).
xc_source_file(a65b125de1da64,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da64,94).
xc_kb_names(a65b125de1da64,[]).
xc_mapping_rows(a65b125de1da64,[]).
x_arg7Isa(x_explainActionWRTGoal,x_Integer) :- x_cid(a65b125de1da65).
xc_microtheory(a65b125de1da65,x_PerceptualAgentMt).
xc_source_file(a65b125de1da65,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da65,95).
xc_kb_names(a65b125de1da65,[]).
xc_mapping_rows(a65b125de1da65,[]).
x_comment(x_explainActionWRTGoal,"(explainActionWRTGoal ?mt ?spindle-mt ?decision-case ?action ?subgoals ?ancestors ?max-depth) explains a reified command action with respect to a specified goal.") :- x_cid(a65b125de1da66).
xc_microtheory(a65b125de1da66,x_PerceptualAgentMt).
xc_source_file(a65b125de1da66,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da66,96).
xc_kb_names(a65b125de1da66,[]).
xc_mapping_rows(a65b125de1da66,[]).
x_preconditionForMethod(x_and(x_different(V1,x_TheSet),x_not(x_matches(x_TheSet(t(V2,t(x_AggregateQuantityFn(V3),V4))),V1)),x_strategyFromGoalNames(V5,x_TheSet(V6),V1,V7,V8),x_formulaArgument(V6,1,V9),x_unifies(V10,x_hypothesizedGoal(V9,V11,V6,V8))),x_methodForAction(x_explainActionWRTGoal(V5,V12,V11,V6,V1,V13,V14),x_actionSequence(x_TheList(x_doAnnounce("Predict goal for ~s =~%  ~s",[V6,V8]),x_doRecord('x_ist-Information'(V5,V10)))))) :- x_cid(a65b125de1da67,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b125de1da67,x_PerceptualAgentMt).
xc_source_file(a65b125de1da67,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da67,102).
xc_kb_names(a65b125de1da67,["?subgoals","?dir","?pred","?coll","?mt","?action","?selected-action","?subgoal","?actor","?hyp-subgoal","?cmd","?spindle-mt","?parent-goals","?max-depth"]).
xc_mapping_rows(a65b125de1da67,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 123, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de1da67,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 123, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_cacheComplete(x_entityTypesOfAction(V1,V2)),x_outsourcedOnly(x_currentDomain(V3)),x_unifies(V4,x_LearnedKnowledgeMtFn(V3)),x_operatorFormulas(V5,V1)),x_methodForAction(x_explainActionWRTGoal(V6,V7,V8,V1,x_TheSet,V9,V10),x_actionSequence(x_TheList(x_doAnnounce("~&Failed to explain ~s",[V1]),x_doRecord('x_ist-Information'(V6,x_explanationFailure(V1))),x_postActionLearningGoal(V4,V5),x_postPurposeLearningGoal(V4,V5),x_doForEach(V11,V2,x_postAffordanceLearningGoal(V4,V11)))))) :- x_cid(a65b125de1da68,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125de1da68,x_PerceptualAgentMt).
xc_source_file(a65b125de1da68,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da68,133).
xc_kb_names(a65b125de1da68,["?action","?entity-types","?domain","?lkmt","?action-pred","?mt","?spindle-mt","?cmd","?parent-goals","?max-depth","?entity-type"]).
xc_mapping_rows(a65b125de1da68,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 143, column 45), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de1da68,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 143, column 45), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_cacheComplete(x_entityTypesOfAction(V1,V2)),x_outsourcedOnly(x_currentDomain(V3)),x_unifies(V4,x_LearnedKnowledgeMtFn(V3)),x_operatorFormulas(V5,V1)),x_methodForAction(x_explainActionWRTGoal(V6,V7,V8,V1,V9,V10,0),x_actionSequence(x_TheList(x_doAnnounce("~&Failed to explain ~s",[V1]),x_doRecord('x_ist-Information'(V6,x_explanationFailure(V1))),x_postActionLearningGoal(V4,V5),x_postPurposeLearningGoal(V4,V5),x_doForEach(V11,V2,x_postAffordanceLearningGoal(V4,V11)))))) :- x_cid(a65b125de1da69,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125de1da69,x_PerceptualAgentMt).
xc_source_file(a65b125de1da69,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da69,151).
xc_kb_names(a65b125de1da69,["?action","?entity-types","?domain","?lkmt","?action-pred","?mt","?spindle-mt","?cmd","?set","?parent-goals","?entity-type"]).
xc_mapping_rows(a65b125de1da69,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 161, column 45), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de1da69,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 161, column 45), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_entityTypesOfAction,x_BinaryPredicate) :- x_cid(a65b125de1da6a).
xc_microtheory(a65b125de1da6a,x_PerceptualAgentMt).
xc_source_file(a65b125de1da6a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da6a,168).
xc_kb_names(a65b125de1da6a,[]).
xc_mapping_rows(a65b125de1da6a,[]).
x_arity(x_entityTypesOfAction,2) :- x_cid(a65b125de1da6b).
xc_microtheory(a65b125de1da6b,x_PerceptualAgentMt).
xc_source_file(a65b125de1da6b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da6b,169).
xc_kb_names(a65b125de1da6b,[]).
xc_mapping_rows(a65b125de1da6b,[]).
'x_<=='(x_entityTypesOfAction(V1,V2),x_evaluate(V3,x_RestOfListFn(x_FormulaArgListFn(V1))),x_evaluate(V2,x_TheClosedRetrievalSetOf(V4,x_and(x_memberOfList(V4,V3),x_groundExpression(V4),x_atomicTerm(V4),x_isa(V4,x_Collection))))) :- x_cid(a65b125de1da6c,V1,V2,V3,V4).
xc_microtheory(a65b125de1da6c,x_PerceptualAgentMt).
xc_source_file(a65b125de1da6c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da6c,171).
xc_kb_names(a65b125de1da6c,["?action","?entity-types","?entity-args","?entity-type"]).
xc_mapping_rows(a65b125de1da6c,[]).
x_isa(x_priorExplanationFailure,x_BinaryPredicate) :- x_cid(a65b125de1da6d).
xc_microtheory(a65b125de1da6d,x_PerceptualAgentMt).
xc_source_file(a65b125de1da6d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da6d,183).
xc_kb_names(a65b125de1da6d,[]).
xc_mapping_rows(a65b125de1da6d,[]).
'x_<=='(x_priorExplanationFailure(V1,V2),x_operatorFormulas(V3,V2),x_evaluate(V4,x_MakeFormulaFn(V3,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V5,V6),x_variablizedIndividual(V5,V6))),x_FormulaArgListFn(V2)))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_explanationFailure(V4)))))) :- x_cid(a65b125de1da6e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125de1da6e,x_PerceptualAgentMt).
xc_source_file(a65b125de1da6e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da6e,208).
xc_kb_names(a65b125de1da6e,["?mt","?action","?action-predicate","?qry","?arg","?variablized-arg"]).
xc_mapping_rows(a65b125de1da6e,[]).
x_isa(x_variablizedIndividual,x_BinaryPredicate) :- x_cid(a65b125de1da6f).
xc_microtheory(a65b125de1da6f,x_PerceptualAgentMt).
xc_source_file(a65b125de1da6f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da6f,223).
xc_kb_names(a65b125de1da6f,[]).
xc_mapping_rows(a65b125de1da6f,[]).
x_arity(x_variablizedIndividual,2) :- x_cid(a65b125de1da70).
xc_microtheory(a65b125de1da70,x_PerceptualAgentMt).
xc_source_file(a65b125de1da70,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da70,224).
xc_kb_names(a65b125de1da70,[]).
xc_mapping_rows(a65b125de1da70,[]).
x_arg1Isa(x_variablizedIndividual,x_CycLTerm) :- x_cid(a65b125de1da71).
xc_microtheory(a65b125de1da71,x_PerceptualAgentMt).
xc_source_file(a65b125de1da71,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da71,225).
xc_kb_names(a65b125de1da71,[]).
xc_mapping_rows(a65b125de1da71,[]).
x_arg2Isa(x_variablizedIndividual,x_CycLTerm) :- x_cid(a65b125de1da72).
xc_microtheory(a65b125de1da72,x_PerceptualAgentMt).
xc_source_file(a65b125de1da72,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da72,226).
xc_kb_names(a65b125de1da72,[]).
xc_mapping_rows(a65b125de1da72,[]).
x_comment(x_variablizedIndividual,"(variablizedIndividual ?arg ?var) binds ?var to a variable if ?arg is an Individual.") :- x_cid(a65b125de1da73).
xc_microtheory(a65b125de1da73,x_PerceptualAgentMt).
xc_source_file(a65b125de1da73,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da73,227).
xc_kb_names(a65b125de1da73,[]).
xc_mapping_rows(a65b125de1da73,[]).
'x_<=='(x_variablizedIndividual(V1,V1),x_variableExpression(V1)) :- x_cid(a65b125de1da74,V1).
xc_microtheory(a65b125de1da74,x_PerceptualAgentMt).
xc_source_file(a65b125de1da74,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da74,230).
xc_kb_names(a65b125de1da74,["?arg"]).
xc_mapping_rows(a65b125de1da74,[]).
'x_<=='(x_variablizedIndividual(V1,V1),x_not(x_variableExpression(V1)),x_isa(V1,x_Collection)) :- x_cid(a65b125de1da75,V1).
xc_microtheory(a65b125de1da75,x_PerceptualAgentMt).
xc_source_file(a65b125de1da75,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da75,234).
xc_kb_names(a65b125de1da75,["?arg"]).
xc_mapping_rows(a65b125de1da75,[]).
'x_<=='(x_variablizedIndividual(V1,V2),x_not(x_variableExpression(V1)),x_uninferredSentence(x_isa(V1,x_Collection)),x_evaluate(V2,x_UniquifyVariablesFn(V3))) :- x_cid(a65b125de1da76,V1,V2,V3).
xc_microtheory(a65b125de1da76,x_PerceptualAgentMt).
xc_source_file(a65b125de1da76,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da76,239).
xc_kb_names(a65b125de1da76,["?arg","?var","?v"]).
xc_mapping_rows(a65b125de1da76,[]).
x_preconditionForMethod(x_and(x_different(V1,x_TheSet),x_greaterThan(V2,0),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_and(x_lookupOnly(x_elementOf(V5,V1)),x_lookupOnly(x_contextEnvAllowed('x_ist-Information'(V6,x_subgoal(V5,V4)))),x_lookupOnly(x_not(x_elementOf(V4,V1))),x_lookupOnly(x_not(x_elementOf(V4,V7)))))),x_evaluate(V8,x_SetOrCollectionUnion(V1,V7)),x_evaluate(V9,x_DifferenceFn(V2,1))),x_methodForAction(x_explainActionWRTGoal(V6,V10,V11,V12,V1,V7,V2),x_actionSequence(x_TheList(x_doAgentPlan(x_actionSequence(x_TheList(x_explainActionWRTGoal(V6,V10,V11,V12,V3,V8,V9)))))))) :- x_cid(a65b125de1da77,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125de1da77,x_PerceptualAgentMt).
xc_source_file(a65b125de1da77,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da77,251).
xc_kb_names(a65b125de1da77,["?subgoals","?max-depth","?new-subgoals","?new-subgoal","?parent-goal","?mt","?parent-goals","?ancestors","?new-depth","?spindle-mt","?cmd","?action"]).
xc_mapping_rows(a65b125de1da77,[]).
'x_<=='(x_preferInContext(x_explainActionWRTGoal(V1,V2,V3,V4,V5,V6,V7),V8,V9),x_noArgumentHasPredicate(V8,x_explainActionWRTGoal)) :- x_cid(a65b125de1da78,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125de1da78,x_PerceptualAgentMt).
xc_source_file(a65b125de1da78,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da78,281).
xc_kb_names(a65b125de1da78,["?mt","?spindle-mt","?cmd","?action","?subgoals","?parent-goals","?max-depth","?seq1","?seq2"]).
xc_mapping_rows(a65b125de1da78,[]).
x_isa(x_hypothesizedSubgoalFor,x_QuaternaryPredicate) :- x_cid(a65b125de1da79).
xc_microtheory(a65b125de1da79,x_PerceptualAgentMt).
xc_source_file(a65b125de1da79,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da79,297).
xc_kb_names(a65b125de1da79,[]).
xc_mapping_rows(a65b125de1da79,[]).
x_arity(x_hypothesizedSubgoalFor,4) :- x_cid(a65b125de1da7a).
xc_microtheory(a65b125de1da7a,x_PerceptualAgentMt).
xc_source_file(a65b125de1da7a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da7a,298).
xc_kb_names(a65b125de1da7a,[]).
xc_mapping_rows(a65b125de1da7a,[]).
x_comment(x_hypothesizedSubgoalFor,"(hypothesizedSubgoalFor ?spindle-mt ?parent ?child) attempts to find a direct subgoal, but falls back on type-level inference when necessary.") :- x_cid(a65b125de1da7b).
xc_microtheory(a65b125de1da7b,x_PerceptualAgentMt).
xc_source_file(a65b125de1da7b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da7b,299).
xc_kb_names(a65b125de1da7b,[]).
xc_mapping_rows(a65b125de1da7b,[]).
x_isa('x_hypothesizedSubgoalFor-TypeType',x_QuaternaryPredicate) :- x_cid(a65b125de1da7c).
xc_microtheory(a65b125de1da7c,x_PerceptualAgentMt).
xc_source_file(a65b125de1da7c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da7c,301).
xc_kb_names(a65b125de1da7c,[]).
xc_mapping_rows(a65b125de1da7c,[]).
x_arity('x_hypothesizedSubgoalFor-TypeType',4) :- x_cid(a65b125de1da7d).
xc_microtheory(a65b125de1da7d,x_PerceptualAgentMt).
xc_source_file(a65b125de1da7d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da7d,302).
xc_kb_names(a65b125de1da7d,[]).
xc_mapping_rows(a65b125de1da7d,[]).
x_arg1Isa('x_hypothesizedSubgoalFor-TypeType',x_Microtheory) :- x_cid(a65b125de1da7e).
xc_microtheory(a65b125de1da7e,x_PerceptualAgentMt).
xc_source_file(a65b125de1da7e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da7e,303).
xc_kb_names(a65b125de1da7e,[]).
xc_mapping_rows(a65b125de1da7e,[]).
x_arg2Isa('x_hypothesizedSubgoalFor-TypeType',x_Microtheory) :- x_cid(a65b125de1da7f).
xc_microtheory(a65b125de1da7f,x_PerceptualAgentMt).
xc_source_file(a65b125de1da7f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da7f,304).
xc_kb_names(a65b125de1da7f,[]).
xc_mapping_rows(a65b125de1da7f,[]).
x_arg3Isa('x_hypothesizedSubgoalFor-TypeType',x_QuantityType) :- x_cid(a65b125de1da80).
xc_microtheory(a65b125de1da80,x_PerceptualAgentMt).
xc_source_file(a65b125de1da80,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da80,305).
xc_kb_names(a65b125de1da80,[]).
xc_mapping_rows(a65b125de1da80,[]).
x_arg4Isa('x_hypothesizedSubgoalFor-TypeType',x_QuantityType) :- x_cid(a65b125de1da81).
xc_microtheory(a65b125de1da81,x_PerceptualAgentMt).
xc_source_file(a65b125de1da81,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da81,306).
xc_kb_names(a65b125de1da81,[]).
xc_mapping_rows(a65b125de1da81,[]).
x_comment('x_hypothesizedSubgoalFor-TypeType',"(hypothesizedSubgoalFor-TypeType ?mt ?spindle ?type-level-dep-qoal ?type-level-indep-goal) means there is a hypothesized type-level subgoal relation.") :- x_cid(a65b125de1da82).
xc_microtheory(a65b125de1da82,x_PerceptualAgentMt).
xc_source_file(a65b125de1da82,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da82,307).
xc_kb_names(a65b125de1da82,[]).
xc_mapping_rows(a65b125de1da82,[]).
'x_<=='(x_hypothesizedSubgoalFor(V1,V2,V3,V4),x_uninferredSentence('x_ist-Information'(V1,'x_subgoal-TypeType'(V3,V4))),x_subgoalFor(V3,V4)) :- x_cid(a65b125de1da83,V1,V2,V3,V4).
xc_microtheory(a65b125de1da83,x_PerceptualAgentMt).
xc_source_file(a65b125de1da83,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da83,309).
xc_kb_names(a65b125de1da83,["?mt","?inf-spindle","?parent-goal","?subgoal"]).
xc_mapping_rows(a65b125de1da83,[]).
'x_<=='(x_hypothesizedSubgoalFor(V1,V2,V3,V4),'x_ist-Information'(V1,'x_subgoal-TypeType'(V3,V4))) :- x_cid(a65b125de1da84,V1,V2,V3,V4).
xc_microtheory(a65b125de1da84,x_PerceptualAgentMt).
xc_source_file(a65b125de1da84,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da84,315).
xc_kb_names(a65b125de1da84,["?mt","?inf-spindle","?parent-goal","?subgoal"]).
xc_mapping_rows(a65b125de1da84,[]).
'x_<=='(x_hypothesizedSubgoalFor(V1,V2,V3,V4),x_propositionalGoalNat(V3),x_resolvesToQuantityGoal(V1,V3,V4)) :- x_cid(a65b125de1da85,V1,V2,V3,V4).
xc_microtheory(a65b125de1da85,x_PerceptualAgentMt).
xc_source_file(a65b125de1da85,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da85,318).
xc_kb_names(a65b125de1da85,["?mt","?inf-spindle","?parent-goal","?subgoal"]).
xc_mapping_rows(a65b125de1da85,[]).
'x_<=='(x_hypothesizedSubgoalFor(V1,V2,V3,V4),'x_hypothesizedSubgoalFor-TypeType'(V1,V2,V3,V4)) :- x_cid(a65b125de1da86,V1,V2,V3,V4).
xc_microtheory(a65b125de1da86,x_PerceptualAgentMt).
xc_source_file(a65b125de1da86,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da86,322).
xc_kb_names(a65b125de1da86,["?mt","?inf-spindle","?parent-goal","?subgoal"]).
xc_mapping_rows(a65b125de1da86,[]).
'x_<=='('x_hypothesizedSubgoalFor-TypeType'(V1,V2,t(V3,V4),t(V3,V5)),x_unifies(t(x_MeasurableQuantityFn(V6),V7),V4),x_unifies(V8,t(V9,x_MeasurableQuantityFn(V6),V10,V11,V12,V13)),x_lookupOnly(x_contextEnvAllowed('x_ist-Information'(V2,x_hypothesis(V8)))),x_lookupOnly(x_elementOf(V9,x_TheSet('x_qprop+TypeType','x_c+TypeType','x_i+TypeType'))),x_uninferredSentence(x_ambiguousHypothesisDirection(V2,V8)),'x_ist-Information'(V1,x_broaderTerm(V7,V11)),x_unifies(V5,t(V10,V12))) :- x_cid(a65b125de1da87,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125de1da87,x_PerceptualAgentMt).
xc_source_file(a65b125de1da87,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da87,325).
xc_kb_names(a65b125de1da87,["?mt","?spindle-mt","?supergoal-type","?dep-quantity-type","?indep-quantity-type","?binpred","?arg","?inf","?inf-pred","?indep-type","?coll","?indep-coll","?rel"]).
xc_mapping_rows(a65b125de1da87,[]).
'x_<=='('x_hypothesizedSubgoalFor-TypeType'(V1,V2,t(V3,V4),t(V5,V6)),x_unifies(t(x_MeasurableQuantityFn(V7),V8),V4),x_unifies(V9,t(V10,x_MeasurableQuantityFn(V7),V11,V12,V13,V14)),x_lookupOnly(x_contextEnvAllowed('x_ist-Information'(V2,x_hypothesis(V9)))),x_lookupOnly(x_elementOf(V10,x_TheSet('x_qprop-TypeType','x_c-TypeType','x_i-TypeType'))),x_uninferredSentence(x_ambiguousHypothesisDirection(V2,V9)),'x_ist-Information'(V1,x_broaderTerm(V8,V12)),x_unifies(V6,t(V11,V13)),x_oppositeGoalType(V3,V5)) :- x_cid(a65b125de1da88,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b125de1da88,x_PerceptualAgentMt).
xc_source_file(a65b125de1da88,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da88,336).
xc_kb_names(a65b125de1da88,["?mt","?spindle-mt","?supergoal-type","?dep-quantity-type","?subgoal-type","?indep-quantity-type","?binpred","?arg","?inf","?inf-pred","?indep-type","?coll","?indep-coll","?rel"]).
xc_mapping_rows(a65b125de1da88,[]).
'x_<=='('x_hypothesizedSubgoalFor-TypeType'(V1,V2,t(V3,V4),t(V5,V6)),x_unifies(t(x_MeasurableQuantityFn(V7),V8),V4),'x_ist-Information'(V2,x_hypothesis('x_positivelyDependsOn-TypeType'(x_MeasurableQuantityFn(V7),V9,V10,V11))),'x_ist-Information'(V1,x_broaderTerm(V8,V9)),x_numAnswers(1,x_variablizedStatement(V11,V12)),x_evaluate(V6,x_SubstituteFormulaArgPositionFn(x_TheList(2),V10,V12)),x_goalTypeForQuantityRel(V3,x_positivelyDependsOnProp,V5)) :- x_cid(a65b125de1da89,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125de1da89,x_PerceptualAgentMt).
xc_source_file(a65b125de1da89,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da89,348).
xc_kb_names(a65b125de1da89,["?mt","?spindle-mt","?supergoal-type","?dep-quantity-type","?subgoal-type","?prop","?binpred","?arg","?coll","?indep-arg","?pred","?stmt"]).
xc_mapping_rows(a65b125de1da89,[]).
'x_<=='('x_hypothesizedSubgoalFor-TypeType'(V1,V2,t(V3,V4),t(V5,V6)),x_unifies(t(x_MeasurableQuantityFn(V7),V8),V4),'x_ist-Information'(V2,x_hypothesis('x_negativelyDependsOn-TypeType'(x_MeasurableQuantityFn(V7),V9,V10,V11))),'x_ist-Information'(V1,x_broaderTerm(V8,V9)),x_numAnswers(1,x_variablizedStatement(V11,V12)),x_evaluate(V6,x_SubstituteFormulaArgPositionFn(x_TheList(2),V10,V12)),x_goalTypeForQuantityRel(V3,x_negativelyDependsOnProp,V5)) :- x_cid(a65b125de1da8a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125de1da8a,x_PerceptualAgentMt).
xc_source_file(a65b125de1da8a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da8a,357).
xc_kb_names(a65b125de1da8a,["?mt","?spindle-mt","?supergoal-type","?dep-quantity-type","?subgoal-type","?prop","?binpred","?arg","?coll","?indep-arg","?pred","?stmt"]).
xc_mapping_rows(a65b125de1da8a,[]).
x_isa(x_recordGoalHierarchyFor,x_ComplexActionPredicate) :- x_cid(a65b125de1da8b).
xc_microtheory(a65b125de1da8b,x_PerceptualAgentMt).
xc_source_file(a65b125de1da8b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da8b,374).
xc_kb_names(a65b125de1da8b,[]).
xc_mapping_rows(a65b125de1da8b,[]).
x_arity(x_recordGoalHierarchyFor,3) :- x_cid(a65b125de1da8c).
xc_microtheory(a65b125de1da8c,x_PerceptualAgentMt).
xc_source_file(a65b125de1da8c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da8c,375).
xc_kb_names(a65b125de1da8c,[]).
xc_mapping_rows(a65b125de1da8c,[]).
x_arg1Isa(x_recordGoalHierarchyFor,x_Microtheory) :- x_cid(a65b125de1da8d).
xc_microtheory(a65b125de1da8d,x_PerceptualAgentMt).
xc_source_file(a65b125de1da8d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da8d,376).
xc_kb_names(a65b125de1da8d,[]).
xc_mapping_rows(a65b125de1da8d,[]).
x_arg2Isa(x_recordGoalHierarchyFor,x_CycLExpression) :- x_cid(a65b125de1da8e).
xc_microtheory(a65b125de1da8e,x_PerceptualAgentMt).
xc_source_file(a65b125de1da8e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da8e,377).
xc_kb_names(a65b125de1da8e,[]).
xc_mapping_rows(a65b125de1da8e,[]).
x_arg3Isa(x_recordGoalHierarchyFor,x_List) :- x_cid(a65b125de1da8f).
xc_microtheory(a65b125de1da8f,x_PerceptualAgentMt).
xc_source_file(a65b125de1da8f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da8f,378).
xc_kb_names(a65b125de1da8f,[]).
xc_mapping_rows(a65b125de1da8f,[]).
x_comment(x_recordGoalHierarchyFor,"(recordGoalHierarchyFor ?mt ?action ?goal-hierarchy) ") :- x_cid(a65b125de1da90).
xc_microtheory(a65b125de1da90,x_PerceptualAgentMt).
xc_source_file(a65b125de1da90,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da90,379).
xc_kb_names(a65b125de1da90,[]).
xc_mapping_rows(a65b125de1da90,[]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_LastInListFn(V2)),x_evaluate(V3,x_FirstInListFn(V2)),x_different(V1,V3),x_trimmedList(V2,V4),x_evaluate(V5,x_TheClosedRetrievalSetOf(V6,x_and(x_localOnly(x_lookupOnly('x_ist-Information'(V7,x_goalHierarchy(V3,V1,V6)))),x_different(V6,V4))))),x_methodForAction(x_recordGoalHierarchyFor(V7,V8,V2),x_actionSequence(x_TheList(x_doForEach(V9,V5,x_doForget('x_ist-Information'(V7,x_goalHierarchy(V3,V1,V9)))),x_doRecord('x_ist-Information'(V7,x_goalHierarchy(V3,V1,V4))),x_doAgentPlan(x_actionSequence(x_TheList(x_recordReasonForTask(V7,V8,V3)))))))) :- x_cid(a65b125de1da91,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125de1da91,x_PerceptualAgentMt).
xc_source_file(a65b125de1da91,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da91,389).
xc_kb_names(a65b125de1da91,["?parent-goal","?goal-stack","?subgoal","?goal-hierarchy","?old-hierarchies","?old-hierarchy","?mt","?action","?hierarchy"]).
xc_mapping_rows(a65b125de1da91,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_recordGoalHierarchyFor(V1,V2,x_TheList(V3)),x_actionSequence(x_TheList(x_doAgentPlan(x_actionSequence(x_TheList(x_recordReasonForTask(V1,V2,V3)))))))) :- x_cid(a65b125de1da92,V1,V2,V3).
xc_microtheory(a65b125de1da92,x_PerceptualAgentMt).
xc_source_file(a65b125de1da92,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da92,413).
xc_kb_names(a65b125de1da92,["?mt","?action","?goal"]).
xc_mapping_rows(a65b125de1da92,[]).
x_isa(x_recordReasonForTask,x_ComplexActionPredicate) :- x_cid(a65b125de1da93).
xc_microtheory(a65b125de1da93,x_PerceptualAgentMt).
xc_source_file(a65b125de1da93,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da93,424).
xc_kb_names(a65b125de1da93,[]).
xc_mapping_rows(a65b125de1da93,[]).
x_arity(x_recordReasonForTask,3) :- x_cid(a65b125de1da94).
xc_microtheory(a65b125de1da94,x_PerceptualAgentMt).
xc_source_file(a65b125de1da94,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da94,425).
xc_kb_names(a65b125de1da94,[]).
xc_mapping_rows(a65b125de1da94,[]).
x_arg1Isa(x_recordReasonForTask,x_Microtheory) :- x_cid(a65b125de1da95).
xc_microtheory(a65b125de1da95,x_PerceptualAgentMt).
xc_source_file(a65b125de1da95,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da95,426).
xc_kb_names(a65b125de1da95,[]).
xc_mapping_rows(a65b125de1da95,[]).
x_arg2Isa(x_recordReasonForTask,x_CycLExpression) :- x_cid(a65b125de1da96).
xc_microtheory(a65b125de1da96,x_PerceptualAgentMt).
xc_source_file(a65b125de1da96,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da96,427).
xc_kb_names(a65b125de1da96,[]).
xc_mapping_rows(a65b125de1da96,[]).
x_arg3Isa(x_recordReasonForTask,x_Goal) :- x_cid(a65b125de1da97).
xc_microtheory(a65b125de1da97,x_PerceptualAgentMt).
xc_source_file(a65b125de1da97,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da97,428).
xc_kb_names(a65b125de1da97,[]).
xc_mapping_rows(a65b125de1da97,[]).
x_comment(x_recordReasonForTask,"(recordReasonForTask ?mt ?action ?goal) reifies the association between a primitive action and its immediate parent goal.") :- x_cid(a65b125de1da98).
xc_microtheory(a65b125de1da98,x_PerceptualAgentMt).
xc_source_file(a65b125de1da98,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da98,429).
xc_kb_names(a65b125de1da98,[]).
xc_mapping_rows(a65b125de1da98,[]).
x_preconditionForMethod(x_and(x_not(x_groundExpression(V1)),x_outsourcedOnly(x_counterValue(x_eventCounter,V2)),x_unifies(V3,x_CommandFn(V4,V2)),x_lookupOnly('x_ist-Information'(V4,x_infoTransferred(V3,V1)))),x_methodForAction(x_recordReasonForTask(V4,V1,V5),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V4,x_reasonForTask(V3,V1,V5))))))) :- x_cid(a65b125de1da99,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de1da99,x_PerceptualAgentMt).
xc_source_file(a65b125de1da99,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da99,434).
xc_kb_names(a65b125de1da99,["?action","?num","?cmd","?mt","?goal"]).
xc_mapping_rows(a65b125de1da99,[]).
x_preconditionForMethod(x_and(x_groundExpression(V1),x_outsourcedOnly(x_counterValue(x_eventCounter,V2)),x_unifies(V3,x_CommandFn(V4,V2))),x_methodForAction(x_recordReasonForTask(V4,V1,V5),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V4,x_reasonForTask(V3,V1,V5))))))) :- x_cid(a65b125de1da9a,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de1da9a,x_PerceptualAgentMt).
xc_source_file(a65b125de1da9a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da9a,447).
xc_kb_names(a65b125de1da9a,["?action","?num","?cmd","?mt","?goal"]).
xc_mapping_rows(a65b125de1da9a,[]).
x_isa(x_trimmedList,x_BinaryPredicate) :- x_cid(a65b125de1da9b).
xc_microtheory(a65b125de1da9b,x_PerceptualAgentMt).
xc_source_file(a65b125de1da9b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da9b,457).
xc_kb_names(a65b125de1da9b,[]).
xc_mapping_rows(a65b125de1da9b,[]).
x_arity(x_trimmedList,2) :- x_cid(a65b125de1da9c).
xc_microtheory(a65b125de1da9c,x_PerceptualAgentMt).
xc_source_file(a65b125de1da9c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da9c,458).
xc_kb_names(a65b125de1da9c,[]).
xc_mapping_rows(a65b125de1da9c,[]).
x_arg1Isa(x_trimmedList,x_List) :- x_cid(a65b125de1da9d).
xc_microtheory(a65b125de1da9d,x_PerceptualAgentMt).
xc_source_file(a65b125de1da9d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da9d,459).
xc_kb_names(a65b125de1da9d,[]).
xc_mapping_rows(a65b125de1da9d,[]).
x_arg2Isa(x_trimmedList,x_List) :- x_cid(a65b125de1da9e).
xc_microtheory(a65b125de1da9e,x_PerceptualAgentMt).
xc_source_file(a65b125de1da9e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da9e,460).
xc_kb_names(a65b125de1da9e,[]).
xc_mapping_rows(a65b125de1da9e,[]).
x_comment(x_trimmedList,"(trimmedList ?input-list ?trimmed-list) binds ?trimmed-list to ?input-list with first and last elements trimmed off.") :- x_cid(a65b125de1da9f).
xc_microtheory(a65b125de1da9f,x_PerceptualAgentMt).
xc_source_file(a65b125de1da9f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1da9f,461).
xc_kb_names(a65b125de1da9f,[]).
xc_mapping_rows(a65b125de1da9f,[]).
'x_<=='(x_trimmedList(V1,V2),x_evaluate(V3,x_LengthOfListFn(V1)),x_greaterThan(V3,2),x_evaluate(V2,x_SublistFromToFn(V1,2,x_DifferenceFn(V3,1)))) :- x_cid(a65b125de1daa0,V1,V2,V3).
xc_microtheory(a65b125de1daa0,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa0,463).
xc_kb_names(a65b125de1daa0,["?full-list","?trimmed-list","?len"]).
xc_mapping_rows(a65b125de1daa0,[]).
'x_<=='(x_trimmedList(V1,x_TheList),x_evaluate(V2,x_LengthOfListFn(V1)),x_lessThan(V2,3)) :- x_cid(a65b125de1daa1,V1,V2).
xc_microtheory(a65b125de1daa1,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa1,469).
xc_kb_names(a65b125de1daa1,["?full-list","?len"]).
xc_mapping_rows(a65b125de1daa1,[]).
x_isa(x_reasonFor,x_BinaryPredicate) :- x_cid(a65b125de1daa2).
xc_microtheory(a65b125de1daa2,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa2,480).
xc_kb_names(a65b125de1daa2,[]).
xc_mapping_rows(a65b125de1daa2,[]).
x_arity(x_reasonFor,2) :- x_cid(a65b125de1daa3).
xc_microtheory(a65b125de1daa3,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa3,481).
xc_kb_names(a65b125de1daa3,[]).
xc_mapping_rows(a65b125de1daa3,[]).
x_arg1Isa(x_reasonFor,x_CycLExpression) :- x_cid(a65b125de1daa4).
xc_microtheory(a65b125de1daa4,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa4,482).
xc_kb_names(a65b125de1daa4,[]).
xc_mapping_rows(a65b125de1daa4,[]).
x_arg2Isa(x_reasonFor,x_List) :- x_cid(a65b125de1daa5).
xc_microtheory(a65b125de1daa5,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa5,483).
xc_kb_names(a65b125de1daa5,[]).
xc_mapping_rows(a65b125de1daa5,[]).
x_comment(x_reasonFor,"(reasonFor ?proposition ?audit-trail-of-goals) binds a list representing the hierarchy of goals as rationale for the statement ?proposition.") :- x_cid(a65b125de1daa6).
xc_microtheory(a65b125de1daa6,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa6,484).
xc_kb_names(a65b125de1daa6,[]).
xc_mapping_rows(a65b125de1daa6,[]).
'x_<=='(x_reasonFor(V1,V2),x_proximalReasonFor(V1,V3),x_goalName(V4,V3),x_goalHierarchyFor(V4,x_TheList,V5),x_reasonForHierarchy(V5,V2)) :- x_cid(a65b125de1daa7,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de1daa7,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa7,486).
xc_kb_names(a65b125de1daa7,["?stmt","?reason","?what","?goal-name","?hierarchy"]).
xc_mapping_rows(a65b125de1daa7,[]).
x_isa(x_proximalReasonFor,x_BinaryPredicate) :- x_cid(a65b125de1daa8).
xc_microtheory(a65b125de1daa8,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa8,492).
xc_kb_names(a65b125de1daa8,[]).
xc_mapping_rows(a65b125de1daa8,[]).
'x_<=='(x_proximalReasonFor(V1,V2),x_executionContext(V3),x_operatorFormulas(V4,V1),x_variablizedStatement(V4,V5),x_indexedEffect(V5,V6),x_instantiationOf(t(V1,V7),t(V5,V6),t(V1,V8)),x_evaluate(V9,x_Arg2Fn(x_FirstInListFn(x_SortFn(x_TheClosedRetrievalSetOf(V10,x_and(x_lookupOnly(x_localOnly('x_ist-Information'(V3,x_holdsIn(x_CommandFn(V3,V11),x_reasonForTask(V8,V12))))),x_unifies(V10,x_holdsIn(V11,x_reasonForTask(V8,V12))))),x_greaterThan,x_Arg1Fn)))),x_unifies(x_reasonForTask(V13,V2),V9)) :- x_cid(a65b125de1daa9,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125de1daa9,x_PerceptualAgentMt).
xc_source_file(a65b125de1daa9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daa9,494).
xc_kb_names(a65b125de1daa9,["?stmt","?goal","?mt","?pred","?vstmt","?vaction","?a","?action","?what","?reason-stmt","?num","?goal-rep","?act"]).
xc_mapping_rows(a65b125de1daa9,[]).
x_isa(x_goalHierarchyFor,x_TernaryPredicate) :- x_cid(a65b125de1daaa).
xc_microtheory(a65b125de1daaa,x_PerceptualAgentMt).
xc_source_file(a65b125de1daaa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daaa,516).
xc_kb_names(a65b125de1daaa,[]).
xc_mapping_rows(a65b125de1daaa,[]).
'x_<=='(x_goalHierarchyFor(V1,V2,V3),x_goalActivation(V1,V4),x_unifies(x_Percent(V5),V4),x_greaterThan(V5,0),x_evaluate(V6,x_JoinListsFn(V2,x_TheList(V1))),x_subgoal(V7,V1),x_not(x_memberOfList(V7,V2)),x_goalHierarchyFor(V7,V6,V3)) :- x_cid(a65b125de1daab,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125de1daab,x_PerceptualAgentMt).
xc_source_file(a65b125de1daab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daab,518).
xc_kb_names(a65b125de1daab,["?goal-name","?seen","?hierarchy","?pct","?activation","?new-seen","?parent"]).
xc_mapping_rows(a65b125de1daab,[]).
'x_<=='(x_goalHierarchyFor(V1,V2,V2),x_goalActivation(V1,V3),x_unifies(x_Percent(V4),V3),x_greaterThan(V4,0),x_uninferredSentence(x_subgoal(V5,V1))) :- x_cid(a65b125de1daac,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de1daac,x_PerceptualAgentMt).
xc_source_file(a65b125de1daac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daac,530).
xc_kb_names(a65b125de1daac,["?goal-name","?seen","?pct","?activation","?parent"]).
xc_mapping_rows(a65b125de1daac,[]).
x_isa(x_strategyOf,x_BinaryPredicate) :- x_cid(a65b125de1daad).
xc_microtheory(a65b125de1daad,x_PerceptualAgentMt).
xc_source_file(a65b125de1daad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daad,536).
xc_kb_names(a65b125de1daad,[]).
xc_mapping_rows(a65b125de1daad,[]).
'x_<=='(x_strategyOf(V1,V2),x_evaluate(V3,x_FirstInListFn(V1)),x_currentStrategy(V3,V2)) :- x_cid(a65b125de1daae,V1,V2,V3).
xc_microtheory(a65b125de1daae,x_PerceptualAgentMt).
xc_source_file(a65b125de1daae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daae,538).
xc_kb_names(a65b125de1daae,["?hierarchy","?strategy","?goal-name"]).
xc_mapping_rows(a65b125de1daae,[]).
'x_<=='(x_strategyOf(V1,V2),x_evaluate(V3,x_FirstInListFn(V1)),x_uninferredSentence(x_strategyFor(V3,V4)),x_evaluate(V5,x_RestOfListFn(V1)),x_currentStrategy(V5,V2)) :- x_cid(a65b125de1daaf,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de1daaf,x_PerceptualAgentMt).
xc_source_file(a65b125de1daaf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1daaf,542).
xc_kb_names(a65b125de1daaf,["?hierarchy","?strategy","?gn","?s","?rest"]).
xc_mapping_rows(a65b125de1daaf,[]).
x_isa(x_reasonForHierarchy,x_BinaryPredicate) :- x_cid(a65b125de1dab0).
xc_microtheory(a65b125de1dab0,x_PerceptualAgentMt).
xc_source_file(a65b125de1dab0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1dab0,548).
xc_kb_names(a65b125de1dab0,[]).
xc_mapping_rows(a65b125de1dab0,[]).
'x_<=='(x_reasonForHierarchy(V1,V2),x_strategyOf(V1,V2)) :- x_cid(a65b125de1dab1,V1,V2).
xc_microtheory(a65b125de1dab1,x_PerceptualAgentMt).
xc_source_file(a65b125de1dab1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1dab1,550).
xc_kb_names(a65b125de1dab1,["?hierarchy","?reason"]).
xc_mapping_rows(a65b125de1dab1,[]).
'x_<=='(x_reasonForHierarchy(V1,V2),x_uninferredSentence(x_strategyOf(V1,V3)),x_evaluate(V2,x_MapFunctionOverList(x_FunctionToArg(2,x_goalName),V1))) :- x_cid(a65b125de1dab2,V1,V2,V3).
xc_microtheory(a65b125de1dab2,x_PerceptualAgentMt).
xc_source_file(a65b125de1dab2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-decision.krf').
xc_source_line(a65b125de1dab2,553).
xc_kb_names(a65b125de1dab2,["?hierarchy","?reason","?strategy"]).
xc_mapping_rows(a65b125de1dab2,[]).
kb_cache_footer(footer{count:98,digest:a5cfe35d60b69cf3bc94f99eef1020768d68f6b1942662c022735ef273bc4bb3,headerDigest:'22064f61c265f6703c71e1dcc783306f38a538af35a969165cecc7d1ecd28781'}).
