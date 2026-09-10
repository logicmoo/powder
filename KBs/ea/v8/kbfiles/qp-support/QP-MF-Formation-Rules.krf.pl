:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:27,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:376,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:e29314d0720e3ca7b9ae0f4ad2f6312e9b1e4a76f92a1a9d23eaf0dfb05319b0,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:23105,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf',sourceHash:'578155e6fab2207f51e4dd7a149f8ab46a5b24355b553e66f908826e43e12482',warnings:[]}).
x_genlMt(x_QPMFQueriesMt,x_QPInterpretationMt) :- x_cid(a65b126953d9aa).
xc_microtheory(a65b126953d9aa,x_QPMFQueriesMt).
xc_source_file(a65b126953d9aa,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9aa,13).
xc_kb_names(a65b126953d9aa,[]).
xc_mapping_rows(a65b126953d9aa,[]).
x_queryForInterpretation(0,x_convertToModelFragments(V1)) :- x_cid(a65b126953d9ab,V1).
xc_microtheory(a65b126953d9ab,x_QPMFQueriesMt).
xc_source_file(a65b126953d9ab,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9ab,14).
xc_kb_names(a65b126953d9ab,["?processType"]).
xc_mapping_rows(a65b126953d9ab,[]).
x_genlMt(x_QPInterpretationMt,x_QPFormationMt) :- x_cid(a65b126953d9ac).
xc_microtheory(a65b126953d9ac,x_QPFormationMt).
xc_source_file(a65b126953d9ac,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9ac,17).
xc_kb_names(a65b126953d9ac,[]).
xc_mapping_rows(a65b126953d9ac,[]).
'x_<=='(x_convertToModelFragments(V1),x_processMF(V1,V2,V3,V4),x_generateProcessConsequences(V1,V2,V5,V3,V4),x_generateBiconditionalConsequence(V1,V3,V4)) :- x_cid(a65b126953d9ad,V1,V2,V3,V4,V5).
xc_microtheory(a65b126953d9ad,x_QPFormationMt).
xc_source_file(a65b126953d9ad,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9ad,19).
xc_kb_names(a65b126953d9ad,["?processType","?quantityType","?pframe","?MF","?consequence-assertion"]).
xc_mapping_rows(a65b126953d9ad,[]).
'x_<=='(x_convertToModelFragments(V1),x_unifies(V1,x_true)) :- x_cid(a65b126953d9ae,V1).
xc_microtheory(a65b126953d9ae,x_QPFormationMt).
xc_source_file(a65b126953d9ae,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9ae,26).
xc_kb_names(a65b126953d9ae,["?processType"]).
xc_mapping_rows(a65b126953d9ae,[]).
'x_<=='(x_processMF(V1,V2,V3,V4),x_drsForDiscourse(V5),'x_ist-Information'(x_DrsCaseFn(V5),x_isa(V3,x_PhysicalProcessFrame)),'x_ist-Information'(x_DrsCaseFn(V5),x_participant(V3,V6)),'x_ist-Information'(x_DrsCaseFn(V5),x_entity(V7,V6)),'x_ist-Information'(x_DrsCaseFn(V5),x_quantityType(V7,V2)),'x_ist-Information'(x_DrsCaseFn(V5),x_consequence(V3,V8)),'x_ist-Information'(x_DrsCaseFn(V5),x_constrainer(V8,V9)),'x_ist-Information'(x_DrsCaseFn(V5),x_entity(V9,V10)),x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V10,V1)))),x_individualSatisfyingConditions(V4,V1,x_TheSet('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V10,V1)))),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_isa(V4,x_QPProcessType)),x_TheList(x_processMF(V1,V2,V3,V4)))),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_processType(V4,V1)),x_TheList(x_processMF(V1,V2,V3,V4))))) :- x_cid(a65b126953d9af,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b126953d9af,x_QPFormationMt).
xc_source_file(a65b126953d9af,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9af,52).
xc_kb_names(a65b126953d9af,["?processType","?quantityType","?pframe","?MF","?ddrs-id","?entity","?qframe","?diframe","?constrainer-frame","?process"]).
xc_mapping_rows(a65b126953d9af,[]).
'x_<=='(x_generateProcessConsequences(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),'x_ist-Information'(x_DrsCaseFn(V6),x_consequence(V4,V7)),'x_ist-Information'(x_DrsCaseFn(V6),x_isa(V7,x_DirectInfluenceFrame)),'x_ist-Information'(x_DrsCaseFn(V6),x_constrained(V7,V8)),'x_ist-Information'(x_DrsCaseFn(V6),x_quantityType(V8,V2)),x_justifyDirectInfluence(V7,V8,V2,V1,V9,V5),x_justifyParticipantRoles(V4,V1,V8,V2,V5)) :- x_cid(a65b126953d9b0,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b126953d9b0,x_QPFormationMt).
xc_source_file(a65b126953d9b0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b0,72).
xc_kb_names(a65b126953d9b0,["?processType","?quantityType","?consequence-assertion","?pframe","?MF","?ddrs-id","?di-frame","?constrained-frame","?sign"]).
xc_mapping_rows(a65b126953d9b0,[]).
'x_<=='(x_convertQuantity(V1,V2,V3,V4),x_drsForDiscourse(V5),x_unifies(V3,x_Rate),'x_ist-Information'(x_DrsCaseFn(V5),x_isa(V1,V4)),x_unifies(V2,x_RateFn(V6))) :- x_cid(a65b126953d9b1,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126953d9b1,x_QPFormationMt).
xc_source_file(a65b126953d9b1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b1,85).
xc_kb_names(a65b126953d9b1,["?entity","?new-entity","?qtype","?processType","?ddrs-id","?self"]).
xc_mapping_rows(a65b126953d9b1,[]).
'x_<=='(x_convertQuantity(V1,V2,V3,V4),x_drsForDiscourse(V5),x_uninferredSentence(x_unifies(V3,x_Rate)),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V1,V4))),x_uninferredSentence(x_unifies(V1,t(V6,V7,V8,V9))),x_unifies(V2,t(x_QPQuantityFn(V3),x_variableFn(V1)))) :- x_cid(a65b126953d9b2,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b126953d9b2,x_QPFormationMt).
xc_source_file(a65b126953d9b2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b2,91).
xc_kb_names(a65b126953d9b2,["?quantity","?new-quantity","?qtype","?processType","?ddrs-id","?a","?b","?c","?d"]).
xc_mapping_rows(a65b126953d9b2,[]).
'x_<=='(x_convertQuantity(V1,V2,V3,V4),x_drsForDiscourse(V5),x_uninferredSentence('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V1,V4))),x_unifies(V1,t(V6,V7,V8,V9)),x_unifies(V2,t(x_QPQuantityFn(V3),x_variableFn(V7)))) :- x_cid(a65b126953d9b3,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b126953d9b3,x_QPFormationMt).
xc_source_file(a65b126953d9b3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b3,98).
xc_kb_names(a65b126953d9b3,["?quantity","?new-quantity","?qtype","?processType","?ddrs-id","?a","?b","?c","?d"]).
xc_mapping_rows(a65b126953d9b3,[]).
'x_<=='(x_generateProcessConsequences(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),'x_ist-Information'(x_DrsCaseFn(V6),x_isa(V7,x_IndirectInfluenceFrame)),'x_ist-Information'(x_DrsCaseFn(V6),x_constrained(V7,V8)),'x_ist-Information'(x_DrsCaseFn(V6),x_quantityType(V8,V9)),'x_ist-Information'(x_DrsCaseFn(V6),x_constrainer(V7,V10)),'x_ist-Information'(x_DrsCaseFn(V6),x_quantityType(V10,V11)),x_unifies(V3,x_true),x_justifyIndirectInfluence(V7,V8,V10,V1,V12,V5),x_justifyParticipantConstraints(V4,V1,V8,V13,V14,V5)) :- x_cid(a65b126953d9b4,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b126953d9b4,x_QPFormationMt).
xc_source_file(a65b126953d9b4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b4,105).
xc_kb_names(a65b126953d9b4,["?processType","?quantityType","?consequence-assertion","?pframe","?MF","?ddrs-id","?qprop-frame","?constrained-frame","?quantityType1","?constrainer-frame","?quantityType2","?sign","?entity","?pred"]).
xc_mapping_rows(a65b126953d9b4,[]).
'x_<=='(x_generateBiconditionalConsequence(V1,V2,V3),x_isa(V2,x_PhysicalProcessFrame),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeBiconditionalConsequence(V3,x_hasQuantity(V4,x_RateFn(V4)))),x_TheList(x_generateBiconditionalConsequence(V1,V2,V3))))) :- x_cid(a65b126953d9b5,V1,V2,V3,V4).
xc_microtheory(a65b126953d9b5,x_QPFormationMt).
xc_source_file(a65b126953d9b5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b5,125).
xc_kb_names(a65b126953d9b5,["?processType","?pframe","?MF","?self"]).
xc_mapping_rows(a65b126953d9b5,[]).
'x_<=='(x_justifyIndirectInfluence(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_sign(V1,1)),x_unifies(V5,1),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V2,V8)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V2,V9)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V3,V10)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V3,V11)),x_convertQuantity(V8,V12,V9,V4),x_convertQuantity(V10,V13,V11,V4),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeConsequence(V6,x_qprop(V12,V13))),x_TheList(x_justifyIndirectInfluence(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9b6,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b126953d9b6,x_QPFormationMt).
xc_source_file(a65b126953d9b6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b6,133).
xc_kb_names(a65b126953d9b6,["?qprop-frame","?constrained-frame","?constrainer-frame","?processType","?sign","?MF","?ddrs-id","?entity","?quantityType1","?entity2","?quantityType2","?new-entity","?new-entity2"]).
xc_mapping_rows(a65b126953d9b6,[]).
'x_<=='(x_justifyIndirectInfluence(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_sign(V1,-1)),x_unifies(V5,-1),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V2,V8)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V2,V9)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V3,V10)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V3,V11)),x_convertQuantity(V8,V12,V9,V4),x_convertQuantity(V10,V13,V11,V4),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeConsequence(V6,'x_qprop-'(V12,V13))),x_TheList(x_justifyIndirectInfluence(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9b7,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b126953d9b7,x_QPFormationMt).
xc_source_file(a65b126953d9b7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b7,148).
xc_kb_names(a65b126953d9b7,["?qprop-frame","?constrained-frame","?constrainer-frame","?processType","?sign","?MF","?ddrs-id","?entity","?quantityType1","?entity2","?quantityType2","?new-entity","?new-entity2"]).
xc_mapping_rows(a65b126953d9b7,[]).
'x_<=='(x_justifyDirectInfluence(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_sign(V1,x_Positive)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V2,V8)),x_uninferredSentence(x_unifies(V8,t(V9,V10,V11,V12))),x_unifies(V5,x_Positive),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeConsequence(V6,'x_i+'(t(x_QPQuantityFn(V3),x_variableFn(V8)),x_RateFn(V13)))),x_TheList(x_justifyDirectInfluence(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9b8,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b126953d9b8,x_QPFormationMt).
xc_source_file(a65b126953d9b8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b8,172).
xc_kb_names(a65b126953d9b8,["?di-frame","?constrained-frame","?quantityType","?processType","?sign","?MF","?ddrs-id","?entity","?a","?b","?c","?d","?self"]).
xc_mapping_rows(a65b126953d9b8,[]).
'x_<=='(x_justifyDirectInfluence(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_sign(V1,x_Negative)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V2,V8)),x_uninferredSentence(x_unifies(V8,t(V9,V10,V11,V12))),x_unifies(V5,x_Negative),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeConsequence(V6,'x_i-'(t(x_QPQuantityFn(V3),x_variableFn(V8)),x_RateFn(V13)))),x_TheList(x_justifyDirectInfluence(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9b9,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b126953d9b9,x_QPFormationMt).
xc_source_file(a65b126953d9b9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9b9,182).
xc_kb_names(a65b126953d9b9,["?di-frame","?constrained-frame","?quantityType","?processType","?sign","?MF","?ddrs-id","?entity","?a","?b","?c","?d","?self"]).
xc_mapping_rows(a65b126953d9b9,[]).
'x_<=='(x_justifyDirectInfluence(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_sign(V1,x_Positive)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V2,V8)),x_unifies(V8,t(V9,V10,V11,V12)),x_unifies(V5,x_Positive),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeConsequence(V6,'x_i+'(t(x_QPQuantityFn(V3),x_variableFn(V10)),x_RateFn(V13)))),x_TheList(x_justifyDirectInfluence(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9ba,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b126953d9ba,x_QPFormationMt).
xc_source_file(a65b126953d9ba,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9ba,198).
xc_kb_names(a65b126953d9ba,["?di-frame","?constrained-frame","?quantityType","?processType","?sign","?MF","?ddrs-id","?entity","?a","?b","?c","?d","?self"]).
xc_mapping_rows(a65b126953d9ba,[]).
'x_<=='(x_justifyDirectInfluence(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_sign(V1,x_Negative)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V2,V8)),x_unifies(V8,t(V9,V10,V11,V12)),x_unifies(V5,x_Negative),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeConsequence(V6,'x_i-'(t(x_QPQuantityFn(V3),x_variableFn(V10)),x_RateFn(V13)))),x_TheList(x_justifyDirectInfluence(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9bb,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b126953d9bb,x_QPFormationMt).
xc_source_file(a65b126953d9bb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9bb,208).
xc_kb_names(a65b126953d9bb,["?di-frame","?constrained-frame","?quantityType","?processType","?sign","?MF","?ddrs-id","?entity","?a","?b","?c","?d","?self"]).
xc_mapping_rows(a65b126953d9bb,[]).
'x_<=='(x_justifyParticipantRoles(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),'x_ist-Information'(x_DrsCaseFn(V6),x_consequence(V1,t(V7,V8,V9))),'x_ist-Information'(x_DrsCaseFn(V6),x_entity(V3,V9)),x_localOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V6),x_isa(V9,V10)))),'x_ist-Information'(x_DrsCaseFn(V6),x_constrained(V11,V3)),x_individualSatisfyingConditions(V12,V10,x_TheSet('x_ist-Information'(x_DrsCaseFn(V6),x_isa(V9,V10)))),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeParticipant(V5,x_variableFn(V9),V10,V7)),x_TheList(x_justifyParticipantRoles(V1,V2,V3,V4,V5)))),x_justifyParticipantConstraints(V1,V2,V3,V9,V13,V5)) :- x_cid(a65b126953d9bc,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b126953d9bc,x_QPFormationMt).
xc_source_file(a65b126953d9bc,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9bc,221).
xc_kb_names(a65b126953d9bc,["?pframe","?processType","?constrained-frame","?quantityType","?MF","?ddrs-id","?role","?event","?entity","?entity-type","?di-frame","?ent-token","?pred"]).
xc_mapping_rows(a65b126953d9bc,[]).
'x_<=='(x_justifyParticipantRoles(V1,V2,V3,V4,V5),x_drsForDiscourse(V6),'x_ist-Information'(x_DrsCaseFn(V6),x_constrained(V7,V3)),'x_ist-Information'(x_DrsCaseFn(V6),x_entity(V3,x_ContainedStuffFn(V8,V9,V10))),'x_ist-Information'(x_DrsCaseFn(V6),x_consequence(V1,t(V11,V12,V10))),x_localOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V6),x_isa(V10,V13)))),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeParticipant(V5,x_variableFn(V10),V13,V11)),x_TheList(x_justifyParticipantRoles(V1,V2,V3,V4,V5)))),x_justifyParticipantConstraints(V1,V2,V3,V10,V14,V5)) :- x_cid(a65b126953d9bd,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b126953d9bd,x_QPFormationMt).
xc_source_file(a65b126953d9bd,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9bd,240).
xc_kb_names(a65b126953d9bd,["?pframe","?processType","?constrained-frame","?quantityType","?MF","?ddrs-id","?di-frame","?entity-quant","?phase","?container","?role","?event","?ctype","?pred"]).
xc_mapping_rows(a65b126953d9bd,[]).
'x_<=='(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V8,V4)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantity1(V9,V8)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantity2(V9,V10)),'x_ist-Information'(x_DrsCaseFn(V7),x_relationBetweenQuantities(V9,x_greaterThan)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V10,V11)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V10,V12)),x_unifies(V5,x_qGreaterThan),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeCondition(V6,x_qGreaterThan(t(x_QPQuantityFn(V12),x_variableFn(V4)),t(x_QPQuantityFn(V12),x_variableFn(V11))))),x_TheList(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9be,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b126953d9be,x_QPFormationMt).
xc_source_file(a65b126953d9be,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9be,260).
xc_kb_names(a65b126953d9be,["?pframe","?processType","?constrained-frame","?entity","?pred","?MF","?ddrs-id","?qframe","?ordframe1","?qframe2","?entity2","?qtype"]).
xc_mapping_rows(a65b126953d9be,[]).
'x_<=='(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V8,V4)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantity1(V9,V8)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantity2(V9,V10)),'x_ist-Information'(x_DrsCaseFn(V7),x_relationBetweenQuantities(V9,x_lessThan)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V10,V11)),'x_ist-Information'(x_DrsCaseFn(V7),x_quantityType(V10,V12)),x_unifies(V5,x_qGreaterThan),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeCondition(V6,x_qGreaterThan(t(x_QPQuantityFn(V12),x_variableFn(V11)),t(x_QPQuantityFn(V12),x_variableFn(V4))))),x_TheList(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9bf,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b126953d9bf,x_QPFormationMt).
xc_source_file(a65b126953d9bf,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9bf,276).
xc_kb_names(a65b126953d9bf,["?pframe","?processType","?constrained-frame","?entity","?pred","?MF","?ddrs-id","?qframe","?ordframe1","?qframe2","?entity2","?qtype"]).
xc_mapping_rows(a65b126953d9bf,[]).
'x_<=='(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_isa(V8,x_TopologyFrame)),'x_ist-Information'(x_DrsCaseFn(V7),x_container(V8,V4)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V8,V9)),x_localOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V9,V10)))),x_unifies(V5,'x_in-UnderspecifiedContainer'),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeParticipant(V6,x_variableFn(V9),V10,'x_in-UnderspecifiedContainer')),x_TheList(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeParticipantConstraint(V6,'x_in-UnderspecifiedContainer'(x_variableFn(V9),x_variableFn(V4)))),x_TheList(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9c0,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b126953d9c0,x_QPFormationMt).
xc_source_file(a65b126953d9c0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9c0,295).
xc_kb_names(a65b126953d9c0,["?pframe","?processType","?constrained-frame","?container","?pred","?MF","?ddrs-id","?topFrame","?ent","?ent-type"]).
xc_mapping_rows(a65b126953d9c0,[]).
'x_<=='(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_isa(V8,x_TopologyFrame)),'x_ist-Information'(x_DrsCaseFn(V7),x_container(V8,V9)),'x_ist-Information'(x_DrsCaseFn(V7),x_entity(V8,V4)),x_localOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V4,V10)))),x_localOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V9,V11)))),x_unifies(V5,'x_in-UnderspecifiedContainer'),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeParticipant(V6,x_variableFn(V9),V11,'x_in-UnderspecifiedContainer')),x_TheList(x_justifyParticipantConstraints(V1,V2,V3,V9,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeParticipantConstraint(V6,'x_in-UnderspecifiedContainer'(x_variableFn(V4),x_variableFn(V9)))),x_TheList(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9c1,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b126953d9c1,x_QPFormationMt).
xc_source_file(a65b126953d9c1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9c1,311).
xc_kb_names(a65b126953d9c1,["?pframe","?processType","?constrained-frame","?ent","?pred","?MF","?ddrs-id","?topFrame","?container","?ent-type","?contain-type"]).
xc_mapping_rows(a65b126953d9c1,[]).
'x_<=='(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_isa(V8,x_TopologyFrame)),'x_ist-Information'(x_DrsCaseFn(V7),x_pathForFrame(V8,V9)),'x_ist-Information'(x_DrsCaseFn(V7),x_pathConnects(V9,V10,V11)),x_unifies(V5,x_pathConnects),x_wmOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V7),x_isa(V9,V12)))),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeParticipant(V6,x_variableFn(V9),V12,x_pathConnects)),x_TheList(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6)))),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeParticipantConstraint(V6,x_pathConnects(x_variableFn(V9),x_variableFn(V10),x_variableFn(V11)))),x_TheList(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9c2,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b126953d9c2,x_QPFormationMt).
xc_source_file(a65b126953d9c2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9c2,335).
xc_kb_names(a65b126953d9c2,["?pframe","?processType","?constrained-frame","?entity","?pred","?MF","?ddrs-id","?topFrame","?path-obj","?a","?b","?ptype"]).
xc_mapping_rows(a65b126953d9c2,[]).
'x_<=='(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6),x_drsForDiscourse(V7),'x_ist-Information'(x_DrsCaseFn(V7),x_isa(V8,x_TopologyFrame)),'x_ist-Information'(x_DrsCaseFn(V7),x_connectedEntity(V8,V4)),'x_ist-Information'(x_DrsCaseFn(V7),x_connectedEntity(V8,V9)),x_different(V4,V9),'x_ist-Information'(x_DrsCaseFn(V7),x_requiredRel(V8,V10)),'x_ist-Information'(x_DrsCaseFn(V7),t(V10,V4,V9)),x_forEffectOnly(x_justify('x_ist-Information'(x_learnedModelMt,x_mfTypeParticipantConstraint(V6,t(V10,x_variableFn(V4),x_variableFn(V9)))),x_TheList(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6))))) :- x_cid(a65b126953d9c3,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b126953d9c3,x_QPFormationMt).
xc_source_file(a65b126953d9c3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9c3,351).
xc_kb_names(a65b126953d9c3,["?pframe","?processType","?constrained-frame","?entity","?pred","?MF","?ddrs-id","?topFrame","?entity2","?rel"]).
xc_mapping_rows(a65b126953d9c3,[]).
'x_<=='(x_justifyParticipantConstraints(V1,V2,V3,V4,V5,V6),x_true) :- x_cid(a65b126953d9c4,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126953d9c4,x_QPFormationMt).
xc_source_file(a65b126953d9c4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/QP-MF-Formation-Rules.krf').
xc_source_line(a65b126953d9c4,364).
xc_kb_names(a65b126953d9c4,["?pframe","?processType","?constrained-frame","?entity","?pred","?MF"]).
xc_mapping_rows(a65b126953d9c4,[]).
kb_cache_footer(footer{count:27,digest:e29314d0720e3ca7b9ae0f4ad2f6312e9b1e4a76f92a1a9d23eaf0dfb05319b0,headerDigest:f672fcbc9b2965ac6beeee7037fe904accc546bada65d8eeafeaf6cf4b8b6c88}).
