:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:78,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:296,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'0b0fedcf28cd2100c9842fbd2d142ad96d2e39a2dfdaa06d2b4740b8e3f98569',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:18258,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf',sourceHash:'2385b1601e6bf478770288a344178d611d16b7fbe4265ef73dbdfef75e70c99e',warnings:[]}).
x_isa(x_internalARNFoldParsingTestOnSourceTexts,x_ComplexActionPredicate) :- x_cid(a65b125d590391).
xc_microtheory(a65b125d590391,'x_Interaction-ManagerMt').
xc_source_file(a65b125d590391,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d590391,59).
xc_kb_names(a65b125d590391,[]).
xc_mapping_rows(a65b125d590391,[]).
x_arity(x_internalARNFoldParsingTestOnSourceTexts,2) :- x_cid(a65b125d590392).
xc_microtheory(a65b125d590392,'x_Interaction-ManagerMt').
xc_source_file(a65b125d590392,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d590392,60).
xc_kb_names(a65b125d590392,[]).
xc_mapping_rows(a65b125d590392,[]).
x_arg1Isa(x_internalARNFoldParsingTestOnSourceTexts,x_List) :- x_cid(a65b125d590393).
xc_microtheory(a65b125d590393,'x_Interaction-ManagerMt').
xc_source_file(a65b125d590393,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d590393,61).
xc_kb_names(a65b125d590393,[]).
xc_mapping_rows(a65b125d590393,[]).
x_arg2Isa(x_internalARNFoldParsingTestOnSourceTexts,x_Thing) :- x_cid(a65b125d590394).
xc_microtheory(a65b125d590394,'x_Interaction-ManagerMt').
xc_source_file(a65b125d590394,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d590394,62).
xc_kb_names(a65b125d590394,[]).
xc_mapping_rows(a65b125d590394,[]).
x_comment(x_internalARNFoldParsingTestOnSourceTexts,"(internalARNFoldParsingTestOnSourceTexts  ?list-of-st-names ?experimental-trial-name) takes in a list of readings. It then does n-fold cross\nvalidation to see how well we internally match.") :- x_cid(a65b125d590395).
xc_microtheory(a65b125d590395,'x_Interaction-ManagerMt').
xc_source_file(a65b125d590395,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d590395,63).
xc_kb_names(a65b125d590395,[]).
xc_mapping_rows(a65b125d590395,[]).
x_preconditionForMethod(x_and(x_textsOfSourceTexts(V1,V2),x_goldStandardsOfSourceTexts(V1,V3)),x_methodForAction(x_internalARNFoldParsingTestOnSourceTexts(V1,V4),x_actionSequence(x_TheList(x_doForEach(V5,V3,x_internalARNFoldParsingTestPly(V5,V3,V2,V1,V4)))))) :- x_cid(a65b125d590396,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d590396,'x_Interaction-ManagerMt').
xc_source_file(a65b125d590396,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d590396,66).
xc_kb_names(a65b125d590396,["?list-of-st-names","?list-of-texts","?list-of-gs-readings","?experimental-trial-name","?reading"]).
xc_mapping_rows(a65b125d590396,[]).
x_isa(x_internalARNFoldParsingTestPly,x_ComplexActionPredicate) :- x_cid(a65b125d590397).
xc_microtheory(a65b125d590397,'x_Interaction-ManagerMt').
xc_source_file(a65b125d590397,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d590397,77).
xc_kb_names(a65b125d590397,[]).
xc_mapping_rows(a65b125d590397,[]).
x_arity(x_internalARNFoldParsingTestPly,5) :- x_cid(a65b125d590398).
xc_microtheory(a65b125d590398,'x_Interaction-ManagerMt').
xc_source_file(a65b125d590398,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d590398,78).
xc_kb_names(a65b125d590398,[]).
xc_mapping_rows(a65b125d590398,[]).
x_arg1Isa(x_internalARNFoldParsingTestPly,x_AccessingAnIBT) :- x_cid(a65b125d590399).
xc_microtheory(a65b125d590399,'x_Interaction-ManagerMt').
xc_source_file(a65b125d590399,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d590399,79).
xc_kb_names(a65b125d590399,[]).
xc_mapping_rows(a65b125d590399,[]).
x_arg2Isa(x_internalARNFoldParsingTestPly,x_List) :- x_cid(a65b125d59039a).
xc_microtheory(a65b125d59039a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d59039a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d59039a,80).
xc_kb_names(a65b125d59039a,[]).
xc_mapping_rows(a65b125d59039a,[]).
x_arg3Isa(x_internalARNFoldParsingTestPly,x_List) :- x_cid(a65b125d59039b).
xc_microtheory(a65b125d59039b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d59039b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d59039b,81).
xc_kb_names(a65b125d59039b,[]).
xc_mapping_rows(a65b125d59039b,[]).
x_arg4Isa(x_internalARNFoldParsingTestPly,x_List) :- x_cid(a65b125d59039c).
xc_microtheory(a65b125d59039c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d59039c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d59039c,82).
xc_kb_names(a65b125d59039c,[]).
xc_mapping_rows(a65b125d59039c,[]).
x_arg5Isa(x_internalARNFoldParsingTestPly,x_Thing) :- x_cid(a65b125d59039d).
xc_microtheory(a65b125d59039d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d59039d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d59039d,83).
xc_kb_names(a65b125d59039d,[]).
xc_mapping_rows(a65b125d59039d,[]).
x_comment(x_internalARNFoldParsingTestPly,"(internalARNFoldParsingTestPly ?reading ?list-of-readings ?list-of-texts ?list-of-st-names ?experimental-trial-name) \ndoes one ply for internalARNFoldParsingTest.") :- x_cid(a65b125d59039e).
xc_microtheory(a65b125d59039e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d59039e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d59039e,84).
xc_kb_names(a65b125d59039e,[]).
xc_mapping_rows(a65b125d59039e,[]).
x_preconditionForMethod(x_and(x_textForReadingInListOfReadings(V1,V2,V3,V4),x_textForReadingInListOfReadings(V1,V2,V5,V6),x_newCaseLibraryName(V1,V7,V8),x_generatedSourceTextName(V7,V9),x_generatedReadingName(V9,V10)),x_methodForAction(x_internalARNFoldParsingTestPly(V1,V2,V3,V5,V7),x_actionSequence(x_TheList(x_doClearWorkingMemory,x_doTell(x_populateNewGCforARParsingNFoldPly(V1,V2,V7,V8)),x_doRecordMembersInContext(x_ARExperimentsLogisticsMt,x_TheList(x_GCFUsedInExperiment(V11,V7))),x_doEAProcess(V4),x_doAgentPlan(x_actionSequence(x_TheList(x_disambiguateSourceText(V9,V10,x_TheSet(x_analogicalRecallParsingGenContextSuggestions(V8,'x_All-APD-CircumstancesMt')),x_LbrDisambiguationMt),x_doAgentPlan(x_actionSequence(x_TheList(x_checkAdvancedAccuracyForARNFoldParsingTestPly(V7,V6,V10,V7,V8),x_doAnnounce("internalARNFoldParsingTestPly completed for ~A.",[V1]))))))))))) :- x_cid(a65b125d59039f,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125d59039f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d59039f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d59039f,88).
xc_kb_names(a65b125d59039f,["?reading","?list-of-readings","?list-of-texts","?text","?list-of-st-names","?current-st-name","?experimental-trial-name","?case-library","?generated-st-name","?generated-reading-name","?new-GCF-name"]).
xc_mapping_rows(a65b125d59039f,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 119, column 79), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d59039f,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 119, column 79), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_checkAdvancedAccuracyForARNFoldParsingTestPly,x_ComplexActionPredicate) :- x_cid(a65b125d5903a0).
xc_microtheory(a65b125d5903a0,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a0,122).
xc_kb_names(a65b125d5903a0,[]).
xc_mapping_rows(a65b125d5903a0,[]).
x_arity(x_checkAdvancedAccuracyForARNFoldParsingTestPly,5) :- x_cid(a65b125d5903a1).
xc_microtheory(a65b125d5903a1,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a1,123).
xc_kb_names(a65b125d5903a1,[]).
xc_mapping_rows(a65b125d5903a1,[]).
x_arg1Isa(x_checkAdvancedAccuracyForARNFoldParsingTestPly,x_Thing) :- x_cid(a65b125d5903a2).
xc_microtheory(a65b125d5903a2,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a2,124).
xc_kb_names(a65b125d5903a2,[]).
xc_mapping_rows(a65b125d5903a2,[]).
x_arg2Isa(x_checkAdvancedAccuracyForARNFoldParsingTestPly,x_InformationBearingThing) :- x_cid(a65b125d5903a3).
xc_microtheory(a65b125d5903a3,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a3,125).
xc_kb_names(a65b125d5903a3,[]).
xc_mapping_rows(a65b125d5903a3,[]).
x_arg3Isa(x_checkAdvancedAccuracyForARNFoldParsingTestPly,x_AccessingAnIBT) :- x_cid(a65b125d5903a4).
xc_microtheory(a65b125d5903a4,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a4,126).
xc_kb_names(a65b125d5903a4,[]).
xc_mapping_rows(a65b125d5903a4,[]).
x_arg4Isa(x_checkAdvancedAccuracyForARNFoldParsingTestPly,x_Thing) :- x_cid(a65b125d5903a5).
xc_microtheory(a65b125d5903a5,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a5,127).
xc_kb_names(a65b125d5903a5,[]).
xc_mapping_rows(a65b125d5903a5,[]).
x_arg5Isa(x_checkAdvancedAccuracyForARNFoldParsingTestPly,x_GeneralizationPoolDisambiguationFamily) :- x_cid(a65b125d5903a6).
xc_microtheory(a65b125d5903a6,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a6,128).
xc_kb_names(a65b125d5903a6,[]).
xc_mapping_rows(a65b125d5903a6,[]).
x_comment(x_checkAdvancedAccuracyForARNFoldParsingTestPly,"(checkAdvancedAccuracyForARNFoldParsingTestPly ?trial ?source-text-name ?current-reading-name ?experiment-name ?library-name) checks the accurracy of the source text being\ndisambiguated and puts it in the trial's mt.") :- x_cid(a65b125d5903a7).
xc_microtheory(a65b125d5903a7,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a7,129).
xc_kb_names(a65b125d5903a7,[]).
xc_mapping_rows(a65b125d5903a7,[]).
x_preconditionForMethod(x_and('x_ist-Information'(x_LbrSourceTextsMt,x_goldStandardReadingOfSourceText(V1,V2)),x_outsourcedOnly(x_accuracyOfCurrentParsesComparedToGoldStandardAR(V1,V3,V4,V5,V6,V7))),x_methodForAction(x_checkAdvancedAccuracyForARNFoldParsingTestPly(V3,V2,V4,V5,V6),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_ExperimentalResults,x_accuracyOfCurrentDiscourseComparedToGoldStandard(V1,V3,V4,V7))))))) :- x_cid(a65b125d5903a8,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d5903a8,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a8,133).
xc_kb_names(a65b125d5903a8,["?gs-reading-name","?source-text-name","?trial","?current-reading-name","?experiment-name","?GCF-name","?acc"]).
xc_mapping_rows(a65b125d5903a8,[]).
x_isa(x_analogicalRecallParsingGenContextSuggestionsPlan,x_ComplexActionPredicate) :- x_cid(a65b125d5903a9).
xc_microtheory(a65b125d5903a9,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903a9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903a9,148).
xc_kb_names(a65b125d5903a9,[]).
xc_mapping_rows(a65b125d5903a9,[]).
x_arity(x_analogicalRecallParsingGenContextSuggestionsPlan,5) :- x_cid(a65b125d5903aa).
xc_microtheory(a65b125d5903aa,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903aa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903aa,149).
xc_kb_names(a65b125d5903aa,[]).
xc_mapping_rows(a65b125d5903aa,[]).
x_arg1Isa(x_analogicalRecallParsingGenContextSuggestionsPlan,x_CaseLibrary) :- x_cid(a65b125d5903ab).
xc_microtheory(a65b125d5903ab,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903ab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903ab,150).
xc_kb_names(a65b125d5903ab,[]).
xc_mapping_rows(a65b125d5903ab,[]).
x_arg2Isa(x_analogicalRecallParsingGenContextSuggestionsPlan,x_Microtheory) :- x_cid(a65b125d5903ac).
xc_microtheory(a65b125d5903ac,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903ac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903ac,151).
xc_kb_names(a65b125d5903ac,[]).
xc_mapping_rows(a65b125d5903ac,[]).
x_arg3Isa(x_analogicalRecallParsingGenContextSuggestionsPlan,x_InformationBearingThing) :- x_cid(a65b125d5903ad).
xc_microtheory(a65b125d5903ad,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903ad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903ad,152).
xc_kb_names(a65b125d5903ad,[]).
xc_mapping_rows(a65b125d5903ad,[]).
x_arg4Isa(x_analogicalRecallParsingGenContextSuggestionsPlan,x_AccessingAnIBT) :- x_cid(a65b125d5903ae).
xc_microtheory(a65b125d5903ae,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903ae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903ae,153).
xc_kb_names(a65b125d5903ae,[]).
xc_mapping_rows(a65b125d5903ae,[]).
x_arg5Isa(x_analogicalRecallParsingGenContextSuggestionsPlan,x_Microtheory) :- x_cid(a65b125d5903af).
xc_microtheory(a65b125d5903af,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903af,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903af,154).
xc_kb_names(a65b125d5903af,[]).
xc_mapping_rows(a65b125d5903af,[]).
x_comment(x_analogicalRecallParsingGenContextSuggestionsPlan,"(analogicalRecallParsingGenContextSuggestionsPlan ?case-library ?storage-mt ?source-text ?current-reading ?stubs-mt) makes disambiguation suggestions\nfor ?source-text based on which choices have analogical support from generalization contexts in ?gc-family.") :- x_cid(a65b125d5903b0).
xc_microtheory(a65b125d5903b0,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b0,155).
xc_kb_names(a65b125d5903b0,[]).
xc_mapping_rows(a65b125d5903b0,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_currentDiscourseId(V1)),x_evaluate(V2,x_TheClosedRetrievalSetOf(x_evidenceForChoiceInSentence(x_analogicalRecallParsingGenContextSuggestions(V3,V4),V5,V6,V7,V8),x_and('x_ist-Information'(x_DiscourseCaseFn(V1),x_choice(V9,V6,V5)),'x_ist-Information'(x_DiscourseCaseFn(V1),x_choiceSet(x_ChoiceSetFn(x_ParseTree,V10),V9)),x_favorFromAnalogicalParseRecallGenContext(V5,V9,V11,V4,V7),'x_ist-Information'(x_DiscourseCaseFn(V1),x_choiceSetFromSentence(V9,V8)),x_different(V7,x_ChoiceFavorFn(0.0)))))),x_methodForAction(x_analogicalRecallParsingGenContextSuggestionsPlan(V3,V12,V13,V14,V4),x_actionSequence(x_TheList(x_recordMembersInContext(V2,V12))))) :- x_cid(a65b125d5903b1,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b125d5903b1,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b1,158).
xc_kb_names(a65b125d5903b1,["?current-discourse-id","?evidence-set","?case-library","?stubs-mt","?choice","?choice-id","?favor-rating","?sentence","?choice-set-id","?span-token","?gen-context-family","?storage-mt","?source-text-name","?current-reading"]).
xc_mapping_rows(a65b125d5903b1,[]).
x_isa(x_dumpCurrentParsesAsGoldStandard,x_ComplexActionPredicate) :- x_cid(a65b125d5903b2).
xc_microtheory(a65b125d5903b2,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b2,179).
xc_kb_names(a65b125d5903b2,[]).
xc_mapping_rows(a65b125d5903b2,[]).
x_arity(x_dumpCurrentParsesAsGoldStandard,1) :- x_cid(a65b125d5903b3).
xc_microtheory(a65b125d5903b3,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b3,180).
xc_kb_names(a65b125d5903b3,[]).
xc_mapping_rows(a65b125d5903b3,[]).
x_arg1Isa(x_dumpCurrentParsesAsGoldStandard,x_InformationBearingThing) :- x_cid(a65b125d5903b4).
xc_microtheory(a65b125d5903b4,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b4,181).
xc_kb_names(a65b125d5903b4,[]).
xc_mapping_rows(a65b125d5903b4,[]).
x_comment(x_dumpCurrentParsesAsGoldStandard,"(dumpCurrentParsesAsGoldStandard ?source-text-name) attempts to record the\n currently selected parse for the discourse currently in working memory into the KB in a generated mt as a gold standard. \nThis is a perminent record.") :- x_cid(a65b125d5903b5).
xc_microtheory(a65b125d5903b5,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b5,182).
xc_kb_names(a65b125d5903b5,[]).
xc_mapping_rows(a65b125d5903b5,[]).
x_preconditionForMethod(x_generatedGoldStandardReadingName(V1,V2),x_methodForAction(x_dumpCurrentParsesAsGoldStandard(V1),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_LbrSourceTextsMt,x_microtheoryForSourceText(x_MtForSourceTextFn(V1),V1))),x_doRecord('x_ist-Information'(x_LbrSourceTextsMt,x_goldStandardReadingOfSourceText(V2,V1))),x_recordCurrentParseChoices(x_MtForSourceTextFn(V1),V1,V2),x_doAgentPlan(x_actionSequence(x_TheList(x_dumpReadingToFlatFile(V2),x_doTell(x_dumpFactToExperimentalDataFile('x_ist-Information'(x_LbrSourceTextsMt,x_goldStandardReadingOfSourceText(V2,V1)),"gold-standards.meld"))))))))) :- x_cid(a65b125d5903b6,V1,V2).
xc_microtheory(a65b125d5903b6,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b6,186).
xc_kb_names(a65b125d5903b6,["?source-text-name","?gs-reading-name"]).
xc_mapping_rows(a65b125d5903b6,[]).
x_isa(x_recordCurrentParseChoices,x_ComplexActionPredicate) :- x_cid(a65b125d5903b7).
xc_microtheory(a65b125d5903b7,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b7,202).
xc_kb_names(a65b125d5903b7,[]).
xc_mapping_rows(a65b125d5903b7,[]).
x_arity(x_recordCurrentParseChoices,3) :- x_cid(a65b125d5903b8).
xc_microtheory(a65b125d5903b8,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b8,203).
xc_kb_names(a65b125d5903b8,[]).
xc_mapping_rows(a65b125d5903b8,[]).
x_arg1Isa(x_recordCurrentParseChoices,x_Microtheory) :- x_cid(a65b125d5903b9).
xc_microtheory(a65b125d5903b9,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903b9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903b9,204).
xc_kb_names(a65b125d5903b9,[]).
xc_mapping_rows(a65b125d5903b9,[]).
x_arg2Isa(x_recordCurrentParseChoices,x_InformationBearingThing) :- x_cid(a65b125d5903ba).
xc_microtheory(a65b125d5903ba,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903ba,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903ba,205).
xc_kb_names(a65b125d5903ba,[]).
xc_mapping_rows(a65b125d5903ba,[]).
x_arg3Isa(x_recordCurrentParseChoices,x_AccessingAnIBT) :- x_cid(a65b125d5903bb).
xc_microtheory(a65b125d5903bb,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903bb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903bb,206).
xc_kb_names(a65b125d5903bb,[]).
xc_mapping_rows(a65b125d5903bb,[]).
x_comment(x_recordCurrentParseChoices,"(recordCurrentParseChoices ?microtheory ?source-text-name ?reading-name) attempts to record the\n currently selected parse choices for the discourse currently in working memory into the KB in ?microtheory. This is a persistant record.") :- x_cid(a65b125d5903bc).
xc_microtheory(a65b125d5903bc,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903bc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903bc,207).
xc_kb_names(a65b125d5903bc,[]).
xc_mapping_rows(a65b125d5903bc,[]).
x_isa(x_parseSelectedInSourceTextInReading,x_Predicate) :- x_cid(a65b125d5903bd).
xc_microtheory(a65b125d5903bd,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903bd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903bd,210).
xc_kb_names(a65b125d5903bd,[]).
xc_mapping_rows(a65b125d5903bd,[]).
x_arity(x_parseSelectedInSourceTextInReading,4) :- x_cid(a65b125d5903be).
xc_microtheory(a65b125d5903be,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903be,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903be,211).
xc_kb_names(a65b125d5903be,[]).
xc_mapping_rows(a65b125d5903be,[]).
x_comment(x_parseSelectedInSourceTextInReading,"(parseSelectedInSourceTextInReading ?selected-parse ?source-text-name ?reading-name ?sen-number) means that\n?selected-parse was selected in ?reading-name.") :- x_cid(a65b125d5903bf).
xc_microtheory(a65b125d5903bf,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903bf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903bf,212).
xc_kb_names(a65b125d5903bf,[]).
xc_mapping_rows(a65b125d5903bf,[]).
x_isa(x_condensedSelectedParsesFromCurrentDiscourse,x_Predicate) :- x_cid(a65b125d5903c0).
xc_microtheory(a65b125d5903c0,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c0,215).
xc_kb_names(a65b125d5903c0,[]).
xc_mapping_rows(a65b125d5903c0,[]).
x_arity(x_condensedSelectedParsesFromCurrentDiscourse,3) :- x_cid(a65b125d5903c1).
xc_microtheory(a65b125d5903c1,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c1,216).
xc_kb_names(a65b125d5903c1,[]).
xc_mapping_rows(a65b125d5903c1,[]).
x_comment(x_condensedSelectedParsesFromCurrentDiscourse,"Intended to be used as an outsourced predicate with the third argument open, \n(condensedSelectedParsesFromCurrentDiscourse ?source-text-name ?reading-name ?condensedSelectedParses) produces a set of facts of the form \n(parseSelectedInSourceTextInReading ?selected-parse ?source-text-name ?reading-name ?sen-number).") :- x_cid(a65b125d5903c2).
xc_microtheory(a65b125d5903c2,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c2,217).
xc_kb_names(a65b125d5903c2,[]).
xc_mapping_rows(a65b125d5903c2,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_currentDiscourseId(V1)),x_condensedSelectedParsesFromCurrentDiscourse(V2,V3,V4)),x_methodForAction(x_recordCurrentParseChoices(V5,V2,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V5,x_readingOfSourceText(V3,V2))),x_doAnnounce("Recording parse choices for the reading ~A.",[V3]),x_recordMembersInContext(V4,V5))))) :- x_cid(a65b125d5903c3,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5903c3,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c3,221).
xc_kb_names(a65b125d5903c3,["?discourse-id","?source-text-name","?reading-name","?condensedSelectedParses","?microtheory"]).
xc_mapping_rows(a65b125d5903c3,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 229, column 63), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d5903c3,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 229, column 63), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_storeParseChoiceSetCasePlansInGenContextForCurrentDiscourse,x_ComplexActionPredicate) :- x_cid(a65b125d5903c4).
xc_microtheory(a65b125d5903c4,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c4,232).
xc_kb_names(a65b125d5903c4,[]).
xc_mapping_rows(a65b125d5903c4,[]).
x_arity(x_storeParseChoiceSetCasePlansInGenContextForCurrentDiscourse,4) :- x_cid(a65b125d5903c5).
xc_microtheory(a65b125d5903c5,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c5,233).
xc_kb_names(a65b125d5903c5,[]).
xc_mapping_rows(a65b125d5903c5,[]).
x_arg1Isa(x_storeParseChoiceSetCasePlansInGenContextForCurrentDiscourse,x_CaseLibrary) :- x_cid(a65b125d5903c6).
xc_microtheory(a65b125d5903c6,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c6,234).
xc_kb_names(a65b125d5903c6,[]).
xc_mapping_rows(a65b125d5903c6,[]).
x_arg2Isa(x_storeParseChoiceSetCasePlansInGenContextForCurrentDiscourse,x_InformationBearingThing) :- x_cid(a65b125d5903c7).
xc_microtheory(a65b125d5903c7,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c7,235).
xc_kb_names(a65b125d5903c7,[]).
xc_mapping_rows(a65b125d5903c7,[]).
x_arg3Isa(x_storeParseChoiceSetCasePlansInGenContextForCurrentDiscourse,x_Microtheory) :- x_cid(a65b125d5903c8).
xc_microtheory(a65b125d5903c8,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c8,236).
xc_kb_names(a65b125d5903c8,[]).
xc_mapping_rows(a65b125d5903c8,[]).
x_arg4Isa(x_storeParseChoiceSetCasePlansInGenContextForCurrentDiscourse,x_AccessingAnIBT) :- x_cid(a65b125d5903c9).
xc_microtheory(a65b125d5903c9,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903c9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903c9,237).
xc_kb_names(a65b125d5903c9,[]).
xc_mapping_rows(a65b125d5903c9,[]).
x_comment(x_storeParseChoiceSetCasePlansInGenContextForCurrentDiscourse,"(storeParseChoiceSetCasePlansInGenContextForCurrentDiscourse ?case-library ?source-text ?stubs-mt ?reading) stores\nsome information about the lexical choice sets for the current discourse.") :- x_cid(a65b125d5903ca).
xc_microtheory(a65b125d5903ca,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903ca,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903ca,238).
xc_kb_names(a65b125d5903ca,[]).
xc_mapping_rows(a65b125d5903ca,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_currentDiscourseId(V1)),x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,x_and('x_ist-Information'(x_DiscourseCaseFn(V1),x_choiceSet(x_ChoiceSetFn(x_ParseTree,V4),V5)),'x_ist-Information'(x_DiscourseCaseFn(V1),x_selectedChoice(V5,V6,V3)))))),x_methodForAction(x_storeParseChoiceSetCasePlansInGenContextForCurrentDiscourse(V7,V8,V9,V10),x_actionSequence(x_TheList(x_doForEach(V11,V2,x_doTell(x_storeParsesInGenContext(V9,V11,V7))))))) :- x_cid(a65b125d5903cb,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125d5903cb,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903cb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903cb,248).
xc_kb_names(a65b125d5903cb,["?current-discourse-id","?selected-parses-in-discourse","?ptid","?span-token","?choice-set-id","?choice-id","?case-library","?source-text","?stubs-mt","?reading","?selected-tree"]).
xc_mapping_rows(a65b125d5903cb,[]).
x_isa(x_storeParsesInGenContext,x_Predicate) :- x_cid(a65b125d5903cc).
xc_microtheory(a65b125d5903cc,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903cc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903cc,269).
xc_kb_names(a65b125d5903cc,[]).
xc_mapping_rows(a65b125d5903cc,[]).
x_arity(x_storeParsesInGenContext,3) :- x_cid(a65b125d5903cd).
xc_microtheory(a65b125d5903cd,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903cd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903cd,270).
xc_kb_names(a65b125d5903cd,[]).
xc_mapping_rows(a65b125d5903cd,[]).
x_arg1Isa(x_storeParsesInGenContext,x_Microtheory) :- x_cid(a65b125d5903ce).
xc_microtheory(a65b125d5903ce,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903ce,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903ce,271).
xc_kb_names(a65b125d5903ce,[]).
xc_mapping_rows(a65b125d5903ce,[]).
x_arg2Isa(x_storeParsesInGenContext,x_ParseTree) :- x_cid(a65b125d5903cf).
xc_microtheory(a65b125d5903cf,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903cf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903cf,272).
xc_kb_names(a65b125d5903cf,[]).
xc_mapping_rows(a65b125d5903cf,[]).
x_arg3Isa(x_storeParsesInGenContext,x_Microtheory) :- x_cid(a65b125d5903d0).
xc_microtheory(a65b125d5903d0,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d0,273).
xc_kb_names(a65b125d5903d0,[]).
xc_mapping_rows(a65b125d5903d0,[]).
x_comment(x_storeParsesInGenContext,"(storeParsesInGenContext ?stubs-mt ?selected-tree ?case-library) is an outsourced predicate - a tell handler one - that writes\nstores parse information in ?case-library.") :- x_cid(a65b125d5903d1).
xc_microtheory(a65b125d5903d1,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d1,274).
xc_kb_names(a65b125d5903d1,[]).
xc_mapping_rows(a65b125d5903d1,[]).
x_isa(x_ParseTreeNodeTypeFn,x_FunctionOrFunctionalPredicate) :- x_cid(a65b125d5903d2).
xc_microtheory(a65b125d5903d2,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d2,279).
xc_kb_names(a65b125d5903d2,[]).
xc_mapping_rows(a65b125d5903d2,[]).
x_arity(x_ParseTreeNodeTypeFn,1) :- x_cid(a65b125d5903d3).
xc_microtheory(a65b125d5903d3,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d3,280).
xc_kb_names(a65b125d5903d3,[]).
xc_mapping_rows(a65b125d5903d3,[]).
x_arg1Isa(x_ParseTreeNodeTypeFn,x_Thing) :- x_cid(a65b125d5903d4).
xc_microtheory(a65b125d5903d4,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d4,281).
xc_kb_names(a65b125d5903d4,[]).
xc_mapping_rows(a65b125d5903d4,[]).
x_resultIsa(x_ParseTreeNodeTypeFn,x_Thing) :- x_cid(a65b125d5903d5).
xc_microtheory(a65b125d5903d5,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d5,282).
xc_kb_names(a65b125d5903d5,[]).
xc_mapping_rows(a65b125d5903d5,[]).
x_isa(x_rootOfSelectedParse,x_Predicate) :- x_cid(a65b125d5903d6).
xc_microtheory(a65b125d5903d6,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d6,284).
xc_kb_names(a65b125d5903d6,[]).
xc_mapping_rows(a65b125d5903d6,[]).
x_arity(x_rootOfSelectedParse,1) :- x_cid(a65b125d5903d7).
xc_microtheory(a65b125d5903d7,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d7,285).
xc_kb_names(a65b125d5903d7,[]).
xc_mapping_rows(a65b125d5903d7,[]).
x_comment(x_rootOfSelectedParse,"(rootOfSelectedParse ?x) means that ?x was the root of the selected parse in this case.") :- x_cid(a65b125d5903d8).
xc_microtheory(a65b125d5903d8,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d8,286).
xc_kb_names(a65b125d5903d8,[]).
xc_mapping_rows(a65b125d5903d8,[]).
x_isa(x_rootOfOurParse,x_Predicate) :- x_cid(a65b125d5903d9).
xc_microtheory(a65b125d5903d9,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903d9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903d9,288).
xc_kb_names(a65b125d5903d9,[]).
xc_mapping_rows(a65b125d5903d9,[]).
x_arity(x_rootOfOurParse,1) :- x_cid(a65b125d5903da).
xc_microtheory(a65b125d5903da,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903da,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903da,289).
xc_kb_names(a65b125d5903da,[]).
xc_mapping_rows(a65b125d5903da,[]).
x_comment(x_rootOfOurParse,"(rootOfOurParse ?x) means that ?x was the root of the parse under consideration in this case.") :- x_cid(a65b125d5903db).
xc_microtheory(a65b125d5903db,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903db,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903db,290).
xc_kb_names(a65b125d5903db,[]).
xc_mapping_rows(a65b125d5903db,[]).
x_isa(x_rootOfOtherParse,x_Predicate) :- x_cid(a65b125d5903dc).
xc_microtheory(a65b125d5903dc,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903dc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903dc,292).
xc_kb_names(a65b125d5903dc,[]).
xc_mapping_rows(a65b125d5903dc,[]).
x_arity(x_rootOfOtherParse,1) :- x_cid(a65b125d5903dd).
xc_microtheory(a65b125d5903dd,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903dd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903dd,293).
xc_kb_names(a65b125d5903dd,[]).
xc_mapping_rows(a65b125d5903dd,[]).
x_comment(x_rootOfOtherParse,"(rootOfOtherParse ?x) means that ?x was the root of the parse not under consideration in this case.") :- x_cid(a65b125d5903de).
xc_microtheory(a65b125d5903de,'x_Interaction-ManagerMt').
xc_source_file(a65b125d5903de,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/analogical-parsing-experiments.krf').
xc_source_line(a65b125d5903de,294).
xc_kb_names(a65b125d5903de,[]).
xc_mapping_rows(a65b125d5903de,[]).
kb_cache_footer(footer{count:78,digest:'0b0fedcf28cd2100c9842fbd2d142ad96d2e39a2dfdaa06d2b4740b8e3f98569',headerDigest:'42a66a64887d233f3aa0ba67cb014c5defedd7cce007992d1dedc5b8ebc4b2a3'}).
