:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:68,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:819,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:db150c3b3ef2132e1c77b8794ced77e5a1a5edcf25b5add381092508539e2d0f,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:44105,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf',sourceHash:b8e584a1daf7350cc3b9f596ca0100497b923c91713ee7d6f7cbd4d97f784466,warnings:[]}).
'x_<=='(x_trueInAnyDrs(V1,V2,V3,V4),x_bindAllDrsValuesForSid(V1,V5,V6,V7),'x_ist-Information'(t(V7),t(V2,V3,V4))) :- x_cid(a65b1269604ef3,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269604ef3,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604ef3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604ef3,16).
xc_kb_names(a65b1269604ef3,["?sid","?pred","?arg1","?arg2","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604ef3,[]).
xc_exclude_globals(a65b1269604ef3,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfQuantityEvent),x_bindAllDrsValuesForSid(V1,V4,V5,V6),'x_ist-Information'(x_NLPScratchPadFn(V4),x_introducesQPQuantityFrame(x_PresentationEventFn(V1,V2),V3))) :- x_cid(a65b1269604ef4,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604ef4,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604ef4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604ef4,25).
xc_kb_names(a65b1269604ef4,["?sid","?narrative-event","?qpframe","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604ef4,[]).
xc_exclude_globals(a65b1269604ef4,true).
'x_<=='(x_introducesQPQuantityFrame(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_quantityTypeOfEntityFound(V1,V5,V6,V7,V8,V9),x_buildsQPFrame(V1,V5,V6,V7,V8,V3,V2),x_buildQPValues(V1,V5,V6,V7,V8,V3,V2)) :- x_cid(a65b1269604ef5,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b1269604ef5,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604ef5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604ef5,49).
xc_kb_names(a65b1269604ef5,["?sid","?nevent","?qframeid","?ddrs-id","?qtype","?quantity","?entity","?etype","?pred"]).
xc_mapping_rows(a65b1269604ef5,[]).
xc_exclude_globals(a65b1269604ef5,true).
'x_<=='(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7),x_drsForDiscourse(V8),x_contextIndependentDrsFor(V9,V1),x_isaQuantityReference(V1,V2,V3,V4,V5,V6),x_groundExpression(V6),x_individualSatisfyingConditions(V7,x_IBTGeneration,x_TheSet(x_groundExpression(V6))),x_groundExpression(V2),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V9),x_referentToQFrame(V1,V6,V4,V3)),x_TheList(x_isaQuantityReference(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b1269604ef6,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b1269604ef6,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604ef6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604ef6,61).
xc_kb_names(a65b1269604ef6,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?ddrs-id","?sdrs-id"]).
xc_mapping_rows(a65b1269604ef6,[]).
xc_exclude_globals(a65b1269604ef6,true).
'x_<=='(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7),x_drsForDiscourse(V8),x_uninferredSentence(x_isaQuantityReference(V1,V2,V3,V4,V5,V6)),x_uninferredSentence(x_genericQuantityReference(V3,V9,V2,V10,V11)),x_individualSatisfyingConditions(V6,x_QuantityFrame,x_TheSet(x_groundExpression(V3),x_groundExpression(V4))),x_individualSatisfyingConditions(V7,x_IBTGeneration,x_TheSet(x_groundExpression(V3),x_groundExpression(V4))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_entity(V6,V4)),x_TheList(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_quantityType(V6,V2)),x_TheList(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_isa(V6,x_QuantityFrame)),x_TheList(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V8),x_relatesToQTypeVar(V6,V3)),x_TheList(x_buildsQPFrame(V1,V2,V3,V4,V5,V6,V7))))) :- x_cid(a65b1269604ef7,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b1269604ef7,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604ef7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604ef7,72).
xc_kb_names(a65b1269604ef7,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?ddrs-id","?sdrs-id","?new-qtype","?substance"]).
xc_mapping_rows(a65b1269604ef7,[]).
xc_exclude_globals(a65b1269604ef7,true).
'x_<=='(x_buildQPValues(V1,V2,V3,V4,V5,V6,V7),x_contextIndependentDrsFor(V8,V1),x_drsForDiscourse(V9),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V9),x_isaQuantityReference(V1,V2,V3,V4,V5,V6))),'x_ist-Information'(x_DrsCaseFn(V9),x_hasQuantityValue(V6,V10,V8))) :- x_cid(a65b1269604ef8,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b1269604ef8,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604ef8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604ef8,95).
xc_kb_names(a65b1269604ef8,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?sdrs-id","?ddrs-id","?value"]).
xc_mapping_rows(a65b1269604ef8,[]).
xc_exclude_globals(a65b1269604ef8,true).
'x_<=='(x_buildQPValues(V1,V2,V3,V4,V5,V6,V7),x_contextIndependentDrsFor(V8,V1),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V8),x_isaQuantityReference(V1,V2,V3,V4,V5,V6)))) :- x_cid(a65b1269604ef9,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1269604ef9,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604ef9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604ef9,103).
xc_kb_names(a65b1269604ef9,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?sdrs-id"]).
xc_mapping_rows(a65b1269604ef9,[]).
xc_exclude_globals(a65b1269604ef9,true).
'x_<=='(x_buildQPValues(V1,V2,V3,V4,V5,V6,V7),x_contextIndependentDrsFor(V8,V1),x_drsForDiscourse(V9),x_uninferredSentence(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V8),x_isaQuantityReference(V1,V2,V3,V4,V5,V6)))),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V9),x_hasQuantityValue(V6,V10,V8)))) :- x_cid(a65b1269604efa,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b1269604efa,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604efa,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604efa,108).
xc_kb_names(a65b1269604efa,["?sid","?qtype","?quantity","?entity","?etype","?qframeid","?nevent","?sdrs-id","?ddrs-id","?value"]).
xc_mapping_rows(a65b1269604efa,[]).
xc_exclude_globals(a65b1269604efa,true).
'x_<=='(x_hasQuantityValue(V1,V2,V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V3),x_hasAmount(V5,t(V6,V2))),x_quantityFrameWithQuantityTypeEntity(V1,V5,V7,V4),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_unitMeasuringThisQuantity(V7,V6))),x_hasQuantityUnit(V1,V6,V4),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantityValue(V1,V2)),x_TheList('x_ist-Information'(x_DrsCaseFn(V4),x_hasQuantityValue(V1,V2,V3))))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantityUnit(V1,V6)),x_TheList('x_ist-Information'(x_DrsCaseFn(V4),x_hasQuantityUnit(V1,V6,V4)))))) :- x_cid(a65b1269604efb,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269604efb,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604efb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604efb,116).
xc_kb_names(a65b1269604efb,["?qframe","?value","?sdrs-id","?ddrs-id","?thing","?unit","?qtype"]).
xc_mapping_rows(a65b1269604efb,[]).
xc_exclude_globals(a65b1269604efb,true).
'x_<=='(x_hasQuantityValue(V1,V2,V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),x_wmOnly(x_lookupOnly('x_ist-Information'(V5,x_drsEntailedBySentence(V3,V6)))),x_bindAllDrsValuesForSid(V6,V4,V5,V7),'x_ist-Information'(x_DrsCaseFn(V7),x_measureForAction(V8,V9,V10)),x_unifies(V9,t(V11,V12)),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantityValue(V1,V12)),x_TheList('x_ist-Information'(x_DrsCaseFn(V4),x_hasQuantityValue(V1,V2,V3))))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantityUnit(x_PerFn(V11,V12))),x_TheList('x_ist-Information'(x_DrsCaseFn(V4),x_hasQuantityValue(V1,V2,V3)))))) :- x_cid(a65b1269604efc,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b1269604efc,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604efc,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604efc,127).
xc_kb_names(a65b1269604efc,["?qframe","?value","?sdrs-id","?ddrs-id","?dcase","?sid","?any-sdrs-id","?resolved-ent","?unit1","?denom","?unit","?val"]).
xc_mapping_rows(a65b1269604efc,[]).
xc_exclude_globals(a65b1269604efc,true).
'x_<=='(x_hasQuantityValue(V1,V2,V3),x_drsForDiscourse(V4),x_quantityFrameWithQuantityTypeEntity(V1,V5,V6,V4),'x_ist-Information'(x_DrsCaseFn(V4),x_relatesToQTypeVar(V1,V2)),x_allFactsAllowed(x_useTransitiveInference('x_ist-Information'(x_UniversalVocabularyMt,x_isa(V2,x_Quantity)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V4),x_quantityValue(V1,V2)),x_TheList('x_ist-Information'(x_DrsCaseFn(V4),x_hasQuantityValue(V1,V2,V3)))))) :- x_cid(a65b1269604efd,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604efd,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604efd,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604efd,141).
xc_kb_names(a65b1269604efd,["?qframe","?value","?sdrs-id","?ddrs-id","?thing","?qtype"]).
xc_mapping_rows(a65b1269604efd,[]).
xc_exclude_globals(a65b1269604efd,true).
'x_<=='(x_hasQuantityUnit(V1,V2,V3),x_quantityFrameWithQuantityTypeEntity(V1,V4,V5,V3),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_unitMeasuringThisQuantity(V5,V2)))) :- x_cid(a65b1269604efe,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604efe,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604efe,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604efe,149).
xc_kb_names(a65b1269604efe,["?qframe","?unit","?ddrs-id","?thing","?qtype"]).
xc_mapping_rows(a65b1269604efe,[]).
xc_exclude_globals(a65b1269604efe,true).
'x_<=='(x_quantityFrameWithQuantityTypeEntity(V1,V2,V3,V4),'x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V3)),'x_ist-Information'(x_DrsCaseFn(V4),x_entity(V1,V2))) :- x_cid(a65b1269604eff,V1,V2,V3,V4).
xc_microtheory(a65b1269604eff,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604eff,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604eff,154).
xc_kb_names(a65b1269604eff,["?qframe","?thing","?qtype","?ddrs-id"]).
xc_mapping_rows(a65b1269604eff,[]).
xc_exclude_globals(a65b1269604eff,true).
'x_<=='(x_quantityFrameWithQuantityTypeEntity(V1,V2,V3,V4),'x_ist-Information'(x_DrsCaseFn(V4),x_quantityType(V1,V3)),'x_ist-Information'(x_DrsCaseFn(V4),x_entity(V1,x_ContainedStuffFn(V5,V6,V2)))) :- x_cid(a65b1269604f00,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604f00,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f00,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f00,158).
xc_kb_names(a65b1269604f00,["?qframe","?thing","?qtype","?ddrs-id","?subst","?form"]).
xc_mapping_rows(a65b1269604f00,[]).
xc_exclude_globals(a65b1269604f00,true).
'x_<=='(x_isaOrDenotesInSid(V1,V2,V3),x_bindAllDrsValuesForSid(V3,V4,V5,V6),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V6),x_isa(V1,V2)))) :- x_cid(a65b1269604f01,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604f01,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f01,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f01,163).
xc_kb_names(a65b1269604f01,["?ent","?col-or-pred","?sid","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604f01,[]).
xc_exclude_globals(a65b1269604f01,true).
'x_<=='(x_isaOrDenotesInSid(V1,V2,V3),x_bindAllDrsValuesForSid(V3,V4,V5,V6),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V6),'x_denotes-Underspecified'(V1,V2)))) :- x_cid(a65b1269604f02,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604f02,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f02,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f02,166).
xc_kb_names(a65b1269604f02,["?ent","?col-or-pred","?sid","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604f02,[]).
xc_exclude_globals(a65b1269604f02,true).
'x_<=='(x_isaOrDenotesInSid(V1,V2,V3),x_bindAllDrsValuesForSid(V3,V4,V5,V6),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V6),'x_denotesFunction-Underspecified'(V1,V2)))) :- x_cid(a65b1269604f03,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604f03,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f03,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f03,169).
xc_kb_names(a65b1269604f03,["?ent","?col-or-pred","?sid","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604f03,[]).
xc_exclude_globals(a65b1269604f03,true).
'x_<=='(x_qlabel(V1),x_true) :- x_cid(a65b1269604f04,V1).
xc_microtheory(a65b1269604f04,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f04,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f04,177).
xc_kb_names(a65b1269604f04,["?x"]).
xc_mapping_rows(a65b1269604f04,[]).
xc_exclude_globals(a65b1269604f04,true).
'x_<=='(x_fixPolysemy1(V1),x_true) :- x_cid(a65b1269604f05,V1).
xc_microtheory(a65b1269604f05,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f05,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f05,195).
xc_kb_names(a65b1269604f05,["?qtype"]).
xc_mapping_rows(a65b1269604f05,[]).
xc_exclude_globals(a65b1269604f05,true).
'x_<=='(x_fixPolysemy2(V1),x_unifies(V1,x_MeasurableQuantityFn(x_cityFoodProduction))) :- x_cid(a65b1269604f06,V1).
xc_microtheory(a65b1269604f06,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f06,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f06,198).
xc_kb_names(a65b1269604f06,["?qtype"]).
xc_mapping_rows(a65b1269604f06,[]).
xc_exclude_globals(a65b1269604f06,true).
'x_<=='(x_wrapquantity(V1,V2,V3,V4),x_unifies(V4,V3)) :- x_cid(a65b1269604f07,V1,V2,V3,V4).
xc_microtheory(a65b1269604f07,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f07,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f07,218).
xc_kb_names(a65b1269604f07,["?sid","?quantity-res","?qtype","?new-type"]).
xc_mapping_rows(a65b1269604f07,[]).
xc_exclude_globals(a65b1269604f07,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),'x_ist-Information'(x_DrsCaseFn(V9),'x_requires-Underspecified'(V10,V11)),x_unifies(V6,'x_requires-Underspecified'),x_resolvedVar(V1,V11,V12),x_resolvedVar(V1,V10,V3),x_quantityInDrs(V10,V1,V13),x_unifies(V2,x_AmountRequiredFn(V13)),x_validQPEntity(V1,V2,V11,V5,V7),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V9),x_isa(V11,V5)))),'x_ist-Information'(V8,x_wrapEntity(V12,V4,V9))) :- x_cid(a65b1269604f08,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b1269604f08,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f08,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f08,225).
xc_kb_names(a65b1269604f08,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?pred","?ddrs-id","?dcase","?sdrs-id","?quantity","?entity","?entity-res","?qtype1"]).
xc_mapping_rows(a65b1269604f08,[]).
xc_exclude_globals(a65b1269604f08,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),'x_ist-Information'(x_DrsCaseFn(V9),x_possessiveRelation(V10,V11)),x_unifies(V6,x_possessiveRelation),x_quantityInDrs(V11,V1,V12),x_fixPolysemy2(V12),x_resolvedVar(V1,V10,V13),x_resolvedVar(V1,V11,V3),x_groundExpression(V13),x_groundExpression(V3),x_validQPEntity(V1,V12,V10,V5,V7),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V9),x_isa(V10,V5)))),'x_ist-Information'(V8,x_wrapEntity(V13,V4,V9)),x_wrapquantity(V1,V11,V12,V2),x_uninferredSentence(x_stopUnboundQuantities(V1,V10,V5,V2)),'x_ist-Information'(V8,x_qlabel(1))) :- x_cid(a65b1269604f09,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b1269604f09,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f09,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f09,238).
xc_kb_names(a65b1269604f09,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?pred","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?qtype1","?entity-res"]).
xc_mapping_rows(a65b1269604f09,[]).
xc_exclude_globals(a65b1269604f09,true).
'x_<=='(x_stopUnboundQuantities(V1,V2,V3,V4),x_unifies(V4,x_AmountFn(V3))) :- x_cid(a65b1269604f0a,V1,V2,V3,V4).
xc_microtheory(a65b1269604f0a,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f0a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f0a,256).
xc_kb_names(a65b1269604f0a,["?sid","?entity","?etype","?qtype"]).
xc_mapping_rows(a65b1269604f0a,[]).
xc_exclude_globals(a65b1269604f0a,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),'x_ist-Information'(x_DrsCaseFn(V9),x_possessiveRelation(V10,V11)),x_contraContain(V1,V12,V10),x_unifies(V6,x_possessiveRelation),x_quantityInDrs(V11,V1,V13),x_uninferredSentence(x_fixPolysemy2(V13)),x_fixPolysemy1(V13),x_resolvedVar(V1,V12,V14),x_resolvedVar(V1,V11,V3),x_groundExpression(V14),x_groundExpression(V3),x_validQPEntity(V1,V2,V12,V5,V7),x_bindAllDrsValuesForSid(V1,V7,V8,V15),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V15),x_isa(V12,V5)))),'x_ist-Information'(V8,x_wrapEntity(V14,V4,V9)),x_wrapquantity(V1,V11,V13,V2),'x_ist-Information'(V8,x_qlabel(1))) :- x_cid(a65b1269604f0b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15).
xc_microtheory(a65b1269604f0b,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f0b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f0b,262).
xc_kb_names(a65b1269604f0b,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?pred","?ddrs-id","?dcase","?sdrs-id","?thing","?quantity","?entity","?qtype1","?entity-res","?any"]).
xc_mapping_rows(a65b1269604f0b,[]).
xc_exclude_globals(a65b1269604f0b,true).
'x_<=='(x_contraContain(V1,V2,V3),x_bindAllDrsValuesForSid(V1,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V6),'x_in-UnderspecifiedContainer'(V3,V2))) :- x_cid(a65b1269604f0c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604f0c,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f0c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f0c,281).
xc_kb_names(a65b1269604f0c,["?sid","?cont","?entity","?ddrs-id","?dcase","?sdrs-id2"]).
xc_mapping_rows(a65b1269604f0c,[]).
xc_exclude_globals(a65b1269604f0c,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),'x_ist-Information'(x_DrsCaseFn(V9),x_possessiveRelation(V10,V11)),x_uninferredSentence(x_contraContain(V1,V12,V10)),x_unifies(V6,x_possessiveRelation),x_quantityInDrs(V11,V1,V13),x_uninferredSentence(x_fixPolysemy2(V13)),x_fixPolysemy1(V13),x_resolvedVar(V1,V10,V14),x_resolvedVar(V1,V11,V3),x_groundExpression(V14),x_groundExpression(V3),x_validQPEntity(V1,V2,V10,V5,V7),x_bindAllDrsValuesForSid(V1,V7,V8,V15),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V15),x_isa(V10,V5)))),'x_ist-Information'(V8,x_wrapEntity(V14,V4,V9)),x_wrapquantity(V1,V11,V13,V2),x_uninferredSentence(x_stopUnboundQuantities(V1,V10,V5,V2)),'x_ist-Information'(V8,x_qlabel(1))) :- x_cid(a65b1269604f0d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15).
xc_microtheory(a65b1269604f0d,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f0d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f0d,285).
xc_kb_names(a65b1269604f0d,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?pred","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?cont","?qtype1","?entity-res","?any"]).
xc_mapping_rows(a65b1269604f0d,[]).
xc_exclude_globals(a65b1269604f0d,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),x_findQuantityInDrs(V1,V10,V9,V2),x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V9),x_isa(V10,V2))),'x_ist-Information'(V8,x_dvSpanInParseTree(V10,x_SpanFn(V11,V12),V13)),'x_ist-Information'(V8,x_dvSpanInParseTree(V14,x_SpanFn(V15,V11),V13)),x_getPotentialIsas(V1,V14,x_SomethingExisting,V5,x_WorldLikeOursCollectorMt,V7),x_wmOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V9),x_isa(V14,V5)))),x_resolvedVar(V1,V14,V16),x_resolvedVar(V1,V10,V3),x_groundExpression(V16),x_groundExpression(V3),'x_ist-Information'(V8,x_wrapEntity(V16,V4,V9)),x_unifies(V6,x_possessiveRelation)) :- x_cid(a65b1269604f0e,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16).
xc_microtheory(a65b1269604f0e,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f0e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f0e,318).
xc_kb_names(a65b1269604f0e,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?pred","?ddrs-id","?dcase","?sdrs-id","?quantity","?num2","?num3","?parse-tree","?entity","?num1","?entity-res"]).
xc_mapping_rows(a65b1269604f0e,[]).
xc_exclude_globals(a65b1269604f0e,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),'x_ist-Information'(x_DrsCaseFn(V9),x_possessiveRelation(V10,V11)),x_resolvedVar(V1,V10,V12),x_resolvedVar(V1,V11,V3),x_getPotentialIsas(V1,V11,x_LiquidTangibleThing,V5,x_WorldLikeOursCollectorMt,V7),'x_ist-Information'(x_DrsCaseFn(V9),x_isa(V3,V5)),x_unifies(V4,x_ContainedStuffFn(V3,x_default,V12)),x_unifies(V2,x_Amount),x_unifies(V6,x_possessiveRelation)) :- x_cid(a65b1269604f0f,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b1269604f0f,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f0f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f0f,344).
xc_kb_names(a65b1269604f0f,["?sid","?qtype","?quantity-res","?entity-wrapped","?chem","?pred","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?entity-res"]).
xc_mapping_rows(a65b1269604f0f,[]).
xc_exclude_globals(a65b1269604f0f,true).
'x_<=='(x_contraIn(V1,V2,V3),x_bindAllDrsValuesForSid(V1,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V6),x_possessiveRelation(V2,V3))) :- x_cid(a65b1269604f10,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604f10,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f10,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f10,358).
xc_kb_names(a65b1269604f10,["?sid","?entity2","?quantity","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604f10,[]).
xc_exclude_globals(a65b1269604f10,true).
'x_<=='(x_contraIn(V1,V2,V3),x_bindAllDrsValuesForSid(V1,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V6),'x_requires-Underspecified'(V3,V2))) :- x_cid(a65b1269604f11,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604f11,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f11,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f11,362).
xc_kb_names(a65b1269604f11,["?sid","?entity2","?quantity","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604f11,[]).
xc_exclude_globals(a65b1269604f11,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),'x_ist-Information'(x_DrsCaseFn(V9),'x_in-UnderspecifiedContainer'(V10,V11)),x_groundExpression(V10),x_uninferredSentence(x_contraIn(V1,V12,V10)),x_quantityInDrs(V10,V1,V13),x_isaOrDenotesInSid(V10,V13,V1),x_groundExpression(V11),x_validQPEntity(V1,V13,V11,V5,V7),x_wmOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V9),x_isa(V11,V5)))),x_resolvedVar(V1,V11,V14),x_resolvedVar(V1,V10,V3),x_wrapquantity(V1,V10,V13,V2),'x_ist-Information'(V8,x_wrapEntity(V14,V4,V9)),x_qlabel(5),x_unifies(V6,'x_in-UnderspecifiedContainer')) :- x_cid(a65b1269604f12,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b1269604f12,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f12,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f12,370).
xc_kb_names(a65b1269604f12,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?pred","?ddrs-id","?dcase","?sdrs-id","?quantity","?entity","?entity2","?qtype1","?entity-res"]).
xc_mapping_rows(a65b1269604f12,[]).
xc_exclude_globals(a65b1269604f12,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),'x_ist-Information'(x_DrsCaseFn(V9),'x_contains-Underspecified'(V10,V11)),x_groundExpression(V10),x_groundExpression(V11),x_localOnly('x_ist-Information'(x_DrsCaseFn(V9),x_hasAmount(V12,V13))),x_getPotentialIsas(V1,V11,x_LiquidTangibleThing,V5,x_WorldLikeOursCollectorMt,V7),x_wmOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V9),x_isa(V11,V5)))),x_resolvedVar(V1,V10,V14),x_resolvedVar(V1,V11,V3),x_unifies(V2,x_Amount),x_unifies(V4,x_ContainedStuffFn(V3,x_default,V14)),x_unifies(V6,'x_contains-Underspecified')) :- x_cid(a65b1269604f13,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b1269604f13,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f13,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f13,394).
xc_kb_names(a65b1269604f13,["?sid","?qtype","?quantity-res","?entity-wrapped","?etype","?pred","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?container","?amount","?entity-res"]).
xc_mapping_rows(a65b1269604f13,[]).
xc_exclude_globals(a65b1269604f13,true).
'x_<=='(x_quantityTypeOfEntityFound(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),x_getAllPotentialBinPreds(V1,V10,x_QuantitySlot,V6,x_WorldLikeOursCollectorMt),x_different(V6,x_isa),x_different(V6,x_HypothesizedPrepositionSenseFn('x_Per-TheWord',x_Preposition)),'x_ist-Information'(x_DrsCaseFn(V9),t(V6,V10,V11)),x_groundExpression(V10),x_groundExpression(V11),x_unifies(V2,x_resultingQTypeFn(V6)),x_getPotentialIsas(V1,V10,x_PartiallyTangible,V5,x_WorldLikeOursCollectorMt,V7),x_wmOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V9),x_isa(V10,V5)))),x_resolvedVar(V1,V10,V4),x_resolvedVar(V1,V11,V3),'x_ist-Information'(V8,x_wrapEntity(V4,V12,V9))) :- x_cid(a65b1269604f14,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b1269604f14,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f14,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f14,413).
xc_kb_names(a65b1269604f14,["?sid","?qtype","?quantity-res","?entity-res","?etype","?pred","?ddrs-id","?dcase","?sdrs-id","?entity","?quantity","?entity-wrapped"]).
xc_mapping_rows(a65b1269604f14,[]).
xc_exclude_globals(a65b1269604f14,true).
'x_<=='(x_isaQuantityReference(V1,V2,V3,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V7),x_contextIndependentDrsFor(V8,V1)),x_lookupOnly('x_ist-Information'(V9,x_quantityType(V6,V10))),x_different(V9,x_DrsCaseFn(V8)),x_kbOnly(x_useTransitiveInference('x_ist-Information'(x_QPInterpretationMt,x_genls(V2,V10)))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V6,V4)))) :- x_cid(a65b1269604f15,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b1269604f15,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f15,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f15,478).
xc_kb_names(a65b1269604f15,["?sid","?qtype","?quantity","?entity","?etype","?qtframeid","?ddrs-id","?sdrs-id","?sdrs2","?qtype1"]).
xc_mapping_rows(a65b1269604f15,[]).
xc_exclude_globals(a65b1269604f15,true).
'x_<=='(x_isaQuantityReference(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),x_lookupOnly('x_ist-Information'(V10,x_quantityType(V6,V11))),x_different(V10,x_DrsCaseFn(V9)),x_kbOnly(x_useTransitiveInference('x_ist-Information'(x_QPInterpretationMt,x_genls(V2,V11)))),x_unifies(V4,x_ContainedStuffFn(V12,x_default,V13)),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V6,x_ContainedStuffFn(V14,x_default,V13)))),'x_ist-Information'(x_DrsCaseFn(V7),x_isa(V14,V5)),x_groundExpression(V3),x_groundExpression(V2)) :- x_cid(a65b1269604f16,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b1269604f16,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f16,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f16,491).
xc_kb_names(a65b1269604f16,["?sid","?qtype","?quantity","?entity","?etype","?qtframeid","?ddrs-id","?dcase","?sdrs-id","?sdrs2","?qtype1","?subst","?e1","?subst2"]).
xc_mapping_rows(a65b1269604f16,[]).
xc_exclude_globals(a65b1269604f16,true).
'x_<=='(x_isaQuantityReference(V1,V2,V3,V4,V5,V6),x_bindAllDrsValuesForSid(V1,V7,V8,V9),x_lookupOnly(x_diPredicate(V10,V11,V12,V13,V14,V15,V16)),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V6,V12))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V6,V17))),x_contextIndependentDrsFor(V18,V10),x_different(V18,V9),x_kbOnly('x_ist-Information'(x_QPInterpretationMt,x_genls(V2,V17))),x_unifies(V17,x_Rate),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_entity(V6,V19))),x_resolvedVar(V1,V4,V20),x_groundExpression(V3),x_groundExpression(V2)) :- x_cid(a65b1269604f17,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18,V19,V20).
xc_microtheory(a65b1269604f17,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f17,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f17,508).
xc_kb_names(a65b1269604f17,["?sid","?qtype","?quantity","?entity","?etype","?qtframeid","?ddrs-id","?dcase","?sdrs-id","?sid2","?event2","?event-res2","?event-type2","?quantity2","?quantity-res2","?qtypedi","?qtype1","?sdrs-id2","?rate-event","?entity-res"]).
xc_mapping_rows(a65b1269604f17,[]).
xc_exclude_globals(a65b1269604f17,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_groundExpression(V1),x_drsForDiscourse(V4),x_getPotentialIsas(V2,V1,x_PhysicalQuantity,V3,x_WorldLikeOursCollectorMt,V4),x_bindAllDrsValuesForSid(V2,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V6),x_isa(V1,V3)),x_groundExpression(V3)) :- x_cid(a65b1269604f18,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604f18,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f18,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f18,536).
xc_kb_names(a65b1269604f18,["?dv","?sid","?qtype","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604f18,[]).
xc_exclude_globals(a65b1269604f18,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_groundExpression(V2),x_groundExpression(V1),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),x_wmOnly(x_lookupOnly('x_ist-Information'(V5,x_drsEntailedBySentence(V2,V6)))),x_bindAllDrsValuesForSid(V6,V4,V5,V7),'x_ist-Information'(x_DrsCaseFn(V7),'x_denotesRelation-Underspecified'(V1,V8)),x_allFactsAllowed('x_ist-Information'(x_UniversalVocabularyMt,x_isa(V8,x_MeasurableQuantitySlot))),x_allFactsAllowed('x_ist-Information'(x_UniversalVocabularyMt,x_arg2Isa(V8,x_Rate))),x_unifies(V3,x_Rate),x_groundExpression(V3)) :- x_cid(a65b1269604f19,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1269604f19,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f19,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f19,551).
xc_kb_names(a65b1269604f19,["?dv","?drs","?qtype","?ddrs-id","?dcase","?sid","?sdrs-id","?relation"]).
xc_mapping_rows(a65b1269604f19,[]).
xc_exclude_globals(a65b1269604f19,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_groundExpression(V1),x_drsForDiscourse(V4),x_bindAllDrsValuesForSid(V2,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V6),'x_denotesFunction-Underspecified'(V1,V7)),x_kbOnly(x_useTransitiveInference('x_ist-Information'(x_FreecivMt,x_isa(V7,x_UnaryFunction)))),x_unifies(V3,x_resultingQTypeFn(V7))) :- x_cid(a65b1269604f1a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269604f1a,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f1a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f1a,568).
xc_kb_names(a65b1269604f1a,["?dv","?sid","?qtype","?ddrs-id","?dcase","?sdrs-id","?pred"]).
xc_mapping_rows(a65b1269604f1a,[]).
xc_exclude_globals(a65b1269604f1a,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_groundExpression(V1),x_bindAllDrsValuesForSid(V2,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V6),'x_denotes-Underspecified'(V1,x_MeasurableQuantityFn(V7))),x_unifies(V3,x_MeasurableQuantityFn(V7))) :- x_cid(a65b1269604f1b,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269604f1b,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f1b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f1b,589).
xc_kb_names(a65b1269604f1b,["?dv","?sid","?qtype","?ddrs-id","?dcase","?sdrs-id","?pred"]).
xc_mapping_rows(a65b1269604f1b,[]).
xc_exclude_globals(a65b1269604f1b,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_groundExpression(V2),x_groundExpression(V1),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),x_wmOnly(x_lookupOnly('x_ist-Information'(V5,x_drsEntailedBySentence(V2,V6)))),x_bindAllDrsValuesForSid(V6,V4,V5,V7),'x_ist-Information'(x_DrsCaseFn(V7),'x_denotesFunction-Underspecified'(V1,x_MeasurableQuantityFn(V8))),x_unifies(V3,x_MeasurableQuantityFn(V8))) :- x_cid(a65b1269604f1c,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1269604f1c,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f1c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f1c,594).
xc_kb_names(a65b1269604f1c,["?dv","?drs","?qtype","?ddrs-id","?dcase","?sid","?sdrs-id","?pred"]).
xc_mapping_rows(a65b1269604f1c,[]).
xc_exclude_globals(a65b1269604f1c,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_groundExpression(V1),x_drsForDiscourse(V4),x_bindAllDrsValuesForSid(V2,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V6),'x_denotesRelation-Underspecified'(V1,V7)),x_allFactsAllowed('x_ist-Information'(x_UniversalVocabularyMt,x_isa(V7,x_NumericIntervalSlot))),x_unifies(V3,x_Rate),x_groundExpression(V3)) :- x_cid(a65b1269604f1d,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269604f1d,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f1d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f1d,604).
xc_kb_names(a65b1269604f1d,["?dv","?sid","?qtype","?ddrs-id","?dcase","?sdrs-id","?relation"]).
xc_mapping_rows(a65b1269604f1d,[]).
xc_exclude_globals(a65b1269604f1d,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_bindAllDrsValuesForSid(V4,V5,V6,V7),'x_ist-Information'(x_DrsCaseFn(V7),'x_denotesRelation-Underspecified'(V1,V8)),x_allFactsAllowed('x_ist-Information'(x_UniversalVocabularyMt,x_isa(V8,x_ComplexQuantityPredicate))),x_allFactsAllowed('x_ist-Information'(x_UniversalVocabularyMt,x_arg3Isa(V8,x_Rate))),x_unifies(V3,x_Rate),x_groundExpression(V3)) :- x_cid(a65b1269604f1e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1269604f1e,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f1e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f1e,614).
xc_kb_names(a65b1269604f1e,["?dv","?drs","?qtype","?sid","?ddrs-id","?dcase","?sdrs-id","?relation"]).
xc_mapping_rows(a65b1269604f1e,[]).
xc_exclude_globals(a65b1269604f1e,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_groundExpression(V2),x_groundExpression(V1),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),x_wmOnly(x_lookupOnly('x_ist-Information'(V5,x_drsEntailedBySentence(V2,V6)))),x_uninferredSentence(x_getPotentialIsas(V6,V1,x_PhysicalQuantity,V3,x_WorldLikeOursCollectorMt,V4)),x_uninferredSentence(x_getPotentialIsas(V6,V1,x_FreecivQtype,V3,x_FreecivMt,V4)),x_validQPEntity(V6,V3,V1,V7,V4),'x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,V7)),x_unifies(V3,x_AmountFn(V7)),x_groundExpression(V7)) :- x_cid(a65b1269604f1f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269604f1f,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f1f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f1f,627).
xc_kb_names(a65b1269604f1f,["?dv","?drs","?qtype","?ddrs-id","?dcase","?sid","?etype"]).
xc_mapping_rows(a65b1269604f1f,[]).
xc_exclude_globals(a65b1269604f1f,true).
'x_<=='(x_quantityInDrs(V1,V2,V3),x_groundExpression(V1),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),x_wmOnly(x_lookupOnly('x_ist-Information'(V5,x_drsEntailedBySentence(V2,V6)))),x_bindAllDrsValuesForSid(V6,V4,V5,V7),'x_ist-Information'(x_DrsCaseFn(V7),x_isa(V1,'x_Number-General')),x_bindAllDrsValuesForSid(V6,V4,V5,V8),'x_ist-Information'(x_DrsCaseFn(V8),x_possessiveRelation(V9,V1)),x_validQPEntity(V6,x_Amount,V9,V10,V4),x_unifies(V3,x_AmountFn(V10))) :- x_cid(a65b1269604f20,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b1269604f20,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f20,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f20,645).
xc_kb_names(a65b1269604f20,["?dv","?drs","?qtype","?ddrs-id","?dcase","?sid","?sdrs-id","?sdrs-id2","?ent","?etype"]).
xc_mapping_rows(a65b1269604f20,[]).
xc_exclude_globals(a65b1269604f20,true).
'x_<=='(x_findQuantityInDrs(V1,V2,V3,V4),x_bindAllDrsValuesForSid(V1,V5,V6,V7),x_getAllPotentialIsas(V1,V2,x_PhysicalQuantity,V4,x_WorldLikeOursCollectorMt,V5),'x_ist-Information'(x_DrsCaseFn(V7),x_isa(V2,V4)),x_groundExpression(V4)) :- x_cid(a65b1269604f21,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269604f21,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f21,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f21,660).
xc_kb_names(a65b1269604f21,["?sid","?dv","?drs","?qtype","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604f21,[]).
xc_exclude_globals(a65b1269604f21,true).
'x_<=='(x_wrapEntity(V1,V2,V3),'x_ist-Information'(x_DrsCaseFn(V3),'x_in-UnderspecifiedContainer'(V1,V4)),x_unifies(V2,x_ContainedStuffFn(V1,x_default,V4))) :- x_cid(a65b1269604f22,V1,V2,V3,V4).
xc_microtheory(a65b1269604f22,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f22,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f22,670).
xc_kb_names(a65b1269604f22,["?entity-res","?entity-wrapped","?sdrs-id","?container"]).
xc_mapping_rows(a65b1269604f22,[]).
xc_exclude_globals(a65b1269604f22,true).
'x_<=='(x_wrapEntity(V1,V2,V3),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V3),'x_in-UnderspecifiedContainer'(V1,V4))),x_unifies(V1,V2)) :- x_cid(a65b1269604f23,V1,V2,V3,V4).
xc_microtheory(a65b1269604f23,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f23,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f23,679).
xc_kb_names(a65b1269604f23,["?entity-res","?entity-wrapped","?sdrs-id","?container"]).
xc_mapping_rows(a65b1269604f23,[]).
xc_exclude_globals(a65b1269604f23,true).
'x_<=='(x_resolvedVar(V1,V2,V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),'x_ist-Information'(V5,x_filterByPreference(x_resolveReference(x_ReferenceInSentenceFn(V2,V1),x_ReferentInDrsFn(V3,V4)))),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V4),x_ContradictoryPossessives(V2,V3)))) :- x_cid(a65b1269604f24,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f24,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f24,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f24,686).
xc_kb_names(a65b1269604f24,["?sid","?orig-var","?discourse-var","?ddrs-id","?dcase"]).
xc_mapping_rows(a65b1269604f24,[]).
xc_exclude_globals(a65b1269604f24,true).
'x_<=='(x_resolvedVar(V1,V2,V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),'x_ist-Information'(V5,x_uninferredSentence(x_filterByPreference(x_resolveReference(x_ReferenceInSentenceFn(V2,V1),x_ReferentInDrsFn(V3,V4))))),x_unifies(V2,V3)) :- x_cid(a65b1269604f25,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f25,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f25,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f25,697).
xc_kb_names(a65b1269604f25,["?sid","?orig-var","?discourse-var","?ddrs-id","?dcase"]).
xc_mapping_rows(a65b1269604f25,[]).
xc_exclude_globals(a65b1269604f25,true).
'x_<=='(x_resolvedVar(V1,V2,V3),x_drsForDiscourse(V4),'x_ist-Information'(x_DrsCaseFn(V4),x_discourseCaseForDrs(V5,V4)),'x_ist-Information'(V5,x_filterByPreference(x_resolveReference(x_ReferenceInSentenceFn(V2,V1),x_ReferentInDrsFn(V6,V4)))),'x_ist-Information'(x_DrsCaseFn(V4),x_ContradictoryPossessives(V2,V6)),x_unifies(V2,V3)) :- x_cid(a65b1269604f26,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269604f26,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f26,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f26,709).
xc_kb_names(a65b1269604f26,["?sid","?orig-var","?discourse-var2","?ddrs-id","?dcase","?discourse-var"]).
xc_mapping_rows(a65b1269604f26,[]).
xc_exclude_globals(a65b1269604f26,true).
'x_<=='(x_ContradictoryPossessives(V1,V2),x_bindAllDrsValuesForSid(V3,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V6),x_possessiveRelation(V7,V1)),'x_ist-Information'(x_DrsCaseFn(V4),x_possessiveRelation(V8,V2)),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V6),x_isa(V7,V9)))),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V4),x_isa(V8,V10)))),x_uninferredSentence(x_genls(x_sub,x_sub2))) :- x_cid(a65b1269604f27,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b1269604f27,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f27,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f27,721).
xc_kb_names(a65b1269604f27,["?orig-var","?discourse-var","?sid","?ddrs-id","?dcase","?sdrs-id","?thing","?thing2","?sub","?sub2"]).
xc_mapping_rows(a65b1269604f27,[]).
xc_exclude_globals(a65b1269604f27,true).
'x_<=='(x_ContradictoryPossessives(V1,V2),x_bindAllDrsValuesForSid(V3,V4,V5,V6),'x_ist-Information'(x_DrsCaseFn(V6),x_possessiveRelation(V7,V1)),'x_ist-Information'(x_DrsCaseFn(V6),x_possessiveRelation(V8,V2)),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V6),x_isa(V7,V9)))),x_nonTransitiveInference(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V6),x_isa(V8,V10)))),x_uninferredSentence(x_genls(x_sub,x_sub2))) :- x_cid(a65b1269604f28,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b1269604f28,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f28,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f28,729).
xc_kb_names(a65b1269604f28,["?orig-var","?discourse-var","?sid","?ddrs-id","?dcase","?sdrs-id","?thing","?thing2","?sub","?sub2"]).
xc_mapping_rows(a65b1269604f28,[]).
xc_exclude_globals(a65b1269604f28,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_realWorld-QPEntity'(V1,V2,V3,V4,V5)) :- x_cid(a65b1269604f29,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f29,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f29,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f29,745).
xc_kb_names(a65b1269604f29,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f29,[]).
xc_exclude_globals(a65b1269604f29,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_artifact-QPEntity'(V1,V2,V3,V4,V5)) :- x_cid(a65b1269604f2a,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f2a,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f2a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f2a,748).
xc_kb_names(a65b1269604f2a,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f2a,[]).
xc_exclude_globals(a65b1269604f2a,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5)) :- x_cid(a65b1269604f2b,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f2b,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f2b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f2b,751).
xc_kb_names(a65b1269604f2b,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f2b,[]).
xc_exclude_globals(a65b1269604f2b,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_organic-QPEntity'(V1,V2,V3,V4,V5)) :- x_cid(a65b1269604f2c,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f2c,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f2c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f2c,754).
xc_kb_names(a65b1269604f2c,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f2c,[]).
xc_exclude_globals(a65b1269604f2c,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),x_unifies(V3,x_GameUnitQuantityFn(V2)),x_unifies(V4,x_GameUnit)) :- x_cid(a65b1269604f2d,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f2d,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f2d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f2d,758).
xc_kb_names(a65b1269604f2d,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f2d,[]).
xc_exclude_globals(a65b1269604f2d,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_conduit-QPEntity'(V1,V2,V3,V4,V5)) :- x_cid(a65b1269604f2e,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f2e,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f2e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f2e,761).
xc_kb_names(a65b1269604f2e,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f2e,[]).
xc_exclude_globals(a65b1269604f2e,true).
'x_<=='(x_validQPEntity(V1,V2,V3,V4,V5),'x_rateofQuantity-entiy'(V1,V2,V3,V4,V5)) :- x_cid(a65b1269604f2f,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f2f,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f2f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f2f,764).
xc_kb_names(a65b1269604f2f,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f2f,[]).
xc_exclude_globals(a65b1269604f2f,true).
'x_<=='('x_rateofQuantity-entiy'(V1,V2,V3,V4,V5),x_getPotentialIsas(V1,V3,x_PhysicalQuantity,V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b1269604f30,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f30,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f30,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f30,767).
xc_kb_names(a65b1269604f30,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f30,[]).
xc_exclude_globals(a65b1269604f30,true).
'x_<=='('x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5),x_uninferredSentence('x_FC-QPEntity'(V1,V2,V3,V4,V5)),x_getPotentialIsas(V1,V3,'x_InanimateObject-Natural',V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b1269604f31,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f31,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f31,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f31,773).
xc_kb_names(a65b1269604f31,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f31,[]).
xc_exclude_globals(a65b1269604f31,true).
'x_<=='('x_organic-QPEntity'(V1,V2,V3,V4,V5),x_uninferredSentence('x_FC-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5)),x_getPotentialIsas(V1,V3,x_NaturalTangibleStuff,V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b1269604f32,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f32,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f32,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f32,777).
xc_kb_names(a65b1269604f32,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f32,[]).
xc_exclude_globals(a65b1269604f32,true).
'x_<=='('x_conduit-QPEntity'(V1,V2,V3,V4,V5),x_uninferredSentence('x_FC-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_organic-QPEntity'(V1,V2,V3,V4,V5)),x_getPotentialIsas(V1,V3,x_FluidConduit,V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b1269604f33,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f33,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f33,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f33,782).
xc_kb_names(a65b1269604f33,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f33,[]).
xc_exclude_globals(a65b1269604f33,true).
'x_<=='('x_artifact-QPEntity'(V1,V2,V3,V4,V5),x_uninferredSentence('x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_FC-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_organic-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_conduit-QPEntity'(V1,V2,V3,V4,V5)),x_getPotentialIsas(V1,V3,x_Artifact,V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b1269604f34,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f34,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f34,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f34,788).
xc_kb_names(a65b1269604f34,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f34,[]).
xc_exclude_globals(a65b1269604f34,true).
'x_<=='('x_realWorld-QPEntity'(V1,V2,V3,V4,V5),x_uninferredSentence('x_naturalArtifact-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_artifact-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_FC-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_organic-QPEntity'(V1,V2,V3,V4,V5)),x_uninferredSentence('x_conduit-QPEntity'(V1,V2,V3,V4,V5)),x_getPotentialIsas(V1,V3,x_PartiallyTangible,V4,x_WorldLikeOursCollectorMt,V5)) :- x_cid(a65b1269604f35,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269604f35,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f35,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f35,795).
xc_kb_names(a65b1269604f35,["?sid","?qtype","?entity","?etype","?ddrs-id"]).
xc_mapping_rows(a65b1269604f35,[]).
xc_exclude_globals(a65b1269604f35,true).
'x_<=='(x_bindAllDrsValuesForSid(V1,V2,V3,V4),x_cacheComplete(x_lookupOnly(x_localOnly(x_wmOnly(x_drsForDiscourse(V2))))),x_cacheComplete(x_lookupOnly(x_localOnly(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V2),x_discourseCaseForDrs(V3,V2)))))),x_cacheComplete(x_localOnly(x_wmOnly(x_lookupOnly('x_ist-Information'(V3,x_isaPossibleCaseForSentence(V4,V1))))))) :- x_cid(a65b1269604f36,V1,V2,V3,V4).
xc_microtheory(a65b1269604f36,x_QPInterpretationRulesMt).
xc_source_file(a65b1269604f36,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-NF-QuantityFrames.krf').
xc_source_line(a65b1269604f36,811).
xc_kb_names(a65b1269604f36,["?sid","?ddrs-id","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b1269604f36,[]).
xc_exclude_globals(a65b1269604f36,true).
kb_cache_footer(footer{count:68,digest:db150c3b3ef2132e1c77b8794ced77e5a1a5edcf25b5add381092508539e2d0f,headerDigest:'9e6814ff390b33b6945396a1d653d45194013e5dfa86a8c6af02fbb5a24ce209'}).
