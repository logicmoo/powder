:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:50,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:248,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:c159f7d171fb4ce2492bf05efa0da5f63d57a2c9a5e1be6d3410eb2de21662f6,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:10499,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf',sourceHash:'21868c87dfc1a102f43f96f9c727477eadc0b0c0c12343f89b683747c371038b',warnings:[]}).
'x_<=='(x_unknownPhraseMessage(x_TheSet(V1),V2),x_formattedContentString("~&Unknown word: ~s",x_TheList(V1),V2)) :- x_cid(a65b125d341514,V1,V2).
xc_microtheory(a65b125d341514,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341514,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341514,15).
xc_kb_names(a65b125d341514,["?word","?msg"]).
xc_mapping_rows(a65b125d341514,[]).
'x_<=='(x_unknownPhraseMessage(V1,V2),x_different(V1,x_TheSet),x_not(x_unifies(V1,x_TheSet(V3))),x_formattedContentString("~&Unknown words:~@{ ~s~}",V1,V2)) :- x_cid(a65b125d341515,V1,V2,V3).
xc_microtheory(a65b125d341515,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341515,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341515,18).
xc_kb_names(a65b125d341515,["?words","?msg","?word"]).
xc_mapping_rows(a65b125d341515,[]).
'x_<=='(x_unknownConceptMessage(x_TheSet(V1),V2),x_formattedContentString("~&Unknown meanings: ~s",x_TheList(V1),V2)) :- x_cid(a65b125d341516,V1,V2).
xc_microtheory(a65b125d341516,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341516,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341516,23).
xc_kb_names(a65b125d341516,["?word","?msg"]).
xc_mapping_rows(a65b125d341516,[]).
'x_<=='(x_unknownConceptMessage(V1,V2),x_different(V1,x_TheSet),x_not(x_unifies(V1,x_TheSet(V3))),x_formattedContentString("~&Unknown meanings:~@{ ~s~}",V1,V2)) :- x_cid(a65b125d341517,V1,V2,V3).
xc_microtheory(a65b125d341517,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341517,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341517,26).
xc_kb_names(a65b125d341517,["?words","?msg","?word"]).
xc_mapping_rows(a65b125d341517,[]).
'x_<=='(x_syntacticalAmbiguityMessage(V1),x_outsourcedOnly(x_currentSentenceString(V2)),x_formattedContentString("Syntactically ambiguous: ~s",x_TheList(V2),V1)) :- x_cid(a65b125d341518,V1,V2).
xc_microtheory(a65b125d341518,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341518,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341518,32).
xc_kb_names(a65b125d341518,["?msg","?string"]).
xc_mapping_rows(a65b125d341518,[]).
'x_<=='(x_semanticAmbiguityMessage(V1,V2,V3),x_lookupOnly('x_ist-Information'(V1,x_userUtteranceAt(V4,V2,V5))),x_formattedContentString("Semantically ambiguous: ~s",x_TheList(V5),V3)) :- x_cid(a65b125d341519,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d341519,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341519,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341519,37).
xc_kb_names(a65b125d341519,["?context","?sid","?msg","?timestamp","?string"]).
xc_mapping_rows(a65b125d341519,[]).
'x_<=='(x_cantClassifyMessage(V1,"Unable to classify sentence.  Try adding punctuation."),x_uninferredSentence(x_terminatingPunctuation(V1,V2))) :- x_cid(a65b125d34151a,V1,V2).
xc_microtheory(a65b125d34151a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34151a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34151a,43).
xc_kb_names(a65b125d34151a,["?sentence-id","?punc"]).
xc_mapping_rows(a65b125d34151a,[]).
'x_<=='(x_cantClassifyMessage(V1,"Unable to classify sentence as declarative, interrogative, or imperative."),x_terminatingPunctuation(V1,V2)) :- x_cid(a65b125d34151b,V1,V2).
xc_microtheory(a65b125d34151b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34151b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34151b,47).
xc_kb_names(a65b125d34151b,["?sentence-id","?i-punc"]).
xc_mapping_rows(a65b125d34151b,[]).
'x_<=='(x_selectionMsgFromList(V1,V2),x_different(V1,x_TheList),x_numberedList(V1,V3,V4),x_formattedContentString("~%What did you mean?~{~1@*~@{~% ~{~s. ~s~}~}~^~}",x_TheList(V4),V2)) :- x_cid(a65b125d34151c,V1,V2,V3,V4).
xc_microtheory(a65b125d34151c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34151c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34151c,57).
xc_kb_names(a65b125d34151c,["?choice-list","?msg","?num","?numbered-list"]).
xc_mapping_rows(a65b125d34151c,[]).
'x_<=='(x_numberedList(V1,V2,V3),x_groundExpression(V2),x_different(V1,x_TheList),x_evaluate(V4,x_RestOfListFn(V1)),x_evaluate(V5,x_FirstInListFn(V1)),x_evaluate(V6,x_PlusFn(1,V2)),x_numberedList(V4,V6,V7),x_unifies(V8,t(V2,V5)),x_evaluate(V3,x_JoinListsFn(x_TheList(V8),V7))) :- x_cid(a65b125d34151d,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d34151d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34151d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34151d,66).
xc_kb_names(a65b125d34151d,["?list","?num","?numbered-list","?rest","?first","?next-num","?sublist","?entry"]).
xc_mapping_rows(a65b125d34151d,[]).
'x_<=='(x_numberedList(x_TheList,V1,x_TheList)) :- x_cid(a65b125d34151e,V1).
xc_microtheory(a65b125d34151e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34151e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34151e,77).
xc_kb_names(a65b125d34151e,["?num"]).
xc_mapping_rows(a65b125d34151e,[]).
'x_<=='(x_numberedList(V1,V2,V3),x_variableExpression(V2),x_different(V1,x_TheList),x_evaluate(V2,x_LengthOfListFn(V1)),x_numberedList(V1,1,V3)) :- x_cid(a65b125d34151f,V1,V2,V3).
xc_microtheory(a65b125d34151f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34151f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34151f,80).
xc_kb_names(a65b125d34151f,["?list","?num","?numbered-list"]).
xc_mapping_rows(a65b125d34151f,[]).
'x_<=='(x_yesNoReply(x_True,"Yes.")) :- x_cid(a65b125d341520).
xc_microtheory(a65b125d341520,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341520,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341520,87).
xc_kb_names(a65b125d341520,[]).
xc_mapping_rows(a65b125d341520,[]).
'x_<=='(x_yesNoReply(x_False,"I don't believe so.")) :- x_cid(a65b125d341521).
xc_microtheory(a65b125d341521,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341521,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341521,88).
xc_kb_names(a65b125d341521,[]).
xc_mapping_rows(a65b125d341521,[]).
'x_<=='(x_yesNoReply(V1,V2),x_not(x_elementOf(V1,x_TheSet(x_True,x_False))),x_formattedContentString("Yes, specifically ~s",x_TheList(V1),V2)) :- x_cid(a65b125d341522,V1,V2).
xc_microtheory(a65b125d341522,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341522,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341522,89).
xc_kb_names(a65b125d341522,["?answer","?reply"]).
xc_mapping_rows(a65b125d341522,[]).
x_isa('x_yesNoReply-Confidence',x_TernaryPredicate) :- x_cid(a65b125d341523).
xc_microtheory(a65b125d341523,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341523,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341523,94).
xc_kb_names(a65b125d341523,[]).
xc_mapping_rows(a65b125d341523,[]).
x_arity('x_yesNoReply-Confidence',3) :- x_cid(a65b125d341524).
xc_microtheory(a65b125d341524,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341524,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341524,95).
xc_kb_names(a65b125d341524,[]).
xc_mapping_rows(a65b125d341524,[]).
'x_<=='('x_yesNoReply-Confidence'(x_True,V1,V2),x_formattedContentString("Yes, with confidence ~a.",x_TheList(V1),V2)) :- x_cid(a65b125d341525,V1,V2).
xc_microtheory(a65b125d341525,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341525,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341525,97).
xc_kb_names(a65b125d341525,["?confidence","?reply"]).
xc_mapping_rows(a65b125d341525,[]).
'x_<=='('x_yesNoReply-Confidence'(x_False,V1,V2),x_formattedContentString("No, with confidence ~a.",x_TheList(V1),V2)) :- x_cid(a65b125d341526,V1,V2).
xc_microtheory(a65b125d341526,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341526,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341526,100).
xc_kb_names(a65b125d341526,["?confidence","?reply"]).
xc_mapping_rows(a65b125d341526,[]).
'x_<=='(x_classificationReplyWithConfidence(V1,V2,x_Positive,V3,V4),x_formattedContentString("~a is a ~a. (confidence: ~a)",x_TheList(V1,V2,V3),V4)) :- x_cid(a65b125d341527,V1,V2,V3,V4).
xc_microtheory(a65b125d341527,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341527,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341527,103).
xc_kb_names(a65b125d341527,["?item","?class","?confidence","?reply"]).
xc_mapping_rows(a65b125d341527,[]).
'x_<=='(x_classificationReplyWithConfidence(V1,V2,x_Negative,V3,V4),x_formattedContentString("~a is not a ~a. (confidence: ~a)",x_TheList(V1,V2,V3),V4)) :- x_cid(a65b125d341528,V1,V2,V3,V4).
xc_microtheory(a65b125d341528,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341528,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341528,106).
xc_kb_names(a65b125d341528,["?item","?class","?confidence","?reply"]).
xc_mapping_rows(a65b125d341528,[]).
'x_<=='(x_prettyString(x_ReferentInPerceptualSourceFn(V1,V2),V3),x_formattedContentString("~a",x_TheList(V1),V3)) :- x_cid(a65b125d341529,V1,V2,V3).
xc_microtheory(a65b125d341529,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341529,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341529,109).
xc_kb_names(a65b125d341529,["?item","?source","?name-string"]).
xc_mapping_rows(a65b125d341529,[]).
'x_<=='(x_colloquialName(V1,V2),'x_ist-Information'(x_EnglishMt,x_nameString(V1,V2))) :- x_cid(a65b125d34152a,V1,V2).
xc_microtheory(a65b125d34152a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34152a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34152a,113).
xc_kb_names(a65b125d34152a,["?person","?name-string"]).
xc_mapping_rows(a65b125d34152a,[]).
'x_<=='(x_colloquialName(V1,V1),x_uninferredSentence('x_ist-Information'(x_EnglishMt,x_nameString(V1,V2)))) :- x_cid(a65b125d34152b,V1,V2).
xc_microtheory(a65b125d34152b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34152b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34152b,116).
xc_kb_names(a65b125d34152b,["?person","?name-string"]).
xc_mapping_rows(a65b125d34152b,[]).
'x_<=='(x_typeDescription(V1,V2,V3),x_different(V2,x_TheSet),x_formattedContentString("~a is a: ~{~1@*~#[~:;~@{~s~^ ~}.~]~}",x_TheList(V1,V2),V3)) :- x_cid(a65b125d34152c,V1,V2,V3).
xc_microtheory(a65b125d34152c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34152c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34152c,120).
xc_kb_names(a65b125d34152c,["?name","?types","?description"]).
xc_mapping_rows(a65b125d34152c,[]).
'x_<=='(x_typeDescription(V1,x_TheSet,V2),x_formattedContentString("I don't know ~a",x_TheList(V1),V2)) :- x_cid(a65b125d34152d,V1,V2).
xc_microtheory(a65b125d34152d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34152d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34152d,124).
xc_kb_names(a65b125d34152d,["?name","?description"]).
xc_mapping_rows(a65b125d34152d,[]).
'x_<=='(x_listDescription(V1,V2),x_different(V1,x_TheSet),x_pidginizeExpression(V1,V3),x_formattedContentString("~{~1@*~#[~:;~@{~a~^ ~}.~]~}",x_TheList(V3),V2)) :- x_cid(a65b125d34152e,V1,V2,V3).
xc_microtheory(a65b125d34152e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34152e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34152e,127).
xc_kb_names(a65b125d34152e,["?set","?description","?list"]).
xc_mapping_rows(a65b125d34152e,[]).
'x_<=='(x_listDescription(x_TheSet,"Unknown.")) :- x_cid(a65b125d34152f).
xc_microtheory(a65b125d34152f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34152f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34152f,132).
xc_kb_names(a65b125d34152f,[]).
xc_mapping_rows(a65b125d34152f,[]).
'x_<=='(x_quantityString(V1,V2),x_unifies(t(V3,V4),V1),x_isa(V1,x_ScalarInterval),x_formattedContentString("~a ~a~:p",x_TheList(V4,V3),V2)) :- x_cid(a65b125d341530,V1,V2,V3,V4).
xc_microtheory(a65b125d341530,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341530,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341530,134).
xc_kb_names(a65b125d341530,["?quantity","?string","?unit","?num"]).
xc_mapping_rows(a65b125d341530,[]).
'x_<=='(x_pidginizeTerm(V1,V2),x_quantityString(V1,V2)) :- x_cid(a65b125d341531,V1,V2).
xc_microtheory(a65b125d341531,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341531,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341531,139).
xc_kb_names(a65b125d341531,["?term","?string"]).
xc_mapping_rows(a65b125d341531,[]).
'x_<=='(x_pidginizeTerm(V1,V2),x_uninferredSentence(x_quantityString(V1,V3)),x_unifies(V2,V1)) :- x_cid(a65b125d341532,V1,V2,V3).
xc_microtheory(a65b125d341532,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341532,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341532,142).
xc_kb_names(a65b125d341532,["?term","?string","?str"]).
xc_mapping_rows(a65b125d341532,[]).
'x_<=='(x_pidginizeExpression(V1,V2),x_evaluate(V2,x_MapFunctionOverList(x_FunctionToArg(2,x_pidginizeTerm),x_SetToListFn(V1)))) :- x_cid(a65b125d341533,V1,V2).
xc_microtheory(a65b125d341533,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341533,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341533,147).
xc_kb_names(a65b125d341533,["?in","?out"]).
xc_mapping_rows(a65b125d341533,[]).
'x_<=='(x_listReasons(V1,V2),x_different(V1,x_TheSet),x_formattedContentString("~{~1@*~#[~:;~@{~&~s~^ ~}~]~}",x_TheList(V1),V2)) :- x_cid(a65b125d341534,V1,V2).
xc_microtheory(a65b125d341534,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341534,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341534,153).
xc_kb_names(a65b125d341534,["?set","?description"]).
xc_mapping_rows(a65b125d341534,[]).
'x_<=='(x_listReasons(x_TheSet,"Unknown.")) :- x_cid(a65b125d341535).
xc_microtheory(a65b125d341535,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341535,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341535,157).
xc_kb_names(a65b125d341535,[]).
xc_mapping_rows(a65b125d341535,[]).
'x_<=='(x_syntaxDifferentialGloss(V1,V2,V3),x_outsourcedOnly(x_parseTreeDifferences(V2,V4)),x_evaluate(V5,x_SetToListFn(V4)),x_liftedGrammarAmbiguityMessages(V1,V2,V5,V3)) :- x_cid(a65b125d341536,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d341536,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341536,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341536,161).
xc_kb_names(a65b125d341536,["?discourse-context","?sentence-id","?utterance-string","?diffs","?difflist"]).
xc_mapping_rows(a65b125d341536,[]).
'x_<=='(x_liftedGrammarAmbiguityMessages(V1,V2,x_TheList,"")) :- x_cid(a65b125d341537,V1,V2).
xc_microtheory(a65b125d341537,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341537,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341537,166).
xc_kb_names(a65b125d341537,["?discourse-context","?sentence-id"]).
xc_mapping_rows(a65b125d341537,[]).
'x_<=='(x_liftedGrammarAmbiguityMessages(V1,V2,V3,V4),x_evaluate(V5,x_FirstInListFn(V3)),x_evaluate(V6,x_RestOfListFn(V3)),x_liftedGrammarAmbiguity(V1,V2,V5,V7,V8),x_syntaxDifferenceGloss(V7,V8,V9),x_liftedGrammarAmbiguityMessages(V1,V2,V6,V10),x_formattedContentString("~a~a",x_TheList(V9,V10),V4)) :- x_cid(a65b125d341538,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125d341538,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341538,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341538,168).
xc_kb_names(a65b125d341538,["?discourse-context","?sentence-id","?difflist","?msg","?first","?rest","?span-string","?parts-of-speech","?gloss","?rest-msg"]).
xc_mapping_rows(a65b125d341538,[]).
x_isa(x_liftedGrammarAmbiguity,x_Predicate) :- x_cid(a65b125d341539).
xc_microtheory(a65b125d341539,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341539,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341539,176).
xc_kb_names(a65b125d341539,[]).
xc_mapping_rows(a65b125d341539,[]).
x_arity(x_liftedGrammarAmbiguity,5) :- x_cid(a65b125d34153a).
xc_microtheory(a65b125d34153a,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34153a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34153a,177).
xc_kb_names(a65b125d34153a,[]).
xc_mapping_rows(a65b125d34153a,[]).
'x_<=='(x_liftedGrammarAmbiguity(V1,V2,V3,V4,V5),x_different(V3,x_TheSet),x_formulaArgument(V3,1,V6),x_unifies(x_ptEntry(V7,x_ParseTreeFn(V2,V8)),V6),x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_ptEntrySpan(V7,x_SpanFn(V9,V10))))),x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_sentenceTokens(V2,V11)))),x_sentenceSpanString(V11,V12,V9,V4),x_evaluate(V5,x_TheClosedRetrievalSetOf(V13,x_and(x_elementOf(V14,V3),x_unifies(x_ptEntry(V15,x_ParseTreeFn(V2,V16)),V14),x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_ptConstitLexCat(V15,V13)))))))) :- x_cid(a65b125d34153b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16).
xc_microtheory(a65b125d34153b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34153b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34153b,180).
xc_kb_names(a65b125d34153b,["?discourse-context","?sentence-id","?diff","?span-string","?types","?example-entry","?example-constit","?example-ptid","?from","?to","?token-list","?start-tok","?type","?entry","?constit","?pt-id"]).
xc_mapping_rows(a65b125d34153b,[]).
x_isa(x_sentenceSpanString,x_Predicate) :- x_cid(a65b125d34153c).
xc_microtheory(a65b125d34153c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34153c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34153c,204).
xc_kb_names(a65b125d34153c,[]).
xc_mapping_rows(a65b125d34153c,[]).
x_arity(x_sentenceSpanString,4) :- x_cid(a65b125d34153d).
xc_microtheory(a65b125d34153d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34153d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34153d,205).
xc_kb_names(a65b125d34153d,[]).
xc_mapping_rows(a65b125d34153d,[]).
'x_<=='(x_sentenceSpanString(V1,V2,V3,V4),x_wmOnly(x_lookupOnly('x_ist-Information'(V5,x_sentenceTokens(V6,V1)))),x_evaluate(V7,x_PlusFn(V2,1)),x_evaluate(V8,x_SublistFromToFn(V1,V7,V3)),x_formattedContentString("~@{~s~^ ~}",V8,V4)) :- x_cid(a65b125d34153e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d34153e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34153e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34153e,208).
xc_kb_names(a65b125d34153e,["?token-list","?from-1","?to","?span-string","?discourse-context","?sentence-id","?from","?sublist"]).
xc_mapping_rows(a65b125d34153e,[]).
'x_<=='(x_syntaxDifferenceGloss(V1,V2,V3),x_evaluate(V4,x_JoinListsFn(x_TheList(V1),x_SetToListFn(V2))),x_formattedContentString("~s could be a(n): ~@{~#[~;~a~;~a~<~%~0:; or ~>~<~%~0:;~a~>~:;~@{~#[~;~<~%~1:;or ~>~]~<~%~1:;~a~>~^, ~}~]~}",V4,V3)) :- x_cid(a65b125d34153f,V1,V2,V3,V4).
xc_microtheory(a65b125d34153f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d34153f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d34153f,219).
xc_kb_names(a65b125d34153f,["?token-span-string","?parts-of-speech","?gloss","?format-args"]).
xc_mapping_rows(a65b125d34153f,[]).
x_isa(x_tokenAttachments,x_QuaternaryPredicate) :- x_cid(a65b125d341540).
xc_microtheory(a65b125d341540,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341540,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341540,225).
xc_kb_names(a65b125d341540,[]).
xc_mapping_rows(a65b125d341540,[]).
x_arity(x_tokenAttachments,4) :- x_cid(a65b125d341541).
xc_microtheory(a65b125d341541,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341541,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341541,226).
xc_kb_names(a65b125d341541,[]).
xc_mapping_rows(a65b125d341541,[]).
x_comment(x_tokenAttachments,"(tokenAttachments ?sentence-id ?discourse-case ?spanlst ?attachment-string) expresses attachment ambiguities by displaying different breaks in the sentence fragment.") :- x_cid(a65b125d341542).
xc_microtheory(a65b125d341542,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341542,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341542,227).
xc_kb_names(a65b125d341542,[]).
xc_mapping_rows(a65b125d341542,[]).
'x_<=='(x_tokenAttachments(V1,V2,V3,V4),x_unifies(x_TheList(x_SpanFn(V5,V6),x_SpanFn(V7,V8)),V3),x_wmOnly(x_lookupOnly('x_ist-Information'(V2,x_sentenceTokens(V1,V9)))),x_sentenceSpanString(V9,V5,V6,V10),x_sentenceSpanString(V9,V7,V8,V11),x_formattedContentString("~a    /   ~a",x_TheList(V10,V11),V4)) :- x_cid(a65b125d341543,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125d341543,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341543,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341543,230).
xc_kb_names(a65b125d341543,["?sentence-id","?discourse-case","?spanlst","?attachment-string","?from1","?to1","?from2","?to2","?token-list","?prefix","?suffix"]).
xc_mapping_rows(a65b125d341543,[]).
'x_<=='(x_versionMismatchMsg(V1,V2,V3),x_greaterThan(V1,V2),x_unifies(V3,"!!!The codebase is out of date with respect to the kb content.  Please re-compile the Interaction Manager.!!!")) :- x_cid(a65b125d341544,V1,V2,V3).
xc_microtheory(a65b125d341544,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341544,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341544,240).
xc_kb_names(a65b125d341544,["?contentver","?codever","?msg"]).
xc_mapping_rows(a65b125d341544,[]).
'x_<=='(x_versionMismatchMsg(V1,V2,V3),x_greaterThan(V2,V1),x_unifies(V3,"!!!The kb contents are out of date with respect to the codebase.  Please reload the IM content with (update-im-plans)!!!")) :- x_cid(a65b125d341545,V1,V2,V3).
xc_microtheory(a65b125d341545,'x_Interaction-ManagerMt').
xc_source_file(a65b125d341545,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/generation-chainer.krf').
xc_source_line(a65b125d341545,244).
xc_kb_names(a65b125d341545,["?contentver","?codever","?msg"]).
xc_mapping_rows(a65b125d341545,[]).
kb_cache_footer(footer{count:50,digest:c159f7d171fb4ce2492bf05efa0da5f63d57a2c9a5e1be6d3410eb2de21662f6,headerDigest:'61cacb7bfaeb1581e34229982c51cceefe6746ba2e2c0d93d43044805b1f28f8'}).
