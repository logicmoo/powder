:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:19,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:95,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'1b7354088b4978d2a51898a4e5c1d0ccef2a0686b740be57ab70bade97f2f2c1',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3476,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf',sourceHash:'07d391344b87fee8c569b8c664d2582c1bd138f51a941656f56f469421150252',warnings:[]}).
x_genlMt(x_CompanionsMt,x_TestPlanMt) :- x_cid(a65b12623ab81d).
xc_microtheory(a65b12623ab81d,x_TestPlanMt).
xc_source_file(a65b12623ab81d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab81d,12).
xc_kb_names(a65b12623ab81d,[]).
xc_mapping_rows(a65b12623ab81d,[]).
x_isa(x_testSTN,x_ComplexActionPredicate) :- x_cid(a65b12623ab81e).
xc_microtheory(a65b12623ab81e,x_TestPlanMt).
xc_source_file(a65b12623ab81e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab81e,14).
xc_kb_names(a65b12623ab81e,[]).
xc_mapping_rows(a65b12623ab81e,[]).
x_arity(x_testSTN,1) :- x_cid(a65b12623ab81f).
xc_microtheory(a65b12623ab81f,x_TestPlanMt).
xc_source_file(a65b12623ab81f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab81f,15).
xc_kb_names(a65b12623ab81f,[]).
xc_mapping_rows(a65b12623ab81f,[]).
x_arg1Isa(x_testSTN,x_Microtheory) :- x_cid(a65b12623ab820).
xc_microtheory(a65b12623ab820,x_TestPlanMt).
xc_source_file(a65b12623ab820,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab820,16).
xc_kb_names(a65b12623ab820,[]).
xc_mapping_rows(a65b12623ab820,[]).
x_comment(x_testSTN,"(testSTN ?mt) exercises the dispatchable stn compiler and dispatcher.") :- x_cid(a65b12623ab821).
xc_microtheory(a65b12623ab821,x_TestPlanMt).
xc_source_file(a65b12623ab821,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab821,17).
xc_kb_names(a65b12623ab821,[]).
xc_mapping_rows(a65b12623ab821,[]).
x_preconditionForMethod(x_and(x_kbOnly('x_ist-Information'(V1,V2)),x_agentContext(V3)),x_methodForAction(x_testSTN(V1),x_actionSequence(x_TheList(x_doAnnounce("~%Compiling stn for ~s",[V1]),x_doCompileSTN(V1),x_doRecord(x_genlMt(V3,V1)))))) :- x_cid(a65b12623ab822,V1,V2,V3).
xc_microtheory(a65b12623ab822,x_TestPlanMt).
xc_source_file(a65b12623ab822,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab822,19).
xc_kb_names(a65b12623ab822,["?ctxt","?fact","?agent-ctxt"]).
xc_mapping_rows(a65b12623ab822,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 26, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b12623ab822,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 26, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_beginDurativeTask,x_ComplexActionPredicate) :- x_cid(a65b12623ab823).
xc_microtheory(a65b12623ab823,x_TestPlanMt).
xc_source_file(a65b12623ab823,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab823,32).
xc_kb_names(a65b12623ab823,[]).
xc_mapping_rows(a65b12623ab823,[]).
x_arity(x_beginDurativeTask,1) :- x_cid(a65b12623ab824).
xc_microtheory(a65b12623ab824,x_TestPlanMt).
xc_source_file(a65b12623ab824,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab824,33).
xc_kb_names(a65b12623ab824,[]).
xc_mapping_rows(a65b12623ab824,[]).
x_arg1Isa(x_beginDurativeTask,x_Task) :- x_cid(a65b12623ab825).
xc_microtheory(a65b12623ab825,x_TestPlanMt).
xc_source_file(a65b12623ab825,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab825,34).
xc_kb_names(a65b12623ab825,[]).
xc_mapping_rows(a65b12623ab825,[]).
x_comment(x_beginDurativeTask,"(beginDurativeTask ?task) reports the start of the task and randomly picks an ending turn within its duration and ends and reports the task upon completion.  For testing.") :- x_cid(a65b12623ab826).
xc_microtheory(a65b12623ab826,x_TestPlanMt).
xc_source_file(a65b12623ab826,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab826,35).
xc_kb_names(a65b12623ab826,[]).
xc_mapping_rows(a65b12623ab826,[]).
x_preconditionForMethod(x_and(x_currentTurn(V1),x_duration(V2,x_Turns(V3,V4)),x_evaluate(V5,x_PlusFn(V1,x_RandomMemberFn(x_TheClosedRetrievalSetOf(V6,x_integerBetween(V3,V6,V4)))))),x_methodForAction(x_beginDurativeTask(V2),x_actionSequence(x_TheList(x_doAnnounce("~%Starting ~s at turn ~s",[V2,V1]),x_doAgentPlan(x_actionSequence(x_TheList(x_arbitrarilyTerminateDurativeTask(V2,V5)))))))) :- x_cid(a65b12623ab827,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12623ab827,x_TestPlanMt).
xc_source_file(a65b12623ab827,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab827,37).
xc_kb_names(a65b12623ab827,["?turn","?task","?min","?max","?end-turn","?n"]).
xc_mapping_rows(a65b12623ab827,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 49, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b12623ab827,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 49, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_arbitrarilyTerminateDurativeTask,x_ComplexActionPredicate) :- x_cid(a65b12623ab828).
xc_microtheory(a65b12623ab828,x_TestPlanMt).
xc_source_file(a65b12623ab828,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab828,55).
xc_kb_names(a65b12623ab828,[]).
xc_mapping_rows(a65b12623ab828,[]).
x_arity(x_arbitrarilyTerminateDurativeTask,2) :- x_cid(a65b12623ab829).
xc_microtheory(a65b12623ab829,x_TestPlanMt).
xc_source_file(a65b12623ab829,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab829,56).
xc_kb_names(a65b12623ab829,[]).
xc_mapping_rows(a65b12623ab829,[]).
x_arg1Isa(x_arbitrarilyTerminateDurativeTask,x_Task) :- x_cid(a65b12623ab82a).
xc_microtheory(a65b12623ab82a,x_TestPlanMt).
xc_source_file(a65b12623ab82a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab82a,57).
xc_kb_names(a65b12623ab82a,[]).
xc_mapping_rows(a65b12623ab82a,[]).
x_arg2Isa(x_arbitrarilyTerminateDurativeTask,x_Integer) :- x_cid(a65b12623ab82b).
xc_microtheory(a65b12623ab82b,x_TestPlanMt).
xc_source_file(a65b12623ab82b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab82b,58).
xc_kb_names(a65b12623ab82b,[]).
xc_mapping_rows(a65b12623ab82b,[]).
x_comment(x_arbitrarilyTerminateDurativeTask,"(arbitrarilyTerminateDurativeTask ?task ?end-turn) successfully ends ?task upon ?end-turn.") :- x_cid(a65b12623ab82c).
xc_microtheory(a65b12623ab82c,x_TestPlanMt).
xc_source_file(a65b12623ab82c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab82c,59).
xc_kb_names(a65b12623ab82c,[]).
xc_mapping_rows(a65b12623ab82c,[]).
x_preconditionForMethod(x_currentTurn(V1),x_methodForAction(x_arbitrarilyTerminateDurativeTask(V2,V1),x_actionSequence(x_TheList(x_doAnnounce("~%Completing durative task ~s on turn ~s",[V2,V1]))))) :- x_cid(a65b12623ab82d,V1,V2).
xc_microtheory(a65b12623ab82d,x_TestPlanMt).
xc_source_file(a65b12623ab82d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab82d,63).
xc_kb_names(a65b12623ab82d,["?end-turn","?task"]).
xc_mapping_rows(a65b12623ab82d,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 70, column 64), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b12623ab82d,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 70, column 64), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_currentTurn(V1),x_lessThan(V1,V2)),x_methodForAction(x_arbitrarilyTerminateDurativeTask(V3,V2),x_actionSequence(x_TheList(x_doDeferExecution,x_doAgentPlan(x_actionSequence(x_TheList(x_arbitrarilyTerminateDurativeTask(V3,V2)))))))) :- x_cid(a65b12623ab82e,V1,V2,V3).
xc_microtheory(a65b12623ab82e,x_TestPlanMt).
xc_source_file(a65b12623ab82e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab82e,73).
xc_kb_names(a65b12623ab82e,["?turn","?end-turn","?task"]).
xc_mapping_rows(a65b12623ab82e,[]).
x_preconditionForMethod(x_and(x_currentTurn(V1),x_greaterThan(V1,V2)),x_methodForAction(x_arbitrarilyTerminateDurativeTask(V3,V2),x_actionSequence(x_TheList(x_doAnnounce("~%This should *not* happen! Missed the deadline: (~s > ~s)",[V1,V2]))))) :- x_cid(a65b12623ab82f,V1,V2,V3).
xc_microtheory(a65b12623ab82f,x_TestPlanMt).
xc_source_file(a65b12623ab82f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-stn.krf').
xc_source_line(a65b12623ab82f,87).
xc_kb_names(a65b12623ab82f,["?turn","?end-turn","?task"]).
xc_mapping_rows(a65b12623ab82f,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 94, column 81), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b12623ab82f,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 94, column 81), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:19,digest:'1b7354088b4978d2a51898a4e5c1d0ccef2a0686b740be57ab70bade97f2f2c1',headerDigest:'30c9fb0134e4673a808538c92b0281e7dc7a72f294ff02a21e15ea8b3a2c005a'}).
