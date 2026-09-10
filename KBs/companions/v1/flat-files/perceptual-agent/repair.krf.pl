:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:144,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:806,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'6005af2654a57f7450324d71ef876ad71ccef4ae658fdf8f6118492503664f45',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:31218,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf',sourceHash:'6c9736675043679a608ff3dbe561518dc83c00b4a1fa3982d24726d72ddfb13a',warnings:[]}).
x_isa(x_invokePlanRepair,x_ComplexActionPredicate) :- x_cid(a65b125e1afdec).
xc_microtheory(a65b125e1afdec,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdec,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdec,15).
xc_kb_names(a65b125e1afdec,[]).
xc_mapping_rows(a65b125e1afdec,[]).
x_arity(x_invokePlanRepair,5) :- x_cid(a65b125e1afded).
xc_microtheory(a65b125e1afded,x_PerceptualAgentMt).
xc_source_file(a65b125e1afded,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afded,16).
xc_kb_names(a65b125e1afded,[]).
xc_mapping_rows(a65b125e1afded,[]).
x_arg1Isa(x_invokePlanRepair,x_Microtheory) :- x_cid(a65b125e1afdee).
xc_microtheory(a65b125e1afdee,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdee,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdee,17).
xc_kb_names(a65b125e1afdee,[]).
xc_mapping_rows(a65b125e1afdee,[]).
x_arg2Isa(x_invokePlanRepair,x_Microtheory) :- x_cid(a65b125e1afdef).
xc_microtheory(a65b125e1afdef,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdef,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdef,18).
xc_kb_names(a65b125e1afdef,[]).
xc_mapping_rows(a65b125e1afdef,[]).
x_arg3Isa(x_invokePlanRepair,x_PerceptualAgentEvent) :- x_cid(a65b125e1afdf0).
xc_microtheory(a65b125e1afdf0,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf0,19).
xc_kb_names(a65b125e1afdf0,[]).
xc_mapping_rows(a65b125e1afdf0,[]).
x_arg4Isa(x_invokePlanRepair,'x_Agent-Generic') :- x_cid(a65b125e1afdf1).
xc_microtheory(a65b125e1afdf1,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf1,20).
xc_kb_names(a65b125e1afdf1,[]).
xc_mapping_rows(a65b125e1afdf1,[]).
x_arg5Isa(x_invokePlanRepair,x_Goal) :- x_cid(a65b125e1afdf2).
xc_microtheory(a65b125e1afdf2,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf2,21).
xc_kb_names(a65b125e1afdf2,[]).
xc_mapping_rows(a65b125e1afdf2,[]).
x_comment(x_invokePlanRepair,"(invokePlanRepair ?mt ?lkmt ?evt ?actor ?prevent-goal) invokes plan repair immediately after being told an event was bad.") :- x_cid(a65b125e1afdf3).
xc_microtheory(a65b125e1afdf3,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf3,22).
xc_kb_names(a65b125e1afdf3,[]).
xc_mapping_rows(a65b125e1afdf3,[]).
x_preconditionForMethod(x_reifiedGoalName(V1,V2,V3,V3),x_methodForAction(x_invokePlanRepair(V4,V1,V5,V6,V3),x_actionSequence(x_TheList(x_repairPlanWRTGoalFailure(V4,V6,V5,V2))))) :- x_cid(a65b125e1afdf4,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e1afdf4,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf4,24).
xc_kb_names(a65b125e1afdf4,["?lkmt","?goal","?goal-rep","?mt","?event","?actor"]).
xc_mapping_rows(a65b125e1afdf4,[]).
x_isa(x_repairPlanWRTGoalFailure,x_ComplexActionPredicate) :- x_cid(a65b125e1afdf5).
xc_microtheory(a65b125e1afdf5,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf5,32).
xc_kb_names(a65b125e1afdf5,[]).
xc_mapping_rows(a65b125e1afdf5,[]).
x_arity(x_repairPlanWRTGoalFailure,4) :- x_cid(a65b125e1afdf6).
xc_microtheory(a65b125e1afdf6,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf6,33).
xc_kb_names(a65b125e1afdf6,[]).
xc_mapping_rows(a65b125e1afdf6,[]).
x_argIsa(x_repairPlanWRTGoalFailure,x_Microtheory) :- x_cid(a65b125e1afdf7).
xc_microtheory(a65b125e1afdf7,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf7,34).
xc_kb_names(a65b125e1afdf7,[]).
xc_mapping_rows(a65b125e1afdf7,[]).
x_arg2Isa(x_repairPlanWRTGoalFailure,'x_Agent-Generic') :- x_cid(a65b125e1afdf8).
xc_microtheory(a65b125e1afdf8,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf8,35).
xc_kb_names(a65b125e1afdf8,[]).
xc_mapping_rows(a65b125e1afdf8,[]).
x_arg3Isa(x_repairPlanWRTGoalFailure,x_PerceptualAgentEvent) :- x_cid(a65b125e1afdf9).
xc_microtheory(a65b125e1afdf9,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdf9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdf9,36).
xc_kb_names(a65b125e1afdf9,[]).
xc_mapping_rows(a65b125e1afdf9,[]).
x_arg4Isa(x_repairPlanWRTGoalFailure,x_Goal) :- x_cid(a65b125e1afdfa).
xc_microtheory(a65b125e1afdfa,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdfa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdfa,37).
xc_kb_names(a65b125e1afdfa,[]).
xc_mapping_rows(a65b125e1afdfa,[]).
x_comment(x_repairPlanWRTGoalFailure,"(repairPlanWRTGoalFailure ?mt ?actor ?event ?failed-goal) identifies the goal and task ?actor was pursuing at time of failure, and tries to repair the plan.") :- x_cid(a65b125e1afdfb).
xc_microtheory(a65b125e1afdfb,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdfb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdfb,38).
xc_kb_names(a65b125e1afdfb,[]).
xc_mapping_rows(a65b125e1afdfb,[]).
x_preconditionForMethod(x_and(x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(V2,V3))))),x_failureForAgent(V1,V2,V4),x_mostRecentGoalAssignment(V1,V4,V3,V5,V6,V7)),x_methodForAction(x_repairPlanWRTGoalFailure(V1,V8,V2,V9),x_actionSequence(x_TheList(x_repairPlan(V1,V4,V2,V6,V7,V5,V3))))) :- x_cid(a65b125e1afdfc,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e1afdfc,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdfc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdfc,40).
xc_kb_names(a65b125e1afdfc,["?mt","?event","?end","?sub-actor","?start","?goal","?task","?actor","?failed-goal"]).
xc_mapping_rows(a65b125e1afdfc,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_repairPlanWRTGoalFailure(V1,V2,V3,V4),x_actionSequence(x_TheList))) :- x_cid(a65b125e1afdfd,V1,V2,V3,V4).
xc_microtheory(a65b125e1afdfd,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdfd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdfd,55).
xc_kb_names(a65b125e1afdfd,["?mt","?actor","?event","?failed-goal"]).
xc_mapping_rows(a65b125e1afdfd,[]).
'x_<=='(x_preferInContext(x_repairPlanWRTGoalFailure(V1,V2,V3,V4),V5,V6),x_different(V5,x_actionSequence(x_TheList))) :- x_cid(a65b125e1afdfe,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e1afdfe,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdfe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdfe,62).
xc_kb_names(a65b125e1afdfe,["?mt","?actor","?event","?failed-goal","?seq1","?seq2"]).
xc_mapping_rows(a65b125e1afdfe,[]).
x_isa(x_failureForAgent,x_TernaryPredicate) :- x_cid(a65b125e1afdff).
xc_microtheory(a65b125e1afdff,x_PerceptualAgentMt).
xc_source_file(a65b125e1afdff,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afdff,65).
xc_kb_names(a65b125e1afdff,[]).
xc_mapping_rows(a65b125e1afdff,[]).
x_arity(x_failureForAgent,3) :- x_cid(a65b125e1afe00).
xc_microtheory(a65b125e1afe00,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe00,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe00,66).
xc_kb_names(a65b125e1afe00,[]).
xc_mapping_rows(a65b125e1afe00,[]).
x_arg1Isa(x_failureForAgent,x_Microtheory) :- x_cid(a65b125e1afe01).
xc_microtheory(a65b125e1afe01,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe01,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe01,67).
xc_kb_names(a65b125e1afe01,[]).
xc_mapping_rows(a65b125e1afe01,[]).
x_arg2Isa(x_failureForAgent,x_Event) :- x_cid(a65b125e1afe02).
xc_microtheory(a65b125e1afe02,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe02,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe02,68).
xc_kb_names(a65b125e1afe02,[]).
xc_mapping_rows(a65b125e1afe02,[]).
x_arg3Isa(x_failureForAgent,'x_Agent-Generic') :- x_cid(a65b125e1afe03).
xc_microtheory(a65b125e1afe03,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe03,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe03,69).
xc_kb_names(a65b125e1afe03,[]).
xc_mapping_rows(a65b125e1afe03,[]).
x_comment(x_failureForAgent,"(failureForAgent ?mt ?event ?agent) means ?agent died.") :- x_cid(a65b125e1afe04).
xc_microtheory(a65b125e1afe04,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe04,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe04,70).
xc_kb_names(a65b125e1afe04,[]).
xc_mapping_rows(a65b125e1afe04,[]).
'x_<=='(x_failureForAgent(V1,V2,V3),x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_maleficiary(V2,V3)))),x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_doneBy(V2,V3))))) :- x_cid(a65b125e1afe05,V1,V2,V3).
xc_microtheory(a65b125e1afe05,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe05,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe05,73).
xc_kb_names(a65b125e1afe05,["?mt","?event","?actor"]).
xc_mapping_rows(a65b125e1afe05,[]).
x_isa(x_mostRecentGoalAssignment,x_Predicate) :- x_cid(a65b125e1afe06).
xc_microtheory(a65b125e1afe06,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe06,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe06,88).
xc_kb_names(a65b125e1afe06,[]).
xc_mapping_rows(a65b125e1afe06,[]).
x_arity(x_mostRecentGoalAssignment,6) :- x_cid(a65b125e1afe07).
xc_microtheory(a65b125e1afe07,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe07,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe07,89).
xc_kb_names(a65b125e1afe07,[]).
xc_mapping_rows(a65b125e1afe07,[]).
x_comment(x_mostRecentGoalAssignment,"(mostRecentGoalAssignment ?mt ?actor ?end ?start ?goal ?task) means that, given an actor that experienced a failureForAgent at time ?end, identify the goal and task it was pursuing when the failure occurred.") :- x_cid(a65b125e1afe08).
xc_microtheory(a65b125e1afe08,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe08,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe08,90).
xc_kb_names(a65b125e1afe08,[]).
xc_mapping_rows(a65b125e1afe08,[]).
'x_<=='(x_mostRecentGoalAssignment(V1,V2,V3,V4,V5,V6),x_evaluate(V7,x_FirstInListFn(x_SortFn(x_TheClosedRetrievalSetOf(V7,x_and(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_holdsIn(V8,x_assignedToGoal(V9,V2,V10))))),x_unifies(V7,t(V8,V9,V10)))),x_greaterThan,x_FunctionToArg(2,x_Kappa(t(V11,V12),x_and(x_operatorFormulas(V8,V11),x_natArgument(V8,1,V12))))))),x_unifies(t(V4,V5,V6),V7)) :- x_cid(a65b125e1afe09,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125e1afe09,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe09,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe09,95).
xc_kb_names(a65b125e1afe09,["?mt","?actor","?end","?start","?goal","?task","?triple","?start-asst","?goal-asst","?task-asst","?in","?out"]).
xc_mapping_rows(a65b125e1afe09,[]).
x_isa(x_repairPlan,x_ComplexActionPredicate) :- x_cid(a65b125e1afe0a).
xc_microtheory(a65b125e1afe0a,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe0a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe0a,121).
xc_kb_names(a65b125e1afe0a,[]).
xc_mapping_rows(a65b125e1afe0a,[]).
x_arity(x_repairPlan,7) :- x_cid(a65b125e1afe0b).
xc_microtheory(a65b125e1afe0b,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe0b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe0b,122).
xc_kb_names(a65b125e1afe0b,[]).
xc_mapping_rows(a65b125e1afe0b,[]).
x_arg1Isa(x_repairPlan,x_Microtheory) :- x_cid(a65b125e1afe0c).
xc_microtheory(a65b125e1afe0c,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe0c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe0c,123).
xc_kb_names(a65b125e1afe0c,[]).
xc_mapping_rows(a65b125e1afe0c,[]).
x_arg2Isa(x_repairPlan,'x_Agent-Generic') :- x_cid(a65b125e1afe0d).
xc_microtheory(a65b125e1afe0d,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe0d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe0d,124).
xc_kb_names(a65b125e1afe0d,[]).
xc_mapping_rows(a65b125e1afe0d,[]).
x_arg3Isa(x_repairPlan,x_PerceptualAgentEvent) :- x_cid(a65b125e1afe0e).
xc_microtheory(a65b125e1afe0e,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe0e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe0e,125).
xc_kb_names(a65b125e1afe0e,[]).
xc_mapping_rows(a65b125e1afe0e,[]).
x_arg4Isa(x_repairPlan,x_Goal) :- x_cid(a65b125e1afe0f).
xc_microtheory(a65b125e1afe0f,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe0f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe0f,126).
xc_kb_names(a65b125e1afe0f,[]).
xc_mapping_rows(a65b125e1afe0f,[]).
x_arg5Isa(x_repairPlan,x_Task) :- x_cid(a65b125e1afe10).
xc_microtheory(a65b125e1afe10,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe10,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe10,127).
xc_kb_names(a65b125e1afe10,[]).
xc_mapping_rows(a65b125e1afe10,[]).
x_arg6Isa(x_repairPlan,x_TimeInterval) :- x_cid(a65b125e1afe11).
xc_microtheory(a65b125e1afe11,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe11,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe11,128).
xc_kb_names(a65b125e1afe11,[]).
xc_mapping_rows(a65b125e1afe11,[]).
x_arg7Isa(x_repairPlan,x_TimeInterval) :- x_cid(a65b125e1afe12).
xc_microtheory(a65b125e1afe12,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe12,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe12,129).
xc_kb_names(a65b125e1afe12,[]).
xc_mapping_rows(a65b125e1afe12,[]).
x_comment(x_repairPlan,"(repairPlan ?mt ?actor ?event ?goal ?task ?start-time ?end-time) attempts to repair the failed plan that led to ?goal failure, or create a new plan.") :- x_cid(a65b125e1afe13).
xc_microtheory(a65b125e1afe13,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe13,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe13,130).
xc_kb_names(a65b125e1afe13,[]).
xc_mapping_rows(a65b125e1afe13,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_repairPlan(V1,V2,V3,V4,V5,V6,V7),x_actionSequence(x_TheList))) :- x_cid(a65b125e1afe14,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e1afe14,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe14,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe14,132).
xc_kb_names(a65b125e1afe14,["?mt","?actor","?event","?goal","?task","?start","?end"]).
xc_mapping_rows(a65b125e1afe14,[]).
x_preconditionForMethod(x_and(x_operatorFormulas(V1,V2),x_allFactsAllowed(x_useTransitiveInference(x_isa(V1,x_SimpleActionPredicate))),x_evaluate(V3,x_GeneralizeFormulaFn(V2)),x_lookupOnly(x_contextEnvAllowed(x_allFactsAllowed(x_sourceForLearnedPlan(V4,x_achieve(x_PreconditionOfFn(V3))))))),x_methodForAction(x_repairPlan(V5,V6,V7,V8,V2,V9,V10),x_actionSequence(x_TheList(x_identifyCriticalDifferenceWRTGoal(V5,V6,V8,V2,V4,V9,V10))))) :- x_cid(a65b125e1afe15,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125e1afe15,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe15,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe15,147).
xc_kb_names(a65b125e1afe15,["?action-pred","?task","?gen-task","?source","?mt","?actor","?event","?goal","?start","?end"]).
xc_mapping_rows(a65b125e1afe15,[]).
'x_<=='(x_preferInContext(x_repairPlan(V1,V2,V3,V4,V5,V6,V7),V8,V9),x_different(V8,x_actionSequence(x_TheList))) :- x_cid(a65b125e1afe16,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e1afe16,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe16,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe16,166).
xc_kb_names(a65b125e1afe16,["?mt","?actor","?event","?goal","?task","?start","?end","?seq1","?seq2"]).
xc_mapping_rows(a65b125e1afe16,[]).
x_isa(x_improvisedPlan,x_QuaternaryPredicate) :- x_cid(a65b125e1afe17).
xc_microtheory(a65b125e1afe17,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe17,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe17,172).
xc_kb_names(a65b125e1afe17,[]).
xc_mapping_rows(a65b125e1afe17,[]).
x_arity(x_improvisedPlan,4) :- x_cid(a65b125e1afe18).
xc_microtheory(a65b125e1afe18,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe18,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe18,173).
xc_kb_names(a65b125e1afe18,[]).
xc_mapping_rows(a65b125e1afe18,[]).
x_arg1Isa(x_improvisedPlan,x_Microtheory) :- x_cid(a65b125e1afe19).
xc_microtheory(a65b125e1afe19,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe19,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe19,174).
xc_kb_names(a65b125e1afe19,[]).
xc_mapping_rows(a65b125e1afe19,[]).
x_arg2Isa(x_improvisedPlan,x_Goal) :- x_cid(a65b125e1afe1a).
xc_microtheory(a65b125e1afe1a,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe1a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe1a,175).
xc_kb_names(a65b125e1afe1a,[]).
xc_mapping_rows(a65b125e1afe1a,[]).
x_arg3Isa(x_improvisedPlan,x_Task) :- x_cid(a65b125e1afe1b).
xc_microtheory(a65b125e1afe1b,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe1b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe1b,176).
xc_kb_names(a65b125e1afe1b,[]).
xc_mapping_rows(a65b125e1afe1b,[]).
x_arg4Isa(x_improvisedPlan,x_TimeInterval) :- x_cid(a65b125e1afe1c).
xc_microtheory(a65b125e1afe1c,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe1c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe1c,177).
xc_kb_names(a65b125e1afe1c,[]).
xc_mapping_rows(a65b125e1afe1c,[]).
x_comment(x_improvisedPlan,"(improvisedPlan ?mt ?goal-name ?task ?when) binds ?task and ?when if ?task was constructed from regression planning on the expected effects of the operator.") :- x_cid(a65b125e1afe1d).
xc_microtheory(a65b125e1afe1d,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe1d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe1d,178).
xc_kb_names(a65b125e1afe1d,[]).
xc_mapping_rows(a65b125e1afe1d,[]).
'x_<=='(x_improvisedPlan(V1,V2,V3,V4),x_groundExpression(V2),x_uninferredSentence(x_lookupOnly(x_localOnly(x_kbOnly('x_ist-Information'(V1,x_goalName(V2,V5)))))),x_numAnswers(1,x_lookupOnly(x_contextEnvAllowed(x_allFactsAllowed('x_ist-Information'(V1,x_goalName(V2,V5)))))),x_uninferredSentence(x_contextEnvAllowed(x_allFactsAllowed('x_ist-Information'(V1,x_complexTaskAchieves(V6,V7,V8))))),x_lookupOnly(x_localOnly(x_allFactsAllowed('x_ist-Information'(V1,x_holdsIn(V4,x_reasonForTask(V3,V2))))))) :- x_cid(a65b125e1afe1e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e1afe1e,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe1e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe1e,183).
xc_kb_names(a65b125e1afe1e,["?mt","?goal-name","?task","?when","?goal-rep","?actor","?goal","?action"]).
xc_mapping_rows(a65b125e1afe1e,[]).
'x_<=='(x_improvisedPlan(V1,V2,V3,V4),x_groundExpression(V2),x_numAnswers(1,x_liftedGoalRep(V1,V2,V5)),x_uninferredSentence(x_contextEnvAllowed(x_allFactsAllowed('x_ist-Information'(V1,x_complexTaskAchieves(V6,V5,V7))))),x_lookupOnly(x_localOnly(x_allFactsAllowed('x_ist-Information'(V1,x_holdsIn(V4,x_reasonForTask(V3,V2))))))) :- x_cid(a65b125e1afe1f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e1afe1f,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe1f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe1f,209).
xc_kb_names(a65b125e1afe1f,["?mt","?goal-name","?task","?when","?goal","?actor","?action"]).
xc_mapping_rows(a65b125e1afe1f,[]).
x_isa(x_liftedGoalRep,x_TernaryPredicate) :- x_cid(a65b125e1afe20).
xc_microtheory(a65b125e1afe20,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe20,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe20,225).
xc_kb_names(a65b125e1afe20,[]).
xc_mapping_rows(a65b125e1afe20,[]).
'x_<=='(x_liftedGoalRep(V1,V2,V3),x_numAnswers(1,x_lookupOnly(x_localOnly(x_kbOnly('x_ist-Information'(V1,x_goalName(V2,V4)))))),x_localTermBindingList(V1,V4,V5),x_evaluate(V3,x_SublisFn(V5,V4))) :- x_cid(a65b125e1afe21,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e1afe21,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe21,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe21,228).
xc_kb_names(a65b125e1afe21,["?mt","?goal-name","?lifted-goal-rep","?goal-rep","?blist"]).
xc_mapping_rows(a65b125e1afe21,[]).
x_isa(x_localTermBindingList,x_TernaryPredicate) :- x_cid(a65b125e1afe22).
xc_microtheory(a65b125e1afe22,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe22,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe22,241).
xc_kb_names(a65b125e1afe22,[]).
xc_mapping_rows(a65b125e1afe22,[]).
'x_<=='(x_localTermBindingList(V1,V2,V3),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_localTermBinding(V1,V2,V4)))) :- x_cid(a65b125e1afe23,V1,V2,V3,V4).
xc_microtheory(a65b125e1afe23,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe23,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe23,243).
xc_kb_names(a65b125e1afe23,["?mt","?goal-rep","?blist","?binding"]).
xc_mapping_rows(a65b125e1afe23,[]).
x_isa(x_localTermBinding,x_TernaryPredicate) :- x_cid(a65b125e1afe24).
xc_microtheory(a65b125e1afe24,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe24,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe24,248).
xc_kb_names(a65b125e1afe24,[]).
xc_mapping_rows(a65b125e1afe24,[]).
'x_<=='(x_localTermBinding(V1,V2,V3),x_not(x_variableExpression(V2)),x_not(x_atomicTerm(V2)),x_formulaArgument(V2,V4,V5),x_localTermBinding(V1,V5,V3)) :- x_cid(a65b125e1afe25,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e1afe25,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe25,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe25,252).
xc_kb_names(a65b125e1afe25,["?mt","?goal-rep","?binding","?n","?term"]).
xc_mapping_rows(a65b125e1afe25,[]).
'x_<=='(x_localTermBinding(V1,V2,V3),x_not(x_variableExpression(V2)),x_atomicTerm(V2),x_numAnswers(1,x_variablizeIfLocal(V1,V2,V3))) :- x_cid(a65b125e1afe26,V1,V2,V3).
xc_microtheory(a65b125e1afe26,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe26,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe26,258).
xc_kb_names(a65b125e1afe26,["?mt","?goal-rep","?binding"]).
xc_mapping_rows(a65b125e1afe26,[]).
x_isa(x_variablizeIfLocal,x_TernaryPredicate) :- x_cid(a65b125e1afe27).
xc_microtheory(a65b125e1afe27,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe27,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe27,264).
xc_kb_names(a65b125e1afe27,[]).
xc_mapping_rows(a65b125e1afe27,[]).
'x_<=='(x_variablizeIfLocal(V1,V2,t(V2,V3)),x_localTerm(V1,V2),x_nextCounterValue(x_var,V4),x_evaluate(V3,x_SymbolConcatenateFn(x_TheList("?var",V4)))) :- x_cid(a65b125e1afe28,V1,V2,V3,V4).
xc_microtheory(a65b125e1afe28,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe28,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe28,268).
xc_kb_names(a65b125e1afe28,["?mt","?term","?new-term","?n"]).
xc_mapping_rows(a65b125e1afe28,[]).
x_isa(x_localTerm,x_BinaryPredicate) :- x_cid(a65b125e1afe29).
xc_microtheory(a65b125e1afe29,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe29,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe29,275).
xc_kb_names(a65b125e1afe29,[]).
xc_mapping_rows(a65b125e1afe29,[]).
'x_<=='(x_localTerm(V1,V2),x_numAnswers(1,x_localOnly(x_lookupOnly('x_ist-Information'(V1,x_isa(V2,V3)))))) :- x_cid(a65b125e1afe2a,V1,V2,V3).
xc_microtheory(a65b125e1afe2a,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe2a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe2a,278).
xc_kb_names(a65b125e1afe2a,["?mt","?term","?something"]).
xc_mapping_rows(a65b125e1afe2a,[]).
x_isa(x_identifyCriticalDifferenceWRTGoal,x_ComplexActionPredicate) :- x_cid(a65b125e1afe2b).
xc_microtheory(a65b125e1afe2b,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe2b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe2b,291).
xc_kb_names(a65b125e1afe2b,[]).
xc_mapping_rows(a65b125e1afe2b,[]).
x_arity(x_identifyCriticalDifferenceWRTGoal,7) :- x_cid(a65b125e1afe2c).
xc_microtheory(a65b125e1afe2c,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe2c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe2c,292).
xc_kb_names(a65b125e1afe2c,[]).
xc_mapping_rows(a65b125e1afe2c,[]).
x_arg1Isa(x_identifyCriticalDifferenceWRTGoal,x_Microtheory) :- x_cid(a65b125e1afe2d).
xc_microtheory(a65b125e1afe2d,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe2d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe2d,293).
xc_kb_names(a65b125e1afe2d,[]).
xc_mapping_rows(a65b125e1afe2d,[]).
x_arg2Isa(x_identifyCriticalDifferenceWRTGoal,'x_Agent-Generic') :- x_cid(a65b125e1afe2e).
xc_microtheory(a65b125e1afe2e,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe2e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe2e,294).
xc_kb_names(a65b125e1afe2e,[]).
xc_mapping_rows(a65b125e1afe2e,[]).
x_arg3Isa(x_identifyCriticalDifferenceWRTGoal,x_Goal) :- x_cid(a65b125e1afe2f).
xc_microtheory(a65b125e1afe2f,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe2f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe2f,295).
xc_kb_names(a65b125e1afe2f,[]).
xc_mapping_rows(a65b125e1afe2f,[]).
x_arg4Isa(x_identifyCriticalDifferenceWRTGoal,x_Task) :- x_cid(a65b125e1afe30).
xc_microtheory(a65b125e1afe30,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe30,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe30,296).
xc_kb_names(a65b125e1afe30,[]).
xc_mapping_rows(a65b125e1afe30,[]).
x_arg5Isa(x_identifyCriticalDifferenceWRTGoal,x_PerceptualAgentCommand) :- x_cid(a65b125e1afe31).
xc_microtheory(a65b125e1afe31,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe31,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe31,297).
xc_kb_names(a65b125e1afe31,[]).
xc_mapping_rows(a65b125e1afe31,[]).
x_arg6Isa(x_identifyCriticalDifferenceWRTGoal,x_TimeInterval) :- x_cid(a65b125e1afe32).
xc_microtheory(a65b125e1afe32,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe32,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe32,298).
xc_kb_names(a65b125e1afe32,[]).
xc_mapping_rows(a65b125e1afe32,[]).
x_arg7Isa(x_identifyCriticalDifferenceWRTGoal,x_TimeInterval) :- x_cid(a65b125e1afe33).
xc_microtheory(a65b125e1afe33,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe33,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe33,299).
xc_kb_names(a65b125e1afe33,[]).
xc_mapping_rows(a65b125e1afe33,[]).
x_comment(x_identifyCriticalDifferenceWRTGoal,"(identifyCriticalDifferenceWRTGoal ?mt ?actor ?goal ?task ?source ?start ?end) ") :- x_cid(a65b125e1afe34).
xc_microtheory(a65b125e1afe34,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe34,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe34,300).
xc_kb_names(a65b125e1afe34,[]).
xc_mapping_rows(a65b125e1afe34,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_identifyCriticalDifferenceWRTGoal(V1,V2,V3,V4,V5,V6,V7),x_actionSequence(x_TheList))) :- x_cid(a65b125e1afe35,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e1afe35,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe35,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe35,304).
xc_kb_names(a65b125e1afe35,["?mt","?actor","?goal","?task","?source","?start","?end"]).
xc_mapping_rows(a65b125e1afe35,[]).
'x_<=='(x_preferInContext(x_identifyCriticalDifferenceWRTGoal(V1,V2,V3,V4,V5,V6,V7),V8,V9),x_different(V8,x_actionSequence(x_TheList))) :- x_cid(a65b125e1afe36,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e1afe36,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe36,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe36,311).
xc_kb_names(a65b125e1afe36,["?mt","?actor","?goal","?task","?source","?start","?end","?seq1","?seq2"]).
xc_mapping_rows(a65b125e1afe36,[]).
x_preconditionForMethod(x_and(x_unifies(x_CommandFn(V1,V2),V3),x_lookupOnly(x_localOnly(x_allFactsAllowed('x_ist-Information'(V1,x_infoTransferred(V3,V4)))))),x_methodForAction(x_identifyCriticalDifferenceWRTGoal(V5,V6,V7,V8,V3,V9,V10),x_actionSequence(x_TheList(x_doAnnounce("~%identifyCriticalDifferenceWRTGoal ~s ~s ~s from ~s to ~s",[V7,V8,V3,V9,V10]),x_proposeStructuralRepairExperiments(V5,V6,V7,V8,V3,V9,V10))))) :- x_cid(a65b125e1afe37,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125e1afe37,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe37,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe37,314).
xc_kb_names(a65b125e1afe37,["?scenario","?source-cmd-num","?source-cmd","?successful-action","?mt","?actor","?goal","?task","?start","?end"]).
xc_mapping_rows(a65b125e1afe37,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 326, column 21), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e1afe37,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 326, column 21), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_sameInitialScenario,x_BinaryPredicate) :- x_cid(a65b125e1afe38).
xc_microtheory(a65b125e1afe38,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe38,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe38,351).
xc_kb_names(a65b125e1afe38,[]).
xc_mapping_rows(a65b125e1afe38,[]).
'x_<=='(x_sameInitialScenario(V1,V2),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_objectOfStateChange(x_GameStartedEvent1,V3))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V2,x_objectOfStateChange(x_GameStartedEvent1,V3)))))) :- x_cid(a65b125e1afe39,V1,V2,V3).
xc_microtheory(a65b125e1afe39,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe39,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe39,353).
xc_kb_names(a65b125e1afe39,["?mt","?scenario","?saved-game"]).
xc_mapping_rows(a65b125e1afe39,[]).
x_isa(x_sameInitialState,x_BinaryPredicate) :- x_cid(a65b125e1afe3a).
xc_microtheory(a65b125e1afe3a,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe3a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe3a,365).
xc_kb_names(a65b125e1afe3a,[]).
xc_mapping_rows(a65b125e1afe3a,[]).
'x_<=='(x_sameInitialState(V1,V2),x_sameInitialScenario(V1,V2),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(x_GameStartedEvent1,V3))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V2,x_dateOfEvent(x_GameStartedEvent1,V3)))))) :- x_cid(a65b125e1afe3b,V1,V2,V3).
xc_microtheory(a65b125e1afe3b,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe3b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe3b,367).
xc_kb_names(a65b125e1afe3b,["?mt","?scenario","?start-date"]).
xc_mapping_rows(a65b125e1afe3b,[]).
x_isa(x_sameAssignments,x_QuaternaryPredicate) :- x_cid(a65b125e1afe3c).
xc_microtheory(a65b125e1afe3c,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe3c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe3c,380).
xc_kb_names(a65b125e1afe3c,[]).
xc_mapping_rows(a65b125e1afe3c,[]).
x_arity(x_sameAssignments,4) :- x_cid(a65b125e1afe3d).
xc_microtheory(a65b125e1afe3d,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe3d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe3d,381).
xc_kb_names(a65b125e1afe3d,[]).
xc_mapping_rows(a65b125e1afe3d,[]).
'x_<=='(x_sameAssignments(V1,V2,V3,V4),x_sameInitialState(V1,V2),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V2,x_infoTransferred(V4,V5))))),x_formulaArgument(V5,1,V3)) :- x_cid(a65b125e1afe3e,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e1afe3e,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe3e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe3e,383).
xc_kb_names(a65b125e1afe3e,["?mt","?scenario","?actor","?scenario-cmd","?action"]).
xc_mapping_rows(a65b125e1afe3e,[]).
x_isa(x_sameActorType,x_QuaternaryPredicate) :- x_cid(a65b125e1afe3f).
xc_microtheory(a65b125e1afe3f,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe3f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe3f,392).
xc_kb_names(a65b125e1afe3f,[]).
xc_mapping_rows(a65b125e1afe3f,[]).
x_arity(x_sameActorType,4) :- x_cid(a65b125e1afe40).
xc_microtheory(a65b125e1afe40,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe40,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe40,393).
xc_kb_names(a65b125e1afe40,[]).
xc_mapping_rows(a65b125e1afe40,[]).
'x_<=='(x_sameActorType(V1,V2,V3,V4),x_sameAssignments(V1,V2,V3,V4)) :- x_cid(a65b125e1afe41,V1,V2,V3,V4).
xc_microtheory(a65b125e1afe41,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe41,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe41,395).
xc_kb_names(a65b125e1afe41,["?mt","?scenario","?actor","?scenario-cmd"]).
xc_mapping_rows(a65b125e1afe41,[]).
'x_<=='(x_sameActorType(V1,V2,V3,V4),x_uninferredSentence(x_sameAssignments(V1,V2,V3,V4)),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V2,x_infoTransferred(V4,V5))))),x_formulaArgument(V5,1,V6),x_numAnswers(1,x_lookupOnly(x_localOnly(x_nonTransitiveInference('x_ist-Information'(V2,x_isa(V6,V7)))))),x_numAnswers(1,x_lookupOnly(x_localOnly(x_nonTransitiveInference('x_ist-Information'(V1,x_isa(V3,V7))))))) :- x_cid(a65b125e1afe42,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e1afe42,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe42,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe42,398).
xc_kb_names(a65b125e1afe42,["?mt","?scenario","?actor","?scenario-cmd","?action","?scenario-actor","?type"]).
xc_mapping_rows(a65b125e1afe42,[]).
x_isa(x_summarizedActionDifferences,x_Predicate) :- x_cid(a65b125e1afe43).
xc_microtheory(a65b125e1afe43,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe43,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe43,436).
xc_kb_names(a65b125e1afe43,[]).
xc_mapping_rows(a65b125e1afe43,[]).
x_arity(x_summarizedActionDifferences,6) :- x_cid(a65b125e1afe44).
xc_microtheory(a65b125e1afe44,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe44,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe44,437).
xc_kb_names(a65b125e1afe44,[]).
xc_mapping_rows(a65b125e1afe44,[]).
'x_<=='(x_summarizedActionDifferences(V1,V2,V3,V4,V5,V6),x_scenarioSequence(V5,V7),x_executionSequence(V1,V2,V3,V4,V8)) :- x_cid(a65b125e1afe45,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e1afe45,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe45,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe45,441).
xc_kb_names(a65b125e1afe45,["?mt","?start","?end","?task","?scenario-cmd","?diffs","?referemce-sequence","?executed-sequence"]).
xc_mapping_rows(a65b125e1afe45,[]).
x_isa(x_scenarioSequence,x_BinaryPredicate) :- x_cid(a65b125e1afe46).
xc_microtheory(a65b125e1afe46,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe46,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe46,450).
xc_kb_names(a65b125e1afe46,[]).
xc_mapping_rows(a65b125e1afe46,[]).
x_arity(x_scenarioSequence,2) :- x_cid(a65b125e1afe47).
xc_microtheory(a65b125e1afe47,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe47,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe47,451).
xc_kb_names(a65b125e1afe47,[]).
xc_mapping_rows(a65b125e1afe47,[]).
x_arg1Isa(x_scenarioSequence,x_PerceptualAgentCommand) :- x_cid(a65b125e1afe48).
xc_microtheory(a65b125e1afe48,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe48,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe48,452).
xc_kb_names(a65b125e1afe48,[]).
xc_mapping_rows(a65b125e1afe48,[]).
x_arg2Isa(x_scenarioSequence,x_List) :- x_cid(a65b125e1afe49).
xc_microtheory(a65b125e1afe49,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe49,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe49,453).
xc_kb_names(a65b125e1afe49,[]).
xc_mapping_rows(a65b125e1afe49,[]).
x_comment(x_scenarioSequence,"(scenarioSequence ?cmd ?sequence) binds ?sequence to a list of primitive actions that led to achieving ?cmd.") :- x_cid(a65b125e1afe4a).
xc_microtheory(a65b125e1afe4a,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe4a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe4a,454).
xc_kb_names(a65b125e1afe4a,[]).
xc_mapping_rows(a65b125e1afe4a,[]).
'x_<=='(x_scenarioSequence(V1,V2),x_unifies(x_CommandFn(V3,V4),V1),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V3,x_infoTransferred(V1,V5))))),x_formulaArgument(V5,1,V6),x_withBackchainingDepth(100,x_numAnswers(1,x_filteredActionSequence(V3,V6,V1,V7))),x_evaluate(V2,x_JoinListsFn(V7,x_TheList(V5)))) :- x_cid(a65b125e1afe4b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e1afe4b,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe4b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe4b,457).
xc_kb_names(a65b125e1afe4b,["?scenario-cmd","?sequence","?scenario","?num","?action","?actor","?partial-sequence"]).
xc_mapping_rows(a65b125e1afe4b,[]).
x_isa(x_filteredActionSequence,x_QuaternaryPredicate) :- x_cid(a65b125e1afe4c).
xc_microtheory(a65b125e1afe4c,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe4c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe4c,470).
xc_kb_names(a65b125e1afe4c,[]).
xc_mapping_rows(a65b125e1afe4c,[]).
'x_<=='(x_filteredActionSequence(V1,V2,V3,V4),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_followsInProgression(V3,V5,V1))))),x_unifies(x_CommandFn(V1,V6),V5),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_infoTransferred(V5,V7))))),x_formulaArgument(V7,1,V2),x_numAnswers(1,x_filteredActionSequence(V1,V2,V5,V8)),x_evaluate(V4,x_JoinListsFn(V8,x_TheList(V7)))) :- x_cid(a65b125e1afe4d,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e1afe4d,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe4d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe4d,472).
xc_kb_names(a65b125e1afe4d,["?mt","?actor","?cmd","?sequence","?earlier-evt","?num","?action","?partial-sequence"]).
xc_mapping_rows(a65b125e1afe4d,[]).
'x_<=='(x_filteredActionSequence(V1,V2,V3,x_TheList),x_uninferredSentence(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_followsInProgression(V3,V4,V1)))))) :- x_cid(a65b125e1afe4e,V1,V2,V3,V4).
xc_microtheory(a65b125e1afe4e,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe4e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe4e,489).
xc_kb_names(a65b125e1afe4e,["?mt","?actor","?cmd","?earlier-evt"]).
xc_mapping_rows(a65b125e1afe4e,[]).
'x_<=='(x_filteredActionSequence(V1,V2,V3,V4),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_followsInProgression(V3,V5,V1))))),x_uninferredSentence(x_commandByActor(V1,V5,V2)),x_numAnswers(1,x_filteredActionSequence(V1,V2,V5,V4))) :- x_cid(a65b125e1afe4f,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e1afe4f,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe4f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe4f,497).
xc_kb_names(a65b125e1afe4f,["?mt","?actor","?cmd","?sequence","?earlier-evt"]).
xc_mapping_rows(a65b125e1afe4f,[]).
x_isa(x_commandByActor,x_TernaryPredicate) :- x_cid(a65b125e1afe50).
xc_microtheory(a65b125e1afe50,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe50,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe50,508).
xc_kb_names(a65b125e1afe50,[]).
xc_mapping_rows(a65b125e1afe50,[]).
x_arity(x_commandByActor,3) :- x_cid(a65b125e1afe51).
xc_microtheory(a65b125e1afe51,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe51,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe51,509).
xc_kb_names(a65b125e1afe51,[]).
xc_mapping_rows(a65b125e1afe51,[]).
x_arg1Isa(x_commandByActor,x_Microtheory) :- x_cid(a65b125e1afe52).
xc_microtheory(a65b125e1afe52,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe52,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe52,510).
xc_kb_names(a65b125e1afe52,[]).
xc_mapping_rows(a65b125e1afe52,[]).
x_arg2Isa(x_commandByActor,x_PerceptualAgentCommand) :- x_cid(a65b125e1afe53).
xc_microtheory(a65b125e1afe53,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe53,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe53,511).
xc_kb_names(a65b125e1afe53,[]).
xc_mapping_rows(a65b125e1afe53,[]).
x_arg3Isa(x_commandByActor,'x_Agent-Generic') :- x_cid(a65b125e1afe54).
xc_microtheory(a65b125e1afe54,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe54,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe54,512).
xc_kb_names(a65b125e1afe54,[]).
xc_mapping_rows(a65b125e1afe54,[]).
'x_<=='(x_commandByActor(V1,V2,V3),x_unifies(x_CommandFn(V1,V4),V2),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_infoTransferred(V2,V5))))),x_formulaArgument(V5,1,V3)) :- x_cid(a65b125e1afe55,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e1afe55,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe55,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe55,515).
xc_kb_names(a65b125e1afe55,["?mt","?cmd","?actor","?num","?action"]).
xc_mapping_rows(a65b125e1afe55,[]).
x_isa(x_executionSequence,x_Predicate) :- x_cid(a65b125e1afe56).
xc_microtheory(a65b125e1afe56,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe56,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe56,535).
xc_kb_names(a65b125e1afe56,[]).
xc_mapping_rows(a65b125e1afe56,[]).
x_arity(x_executionSequence,5) :- x_cid(a65b125e1afe57).
xc_microtheory(a65b125e1afe57,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe57,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe57,536).
xc_kb_names(a65b125e1afe57,[]).
xc_mapping_rows(a65b125e1afe57,[]).
x_arg1Isa(x_executionSequence,x_Microtheory) :- x_cid(a65b125e1afe58).
xc_microtheory(a65b125e1afe58,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe58,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe58,537).
xc_kb_names(a65b125e1afe58,[]).
xc_mapping_rows(a65b125e1afe58,[]).
x_arg2Isa(x_executionSequence,x_PerceptualAgentCommand) :- x_cid(a65b125e1afe59).
xc_microtheory(a65b125e1afe59,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe59,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe59,538).
xc_kb_names(a65b125e1afe59,[]).
xc_mapping_rows(a65b125e1afe59,[]).
x_arg3Isa(x_executionSequence,x_PerceptualAgentCommand) :- x_cid(a65b125e1afe5a).
xc_microtheory(a65b125e1afe5a,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe5a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe5a,539).
xc_kb_names(a65b125e1afe5a,[]).
xc_mapping_rows(a65b125e1afe5a,[]).
x_arg4Isa(x_executionSequence,x_CycLFormula) :- x_cid(a65b125e1afe5b).
xc_microtheory(a65b125e1afe5b,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe5b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe5b,540).
xc_kb_names(a65b125e1afe5b,[]).
xc_mapping_rows(a65b125e1afe5b,[]).
x_arg5Isa(x_executionSequence,x_List) :- x_cid(a65b125e1afe5c).
xc_microtheory(a65b125e1afe5c,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe5c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe5c,541).
xc_kb_names(a65b125e1afe5c,[]).
xc_mapping_rows(a65b125e1afe5c,[]).
'x_<=='(x_executionSequence(V1,V2,V3,V4,V5),x_firstCommandBetween(V1,V2,V3,V6),x_lastCommandBetween(V1,V2,V3,V7),x_formulaArgument(V4,1,V8),x_numAnswers(1,x_commandSequenceByFromTo(V1,V8,V6,V7,V9)),x_evaluate(V5,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V10,V11),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_infoTransferred(V10,V11))))))),V9))) :- x_cid(a65b125e1afe5d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125e1afe5d,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe5d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe5d,543).
xc_kb_names(a65b125e1afe5d,["?mt","?start","?end","?task","?sequence","?start-cmd","?end-cmd","?actor","?cmd-sequence","?in","?out"]).
xc_mapping_rows(a65b125e1afe5d,[]).
x_isa(x_commandSequenceByFromTo,x_Predicate) :- x_cid(a65b125e1afe5e).
xc_microtheory(a65b125e1afe5e,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe5e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe5e,560).
xc_kb_names(a65b125e1afe5e,[]).
xc_mapping_rows(a65b125e1afe5e,[]).
x_arity(x_commandSequenceByFromTo,5) :- x_cid(a65b125e1afe5f).
xc_microtheory(a65b125e1afe5f,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe5f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe5f,561).
xc_kb_names(a65b125e1afe5f,[]).
xc_mapping_rows(a65b125e1afe5f,[]).
'x_<=='(x_commandSequenceByFromTo(V1,V2,V3,V4,V5),x_unifies(x_CommandFn(V1,V6),V3),x_unifies(x_CommandFn(V1,V7),V4),x_evaluate(V5,x_SortFn(x_TheClosedRetrievalSetOf(V8,x_and(x_integerBetween(V6,V9,V7),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_infoTransferred(x_CommandFn(V1,V9),V10))))),x_formulaArgument(V10,1,V2),x_unifies(V8,x_CommandFn(V1,V9)))),x_lessThan,x_FunctionToArg(2,x_Kappa(t(V11,V12),x_formulaArgument(V11,2,V12)))))) :- x_cid(a65b125e1afe60,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125e1afe60,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe60,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe60,563).
xc_kb_names(a65b125e1afe60,["?mt","?actor","?start-cmd","?end-cmd","?sequence","?startnum","?endnum","?cmd","?i","?action","?in","?out"]).
xc_mapping_rows(a65b125e1afe60,[]).
x_isa(x_firstCommandBetween,x_QuaternaryPredicate) :- x_cid(a65b125e1afe61).
xc_microtheory(a65b125e1afe61,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe61,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe61,626).
xc_kb_names(a65b125e1afe61,[]).
xc_mapping_rows(a65b125e1afe61,[]).
'x_<=='(x_firstCommandBetween(V1,V2,V3,V4),x_evaluate(V4,x_FirstInListFn(x_SortFn(x_TheClosedRetrievalSetOf(V5,x_and(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(x_CommandFn(V1,V6),V2)))),x_unifies(V5,x_CommandFn(V1,V6)))),x_lessThan,x_FunctionToArg(2,x_Kappa(t(V7,V8),x_formulaArgument(V7,2,V8))))))) :- x_cid(a65b125e1afe62,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e1afe62,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe62,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe62,629).
xc_kb_names(a65b125e1afe62,["?mt","?start","?end","?cmd","?cmd-at-time","?num","?in","?out"]).
xc_mapping_rows(a65b125e1afe62,[]).
'x_<=='(x_firstCommandBetween(V1,V2,V3,V4),x_uninferredSentence(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(x_CommandFn(V1,V5),V2))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_followingTurn(V2,V6))))),x_unifies(t(V7,V8),V6),x_unifies(t(V7,V9),V3),x_lessThanOrEqualTo(V8,V9),x_numAnswers(1,x_firstCommandBetween(V1,V6,V3,V4))) :- x_cid(a65b125e1afe63,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e1afe63,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe63,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe63,645).
xc_kb_names(a65b125e1afe63,["?mt","?start","?end","?cmd","?num","?next","?unit","?next-num","?end-num"]).
xc_mapping_rows(a65b125e1afe63,[]).
x_isa(x_lastCommandBetween,x_QuaternaryPredicate) :- x_cid(a65b125e1afe64).
xc_microtheory(a65b125e1afe64,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe64,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe64,663).
xc_kb_names(a65b125e1afe64,[]).
xc_mapping_rows(a65b125e1afe64,[]).
'x_<=='(x_lastCommandBetween(V1,V2,V3,V4),x_evaluate(V4,x_FirstInListFn(x_SortFn(x_TheClosedRetrievalSetOf(V5,x_and(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(x_CommandFn(V1,V6),V3)))),x_unifies(V5,x_CommandFn(V1,V6)))),x_greaterThan,x_FunctionToArg(2,x_Kappa(t(V7,V8),x_formulaArgument(V7,2,V8))))))) :- x_cid(a65b125e1afe65,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e1afe65,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe65,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe65,665).
xc_kb_names(a65b125e1afe65,["?mt","?start","?end","?cmd","?cmd-at-time","?num","?in","?out"]).
xc_mapping_rows(a65b125e1afe65,[]).
'x_<=='(x_lastCommandBetween(V1,V2,V3,V4),x_uninferredSentence(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(x_CommandFn(V1,V5),V3))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_followingTurn(V6,V3))))),x_unifies(t(V7,V8),V2),x_unifies(t(V7,V9),V6),x_lessThanOrEqualTo(V8,V9),x_numAnswers(1,x_lastCommandBetween(V1,V2,V6,V4))) :- x_cid(a65b125e1afe66,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e1afe66,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe66,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe66,681).
xc_kb_names(a65b125e1afe66,["?mt","?start","?end","?cmd","?num","?prior","?unit","?start-num","?end-num"]).
xc_mapping_rows(a65b125e1afe66,[]).
x_isa(x_proposeStructuralRepairExperiments,x_ComplexActionPredicate) :- x_cid(a65b125e1afe67).
xc_microtheory(a65b125e1afe67,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe67,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe67,701).
xc_kb_names(a65b125e1afe67,[]).
xc_mapping_rows(a65b125e1afe67,[]).
x_arity(x_proposeStructuralRepairExperiments,7) :- x_cid(a65b125e1afe68).
xc_microtheory(a65b125e1afe68,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe68,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe68,702).
xc_kb_names(a65b125e1afe68,[]).
xc_mapping_rows(a65b125e1afe68,[]).
x_preconditionForMethod(x_and(x_unifies(x_CommandFn(V1,V2),V3),x_numAnswers(1,x_executionSequence(V4,V5,V6,V7,V8)),x_numAnswers(1,x_scenarioSequence(V9,V8)),x_numAnswers(1,x_enumerateStructuralTaskDifferences(V4,V10,V1,V11,V12)),x_outsourcedOnly(x_currentDomain(V13)),x_unifies(V14,x_LearnedKnowledgeMtFn(V13))),x_methodForAction(x_proposeStructuralRepairExperiments(V4,V15,V16,V7,V3,V5,V6),x_actionSequence(x_TheList(x_doForEach(V17,V12,x_postOperatorEffectLearningGoal(V14,V17)),x_designStructuralExperiments(V4,V14,V16,V7,V12))))) :- x_cid(a65b125e1afe69,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17).
xc_microtheory(a65b125e1afe69,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe69,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe69,709).
xc_kb_names(a65b125e1afe69,["?scen-mt","?source-cmd-num","?source-cmd","?mt","?start","?end","?task","?sequence","?scenario-cmd","?ex-seq","?scen-seq","?prefix-addition","?domain","?lkmt","?actor","?goal","?operator"]).
xc_mapping_rows(a65b125e1afe69,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_proposeStructuralRepairExperiments(V1,V2,V3,V4,V5,V6,V7),x_actionSequence(x_TheList))) :- x_cid(a65b125e1afe6a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e1afe6a,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe6a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe6a,726).
xc_kb_names(a65b125e1afe6a,["?mt","?actor","?goal","?task","?source-cmd","?start","?end"]).
xc_mapping_rows(a65b125e1afe6a,[]).
'x_<=='(x_preferInContext(x_proposeStructuralRepairExperiments(V1,V2,V3,V4,V5,V6,V7),V8,V9),x_different(V8,x_actionSequence(x_TheList))) :- x_cid(a65b125e1afe6b,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e1afe6b,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe6b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe6b,733).
xc_kb_names(a65b125e1afe6b,["?mt","?actor","?goal","?task","?source-cmd","?start","?end","?seq1","?seq2"]).
xc_mapping_rows(a65b125e1afe6b,[]).
x_isa(x_enumerateStructuralTaskDifferences,x_Predicate) :- x_cid(a65b125e1afe6c).
xc_microtheory(a65b125e1afe6c,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe6c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe6c,736).
xc_kb_names(a65b125e1afe6c,[]).
xc_mapping_rows(a65b125e1afe6c,[]).
x_arity(x_enumerateStructuralTaskDifferences,5) :- x_cid(a65b125e1afe6d).
xc_microtheory(a65b125e1afe6d,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe6d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe6d,737).
xc_kb_names(a65b125e1afe6d,[]).
xc_mapping_rows(a65b125e1afe6d,[]).
'x_<=='(x_enumerateStructuralTaskDifferences(V1,V2,V3,V4,V5),x_evaluate(V6,x_ReverseListFn(V4)),x_evaluate(V7,x_ReverseListFn(V2)),x_evaluate(V8,x_FirstInListFn(V7)),x_operatorFormulas(V9,V8),x_commonListTailByPred(V9,V6,V10),x_mismatchTail(V7,V10,V11,V12),x_different(V12,x_TheList),x_equals(V11,x_TheList),x_evaluate(V5,x_ReverseListFn(V12))) :- x_cid(a65b125e1afe6e,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125e1afe6e,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe6e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe6e,739).
xc_kb_names(a65b125e1afe6e,["?mt","?executed-sequence","?scenario-mt","?scenario-sequence","?prefix-difference","?full-rev-scen","?rev-seq","?task","?pred","?rev-scen","?ex-tail","?scen-tail"]).
xc_mapping_rows(a65b125e1afe6e,[]).
x_isa(x_commonListTailByPred,x_TernaryPredicate) :- x_cid(a65b125e1afe6f).
xc_microtheory(a65b125e1afe6f,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe6f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe6f,751).
xc_kb_names(a65b125e1afe6f,[]).
xc_mapping_rows(a65b125e1afe6f,[]).
'x_<=='(x_commonListTailByPred(V1,V2,V2),x_evaluate(V3,x_FirstInListFn(V2)),x_operatorFormulas(V1,V3)) :- x_cid(a65b125e1afe70,V1,V2,V3).
xc_microtheory(a65b125e1afe70,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe70,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe70,753).
xc_kb_names(a65b125e1afe70,["?pred","?list","?task"]).
xc_mapping_rows(a65b125e1afe70,[]).
'x_<=='(x_commonListTailByPred(V1,V2,V3),x_evaluate(V4,x_FirstInListFn(V2)),x_operatorFormulas(V5,V4),x_different(V1,V5),x_evaluate(V6,x_RestOfListFn(V2)),x_numAnswers(1,x_commonListTailByPred(V1,V6,V3))) :- x_cid(a65b125e1afe71,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e1afe71,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe71,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe71,757).
xc_kb_names(a65b125e1afe71,["?pred","?list","?tail","?task","?other-pred","?rest"]).
xc_mapping_rows(a65b125e1afe71,[]).
x_isa(x_mismatchTail,x_QuaternaryPredicate) :- x_cid(a65b125e1afe72).
xc_microtheory(a65b125e1afe72,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe72,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe72,764).
xc_kb_names(a65b125e1afe72,[]).
xc_mapping_rows(a65b125e1afe72,[]).
'x_<=='(x_mismatchTail(V1,V2,V3,V4),x_evaluate(V5,x_FirstInListFn(V1)),x_evaluate(V6,x_FirstInListFn(V2)),x_operatorFormulas(V7,V5),x_operatorFormulas(V7,V6),x_numAnswers(1,x_nextDistinctTask(V7,V1,V8)),x_numAnswers(1,x_nextDistinctTask(V7,V2,V9)),x_numAnswers(1,x_mismatchTail(V8,V9,V3,V4))) :- x_cid(a65b125e1afe73,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e1afe73,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe73,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe73,766).
xc_kb_names(a65b125e1afe73,["?l1","?l2","?tail1","?tail2","?task1","?task2","?pred","?rest1","?rest2"]).
xc_mapping_rows(a65b125e1afe73,[]).
'x_<=='(x_mismatchTail(V1,V2,V1,V2),x_evaluate(V3,x_FirstInListFn(V1)),x_evaluate(V4,x_FirstInListFn(V2)),x_operatorFormulas(V5,V3),x_operatorFormulas(V6,V4),x_different(V5,V6)) :- x_cid(a65b125e1afe74,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e1afe74,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe74,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe74,775).
xc_kb_names(a65b125e1afe74,["?l1","?l2","?task1","?task2","?p1","?p2"]).
xc_mapping_rows(a65b125e1afe74,[]).
'x_<=='(x_mismatchTail(x_TheList,V1,x_TheList,V1)) :- x_cid(a65b125e1afe75,V1).
xc_microtheory(a65b125e1afe75,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe75,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe75,782).
xc_kb_names(a65b125e1afe75,["?l2"]).
xc_mapping_rows(a65b125e1afe75,[]).
'x_<=='(x_mismatchTail(V1,x_TheList,V1,x_TheList)) :- x_cid(a65b125e1afe76,V1).
xc_microtheory(a65b125e1afe76,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe76,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe76,783).
xc_kb_names(a65b125e1afe76,["?l1"]).
xc_mapping_rows(a65b125e1afe76,[]).
x_isa(x_nextDistinctTask,x_TernaryPredicate) :- x_cid(a65b125e1afe77).
xc_microtheory(a65b125e1afe77,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe77,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe77,785).
xc_kb_names(a65b125e1afe77,[]).
xc_mapping_rows(a65b125e1afe77,[]).
'x_<=='(x_nextDistinctTask(V1,x_TheList,x_TheList)) :- x_cid(a65b125e1afe78,V1).
xc_microtheory(a65b125e1afe78,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe78,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe78,787).
xc_kb_names(a65b125e1afe78,["?pred"]).
xc_mapping_rows(a65b125e1afe78,[]).
'x_<=='(x_nextDistinctTask(V1,V2,x_TheList),x_evaluate(V3,x_RestOfListFn(V2)),x_equals(V3,x_TheList)) :- x_cid(a65b125e1afe79,V1,V2,V3).
xc_microtheory(a65b125e1afe79,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe79,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe79,789).
xc_kb_names(a65b125e1afe79,["?pred","?lst","?rest"]).
xc_mapping_rows(a65b125e1afe79,[]).
'x_<=='(x_nextDistinctTask(V1,V2,V3),x_evaluate(V4,x_RestOfListFn(V2)),x_evaluate(V5,x_FirstInListFn(V4)),x_operatorFormulas(V1,V5),x_numAnswers(1,x_nextDistinctTask(V1,V4,V3))) :- x_cid(a65b125e1afe7a,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e1afe7a,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe7a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe7a,793).
xc_kb_names(a65b125e1afe7a,["?pred","?lst","?remainder","?rest","?task"]).
xc_mapping_rows(a65b125e1afe7a,[]).
'x_<=='(x_nextDistinctTask(V1,V2,V3),x_evaluate(V3,x_RestOfListFn(V2)),x_evaluate(V4,x_FirstInListFn(V3)),x_operatorFormulas(V5,V4),x_different(V5,V1)) :- x_cid(a65b125e1afe7b,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e1afe7b,x_PerceptualAgentMt).
xc_source_file(a65b125e1afe7b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/repair.krf').
xc_source_line(a65b125e1afe7b,799).
xc_kb_names(a65b125e1afe7b,["?pred","?lst","?rest","?task","?next-pred"]).
xc_mapping_rows(a65b125e1afe7b,[]).
kb_cache_footer(footer{count:144,digest:'6005af2654a57f7450324d71ef876ad71ccef4ae658fdf8f6118492503664f45',headerDigest:'1a651994ab866e1f7a56213112553d7d7a0bfe1ed70b4e38278f7bca1c242106'}).
