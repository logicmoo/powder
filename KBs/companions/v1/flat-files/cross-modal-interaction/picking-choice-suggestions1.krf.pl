:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:6,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:90,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8e58fbe6f3e66b1df7874c46528c51efa1ae04407ac7c4144b58cb9cdd7ceb26',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/picking-choice-suggestions1.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:5035,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/picking-choice-suggestions1.krf',sourceHash:e54c04c55912e602292b284dd76d7cba8443136e8c59c054dd5fbbad1fb8147d,warnings:[]}).
x_isa(x_PickingChoiceSuggestionsMt,x_ExperimentInfraStructureFn("Cross Modal Interaction")) :- x_cid(a65b125d156a08).
xc_microtheory(a65b125d156a08,x_PickingChoiceSuggestionsMt).
xc_source_file(a65b125d156a08,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/picking-choice-suggestions1.krf').
xc_source_line(a65b125d156a08,15).
xc_kb_names(a65b125d156a08,[]).
xc_mapping_rows(a65b125d156a08,[]).
x_defSuggestion(x_PickWinningChoiceBasic,x_pickBasicChoice(V1,V2,V3,V4,V5,V6),':test',x_and(x_different(V2,x_TheList),x_evaluate(V7,x_LengthOfListFn(V2)),x_greaterThan(V7,1)),':subgoals',t(x_defaultNormalizationStrategy(x_ForcedChoiceTask,V8),x_getChoiceScorePair(V1,V2,V8,V9),x_compareScores(V9,V3,V4,V5,V6))) :- x_cid(a65b125d156a09,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125d156a09,x_PickingChoiceSuggestionsMt).
xc_source_file(a65b125d156a09,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/picking-choice-suggestions1.krf').
xc_source_line(a65b125d156a09,17).
xc_kb_names(a65b125d156a09,["?standard","?choices","?winning-choice","?winning-score","?winning-mapping","?confident","?length","?normalization-strategy","?choice-score-pairs"]).
xc_mapping_rows(a65b125d156a09,[]).
x_defSuggestion(x_PickWinningChoiceViaRerep,x_pickChoice(V1,V2,V3,V4,V5,V6),':test',x_and(x_different(V2,x_TheList),x_evaluate(V7,x_LengthOfListFn(V2)),x_greaterThan(V7,1),x_pickBasicChoice(V8,V9,V10,V11,x_false)),':subgoals',t(x_defaultNormalizationStrategy(x_Rerepresentation,V12),x_evaluate(V13,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V14,V15),x_and(x_wmOnly(x_bestComparisonWith(x_WMCaseFn(V1),x_WMCaseFn(V14),0.7,V16,V17,V18)),t(V12,V17,V19),x_unifies(V15,x_TheList(V19,x_TheList(V14,V17)))))),V2)),x_compareScores(V13,V3,V4,V5,V6))) :- x_cid(a65b125d156a0a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19).
xc_microtheory(a65b125d156a0a,x_PickingChoiceSuggestionsMt).
xc_source_file(a65b125d156a0a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/picking-choice-suggestions1.krf').
xc_source_line(a65b125d156a0a,41).
xc_kb_names(a65b125d156a0a,["?standard","?choices","?winning-choice","?winning-score","?winning-mapping","?confident","?length","?stimulus","?bad-winning-choice","?bad-winning-score","?bad-winning-mapping","?normalization-strategy","?choice-score-pairs","?choice","?choice-score","?rerep-normalization-strategy","?mapping","?comp-score","?score"]).
xc_mapping_rows(a65b125d156a0a,[]).
x_defSuggestion(x_CompareChoiceScorePairs,x_compareScores(V1,V2,V3,V4,V5),':subgoals',t(x_evaluate(V6,x_MaximumFn(V1,x_FirstInListFn)),x_evaluate(V7,x_MinimumFn(V1,x_FirstInListFn)),x_compareMaxMinScores(V6,V7,V3,V5),x_evaluate(V8,x_AssocFn(V3,V1)),x_unifies(x_TheList(V3,x_TheList(V2,V4)),V8))) :- x_cid(a65b125d156a0b,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d156a0b,x_PickingChoiceSuggestionsMt).
xc_source_file(a65b125d156a0b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/picking-choice-suggestions1.krf').
xc_source_line(a65b125d156a0b,63).
xc_kb_names(a65b125d156a0b,["?choice-score-pairs","?winning-choice","?winning-score","?winning-mapping","?confident","?max-score","?min-score","?winning-pair"]).
xc_mapping_rows(a65b125d156a0b,[]).
x_defSuggestion(x_ClearWinningChoice,x_compareMaxMinScores(V1,V2,V3,V4),':test',x_different(V1,V2),':subgoals',t(x_unifies(V3,V1),x_unifies(V4,x_true))) :- x_cid(a65b125d156a0c,V1,V2,V3,V4).
xc_microtheory(a65b125d156a0c,x_PickingChoiceSuggestionsMt).
xc_source_file(a65b125d156a0c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/picking-choice-suggestions1.krf').
xc_source_line(a65b125d156a0c,73).
xc_kb_names(a65b125d156a0c,["?max-score","?min-score","?winning-score","?confident"]).
xc_mapping_rows(a65b125d156a0c,[]).
x_defSuggestion(x_ChoicesWithSameScores,x_compareMaxMinScores(V1,V2,V3,V4),':test',x_uninferredSentence(x_different(V1,V2)),':subgoals',t(x_unifies(V3,V1),x_unifies(V4,x_false))) :- x_cid(a65b125d156a0d,V1,V2,V3,V4).
xc_microtheory(a65b125d156a0d,x_PickingChoiceSuggestionsMt).
xc_source_file(a65b125d156a0d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/picking-choice-suggestions1.krf').
xc_source_line(a65b125d156a0d,79).
xc_kb_names(a65b125d156a0d,["?max-score","?min-score","?winning-score","?confident"]).
xc_mapping_rows(a65b125d156a0d,[]).
kb_cache_footer(footer{count:6,digest:'8e58fbe6f3e66b1df7874c46528c51efa1ae04407ac7c4144b58cb9cdd7ceb26',headerDigest:'80bcb6bf0b19bbc8b97e03b8563d78722ddc2522b179bc3acfb5ad2b9f5ea270'}).
