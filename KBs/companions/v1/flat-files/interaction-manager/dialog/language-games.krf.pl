:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:40,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:276,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:abb8de178cf81370250a47516fe4f9f1182e67a8f0c94d4b1034c6746c5a2eae,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:10131,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf',sourceHash:'645a1b933488a82c4291490f45356acc6933c7224906250cc74b90cbbff7c618',warnings:[]}).
x_isa(x_initializeConversationInstance,x_ComplexActionPredicate) :- x_cid(a65b125d40c99a).
xc_microtheory(a65b125d40c99a,x_LanguageGamesMt).
xc_source_file(a65b125d40c99a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c99a,29).
xc_kb_names(a65b125d40c99a,[]).
xc_mapping_rows(a65b125d40c99a,[]).
x_comment(x_initializeConversationInstance,"(initializeConversationInstance ?game-rules-mt ?game-instance ?role) sets up the initial state of the conversation and kicks off planning.") :- x_cid(a65b125d40c99b).
xc_microtheory(a65b125d40c99b,x_LanguageGamesMt).
xc_source_file(a65b125d40c99b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c99b,30).
xc_kb_names(a65b125d40c99b,[]).
xc_mapping_rows(a65b125d40c99b,[]).
x_isa(x_saveGameStateKeyframe,x_ComplexActionPredicate) :- x_cid(a65b125d40c99c).
xc_microtheory(a65b125d40c99c,x_LanguageGamesMt).
xc_source_file(a65b125d40c99c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c99c,34).
xc_kb_names(a65b125d40c99c,[]).
xc_mapping_rows(a65b125d40c99c,[]).
x_comment(x_saveGameStateKeyframe,"(saveGameStateKeyframe mt) saves out all the current values of quantities so that working memory can be wiped and re-initialized.") :- x_cid(a65b125d40c99d).
xc_microtheory(a65b125d40c99d,x_LanguageGamesMt).
xc_source_file(a65b125d40c99d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c99d,35).
xc_kb_names(a65b125d40c99d,[]).
xc_mapping_rows(a65b125d40c99d,[]).
x_isa(x_planConversationalTurn,x_ComplexActionPredicate) :- x_cid(a65b125d40c99e).
xc_microtheory(a65b125d40c99e,x_LanguageGamesMt).
xc_source_file(a65b125d40c99e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c99e,37).
xc_kb_names(a65b125d40c99e,[]).
xc_mapping_rows(a65b125d40c99e,[]).
x_arity(x_planConversationalTurn,1) :- x_cid(a65b125d40c99f).
xc_microtheory(a65b125d40c99f,x_LanguageGamesMt).
xc_source_file(a65b125d40c99f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c99f,38).
xc_kb_names(a65b125d40c99f,[]).
xc_mapping_rows(a65b125d40c99f,[]).
x_arg1Isa(x_planConversationalTurn,x_Microtheory) :- x_cid(a65b125d40c9a0).
xc_microtheory(a65b125d40c9a0,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a0,39).
xc_kb_names(a65b125d40c9a0,[]).
xc_mapping_rows(a65b125d40c9a0,[]).
x_comment(x_planConversationalTurn,"(planConversationalTurn ?inst) is the top-level task for each conversational turn.") :- x_cid(a65b125d40c9a1).
xc_microtheory(a65b125d40c9a1,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a1,40).
xc_kb_names(a65b125d40c9a1,[]).
xc_mapping_rows(a65b125d40c9a1,[]).
x_preconditionForMethod(x_and(x_lookupOnly(x_numAnswers(1,'x_ist-Information'(V1,x_currentRole(V2)))),x_lookupOnly(x_wmOnly('x_ist-Information'(V1,x_currentlyTrue(x_control(V2)))))),x_methodForAction(x_planConversationalTurn(V1),x_actionSequence(x_TheList(x_doAgentPlan(x_planConversationalActions(V1,V2)))))) :- x_cid(a65b125d40c9a2,V1,V2).
xc_microtheory(a65b125d40c9a2,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a2,42).
xc_kb_names(a65b125d40c9a2,["?gameinst","?role"]).
xc_mapping_rows(a65b125d40c9a2,[]).
x_preconditionForMethod(x_and(x_lookupOnly(x_numAnswers(1,'x_ist-Information'(V1,x_currentRole(V2)))),x_lookupOnly(x_numAnswers(1,x_wmOnly('x_ist-Information'(V1,x_currentlyTrue(x_control(V3)))))),x_different(V2,V3)),x_methodForAction(x_planConversationalTurn(V1),x_actionSequence(x_TheList(x_doAgentPlan(x_doAsynchronousTask(x_acceptUtterance(V3,V1))))))) :- x_cid(a65b125d40c9a3,V1,V2,V3).
xc_microtheory(a65b125d40c9a3,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a3,59).
xc_kb_names(a65b125d40c9a3,["?gameinst","?role","?other-role"]).
xc_mapping_rows(a65b125d40c9a3,[]).
x_isa(x_acceptUtterance,x_ComplexActionPredicate) :- x_cid(a65b125d40c9a4).
xc_microtheory(a65b125d40c9a4,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a4,83).
xc_kb_names(a65b125d40c9a4,[]).
xc_mapping_rows(a65b125d40c9a4,[]).
x_arity(x_acceptUtterance,2) :- x_cid(a65b125d40c9a5).
xc_microtheory(a65b125d40c9a5,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a5,84).
xc_kb_names(a65b125d40c9a5,[]).
xc_mapping_rows(a65b125d40c9a5,[]).
x_preconditionForMethod(x_and,x_methodForAction(x_acceptUtterance(V1,V2),x_actionSequence(x_TheList(x_doWaitForEvent('x_new-utterance-entity-added',30),x_doAgentPlan(x_actionSequence(x_TheList(x_updateGameState(V1,V3)))))))) :- x_cid(a65b125d40c9a6,V1,V2,V3).
xc_microtheory(a65b125d40c9a6,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a6,86).
xc_kb_names(a65b125d40c9a6,["?role","?gameinst","?allowed-moves"]).
xc_mapping_rows(a65b125d40c9a6,[]).
x_isa(x_planConversationalActions,x_ComplexActionPredicate) :- x_cid(a65b125d40c9a7).
xc_microtheory(a65b125d40c9a7,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a7,103).
xc_kb_names(a65b125d40c9a7,[]).
xc_mapping_rows(a65b125d40c9a7,[]).
x_arity(x_planConversationalActions,2) :- x_cid(a65b125d40c9a8).
xc_microtheory(a65b125d40c9a8,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a8,104).
xc_kb_names(a65b125d40c9a8,[]).
xc_mapping_rows(a65b125d40c9a8,[]).
x_arg1Isa(x_planConversationalActions,x_Microtheory) :- x_cid(a65b125d40c9a9).
xc_microtheory(a65b125d40c9a9,x_LanguageGamesMt).
xc_source_file(a65b125d40c9a9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9a9,105).
xc_kb_names(a65b125d40c9a9,[]).
xc_mapping_rows(a65b125d40c9a9,[]).
x_arg2Isa(x_planConversationalActions,x_GameRole) :- x_cid(a65b125d40c9aa).
xc_microtheory(a65b125d40c9aa,x_LanguageGamesMt).
xc_source_file(a65b125d40c9aa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9aa,106).
xc_kb_names(a65b125d40c9aa,[]).
xc_mapping_rows(a65b125d40c9aa,[]).
x_comment(x_planConversationalActions,"(planConversationalActions ?game-instance ?role) invokes conversational turn planning.") :- x_cid(a65b125d40c9ab).
xc_microtheory(a65b125d40c9ab,x_LanguageGamesMt).
xc_source_file(a65b125d40c9ab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9ab,107).
xc_kb_names(a65b125d40c9ab,[]).
xc_mapping_rows(a65b125d40c9ab,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_planConversationalActions(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125d40c9ac,V1,V2).
xc_microtheory(a65b125d40c9ac,x_LanguageGamesMt).
xc_source_file(a65b125d40c9ac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9ac,110).
xc_kb_names(a65b125d40c9ac,["?gameinst","?role"]).
xc_mapping_rows(a65b125d40c9ac,[]).
x_isa(x_applyGameAction,x_ComplexActionPredicate) :- x_cid(a65b125d40c9ad).
xc_microtheory(a65b125d40c9ad,x_LanguageGamesMt).
xc_source_file(a65b125d40c9ad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9ad,117).
xc_kb_names(a65b125d40c9ad,[]).
xc_mapping_rows(a65b125d40c9ad,[]).
x_arity(x_applyGameAction,1) :- x_cid(a65b125d40c9ae).
xc_microtheory(a65b125d40c9ae,x_LanguageGamesMt).
xc_source_file(a65b125d40c9ae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9ae,118).
xc_kb_names(a65b125d40c9ae,[]).
xc_mapping_rows(a65b125d40c9ae,[]).
x_arg1Isa(x_applyGameAction,x_Action) :- x_cid(a65b125d40c9af).
xc_microtheory(a65b125d40c9af,x_LanguageGamesMt).
xc_source_file(a65b125d40c9af,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9af,119).
xc_kb_names(a65b125d40c9af,[]).
xc_mapping_rows(a65b125d40c9af,[]).
x_comment(x_applyGameAction,"(applyGameAction ACTION)  justifies the action in wm and stores it persistently in the kb in the temporal context of ?state before computing the next state.") :- x_cid(a65b125d40c9b0).
xc_microtheory(a65b125d40c9b0,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b0,120).
xc_kb_names(a65b125d40c9b0,[]).
xc_mapping_rows(a65b125d40c9b0,[]).
x_preconditionForMethod(x_and(x_executionContext(V1),x_counterValue(x_state,V2),x_formulaArgument(V3,1,V4),x_unifies(V5,x_StateFn(V2))),x_methodForAction(x_applyGameAction(V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V1,x_holdsIn(V5,V3))),x_doJustifyMembersBy('x_ist-Information'(V1,V5),x_TheSet(V3)),x_doAgentPlan(x_actionSequence(x_TheList(x_computeNextState(V1,V5)))))))) :- x_cid(a65b125d40c9b1,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d40c9b1,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b1,122).
xc_kb_names(a65b125d40c9b1,["?gameinst","?statenum","?action","?role","?state"]).
xc_mapping_rows(a65b125d40c9b1,[]).
x_isa(x_computeNextState,x_ComplexActionPredicate) :- x_cid(a65b125d40c9b2).
xc_microtheory(a65b125d40c9b2,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b2,143).
xc_kb_names(a65b125d40c9b2,[]).
xc_mapping_rows(a65b125d40c9b2,[]).
x_arity(x_computeNextState,2) :- x_cid(a65b125d40c9b3).
xc_microtheory(a65b125d40c9b3,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b3,144).
xc_kb_names(a65b125d40c9b3,[]).
xc_mapping_rows(a65b125d40c9b3,[]).
x_arg1Isa(x_computeNextState,x_Microtheory) :- x_cid(a65b125d40c9b4).
xc_microtheory(a65b125d40c9b4,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b4,145).
xc_kb_names(a65b125d40c9b4,[]).
xc_mapping_rows(a65b125d40c9b4,[]).
x_arg2Isa(x_computeNextState,x_Situation) :- x_cid(a65b125d40c9b5).
xc_microtheory(a65b125d40c9b5,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b5,146).
xc_kb_names(a65b125d40c9b5,[]).
xc_mapping_rows(a65b125d40c9b5,[]).
x_comment(x_computeNextState,"(computeNextState ?gameinst ?prior-state ?next-role) computes and justifies the next game state.") :- x_cid(a65b125d40c9b6).
xc_microtheory(a65b125d40c9b6,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b6,147).
xc_kb_names(a65b125d40c9b6,[]).
xc_mapping_rows(a65b125d40c9b6,[]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_TheClosedRetrievalSetOf(V2,x_and(x_wmOnly(x_inferenceOnly('x_ist-Information'(V3,x_next(V4)))),x_unifies(V2,'x_ist-Information'(V3,x_currentlyTrue(V4)))))),x_nextCounterValue(x_state,V5),x_unifies(V6,x_StateFn(V5))),x_methodForAction(x_computeNextState(V3,V7),x_actionSequence(x_TheList(x_doUntell('x_ist-Information'(V3,V7)),x_doTell('x_ist-Information'(V3,V6)),x_doJustifyMembersBy('x_ist-Information'(V3,V6),V1),x_doAgentPlan(x_actionSequence(x_TheList(x_enqueueNextTurn(V3)))))))) :- x_cid(a65b125d40c9b7,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d40c9b7,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b7,149).
xc_kb_names(a65b125d40c9b7,["?next-beliefs","?new-stmt","?gameinst","?stmt","?new-state-num","?state","?prior-state"]).
xc_mapping_rows(a65b125d40c9b7,[]).
x_isa(x_enqueueNextTurn,x_ComplexActionPredicate) :- x_cid(a65b125d40c9b8).
xc_microtheory(a65b125d40c9b8,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b8,171).
xc_kb_names(a65b125d40c9b8,[]).
xc_mapping_rows(a65b125d40c9b8,[]).
x_arity(x_enqueueNextTurn,1) :- x_cid(a65b125d40c9b9).
xc_microtheory(a65b125d40c9b9,x_LanguageGamesMt).
xc_source_file(a65b125d40c9b9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9b9,172).
xc_kb_names(a65b125d40c9b9,[]).
xc_mapping_rows(a65b125d40c9b9,[]).
x_arg1Isa(x_enqueueNextTurn,x_Microtheory) :- x_cid(a65b125d40c9ba).
xc_microtheory(a65b125d40c9ba,x_LanguageGamesMt).
xc_source_file(a65b125d40c9ba,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9ba,173).
xc_kb_names(a65b125d40c9ba,[]).
xc_mapping_rows(a65b125d40c9ba,[]).
x_comment(x_enqueueNextTurn,"(enqueueNextTurn ?gameinst) places a planTurn task on the agenda.") :- x_cid(a65b125d40c9bb).
xc_microtheory(a65b125d40c9bb,x_LanguageGamesMt).
xc_source_file(a65b125d40c9bb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9bb,174).
xc_kb_names(a65b125d40c9bb,[]).
xc_mapping_rows(a65b125d40c9bb,[]).
x_preconditionForMethod(x_and('x_ist-Information'(V1,x_terminalState),x_lookupOnly(x_numAnswers(1,'x_ist-Information'(V1,x_currentRole(V2))))),x_methodForAction(x_enqueueNextTurn(V1),x_actionSequence(x_TheList))) :- x_cid(a65b125d40c9bc,V1,V2).
xc_microtheory(a65b125d40c9bc,x_LanguageGamesMt).
xc_source_file(a65b125d40c9bc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9bc,176).
xc_kb_names(a65b125d40c9bc,["?gameinst","?role"]).
xc_mapping_rows(a65b125d40c9bc,[]).
x_preconditionForMethod(x_and(x_uninferredSentence('x_ist-Information'(V1,x_terminalState)),x_localAgent(V2)),x_methodForAction(x_enqueueNextTurn(V1),x_actionSequence(x_TheList(x_doEnqueue(V2,x_TaskFn(x_NextTurnFn(V1)),x_planTurn(V1)))))) :- x_cid(a65b125d40c9bd,V1,V2).
xc_microtheory(a65b125d40c9bd,x_LanguageGamesMt).
xc_source_file(a65b125d40c9bd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9bd,187).
xc_kb_names(a65b125d40c9bd,["?gameinst","?agent"]).
xc_mapping_rows(a65b125d40c9bd,[]).
'x_<=='(x_next(x_control('x_SelfToken-Indexical')),x_currentlyTrue(x_control(V1)),x_different(V1,'x_SelfToken-Indexical')) :- x_cid(a65b125d40c9be,V1).
xc_microtheory(a65b125d40c9be,x_LanguageGamesMt).
xc_source_file(a65b125d40c9be,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9be,223).
xc_kb_names(a65b125d40c9be,["?other-player"]).
xc_mapping_rows(a65b125d40c9be,[]).
'x_<=='(x_next(x_control(V1)),x_currentlyTrue(x_control('x_SelfToken-Indexical')),x_currentUser(V1)) :- x_cid(a65b125d40c9bf,V1).
xc_microtheory(a65b125d40c9bf,x_LanguageGamesMt).
xc_source_file(a65b125d40c9bf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9bf,227).
xc_kb_names(a65b125d40c9bf,["?user"]).
xc_mapping_rows(a65b125d40c9bf,[]).
'x_<=='(x_legal(V1,x_respondToQuestion),x_currentlyTrue(x_control(V1))) :- x_cid(a65b125d40c9c0,V1).
xc_microtheory(a65b125d40c9c0,x_LanguageGamesMt).
xc_source_file(a65b125d40c9c0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9c0,240).
xc_kb_names(a65b125d40c9c0,["?role"]).
xc_mapping_rows(a65b125d40c9c0,[]).
'x_<=='(x_legal(V1,x_askAQuestion),x_currentlyTrue(x_control(V1))) :- x_cid(a65b125d40c9c1,V1).
xc_microtheory(a65b125d40c9c1,x_LanguageGamesMt).
xc_source_file(a65b125d40c9c1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/language-games.krf').
xc_source_line(a65b125d40c9c1,245).
xc_kb_names(a65b125d40c9c1,["?role"]).
xc_mapping_rows(a65b125d40c9c1,[]).
kb_cache_footer(footer{count:40,digest:abb8de178cf81370250a47516fe4f9f1182e67a8f0c94d4b1034c6746c5a2eae,headerDigest:'44b145f7c8f411dffce6a33706dce367c46c2dcd4cb87dc323f3fdbb4c24992c'}).
