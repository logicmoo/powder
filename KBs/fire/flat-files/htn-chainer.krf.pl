:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:11,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:133,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'5020e0f421b1670d396b915a56c7499ec6ba15d02aee67f549e24e0f0fcc7f4a',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:5742,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf',sourceHash:b884d69cbd8db0e64cf7c68b596525ae201e498ccbfeaf45fa9b7933a6c041b6,warnings:[]}).
'x_<=='(x_bestMethodFor(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_and(x_inferenceOnly(x_acceptableMethodFor(V1,V4)),x_wmOnly(x_currentState(V5)),x_wmOnly(x_uninferredSentence(x_previouslyAttempted(V1,V4,V5)))))),x_evaluate(V2,x_FirstInListFn(x_SortFn(V3,x_Kappa(t(V6,V7),x_inferenceOnly(x_preferInContext(V1,V6,V7))),x_IdentityFn)))) :- x_cid(a65b126bb93d0b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b126bb93d0b,x_HTNPlanner).
xc_source_file(a65b126bb93d0b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d0b,27).
xc_kb_names(a65b126bb93d0b,["?bmf-task%","?best-method%","?method-set%","?method2%","?state%","?seq1%","?seq2%"]).
xc_mapping_rows(a65b126bb93d0b,[]).
'x_<=='(x_acceptableMethodFor(V1,V2),x_generalMethodFor(V1,x_preconditionForMethod(V3,x_methodForAction(V4,V5))),x_instantiationOf(t(V1,V6,V7),t(V4,V3,V5),t(V8,V9,V10)),x_contextEnvAllowed(V9),x_instantiationOf(V10,V10,V2),x_differentSymbols(V2,x_actionSequence(x_TheList(V1)))) :- x_cid(a65b126bb93d0c,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b126bb93d0c,x_HTNPlanner).
xc_source_file(a65b126bb93d0c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d0c,46).
xc_kb_names(a65b126bb93d0c,["?amf-task%","?amf-method%","?gen-prec%","?gen-task%","?gen-method%","?p%","?m%","?instantiated-task%","?instantiated-prec%","?instantiated-method%"]).
xc_mapping_rows(a65b126bb93d0c,[]).
'x_<=='(x_generalMethodFor(V1,V2),x_evaluate(V3,x_GeneralizeFormulaFn(V1)),x_contextEnvAllowed(x_preconditionForMethod(V4,x_methodForAction(V3,V5))),x_matches(V3,V1),x_unifies(V2,x_preconditionForMethod(V4,x_methodForAction(V3,V5)))) :- x_cid(a65b126bb93d0d,V1,V2,V3,V4,V5).
xc_microtheory(a65b126bb93d0d,x_HTNPlanner).
xc_source_file(a65b126bb93d0d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d0d,84).
xc_kb_names(a65b126bb93d0d,["?inst-task%","?result%","?variablized-task%","?gmf-prec%","?gmf-method%"]).
xc_mapping_rows(a65b126bb93d0d,[]).
x_breakOnEmptySet(x_TheSet,x_Planning) :- x_cid(a65b126bb93d0e).
xc_microtheory(a65b126bb93d0e,x_HTNPlanner).
xc_source_file(a65b126bb93d0e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d0e,111).
xc_kb_names(a65b126bb93d0e,[]).
xc_mapping_rows(a65b126bb93d0e,[]).
'x_<=='(x_breakOnEmptySet(V1,x_Never),x_differentSymbols(V1,x_TheSet)) :- x_cid(a65b126bb93d0f,V1).
xc_microtheory(a65b126bb93d0f,x_HTNPlanner).
xc_source_file(a65b126bb93d0f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d0f,113).
xc_kb_names(a65b126bb93d0f,["?set"]).
xc_mapping_rows(a65b126bb93d0f,[]).
'x_<=='(x_breakOnZeroValue(V1,x_Planning),x_natArgument(V1,1,V2)) :- x_cid(a65b126bb93d10,V1,V2).
xc_microtheory(a65b126bb93d10,x_HTNPlanner).
xc_source_file(a65b126bb93d10,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d10,116).
xc_kb_names(a65b126bb93d10,["?nat","?0"]).
xc_mapping_rows(a65b126bb93d10,[]).
'x_<=='(x_breakOnZeroValue(V1,x_Never),x_natArgument(V1,1,V2),x_differentSymbols(V2,0)) :- x_cid(a65b126bb93d11,V1,V2).
xc_microtheory(a65b126bb93d11,x_HTNPlanner).
xc_source_file(a65b126bb93d11,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d11,119).
xc_kb_names(a65b126bb93d11,["?nat","?val"]).
xc_mapping_rows(a65b126bb93d11,[]).
'x_<=='(x_breakOnCondition(V1,x_Planning),x_trueSentence(V1)) :- x_cid(a65b126bb93d12,V1).
xc_microtheory(a65b126bb93d12,x_HTNPlanner).
xc_source_file(a65b126bb93d12,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d12,123).
xc_kb_names(a65b126bb93d12,["?condition"]).
xc_mapping_rows(a65b126bb93d12,[]).
'x_<=='(x_breakOnCondition(V1,x_Never),x_uninferredSentence(V1)) :- x_cid(a65b126bb93d13,V1).
xc_microtheory(a65b126bb93d13,x_HTNPlanner).
xc_source_file(a65b126bb93d13,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d13,126).
xc_kb_names(a65b126bb93d13,["?condition"]).
xc_mapping_rows(a65b126bb93d13,[]).
'x_<=='(x_breakUnless(V1,x_Never),x_trueSentence(V1)) :- x_cid(a65b126bb93d14,V1).
xc_microtheory(a65b126bb93d14,x_HTNPlanner).
xc_source_file(a65b126bb93d14,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d14,129).
xc_kb_names(a65b126bb93d14,["?condition"]).
xc_mapping_rows(a65b126bb93d14,[]).
'x_<=='(x_breakUnless(V1,x_Planning),x_uninferredSentence(V1)) :- x_cid(a65b126bb93d15,V1).
xc_microtheory(a65b126bb93d15,x_HTNPlanner).
xc_source_file(a65b126bb93d15,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/htn-chainer.krf').
xc_source_line(a65b126bb93d15,132).
xc_kb_names(a65b126bb93d15,["?condition"]).
xc_mapping_rows(a65b126bb93d15,[]).
kb_cache_footer(footer{count:11,digest:'5020e0f421b1670d396b915a56c7499ec6ba15d02aee67f549e24e0f0fcc7f4a',headerDigest:db0d168ff7081546638f4ed5c1c9faa80370a2a310afde5a73ae07b8b399d040}).
