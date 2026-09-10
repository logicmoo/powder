:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:22,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:24,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8cd10afc9fb7778162a2e31b9927d237b23a269b1c92d2c1eeccca25ebbb7317',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3236,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf',sourceHash:'2f684840682bd026abdffd6818e70b860cd01aab3abef31019aeefb58b35a83f',warnings:[]}).
x_implies(x_ratioOfTo(V1,V2,V3),x_ratioOfTo(V1,V3,V2)) :- x_cid(a65b1274e8581f,V1,V2,V3).
xc_microtheory(a65b1274e8581f,x_MathMt).
xc_source_file(a65b1274e8581f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e8581f,3).
xc_kb_names(a65b1274e8581f,["?M","?N","?RATIO"]).
xc_mapping_rows(a65b1274e8581f,[]).
x_implies(x_and(x_isa(V1,x_AssociativeRelation),x_isa(V1,x_EvaluatableFunction),x_evaluate(V2,t(V1,V3,t(V1,V4,V5)))),x_evaluate(V2,t(V1,t(V1,V3,V4),V5))) :- x_cid(a65b1274e85820,V1,V2,V3,V4,V5).
xc_microtheory(a65b1274e85820,x_MathMt).
xc_source_file(a65b1274e85820,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85820,4).
xc_kb_names(a65b1274e85820,["?RELN","?ANS","?ARG1","?ARG2","?ARG3"]).
xc_mapping_rows(a65b1274e85820,[]).
x_relationAllInstance(x_greaterThanOrEqualTo,x_PositiveInteger,1) :- x_cid(a65b1274e85821).
xc_microtheory(a65b1274e85821,x_MathMt).
xc_source_file(a65b1274e85821,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85821,5).
xc_kb_names(a65b1274e85821,[]).
xc_mapping_rows(a65b1274e85821,[]).
x_implies(x_and(x_isa(V1,x_Integer),x_isa(V2,x_Integer),x_evaluate(V3,x_PlusFn(V1,V2))),x_isa(V3,x_Integer)) :- x_cid(a65b1274e85822,V1,V2,V3).
xc_microtheory(a65b1274e85822,x_MathMt).
xc_source_file(a65b1274e85822,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85822,6).
xc_kb_names(a65b1274e85822,["?M","?N","?SUM"]).
xc_mapping_rows(a65b1274e85822,[]).
x_implies(x_and(x_isa(V1,x_RealNumber),x_isa(V2,x_RealNumber),x_isa(V3,x_RealNumber),x_isa(V4,x_RealNumber),x_evaluate(V1,x_PlusFn(V2,V3)),x_evaluate(V5,x_DifferenceFn(V2,V4)),x_evaluate(0,x_PlusFn(V4,V3))),x_equals(V5,V1)) :- x_cid(a65b1274e85823,V1,V2,V3,V4,V5).
xc_microtheory(a65b1274e85823,x_MathMt).
xc_source_file(a65b1274e85823,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85823,7).
xc_kb_names(a65b1274e85823,["?X","?Y","?Z-ADD-INV","?Z","?DIFFERENCEFN"]).
xc_mapping_rows(a65b1274e85823,[]).
x_implies(x_and(x_evaluate(V1,x_DifferenceFn(V2,V3)),x_evaluate(V2,x_PlusFn(V4,V3))),x_equals(V1,V4)) :- x_cid(a65b1274e85824,V1,V2,V3,V4).
xc_microtheory(a65b1274e85824,x_MathMt).
xc_source_file(a65b1274e85824,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85824,8).
xc_kb_names(a65b1274e85824,["?DIFFERENCEFN","?N","?M","?L"]).
xc_mapping_rows(a65b1274e85824,[]).
x_implies(x_and(x_isa(V1,x_RealNumber),x_isa(V2,x_RealNumber),x_isa(V3,x_RealNumber),x_isa(V4,x_RealNumber),x_evaluate(V1,x_QuotientFn(V2,V3)),x_evaluate(V5,x_TimesFn(V2,V4)),x_evaluate(1,x_TimesFn(V3,V4))),x_equals(V5,V1)) :- x_cid(a65b1274e85825,V1,V2,V3,V4,V5).
xc_microtheory(a65b1274e85825,x_MathMt).
xc_source_file(a65b1274e85825,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85825,9).
xc_kb_names(a65b1274e85825,["?X","?Y","?Z","?Z-MULT-INV","?TIMESFN"]).
xc_mapping_rows(a65b1274e85825,[]).
x_implies(x_and(x_isa(V1,x_RealNumber),x_isa(V2,x_RealNumber),x_isa(V3,x_RealNumber),x_isa(V4,x_RealNumber),x_evaluate(V1,x_DifferenceFn(V2,V3)),x_evaluate(V5,x_PlusFn(V2,V4)),x_evaluate(0,x_PlusFn(V3,V4))),x_equals(V5,V1)) :- x_cid(a65b1274e85826,V1,V2,V3,V4,V5).
xc_microtheory(a65b1274e85826,x_MathMt).
xc_source_file(a65b1274e85826,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85826,10).
xc_kb_names(a65b1274e85826,["?X","?Y","?Z","?Z-ADD-INV","?PLUSFN"]).
xc_mapping_rows(a65b1274e85826,[]).
x_implies(x_and(x_isa(V1,x_RealNumber),x_isa(V2,x_RealNumber),x_isa(V3,x_RealNumber),x_isa(V4,x_RealNumber),x_evaluate(V1,x_TimesFn(V2,V3)),x_evaluate(V5,x_QuotientFn(V2,V4)),x_evaluate(1,x_TimesFn(V3,V4))),x_equals(V5,V1)) :- x_cid(a65b1274e85827,V1,V2,V3,V4,V5).
xc_microtheory(a65b1274e85827,x_MathMt).
xc_source_file(a65b1274e85827,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85827,11).
xc_kb_names(a65b1274e85827,["?X","?Y","?Z","?Z-MULT-INV","?QUOTIENTFN"]).
xc_mapping_rows(a65b1274e85827,[]).
x_implies(x_and(x_evaluate(V1,x_TimesFn(V2,V3)),x_evaluate(V3,x_QuotientFn(V4,V2))),x_equals(V4,V1)) :- x_cid(a65b1274e85828,V1,V2,V3,V4).
xc_microtheory(a65b1274e85828,x_MathMt).
xc_source_file(a65b1274e85828,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85828,12).
xc_kb_names(a65b1274e85828,["?TIMESFN","?DIVISOR","?QUOTIENT","?DIVIDEND"]).
xc_mapping_rows(a65b1274e85828,[]).
x_implies(x_and(x_evaluate(V1,x_PlusFn(V2,V3)),x_evaluate(V2,x_DifferenceFn(V4,V3))),x_equals(V4,V1)) :- x_cid(a65b1274e85829,V1,V2,V3,V4).
xc_microtheory(a65b1274e85829,x_MathMt).
xc_source_file(a65b1274e85829,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85829,13).
xc_kb_names(a65b1274e85829,["?SUM","?L","?M","?N"]).
xc_mapping_rows(a65b1274e85829,[]).
x_implies(x_and(x_isa(V1,x_Integer),x_isa(V2,x_Integer),x_evaluate(V3,x_TimesFn(V1,V2))),x_isa(V3,x_Integer)) :- x_cid(a65b1274e8582a,V1,V2,V3).
xc_microtheory(a65b1274e8582a,x_MathMt).
xc_source_file(a65b1274e8582a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e8582a,14).
xc_kb_names(a65b1274e8582a,["?M","?N","?PRODUCT"]).
xc_mapping_rows(a65b1274e8582a,[]).
x_implies(x_and(x_isa(V1,x_RealNumber),x_isa(V2,x_RealNumber),x_isa(V3,x_RealNumber),x_evaluate(V4,x_PlusFn(V2,V3)),x_evaluate(V5,x_PlusFn(V4,V1)),x_evaluate(V6,x_PlusFn(V7,V3)),x_evaluate(V7,x_PlusFn(V1,V2))),x_equals(V5,V6)) :- x_cid(a65b1274e8582b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1274e8582b,x_MathMt).
xc_source_file(a65b1274e8582b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e8582b,15).
xc_kb_names(a65b1274e8582b,["?X","?Y","?Z","?PLUSFN","?SUM1","?SUM2","?PLUSFN-1"]).
xc_mapping_rows(a65b1274e8582b,[]).
x_implies(x_and(x_isa(V1,x_RealNumber),x_isa(V2,x_RealNumber),x_evaluate(V3,x_PlusFn(V1,V2))),x_isa(V3,x_RealNumber)) :- x_cid(a65b1274e8582c,V1,V2,V3).
xc_microtheory(a65b1274e8582c,x_MathMt).
xc_source_file(a65b1274e8582c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e8582c,16).
xc_kb_names(a65b1274e8582c,["?X","?Y","?PLUSFN"]).
xc_mapping_rows(a65b1274e8582c,[]).
x_implies(x_and(x_evaluate(V1,x_QuotientFn(V2,V3)),x_evaluate(V2,x_TimesFn(V3,V4))),x_or(x_evaluate(V3,0),x_evaluate(V4,V1))) :- x_cid(a65b1274e8582d,V1,V2,V3,V4).
xc_microtheory(a65b1274e8582d,x_MathMt).
xc_source_file(a65b1274e8582d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e8582d,17).
xc_kb_names(a65b1274e8582d,["?QUOTIENTFN","?TIMESFN","?M","?N"]).
xc_mapping_rows(a65b1274e8582d,[]).
x_implies(x_and(x_isa(V1,x_RealNumber),x_isa(V2,x_RealNumber),x_isa(V3,x_RealNumber),x_evaluate(V4,x_PlusFn(V2,V3)),x_evaluate(V5,x_TimesFn(V4,V1)),x_evaluate(V6,x_PlusFn(V7,V8)),x_evaluate(V8,x_TimesFn(V1,V2)),x_evaluate(V7,x_TimesFn(V1,V3))),x_equals(V5,V6)) :- x_cid(a65b1274e8582e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1274e8582e,x_MathMt).
xc_source_file(a65b1274e8582e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e8582e,18).
xc_kb_names(a65b1274e8582e,["?X","?Y","?Z","?PLUSFN","?PRODUCT","?SUM","?TIMESFN","?TIMESFN-1"]).
xc_mapping_rows(a65b1274e8582e,[]).
x_implies(x_and(x_isa(V1,x_Integer),x_evaluate(0,x_PlusFn(V1,V2))),x_isa(V2,x_Integer)) :- x_cid(a65b1274e8582f,V1,V2).
xc_microtheory(a65b1274e8582f,x_MathMt).
xc_source_file(a65b1274e8582f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e8582f,19).
xc_kb_names(a65b1274e8582f,["?X","?Y"]).
xc_mapping_rows(a65b1274e8582f,[]).
x_not(x_and(x_greaterThan(1,V1),x_isa(V1,x_PositiveInteger))) :- x_cid(a65b1274e85830,V1).
xc_microtheory(a65b1274e85830,x_MathMt).
xc_source_file(a65b1274e85830,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85830,20).
xc_kb_names(a65b1274e85830,["?LESS"]).
xc_mapping_rows(a65b1274e85830,[]).
x_implies(x_and(x_isa(V1,x_Integer),x_greaterThan(V1,0)),x_isa(V1,x_PositiveInteger)) :- x_cid(a65b1274e85831,V1).
xc_microtheory(a65b1274e85831,x_MathMt).
xc_source_file(a65b1274e85831,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85831,21).
xc_kb_names(a65b1274e85831,["?N"]).
xc_mapping_rows(a65b1274e85831,[]).
x_implies(x_and(x_isa(V1,x_Integer),x_greaterThanOrEqualTo(V1,0)),x_isa(V1,x_NonNegativeInteger)) :- x_cid(a65b1274e85832,V1).
xc_microtheory(a65b1274e85832,x_MathMt).
xc_source_file(a65b1274e85832,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85832,22).
xc_kb_names(a65b1274e85832,["?N"]).
xc_mapping_rows(a65b1274e85832,[]).
x_implies(x_and(x_isa(V1,x_RealNumber),x_isa(V2,x_RealNumber)),x_or(x_equals(V1,V2),x_greaterThan(V2,V1),x_greaterThan(V1,V2))) :- x_cid(a65b1274e85833,V1,V2).
xc_microtheory(a65b1274e85833,x_MathMt).
xc_source_file(a65b1274e85833,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85833,23).
xc_kb_names(a65b1274e85833,["?X","?Y"]).
xc_mapping_rows(a65b1274e85833,[]).
x_implies(x_and(x_isa(V1,x_RealNumber),x_isa(V2,x_RealNumber)),x_or(x_greaterThanOrEqualTo(V1,V2),x_greaterThanOrEqualTo(V2,V1))) :- x_cid(a65b1274e85834,V1,V2).
xc_microtheory(a65b1274e85834,x_MathMt).
xc_source_file(a65b1274e85834,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/MathMt.krf').
xc_source_line(a65b1274e85834,24).
xc_kb_names(a65b1274e85834,["?X","?Y"]).
xc_mapping_rows(a65b1274e85834,[]).
kb_cache_footer(footer{count:22,digest:'8cd10afc9fb7778162a2e31b9927d237b23a269b1c92d2c1eeccca25ebbb7317',headerDigest:'53b642b10329d39768ca010e90357f03dcce01fb6e9d279694f972f8b2bccc6d'}).
