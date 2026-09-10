:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:12,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:165,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'7d99a4526887cfeda4698138279652b87400463246dfc4d7e3536a56f37982e2',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:6542,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf',sourceHash:ed1a0f803ea3af4950c1d49ae3486416027cfc0fccacec33f0a654d2397c8c72,warnings:[]}).
x_genlMt(x_BOTEMt,x_BOTERulesMt) :- x_cid(a65b1269506f41).
xc_microtheory(a65b1269506f41,x_BOTERulesMt).
xc_source_file(a65b1269506f41,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f41,24).
xc_kb_names(a65b1269506f41,[]).
xc_mapping_rows(a65b1269506f41,[]).
xc_exclude_globals(a65b1269506f41,true).
x_genlMt(x_BOTEMt,x_EAStructuralRulesMt) :- x_cid(a65b1269506f42).
xc_microtheory(a65b1269506f42,x_BOTERulesMt).
xc_source_file(a65b1269506f42,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f42,25).
xc_kb_names(a65b1269506f42,[]).
xc_mapping_rows(a65b1269506f42,[]).
xc_exclude_globals(a65b1269506f42,true).
x_genlMt(x_BOTERulesMt,x_QPInterpretationRulesMt) :- x_cid(a65b1269506f43).
xc_microtheory(a65b1269506f43,x_BOTERulesMt).
xc_source_file(a65b1269506f43,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f43,26).
xc_kb_names(a65b1269506f43,[]).
xc_mapping_rows(a65b1269506f43,[]).
xc_exclude_globals(a65b1269506f43,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfRequestForInformation),x_introducesQuestion(x_PresentationEventFn(V1,V2),V3)) :- x_cid(a65b1269506f44,V1,V2,V3).
xc_microtheory(a65b1269506f44,x_BOTERulesMt).
xc_source_file(a65b1269506f44,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f44,39).
xc_kb_names(a65b1269506f44,["?sid","?narrative-event","?question-frame"]).
xc_mapping_rows(a65b1269506f44,[]).
xc_exclude_globals(a65b1269506f44,true).
'x_<=='(x_introducesQuestion(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V1),x_trueInDrs(V5,x_quantityRequested(V6,V7)),x_individualSatisfyingConditions(V8,x_QuantityQuestionFrame,x_TheSet(x_trueInDrs(V5,x_quantityRequested(V6,V7)))),x_tell(x_isa(V8,x_QuantityQuestionFrame)),x_tell(x_QuestionFor(V8,V6))) :- x_cid(a65b1269506f45,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1269506f45,x_BOTERulesMt).
xc_source_file(a65b1269506f45,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f45,47).
xc_kb_names(a65b1269506f45,["?sid","?narrative-event","?question-frame","?ddrs-id","?sdrs-id","?quantity","?value","?quest-frame-id"]).
xc_mapping_rows(a65b1269506f45,[]).
xc_exclude_globals(a65b1269506f45,true).
'x_<=='(x_introducesQuestion(x_PresentationEventFn(V1,V2),V3),x_drsForDiscourse(V4),x_contextIndependentDrsFor(V5,V1),x_trueInDrs(V5,x_denotes(x_WhQuestionFn(x_what),V6)),x_individualSatisfyingConditions(V7,x_QuantityQuestionFrame,x_TheSet(x_trueInDrs(V5,x_denotes(x_WhQuestionFn(x_what),V6)))),x_tell(x_isa(V7,x_QuantityQuestionFrame)),x_tell(x_QuestionFor(V7,V6))) :- x_cid(a65b1269506f46,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269506f46,x_BOTERulesMt).
xc_source_file(a65b1269506f46,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f46,58).
xc_kb_names(a65b1269506f46,["?sid","?narrative-event","?question-frame","?ddrs-id","?sdrs-id","?quantity","?quest-frame-id"]).
xc_mapping_rows(a65b1269506f46,[]).
xc_exclude_globals(a65b1269506f46,true).
'x_<=='(x_narrativeFunction(x_PresentationEventFn(V1,V2),V3,x_IntroductionOfQuestType),x_introducesQuestType(x_PresentationEventFn(V1,V4),V3)) :- x_cid(a65b1269506f47,V1,V2,V3,V4).
xc_microtheory(a65b1269506f47,x_BOTERulesMt).
xc_source_file(a65b1269506f47,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f47,74).
xc_kb_names(a65b1269506f47,["?sid","?event-id","?quest-type","?narrative-event"]).
xc_mapping_rows(a65b1269506f47,[]).
xc_exclude_globals(a65b1269506f47,true).
'x_<=='(x_introducesQuestType(x_PresentationEventFn(V1,V2),V3),x_contextIndependentDrsFor(V4,V1),x_drsForDiscourse(V5),x_discourseCaseForDrs(V6,V5),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V7,x_QuantityQuestionFrame))),x_lookupOnly(x_trueInDrs(V4,x_quantityRequested(V8,V9))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_QuestionFor(V7,V8))),x_trueInDrs(V4,'x_in-UnderspecifiedContainer'(V8,V10)),x_trueInDrs(V4,x_isa(V10,V11)),x_isaInDrs(V12,V4,'x_Set-Mathematical'),x_trueInDrs(V4,'x_implies-DrsDrs'(x_DrsCaseFn(V13),x_DrsCaseFn(V14))),x_trueInDrs(V13,x_member(V15,V12)),x_trueInDrs(V14,x_isa(V15,V16)),x_possiblePart(V11,V16,V17),x_tell(x_quantityTypePred(V7,x_hasPhysicalPartCount)),x_tell(x_wholeEntity(V7,V10)),x_tell(x_partEntity(V7,V15))) :- x_cid(a65b1269506f48,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17).
xc_microtheory(a65b1269506f48,x_BOTERulesMt).
xc_source_file(a65b1269506f48,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f48,85).
xc_kb_names(a65b1269506f48,["?sid","?narrative-event","?quest-type","?sdrs-id","?ddrs-id","?dcase","?qframeid","?quantity","?value","?container","?contain-ent","?var","?ante-drs-id","?cons-drs-id","?elt","?quant-ent","?qtype"]).
xc_mapping_rows(a65b1269506f48,[]).
xc_exclude_globals(a65b1269506f48,true).
'x_<=='(x_introducesQuestType(x_PresentationEventFn(V1,V2),V3),x_contextIndependentDrsFor(V4,V1),x_drsForDiscourse(V5),x_discourseCaseForDrs(V6,V5),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_isa(V7,x_QuantityQuestionFrame))),x_lookupOnly(x_trueInDrs(V4,x_quantityRequested(V8,V9))),x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V5),x_QuestionFor(V7,V8))),x_trueInDrs(V4,'x_in-UnderspecifiedContainer'(V8,V10)),x_isaInDrs(V11,V4,'x_Set-Mathematical'),x_trueInDrs(V4,'x_implies-DrsDrs'(x_DrsCaseFn(V12),x_DrsCaseFn(V13))),x_trueInDrs(V12,x_member(V14,V11)),x_trueInDrs(V13,x_isa(V14,V15)),x_possiblePart(V10,V15,V16),x_tell(x_quantityTypePred(V7,x_hasPhysicalPartCount)),x_tell(x_wholeEntity(V7,V10)),x_tell(x_partEntity(V7,V14))) :- x_cid(a65b1269506f49,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16).
xc_microtheory(a65b1269506f49,x_BOTERulesMt).
xc_source_file(a65b1269506f49,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f49,116).
xc_kb_names(a65b1269506f49,["?sid","?narrative-event","?quest-type","?sdrs-id","?ddrs-id","?dcase","?qframeid","?quantity","?value","?container","?var","?ante-drs-id","?cons-drs-id","?elt","?quant-ent","?qtype"]).
xc_mapping_rows(a65b1269506f49,[]).
xc_exclude_globals(a65b1269506f49,true).
'x_<=='(x_possiblePart(V1,V2,V3),x_kbOnly('x_ist-Information'(x_BOTEMt,x_constituentPhysicalQuantity(V1,V2,V3)))) :- x_cid(a65b1269506f4a,V1,V2,V3).
xc_microtheory(a65b1269506f4a,x_BOTERulesMt).
xc_source_file(a65b1269506f4a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f4a,137).
xc_kb_names(a65b1269506f4a,["?contain-ent","?quant-ent","?qtype"]).
xc_mapping_rows(a65b1269506f4a,[]).
xc_exclude_globals(a65b1269506f4a,true).
'x_<=='(x_possiblePart(V1,V2,V3),x_groundExpression(V2),x_groundExpression(V1),x_kbOnly(x_useTransitiveInference('x_ist-Information'(x_EverythingPSC,x_genls(V2,x_ChemicalObject)))),x_kbOnly('x_ist-Information'(x_EverythingPSC,x_isa(V1,x_Individual))),x_unifies(V3,x_volumeOfObject)) :- x_cid(a65b1269506f4b,V1,V2,V3).
xc_microtheory(a65b1269506f4b,x_BOTERulesMt).
xc_source_file(a65b1269506f4b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f4b,140).
xc_kb_names(a65b1269506f4b,["?contain-ent","?quant-ent","?qtype"]).
xc_mapping_rows(a65b1269506f4b,[]).
xc_exclude_globals(a65b1269506f4b,true).
'x_<=='(x_possiblePart(V1,V2,V3),x_groundExpression(V2),x_groundExpression(V1),x_kbOnly('x_ist-Information'(x_EverythingPSC,x_isa(V2,x_OrganismConstituentType))),x_kbOnly('x_ist-Information'(x_EverythingPSC,x_isa(V1,x_Individual))),x_unifies(V3,x_volumeOfObject)) :- x_cid(a65b1269506f4c,V1,V2,V3).
xc_microtheory(a65b1269506f4c,x_BOTERulesMt).
xc_source_file(a65b1269506f4c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/qp-support/BOTE-narrative-rules.krf').
xc_source_line(a65b1269506f4c,147).
xc_kb_names(a65b1269506f4c,["?contain-ent","?quant-ent","?qtype"]).
xc_mapping_rows(a65b1269506f4c,[]).
xc_exclude_globals(a65b1269506f4c,true).
kb_cache_footer(footer{count:12,digest:'7d99a4526887cfeda4698138279652b87400463246dfc4d7e3536a56f37982e2',headerDigest:'1d9ccaff1f11f6608bff1a88f76401dd5ff8074be2b56992e076ec52845fc2ad'}).
