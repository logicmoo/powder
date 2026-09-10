:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:20,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:205,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'85ad66910323ac399c377d0a25030d99a2d1fe2b92f670d40de809d883548989',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:9054,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf',sourceHash:'4dfda992c5d939a980e437d9ded0cb052818d7b33d9cfdbe2324157cea702d18',warnings:[]}).
x_isa(x_VisualEncodingPlansMt,x_ExperimentInfraStructureFn("Cross Modal Interaction")) :- x_cid(a65b125d19e710).
xc_microtheory(a65b125d19e710,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e710,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e710,15).
xc_kb_names(a65b125d19e710,[]).
xc_mapping_rows(a65b125d19e710,[]).
x_isa(x_encodeVisually,x_ComplexActionPredicate) :- x_cid(a65b125d19e711).
xc_microtheory(a65b125d19e711,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e711,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e711,17).
xc_kb_names(a65b125d19e711,[]).
xc_mapping_rows(a65b125d19e711,[]).
x_arity(x_encodeVisually,1) :- x_cid(a65b125d19e712).
xc_microtheory(a65b125d19e712,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e712,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e712,18).
xc_kb_names(a65b125d19e712,[]).
xc_mapping_rows(a65b125d19e712,[]).
x_preconditionForMethod(x_and(x_isa(V1,x_PerceptualReferentWMMicrotheory),x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,x_wmOnly(x_lookupOnly('x_ist-Information'(V1,V3)))))),x_methodForAction(x_encodeVisually(V1),x_actionSequence(x_TheList(x_doSolve(x_remindedOf(V1,'x_Visual-Buffer',V4,V5,'x_SUB-EP-ID'),x_CrossModalInteractionSpindleMt),x_doAgentPlan(x_encodeObjectbyStrategy(V1)))))) :- x_cid(a65b125d19e713,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d19e713,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e713,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e713,21).
xc_kb_names(a65b125d19e713,["?object","?object-facts","?object-fact","?reminding","?mapping"]).
xc_mapping_rows(a65b125d19e713,[]).
x_isa(x_encodeObjectbyStrategy,x_ComplexActionPredicate) :- x_cid(a65b125d19e714).
xc_microtheory(a65b125d19e714,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e714,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e714,33).
xc_kb_names(a65b125d19e714,[]).
xc_mapping_rows(a65b125d19e714,[]).
x_arity(x_encodeObjectbyStrategy,1) :- x_cid(a65b125d19e715).
xc_microtheory(a65b125d19e715,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e715,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e715,34).
xc_kb_names(a65b125d19e715,[]).
xc_mapping_rows(a65b125d19e715,[]).
x_preconditionForMethod(x_and(x_wmOnly('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_remindedOf(V1,'x_Visual-Buffer',V2,V3,'x_SUB-EP-ID'))),x_different(V1,V2),x_kbOnly(x_currentEncodingWithRemindingStrategy(V4)),x_defaultNormalizationStrategy(x_Rerepresentation,V5)),x_methodForAction(x_encodeObjectbyStrategy(V1),x_actionSequence(x_TheList(x_doAgentPlan(x_doSolve(x_bestComparisonWith(x_WMCaseFn(V1),x_WMCaseFn(V2),0.6,V5,V6,V7),x_CrossModalInteractionSpindleMt)),x_doAgentPlan(x_encodeCase(V1,V4)))))) :- x_cid(a65b125d19e716,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d19e716,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e716,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e716,36).
xc_kb_names(a65b125d19e716,["?object","?object-reminding","?case-mapping","?strategy","?normalization-strategy","?mapping","?score"]).
xc_mapping_rows(a65b125d19e716,[]).
x_preconditionForMethod(x_and(x_wmOnly('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_remindedOf(V1,'x_Visual-Buffer',V2,V3,'x_SUB-EP-ID'))),x_uninferredSentence(x_different(V1,V2)),x_kbOnly(x_currentDefaultEncodingStrategy(V4))),x_methodForAction(x_encodeObjectbyStrategy(V1),x_actionSequence(x_TheList(x_doAgentPlan(x_encodeCase(V1,V4)))))) :- x_cid(a65b125d19e717,V1,V2,V3,V4).
xc_microtheory(a65b125d19e717,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e717,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e717,56).
xc_kb_names(a65b125d19e717,["?object","?object-reminding","?case-mapping","?strategy"]).
xc_mapping_rows(a65b125d19e717,[]).
x_isa(x_encodeCase,x_ComplexActionPredicate) :- x_cid(a65b125d19e718).
xc_microtheory(a65b125d19e718,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e718,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e718,68).
xc_kb_names(a65b125d19e718,[]).
xc_mapping_rows(a65b125d19e718,[]).
x_arity(x_encodeCase,2) :- x_cid(a65b125d19e719).
xc_microtheory(a65b125d19e719,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e719,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e719,69).
xc_kb_names(a65b125d19e719,[]).
xc_mapping_rows(a65b125d19e719,[]).
x_preconditionForMethod(x_and(x_wmOnly('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_remindedOf(V1,'x_Visual-Buffer',V2,V3,'x_SUB-EP-ID'))),x_defaultNormalizationStrategy(x_Reminding,V4),t(V4,V3,V5)),x_methodForAction(x_encodeCase(V1,x_IntersectionBasedEncoding),x_actionSequence(x_TheList(x_doAnnounce("~A has reminding ~A for encoding with score ~A and mapping ~A",[V1,V2,V5,V3]),x_doLog(x_remindingForSubEpisode('x_SUB-EP-ID',V1,V2,V5)),x_doAgentPlan(x_doTell('x_ist-Information'(x_IntersectionCaseFn(V1,V2),x_sageWMGeneralizeWithMapping(V1,x_IntersectionCaseFn(V1,V2),V2,V3)))),x_doAgentPlan(x_doTell(x_copyWMCase(x_SageGenFn(0,x_IntersectionCaseFn(V1,V2)),x_EncodedCaseFn(V1,'x_SUB-EP-ID')))))))) :- x_cid(a65b125d19e71a,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d19e71a,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e71a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e71a,71).
xc_kb_names(a65b125d19e71a,["?case","?case-reminding","?case-mapping","?normalization-strategy","?score"]).
xc_mapping_rows(a65b125d19e71a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 82, column 81), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d19e71a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 82, column 81), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_wmOnly('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_remindedOf(V1,'x_Visual-Buffer',V2,V3,'x_SUB-EP-ID'))),x_wmOnly('x_ist-Information'('x_Visual-Buffer',x_wmGpoolGeneralization('x_Visual-Buffer',V2,V4))),x_wmOnly(x_bestComparisonWith(x_WMCaseFn(V1),x_WMCaseFn(V2),V5,V6,V7,V8)),x_defaultNormalizationStrategy(x_Reminding,V9),t(V9,V7,V10)),x_methodForAction(x_encodeCase(V1,x_FreqIntersectionBasedEncoding),x_actionSequence(x_TheList(x_doAnnounce("~A has reminding ~A for encoding with score ~A and mapping ~A",[V1,V2,V10,V7]),x_doLog(x_remindingForSubEpisode('x_SUB-EP-ID',V1,V2,V10)),x_doAgentPlan(x_doTell('x_ist-Information'(x_IntersectionCaseFn(V1,V2),x_sageWMGeneralizeWithMapping(V1,x_IntersectionCaseFn(V1,V2),V2,V7)))),x_doAgentPlan(x_doTell(x_copyWMCase(x_SageGenFn(0,x_IntersectionCaseFn(V1,V2)),x_EncodedCaseFn(V1,'x_SUB-EP-ID')))))))) :- x_cid(a65b125d19e71b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125d19e71b,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e71b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e71b,90).
xc_kb_names(a65b125d19e71b,["?case","?case-reminding","?case-mapping","?seq","?rerep-threshold","?rerep-normalization-strategy","?rerep-mapping","?rerep-score","?normalization-strategy","?score"]).
xc_mapping_rows(a65b125d19e71b,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 109, column 81), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d19e71b,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 109, column 81), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_wmOnly('x_ist-Information'(x_CrossModalInteractionSpindleMt,x_remindedOf(V1,'x_Visual-Buffer',V2,V3,'x_SUB-EP-ID'))),x_wmOnly('x_ist-Information'('x_Visual-Buffer',x_wmGpoolExample('x_Visual-Buffer',V2,V4))),x_defaultNormalizationStrategy(x_Reminding,V5),t(V5,V3,V6)),x_methodForAction(x_encodeCase(V1,x_FreqIntersectionBasedEncoding),x_actionSequence(x_TheList(x_encodeCase(V1,x_DirectVisualEncoding))))) :- x_cid(a65b125d19e71c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d19e71c,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e71c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e71c,117).
xc_kb_names(a65b125d19e71c,["?case","?case-reminding","?case-mapping","?seq","?normalization-strategy","?score"]).
xc_mapping_rows(a65b125d19e71c,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_encodeCase(V1,x_DirectVisualEncoding),x_actionSequence(x_TheList(x_doAnnounce("No remindings for ~A, using default encoding",[V1]),x_doTell(x_copyWMCase(V1,x_EncodedCaseFn(V1,'x_SUB-EP-ID'))))))) :- x_cid(a65b125d19e71d,V1).
xc_microtheory(a65b125d19e71d,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e71d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e71d,132).
xc_kb_names(a65b125d19e71d,["?case"]).
xc_mapping_rows(a65b125d19e71d,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 138, column 64), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d19e71d,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 138, column 64), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_addExampleToVisualBuffer,x_ComplexActionPredicate) :- x_cid(a65b125d19e71e).
xc_microtheory(a65b125d19e71e,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e71e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e71e,162).
xc_kb_names(a65b125d19e71e,[]).
xc_mapping_rows(a65b125d19e71e,[]).
x_arity(x_addExampleToVisualBuffer,1) :- x_cid(a65b125d19e71f).
xc_microtheory(a65b125d19e71f,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e71f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e71f,163).
xc_kb_names(a65b125d19e71f,[]).
xc_mapping_rows(a65b125d19e71f,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_addExampleToVisualBuffer(V1),x_actionSequence(x_TheList(x_doAgentPlan(x_addExampleToGenlContext(V1,'x_Visual-Buffer')),x_doTell('x_ist-Information'('x_Visual-Buffer',x_setWMGpoolAssimilationThreshold('x_Visual-Buffer',0.5))),x_doTell('x_ist-Information'('x_Visual-Buffer',x_setWMGpoolMaxSize('x_Visual-Buffer',4))))))) :- x_cid(a65b125d19e720,V1).
xc_microtheory(a65b125d19e720,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e720,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e720,165).
xc_kb_names(a65b125d19e720,["?example"]).
xc_mapping_rows(a65b125d19e720,[]).
x_isa(x_addMappingToVisualBuffer,x_ComplexActionPredicate) :- x_cid(a65b125d19e721).
xc_microtheory(a65b125d19e721,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e721,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e721,175).
xc_kb_names(a65b125d19e721,[]).
xc_mapping_rows(a65b125d19e721,[]).
x_arity(x_addMappingToVisualBuffer,1) :- x_cid(a65b125d19e722).
xc_microtheory(a65b125d19e722,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e722,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e722,176).
xc_kb_names(a65b125d19e722,[]).
xc_mapping_rows(a65b125d19e722,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_addMappingToVisualBuffer(V1),x_actionSequence(x_TheList(x_addMappingToGenlContext(V1,'x_Visual-Buffer'))))) :- x_cid(a65b125d19e723,V1).
xc_microtheory(a65b125d19e723,x_VisualEncodingPlansMt).
xc_source_file(a65b125d19e723,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans.krf').
xc_source_line(a65b125d19e723,178).
xc_kb_names(a65b125d19e723,["?mapping"]).
xc_mapping_rows(a65b125d19e723,[]).
kb_cache_footer(footer{count:20,digest:'85ad66910323ac399c377d0a25030d99a2d1fe2b92f670d40de809d883548989',headerDigest:'35207ac3daf2e68b0dc90caeb77f34336b02c7801f377b0145616b582e0cda00'}).
