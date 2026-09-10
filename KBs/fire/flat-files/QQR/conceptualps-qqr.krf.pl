:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:47,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:196,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8f3c2089881af03a45b59ee4c5887a3ee92a51943b2a700cc8a4b4e16cc56f82',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:10681,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf',sourceHash:'9bd3c40fc54ca4a1845ed6199800527b259f589856578ffb79a3fa8a02b6d64b',warnings:[]}).
x_isa('x_ConceptualPS-QQRMt',x_Microtheory) :- x_cid(a65b126b7751a2).
xc_microtheory(a65b126b7751a2,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751a2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751a2,15).
xc_kb_names(a65b126b7751a2,[]).
xc_mapping_rows(a65b126b7751a2,[]).
x_genlMt('x_ConceptualPS-QQRMt',x_CompositionalModelingMt) :- x_cid(a65b126b7751a3).
xc_microtheory(a65b126b7751a3,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751a3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751a3,16).
xc_kb_names(a65b126b7751a3,[]).
xc_mapping_rows(a65b126b7751a3,[]).
x_genlMt('x_ConceptualPS-QQRMt',x_DQAnalysisMt) :- x_cid(a65b126b7751a4).
xc_microtheory(a65b126b7751a4,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751a4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751a4,17).
xc_kb_names(a65b126b7751a4,[]).
xc_mapping_rows(a65b126b7751a4,[]).
x_genlMt('x_ConceptualPS-QQRMt',x_QPTheoryMt) :- x_cid(a65b126b7751a5).
xc_microtheory(a65b126b7751a5,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751a5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751a5,18).
xc_kb_names(a65b126b7751a5,[]).
xc_mapping_rows(a65b126b7751a5,[]).
x_genlMt(x_SKEAReasoningCollectorMt,'x_ConceptualPS-QQRMt') :- x_cid(a65b126b7751a6).
xc_microtheory(a65b126b7751a6,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751a6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751a6,19).
xc_kb_names(a65b126b7751a6,[]).
xc_mapping_rows(a65b126b7751a6,[]).
x_comment(x_ConceptualPSMt,"ConceptualPSMt provides problem analysis knowledge that,\n combined with methods for qualitative and quantiative reasoning, support the\n solution of conceptual problems concerning continuous systems.  Examples include\n physics problems and everyday physical reasoning.") :- x_cid(a65b126b7751a7).
xc_microtheory(a65b126b7751a7,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751a7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751a7,21).
xc_kb_names(a65b126b7751a7,[]).
xc_mapping_rows(a65b126b7751a7,[]).
x_isa(x_quantityComparisonProblem,x_Relation) :- x_cid(a65b126b7751a8).
xc_microtheory(a65b126b7751a8,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751a8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751a8,26).
xc_kb_names(a65b126b7751a8,[]).
xc_mapping_rows(a65b126b7751a8,[]).
x_arity(x_quantityComparisonProblem,4) :- x_cid(a65b126b7751a9).
xc_microtheory(a65b126b7751a9,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751a9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751a9,27).
xc_kb_names(a65b126b7751a9,[]).
xc_mapping_rows(a65b126b7751a9,[]).
x_comment(x_quantityComparisonProblem,"(quantityComparisonProblem ?qtype ?ent-sits ?rel ?ent-sit) describes an n-way\n comparison problem.  ?ent-sits is a list of pairs, each an entity and a situation.\n ?qtype is the quantity type of interest, and ?rel is the comparative relationship.\n ?ent-sit is the pair that satisfies ?rel for (?qtype ?ent) over all the elements\n of ?ent-sits.  For example, if there were more information in UniverseDataMt,\n   (quantityComparisonProblem\n      (FunctionToArg 2 diameterOfObject)\n        (TheList (TheList PlanetEarth UniverseDataMt)\n                 (TheList PlanetJupiter UniverseDataMt))\n        MaximumFn ?ent-sit)\n should produce a binding of (TheList PlanetJupiter UniverseDataMt) for ?ent-sit.\n Returning the list is important, because often selecting the right choice in\n a multiple choice question requires referring to the situation, which is linked\n to a choice.") :- x_cid(a65b126b7751aa).
xc_microtheory(a65b126b7751aa,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751aa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751aa,29).
xc_kb_names(a65b126b7751aa,[]).
xc_mapping_rows(a65b126b7751aa,[]).
x_defSuggestion(x_HandleDegenerateQuantityComparisonCase,x_quantityComparisonProblem(V1,V2,V3,V4),':test',x_evaluate(x_False,'x_GreaterThan-UnitValuesFn'(x_LengthOfListFn(V2),1)),':subgoals',t(x_evaluate(V4,x_ListToSetFn(V2))),':documentation',"HandleDegenerateQuantityComparisonCase takes care of situations\n where fewer than two situations are passed in.  Not really clear what to do in\n this case, but turning it into a set is type-compatible with the rest of the\n implementaiton for this part of the problem-solving.") :- x_cid(a65b126b7751ab,V1,V2,V3,V4).
xc_microtheory(a65b126b7751ab,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751ab,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751ab,45).
xc_kb_names(a65b126b7751ab,["?qtype","?ent-sits","?rel","?ent-sit"]).
xc_mapping_rows(a65b126b7751ab,[]).
x_defSuggestion(x_ReduceQuantityComparisonToBinaryDQ,x_quantityComparisonProblem(V1,V2,V3,V4),':test',x_evaluate(2,x_LengthOfListFn(V2)),':subgoals',t(x_evaluate(V5,x_FirstInListFn(V2)),x_evaluate(V6,x_SecondInListFn(V2)),x_extractFirstPairsFromListOrSet(V5,V7,V8),x_extractFirstPairsFromListOrSet(V6,V9,V10),x_contextForCase(V8,V11),x_contextForCase(V10,V12),x_quantityExpression(V1,V7,V13),x_quantityExpression(V1,V9,V14),x_tell('x_ist-Information'(V11,x_hasQuantity(V7,V13))),x_tell('x_ist-Information'(V12,x_hasQuantity(V9,V14))),x_solveDQProblemBinarySystems(V13,V8,V14,V10,V15),x_selectSituationForComparativeAnswer(V5,V6,V15,V3,V4)),':documentation',"ReduceQuantityComparisonToBinaryDQ handles the case where there\n                  are only two situations to compare.") :- x_cid(a65b126b7751ac,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15).
xc_microtheory(a65b126b7751ac,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751ac,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751ac,54).
xc_kb_names(a65b126b7751ac,["?qtype","?ent-sits","?rel","?ent-sit","?first-pair","?second-pair","?base-obj","?base-dgr","?target-obj","?target-dgr","?base-mt","?target-mt","?q-base","?q-target","?value"]).
xc_mapping_rows(a65b126b7751ac,[]).
x_isa(x_extractFirstPairsFromListOrSet,x_Predicate) :- x_cid(a65b126b7751ad).
xc_microtheory(a65b126b7751ad,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751ad,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751ad,80).
xc_kb_names(a65b126b7751ad,[]).
xc_mapping_rows(a65b126b7751ad,[]).
x_arity(x_extractFirstPairsFromListOrSet,3) :- x_cid(a65b126b7751ae).
xc_microtheory(a65b126b7751ae,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751ae,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751ae,81).
xc_kb_names(a65b126b7751ae,[]).
xc_mapping_rows(a65b126b7751ae,[]).
x_arg1Isa(x_extractFirstPairsFromListOrSet,'x_SetOrList-Extensional') :- x_cid(a65b126b7751af).
xc_microtheory(a65b126b7751af,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751af,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751af,82).
xc_kb_names(a65b126b7751af,[]).
xc_mapping_rows(a65b126b7751af,[]).
x_arg2Isa(x_extractFirstPairsFromListOrSet,'x_SetOrList-Extensional') :- x_cid(a65b126b7751b0).
xc_microtheory(a65b126b7751b0,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b0,83).
xc_kb_names(a65b126b7751b0,[]).
xc_mapping_rows(a65b126b7751b0,[]).
x_arg3Isa(x_extractFirstPairsFromListOrSet,'x_SetOrList-Extensional') :- x_cid(a65b126b7751b1).
xc_microtheory(a65b126b7751b1,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b1,84).
xc_kb_names(a65b126b7751b1,[]).
xc_mapping_rows(a65b126b7751b1,[]).
x_comment(x_extractFirstPairsFromListOrSet,"(extractFirstPairsFromListOrSet <list or set> <first> <second>) is a helper for ReduceQuantityComparisonToBinaryDQ,\n to handle the case where a prior stage of processing provided a set of entries instead of just one.\n That is, the first argument is either (TheList <first> <second>) or (TheSet (TheList <some 1st> <some 2nd>) ...).\n The assumption is that, since the situations represented were equivalent, it doesn't matter which of\n them is chosen for the next step of processing.") :- x_cid(a65b126b7751b2).
xc_microtheory(a65b126b7751b2,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b2,85).
xc_kb_names(a65b126b7751b2,[]).
xc_mapping_rows(a65b126b7751b2,[]).
'x_<=='(x_extractFirstPairsFromListOrSet(V1,V2,V3),x_operatorFormulas(x_TheSet,V1),x_evaluate(V4,x_SetToListFn(V1)),x_evaluate(V5,x_FirstInListFn(V4)),x_evaluate(V2,x_FirstInListFn(V5)),x_evaluate(V3,x_SecondInListFn(V5))) :- x_cid(a65b126b7751b3,V1,V2,V3,V4,V5).
xc_microtheory(a65b126b7751b3,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b3,92).
xc_kb_names(a65b126b7751b3,["?pair-or-set","?first","?second","?equivalent-list","?entry"]).
xc_mapping_rows(a65b126b7751b3,[]).
'x_<=='(x_extractFirstPairsFromListOrSet(V1,V2,V3),x_operatorFormulas(x_TheList,V1),x_evaluate(V2,x_FirstInListFn(V1)),x_evaluate(V3,x_SecondInListFn(V1))) :- x_cid(a65b126b7751b4,V1,V2,V3).
xc_microtheory(a65b126b7751b4,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b4,99).
xc_kb_names(a65b126b7751b4,["?pair-or-set","?first","?second"]).
xc_mapping_rows(a65b126b7751b4,[]).
x_isa(x_quantityExpression,x_TernaryPredicate) :- x_cid(a65b126b7751b5).
xc_microtheory(a65b126b7751b5,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b5,104).
xc_kb_names(a65b126b7751b5,[]).
xc_mapping_rows(a65b126b7751b5,[]).
x_arity(x_quantityExpression,3) :- x_cid(a65b126b7751b6).
xc_microtheory(a65b126b7751b6,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b6,105).
xc_kb_names(a65b126b7751b6,[]).
xc_mapping_rows(a65b126b7751b6,[]).
x_arg1Isa(x_quantityExpression,x_CycLExpression) :- x_cid(a65b126b7751b7).
xc_microtheory(a65b126b7751b7,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b7,106).
xc_kb_names(a65b126b7751b7,[]).
xc_mapping_rows(a65b126b7751b7,[]).
x_arg2Isa(x_quantityExpression,x_Thing) :- x_cid(a65b126b7751b8).
xc_microtheory(a65b126b7751b8,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b8,107).
xc_kb_names(a65b126b7751b8,[]).
xc_mapping_rows(a65b126b7751b8,[]).
x_arg3Isa(x_quantityExpression,x_CycLExpression) :- x_cid(a65b126b7751b9).
xc_microtheory(a65b126b7751b9,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751b9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751b9,108).
xc_kb_names(a65b126b7751b9,[]).
xc_mapping_rows(a65b126b7751b9,[]).
x_comment(x_quantityExpression,"(quantityExpression <quantity-type> <thing> <quantity-expression>) is a helper for ReduceQuantityComparisonToBinaryDQ\n   that combines the thing with the quantity type to create an expression that denotes the quantity of interest.\n   The quantity type can be an atomic term or a pattern with a variable, e.g., \n   (quantityExpression MassFn Earth (MassFn Earth)) and \n   (quantityExpression (NetForceMagFn ?obj LeftRightAxis) block (NetForceMagFn block LeftRightAxis)).") :- x_cid(a65b126b7751ba).
xc_microtheory(a65b126b7751ba,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751ba,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751ba,109).
xc_kb_names(a65b126b7751ba,[]).
xc_mapping_rows(a65b126b7751ba,[]).
'x_<=='(x_quantityExpression(V1,V2,V3),x_atomicTerm(V1),x_tell(x_hasQuantity(V2,t(V1,V2))),x_unifies(V3,t(V1,V2))) :- x_cid(a65b126b7751bb,V1,V2,V3).
xc_microtheory(a65b126b7751bb,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751bb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751bb,116).
xc_kb_names(a65b126b7751bb,["?qtype","?obj","?q-expr"]).
xc_mapping_rows(a65b126b7751bb,[]).
'x_<=='(x_quantityExpression(x_QPQuantityFn(V1),V2,V3),x_atomicTerm(V1),x_tell(x_hasQuantity(V2,t(x_QPQuantityFn(V1),V2))),x_unifies(V3,t(x_QPQuantityFn(V1),V2))) :- x_cid(a65b126b7751bc,V1,V2,V3).
xc_microtheory(a65b126b7751bc,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751bc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751bc,121).
xc_kb_names(a65b126b7751bc,["?cyc-Q","?obj","?q-expr"]).
xc_mapping_rows(a65b126b7751bc,[]).
'x_<=='(x_quantityExpression(V1,V2,V3),x_not(x_atomicTerm(V1)),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_and(x_formulaArgument(V1,V6,V5),x_variableExpression(V5)))),x_unifies(x_TheSet(V7),V4),x_evaluate(V3,x_SublisFn(x_TheSet(t(V7,V2)),V1))) :- x_cid(a65b126b7751bd,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b126b7751bd,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751bd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751bd,128).
xc_kb_names(a65b126b7751bd,["?qtype","?obj","?q-expr","?unbound-args","?var","?n","?q-var"]).
xc_mapping_rows(a65b126b7751bd,[]).
x_defSuggestion('x_ReduceN-wayQuantityComparisonProblem',x_quantityComparisonProblem(V1,V2,V3,V4),':test',x_evaluate(x_True,'x_GreaterThan-UnitValuesFn'(x_LengthOfListFn(V2),2)),':subgoals',t(x_evaluate(V5,x_FirstInListFn(V2)),x_evaluate(V6,x_SecondInListFn(V2)),x_evaluate(V7,x_RestOfListFn(x_RestOfListFn(V2))),x_evaluate(V8,x_TheList(V5,V6)),x_quantityComparisonProblem(V1,V8,V3,V9),x_evaluate(V10,x_JoinListsFn(x_TheList(V9),V7)),x_quantityComparisonProblem(V1,V10,V3,V4))) :- x_cid(a65b126b7751be,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b126b7751be,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751be,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751be,137).
xc_kb_names(a65b126b7751be,["?qtype","?ent-sits","?rel","?ent-sit","?first-pair","?second-pair","?rest","?first-comparison","?first-answer","?next-sits"]).
xc_mapping_rows(a65b126b7751be,[]).
x_isa(x_selectSituationForComparativeAnswer,x_Predicate) :- x_cid(a65b126b7751bf).
xc_microtheory(a65b126b7751bf,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751bf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751bf,155).
xc_kb_names(a65b126b7751bf,[]).
xc_mapping_rows(a65b126b7751bf,[]).
x_arity(x_selectSituationForComparativeAnswer,5) :- x_cid(a65b126b7751c0).
xc_microtheory(a65b126b7751c0,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c0,156).
xc_kb_names(a65b126b7751c0,[]).
xc_mapping_rows(a65b126b7751c0,[]).
x_arg1Isa(x_selectSituationForComparativeAnswer,'x_List-Extensional') :- x_cid(a65b126b7751c1).
xc_microtheory(a65b126b7751c1,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c1,157).
xc_kb_names(a65b126b7751c1,[]).
xc_mapping_rows(a65b126b7751c1,[]).
x_arg2Isa(x_selectSituationForComparativeAnswer,'x_List-Extensional') :- x_cid(a65b126b7751c2).
xc_microtheory(a65b126b7751c2,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c2,158).
xc_kb_names(a65b126b7751c2,[]).
xc_mapping_rows(a65b126b7751c2,[]).
x_arg3Isa(x_selectSituationForComparativeAnswer,x_PossibleDSValue) :- x_cid(a65b126b7751c3).
xc_microtheory(a65b126b7751c3,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c3,159).
xc_kb_names(a65b126b7751c3,[]).
xc_mapping_rows(a65b126b7751c3,[]).
x_arg4Isa(x_selectSituationForComparativeAnswer,x_FluentOrdinalPredicate) :- x_cid(a65b126b7751c4).
xc_microtheory(a65b126b7751c4,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c4,160).
xc_kb_names(a65b126b7751c4,[]).
xc_mapping_rows(a65b126b7751c4,[]).
x_arg5Isa(x_selectSituationForComparativeAnswer,'x_List-Extensional') :- x_cid(a65b126b7751c5).
xc_microtheory(a65b126b7751c5,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c5,161).
xc_kb_names(a65b126b7751c5,[]).
xc_mapping_rows(a65b126b7751c5,[]).
x_comment(x_selectSituationForComparativeAnswer,"(selectSituationForComparativeAnswer ?first ?second ?value ?rel ?chosen) is used to compute\n   which pair of ?first, ?second satisifies the relationship ?rel, via looking at the DQ value\n   ?value.  The answer is bound to ?chosen.  When values are the same, ?chosen is bound\n   to a set of both.") :- x_cid(a65b126b7751c6).
xc_microtheory(a65b126b7751c6,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c6,162).
xc_kb_names(a65b126b7751c6,[]).
xc_mapping_rows(a65b126b7751c6,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,-1,x_qLessThan,V1)) :- x_cid(a65b126b7751c7,V1,V2).
xc_microtheory(a65b126b7751c7,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c7,169).
xc_kb_names(a65b126b7751c7,["?first","?second"]).
xc_mapping_rows(a65b126b7751c7,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,1,x_qLessThan,V2)) :- x_cid(a65b126b7751c8,V1,V2).
xc_microtheory(a65b126b7751c8,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c8,170).
xc_kb_names(a65b126b7751c8,["?first","?second"]).
xc_mapping_rows(a65b126b7751c8,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,-1,x_qGreaterThan,V2)) :- x_cid(a65b126b7751c9,V1,V2).
xc_microtheory(a65b126b7751c9,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751c9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751c9,171).
xc_kb_names(a65b126b7751c9,["?first","?second"]).
xc_mapping_rows(a65b126b7751c9,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,1,x_qGreaterThan,V1)) :- x_cid(a65b126b7751ca,V1,V2).
xc_microtheory(a65b126b7751ca,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751ca,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751ca,172).
xc_kb_names(a65b126b7751ca,["?first","?second"]).
xc_mapping_rows(a65b126b7751ca,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,-1,x_MaximumFn,V1)) :- x_cid(a65b126b7751cb,V1,V2).
xc_microtheory(a65b126b7751cb,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751cb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751cb,173).
xc_kb_names(a65b126b7751cb,["?first","?second"]).
xc_mapping_rows(a65b126b7751cb,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,1,x_MaximumFn,V2)) :- x_cid(a65b126b7751cc,V1,V2).
xc_microtheory(a65b126b7751cc,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751cc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751cc,174).
xc_kb_names(a65b126b7751cc,["?first","?second"]).
xc_mapping_rows(a65b126b7751cc,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,-1,x_MinimumFn,V2)) :- x_cid(a65b126b7751cd,V1,V2).
xc_microtheory(a65b126b7751cd,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751cd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751cd,175).
xc_kb_names(a65b126b7751cd,["?first","?second"]).
xc_mapping_rows(a65b126b7751cd,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,1,x_MinimumFn,V1)) :- x_cid(a65b126b7751ce,V1,V2).
xc_microtheory(a65b126b7751ce,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751ce,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751ce,176).
xc_kb_names(a65b126b7751ce,["?first","?second"]).
xc_mapping_rows(a65b126b7751ce,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,0,V3,V4),x_operatorFormulas(x_TheSet,V1),x_evaluate(V4,x_SetOrCollectionUnion(V1,x_TheSet(V2)))) :- x_cid(a65b126b7751cf,V1,V2,V3,V4).
xc_microtheory(a65b126b7751cf,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751cf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751cf,181).
xc_kb_names(a65b126b7751cf,["?first","?second","?rel","?ent-sit-pair-set"]).
xc_mapping_rows(a65b126b7751cf,[]).
'x_<=='(x_selectSituationForComparativeAnswer(V1,V2,0,V3,V4),x_operatorFormulas(x_TheList,V1),x_evaluate(V4,x_TheSet(V1,V2))) :- x_cid(a65b126b7751d0,V1,V2,V3,V4).
xc_microtheory(a65b126b7751d0,'x_ConceptualPS-QQRMt').
xc_source_file(a65b126b7751d0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/conceptualps-qqr.krf').
xc_source_line(a65b126b7751d0,186).
xc_kb_names(a65b126b7751d0,["?first","?second","?rel","?ent-sit-pair-set"]).
xc_mapping_rows(a65b126b7751d0,[]).
kb_cache_footer(footer{count:47,digest:'8f3c2089881af03a45b59ee4c5887a3ee92a51943b2a700cc8a4b4e16cc56f82',headerDigest:'4ce7eff20481224714c0e95b0c35cca53d59b5c4a222e9dc583ddb3d69a58939'}).
