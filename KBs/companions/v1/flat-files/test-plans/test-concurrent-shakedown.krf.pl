:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:20,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:124,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'502219c9aa3776634143cf1cddd379bb35d684d2121da75f78ef8fb4bc95f4ec',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:4122,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf',sourceHash:'23c619dc332dba12501f097b5d32ef075b58a483e32df86511e9a0e1bec3d800',warnings:[]}).
x_genlMt(x_TestPlanMt,x_CompanionsMt) :- x_cid(a65b132d0fd272).
xc_microtheory(a65b132d0fd272,x_TestPlanMt).
xc_source_file(a65b132d0fd272,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd272,6).
xc_kb_names(a65b132d0fd272,[]).
xc_mapping_rows(a65b132d0fd272,[]).
x_genlMt(x_CompanionsMt,x_TestPlanMt) :- x_cid(a65b132d0fd273).
xc_microtheory(a65b132d0fd273,x_TestPlanMt).
xc_source_file(a65b132d0fd273,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd273,7).
xc_kb_names(a65b132d0fd273,[]).
xc_mapping_rows(a65b132d0fd273,[]).
x_isa(x_shakedown3,x_ComplexActionPredicate) :- x_cid(a65b132d0fd274).
xc_microtheory(a65b132d0fd274,x_TestPlanMt).
xc_source_file(a65b132d0fd274,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd274,9).
xc_kb_names(a65b132d0fd274,[]).
xc_mapping_rows(a65b132d0fd274,[]).
x_arity(x_shakedown3,0) :- x_cid(a65b132d0fd275).
xc_microtheory(a65b132d0fd275,x_TestPlanMt).
xc_source_file(a65b132d0fd275,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd275,10).
xc_kb_names(a65b132d0fd275,[]).
xc_mapping_rows(a65b132d0fd275,[]).
x_preconditionForMethod(x_and(x_currentExecutive(V1),x_currentSessionReasoner(V2),x_agendaContext(V3),x_newUniqueTask(x_task1,V4),x_newUniqueTask(x_task2,V5),x_newUniqueTask(x_task3,V6)),x_methodForAction(x_shakedown3,x_actionSequence(x_TheList(x_doAnnounce("Expanding shakedown2 into sub-tasks.",[]),x_doTell('x_ist-Information'(V3,x_assignedTo(V4,V1))),x_doTell('x_ist-Information'(V3,x_assignedTo(V5,V2))),x_doTell('x_ist-Information'(V3,x_assignedTo(V6,V1))),x_doTell('x_ist-Information'(V3,x_subTasks(V4,V5))),x_doTell('x_ist-Information'(V3,x_startsAfterEndingOf(V6,V4))),x_doEnqueue(V1,V4,x_s3Task1),x_doEnqueue(V2,V5,x_s3Task2),x_doEnqueue(V1,V6,x_s3Task3))))) :- x_cid(a65b132d0fd276,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b132d0fd276,x_TestPlanMt).
xc_source_file(a65b132d0fd276,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd276,12).
xc_kb_names(a65b132d0fd276,["?ex","?sr","?mt","?task1","?task2","?task3"]).
xc_mapping_rows(a65b132d0fd276,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 23, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d0fd276,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 23, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s3Task1,x_ComplexActionPredicate) :- x_cid(a65b132d0fd277).
xc_microtheory(a65b132d0fd277,x_TestPlanMt).
xc_source_file(a65b132d0fd277,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd277,52).
xc_kb_names(a65b132d0fd277,[]).
xc_mapping_rows(a65b132d0fd277,[]).
x_arity(x_s3Task1,0) :- x_cid(a65b132d0fd278).
xc_microtheory(a65b132d0fd278,x_TestPlanMt).
xc_source_file(a65b132d0fd278,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd278,53).
xc_kb_names(a65b132d0fd278,[]).
xc_mapping_rows(a65b132d0fd278,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s3Task1,x_actionSequence(x_TheList(x_doAnnounce("~%s3Task1 running on ~a",[V1]))))) :- x_cid(a65b132d0fd279,V1).
xc_microtheory(a65b132d0fd279,x_TestPlanMt).
xc_source_file(a65b132d0fd279,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd279,55).
xc_kb_names(a65b132d0fd279,["?agent"]).
xc_mapping_rows(a65b132d0fd279,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 61, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d0fd279,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 61, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s3Task2,x_ComplexActionPredicate) :- x_cid(a65b132d0fd27a).
xc_microtheory(a65b132d0fd27a,x_TestPlanMt).
xc_source_file(a65b132d0fd27a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd27a,63).
xc_kb_names(a65b132d0fd27a,[]).
xc_mapping_rows(a65b132d0fd27a,[]).
x_arity(x_s3Task2,0) :- x_cid(a65b132d0fd27b).
xc_microtheory(a65b132d0fd27b,x_TestPlanMt).
xc_source_file(a65b132d0fd27b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd27b,64).
xc_kb_names(a65b132d0fd27b,[]).
xc_mapping_rows(a65b132d0fd27b,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s3Task2,x_actionSequence(x_TheList(x_doAnnounce("in parent process",[]),x_doAsynchronousTask(x_actionSequence(x_TheList(x_doAnnounce("starting child 1",[]),x_s3Task2a,x_doAnnounce("ending child 1",[])))),x_doAsynchronousTask(x_actionSequence(x_TheList(x_doAnnounce("starting child 2",[]),x_s3Task2b,x_doAnnounce("ending child 2",[])))),x_doAnnounce("suspending parent task",[]),x_doSuspend,x_doAnnounce("resuming parent task",[]))))) :- x_cid(a65b132d0fd27c,V1).
xc_microtheory(a65b132d0fd27c,x_TestPlanMt).
xc_source_file(a65b132d0fd27c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd27c,66).
xc_kb_names(a65b132d0fd27c,["?agent"]).
xc_mapping_rows(a65b132d0fd27c,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 72, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 76, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 78, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 82, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 84, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 85, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 87, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d0fd27c,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 72, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 76, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 78, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 82, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 84, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 85, column 46), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 87, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s3Task2a,x_ComplexActionPredicate) :- x_cid(a65b132d0fd27d).
xc_microtheory(a65b132d0fd27d,x_TestPlanMt).
xc_source_file(a65b132d0fd27d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd27d,89).
xc_kb_names(a65b132d0fd27d,[]).
xc_mapping_rows(a65b132d0fd27d,[]).
x_arity(x_s3Task2a,0) :- x_cid(a65b132d0fd27e).
xc_microtheory(a65b132d0fd27e,x_TestPlanMt).
xc_source_file(a65b132d0fd27e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd27e,90).
xc_kb_names(a65b132d0fd27e,[]).
xc_mapping_rows(a65b132d0fd27e,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s3Task2a,x_actionSequence(x_TheList(x_doAnnounce("~%s3Task2a running on ~a",[V1]),x_doBusyWaitForUser("Finish 2a?"))))) :- x_cid(a65b132d0fd27f,V1).
xc_microtheory(a65b132d0fd27f,x_TestPlanMt).
xc_source_file(a65b132d0fd27f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd27f,92).
xc_kb_names(a65b132d0fd27f,["?agent"]).
xc_mapping_rows(a65b132d0fd27f,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 98, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d0fd27f,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 98, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s3Task2b,x_ComplexActionPredicate) :- x_cid(a65b132d0fd280).
xc_microtheory(a65b132d0fd280,x_TestPlanMt).
xc_source_file(a65b132d0fd280,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd280,101).
xc_kb_names(a65b132d0fd280,[]).
xc_mapping_rows(a65b132d0fd280,[]).
x_arity(x_s3Task2b,0) :- x_cid(a65b132d0fd281).
xc_microtheory(a65b132d0fd281,x_TestPlanMt).
xc_source_file(a65b132d0fd281,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd281,102).
xc_kb_names(a65b132d0fd281,[]).
xc_mapping_rows(a65b132d0fd281,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s3Task2b,x_actionSequence(x_TheList(x_doAnnounce("~%s3Task2b running on ~a",[V1]),x_doBusyWaitForUser("Finish 2b?"))))) :- x_cid(a65b132d0fd282,V1).
xc_microtheory(a65b132d0fd282,x_TestPlanMt).
xc_source_file(a65b132d0fd282,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd282,104).
xc_kb_names(a65b132d0fd282,["?agent"]).
xc_mapping_rows(a65b132d0fd282,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 110, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d0fd282,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 110, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s3Task3,x_ComplexActionPredicate) :- x_cid(a65b132d0fd283).
xc_microtheory(a65b132d0fd283,x_TestPlanMt).
xc_source_file(a65b132d0fd283,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd283,113).
xc_kb_names(a65b132d0fd283,[]).
xc_mapping_rows(a65b132d0fd283,[]).
x_arity(x_s3Task3,0) :- x_cid(a65b132d0fd284).
xc_microtheory(a65b132d0fd284,x_TestPlanMt).
xc_source_file(a65b132d0fd284,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd284,114).
xc_kb_names(a65b132d0fd284,[]).
xc_mapping_rows(a65b132d0fd284,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s3Task3,x_actionSequence(x_TheList(x_doAnnounce("~%s3Task3 running on ~a",[V1]))))) :- x_cid(a65b132d0fd285,V1).
xc_microtheory(a65b132d0fd285,x_TestPlanMt).
xc_source_file(a65b132d0fd285,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-concurrent-shakedown.krf').
xc_source_line(a65b132d0fd285,116).
xc_kb_names(a65b132d0fd285,["?agent"]).
xc_mapping_rows(a65b132d0fd285,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 122, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d0fd285,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 122, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:20,digest:'502219c9aa3776634143cf1cddd379bb35d684d2121da75f78ef8fb4bc95f4ec',headerDigest:'911c8bb878d062535ec932bed0a4bd15ff74fb48550150736853d2b84a08b85d'}).
