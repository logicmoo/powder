:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:41,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:261,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'70ead57bdbb24e6babf6f8546665e6a632c12346b099094c8c281138fa485f98',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:7895,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf',sourceHash:'8d76ad7cb789b09f8c72e7816882a548237bda0cbcb7bbf3f97a92aa84b844c0',warnings:[]}).
x_comment(x_OrdinalReasoningMt,"OrdinalReasoningMt contains Horn clauses for ordinal reasoning.\nThis implementation uses no specialized datastructures, doing everything via backchaining.") :- x_cid(a65b126b90f3ec).
xc_microtheory(a65b126b90f3ec,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3ec,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3ec,15).
xc_kb_names(a65b126b90f3ec,[]).
xc_mapping_rows(a65b126b90f3ec,[]).
'x_<=='(x_qGreaterThan(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qGreaterThanOrEqualTo(V1,V3)),x_lookupOnly(x_qGreaterThan(V3,V2))) :- x_cid(a65b126b90f3ed,V1,V2,V3).
xc_microtheory(a65b126b90f3ed,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3ed,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3ed,29).
xc_kb_names(a65b126b90f3ed,["?q1","?q2","?q-middle"]).
xc_mapping_rows(a65b126b90f3ed,[]).
'x_<=='(x_qGreaterThan(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qEqualTo(V1,V3)),x_lookupOnly(x_qGreaterThan(V3,V2))) :- x_cid(a65b126b90f3ee,V1,V2,V3).
xc_microtheory(a65b126b90f3ee,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3ee,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3ee,35).
xc_kb_names(a65b126b90f3ee,["?q1","?q2","?q-middle"]).
xc_mapping_rows(a65b126b90f3ee,[]).
'x_<=='(x_qLessThan(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qLessThanOrEqualTo(V1,V3)),x_lookupOnly(x_qLessThan(V3,V2))) :- x_cid(a65b126b90f3ef,V1,V2,V3).
xc_microtheory(a65b126b90f3ef,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3ef,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3ef,41).
xc_kb_names(a65b126b90f3ef,["?q1","?q2","?q-middle"]).
xc_mapping_rows(a65b126b90f3ef,[]).
'x_<=='(x_qLessThan(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qEqualTo(V1,V3)),x_lookupOnly(x_qLessThan(V3,V2))) :- x_cid(a65b126b90f3f0,V1,V2,V3).
xc_microtheory(a65b126b90f3f0,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f0,47).
xc_kb_names(a65b126b90f3f0,["?q1","?q2","?q-middle"]).
xc_mapping_rows(a65b126b90f3f0,[]).
'x_<=='(x_qEqualTo(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qEqualTo(V1,V3)),x_lookupOnly(x_qEqualTo(V3,V2))) :- x_cid(a65b126b90f3f1,V1,V2,V3).
xc_microtheory(a65b126b90f3f1,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f1,53).
xc_kb_names(a65b126b90f3f1,["?q1","?q2","?q-middle"]).
xc_mapping_rows(a65b126b90f3f1,[]).
'x_<=='(x_qGreaterThanOrEqualTo(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qGreaterThan(V1,V2))) :- x_cid(a65b126b90f3f2,V1,V2).
xc_microtheory(a65b126b90f3f2,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f2,65).
xc_kb_names(a65b126b90f3f2,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3f2,[]).
'x_<=='(x_qGreaterThanOrEqualTo(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qEqualTo(V1,V2))) :- x_cid(a65b126b90f3f3,V1,V2).
xc_microtheory(a65b126b90f3f3,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f3,70).
xc_kb_names(a65b126b90f3f3,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3f3,[]).
'x_<=='(x_qLessThanOrEqualTo(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qLessThan(V1,V2))) :- x_cid(a65b126b90f3f4,V1,V2).
xc_microtheory(a65b126b90f3f4,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f4,75).
xc_kb_names(a65b126b90f3f4,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3f4,[]).
'x_<=='(x_qLessThanOrEqualTo(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qEqualTo(V1,V2))) :- x_cid(a65b126b90f3f5,V1,V2).
xc_microtheory(a65b126b90f3f5,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f5,80).
xc_kb_names(a65b126b90f3f5,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3f5,[]).
'x_<=='(x_qEqualTo(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qGreaterThanOrEqualTo(V1,V2)),x_lookupOnly(x_qLessThanOrEqualTo(V1,V2))) :- x_cid(a65b126b90f3f6,V1,V2).
xc_microtheory(a65b126b90f3f6,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f6,87).
xc_kb_names(a65b126b90f3f6,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3f6,[]).
'x_<=='(x_qGreaterThan(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qLessThan(V2,V1))) :- x_cid(a65b126b90f3f7,V1,V2).
xc_microtheory(a65b126b90f3f7,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f7,94).
xc_kb_names(a65b126b90f3f7,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3f7,[]).
'x_<=='(x_qLessThan(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qGreaterThan(V2,V1))) :- x_cid(a65b126b90f3f8,V1,V2).
xc_microtheory(a65b126b90f3f8,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f8,99).
xc_kb_names(a65b126b90f3f8,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3f8,[]).
'x_<=='(x_inconsistentOrdinals(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qGreaterThan(V1,V2)),x_lookupOnly(x_qLessThan(V1,V2))) :- x_cid(a65b126b90f3f9,V1,V2).
xc_microtheory(a65b126b90f3f9,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3f9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3f9,104).
xc_kb_names(a65b126b90f3f9,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3f9,[]).
'x_<=='(x_not(x_qGreaterThanOrEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qLessThan(V1,V2))) :- x_cid(a65b126b90f3fa,V1,V2).
xc_microtheory(a65b126b90f3fa,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3fa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3fa,113).
xc_kb_names(a65b126b90f3fa,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3fa,[]).
'x_<=='(x_not(x_qGreaterThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qEqualTo(V1,V2))) :- x_cid(a65b126b90f3fb,V1,V2).
xc_microtheory(a65b126b90f3fb,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3fb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3fb,118).
xc_kb_names(a65b126b90f3fb,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3fb,[]).
'x_<=='(x_not(x_qGreaterThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qLessThan(V1,V2))) :- x_cid(a65b126b90f3fc,V1,V2).
xc_microtheory(a65b126b90f3fc,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3fc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3fc,123).
xc_kb_names(a65b126b90f3fc,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3fc,[]).
'x_<=='(x_not(x_qEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qLessThan(V1,V2))) :- x_cid(a65b126b90f3fd,V1,V2).
xc_microtheory(a65b126b90f3fd,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3fd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3fd,128).
xc_kb_names(a65b126b90f3fd,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3fd,[]).
'x_<=='(x_not(x_qEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qGreaterThan(V1,V2))) :- x_cid(a65b126b90f3fe,V1,V2).
xc_microtheory(a65b126b90f3fe,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3fe,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3fe,133).
xc_kb_names(a65b126b90f3fe,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3fe,[]).
'x_<=='(x_not(x_qLessThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qGreaterThan(V1,V2))) :- x_cid(a65b126b90f3ff,V1,V2).
xc_microtheory(a65b126b90f3ff,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f3ff,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f3ff,138).
xc_kb_names(a65b126b90f3ff,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f3ff,[]).
'x_<=='(x_not(x_qLessThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qEqualTo(V1,V2))) :- x_cid(a65b126b90f400,V1,V2).
xc_microtheory(a65b126b90f400,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f400,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f400,143).
xc_kb_names(a65b126b90f400,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f400,[]).
'x_<=='(x_not(x_qLessThanOrEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_lookupOnly(x_qGreaterThan(V1,V2))) :- x_cid(a65b126b90f401,V1,V2).
xc_microtheory(a65b126b90f401,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f401,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f401,148).
xc_kb_names(a65b126b90f401,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f401,[]).
'x_<=='(x_not(x_qGreaterThanOrEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V1,x_Zero),x_not(x_hasQuantity(V3,V1))) :- x_cid(a65b126b90f402,V1,V2,V3).
xc_microtheory(a65b126b90f402,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f402,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f402,156).
xc_kb_names(a65b126b90f402,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f402,[]).
'x_<=='(x_not(x_qGreaterThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V1,x_Zero),x_not(x_hasQuantity(V3,V1))) :- x_cid(a65b126b90f403,V1,V2,V3).
xc_microtheory(a65b126b90f403,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f403,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f403,162).
xc_kb_names(a65b126b90f403,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f403,[]).
'x_<=='(x_not(x_qGreaterThanOrEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V2,x_Zero),x_not(x_hasQuantity(V3,V2))) :- x_cid(a65b126b90f404,V1,V2,V3).
xc_microtheory(a65b126b90f404,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f404,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f404,168).
xc_kb_names(a65b126b90f404,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f404,[]).
'x_<=='(x_not(x_qGreaterThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V2,x_Zero),x_not(x_hasQuantity(V3,V2))) :- x_cid(a65b126b90f405,V1,V2,V3).
xc_microtheory(a65b126b90f405,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f405,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f405,174).
xc_kb_names(a65b126b90f405,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f405,[]).
'x_<=='(x_not(x_qLessThanOrEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V1,x_Zero),x_not(x_hasQuantity(V3,V1))) :- x_cid(a65b126b90f406,V1,V2,V3).
xc_microtheory(a65b126b90f406,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f406,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f406,180).
xc_kb_names(a65b126b90f406,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f406,[]).
'x_<=='(x_not(x_qLessThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V1,x_Zero),x_not(x_hasQuantity(V3,V1))) :- x_cid(a65b126b90f407,V1,V2,V3).
xc_microtheory(a65b126b90f407,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f407,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f407,186).
xc_kb_names(a65b126b90f407,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f407,[]).
'x_<=='(x_not(x_qLessThanOrEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V2,x_Zero),x_not(x_hasQuantity(V3,V2))) :- x_cid(a65b126b90f408,V1,V2,V3).
xc_microtheory(a65b126b90f408,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f408,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f408,192).
xc_kb_names(a65b126b90f408,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f408,[]).
'x_<=='(x_not(x_qLessThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V2,x_Zero),x_not(x_hasQuantity(V3,V2))) :- x_cid(a65b126b90f409,V1,V2,V3).
xc_microtheory(a65b126b90f409,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f409,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f409,198).
xc_kb_names(a65b126b90f409,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f409,[]).
'x_<=='(x_not(x_qEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V1,x_Zero),x_not(x_hasQuantity(V3,V1))) :- x_cid(a65b126b90f40a,V1,V2,V3).
xc_microtheory(a65b126b90f40a,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f40a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f40a,204).
xc_kb_names(a65b126b90f40a,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f40a,[]).
'x_<=='(x_not(x_qEqualTo(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_different(V2,x_Zero),x_not(x_hasQuantity(V3,V2))) :- x_cid(a65b126b90f40b,V1,V2,V3).
xc_microtheory(a65b126b90f40b,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f40b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f40b,210).
xc_kb_names(a65b126b90f40b,["?q1","?q2","?thing"]).
xc_mapping_rows(a65b126b90f40b,[]).
'x_<=='(x_not(x_qGreaterThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_qGreaterThan(V2,V1)) :- x_cid(a65b126b90f40c,V1,V2).
xc_microtheory(a65b126b90f40c,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f40c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f40c,222).
xc_kb_names(a65b126b90f40c,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f40c,[]).
'x_<=='(x_not(x_qGreaterThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_qLessThan(V1,V2)) :- x_cid(a65b126b90f40d,V1,V2).
xc_microtheory(a65b126b90f40d,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f40d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f40d,227).
xc_kb_names(a65b126b90f40d,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f40d,[]).
'x_<=='(x_not(x_qGreaterThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_qEqualTo(V1,V2)) :- x_cid(a65b126b90f40e,V1,V2).
xc_microtheory(a65b126b90f40e,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f40e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f40e,232).
xc_kb_names(a65b126b90f40e,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f40e,[]).
'x_<=='(x_not(x_qLessThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_qLessThan(V2,V1)) :- x_cid(a65b126b90f40f,V1,V2).
xc_microtheory(a65b126b90f40f,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f40f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f40f,237).
xc_kb_names(a65b126b90f40f,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f40f,[]).
'x_<=='(x_not(x_qLessThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_qGreaterThan(V1,V2)) :- x_cid(a65b126b90f410,V1,V2).
xc_microtheory(a65b126b90f410,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f410,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f410,242).
xc_kb_names(a65b126b90f410,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f410,[]).
'x_<=='(x_not(x_qLessThan(V1,V2)),x_groundExpression(V1),x_groundExpression(V2),x_qEqualTo(V1,V2)) :- x_cid(a65b126b90f411,V1,V2).
xc_microtheory(a65b126b90f411,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f411,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f411,247).
xc_kb_names(a65b126b90f411,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f411,[]).
'x_<=='(x_not(x_qGreaterThan(V1,V2)),x_qUnrelatedTo(V1,V2)) :- x_cid(a65b126b90f412,V1,V2).
xc_microtheory(a65b126b90f412,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f412,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f412,252).
xc_kb_names(a65b126b90f412,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f412,[]).
'x_<=='(x_not(x_qLessThan(V1,V2)),x_qUnrelatedTo(V1,V2)) :- x_cid(a65b126b90f413,V1,V2).
xc_microtheory(a65b126b90f413,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f413,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f413,253).
xc_kb_names(a65b126b90f413,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f413,[]).
'x_<=='(x_not(x_qEqualTo(V1,V2)),x_qUnrelatedTo(V1,V2)) :- x_cid(a65b126b90f414,V1,V2).
xc_microtheory(a65b126b90f414,x_OrdinalReasoningMt).
xc_source_file(a65b126b90f414,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/QQR/ordinal-reasoning.krf').
xc_source_line(a65b126b90f414,254).
xc_kb_names(a65b126b90f414,["?q1","?q2"]).
xc_mapping_rows(a65b126b90f414,[]).
kb_cache_footer(footer{count:41,digest:'70ead57bdbb24e6babf6f8546665e6a632c12346b099094c8c281138fa485f98',headerDigest:'4c6295f673e609178e289b4fdc92067dbddb762c516ba514da8e1e744ac0468a'}).
