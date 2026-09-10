:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:39,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:411,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8a567638722210fa2e579778596a68c549247522f1e32063aa3a85453e18f637',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:19389,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf',sourceHash:'95c4f5854e618b26270193a48ffc0a5dc06b98aa5af9bdf995ef92b837857847',warnings:[]}).
x_genlMt('x_Interaction-ManagerPlanMt','x_Interaction-ManagerMt') :- x_cid(a65b125d4a683b).
xc_microtheory(a65b125d4a683b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a683b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a683b,12).
xc_kb_names(a65b125d4a683b,[]).
xc_mapping_rows(a65b125d4a683b,[]).
x_isa(x_setupIMSessionCase,x_ComplexActionPredicate) :- x_cid(a65b125d4a683c).
xc_microtheory(a65b125d4a683c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a683c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a683c,18).
xc_kb_names(a65b125d4a683c,[]).
xc_mapping_rows(a65b125d4a683c,[]).
x_arity(x_setupIMSessionCase,1) :- x_cid(a65b125d4a683d).
xc_microtheory(a65b125d4a683d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a683d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a683d,19).
xc_kb_names(a65b125d4a683d,[]).
xc_mapping_rows(a65b125d4a683d,[]).
x_arg1Isa(x_setupIMSessionCase,x_CycLTerm) :- x_cid(a65b125d4a683e).
xc_microtheory(a65b125d4a683e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a683e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a683e,20).
xc_kb_names(a65b125d4a683e,[]).
xc_mapping_rows(a65b125d4a683e,[]).
x_comment(x_setupIMSessionCase,"(setupIMSessionCase ?session-id) reifies the interaction-manager session context.") :- x_cid(a65b125d4a683f).
xc_microtheory(a65b125d4a683f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a683f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a683f,21).
xc_kb_names(a65b125d4a683f,[]).
xc_mapping_rows(a65b125d4a683f,[]).
x_isa(x_processUserUtterance,x_ComplexActionPredicate) :- x_cid(a65b125d4a6840).
xc_microtheory(a65b125d4a6840,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6840,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6840,23).
xc_kb_names(a65b125d4a6840,[]).
xc_mapping_rows(a65b125d4a6840,[]).
x_arity(x_processUserUtterance,2) :- x_cid(a65b125d4a6841).
xc_microtheory(a65b125d4a6841,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6841,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6841,24).
xc_kb_names(a65b125d4a6841,[]).
xc_mapping_rows(a65b125d4a6841,[]).
x_arg1Isa(x_processUserUtterance,x_Microtheory) :- x_cid(a65b125d4a6842).
xc_microtheory(a65b125d4a6842,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6842,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6842,25).
xc_kb_names(a65b125d4a6842,[]).
xc_mapping_rows(a65b125d4a6842,[]).
x_arg2Isa(x_processUserUtterance,x_CharacterString) :- x_cid(a65b125d4a6843).
xc_microtheory(a65b125d4a6843,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6843,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6843,26).
xc_kb_names(a65b125d4a6843,[]).
xc_mapping_rows(a65b125d4a6843,[]).
x_comment(x_processUserUtterance,"(processUserUtterance ?context ?string) kicks off NLU processing in the Companion Interaction Manager,\n handling the bookkeeping and using textInterpretation and checkUnderstanding to do the heavy lifting.") :- x_cid(a65b125d4a6844).
xc_microtheory(a65b125d4a6844,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6844,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6844,27).
xc_kb_names(a65b125d4a6844,[]).
xc_mapping_rows(a65b125d4a6844,[]).
x_isa(x_processUpdatedInterpretation,x_ComplexActionPredicate) :- x_cid(a65b125d4a6845).
xc_microtheory(a65b125d4a6845,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6845,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6845,30).
xc_kb_names(a65b125d4a6845,[]).
xc_mapping_rows(a65b125d4a6845,[]).
x_arity(x_processUpdatedInterpretation,3) :- x_cid(a65b125d4a6846).
xc_microtheory(a65b125d4a6846,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6846,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6846,31).
xc_kb_names(a65b125d4a6846,[]).
xc_mapping_rows(a65b125d4a6846,[]).
x_arg1Isa(x_processUpdatedInterpretation,x_Microtheory) :- x_cid(a65b125d4a6847).
xc_microtheory(a65b125d4a6847,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6847,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6847,32).
xc_kb_names(a65b125d4a6847,[]).
xc_mapping_rows(a65b125d4a6847,[]).
x_arg2Isa(x_processUpdatedInterpretation,x_CycLTerm) :- x_cid(a65b125d4a6848).
xc_microtheory(a65b125d4a6848,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6848,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6848,33).
xc_kb_names(a65b125d4a6848,[]).
xc_mapping_rows(a65b125d4a6848,[]).
x_arg3Isa(x_processUpdatedInterpretation,x_Microtheory) :- x_cid(a65b125d4a6849).
xc_microtheory(a65b125d4a6849,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6849,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6849,34).
xc_kb_names(a65b125d4a6849,[]).
xc_mapping_rows(a65b125d4a6849,[]).
x_comment(x_processUpdatedInterpretation,"(processUpdatedInterpretation ?context ?sentence-id ?discourse-ctxt) re-constructs interpretations from choices, writes out the interpretation and continues processing.") :- x_cid(a65b125d4a684a).
xc_microtheory(a65b125d4a684a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a684a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a684a,35).
xc_kb_names(a65b125d4a684a,[]).
xc_mapping_rows(a65b125d4a684a,[]).
x_isa(x_checkUnderstanding,x_ComplexActionPredicate) :- x_cid(a65b125d4a684b).
xc_microtheory(a65b125d4a684b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a684b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a684b,37).
xc_kb_names(a65b125d4a684b,[]).
xc_mapping_rows(a65b125d4a684b,[]).
x_arity(x_checkUnderstanding,3) :- x_cid(a65b125d4a684c).
xc_microtheory(a65b125d4a684c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a684c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a684c,38).
xc_kb_names(a65b125d4a684c,[]).
xc_mapping_rows(a65b125d4a684c,[]).
x_arg1Isa(x_checkUnderstanding,x_Microtheory) :- x_cid(a65b125d4a684d).
xc_microtheory(a65b125d4a684d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a684d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a684d,39).
xc_kb_names(a65b125d4a684d,[]).
xc_mapping_rows(a65b125d4a684d,[]).
x_arg2Isa(x_checkUnderstanding,x_CycLTerm) :- x_cid(a65b125d4a684e).
xc_microtheory(a65b125d4a684e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a684e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a684e,40).
xc_kb_names(a65b125d4a684e,[]).
xc_mapping_rows(a65b125d4a684e,[]).
x_arg3Isa(x_checkUnderstanding,x_Microtheory) :- x_cid(a65b125d4a684f).
xc_microtheory(a65b125d4a684f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a684f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a684f,41).
xc_kb_names(a65b125d4a684f,[]).
xc_mapping_rows(a65b125d4a684f,[]).
x_comment(x_checkUnderstanding,"(checkUnderstanding ?context ?sentence-id ?discourse-context) detects ambiguities in input.") :- x_cid(a65b125d4a6850).
xc_microtheory(a65b125d4a6850,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6850,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6850,42).
xc_kb_names(a65b125d4a6850,[]).
xc_mapping_rows(a65b125d4a6850,[]).
x_preconditionForMethod(x_and(x_kbOnly(x_contentVersion('x_Interaction-ManagerMt',V1)),x_outsourcedOnly(x_codeVersion('x_Interaction-ManagerMt',V2)),x_different(V1,V2),x_versionMismatchMsg(V1,V2,V3)),x_methodForAction(x_setupIMSessionCase(V4),x_actionSequence(x_TheList(x_doAnnounce("~&~a",[V3]))))) :- x_cid(a65b125d4a6851,V1,V2,V3,V4).
xc_microtheory(a65b125d4a6851,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6851,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6851,48).
xc_kb_names(a65b125d4a6851,["?contentver","?codever","?msg","?session-id"]).
xc_mapping_rows(a65b125d4a6851,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 57, column 28), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d4a6851,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 57, column 28), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_kbOnly(x_contentVersion('x_Interaction-ManagerMt',V1)),x_outsourcedOnly(x_codeVersion('x_Interaction-ManagerMt',V1)),x_currentTime(V2),x_currentDate(V3),x_sessionContext(V4),x_currentDomain(V5),x_evaluate(V6,x_TheClosedRetrievalSetOf(V7,x_and(x_interpretationContextForDomain(V5,V8),x_unifies(V7,x_interpretationContext(V8))))),x_currentUser(V9),x_nickname(V9,V10),x_newReifiedUtterance(V11),x_formattedContentString("Interaction initiated by user ~a at ~a, ~a. ",x_TheList(V10,V2,V3),V12)),x_methodForAction(x_setupIMSessionCase(V13),x_actionSequence(x_TheList(x_doRecordMembers(x_TheSet('x_ist-Information'(x_BaseKB,x_isa(V4,x_Microtheory)),'x_ist-Information'(x_BaseKB,x_isa(V4,x_Individual)),'x_ist-Information'(V4,x_isa(V11,'x_Addressing-GreetingSomeone')),'x_ist-Information'(V4,x_senderOfInfo(V11,'x_SelfToken-Indexical')),'x_ist-Information'(V4,x_recipientOfInfo(V11,V9)))),x_doRecordMembersInContext(V4,V6),x_doRespond(V11,V12))))) :- x_cid(a65b125d4a6852,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125d4a6852,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6852,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6852,67).
xc_kb_names(a65b125d4a6852,["?ver","?time","?date","?context","?domain","?ictxt-stmts","?stmt","?im-context","?user","?name","?system-utterance","?utterance-string","?session-id"]).
xc_mapping_rows(a65b125d4a6852,[]).
x_isa(x_interpretationContextForDomain,x_BinaryPredicate) :- x_cid(a65b125d4a6853).
xc_microtheory(a65b125d4a6853,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6853,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6853,104).
xc_kb_names(a65b125d4a6853,[]).
xc_mapping_rows(a65b125d4a6853,[]).
x_comment(x_interpretationContextForDomain,"(interpretationContextForDomain ?domain ?interpretationContext) associates an interpretation context with a domain.  Optional.") :- x_cid(a65b125d4a6854).
xc_microtheory(a65b125d4a6854,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6854,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6854,105).
xc_kb_names(a65b125d4a6854,[]).
xc_mapping_rows(a65b125d4a6854,[]).
x_interpretationContextForDomain(x_EPR,x_QPInterpretationQueriesMt) :- x_cid(a65b125d4a6855).
xc_microtheory(a65b125d4a6855,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6855,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6855,108).
xc_kb_names(a65b125d4a6855,[]).
xc_mapping_rows(a65b125d4a6855,[]).
x_preconditionForMethod(x_and(x_different(V1,"nil"),x_currentDomain(V2),x_different(V2,x_Kiosk),x_currentUser(V3),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_and(x_outsourcedOnly(x_textInterpretation(V1,V6,V7)),x_unifies(V5,x_interpretationOf(V6,V7))))),x_evaluate(V8,x_TheClosedRetrievalSetOf(V6,x_and(x_elementOf(V9,V4),x_formulaArgument(V9,1,V6)))),x_outsourcedOnly(x_currentSentenceId(V10)),x_outsourcedOnly(x_currentTurn(V11)),x_outsourcedOnly(x_currentTime(V12)),x_outsourcedOnly(x_currentDiscourseId(V13))),x_methodForAction(x_processUserUtterance(V14,V1),x_actionSequence(x_TheList(x_doRecordMembersInContext(V14,x_TheSet(x_userUtteranceAt(V12,V10,V1),x_isa(V10,'x_CommunicationAct-Single'),x_senderOfInfo(V10,V3),x_turnUtterance(V11,V10),x_lastSentenceForStatements(V10,V8))),x_doRecordMembersInContext(V14,V4),x_doAnnounce("~&(userUtteranceAt ~a ~a ~s)",[V12,V10,V1]),x_doAgentPlan(x_actionSequence(x_TheList(x_checkUnderstanding(V14,V10,x_DiscourseCaseFn(V13))))))))) :- x_cid(a65b125d4a6856,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b125d4a6856,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6856,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6856,138).
xc_kb_names(a65b125d4a6856,["?string","?domain","?user","?interpretation-stmts","?prop","?sid","?interpretation","?s-ids","?interp","?sentence-id","?turn","?time","?discourse-id","?context"]).
xc_mapping_rows(a65b125d4a6856,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 168, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d4a6856,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 168, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_currentUser(V1),x_nickname(V1,V2),x_formattedContentString("Quit screwing around, ~a.",x_TheList(V2),V3),x_newReifiedUtterance(V4)),x_methodForAction(x_processUserUtterance(V5,"nil"),x_actionSequence(x_TheList(x_doRespond(V4,V3))))) :- x_cid(a65b125d4a6857,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d4a6857,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6857,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6857,174).
xc_kb_names(a65b125d4a6857,["?user","?name","?utterance-string","?system-utterance","?context"]).
xc_mapping_rows(a65b125d4a6857,[]).
x_preconditionForMethod(x_and(x_equals(V1,"Yes."),x_userResponseExpected(V2,x_StopOrKeepThinking)),x_methodForAction(x_processUserUtterance(V2,V1),x_actionSequence(x_TheList(x_doUntell('x_ist-Information'(V2,x_keepChaining)))))) :- x_cid(a65b125d4a6858,V1,V2).
xc_microtheory(a65b125d4a6858,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6858,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6858,186).
xc_kb_names(a65b125d4a6858,["?string","?context"]).
xc_mapping_rows(a65b125d4a6858,[]).
x_preconditionForMethod(x_and(x_equals(V1,"No."),x_userResponseExpected(V2,x_StopOrKeepThinking),'x_ist-Information'(V2,x_caseForConsideration(V3)),x_newUUIDSymbol(V4,V5)),x_methodForAction(x_processUserUtterance(V2,V1),x_actionSequence(x_TheList(x_doTell('x_ist-Information'(V2,x_keepChaining)),x_doSolicitInputForSAGE(x_MtForMicrostoryForCaseFn(V3,V6),x_MicrostoryGContext))))) :- x_cid(a65b125d4a6859,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d4a6859,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6859,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6859,197).
xc_kb_names(a65b125d4a6859,["?string","?context","?case","?microstoryForCase","?microstoryID","?sym"]).
xc_mapping_rows(a65b125d4a6859,[]).
x_preconditionForMethod(x_evaluate(V1,x_TheClosedRetrievalSetOf(V2,x_and(x_outsourcedOnly(x_interpretationFromDrs(V3,V4,V5)),x_unifies(V2,'x_ist-Information'(V6,x_interpretationOf(V3,V5)))))),x_methodForAction(x_processUpdatedInterpretation(V6,V3,V4),x_actionSequence(x_TheList(x_doRecordMembers(V1),x_doAgentPlan(x_actionSequence(x_TheList(x_checkUnderstanding(V6,V3,V4)))))))) :- x_cid(a65b125d4a685a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d4a685a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a685a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a685a,214).
xc_kb_names(a65b125d4a685a,["?interpretation-stmts","?prop","?sentence-id","?discourse-ctxt","?interpretation","?context"]).
xc_mapping_rows(a65b125d4a685a,[]).
x_preconditionForMethod(x_and('x_ist-Information'(V1,x_lastSentenceForStatements(V2,V3)),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_wmOnly(x_and(x_elementOf(V6,V3),'x_ist-Information'(V1,x_interpretationOf(V6,V5)))))),x_different(V4,x_TheSet),x_acceptableAmbiguity(V2,V7,V4)),x_methodForAction(x_checkUnderstanding(V1,V2,V7),x_actionSequence(x_TheList(x_inferIntent(V1,V2,V7))))) :- x_cid(a65b125d4a685b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d4a685b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a685b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a685b,277).
xc_kb_names(a65b125d4a685b,["?context","?sentence-id","?sentenceSet","?interpretations","?interpretation","?sent","?discourse-ctxt"]).
xc_mapping_rows(a65b125d4a685b,[]).
x_preconditionForMethod(x_wmOnly(x_inferenceOnly(x_unknownTokens(V1,V2,V3))),x_methodForAction(x_checkUnderstanding(V4,V1,V3),x_actionSequence(x_TheList(x_doAnnounce("~%Resolving unknown words: ~s",[V2]),x_resolveUnknownWords(V4,V1,V3,V2))))) :- x_cid(a65b125d4a685c,V1,V2,V3,V4).
xc_microtheory(a65b125d4a685c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a685c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a685c,297).
xc_kb_names(a65b125d4a685c,["?sentence-id","?token-set","?discourse-ctxt","?context"]).
xc_mapping_rows(a65b125d4a685c,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 304, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d4a685c,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 304, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_wmOnly(x_and(x_uninferredSentence('x_ist-Information'(V1,x_interpretationOf(V2,V3))),x_inferenceOnly(x_fragmentaryParse(V2,V4)),x_fragmentaryQuestionType(V2,V4,V5))),x_methodForAction(x_checkUnderstanding(V1,V2,V4),x_actionSequence(x_TheList(x_handleFragmentaryQuestion(V1,V2,V4,V5))))) :- x_cid(a65b125d4a685d,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d4a685d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a685d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a685d,310).
xc_kb_names(a65b125d4a685d,["?context","?sentence-id","?interpretation","?discourse-ctxt","?qtype"]).
xc_mapping_rows(a65b125d4a685d,[]).
x_preconditionForMethod(x_syntacticallyAmbiguous(V1,V2,V3),x_methodForAction(x_checkUnderstanding(V4,V1,V3),x_actionSequence(x_TheList(x_resolveCompetingParses(V4,V1,V3,V2))))) :- x_cid(a65b125d4a685e,V1,V2,V3,V4).
xc_microtheory(a65b125d4a685e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a685e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a685e,345).
xc_kb_names(a65b125d4a685e,["?sentence-id","?csid","?discourse-ctxt","?context"]).
xc_mapping_rows(a65b125d4a685e,[]).
x_preconditionForMethod(x_wmOnly(x_semanticallyAmbiguous(V1,V2,V3)),x_methodForAction(x_checkUnderstanding(V4,V1,V3),x_actionSequence(x_TheList(x_resolveAmbiguousSemantics(V4,V1,V3,V2))))) :- x_cid(a65b125d4a685f,V1,V2,V3,V4).
xc_microtheory(a65b125d4a685f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a685f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a685f,380).
xc_kb_names(a65b125d4a685f,["?sentence-id","?csid","?discourse-ctxt","?context"]).
xc_mapping_rows(a65b125d4a685f,[]).
x_preconditionForMethod(x_newReifiedUtterance(V1),x_methodForAction(x_checkUnderstanding(V2,V3,V4),x_actionSequence(x_TheList(x_doRecordMembers(x_TheSet('x_ist-Information'(V2,x_isa(V1,'x_NotUnderstanding-CommunicationAct')),'x_ist-Information'(V2,x_isa(V1,x_AnnouncingSomething)),'x_ist-Information'(V2,x_inReplyTo(V1,V3)))),x_doRespond(V1,"I don't understand."))))) :- x_cid(a65b125d4a6860,V1,V2,V3,V4).
xc_microtheory(a65b125d4a6860,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6860,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6860,390).
xc_kb_names(a65b125d4a6860,["?system-utterance","?context","?sentence-id","?discourse-ctxt"]).
xc_mapping_rows(a65b125d4a6860,[]).
'x_<=='(x_preferInContext(x_checkUnderstanding(V1,V2,V3),V4,V5),x_unifies(V6,x_TheList(x_inferIntent,x_resolveUnknownWords,x_handleFragmentaryQuestion,x_resolveUnknownMeaning,x_resolveCompetingParses,x_disambiguateAndReRepresent,x_resolveAmbiguousSemantics,x_doRespond)),x_numAnswers(1,x_predicatePosition(V4,V6,V7)),x_numAnswers(1,x_predicatePosition(V5,V6,V8)),x_lessThan(V7,V8)) :- x_cid(a65b125d4a6861,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d4a6861,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4a6861,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/task-models.krf').
xc_source_line(a65b125d4a6861,403).
xc_kb_names(a65b125d4a6861,["?context","?sentence-id","?discourse-ctxt","?seq1","?seq2","?lst","?pos1","?pos2"]).
xc_mapping_rows(a65b125d4a6861,[]).
kb_cache_footer(footer{count:39,digest:'8a567638722210fa2e579778596a68c549247522f1e32063aa3a85453e18f637',headerDigest:'9514f12c593bef410e4332bec7a9f6af143d0c0f2a2c8c3b8a5d06b7223a50ee'}).
