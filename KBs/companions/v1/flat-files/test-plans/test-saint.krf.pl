:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:8,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:47,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8eaf5b80dbc95ffbb3b30488a3b25388eacb94b366154984fc41cfbc0722ba19',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1698,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf',sourceHash:'8199b91ea1fb06564ce76aac899a19ec04275def519814a99fff5bf3b94ed272',warnings:[]}).
x_genlMt(x_CompanionsMt,x_TestPlanMt) :- x_cid(a65b12623828de).
xc_microtheory(a65b12623828de,x_TestPlanMt).
xc_source_file(a65b12623828de,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf').
xc_source_line(a65b12623828de,14).
xc_kb_names(a65b12623828de,[]).
xc_mapping_rows(a65b12623828de,[]).
x_genlMt(x_TestPlanMt,x_SaintMt) :- x_cid(a65b12623828df).
xc_microtheory(a65b12623828df,x_TestPlanMt).
xc_source_file(a65b12623828df,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf').
xc_source_line(a65b12623828df,15).
xc_kb_names(a65b12623828df,[]).
xc_mapping_rows(a65b12623828df,[]).
x_isa(x_testSaint,x_ComplexActionPredicate) :- x_cid(a65b12623828e0).
xc_microtheory(a65b12623828e0,x_TestPlanMt).
xc_source_file(a65b12623828e0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf').
xc_source_line(a65b12623828e0,17).
xc_kb_names(a65b12623828e0,[]).
xc_mapping_rows(a65b12623828e0,[]).
x_arity(x_testSaint,1) :- x_cid(a65b12623828e1).
xc_microtheory(a65b12623828e1,x_TestPlanMt).
xc_source_file(a65b12623828e1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf').
xc_source_line(a65b12623828e1,18).
xc_kb_names(a65b12623828e1,[]).
xc_mapping_rows(a65b12623828e1,[]).
x_preconditionForMethod(x_goalOfSolve(V1,V2),x_methodForAction(x_testSaint(V2),x_actionSequence(x_TheList(x_doRunToSolution(V1),x_doAgentPlan(x_evaluateSaint(V1,V2)))))) :- x_cid(a65b12623828e2,V1,V2).
xc_microtheory(a65b12623828e2,x_TestPlanMt).
xc_source_file(a65b12623828e2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf').
xc_source_line(a65b12623828e2,20).
xc_kb_names(a65b12623828e2,["?solve","?query"]).
xc_mapping_rows(a65b12623828e2,[]).
x_isa(x_evaluateSaint,x_ComplexActionPredicate) :- x_cid(a65b12623828e3).
xc_microtheory(a65b12623828e3,x_TestPlanMt).
xc_source_file(a65b12623828e3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf').
xc_source_line(a65b12623828e3,29).
xc_kb_names(a65b12623828e3,[]).
xc_mapping_rows(a65b12623828e3,[]).
x_arity(x_evaluateSaint,2) :- x_cid(a65b12623828e4).
xc_microtheory(a65b12623828e4,x_TestPlanMt).
xc_source_file(a65b12623828e4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf').
xc_source_line(a65b12623828e4,30).
xc_kb_names(a65b12623828e4,[]).
xc_mapping_rows(a65b12623828e4,[]).
x_preconditionForMethod(x_and(x_queryContext(V1),x_evaluate(V2,x_LastInListFn(x_FormulaArgListFn(V3))),x_evaluate(V4,x_TheClosedRetrievalSetOf(V2,x_lookupOnly(x_wmOnly('x_ist-Information'(V1,V3)))))),x_methodForAction(x_evaluateSaint(V5,V3),x_actionSequence(x_TheList(x_doForEach(V6,V4,x_doAnnounce("answer = ~a",[V6])))))) :- x_cid(a65b12623828e5,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12623828e5,x_TestPlanMt).
xc_source_file(a65b12623828e5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-saint.krf').
xc_source_line(a65b12623828e5,32).
xc_kb_names(a65b12623828e5,["?mt","?response","?query","?answers","?solve","?ans"]).
xc_mapping_rows(a65b12623828e5,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 44, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b12623828e5,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 44, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:8,digest:'8eaf5b80dbc95ffbb3b30488a3b25388eacb94b366154984fc41cfbc0722ba19',headerDigest:'6d912516f39e25dcefaeab5d5df1bec7ec11291ea643e50cfa17ce737434ede2'}).
