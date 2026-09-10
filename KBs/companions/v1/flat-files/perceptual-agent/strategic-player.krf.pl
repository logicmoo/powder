:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:126,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:530,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'96c57666661ad0819477e6cd9822d31f243f390dd518eb0e298f416ea60ae200',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:22526,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf',sourceHash:'6c79c69ae5939278fec2df42494342a76c791350e1e98f5406ddeb3a529908b5',warnings:[]}).
x_preconditionForMethod(x_and(x_decideSlot(V1,V2,V3,V4,V5),x_numAnswers(1,x_lookupOnly('x_ist-Information'(V1,x_goalName(V5,V6))))),x_methodForAction(x_decide(V1,V2,V3),x_actionSequence(x_TheList(V4,x_doAgentPlan(x_recordRationale(V1,V4,V6)))))) :- x_cid(a65b125e2308f5,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e2308f5,x_PerceptualAgentMt).
xc_source_file(a65b125e2308f5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308f5,52).
xc_kb_names(a65b125e2308f5,["?mt","?actor","?slot","?action","?goal","?goal-rep"]).
xc_mapping_rows(a65b125e2308f5,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_decide(V1,V2,V3),x_actionSequence(x_TheList(x_resolveFailureToDecide(V1,V2,V3))))) :- x_cid(a65b125e2308f6,V1,V2,V3).
xc_microtheory(a65b125e2308f6,x_PerceptualAgentMt).
xc_source_file(a65b125e2308f6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308f6,70).
xc_kb_names(a65b125e2308f6,["?mt","?actor","?slot"]).
xc_mapping_rows(a65b125e2308f6,[]).
'x_<=='(x_preferInContext(x_decide(V1,V2,V3),V4,V5),x_noArgumentHasPredicate(V4,x_resolveFailureToDecide)) :- x_cid(a65b125e2308f7,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e2308f7,x_PerceptualAgentMt).
xc_source_file(a65b125e2308f7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308f7,78).
xc_kb_names(a65b125e2308f7,["?mt","?actor","?slot","?seq1","?seq2"]).
xc_mapping_rows(a65b125e2308f7,[]).
x_isa(x_planStrategicGoalActions,x_ComplexActionPredicate) :- x_cid(a65b125e2308f8).
xc_microtheory(a65b125e2308f8,x_PerceptualAgentMt).
xc_source_file(a65b125e2308f8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308f8,85).
xc_kb_names(a65b125e2308f8,[]).
xc_mapping_rows(a65b125e2308f8,[]).
x_arity(x_planStrategicGoalActions,2) :- x_cid(a65b125e2308f9).
xc_microtheory(a65b125e2308f9,x_PerceptualAgentMt).
xc_source_file(a65b125e2308f9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308f9,86).
xc_kb_names(a65b125e2308f9,[]).
xc_mapping_rows(a65b125e2308f9,[]).
x_arg1Isa(x_planStrategicGoalActions,x_TimeInterval) :- x_cid(a65b125e2308fa).
xc_microtheory(a65b125e2308fa,x_PerceptualAgentMt).
xc_source_file(a65b125e2308fa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308fa,87).
xc_kb_names(a65b125e2308fa,[]).
xc_mapping_rows(a65b125e2308fa,[]).
x_arg2Isa(x_planStrategicGoalActions,x_Microtheory) :- x_cid(a65b125e2308fb).
xc_microtheory(a65b125e2308fb,x_PerceptualAgentMt).
xc_source_file(a65b125e2308fb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308fb,88).
xc_kb_names(a65b125e2308fb,[]).
xc_mapping_rows(a65b125e2308fb,[]).
x_comment(x_planStrategicGoalActions,"(planStrategicGoalActions ?when ?mt) is the entry point to planning at the beginning of a turn.") :- x_cid(a65b125e2308fc).
xc_microtheory(a65b125e2308fc,x_PerceptualAgentMt).
xc_source_file(a65b125e2308fc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308fc,89).
xc_kb_names(a65b125e2308fc,[]).
xc_mapping_rows(a65b125e2308fc,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_planStrategicGoalActions(V1,V2),x_actionSequence(x_TheList(x_updateStrategyForGoalChanges(V1,V2),x_doAgentPlan(x_assignAvailableActors(V1,V2)))))) :- x_cid(a65b125e2308fd,V1,V2).
xc_microtheory(a65b125e2308fd,x_PerceptualAgentMt).
xc_source_file(a65b125e2308fd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308fd,91).
xc_kb_names(a65b125e2308fd,["?when","?mt"]).
xc_mapping_rows(a65b125e2308fd,[]).
x_isa(x_updateStrategyForGoalChanges,x_ComplexActionPredicate) :- x_cid(a65b125e2308fe).
xc_microtheory(a65b125e2308fe,x_PerceptualAgentMt).
xc_source_file(a65b125e2308fe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308fe,100).
xc_kb_names(a65b125e2308fe,[]).
xc_mapping_rows(a65b125e2308fe,[]).
x_arity(x_updateStrategyForGoalChanges,2) :- x_cid(a65b125e2308ff).
xc_microtheory(a65b125e2308ff,x_PerceptualAgentMt).
xc_source_file(a65b125e2308ff,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e2308ff,101).
xc_kb_names(a65b125e2308ff,[]).
xc_mapping_rows(a65b125e2308ff,[]).
x_arg1Isa(x_updateStrategyForGoalChanges,x_TimeInterval) :- x_cid(a65b125e230900).
xc_microtheory(a65b125e230900,x_PerceptualAgentMt).
xc_source_file(a65b125e230900,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230900,102).
xc_kb_names(a65b125e230900,[]).
xc_mapping_rows(a65b125e230900,[]).
x_arg2Isa(x_updateStrategyForGoalChanges,x_Microtheory) :- x_cid(a65b125e230901).
xc_microtheory(a65b125e230901,x_PerceptualAgentMt).
xc_source_file(a65b125e230901,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230901,103).
xc_kb_names(a65b125e230901,[]).
xc_mapping_rows(a65b125e230901,[]).
x_comment(x_updateStrategyForGoalChanges,"(updateStrategyForGoalChanges ?when ?mt) makes abstract strategy decisions based on newly activated or deactivated goals.") :- x_cid(a65b125e230902).
xc_microtheory(a65b125e230902,x_PerceptualAgentMt).
xc_source_file(a65b125e230902,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230902,104).
xc_kb_names(a65b125e230902,[]).
xc_mapping_rows(a65b125e230902,[]).
x_preconditionForMethod(x_and('x_ist-Information'(V1,x_followingTurn(V2,V3)),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_goalActivationsIn(V1,V2,V5))),x_evaluate(V6,x_TheClosedRetrievalSetOf(V5,x_goalDeactivationsIn(V1,V2,V5))),x_not(x_evaluate(x_TheSet,x_SetOrCollectionUnion(V4,V6)))),x_methodForAction(x_updateStrategyForGoalChanges(V3,V1),x_actionSequence(x_TheList(x_doAnnounce("activated goals in ~s: ~s",[V2,V4]),x_doAnnounce("deactivated goals in ~s: ~s",[V2,V6]))))) :- x_cid(a65b125e230903,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e230903,x_PerceptualAgentMt).
xc_source_file(a65b125e230903,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230903,106).
xc_kb_names(a65b125e230903,["?mt","?prior-turn","?when","?activations","?goal","?deactivations"]).
xc_mapping_rows(a65b125e230903,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 120, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 121, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e230903,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 120, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 121, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_updateStrategyForGoalChanges(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e230904,V1,V2).
xc_microtheory(a65b125e230904,x_PerceptualAgentMt).
xc_source_file(a65b125e230904,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230904,125).
xc_kb_names(a65b125e230904,["?when","?mt"]).
xc_mapping_rows(a65b125e230904,[]).
'x_<=='(x_preferInContext(x_updateStrategyForGoalChanges(V1,V2),V3,V4),x_equals(V4,x_actionSequence(x_TheList))) :- x_cid(a65b125e230905,V1,V2,V3,V4).
xc_microtheory(a65b125e230905,x_PerceptualAgentMt).
xc_source_file(a65b125e230905,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230905,133).
xc_kb_names(a65b125e230905,["?when","?mt","?seq1","?seq2"]).
xc_mapping_rows(a65b125e230905,[]).
x_isa(x_goalActivationsIn,x_TernaryPredicate) :- x_cid(a65b125e230906).
xc_microtheory(a65b125e230906,x_PerceptualAgentMt).
xc_source_file(a65b125e230906,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230906,136).
xc_kb_names(a65b125e230906,[]).
xc_mapping_rows(a65b125e230906,[]).
x_arity(x_goalActivationsIn,3) :- x_cid(a65b125e230907).
xc_microtheory(a65b125e230907,x_PerceptualAgentMt).
xc_source_file(a65b125e230907,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230907,137).
xc_kb_names(a65b125e230907,[]).
xc_mapping_rows(a65b125e230907,[]).
x_arg1Isa(x_goalActivationsIn,x_Microtheory) :- x_cid(a65b125e230908).
xc_microtheory(a65b125e230908,x_PerceptualAgentMt).
xc_source_file(a65b125e230908,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230908,138).
xc_kb_names(a65b125e230908,[]).
xc_mapping_rows(a65b125e230908,[]).
x_arg2Isa(x_goalActivationsIn,x_CycLTerm) :- x_cid(a65b125e230909).
xc_microtheory(a65b125e230909,x_PerceptualAgentMt).
xc_source_file(a65b125e230909,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230909,139).
xc_kb_names(a65b125e230909,[]).
xc_mapping_rows(a65b125e230909,[]).
x_arg3Isa(x_goalActivationsIn,x_Goal) :- x_cid(a65b125e23090a).
xc_microtheory(a65b125e23090a,x_PerceptualAgentMt).
xc_source_file(a65b125e23090a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23090a,140).
xc_kb_names(a65b125e23090a,[]).
xc_mapping_rows(a65b125e23090a,[]).
x_comment(x_goalActivationsIn,"(goalActivationsIn ?mt ?turn ?goal) binds ?goal to goals activated during ?turn.") :- x_cid(a65b125e23090b).
xc_microtheory(a65b125e23090b,x_PerceptualAgentMt).
xc_source_file(a65b125e23090b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23090b,141).
xc_kb_names(a65b125e23090b,[]).
xc_mapping_rows(a65b125e23090b,[]).
'x_<=='(x_goalActivationsIn(V1,V2,V3),'x_ist-Information'(V1,x_dateOfEvent(x_GoalActivationFn(V1,V4),V2)),'x_ist-Information'(V1,x_objectOfStateChange(x_GoalActivationFn(V1,V4),V3))) :- x_cid(a65b125e23090c,V1,V2,V3,V4).
xc_microtheory(a65b125e23090c,x_PerceptualAgentMt).
xc_source_file(a65b125e23090c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23090c,143).
xc_kb_names(a65b125e23090c,["?mt","?turn","?goal","?n"]).
xc_mapping_rows(a65b125e23090c,[]).
x_isa(x_goalDeactivationsIn,x_TernaryPredicate) :- x_cid(a65b125e23090d).
xc_microtheory(a65b125e23090d,x_PerceptualAgentMt).
xc_source_file(a65b125e23090d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23090d,149).
xc_kb_names(a65b125e23090d,[]).
xc_mapping_rows(a65b125e23090d,[]).
x_arity(x_goalDeactivationsIn,3) :- x_cid(a65b125e23090e).
xc_microtheory(a65b125e23090e,x_PerceptualAgentMt).
xc_source_file(a65b125e23090e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23090e,150).
xc_kb_names(a65b125e23090e,[]).
xc_mapping_rows(a65b125e23090e,[]).
x_arg1Isa(x_goalDeactivationsIn,x_Microtheory) :- x_cid(a65b125e23090f).
xc_microtheory(a65b125e23090f,x_PerceptualAgentMt).
xc_source_file(a65b125e23090f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23090f,151).
xc_kb_names(a65b125e23090f,[]).
xc_mapping_rows(a65b125e23090f,[]).
x_arg2Isa(x_goalDeactivationsIn,x_CycLTerm) :- x_cid(a65b125e230910).
xc_microtheory(a65b125e230910,x_PerceptualAgentMt).
xc_source_file(a65b125e230910,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230910,152).
xc_kb_names(a65b125e230910,[]).
xc_mapping_rows(a65b125e230910,[]).
x_arg3Isa(x_goalDeactivationsIn,x_Goal) :- x_cid(a65b125e230911).
xc_microtheory(a65b125e230911,x_PerceptualAgentMt).
xc_source_file(a65b125e230911,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230911,153).
xc_kb_names(a65b125e230911,[]).
xc_mapping_rows(a65b125e230911,[]).
x_comment(x_goalDeactivationsIn,"(goalDeactivationsIn ?mt ?turn ?goal) binds ?goal to goals deactivated during ?turn.") :- x_cid(a65b125e230912).
xc_microtheory(a65b125e230912,x_PerceptualAgentMt).
xc_source_file(a65b125e230912,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230912,154).
xc_kb_names(a65b125e230912,[]).
xc_mapping_rows(a65b125e230912,[]).
'x_<=='(x_goalDeactivationsIn(V1,V2,V3),'x_ist-Information'(V1,x_dateOfEvent(x_GoalDeactivationFn(V1,V4),V2)),'x_ist-Information'(V1,x_objectOfStateChange(x_GoalDeactivationFn(V1,V4),V3))) :- x_cid(a65b125e230913,V1,V2,V3,V4).
xc_microtheory(a65b125e230913,x_PerceptualAgentMt).
xc_source_file(a65b125e230913,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230913,156).
xc_kb_names(a65b125e230913,["?mt","?turn","?goal","?n"]).
xc_mapping_rows(a65b125e230913,[]).
x_isa(x_assignAvailableActors,x_ComplexActionPredicate) :- x_cid(a65b125e230914).
xc_microtheory(a65b125e230914,x_PerceptualAgentMt).
xc_source_file(a65b125e230914,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230914,162).
xc_kb_names(a65b125e230914,[]).
xc_mapping_rows(a65b125e230914,[]).
x_arity(x_assignAvailableActors,2) :- x_cid(a65b125e230915).
xc_microtheory(a65b125e230915,x_PerceptualAgentMt).
xc_source_file(a65b125e230915,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230915,163).
xc_kb_names(a65b125e230915,[]).
xc_mapping_rows(a65b125e230915,[]).
x_arg1Isa(x_assignAvailableActors,x_TimeInterval) :- x_cid(a65b125e230916).
xc_microtheory(a65b125e230916,x_PerceptualAgentMt).
xc_source_file(a65b125e230916,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230916,164).
xc_kb_names(a65b125e230916,[]).
xc_mapping_rows(a65b125e230916,[]).
x_arg2Isa(x_assignAvailableActors,x_Microtheory) :- x_cid(a65b125e230917).
xc_microtheory(a65b125e230917,x_PerceptualAgentMt).
xc_source_file(a65b125e230917,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230917,165).
xc_kb_names(a65b125e230917,[]).
xc_mapping_rows(a65b125e230917,[]).
x_comment(x_assignAvailableActors,"(assignAvailableActors ?when ?mt) assigns actor resources to pursuing the most important and appropriate goals.") :- x_cid(a65b125e230918).
xc_microtheory(a65b125e230918,x_PerceptualAgentMt).
xc_source_file(a65b125e230918,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230918,166).
xc_kb_names(a65b125e230918,[]).
xc_mapping_rows(a65b125e230918,[]).
x_preconditionForMethod(x_evaluate(V1,x_SetToListFn(x_TheClosedRetrievalSetOf(V2,x_and(x_assignableActorOfType(V2,V3),x_uninferredSentence(x_busyActor(V2)))))),x_methodForAction(x_assignAvailableActors(V4,V5),x_actionSequence(x_TheList(x_doForEach(V2,V1,x_assignActor(V4,V5,V2)))))) :- x_cid(a65b125e230919,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e230919,x_PerceptualAgentMt).
xc_source_file(a65b125e230919,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230919,169).
xc_kb_names(a65b125e230919,["?assignable-actors","?actor","?type","?when","?mt"]).
xc_mapping_rows(a65b125e230919,[]).
x_isa(x_assignActor,x_ComplexActionPredicate) :- x_cid(a65b125e23091a).
xc_microtheory(a65b125e23091a,x_PerceptualAgentMt).
xc_source_file(a65b125e23091a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23091a,182).
xc_kb_names(a65b125e23091a,[]).
xc_mapping_rows(a65b125e23091a,[]).
x_arity(x_assignActor,3) :- x_cid(a65b125e23091b).
xc_microtheory(a65b125e23091b,x_PerceptualAgentMt).
xc_source_file(a65b125e23091b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23091b,183).
xc_kb_names(a65b125e23091b,[]).
xc_mapping_rows(a65b125e23091b,[]).
x_arg1Isa(x_assignActor,x_TimeInterval) :- x_cid(a65b125e23091c).
xc_microtheory(a65b125e23091c,x_PerceptualAgentMt).
xc_source_file(a65b125e23091c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23091c,184).
xc_kb_names(a65b125e23091c,[]).
xc_mapping_rows(a65b125e23091c,[]).
x_arg2Isa(x_assignActor,x_Microtheory) :- x_cid(a65b125e23091d).
xc_microtheory(a65b125e23091d,x_PerceptualAgentMt).
xc_source_file(a65b125e23091d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23091d,185).
xc_kb_names(a65b125e23091d,[]).
xc_mapping_rows(a65b125e23091d,[]).
x_arg3Isa(x_assignActor,'x_Agent-Generic') :- x_cid(a65b125e23091e).
xc_microtheory(a65b125e23091e,x_PerceptualAgentMt).
xc_source_file(a65b125e23091e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23091e,186).
xc_kb_names(a65b125e23091e,[]).
xc_mapping_rows(a65b125e23091e,[]).
x_comment(x_assignActor,"(assignActor ?when ?mt ?actor) selects an appropriate goal for an actor, plans for and executes it.") :- x_cid(a65b125e23091f).
xc_microtheory(a65b125e23091f,x_PerceptualAgentMt).
xc_source_file(a65b125e23091f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23091f,187).
xc_kb_names(a65b125e23091f,[]).
xc_mapping_rows(a65b125e23091f,[]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_SortFn(x_TheClosedRetrievalSetOf(V2,x_possibleGoalAssignment(V3,V4,V2)),x_greaterThan,x_FunctionToArg(2,x_Kappa(t(V5,V6),x_and(x_goalActivation(V5,V7),x_unifies(x_Percent(V6),V7)))))),x_partitionFirstCohort(V1,x_goalActivation,V8,V9)),x_methodForAction(x_assignActor(V10,V3,V4),x_actionSequence(x_TheList(x_assignActorToGoals(V10,V3,V4,V8,V9))))) :- x_cid(a65b125e230920,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125e230920,x_PerceptualAgentMt).
xc_source_file(a65b125e230920,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230920,202).
xc_kb_names(a65b125e230920,["?goals","?possible-goal","?mt","?actor","?in","?out","?percent","?top-goals","?rest-goals","?when"]).
xc_mapping_rows(a65b125e230920,[]).
'x_<=='(x_preferInContext(x_assignActor(V1,V2,V3),V4,V5),x_someArgumentHasPredicate(V4,x_assignActorToGoals)) :- x_cid(a65b125e230921,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e230921,x_PerceptualAgentMt).
xc_source_file(a65b125e230921,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230921,219).
xc_kb_names(a65b125e230921,["?when","?mt","?actor","?seq1","?seq2"]).
xc_mapping_rows(a65b125e230921,[]).
x_preconditionForMethod(x_lookupOnly(x_localOnly(x_allFactsAllowed('x_ist-Information'(V1,x_holdsIn(V2,x_intentForActor(V3,V4)))))),x_methodForAction(x_assignActor(V5,V1,V3),x_actionSequence(x_TheList(x_achieve(V4))))) :- x_cid(a65b125e230922,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e230922,x_PerceptualAgentMt).
xc_source_file(a65b125e230922,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230922,222).
xc_kb_names(a65b125e230922,["?mt","?whenever","?actor","?intent","?when"]).
xc_mapping_rows(a65b125e230922,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_assignActor(V1,V2,V3),x_actionSequence(x_TheList(x_assignActorToTypicalActivity(V2,V3))))) :- x_cid(a65b125e230923,V1,V2,V3).
xc_microtheory(a65b125e230923,x_PerceptualAgentMt).
xc_source_file(a65b125e230923,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230923,235).
xc_kb_names(a65b125e230923,["?when","?mt","?actor"]).
xc_mapping_rows(a65b125e230923,[]).
'x_<=='(x_preferInContext(x_assignActor(V1,V2,V3),V4,V5),x_someArgumentHasPredicate(V5,x_assignActorToTypicalActivity)) :- x_cid(a65b125e230924,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e230924,x_PerceptualAgentMt).
xc_source_file(a65b125e230924,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230924,243).
xc_kb_names(a65b125e230924,["?when","?mt","?actor","?seq1","?seq2"]).
xc_mapping_rows(a65b125e230924,[]).
x_isa(x_assignActorToGoals,x_ComplexActionPredicate) :- x_cid(a65b125e230925).
xc_microtheory(a65b125e230925,x_PerceptualAgentMt).
xc_source_file(a65b125e230925,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230925,246).
xc_kb_names(a65b125e230925,[]).
xc_mapping_rows(a65b125e230925,[]).
x_arity(x_assignActorToGoals,5) :- x_cid(a65b125e230926).
xc_microtheory(a65b125e230926,x_PerceptualAgentMt).
xc_source_file(a65b125e230926,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230926,247).
xc_kb_names(a65b125e230926,[]).
xc_mapping_rows(a65b125e230926,[]).
x_arg1Isa(x_assignActorToGoals,x_TimeInterval) :- x_cid(a65b125e230927).
xc_microtheory(a65b125e230927,x_PerceptualAgentMt).
xc_source_file(a65b125e230927,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230927,248).
xc_kb_names(a65b125e230927,[]).
xc_mapping_rows(a65b125e230927,[]).
x_arg2Isa(x_assignActorToGoals,x_Microtheory) :- x_cid(a65b125e230928).
xc_microtheory(a65b125e230928,x_PerceptualAgentMt).
xc_source_file(a65b125e230928,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230928,249).
xc_kb_names(a65b125e230928,[]).
xc_mapping_rows(a65b125e230928,[]).
x_arg3Isa(x_assignActorToGoals,'x_Agent-Generic') :- x_cid(a65b125e230929).
xc_microtheory(a65b125e230929,x_PerceptualAgentMt).
xc_source_file(a65b125e230929,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230929,250).
xc_kb_names(a65b125e230929,[]).
xc_mapping_rows(a65b125e230929,[]).
x_arg4Isa(x_assignActorToGoals,x_List) :- x_cid(a65b125e23092a).
xc_microtheory(a65b125e23092a,x_PerceptualAgentMt).
xc_source_file(a65b125e23092a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23092a,251).
xc_kb_names(a65b125e23092a,[]).
xc_mapping_rows(a65b125e23092a,[]).
x_arg5Isa(x_assignActorToGoals,x_List) :- x_cid(a65b125e23092b).
xc_microtheory(a65b125e23092b,x_PerceptualAgentMt).
xc_source_file(a65b125e23092b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23092b,252).
xc_kb_names(a65b125e23092b,[]).
xc_mapping_rows(a65b125e23092b,[]).
x_comment(x_assignActorToGoals,"(assignActorToGoal ?when ?mt ?actor ?top-goals ?rest-goals) searches for the best goal for actor to pursue.") :- x_cid(a65b125e23092c).
xc_microtheory(a65b125e23092c,x_PerceptualAgentMt).
xc_source_file(a65b125e23092c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23092c,253).
xc_kb_names(a65b125e23092c,[]).
xc_mapping_rows(a65b125e23092c,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_assignActorToGoals(V1,V2,V3,V4,V5),x_actionSequence(x_TheList(x_assignActionToGoals(V1,V2,V3,V4))))) :- x_cid(a65b125e23092d,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e23092d,x_PerceptualAgentMt).
xc_source_file(a65b125e23092d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23092d,255).
xc_kb_names(a65b125e23092d,["?when","?mt","?actor","?top-goals","?rest-goals"]).
xc_mapping_rows(a65b125e23092d,[]).
x_preconditionForMethod(x_and(x_different(V1,x_TheList),x_partitionFirstCohort(V1,x_goalActivation,V2,V3)),x_methodForAction(x_assignActorToGoals(V4,V5,V6,V7,V1),x_actionSequence(x_TheList(x_assignActorToGoals(V4,V5,V6,V2,V3))))) :- x_cid(a65b125e23092e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e23092e,x_PerceptualAgentMt).
xc_source_file(a65b125e23092e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23092e,263).
xc_kb_names(a65b125e23092e,["?rest-goals","?goals","?remaining-goals","?when","?mt","?actor","?top-goals"]).
xc_mapping_rows(a65b125e23092e,[]).
'x_<=='(x_preferInContext(x_assignActorToGoals(V1,V2,V3,V4,V5),V6,V7),x_someArgumentHasPredicate(V6,x_assignActionToGoals)) :- x_cid(a65b125e23092f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e23092f,x_PerceptualAgentMt).
xc_source_file(a65b125e23092f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23092f,273).
xc_kb_names(a65b125e23092f,["?when","?mt","?actor","?goals","?remaining-goals","?seq1","?seq2"]).
xc_mapping_rows(a65b125e23092f,[]).
x_isa(x_assignActionToGoals,x_ComplexActionPredicate) :- x_cid(a65b125e230930).
xc_microtheory(a65b125e230930,x_PerceptualAgentMt).
xc_source_file(a65b125e230930,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230930,276).
xc_kb_names(a65b125e230930,[]).
xc_mapping_rows(a65b125e230930,[]).
x_arity(x_assignActionToGoals,4) :- x_cid(a65b125e230931).
xc_microtheory(a65b125e230931,x_PerceptualAgentMt).
xc_source_file(a65b125e230931,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230931,277).
xc_kb_names(a65b125e230931,[]).
xc_mapping_rows(a65b125e230931,[]).
x_arg1Isa(x_assignActionToGoals,x_TimeInterval) :- x_cid(a65b125e230932).
xc_microtheory(a65b125e230932,x_PerceptualAgentMt).
xc_source_file(a65b125e230932,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230932,278).
xc_kb_names(a65b125e230932,[]).
xc_mapping_rows(a65b125e230932,[]).
x_arg2Isa(x_assignActionToGoals,x_Microtheory) :- x_cid(a65b125e230933).
xc_microtheory(a65b125e230933,x_PerceptualAgentMt).
xc_source_file(a65b125e230933,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230933,279).
xc_kb_names(a65b125e230933,[]).
xc_mapping_rows(a65b125e230933,[]).
x_arg3Isa(x_assignActionToGoals,'x_Agent-Generic') :- x_cid(a65b125e230934).
xc_microtheory(a65b125e230934,x_PerceptualAgentMt).
xc_source_file(a65b125e230934,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230934,280).
xc_kb_names(a65b125e230934,[]).
xc_mapping_rows(a65b125e230934,[]).
x_arg4Isa(x_assignActionToGoals,x_List) :- x_cid(a65b125e230935).
xc_microtheory(a65b125e230935,x_PerceptualAgentMt).
xc_source_file(a65b125e230935,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230935,281).
xc_kb_names(a65b125e230935,[]).
xc_mapping_rows(a65b125e230935,[]).
x_comment(x_assignActionToGoals,"(assignActionToGoals ?when ?mt ?actor ?goals) picks the best action instantiation and attempts to plan for it.") :- x_cid(a65b125e230936).
xc_microtheory(a65b125e230936,x_PerceptualAgentMt).
xc_source_file(a65b125e230936,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230936,282).
xc_kb_names(a65b125e230936,[]).
xc_mapping_rows(a65b125e230936,[]).
x_preconditionForMethod(x_outsourcedOnly(x_sortedActionPairs(V1,V2,V3,V4,V5)),x_methodForAction(x_assignActionToGoals(V1,V2,V3,V4),x_actionSequence(x_TheList(x_executeBestAction(V1,V2,V3,V5))))) :- x_cid(a65b125e230937,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e230937,x_PerceptualAgentMt).
xc_source_file(a65b125e230937,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230937,284).
xc_kb_names(a65b125e230937,["?when","?mt","?actor","?goals","?sorted-pairs"]).
xc_mapping_rows(a65b125e230937,[]).
x_isa(x_partitionFirstCohort,x_QuaternaryPredicate) :- x_cid(a65b125e230938).
xc_microtheory(a65b125e230938,x_PerceptualAgentMt).
xc_source_file(a65b125e230938,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230938,293).
xc_kb_names(a65b125e230938,[]).
xc_mapping_rows(a65b125e230938,[]).
x_arity(x_partitionFirstCohort,4) :- x_cid(a65b125e230939).
xc_microtheory(a65b125e230939,x_PerceptualAgentMt).
xc_source_file(a65b125e230939,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230939,294).
xc_kb_names(a65b125e230939,[]).
xc_mapping_rows(a65b125e230939,[]).
x_arg1Isa(x_partitionFirstCohort,x_List) :- x_cid(a65b125e23093a).
xc_microtheory(a65b125e23093a,x_PerceptualAgentMt).
xc_source_file(a65b125e23093a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23093a,295).
xc_kb_names(a65b125e23093a,[]).
xc_mapping_rows(a65b125e23093a,[]).
x_arg2Isa(x_partitionFirstCohort,x_BinaryPredicate) :- x_cid(a65b125e23093b).
xc_microtheory(a65b125e23093b,x_PerceptualAgentMt).
xc_source_file(a65b125e23093b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23093b,296).
xc_kb_names(a65b125e23093b,[]).
xc_mapping_rows(a65b125e23093b,[]).
x_arg3Isa(x_partitionFirstCohort,x_List) :- x_cid(a65b125e23093c).
xc_microtheory(a65b125e23093c,x_PerceptualAgentMt).
xc_source_file(a65b125e23093c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23093c,297).
xc_kb_names(a65b125e23093c,[]).
xc_mapping_rows(a65b125e23093c,[]).
x_arg4Isa(x_partitionFirstCohort,x_List) :- x_cid(a65b125e23093d).
xc_microtheory(a65b125e23093d,x_PerceptualAgentMt).
xc_source_file(a65b125e23093d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23093d,298).
xc_kb_names(a65b125e23093d,[]).
xc_mapping_rows(a65b125e23093d,[]).
x_comment(x_partitionFirstCohort,"(partitionFirstCohort ?input-list ?pred ?first-cohort ?rest-list) partitions sorted ?inputlist into the first cohort of elements with the same value of ?pred, and the remainder list.") :- x_cid(a65b125e23093e).
xc_microtheory(a65b125e23093e,x_PerceptualAgentMt).
xc_source_file(a65b125e23093e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23093e,299).
xc_kb_names(a65b125e23093e,[]).
xc_mapping_rows(a65b125e23093e,[]).
'x_<=='(x_partitionFirstCohort(V1,V2,V3,V4),x_different(V1,x_TheList),x_evaluate(V5,x_FirstInListFn(V1)),t(V2,V5,V6),x_evaluate(V7,x_RestOfListFn(V1)),x_nextValueListPos(V7,V2,V6,1,V8,V4),x_evaluate(V3,x_SublistFromToFn(V1,1,V8))) :- x_cid(a65b125e23093f,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e23093f,x_PerceptualAgentMt).
xc_source_file(a65b125e23093f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23093f,301).
xc_kb_names(a65b125e23093f,["?input-list","?pred","?first-cohort","?rest-list","?first","?value","?rest","?pos"]).
xc_mapping_rows(a65b125e23093f,[]).
x_isa(x_nextValueListPos,x_Predicate) :- x_cid(a65b125e230940).
xc_microtheory(a65b125e230940,x_PerceptualAgentMt).
xc_source_file(a65b125e230940,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230940,309).
xc_kb_names(a65b125e230940,[]).
xc_mapping_rows(a65b125e230940,[]).
x_arity(x_nextValueListPos,6) :- x_cid(a65b125e230941).
xc_microtheory(a65b125e230941,x_PerceptualAgentMt).
xc_source_file(a65b125e230941,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230941,310).
xc_kb_names(a65b125e230941,[]).
xc_mapping_rows(a65b125e230941,[]).
x_comment(x_nextValueListPos,"(nextValueListPos ?input-list ?pred ?value ?current ?pos ?remainder) is a helper predicate that binds ?pos and ?remainder in order to find the first cohort of members in ?input-list, which is sorted wrt ?pred.") :- x_cid(a65b125e230942).
xc_microtheory(a65b125e230942,x_PerceptualAgentMt).
xc_source_file(a65b125e230942,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230942,311).
xc_kb_names(a65b125e230942,[]).
xc_mapping_rows(a65b125e230942,[]).
'x_<=='(x_nextValueListPos(V1,V2,V3,V4,V5,V6),x_evaluate(V7,x_FirstInListFn(V1)),t(V2,V7,V3),x_evaluate(V8,x_RestOfListFn(V1)),x_evaluate(V9,x_PlusFn(1,V4)),x_nextValueListPos(V8,V2,V3,V9,V5,V6)) :- x_cid(a65b125e230943,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e230943,x_PerceptualAgentMt).
xc_source_file(a65b125e230943,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230943,313).
xc_kb_names(a65b125e230943,["?input-list","?pred","?value","?current","?pos","?remainder","?first","?rest","?next"]).
xc_mapping_rows(a65b125e230943,[]).
'x_<=='(x_nextValueListPos(x_TheList,V1,V2,V3,V3,x_TheList)) :- x_cid(a65b125e230944,V1,V2,V3).
xc_microtheory(a65b125e230944,x_PerceptualAgentMt).
xc_source_file(a65b125e230944,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230944,320).
xc_kb_names(a65b125e230944,["?pred","?value","?current"]).
xc_mapping_rows(a65b125e230944,[]).
'x_<=='(x_nextValueListPos(V1,V2,V3,V4,V4,V1),x_evaluate(V5,x_FirstInListFn(V1)),t(V2,V5,V6),x_different(V6,V3)) :- x_cid(a65b125e230945,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e230945,x_PerceptualAgentMt).
xc_source_file(a65b125e230945,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230945,321).
xc_kb_names(a65b125e230945,["?input-list","?pred","?value","?current","?first","?other-value"]).
xc_mapping_rows(a65b125e230945,[]).
x_isa(x_assignActorToTypicalActivity,x_ComplexActionPredicate) :- x_cid(a65b125e230946).
xc_microtheory(a65b125e230946,x_PerceptualAgentMt).
xc_source_file(a65b125e230946,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230946,326).
xc_kb_names(a65b125e230946,[]).
xc_mapping_rows(a65b125e230946,[]).
x_arity(x_assignActorToTypicalActivity,2) :- x_cid(a65b125e230947).
xc_microtheory(a65b125e230947,x_PerceptualAgentMt).
xc_source_file(a65b125e230947,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230947,327).
xc_kb_names(a65b125e230947,[]).
xc_mapping_rows(a65b125e230947,[]).
x_arg1Isa(x_assignActorToTypicalActivity,x_Microtheory) :- x_cid(a65b125e230948).
xc_microtheory(a65b125e230948,x_PerceptualAgentMt).
xc_source_file(a65b125e230948,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230948,328).
xc_kb_names(a65b125e230948,[]).
xc_mapping_rows(a65b125e230948,[]).
x_arg2Isa(x_assignActorToTypicalActivity,'x_Agent-Generic') :- x_cid(a65b125e230949).
xc_microtheory(a65b125e230949,x_PerceptualAgentMt).
xc_source_file(a65b125e230949,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230949,329).
xc_kb_names(a65b125e230949,[]).
xc_mapping_rows(a65b125e230949,[]).
x_comment(x_assignActorToTypicalActivity,"(assignActorToTypicalActivity ?mt ?actor) attempts to find a prototypical activity for ?actor and set him to it.") :- x_cid(a65b125e23094a).
xc_microtheory(a65b125e23094a,x_PerceptualAgentMt).
xc_source_file(a65b125e23094a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23094a,330).
xc_kb_names(a65b125e23094a,[]).
xc_mapping_rows(a65b125e23094a,[]).
x_preconditionForMethod(x_and(x_likelyActivityFor(V1,V2),x_genls(V3,V2),x_mapActivityToOperator(V1,V3,V4)),x_methodForAction(x_assignActorToTypicalActivity(V5,V1),x_actionSequence(x_TheList(V4,x_doRecord('x_ist-Information'(V5,x_defaultActivity(V1,V3))))))) :- x_cid(a65b125e23094b,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e23094b,x_PerceptualAgentMt).
xc_source_file(a65b125e23094b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23094b,332).
xc_kb_names(a65b125e23094b,["?actor","?what","?activity","?operator","?mt"]).
xc_mapping_rows(a65b125e23094b,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_assignActorToTypicalActivity(V1,V2),x_actionSequence(x_TheList(x_doAnnounce("Unable to assign actor ~s",[V2]),x_recordAssignmentFailure(V1,V2))))) :- x_cid(a65b125e23094c,V1,V2).
xc_microtheory(a65b125e23094c,x_PerceptualAgentMt).
xc_source_file(a65b125e23094c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23094c,343).
xc_kb_names(a65b125e23094c,["?mt","?actor"]).
xc_mapping_rows(a65b125e23094c,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 349, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e23094c,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 349, column 49), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_assignActorToTypicalActivity(V1,V2),V3,V4),x_noArgumentHasPredicate(V3,x_recordAssignmentFailure)) :- x_cid(a65b125e23094d,V1,V2,V3,V4).
xc_microtheory(a65b125e23094d,x_PerceptualAgentMt).
xc_source_file(a65b125e23094d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23094d,353).
xc_kb_names(a65b125e23094d,["?mt","?actor","?seq1","?seq2"]).
xc_mapping_rows(a65b125e23094d,[]).
x_isa(x_executeBestAction,x_ComplexActionPredicate) :- x_cid(a65b125e23094e).
xc_microtheory(a65b125e23094e,x_PerceptualAgentMt).
xc_source_file(a65b125e23094e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23094e,356).
xc_kb_names(a65b125e23094e,[]).
xc_mapping_rows(a65b125e23094e,[]).
x_arity(x_executeBestAction,4) :- x_cid(a65b125e23094f).
xc_microtheory(a65b125e23094f,x_PerceptualAgentMt).
xc_source_file(a65b125e23094f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23094f,357).
xc_kb_names(a65b125e23094f,[]).
xc_mapping_rows(a65b125e23094f,[]).
x_arg1Isa(x_executeBestAction,x_TimeInterval) :- x_cid(a65b125e230950).
xc_microtheory(a65b125e230950,x_PerceptualAgentMt).
xc_source_file(a65b125e230950,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230950,358).
xc_kb_names(a65b125e230950,[]).
xc_mapping_rows(a65b125e230950,[]).
x_arg2Isa(x_executeBestAction,x_Microtheory) :- x_cid(a65b125e230951).
xc_microtheory(a65b125e230951,x_PerceptualAgentMt).
xc_source_file(a65b125e230951,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230951,359).
xc_kb_names(a65b125e230951,[]).
xc_mapping_rows(a65b125e230951,[]).
x_arg3Isa(x_executeBestAction,'x_Agent-Generic') :- x_cid(a65b125e230952).
xc_microtheory(a65b125e230952,x_PerceptualAgentMt).
xc_source_file(a65b125e230952,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230952,360).
xc_kb_names(a65b125e230952,[]).
xc_mapping_rows(a65b125e230952,[]).
x_arg4Isa(x_executeBestAction,x_List) :- x_cid(a65b125e230953).
xc_microtheory(a65b125e230953,x_PerceptualAgentMt).
xc_source_file(a65b125e230953,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230953,361).
xc_kb_names(a65b125e230953,[]).
xc_mapping_rows(a65b125e230953,[]).
x_comment(x_executeBestAction,"(executeBestAction ?when ?mt ?actor ?action-goal-pairs) iterated through actions in sorted order, trying each in turn until one succeeds or method fails.") :- x_cid(a65b125e230954).
xc_microtheory(a65b125e230954,x_PerceptualAgentMt).
xc_source_file(a65b125e230954,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230954,362).
xc_kb_names(a65b125e230954,[]).
xc_mapping_rows(a65b125e230954,[]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_FirstInListFn(V2)),x_unifies(t(V3,V4),V1)),x_methodForAction(x_executeBestAction(V5,V6,V7,V2),x_actionSequence(x_TheList(x_executePlan(V5,V6,V7,V4,V3))))) :- x_cid(a65b125e230955,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e230955,x_PerceptualAgentMt).
xc_source_file(a65b125e230955,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230955,364).
xc_kb_names(a65b125e230955,["?action-pair","?action-goal-pairs","?action","?goal","?when","?mt","?actor"]).
xc_mapping_rows(a65b125e230955,[]).
x_preconditionForMethod(x_evaluate(V1,x_RestOfListFn(V2)),x_methodForAction(x_executeBestAction(V3,V4,V5,V2),x_actionSequence(x_TheList(x_executeBestAction(V3,V4,V5,V1))))) :- x_cid(a65b125e230956,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e230956,x_PerceptualAgentMt).
xc_source_file(a65b125e230956,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230956,373).
xc_kb_names(a65b125e230956,["?rest-action-pairs","?action-goal-pairs","?when","?mt","?actor"]).
xc_mapping_rows(a65b125e230956,[]).
'x_<=='(x_preferInContext(x_executeBestAction(V1,V2,V3,V4),V5,V6),x_someArgumentHasPredicate(V5,x_executePlan)) :- x_cid(a65b125e230957,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e230957,x_PerceptualAgentMt).
xc_source_file(a65b125e230957,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230957,381).
xc_kb_names(a65b125e230957,["?when","?mt","?actor","?action-goal-pairs","?seq1","?seq2"]).
xc_mapping_rows(a65b125e230957,[]).
x_isa(x_executePlan,x_ComplexActionPredicate) :- x_cid(a65b125e230958).
xc_microtheory(a65b125e230958,x_PerceptualAgentMt).
xc_source_file(a65b125e230958,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230958,392).
xc_kb_names(a65b125e230958,[]).
xc_mapping_rows(a65b125e230958,[]).
x_arity(x_executePlan,5) :- x_cid(a65b125e230959).
xc_microtheory(a65b125e230959,x_PerceptualAgentMt).
xc_source_file(a65b125e230959,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230959,393).
xc_kb_names(a65b125e230959,[]).
xc_mapping_rows(a65b125e230959,[]).
x_arg1Isa(x_executePlan,x_TimeInterval) :- x_cid(a65b125e23095a).
xc_microtheory(a65b125e23095a,x_PerceptualAgentMt).
xc_source_file(a65b125e23095a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23095a,394).
xc_kb_names(a65b125e23095a,[]).
xc_mapping_rows(a65b125e23095a,[]).
x_arg2Isa(x_executePlan,x_Microtheory) :- x_cid(a65b125e23095b).
xc_microtheory(a65b125e23095b,x_PerceptualAgentMt).
xc_source_file(a65b125e23095b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23095b,395).
xc_kb_names(a65b125e23095b,[]).
xc_mapping_rows(a65b125e23095b,[]).
x_arg3Isa(x_executePlan,'x_Agent-Generic') :- x_cid(a65b125e23095c).
xc_microtheory(a65b125e23095c,x_PerceptualAgentMt).
xc_source_file(a65b125e23095c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23095c,396).
xc_kb_names(a65b125e23095c,[]).
xc_mapping_rows(a65b125e23095c,[]).
x_arg4Isa(x_executePlan,x_Goal) :- x_cid(a65b125e23095d).
xc_microtheory(a65b125e23095d,x_PerceptualAgentMt).
xc_source_file(a65b125e23095d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23095d,397).
xc_kb_names(a65b125e23095d,[]).
xc_mapping_rows(a65b125e23095d,[]).
x_arg5Isa(x_executePlan,x_CycLTerm) :- x_cid(a65b125e23095e).
xc_microtheory(a65b125e23095e,x_PerceptualAgentMt).
xc_source_file(a65b125e23095e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23095e,398).
xc_kb_names(a65b125e23095e,[]).
xc_mapping_rows(a65b125e23095e,[]).
x_comment(x_executePlan,"(executePlan ?when ?mt ?actor ?goal ?action-sequence) handles executing and recording rationale.") :- x_cid(a65b125e23095f).
xc_microtheory(a65b125e23095f,x_PerceptualAgentMt).
xc_source_file(a65b125e23095f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23095f,399).
xc_kb_names(a65b125e23095f,[]).
xc_mapping_rows(a65b125e23095f,[]).
x_preconditionForMethod(x_and(x_operatorFormulas(V1,V2),x_isa(V1,x_SimpleActionPredicate),x_inferredArguments(V2,V3),x_groundExpression(V3),x_numAnswers(1,x_lookupOnly('x_ist-Information'(V4,x_goalName(V5,V6))))),x_methodForAction(x_executePlan(V7,V4,V8,V5,V2),x_actionSequence(x_TheList(x_recordIntent(V7,V4,V8,V6,V2),V3,x_doAgentPlan(x_recordRationale(V4,V3,V6)))))) :- x_cid(a65b125e230960,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e230960,x_PerceptualAgentMt).
xc_source_file(a65b125e230960,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230960,403).
xc_kb_names(a65b125e230960,["?task-pred","?action","?inst-action","?mt","?goal","?goal-rep","?when","?actor"]).
xc_mapping_rows(a65b125e230960,[]).
x_preconditionForMethod(x_and(x_operatorFormulas(V1,V2),x_isa(V1,x_SimpleActionPredicate),x_numAnswers(1,x_lookupOnly('x_ist-Information'(V3,x_goalName(V4,V5))))),x_methodForAction(x_executePlan(V6,V3,V7,V4,V2),x_actionSequence(x_TheList(x_recordIntent(V6,V3,V7,V5,x_achieve(x_PreconditionOfFn(V2))),x_achieve(x_PreconditionOfFn(V2)),x_doAgentPlan(x_executeInstantiatedTask(V3,V2,V4)))))) :- x_cid(a65b125e230961,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e230961,x_PerceptualAgentMt).
xc_source_file(a65b125e230961,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230961,422).
xc_kb_names(a65b125e230961,["?task-pred","?action","?mt","?goal","?goal-rep","?when","?actor"]).
xc_mapping_rows(a65b125e230961,[]).
x_preconditionForMethod(x_and(x_operatorFormulas(V1,V2),x_isa(V1,x_ComplexActionPredicate)),x_methodForAction(x_executePlan(V3,V4,V5,V6,V2),x_actionSequence(x_TheList(x_recordIntent(V3,V4,V5,V6,V2),V2)))) :- x_cid(a65b125e230962,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e230962,x_PerceptualAgentMt).
xc_source_file(a65b125e230962,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230962,440).
xc_kb_names(a65b125e230962,["?task-pred","?task","?when","?mt","?actor","?goal"]).
xc_mapping_rows(a65b125e230962,[]).
'x_<=='(x_preferInContext(x_executePlan(V1,V2,V3,V4,V5),V6,V7),x_someArgumentHasPredicate(V6,x_recordRationale)) :- x_cid(a65b125e230963,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e230963,x_PerceptualAgentMt).
xc_source_file(a65b125e230963,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230963,450).
xc_kb_names(a65b125e230963,["?when","?mt","?actor","?goal","?task","?seq1","?seq2"]).
xc_mapping_rows(a65b125e230963,[]).
x_isa(x_executeInstantiatedTask,x_ComplexActionPredicate) :- x_cid(a65b125e230964).
xc_microtheory(a65b125e230964,x_PerceptualAgentMt).
xc_source_file(a65b125e230964,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230964,454).
xc_kb_names(a65b125e230964,[]).
xc_mapping_rows(a65b125e230964,[]).
x_arity(x_executeInstantiatedTask,3) :- x_cid(a65b125e230965).
xc_microtheory(a65b125e230965,x_PerceptualAgentMt).
xc_source_file(a65b125e230965,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230965,455).
xc_kb_names(a65b125e230965,[]).
xc_mapping_rows(a65b125e230965,[]).
x_arg1Isa(x_executeInstantiatedTask,x_Microtheory) :- x_cid(a65b125e230966).
xc_microtheory(a65b125e230966,x_PerceptualAgentMt).
xc_source_file(a65b125e230966,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230966,456).
xc_kb_names(a65b125e230966,[]).
xc_mapping_rows(a65b125e230966,[]).
x_arg2Isa(x_executeInstantiatedTask,x_CycLExpression) :- x_cid(a65b125e230967).
xc_microtheory(a65b125e230967,x_PerceptualAgentMt).
xc_source_file(a65b125e230967,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230967,457).
xc_kb_names(a65b125e230967,[]).
xc_mapping_rows(a65b125e230967,[]).
x_arg3Isa(x_executeInstantiatedTask,x_Goal) :- x_cid(a65b125e230968).
xc_microtheory(a65b125e230968,x_PerceptualAgentMt).
xc_source_file(a65b125e230968,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230968,458).
xc_kb_names(a65b125e230968,[]).
xc_mapping_rows(a65b125e230968,[]).
x_comment(x_executeInstantiatedTask,"(executeInstantiatedTask ?mt ?action ?goal) instantiates any functionally-determined args to ?action, attempts it and records goal rationale.") :- x_cid(a65b125e230969).
xc_microtheory(a65b125e230969,x_PerceptualAgentMt).
xc_source_file(a65b125e230969,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230969,459).
xc_kb_names(a65b125e230969,[]).
xc_mapping_rows(a65b125e230969,[]).
x_preconditionForMethod(x_and(x_inferredArguments(V1,V2),x_groundExpression(V2),x_numAnswers(1,x_lookupOnly('x_ist-Information'(V3,x_goalName(V4,V5))))),x_methodForAction(x_executeInstantiatedTask(V3,V1,V4),x_actionSequence(x_TheList(V2,x_doAgentPlan(x_recordRationale(V3,V2,V5)))))) :- x_cid(a65b125e23096a,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e23096a,x_PerceptualAgentMt).
xc_source_file(a65b125e23096a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23096a,461).
xc_kb_names(a65b125e23096a,["?action","?inst-action","?mt","?goal","?goal-rep"]).
xc_mapping_rows(a65b125e23096a,[]).
x_isa(x_resolveFailureToDecide,x_ComplexActionPredicate) :- x_cid(a65b125e23096b).
xc_microtheory(a65b125e23096b,x_PerceptualAgentMt).
xc_source_file(a65b125e23096b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23096b,481).
xc_kb_names(a65b125e23096b,[]).
xc_mapping_rows(a65b125e23096b,[]).
x_arity(x_resolveFailureToDecide,3) :- x_cid(a65b125e23096c).
xc_microtheory(a65b125e23096c,x_PerceptualAgentMt).
xc_source_file(a65b125e23096c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23096c,482).
xc_kb_names(a65b125e23096c,[]).
xc_mapping_rows(a65b125e23096c,[]).
x_arg1Isa(x_resolveFailureToDecide,x_Microtheory) :- x_cid(a65b125e23096d).
xc_microtheory(a65b125e23096d,x_PerceptualAgentMt).
xc_source_file(a65b125e23096d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23096d,483).
xc_kb_names(a65b125e23096d,[]).
xc_mapping_rows(a65b125e23096d,[]).
x_arg2Isa(x_resolveFailureToDecide,'x_Agent-Generic') :- x_cid(a65b125e23096e).
xc_microtheory(a65b125e23096e,x_PerceptualAgentMt).
xc_source_file(a65b125e23096e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23096e,484).
xc_kb_names(a65b125e23096e,[]).
xc_mapping_rows(a65b125e23096e,[]).
x_arg3Isa(x_resolveFailureToDecide,x_FunctionalSlot) :- x_cid(a65b125e23096f).
xc_microtheory(a65b125e23096f,x_PerceptualAgentMt).
xc_source_file(a65b125e23096f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e23096f,485).
xc_kb_names(a65b125e23096f,[]).
xc_mapping_rows(a65b125e23096f,[]).
x_comment(x_resolveFailureToDecide,"(resolveFailureToDecide ?mt ?actor ?slot) attempts to elaborate goal structures as needed to enable a dicision to be made.") :- x_cid(a65b125e230970).
xc_microtheory(a65b125e230970,x_PerceptualAgentMt).
xc_source_file(a65b125e230970,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230970,486).
xc_kb_names(a65b125e230970,[]).
xc_mapping_rows(a65b125e230970,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_resolveFailureToDecide(V1,V2,V3),x_actionSequence(x_TheList(x_doRecordPlanningFailure(x_decide(V1,V2,V3)))))) :- x_cid(a65b125e230971,V1,V2,V3).
xc_microtheory(a65b125e230971,x_PerceptualAgentMt).
xc_source_file(a65b125e230971,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230971,488).
xc_kb_names(a65b125e230971,["?mt","?actor","?slot"]).
xc_mapping_rows(a65b125e230971,[]).
'x_<=='(x_preferInContext(x_resolveFailureToDecide(V1,V2,V3),V4,V5),x_noArgumentHasPredicate(V4,x_doRecordPlanningFailure)) :- x_cid(a65b125e230972,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e230972,x_PerceptualAgentMt).
xc_source_file(a65b125e230972,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategic-player.krf').
xc_source_line(a65b125e230972,526).
xc_kb_names(a65b125e230972,["?mt","?actor","?slot","?seq1","?seq2"]).
xc_mapping_rows(a65b125e230972,[]).
kb_cache_footer(footer{count:126,digest:'96c57666661ad0819477e6cd9822d31f243f390dd518eb0e298f416ea60ae200',headerDigest:d1f6f270463b0001d4f4276161e77f36578d8d9a820d130a87cf44f9886ebd0b}).
