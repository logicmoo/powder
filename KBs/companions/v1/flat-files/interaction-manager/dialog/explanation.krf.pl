:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:11,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:95,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:a8dcb5365c75e09d709792e2d59171c5e6d1c6b3450c095fe550546a411c12b0,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:4623,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf',sourceHash:'878d318f60be8d20217efd6455c1cf7640ab68e97f18792e9f1d09e02485668c',warnings:[]}).
x_isa(x_explainBelief,x_ComplexActionPredicate) :- x_cid(a65b125d32a482).
xc_microtheory(a65b125d32a482,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a482,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a482,24).
xc_kb_names(a65b125d32a482,[]).
xc_mapping_rows(a65b125d32a482,[]).
x_arity(x_explainBelief,4) :- x_cid(a65b125d32a483).
xc_microtheory(a65b125d32a483,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a483,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a483,25).
xc_kb_names(a65b125d32a483,[]).
xc_mapping_rows(a65b125d32a483,[]).
x_arg1Isa(x_explainBelief,x_Microtheory) :- x_cid(a65b125d32a484).
xc_microtheory(a65b125d32a484,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a484,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a484,26).
xc_kb_names(a65b125d32a484,[]).
xc_mapping_rows(a65b125d32a484,[]).
x_arg2Isa(x_explainBelief,x_CycLTerm) :- x_cid(a65b125d32a485).
xc_microtheory(a65b125d32a485,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a485,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a485,27).
xc_kb_names(a65b125d32a485,[]).
xc_mapping_rows(a65b125d32a485,[]).
x_arg3Isa(x_explainBelief,'x_ELSentence-Assertible') :- x_cid(a65b125d32a486).
xc_microtheory(a65b125d32a486,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a486,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a486,28).
xc_kb_names(a65b125d32a486,[]).
xc_mapping_rows(a65b125d32a486,[]).
x_arg4Isa(x_explainBelief,x_Microtheory) :- x_cid(a65b125d32a487).
xc_microtheory(a65b125d32a487,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a487,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a487,29).
xc_kb_names(a65b125d32a487,[]).
xc_mapping_rows(a65b125d32a487,[]).
x_comment(x_explainBelief,"(explainBelief ?context ?sentence-id ?system-stmt ?discourse-ctxt) is a task to explain justifications for the question answer associated with ?system-stmt") :- x_cid(a65b125d32a488).
xc_microtheory(a65b125d32a488,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a488,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a488,30).
xc_kb_names(a65b125d32a488,[]).
xc_mapping_rows(a65b125d32a488,[]).
x_preconditionForMethod(x_and('x_ist-Information'(V1,x_systemUtteranceAt(V2,V3,V4)),'x_ist-Information'(V1,x_inReplyTo(V3,V5)),x_uninferredSentence(x_inferenceOnly(x_justificationForBelief(V1,V5,V6))),x_formattedContentString("~%Cannot explain belief in : ~s",x_TheList(V4),V7),x_newReifiedUtterance(V8)),x_methodForAction(x_explainBelief(V1,V9,V3,V10),x_actionSequence(x_TheList(x_doRespond(V8,V7))))) :- x_cid(a65b125d32a489,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125d32a489,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a489,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a489,40).
xc_kb_names(a65b125d32a489,["?context","?time","?system-stmt","?prior-answer","?question-id","?reasons","?utterance-string","?system-utterance","?sentence-id","?discourse-ctxt"]).
xc_mapping_rows(a65b125d32a489,[]).
x_preconditionForMethod(x_and('x_ist-Information'(V1,x_inReplyTo(V2,V3)),x_wmOnly(x_syntacticallyAmbiguous(V3,V4,V5)),x_syntaxDifferentialGloss(V5,V3,V6),x_newReifiedUtterance(V7)),x_methodForAction(x_explainBelief(V1,V8,V2,V5),x_actionSequence(x_TheList(x_doRecordMembers(x_TheSet('x_ist-Information'(V1,x_isa(V7,x_ReplyingToAQuestion)),'x_ist-Information'(V1,x_inReplyTo(V7,V8)))),x_doRespond(V7,V6))))) :- x_cid(a65b125d32a48a,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d32a48a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a48a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a48a,55).
xc_kb_names(a65b125d32a48a,["?context","?system-stmt","?previous-user-sentence-id","?csid","?discourse-ctxt","?utterance-string","?system-utterance","?sentence-id"]).
xc_mapping_rows(a65b125d32a48a,[]).
x_preconditionForMethod(x_and('x_ist-Information'(V1,x_systemUtteranceAt(V2,V3,V4)),'x_ist-Information'(V1,x_inReplyTo(V3,V5)),x_inferenceOnly(x_justificationForBelief(V1,V5,V6)),x_newReifiedUtterance(V7),x_listReasons(V6,V8)),x_methodForAction(x_explainBelief(V1,V9,V3,V10),x_actionSequence(x_TheList(x_doRecordMembers(x_TheSet('x_ist-Information'(V1,x_isa(V7,x_ReplyingToAQuestion)),'x_ist-Information'(V1,x_inReplyTo(V7,V9)),'x_ist-Information'(V1,x_queryAnswer(V9,V6)))),x_doRespond(V7,V8))))) :- x_cid(a65b125d32a48b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125d32a48b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a48b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a48b,71).
xc_kb_names(a65b125d32a48b,["?context","?time","?system-stmt","?prior-answer","?question-id","?reasons","?system-utterance","?utterance-string","?sentence-id","?discourse-ctxt"]).
xc_mapping_rows(a65b125d32a48b,[]).
'x_<=='(x_preferInContext(x_explainBelief(V1,V2,V3,V4),V5,V6),x_noArgumentHasPredicate(V6,x_doRecordMembers)) :- x_cid(a65b125d32a48c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d32a48c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d32a48c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/explanation.krf').
xc_source_line(a65b125d32a48c,92).
xc_kb_names(a65b125d32a48c,["?context","?sentence-id","?system-stmt","?discourse-ctxt","?seq1","?seq2"]).
xc_mapping_rows(a65b125d32a48c,[]).
kb_cache_footer(footer{count:11,digest:a8dcb5365c75e09d709792e2d59171c5e6d1c6b3450c095fe550546a411c12b0,headerDigest:'496ba434149485786c557138e6fff06d8b9b48206e127a091a481a263ce40496'}).
