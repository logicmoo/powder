:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:15,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:203,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'22fcbf33d596a8f1194bffb04ede90bf101b3b5e199291969879a420d2da603f',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:10279,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf',sourceHash:d9160418c591cade28a6af07c7a9f980619adb4c934b4043edd7c5a4327fd4f6,warnings:[]}).
x_isa(x_PerformForcedChoiceTaskPlansMt,x_ExperimentInfraStructureFn("Cross Modal Interaction")) :- x_cid(a65b125d12f644).
xc_microtheory(a65b125d12f644,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f644,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f644,15).
xc_kb_names(a65b125d12f644,[]).
xc_mapping_rows(a65b125d12f644,[]).
x_isa(x_selectChoiceMatchingLabel,x_ComplexActionPredicate) :- x_cid(a65b125d12f645).
xc_microtheory(a65b125d12f645,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f645,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f645,17).
xc_kb_names(a65b125d12f645,[]).
xc_mapping_rows(a65b125d12f645,[]).
x_arity(x_selectChoiceMatchingLabel,3) :- x_cid(a65b125d12f646).
xc_microtheory(a65b125d12f646,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f646,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f646,18).
xc_kb_names(a65b125d12f646,[]).
xc_mapping_rows(a65b125d12f646,[]).
x_preconditionForMethod(x_and(x_wmOnly(x_isa(x_LabeledAbstractionFn(V1,V2),x_LabeledAbstractionWMMicrotheory)),x_unifies(V3,x_LabeledAbstractionFn(V1,V2)),x_evaluate(V4,x_SetToListFn(x_TheClosedRetrievalSetOf(V5,x_and(x_wmOnly(x_isa(x_PerceptualReferentCaseFn(x_PossibleLabelFn(V1),V6,V7),x_PerceptualReferentWMMicrotheory)),x_unifies(V5,x_EncodedCaseFn(x_PerceptualReferentCaseFn(x_PossibleLabelFn(V1),V6,V7),'x_SUB-EP-ID')))))),x_different(V4,x_TheList)),x_methodForAction(x_selectChoiceMatchingLabel(V1,V6,V8),x_actionSequence(x_TheList(x_doAnnounce("The standard is a labeledAbstraction : ~A",[V3]),x_doMap(t(V9),x_doAnnounce("choice : ~A",[V9]),V4),x_doAgentPlan(x_chooseBestChoice(V3,V4)))))) :- x_cid(a65b125d12f647,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125d12f647,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f647,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f647,21).
xc_kb_names(a65b125d12f647,["?label","?referred-item-set","?standard","?choices","?choice-encoding","?dem-var","?sketch-item","?_referent","?choice"]).
xc_mapping_rows(a65b125d12f647,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 34, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 36, column 38), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d12f647,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 34, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 36, column 38), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_wmOnly(x_isa(x_LabeledAbstractionFn(V1,V2),x_LabeledAbstractionWMMicrotheory)),x_unifies(V3,x_LabeledAbstractionFn(V1,V2)),x_evaluate(V4,x_SetToListFn(x_TheClosedRetrievalSetOf(V5,x_and(x_wmOnly(x_sameVisualEncodedObject(x_PerceptualReferentCaseFn(x_PossibleLabelFn(V1),V6,V7),x_PerceptualReferentCaseFn(V8,V9,V7))),x_unifies(V5,x_EncodedCaseFn(x_PerceptualReferentCaseFn(V8,V9,V7),'x_SUB-EP-ID')))))),x_different(V4,x_TheList)),x_methodForAction(x_selectChoiceMatchingLabel(V1,V6,V10),x_actionSequence(x_TheList(x_doAnnounce("The standard is a labeledAbstraction : ~A",[V3]),x_doMap(t(V11),x_doAnnounce("choice from prior encoding: ~A",[V11]),V4),x_doAgentPlan(x_chooseBestChoice(V3,V4)))))) :- x_cid(a65b125d12f648,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125d12f648,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f648,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f648,42).
xc_kb_names(a65b125d12f648,["?label","?referred-item-set","?standard","?choices","?choice-encoding","?dem-var","?sketch-item","?pos-label","?pos-var","?_referent","?choice"]).
xc_mapping_rows(a65b125d12f648,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 57, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 59, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d12f648,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 57, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 59, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_isa(x_LabeledAbstractionFn(V1,V2),x_LabeledAbstractionWMMicrotheory)),x_wmOnly(x_isa(x_PerceptualReferentCaseFn(V1,V3,V4),x_PerceptualReferentWMMicrotheory)),x_unifies(V5,x_EncodedCaseFn(x_PerceptualReferentCaseFn(V1,V3,V4),'x_SUB-EP-ID')),x_evaluate(V6,x_SetToListFn(x_TheClosedRetrievalSetOf(V7,x_and(x_wmOnly(x_isa(x_PerceptualReferentCaseFn(x_PossibleLabelFn(V1),V8,V9),x_PerceptualReferentWMMicrotheory)),x_unifies(V7,x_EncodedCaseFn(x_PerceptualReferentCaseFn(x_PossibleLabelFn(V1),V8,V9),'x_SUB-EP-ID')))))),x_different(V6,x_TheList)),x_methodForAction(x_selectChoiceMatchingLabel(V1,V8,V10),x_actionSequence(x_TheList(x_doAnnounce("The standard is just one element : ~A",[V5]),x_doMap(t(V11),x_doAnnounce("choice  : ~A",[V11]),V6),x_doAgentPlan(x_chooseBestChoice(V5,V6)))))) :- x_cid(a65b125d12f649,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125d12f649,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f649,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f649,65).
xc_kb_names(a65b125d12f649,["?label","?_referred-item-set","?var","?item","?standard","?choices","?choice-encoding","?dem-var","?sketch-item","?_referent","?choice"]).
xc_mapping_rows(a65b125d12f649,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 79, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 81, column 39), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d12f649,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 79, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 81, column 39), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_isa(x_LabeledAbstractionFn(V1,V2),x_LabeledAbstractionWMMicrotheory)),x_wmOnly(x_isa(x_PerceptualReferentCaseFn(V1,V3,V4),x_PerceptualReferentWMMicrotheory)),x_unifies(V5,x_EncodedCaseFn(x_PerceptualReferentCaseFn(V1,V3,V4),'x_SUB-EP-ID')),x_evaluate(V6,x_SetToListFn(x_TheClosedRetrievalSetOf(V7,x_and(x_wmOnly(x_sameVisualEncodedObject(x_PerceptualReferentCaseFn(x_PossibleLabelFn(V1),V8,V9),x_PerceptualReferentCaseFn(V10,V11,V9))),x_unifies(V7,x_EncodedCaseFn(x_PerceptualReferentCaseFn(V10,V11,V9),'x_SUB-EP-ID')))))),x_different(V6,x_TheList)),x_methodForAction(x_selectChoiceMatchingLabel(V1,V8,V12),x_actionSequence(x_TheList(x_doAnnounce("The standard is just one element : ~A",[V5]),x_doMap(t(V13),x_doAnnounce("choice from prior encoding: ~A",[V13]),V6),x_doAgentPlan(x_chooseBestChoice(V5,V6)))))) :- x_cid(a65b125d12f64a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125d12f64a,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f64a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f64a,87).
xc_kb_names(a65b125d12f64a,["?label","?_referred-item-set","?var","?item","?standard","?choices","?choice-encoding","?dem-var","?sketch-item","?pos-label","?pos-var","?_referent","?choice"]).
xc_mapping_rows(a65b125d12f64a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 103, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 105, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d12f64a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 103, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 105, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_chooseBestChoice,x_ComplexActionPredicate) :- x_cid(a65b125d12f64b).
xc_microtheory(a65b125d12f64b,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f64b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f64b,119).
xc_kb_names(a65b125d12f64b,[]).
xc_mapping_rows(a65b125d12f64b,[]).
x_arity(x_chooseBestChoice,2) :- x_cid(a65b125d12f64c).
xc_microtheory(a65b125d12f64c,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f64c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f64c,120).
xc_kb_names(a65b125d12f64c,[]).
xc_mapping_rows(a65b125d12f64c,[]).
x_preconditionForMethod(x_and(x_different(V1,x_TheList),x_evaluate(V2,x_LengthOfListFn(V1)),x_greaterThan(V2,1),x_wmOnly(x_uninferredSentence('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_pickBasicChoice(V3,V1,V4,V5,V6,V7))))),x_methodForAction(x_chooseBestChoice(V3,V1),x_actionSequence(x_TheList(x_doMap(t(V8),x_doCompare(x_WMCaseFn(V3),x_WMCaseFn(V8),x_TheSet),V1),x_doSolve(x_pickBasicChoice(V3,V1,V4,V5,V6,V7),x_CrossModalInteractionSpindleMt),x_doAgentPlan(x_chooseBestChoice(V3,V1)))))) :- x_cid(a65b125d12f64d,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d12f64d,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f64d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f64d,122).
xc_kb_names(a65b125d12f64d,["?choices","?length","?standard","?winning-choice","?winning-score","?winning-mapping","?confident","?choice"]).
xc_mapping_rows(a65b125d12f64d,[]).
x_preconditionForMethod(x_and(x_wmOnly('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_pickBasicChoice(V1,V2,V3,V4,V5,x_true))),x_currentNuSketchHookup(V6)),x_methodForAction(x_chooseBestChoice(V1,V2),x_actionSequence(x_TheList(x_doAgentPlan(x_doTell('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_pickChoice(V1,V2,V3,V4,V5,x_true)))),x_doAgentPlan(x_doAnnounce("was able to pick ~A without much work",[V3])),x_doRemoteAgentPlan(V6,x_selectWinningGlyph(V3)))))) :- x_cid(a65b125d12f64e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d12f64e,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f64e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f64e,141).
xc_kb_names(a65b125d12f64e,["?standard","?choices","?winning-choice","?winning-score","?winning-mapping","?nusketch-hookup-agent"]).
xc_mapping_rows(a65b125d12f64e,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 152, column 70), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d12f64e,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 152, column 70), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_wmOnly('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_pickBasicChoice(V1,V2,V3,V4,V5,x_false))),x_defaultNormalizationStrategy(x_Rerepresentation,V6)),x_methodForAction(x_chooseBestChoice(V1,V2),x_actionSequence(x_TheList(x_doMap(t(V7),x_doSolve(x_bestComparisonWith(x_WMCaseFn(V1),x_WMCaseFn(V7),0.7,V6,V8,V9),x_CrossModalInteractionSpindleMt),V2),x_doAgentPlan(x_doSolve(x_pickChoice(V1,V2,V10,V11,V12,V13),x_CrossModalInteractionSpindleMt)),x_doAgentPlan(x_announcePickChoiceResults(V1,V2)))))) :- x_cid(a65b125d12f64f,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125d12f64f,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f64f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f64f,158).
xc_kb_names(a65b125d12f64f,["?standard","?choices","?_rand-choice","?_rand-score","?_rand-mapping","?normalization-strategy","?choice","?_mapping","?_score","?_winning-choice","?_winning-score","?_winning-mapping","?_confident"]).
xc_mapping_rows(a65b125d12f64f,[]).
x_isa(x_announcePickChoiceResults,x_ComplexActionPredicate) :- x_cid(a65b125d12f650).
xc_microtheory(a65b125d12f650,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f650,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f650,181).
xc_kb_names(a65b125d12f650,[]).
xc_mapping_rows(a65b125d12f650,[]).
x_arity(x_announcePickChoiceResults,2) :- x_cid(a65b125d12f651).
xc_microtheory(a65b125d12f651,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f651,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f651,182).
xc_kb_names(a65b125d12f651,[]).
xc_mapping_rows(a65b125d12f651,[]).
x_preconditionForMethod(x_and(x_currentNuSketchHookup(V1),x_wmOnly('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_pickChoice(V2,V3,V4,V5,V6,V7)))),x_methodForAction(x_announcePickChoiceResults(V2,V3),x_actionSequence(x_TheList(x_doAnnounce("after rerepresentation the winning choice: ~A winning-score: ~A with confident: ~A",[V4,V5,V7]),x_doRemoteAgentPlan(V1,x_selectWinningGlyph(V4)))))) :- x_cid(a65b125d12f652,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d12f652,x_PerformForcedChoiceTaskPlansMt).
xc_source_file(a65b125d12f652,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/perform-forced-choice-task-plans.krf').
xc_source_line(a65b125d12f652,184).
xc_kb_names(a65b125d12f652,["?nusketch-hookup-agent","?standard","?choices","?winning-choice","?winning-score","?_winning-mapping","?confident"]).
xc_mapping_rows(a65b125d12f652,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 194, column 17), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d12f652,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 194, column 17), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:15,digest:'22fcbf33d596a8f1194bffb04ede90bf101b3b5e199291969879a420d2da603f',headerDigest:'100a0a85383ca58afc222ae46ad6550394f1e343e4c3cc2210e3d22972569d49'}).
