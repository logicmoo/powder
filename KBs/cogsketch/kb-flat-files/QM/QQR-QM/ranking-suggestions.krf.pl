:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:43,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:546,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'3083b9e8ee61c618b9b4b64dd158d768d3cd9a7a18e6a68b0126316a2d4caef6',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:24235,source:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf',sourceHash:'00337f357c0947baada364ce340e7aa94f31e979402b65233f3e22714e49befe',warnings:[]}).
x_isa(x_NuSketchRankingProblemSolvingMt,x_Microtheory) :- x_cid(a65b125c5df83a).
xc_microtheory(a65b125c5df83a,x_NuSketchMt).
xc_source_file(a65b125c5df83a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df83a,15).
xc_kb_names(a65b125c5df83a,[]).
xc_mapping_rows(a65b125c5df83a,[]).
xc_exclude_globals(a65b125c5df83a,true).
x_comment(x_NuSketchRankingProblemSolvingMt,"Suggestions for solving conceptual physics ranking problems.") :- x_cid(a65b125c5df83b).
xc_microtheory(a65b125c5df83b,x_NuSketchMt).
xc_source_file(a65b125c5df83b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df83b,16).
xc_kb_names(a65b125c5df83b,[]).
xc_mapping_rows(a65b125c5df83b,[]).
xc_exclude_globals(a65b125c5df83b,true).
x_genlMt(x_NuSketchReasoningCollectorMt,x_NuSketchRankingProblemSolvingMt) :- x_cid(a65b125c5df83c).
xc_microtheory(a65b125c5df83c,x_NuSketchMt).
xc_source_file(a65b125c5df83c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df83c,18).
xc_kb_names(a65b125c5df83c,[]).
xc_mapping_rows(a65b125c5df83c,[]).
xc_exclude_globals(a65b125c5df83c,true).
x_genlMt(x_NuSketchRankingProblemSolvingMt,'x_ConceptualPS-QQRMt') :- x_cid(a65b125c5df83d).
xc_microtheory(a65b125c5df83d,x_NuSketchMt).
xc_source_file(a65b125c5df83d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df83d,19).
xc_kb_names(a65b125c5df83d,[]).
xc_mapping_rows(a65b125c5df83d,[]).
xc_exclude_globals(a65b125c5df83d,true).
x_isa(x_spatialQuantityRankingProblem,x_Relation) :- x_cid(a65b125c5df83e).
xc_microtheory(a65b125c5df83e,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df83e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df83e,43).
xc_kb_names(a65b125c5df83e,[]).
xc_mapping_rows(a65b125c5df83e,[]).
xc_exclude_globals(a65b125c5df83e,true).
x_defSuggestion(x_SpatialRankingProblemWithoutQPAnalysis,x_spatialQuantityRankingProblem(V1,V2,V3,V4),':documentation',"SpatialRankingProblemWithoutQPAnalysis treats the problem as a quantity\n   ranking problem immediately, in case it can be solved with information\n   already given.",':cost-function',1,':subgoals',t(x_solveSequentially(V5,V2,x_detectQuantities(V1,V5,V6)),x_quantityRankingProblem(V1,V2,V3,V4))) :- x_cid(a65b125c5df83f,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c5df83f,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df83f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df83f,46).
xc_kb_names(a65b125c5df83f,["?qtype","?ent-sits","?rel","?ranked-ent-sits","?ent-sit-pair","?q-expression"]).
xc_mapping_rows(a65b125c5df83f,[]).
xc_exclude_globals(a65b125c5df83f,true).
x_defSuggestion(x_DetectQuantitiesBeforeQPAnalysis,x_detectQuantities(V1,V2,V3),':documentation',"DetectQuantitiesBeforeQPAnalysis checks for quantities that could be\n   used in DQ analyses without QP analysis.  This is needed because \n   if a quantity isn't detected before DQ analysis it \n   will not be present in the analogy.",':subgoals',t(x_evaluate(V4,x_FirstInListFn(V2)),x_evaluate(V5,x_SecondInListFn(V2)),x_quantityExpression(V1,V4,V3),x_contextForCase(V5,V6),'x_ist-Information'(V6,x_visuallyDerivedValueOf(V3,V7)))) :- x_cid(a65b125c5df840,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c5df840,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df840,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df840,58).
xc_kb_names(a65b125c5df840,["?qtype","?ent-sit-pair","?q-expression","?entity","?situation","?context","?value"]).
xc_mapping_rows(a65b125c5df840,[]).
xc_exclude_globals(a65b125c5df840,true).
x_defSuggestion('x_SpatialQuantityRankingProblem-viaQPAnalysis',x_spatialQuantityRankingProblem(V1,V2,V3,V4),':documentation',"SpatialQuantityRankingProblem-viaQPAnalysis kicks off QQR analysis on the\n   situations being compared, then tries to solve the quantity ranking problem.",':cost-function',500,':subgoals',t(x_solveSequentially(V5,V2,x_prepAndPerformSpatialQQR(V1,V5,V6)),x_evaluate(V7,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V8,V9),x_and(x_lookupOnly(x_prepAndPerformSpatialQQR(V1,V8,V10)),x_evaluate(V11,x_FirstInListFn(V10)),x_evaluate(V12,x_SecondInListFn(V10)),x_unifies(V9,x_TheList(V11,x_AskCaseFn(x_TheSetOf(V13,'x_ist-Information'(V12,V13)))))))),V2)),x_quantityRankingProblem(V1,V7,V3,V4))) :- x_cid(a65b125c5df841,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125c5df841,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df841,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df841,75).
xc_kb_names(a65b125c5df841,["?qtype","?ent-sits","?rel","?ranked-ent-states","?ent-sit-pair","?ent-state-pair","?ent-state-case-pairs","?ent-sit","?ent-state-case","?ent-state","?entity","?state","?fact"]).
xc_mapping_rows(a65b125c5df841,[]).
xc_exclude_globals(a65b125c5df841,true).
x_defSuggestion(x_KickOffSpatialQQR,x_prepAndPerformSpatialQQR(V1,V2,V3),':documentation',"KickOffSpatialQQR looks for the domain theory mt and strategy mt for the\n   situation being analyzed and uses them to kick off a QP analysis.",':subgoals',t(x_evaluate(V4,x_FirstInListFn(V2)),x_evaluate(V5,x_SecondInListFn(V2)),x_contextForCase(V5,V6),x_scenarioModelForScenario(V6,V7),x_stateForScenarioModel(V7,V8),x_domainTheoryForScenario(V6,V9),x_modelingStrategyForScenario(V6,V10),x_lookupOnly(x_subSketchGroupRepresentsObject(V11,V6)),x_tell(x_highlightGlyph(V11)),'x_ist-Information'(V8,x_performQPAnalysis(V8,V7,V9,V6,V10)),x_tell(x_showMFIsInState(V8,V7,V9,V6,V10)),x_tell(x_unHighlightGlyph(V11)),x_unifies(V3,x_TheList(V4,V8)))) :- x_cid(a65b125c5df842,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125c5df842,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df842,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df842,104).
xc_kb_names(a65b125c5df842,["?qtype","?ent-sit","?ent-state","?entity","?situation","?scenario","?sm","?state","?dt","?strategy","?subsketch-glyph"]).
xc_mapping_rows(a65b125c5df842,[]).
xc_exclude_globals(a65b125c5df842,true).
'x_<=='(x_scenarioModelForScenario(V1,V2),x_atomicTerm(V1),x_evaluate(V2,x_SymbolConcatenateFn(x_TheList(V1,'x_-sm'))),x_tell(x_genlMt(V2,V1))) :- x_cid(a65b125c5df843,V1,V2).
xc_microtheory(a65b125c5df843,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df843,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df843,130).
xc_kb_names(a65b125c5df843,["?scenario","?sm"]).
xc_mapping_rows(a65b125c5df843,[]).
xc_exclude_globals(a65b125c5df843,true).
'x_<=='(x_stateForScenarioModel(V1,V2),x_atomicTerm(V1),x_evaluate(V2,x_SymbolConcatenateFn(x_TheList(V1,'x_-s0'))),x_tell(x_genlMt(V2,V1))) :- x_cid(a65b125c5df844,V1,V2).
xc_microtheory(a65b125c5df844,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df844,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df844,135).
xc_kb_names(a65b125c5df844,["?sm","?state"]).
xc_mapping_rows(a65b125c5df844,[]).
xc_exclude_globals(a65b125c5df844,true).
x_isa(x_quantityRankingProblem,x_Relation) :- x_cid(a65b125c5df845).
xc_microtheory(a65b125c5df845,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df845,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df845,147).
xc_kb_names(a65b125c5df845,[]).
xc_mapping_rows(a65b125c5df845,[]).
xc_exclude_globals(a65b125c5df845,true).
x_defSuggestion(x_SolveQuantityRankingProblemWithOneQuantity,x_quantityRankingProblem(V1,V2,V3,V4),':test',x_evaluate(x_False,'x_GreaterThan-UnitValuesFn'(x_LengthOfListFn(V2),1)),':subgoals',t(x_unifies(V4,V2))) :- x_cid(a65b125c5df846,V1,V2,V3,V4).
xc_microtheory(a65b125c5df846,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df846,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df846,150).
xc_kb_names(a65b125c5df846,["?qtype","?ent-sits","?rel","?ranked-ent-sits"]).
xc_mapping_rows(a65b125c5df846,[]).
xc_exclude_globals(a65b125c5df846,true).
x_defSuggestion(x_SolveQuantityRankingProblem,x_quantityRankingProblem(V1,V2,V3,V4),':test',x_evaluate(x_True,'x_GreaterThan-UnitValuesFn'(x_LengthOfListFn(V2),1)),':subgoals',t(x_quantityComparisonProblem(V1,V2,V3,V5),x_assessQuantityRankingProblem(V1,V2,V3,V5,V4))) :- x_cid(a65b125c5df847,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c5df847,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df847,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df847,157).
xc_kb_names(a65b125c5df847,["?qtype","?ent-sits","?rel","?ranked-ent-sits","?first-answer"]).
xc_mapping_rows(a65b125c5df847,[]).
xc_exclude_globals(a65b125c5df847,true).
x_defSuggestion('x_ContinueQuantityRankingProblem-OneAnswerFound',x_assessQuantityRankingProblem(V1,V2,V3,V4,V5),':test',x_operatorFormulas(x_TheList,V4),':subgoals',t(x_evaluate(V6,x_RemoveIfFn(V2,x_Kappa(t(V7),x_unifies(V7,V4)),x_IdentityFn)),x_quantityRankingProblem(V1,V6,V3,V8),x_combineComparisonAndRankingResults(V4,V8,V5)),':documentation',"ContinueQuantityRankingProblem-OneAnswerFound\n   assesses the answer found using quantityComparisonProblem and determines what to do next.\n   When one answer is found via quantity comparison, it is removed from the list of\n   entity-situation pairs and we find the next answer in the rest of the entity-situation pairs.") :- x_cid(a65b125c5df848,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c5df848,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df848,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df848,165).
xc_kb_names(a65b125c5df848,["?qtype","?ent-sits","?rel","?first-answer","?ranked-ent-sits","?rest-ent-sits","?pair","?rest-answers"]).
xc_mapping_rows(a65b125c5df848,[]).
xc_exclude_globals(a65b125c5df848,true).
x_defSuggestion('x_ContinueQuantityRankingProblem-EqualQuantitiesFound',x_assessQuantityRankingProblem(V1,V2,V3,V4,V5),':test',x_evaluate(x_True,'x_LessThan-UnitValuesFn'(x_CardinalityFn(V4),x_LengthOfListFn(V2))),':subgoals',t(x_evaluate(V6,x_JoinListsFn(x_SetToListFn(V4),V2)),x_evaluate(V7,x_RemoveIfFn(V6,x_Kappa(t(V8),x_evaluate(x_True,'x_GreaterThan-UnitValuesFn'(x_CountFn(V8,V6),1))),x_IdentityFn)),x_quantityRankingProblem(V1,V7,V3,V9),x_combineComparisonAndRankingResults(V4,V9,V5)),':documentation',"ContinueQuantityRankingProblem-EqualQuantitiesFound\n   assesses the answer found using quantityComparisonProblem and determines what to do next.\n   If the answer is a set of entity situation pairs, but not all the entity situation pairs,\n   those pairs are removed from the full list and we find the next answer in the rest of\n   the entity situation pairs.") :- x_cid(a65b125c5df849,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125c5df849,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df849,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df849,181).
xc_kb_names(a65b125c5df849,["?qtype","?ent-sits","?rel","?first-answer","?ranked-ent-sits","?union","?rest-ent-sits","?ent-sit","?rest-answers"]).
xc_mapping_rows(a65b125c5df849,[]).
xc_exclude_globals(a65b125c5df849,true).
x_defSuggestion('x_AbortQuantityRankingProblem-AllQuantitiesAreEqual',x_assessQuantityRankingProblem(V1,V2,V3,V4,V5),':test',x_evaluate(x_True,'x_EqualTo-UnitValuesFn'(x_CardinalityFn(V4),x_LengthOfListFn(V2))),':subgoals',t(x_unifies(V5,V4)),':documentation',"AbortQuantityRankingProblem-AllQuantitiesAreEqual\n   assesses the answer found using quantityComparisonProblem and determines what to do next.\n   If the answer is a set of all the entity situation pairs, that means they were all found\n   to be equal with respect to the quantity being ranked.  In this case, we simply return\n   the first answer, which is a set of all the entity situation pairs.") :- x_cid(a65b125c5df84a,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c5df84a,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df84a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df84a,204).
xc_kb_names(a65b125c5df84a,["?qtype","?ent-sits","?rel","?first-answer","?ranked-ent-sits"]).
xc_mapping_rows(a65b125c5df84a,[]).
xc_exclude_globals(a65b125c5df84a,true).
'x_<=='(x_combineComparisonAndRankingResults(V1,V2,V3),x_operatorFormulas(x_TheSet,V2),x_evaluate(V3,x_JoinListsFn(x_TheList(V1),x_TheList(V2)))) :- x_cid(a65b125c5df84b,V1,V2,V3).
xc_microtheory(a65b125c5df84b,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df84b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df84b,222).
xc_kb_names(a65b125c5df84b,["?comparison-result","?ranking-result","?combined"]).
xc_mapping_rows(a65b125c5df84b,[]).
xc_exclude_globals(a65b125c5df84b,true).
'x_<=='(x_combineComparisonAndRankingResults(V1,V2,V3),x_operatorFormulas(x_TheList,V2),x_evaluate(V3,x_JoinListsFn(x_TheList(V1),V2))) :- x_cid(a65b125c5df84c,V1,V2,V3).
xc_microtheory(a65b125c5df84c,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df84c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df84c,227).
xc_kb_names(a65b125c5df84c,["?comparison-result","?ranking-result","?combined"]).
xc_mapping_rows(a65b125c5df84c,[]).
xc_exclude_globals(a65b125c5df84c,true).
x_notForAnalogy(x_scenarioHasMFI) :- x_cid(a65b125c5df84d).
xc_microtheory(a65b125c5df84d,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df84d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df84d,256).
xc_kb_names(a65b125c5df84d,[]).
xc_mapping_rows(a65b125c5df84d,[]).
xc_exclude_globals(a65b125c5df84d,true).
x_notForAnalogy(x_ModelFragment) :- x_cid(a65b125c5df84e).
xc_microtheory(a65b125c5df84e,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df84e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df84e,257).
xc_kb_names(a65b125c5df84e,[]).
xc_mapping_rows(a65b125c5df84e,[]).
xc_exclude_globals(a65b125c5df84e,true).
x_notForAnalogy(x_mfiType) :- x_cid(a65b125c5df84f).
xc_microtheory(a65b125c5df84f,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df84f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df84f,258).
xc_kb_names(a65b125c5df84f,[]).
xc_mapping_rows(a65b125c5df84f,[]).
xc_exclude_globals(a65b125c5df84f,true).
x_notForAnalogy(x_mfiBindings) :- x_cid(a65b125c5df850).
xc_microtheory(a65b125c5df850,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df850,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df850,259).
xc_kb_names(a65b125c5df850,[]).
xc_mapping_rows(a65b125c5df850,[]).
xc_exclude_globals(a65b125c5df850,true).
x_notForAnalogy(x_mfiAntecedents) :- x_cid(a65b125c5df851).
xc_microtheory(a65b125c5df851,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df851,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df851,260).
xc_kb_names(a65b125c5df851,[]).
xc_mapping_rows(a65b125c5df851,[]).
xc_exclude_globals(a65b125c5df851,true).
x_notForAnalogy(x_mfiParticipantOf) :- x_cid(a65b125c5df852).
xc_microtheory(a65b125c5df852,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df852,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df852,261).
xc_kb_names(a65b125c5df852,[]).
xc_mapping_rows(a65b125c5df852,[]).
xc_exclude_globals(a65b125c5df852,true).
x_notForAnalogy(x_mfiConsequenceOf) :- x_cid(a65b125c5df853).
xc_microtheory(a65b125c5df853,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df853,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df853,262).
xc_kb_names(a65b125c5df853,[]).
xc_mapping_rows(a65b125c5df853,[]).
xc_exclude_globals(a65b125c5df853,true).
x_notForAnalogy(x_mfiReverseConsequenceOf) :- x_cid(a65b125c5df854).
xc_microtheory(a65b125c5df854,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df854,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df854,263).
xc_kb_names(a65b125c5df854,[]).
xc_mapping_rows(a65b125c5df854,[]).
xc_exclude_globals(a65b125c5df854,true).
x_notForAnalogy(x_scenarioModelOf) :- x_cid(a65b125c5df855).
xc_microtheory(a65b125c5df855,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df855,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df855,264).
xc_kb_names(a65b125c5df855,[]).
xc_mapping_rows(a65b125c5df855,[]).
xc_exclude_globals(a65b125c5df855,true).
x_notForAnalogy(x_queryContext) :- x_cid(a65b125c5df856).
xc_microtheory(a65b125c5df856,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df856,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df856,265).
xc_kb_names(a65b125c5df856,[]).
xc_mapping_rows(a65b125c5df856,[]).
xc_exclude_globals(a65b125c5df856,true).
x_notForAnalogy(x_activeMF) :- x_cid(a65b125c5df857).
xc_microtheory(a65b125c5df857,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df857,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df857,266).
xc_kb_names(a65b125c5df857,[]).
xc_mapping_rows(a65b125c5df857,[]).
xc_exclude_globals(a65b125c5df857,true).
x_notForAnalogy(x_suggestFor) :- x_cid(a65b125c5df858).
xc_microtheory(a65b125c5df858,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df858,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df858,267).
xc_kb_names(a65b125c5df858,[]).
xc_mapping_rows(a65b125c5df858,[]).
xc_exclude_globals(a65b125c5df858,true).
x_notForAnalogy(x_suggestionGoalForm) :- x_cid(a65b125c5df859).
xc_microtheory(a65b125c5df859,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df859,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df859,268).
xc_kb_names(a65b125c5df859,[]).
xc_mapping_rows(a65b125c5df859,[]).
xc_exclude_globals(a65b125c5df859,true).
x_notForAnalogy(x_alphalessp) :- x_cid(a65b125c5df85a).
xc_microtheory(a65b125c5df85a,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df85a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df85a,270).
xc_kb_names(a65b125c5df85a,[]).
xc_mapping_rows(a65b125c5df85a,[]).
xc_exclude_globals(a65b125c5df85a,true).
x_notForAnalogy(x_closedRetrievalSetCWA) :- x_cid(a65b125c5df85b).
xc_microtheory(a65b125c5df85b,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df85b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df85b,271).
xc_kb_names(a65b125c5df85b,[]).
xc_mapping_rows(a65b125c5df85b,[]).
xc_exclude_globals(a65b125c5df85b,true).
x_notForAnalogy(x_considerEntity) :- x_cid(a65b125c5df85c).
xc_microtheory(a65b125c5df85c,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df85c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df85c,272).
xc_kb_names(a65b125c5df85c,[]).
xc_mapping_rows(a65b125c5df85c,[]).
xc_exclude_globals(a65b125c5df85c,true).
x_notForAnalogy(x_directInfluencesOn) :- x_cid(a65b125c5df85d).
xc_microtheory(a65b125c5df85d,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df85d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df85d,273).
xc_kb_names(a65b125c5df85d,[]).
xc_mapping_rows(a65b125c5df85d,[]).
xc_exclude_globals(a65b125c5df85d,true).
x_notForAnalogy(x_dsValue) :- x_cid(a65b125c5df85e).
xc_microtheory(a65b125c5df85e,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df85e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df85e,274).
xc_kb_names(a65b125c5df85e,[]).
xc_mapping_rows(a65b125c5df85e,[]).
xc_exclude_globals(a65b125c5df85e,true).
x_notForAnalogy(x_ignoreMF) :- x_cid(a65b125c5df85f).
xc_microtheory(a65b125c5df85f,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df85f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df85f,275).
xc_kb_names(a65b125c5df85f,[]).
xc_mapping_rows(a65b125c5df85f,[]).
xc_exclude_globals(a65b125c5df85f,true).
x_notForAnalogy(x_includeEntity) :- x_cid(a65b125c5df860).
xc_microtheory(a65b125c5df860,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df860,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df860,276).
xc_kb_names(a65b125c5df860,[]).
xc_mapping_rows(a65b125c5df860,[]).
xc_exclude_globals(a65b125c5df860,true).
x_notForAnalogy(x_indirectInfluencesOn) :- x_cid(a65b125c5df861).
xc_microtheory(a65b125c5df861,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df861,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df861,277).
xc_kb_names(a65b125c5df861,[]).
xc_mapping_rows(a65b125c5df861,[]).
xc_exclude_globals(a65b125c5df861,true).
x_notForAnalogy(x_resolveDsValue) :- x_cid(a65b125c5df862).
xc_microtheory(a65b125c5df862,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df862,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df862,278).
xc_kb_names(a65b125c5df862,[]).
xc_mapping_rows(a65b125c5df862,[]).
xc_exclude_globals(a65b125c5df862,true).
x_notForAnalogy(x_temporalCWA) :- x_cid(a65b125c5df863).
xc_microtheory(a65b125c5df863,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df863,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df863,279).
xc_kb_names(a65b125c5df863,[]).
xc_mapping_rows(a65b125c5df863,[]).
xc_exclude_globals(a65b125c5df863,true).
x_notForAnalogy(x_unknownSentence) :- x_cid(a65b125c5df864).
xc_microtheory(a65b125c5df864,x_NuSketchRankingProblemSolvingMt).
xc_source_file(a65b125c5df864,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/ranking-suggestions.krf').
xc_source_line(a65b125c5df864,280).
xc_kb_names(a65b125c5df864,[]).
xc_mapping_rows(a65b125c5df864,[]).
xc_exclude_globals(a65b125c5df864,true).
kb_cache_footer(footer{count:43,digest:'3083b9e8ee61c618b9b4b64dd158d768d3cd9a7a18e6a68b0126316a2d4caef6',headerDigest:'43ef86e96597a9720d7f7716199cd2c356145bb280f28b5c6b2801c8b655cd56'}).
