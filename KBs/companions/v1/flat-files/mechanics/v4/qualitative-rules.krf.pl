:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:15,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:114,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'3a2f1edf76ee75850a48c206f9e79776a124f54fb0f182a2686d9ffab2c89deb',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:4605,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf',sourceHash:'568e8e865740686f560e8e33e16dc50060c43bfebb3bb20cdd48819dd6051f67',warnings:[]}).
'x_<=='(x_freeOfTimeVaryingParameters(V1),x_isa(V1,x_RealNumber)) :- x_cid(a65b125da19a16,V1).
xc_microtheory(a65b125da19a16,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a16,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a16,23).
xc_kb_names(a65b125da19a16,["?exp"]).
xc_mapping_rows(a65b125da19a16,[]).
'x_<=='(x_freeOfTimeVaryingParameters(V1),x_isa(V1,x_NumericalValueWithUnits)) :- x_cid(a65b125da19a17,V1).
xc_microtheory(a65b125da19a17,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a17,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a17,26).
xc_kb_names(a65b125da19a17,["?exp"]).
xc_mapping_rows(a65b125da19a17,[]).
'x_<=='(x_freeOfTimeVaryingParameters(V1),x_valueOf(V1,V2),x_freeOfTimeVaryingParameters(V2)) :- x_cid(a65b125da19a18,V1,V2).
xc_microtheory(a65b125da19a18,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a18,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a18,29).
xc_kb_names(a65b125da19a18,["?exp","?value"]).
xc_mapping_rows(a65b125da19a18,[]).
'x_<=='('x_constantThroughoutEvent-Fluent'(V1,V2),x_uninferredSentence(x_operatorFormulas(x_MeasurementAtFn,V1)),x_valueOf(x_MeasurementAtFn(V1,V2),V3),x_freeOfTimeVaryingParameters(V3)) :- x_cid(a65b125da19a19,V1,V2,V3).
xc_microtheory(a65b125da19a19,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a19,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a19,43).
xc_kb_names(a65b125da19a19,["?q","?e","?v"]).
xc_mapping_rows(a65b125da19a19,[]).
'x_<=='('x_increasesThroughoutEvent-Fluent'(V1,V2),x_uninferredSentence(x_operatorFormulas(x_MeasurementAtFn,V1)),x_derivativesOfFunction(V1,V3),'x_positiveThroughoutEvent-Fluent'(V3,V2)) :- x_cid(a65b125da19a1a,V1,V2,V3).
xc_microtheory(a65b125da19a1a,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a1a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a1a,50).
xc_kb_names(a65b125da19a1a,["?q","?e","?q-d"]).
xc_mapping_rows(a65b125da19a1a,[]).
'x_<=='('x_decreasesThroughoutEvent-Fluent'(V1,V2),x_derivativesOfFunction(V1,V3),'x_negativeThroughoutEvent-Fluent'(V3,V2)) :- x_cid(a65b125da19a1b,V1,V2,V3).
xc_microtheory(a65b125da19a1b,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a1b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a1b,55).
xc_kb_names(a65b125da19a1b,["?q","?e","?q-d"]).
xc_mapping_rows(a65b125da19a1b,[]).
'x_<=='('x_constantThroughoutEvent-Fluent'(V1,V2),x_derivativesOfFunction(V1,V3),'x_zeroThroughoutEvent-Fluent'(V3,V2)) :- x_cid(a65b125da19a1c,V1,V2,V3).
xc_microtheory(a65b125da19a1c,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a1c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a1c,59).
xc_kb_names(a65b125da19a1c,["?q","?e","?q-d"]).
xc_mapping_rows(a65b125da19a1c,[]).
'x_<=='(x_derivativesOfFunction(t(x_QPQuantityFn(x_Speed),V1),t(x_QPQuantityFn(x_Acceleration),V1)),x_groundExpression(V1)) :- x_cid(a65b125da19a1d,V1).
xc_microtheory(a65b125da19a1d,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a1d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a1d,66).
xc_kb_names(a65b125da19a1d,["?obj"]).
xc_mapping_rows(a65b125da19a1d,[]).
'x_<=='('x_positiveThroughoutEvent-Fluent'(V1,V2),x_uninferredSentence(x_operatorFormulas(x_MeasurementAtFn,V1)),x_valueOf(x_MeasurementAtFn(V1,V2),V3),x_freeOfTimeVaryingParameters(V3),x_isa(V3,x_PositiveNumber)) :- x_cid(a65b125da19a1e,V1,V2,V3).
xc_microtheory(a65b125da19a1e,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a1e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a1e,75).
xc_kb_names(a65b125da19a1e,["?q","?e","?v"]).
xc_mapping_rows(a65b125da19a1e,[]).
'x_<=='('x_negativeThroughoutEvent-Fluent'(V1,V2),x_uninferredSentence(x_operatorFormulas(x_MeasurementAtFn,V1)),x_valueOf(x_MeasurementAtFn(V1,V2),V3),x_freeOfTimeVaryingParameters(V3),x_isa(V3,x_NegativeNumber)) :- x_cid(a65b125da19a1f,V1,V2,V3).
xc_microtheory(a65b125da19a1f,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a1f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a1f,81).
xc_kb_names(a65b125da19a1f,["?q","?e","?v"]).
xc_mapping_rows(a65b125da19a1f,[]).
'x_<=='('x_zeroThroughoutEvent-Fluent'(V1,V2),x_uninferredSentence(x_operatorFormulas(x_MeasurementAtFn,V1)),x_valueOf(x_MeasurementAtFn(V1,V2),V3),x_freeOfTimeVaryingParameters(V3),x_isa(V3,x_NonNegativeNumber),x_isa(V3,x_NonPositiveNumber)) :- x_cid(a65b125da19a20,V1,V2,V3).
xc_microtheory(a65b125da19a20,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a20,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a20,87).
xc_kb_names(a65b125da19a20,["?q","?e","?v"]).
xc_mapping_rows(a65b125da19a20,[]).
'x_<=='('x_nonZeroThroughoutEvent-Fluent'(V1,V2),'x_positiveThroughoutEvent-Fluent'(V1,V2)) :- x_cid(a65b125da19a21,V1,V2).
xc_microtheory(a65b125da19a21,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a21,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a21,95).
xc_kb_names(a65b125da19a21,["?q","?e"]).
xc_mapping_rows(a65b125da19a21,[]).
'x_<=='('x_nonZeroThroughoutEvent-Fluent'(V1,V2),'x_negativeThroughoutEvent-Fluent'(V1,V2)) :- x_cid(a65b125da19a22,V1,V2).
xc_microtheory(a65b125da19a22,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a22,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a22,98).
xc_kb_names(a65b125da19a22,["?q","?e"]).
xc_mapping_rows(a65b125da19a22,[]).
'x_<=='('x_nonZeroThroughoutEvent-Fluent'(t(x_QPQuantityFn(x_Speed),V1),V2),'x_directionOfTranslation-Throughout'(V2,V3),x_primaryObjectMoving(V2,V1)) :- x_cid(a65b125da19a23,V1,V2,V3).
xc_microtheory(a65b125da19a23,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a23,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a23,104).
xc_kb_names(a65b125da19a23,["?obj","?event","?dir"]).
xc_mapping_rows(a65b125da19a23,[]).
'x_<=='('x_zeroThroughoutEvent-Fluent'(t(x_QPQuantityFn(x_Speed),V1),V2),x_objectStationary(x_StartFn(V2),V3),'x_zeroThroughoutEvent-Fluent'(t(x_QPQuantityFn(x_Acceleration),V1),V2)) :- x_cid(a65b125da19a24,V1,V2,V3).
xc_microtheory(a65b125da19a24,x_QRDerivativeRulesMt).
xc_source_file(a65b125da19a24,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/qualitative-rules.krf').
xc_source_line(a65b125da19a24,108).
xc_kb_names(a65b125da19a24,["?obj","?event","?object"]).
xc_mapping_rows(a65b125da19a24,[]).
kb_cache_footer(footer{count:15,digest:'3a2f1edf76ee75850a48c206f9e79776a124f54fb0f182a2686d9ffab2c89deb',headerDigest:'1d559b5639a42bd8a877f254e9bf383662257e3ca5b52dd11a6db4d4d98c946c'}).
