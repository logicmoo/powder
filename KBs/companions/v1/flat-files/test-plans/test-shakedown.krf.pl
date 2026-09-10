:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:20,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:117,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'50e3dac5a0c3cc1d4b64cc9e7a47dc1fbbe208da0cc9793a97f1273a2b2ea656',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:4005,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf',sourceHash:'55c822f0898241e1e30f64f74c3f3bcc5c1eeef92b92fdcdfe5375461a564386',warnings:[]}).
x_genlMt(x_TestPlanMt,x_CompanionsMt) :- x_cid(a65b132d16b89e).
xc_microtheory(a65b132d16b89e,x_TestPlanMt).
xc_source_file(a65b132d16b89e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b89e,6).
xc_kb_names(a65b132d16b89e,[]).
xc_mapping_rows(a65b132d16b89e,[]).
x_genlMt(x_CompanionsMt,x_TestPlanMt) :- x_cid(a65b132d16b89f).
xc_microtheory(a65b132d16b89f,x_TestPlanMt).
xc_source_file(a65b132d16b89f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b89f,7).
xc_kb_names(a65b132d16b89f,[]).
xc_mapping_rows(a65b132d16b89f,[]).
x_isa(x_shakedown2,x_ComplexActionPredicate) :- x_cid(a65b132d16b8a0).
xc_microtheory(a65b132d16b8a0,x_TestPlanMt).
xc_source_file(a65b132d16b8a0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a0,9).
xc_kb_names(a65b132d16b8a0,[]).
xc_mapping_rows(a65b132d16b8a0,[]).
x_arity(x_shakedown2,0) :- x_cid(a65b132d16b8a1).
xc_microtheory(a65b132d16b8a1,x_TestPlanMt).
xc_source_file(a65b132d16b8a1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a1,10).
xc_kb_names(a65b132d16b8a1,[]).
xc_mapping_rows(a65b132d16b8a1,[]).
x_preconditionForMethod(x_and(x_currentExecutive(V1),x_currentSessionReasoner(V2),x_agendaContext(V3),x_newUniqueTask(x_task1,V4),x_newUniqueTask(x_task2,V5),x_newUniqueTask(x_task2a,V6),x_newUniqueTask(x_task2b,V7),x_newUniqueTask(x_task3,V8)),x_methodForAction(x_shakedown2,x_actionSequence(x_TheList(x_doAnnounce("Expanding shakedown2 into sub-tasks.",[]),x_doTell('x_ist-Information'(V3,x_assignedTo(V4,V1))),x_doTell('x_ist-Information'(V3,x_assignedTo(V5,V2))),x_doTell('x_ist-Information'(V3,x_assignedTo(V6,V2))),x_doTell('x_ist-Information'(V3,x_assignedTo(V7,V2))),x_doTell('x_ist-Information'(V3,x_assignedTo(V8,V1))),x_doTell('x_ist-Information'(V3,x_subTasks(V4,V5))),x_doTell('x_ist-Information'(V3,x_subTasks(V5,V6))),x_doTell('x_ist-Information'(V3,x_subTasks(V5,V7))),x_doTell('x_ist-Information'(V3,x_startsAfterEndingOf(V8,V4))),x_doEnqueue(V1,V4,x_s2Task1),x_doEnqueue(V2,V5,x_s2Task2),x_doEnqueue(V2,V6,x_s2Task2a),x_doEnqueue(V2,V7,x_s2Task2b),x_doEnqueue(V1,V8,x_s2Task3))))) :- x_cid(a65b132d16b8a2,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b132d16b8a2,x_TestPlanMt).
xc_source_file(a65b132d16b8a2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a2,12).
xc_kb_names(a65b132d16b8a2,["?ex","?sr","?mt","?task1","?task2","?task2a","?task2b","?task3"]).
xc_mapping_rows(a65b132d16b8a2,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 25, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d16b8a2,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 25, column 60), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s2Task1,x_ComplexActionPredicate) :- x_cid(a65b132d16b8a3).
xc_microtheory(a65b132d16b8a3,x_TestPlanMt).
xc_source_file(a65b132d16b8a3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a3,60).
xc_kb_names(a65b132d16b8a3,[]).
xc_mapping_rows(a65b132d16b8a3,[]).
x_arity(x_s2Task1,0) :- x_cid(a65b132d16b8a4).
xc_microtheory(a65b132d16b8a4,x_TestPlanMt).
xc_source_file(a65b132d16b8a4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a4,61).
xc_kb_names(a65b132d16b8a4,[]).
xc_mapping_rows(a65b132d16b8a4,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s2Task1,x_actionSequence(x_TheList(x_doAnnounce("~%s2Task1 running on ~a",[V1]))))) :- x_cid(a65b132d16b8a5,V1).
xc_microtheory(a65b132d16b8a5,x_TestPlanMt).
xc_source_file(a65b132d16b8a5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a5,63).
xc_kb_names(a65b132d16b8a5,["?agent"]).
xc_mapping_rows(a65b132d16b8a5,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 69, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d16b8a5,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 69, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s2Task2,x_ComplexActionPredicate) :- x_cid(a65b132d16b8a6).
xc_microtheory(a65b132d16b8a6,x_TestPlanMt).
xc_source_file(a65b132d16b8a6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a6,71).
xc_kb_names(a65b132d16b8a6,[]).
xc_mapping_rows(a65b132d16b8a6,[]).
x_arity(x_s2Task2,0) :- x_cid(a65b132d16b8a7).
xc_microtheory(a65b132d16b8a7,x_TestPlanMt).
xc_source_file(a65b132d16b8a7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a7,72).
xc_kb_names(a65b132d16b8a7,[]).
xc_mapping_rows(a65b132d16b8a7,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s2Task2,x_actionSequence(x_TheList(x_doAnnounce("~%s2Task2 running on ~a",[V1]))))) :- x_cid(a65b132d16b8a8,V1).
xc_microtheory(a65b132d16b8a8,x_TestPlanMt).
xc_source_file(a65b132d16b8a8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a8,74).
xc_kb_names(a65b132d16b8a8,["?agent"]).
xc_mapping_rows(a65b132d16b8a8,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 80, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d16b8a8,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 80, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s2Task2a,x_ComplexActionPredicate) :- x_cid(a65b132d16b8a9).
xc_microtheory(a65b132d16b8a9,x_TestPlanMt).
xc_source_file(a65b132d16b8a9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8a9,82).
xc_kb_names(a65b132d16b8a9,[]).
xc_mapping_rows(a65b132d16b8a9,[]).
x_arity(x_s2Task2a,0) :- x_cid(a65b132d16b8aa).
xc_microtheory(a65b132d16b8aa,x_TestPlanMt).
xc_source_file(a65b132d16b8aa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8aa,83).
xc_kb_names(a65b132d16b8aa,[]).
xc_mapping_rows(a65b132d16b8aa,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s2Task2a,x_actionSequence(x_TheList(x_doAnnounce("~%s2Task2a running on ~a",[V1]),x_doBusyWaitForUser("Finish 2a?"))))) :- x_cid(a65b132d16b8ab,V1).
xc_microtheory(a65b132d16b8ab,x_TestPlanMt).
xc_source_file(a65b132d16b8ab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8ab,85).
xc_kb_names(a65b132d16b8ab,["?agent"]).
xc_mapping_rows(a65b132d16b8ab,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 91, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d16b8ab,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 91, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s2Task2b,x_ComplexActionPredicate) :- x_cid(a65b132d16b8ac).
xc_microtheory(a65b132d16b8ac,x_TestPlanMt).
xc_source_file(a65b132d16b8ac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8ac,94).
xc_kb_names(a65b132d16b8ac,[]).
xc_mapping_rows(a65b132d16b8ac,[]).
x_arity(x_s2Task2b,0) :- x_cid(a65b132d16b8ad).
xc_microtheory(a65b132d16b8ad,x_TestPlanMt).
xc_source_file(a65b132d16b8ad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8ad,95).
xc_kb_names(a65b132d16b8ad,[]).
xc_mapping_rows(a65b132d16b8ad,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s2Task2b,x_actionSequence(x_TheList(x_doAnnounce("~%s2Task2b running on ~a",[V1]),x_doBusyWaitForUser("Finish 2b?"))))) :- x_cid(a65b132d16b8ae,V1).
xc_microtheory(a65b132d16b8ae,x_TestPlanMt).
xc_source_file(a65b132d16b8ae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8ae,97).
xc_kb_names(a65b132d16b8ae,["?agent"]).
xc_mapping_rows(a65b132d16b8ae,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 103, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d16b8ae,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 103, column 48), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_s2Task3,x_ComplexActionPredicate) :- x_cid(a65b132d16b8af).
xc_microtheory(a65b132d16b8af,x_TestPlanMt).
xc_source_file(a65b132d16b8af,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8af,106).
xc_kb_names(a65b132d16b8af,[]).
xc_mapping_rows(a65b132d16b8af,[]).
x_arity(x_s2Task3,0) :- x_cid(a65b132d16b8b0).
xc_microtheory(a65b132d16b8b0,x_TestPlanMt).
xc_source_file(a65b132d16b8b0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8b0,107).
xc_kb_names(a65b132d16b8b0,[]).
xc_mapping_rows(a65b132d16b8b0,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_s2Task3,x_actionSequence(x_TheList(x_doAnnounce("~%s2Task3 running on ~a",[V1]))))) :- x_cid(a65b132d16b8b1,V1).
xc_microtheory(a65b132d16b8b1,x_TestPlanMt).
xc_source_file(a65b132d16b8b1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-shakedown.krf').
xc_source_line(a65b132d16b8b1,109).
xc_kb_names(a65b132d16b8b1,["?agent"]).
xc_mapping_rows(a65b132d16b8b1,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 115, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d16b8b1,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 115, column 47), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:20,digest:'50e3dac5a0c3cc1d4b64cc9e7a47dc1fbbe208da0cc9793a97f1273a2b2ea656',headerDigest:'73cae03ca7eca5ce63f83741f75eb20aae1a8564eaa133ed21ac4ba9ecf20424'}).
