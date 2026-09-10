:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:10,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:27,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:a914e7b09f32fc18f97441933bc01cf13fa6697bd3022280df26633b54c86f97,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:889,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf',sourceHash:'38d9859e0d621029288d3311d8faf8842edfdba21501d72feb30503907203772',warnings:[]}).
x_genlMt(x_TestPlanMt,x_CompanionsMt) :- x_cid(a65b12622ba007).
xc_microtheory(a65b12622ba007,x_TestPlanMt).
xc_source_file(a65b12622ba007,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba007,6).
xc_kb_names(a65b12622ba007,[]).
xc_mapping_rows(a65b12622ba007,[]).
x_genlMt(x_CompanionsMt,x_TestPlanMt) :- x_cid(a65b12622ba008).
xc_microtheory(a65b12622ba008,x_TestPlanMt).
xc_source_file(a65b12622ba008,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba008,7).
xc_kb_names(a65b12622ba008,[]).
xc_mapping_rows(a65b12622ba008,[]).
x_isa(x_flatten,x_BinaryPredicate) :- x_cid(a65b12622ba009).
xc_microtheory(a65b12622ba009,x_TestPlanMt).
xc_source_file(a65b12622ba009,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba009,9).
xc_kb_names(a65b12622ba009,[]).
xc_mapping_rows(a65b12622ba009,[]).
x_arity(x_flatten,2) :- x_cid(a65b12622ba00a).
xc_microtheory(a65b12622ba00a,x_TestPlanMt).
xc_source_file(a65b12622ba00a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba00a,10).
xc_kb_names(a65b12622ba00a,[]).
xc_mapping_rows(a65b12622ba00a,[]).
x_arg1Isa(x_flatten,x_CycLTerm) :- x_cid(a65b12622ba00b).
xc_microtheory(a65b12622ba00b,x_TestPlanMt).
xc_source_file(a65b12622ba00b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba00b,11).
xc_kb_names(a65b12622ba00b,[]).
xc_mapping_rows(a65b12622ba00b,[]).
x_arg2Isa(x_flatten,'x_List-Extensional') :- x_cid(a65b12622ba00c).
xc_microtheory(a65b12622ba00c,x_TestPlanMt).
xc_source_file(a65b12622ba00c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba00c,12).
xc_kb_names(a65b12622ba00c,[]).
xc_mapping_rows(a65b12622ba00c,[]).
x_comment(x_flatten,"(flatten ?nested-list ?flat-list) creates a flat-list of the possibly nested lists of terms in the first argument.\nIf presented with an atomic literal, it will still produce a flat list.") :- x_cid(a65b12622ba00d).
xc_microtheory(a65b12622ba00d,x_TestPlanMt).
xc_source_file(a65b12622ba00d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba00d,13).
xc_kb_names(a65b12622ba00d,[]).
xc_mapping_rows(a65b12622ba00d,[]).
'x_<=='(x_flatten(V1,V2),x_evaluate(V3,x_FirstInListFn(V1)),x_evaluate(V4,x_RestOfListFn(V1)),x_flatten(V4,V5),x_flatten(V3,V6),x_evaluate(V2,x_JoinListsFn(V6,V5))) :- x_cid(a65b12622ba00e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12622ba00e,x_TestPlanMt).
xc_source_file(a65b12622ba00e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba00e,16).
xc_kb_names(a65b12622ba00e,["?nested-list","?flat-list","?first","?rest","?suffix","?prefix"]).
xc_mapping_rows(a65b12622ba00e,[]).
'x_<=='(x_flatten(V1,x_TheList(V1)),x_not(x_operatorFormulas(x_TheList,V1))) :- x_cid(a65b12622ba00f,V1).
xc_microtheory(a65b12622ba00f,x_TestPlanMt).
xc_source_file(a65b12622ba00f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba00f,24).
xc_kb_names(a65b12622ba00f,["?item"]).
xc_mapping_rows(a65b12622ba00f,[]).
x_flatten(x_TheList,x_TheList) :- x_cid(a65b12622ba010).
xc_microtheory(a65b12622ba010,x_TestPlanMt).
xc_source_file(a65b12622ba010,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/flatten-list.krf').
xc_source_line(a65b12622ba010,27).
xc_kb_names(a65b12622ba010,[]).
xc_mapping_rows(a65b12622ba010,[]).
kb_cache_footer(footer{count:10,digest:a914e7b09f32fc18f97441933bc01cf13fa6697bd3022280df26633b54c86f97,headerDigest:bad91c914e4242c9177dd418e196c3611966c206a10693f8979889a3db52d739}).
