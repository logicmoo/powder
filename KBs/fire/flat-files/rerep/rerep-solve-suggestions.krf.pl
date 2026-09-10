:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:6,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:100,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8eec7d4ace964fd888ac88ef5630e89e1b1bc7d721f587a722c140a4e52b6188',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/rerep/rerep-solve-suggestions.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:6387,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/rerep/rerep-solve-suggestions.krf',sourceHash:'9fd9565f06e58bffcf3ef8f1ccc0cd2921ba17fb38b93476206b1ae9aac1068f',warnings:[]}).
x_defSuggestion(x_ComparisonWithRerepresentation,x_bestComparisonWith(V1,V2,V3,V4,V5,V6),':cost-function',1,':subgoals',t(x_outsourcedOnly(x_blockMostOutOfMappingSupport(x_matchBetween(V1,V2,x_TheSet,V7))),x_outsourcedOnly(x_bestMapping(V7,V8)),t(V4,V8,V9),x_lessThanOrEqualTo(V3,V9),x_exploreRerepresentations(V1,V2,V8,V9,V4,V5,V6)),':documentation',"ComparisonWithRerepresentation is the entry point for performing analogical comparison with\nrerepresentation enabled. This does the First comparison and attempts to see if the mapping can be improved\nvia rerepresentation. It achieves this by delegating the work to rerepresentMapping.") :- x_cid(a65b12813ce7cf,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12813ce7cf,x_RerepresentationSolveSuggestionsMt).
xc_source_file(a65b12813ce7cf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/rerep/rerep-solve-suggestions.krf').
xc_source_line(a65b12813ce7cf,4).
xc_kb_names(a65b12813ce7cf,["?base","?target","?rerep-threshold","?normalization-strategy","?best-mapping","?best-score","?match","?mapping","?score"]).
xc_mapping_rows(a65b12813ce7cf,[]).
x_defSuggestion(x_ComparisonWithNoRerepresentation,x_bestComparisonWith(V1,V2,V3,V4,V5,V6),':cost-function',2,':subgoals',t(x_outsourcedOnly(x_blockMostOutOfMappingSupport(x_matchBetween(V1,V2,x_TheSet,V7))),x_outsourcedOnly(x_bestMapping(V7,V8)),t(V4,V8,V9),x_lessThan(V9,V3),x_unifies(V5,V8),x_unifies(V6,V9)),':documentation',"ComparisonWithRerepresentation is the entry point for performing analogical comparison with\nrerepresentation enabled. This does the First comparison and attempts to see if the mapping can be improved\nvia rerepresentation. It achieves this by delegating the work to rerepresentMapping.") :- x_cid(a65b12813ce7d0,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12813ce7d0,x_RerepresentationSolveSuggestionsMt).
xc_source_file(a65b12813ce7d0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/rerep/rerep-solve-suggestions.krf').
xc_source_line(a65b12813ce7d0,17).
xc_kb_names(a65b12813ce7d0,["?base","?target","?rerep-threshold","?normalization-strategy","?best-mapping","?best-score","?match","?mapping","?score"]).
xc_mapping_rows(a65b12813ce7d0,[]).
x_defSuggestion(x_TryRerepresentationImproved,x_exploreRerepresentations(V1,V2,V3,V4,V5,V6,V7),':test',x_rerepSuggestionsFor(V3,V8,V9,V10),':subgoals',t(x_evaluate(V11,x_SetToListFn(x_TheClosedRetrievalSetOf(x_TheList(V12,V13,V14),x_wmOnly(x_rerepSuggestionsFor(V3,V12,V13,V14))))),x_outsourcedOnly(x_blockMostOutOfMappingSupport(x_matchBetween(x_RerepresentedCaseFn(V1,V11),x_RerepresentedCaseFn(V2,V11),x_TheSet,V15))),x_outsourcedOnly(x_bestMapping(V15,V16)),t(V5,V16,V17),x_evaluateRerepresentationProgress(V17,V16,V3,V4,V5,V6,V7)),':documentation',"The work is performed recursively.  First it is verified if there are rerep suggestions for\nthe input mapping. If they exist they are utilized via the RerepresentedCaseFn case-constructor which takes as input\na dgroup and rerep suggestions and provides as output the modified (Rerepresented) case. This case-sontructor\nis used to rerepresent base and target as necessary. The comparison of start-score and new score is done via \nevaluateRerepresentationProgress") :- x_cid(a65b12813ce7d1,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17).
xc_microtheory(a65b12813ce7d1,x_RerepresentationSolveSuggestionsMt).
xc_source_file(a65b12813ce7d1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/rerep/rerep-solve-suggestions.krf').
xc_source_line(a65b12813ce7d1,33).
xc_kb_names(a65b12813ce7d1,["?base","?target","?start-mapping","?start-score","?normalization-strategy","?final-mapping","?final-score","?x","?y","?z","?suggestions","?nac","?base-rewrite","?target-rewrite","?match","?mapping","?score"]).
xc_mapping_rows(a65b12813ce7d1,[]).
x_defSuggestion(x_ExploreRerepresentationConditionalEndCase,x_evaluateRerepresentationProgress(V1,V2,V3,V4,V5,V6,V7),':subgoals',t(x_lessThanOrEqualTo(V1,V4),x_unifies(V6,V3),x_unifies(V7,V4)),':documentation',"If candidate-score <= start-score that means that rerepresentation did not\nimprove the score. So return the start-score and start-mapping as the final result") :- x_cid(a65b12813ce7d2,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12813ce7d2,x_RerepresentationSolveSuggestionsMt).
xc_source_file(a65b12813ce7d2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/rerep/rerep-solve-suggestions.krf').
xc_source_line(a65b12813ce7d2,62).
xc_kb_names(a65b12813ce7d2,["?candidate-score","?candidate-mapping","?start-mapping","?start-score","?normalization-strategy","?final-mapping","?final-score"]).
xc_mapping_rows(a65b12813ce7d2,[]).
x_defSuggestion(x_ExploreRerepresentationConditionalContinueCase,x_evaluateRerepresentationProgress(V1,V2,V3,V4,V5,V6,V7),':subgoals',t(x_greaterThan(V1,V4),x_baseOfMapping(V2,V8),x_targetOfMapping(V2,V9),x_exploreRerepresentations(V8,V9,V2,V1,V5,V6,V7)),':documentation',"If candidate-score > start-score that means that rerepresentation did \nimprove the score, so see if we can improveeven further by delegating to exploreRerepresentations") :- x_cid(a65b12813ce7d3,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12813ce7d3,x_RerepresentationSolveSuggestionsMt).
xc_source_file(a65b12813ce7d3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/rerep/rerep-solve-suggestions.krf').
xc_source_line(a65b12813ce7d3,75).
xc_kb_names(a65b12813ce7d3,["?candidate-score","?candidate-mapping","?start-mapping","?start-score","?normalization-strategy","?final-mapping","?final-score","?new-start-base","?new-start-target"]).
xc_mapping_rows(a65b12813ce7d3,[]).
x_defSuggestion(x_TryRerepresentationTerminate,x_exploreRerepresentations(V1,V2,V3,V4,V5,V6,V7),':test',x_uninferredSentence(x_rerepSuggestionsFor(V3,V8,V9,V10)),':subgoals',t(x_unifies(V4,V7),x_unifies(V3,V6)),':documentation',"IF there are no rerep suggestions. the start-score is returned as the final-score") :- x_cid(a65b12813ce7d4,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12813ce7d4,x_RerepresentationSolveSuggestionsMt).
xc_source_file(a65b12813ce7d4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/rerep/rerep-solve-suggestions.krf').
xc_source_line(a65b12813ce7d4,92).
xc_kb_names(a65b12813ce7d4,["?base","?target","?start-mapping","?start-score","?normalization-strategy","?final-mapping","?final-score","?x","?y","?z"]).
xc_mapping_rows(a65b12813ce7d4,[]).
kb_cache_footer(footer{count:6,digest:'8eec7d4ace964fd888ac88ef5630e89e1b1bc7d721f587a722c140a4e52b6188',headerDigest:d89f67d84b2a93bc022a06dd2d292ba63254cd19f05cf13f50d0d16b4eb03d60}).
