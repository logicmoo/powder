:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:20,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:148,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:a59d8391a1052bf455e88f33ca8e4a92a66759ec8e0c3379f083e90a69ada89f,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:6465,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf',sourceHash:'220e33530fda0d86336c32c7e4e066c93df0aaee575d8d1714d6f4306d110545',warnings:[]}).
x_isa(x_CrossModalSketchPlansMt,x_ExperimentInfraStructureFn("Cross Modal Interaction")) :- x_cid(a65b125d0e3b3e).
xc_microtheory(a65b125d0e3b3e,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b3e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b3e,15).
xc_kb_names(a65b125d0e3b3e,[]).
xc_mapping_rows(a65b125d0e3b3e,[]).
x_genlMt('x_Sketch-AgentMt',x_CrossModalSketchPlansMt) :- x_cid(a65b125d0e3b3f).
xc_microtheory(a65b125d0e3b3f,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b3f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b3f,17).
xc_kb_names(a65b125d0e3b3f,[]).
xc_mapping_rows(a65b125d0e3b3f,[]).
'x_<=='(x_caseForSubsketchItem(V1,V2),x_wmOnly(x_lookupOnly('x_ist-Information'(V3,x_glyphRepresentsObject(V1,V4)))),x_wmOnly(x_lookupOnly('x_ist-Information'(V5,x_isa(V4,x_NuSketchBundle)))),x_wmOnly(x_lookupOnly('x_ist-Information'(V6,x_subSketchGroupRepresentsObject(V4,V2))))) :- x_cid(a65b125d0e3b40,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d0e3b40,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b40,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b40,19).
xc_kb_names(a65b125d0e3b40,["?subsketch-glyph","?bcase","?_context1","?subsketch","?_context2","?_context3"]).
xc_mapping_rows(a65b125d0e3b40,[]).
'x_<=='(x_filterByCaseConstructor(V1,V2,V3),x_evaluate(V3,x_SetToListFn(x_TheClosedRetrievalSetOf(V4,x_outsourcedOnly(x_caseFact(t(V2,V1),V4)))))) :- x_cid(a65b125d0e3b41,V1,V2,V3,V4).
xc_microtheory(a65b125d0e3b41,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b41,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b41,27).
xc_kb_names(a65b125d0e3b41,["?mt","?case-constructor","?facts-list","?fact"]).
xc_mapping_rows(a65b125d0e3b41,[]).
'x_<=='(x_isaNuSketchBookKeepingFact(V1),x_evaluate(V2,x_Arg0Fn(V1)),'x_ist-Information'(x_NuSketchFilterInfoMt,x_isa(V2,x_NuSketchBookKeepingPredicate))) :- x_cid(a65b125d0e3b42,V1,V2).
xc_microtheory(a65b125d0e3b42,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b42,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b42,33).
xc_kb_names(a65b125d0e3b42,["?fact","?pred"]).
xc_mapping_rows(a65b125d0e3b42,[]).
'x_<=='(x_filterNuSketchBookkeepingFacts(V1,V2),x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,x_and(x_elementOf(V3,V1),x_uninferredSentence(x_isaNuSketchBookKeepingFact(V3)))))) :- x_cid(a65b125d0e3b43,V1,V2,V3).
xc_microtheory(a65b125d0e3b43,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b43,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b43,37).
xc_kb_names(a65b125d0e3b43,["?facts","?filtered-facts","?fact"]).
xc_mapping_rows(a65b125d0e3b43,[]).
x_isa(x_processVisualInput,x_ComplexActionPredicate) :- x_cid(a65b125d0e3b44).
xc_microtheory(a65b125d0e3b44,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b44,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b44,44).
xc_kb_names(a65b125d0e3b44,[]).
xc_mapping_rows(a65b125d0e3b44,[]).
x_arity(x_processVisualInput,3) :- x_cid(a65b125d0e3b45).
xc_microtheory(a65b125d0e3b45,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b45,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b45,45).
xc_kb_names(a65b125d0e3b45,[]).
xc_mapping_rows(a65b125d0e3b45,[]).
x_preconditionForMethod(x_and(x_currentlyActiveSketch(V1),x_agentForOpenSketch(V1,V2),x_holdsOnRemoteAgent(V2,x_caseForSubsketchItem(V3,V4)),x_localAgent(V5)),x_methodForAction(x_processVisualInput(V6,V7,V3),x_actionSequence(x_TheList(x_doTell('x_ist-Information'(x_BaseKB,x_caseForSubsketchItem(V3,V4))),x_enqueueSerialSubTasks(x_TheList(x_TheList(x_computeVisuoSpatialRelations(V4),V2),x_TheList(x_extractFilteredFacts(V6,V7,V3,V4),V5))))))) :- x_cid(a65b125d0e3b46,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d0e3b46,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b46,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b46,47).
xc_kb_names(a65b125d0e3b46,["?sketch","?sketch-agent","?item","?subsketch-case","?nusketch-hookup-agent","?label","?dem-var"]).
xc_mapping_rows(a65b125d0e3b46,[]).
x_isa(x_computeVisuoSpatialRelations,x_ComplexActionPredicate) :- x_cid(a65b125d0e3b47).
xc_microtheory(a65b125d0e3b47,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b47,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b47,62).
xc_kb_names(a65b125d0e3b47,[]).
xc_mapping_rows(a65b125d0e3b47,[]).
x_arity(x_computeVisuoSpatialRelations,1) :- x_cid(a65b125d0e3b48).
xc_microtheory(a65b125d0e3b48,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b48,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b48,63).
xc_kb_names(a65b125d0e3b48,[]).
xc_mapping_rows(a65b125d0e3b48,[]).
x_preconditionForMethod(x_uninferredSentence('x_ist-Information'(V1,x_visuoSpatialRelationsComputed(V1))),x_methodForAction(x_computeVisuoSpatialRelations(V1),x_actionSequence(x_TheList(x_doAnnounce("computing visuo spatial relations for subsketch ~A",[V1]),x_doComputeAllPositionalRelations(V1),x_doComputeShapeRelations(V1),x_doComputeShapeAttributes(V1),x_doTell('x_ist-Information'(V1,x_visuoSpatialRelationsComputed(V1))))))) :- x_cid(a65b125d0e3b49,V1).
xc_microtheory(a65b125d0e3b49,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b49,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b49,65).
xc_kb_names(a65b125d0e3b49,["?subsketch-case"]).
xc_mapping_rows(a65b125d0e3b49,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 71, column 70), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d0e3b49,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 71, column 70), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod('x_ist-Information'(V1,x_visuoSpatialRelationsComputed(V1)),x_methodForAction(x_computeVisuoSpatialRelations(V1),x_actionSequence(x_TheList(x_doAnnounce("Visuo spatial relations for ~A computed already",[V1]))))) :- x_cid(a65b125d0e3b4a,V1).
xc_microtheory(a65b125d0e3b4a,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b4a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b4a,78).
xc_kb_names(a65b125d0e3b4a,["?subsketch-case"]).
xc_mapping_rows(a65b125d0e3b4a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 84, column 67), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d0e3b4a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 84, column 67), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_extractFilteredFacts,x_ComplexActionPredicate) :- x_cid(a65b125d0e3b4b).
xc_microtheory(a65b125d0e3b4b,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b4b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b4b,87).
xc_kb_names(a65b125d0e3b4b,[]).
xc_mapping_rows(a65b125d0e3b4b,[]).
x_arity(x_extractFilteredFacts,4) :- x_cid(a65b125d0e3b4c).
xc_microtheory(a65b125d0e3b4c,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b4c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b4c,88).
xc_kb_names(a65b125d0e3b4c,[]).
xc_mapping_rows(a65b125d0e3b4c,[]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_isa(x_FilteredFactsForItemMt(V1,V2,V3,V4),x_FilteredWMMicrotheory)),x_currentlyActiveSketch(V5),x_unifies(x_GlyphFn(V6,V7),V3),x_agentForOpenSketch(V5,V8),x_holdsOnRemoteAgent(V8,x_evaluate(V9,x_SetToListFn(x_TheClosedRetrievalSetOf(V10,x_outsourcedOnly('x_ist-Information'(x_CrossModalSketchAnalogyControlMt,x_caseFact(x_SubSketchCaseFn(V4,V6),V10)))))))),x_methodForAction(x_extractFilteredFacts(V1,V11,V3,V4),x_actionSequence(x_TheList(x_doAnnounce("Filtering bookkeeping preds and extracting relevant facts for ~A",[V4]),x_doTell(x_isa(x_FilteredFactsForItemMt(V1,V11,V3,V4),x_FilteredWMMicrotheory)),x_doMap(t(V10),x_doTell('x_ist-Information'(x_FilteredFactsForItemMt(V1,V11,V3,V4),V10)),V9),x_doRemoteAgentPlan(V8,x_doDeselectGlyph(V3)))))) :- x_cid(a65b125d0e3b4d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125d0e3b4d,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b4d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b4d,90).
xc_kb_names(a65b125d0e3b4d,["?label","?_ignore","?item","?subsketch-case","?sketch","?subsketch-item","?_metalayer","?sketch-agent","?facts-list","?fact","?dem-var"]).
xc_mapping_rows(a65b125d0e3b4d,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 105, column 84), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d0e3b4d,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 105, column 84), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_isa(x_FilteredFactsForItemMt(V1,V2,V3,V4),x_FilteredWMMicrotheory),x_agentForOpenSketch(V5,V6)),x_methodForAction(x_extractFilteredFacts(V1,V7,V3,V4),x_actionSequence(x_TheList(x_doAnnounce("Filtered facts for ~A exists already",[V4]),x_doRemoteAgentPlan(V6,x_doDeselectGlyph(V3)))))) :- x_cid(a65b125d0e3b4e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d0e3b4e,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b4e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b4e,116).
xc_kb_names(a65b125d0e3b4e,["?label","?_ignore","?item","?subsketch-case","?sketch","?sketch-agent","?dem-var"]).
xc_mapping_rows(a65b125d0e3b4e,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 123, column 56), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d0e3b4e,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 123, column 56), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_selectWinningGlyph,x_ComplexActionPredicate) :- x_cid(a65b125d0e3b4f).
xc_microtheory(a65b125d0e3b4f,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b4f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b4f,128).
xc_kb_names(a65b125d0e3b4f,[]).
xc_mapping_rows(a65b125d0e3b4f,[]).
x_arity(x_selectWinningGlyph,1) :- x_cid(a65b125d0e3b50).
xc_microtheory(a65b125d0e3b50,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b50,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b50,129).
xc_kb_names(a65b125d0e3b50,[]).
xc_mapping_rows(a65b125d0e3b50,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_EncodedCaseFn(x_PerceptualReferentCaseFn(V2,V3,V4),'x_SUB-EP-ID')),x_currentlyActiveSketch(V5),x_agentForOpenSketch(V5,V6),x_currentNuSketchHookup(V7)),x_methodForAction(x_selectWinningGlyph(V1),x_actionSequence(x_TheList(x_doRemoteAgentPlan(V6,x_unhighlightAllHighlightedGlyphs),x_doRemoteAgentPlan(V6,x_doHighlightGlyph(V4)))))) :- x_cid(a65b125d0e3b51,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d0e3b51,x_CrossModalSketchPlansMt).
xc_source_file(a65b125d0e3b51,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-sketch-plans.krf').
xc_source_line(a65b125d0e3b51,131).
xc_kb_names(a65b125d0e3b51,["?winning-choice","?_label","?_var","?glyph-name","?sketch","?sketch-agent","?nusketch-hookup-agent"]).
xc_mapping_rows(a65b125d0e3b51,[]).
kb_cache_footer(footer{count:20,digest:a59d8391a1052bf455e88f33ca8e4a92a66759ec8e0c3379f083e90a69ada89f,headerDigest:c2cec77eb131ab73f9b4b3ff823a9a74cb392daa70f323a942c10edfd715aed0}).
