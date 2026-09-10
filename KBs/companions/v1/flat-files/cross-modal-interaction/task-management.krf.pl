:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:19,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:149,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'50db737b773ebf21b11b6630cf6eedf7150a9a55b79e09a223ce4cea18cacedc',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:4959,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf',sourceHash:'8ad9ed87a578d52bd15963e8a086f1b403229cadab6b4b4dd21371cbaf289e85',warnings:[]}).
x_isa(x_TaskManagementPlansMt,x_ExperimentInfraStructureFn("Cross Modal Interaction")) :- x_cid(a65b125d183ba7).
xc_microtheory(a65b125d183ba7,x_TaskManagementPlansMt).
xc_source_file(a65b125d183ba7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183ba7,15).
xc_kb_names(a65b125d183ba7,[]).
xc_mapping_rows(a65b125d183ba7,[]).
x_isa(x_enqueueSRTask,x_ComplexActionPredicate) :- x_cid(a65b125d183ba8).
xc_microtheory(a65b125d183ba8,x_TaskManagementPlansMt).
xc_source_file(a65b125d183ba8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183ba8,17).
xc_kb_names(a65b125d183ba8,[]).
xc_mapping_rows(a65b125d183ba8,[]).
x_arity(x_enqueueSRTask,1) :- x_cid(a65b125d183ba9).
xc_microtheory(a65b125d183ba9,x_TaskManagementPlansMt).
xc_source_file(a65b125d183ba9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183ba9,18).
xc_kb_names(a65b125d183ba9,[]).
xc_mapping_rows(a65b125d183ba9,[]).
x_preconditionForMethod(x_currentSessionReasoner(V1),x_methodForAction(x_enqueueSRTask(V2),x_actionSequence(x_TheList(x_enqueueTaskForAgent(V1,V2))))) :- x_cid(a65b125d183baa,V1,V2).
xc_microtheory(a65b125d183baa,x_TaskManagementPlansMt).
xc_source_file(a65b125d183baa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183baa,20).
xc_kb_names(a65b125d183baa,["?agent","?plan-form"]).
xc_mapping_rows(a65b125d183baa,[]).
x_isa(x_enqueueLocalTask,x_ComplexActionPredicate) :- x_cid(a65b125d183bab).
xc_microtheory(a65b125d183bab,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bab,28).
xc_kb_names(a65b125d183bab,[]).
xc_mapping_rows(a65b125d183bab,[]).
x_arity(x_enqueueLocalTask,1) :- x_cid(a65b125d183bac).
xc_microtheory(a65b125d183bac,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bac,29).
xc_kb_names(a65b125d183bac,[]).
xc_mapping_rows(a65b125d183bac,[]).
x_preconditionForMethod(x_localAgent(V1),x_methodForAction(x_enqueueLocalTask(V2),x_actionSequence(x_TheList(x_enqueueTaskForAgent(V1,V2))))) :- x_cid(a65b125d183bad,V1,V2).
xc_microtheory(a65b125d183bad,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bad,31).
xc_kb_names(a65b125d183bad,["?agent","?plan-form"]).
xc_mapping_rows(a65b125d183bad,[]).
x_isa(x_enqueueTaskForAgent,x_ComplexActionPredicate) :- x_cid(a65b125d183bae).
xc_microtheory(a65b125d183bae,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bae,39).
xc_kb_names(a65b125d183bae,[]).
xc_mapping_rows(a65b125d183bae,[]).
x_arity(x_enqueueTaskForAgent,2) :- x_cid(a65b125d183baf).
xc_microtheory(a65b125d183baf,x_TaskManagementPlansMt).
xc_source_file(a65b125d183baf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183baf,40).
xc_kb_names(a65b125d183baf,[]).
xc_mapping_rows(a65b125d183baf,[]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_Arg0Fn(V2)),x_newUniqueTask(V1,V3),x_agendaContext(V4)),x_methodForAction(x_enqueueTaskForAgent(V5,V2),x_actionSequence(x_TheList(x_doTell('x_ist-Information'(V4,x_assignedTo(V3,V5))),x_doEnqueue(V5,V3,V2))))) :- x_cid(a65b125d183bb0,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d183bb0,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb0,42).
xc_kb_names(a65b125d183bb0,["?plan-name","?plan-form","?task-id","?agenda-context","?agent"]).
xc_mapping_rows(a65b125d183bb0,[]).
x_isa(x_enqueueSerialTasks,x_ComplexActionPredicate) :- x_cid(a65b125d183bb1).
xc_microtheory(a65b125d183bb1,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb1,53).
xc_kb_names(a65b125d183bb1,[]).
xc_mapping_rows(a65b125d183bb1,[]).
x_arity(x_enqueueSerialTasks,1) :- x_cid(a65b125d183bb2).
xc_microtheory(a65b125d183bb2,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb2,54).
xc_kb_names(a65b125d183bb2,[]).
xc_mapping_rows(a65b125d183bb2,[]).
x_preconditionForMethod(x_and(x_isa(V1,x_List),x_evaluate(V2,x_MapFunctionOverList(x_FirstInListFn,V1)),x_evaluate(V3,x_MapFunctionOverList(x_SecondInListFn,V1)),x_evaluate(V4,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V5,V6),x_and(x_evaluate(V7,x_Arg0Fn(V5)),x_newUniqueTask(V7,V6)))),V2)),x_evaluate(V8,x_RestOfListFn(V4)),x_agendaContext(V9)),x_methodForAction(x_enqueueSerialTasks(V1),x_actionSequence(x_TheList(x_doMap(t(V10,V11),x_doTell('x_ist-Information'(V9,x_startsAfterEndingOf(V11,V10))),V4,V8),x_doMap(t(V12,V10),x_doTell('x_ist-Information'(V9,x_assignedTo(V10,V12))),V3,V4),x_doMap(t(V12,V10,V13),x_doEnqueue(V12,V10,V13),V3,V4,V2))))) :- x_cid(a65b125d183bb3,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125d183bb3,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb3,56).
xc_kb_names(a65b125d183bb3,["?plan-agent-pairs","?plan-forms","?agents","?task-ids","?plan-form","?task-id","?plan-name","?next-task-ids","?agenda-context","?tid","?nid","?a","?planf"]).
xc_mapping_rows(a65b125d183bb3,[]).
x_isa(x_enqueueSerialSubTasks,x_ComplexActionPredicate) :- x_cid(a65b125d183bb4).
xc_microtheory(a65b125d183bb4,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb4,88).
xc_kb_names(a65b125d183bb4,[]).
xc_mapping_rows(a65b125d183bb4,[]).
x_arity(x_enqueueSerialSubTasks,1) :- x_cid(a65b125d183bb5).
xc_microtheory(a65b125d183bb5,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb5,89).
xc_kb_names(a65b125d183bb5,[]).
xc_mapping_rows(a65b125d183bb5,[]).
x_preconditionForMethod(x_and(x_currentAgendaItem(V1),x_isa(V2,x_List),x_evaluate(V3,x_MapFunctionOverList(x_FirstInListFn,V2)),x_evaluate(V4,x_MapFunctionOverList(x_SecondInListFn,V2)),x_evaluate(V5,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V6,V7),x_and(x_evaluate(V8,x_Arg0Fn(V6)),x_newUniqueTask(V8,V7)))),V3)),x_evaluate(V9,x_RestOfListFn(V5)),x_agendaContext(V10)),x_methodForAction(x_enqueueSerialSubTasks(V2),x_actionSequence(x_TheList(x_doMap(t(V11),x_doTell('x_ist-Information'(V10,x_subTasks(V1,V11))),V5),x_doMap(t(V11,V12),x_doTell('x_ist-Information'(V10,x_startsAfterEndingOf(V12,V11))),V5,V9),x_doMap(t(V13,V11),x_doTell('x_ist-Information'(V10,x_assignedTo(V11,V13))),V4,V5),x_doMap(t(V13,V11,V14),x_doEnqueue(V13,V11,V14),V4,V5,V3))))) :- x_cid(a65b125d183bb6,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b125d183bb6,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb6,91).
xc_kb_names(a65b125d183bb6,["?current-task-id","?plan-agent-pairs","?plan-forms","?agents","?task-ids","?plan-form","?task-id","?plan-name","?next-task-ids","?agenda-context","?tid","?nid","?a","?planf"]).
xc_mapping_rows(a65b125d183bb6,[]).
x_isa(x_doCompare,x_ComplexActionPredicate) :- x_cid(a65b125d183bb7).
xc_microtheory(a65b125d183bb7,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb7,127).
xc_kb_names(a65b125d183bb7,[]).
xc_mapping_rows(a65b125d183bb7,[]).
x_arity(x_doCompare,3) :- x_cid(a65b125d183bb8).
xc_microtheory(a65b125d183bb8,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb8,128).
xc_kb_names(a65b125d183bb8,[]).
xc_mapping_rows(a65b125d183bb8,[]).
x_preconditionForMethod(x_outsourcedOnly(x_blockMostOutOfMappingSupport(x_reverseCIsAllowed(x_matchBetween(V1,V2,V3,V4)))),x_methodForAction(x_doCompare(V1,V2,V3),x_actionSequence(x_TheList(x_doAnnounce("performing SME comparison between ~A and ~A  resulted in match ~A",[V1,V2,V4]))))) :- x_cid(a65b125d183bb9,V1,V2,V3,V4).
xc_microtheory(a65b125d183bb9,x_TaskManagementPlansMt).
xc_source_file(a65b125d183bb9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/task-management.krf').
xc_source_line(a65b125d183bb9,130).
xc_kb_names(a65b125d183bb9,["?base","?target","?constraints","?matcher"]).
xc_mapping_rows(a65b125d183bb9,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 142, column 85), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d183bb9,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 142, column 85), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:19,digest:'50db737b773ebf21b11b6630cf6eedf7150a9a55b79e09a223ce4cea18cacedc',headerDigest:b476ac67f5d88b6a4559f34f4b84f1307a0414ced3b057cb15088dc7641b5123}).
