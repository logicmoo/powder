:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:7,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:38,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:f550f3ae15dd64b747af1e756afc34ab45ebd00c7484d9130d5a7cd29d74e396,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/fibonacci.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1023,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/fibonacci.krf',sourceHash:'0f5be0735db222e303cd409f77a430004616ca60f8e10f4849a03c3896be54ee',warnings:[]}).
x_genlMt(x_TestPlanMt,x_CompanionsMt) :- x_cid(a65b12622961b2).
xc_microtheory(a65b12622961b2,x_TestPlanMt).
xc_source_file(a65b12622961b2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/fibonacci.krf').
xc_source_line(a65b12622961b2,4).
xc_kb_names(a65b12622961b2,[]).
xc_mapping_rows(a65b12622961b2,[]).
x_genlMt(x_CompanionsMt,x_TestPlanMt) :- x_cid(a65b12622961b3).
xc_microtheory(a65b12622961b3,x_TestPlanMt).
xc_source_file(a65b12622961b3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/fibonacci.krf').
xc_source_line(a65b12622961b3,5).
xc_kb_names(a65b12622961b3,[]).
xc_mapping_rows(a65b12622961b3,[]).
'x_<=='(x_fibonacci(0,0)) :- x_cid(a65b12622961b4).
xc_microtheory(a65b12622961b4,x_TestPlanMt).
xc_source_file(a65b12622961b4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/fibonacci.krf').
xc_source_line(a65b12622961b4,9).
xc_kb_names(a65b12622961b4,[]).
xc_mapping_rows(a65b12622961b4,[]).
'x_<=='(x_fibonacci(1,1)) :- x_cid(a65b12622961b5).
xc_microtheory(a65b12622961b5,x_TestPlanMt).
xc_source_file(a65b12622961b5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/fibonacci.krf').
xc_source_line(a65b12622961b5,11).
xc_kb_names(a65b12622961b5,[]).
xc_mapping_rows(a65b12622961b5,[]).
'x_<=='(x_fibonacci(V1,V2),x_groundExpression(V1),x_greaterThan(V1,1),x_evaluate(V3,x_DifferenceFn(V1,1)),x_evaluate(V4,x_DifferenceFn(V1,2)),x_fibonacci(V3,V5),x_fibonacci(V4,V6),x_evaluate(V2,x_PlusFn(V5,V6))) :- x_cid(a65b12622961b6,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12622961b6,x_TestPlanMt).
xc_source_file(a65b12622961b6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/fibonacci.krf').
xc_source_line(a65b12622961b6,13).
xc_kb_names(a65b12622961b6,["?n","?f","?n-1","?n-2","?fn-1","?fn-2"]).
xc_mapping_rows(a65b12622961b6,[]).
x_isa(x_smartFibonacci,x_BinaryPredicate) :- x_cid(a65b12622961b7).
xc_microtheory(a65b12622961b7,x_TestPlanMt).
xc_source_file(a65b12622961b7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/fibonacci.krf').
xc_source_line(a65b12622961b7,29).
xc_kb_names(a65b12622961b7,[]).
xc_mapping_rows(a65b12622961b7,[]).
'x_<=='(x_smartFibonacci(V1,V2),x_groundExpression(V1),x_greaterThan(V1,1),x_evaluate(V3,x_DifferenceFn(V1,1)),x_evaluate(V4,x_DifferenceFn(V1,2)),x_cacheComplete(x_fibonacci(V3,V5)),x_cacheComplete(x_fibonacci(V4,V6)),x_evaluate(V2,x_PlusFn(V5,V6))) :- x_cid(a65b12622961b8,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12622961b8,x_TestPlanMt).
xc_source_file(a65b12622961b8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/fibonacci.krf').
xc_source_line(a65b12622961b8,31).
xc_kb_names(a65b12622961b8,["?n","?f","?n-1","?n-2","?fn-1","?fn-2"]).
xc_mapping_rows(a65b12622961b8,[]).
kb_cache_footer(footer{count:7,digest:f550f3ae15dd64b747af1e756afc34ab45ebd00c7484d9130d5a7cd29d74e396,headerDigest:'47dc3e3b9919b757358fc230707d002b767d0683cb59f463a4555e6419a1f7bd'}).
