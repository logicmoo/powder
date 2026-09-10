:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:59,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:243,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'1562117a1bee489ff33e53f7c61174ceab9dcc589739536bf3ae173e9444c697',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:10033,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf',sourceHash:'5a2ded8a9957580d5366c73bf308dd449d90d39f9f85ce1087c2cc99a06c1a18',warnings:[]}).
x_isa(x_Task,x_Collection) :- x_cid(a65b125e6310f0).
xc_microtheory(a65b125e6310f0,x_CompanionsMt).
xc_source_file(a65b125e6310f0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f0,16).
xc_kb_names(a65b125e6310f0,[]).
xc_mapping_rows(a65b125e6310f0,[]).
x_genls(x_Task,x_PurposefulAction) :- x_cid(a65b125e6310f1).
xc_microtheory(a65b125e6310f1,x_CompanionsMt).
xc_source_file(a65b125e6310f1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f1,17).
xc_kb_names(a65b125e6310f1,[]).
xc_mapping_rows(a65b125e6310f1,[]).
x_comment(x_Task,"A task is a persistent Davidsonian representation of a concrete\n intended action.  It may have an associated action sequence, in which case it\n may be scheduled on an agenda.  A fully fleshed-out task should specify the\n goal(s) it is intended to serve, the means by which it will be achieved, a\n mechanism for evaluating its success, an assignment to an agent, restrictions \n on how and when it may be pursued, any decompositions to subtasks that may be\n possible.  The ability to partially specify any or all of these enables\n strategic knowledge to be learnable, communicable, and incrementally refined.\n Tasks are much like military tasks, but not limited to military units.") :- x_cid(a65b125e6310f2).
xc_microtheory(a65b125e6310f2,x_CompanionsMt).
xc_source_file(a65b125e6310f2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f2,19).
xc_kb_names(a65b125e6310f2,[]).
xc_mapping_rows(a65b125e6310f2,[]).
x_isa(x_newUniqueTask,x_BinaryPredicate) :- x_cid(a65b125e6310f3).
xc_microtheory(a65b125e6310f3,x_CompanionsMt).
xc_source_file(a65b125e6310f3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f3,30).
xc_kb_names(a65b125e6310f3,[]).
xc_mapping_rows(a65b125e6310f3,[]).
x_isa(x_newUniqueTask,x_DynamicUpdatePredicate) :- x_cid(a65b125e6310f4).
xc_microtheory(a65b125e6310f4,x_CompanionsMt).
xc_source_file(a65b125e6310f4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f4,31).
xc_kb_names(a65b125e6310f4,[]).
xc_mapping_rows(a65b125e6310f4,[]).
x_arity(x_newUniqueTask,2) :- x_cid(a65b125e6310f5).
xc_microtheory(a65b125e6310f5,x_CompanionsMt).
xc_source_file(a65b125e6310f5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f5,32).
xc_kb_names(a65b125e6310f5,[]).
xc_mapping_rows(a65b125e6310f5,[]).
x_arg1Isa(x_newUniqueTask,x_Thing) :- x_cid(a65b125e6310f6).
xc_microtheory(a65b125e6310f6,x_CompanionsMt).
xc_source_file(a65b125e6310f6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f6,33).
xc_kb_names(a65b125e6310f6,[]).
xc_mapping_rows(a65b125e6310f6,[]).
x_arg2Isa(x_newUniqueTask,x_Task) :- x_cid(a65b125e6310f7).
xc_microtheory(a65b125e6310f7,x_CompanionsMt).
xc_source_file(a65b125e6310f7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f7,34).
xc_kb_names(a65b125e6310f7,[]).
xc_mapping_rows(a65b125e6310f7,[]).
x_comment(x_newUniqueTask,"(newUniqueTask ?prefix ?task) generates a new guid symbol\nfrom ?prefix and wraps it in (TaskFn <id>).") :- x_cid(a65b125e6310f8).
xc_microtheory(a65b125e6310f8,x_CompanionsMt).
xc_source_file(a65b125e6310f8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f8,35).
xc_kb_names(a65b125e6310f8,[]).
xc_mapping_rows(a65b125e6310f8,[]).
'x_<=='(x_newUniqueTask(V1,V2),x_newUUIDSymbol(V1,V3),x_unifies(V2,x_TaskFn(V3))) :- x_cid(a65b125e6310f9,V1,V2,V3).
xc_microtheory(a65b125e6310f9,x_CompanionsMt).
xc_source_file(a65b125e6310f9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310f9,38).
xc_kb_names(a65b125e6310f9,["?prefix","?task","?id"]).
xc_mapping_rows(a65b125e6310f9,[]).
x_isa(x_newVolatileTask,x_UnaryPredicate) :- x_cid(a65b125e6310fa).
xc_microtheory(a65b125e6310fa,x_CompanionsMt).
xc_source_file(a65b125e6310fa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310fa,42).
xc_kb_names(a65b125e6310fa,[]).
xc_mapping_rows(a65b125e6310fa,[]).
x_isa(x_newVolatileTask,x_DynamicUpdatePredicate) :- x_cid(a65b125e6310fb).
xc_microtheory(a65b125e6310fb,x_CompanionsMt).
xc_source_file(a65b125e6310fb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310fb,43).
xc_kb_names(a65b125e6310fb,[]).
xc_mapping_rows(a65b125e6310fb,[]).
x_arity(x_newVolatileTask,1) :- x_cid(a65b125e6310fc).
xc_microtheory(a65b125e6310fc,x_CompanionsMt).
xc_source_file(a65b125e6310fc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310fc,44).
xc_kb_names(a65b125e6310fc,[]).
xc_mapping_rows(a65b125e6310fc,[]).
x_arg1Isa(x_newVolatileTask,x_Task) :- x_cid(a65b125e6310fd).
xc_microtheory(a65b125e6310fd,x_CompanionsMt).
xc_source_file(a65b125e6310fd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310fd,45).
xc_kb_names(a65b125e6310fd,[]).
xc_mapping_rows(a65b125e6310fd,[]).
x_comment(x_newVolatileTask,"(newVolatileTask ?task) incrementally generates\na new id from the agenda-item counter and wraps it in (TaskFn <id>).") :- x_cid(a65b125e6310fe).
xc_microtheory(a65b125e6310fe,x_CompanionsMt).
xc_source_file(a65b125e6310fe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310fe,46).
xc_kb_names(a65b125e6310fe,[]).
xc_mapping_rows(a65b125e6310fe,[]).
'x_<=='(x_newVolatileTask(x_TaskFn(V1)),x_nextCounterValue(x_agendaItemId,V1)) :- x_cid(a65b125e6310ff,V1).
xc_microtheory(a65b125e6310ff,x_CompanionsMt).
xc_source_file(a65b125e6310ff,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e6310ff,49).
xc_kb_names(a65b125e6310ff,["?id"]).
xc_mapping_rows(a65b125e6310ff,[]).
x_isa(x_volatileTask,x_UnaryPredicate) :- x_cid(a65b125e631100).
xc_microtheory(a65b125e631100,x_CompanionsMt).
xc_source_file(a65b125e631100,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631100,52).
xc_kb_names(a65b125e631100,[]).
xc_mapping_rows(a65b125e631100,[]).
x_arity(x_volatileTask,1) :- x_cid(a65b125e631101).
xc_microtheory(a65b125e631101,x_CompanionsMt).
xc_source_file(a65b125e631101,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631101,53).
xc_kb_names(a65b125e631101,[]).
xc_mapping_rows(a65b125e631101,[]).
x_arg1Isa(x_volatileTask,x_Task) :- x_cid(a65b125e631102).
xc_microtheory(a65b125e631102,x_CompanionsMt).
xc_source_file(a65b125e631102,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631102,54).
xc_kb_names(a65b125e631102,[]).
xc_mapping_rows(a65b125e631102,[]).
x_comment(x_volatileTask,"(volatileTask ?task) holds if ?task is volatile.") :- x_cid(a65b125e631103).
xc_microtheory(a65b125e631103,x_CompanionsMt).
xc_source_file(a65b125e631103,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631103,55).
xc_kb_names(a65b125e631103,[]).
xc_mapping_rows(a65b125e631103,[]).
'x_<=='(x_volatileTask(V1),x_groundExpression(V1),x_unifies(V1,x_TaskFn(V2)),x_isa(V2,x_Integer)) :- x_cid(a65b125e631104,V1,V2).
xc_microtheory(a65b125e631104,x_CompanionsMt).
xc_source_file(a65b125e631104,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631104,57).
xc_kb_names(a65b125e631104,["?task","?token"]).
xc_mapping_rows(a65b125e631104,[]).
x_isa(x_methodForTask,x_BinaryPredicate) :- x_cid(a65b125e631105).
xc_microtheory(a65b125e631105,x_CompanionsMt).
xc_source_file(a65b125e631105,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631105,70).
xc_kb_names(a65b125e631105,[]).
xc_mapping_rows(a65b125e631105,[]).
x_genlPreds(x_methodForTask,x_agendaItemActionSequence) :- x_cid(a65b125e631106).
xc_microtheory(a65b125e631106,x_CompanionsMt).
xc_source_file(a65b125e631106,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631106,71).
xc_kb_names(a65b125e631106,[]).
xc_mapping_rows(a65b125e631106,[]).
x_arity(x_methodForTask,2) :- x_cid(a65b125e631107).
xc_microtheory(a65b125e631107,x_CompanionsMt).
xc_source_file(a65b125e631107,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631107,72).
xc_kb_names(a65b125e631107,[]).
xc_mapping_rows(a65b125e631107,[]).
x_arg1Isa(x_methodForTask,x_Task) :- x_cid(a65b125e631108).
xc_microtheory(a65b125e631108,x_CompanionsMt).
xc_source_file(a65b125e631108,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631108,73).
xc_kb_names(a65b125e631108,[]).
xc_mapping_rows(a65b125e631108,[]).
x_arg2Isa(x_methodForTask,x_CycLExpression) :- x_cid(a65b125e631109).
xc_microtheory(a65b125e631109,x_CompanionsMt).
xc_source_file(a65b125e631109,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631109,74).
xc_kb_names(a65b125e631109,[]).
xc_mapping_rows(a65b125e631109,[]).
x_comment(x_methodForTask,"Describes the actions the should be taken to perform the task") :- x_cid(a65b125e63110a).
xc_microtheory(a65b125e63110a,x_CompanionsMt).
xc_source_file(a65b125e63110a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63110a,75).
xc_kb_names(a65b125e63110a,[]).
xc_mapping_rows(a65b125e63110a,[]).
x_isa(x_alternativeActionChoices,x_BinaryPredicate) :- x_cid(a65b125e63110b).
xc_microtheory(a65b125e63110b,x_CompanionsMt).
xc_source_file(a65b125e63110b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63110b,79).
xc_kb_names(a65b125e63110b,[]).
xc_mapping_rows(a65b125e63110b,[]).
x_arity(x_alternativeActionChoices,2) :- x_cid(a65b125e63110c).
xc_microtheory(a65b125e63110c,x_CompanionsMt).
xc_source_file(a65b125e63110c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63110c,80).
xc_kb_names(a65b125e63110c,[]).
xc_mapping_rows(a65b125e63110c,[]).
x_arg1Isa(x_alternativeActionChoices,x_CycLTerm) :- x_cid(a65b125e63110d).
xc_microtheory(a65b125e63110d,x_CompanionsMt).
xc_source_file(a65b125e63110d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63110d,81).
xc_kb_names(a65b125e63110d,[]).
xc_mapping_rows(a65b125e63110d,[]).
x_arg2Isa(x_alternativeActionChoices,'x_Set-Mathematical') :- x_cid(a65b125e63110e).
xc_microtheory(a65b125e63110e,x_CompanionsMt).
xc_source_file(a65b125e63110e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63110e,82).
xc_kb_names(a65b125e63110e,[]).
xc_mapping_rows(a65b125e63110e,[]).
x_comment(x_alternativeActionChoices,"(alternativeActionChoices ?name ?set) means\n that ?set is a (possibly singleton) set of mutually-exclusive, optional tasks.\n This information is used by the temporal scheduler to set up environment labels\n to maintain constraions on disptach.  The name can be an arbitrary symbol or\n a readable decision point name from a COA.") :- x_cid(a65b125e63110f).
xc_microtheory(a65b125e63110f,x_CompanionsMt).
xc_source_file(a65b125e63110f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63110f,83).
xc_kb_names(a65b125e63110f,[]).
xc_mapping_rows(a65b125e63110f,[]).
x_isa(x_assignedTo,x_BinaryPredicate) :- x_cid(a65b125e631110).
xc_microtheory(a65b125e631110,x_CompanionsMt).
xc_source_file(a65b125e631110,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631110,108).
xc_kb_names(a65b125e631110,[]).
xc_mapping_rows(a65b125e631110,[]).
x_arity(x_assignedTo,2) :- x_cid(a65b125e631111).
xc_microtheory(a65b125e631111,x_CompanionsMt).
xc_source_file(a65b125e631111,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631111,109).
xc_kb_names(a65b125e631111,[]).
xc_mapping_rows(a65b125e631111,[]).
x_arg1Isa(x_assignedTo,x_Task) :- x_cid(a65b125e631112).
xc_microtheory(a65b125e631112,x_CompanionsMt).
xc_source_file(a65b125e631112,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631112,110).
xc_kb_names(a65b125e631112,[]).
xc_mapping_rows(a65b125e631112,[]).
x_arg2Isa(x_assignedTo,'x_Agent-Generic') :- x_cid(a65b125e631113).
xc_microtheory(a65b125e631113,x_CompanionsMt).
xc_source_file(a65b125e631113,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631113,111).
xc_kb_names(a65b125e631113,[]).
xc_mapping_rows(a65b125e631113,[]).
x_comment(x_assignedTo,"(assignedTo ?task ?performer) relates a task responsibility to a performer, which may or may not be a companions agent.") :- x_cid(a65b125e631114).
xc_microtheory(a65b125e631114,x_CompanionsMt).
xc_source_file(a65b125e631114,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631114,112).
xc_kb_names(a65b125e631114,[]).
xc_mapping_rows(a65b125e631114,[]).
x_isa(x_taskImportance,x_BinaryPredicate) :- x_cid(a65b125e631115).
xc_microtheory(a65b125e631115,x_CompanionsMt).
xc_source_file(a65b125e631115,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631115,121).
xc_kb_names(a65b125e631115,[]).
xc_mapping_rows(a65b125e631115,[]).
x_arity(x_taskImportance,2) :- x_cid(a65b125e631116).
xc_microtheory(a65b125e631116,x_CompanionsMt).
xc_source_file(a65b125e631116,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631116,122).
xc_kb_names(a65b125e631116,[]).
xc_mapping_rows(a65b125e631116,[]).
x_arg1Isa(x_taskImportance,x_Task) :- x_cid(a65b125e631117).
xc_microtheory(a65b125e631117,x_CompanionsMt).
xc_source_file(a65b125e631117,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631117,123).
xc_kb_names(a65b125e631117,[]).
xc_mapping_rows(a65b125e631117,[]).
x_arg2Isa(x_taskImportance,x_ScalarInterval) :- x_cid(a65b125e631118).
xc_microtheory(a65b125e631118,x_CompanionsMt).
xc_source_file(a65b125e631118,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631118,124).
xc_kb_names(a65b125e631118,[]).
xc_mapping_rows(a65b125e631118,[]).
x_comment(x_taskImportance,"(taskImportance ?task ?importance) is the knowledge-level way of reifying the priority of a task.") :- x_cid(a65b125e631119).
xc_microtheory(a65b125e631119,x_CompanionsMt).
xc_source_file(a65b125e631119,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631119,125).
xc_kb_names(a65b125e631119,[]).
xc_mapping_rows(a65b125e631119,[]).
x_isa(x_TaskStatus,x_FirstOrderCollection) :- x_cid(a65b125e63111a).
xc_microtheory(a65b125e63111a,x_CompanionsMt).
xc_source_file(a65b125e63111a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63111a,128).
xc_kb_names(a65b125e63111a,[]).
xc_mapping_rows(a65b125e63111a,[]).
x_isa(x_Failed,x_TaskStatus) :- x_cid(a65b125e63111b).
xc_microtheory(a65b125e63111b,x_CompanionsMt).
xc_source_file(a65b125e63111b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63111b,129).
xc_kb_names(a65b125e63111b,[]).
xc_mapping_rows(a65b125e63111b,[]).
x_isa(x_Completed,x_TaskStatus) :- x_cid(a65b125e63111c).
xc_microtheory(a65b125e63111c,x_CompanionsMt).
xc_source_file(a65b125e63111c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63111c,130).
xc_kb_names(a65b125e63111c,[]).
xc_mapping_rows(a65b125e63111c,[]).
x_isa(x_Pending,x_TaskStatus) :- x_cid(a65b125e63111d).
xc_microtheory(a65b125e63111d,x_CompanionsMt).
xc_source_file(a65b125e63111d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63111d,131).
xc_kb_names(a65b125e63111d,[]).
xc_mapping_rows(a65b125e63111d,[]).
x_isa(x_Executing,x_TaskStatus) :- x_cid(a65b125e63111e).
xc_microtheory(a65b125e63111e,x_CompanionsMt).
xc_source_file(a65b125e63111e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63111e,132).
xc_kb_names(a65b125e63111e,[]).
xc_mapping_rows(a65b125e63111e,[]).
x_isa(x_Interrupted,x_TaskStatus) :- x_cid(a65b125e63111f).
xc_microtheory(a65b125e63111f,x_CompanionsMt).
xc_source_file(a65b125e63111f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63111f,133).
xc_kb_names(a65b125e63111f,[]).
xc_mapping_rows(a65b125e63111f,[]).
x_isa(x_Deferred,x_TaskStatus) :- x_cid(a65b125e631120).
xc_microtheory(a65b125e631120,x_CompanionsMt).
xc_source_file(a65b125e631120,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631120,134).
xc_kb_names(a65b125e631120,[]).
xc_mapping_rows(a65b125e631120,[]).
x_isa(x_temporallyDisjointWRTAgent,x_SymmetricBinaryPredicate) :- x_cid(a65b125e631121).
xc_microtheory(a65b125e631121,x_CompanionsMt).
xc_source_file(a65b125e631121,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631121,203).
xc_kb_names(a65b125e631121,[]).
xc_mapping_rows(a65b125e631121,[]).
x_isa(x_temporallyDisjointWRTAgent,x_IrreflexiveBinaryPredicate) :- x_cid(a65b125e631122).
xc_microtheory(a65b125e631122,x_CompanionsMt).
xc_source_file(a65b125e631122,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631122,204).
xc_kb_names(a65b125e631122,[]).
xc_mapping_rows(a65b125e631122,[]).
x_isa(x_temporallyDisjointWRTAgent,x_ComplexTemporalPredicate) :- x_cid(a65b125e631123).
xc_microtheory(a65b125e631123,x_CompanionsMt).
xc_source_file(a65b125e631123,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631123,205).
xc_kb_names(a65b125e631123,[]).
xc_mapping_rows(a65b125e631123,[]).
x_arity(x_temporallyDisjointWRTAgent,2) :- x_cid(a65b125e631124).
xc_microtheory(a65b125e631124,x_CompanionsMt).
xc_source_file(a65b125e631124,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631124,206).
xc_kb_names(a65b125e631124,[]).
xc_mapping_rows(a65b125e631124,[]).
x_arg1Isa(x_temporallyDisjointWRTAgent,x_TemporalThing) :- x_cid(a65b125e631125).
xc_microtheory(a65b125e631125,x_CompanionsMt).
xc_source_file(a65b125e631125,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631125,207).
xc_kb_names(a65b125e631125,[]).
xc_mapping_rows(a65b125e631125,[]).
x_arg2Isa(x_temporallyDisjointWRTAgent,x_TemporalThing) :- x_cid(a65b125e631126).
xc_microtheory(a65b125e631126,x_CompanionsMt).
xc_source_file(a65b125e631126,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631126,208).
xc_kb_names(a65b125e631126,[]).
xc_mapping_rows(a65b125e631126,[]).
x_genlPreds(x_temporallyDisjointWRTAgent,x_different) :- x_cid(a65b125e631127).
xc_microtheory(a65b125e631127,x_CompanionsMt).
xc_source_file(a65b125e631127,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631127,209).
xc_kb_names(a65b125e631127,[]).
xc_mapping_rows(a65b125e631127,[]).
x_genlPreds(x_temporallyDisjointWRTAgent,x_temporallyRelated) :- x_cid(a65b125e631128).
xc_microtheory(a65b125e631128,x_CompanionsMt).
xc_source_file(a65b125e631128,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631128,210).
xc_kb_names(a65b125e631128,[]).
xc_mapping_rows(a65b125e631128,[]).
x_genlPreds(x_temporallyDisjoint,x_temporallyDisjointWRTAgent) :- x_cid(a65b125e631129).
xc_microtheory(a65b125e631129,x_CompanionsMt).
xc_source_file(a65b125e631129,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e631129,211).
xc_kb_names(a65b125e631129,[]).
xc_mapping_rows(a65b125e631129,[]).
x_comment(x_temporallyDisjointWRTAgent,"(temporallyDisjointWRTAgent THING1 THING2) Means that THING1 and THING2 are temporallyDisjoint with respect to the agent that is performing each.  In other words, there exists no time point at which a single agent is performing THING1 and THING2 simultaneously.") :- x_cid(a65b125e63112a).
xc_microtheory(a65b125e63112a,x_CompanionsMt).
xc_source_file(a65b125e63112a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/tasks.krf').
xc_source_line(a65b125e63112a,212).
xc_kb_names(a65b125e63112a,[]).
xc_mapping_rows(a65b125e63112a,[]).
kb_cache_footer(footer{count:59,digest:'1562117a1bee489ff33e53f7c61174ceab9dcc589739536bf3ae173e9444c697',headerDigest:'6da5548231ba78f248a5dc2322e8dfc37a126e34ad05d32c3399ef82c9fc589c'}).
