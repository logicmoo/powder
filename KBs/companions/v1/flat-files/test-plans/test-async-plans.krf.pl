:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:9,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:52,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:fb4b735359dc98b9bad4c2396eb5195265fd90085e9384ccb6eae09dc39687b4,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1332,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf',sourceHash:'79109c76598f854f2216e2b00af668f9fbcc1e6499ee67d973fac3c25296cadb',warnings:[]}).
x_genlMt(x_TestPlanMt,x_CompanionsMt) :- x_cid(a65b132d0d018d).
xc_microtheory(a65b132d0d018d,x_TestMt).
xc_source_file(a65b132d0d018d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf').
xc_source_line(a65b132d0d018d,3).
xc_kb_names(a65b132d0d018d,[]).
xc_mapping_rows(a65b132d0d018d,[]).
x_genlMt(x_CompanionsMt,x_TestMt) :- x_cid(a65b132d0d018e).
xc_microtheory(a65b132d0d018e,x_TestMt).
xc_source_file(a65b132d0d018e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf').
xc_source_line(a65b132d0d018e,4).
xc_kb_names(a65b132d0d018e,[]).
xc_mapping_rows(a65b132d0d018e,[]).
x_isa(x_countDownFrom,x_ComplexActionPredicate) :- x_cid(a65b132d0d018f).
xc_microtheory(a65b132d0d018f,x_TestMt).
xc_source_file(a65b132d0d018f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf').
xc_source_line(a65b132d0d018f,6).
xc_kb_names(a65b132d0d018f,[]).
xc_mapping_rows(a65b132d0d018f,[]).
x_arity(x_countDownFrom,1) :- x_cid(a65b132d0d0190).
xc_microtheory(a65b132d0d0190,x_TestMt).
xc_source_file(a65b132d0d0190,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf').
xc_source_line(a65b132d0d0190,7).
xc_kb_names(a65b132d0d0190,[]).
xc_mapping_rows(a65b132d0d0190,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_countDownFrom(0),x_actionSequence(x_TheList))) :- x_cid(a65b132d0d0191).
xc_microtheory(a65b132d0d0191,x_TestMt).
xc_source_file(a65b132d0d0191,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf').
xc_source_line(a65b132d0d0191,9).
xc_kb_names(a65b132d0d0191,[]).
xc_mapping_rows(a65b132d0d0191,[]).
x_preconditionForMethod(x_and(x_greaterThan(V1,0),x_evaluate(V2,x_DifferenceFn(V1,1))),x_methodForAction(x_countDownFrom(V1),x_actionSequence(x_TheList(x_countDownFrom(V2))))) :- x_cid(a65b132d0d0192,V1,V2).
xc_microtheory(a65b132d0d0192,x_TestMt).
xc_source_file(a65b132d0d0192,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf').
xc_source_line(a65b132d0d0192,16).
xc_kb_names(a65b132d0d0192,["?num","?n-1"]).
xc_mapping_rows(a65b132d0d0192,[]).
x_isa(x_testAsyncPlanning,x_ComplexActionPredicate) :- x_cid(a65b132d0d0193).
xc_microtheory(a65b132d0d0193,x_TestMt).
xc_source_file(a65b132d0d0193,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf').
xc_source_line(a65b132d0d0193,26).
xc_kb_names(a65b132d0d0193,[]).
xc_mapping_rows(a65b132d0d0193,[]).
x_arity(x_testAsyncPlanning,0) :- x_cid(a65b132d0d0194).
xc_microtheory(a65b132d0d0194,x_TestMt).
xc_source_file(a65b132d0d0194,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf').
xc_source_line(a65b132d0d0194,27).
xc_kb_names(a65b132d0d0194,[]).
xc_mapping_rows(a65b132d0d0194,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_testAsyncPlanning,x_actionSequence(x_TheList(x_doAnnounce("in parent process",[]),x_doAsynchronousTask(x_actionSequence(x_TheList(x_doAnnounce("starting child 1",[]),x_countDownFrom(40),x_doAnnounce("ending child 1",[])))),x_doAsynchronousTask(x_actionSequence(x_TheList(x_doAnnounce("starting child 2",[]),x_countDownFrom(10),x_doAnnounce("ending child 2",[])))),x_doAnnounce("suspending parent task",[]),x_doSuspend,x_doAnnounce("resuming parent task",[]))))) :- x_cid(a65b132d0d0195).
xc_microtheory(a65b132d0d0195,x_TestMt).
xc_source_file(a65b132d0d0195,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-async-plans.krf').
xc_source_line(a65b132d0d0195,29).
xc_kb_names(a65b132d0d0195,[]).
xc_mapping_rows(a65b132d0d0195,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 35, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 39, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 41, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 45, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 47, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 48, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 50, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d0d0195,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 35, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 39, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 41, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 45, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 47, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 48, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 50, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:9,digest:fb4b735359dc98b9bad4c2396eb5195265fd90085e9384ccb6eae09dc39687b4,headerDigest:bb4acf6ef2445833da88135a519c768f4bc54fa3bbe73698a87321f584b1fcdb}).
