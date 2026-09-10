:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:48,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:153,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'5b4282c8ff8e05deb4884056b396bc7175a3a4cba0eedf54d4bffd5c6eee36ef',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:8105,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf',sourceHash:'30048a6afa291f1646b67ed9db963ac7df5bebe4a371a2ae2fe23c0e4372a104',warnings:[]}).
x_isa(x_getSimpleRMPQuestionsFromMt,x_ComplexActionPredicate) :- x_cid(a65b1329b92cea).
xc_microtheory(a65b1329b92cea,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cea,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cea,20).
xc_kb_names(a65b1329b92cea,[]).
xc_mapping_rows(a65b1329b92cea,[]).
x_arity(x_getSimpleRMPQuestionsFromMt,3) :- x_cid(a65b1329b92ceb).
xc_microtheory(a65b1329b92ceb,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92ceb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92ceb,21).
xc_kb_names(a65b1329b92ceb,[]).
xc_mapping_rows(a65b1329b92ceb,[]).
x_arg1Isa(x_getSimpleRMPQuestionsFromMt,x_Microtheory) :- x_cid(a65b1329b92cec).
xc_microtheory(a65b1329b92cec,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cec,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cec,22).
xc_kb_names(a65b1329b92cec,[]).
xc_mapping_rows(a65b1329b92cec,[]).
x_arg2Isa(x_getSimpleRMPQuestionsFromMt,x_Microtheory) :- x_cid(a65b1329b92ced).
xc_microtheory(a65b1329b92ced,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92ced,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92ced,23).
xc_kb_names(a65b1329b92ced,[]).
xc_mapping_rows(a65b1329b92ced,[]).
x_arg3Isa(x_getSimpleRMPQuestionsFromMt,x_Thing) :- x_cid(a65b1329b92cee).
xc_microtheory(a65b1329b92cee,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cee,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cee,24).
xc_kb_names(a65b1329b92cee,[]).
xc_mapping_rows(a65b1329b92cee,[]).
x_comment(x_getSimpleRMPQuestionsFromMt,"(getSimpleRMPQuestionsFromMt ?stored-reading-mt ?mt-to-store-in ?kb-or-wm)\ngenerates a list of questions for the collections in ?stored-reading-mt using rulemacropredicates and a conservative\nmethod for choosing which RMP to choose. ?mt-to-store-in is where they are stored, and ?kb-or-wm is WM if they're\nto be stored in working memory, and anything else if they're to be stored in the KB") :- x_cid(a65b1329b92cef).
xc_microtheory(a65b1329b92cef,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cef,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cef,25).
xc_kb_names(a65b1329b92cef,[]).
xc_mapping_rows(a65b1329b92cef,[]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_TheClosedRetrievalSetOf(x_isa(V2,V3),x_and(x_lookupOnly('x_ist-Information'(V4,V5)),x_unifies(x_isa(V2,V3),V5))))),x_methodForAction(x_getSimpleRMPQuestionsFromMt(V4,V6,V7),x_actionSequence(x_TheList(x_doForEach(V8,V1,'x_getSimpleRMPQuestionsFromMt-NextIsa'(V8,V1,V4,V6,V7)),x_doAnnounce("~%Finished GetSimpleRMPQuestionsFromMt.",[]))))) :- x_cid(a65b1329b92cf0,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1329b92cf0,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf0,31).
xc_kb_names(a65b1329b92cf0,["?isas-to-use","?entity-in-mt","?collection-of-that-entity","?stored-reading-mt","?fact","?mt-to-store-in","?kb-or-wm","?next-isa"]).
xc_mapping_rows(a65b1329b92cf0,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 46, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1329b92cf0,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 46, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa('x_getSimpleRMPQuestionsFromMt-NextIsa',x_ComplexActionPredicate) :- x_cid(a65b1329b92cf1).
xc_microtheory(a65b1329b92cf1,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf1,48).
xc_kb_names(a65b1329b92cf1,[]).
xc_mapping_rows(a65b1329b92cf1,[]).
x_arity('x_getSimpleRMPQuestionsFromMt-NextIsa',5) :- x_cid(a65b1329b92cf2).
xc_microtheory(a65b1329b92cf2,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf2,49).
xc_kb_names(a65b1329b92cf2,[]).
xc_mapping_rows(a65b1329b92cf2,[]).
x_arg1Isa('x_getSimpleRMPQuestionsFromMt-NextIsa','x_CycLSentence-Assertible') :- x_cid(a65b1329b92cf3).
xc_microtheory(a65b1329b92cf3,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf3,50).
xc_kb_names(a65b1329b92cf3,[]).
xc_mapping_rows(a65b1329b92cf3,[]).
x_arg2Isa('x_getSimpleRMPQuestionsFromMt-NextIsa',x_Set) :- x_cid(a65b1329b92cf4).
xc_microtheory(a65b1329b92cf4,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf4,51).
xc_kb_names(a65b1329b92cf4,[]).
xc_mapping_rows(a65b1329b92cf4,[]).
x_arg3Isa('x_getSimpleRMPQuestionsFromMt-NextIsa',x_Microtheory) :- x_cid(a65b1329b92cf5).
xc_microtheory(a65b1329b92cf5,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf5,52).
xc_kb_names(a65b1329b92cf5,[]).
xc_mapping_rows(a65b1329b92cf5,[]).
x_arg4Isa('x_getSimpleRMPQuestionsFromMt-NextIsa',x_Microtheory) :- x_cid(a65b1329b92cf6).
xc_microtheory(a65b1329b92cf6,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf6,53).
xc_kb_names(a65b1329b92cf6,[]).
xc_mapping_rows(a65b1329b92cf6,[]).
x_arg5Isa('x_getSimpleRMPQuestionsFromMt-NextIsa',x_Thing) :- x_cid(a65b1329b92cf7).
xc_microtheory(a65b1329b92cf7,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf7,54).
xc_kb_names(a65b1329b92cf7,[]).
xc_mapping_rows(a65b1329b92cf7,[]).
x_comment('x_getSimpleRMPQuestionsFromMt-NextIsa',"(getSimpleRMPQuestionsFromMt-NextIsa ?next-isa ?isas-to-use ?stored-reading-mt ?mt-to-store-in ?kb-or-wm)\ngenerates a list of questions for the collection in ?next-isa using rulemacropredicates and a conservative\nmethod for choosing which RMP to choose. ?mt-to-store-in is where they are stored, and ?kb-or-wm is WM if they're\nto be stored in working memory, and anything else if they're to be stored in the KB") :- x_cid(a65b1329b92cf8).
xc_microtheory(a65b1329b92cf8,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf8,55).
xc_kb_names(a65b1329b92cf8,[]).
xc_mapping_rows(a65b1329b92cf8,[]).
x_isa(x_generatedRMPQuestions,x_ComplexActionPredicate) :- x_cid(a65b1329b92cf9).
xc_microtheory(a65b1329b92cf9,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cf9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cf9,60).
xc_kb_names(a65b1329b92cf9,[]).
xc_mapping_rows(a65b1329b92cf9,[]).
x_arity(x_generatedRMPQuestions,3) :- x_cid(a65b1329b92cfa).
xc_microtheory(a65b1329b92cfa,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cfa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cfa,61).
xc_kb_names(a65b1329b92cfa,[]).
xc_mapping_rows(a65b1329b92cfa,[]).
x_arg1Isa(x_generatedRMPQuestions,'x_CycLSentence-Assertible') :- x_cid(a65b1329b92cfb).
xc_microtheory(a65b1329b92cfb,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cfb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cfb,62).
xc_kb_names(a65b1329b92cfb,[]).
xc_mapping_rows(a65b1329b92cfb,[]).
x_arg2Isa(x_generatedRMPQuestions,x_Set) :- x_cid(a65b1329b92cfc).
xc_microtheory(a65b1329b92cfc,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cfc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cfc,63).
xc_kb_names(a65b1329b92cfc,[]).
xc_mapping_rows(a65b1329b92cfc,[]).
x_arg3Isa(x_generatedRMPQuestions,x_List) :- x_cid(a65b1329b92cfd).
xc_microtheory(a65b1329b92cfd,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cfd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cfd,64).
xc_kb_names(a65b1329b92cfd,[]).
xc_mapping_rows(a65b1329b92cfd,[]).
x_comment(x_generatedRMPQuestions,"(generatedRMPQuestions ?next-isa ?isas-to-use ?questions)\ngenerates a list of questions for the collections in ?next-isa using rulemacropredicates and a conservative\nmethod for choosing which RMP to choose. Use it as an outsourced predicate with the third argument\nopen.") :- x_cid(a65b1329b92cfe).
xc_microtheory(a65b1329b92cfe,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cfe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cfe,65).
xc_kb_names(a65b1329b92cfe,[]).
xc_mapping_rows(a65b1329b92cfe,[]).
x_isa(x_questionToAsk,x_Predicate) :- x_cid(a65b1329b92cff).
xc_microtheory(a65b1329b92cff,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92cff,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92cff,70).
xc_kb_names(a65b1329b92cff,[]).
xc_mapping_rows(a65b1329b92cff,[]).
x_arity(x_questionToAsk,1) :- x_cid(a65b1329b92d00).
xc_microtheory(a65b1329b92d00,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d00,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d00,71).
xc_kb_names(a65b1329b92d00,[]).
xc_mapping_rows(a65b1329b92d00,[]).
x_arg1Isa(x_questionToAsk,'x_CycLSentence-Assertible') :- x_cid(a65b1329b92d01).
xc_microtheory(a65b1329b92d01,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d01,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d01,72).
xc_kb_names(a65b1329b92d01,[]).
xc_mapping_rows(a65b1329b92d01,[]).
x_comment(x_questionToAsk,"(questionToAsk ?statement) indicates that questionToAsk is a potential question\nto ask about what we've just read. It's important that these are stored in a microtheory relevent to\nthe current task, otherwise they don't really mean anything.") :- x_cid(a65b1329b92d02).
xc_microtheory(a65b1329b92d02,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d02,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d02,73).
xc_kb_names(a65b1329b92d02,[]).
xc_mapping_rows(a65b1329b92d02,[]).
x_preconditionForMethod(x_and(x_different(V1,x_WM),x_generatedRMPQuestions(V2,V3,V4)),x_methodForAction('x_getSimpleRMPQuestionsFromMt-NextIsa'(V2,V3,V5,V6,V1),x_actionSequence(x_TheList(x_doRecordMembersInContext(V6,V4))))) :- x_cid(a65b1329b92d03,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1329b92d03,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d03,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d03,77).
xc_kb_names(a65b1329b92d03,["?kb-or-wm","?next-isa","?isas-to-use","?questions","?stored-reading-mt","?mt-to-store-in"]).
xc_mapping_rows(a65b1329b92d03,[]).
x_isa(x_getTransitiveRMPQuestionsFromMt,x_ComplexActionPredicate) :- x_cid(a65b1329b92d04).
xc_microtheory(a65b1329b92d04,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d04,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d04,90).
xc_kb_names(a65b1329b92d04,[]).
xc_mapping_rows(a65b1329b92d04,[]).
x_arity(x_getTransitiveRMPQuestionsFromMt,3) :- x_cid(a65b1329b92d05).
xc_microtheory(a65b1329b92d05,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d05,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d05,91).
xc_kb_names(a65b1329b92d05,[]).
xc_mapping_rows(a65b1329b92d05,[]).
x_arg1Isa(x_getTransitiveRMPQuestionsFromMt,x_Microtheory) :- x_cid(a65b1329b92d06).
xc_microtheory(a65b1329b92d06,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d06,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d06,92).
xc_kb_names(a65b1329b92d06,[]).
xc_mapping_rows(a65b1329b92d06,[]).
x_arg2Isa(x_getTransitiveRMPQuestionsFromMt,x_Microtheory) :- x_cid(a65b1329b92d07).
xc_microtheory(a65b1329b92d07,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d07,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d07,93).
xc_kb_names(a65b1329b92d07,[]).
xc_mapping_rows(a65b1329b92d07,[]).
x_arg3Isa(x_getTransitiveRMPQuestionsFromMt,x_Thing) :- x_cid(a65b1329b92d08).
xc_microtheory(a65b1329b92d08,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d08,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d08,94).
xc_kb_names(a65b1329b92d08,[]).
xc_mapping_rows(a65b1329b92d08,[]).
x_comment(x_getTransitiveRMPQuestionsFromMt,"(getTransitiveRMPQuestionsFromMt ?stored-reading-mt ?mt-to-store-in ?kb-or-wm)\ngenerates a list of questions for the collections in ?stored-reading-mt using rulemacropredicates and an aggressive\nmethod for choosing which RMP to choose. ?mt-to-store-in is where they are stored, and ?kb-or-wm is WM if they're\nto be stored in working memory, and anything else if they're to be stored in the KB") :- x_cid(a65b1329b92d09).
xc_microtheory(a65b1329b92d09,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d09,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d09,95).
xc_kb_names(a65b1329b92d09,[]).
xc_mapping_rows(a65b1329b92d09,[]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_TheClosedRetrievalSetOf(x_isa(V2,V3),x_and(x_lookupOnly('x_ist-Information'(V4,V5)),x_unifies(x_isa(V2,V3),V5))))),x_methodForAction(x_getTransitiveRMPQuestionsFromMt(V4,V6,V7),x_actionSequence(x_TheList(x_doForEach(V8,V1,'x_getTransitiveRMPQuestionsFromMt-NextIsa'(V8,V1,V4,V6,V7)),x_doAnnounce("~%Finished getTransitiveRMPQuestionsFromMt",[]))))) :- x_cid(a65b1329b92d0a,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1329b92d0a,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d0a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d0a,101).
xc_kb_names(a65b1329b92d0a,["?isas-to-use","?entity-in-mt","?collection-of-that-entity","?stored-reading-mt","?fact","?mt-to-store-in","?kb-or-wm","?next-isa"]).
xc_mapping_rows(a65b1329b92d0a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 116, column 64), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1329b92d0a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 116, column 64), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa('x_getTransitiveRMPQuestionsFromMt-NextIsa',x_ComplexActionPredicate) :- x_cid(a65b1329b92d0b).
xc_microtheory(a65b1329b92d0b,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d0b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d0b,118).
xc_kb_names(a65b1329b92d0b,[]).
xc_mapping_rows(a65b1329b92d0b,[]).
x_arity('x_getTransitiveRMPQuestionsFromMt-NextIsa',5) :- x_cid(a65b1329b92d0c).
xc_microtheory(a65b1329b92d0c,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d0c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d0c,119).
xc_kb_names(a65b1329b92d0c,[]).
xc_mapping_rows(a65b1329b92d0c,[]).
x_arg1Isa('x_getTransitiveRMPQuestionsFromMt-NextIsa','x_CycLSentence-Assertible') :- x_cid(a65b1329b92d0d).
xc_microtheory(a65b1329b92d0d,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d0d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d0d,120).
xc_kb_names(a65b1329b92d0d,[]).
xc_mapping_rows(a65b1329b92d0d,[]).
x_arg2Isa('x_getTransitiveRMPQuestionsFromMt-NextIsa',x_Set) :- x_cid(a65b1329b92d0e).
xc_microtheory(a65b1329b92d0e,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d0e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d0e,121).
xc_kb_names(a65b1329b92d0e,[]).
xc_mapping_rows(a65b1329b92d0e,[]).
x_arg3Isa('x_getTransitiveRMPQuestionsFromMt-NextIsa',x_Microtheory) :- x_cid(a65b1329b92d0f).
xc_microtheory(a65b1329b92d0f,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d0f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d0f,122).
xc_kb_names(a65b1329b92d0f,[]).
xc_mapping_rows(a65b1329b92d0f,[]).
x_arg4Isa('x_getTransitiveRMPQuestionsFromMt-NextIsa',x_Microtheory) :- x_cid(a65b1329b92d10).
xc_microtheory(a65b1329b92d10,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d10,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d10,123).
xc_kb_names(a65b1329b92d10,[]).
xc_mapping_rows(a65b1329b92d10,[]).
x_arg5Isa('x_getTransitiveRMPQuestionsFromMt-NextIsa',x_Thing) :- x_cid(a65b1329b92d11).
xc_microtheory(a65b1329b92d11,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d11,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d11,124).
xc_kb_names(a65b1329b92d11,[]).
xc_mapping_rows(a65b1329b92d11,[]).
x_comment('x_getTransitiveRMPQuestionsFromMt-NextIsa',"(getSimpleRMPQuestionsFromMt-NextIsa ?next-isa ?isas-to-use ?stored-reading-mt ?mt-to-store-in ?kb-or-wm)\ngenerates a list of questions for the collection in ?next-isa using rulemacropredicates and an aggressive\nmethod for choosing which RMP to choose. ?mt-to-store-in is where they are stored, and ?kb-or-wm is WM if they're\nto be stored in working memory, and anything else if they're to be stored in the KB") :- x_cid(a65b1329b92d12).
xc_microtheory(a65b1329b92d12,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d12,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d12,125).
xc_kb_names(a65b1329b92d12,[]).
xc_mapping_rows(a65b1329b92d12,[]).
x_isa('x_generatedRMPQuestions-Transitive',x_ComplexActionPredicate) :- x_cid(a65b1329b92d13).
xc_microtheory(a65b1329b92d13,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d13,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d13,130).
xc_kb_names(a65b1329b92d13,[]).
xc_mapping_rows(a65b1329b92d13,[]).
x_arity('x_generatedRMPQuestions-Transitive',3) :- x_cid(a65b1329b92d14).
xc_microtheory(a65b1329b92d14,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d14,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d14,131).
xc_kb_names(a65b1329b92d14,[]).
xc_mapping_rows(a65b1329b92d14,[]).
x_arg1Isa('x_generatedRMPQuestions-Transitive','x_CycLSentence-Assertible') :- x_cid(a65b1329b92d15).
xc_microtheory(a65b1329b92d15,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d15,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d15,132).
xc_kb_names(a65b1329b92d15,[]).
xc_mapping_rows(a65b1329b92d15,[]).
x_arg2Isa('x_generatedRMPQuestions-Transitive',x_Set) :- x_cid(a65b1329b92d16).
xc_microtheory(a65b1329b92d16,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d16,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d16,133).
xc_kb_names(a65b1329b92d16,[]).
xc_mapping_rows(a65b1329b92d16,[]).
x_arg3Isa('x_generatedRMPQuestions-Transitive',x_List) :- x_cid(a65b1329b92d17).
xc_microtheory(a65b1329b92d17,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d17,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d17,134).
xc_kb_names(a65b1329b92d17,[]).
xc_mapping_rows(a65b1329b92d17,[]).
x_comment('x_generatedRMPQuestions-Transitive',"(generatedRMPQuestions-Transitive ?next-isa ?isas-to-use ?questions)\ngenerates a list of questions for the collections in ?next-isa using rulemacropredicates and\nmethod for choosing RMP that allows genls. Use it as an outsourced predicate with the third argument\nopen.") :- x_cid(a65b1329b92d18).
xc_microtheory(a65b1329b92d18,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d18,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d18,135).
xc_kb_names(a65b1329b92d18,[]).
xc_mapping_rows(a65b1329b92d18,[]).
x_preconditionForMethod(x_and(x_different(V1,x_WM),'x_generatedRMPQuestions-Transitive'(V2,V3,V4)),x_methodForAction('x_getTransitiveRMPQuestionsFromMt-NextIsa'(V2,V3,V5,V6,V1),x_actionSequence(x_TheList(x_doRecordMembersInContext(V6,V4))))) :- x_cid(a65b1329b92d19,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1329b92d19,'x_Interaction-ManagerMt').
xc_source_file(a65b1329b92d19,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/rule-macro-qa-plans.krf').
xc_source_line(a65b1329b92d19,140).
xc_kb_names(a65b1329b92d19,["?kb-or-wm","?next-isa","?isas-to-use","?questions","?stored-reading-mt","?mt-to-store-in"]).
xc_mapping_rows(a65b1329b92d19,[]).
kb_cache_footer(footer{count:48,digest:'5b4282c8ff8e05deb4884056b396bc7175a3a4cba0eedf54d4bffd5c6eee36ef',headerDigest:c9ecef741f1b081f8471760c5607cd7190623080d6b6540ddb4809e3307e35fb}).
