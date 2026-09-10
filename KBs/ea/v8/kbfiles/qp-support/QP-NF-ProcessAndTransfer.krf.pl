:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:17,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:292,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:e2ee9c176051c0222613fab4e765d8f81f19215a89d81c0aaed2a17a3b0ec5ae,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:14914,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf',sourceHash:'3853d8099a388996fd60ab68365e00c1bc1b5cdc696e1bc4f3d7b6a75b426be2',warnings:[]}).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfQuantityTransferFrame),x_bindAllDrsValuesForSid(V1,V4,V5,V6),'x_ist-Information'(x_NLPScratchPadFn(V4),x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3))) :- x_cid(a65b12695e3c2d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12695e3c2d,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c2d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c2d,19).
xc_kb_names(a65b12695e3c2d,["?sid","?narrative-event","?qt-frame","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b12695e3c2d,[]).
xc_exclude_globals(a65b12695e3c2d,true).
'x_<=='(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3),x_quantityTransferEvent(V4,V5,V6,V7),x_drsForDiscourse(V8),x_individualSatisfyingConditions(V3,x_QuantityTransferFrame,x_TheSet(x_quantityTransferEvent(V4,V5,V7))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_quantityTransferEvent(V4,V5,V7))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V3,x_QuantityTransferFrame)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_sourceOfTransfer(V3,V4)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_destOfTransfer(V3,V5)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_rateOfTransfer(V3,V7)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_rateOfTransfer(V3,V6)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12695e3c2e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12695e3c2e,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c2e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c2e,34).
xc_kb_names(a65b12695e3c2e,["?sid","?nevent","?qtframeid","?from-frame","?to-frame","?rate-frame1","?rate-frame","?ddrs-id"]).
xc_mapping_rows(a65b12695e3c2e,[]).
xc_exclude_globals(a65b12695e3c2e,true).
'x_<=='(x_quantityTransferEvent(V1,V2,V3,V4),x_drsForDiscourse(V5),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_sign(V6,x_Positive))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_sign(V7,x_Negative))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_constrained(V6,V2))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_constrained(V7,V1))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_constrainer(V6,V3))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_constrainer(V7,V4))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_quantityType(V2,V8))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_quantityType(V1,V8))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_entity(V3,V9)))) :- x_cid(a65b12695e3c2f,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12695e3c2f,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c2f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c2f,52).
xc_kb_names(a65b12695e3c2f,["?from-frame","?to-frame","?rate-frame1","?rate-frame2","?ddrs-id","?di-frame1","?di-frame2","?qtype","?event"]).
xc_mapping_rows(a65b12695e3c2f,[]).
xc_exclude_globals(a65b12695e3c2f,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfProcess),x_bindAllDrsValuesForSid(V1,V4,V5,V6),'x_ist-Information'(x_NLPScratchPadFn(V4),x_introducesProcessFrame(x_PresentationEventFn(V1,V2),V3))) :- x_cid(a65b12695e3c30,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12695e3c30,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c30,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c30,90).
xc_kb_names(a65b12695e3c30,["?sid","?narrative-event","?process-frame","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b12695e3c30,[]).
xc_exclude_globals(a65b12695e3c30,true).
'x_<=='(x_introducesProcessFrame(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_processEvent(V5))),x_individualSatisfyingConditions(V3,x_PhysicalProcessFrame,x_TheSet(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_processEvent(V5))))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_processEvent(V5))))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_PhysicalProcessFrame)),x_TheList(x_introducesProcessFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)),x_TheList(x_introducesProcessFrame(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12695e3c31,V1,V2,V3,V4,V5).
xc_microtheory(a65b12695e3c31,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c31,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c31,98).
xc_kb_names(a65b12695e3c31,["?sid","?narrative-event","?pframeid","?ddrs-id","?event-res"]).
xc_mapping_rows(a65b12695e3c31,[]).
xc_exclude_globals(a65b12695e3c31,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroducesProcessRole),x_bindAllDrsValuesForSid(V1,V4,V5,V6),'x_ist-Information'(x_NLPScratchPadFn(V4),x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))) :- x_cid(a65b12695e3c32,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12695e3c32,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c32,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c32,123).
xc_kb_names(a65b12695e3c32,["?sid","?narrative-event","?process-frame-role","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b12695e3c32,[]).
xc_exclude_globals(a65b12695e3c32,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_entity(V6,V5))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V6,x_Rate)),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V7,x_DirectInfluenceFrame)))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_constrainer(V7,V6))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_constrained(V7,V8))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_entity(V8,V9))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_diConsequence(V8,V10))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_true)),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_participant(V3,V9)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_consequence(V3,V7)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_consequence(V3,V10)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12695e3c33,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12695e3c33,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c33,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c33,132).
xc_kb_names(a65b12695e3c33,["?sid","?narrative-event","?pframeid","?ddrs-id","?event","?qframeid","?diframe","?entity-frame","?entity","?fact"]).
xc_mapping_rows(a65b12695e3c33,[]).
xc_exclude_globals(a65b12695e3c33,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V5,x_IndirectInfluenceFrame))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_constrainer(V5,V6))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_constrained(V5,V7))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_sign(V5,V8))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_true)),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_consequence(V3,V5)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12695e3c34,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12695e3c34,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c34,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c34,162).
xc_kb_names(a65b12695e3c34,["?sid","?narrative-event","?pframeid","?ddrs-id","?diframe","?qframeid","?entity-frame","?sign"]).
xc_mapping_rows(a65b12695e3c34,[]).
xc_exclude_globals(a65b12695e3c34,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)),x_uninferredSentence(x_stoppedEvent(V5)),x_uninferredSentence(x_potentialEvent(V1,V5)),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_status(V3,x_Active)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12695e3c35,V1,V2,V3,V4,V5).
xc_microtheory(a65b12695e3c35,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c35,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c35,179).
xc_kb_names(a65b12695e3c35,["?sid","?narrative-event","?pframeid","?ddrs-id","?event"]).
xc_mapping_rows(a65b12695e3c35,[]).
xc_exclude_globals(a65b12695e3c35,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)),x_stoppedEvent(V5),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_stoppedEvent(V5))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_status(V3,x_Inactive)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12695e3c36,V1,V2,V3,V4,V5).
xc_microtheory(a65b12695e3c36,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c36,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c36,195).
xc_kb_names(a65b12695e3c36,["?sid","?narrative-event","?pframeid","?ddrs-id","?event"]).
xc_mapping_rows(a65b12695e3c36,[]).
xc_exclude_globals(a65b12695e3c36,true).
'x_<=='(x_potentialEvent(V1,V2),x_contextIndependentDrsFor(V3,V1),'x_ist-Information'(x_DrsCaseFn(V3),x_possible(V4))) :- x_cid(a65b12695e3c37,V1,V2,V3,V4).
xc_microtheory(a65b12695e3c37,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c37,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c37,209).
xc_kb_names(a65b12695e3c37,["?sid","?event","?sdrs-id","?statement"]).
xc_mapping_rows(a65b12695e3c37,[]).
xc_exclude_globals(a65b12695e3c37,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)),x_uninferredSentence(x_stoppedEvent(V5)),x_potentialEvent(V1,V5),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_status(V3,x_Inactive)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12695e3c38,V1,V2,V3,V4,V5).
xc_microtheory(a65b12695e3c38,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c38,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c38,217).
xc_kb_names(a65b12695e3c38,["?sid","?narrative-event","?pframeid","?ddrs-id","?event"]).
xc_mapping_rows(a65b12695e3c38,[]).
xc_exclude_globals(a65b12695e3c38,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V1),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V6,V4)),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V7))),'x_ist-Information'(x_DrsCaseFn(V5),'x_causes-EventEvent'(V8,V7)),'x_ist-Information'(V6,x_ordinalRelationFrameForEventPossessive(V9,V10,V8,V1)),'x_ist-Information'(x_DrsCaseFn(V4),x_quantity1(V11,V9)),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet('x_ist-Information'(x_DrsCaseFn(V4),'x_causes-EventEvent'(V8,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_condition(V3,V11)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12695e3c39,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12695e3c39,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c39,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c39,238).
xc_kb_names(a65b12695e3c39,["?sid","?narrative-event","?pframeid","?ddrs-id","?sdrs-id","?dcase","?event","?compevent","?qf1","?qf2","?ordid"]).
xc_mapping_rows(a65b12695e3c39,[]).
xc_exclude_globals(a65b12695e3c39,true).
'x_<=='(x_stoppedEvent(V1),x_drsForDiscourse(V2),'x_ist-Information'(x_DrsCaseFn(V2),x_interrupts(V3,V1))) :- x_cid(a65b12695e3c3a,V1,V2,V3).
xc_microtheory(a65b12695e3c3a,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c3a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c3a,257).
xc_kb_names(a65b12695e3c3a,["?event","?ddrs-id","?stop"]).
xc_mapping_rows(a65b12695e3c3a,[]).
xc_exclude_globals(a65b12695e3c3a,true).
'x_<=='(x_stoppedEvent(V1),x_drsForDiscourse(V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V2),x_pathForEvent(V3,V4))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V2),x_entity(V3,V1))),'x_ist-Information'(x_DrsCaseFn(V2),x_objectOfStateChange(V5,V4)),'x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,V6)),x_allFactsAllowed(x_useTransitiveInference(x_genls(V6,x_SeparationEvent)))) :- x_cid(a65b12695e3c3b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12695e3c3b,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c3b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c3b,262).
xc_kb_names(a65b12695e3c3b,["?event","?ddrs-id","?tframe-id","?path","?event2","?event-type"]).
xc_mapping_rows(a65b12695e3c3b,[]).
xc_exclude_globals(a65b12695e3c3b,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_ApplicableAnalogy),x_bindAllDrsValuesForSid(V1,V4,V5,V6),'x_ist-Information'(x_NLPScratchPadFn(V4),x_ApplyAnalogy(x_PresentationEventFn(V1,V2),V3))) :- x_cid(a65b12695e3c3c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12695e3c3c,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c3c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c3c,272).
xc_kb_names(a65b12695e3c3c,["?sid","?narrative-event","?process-frame-role","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b12695e3c3c,[]).
xc_exclude_globals(a65b12695e3c3c,true).
'x_<=='(x_ApplyAnalogy(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_DiscourseCaseForDrs(V5,V4))) :- x_cid(a65b12695e3c3d,V1,V2,V3,V4,V5).
xc_microtheory(a65b12695e3c3d,x_QPInterpretationRulesMt).
xc_source_file(a65b12695e3c3d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-ProcessAndTransfer.krf').
xc_source_line(a65b12695e3c3d,280).
xc_kb_names(a65b12695e3c3d,["?sid","?narrative-event","?process-frame-role","?ddrs-id","?case"]).
xc_mapping_rows(a65b12695e3c3d,[]).
xc_exclude_globals(a65b12695e3c3d,true).
kb_cache_footer(footer{count:17,digest:e2ee9c176051c0222613fab4e765d8f81f19215a89d81c0aaed2a17a3b0ec5ae,headerDigest:'3f068e927b2ca6eb3bd06f71bc94a198e026ea1c5add1d89e3310928327b6783'}).
