:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:20,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:100,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'3d5cafa2392249116a7e4edc0dbe8707df48818fc9faa6b2726c39f0c98966c4',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3435,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf',sourceHash:fdd30578817c611dcab12b4c6bc7d139ba487a6892c693f1bc083fe52966ae2c,warnings:[]}).
x_genlMt(x_TestPlanMt,x_CompanionsMt) :- x_cid(a65b126236083c).
xc_microtheory(a65b126236083c,x_TestPlanMt).
xc_source_file(a65b126236083c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236083c,15).
xc_kb_names(a65b126236083c,[]).
xc_mapping_rows(a65b126236083c,[]).
x_genlMt(x_CompanionsMt,x_TestPlanMt) :- x_cid(a65b126236083d).
xc_microtheory(a65b126236083d,x_TestPlanMt).
xc_source_file(a65b126236083d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236083d,16).
xc_kb_names(a65b126236083d,[]).
xc_mapping_rows(a65b126236083d,[]).
x_isa(x_testPlanGenerator,x_ComplexActionPredicate) :- x_cid(a65b126236083e).
xc_microtheory(a65b126236083e,x_TestPlanMt).
xc_source_file(a65b126236083e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236083e,20).
xc_kb_names(a65b126236083e,[]).
xc_mapping_rows(a65b126236083e,[]).
x_arity(x_testPlanGenerator,0) :- x_cid(a65b126236083f).
xc_microtheory(a65b126236083f,x_TestPlanMt).
xc_source_file(a65b126236083f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236083f,21).
xc_kb_names(a65b126236083f,[]).
xc_mapping_rows(a65b126236083f,[]).
x_preconditionForMethod(x_sessionContext(V1),x_methodForAction(x_testPlanGenerator,x_actionSequence(x_TheList(x_doRecordPlans(V1,x_false,x_numbersThatSumTo10,5),x_doAgentPlan(x_chooseBestTradeoff(V1,x_numbersThatSumTo10)))))) :- x_cid(a65b1262360840,V1).
xc_microtheory(a65b1262360840,x_TestPlanMt).
xc_source_file(a65b1262360840,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360840,26).
xc_kb_names(a65b1262360840,["?ctxt"]).
xc_mapping_rows(a65b1262360840,[]).
x_isa(x_numbersThatSumTo10,x_ComplexActionPredicate) :- x_cid(a65b1262360841).
xc_microtheory(a65b1262360841,x_TestPlanMt).
xc_source_file(a65b1262360841,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360841,37).
xc_kb_names(a65b1262360841,[]).
xc_mapping_rows(a65b1262360841,[]).
x_arity(x_numbersThatSumTo10,0) :- x_cid(a65b1262360842).
xc_microtheory(a65b1262360842,x_TestPlanMt).
xc_source_file(a65b1262360842,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360842,38).
xc_kb_names(a65b1262360842,[]).
xc_mapping_rows(a65b1262360842,[]).
x_preconditionForMethod(x_and(x_integerBetween(1,V1,5),x_integerBetween(6,V2,9),x_evaluate(10,x_PlusFn(V1,V2))),x_methodForAction(x_numbersThatSumTo10,x_actionSequence(x_TheList(x_doAnnounce("~%The numbers are: ~s and ~s",[V1,V2]))))) :- x_cid(a65b1262360843,V1,V2).
xc_microtheory(a65b1262360843,x_TestPlanMt).
xc_source_file(a65b1262360843,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360843,41).
xc_kb_names(a65b1262360843,["?c1","?c2"]).
xc_mapping_rows(a65b1262360843,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 49, column 52), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1262360843,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 49, column 52), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_chooseBestTradeoff,x_ComplexActionPredicate) :- x_cid(a65b1262360844).
xc_microtheory(a65b1262360844,x_TestPlanMt).
xc_source_file(a65b1262360844,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360844,51).
xc_kb_names(a65b1262360844,[]).
xc_mapping_rows(a65b1262360844,[]).
x_arity(x_chooseBestTradeoff,2) :- x_cid(a65b1262360845).
xc_microtheory(a65b1262360845,x_TestPlanMt).
xc_source_file(a65b1262360845,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360845,52).
xc_kb_names(a65b1262360845,[]).
xc_mapping_rows(a65b1262360845,[]).
x_preconditionForMethod(x_closestArguments(V1,V2,V3),x_methodForAction(x_chooseBestTradeoff(V1,V2),x_actionSequence(x_TheList(x_doAgentPlan(V3))))) :- x_cid(a65b1262360846,V1,V2,V3).
xc_microtheory(a65b1262360846,x_TestPlanMt).
xc_source_file(a65b1262360846,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360846,55).
xc_kb_names(a65b1262360846,["?mt","?task","?best-plan"]).
xc_mapping_rows(a65b1262360846,[]).
x_isa(x_closestArguments,x_TernaryPredicate) :- x_cid(a65b1262360847).
xc_microtheory(a65b1262360847,x_TestPlanMt).
xc_source_file(a65b1262360847,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360847,63).
xc_kb_names(a65b1262360847,[]).
xc_mapping_rows(a65b1262360847,[]).
x_arity(x_closestArguments,3) :- x_cid(a65b1262360848).
xc_microtheory(a65b1262360848,x_TestPlanMt).
xc_source_file(a65b1262360848,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360848,64).
xc_kb_names(a65b1262360848,[]).
xc_mapping_rows(a65b1262360848,[]).
'x_<=='(x_closestArguments(V1,V2,V3),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_and(x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_planForTask(V2,V5))))))),x_evaluate(V3,x_FirstInListFn(x_SortFn(V4,x_lessThan,x_FunctionToArg(2,x_resourceImbalance))))) :- x_cid(a65b1262360849,V1,V2,V3,V4,V5).
xc_microtheory(a65b1262360849,x_TestPlanMt).
xc_source_file(a65b1262360849,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b1262360849,66).
xc_kb_names(a65b1262360849,["?mt","?task","?best-plan","?plans","?plan"]).
xc_mapping_rows(a65b1262360849,[]).
x_isa(x_resourceImbalance,x_BinaryPredicate) :- x_cid(a65b126236084a).
xc_microtheory(a65b126236084a,x_TestPlanMt).
xc_source_file(a65b126236084a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236084a,79).
xc_kb_names(a65b126236084a,[]).
xc_mapping_rows(a65b126236084a,[]).
x_arity(x_resourceImbalance,2) :- x_cid(a65b126236084b).
xc_microtheory(a65b126236084b,x_TestPlanMt).
xc_source_file(a65b126236084b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236084b,80).
xc_kb_names(a65b126236084b,[]).
xc_mapping_rows(a65b126236084b,[]).
'x_<=='(x_resourceImbalance(V1,V2),x_unifies(x_actionSequence(x_TheList(x_doAnnounce(V3,t(V4,V5)))),V1),x_groundExpression(V4),x_groundExpression(V5),x_evaluate(V2,x_AbsoluteValueFn(x_DifferenceFn(V5,V4)))) :- x_cid(a65b126236084c,V1,V2,V3,V4,V5).
xc_microtheory(a65b126236084c,x_TestPlanMt).
xc_source_file(a65b126236084c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236084c,82).
xc_kb_names(a65b126236084c,["?plan","?val","?msg","?arg1","?arg2"]).
xc_mapping_rows(a65b126236084c,[]).
x_isa(x_generateNSamples,x_QuaternaryPredicate) :- x_cid(a65b126236084d).
xc_microtheory(a65b126236084d,x_TestPlanMt).
xc_source_file(a65b126236084d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236084d,88).
xc_kb_names(a65b126236084d,[]).
xc_mapping_rows(a65b126236084d,[]).
x_arity(x_generateNSamples,4) :- x_cid(a65b126236084e).
xc_microtheory(a65b126236084e,x_TestPlanMt).
xc_source_file(a65b126236084e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236084e,89).
xc_kb_names(a65b126236084e,[]).
xc_mapping_rows(a65b126236084e,[]).
'x_<=='(x_generateNSamples(V1,V2,V3,V4),x_evaluate(V5,x_QuotientFn(x_DifferenceFn(V3,V2),V1)),x_integerBetween(1,V6,V1),x_evaluate(V4,x_PlusFn(V2,x_TimesFn(V6,V5)))) :- x_cid(a65b126236084f,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126236084f,x_TestPlanMt).
xc_source_file(a65b126236084f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-plans.krf').
xc_source_line(a65b126236084f,93).
xc_kb_names(a65b126236084f,["?n","?from","?to","?val","?factor","?c"]).
xc_mapping_rows(a65b126236084f,[]).
kb_cache_footer(footer{count:20,digest:'3d5cafa2392249116a7e4edc0dbe8707df48818fc9faa6b2726c39f0c98966c4',headerDigest:'82f558ebda6bda9cb088cede2cfee86acef41b26bf5f4156cac0a8a407ea92e4'}).
