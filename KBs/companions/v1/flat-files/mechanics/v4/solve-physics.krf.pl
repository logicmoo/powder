:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:39,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:294,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'720dccc1583213fa6862fc5380ca7663c8091727f17a11cb4ed29d7d555678cd',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:14374,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf',sourceHash:'20c5b228efcb7c85da8cc340900b470b7764ff2b3dd7b4130da69be6ef541957',warnings:[]}).
x_isa(x_workOnPhysicsProblem,x_TernaryPredicate) :- x_cid(a65b125da4fbc5).
xc_microtheory(a65b125da4fbc5,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbc5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbc5,16).
xc_kb_names(a65b125da4fbc5,[]).
xc_mapping_rows(a65b125da4fbc5,[]).
x_defSuggestion(x_SolvePhysicsProblemInMt,x_workOnPhysicsProblem(V1,V2),':subgoals',t(x_analogForProblem(V1,V3),x_forEffectOnly(x_multipleChoiceSingleOptionList(V4,V5)),x_deriveAnswerForProblem(V1,V6),x_selectMultipleChoiceAnswer(V1,V6,V2))) :- x_cid(a65b125da4fbc6,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125da4fbc6,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbc6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbc6,18).
xc_kb_names(a65b125da4fbc6,["?problem","?letter","?matcher","?foo","?bar","?answer"]).
xc_mapping_rows(a65b125da4fbc6,[]).
x_isa(x_deriveAnswerForProblem,x_TernaryPredicate) :- x_cid(a65b125da4fbc7).
xc_microtheory(a65b125da4fbc7,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbc7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbc7,27).
xc_kb_names(a65b125da4fbc7,[]).
xc_mapping_rows(a65b125da4fbc7,[]).
x_defSuggestion(x_UseAnalogyToCalculateQuantitativeAnswer,x_deriveAnswerForProblem(V1,V2),':subgoals',t(x_quantityForProblem(V1,V3),x_solvePhysicsProblemForQuantity(V1,V3,V2))) :- x_cid(a65b125da4fbc8,V1,V2,V3).
xc_microtheory(a65b125da4fbc8,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbc8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbc8,29).
xc_kb_names(a65b125da4fbc8,["?problem","?answer","?quantity"]).
xc_mapping_rows(a65b125da4fbc8,[]).
x_defSuggestion(x_UseAnalogyToDeriveQualitativeAnswer,x_deriveAnswerForProblem(V1,V2),':subgoals',t(x_qualitativeProblem(V1),x_solveQualitativePhysicsProblem(V1,V2))) :- x_cid(a65b125da4fbc9,V1,V2).
xc_microtheory(a65b125da4fbc9,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbc9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbc9,35).
xc_kb_names(a65b125da4fbc9,["?problem","?answer"]).
xc_mapping_rows(a65b125da4fbc9,[]).
x_isa(x_solvePhysicsProblemForQuantity,x_Predicate) :- x_cid(a65b125da4fbca).
xc_microtheory(a65b125da4fbca,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbca,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbca,43).
xc_kb_names(a65b125da4fbca,[]).
xc_mapping_rows(a65b125da4fbca,[]).
x_arity(x_solvePhysicsProblemForQuantity,3) :- x_cid(a65b125da4fbcb).
xc_microtheory(a65b125da4fbcb,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbcb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbcb,44).
xc_kb_names(a65b125da4fbcb,[]).
xc_mapping_rows(a65b125da4fbcb,[]).
x_defSuggestion('x_SolvePhysicsProblem-Numeric',x_solvePhysicsProblemForQuantity(V1,V2,V3),':subgoals',t(x_numericProblem(V1),x_solveForNumericalValue(V2,V3,x_TheSet))) :- x_cid(a65b125da4fbcc,V1,V2,V3).
xc_microtheory(a65b125da4fbcc,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbcc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbcc,46).
xc_kb_names(a65b125da4fbcc,["?problem","?quantity","?answer"]).
xc_mapping_rows(a65b125da4fbcc,[]).
x_defSuggestion(x_SolveRelatedQuantityForNumericalValue,x_solveRelatedQuantityForNumericalValue(x_MeasurementAtFn(V1,V2),x_MeasurementAtFn(V1,V3),V4,V5),':subgoals',t(x_evaluate(V6,x_SetAdjoinFn(V5,x_mathEquals(x_MeasurementAtFn(V1,V2),x_MeasurementAtFn(V1,V3)))),x_solveForNumericalValue(x_MeasurementAtFn(V1,V3),V7,V6),x_unifies(V7,V4))) :- x_cid(a65b125da4fbcd,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125da4fbcd,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbcd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbcd,51).
xc_kb_names(a65b125da4fbcd,["?q","?e","?other-e","?value","?equation-set","?new-equation-set","?other-answer"]).
xc_mapping_rows(a65b125da4fbcd,[]).
x_defSuggestion('x_SolvePhysicsProblem-Symbolic',x_solvePhysicsProblemForQuantity(V1,V2,V3),':subgoals',t(x_symbolicProblem(V1),x_solveForSymbolicValue(V2,V3,x_TheSet))) :- x_cid(a65b125da4fbce,V1,V2,V3).
xc_microtheory(a65b125da4fbce,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbce,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbce,66).
xc_kb_names(a65b125da4fbce,["?problem","?quantity","?answer"]).
xc_mapping_rows(a65b125da4fbce,[]).
x_isa(x_solveQualitativePhysicsProblem,x_Predicate) :- x_cid(a65b125da4fbcf).
xc_microtheory(a65b125da4fbcf,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbcf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbcf,85).
xc_kb_names(a65b125da4fbcf,[]).
xc_mapping_rows(a65b125da4fbcf,[]).
x_arity(x_solveQualitativePhysicsProblem,3) :- x_cid(a65b125da4fbd0).
xc_microtheory(a65b125da4fbd0,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd0,86).
xc_kb_names(a65b125da4fbd0,[]).
xc_mapping_rows(a65b125da4fbd0,[]).
x_defSuggestion(x_DealingWithStateElaborationProblem,x_solveQualitativePhysicsProblem(V1,V2),':subgoals',t(x_stateElaborationProblem(V1),x_solveStateElaborationProblem(V1,V2))) :- x_cid(a65b125da4fbd1,V1,V2).
xc_microtheory(a65b125da4fbd1,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd1,88).
xc_kb_names(a65b125da4fbd1,["?problem","?answer"]).
xc_mapping_rows(a65b125da4fbd1,[]).
x_defSuggestion(x_DealingWithNumericalAssumptionConsistencyProblem,x_solveQualitativePhysicsProblem(V1,V2),':subgoals',t(x_numericalAssumptionConsistencyProblem(V1),x_solveNumericalAssumptionConsistencyProblem(V1,V2))) :- x_cid(a65b125da4fbd2,V1,V2).
xc_microtheory(a65b125da4fbd2,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd2,93).
xc_kb_names(a65b125da4fbd2,["?problem","?answer"]).
xc_mapping_rows(a65b125da4fbd2,[]).
x_isa(x_solveStateElaborationProblem,x_Predicate) :- x_cid(a65b125da4fbd3).
xc_microtheory(a65b125da4fbd3,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd3,111).
xc_kb_names(a65b125da4fbd3,[]).
xc_mapping_rows(a65b125da4fbd3,[]).
x_arity(x_solveStateElaborationProblem,2) :- x_cid(a65b125da4fbd4).
xc_microtheory(a65b125da4fbd4,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd4,112).
xc_kb_names(a65b125da4fbd4,[]).
xc_mapping_rows(a65b125da4fbd4,[]).
x_defSuggestion(x_SolveStateElaborationProblemQuantity,x_solveStateElaborationProblem(V1,V2),':subgoals',t(x_hypotheticalMicrotheoryOfTest(V1,V3),x_microtheoryForAnswerChoice(V1,V3,V4),x_solveRelevantQuantityForAnswerChoices(V1,V5,V2))) :- x_cid(a65b125da4fbd5,V1,V2,V3,V4,V5).
xc_microtheory(a65b125da4fbd5,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd5,114).
xc_kb_names(a65b125da4fbd5,["?problem","?answer","?baseMt","?alternateMt","?quantity"]).
xc_mapping_rows(a65b125da4fbd5,[]).
x_isa(x_solveRelevantQuantityForAnswerChoices,x_Predicate) :- x_cid(a65b125da4fbd6).
xc_microtheory(a65b125da4fbd6,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd6,136).
xc_kb_names(a65b125da4fbd6,[]).
xc_mapping_rows(a65b125da4fbd6,[]).
x_arity(x_solveRelevantQuantityForAnswerChoices,3) :- x_cid(a65b125da4fbd7).
xc_microtheory(a65b125da4fbd7,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd7,137).
xc_kb_names(a65b125da4fbd7,[]).
xc_mapping_rows(a65b125da4fbd7,[]).
x_defSuggestion(x_FindQuantitiesToSolveFor,x_solveRelevantQuantityForAnswerChoices(V1,V2,V3),':subgoals',t(x_multipleChoiceSingleOptionList(V1,x_TheList(V4,V5)),x_quantitySuggestedByAnswerChoice(V5,V1,V6,V7,V8),x_solveForNumericalValue(x_MeasurementAtFn(V6,V8),V3,x_TheSet),x_unifies(x_MeasurementAtFn(V6,V8),V2))) :- x_cid(a65b125da4fbd8,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125da4fbd8,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd8,139).
xc_kb_names(a65b125da4fbd8,["?problem","?quantity","?answer","?value","?choice","?q","?e","?e-original"]).
xc_mapping_rows(a65b125da4fbd8,[]).
x_defSuggestion(x_EvaluateAnswerChoiceConsistency,x_evaluateConsistencyOfAnswerChoices(V1,V2,V3),':subgoals',t(x_wmOnly(x_multipleChoiceSingleOptionList(V1,x_TheList(V4,V3))),x_uninferredSentence(x_inconsistentChoice(V1,V3)),x_knownConsistentChoice(V1,V3))) :- x_cid(a65b125da4fbd9,V1,V2,V3,V4).
xc_microtheory(a65b125da4fbd9,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbd9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbd9,152).
xc_kb_names(a65b125da4fbd9,["?problem","?i-quantity","?choice","?prop"]).
xc_mapping_rows(a65b125da4fbd9,[]).
x_isa(x_solveNumericalAssumptionConsistencyProblem,x_Predicate) :- x_cid(a65b125da4fbda).
xc_microtheory(a65b125da4fbda,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbda,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbda,167).
xc_kb_names(a65b125da4fbda,[]).
xc_mapping_rows(a65b125da4fbda,[]).
x_arity(x_solveNumericalAssumptionConsistencyProblem,2) :- x_cid(a65b125da4fbdb).
xc_microtheory(a65b125da4fbdb,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbdb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbdb,168).
xc_kb_names(a65b125da4fbdb,[]).
xc_mapping_rows(a65b125da4fbdb,[]).
x_defSuggestion(x_SolveNumericalAssumptionConsistencyProblem,x_solveNumericalAssumptionConsistencyProblem(V1,V2),':subgoals',t(x_quantityRelevantForNumericalConsistency(V1,V3,V4),x_tell(x_valueOf(V3,V4)),x_solveForAnswerChoiceQuantity(V1,V5,V6),'x_selectMultipleChoiceAnswer-NumericConsistency'(V1,V3,V5,V6,V2))) :- x_cid(a65b125da4fbdc,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125da4fbdc,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbdc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbdc,171).
xc_kb_names(a65b125da4fbdc,["?problem","?answer","?quantity","?value","?ans-quantity","?ans-value"]).
xc_mapping_rows(a65b125da4fbdc,[]).
x_defSuggestion(x_SolveForAnswerChoiceQuantity,x_solveForAnswerChoiceQuantity(V1,V2,V3),':subgoals',t(x_termToSolveFor(x_TestQueryFn(V1),x_consistent(x_valueOf(V2,V4)),V4),x_solveForNumericalValue(V2,V3,x_TheSet))) :- x_cid(a65b125da4fbdd,V1,V2,V3,V4).
xc_microtheory(a65b125da4fbdd,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbdd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbdd,179).
xc_kb_names(a65b125da4fbdd,["?problem","?quantity","?answer-value","?value"]).
xc_mapping_rows(a65b125da4fbdd,[]).
x_defSuggestion('x_ValueOf-By-Assumption-Step',x_valueOf(V1,V2),':subgoals',t(x_assumedQuantityStepForQuantity(V3,V4,V2,V1),x_applicableValueForQuantity(V1,V2),x_allPreconditionsSatisfied(V4))) :- x_cid(a65b125da4fbde,V1,V2,V3,V4).
xc_microtheory(a65b125da4fbde,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbde,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbde,189).
xc_kb_names(a65b125da4fbde,["?quantity","?value","?step","?step-preconditions"]).
xc_mapping_rows(a65b125da4fbde,[]).
x_defSuggestion('x_ValueOf-By-Solve',x_valueOf(V1,V2),':subgoals',t(x_solveForNumericalValue(V1,V2,x_TheSet))) :- x_cid(a65b125da4fbdf,V1,V2).
xc_microtheory(a65b125da4fbdf,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbdf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbdf,195).
xc_kb_names(a65b125da4fbdf,["?quantity","?value"]).
xc_mapping_rows(a65b125da4fbdf,[]).
x_defSuggestion('x_SolveForNumericalValue-Debug',x_gatherAndSolveForNumericalValue(V1,V2),':subgoals',t(x_forEffectOnly(x_availableEquation(V3)),x_solveForNumericalValue(V1,V2,x_TheSet))) :- x_cid(a65b125da4fbe0,V1,V2,V3).
xc_microtheory(a65b125da4fbe0,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe0,200).
xc_kb_names(a65b125da4fbe0,["?parameter","?value","?eqn"]).
xc_mapping_rows(a65b125da4fbe0,[]).
x_defSuggestion('x_SolveForNumericalValue-ViaTimeInvariantValue',x_solveForNumericalValue(x_MeasurementAtFn(V1,V2),V3,V4),':test',x_and(x_operatorFormulas(V5,V1),'x_ist-Information'(x_PhysicsBackgroundMt,x_timeInvariantQuantity(V5))),':subgoals',t(x_uninferredSentence(x_valueOf(V1,V6)),x_findIndependentEquationFor(V1,V4,V7,V8),x_solveEquationForNumericalValue(V7,V1,V3,V8))) :- x_cid(a65b125da4fbe1,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125da4fbe1,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe1,207).
xc_kb_names(a65b125da4fbe1,["?parameter","?i-event","?value","?equation-set","?quantity-type","?temp-value","?new-equation","?new-equation-set"]).
xc_mapping_rows(a65b125da4fbe1,[]).
x_isa(x_solveForSymbolicValue,x_Predicate) :- x_cid(a65b125da4fbe2).
xc_microtheory(a65b125da4fbe2,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe2,215).
xc_kb_names(a65b125da4fbe2,[]).
xc_mapping_rows(a65b125da4fbe2,[]).
x_arity(x_solveForSymbolicValue,3) :- x_cid(a65b125da4fbe3).
xc_microtheory(a65b125da4fbe3,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe3,216).
xc_kb_names(a65b125da4fbe3,[]).
xc_mapping_rows(a65b125da4fbe3,[]).
x_defSuggestion('x_SolveForSymbolicValue-ViaTimeInvariantValue',x_solveForSymbolicValue(x_MeasurementAtFn(V1,V2),V3,V4),':test',x_and(x_operatorFormulas(V5,V1),'x_ist-Information'(x_PhysicsBackgroundMt,x_timeInvariantQuantity(V5))),':subgoals',t(x_uninferredSentence(x_valueOf(V1,V6)),x_findIndependentEquationFor(V1,V4,V7,V8),x_solveEquationForSymbolicValue(V7,V1,V3,V8))) :- x_cid(a65b125da4fbe4,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125da4fbe4,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe4,218).
xc_kb_names(a65b125da4fbe4,["?parameter","?i-event","?value","?equation-set","?quantity-type","?temp-value","?new-equation","?new-equation-set"]).
xc_mapping_rows(a65b125da4fbe4,[]).
x_defSuggestion('x_SolveForNumericalValue-ViaEquation',x_solveForNumericalValue(V1,V2,V3),':subgoals',t(x_uninferredSentence(x_valueOf(V1,V4)),x_findIndependentEquationFor(V1,V3,V5,V6),x_solveEquationForNumericalValue(V5,V1,V2,V6))) :- x_cid(a65b125da4fbe5,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125da4fbe5,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe5,226).
xc_kb_names(a65b125da4fbe5,["?parameter","?value","?equation-set","?temp-value","?new-equation","?new-equation-set"]).
xc_mapping_rows(a65b125da4fbe5,[]).
x_isa(x_selectMultipleChoiceAnswer,x_Predicate) :- x_cid(a65b125da4fbe6).
xc_microtheory(a65b125da4fbe6,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe6,252).
xc_kb_names(a65b125da4fbe6,[]).
xc_mapping_rows(a65b125da4fbe6,[]).
x_arity(x_selectMultipleChoiceAnswer,3) :- x_cid(a65b125da4fbe7).
xc_microtheory(a65b125da4fbe7,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe7,253).
xc_kb_names(a65b125da4fbe7,[]).
xc_mapping_rows(a65b125da4fbe7,[]).
x_defSuggestion(x_SelectingNumericMutlipleChoiceAnswer,x_selectMultipleChoiceAnswer(V1,V2,V3),':subgoals',t(x_numericProblem(V1),x_unknownSentence(x_numericalAssumptionConsistencyProblem(V1)),x_sanityCheckAnswer(V2,V1,V4),x_evaluate(V5,x_TheClosedRetrievalSetOf(x_TheList(V6,V7,V8),x_scoreForNumericalChoice(V6,V7,V4,V8))),x_evaluate(V3,x_FirstInListFn(x_FirstInListFn(x_SortFn(x_QuoteFn(V5),x_lessThan,x_ThirdInListFn)))))) :- x_cid(a65b125da4fbe8,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125da4fbe8,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe8,255).
xc_kb_names(a65b125da4fbe8,["?problem","?calculated-answer","?answer-choice","?sane-answer","?answer-choices","?letter","?value","?score"]).
xc_mapping_rows(a65b125da4fbe8,[]).
x_defSuggestion('x_SelectingNumericMutlipleChoiceAnswer-NumericalAssumption',x_selectMultipleChoiceAnswer(V1,V2,V3),':subgoals',t(x_numericalAssumptionConsistencyProblem(V1),x_unifies(V2,V3))) :- x_cid(a65b125da4fbe9,V1,V2,V3).
xc_microtheory(a65b125da4fbe9,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbe9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbe9,268).
xc_kb_names(a65b125da4fbe9,["?problem","?calculated-answer","?answer-choice"]).
xc_mapping_rows(a65b125da4fbe9,[]).
x_defSuggestion(x_SelectingSymbolicMultipleChoiceAnswer,x_selectMultipleChoiceAnswer(V1,V2,V3),':subgoals',t(x_symbolicProblem(V1),x_evaluate(V4,x_TheClosedRetrievalSetOf(x_TheList(V5,V6,V7),x_scoreForSymbolicChoice(V5,V6,V2,V7))),x_evaluate(V3,x_FirstInListFn(x_FirstInListFn(x_SortFn(x_QuoteFn(V4),x_lessThan,x_ThirdInListFn)))))) :- x_cid(a65b125da4fbea,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125da4fbea,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbea,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbea,273).
xc_kb_names(a65b125da4fbea,["?problem","?calculated-answer","?answer-choice","?answer-choices","?letter","?value","?score"]).
xc_mapping_rows(a65b125da4fbea,[]).
x_defSuggestion(x_SelectingStateElaborationChoiceAnswer,x_selectMultipleChoiceAnswer(V1,V2,V3),':subgoals',t(x_stateElaborationProblem(V1),x_sanityCheckAnswer(V2,V1,V4),x_multipleChoiceSingleOptionList(V1,x_TheList(V5,V6)),x_uninferredSentence(x_inconsistentChoice(V1,V6)),x_unifies(V6,V3))) :- x_cid(a65b125da4fbeb,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125da4fbeb,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125da4fbeb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/solve-physics.krf').
xc_source_line(a65b125da4fbeb,285).
xc_kb_names(a65b125da4fbeb,["?problem","?calculated-answer","?answer-choice","?sane-answer","?value","?letter"]).
xc_mapping_rows(a65b125da4fbeb,[]).
kb_cache_footer(footer{count:39,digest:'720dccc1583213fa6862fc5380ca7663c8091727f17a11cb4ed29d7d555678cd',headerDigest:'08cbcfdfb65cb56c98f6ab841cefd68388f3628d04cf1bdc00b8aa25616ba57c'}).
