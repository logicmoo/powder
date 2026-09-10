:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:73,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:317,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'1c0e7ec02d9cad68960a228f7cbf14963c93839fce3f408ece12921733475d19',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:13877,source:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf',sourceHash:f1515f84cd8f2e8e4bc50950aba231f964f29a698310bbbd8f6fb6d01f4dc5f2,warnings:[]}).
x_preconditionForMethod(x_and(x_randomAutonomousPlay(V1),x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,'x_ist-Information'(V1,x_assignableActorOfType(V3,V4))))),x_methodForAction(x_planGameActions(V1,V5),x_actionSequence(x_TheList(x_doAgentPlan(x_doForEach(V3,V2,x_planRandomActionFor(V1,V3))))))) :- x_cid(a65b1282718f28,V1,V2,V3,V4,V5).
xc_microtheory(a65b1282718f28,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f28,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f28,31).
xc_kb_names(a65b1282718f28,["?mt","?actors","?actor","?type","?player"]).
xc_mapping_rows(a65b1282718f28,[]).
x_isa(x_planRandomActionFor,x_ComplexActionPredicate) :- x_cid(a65b1282718f29).
xc_microtheory(a65b1282718f29,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f29,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f29,45).
xc_kb_names(a65b1282718f29,[]).
xc_mapping_rows(a65b1282718f29,[]).
x_arity(x_planRandomActionFor,2) :- x_cid(a65b1282718f2a).
xc_microtheory(a65b1282718f2a,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f2a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f2a,46).
xc_kb_names(a65b1282718f2a,[]).
xc_mapping_rows(a65b1282718f2a,[]).
x_arg1Isa(x_planRandomActionFor,x_Microtheory) :- x_cid(a65b1282718f2b).
xc_microtheory(a65b1282718f2b,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f2b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f2b,47).
xc_kb_names(a65b1282718f2b,[]).
xc_mapping_rows(a65b1282718f2b,[]).
x_arg2Isa(x_planRandomActionFor,'x_Agent-Generic') :- x_cid(a65b1282718f2c).
xc_microtheory(a65b1282718f2c,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f2c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f2c,48).
xc_kb_names(a65b1282718f2c,[]).
xc_mapping_rows(a65b1282718f2c,[]).
x_comment(x_planRandomActionFor,"(planRandomActionFor ?mt ?actor) selects and executes random legal operations for ?actor without repetition.") :- x_cid(a65b1282718f2d).
xc_microtheory(a65b1282718f2d,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f2d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f2d,49).
xc_kb_names(a65b1282718f2d,[]).
xc_mapping_rows(a65b1282718f2d,[]).
x_preconditionForMethod(x_wmOnly(x_and(x_evaluate(V1,x_TheClosedRetrievalSetOf(V2,x_inferenceOnly(x_legalActionFor(V3,V4,V2)))),x_different(V1,x_TheSet),x_evaluate(V5,x_RandomMemberFn(V1)))),x_methodForAction(x_planRandomActionFor(V3,V4),x_actionSequence(x_TheList(V5,x_doAgentPlan(x_actionSequence(x_TheList(x_planRandomActionFor(V3,V4)))))))) :- x_cid(a65b1282718f2e,V1,V2,V3,V4,V5).
xc_microtheory(a65b1282718f2e,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f2e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f2e,55).
xc_kb_names(a65b1282718f2e,["?possible-actions","?possible-action","?mt","?actor","?action"]).
xc_mapping_rows(a65b1282718f2e,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_planRandomActionFor(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b1282718f2f,V1,V2).
xc_microtheory(a65b1282718f2f,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f2f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f2f,75).
xc_kb_names(a65b1282718f2f,["?mt","?actor"]).
xc_mapping_rows(a65b1282718f2f,[]).
'x_<=='(x_preferInContext(x_planRandomActionFor(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b1282718f30,V1,V2,V3,V4).
xc_microtheory(a65b1282718f30,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f30,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f30,82).
xc_kb_names(a65b1282718f30,["?mt","?actor","?seq1","?seq2"]).
xc_mapping_rows(a65b1282718f30,[]).
x_isa(x_randomAutonomousPlay,x_UnaryPredicate) :- x_cid(a65b1282718f31).
xc_microtheory(a65b1282718f31,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f31,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f31,86).
xc_kb_names(a65b1282718f31,[]).
xc_mapping_rows(a65b1282718f31,[]).
x_arity(x_randomAutonomousPlay,1) :- x_cid(a65b1282718f32).
xc_microtheory(a65b1282718f32,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f32,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f32,87).
xc_kb_names(a65b1282718f32,[]).
xc_mapping_rows(a65b1282718f32,[]).
x_arg1Isa(x_randomAutonomousPlay,x_Microtheory) :- x_cid(a65b1282718f33).
xc_microtheory(a65b1282718f33,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f33,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f33,88).
xc_kb_names(a65b1282718f33,[]).
xc_mapping_rows(a65b1282718f33,[]).
x_comment(x_randomAutonomousPlay,"(randomAutonomousPlay ?mt) means the game player is running fully autonomously with no strategic knowledge whatsoever.") :- x_cid(a65b1282718f34).
xc_microtheory(a65b1282718f34,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f34,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f34,89).
xc_kb_names(a65b1282718f34,[]).
xc_mapping_rows(a65b1282718f34,[]).
'x_<=='(x_randomAutonomousPlay(V1),x_currentActivityMode(V2),x_elementOf(V2,x_TheSet(x_Experimentation,x_PerformTask)),x_uninferredSentence(x_decisionQuantifier(V3,V4))) :- x_cid(a65b1282718f35,V1,V2,V3,V4).
xc_microtheory(a65b1282718f35,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f35,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f35,91).
xc_kb_names(a65b1282718f35,["?mt","?mode","?scope","?decision-fn"]).
xc_mapping_rows(a65b1282718f35,[]).
x_isa(x_legalActionFor,x_TernaryPredicate) :- x_cid(a65b1282718f36).
xc_microtheory(a65b1282718f36,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f36,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f36,97).
xc_kb_names(a65b1282718f36,[]).
xc_mapping_rows(a65b1282718f36,[]).
x_arity(x_legalActionFor,3) :- x_cid(a65b1282718f37).
xc_microtheory(a65b1282718f37,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f37,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f37,98).
xc_kb_names(a65b1282718f37,[]).
xc_mapping_rows(a65b1282718f37,[]).
x_arg1Isa(x_legalActionFor,x_Microtheory) :- x_cid(a65b1282718f38).
xc_microtheory(a65b1282718f38,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f38,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f38,99).
xc_kb_names(a65b1282718f38,[]).
xc_mapping_rows(a65b1282718f38,[]).
x_arg2Isa(x_legalActionFor,'x_Agent-Generic') :- x_cid(a65b1282718f39).
xc_microtheory(a65b1282718f39,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f39,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f39,100).
xc_kb_names(a65b1282718f39,[]).
xc_mapping_rows(a65b1282718f39,[]).
x_arg3Isa(x_legalActionFor,x_CycLExpression) :- x_cid(a65b1282718f3a).
xc_microtheory(a65b1282718f3a,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f3a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f3a,101).
xc_kb_names(a65b1282718f3a,[]).
xc_mapping_rows(a65b1282718f3a,[]).
x_comment(x_legalActionFor,"(legalActionFor ?mt ?actor ?action) binds ?action to a currently legal action for agent ?actor.") :- x_cid(a65b1282718f3b).
xc_microtheory(a65b1282718f3b,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f3b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f3b,102).
xc_kb_names(a65b1282718f3b,[]).
xc_mapping_rows(a65b1282718f3b,[]).
'x_<=='(x_legalActionFor(V1,V2,V3),x_groundExpression(V1),x_groundExpression(V2),x_variableExpression(V3),x_uninferredSentence('x_ist-Information'(V1,x_outsourcedOnly(x_doneMoving(V2)))),x_possibleActionFor(V1,V2,V3)) :- x_cid(a65b1282718f3c,V1,V2,V3).
xc_microtheory(a65b1282718f3c,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f3c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f3c,104).
xc_kb_names(a65b1282718f3c,["?mt","?actor","?action"]).
xc_mapping_rows(a65b1282718f3c,[]).
x_isa(x_legalAction,x_BinaryPredicate) :- x_cid(a65b1282718f3d).
xc_microtheory(a65b1282718f3d,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f3d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f3d,114).
xc_kb_names(a65b1282718f3d,[]).
xc_mapping_rows(a65b1282718f3d,[]).
x_isa(x_legalAction,x_DynamicUpdatePredicate) :- x_cid(a65b1282718f3e).
xc_microtheory(a65b1282718f3e,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f3e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f3e,115).
xc_kb_names(a65b1282718f3e,[]).
xc_mapping_rows(a65b1282718f3e,[]).
x_arity(x_legalAction,2) :- x_cid(a65b1282718f3f).
xc_microtheory(a65b1282718f3f,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f3f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f3f,116).
xc_kb_names(a65b1282718f3f,[]).
xc_mapping_rows(a65b1282718f3f,[]).
x_arg1Isa(x_legalAction,x_Microtheory) :- x_cid(a65b1282718f40).
xc_microtheory(a65b1282718f40,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f40,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f40,117).
xc_kb_names(a65b1282718f40,[]).
xc_mapping_rows(a65b1282718f40,[]).
x_arg2Isa(x_legalAction,x_CycLExpression) :- x_cid(a65b1282718f41).
xc_microtheory(a65b1282718f41,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f41,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f41,118).
xc_kb_names(a65b1282718f41,[]).
xc_mapping_rows(a65b1282718f41,[]).
x_comment(x_legalAction,"(legalAction ?mt ?action) binds ?action to a primitive, domain-level action that can be performed now.") :- x_cid(a65b1282718f42).
xc_microtheory(a65b1282718f42,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f42,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f42,119).
xc_kb_names(a65b1282718f42,[]).
xc_mapping_rows(a65b1282718f42,[]).
'x_<=='(x_legalAction(V1,V2),x_groundExpression(V1),x_variableExpression(V2),'x_ist-Information'(V1,x_assignableActorOfType(V3,V4)),x_uninferredSentence('x_ist-Information'(V1,x_currentPlan(V3,V5))),x_uninferredSentence('x_ist-Information'(V1,x_doneMoving(V3))),x_possibleActionFor(V1,V3,V2)) :- x_cid(a65b1282718f43,V1,V2,V3,V4,V5).
xc_microtheory(a65b1282718f43,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f43,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f43,121).
xc_kb_names(a65b1282718f43,["?mt","?action","?actor","?type","?plan"]).
xc_mapping_rows(a65b1282718f43,[]).
'x_<=='(x_legalAction(V1,V2),x_groundExpression(V1),x_not(x_variableExpression(V2)),x_not(x_atomicTerm(V2)),x_formulaArgument(V2,V3,V4),x_not(x_variableExpression(V4)),x_possibleActionFor(V1,V4,V2)) :- x_cid(a65b1282718f44,V1,V2,V3,V4).
xc_microtheory(a65b1282718f44,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f44,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f44,137).
xc_kb_names(a65b1282718f44,["?mt","?action","?1","?actor"]).
xc_mapping_rows(a65b1282718f44,[]).
x_isa(x_possibleActionFor,x_TernaryPredicate) :- x_cid(a65b1282718f45).
xc_microtheory(a65b1282718f45,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f45,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f45,145).
xc_kb_names(a65b1282718f45,[]).
xc_mapping_rows(a65b1282718f45,[]).
x_arity(x_possibleActionFor,3) :- x_cid(a65b1282718f46).
xc_microtheory(a65b1282718f46,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f46,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f46,146).
xc_kb_names(a65b1282718f46,[]).
xc_mapping_rows(a65b1282718f46,[]).
x_arg1Isa(x_possibleActionFor,x_Microtheory) :- x_cid(a65b1282718f47).
xc_microtheory(a65b1282718f47,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f47,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f47,147).
xc_kb_names(a65b1282718f47,[]).
xc_mapping_rows(a65b1282718f47,[]).
x_arg2Isa(x_possibleActionFor,'x_Agent-Generic') :- x_cid(a65b1282718f48).
xc_microtheory(a65b1282718f48,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f48,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f48,148).
xc_kb_names(a65b1282718f48,[]).
xc_mapping_rows(a65b1282718f48,[]).
x_arg3Isa(x_possibleActionFor,x_CycLExpression) :- x_cid(a65b1282718f49).
xc_microtheory(a65b1282718f49,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f49,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f49,149).
xc_kb_names(a65b1282718f49,[]).
xc_mapping_rows(a65b1282718f49,[]).
x_comment(x_possibleActionFor,"(possibleActionFor ?mt ?actor ?action) binds a legal action for ?actor.") :- x_cid(a65b1282718f4a).
xc_microtheory(a65b1282718f4a,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f4a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f4a,150).
xc_kb_names(a65b1282718f4a,[]).
xc_mapping_rows(a65b1282718f4a,[]).
'x_<=='(x_possibleActionFor(V1,V2,V3),x_variableExpression(V3),x_allFactsAllowed('x_ist-Information'(V1,x_lookupOnly(x_actionPrimitive(V4)))),x_possibleActionForPred(V1,V2,V4,V3)) :- x_cid(a65b1282718f4b,V1,V2,V3,V4).
xc_microtheory(a65b1282718f4b,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f4b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f4b,154).
xc_kb_names(a65b1282718f4b,["?mt","?actor","?action","?pred"]).
xc_mapping_rows(a65b1282718f4b,[]).
'x_<=='(x_possibleActionFor(V1,V2,V3),x_not(x_variableExpression(V3)),x_not(x_atomicTerm(V3)),x_operatorFormulas(V4,V3),x_possibleActionForPred(V1,V2,V4,V3)) :- x_cid(a65b1282718f4c,V1,V2,V3,V4).
xc_microtheory(a65b1282718f4c,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f4c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f4c,163).
xc_kb_names(a65b1282718f4c,["?mt","?actor","?action","?pred"]).
xc_mapping_rows(a65b1282718f4c,[]).
x_isa(x_possibleActionForPred,x_QuaternaryPredicate) :- x_cid(a65b1282718f4d).
xc_microtheory(a65b1282718f4d,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f4d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f4d,169).
xc_kb_names(a65b1282718f4d,[]).
xc_mapping_rows(a65b1282718f4d,[]).
x_arity(x_possibleActionForPred,4) :- x_cid(a65b1282718f4e).
xc_microtheory(a65b1282718f4e,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f4e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f4e,170).
xc_kb_names(a65b1282718f4e,[]).
xc_mapping_rows(a65b1282718f4e,[]).
x_arg1Isa(x_possibleActionForPred,x_Microtheory) :- x_cid(a65b1282718f4f).
xc_microtheory(a65b1282718f4f,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f4f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f4f,171).
xc_kb_names(a65b1282718f4f,[]).
xc_mapping_rows(a65b1282718f4f,[]).
x_arg2Isa(x_possibleActionForPred,'x_Agent-Generic') :- x_cid(a65b1282718f50).
xc_microtheory(a65b1282718f50,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f50,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f50,172).
xc_kb_names(a65b1282718f50,[]).
xc_mapping_rows(a65b1282718f50,[]).
x_arg3Isa(x_possibleActionForPred,x_SimpleActionPredicate) :- x_cid(a65b1282718f51).
xc_microtheory(a65b1282718f51,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f51,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f51,173).
xc_kb_names(a65b1282718f51,[]).
xc_mapping_rows(a65b1282718f51,[]).
x_arg4Isa(x_possibleActionForPred,x_CycLExpression) :- x_cid(a65b1282718f52).
xc_microtheory(a65b1282718f52,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f52,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f52,174).
xc_kb_names(a65b1282718f52,[]).
xc_mapping_rows(a65b1282718f52,[]).
x_comment(x_possibleActionForPred,"(possibleActionForPred ?mt ?actor ?pred ?action) binds a legal action for ?actor.") :- x_cid(a65b1282718f53).
xc_microtheory(a65b1282718f53,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f53,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f53,175).
xc_kb_names(a65b1282718f53,[]).
xc_mapping_rows(a65b1282718f53,[]).
'x_<=='(x_possibleActionForPred(V1,V2,V3,V4),x_not(x_variableExpression(V4)),x_numAnswers(1,x_allFactsAllowed(x_lookupOnly(x_arity(V3,V5)))),x_numAnswers(1,x_allFactsAllowed(x_lookupOnly(x_arg1Isa(V3,V6)))),x_allFactsAllowed(x_lookupOnly('x_ist-Information'(V1,x_isa(V2,V6)))),x_numAnswers(1,x_instantiatedPrec(V3,1,V2,V7)),x_formulaArgument(V7,1,V8),x_allFactsAllowed('x_ist-Information'(V1,V8)),x_formulaArgument(V7,2,V9),x_matches(V9,V4),x_makesProgress(V1,V2,V4)) :- x_cid(a65b1282718f54,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b1282718f54,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f54,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f54,184).
xc_kb_names(a65b1282718f54,["?mt","?actor","?pred","?action","?arity","?type","?prec-stmt","?prec","?arg2"]).
xc_mapping_rows(a65b1282718f54,[]).
'x_<=='(x_possibleActionForPred(V1,V2,V3,V4),x_variableExpression(V4),x_numAnswers(1,x_allFactsAllowed(x_lookupOnly(x_arity(V3,V5)))),x_numAnswers(1,x_allFactsAllowed(x_lookupOnly(x_arg1Isa(V3,V6)))),x_allFactsAllowed(x_lookupOnly('x_ist-Information'(V1,x_isa(V2,V6)))),x_numAnswers(1,x_instantiatedPrec(V3,1,V2,V7)),x_formulaArgument(V7,1,V8),x_allFactsAllowed('x_ist-Information'(V1,V8)),x_formulaArgument(V7,2,V4),x_makesProgress(V1,V2,V4)) :- x_cid(a65b1282718f55,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1282718f55,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f55,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f55,200).
xc_kb_names(a65b1282718f55,["?mt","?actor","?pred","?action","?arity","?type","?prec-stmt","?prec"]).
xc_mapping_rows(a65b1282718f55,[]).
x_isa(x_instantiatedPrec,x_QuaternaryRelation) :- x_cid(a65b1282718f56).
xc_microtheory(a65b1282718f56,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f56,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f56,215).
xc_kb_names(a65b1282718f56,[]).
xc_mapping_rows(a65b1282718f56,[]).
x_arity(x_instantiatedPrec,4) :- x_cid(a65b1282718f57).
xc_microtheory(a65b1282718f57,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f57,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f57,216).
xc_kb_names(a65b1282718f57,[]).
xc_mapping_rows(a65b1282718f57,[]).
x_arg1Isa(x_instantiatedPrec,x_Predicate) :- x_cid(a65b1282718f58).
xc_microtheory(a65b1282718f58,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f58,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f58,217).
xc_kb_names(a65b1282718f58,[]).
xc_mapping_rows(a65b1282718f58,[]).
x_arg2Isa(x_instantiatedPrec,x_Integer) :- x_cid(a65b1282718f59).
xc_microtheory(a65b1282718f59,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f59,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f59,218).
xc_kb_names(a65b1282718f59,[]).
xc_mapping_rows(a65b1282718f59,[]).
x_arg3Isa(x_instantiatedPrec,x_Thing) :- x_cid(a65b1282718f5a).
xc_microtheory(a65b1282718f5a,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f5a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f5a,219).
xc_kb_names(a65b1282718f5a,[]).
xc_mapping_rows(a65b1282718f5a,[]).
x_arg4Isa(x_instantiatedPrec,x_CycLExpression) :- x_cid(a65b1282718f5b).
xc_microtheory(a65b1282718f5b,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f5b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f5b,220).
xc_kb_names(a65b1282718f5b,[]).
xc_mapping_rows(a65b1282718f5b,[]).
'x_<=='(x_instantiatedPrec(V1,V2,V3,V4),x_numAnswers(1,x_variablizedStatement(V1,V5)),x_allFactsAllowed(x_numAnswers(1,'x_preconditionFor-Props'(V6,V5))),x_unifies(V7,'x_preconditionFor-Props'(V6,V5)),x_formulaArgument(V7,2,V8),x_formulaArgument(V8,V2,V9),x_evaluate(V4,x_SublisFn(x_TheSet(t(V9,V3)),V7))) :- x_cid(a65b1282718f5c,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b1282718f5c,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f5c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f5c,222).
xc_kb_names(a65b1282718f5c,["?pred","?n","?val","?stmt","?var-prim","?prec","?var-stmt","?prim","?var"]).
xc_mapping_rows(a65b1282718f5c,[]).
x_isa(x_makesProgress,x_TernaryPredicate) :- x_cid(a65b1282718f5d).
xc_microtheory(a65b1282718f5d,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f5d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f5d,247).
xc_kb_names(a65b1282718f5d,[]).
xc_mapping_rows(a65b1282718f5d,[]).
x_isa(x_makesProgress,x_DynamicUpdatePredicate) :- x_cid(a65b1282718f5e).
xc_microtheory(a65b1282718f5e,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f5e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f5e,248).
xc_kb_names(a65b1282718f5e,[]).
xc_mapping_rows(a65b1282718f5e,[]).
x_arity(x_makesProgress,3) :- x_cid(a65b1282718f5f).
xc_microtheory(a65b1282718f5f,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f5f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f5f,249).
xc_kb_names(a65b1282718f5f,[]).
xc_mapping_rows(a65b1282718f5f,[]).
x_arg1Isa(x_makesProgress,x_Microtheory) :- x_cid(a65b1282718f60).
xc_microtheory(a65b1282718f60,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f60,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f60,250).
xc_kb_names(a65b1282718f60,[]).
xc_mapping_rows(a65b1282718f60,[]).
x_arg2Isa(x_makesProgress,'x_Agent-Generic') :- x_cid(a65b1282718f61).
xc_microtheory(a65b1282718f61,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f61,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f61,251).
xc_kb_names(a65b1282718f61,[]).
xc_mapping_rows(a65b1282718f61,[]).
x_arg3Isa(x_makesProgress,x_CycLExpression) :- x_cid(a65b1282718f62).
xc_microtheory(a65b1282718f62,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f62,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f62,252).
xc_kb_names(a65b1282718f62,[]).
xc_mapping_rows(a65b1282718f62,[]).
x_comment(x_makesProgress,"(makesProgress ?mt ?agent ?action) means that, in the execution context ?mt, action will not undo previous work within the current turn .") :- x_cid(a65b1282718f63).
xc_microtheory(a65b1282718f63,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f63,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f63,253).
xc_kb_names(a65b1282718f63,[]).
xc_mapping_rows(a65b1282718f63,[]).
'x_<=='(x_makesProgress(V1,V2,V3),x_groundExpression(V1),x_groundExpression(V2),x_not(x_variableExpression(V3)),x_numAnswers(1,x_currentYear(V4)),x_uninferredSentence(x_clobbersPriorAction(V1,V4,V2,V3)),x_uninferredSentence(x_allFactsAllowed(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_holdsIn(V4,x_executionFailureFor(V3)))))))) :- x_cid(a65b1282718f64,V1,V2,V3,V4).
xc_microtheory(a65b1282718f64,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f64,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f64,255).
xc_kb_names(a65b1282718f64,["?mt","?actor","?action","?year"]).
xc_mapping_rows(a65b1282718f64,[]).
x_isa(x_clobbersPriorAction,x_QuaternaryPredicate) :- x_cid(a65b1282718f65).
xc_microtheory(a65b1282718f65,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f65,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f65,269).
xc_kb_names(a65b1282718f65,[]).
xc_mapping_rows(a65b1282718f65,[]).
x_isa(x_clobbersPriorAction,x_DynamicUpdatePredicate) :- x_cid(a65b1282718f66).
xc_microtheory(a65b1282718f66,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f66,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f66,270).
xc_kb_names(a65b1282718f66,[]).
xc_mapping_rows(a65b1282718f66,[]).
x_arity(x_clobbersPriorAction,4) :- x_cid(a65b1282718f67).
xc_microtheory(a65b1282718f67,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f67,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f67,271).
xc_kb_names(a65b1282718f67,[]).
xc_mapping_rows(a65b1282718f67,[]).
x_arg1Isa(x_clobbersPriorAction,x_Microtheory) :- x_cid(a65b1282718f68).
xc_microtheory(a65b1282718f68,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f68,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f68,272).
xc_kb_names(a65b1282718f68,[]).
xc_mapping_rows(a65b1282718f68,[]).
x_arg2Isa(x_clobbersPriorAction,x_TemporalInterval) :- x_cid(a65b1282718f69).
xc_microtheory(a65b1282718f69,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f69,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f69,273).
xc_kb_names(a65b1282718f69,[]).
xc_mapping_rows(a65b1282718f69,[]).
'x_<=='(x_clobbersPriorAction(V1,V2,V3,V4),x_actionsSoFar(V1,V2,V3,V5),x_equals(V4,V5)) :- x_cid(a65b1282718f6a,V1,V2,V3,V4,V5).
xc_microtheory(a65b1282718f6a,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f6a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f6a,280).
xc_kb_names(a65b1282718f6a,["?mt","?year","?actor","?action","?prior-action"]).
xc_mapping_rows(a65b1282718f6a,[]).
'x_<=='(x_clobbersPriorAction(V1,V2,V3,V4),x_uninferredSentence(x_allFactsAllowed(x_lookupOnly('x_ist-Information'(V1,x_isa(V3,'x_FreeCiv-Unit'))))),x_actionsSoFar(V1,V2,V3,V5),x_operatorFormulas(V6,V4),x_operatorFormulas(V6,V5)) :- x_cid(a65b1282718f6b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1282718f6b,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f6b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f6b,284).
xc_kb_names(a65b1282718f6b,["?mt","?year","?actor","?action","?prior-action","?pred"]).
xc_mapping_rows(a65b1282718f6b,[]).
x_isa(x_actionsSoFar,x_QuaternaryRelation) :- x_cid(a65b1282718f6c).
xc_microtheory(a65b1282718f6c,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f6c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f6c,294).
xc_kb_names(a65b1282718f6c,[]).
xc_mapping_rows(a65b1282718f6c,[]).
x_isa(x_actionsSoFar,x_DynamicUpdatePredicate) :- x_cid(a65b1282718f6d).
xc_microtheory(a65b1282718f6d,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f6d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f6d,295).
xc_kb_names(a65b1282718f6d,[]).
xc_mapping_rows(a65b1282718f6d,[]).
x_arity(x_actionsSoFar,4) :- x_cid(a65b1282718f6e).
xc_microtheory(a65b1282718f6e,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f6e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f6e,296).
xc_kb_names(a65b1282718f6e,[]).
xc_mapping_rows(a65b1282718f6e,[]).
x_comment(x_actionsSoFar,"(actionsSoFar ?mt ?year ?actor ?prior-action) binds ?prior-action to actions executed by ?actor in ?year.") :- x_cid(a65b1282718f6f).
xc_microtheory(a65b1282718f6f,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f6f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f6f,297).
xc_kb_names(a65b1282718f6f,[]).
xc_mapping_rows(a65b1282718f6f,[]).
'x_<=='(x_actionsSoFar(V1,V2,V3,V4),x_allFactsAllowed(x_localOnly(x_lookupOnly('x_ist-Information'(V1,x_dateOfEvent(x_CommandFn(V1,V5),V2))))),x_allFactsAllowed(x_localOnly(x_lookupOnly(x_numAnswers(1,'x_ist-Information'(V1,x_infoTransferred(x_CommandFn(V1,V5),V4)))))),x_not(x_atomicTerm(V4)),x_formulaArgument(V4,1,V3)) :- x_cid(a65b1282718f70,V1,V2,V3,V4,V5).
xc_microtheory(a65b1282718f70,x_FreecivPlanningDomain).
xc_source_file(a65b1282718f70,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/legal-player.krf').
xc_source_line(a65b1282718f70,299).
xc_kb_names(a65b1282718f70,["?mt","?year","?actor","?prior-action","?num"]).
xc_mapping_rows(a65b1282718f70,[]).
kb_cache_footer(footer{count:73,digest:'1c0e7ec02d9cad68960a228f7cbf14963c93839fce3f408ece12921733475d19',headerDigest:cc879f439c5f5560c32439c788746cc097abd4a70fd399e4e2f1a6b150af7916}).
