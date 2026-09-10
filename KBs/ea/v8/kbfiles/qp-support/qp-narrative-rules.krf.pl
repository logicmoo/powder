:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:149,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:2302,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'46fd55c511e7d726a1c1ba5ae4a86efc4317864df01f4954a39948bb4bce7081',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:124287,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf',sourceHash:d62dd0bef9ceaad5ba8491e2d472f4a139b0b3f466561af71eaefa6cd652b5f0,warnings:[]}).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfQuantityEvent),x_introducesQPQuantityFrame(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c833d,V1,V2,V3).
xc_microtheory(a65b12697c833d,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c833d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c833d,49).
xc_kb_names(a65b12697c833d,["?sid","?narrative-event","?qpframe"]).
xc_mapping_rows(a65b12697c833d,[]).
xc_exclude_globals(a65b12697c833d,true).
'x_<=='(x_resolvedVar(V1,V2,V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),'x_ist-Information'(V5,x_filterByPreference(x_resolveReference(x_ReferenceInSentenceFn(V2,V1),x_ReferentInDrsFn(V3,V4))))) :- x_cid(a65b12697c833e,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c833e,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c833e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c833e,64).
xc_kb_names(a65b12697c833e,["?sid","?orig-var","?discourse-var","?ddrs-id","?dcase"]).
xc_mapping_rows(a65b12697c833e,[]).
xc_exclude_globals(a65b12697c833e,true).
'x_<=='(x_resolvedVar(V1,V2,V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),'x_ist-Information'(V5,x_uninferredSentence(x_filterByPreference(x_resolveReference(x_ReferenceInSentenceFn(V2,V1),x_ReferentInDrsFn(V3,V4))))),x_unifies(V2,V3)) :- x_cid(a65b12697c833f,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c833f,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c833f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c833f,74).
xc_kb_names(a65b12697c833f,["?sid","?orig-var","?discourse-var","?ddrs-id","?dcase"]).
xc_mapping_rows(a65b12697c833f,[]).
xc_exclude_globals(a65b12697c833f,true).
'x_<=='(x_isaQuantityReference(V1,V2,V3,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V7),x_contextIndependentDrsFor(V8,V1)),x_lookupOnly('x_ist-Information'(V9,x_quantityType(V6,V10))),x_different(V9,x_DrsCaseFn(V8)),x_kbOnly(x_useTransitiveInference('x_ist-Information'(x_QPInterpretationMt,x_genls(V2,V10)))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V6,V4)))) :- x_cid(a65b12697c8340,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c8340,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8340,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8340,91).
xc_kb_names(a65b12697c8340,["?sid","?qtype","?quantity","?entity","?etype","?qtframeid","?ddrs-id","?sdrs-id","?sdrs2","?qtype1"]).
xc_mapping_rows(a65b12697c8340,[]).
xc_exclude_globals(a65b12697c8340,true).
'x_<=='(x_isaQuantityReference(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_contextIndependentDrsFor(V8,V1)),x_lookupOnly('x_ist-Information'(V9,x_quantityType(V6,V10))),x_different(V9,x_DrsCaseFn(V8)),x_kbOnly(x_useTransitiveInference('x_ist-Information'(x_QPInterpretationMt,x_genls(V2,V10)))),x_unifies(V4,x_ContainedStuffFn(V11,x_default,V12)),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V6,x_ContainedStuffFn(V13,x_default,V12)))),'x_ist-Information'(x_DrsCaseFn(V7),x_isa(V13,V5))) :- x_cid(a65b12697c8341,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b12697c8341,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8341,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8341,104).
xc_kb_names(a65b12697c8341,["?sid","?qtype","?quantity","?entity","?etype","?qtframeid","?ddrs-id","?sdrs-id","?sdrs2","?qtype1","?subst","?e1","?subst2"]).
xc_mapping_rows(a65b12697c8341,[]).
xc_exclude_globals(a65b12697c8341,true).
'x_<=='(x_isaQuantityReference(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(x_DrsCaseFn(V7),x_contextIndependentDrsFor(V9,V1)),x_lookupOnly(x_diPredicate(V10,V11,V12,V13,V14,V15,V16)),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V6,V12))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V6,V17))),x_contextIndependentDrsFor(V18,V10),x_different(V18,V9),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_genls(V2,V17))),x_unifies(V17,x_Rate),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V6,V19))),x_resolvedVar(V1,V4,V20),'x_ist-Information'(x_DrsCaseFn(V18),x_primaryObjectMoving(V19,V4))) :- x_cid(a65b12697c8342,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20).
xc_microtheory(a65b12697c8342,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8342,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8342,117).
xc_kb_names(a65b12697c8342,["?sid","?qtype","?quantity","?entity","?etype","?qtframeid","?ddrs-id","?dcase","?sdrs-id","?sid2","?event2","?event-res2","?event-type2","?quantity2","?quantity-res2","?qtypedi","?qtype1","?sdrs-id2","?rate-event","?entity-res"]).
xc_mapping_rows(a65b12697c8342,[]).
xc_exclude_globals(a65b12697c8342,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_groundExpression(V2),x_groundExpression(V1),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),'x_ist-Information'(V5,x_drsEntailedBySentence(V2,V6)),x_getPotentialIsas(V6,V1,x_PhysicalQuantity,V3,x_WorldLikeOursCollectorMt,V4),'x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,V3)),x_groundExpression(V3)) :- x_cid(a65b12697c8343,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c8343,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8343,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8343,139).
xc_kb_names(a65b12697c8343,["?dv","?drs","?qtype","?ddrs-id","?dcase","?sid"]).
xc_mapping_rows(a65b12697c8343,[]).
xc_exclude_globals(a65b12697c8343,true).
'x_<=='(x_findQuantityInDrs(V1,V2,V3),x_drsForDiscourse(V4),x_groundExpression(V2),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),'x_ist-Information'(V5,x_drsEntailedBySentence(V2,V6)),x_getAllPotentialIsas(V6,V1,x_PhysicalQuantity,V3,x_WorldLikeOursCollectorMt,V4),'x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,V3)),x_groundExpression(V3)) :- x_cid(a65b12697c8344,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c8344,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8344,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8344,151).
xc_kb_names(a65b12697c8344,["?dv","?drs","?qtype","?ddrs-id","?dcase","?sid"]).
xc_mapping_rows(a65b12697c8344,[]).
xc_exclude_globals(a65b12697c8344,true).
'x_<=='(x_wrapEntity(V1,V2,V3),'x_ist-Information'(x_DrsCaseFn(V3),'x_in-UnderspecifiedContainer'(V1,V4)),x_unifies(V2,x_ContainedStuffFn(V1,x_default,V4))) :- x_cid(a65b12697c8345,V1,V2,V3,V4).
xc_microtheory(a65b12697c8345,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8345,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8345,164).
xc_kb_names(a65b12697c8345,["?entity-res","?entity-wrapped","?sdrs-id","?container"]).
xc_mapping_rows(a65b12697c8345,[]).
xc_exclude_globals(a65b12697c8345,true).
'x_<=='(x_wrapEntity(V1,V2,V3),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V3),'x_in-UnderspecifiedContainer'(V1,V4))),x_unifies(V1,V2)) :- x_cid(a65b12697c8346,V1,V2,V3,V4).
xc_microtheory(a65b12697c8346,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8346,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8346,173).
xc_kb_names(a65b12697c8346,["?entity-res","?entity-wrapped","?sdrs-id","?container"]).
xc_mapping_rows(a65b12697c8346,[]).
xc_exclude_globals(a65b12697c8346,true).
'x_<=='(x_introducesQPQuantityFrame(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_quantityTypeOfEntityFound(V1,V5,V6,V7,V8)),x_buildsQPFrame(V1,V5,V6,V7,V8,V3,V2),x_buildQPValues(V1,V5,V6,V7,V8,V3,V2)) :- x_cid(a65b12697c8347,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c8347,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8347,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8347,193).
xc_kb_names(a65b12697c8347,["?sid","?nevent","?qframeid","?ddrs-id","?qtype","?quantity","?entity","?etype"]).
xc_mapping_rows(a65b12697c8347,[]).
xc_exclude_globals(a65b12697c8347,true).
'x_<=='(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7),x_drsForDiscourse(V8),x_contextIndependentDrsFor(V9,V1),x_isaQuantityReference(V1,V2,V3,V4,V5,V6),x_groundExpression(V6),x_individualSatisfyingConditions(V7,x_IBTGeneration,x_TheSet(x_groundExpression(V6))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V9),x_referentToQFrame(V1,V6,V4,V3)),x_TheList(x_isaQuantityReference(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c8348,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12697c8348,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8348,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8348,204).
xc_kb_names(a65b12697c8348,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?ddrs-id","?sdrs-id"]).
xc_mapping_rows(a65b12697c8348,[]).
xc_exclude_globals(a65b12697c8348,true).
'x_<=='(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7),x_drsForDiscourse(V8),x_uninferredSentence(x_isaQuantityReference(V1,V2,V3,V4,V5,V6)),x_individualSatisfyingConditions(V6,x_QuantityFrame,x_TheSet(x_groundExpression(V3),x_groundExpression(V4))),x_individualSatisfyingConditions(V7,x_IBTGeneration,x_TheSet(x_groundExpression(V3),x_groundExpression(V4))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_entity(V6,V4)),x_TheList(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_quantityType(V6,V2)),x_TheList(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V6,x_QuantityFrame)),x_TheList(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_relatesToQTypeVar(V6,V3)),x_TheList(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7))))) :- x_cid(a65b12697c8349,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c8349,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8349,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8349,215).
xc_kb_names(a65b12697c8349,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?ddrs-id"]).
xc_mapping_rows(a65b12697c8349,[]).
xc_exclude_globals(a65b12697c8349,true).
'x_<=='(x_buildQPValues(V1,V2,V3,V4,V5,V6,V7),x_contextIndependentDrsFor(V8,V1),x_drsForDiscourse(V9),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V9),x_isaQuantityReference(V1,V2,V3,V4,V5,V6))),'x_ist-Information'(x_DrsCaseFn(V9),x_hasQuantityValue(V6,V10,V8))) :- x_cid(a65b12697c834a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c834a,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c834a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c834a,236).
xc_kb_names(a65b12697c834a,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?sdrs-id","?ddrs-id","?value"]).
xc_mapping_rows(a65b12697c834a,[]).
xc_exclude_globals(a65b12697c834a,true).
'x_<=='(x_buildQPValues(V1,V2,V3,V4,V5,V6,V7),x_contextIndependentDrsFor(V8,V1),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V8),x_isaQuantityReference(V1,V2,V3,V4,V5,V6)))) :- x_cid(a65b12697c834b,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c834b,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c834b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c834b,244).
xc_kb_names(a65b12697c834b,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?sdrs-id"]).
xc_mapping_rows(a65b12697c834b,[]).
xc_exclude_globals(a65b12697c834b,true).
'x_<=='(x_buildQPValues(V1,V2,V3,V4,V5,V6,V7),x_contextIndependentDrsFor(V8,V1),x_drsForDiscourse(V9),x_uninferredSentence(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V8),x_isaQuantityReference(V1,V2,V3,V4,V5,V6)))),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V9),x_hasQuantityValue(V6,V10,V8)))) :- x_cid(a65b12697c834c,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c834c,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c834c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c834c,249).
xc_kb_names(a65b12697c834c,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?sdrs-id","?ddrs-id","?value"]).
xc_mapping_rows(a65b12697c834c,[]).
xc_exclude_globals(a65b12697c834c,true).
'x_<=='(x_hasQuantityValue(V1,V2,V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V3),x_hasAmount(V5,t('x_denotesFunction-Underspecified'(V6,V7),V2))),x_quantityFrameWithQuantityTypeEntity(V1,V5,V8,V4),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_unitMeasuringThisQuantity(V8,V7))),x_hasQuantityUnit(V1,V7,V4),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantityValue(V1,V2)),x_TheList('x_ist-Information'(x_DrsCaseFn(V4),x_hasQuantityValue(V1,V2,V3))))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantityUnit(V1,V7)),x_TheList('x_ist-Information'(x_DrsCaseFn(V4),x_hasQuantityUnit(V1,V7,V4)))))) :- x_cid(a65b12697c834d,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c834d,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c834d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c834d,256).
xc_kb_names(a65b12697c834d,["?qframe","?value","?sdrs-id","?ddrs-id","?thing","?word","?unit","?qtype"]).
xc_mapping_rows(a65b12697c834d,[]).
xc_exclude_globals(a65b12697c834d,true).
'x_<=='(x_hasQuantityValue(V1,V2,V3),x_drsForDiscourse(V4),x_quantityFrameWithQuantityTypeEntity(V1,V5,V6,V4),'x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V1,V2)),x_allFactsAllowed('x_ist-Information'(x_UniversalVocabularyMt,x_isa(V2,x_GenericQuantity))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantityValue(V1,V2)),x_TheList('x_ist-Information'(x_DrsCaseFn(V4),x_hasQuantityValue(V1,V2,V3)))))) :- x_cid(a65b12697c834e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c834e,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c834e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c834e,266).
xc_kb_names(a65b12697c834e,["?qframe","?value","?sdrs-id","?ddrs-id","?thing","?qtype"]).
xc_mapping_rows(a65b12697c834e,[]).
xc_exclude_globals(a65b12697c834e,true).
'x_<=='(x_hasQuantityUnit(V1,V2,V3),x_quantityFrameWithQuantityTypeEntity(V1,V4,V5,V3),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_unitMeasuringThisQuantity(V5,V2)))) :- x_cid(a65b12697c834f,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c834f,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c834f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c834f,274).
xc_kb_names(a65b12697c834f,["?qframe","?unit","?ddrs-id","?thing","?qtype"]).
xc_mapping_rows(a65b12697c834f,[]).
xc_exclude_globals(a65b12697c834f,true).
'x_<=='(x_quantityFrameWithQuantityTypeEntity(V1,V2,V3,V4),'x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V3)),'x_ist-Information'(x_DrsCaseFn(V4),x_entity(V1,V2))) :- x_cid(a65b12697c8350,V1,V2,V3,V4).
xc_microtheory(a65b12697c8350,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8350,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8350,279).
xc_kb_names(a65b12697c8350,["?qframe","?thing","?qtype","?ddrs-id"]).
xc_mapping_rows(a65b12697c8350,[]).
xc_exclude_globals(a65b12697c8350,true).
'x_<=='(x_quantityFrameWithQuantityTypeEntity(V1,V2,V3,V4),'x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V3)),'x_ist-Information'(x_DrsCaseFn(V4),x_entity(V1,x_ContainedStuffFn(V5,V6,V2)))) :- x_cid(a65b12697c8351,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c8351,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8351,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8351,283).
xc_kb_names(a65b12697c8351,["?qframe","?thing","?qtype","?ddrs-id","?subst","?form"]).
xc_mapping_rows(a65b12697c8351,[]).
xc_exclude_globals(a65b12697c8351,true).
'x_<=='(x_qlabel(V1),x_true) :- x_cid(a65b12697c8352,V1).
xc_microtheory(a65b12697c8352,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8352,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8352,295).
xc_kb_names(a65b12697c8352,["?x"]).
xc_mapping_rows(a65b12697c8352,[]).
xc_exclude_globals(a65b12697c8352,true).
'x_<=='(x_fixPolysemy1(V1),x_true) :- x_cid(a65b12697c8353,V1).
xc_microtheory(a65b12697c8353,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8353,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8353,313).
xc_kb_names(a65b12697c8353,["?qtype"]).
xc_mapping_rows(a65b12697c8353,[]).
xc_exclude_globals(a65b12697c8353,true).
'x_<=='(x_fixPolysemy2(V1),x_unifies(V1,x_MeasurableQuantityFn(x_cityFoodProduction))) :- x_cid(a65b12697c8354,V1).
xc_microtheory(a65b12697c8354,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8354,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8354,316).
xc_kb_names(a65b12697c8354,["?qtype"]).
xc_mapping_rows(a65b12697c8354,[]).
xc_exclude_globals(a65b12697c8354,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1)),'x_ist-Information'(x_DrsCaseFn(V8),x_possessiveRelation(V9,V10)),x_quantityInDrs(V10,V8,V2),x_fixPolysemy2(V2),x_resolvedVar(V1,V9,V11),x_resolvedVar(V1,V10,V3),x_groundExpression(V11),x_groundExpression(V3),x_validQPEntity(V1,V2,V9,V5,V6),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V9,V5)))),'x_ist-Information'(V7,x_wrapEntity(V11,V4,V8)),'x_ist-Information'(V7,x_qlabel(1))) :- x_cid(a65b12697c8355,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8355,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8355,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8355,324).
xc_kb_names(a65b12697c8355,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?entity-res"]).
xc_mapping_rows(a65b12697c8355,[]).
xc_exclude_globals(a65b12697c8355,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1)),'x_ist-Information'(x_DrsCaseFn(V8),x_possessiveRelation(V9,V10)),x_quantityInDrs(V10,V8,V2),x_fixPolysemy2(V2),x_resolvedVar(V1,V9,V11),x_resolvedVar(V1,V10,V3),x_groundExpression(V11),x_groundExpression(V3),x_validQPEntity(V1,V2,V9,V5,V6),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V9,V5)))),'x_ist-Information'(V7,x_wrapEntity(V11,V4,V8)),'x_ist-Information'(V7,x_qlabel(1))) :- x_cid(a65b12697c8356,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8356,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8356,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8356,342).
xc_kb_names(a65b12697c8356,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?entity-res"]).
xc_mapping_rows(a65b12697c8356,[]).
xc_exclude_globals(a65b12697c8356,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1)),'x_ist-Information'(x_DrsCaseFn(V8),x_possessiveRelation(V9,V10)),x_quantityInDrs(V10,V8,V2),x_uninferredSentence(x_fixPolysemy2(V2)),x_fixPolysemy1(V2),x_resolvedVar(V1,V9,V11),x_resolvedVar(V1,V10,V3),x_groundExpression(V11),x_groundExpression(V3),x_validQPEntity(V1,V2,V9,V5,V6),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V9,V5)))),'x_ist-Information'(V7,x_wrapEntity(V11,V4,V8)),'x_ist-Information'(V7,x_qlabel(1))) :- x_cid(a65b12697c8357,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8357,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8357,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8357,358).
xc_kb_names(a65b12697c8357,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?entity-res"]).
xc_mapping_rows(a65b12697c8357,[]).
xc_exclude_globals(a65b12697c8357,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1)),x_C1,x_is,x_a,'x_cylinder.',x_findQuantityInDrs(V9,V8,V2),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V9,V2))),'x_ist-Information'(V7,x_dvSpanInParseTree(V9,x_SpanFn(V10,V11),V12)),'x_ist-Information'(V7,x_dvSpanInParseTree(V13,x_SpanFn(V14,V10),V12)),x_getPotentialIsas(V1,V13,x_SomethingExisting,V5,x_WorldLikeOursCollectorMt,V6),x_wmOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V13,V5)))),x_resolvedVar(V1,V13,V15),x_resolvedVar(V1,V9,V3),x_groundExpression(V15),x_groundExpression(V3),'x_ist-Information'(V7,x_wrapEntity(V15,V4,V8))) :- x_cid(a65b12697c8358,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15).
xc_microtheory(a65b12697c8358,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8358,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8358,389).
xc_kb_names(a65b12697c8358,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?ddrs-id","?dcase","?sdrs-id","?quantity","?num2","?num3","?parse-tree","?entity","?num1","?entity-res"]).
xc_mapping_rows(a65b12697c8358,[]).
xc_exclude_globals(a65b12697c8358,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1)),'x_ist-Information'(x_DrsCaseFn(V8),x_possessiveRelation(V9,V10)),x_resolvedVar(V1,V9,V11),x_resolvedVar(V1,V10,V3),x_getPotentialIsas(V1,V10,x_LiquidTangibleThing,V5,x_WorldLikeOursCollectorMt,V6),'x_ist-Information'(x_DrsCaseFn(V8),x_isa(V3,V5)),x_unifies(V4,x_ContainedStuffFn(V3,x_default,V11)),x_unifies(V2,x_Amount)) :- x_cid(a65b12697c8359,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8359,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8359,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8359,415).
xc_kb_names(a65b12697c8359,["?sid","?qtype","?quantity-res","?entity-wrapped","?chem","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?entity-res"]).
xc_mapping_rows(a65b12697c8359,[]).
xc_exclude_globals(a65b12697c8359,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_qlabel(1),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1)),'x_ist-Information'(x_DrsCaseFn(V8),'x_in-UnderspecifiedContainer'(V9,V10)),x_groundExpression(V9),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V8),x_possessiveRelation(V11,V9))),x_quantityInDrs(V9,V8,V2),'x_ist-Information'(x_DrsCaseFn(V8),x_isa(V9,V2)),x_groundExpression(V10),x_validQPEntity(V1,V2,V10,V5,V6),x_wmOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V10,V5)))),x_resolvedVar(V1,V10,V12),x_resolvedVar(V1,V9,V3),'x_ist-Information'(V7,x_wrapEntity(V12,V4,V8)),x_qlabel(5)) :- x_cid(a65b12697c835a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12697c835a,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c835a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c835a,433).
xc_kb_names(a65b12697c835a,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?ddrs-id","?dcase","?sdrs-id","?quantity","?entity","?entity2","?entity-res"]).
xc_mapping_rows(a65b12697c835a,[]).
xc_exclude_globals(a65b12697c835a,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1)),'x_ist-Information'(x_DrsCaseFn(V8),'x_contains-Underspecified'(V9,V10)),x_groundExpression(V9),x_groundExpression(V10),x_localOnly('x_ist-Information'(x_DrsCaseFn(V8),x_hasAmount(V11,V12))),x_getPotentialIsas(V1,V10,x_LiquidTangibleThing,V5,x_WorldLikeOursCollectorMt,V6),x_wmOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V10,V5)))),x_resolvedVar(V1,V9,V13),x_resolvedVar(V1,V10,V3),x_unifies(V2,x_Amount),x_unifies(V4,x_ContainedStuffFn(V3,x_default,V13))) :- x_cid(a65b12697c835b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b12697c835b,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c835b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c835b,456).
xc_kb_names(a65b12697c835b,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?container","?amount","?entity-res"]).
xc_mapping_rows(a65b12697c835b,[]).
xc_exclude_globals(a65b12697c835b,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1)),x_getAllPotentialBinPreds(V1,V9,x_MeasurableQuantitySlot,V10,x_WorldLikeOursCollectorMt),x_different(V10,x_isa),'x_ist-Information'(x_DrsCaseFn(V8),t(V10,V9,V11)),x_groundExpression(V9),x_groundExpression(V11),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_isa(V2,x_QuantityType))),x_kbOnly('x_ist-Information'(x_UniversalVocabularyMt,x_isa(V11,V2))),x_getPotentialIsas(V1,V9,x_PartiallyTangible,V5,x_WorldLikeOursCollectorMt,V6),x_wmOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V9,V5)))),x_resolvedVar(V1,V9,V4),x_resolvedVar(V1,V11,V3),'x_ist-Information'(V7,x_wrapEntity(V4,V12,V8))) :- x_cid(a65b12697c835c,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12697c835c,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c835c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c835c,499).
xc_kb_names(a65b12697c835c,["?sid","?qtype","?quantity-res","?entity-res","?etype","?ddrs-id","?dcase","?sdrs-id","?entity","?pred","?quantity","?entity-wrapped"]).
xc_mapping_rows(a65b12697c835c,[]).
xc_exclude_globals(a65b12697c835c,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1)),x_getAllPotentialBinPreds(V1,V9,x_PhysicalAmountSlot,V10,x_WorldLikeOursCollectorMt),x_different(V10,x_isa),'x_ist-Information'(x_DrsCaseFn(V8),t(V10,V9,V11)),x_groundExpression(V9),x_groundExpression(V11),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_isa(V2,x_QuantityType))),x_kbOnly('x_ist-Information'(x_UniversalVocabularyMt,x_isa(V11,V2))),x_getPotentialIsas(V1,V9,x_PartiallyTangible,V5,x_WorldLikeOursCollectorMt,V6),x_wmOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V9,V5)))),x_resolvedVar(V1,V9,V4),x_unifies(V2,x_AmountFn(V3)),x_resolvedVar(V1,V11,V3),'x_ist-Information'(V7,x_wrapEntity(V4,V12,V8))) :- x_cid(a65b12697c835d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12697c835d,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c835d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c835d,524).
xc_kb_names(a65b12697c835d,["?sid","?qtype","?quantity-res","?entity-res","?etype","?ddrs-id","?dcase","?sdrs-id","?entity","?pred","?quantity","?entity-wrapped"]).
xc_mapping_rows(a65b12697c835d,[]).
xc_exclude_globals(a65b12697c835d,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_discourseCaseForDrs(V7,V6),'x_ist-Information'(V7,x_contextIndependentDrsFor(V8,V1))) :- x_cid(a65b12697c835e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c835e,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c835e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c835e,548).
xc_kb_names(a65b12697c835e,["?sid","?qtype","?quantity-res","?entity-res","?etype","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b12697c835e,[]).
xc_exclude_globals(a65b12697c835e,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfDirectInfluenceEvent),x_drsForDiscourse(V4),x_introducesDIFrame(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c835f,V1,V2,V3,V4).
xc_microtheory(a65b12697c835f,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c835f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c835f,578).
xc_kb_names(a65b12697c835f,["?sid","?narrative-event","?diframe","?ddrs-id"]).
xc_mapping_rows(a65b12697c835f,[]).
xc_exclude_globals(a65b12697c835f,true).
'x_<=='(x_introducesDIFrame(x_PresentationEventFn(V1,V2),V3),x_contextIndependentDrsFor(V4,V1),x_drsForDiscourse(V5),x_diPredicate(V1,V6,V7,V8,V9,V10,V11),'x_directInfluence-'(V1,V6,V7,V9,V11,V12),x_individualSatisfyingConditions(V3,x_DirectInfluenceFrame,x_TheSet('x_directInfluence-'(V1,V6,V7,V9,V11,V12))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet('x_directInfluence-'(V1,V6,V7,V9,V11,V12))),x_genOrFindRateFrame(V1,V7,V3),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V3,x_DirectInfluenceFrame)),x_TheList(x_introducesDIFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V5),x_constrained(V3,V12)),x_TheList(x_introducesDIFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V5),x_sign(V3,x_Negative)),x_TheList(x_introducesDIFrame(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c8360,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12697c8360,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8360,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8360,587).
xc_kb_names(a65b12697c8360,["?sid","?nevent","?diframeid","?sdrs-id","?ddrs-id","?event","?event-res","?event-type","?quantity","?quantity-res","?qtype","?src-frame"]).
xc_mapping_rows(a65b12697c8360,[]).
xc_exclude_globals(a65b12697c8360,true).
'x_<=='(x_introducesDIFrame(x_PresentationEventFn(V1,V2),V3),x_contextIndependentDrsFor(V4,V1),x_drsForDiscourse(V5),x_diPredicate(V1,V6,V7,V8,V9,V10,V11),'x_directInfluence+'(V1,V6,V7,V9,V11,V12),x_individualSatisfyingConditions(V3,x_DirectInfluenceFrame,x_TheSet('x_directInfluence+'(V1,V6,V7,V9,V11,V12))),x_genOrFindRateFrame(V1,V7,V3),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet('x_directInfluence+'(V1,V6,V7,V9,V11,V12))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V3,x_DirectInfluenceFrame)),x_TheList(x_introducesDIFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V5),x_constrained(V3,V12)),x_TheList(x_introducesDIFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V5),x_sign(V3,x_Positive)),x_TheList(x_introducesDIFrame(x_PresentationEventFn(V1,V2),V3)))),x_genOrFindRateFrame(V1,V7,V3)) :- x_cid(a65b12697c8361,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12697c8361,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8361,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8361,610).
xc_kb_names(a65b12697c8361,["?sid","?nevent","?diframeid","?sdrs-id","?ddrs-id","?event","?event-res","?event-type","?quantity","?quantity-res","?qtype","?src-frame"]).
xc_mapping_rows(a65b12697c8361,[]).
xc_exclude_globals(a65b12697c8361,true).
'x_<=='(x_genOrFindRateFrame(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V1),x_individualSatisfyingConditions(V6,x_QuantityFrame,x_TheSet(x_isa(V3,x_DirectInfluenceFrame))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V6,x_QuantityFrame)),x_TheList(x_genOrFindRateFrame(V1,V2,V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V6,x_Rate)),x_TheList(x_genOrFindRateFrame(V1,V2,V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_entity(V6,V2)),x_TheList(x_genOrFindRateFrame(V1,V2,V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_constrainer(V3,V6)),x_TheList(x_genOrFindRateFrame(V1,V2,V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_rateOfTransfer(V3,V6)),x_TheList(x_genOrFindRateFrame(V1,V2,V3))))) :- x_cid(a65b12697c8362,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c8362,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8362,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8362,637).
xc_kb_names(a65b12697c8362,["?sid","?event-res","?diframeid","?ddrs-id","?sdrs-id","?rateframeid"]).
xc_mapping_rows(a65b12697c8362,[]).
xc_exclude_globals(a65b12697c8362,true).
'x_<=='(x_diPredicate(V1,V2,V3,V4,V5,V6,V7),x_drsForDiscourse(V8),x_contextIndependentDrsFor(V9,V1),x_getAllPotentialIsas(V1,V2,x_PhysicalProcess,V4,x_QPInterpretationMt,V8),'x_ist-Information'(x_DrsCaseFn(V9),x_isa(V2,V4)),x_subDIFind(V9,V10,V2,V5),x_resolvedVar(V1,V5,V6),x_quantityInDrs(V5,V9,V7),x_resolvedVar(V1,V2,V3),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_processEvent(V3)),x_TheList(x_diPredicate(V1,V2,V3,V4,V5,V6,V7))))) :- x_cid(a65b12697c8363,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c8363,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8363,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8363,664).
xc_kb_names(a65b12697c8363,["?sid","?event","?event-res","?event-type","?quantity","?quantity-res","?qtype","?ddrs-id","?sdrs-id","?pred"]).
xc_mapping_rows(a65b12697c8363,[]).
xc_exclude_globals(a65b12697c8363,true).
'x_<=='(x_subDIFind(V1,V2,V3,V4),'x_ist-Information'(x_DrsCaseFn(V1),x_primaryObjectMoving(V3,V4)),x_unifies(V2,x_primaryObjectMoving)) :- x_cid(a65b12697c8364,V1,V2,V3,V4).
xc_microtheory(a65b12697c8364,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8364,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8364,692).
xc_kb_names(a65b12697c8364,["?sdrs-id","?pred","?event","?quantity"]).
xc_mapping_rows(a65b12697c8364,[]).
xc_exclude_globals(a65b12697c8364,true).
'x_<=='(x_subDIFind(V1,V2,V3,V4),'x_ist-Information'(x_DrsCaseFn(V1),x_objectActedOn(V3,V4)),x_unifies(V2,x_objectActedOn)) :- x_cid(a65b12697c8365,V1,V2,V3,V4).
xc_microtheory(a65b12697c8365,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8365,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8365,698).
xc_kb_names(a65b12697c8365,["?sdrs-id","?pred","?event","?quantity"]).
xc_mapping_rows(a65b12697c8365,[]).
xc_exclude_globals(a65b12697c8365,true).
'x_<=='(x_subDIFind(V1,V2,V3,V4),'x_ist-Information'(x_DrsCaseFn(V1),x_transferredObject(V3,V4)),x_unifies(V2,x_transferredObject)) :- x_cid(a65b12697c8366,V1,V2,V3,V4).
xc_microtheory(a65b12697c8366,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8366,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8366,704).
xc_kb_names(a65b12697c8366,["?sdrs-id","?pred","?event","?quantity"]).
xc_mapping_rows(a65b12697c8366,[]).
xc_exclude_globals(a65b12697c8366,true).
'x_<=='(x_diPredicate(V1,V2,V3,V4,V5,V6,V7),x_drsForDiscourse(V8),x_contextIndependentDrsFor(V9,V1),x_getAllPotentialIsas(V1,V2,x_PhysicalProcess,V4,x_QPInterpretationMt,V8),'x_ist-Information'(x_DrsCaseFn(V9),x_isa(V2,V4)),x_subDIFind(V9,V10,V2,V5),x_genericQuantityReference(V5,V9,V7,V11,V12),x_resolvedVar(V1,V2,V3),x_resolvedVar(V1,V5,V6),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_processEvent(V3)),x_TheList(x_genericQuantityReference(V5,V9,V7,V11,V12))))) :- x_cid(a65b12697c8367,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12697c8367,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8367,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8367,720).
xc_kb_names(a65b12697c8367,["?sid","?event","?event-res","?event-type","?quantity","?quantity-res","?qtype","?ddrs-id","?sdrs-id","?pred","?new-qtype","?substance"]).
xc_mapping_rows(a65b12697c8367,[]).
xc_exclude_globals(a65b12697c8367,true).
'x_<=='(x_diPredicate(V1,V2,V3,V4,V5,V6,V7),x_drsForDiscourse(V8),x_contextIndependentDrsFor(V9,V1),'x_ist-Information'(x_DrsCaseFn(V9),x_isa(V2,x_IntrinsicStateChangeEvent)),x_unifies(x_EventType,x_IntrinsicStateChangeEvent),'x_ist-Information'(x_DrsCaseFn(V9),x_objectOfStateChange(V2,V5)),x_quantityInDrs(V5,V9,V7),x_resolvedVar(V1,V2,V3),x_resolvedVar(V1,V5,V6),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_processEvent(V3)),x_TheList(x_diPredicate(V1,V2,V3,V10,x_quantity,V6,V7))))) :- x_cid(a65b12697c8368,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c8368,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8368,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8368,743).
xc_kb_names(a65b12697c8368,["?sid","?event","?event-res","?event-type","?quantity","?quantity-res","?qtype","?ddrs-id","?sdrs-id","?event-type?"]).
xc_mapping_rows(a65b12697c8368,[]).
xc_exclude_globals(a65b12697c8368,true).
'x_<=='(x_diPredicate(V1,V2,V3,V4,V5,V6,V7),x_drsForDiscourse(V8),'x_ist-Information'(x_DrsCaseFn(V8),x_discourseCaseForDrs(V9,V8)),'x_ist-Information'(V9,x_drsEntailedBySentence(V10,V1)),'x_ist-Information'(x_DrsCaseFn(V10),x_isa(V2,x_Buying)),x_unifies(V4,x_Buying),'x_ist-Information'(V9,x_drsEntailedBySentence(V11,V1)),'x_ist-Information'(x_DrsCaseFn(V11),x_objectPaidFor(V2,V5)),x_quantityInDrs(V5,V11,V7),x_resolvedVar(V1,V2,V3),x_resolvedVar(V1,V5,V6),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_processEvent(V3)),x_TheList(x_diPredicate(V1,V2,V3,V4,V5,V6,V7))))) :- x_cid(a65b12697c8369,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8369,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8369,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8369,759).
xc_kb_names(a65b12697c8369,["?sid","?event","?event-res","?event-type","?quantity","?quantity-res","?qtype","?ddrs-id","?dcase","?sdrs-id","?sdrs-id2"]).
xc_mapping_rows(a65b12697c8369,[]).
xc_exclude_globals(a65b12697c8369,true).
'x_<=='(x_genericQuantityReference(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_groundExpression(V2),x_groundExpression(V1),x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_quantityType(V7,V3)))),x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_isa(V8,V9)))),'x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,V9)),x_groundExpression(V9),x_different(V1,V8),x_unifies(V3,t(V10,V1)),x_unifies(V4,t(V10,V8))) :- x_cid(a65b12697c836a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c836a,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c836a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c836a,833).
xc_kb_names(a65b12697c836a,["?dv","?drs","?qtype","?new-qtype","?entity","?ddrs-id","?qpframe","?quant-var","?quant","?func"]).
xc_mapping_rows(a65b12697c836a,[]).
xc_exclude_globals(a65b12697c836a,true).
'x_<=='(x_genericQuantityReference(V1,V2,V3,V4,V5),x_groundExpression(V2),x_groundExpression(V1),x_drsForDiscourse(V6),x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_quantityType(V7,V3)))),x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_entity(V7,x_ContainedStuffFn(V5,x_default,V8))))),x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_isa(V9,V10)))),'x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,V10)),x_groundExpression(V10),'x_ist-Information'(x_DrsCaseFn(V6),x_isa(V5,V10)),x_different(V1,V9),x_unifies(V4,V3)) :- x_cid(a65b12697c836b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c836b,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c836b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c836b,861).
xc_kb_names(a65b12697c836b,["?dv","?drs","?qtype","?new-qtype","?entity","?ddrs-id","?qpframe","?container","?quant-var","?quant"]).
xc_mapping_rows(a65b12697c836b,[]).
xc_exclude_globals(a65b12697c836b,true).
'x_<=='('x_directInfluence-'(V1,V2,V3,V4,V5,V6),x_genSourceFrame(V1,V2,V3,V4,V5,V6)) :- x_cid(a65b12697c836c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c836c,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c836c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c836c,880).
xc_kb_names(a65b12697c836c,["?sid","?event","?event-res","?quantity","?qtype","?src-frame"]).
xc_mapping_rows(a65b12697c836c,[]).
xc_exclude_globals(a65b12697c836c,true).
'x_<=='('x_directInfluence+'(V1,V2,V3,V4,V5,V6),x_genToFrame(V1,V2,V3,V4,V5,V6)) :- x_cid(a65b12697c836d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c836d,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c836d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c836d,883).
xc_kb_names(a65b12697c836d,["?sid","?event","?event-res","?quantity","?qtype","?to-frame"]).
xc_mapping_rows(a65b12697c836d,[]).
xc_exclude_globals(a65b12697c836d,true).
'x_<=='(x_genSourceFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(V8,x_drsEntailedBySentence(V9,V1)),'x_ist-Information'(x_DrsCaseFn(V9),'x_from-UnderspecifiedLocation'(V2,V10)),x_resolvedVar(V1,V10,V11),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V12,V11))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V12,V13))),x_genericQuantityReference(V4,V9,V5,V13,V14),x_unifies(V6,V12),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_diConsequence(V6,'x_from-UnderspecifiedLocation'(V2,V10))),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c836e,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b12697c836e,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c836e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c836e,911).
xc_kb_names(a65b12697c836e,["?sid","?event","?event-res","?quantity","?qtype","?src-frame","?ddrs-id","?dcase","?sdrs-id","?src","?src-res","?sourceframeid","?existingQ","?quantity2"]).
xc_mapping_rows(a65b12697c836e,[]).
xc_exclude_globals(a65b12697c836e,true).
'x_<=='(x_genSourceFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(V8,x_drsEntailedBySentence(V9,V1)),'x_ist-Information'(x_DrsCaseFn(V9),'x_from-UnderspecifiedLocation'(V2,V10)),x_resolvedVar(V1,V10,V11),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V12,x_ContainedStuffFn(V13,x_default,V10)))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V12,V14))),x_genericQuantityReference(V4,V9,V5,V14,V13),x_unifies(V6,V12),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_diConsequence(V6,'x_from-UnderspecifiedLocation'(V2,V10))),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c836f,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b12697c836f,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c836f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c836f,929).
xc_kb_names(a65b12697c836f,["?sid","?event","?event-res","?quantity","?qtype","?src-frame","?ddrs-id","?dcase","?sdrs-id","?src","?src-res","?sourceframeid","?quantity2","?existingQ"]).
xc_mapping_rows(a65b12697c836f,[]).
xc_exclude_globals(a65b12697c836f,true).
'x_<=='(x_genSourceFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(V8,x_drsEntailedBySentence(V9,V1)),'x_ist-Information'(x_DrsCaseFn(V9),'x_from-UnderspecifiedLocation'(V2,V10)),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V11,V5))),x_uninferredSentence(x_genericQuantityReference(V4,V9,V5,V12,V13)),x_individualSatisfyingConditions(V14,x_QuantityFrame,x_TheSet('x_ist-Information'(x_DrsCaseFn(V9),'x_from-UnderspecifiedLocation'(V2,V10)))),x_resolvedVar(V1,V10,V15),x_unifies(V6,V14),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V14,V15)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V14,V5)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V14,x_QuantityFrame)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_relatesToQTypeVar(V14,V4)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_diConsequence(V6,'x_from-UnderspecifiedLocation'(V2,V10))),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c8370,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15).
xc_microtheory(a65b12697c8370,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8370,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8370,951).
xc_kb_names(a65b12697c8370,["?sid","?event","?event-res","?quantity","?qtype","?src-frame","?ddrs-id","?dcase","?sdrs-id","?src","?1sourceframeid","?existingQ","?quantity2","?sourceframeid","?src-res"]).
xc_mapping_rows(a65b12697c8370,[]).
xc_exclude_globals(a65b12697c8370,true).
'x_<=='(x_genSourceFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(V8,x_drsEntailedBySentence(V9,V1)),'x_ist-Information'(x_DrsCaseFn(V9),x_objectOfStateChange(V2,V4)),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V10,V5))),x_uninferredSentence(x_genericQuantityReference(V4,V9,V5,V11,V12)),x_individualSatisfyingConditions(V13,x_QuantityFrame,x_TheSet('x_ist-Information'(x_DrsCaseFn(V9),x_objectOfStateChange(V2,V4)))),x_resolvedVar(V1,V14,V15),x_unifies(V6,V13),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V13,V4)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V13,V5)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V13,x_QuantityFrame)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_relatesToQTypeVar(V13,V4)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_diConsequence(V6,x_objectOfStateChange(V2,V4))),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c8371,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15).
xc_microtheory(a65b12697c8371,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8371,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8371,977).
xc_kb_names(a65b12697c8371,["?sid","?event","?event-res","?quantity","?qtype","?src-frame","?ddrs-id","?dcase","?sdrs-id","?1sourceframeid","?existingQ","?quantity2","?sourceframeid","?src","?src-res"]).
xc_mapping_rows(a65b12697c8371,[]).
xc_exclude_globals(a65b12697c8371,true).
'x_<=='(x_genSourceFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(V8,x_drsEntailedBySentence(V9,V1)),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V10,V5))),x_uninferredSentence(x_genericQuantityReference(V4,V9,V5,V11,V12)),'x_ist-Information'(x_DrsCaseFn(V9),x_isa(V2,x_Buying)),'x_ist-Information'(x_DrsCaseFn(V9),x_buyer(V2,V13)),x_individualSatisfyingConditions(V14,x_QuantityFrame,x_TheSet('x_ist-Information'(x_DrsCaseFn(V9),x_buyer(V2,V13)))),x_unifies(V6,V14),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V14,x_possessedStuffFn(x_Money,V13))),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V14,x_Ammount)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V14,x_QuantityFrame)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_relatesToQTypeVar(V14,V4)),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_diConsequence(V6,x_buyer(V2,V13))),x_TheList(x_genSourceFrame(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c8372,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b12697c8372,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8372,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8372,1002).
xc_kb_names(a65b12697c8372,["?sid","?event","?event-res","?quantity","?qtype","?src-frame","?ddrs-id","?dcase","?sdrs-id","?1sourceframeid","?existingQ","?quantity2","?person","?sourceframeid"]).
xc_mapping_rows(a65b12697c8372,[]).
xc_exclude_globals(a65b12697c8372,true).
'x_<=='(x_genToFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(V8,x_drsEntailedBySentence(V9,V1)),'x_ist-Information'(x_DrsCaseFn(V9),'x_to-UnderspecifiedLocation'(V2,V10)),x_resolvedVar(V1,V10,V11),x_buildOrMakeToFrame(V4,V1,V9,V5,V10,V11,V6,V2,V3)) :- x_cid(a65b12697c8373,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8373,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8373,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8373,1087).
xc_kb_names(a65b12697c8373,["?sid","?event","?event-res","?quantity","?qtype","?to-frame","?ddrs-id","?dcase","?sdrs-id","?dst","?dst-res"]).
xc_mapping_rows(a65b12697c8373,[]).
xc_exclude_globals(a65b12697c8373,true).
'x_<=='(x_buildOrMakeToFrame(V1,V2,V3,V4,V5,V6,V7,V8,V9),x_drsForDiscourse(V10),'x_ist-Information'(x_DrsCaseFn(V3),'x_to-UnderspecifiedLocation'(V8,V5)),x_uninferredSentence(x_genericQuantityReference(V1,V3,V4,V11,V12)),x_individualSatisfyingConditions(V13,x_QuantityFrame,x_TheSet('x_ist-Information'(x_DrsCaseFn(V3),'x_to-UnderspecifiedLocation'(V8,V5)))),x_unifies(V7,V13),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V10),x_entity(V13,V6)),x_TheList(x_genToFrame(V2,V8,V9,V1,V4,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V10),x_quantityType(V13,V4)),x_TheList(x_genToFrame(V2,V8,V9,V1,V4,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V10),x_isa(V13,x_QuantityFrame)),x_TheList(x_genToFrame(V2,V8,V9,V1,V4,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V10),x_relatesToQTypeVar(V13,V1)),x_TheList(x_genToFrame(V2,V8,V9,V1,V4,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V10),x_quantityType(V13,V4)),x_TheList(x_genToFrame(V2,V8,V9,V1,V4,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V10),x_diConsequence(V7,'x_to-UnderspecifiedLocation'(V8,V5))),x_TheList(x_genToFrame(V2,V8,V9,V1,V4,V7))))) :- x_cid(a65b12697c8374,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b12697c8374,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8374,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8374,1095).
xc_kb_names(a65b12697c8374,["?quantity","?sid","?sdrs-id","?qtype","?dst","?dst-res","?to-frame","?event","?event-res","?ddrs-id","?existingQ","?quantity2","?toframeid"]).
xc_mapping_rows(a65b12697c8374,[]).
xc_exclude_globals(a65b12697c8374,true).
'x_<=='(x_buildOrMakeToFrame(V1,V2,V3,V4,V5,V6,V7,V8,V9),x_drsForDiscourse(V10),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V10),x_entity(V11,V6))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V10),x_quantityType(V11,V12))),x_genericQuantityReference(V1,V3,V4,V12,V13),x_unifies(V7,V11),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V10),x_diConsequence(V7,'x_to-UnderspecifiedLocation'(V8,V5))),x_TheList(x_genToFrame(V2,V8,V9,V1,V4,V7))))) :- x_cid(a65b12697c8375,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b12697c8375,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8375,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8375,1118).
xc_kb_names(a65b12697c8375,["?quantity","?sid","?sdrs-id","?qtype","?dst","?dst-res","?to-frame","?event","?event-res","?ddrs-id","?toframeid","?existingQ","?quantity2"]).
xc_mapping_rows(a65b12697c8375,[]).
xc_exclude_globals(a65b12697c8375,true).
'x_<=='(x_buildOrMakeToFrame(V1,V2,V3,V4,V5,V6,V7,V8,V9),x_drsForDiscourse(V10),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V10),x_entity(V11,x_ContainedStuffFn(V12,x_default,V6)))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V10),x_quantityType(V11,V13))),x_genericQuantityReference(V1,V3,V4,V13,V12),x_unifies(V7,V11),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V10),x_diConsequence(V7,'x_to-UnderspecifiedLocation'(V8,V5))),x_TheList(x_genToFrame(V2,V8,V9,V1,V4,V7))))) :- x_cid(a65b12697c8376,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b12697c8376,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8376,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8376,1129).
xc_kb_names(a65b12697c8376,["?quantity","?sid","?sdrs-id","?qtype","?dst","?dst-res","?to-frame","?event","?event-res","?ddrs-id","?toframeid","?quantity2","?existingQ"]).
xc_mapping_rows(a65b12697c8376,[]).
xc_exclude_globals(a65b12697c8376,true).
'x_<=='(x_genToFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),x_contextIndependentDrsFor(V8,V1),'x_ist-Information'(x_DrsCaseFn(V8),x_toState(V2,V9)),x_quantityInDrs(V9,V8,V10),x_uninferredSentence(x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V11,V10))))),x_uninferredSentence(x_genericQuantityReference(V9,V8,V10,V12,V13)),x_individualSatisfyingConditions(V14,x_QuantityFrame,x_TheSet('x_ist-Information'(x_DrsCaseFn(V8),x_toState(V2,V9)))),x_resolvedVar(V1,V15,V16),x_unifies(V6,V14),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V14,V9)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V14,V10)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V14,x_QuantityFrame)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_relatesToQTypeVar(V14,V9)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_diConsequence(V6,x_toState(V2,V9))),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c8377,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16).
xc_microtheory(a65b12697c8377,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8377,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8377,1143).
xc_kb_names(a65b12697c8377,["?sid","?event","?event-res","?quantity","?qtype","?to-frame","?ddrs-id","?sdrs-id","?quant2","?qtype2","?1toframeid","?existingQ","?quantity2","?toframeid","?dst","?dst-res"]).
xc_mapping_rows(a65b12697c8377,[]).
xc_exclude_globals(a65b12697c8377,true).
'x_<=='(x_genToFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(V8,x_drsEntailedBySentence(V9,V1)),'x_ist-Information'(x_DrsCaseFn(V9),'x_to-UnderspecifiedLocation'(V2,V10)),x_resolvedVar(V1,V10,V11),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V12,V11))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V12,V13))),x_genericQuantityReference(V4,V9,V5,V13),x_unifies(V6,V12),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_diConsequence(V6,'x_to-UnderspecifiedLocation'(V2,V10))),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c8378,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b12697c8378,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8378,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8378,1173).
xc_kb_names(a65b12697c8378,["?sid","?event","?event-res","?quantity","?qtype","?to-frame","?ddrs-id","?dcase","?sdrs-id","?dst","?dst-res","?toframeid","?existingQ"]).
xc_mapping_rows(a65b12697c8378,[]).
xc_exclude_globals(a65b12697c8378,true).
'x_<=='(x_genToFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(V8,x_drsEntailedBySentence(V9,V1)),'x_ist-Information'(x_DrsCaseFn(V9),x_isa(V2,x_Buying)),'x_ist-Information'(x_DrsCaseFn(V9),x_toPossessor(V2,V10)),x_uninferredSentence(x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V11,V5))))),x_uninferredSentence(x_genericQuantityReference(V12,V9,V5,V13,V4)),x_individualSatisfyingConditions(V14,x_QuantityFrame,x_TheSet('x_ist-Information'(x_DrsCaseFn(V9),x_toPossessor(V2,V10)))),x_resolvedVar(V1,V15,V16),x_unifies(V6,V14),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V14,x_PossessedStuffFn(x_Money,V10))),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V14,x_Ammount)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V14,x_QuantityFrame)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_relatesToQTypeVar(V14,V10)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_diConsequence(V6,x_toPossessor(V2,V10))),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c8379,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16).
xc_microtheory(a65b12697c8379,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8379,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8379,1189).
xc_kb_names(a65b12697c8379,["?sid","?event","?event-res","?quantity","?qtype","?to-frame","?ddrs-id","?dcase","?sdrs-id","?person","?1toframeid","?quant","?existingQ","?toframeid","?dst","?dst-res"]).
xc_mapping_rows(a65b12697c8379,[]).
xc_exclude_globals(a65b12697c8379,true).
'x_<=='(x_genToFrame(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_discourseCaseForDrs(V8,V7)),'x_ist-Information'(V8,x_drsEntailedBySentence(V9,V1)),'x_ist-Information'(x_DrsCaseFn(V9),x_isa(V2,x_Buying)),'x_ist-Information'(x_DrsCaseFn(V9),x_buyer(V2,V10)),'x_ist-Information'(x_DrsCaseFn(V9),x_objectPaidFor(V2,V4)),x_uninferredSentence(x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V11,V5))))),x_uninferredSentence(x_genericQuantityReference(V12,V9,V5,V13,V4)),x_individualSatisfyingConditions(V14,x_QuantityFrame,x_TheSet('x_ist-Information'(x_DrsCaseFn(V9),x_objectPaidFor(V2,V4)))),x_resolvedVar(V1,V15,V16),x_unifies(V6,V14),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V14,V10)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V14,V5)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V14,x_QuantityFrame)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_relatesToQTypeVar(V14,V4)),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V7),x_diConsequence(V6,x_objectPaidFor(V2,V4))),x_TheList(x_genToFrame(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b12697c837a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16).
xc_microtheory(a65b12697c837a,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c837a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c837a,1213).
xc_kb_names(a65b12697c837a,["?sid","?event","?event-res","?quantity","?qtype","?to-frame","?ddrs-id","?dcase","?sdrs-id","?person","?1toframeid","?quant","?existingQ","?toframeid","?dst","?dst-res"]).
xc_mapping_rows(a65b12697c837a,[]).
xc_exclude_globals(a65b12697c837a,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfQPropEvent),x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c837b,V1,V2,V3).
xc_microtheory(a65b12697c837b,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c837b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c837b,1248).
xc_kb_names(a65b12697c837b,["?sid","?narrative-event","?qpframe"]).
xc_mapping_rows(a65b12697c837b,[]).
xc_exclude_globals(a65b12697c837b,true).
'x_<=='(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_indirectlyConstrainedFrames(V5,V6,V7,V1),x_individualSatisfyingConditions(V3,x_IndirectInfluenceFrame,x_TheSet(x_indirectlyConstrainedFrames(V5,V6,V7,V1))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_indirectlyConstrainedFrames(V5,V6,V7,V1))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_IndirectInfluenceFrame)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_constrained(V3,V6)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_constrainer(V3,V5)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_sign(V3,V7)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c837c,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12697c837c,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c837c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c837c,1255).
xc_kb_names(a65b12697c837c,["?sid","?nevent","?iiframeid","?ddrs-id","?qf1","?qf2","?sign"]).
xc_mapping_rows(a65b12697c837c,[]).
xc_exclude_globals(a65b12697c837c,true).
'x_<=='(x_indirectlyConstrainedFrames(V1,V2,V3,V4),x_drsForDiscourse(V5),x_contextIndependentDrsFor(V6,V4),x_incDecEvents(V7,V8,V9,V10,V4),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_relatesToQTypeVar(V1,V9))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_relatesToQTypeVar(V2,V10))),x_different(V1,V2),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V2,x_QuantityFrame)))),x_constrainedFrameSign(V1,V2,V7,V8,V3,V4)) :- x_cid(a65b12697c837d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c837d,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c837d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c837d,1274).
xc_kb_names(a65b12697c837d,["?qf1","?qf2","?sign","?sid","?ddrs-id","?sdrs-id","?ev1","?ev2","?qtvar1","?qtvar2"]).
xc_mapping_rows(a65b12697c837d,[]).
xc_exclude_globals(a65b12697c837d,true).
'x_<=='(x_indirectlyConstrainedFrames(V1,V2,V3,V4),x_drsForDiscourse(V5),x_contextIndependentDrsFor(V6,V4),x_incDecEvents(V7,V8,V9,V10,V4),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_relatesToQTypeVar(V1,V9))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V6),x_referentToQFrame(V4,V2,V11,V10))),x_different(V1,V2),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V2,x_QuantityFrame)))),x_constrainedFrameSign(V1,V2,V7,V8,V3,V4)) :- x_cid(a65b12697c837e,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c837e,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c837e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c837e,1287).
xc_kb_names(a65b12697c837e,["?qf1","?qf2","?sign","?sid","?ddrs-id","?sdrs-id","?ev1","?ev2","?qtvar1","?qtvar2","?ent"]).
xc_mapping_rows(a65b12697c837e,[]).
xc_exclude_globals(a65b12697c837e,true).
'x_<=='(x_indirectlyConstrainedFrames(V1,V2,V3,V4),x_drsForDiscourse(V5),x_contextIndependentDrsFor(V6,V4),x_incDecEvents(V7,V8,V9,V10,V4),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_relatesToQTypeVar(V2,V10))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V6),x_referentToQFrame(V4,V1,V11,V9))),x_different(V1,V2),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V2,x_QuantityFrame)))),x_constrainedFrameSign(V1,V2,V7,V8,V3,V4)) :- x_cid(a65b12697c837f,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c837f,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c837f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c837f,1298).
xc_kb_names(a65b12697c837f,["?qf1","?qf2","?sign","?sid","?ddrs-id","?sdrs-id","?ev1","?ev2","?qtvar1","?qtvar2","?ent"]).
xc_mapping_rows(a65b12697c837f,[]).
xc_exclude_globals(a65b12697c837f,true).
'x_<=='(x_indirectlyConstrainedFrames(V1,V2,V3,V4),x_drsForDiscourse(V5),x_contextIndependentDrsFor(V6,V4),x_incDecEvents(V7,V8,V9,V10,V4),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V6),x_referentToQFrame(V4,V2,V11,V10))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V6),x_referentToQFrame(V4,V1,V11,V9))),x_different(V1,V2),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V2,x_QuantityFrame)))),x_constrainedFrameSign(V1,V2,V7,V8,V3,V4)) :- x_cid(a65b12697c8380,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8380,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8380,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8380,1308).
xc_kb_names(a65b12697c8380,["?qf1","?qf2","?sign","?sid","?ddrs-id","?sdrs-id","?ev1","?ev2","?qtvar1","?qtvar2","?ent"]).
xc_mapping_rows(a65b12697c8380,[]).
xc_exclude_globals(a65b12697c8380,true).
'x_<=='(x_incDecEvents(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_contextIndependentDrsFor(V7,V5),x_qpropEvent(V1,V2,V5),'x_ist-Information'(x_DrsCaseFn(V7),x_objectActedOn(V1,V3)),'x_ist-Information'(x_DrsCaseFn(V7),x_objectActedOn(V2,V4))) :- x_cid(a65b12697c8381,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12697c8381,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8381,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8381,1320).
xc_kb_names(a65b12697c8381,["?ev1","?ev2","?qtvar1","?qtvar2","?sid","?ddrs-id","?sdrs-id"]).
xc_mapping_rows(a65b12697c8381,[]).
xc_exclude_globals(a65b12697c8381,true).
'x_<=='(x_qpropEvent(V1,V2,V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),x_contextIndependentDrsFor(V6,V3),'x_ist-Information'(x_DrsCaseFn(V6),x_temporallyIntersects(V1,V2)),'x_ist-Information'(V5,x_dvSpanInParseTree(V1,x_SpanFn(V7,V8),V9)),'x_ist-Information'(V5,x_dvSpanInParseTree(V2,x_SpanFn(V10,V11),V9)),x_lessThan(V8,V11),x_different(V1,V2)) :- x_cid(a65b12697c8382,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8382,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8382,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8382,1332).
xc_kb_names(a65b12697c8382,["?ev1","?ev2","?sid","?ddrs-id","?dcase","?sdrs-id","?start","?fin","?parse-tree","?start2","?fin2"]).
xc_mapping_rows(a65b12697c8382,[]).
xc_exclude_globals(a65b12697c8382,true).
'x_<=='(x_constrainedFrameSign(V1,V2,V3,V4,V5,V6),x_numAnswers(1,x_signOfDerivative(V1,V7)),x_numAnswers(1,x_signOfDerivative(V2,V8)),x_signOf(V7,V8,V5)) :- x_cid(a65b12697c8383,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c8383,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8383,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8383,1346).
xc_kb_names(a65b12697c8383,["?qf1","?qf2","?ev1","?ev2","?sign","?sid","?sign1","?sign2"]).
xc_mapping_rows(a65b12697c8383,[]).
xc_exclude_globals(a65b12697c8383,true).
'x_<=='(x_constrainedFrameSign(V1,V2,V3,V4,V5,V6),x_contextIndependentDrsFor(V7,V6),x_signWord(V3,V8,V7),x_signWord(V4,V9,V7),x_signOf(V8,V9,V5)) :- x_cid(a65b12697c8384,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12697c8384,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8384,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8384,1351).
xc_kb_names(a65b12697c8384,["?qf1","?qf2","?ev1","?ev2","?sign","?sid","?sdrs-id","?sign1","?sign2"]).
xc_mapping_rows(a65b12697c8384,[]).
xc_exclude_globals(a65b12697c8384,true).
'x_<=='(x_signWord(V1,V2,V3),'x_ist-Information'(x_DrsCaseFn(V3),x_isa(V1,x_IncreaseEvent)),x_unifies(V2,1)) :- x_cid(a65b12697c8385,V1,V2,V3).
xc_microtheory(a65b12697c8385,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8385,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8385,1357).
xc_kb_names(a65b12697c8385,["?ev","?sign","?sdrs-id"]).
xc_mapping_rows(a65b12697c8385,[]).
xc_exclude_globals(a65b12697c8385,true).
'x_<=='(x_signWord(V1,V2,V3),'x_ist-Information'(x_DrsCaseFn(V3),x_isa(V1,x_DecreaseEvent)),x_unifies(V2,-1)) :- x_cid(a65b12697c8386,V1,V2,V3).
xc_microtheory(a65b12697c8386,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8386,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8386,1361).
xc_kb_names(a65b12697c8386,["?ev","?sign","?sdrs-id"]).
xc_mapping_rows(a65b12697c8386,[]).
xc_exclude_globals(a65b12697c8386,true).
'x_<=='(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_indirectlyConstrainedDependence(V5,V6,V7),x_individualSatisfyingConditions(V3,x_IndirectInfluenceFrame,x_TheSet(x_indirectlyConstrainedDependence(V5,V6,V7))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_indirectlyConstrainedDependence(V5,V6,V7))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_IndirectInfluenceFrame)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_constrained(V3,V6)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_constrainer(V3,V5)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_sign(V3,V7)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c8387,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12697c8387,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8387,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8387,1374).
xc_kb_names(a65b12697c8387,["?sid","?nevent","?iiframeid","?ddrs-id","?qf1","?qf2","?sign"]).
xc_mapping_rows(a65b12697c8387,[]).
xc_exclude_globals(a65b12697c8387,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V1,V7))),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V2,V8))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V9))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V10))),'x_ist-Information'(x_DrsCaseFn(V5),x_positivelyDependsOn(x_Quantity,V7,V8)),x_unifies(V3,1)) :- x_cid(a65b12697c8388,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c8388,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8388,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8388,1393).
xc_kb_names(a65b12697c8388,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?qtvar1","?qtvar2","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c8388,[]).
xc_exclude_globals(a65b12697c8388,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V1,V7))),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V2,V8,V9))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V10))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V11))),'x_ist-Information'(x_DrsCaseFn(V5),x_positivelyDependsOn(x_Quantity,V7,V9)),x_unifies(V3,1)) :- x_cid(a65b12697c8389,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8389,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8389,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8389,1406).
xc_kb_names(a65b12697c8389,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?qtvar1","?ent","?qtvar2","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c8389,[]).
xc_exclude_globals(a65b12697c8389,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V2,V7))),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V4),x_lookupOnly(x_isa(V1,x_QuantityFrame)))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V1,V8,V9))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V10))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V11))),'x_ist-Information'(x_DrsCaseFn(V5),x_positivelyDependsOn(x_Quantity,V9,V7)),x_unifies(V3,1)) :- x_cid(a65b12697c838a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c838a,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c838a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c838a,1418).
xc_kb_names(a65b12697c838a,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?qtvar2","?ent","?qtvar1","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c838a,[]).
xc_exclude_globals(a65b12697c838a,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V2,V7,V8))),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V1,V7,V9))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V10))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V11))),'x_ist-Information'(x_DrsCaseFn(V5),x_positivelyDependsOn(x_Quantity,V9,V8)),x_unifies(V3,1)) :- x_cid(a65b12697c838b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c838b,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c838b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c838b,1430).
xc_kb_names(a65b12697c838b,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?ent","?qtvar2","?qtvar1","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c838b,[]).
xc_exclude_globals(a65b12697c838b,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V1,V7))),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V2,V8))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V9))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V10))),'x_ist-Information'(x_DrsCaseFn(V5),'x_relyOn-Generic'(V7,V8)),x_unifies(V3,1)) :- x_cid(a65b12697c838c,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c838c,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c838c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c838c,1444).
xc_kb_names(a65b12697c838c,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?qtvar1","?qtvar2","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c838c,[]).
xc_exclude_globals(a65b12697c838c,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V1,V7,V8))),x_nonTransitiveInference(x_lookupOnly(x_isa(V1,x_QuantityFrame))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V2,V9))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V10))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V11))),'x_ist-Information'(x_DrsCaseFn(V5),'x_relyOn-Generic'(V8,V9)),x_unifies(V3,1)) :- x_cid(a65b12697c838d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c838d,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c838d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c838d,1457).
xc_kb_names(a65b12697c838d,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?ent","?qtvar1","?qtvar2","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c838d,[]).
xc_exclude_globals(a65b12697c838d,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V2,V7,V8))),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V1,V9))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V10))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V11))),'x_ist-Information'(x_DrsCaseFn(V5),'x_relyOn-Generic'(V9,V8)),x_unifies(V3,1)) :- x_cid(a65b12697c838e,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c838e,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c838e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c838e,1469).
xc_kb_names(a65b12697c838e,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?ent","?qtvar2","?qtvar1","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c838e,[]).
xc_exclude_globals(a65b12697c838e,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V1,V7,V8))),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V2,V7,V9))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V10))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V11))),'x_ist-Information'(x_DrsCaseFn(V5),'x_relyOn-Generic'(V8,V9)),x_unifies(V3,1)) :- x_cid(a65b12697c838f,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c838f,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c838f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c838f,1480).
xc_kb_names(a65b12697c838f,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?ent","?qtvar1","?qtvar2","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c838f,[]).
xc_exclude_globals(a65b12697c838f,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_lookupOnly(x_relatesToQTypeVar(V2,V7)),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_lookupOnly(x_relatesToQTypeVar(V1,V8)),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V9))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V10))),'x_ist-Information'(x_DrsCaseFn(V5),x_negativelyDependsOn(x_Quantity,V8,V7)),x_unifies(V3,-1)) :- x_cid(a65b12697c8390,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c8390,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8390,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8390,1494).
xc_kb_names(a65b12697c8390,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?qtvar2","?qtvar1","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c8390,[]).
xc_exclude_globals(a65b12697c8390,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_lookupOnly(x_relatesToQTypeVar(V2,V7)),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V1,V8,V9))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V10))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V11))),'x_ist-Information'(x_DrsCaseFn(V5),x_negativelyDependsOn(x_Quantity,V9,V7)),x_unifies(V3,-1)) :- x_cid(a65b12697c8391,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8391,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8391,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8391,1506).
xc_kb_names(a65b12697c8391,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?qtvar2","?ent","?qtvar1","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c8391,[]).
xc_exclude_globals(a65b12697c8391,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_lookupOnly(x_relatesToQTypeVar(V1,V7)),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V2,V8,V9))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V10))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V11))),'x_ist-Information'(x_DrsCaseFn(V5),x_negativelyDependsOn(x_Quantity,V7,V9)),x_unifies(V3,-1)) :- x_cid(a65b12697c8392,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8392,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8392,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8392,1517).
xc_kb_names(a65b12697c8392,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?qtvar1","?ent","?qtvar2","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c8392,[]).
xc_exclude_globals(a65b12697c8392,true).
'x_<=='(x_indirectlyConstrainedDependence(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V6),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V1,V7,V8))),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V1,x_QuantityFrame)))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_referentToQFrame(V6,V2,V7,V9))),x_different(V1,V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V10))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V2,V11))),'x_ist-Information'(x_DrsCaseFn(V5),x_negativelyDependsOn(x_Quantity,V8,V9)),x_unifies(V3,-1)) :- x_cid(a65b12697c8393,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c8393,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8393,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8393,1528).
xc_kb_names(a65b12697c8393,["?qf1","?qf2","?sign","?ddrs-id","?sdrs-id","?sid","?ent","?qtvar1","?qtvar2","?qtype1","?qtype2"]).
xc_mapping_rows(a65b12697c8393,[]).
xc_exclude_globals(a65b12697c8393,true).
'x_<=='(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V1),x_qpropDegreeFrames(V6,V7,V8,V9,V1),'x_ist-Information'(x_DrsCaseFn(V5),x_comparativeDegrees(V6,V7,V10,V11,V12)),x_individualSatisfyingConditions(V3,x_IndirectInfluenceFrame,x_TheSet(x_qpropDegreeFrames(V6,V7,V8,V9),x_comparativeDegrees(V6,V7,V10,V11,V12))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_qpropDegreeFrames(V6,V7,V8,V9),x_comparativeDegrees(V6,V7,V10,V11,V12))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_IndirectInfluenceFrame)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_constrained(V3,V9)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_constrainer(V3,V8)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_sign(V3,V12)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_signOfDerivative(V8,V10)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_signOfDerivative(V9,V11)),x_TheList(x_introducesQPropFrame(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c8394,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12697c8394,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8394,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8394,1551).
xc_kb_names(a65b12697c8394,["?sid","?nevent","?iiframeid","?ddrs-id","?sdrs-id","?thing1","?thing2","?qf1","?qf2","?polarity1","?polarity2","?sign"]).
xc_mapping_rows(a65b12697c8394,[]).
xc_exclude_globals(a65b12697c8394,true).
'x_<=='(x_qpropDegreeFrames(V1,V2,V3,V4,V5),x_qpropEvent(V1,V2,V5),x_drsForDiscourse(V6),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_relatesToQTypeVar(V3,V1))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_relatesToQTypeVar(V4,V2))),x_different(V3,V4)) :- x_cid(a65b12697c8395,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c8395,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8395,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8395,1575).
xc_kb_names(a65b12697c8395,["?thing1","?thing2","?qf1","?qf2","?sid","?ddrs-id"]).
xc_mapping_rows(a65b12697c8395,[]).
xc_exclude_globals(a65b12697c8395,true).
'x_<=='(x_qpropDegreeFrames(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_contextIndependentDrsFor(V7,V5),x_qpropEvent(V1,V2,V5),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_relatesToQTypeVar(V3,V1))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V7),x_referentToQFrame(V5,V4,V8,V2))),x_different(V3,V4)) :- x_cid(a65b12697c8396,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c8396,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8396,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8396,1585).
xc_kb_names(a65b12697c8396,["?thing1","?thing2","?qf1","?qf2","?sid","?ddrs-id","?sdrs-id","?ent"]).
xc_mapping_rows(a65b12697c8396,[]).
xc_exclude_globals(a65b12697c8396,true).
'x_<=='(x_qpropDegreeFrames(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_contextIndependentDrsFor(V7,V5),x_qpropEvent(V1,V2,V5),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_relatesToQTypeVar(V4,V2))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V7),x_referentToQFrame(V5,V3,V8,V1))),x_different(V3,V4)) :- x_cid(a65b12697c8397,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c8397,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8397,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8397,1592).
xc_kb_names(a65b12697c8397,["?thing1","?thing2","?qf1","?qf2","?sid","?ddrs-id","?sdrs-id","?ent"]).
xc_mapping_rows(a65b12697c8397,[]).
xc_exclude_globals(a65b12697c8397,true).
'x_<=='(x_qpropDegreeFrames(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),x_contextIndependentDrsFor(V7,V5),x_qpropEvent(V1,V2,V5),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V7),x_referentToQFrame(V5,V4,V8,V2))),x_wmOnly('x_ist-Information'(x_DrsCaseFn(V7),x_referentToQFrame(V5,V3,V8,V1))),x_different(V3,V4)) :- x_cid(a65b12697c8398,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c8398,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8398,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8398,1599).
xc_kb_names(a65b12697c8398,["?thing1","?thing2","?qf1","?qf2","?sid","?ddrs-id","?sdrs-id","?ent"]).
xc_mapping_rows(a65b12697c8398,[]).
xc_exclude_globals(a65b12697c8398,true).
'x_<=='(x_comparativeDegrees(V1,V2,V3,V4,V5),x_comparativeDirection(V1,V6),x_comparativeDirection(V2,V7),x_getWord(V6,V8),x_getWord(V7,V9),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_polarityOfComparativeRelation(V8,V3))),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_polarityOfComparativeRelation(V9,V4))),x_signOf(V3,V4,V5)) :- x_cid(a65b12697c8399,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12697c8399,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c8399,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c8399,1609).
xc_kb_names(a65b12697c8399,["?quant1","?quant2","?polarity1","?polarity2","?sign","?compvar1","?compvar2","?comprel1","?comprel2"]).
xc_mapping_rows(a65b12697c8399,[]).
xc_exclude_globals(a65b12697c8399,true).
'x_<=='(x_signOf(1,1,1)) :- x_cid(a65b12697c839a).
xc_microtheory(a65b12697c839a,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c839a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c839a,1627).
xc_kb_names(a65b12697c839a,[]).
xc_mapping_rows(a65b12697c839a,[]).
xc_exclude_globals(a65b12697c839a,true).
'x_<=='(x_signOf(1,-1,x_unknown)) :- x_cid(a65b12697c839b).
xc_microtheory(a65b12697c839b,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c839b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c839b,1628).
xc_kb_names(a65b12697c839b,[]).
xc_mapping_rows(a65b12697c839b,[]).
xc_exclude_globals(a65b12697c839b,true).
'x_<=='(x_signOf(-1,1,x_unknown)) :- x_cid(a65b12697c839c).
xc_microtheory(a65b12697c839c,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c839c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c839c,1629).
xc_kb_names(a65b12697c839c,[]).
xc_mapping_rows(a65b12697c839c,[]).
xc_exclude_globals(a65b12697c839c,true).
'x_<=='(x_signOf(-1,-1,-1)) :- x_cid(a65b12697c839d).
xc_microtheory(a65b12697c839d,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c839d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c839d,1630).
xc_kb_names(a65b12697c839d,[]).
xc_mapping_rows(a65b12697c839d,[]).
xc_exclude_globals(a65b12697c839d,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,V4,x_IntroductionOfDsInformation),x_introducesQPDsInfo(V1,V3,V4),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_introducesQPDsInfo(V1,V3,V4)))) :- x_cid(a65b12697c839e,V1,V2,V3,V4).
xc_microtheory(a65b12697c839e,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c839e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c839e,1647).
xc_kb_names(a65b12697c839e,["?sid","?nevent","?quantity-frame","?sign"]).
xc_mapping_rows(a65b12697c839e,[]).
xc_exclude_globals(a65b12697c839e,true).
'x_<=='(x_introducesQPDsInfo(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V1),'x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V2,V6)),x_seekDsInfoForQuantityFrame(V5,V6,V3),x_groundExpression(V3),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_signOfDerivative(V2,V3)),x_TheList(x_introducesQPDsInfo(V1,V2,V3))))) :- x_cid(a65b12697c839f,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c839f,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c839f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c839f,1658).
xc_kb_names(a65b12697c839f,["?sid","?qframe","?sign","?ddrs-id","?sdrs-id","?quantity"]).
xc_mapping_rows(a65b12697c839f,[]).
xc_exclude_globals(a65b12697c839f,true).
'x_<=='(x_seekDsInfoForQuantityFrame(V1,V2,1),'x_ist-Information'(x_DrsCaseFn(V1),x_isa(V3,x_IncreaseEvent)),'x_ist-Information'(x_DrsCaseFn(V1),x_objectActedOn(V3,V2))) :- x_cid(a65b12697c83a0,V1,V2,V3).
xc_microtheory(a65b12697c83a0,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a0,1669).
xc_kb_names(a65b12697c83a0,["?sdrs-id","?quantity","?event"]).
xc_mapping_rows(a65b12697c83a0,[]).
xc_exclude_globals(a65b12697c83a0,true).
'x_<=='(x_seekDsInfoForQuantityFrame(V1,V2,-1),'x_ist-Information'(x_DrsCaseFn(V1),x_isa(V3,x_DecreaseEvent)),'x_ist-Information'(x_DrsCaseFn(V1),x_objectActedOn(V3,V2))) :- x_cid(a65b12697c83a1,V1,V2,V3).
xc_microtheory(a65b12697c83a1,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a1,1691).
xc_kb_names(a65b12697c83a1,["?sdrs-id","?quantity","?event"]).
xc_mapping_rows(a65b12697c83a1,[]).
xc_exclude_globals(a65b12697c83a1,true).
'x_<=='(x_seekDsInfoForQuantityFrame(V1,V2,-1),'x_ist-Information'(x_DrsCaseFn(V1),x_isa(V3,x_FallingEvent)),'x_ist-Information'(x_DrsCaseFn(V1),x_primaryObjectMoving(V3,V2))) :- x_cid(a65b12697c83a2,V1,V2,V3).
xc_microtheory(a65b12697c83a2,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a2,1695).
xc_kb_names(a65b12697c83a2,["?sdrs-id","?quantity","?event"]).
xc_mapping_rows(a65b12697c83a2,[]).
xc_exclude_globals(a65b12697c83a2,true).
'x_<=='(x_seekDsInfoForQuantityFrame(V1,V2,0),'x_ist-Information'(x_DrsCaseFn(V1),x_isa(V2,x_ThingDescribableAsFn('x_Constant-TheWord',x_Adjective)))) :- x_cid(a65b12697c83a3,V1,V2).
xc_microtheory(a65b12697c83a3,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a3,1699).
xc_kb_names(a65b12697c83a3,["?sdrs-id","?quantity"]).
xc_mapping_rows(a65b12697c83a3,[]).
xc_exclude_globals(a65b12697c83a3,true).
'x_<=='(x_seekDsInfoForQuantityFrame(V1,V2,0),'x_ist-Information'(x_DrsCaseFn(V1),x_isa(V2,x_ThingDescribableAsFn('x_Steady-TheWord',x_Adjective)))) :- x_cid(a65b12697c83a4,V1,V2).
xc_microtheory(a65b12697c83a4,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a4,1704).
xc_kb_names(a65b12697c83a4,["?sdrs-id","?quantity"]).
xc_mapping_rows(a65b12697c83a4,[]).
xc_exclude_globals(a65b12697c83a4,true).
'x_<=='(x_seekDsInfoForQuantityFrame(V1,V2,-1),'x_ist-Information'(x_DrsCaseFn(V1),x_negativelyDependsOn(x_Quantity,V2,V3))) :- x_cid(a65b12697c83a5,V1,V2,V3).
xc_microtheory(a65b12697c83a5,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a5,1709).
xc_kb_names(a65b12697c83a5,["?sdrs-id","?quantity","?qtype2"]).
xc_mapping_rows(a65b12697c83a5,[]).
xc_exclude_globals(a65b12697c83a5,true).
'x_<=='(x_seekDsInfoForQuantityFrame(V1,V2,1),'x_ist-Information'(x_DrsCaseFn(V1),x_positivelyDependsOn(x_Quantity,V2,V3))) :- x_cid(a65b12697c83a6,V1,V2,V3).
xc_microtheory(a65b12697c83a6,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a6,1712).
xc_kb_names(a65b12697c83a6,["?sdrs-id","?quantity","?qtype2"]).
xc_mapping_rows(a65b12697c83a6,[]).
xc_exclude_globals(a65b12697c83a6,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfTopologyFrame),x_introducesTopology(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c83a7,V1,V2,V3).
xc_microtheory(a65b12697c83a7,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a7,1725).
xc_kb_names(a65b12697c83a7,["?sid","?event-id","?top-frame"]).
xc_mapping_rows(a65b12697c83a7,[]).
xc_exclude_globals(a65b12697c83a7,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfTopologyConstraint),x_introducesTopologyConstraint(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c83a8,V1,V2,V3).
xc_microtheory(a65b12697c83a8,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a8,1733).
xc_kb_names(a65b12697c83a8,["?sid","?event-id","?topoframe"]).
xc_mapping_rows(a65b12697c83a8,[]).
xc_exclude_globals(a65b12697c83a8,true).
'x_<=='(x_introducesTopology(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_introducesContainment(V1,V5,V6),x_individualSatisfyingConditions(V3,x_TopologyFrame,x_TheSet(x_introducesContainment(V1,V5,V6))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_introducesContainment(V1,V5,V6))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_TopologyFrame)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_container(V3,V5)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_entity(V3,V6)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83a9,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c83a9,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83a9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83a9,1741).
xc_kb_names(a65b12697c83a9,["?sid","?event-id","?topoframe","?ddrs-id","?container","?substance"]).
xc_mapping_rows(a65b12697c83a9,[]).
xc_exclude_globals(a65b12697c83a9,true).
'x_<=='(x_introducesContainment(V1,V2,V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V1),'x_ist-Information'(x_DrsCaseFn(V5),'x_contains-Underspecified'(V2,V3)),x_groundExpression(V2),x_groundExpression(V3),x_resolvedVar(V1,V2,V6),x_resolvedVar(V1,V3,V7)) :- x_cid(a65b12697c83aa,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12697c83aa,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83aa,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83aa,1762).
xc_kb_names(a65b12697c83aa,["?sid","?container","?substance","?ddrs-id","?sdrs-id","?entity-res","?quantity-res"]).
xc_mapping_rows(a65b12697c83aa,[]).
xc_exclude_globals(a65b12697c83aa,true).
'x_<=='(x_introducesTopology(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_introducesPath(V1,V5,V6),x_individualSatisfyingConditions(V3,x_TopologyFrame,x_TheSet(x_introducesPath(V1,V5,V6))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_introducesPath(V1,V5,V6))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_TopologyFrame)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_pathForFrame(V3,V6)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_entity(V3,V5)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83ab,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c83ab,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83ab,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83ab,1777).
xc_kb_names(a65b12697c83ab,["?sid","?event-id","?topoframe","?ddrs-id","?event","?path"]).
xc_mapping_rows(a65b12697c83ab,[]).
xc_exclude_globals(a65b12697c83ab,true).
'x_<=='(x_introducesPath(V1,V2,V3),x_contextIndependentDrsFor(V4,V1),'x_ist-Information'(x_DrsCaseFn(V4),'x_motionPathway-Partial'(V2,V3))) :- x_cid(a65b12697c83ac,V1,V2,V3,V4).
xc_microtheory(a65b12697c83ac,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83ac,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83ac,1798).
xc_kb_names(a65b12697c83ac,["?sid","?event","?path","?sdrs-id"]).
xc_mapping_rows(a65b12697c83ac,[]).
xc_exclude_globals(a65b12697c83ac,true).
'x_<=='(x_introducesPath(V1,V2,V3),x_contextIndependentDrsFor(V4,V1),'x_ist-Information'(x_DrsCaseFn(V4),x_trajectoryPassesThrough(V2,V3))) :- x_cid(a65b12697c83ad,V1,V2,V3,V4).
xc_microtheory(a65b12697c83ad,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83ad,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83ad,1802).
xc_kb_names(a65b12697c83ad,["?sid","?event","?path","?sdrs-id"]).
xc_mapping_rows(a65b12697c83ad,[]).
xc_exclude_globals(a65b12697c83ad,true).
'x_<=='(x_introducesTopology(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V1),'x_ist-Information'(x_DrsCaseFn(V5),x_pathConnects(V6,V7,V8)),x_individualSatisfyingConditions(V3,x_TopologyFrame,x_TheSet('x_ist-Information'(x_DrsCaseFn(V5),x_pathConnects(V6,V7,V8)))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet('x_ist-Information'(x_DrsCaseFn(V5),x_pathConnects(V6,V7,V8)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_TopologyFrame)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_pathForFrame(V3,V6)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_connectedEntity(V3,V7)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_connectedEntity(V3,V8)),x_TheList(x_introducesTopology(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83ae,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c83ae,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83ae,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83ae,1806).
xc_kb_names(a65b12697c83ae,["?sid","?event-id","?topoframe","?ddrs-id","?sdrs-id","?path","?loc1","?loc2"]).
xc_mapping_rows(a65b12697c83ae,[]).
xc_exclude_globals(a65b12697c83ae,true).
'x_<=='(x_introducesTopologyConstraint(x_PresentationEventFn(V1,V2),V3),x_changeInAccessibility(V1,V4,V5,V6),x_entity(V3,V6),x_isa(V3,x_ToplogyFrame),x_tell(x_notAccessible(V7,V5))) :- x_cid(a65b12697c83af,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12697c83af,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83af,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83af,1842).
xc_kb_names(a65b12697c83af,["?sid","?event-id","?topoframe","?changeEvent","?path","?event","?event-id2"]).
xc_mapping_rows(a65b12697c83af,[]).
xc_exclude_globals(a65b12697c83af,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfOrdinalEvent),x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c83b0,V1,V2,V3).
xc_microtheory(a65b12697c83b0,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b0,1867).
xc_kb_names(a65b12697c83b0,["?sid","?narrative-event","?ordframe"]).
xc_mapping_rows(a65b12697c83b0,[]).
xc_exclude_globals(a65b12697c83b0,true).
'x_<=='(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityValue(V5,V6))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityValue(V7,V8))),x_different(V5,V7),x_numAnswers(1,x_symbolicRelBetween(V6,V8,V9)),x_individualSatisfyingConditions(V3,x_OrdinalRelationFrame,x_TheSet(x_symbolicRelBetween(V6,V8,V9))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_symbolicRelBetween(V6,V8,V9))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantity1(V3,V5)),x_TheList(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantity2(V3,V7)),x_TheList(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_OrdinalRelationFrame)),x_TheList(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_relationBetweenQuantities(V3,V9)),x_TheList(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83b1,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12697c83b1,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b1,1886).
xc_kb_names(a65b12697c83b1,["?sid","?narrative-event","?ordframeid","?ddrs-id","?qf1","?qvalue1","?qf2","?qvalue2","?relation"]).
xc_mapping_rows(a65b12697c83b1,[]).
xc_exclude_globals(a65b12697c83b1,true).
'x_<=='(x_symbolicRelBetween(V1,V2,V3),x_allFactsAllowed(x_useTransitiveInference('x_ist-Information'(x_WorldLikeOursCollectorMt,x_followingValue(V1,V2)))),x_unifies(V3,x_lessThan)) :- x_cid(a65b12697c83b2,V1,V2,V3).
xc_microtheory(a65b12697c83b2,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b2,1921).
xc_kb_names(a65b12697c83b2,["?qvalue1","?qvalue2","?relation"]).
xc_mapping_rows(a65b12697c83b2,[]).
xc_exclude_globals(a65b12697c83b2,true).
'x_<=='(x_symbolicRelBetween(V1,V2,V3),x_allFactsAllowed(x_useTransitiveInference('x_ist-Information'(x_WorldLikeOursCollectorMt,x_followingValue(V2,V1)))),x_unifies(V3,x_greaterThan)) :- x_cid(a65b12697c83b3,V1,V2,V3).
xc_microtheory(a65b12697c83b3,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b3,1929).
xc_kb_names(a65b12697c83b3,["?qvalue1","?qvalue2","?relation"]).
xc_mapping_rows(a65b12697c83b3,[]).
xc_exclude_globals(a65b12697c83b3,true).
'x_<=='(x_followingValue(V1,V2),x_followingValue(V1,V3),x_followingValue(V3,V2)) :- x_cid(a65b12697c83b4,V1,V2,V3).
xc_microtheory(a65b12697c83b4,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b4,1937).
xc_kb_names(a65b12697c83b4,["?lower","?higher","?medium"]).
xc_mapping_rows(a65b12697c83b4,[]).
xc_exclude_globals(a65b12697c83b4,true).
'x_<=='(x_ordinalRelationFrameForEventPossessive(V1,V2,V3,V4),x_contextIndependentDrsFor(V5,V4),x_drsForDiscourse(V6),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_quantityFrameWithQuantityTypeEntity(V1,V7,V8,V6))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_quantityFrameWithQuantityTypeEntity(V2,V9,V10,V6))),x_different(V1,V2),x_equals(V8,V10),'x_ist-Information'(x_DrsCaseFn(V5),'x_in-UnderspecifiedContainer'(V11,V7)),'x_ist-Information'(x_DrsCaseFn(V5),'x_in-UnderspecifiedContainer'(V12,V9)),'x_ist-Information'(x_DrsCaseFn(V5),x_comparer(V3,V11)),'x_ist-Information'(x_DrsCaseFn(V5),x_comparee(V3,V12)),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V3,x_ComparisonEvent))),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V11,V8))),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V12,V10)))) :- x_cid(a65b12697c83b5,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12697c83b5,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b5,1945).
xc_kb_names(a65b12697c83b5,["?qf1","?qf2","?compevent","?sid","?sdrs-id","?ddrs-id","?entity1","?qtype1","?entity2","?qtype2","?qtvar1","?qtvar2"]).
xc_mapping_rows(a65b12697c83b5,[]).
xc_exclude_globals(a65b12697c83b5,true).
'x_<=='(x_ordinalRelationFrameForEventPossessive(V1,V2,V3,V4),x_contextIndependentDrsFor(V5,V4),x_drsForDiscourse(V6),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_quantityFrameWithQuantityTypeEntity(V1,V7,V8,V6))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V6),x_quantityFrameWithQuantityTypeEntity(V2,V9,V10,V6))),x_different(V1,V2),x_equals(V8,V10),'x_ist-Information'(x_DrsCaseFn(V5),x_possessiveRelation(V7,V11)),'x_ist-Information'(x_DrsCaseFn(V5),x_possessiveRelation(V9,V12)),'x_ist-Information'(x_DrsCaseFn(V5),x_comparer(V3,V11)),'x_ist-Information'(x_DrsCaseFn(V5),x_comparee(V3,V12)),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V3,x_ComparisonEvent))),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V11,V8))),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V12,V10)))) :- x_cid(a65b12697c83b6,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12697c83b6,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b6,1960).
xc_kb_names(a65b12697c83b6,["?qf1","?qf2","?compevent","?sid","?sdrs-id","?ddrs-id","?entity1","?qtype1","?entity2","?qtype2","?qtvar1","?qtvar2"]).
xc_mapping_rows(a65b12697c83b6,[]).
xc_exclude_globals(a65b12697c83b6,true).
'x_<=='(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_ordinalRelationFrameForEventPossessive(V5,V6,V7,V1),x_symbolicRelationForEvent(V7,V8,V1,V5,V6),x_individualSatisfyingConditions(V3,x_OrdinalRelationFrame,x_TheSet(x_ordinalRelationFrameForEventPossessive(V5,V6,V7))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_ordinalRelationFrameForEventPossessive(V5,V6,V7))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantity1(V3,V5)),x_TheList(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantity2(V3,V6)),x_TheList(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_OrdinalRelationFrame)),x_TheList(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_relationBetweenQuantities(V3,V8)),x_TheList(x_introducesOrdinalComparison(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83b7,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c83b7,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b7,1975).
xc_kb_names(a65b12697c83b7,["?sid","?narrative-event","?ordframeid","?ddrs-id","?qf1","?qf2","?compevent","?relation"]).
xc_mapping_rows(a65b12697c83b7,[]).
xc_exclude_globals(a65b12697c83b7,true).
'x_<=='(x_symbolicRelationForEvent(V1,V2,V3,V4,V5),x_contextIndependentDrsFor(V6,V3),'x_ist-Information'(x_DrsCaseFn(V6),x_comparativeRelation(V1,V7)),x_formulaArgument(V7,1,V8),x_equalSymbols(V8,t(V9,V10)),x_tell(t(V7,V4,V5)),x_unifies(V2,x_greaterThan)) :- x_cid(a65b12697c83b8,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c83b8,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b8,2006).
xc_kb_names(a65b12697c83b8,["?compevent","?relation","?sid","?qtvar1","?qtvar2","?sdrs-id","?comprel","?term","?larger","?smaller"]).
xc_mapping_rows(a65b12697c83b8,[]).
xc_exclude_globals(a65b12697c83b8,true).
'x_<=='(x_symbolicRelationForEvent(V1,V2,V3,V4,V5),x_contextIndependentDrsFor(V6,V3),'x_ist-Information'(x_DrsCaseFn(V6),x_comparativeRelation(V1,V7)),x_formulaArgument(V7,1,V8),x_equalSymbols(V8,t(V9,V10)),x_tell(t(V7,V4,V5)),x_unifies(V2,x_lessThan)) :- x_cid(a65b12697c83b9,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c83b9,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83b9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83b9,2014).
xc_kb_names(a65b12697c83b9,["?compevent","?relation","?sid","?qtvar1","?qtvar2","?sdrs-id","?comprel","?term","?smaller","?larger"]).
xc_mapping_rows(a65b12697c83b9,[]).
xc_exclude_globals(a65b12697c83b9,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfQuantityTransferFrame),x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c83ba,V1,V2,V3).
xc_microtheory(a65b12697c83ba,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83ba,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83ba,2028).
xc_kb_names(a65b12697c83ba,["?sid","?narrative-event","?qt-frame"]).
xc_mapping_rows(a65b12697c83ba,[]).
xc_exclude_globals(a65b12697c83ba,true).
'x_<=='(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3),x_quantityTransferEvent(V4,V5,V6,V7),x_drsForDiscourse(V8),x_individualSatisfyingConditions(V3,x_QuantityTransferFrame,x_TheSet(x_quantityTransferEvent(V4,V5,V7))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_quantityTransferEvent(V4,V5,V7))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V3,x_QuantityTransferFrame)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_sourceOfTransfer(V3,V4)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_destOfTransfer(V3,V5)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_rateOfTransfer(V3,V7)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_rateOfTransfer(V3,V6)),x_TheList(x_introducesQuantityTransfer(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83bb,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12697c83bb,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83bb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83bb,2041).
xc_kb_names(a65b12697c83bb,["?sid","?nevent","?qtframeid","?from-frame","?to-frame","?rate-frame1","?rate-frame","?ddrs-id"]).
xc_mapping_rows(a65b12697c83bb,[]).
xc_exclude_globals(a65b12697c83bb,true).
'x_<=='(x_quantityTransferEvent(V1,V2,V3,V4),x_drsForDiscourse(V5),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_sign(V6,x_Positive))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_sign(V7,x_Negative))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_constrained(V6,V2))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_constrained(V7,V1))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_constrainer(V6,V3))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_constrainer(V7,V4))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_quantityType(V2,V8))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_quantityType(V1,V8))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_entity(V3,V9)))) :- x_cid(a65b12697c83bc,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12697c83bc,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83bc,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83bc,2059).
xc_kb_names(a65b12697c83bc,["?from-frame","?to-frame","?rate-frame1","?rate-frame2","?ddrs-id","?di-frame1","?di-frame2","?qtype","?event"]).
xc_mapping_rows(a65b12697c83bc,[]).
xc_exclude_globals(a65b12697c83bc,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfProcess),x_introducesProcessFrame(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c83bd,V1,V2,V3).
xc_microtheory(a65b12697c83bd,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83bd,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83bd,2097).
xc_kb_names(a65b12697c83bd,["?sid","?narrative-event","?process-frame"]).
xc_mapping_rows(a65b12697c83bd,[]).
xc_exclude_globals(a65b12697c83bd,true).
'x_<=='(x_introducesProcessFrame(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_processEvent(V5))),x_individualSatisfyingConditions(V3,x_PhysicalProcessFrame,x_TheSet(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_processEvent(V5))))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_processEvent(V5))))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V3,x_PhysicalProcessFrame)),x_TheList(x_introducesProcessFrame(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)),x_TheList(x_introducesProcessFrame(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83be,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83be,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83be,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83be,2103).
xc_kb_names(a65b12697c83be,["?sid","?narrative-event","?pframeid","?ddrs-id","?event-res"]).
xc_mapping_rows(a65b12697c83be,[]).
xc_exclude_globals(a65b12697c83be,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroducesProcessRole),x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c83bf,V1,V2,V3).
xc_microtheory(a65b12697c83bf,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83bf,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83bf,2128).
xc_kb_names(a65b12697c83bf,["?sid","?narrative-event","?process-frame-role"]).
xc_mapping_rows(a65b12697c83bf,[]).
xc_exclude_globals(a65b12697c83bf,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_entity(V6,V5))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V6,x_Rate)),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V7,x_DirectInfluenceFrame)))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_constrainer(V7,V6))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_constrained(V7,V8))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_entity(V8,V9))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_diConsequence(V8,V10))),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_true)),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_participant(V3,V9)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_consequence(V3,V7)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_consequence(V3,V10)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83c0,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12697c83c0,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c0,2135).
xc_kb_names(a65b12697c83c0,["?sid","?narrative-event","?pframeid","?ddrs-id","?event","?qframeid","?diframe","?entity-frame","?entity","?fact"]).
xc_mapping_rows(a65b12697c83c0,[]).
xc_exclude_globals(a65b12697c83c0,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)),x_uninferredSentence(x_stoppedEvent(V5)),x_uninferredSentence(x_potentialEvent(V1,V5)),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_status(V3,x_Active)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83c1,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83c1,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c1,2163).
xc_kb_names(a65b12697c83c1,["?sid","?narrative-event","?pframeid","?ddrs-id","?event"]).
xc_mapping_rows(a65b12697c83c1,[]).
xc_exclude_globals(a65b12697c83c1,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)),x_stoppedEvent(V5),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet(x_stoppedEvent(V5))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_status(V3,x_Inactive)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83c2,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83c2,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c2,2179).
xc_kb_names(a65b12697c83c2,["?sid","?narrative-event","?pframeid","?ddrs-id","?event"]).
xc_mapping_rows(a65b12697c83c2,[]).
xc_exclude_globals(a65b12697c83c2,true).
'x_<=='(x_potentialEvent(V1,V2),x_contextIndependentDrsFor(V3,V1),'x_ist-Information'(x_DrsCaseFn(V3),x_possible(V4))) :- x_cid(a65b12697c83c3,V1,V2,V3,V4).
xc_microtheory(a65b12697c83c3,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c3,2193).
xc_kb_names(a65b12697c83c3,["?sid","?event","?sdrs-id","?statement"]).
xc_mapping_rows(a65b12697c83c3,[]).
xc_exclude_globals(a65b12697c83c3,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)),x_uninferredSentence(x_stoppedEvent(V5)),x_potentialEvent(V1,V5),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V5)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_status(V3,x_Inactive)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83c4,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83c4,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c4,2201).
xc_kb_names(a65b12697c83c4,["?sid","?narrative-event","?pframeid","?ddrs-id","?event"]).
xc_mapping_rows(a65b12697c83c4,[]).
xc_exclude_globals(a65b12697c83c4,true).
'x_<=='(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V1),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V6,V4)),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V4),x_refferingEvent(V3,V7))),'x_ist-Information'(x_DrsCaseFn(V5),'x_causes-EventEvent'(V8,V7)),'x_ist-Information'(V6,x_ordinalRelationFrameForEventPossessive(V9,V10,V8,V1)),'x_ist-Information'(x_DrsCaseFn(V4),x_quantity1(V11,V9)),x_individualSatisfyingConditions(V2,x_IBTGeneration,x_TheSet('x_ist-Information'(x_DrsCaseFn(V4),'x_causes-EventEvent'(V8,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_condition(V3,V11)),x_TheList(x_introducesProcessRoles(x_PresentationEventFn(V1,V2),V3))))) :- x_cid(a65b12697c83c5,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12697c83c5,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c5,2222).
xc_kb_names(a65b12697c83c5,["?sid","?narrative-event","?pframeid","?ddrs-id","?sdrs-id","?dcase","?event","?compevent","?qf1","?qf2","?ordid"]).
xc_mapping_rows(a65b12697c83c5,[]).
xc_exclude_globals(a65b12697c83c5,true).
'x_<=='(x_stoppedEvent(V1),x_drsForDiscourse(V2),'x_ist-Information'(x_DrsCaseFn(V2),x_interrupts(V3,V1))) :- x_cid(a65b12697c83c6,V1,V2,V3).
xc_microtheory(a65b12697c83c6,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c6,2241).
xc_kb_names(a65b12697c83c6,["?event","?ddrs-id","?stop"]).
xc_mapping_rows(a65b12697c83c6,[]).
xc_exclude_globals(a65b12697c83c6,true).
'x_<=='(x_stoppedEvent(V1),x_drsForDiscourse(V2),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V2),x_pathForEvent(V3,V4))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V2),x_entity(V3,V1))),'x_ist-Information'(x_DrsCaseFn(V2),x_objectOfStateChange(V5,V4)),'x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,V6)),x_allFactsAllowed(x_useTransitiveInference(x_genls(V6,x_SeparationEvent)))) :- x_cid(a65b12697c83c7,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c83c7,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c7,2246).
xc_kb_names(a65b12697c83c7,["?event","?ddrs-id","?tframe-id","?path","?event2","?event-type"]).
xc_mapping_rows(a65b12697c83c7,[]).
xc_exclude_globals(a65b12697c83c7,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_ApplicableAnalogy),x_ApplyAnalogy(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b12697c83c8,V1,V2,V3).
xc_microtheory(a65b12697c83c8,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c8,2256).
xc_kb_names(a65b12697c83c8,["?sid","?narrative-event","?process-frame-role"]).
xc_mapping_rows(a65b12697c83c8,[]).
xc_exclude_globals(a65b12697c83c8,true).
'x_<=='(x_ApplyAnalogy(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_DiscourseCaseForDrs(V5,V4))) :- x_cid(a65b12697c83c9,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83c9,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83c9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83c9,2262).
xc_kb_names(a65b12697c83c9,["?sid","?narrative-event","?process-frame-role","?ddrs-id","?case"]).
xc_mapping_rows(a65b12697c83c9,[]).
xc_exclude_globals(a65b12697c83c9,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_realWorld-QPEntity'(V1,V2,V3,V4,V5)) :- x_cid(a65b12697c83ca,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83ca,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83ca,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83ca,2269).
xc_kb_names(a65b12697c83ca,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b12697c83ca,[]).
xc_exclude_globals(a65b12697c83ca,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_artifact-QPEntity'(V1,V2,V3,V4,V5)) :- x_cid(a65b12697c83cb,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83cb,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83cb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83cb,2272).
xc_kb_names(a65b12697c83cb,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b12697c83cb,[]).
xc_exclude_globals(a65b12697c83cb,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5)) :- x_cid(a65b12697c83cc,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83cc,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83cc,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83cc,2275).
xc_kb_names(a65b12697c83cc,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b12697c83cc,[]).
xc_exclude_globals(a65b12697c83cc,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_rateofQuantity-entiy'(V1,V2,V3,V4,V5)) :- x_cid(a65b12697c83cd,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83cd,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83cd,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83cd,2278).
xc_kb_names(a65b12697c83cd,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b12697c83cd,[]).
xc_exclude_globals(a65b12697c83cd,true).
'x_<=='('x_rateofQuantity-entiy'(V1,V2,V3,V4,V5),x_getPotentialIsas(V1,V3,x_PhysicalQuantity,V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b12697c83ce,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83ce,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83ce,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83ce,2281).
xc_kb_names(a65b12697c83ce,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b12697c83ce,[]).
xc_exclude_globals(a65b12697c83ce,true).
'x_<=='('x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5),x_uninferredSentence('x_FC-QPEntity'(V1,V2,V3,V4,V5)),x_getPotentialIsas(V1,V3,'x_InanimateObject-Natural',V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b12697c83cf,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83cf,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83cf,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83cf,2284).
xc_kb_names(a65b12697c83cf,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b12697c83cf,[]).
xc_exclude_globals(a65b12697c83cf,true).
'x_<=='('x_artifact-QPEntity'(V1,V2,V3,V4,V5),x_uninferredSentence('x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_FC-QPEntity'(V1,V2,V3,V4,V5)),x_getPotentialIsas(V1,V3,x_Artifact,V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b12697c83d0,V1,V2,V3,V4,V5).
xc_microtheory(a65b12697c83d0,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83d0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83d0,2288).
xc_kb_names(a65b12697c83d0,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b12697c83d0,[]).
xc_exclude_globals(a65b12697c83d0,true).
'x_<=='('x_realWorld-QPEntity'(V1,V2,V3,V4,V5),x_uninferredSentence(x_unifies(V2,x_MeasurableQuantityFn(V6))),x_uninferredSentence('x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_artifact-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_FC-QPEntity'(V1,V2,V3,V4,V5)),x_getPotentialIsas(V1,V3,x_PartiallyTangible,V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b12697c83d1,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12697c83d1,x_QPInterpretationRulesMt).
xc_source_file(a65b12697c83d1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/qp-narrative-rules.krf').
xc_source_line(a65b12697c83d1,2293).
xc_kb_names(a65b12697c83d1,["?sid","?qtype","?entity","?etype","?ddrs-id","?anything"]).
xc_mapping_rows(a65b12697c83d1,[]).
xc_exclude_globals(a65b12697c83d1,true).
kb_cache_footer(footer{count:149,digest:'46fd55c511e7d726a1c1ba5ae4a86efc4317864df01f4954a39948bb4bce7081',headerDigest:'451b408f38657b145e1d3220e4e0020415740f180b546d321526ecb9661a04f7'}).
