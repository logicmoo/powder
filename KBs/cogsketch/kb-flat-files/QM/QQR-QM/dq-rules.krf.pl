:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:33,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:284,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:c25d3353d126e174b34654bd01413ba3152367851878ba707ee1613b3db78042,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:13264,source:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf',sourceHash:baa21f163c18cb3824317272a2a1a1a37d90fd25444e20672447ea9c589dae5b,warnings:[]}).
x_isa(x_NuSketchDQA,x_Microtheory) :- x_cid(a65b125c57be45).
xc_microtheory(a65b125c57be45,x_NuSketchMt).
xc_source_file(a65b125c57be45,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be45,15).
xc_kb_names(a65b125c57be45,[]).
xc_mapping_rows(a65b125c57be45,[]).
xc_exclude_globals(a65b125c57be45,true).
x_comment(x_NuSketchDQA,"Rules for handling NuSketch-specific differential qualitative analyses.") :- x_cid(a65b125c57be46).
xc_microtheory(a65b125c57be46,x_NuSketchMt).
xc_source_file(a65b125c57be46,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be46,16).
xc_kb_names(a65b125c57be46,[]).
xc_mapping_rows(a65b125c57be46,[]).
xc_exclude_globals(a65b125c57be46,true).
x_genlMt(x_NuSketchReasoningCollectorMt,x_NuSketchDQA) :- x_cid(a65b125c57be47).
xc_microtheory(a65b125c57be47,x_NuSketchMt).
xc_source_file(a65b125c57be47,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be47,18).
xc_kb_names(a65b125c57be47,[]).
xc_mapping_rows(a65b125c57be47,[]).
xc_exclude_globals(a65b125c57be47,true).
x_genlMt(x_NuSketchDQA,'x_ConceptualPS-QQRMt') :- x_cid(a65b125c57be48).
xc_microtheory(a65b125c57be48,x_NuSketchMt).
xc_source_file(a65b125c57be48,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be48,19).
xc_kb_names(a65b125c57be48,[]).
xc_mapping_rows(a65b125c57be48,[]).
xc_exclude_globals(a65b125c57be48,true).
'x_<=='(x_contextForCase(V1,V2),x_unifies(V1,x_AskCaseFn(x_TheSetOf(V3,'x_ist-Information'(V4,V3)))),x_lookupOnly(x_stateForRankingProblem(V2,V4))) :- x_cid(a65b125c57be49,V1,V2,V3,V4).
xc_microtheory(a65b125c57be49,x_NuSketchDQA).
xc_source_file(a65b125c57be49,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be49,37).
xc_kb_names(a65b125c57be49,["?case","?qp-state-mt","?x","?bundle-mt"]).
xc_mapping_rows(a65b125c57be49,[]).
xc_exclude_globals(a65b125c57be49,true).
'x_<=='(x_contextForCase(V1,V2),x_unifies(V1,x_AskCaseFn(x_TheSetOf(V3,'x_ist-Information'(V2,V3)))),x_evaluate(x_TheSet,x_TheClosedRetrievalSetOf(V4,x_lookupOnly(x_stateForRankingProblem(V4,V1))))) :- x_cid(a65b125c57be4a,V1,V2,V3,V4).
xc_microtheory(a65b125c57be4a,x_NuSketchDQA).
xc_source_file(a65b125c57be4a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be4a,41).
xc_kb_names(a65b125c57be4a,["?case","?bundle-mt","?x","?qp-state-mt"]).
xc_mapping_rows(a65b125c57be4a,[]).
xc_exclude_globals(a65b125c57be4a,true).
x_defSuggestion(x_SolveDQviaVisualQuantities,x_solveDQValue(V1,V2,V3,V4,V5,V6),':subgoals',t('x_ist-Information'(V3,x_visuallyDerivedValueOf(V1,V7)),'x_ist-Information'(V4,x_visuallyDerivedValueOf(V2,V8)),x_deriveDQValueFromNumbers(V7,V8,V6)),':documentation',"SolveDQViaVisualQuantities looks for things that can be\ncalculated visually, either by fetching the information from sketched annotations\nor by doing some ink processing.") :- x_cid(a65b125c57be4b,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c57be4b,x_NuSketchDQA).
xc_source_file(a65b125c57be4b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be4b,53).
xc_kb_names(a65b125c57be4b,["?quantity","?target-q","?base-mt","?target-mt","?m","?value","?v1","?v2"]).
xc_mapping_rows(a65b125c57be4b,[]).
xc_exclude_globals(a65b125c57be4b,true).
x_isa(x_visuallyDerivedValueOf,x_BinaryPredicate) :- x_cid(a65b125c57be4c).
xc_microtheory(a65b125c57be4c,x_NuSketchDQA).
xc_source_file(a65b125c57be4c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be4c,68).
xc_kb_names(a65b125c57be4c,[]).
xc_mapping_rows(a65b125c57be4c,[]).
xc_exclude_globals(a65b125c57be4c,true).
x_genlPreds(x_visuallyDerivedValueOf,x_valueOf) :- x_cid(a65b125c57be4d).
xc_microtheory(a65b125c57be4d,x_NuSketchDQA).
xc_source_file(a65b125c57be4d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be4d,69).
xc_kb_names(a65b125c57be4d,[]).
xc_mapping_rows(a65b125c57be4d,[]).
xc_exclude_globals(a65b125c57be4d,true).
x_arity(x_visuallyDerivedValueOf,2) :- x_cid(a65b125c57be4e).
xc_microtheory(a65b125c57be4e,x_NuSketchDQA).
xc_source_file(a65b125c57be4e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be4e,70).
xc_kb_names(a65b125c57be4e,[]).
xc_mapping_rows(a65b125c57be4e,[]).
xc_exclude_globals(a65b125c57be4e,true).
x_arg1Isa(x_visuallyDerivedValueOf,x_ContinuousQuantity) :- x_cid(a65b125c57be4f).
xc_microtheory(a65b125c57be4f,x_NuSketchDQA).
xc_source_file(a65b125c57be4f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be4f,71).
xc_kb_names(a65b125c57be4f,[]).
xc_mapping_rows(a65b125c57be4f,[]).
xc_exclude_globals(a65b125c57be4f,true).
x_arg2Isa(x_visuallyDerivedValueOf,x_ScalarOrVectorInterval) :- x_cid(a65b125c57be50).
xc_microtheory(a65b125c57be50,x_NuSketchDQA).
xc_source_file(a65b125c57be50,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be50,72).
xc_kb_names(a65b125c57be50,[]).
xc_mapping_rows(a65b125c57be50,[]).
xc_exclude_globals(a65b125c57be50,true).
x_comment(x_visuallyDerivedValueOf,"A binary predicate that says that the value of the first argument\nis equal to the second.  The equality is derived visually, either\nby using information from a #$VisualQuantity or some other visual\ncomputation.  visuallyDerivedValueOf is specialization of #$valueOf .") :- x_cid(a65b125c57be51).
xc_microtheory(a65b125c57be51,x_NuSketchDQA).
xc_source_file(a65b125c57be51,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be51,73).
xc_kb_names(a65b125c57be51,[]).
xc_mapping_rows(a65b125c57be51,[]).
xc_exclude_globals(a65b125c57be51,true).
'x_<=='(x_visuallyDerivedValueOf(V1,V2),x_unifies(V1,x_QuantityDenotedByAnnotation(V3,V4,V5)),x_lookupOnly(x_visualQuantityQuantitativeMeasurement(V6,V2)),x_unifies(V6,x_QuantityDenotedByAnnotation(V7,V4,V8)),x_subsetOf(V5,V8)) :- x_cid(a65b125c57be52,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c57be52,x_NuSketchDQA).
xc_source_file(a65b125c57be52,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be52,85).
xc_kb_names(a65b125c57be52,["?visual-quantity","?value","?annotation-object","?quantity-indicator","?annotated-objects","?existing-visual-quantity","?existing-annotation-object","?existing-annotated-objects"]).
xc_mapping_rows(a65b125c57be52,[]).
xc_exclude_globals(a65b125c57be52,true).
'x_<=='(x_visuallyDerivedValueOf(V1,V2),x_unifies(V1,x_QuantityDenotedByAnnotation(V3,V4,V5)),x_lookupOnly(x_visualQuantityMeasurement(V6,V2)),x_unifies(V6,x_QuantityDenotedByAnnotation(V7,V4,V8)),x_subsetOf(V5,V8)) :- x_cid(a65b125c57be53,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c57be53,x_NuSketchDQA).
xc_source_file(a65b125c57be53,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be53,95).
xc_kb_names(a65b125c57be53,["?visual-quantity","?value","?annotation-object","?quantity-indicator","?annotated-objects","?existing-visual-quantity","?existing-annotation-object","?existing-annotated-objects"]).
xc_mapping_rows(a65b125c57be53,[]).
xc_exclude_globals(a65b125c57be53,true).
'x_<=='(x_visuallyDerivedValueOf(V1,V2),x_operatorFormulas(V3,V1),x_formulaArgument(V1,1,V4),x_visualQuantityIndicatorForQPQuantityFn(V5,V3),x_lookupOnly(x_visualQuantityQuantitativeMeasurement(x_QuantityDenotedByAnnotation(V6,V5,V7),V2)),x_subsetOf(x_TheSet(V4),V7)) :- x_cid(a65b125c57be54,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c57be54,x_NuSketchDQA).
xc_source_file(a65b125c57be54,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be54,106).
xc_kb_names(a65b125c57be54,["?qp-quantity","?value","?qp-q-fn","?object","?vqi","?annotation-obj","?annotated-objs"]).
xc_mapping_rows(a65b125c57be54,[]).
xc_exclude_globals(a65b125c57be54,true).
'x_<=='(x_visuallyDerivedValueOf(V1,V2),x_operatorFormulas(V3,V1),x_formulaArgument(V1,1,V4),x_visualQuantityIndicatorForQPQuantityFn(V5,V3),x_lookupOnly(x_visualQuantityMeasurement(x_QuantityDenotedByAnnotation(V6,V5,V7),V2)),x_subsetOf(x_TheSet(V4),V7)) :- x_cid(a65b125c57be55,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c57be55,x_NuSketchDQA).
xc_source_file(a65b125c57be55,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be55,120).
xc_kb_names(a65b125c57be55,["?qp-quantity","?value","?qp-q-fn","?object","?vqi","?annotation-obj","?annotated-objs"]).
xc_mapping_rows(a65b125c57be55,[]).
xc_exclude_globals(a65b125c57be55,true).
'x_<=='(x_visuallyDerivedValueOf(x_2DNetForceFn(V1,V2),V3),x_groundExpression(V2),x_combinedVectorsAlongAxis(t(x_VectorQuantityOfFn(x_ForceVector),V1),V2,V3)) :- x_cid(a65b125c57be56,V1,V2,V3).
xc_microtheory(a65b125c57be56,x_NuSketchDQA).
xc_source_file(a65b125c57be56,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be56,134).
xc_kb_names(a65b125c57be56,["?object","?axis","?value"]).
xc_mapping_rows(a65b125c57be56,[]).
xc_exclude_globals(a65b125c57be56,true).
'x_<=='(x_visuallyDerivedValueOf(x_2DNetVelocityFn(V1,V2),V3),x_groundExpression(V2),x_combinedVectorsAlongAxis(t(x_VectorQuantityOfFn(x_LinearVelocityVector),V1),V2,V3)) :- x_cid(a65b125c57be57,V1,V2,V3).
xc_microtheory(a65b125c57be57,x_NuSketchDQA).
xc_source_file(a65b125c57be57,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be57,138).
xc_kb_names(a65b125c57be57,["?object","?axis","?value"]).
xc_mapping_rows(a65b125c57be57,[]).
xc_exclude_globals(a65b125c57be57,true).
'x_<=='(x_visuallyDerivedValueOf(x_2DNetAccelerationFn(V1,V2),V3),x_groundExpression(V2),x_combinedVectorsAlongAxis(t(x_VectorQuantityOfFn(x_LinearAccelerationVector),V1),V2,V3)) :- x_cid(a65b125c57be58,V1,V2,V3).
xc_microtheory(a65b125c57be58,x_NuSketchDQA).
xc_source_file(a65b125c57be58,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be58,142).
xc_kb_names(a65b125c57be58,["?object","?axis","?value"]).
xc_mapping_rows(a65b125c57be58,[]).
xc_exclude_globals(a65b125c57be58,true).
'x_<=='(x_visuallyDerivedValueOf(x_1DNetForceFn(V1,V2),V3),x_groundExpression(V2),x_combinedVectorsAlongAxis(t(x_VectorQuantityOfFn(x_ForceVector),V1),V2,V3)) :- x_cid(a65b125c57be59,V1,V2,V3).
xc_microtheory(a65b125c57be59,x_NuSketchDQA).
xc_source_file(a65b125c57be59,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be59,151).
xc_kb_names(a65b125c57be59,["?object","?axis","?value"]).
xc_mapping_rows(a65b125c57be59,[]).
xc_exclude_globals(a65b125c57be59,true).
'x_<=='(x_visuallyDerivedValueOf(t(x_QPQuantityFn(x_AngleBetweenVectors),V1,V2),V3),x_angleBetweenVectors(V1,V2,V3)) :- x_cid(a65b125c57be5a,V1,V2,V3).
xc_microtheory(a65b125c57be5a,x_NuSketchDQA).
xc_source_file(a65b125c57be5a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be5a,164).
xc_kb_names(a65b125c57be5a,["?v1","?v2","?value"]).
xc_mapping_rows(a65b125c57be5a,[]).
xc_exclude_globals(a65b125c57be5a,true).
'x_<=='(x_visuallyDerivedValueOf(x_DistanceFn(V1,x_CenterOfMassFn(V2)),V3),x_groundExpression(V1),x_queryContext(V4),x_lookupOnly(x_stateForScenarioModel(V5,V4)),x_lookupOnly(x_scenarioModelForScenario(V6,V5)),'x_ist-Information'(V6,x_distanceBetween(x_CentroidPointFn(V1),x_AverageCentroidPointFn(V2),V3))) :- x_cid(a65b125c57be5b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c57be5b,x_NuSketchDQA).
xc_source_file(a65b125c57be5b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be5b,168).
xc_kb_names(a65b125c57be5b,["?object","?list","?value","?state","?sm","?bundle-context"]).
xc_mapping_rows(a65b125c57be5b,[]).
xc_exclude_globals(a65b125c57be5b,true).
'x_<=='(x_visuallyDerivedValueOf(t(x_QPQuantityFn(x_Area),V1),V2),x_groundExpression(V1),x_queryContext(V3),'x_ist-Information'(V3,x_areaOfObject(V1,V2))) :- x_cid(a65b125c57be5c,V1,V2,V3).
xc_microtheory(a65b125c57be5c,x_NuSketchDQA).
xc_source_file(a65b125c57be5c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be5c,178).
xc_kb_names(a65b125c57be5c,["?obj","?value","?state"]).
xc_mapping_rows(a65b125c57be5c,[]).
xc_exclude_globals(a65b125c57be5c,true).
'x_<=='(x_visuallyDerivedValueOf(t(x_QPQuantityFn(x_Length),V1),V2),x_lookupOnly(x_localOnly(x_isa(V1,x_ArrowDrawnSymbol))),x_lookupOnly(x_glyphRepresentsObject(V3,V1)),x_arrowLength(V3,V2)) :- x_cid(a65b125c57be5d,V1,V2,V3).
xc_microtheory(a65b125c57be5d,x_NuSketchDQA).
xc_source_file(a65b125c57be5d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be5d,183).
xc_kb_names(a65b125c57be5d,["?obj","?value","?g"]).
xc_mapping_rows(a65b125c57be5d,[]).
xc_exclude_globals(a65b125c57be5d,true).
x_isa(x_combinedVectorsAlongAxis,x_TernaryPredicate) :- x_cid(a65b125c57be5e).
xc_microtheory(a65b125c57be5e,x_NuSketchDQA).
xc_source_file(a65b125c57be5e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be5e,191).
xc_kb_names(a65b125c57be5e,[]).
xc_mapping_rows(a65b125c57be5e,[]).
xc_exclude_globals(a65b125c57be5e,true).
x_arity(x_combinedVectorsAlongAxis,3) :- x_cid(a65b125c57be5f).
xc_microtheory(a65b125c57be5f,x_NuSketchDQA).
xc_source_file(a65b125c57be5f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be5f,192).
xc_kb_names(a65b125c57be5f,[]).
xc_mapping_rows(a65b125c57be5f,[]).
xc_exclude_globals(a65b125c57be5f,true).
x_arg1Isa(x_combinedVectorsAlongAxis,x_ScalarOrVectorInterval) :- x_cid(a65b125c57be60).
xc_microtheory(a65b125c57be60,x_NuSketchDQA).
xc_source_file(a65b125c57be60,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be60,193).
xc_kb_names(a65b125c57be60,[]).
xc_mapping_rows(a65b125c57be60,[]).
xc_exclude_globals(a65b125c57be60,true).
x_arg2Isa(x_combinedVectorsAlongAxis,x_QVAxis) :- x_cid(a65b125c57be61).
xc_microtheory(a65b125c57be61,x_NuSketchDQA).
xc_source_file(a65b125c57be61,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be61,194).
xc_kb_names(a65b125c57be61,[]).
xc_mapping_rows(a65b125c57be61,[]).
xc_exclude_globals(a65b125c57be61,true).
x_arg3Isa(x_combinedVectorsAlongAxis,x_ScalarOrVectorInterval) :- x_cid(a65b125c57be62).
xc_microtheory(a65b125c57be62,x_NuSketchDQA).
xc_source_file(a65b125c57be62,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be62,195).
xc_kb_names(a65b125c57be62,[]).
xc_mapping_rows(a65b125c57be62,[]).
xc_exclude_globals(a65b125c57be62,true).
x_comment(x_combinedVectorsAlongAxis,"combinedVectorsAlongAxis combines a vector quantity across a particular axis.  For example,\n   if there is a block with two forces acting on it, a 20 Newton force pointing right and \n   a 10 Newton force pointing left, then \n   (combinedVectorsAlongAxis ((VectorQuantityOfFn ForceVector) block) LeftRightAxis (Newton 10))\n   is true.  See also #$valueOf #$qvAxisAlignedSense.") :- x_cid(a65b125c57be63).
xc_microtheory(a65b125c57be63,x_NuSketchDQA).
xc_source_file(a65b125c57be63,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be63,196).
xc_kb_names(a65b125c57be63,[]).
xc_mapping_rows(a65b125c57be63,[]).
xc_exclude_globals(a65b125c57be63,true).
'x_<=='(x_combinedVectorsAlongAxis(t(V1,V2),V3,V4),x_evaluate(V5,x_TheClosedRetrievalSetOf(V6,x_and(x_valueOf(t(V1,V2),x_VectorFn(V7,V8)),x_qvAxisAligned(V8,V3)))),x_different(V5,x_TheSet),x_evaluate(V9,x_TheClosedRetrievalSetOf(V7,x_and(x_qvAxisAlignedSense(V3,V8,x_Plus),x_valueOf(t(V1,V2),x_VectorFn(V7,V8))))),x_evaluate(V10,x_TheClosedRetrievalSetOf(V7,x_and(x_qvAxisAlignedSense(V3,V8,x_Minus),x_valueOf(t(V1,V2),x_VectorFn(V7,V8))))),x_evaluate(V4,x_DifferenceFn(x_PlusAll(V9,x_IdentityFn),x_PlusAll(V10,x_IdentityFn)))) :- x_cid(a65b125c57be64,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125c57be64,x_NuSketchDQA).
xc_source_file(a65b125c57be64,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be64,203).
xc_kb_names(a65b125c57be64,["?quantity-fn","?object","?axis","?value","?all-vectors-along-axis","?v","?mag","?dir","?positives","?negatives"]).
xc_mapping_rows(a65b125c57be64,[]).
xc_exclude_globals(a65b125c57be64,true).
'x_<=='(x_valueOf(t(x_VectorQuantityOfFn(x_LinearVelocityVector),V1),x_VectorFn(V2,V3)),x_lookupOnly(x_movesWith(V1,V4)),x_lookupOnly(x_valueOf(t(x_VectorQuantityOfFn(x_LinearVelocityVector),V4),x_VectorFn(V2,V3)))) :- x_cid(a65b125c57be65,V1,V2,V3,V4).
xc_microtheory(a65b125c57be65,x_NuSketchDQA).
xc_source_file(a65b125c57be65,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/QQR-QM/dq-rules.krf').
xc_source_line(a65b125c57be65,225).
xc_kb_names(a65b125c57be65,["?object","?mag","?dir","?reference-object"]).
xc_mapping_rows(a65b125c57be65,[]).
xc_exclude_globals(a65b125c57be65,true).
kb_cache_footer(footer{count:33,digest:c25d3353d126e174b34654bd01413ba3152367851878ba707ee1613b3db78042,headerDigest:'20b3c3166ff34953fc8d89b420efbcde0b6b62bc65f8bd78fe13af26a84ded9c'}).
