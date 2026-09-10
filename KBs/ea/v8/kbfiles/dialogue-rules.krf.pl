:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:26,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:200,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8beda2c153d1e498d83cdf974b297b784aa31edf6c184e46cadc88a94c161512',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:9001,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf',sourceHash:'79e55d62bd8e57df251b19ef917b4735e15e2919c6cbbc3ceb0fdad357393ffb',warnings:[]}).
x_genlMt(x_EADialogueRulesMt,x_EATemporalRulesMt) :- x_cid(a65b12624a397e).
xc_microtheory(a65b12624a397e,x_EADialogueRulesMt).
xc_source_file(a65b12624a397e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a397e,14).
xc_kb_names(a65b12624a397e,[]).
xc_mapping_rows(a65b12624a397e,[]).
xc_exclude_globals(a65b12624a397e,true).
x_genlMt(x_EADialogueRulesMt,x_EAStructuralRulesMt) :- x_cid(a65b12624a397f).
xc_microtheory(a65b12624a397f,x_EADialogueRulesMt).
xc_source_file(a65b12624a397f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a397f,15).
xc_kb_names(a65b12624a397f,[]).
xc_mapping_rows(a65b12624a397f,[]).
xc_exclude_globals(a65b12624a397f,true).
'x_<=='(x_backwardDialogueFunction(V1,V2,V3,x_Replying),x_contextIndependentDrsFor(V1,V4),x_drsForDiscourse(V5),x_dialogueEvent(V5,V3,x_Informing,V6,V7),x_dialogueEvent(V1,V8,'x_CommunicationAct-Single',V9,V10),x_resolveReference(x_ReferenceInSentenceFn(V9,V4),x_ReferentInDrsFn(V7,V5)),x_resolveReference(x_ReferenceInSentenceFn(V10,V4),x_ReferentInDrsFn(V6,V5)),x_leadsTo(V3,V8),x_uninferredSentence(x_dialogueUtteranceBetween(V5,V11,x_Informing,V12,V6,V3,V8))) :- x_cid(a65b12624a3980,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b12624a3980,x_EADialogueRulesMt).
xc_source_file(a65b12624a3980,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3980,23).
xc_kb_names(a65b12624a3980,["?drs-id","?answer","?statement","?sid","?ddrs-id","?stater","?replier","?reply","?replier-dv","?stater-dv","?other-utterance","?other-sender"]).
xc_mapping_rows(a65b12624a3980,[]).
xc_exclude_globals(a65b12624a3980,true).
'x_<=='(x_backwardDialogueFunction(V1,V2,V3,x_Replying),x_contextIndependentDrsFor(V1,V4),x_drsForDiscourse(V5),x_dialogueEvent(V5,V3,x_Informing,V6,V7),x_dialogueEventNoRcpt(V1,V8,'x_CommunicationAct-Single',V9),x_resolveReference(x_ReferenceInSentenceFn(V9,V4),x_ReferentInDrsFn(V7,V5)),x_leadsTo(V3,V8),x_uninferredSentence(x_dialogueUtteranceBetween(V5,V10,x_Informing,V11,V6,V3,V8))) :- x_cid(a65b12624a3981,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b12624a3981,x_EADialogueRulesMt).
xc_source_file(a65b12624a3981,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3981,36).
xc_kb_names(a65b12624a3981,["?drs-id","?answer","?statement","?sid","?ddrs-id","?stater","?replier","?reply","?replier-dv","?other-utterance","?other-sender"]).
xc_mapping_rows(a65b12624a3981,[]).
xc_exclude_globals(a65b12624a3981,true).
'x_<=='(x_backwardDialogueFunction(V1,V2,V3,x_ReplyingToAQuestion),x_dialogueEventNoRcpt(V1,V2,x_ReplyingToAQuestion,V4),x_dialogueEvent(V1,V3,x_Informing,V5,V4),x_before(V3,V2),x_uninferredSentence(x_dialogueUtteranceBetween(V1,V6,x_Informing,V7,V4,V3,V2))) :- x_cid(a65b12624a3982,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12624a3982,x_EADialogueRulesMt).
xc_source_file(a65b12624a3982,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3982,51).
xc_kb_names(a65b12624a3982,["?drs-id","?answer","?question","?answerer","?questioner","?other-utterance","?other-sender"]).
xc_mapping_rows(a65b12624a3982,[]).
xc_exclude_globals(a65b12624a3982,true).
'x_<=='(x_backwardDialogueFunction(V1,V2,V3,x_Answer),x_backwardDialogueFunction(V1,V2,V4,x_Answer),x_backwardDialogueFunction(V1,V4,V3,x_Elaboration)) :- x_cid(a65b12624a3983,V1,V2,V3,V4).
xc_microtheory(a65b12624a3983,x_EADialogueRulesMt).
xc_source_file(a65b12624a3983,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3983,61).
xc_kb_names(a65b12624a3983,["?drs-id","?answer","?question","?stmt"]).
xc_mapping_rows(a65b12624a3983,[]).
xc_exclude_globals(a65b12624a3983,true).
'x_<=='(x_backwardDialogueFunction(V1,V2,V3,x_Elaboration),x_dialogueEventNoRcpt(V1,V2,x_Informing,V4),x_dialogueEvent(V1,V3,x_Informing,V4,V5),x_before(V3,V2),x_uninferredSentence(x_dialogueUtteranceBetween(V1,V6,x_Informing,V7,V8,V3,V2))) :- x_cid(a65b12624a3984,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12624a3984,x_EADialogueRulesMt).
xc_source_file(a65b12624a3984,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3984,67).
xc_kb_names(a65b12624a3984,["?drs-id","?stmt2","?stmt1","?speaker","?hearer","?other-utterance","?other-speaker","?other-hearer"]).
xc_mapping_rows(a65b12624a3984,[]).
xc_exclude_globals(a65b12624a3984,true).
'x_<=='(x_backwardDialogueFunction(V1,V2,V3,x_Elaboration),x_dialogueEventNoRcpt(V1,V2,x_Informing,V4),x_dialogueEvent(V1,V3,x_RequestingInformation,V4,V5),x_before(V3,V2),x_uninferredSentence(x_dialogueUtteranceBetween(V1,V6,x_Informing,V7,V8,V3,V2))) :- x_cid(a65b12624a3985,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12624a3985,x_EADialogueRulesMt).
xc_source_file(a65b12624a3985,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3985,76).
xc_kb_names(a65b12624a3985,["?drs-id","?stmt2","?stmt1","?speaker","?hearer","?other-utterance","?other-speaker","?other-hearer"]).
xc_mapping_rows(a65b12624a3985,[]).
xc_exclude_globals(a65b12624a3985,true).
'x_<=='(x_utteranceInDialogue(V1,V2,V3),x_isaInDrs(V3,V1,x_Conversation),x_trueInDrs(V1,x_performedBy(V3,V4)),x_trueInDrs(V1,x_startsDuring(V2,V3)),x_trueInDrs(V1,x_senderOfInfo(V2,V4))) :- x_cid(a65b12624a3986,V1,V2,V3,V4).
xc_microtheory(a65b12624a3986,x_EADialogueRulesMt).
xc_source_file(a65b12624a3986,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3986,90).
xc_kb_names(a65b12624a3986,["?drs-id","?vsay","?d-event","?speaker"]).
xc_mapping_rows(a65b12624a3986,[]).
xc_exclude_globals(a65b12624a3986,true).
'x_<=='(x_utteranceInDialogue(V1,V2,V3),x_backwardDialogueFunction(V1,V2,V4,V5),x_utteranceInDialogue(V1,V4,V3)) :- x_cid(a65b12624a3987,V1,V2,V3,V4,V5).
xc_microtheory(a65b12624a3987,x_EADialogueRulesMt).
xc_source_file(a65b12624a3987,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3987,96).
xc_kb_names(a65b12624a3987,["?drs-id","?answer","?d-event","?question","?fn"]).
xc_mapping_rows(a65b12624a3987,[]).
xc_exclude_globals(a65b12624a3987,true).
'x_<=='(x_dialogueEvent(V1,V2,V3,V4,V5),x_isaInDrs(V2,V1,V3),x_trueInDrs(V1,x_senderOfInfo(V2,V4)),x_trueInDrs(V1,x_recipientOfInfo(V2,V5)),x_allFactsAllowed(x_useTransitiveInference(x_genls(V3,'x_CommunicationAct-Single')))) :- x_cid(a65b12624a3988,V1,V2,V3,V4,V5).
xc_microtheory(a65b12624a3988,x_EADialogueRulesMt).
xc_source_file(a65b12624a3988,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3988,104).
xc_kb_names(a65b12624a3988,["?drs-id","?event","?type","?sender","?recipient"]).
xc_mapping_rows(a65b12624a3988,[]).
xc_exclude_globals(a65b12624a3988,true).
'x_<=='(x_dialogueEvent(V1,V2,V3,V4,V5),x_isaInDrs(V2,V1,V3),x_trueInDrs(V1,x_performedBy(V2,V4)),x_trueInDrs(V1,x_recipientOfInfo(V2,V5)),x_allFactsAllowed(x_useTransitiveInference(x_genls(V3,'x_CommunicationAct-Single')))) :- x_cid(a65b12624a3989,V1,V2,V3,V4,V5).
xc_microtheory(a65b12624a3989,x_EADialogueRulesMt).
xc_source_file(a65b12624a3989,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3989,110).
xc_kb_names(a65b12624a3989,["?drs-id","?event","?type","?sender","?recipient"]).
xc_mapping_rows(a65b12624a3989,[]).
xc_exclude_globals(a65b12624a3989,true).
'x_<=='(x_dialogueEventNoRcpt(V1,V2,V3,V4),x_isaInDrs(V2,V1,V3),x_trueInDrs(V1,x_senderOfInfo(V2,V4)),x_allFactsAllowed(x_useTransitiveInference(x_genls(V3,'x_CommunicationAct-Single')))) :- x_cid(a65b12624a398a,V1,V2,V3,V4).
xc_microtheory(a65b12624a398a,x_EADialogueRulesMt).
xc_source_file(a65b12624a398a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a398a,116).
xc_kb_names(a65b12624a398a,["?drs-id","?event","?type","?sender"]).
xc_mapping_rows(a65b12624a398a,[]).
xc_exclude_globals(a65b12624a398a,true).
'x_<=='(x_dialogueEventNoRcpt(V1,V2,V3,V4),x_isaInDrs(V2,V1,V3),x_trueInDrs(V1,x_performedBy(V2,V4)),x_allFactsAllowed(x_useTransitiveInference(x_genls(V3,'x_CommunicationAct-Single')))) :- x_cid(a65b12624a398b,V1,V2,V3,V4).
xc_microtheory(a65b12624a398b,x_EADialogueRulesMt).
xc_source_file(a65b12624a398b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a398b,121).
xc_kb_names(a65b12624a398b,["?drs-id","?event","?type","?sender"]).
xc_mapping_rows(a65b12624a398b,[]).
xc_exclude_globals(a65b12624a398b,true).
'x_<=='(x_temporallySubsumes(V1,V2),x_discourseCaseForDrs(V3,V4),'x_ist-Information'(V3,x_utteranceInDialogue(V4,V2,V1))) :- x_cid(a65b12624a398c,V1,V2,V3,V4).
xc_microtheory(a65b12624a398c,x_EADialogueRulesMt).
xc_source_file(a65b12624a398c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a398c,130).
xc_kb_names(a65b12624a398c,["?d-event","?vsay","?dcase","?drs-id"]).
xc_mapping_rows(a65b12624a398c,[]).
xc_exclude_globals(a65b12624a398c,true).
'x_<=='(x_dialogueUtteranceBetween(V1,V2,V3,V4,V5,V6,V7),x_dialogueEvent(V1,V2,V3,V4,V5),x_trueInDrs(V1,x_before(V6,V2)),x_trueInDrs(V1,x_before(V2,V7))) :- x_cid(a65b12624a398d,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12624a398d,x_EADialogueRulesMt).
xc_source_file(a65b12624a398d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a398d,134).
xc_kb_names(a65b12624a398d,["?drs-id","?event","?type","?sender","?recipient","?prior-event","?latter-event"]).
xc_mapping_rows(a65b12624a398d,[]).
xc_exclude_globals(a65b12624a398d,true).
'x_<=='(x_informOf(V1,V2),x_headVarForDrs(V3,V1),x_elementInHeadVar(V3,V4),x_isaInDrs(V4,V1,x_Informing),x_trueInDrs(V1,x_infoTransferred(V4,x_DrsCaseFn(V2)))) :- x_cid(a65b12624a398e,V1,V2,V3,V4).
xc_microtheory(a65b12624a398e,x_EADialogueRulesMt).
xc_source_file(a65b12624a398e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a398e,143).
xc_kb_names(a65b12624a398e,["?sdrs-id","?inform-drs-id","?hv","?inform"]).
xc_mapping_rows(a65b12624a398e,[]).
xc_exclude_globals(a65b12624a398e,true).
'x_<=='(x_informOf(V1,V2),x_drsForDiscourse(V1),x_isaInDrs(V3,V1,x_Informing),x_trueInDrs(V1,x_infoTransferred(V3,x_DrsCaseFn(V2)))) :- x_cid(a65b12624a398f,V1,V2,V3).
xc_microtheory(a65b12624a398f,x_EADialogueRulesMt).
xc_source_file(a65b12624a398f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a398f,149).
xc_kb_names(a65b12624a398f,["?ddrs-id","?inform-drs-id","?inform"]).
xc_mapping_rows(a65b12624a398f,[]).
xc_exclude_globals(a65b12624a398f,true).
'x_<=='(x_topicOf(V1,V2,V3,V4),x_trueInDrs(V1,x_infoTransferred(V2,x_DrsCaseFn(V3))),x_topicOfDrs(V4,V3)) :- x_cid(a65b12624a3990,V1,V2,V3,V4).
xc_microtheory(a65b12624a3990,x_EADialogueRulesMt).
xc_source_file(a65b12624a3990,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3990,154).
xc_kb_names(a65b12624a3990,["?drs-id","?comm","?comm-drs-id","?topic"]).
xc_mapping_rows(a65b12624a3990,[]).
xc_exclude_globals(a65b12624a3990,true).
'x_<=='(x_recipientOfInfo(V1,V2),x_utteranceInDialogue(V1,V3),x_senderOfInfo(V1,V4),x_performedBy(V3,V4),x_performedBy(V3,V2),x_different(V4,V2)) :- x_cid(a65b12624a3991,V1,V2,V3,V4).
xc_microtheory(a65b12624a3991,x_EADialogueRulesMt).
xc_source_file(a65b12624a3991,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3991,158).
xc_kb_names(a65b12624a3991,["?vsay","?listener","?d-event","?speaker"]).
xc_mapping_rows(a65b12624a3991,[]).
xc_exclude_globals(a65b12624a3991,true).
'x_<=='(x_recipientOfInfo(V1,V2),x_discourseCaseForDrs(V3,V4),'x_ist-Information'(V3,x_backwardDialogueFunction(V4,V1,V5,x_Replying)),'x_ist-Information'(V3,x_drsForDiscourse(V6)),'x_ist-Information'(V3,x_trueInDrs(V6,x_senderOfInfo(V5,V2)))) :- x_cid(a65b12624a3992,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12624a3992,x_EADialogueRulesMt).
xc_source_file(a65b12624a3992,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3992,165).
xc_kb_names(a65b12624a3992,["?answer","?questioner","?dcase","?drs-id","?question","?ddrs-id"]).
xc_mapping_rows(a65b12624a3992,[]).
xc_exclude_globals(a65b12624a3992,true).
'x_<=='(x_recipientOfInfo(V1,V2),x_discourseCaseForDrs(V3,V4),'x_ist-Information'(V3,'x_recipientOfInfo-IP'(V4,V1,V2))) :- x_cid(a65b12624a3993,V1,V2,V3,V4).
xc_microtheory(a65b12624a3993,x_EADialogueRulesMt).
xc_source_file(a65b12624a3993,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3993,173).
xc_kb_names(a65b12624a3993,["?response","?recipient","?dcase","?sdrs-id"]).
xc_mapping_rows(a65b12624a3993,[]).
xc_exclude_globals(a65b12624a3993,true).
'x_<=='('x_recipientOfInfo-IP'(V1,V2,V3),x_contextIndependentDrsFor(V1,V4),x_drsForDiscourse(V5),x_leadsTo(V6,V2),x_trueInDrs(V5,x_performedBy(V6,V3)),x_trueInDrs(V1,x_senderOfInfo(V2,V7)),x_memberOfGroupOrSelf(V1,V7,V8),x_resolveReference(x_ReferenceInSentenceFn(V8,V4),x_ReferentInDrsFn(V9,V5)),x_different(V9,V3)) :- x_cid(a65b12624a3994,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12624a3994,x_EADialogueRulesMt).
xc_source_file(a65b12624a3994,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3994,177).
xc_kb_names(a65b12624a3994,["?sdrs-id","?response","?recipient","?sid","?ddrs-id","?action","?responder-sdv","?group-or-self-sdv","?group-or-self"]).
xc_mapping_rows(a65b12624a3994,[]).
xc_exclude_globals(a65b12624a3994,true).
'x_<=='(x_memberOfGroupOrSelf(V1,V2,V2),x_uninferredSentence(x_trueInDrs(V1,x_member(V2,V3)))) :- x_cid(a65b12624a3995,V1,V2,V3).
xc_microtheory(a65b12624a3995,x_EADialogueRulesMt).
xc_source_file(a65b12624a3995,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3995,187).
xc_kb_names(a65b12624a3995,["?sdrs-id","?self","?group"]).
xc_mapping_rows(a65b12624a3995,[]).
xc_exclude_globals(a65b12624a3995,true).
'x_<=='(x_memberOfGroupOrSelf(V1,V2,V3),x_trueInDrs(V1,x_member(V2,V3))) :- x_cid(a65b12624a3996,V1,V2,V3).
xc_microtheory(a65b12624a3996,x_EADialogueRulesMt).
xc_source_file(a65b12624a3996,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3996,191).
xc_kb_names(a65b12624a3996,["?sdrs-id","?self","?group"]).
xc_mapping_rows(a65b12624a3996,[]).
xc_exclude_globals(a65b12624a3996,true).
'x_<=='(x_recipientOfInfo(V1,V2),x_backwardDialogueFunction(V1,V3,x_Elaboration),x_recipientOfInfo(V3,V2)) :- x_cid(a65b12624a3997,V1,V2,V3).
xc_microtheory(a65b12624a3997,x_EADialogueRulesMt).
xc_source_file(a65b12624a3997,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/dialogue-rules.krf').
xc_source_line(a65b12624a3997,194).
xc_kb_names(a65b12624a3997,["?stmt2","?hearer","?stmt1"]).
xc_mapping_rows(a65b12624a3997,[]).
xc_exclude_globals(a65b12624a3997,true).
kb_cache_footer(footer{count:26,digest:'8beda2c153d1e498d83cdf974b297b784aa31edf6c184e46cadc88a94c161512',headerDigest:fb0934d255b8672896495b5804360e3efddb9c0af78b7afed212487764876d54}).
