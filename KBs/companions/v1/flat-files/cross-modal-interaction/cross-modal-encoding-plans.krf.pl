:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:20,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:190,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:bc0283ad382aef9cca1441f184a381284379b272c08c2f9b59d888c64972e757,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:9217,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf',sourceHash:'39db76a10ea3e798fffb39287b7b72f67b7f4e6207af90d87380982fb12cce5f',warnings:[]}).
x_isa(x_CrossModalEncodingPlansMt,x_ExperimentInfraStructureFn("Cross Modal Interaction")) :- x_cid(a65b125d0af73b).
xc_microtheory(a65b125d0af73b,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af73b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af73b,15).
xc_kb_names(a65b125d0af73b,[]).
xc_mapping_rows(a65b125d0af73b,[]).
'x_<=='(x_sketchForReferent(V1,V2),x_unifies(V1,x_ReferentInPerceptualSourceFn(V3,V4,V5,V2))) :- x_cid(a65b125d0af73c,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d0af73c,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af73c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af73c,17).
xc_kb_names(a65b125d0af73c,["?referent","?sketch","?selected-items","?layer","?subsketch"]).
xc_mapping_rows(a65b125d0af73c,[]).
'x_<=='(x_subsketchForReferent(V1,V2),x_unifies(V1,x_ReferentInPerceptualSourceFn(V3,V4,V2,V5))) :- x_cid(a65b125d0af73d,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d0af73d,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af73d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af73d,20).
xc_kb_names(a65b125d0af73d,["?referent","?subsketch","?selected-items","?layer","?sketch"]).
xc_mapping_rows(a65b125d0af73d,[]).
'x_<=='(x_layerForReferent(V1,V2),x_unifies(V1,x_ReferentInPerceptualSourceFn(V3,V2,V4,V5))) :- x_cid(a65b125d0af73e,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d0af73e,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af73e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af73e,23).
xc_kb_names(a65b125d0af73e,["?referent","?layer","?selected-items","?subsketch","?sketch"]).
xc_mapping_rows(a65b125d0af73e,[]).
'x_<=='(x_selectedItemsForReferent(V1,V2),x_unifies(V1,x_ReferentInPerceptualSourceFn(V2,V3,V4,V5))) :- x_cid(a65b125d0af73f,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d0af73f,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af73f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af73f,26).
xc_kb_names(a65b125d0af73f,["?referent","?selected-items","?layer","?subsketch","?sketch"]).
xc_mapping_rows(a65b125d0af73f,[]).
x_isa(x_encodeSketchReferent,x_ComplexActionPredicate) :- x_cid(a65b125d0af740).
xc_microtheory(a65b125d0af740,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af740,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af740,30).
xc_kb_names(a65b125d0af740,[]).
xc_mapping_rows(a65b125d0af740,[]).
x_arity(x_encodeSketchReferent,3) :- x_cid(a65b125d0af741).
xc_microtheory(a65b125d0af741,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af741,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af741,31).
xc_kb_names(a65b125d0af741,[]).
xc_mapping_rows(a65b125d0af741,[]).
x_preconditionForMethod(x_and(x_currentNuSketchHookup(V1),x_selectedItemsForReferent(V2,V3),x_currentSessionReasoner(V4)),x_methodForAction(x_encodeSketchReferent(V5,V6,V2),x_actionSequence(x_TheList(x_doMap(t(V7),x_enqueueSerialSubTasks(x_TheList(x_TheList(x_processVisualInput(V5,V6,V7),V1),x_TheList(x_encodeSketchObject(V5,V6,V7,V1),V4),x_TheList(x_encodeVisually(x_PerceptualReferentCaseFn(V5,V6,V7)),V4))),V3))))) :- x_cid(a65b125d0af742,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d0af742,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af742,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af742,36).
xc_kb_names(a65b125d0af742,["?nusketch-hookup-agent","?referent","?selected-items","?sr","?label","?dem-var","?item"]).
xc_mapping_rows(a65b125d0af742,[]).
x_isa(x_encodeSketchObject,x_ComplexActionPredicate) :- x_cid(a65b125d0af743).
xc_microtheory(a65b125d0af743,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af743,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af743,53).
xc_kb_names(a65b125d0af743,[]).
xc_mapping_rows(a65b125d0af743,[]).
x_arity(x_encodeSketchObject,4) :- x_cid(a65b125d0af744).
xc_microtheory(a65b125d0af744,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af744,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af744,54).
xc_kb_names(a65b125d0af744,[]).
xc_mapping_rows(a65b125d0af744,[]).
x_preconditionForMethod(x_isa(x_PerceptualReferentCaseFn(V1,V2,V3),x_PerceptualReferentWMMicrotheory),x_methodForAction(x_encodeSketchObject(V1,V4,V3,V5),x_actionSequence(x_TheList(x_doAnnounce("Have seen the object ~A pointing to ~A before",[V1,V3]),x_doTell(x_sameVisualEncodedObject(x_PerceptualReferentCaseFn(V1,V4,V3),x_PerceptualReferentCaseFn(V1,V2,V3))))))) :- x_cid(a65b125d0af745,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d0af745,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af745,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af745,56).
xc_kb_names(a65b125d0af745,["?label","?_ignore","?item","?dem-var","?nusketch-hookup-agent"]).
xc_mapping_rows(a65b125d0af745,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 64, column 65), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d0af745,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 64, column 65), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_isa(x_PerceptualReferentCaseFn(V1,V2,V3),x_PerceptualReferentWMMicrotheory)),x_holdsOnRemoteAgent(V4,'x_ist-Information'(x_BaseKB,x_caseForSubsketchItem(V3,V5))),x_evaluate(V6,x_TheClosedRetrievalSetOf(V7,x_holdsOnRemoteAgent(V4,x_wmOnly(x_lookupOnly('x_ist-Information'(x_FilteredFactsForItemMt(V1,V8,V3,V5),V7))))))),x_methodForAction(x_encodeSketchObject(V1,V8,V3,V4),x_actionSequence(x_TheList(x_doTell('x_ist-Information'(x_BaseKB,x_isa(x_PerceptualReferentCaseFn(V1,V8,V3),x_PerceptualReferentWMMicrotheory))),x_doMap(t(V7),x_doTell('x_ist-Information'(x_PerceptualReferentCaseFn(V1,V8,V3),V7)),V6))))) :- x_cid(a65b125d0af746,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d0af746,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af746,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af746,70).
xc_kb_names(a65b125d0af746,["?label","?_ignore","?item","?nusketch-hookup-agent","?subsketch-case","?facts","?fact","?dem-var"]).
xc_mapping_rows(a65b125d0af746,[]).
x_isa(x_createLabeledAbstraction,x_ComplexActionPredicate) :- x_cid(a65b125d0af747).
xc_microtheory(a65b125d0af747,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af747,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af747,109).
xc_kb_names(a65b125d0af747,[]).
xc_mapping_rows(a65b125d0af747,[]).
x_arity(x_createLabeledAbstraction,3) :- x_cid(a65b125d0af748).
xc_microtheory(a65b125d0af748,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af748,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af748,110).
xc_kb_names(a65b125d0af748,[]).
xc_mapping_rows(a65b125d0af748,[]).
x_comment(x_createLabeledAbstraction," insert comment ") :- x_cid(a65b125d0af749).
xc_microtheory(a65b125d0af749,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af749,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af749,111).
xc_kb_names(a65b125d0af749,[]).
xc_mapping_rows(a65b125d0af749,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ReferentInPerceptualSourceFn(V2,V3,V4,V5)),x_evaluate(V6,x_CardinalityFn(V2)),x_greaterThan(V6,1),x_evaluate(V7,x_SetToListFn(V2)),x_evaluate(V8,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V9,V10),x_encodingForObject(x_PerceptualReferentCaseFn(V11,V12,V9),V10))),V7)),x_evaluate(V13,x_FirstInListFn(V8)),x_evaluate(V14,x_RestOfListFn(V8))),x_methodForAction(x_createLabeledAbstraction(V11,V15,V1),x_actionSequence(x_TheList(x_doTell(x_enhanceCasesViaComparison(V8)),x_doClearDGroupCaches,x_doClearSMEs,x_doTell(x_nukeWMGpool(x_GenLabeledAbstractionContextFn(V11))),x_doTell(x_genlMt(x_GenLabeledAbstractionContextFn(V11),x_CrossModalInteractionSpindleMt)),x_doTell('x_ist-Information'(x_GenLabeledAbstractionContextFn(V11),x_sageWMSelectAndGeneralize(V13,x_GenLabeledAbstractionContextFn(V11)))),x_doTell('x_ist-Information'(x_GenLabeledAbstractionContextFn(V11),x_setWMGpoolAssimilationThreshold(x_GenLabeledAbstractionContextFn(V11),0.1))),x_doMap(t(V16),x_doTell('x_ist-Information'(x_GenLabeledAbstractionContextFn(V11),x_sageWMSelectAndGeneralize(V16,x_GenLabeledAbstractionContextFn(V11)))),V14),x_doAgentPlan(x_copyLabeledAbstraction(V2,V11)),x_doAnnounce("abstraction created for referent ~A",[V1]))))) :- x_cid(a65b125d0af74a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16).
xc_microtheory(a65b125d0af74a,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af74a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af74a,113).
xc_kb_names(a65b125d0af74a,["?referent","?referred-item-set","?_layer","?_subsketch","?_sketch","?cardinality","?ref-item-list","?encoded-cases","?ref","?encoding","?label","?_ignore","?first-encoding","?rest-of-cases","?dem-var","?enc"]).
xc_mapping_rows(a65b125d0af74a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 151, column 55), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d0af74a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 151, column 55), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_copyLabeledAbstraction,x_ComplexActionPredicate) :- x_cid(a65b125d0af74b).
xc_microtheory(a65b125d0af74b,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af74b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af74b,154).
xc_kb_names(a65b125d0af74b,[]).
xc_mapping_rows(a65b125d0af74b,[]).
x_arity(x_copyLabeledAbstraction,2) :- x_cid(a65b125d0af74c).
xc_microtheory(a65b125d0af74c,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af74c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af74c,155).
xc_kb_names(a65b125d0af74c,[]).
xc_mapping_rows(a65b125d0af74c,[]).
'x_<=='(x_filteredFactsByProbCutOff(V1,V2),x_unifies(x_SageGenFn(V3,V4),V1),x_lookupOnly(x_wmOnly('x_ist-Information'(V4,x_wmGpoolProbabilityCutOff(V4,V5)))),x_evaluate(V2,x_SetToListFn(x_TheClosedRetrievalSetOf(V6,x_lookupOnly(x_wmOnly('x_ist-Information'(V1,x_and(x_wmGpoolProbability(V6,V7),x_greaterThan(V7,V5))))))))) :- x_cid(a65b125d0af74d,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d0af74d,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af74d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af74d,163).
xc_kb_names(a65b125d0af74d,["?generalization","?facts","?_gen-no","?gen-context","?prob-cutoff","?fact","?fact-prob"]).
xc_mapping_rows(a65b125d0af74d,[]).
x_preconditionForMethod(x_filteredFactsByProbCutOff(x_SageGenFn(0,x_GenLabeledAbstractionContextFn(V1)),V2),x_methodForAction(x_copyLabeledAbstraction(V3,V1),x_actionSequence(x_TheList(x_doTell(x_isa(x_LabeledAbstractionFn(V1,V3),x_LabeledAbstractionWMMicrotheory)),x_doMap(t(V4),x_doTell('x_ist-Information'(x_LabeledAbstractionFn(V1,V3),V4)),V2),x_doAnnounce("Labeled abstraction created for label ~A and referent ~A",[V1,V3]))))) :- x_cid(a65b125d0af74e,V1,V2,V3,V4).
xc_microtheory(a65b125d0af74e,x_CrossModalEncodingPlansMt).
xc_source_file(a65b125d0af74e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/cross-modal-encoding-plans.krf').
xc_source_line(a65b125d0af74e,172).
xc_kb_names(a65b125d0af74e,["?label","?facts","?referred-item-set","?fact"]).
xc_mapping_rows(a65b125d0af74e,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 182, column 76), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d0af74e,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 182, column 76), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:20,digest:bc0283ad382aef9cca1441f184a381284379b272c08c2f9b59d888c64972e757,headerDigest:'6c88e4395ab3621514ac146c80e5c8f53632a99d6bc3f4e6c8ce95569f27a3f0'}).
