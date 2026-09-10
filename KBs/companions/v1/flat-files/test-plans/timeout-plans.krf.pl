:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:17,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:74,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:d4dd2bcbb23e396acd8e11d1182b91f8bc06319c3da5b5a3d76045dc1fa02cfe,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2163,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf',sourceHash:'1100a58382b6d218aec709c0fc34cd53cc9721a085f9d7dc3b982a6078f0d1bc',warnings:[]}).
x_genlMt(x_TestPlanMt,x_CompanionsMt) :- x_cid(a65b12623cd7c5).
xc_microtheory(a65b12623cd7c5,x_TestPlanMt).
xc_source_file(a65b12623cd7c5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7c5,7).
xc_kb_names(a65b12623cd7c5,[]).
xc_mapping_rows(a65b12623cd7c5,[]).
x_genlMt(x_CompanionsMt,x_TestPlanMt) :- x_cid(a65b12623cd7c6).
xc_microtheory(a65b12623cd7c6,x_TestPlanMt).
xc_source_file(a65b12623cd7c6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7c6,8).
xc_kb_names(a65b12623cd7c6,[]).
xc_mapping_rows(a65b12623cd7c6,[]).
'x_<=='(x_fibonacci(0,0)) :- x_cid(a65b12623cd7c7).
xc_microtheory(a65b12623cd7c7,x_TestPlanMt).
xc_source_file(a65b12623cd7c7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7c7,10).
xc_kb_names(a65b12623cd7c7,[]).
xc_mapping_rows(a65b12623cd7c7,[]).
'x_<=='(x_fibonacci(1,1)) :- x_cid(a65b12623cd7c8).
xc_microtheory(a65b12623cd7c8,x_TestPlanMt).
xc_source_file(a65b12623cd7c8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7c8,12).
xc_kb_names(a65b12623cd7c8,[]).
xc_mapping_rows(a65b12623cd7c8,[]).
'x_<=='(x_fibonacci(V1,V2),x_groundExpression(V1),x_greaterThan(V1,1),x_evaluate(V3,x_DifferenceFn(V1,1)),x_evaluate(V4,x_DifferenceFn(V1,2)),x_fibonacci(V3,V5),x_fibonacci(V4,V6),x_evaluate(V2,x_PlusFn(V5,V6))) :- x_cid(a65b12623cd7c9,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12623cd7c9,x_TestPlanMt).
xc_source_file(a65b12623cd7c9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7c9,14).
xc_kb_names(a65b12623cd7c9,["?n","?f","?n-1","?n-2","?fn-1","?fn-2"]).
xc_mapping_rows(a65b12623cd7c9,[]).
x_isa(x_timeoutPlan,x_ComplexActionPredicate) :- x_cid(a65b12623cd7ca).
xc_microtheory(a65b12623cd7ca,x_TestPlanMt).
xc_source_file(a65b12623cd7ca,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7ca,23).
xc_kb_names(a65b12623cd7ca,[]).
xc_mapping_rows(a65b12623cd7ca,[]).
x_arity(x_timeoutPlan,2) :- x_cid(a65b12623cd7cb).
xc_microtheory(a65b12623cd7cb,x_TestPlanMt).
xc_source_file(a65b12623cd7cb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7cb,24).
xc_kb_names(a65b12623cd7cb,[]).
xc_mapping_rows(a65b12623cd7cb,[]).
x_comment(x_timeoutPlan,"(timeoutPlan ?timelimit ?depthlimit) starts an (inefficient) fibonacci computation to test the handling of resource limits.") :- x_cid(a65b12623cd7cc).
xc_microtheory(a65b12623cd7cc,x_TestPlanMt).
xc_source_file(a65b12623cd7cc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7cc,25).
xc_kb_names(a65b12623cd7cc,[]).
xc_mapping_rows(a65b12623cd7cc,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_timeoutPlan(V1,V2),x_actionSequence(x_TheList(x_doAgentPlan(x_withTimeout(V1,x_slowPlan(V2))),x_doAgentPlan(x_withCurrentTimestamp(x_reasonAboutPossibleTimeout)))))) :- x_cid(a65b12623cd7cd,V1,V2).
xc_microtheory(a65b12623cd7cd,x_TestPlanMt).
xc_source_file(a65b12623cd7cd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7cd,27).
xc_kb_names(a65b12623cd7cd,["?timeout","?depth-limit"]).
xc_mapping_rows(a65b12623cd7cd,[]).
x_isa(x_slowPlan,x_ComplexActionPredicate) :- x_cid(a65b12623cd7ce).
xc_microtheory(a65b12623cd7ce,x_TestPlanMt).
xc_source_file(a65b12623cd7ce,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7ce,37).
xc_kb_names(a65b12623cd7ce,[]).
xc_mapping_rows(a65b12623cd7ce,[]).
x_arity(x_slowPlan,1) :- x_cid(a65b12623cd7cf).
xc_microtheory(a65b12623cd7cf,x_TestPlanMt).
xc_source_file(a65b12623cd7cf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7cf,38).
xc_kb_names(a65b12623cd7cf,[]).
xc_mapping_rows(a65b12623cd7cf,[]).
x_preconditionForMethod(x_withBackchainingDepth(V1,x_fibonacci(30,V2)),x_methodForAction(x_slowPlan(V1),x_actionSequence(x_TheList(x_doAnnounce("~&fibonacci of 30 is ~s",[V2]))))) :- x_cid(a65b12623cd7d0,V1,V2).
xc_microtheory(a65b12623cd7d0,x_TestPlanMt).
xc_source_file(a65b12623cd7d0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7d0,40).
xc_kb_names(a65b12623cd7d0,["?depth-limit","?answer"]).
xc_mapping_rows(a65b12623cd7d0,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 46, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b12623cd7d0,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 46, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_slowPlan(V1),x_actionSequence(x_TheList))) :- x_cid(a65b12623cd7d1,V1).
xc_microtheory(a65b12623cd7d1,x_TestPlanMt).
xc_source_file(a65b12623cd7d1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7d1,52).
xc_kb_names(a65b12623cd7d1,["?depth-limit"]).
xc_mapping_rows(a65b12623cd7d1,[]).
'x_<=='(x_preferInContext(x_slowPlan(V1),V2,x_actionSequence(x_TheList))) :- x_cid(a65b12623cd7d2,V1,V2).
xc_microtheory(a65b12623cd7d2,x_TestPlanMt).
xc_source_file(a65b12623cd7d2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7d2,59).
xc_kb_names(a65b12623cd7d2,["?depth-limit","?seq1"]).
xc_mapping_rows(a65b12623cd7d2,[]).
x_isa(x_reasonAboutPossibleTimeout,x_ComplexActionPredicate) :- x_cid(a65b12623cd7d3).
xc_microtheory(a65b12623cd7d3,x_TestPlanMt).
xc_source_file(a65b12623cd7d3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7d3,61).
xc_kb_names(a65b12623cd7d3,[]).
xc_mapping_rows(a65b12623cd7d3,[]).
x_arity(x_reasonAboutPossibleTimeout,0) :- x_cid(a65b12623cd7d4).
xc_microtheory(a65b12623cd7d4,x_TestPlanMt).
xc_source_file(a65b12623cd7d4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7d4,62).
xc_kb_names(a65b12623cd7d4,[]).
xc_mapping_rows(a65b12623cd7d4,[]).
x_preconditionForMethod(x_and(x_queryTimedOut(V1),x_depthLimitExceeded(V2)),x_methodForAction(x_reasonAboutPossibleTimeout,x_actionSequence(x_TheList(x_doAnnounce("Timeout status is ~s",[V1]),x_doAnnounce("Depth limit status is ~s",[V2]))))) :- x_cid(a65b12623cd7d5,V1,V2).
xc_microtheory(a65b12623cd7d5,x_TestPlanMt).
xc_source_file(a65b12623cd7d5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/timeout-plans.krf').
xc_source_line(a65b12623cd7d5,64).
xc_kb_names(a65b12623cd7d5,["?timed-out","?depth-exceeded"]).
xc_mapping_rows(a65b12623cd7d5,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 71, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 72, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b12623cd7d5,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 71, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 72, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:17,digest:d4dd2bcbb23e396acd8e11d1182b91f8bc06319c3da5b5a3d76045dc1fa02cfe,headerDigest:'7d5985ba5eed56a67056e04f87e50d15badbe7a99b54390fa0e408bb2200c1de'}).
