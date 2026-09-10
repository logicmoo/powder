:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:88,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:363,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'3ec256aca1f4d9c19db937f92921e445ef5c38f1895c37b6dcebe94d855257b3',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:18717,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf',sourceHash:aae4fecfac978c7a3c4e6064412a1abf18f12fdde29a508591819633e9e1fefb,warnings:[]}).
x_isa('x_ought-cc-Dual',x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fca9).
xc_microtheory(a65b127182fca9,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fca9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fca9,3).
xc_kb_names(a65b127182fca9,[]).
xc_mapping_rows(a65b127182fca9,[]).
x_arg2QuotedIsa(x_forbiddenToDo,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcaa).
xc_microtheory(a65b127182fcaa,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcaa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcaa,4).
xc_kb_names(a65b127182fcaa,[]).
xc_mapping_rows(a65b127182fcaa,[]).
x_comment(x_oughtToDo,"For each instance AGT of #$IntelligentAgent and each\ninstance PROP of #$CycLSentence-Assertible, (#$oughtToDo AGT PROP) means\nthat AGT ought to bring it about that PROP.  Note that #$oughtToDo is\nnot the same as #$oughtToBe.  Neither is stronger than the other.\nNote also that (#$oughtToDo AGT PROP) is equivalent to (#$oughtToDo\nAGT (#$bringsAbout PROP)) for every PROP, and that (#$oughtToDo AGT\nPROP-1) is equivalent to (#$oughtToDo AGT PROP-2) whenever PROP-1 is\nequivalent to PROP-2.  (#$oughtToDo AGT ___) has two closely related\noperators: (#$forbiddenToDo AGT ___) and (#$permittedToDo AGT ___).\nFor each PROP,\n<p>\n<pre>\n (#$forbiddenToDo AGT PROP) is equivalent to \n (#$oughtToDo AGT (#$refrainsFromBringingAbout AGT PROP)) for every PROP,\n</pre>\n<p>\nand \n<p>\n<pre>\n (#$permittedToDo AGT PROP) is equivalent to \n (#$not (#$oughtToDo AGT (#$refrainsFromBringingAbout PROP))).\n</pre>\n<p>\nGiven the relation between #$refrainsFromBringingAbout and\n#$bringsAbout, and given what we said above, it is easy to see that\nfor each PROP,\n<p>\n<pre>\n (#$forbiddenToDo AGT PROP) is equivalent to \n (#$oughtToDo AGT (#$not (#$bringsAbout AGT PROP))), and\n\n (#$permittedToDo AGT PROP) is equivalent to \n (#$not (#$oughtToDo AGT (#$not (#$bringsAbout AGT PROP)))).\n</pre>\n<p>\n(Had we only allowed arg2 to be those formulas of the form\n(#$bringsAbout AGT PROP'), we would have\n<p>\n<pre>\n (#$permittedToDo AGT ___) and \n (#$oughtToDo AGT ___)\n</pre>\n<p>\nto be #$dualOperators.)  For ought-to-do operators with parameters,\nsee #$oughtToDo-WRT.") :- x_cid(a65b127182fcab).
xc_microtheory(a65b127182fcab,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcab,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcab,5).
xc_kb_names(a65b127182fcab,[]).
xc_mapping_rows(a65b127182fcab,[]).
x_argIsa('x_ought-cc',1,x_CodeOfConduct) :- x_cid(a65b127182fcac).
xc_microtheory(a65b127182fcac,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcac,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcac,50).
xc_kb_names(a65b127182fcac,[]).
xc_mapping_rows(a65b127182fcac,[]).
x_isa(x_ModalOpSetFn('x_ought-c',x_IntelligentAgent),x_SetOfTypeFn(x_UnaryModalOperator)) :- x_cid(a65b127182fcad).
xc_microtheory(a65b127182fcad,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcad,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcad,51).
xc_kb_names(a65b127182fcad,[]).
xc_mapping_rows(a65b127182fcad,[]).
x_negationPreds(x_oughtToDo,x_forbiddenToDo) :- x_cid(a65b127182fcae).
xc_microtheory(a65b127182fcae,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcae,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcae,53).
xc_kb_names(a65b127182fcae,[]).
xc_mapping_rows(a65b127182fcae,[]).
x_comment(x_permittedToDo,"For each instance AGT of #$IntelligentAgent and each \ninstance PROP of #$ELSentence-Assertible, (#$permittedToDo AGT PROP) \nmeans that AGT is permitted to bring it about that PROP.  Note that \n#$permittedToDo is not the same as #$permittedToBe.  Note also that \n(#$permittedToDo AGT PROP) is equivalent to (#$permittedToDo AGT \n(#$bringsAbout PROP)) for every PROP, and that (#$permittedToDo AGT \nPROP-1) is equivalent to (#$permittedToDo AGT PROP-2) whenever PROP-1 \nis equivalent to PROP-2.  (#$permittedToDo AGT ___) has two closely \nrelated operators: (#$forbiddenToDo AGT ___) and (#$oughtToDo AGT \n___).  For each PROP, \n \n(#$forbiddenToDo AGT PROP) is equivalent to  \n(#$not (#$permittedToDo AGT PROP)) \n \nand \n \n(#$oughtToDo AGT PROP) is equivalent to  \n(#$not (#$permittedToDo AGT (#$refrainsFromBringingAbout PROP))). \n \nGiven the relation between #$refrainsFromBringingAbout and \n#$bringsAbout, and given what we said above, it is easy to see that \nfor each PROP, \n \n(#$oughtToDo AGT PROP) is equivalent to  \n(#$not (#$permittedToDo AGT (#$not (#$bringsAbout AGT PROP)))). \n \n(Had we only allowed arg2 to be those formulas of the form \n(#$bringsAbout PROP'), we would have \n \n(#$permittedToDo AGT ___) and  \n(#$oughtToDo AGT ___) \n \nto be #$dualOperators.)  For permitted-to-do operators with \nparameters, see #$permittedToDo-WRT.") :- x_cid(a65b127182fcaf).
xc_microtheory(a65b127182fcaf,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcaf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcaf,54).
xc_kb_names(a65b127182fcaf,[]).
xc_mapping_rows(a65b127182fcaf,[]).
x_argIsa('x_ought-cc-Dual',2,x_IntelligentAgent) :- x_cid(a65b127182fcb0).
xc_microtheory(a65b127182fcb0,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb0,89).
xc_kb_names(a65b127182fcb0,[]).
xc_mapping_rows(a65b127182fcb0,[]).
x_comment(x_NoteOnDeonticToDoOperators,"In this note we explain why deontic `to-do' operators take\nsentences rather than actions or action types as arguments, besides\nthe reason we give in #$NotesOnUsingSentencesToTalkAboutDoing.  (1)\nThat an agent ought to do such and such doesn't mean that the agent\nought to perform any specific action.  Rather, it usually indicates\nthat the agent ought to perform an action of a certain kind.  For\nexample, suppose that Fritz ought to make his office clean.  Consider\nhypothetical events e-0 and e-1, both are particular\n`cleaning-Fritz's-office' events performed by Fritz, and in e-0, Fritz\nfirst vacuums the carpet and then cleans the desk, while in e-1, he\ncleans the desk first and then vacuums the carpet.  As particular\nevents, e-0 and e-1 are certainly different, but Fritz's performing\neither of them will (let us assume) fulfill his obligation of making\nhis room clean, in which the ordering of cleaning the kitchen and\nvacuuming the carpet doesn't matter.  It then seems to follow that\n`Fritz ought to make his office clean' implies neither `he ought to\nperform e-0' nor `he ought to perform e-1'.  In general `Fritz ought\nto make his office clean' does not even seem to imply `there is a\nparticular action x such that Fritz ought to perform x'.  (2) It is\nnot the kind of actions themselves but a (`factual') consequence of\nthe kind of actions that seems critical at the issue.  For example,\nwhen taking `Fritz ought to make his office clean' to be true, what\nFritz might do to fulfill this obligation doesn't have to be one of\nthose `cleaning-Fritz's-office' actions --- he may do anything to\nfulfill the obligation, as long as what he does has a consequence that\n`his office is clean'.  For example, he may simply hire someone else\nto clean the office.  If we must use an event or an action to\ntranslate this ought-sentence, we would face a large disjunction of\nstatements about action types, which include ALL kinds of actions\nFritz can perform that will result in (or cause) the fact that Fritz\noffice is clean, or, we would have to make, for each `contingent'\nsentence PROP, a type of all events or actions that have PROP as their\nconsequence.  In either case, though one can probably write formulas\ncorresponding to `Fritz ought to make his office clean', any inference\nwould be quite difficult because the former involves a big\ndisjunction, and the latter involves setting up relations between\nthose action types obtained by arbitrary sentences.  So neither of the\ntwo approaches seems advisible or even doable.  These considerations\nlead us to use sentences rather than particular actions or kinds of\nactions as the arg2 to #$oughtToDo.") :- x_cid(a65b127182fcb1).
xc_microtheory(a65b127182fcb1,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb1,90).
xc_kb_names(a65b127182fcb1,[]).
xc_mapping_rows(a65b127182fcb1,[]).
x_arg2QuotedIsa('x_ought-c-Dual','x_CycLSentence-Assertible') :- x_cid(a65b127182fcb2).
xc_microtheory(a65b127182fcb2,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb2,131).
xc_kb_names(a65b127182fcb2,[]).
xc_mapping_rows(a65b127182fcb2,[]).
x_arg1Isa(x_forbiddenToDo,x_IntelligentAgent) :- x_cid(a65b127182fcb3).
xc_microtheory(a65b127182fcb3,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb3,132).
xc_kb_names(a65b127182fcb3,[]).
xc_mapping_rows(a65b127182fcb3,[]).
x_argQuotedIsa(x_oughtToDo,2,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcb4).
xc_microtheory(a65b127182fcb4,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb4,133).
xc_kb_names(a65b127182fcb4,[]).
xc_mapping_rows(a65b127182fcb4,[]).
x_comment('x_forbiddenToDo-WRT',"For each instance CODE of #$CodeOfConduct, each instance AGT \nof #$IntelligentAgent, (#$forbiddenToDo-WRT CODE AGT ___) is an \ninstance of #$CommonUnaryModalOperator.  (forbiddenToDo-WRT CODE AGT \nPROP) means that in accordance with CODE (an instance of \n#$CodeOfConduct), AGT is forbidden to bring it about that PROP. \n \nNote that (#$forbiddenToDo-WRT CODE AGT PROP) is equivalent to \n(#$forbiddenToDo-WRT CODE AGT (#$bringsAbout PROP)) for every PROP, \nand that (#$forbiddenToDo-WRT CODE AGT PROP-1) is equivalent to \n(#$forbiddenToDo-WRT CODE AGT PROP-2) whenever PROP-1 is equivalent to \nPROP-2.  (#$forbiddenToDo-WRT CODE AGT ___) has two closely related \noperators: (#$permittedToDo-WRT CODE AGT ___) and (#$oughtToDo-WRT \nCODE AGT ___).  For each PROP, \n \n(#$permittedToDo-WRT CODE AGT PROP) is equivalent to  \n(#$not (#$forbiddenToDo-WRT CODE AGT PROP)) \n \nand \n \n(#$oughtToDo-WRT CODE AGT PROP) is equivalent to  \n(#$forbiddenToDo-WRT CODE AGT (#$refrainsFromBringingAbout PROP)). \n \nGiven the relation between #$refrainsFromBringingAbout and \n#$bringsAbout, and given what we said above, it is easy to see that \nfor each PROP, \n \n(#$oughtToDo-WRT CODE AGT PROP) is equivalent to  \n(#$forbiddenToDo-WRT CODE AGT (#$not (#$bringsAbout AGT PROP))).") :- x_cid(a65b127182fcb5).
xc_microtheory(a65b127182fcb5,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb5,134).
xc_kb_names(a65b127182fcb5,[]).
xc_mapping_rows(a65b127182fcb5,[]).
x_genlPreds('x_ought-c','x_ought-c-Dual') :- x_cid(a65b127182fcb6).
xc_microtheory(a65b127182fcb6,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb6,163).
xc_kb_names(a65b127182fcb6,[]).
xc_mapping_rows(a65b127182fcb6,[]).
x_isa('x_ModalOpSet1-2Fn'('x_ought-cc-Dual',x_CodeOfConduct,x_IntelligentAgent),x_SetOfTypeFn(x_CommonUnaryModalOperator)) :- x_cid(a65b127182fcb7).
xc_microtheory(a65b127182fcb7,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb7,164).
xc_kb_names(a65b127182fcb7,[]).
xc_mapping_rows(a65b127182fcb7,[]).
x_isa('x_ModalOpSet1-2Fn'('x_ought-cc',x_CodeOfConduct,x_IntelligentAgent),x_SetOfTypeFn(x_CommonUnaryModalOperator)) :- x_cid(a65b127182fcb8).
xc_microtheory(a65b127182fcb8,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb8,166).
xc_kb_names(a65b127182fcb8,[]).
xc_mapping_rows(a65b127182fcb8,[]).
x_argIsa('x_forbiddenToDo-WRT',1,x_CodeOfConduct) :- x_cid(a65b127182fcb9).
xc_microtheory(a65b127182fcb9,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcb9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcb9,168).
xc_kb_names(a65b127182fcb9,[]).
xc_mapping_rows(a65b127182fcb9,[]).
x_isa('x_ought-c',x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fcba).
xc_microtheory(a65b127182fcba,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcba,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcba,169).
xc_kb_names(a65b127182fcba,[]).
xc_mapping_rows(a65b127182fcba,[]).
x_argIsa('x_permittedToDo-WRT',2,x_IntelligentAgent) :- x_cid(a65b127182fcbb).
xc_microtheory(a65b127182fcbb,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcbb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcbb,170).
xc_kb_names(a65b127182fcbb,[]).
xc_mapping_rows(a65b127182fcbb,[]).
x_isa(x_ModalOpSetFn('x_ought-c-Dual',x_IntelligentAgent),x_SetOfTypeFn(x_CommonUnaryModalOperator)) :- x_cid(a65b127182fcbc).
xc_microtheory(a65b127182fcbc,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcbc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcbc,171).
xc_kb_names(a65b127182fcbc,[]).
xc_mapping_rows(a65b127182fcbc,[]).
x_argQuotedIsa('x_permittedToDo-WRT',3,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcbd).
xc_microtheory(a65b127182fcbd,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcbd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcbd,173).
xc_kb_names(a65b127182fcbd,[]).
xc_mapping_rows(a65b127182fcbd,[]).
x_argQuotedIsa(x_permittedToDo,2,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcbe).
xc_microtheory(a65b127182fcbe,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcbe,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcbe,174).
xc_kb_names(a65b127182fcbe,[]).
xc_mapping_rows(a65b127182fcbe,[]).
x_arg1Isa('x_ought-c',x_IntelligentAgent) :- x_cid(a65b127182fcbf).
xc_microtheory(a65b127182fcbf,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcbf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcbf,175).
xc_kb_names(a65b127182fcbf,[]).
xc_mapping_rows(a65b127182fcbf,[]).
x_isa(x_oughtToDo,x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fcc0).
xc_microtheory(a65b127182fcc0,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc0,176).
xc_kb_names(a65b127182fcc0,[]).
xc_mapping_rows(a65b127182fcc0,[]).
x_argIsa('x_oughtToDo-WRT',1,x_CodeOfConduct) :- x_cid(a65b127182fcc1).
xc_microtheory(a65b127182fcc1,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc1,177).
xc_kb_names(a65b127182fcc1,[]).
xc_mapping_rows(a65b127182fcc1,[]).
x_arg1Isa('x_ought-cc',x_CodeOfConduct) :- x_cid(a65b127182fcc2).
xc_microtheory(a65b127182fcc2,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc2,178).
xc_kb_names(a65b127182fcc2,[]).
xc_mapping_rows(a65b127182fcc2,[]).
x_arg2QuotedIsa(x_permittedToDo,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcc3).
xc_microtheory(a65b127182fcc3,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc3,179).
xc_kb_names(a65b127182fcc3,[]).
xc_mapping_rows(a65b127182fcc3,[]).
x_arg2Isa('x_ought-cc-Dual',x_IntelligentAgent) :- x_cid(a65b127182fcc4).
xc_microtheory(a65b127182fcc4,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc4,180).
xc_kb_names(a65b127182fcc4,[]).
xc_mapping_rows(a65b127182fcc4,[]).
x_isa('x_ought-c-Dual',x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fcc5).
xc_microtheory(a65b127182fcc5,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc5,181).
xc_kb_names(a65b127182fcc5,[]).
xc_mapping_rows(a65b127182fcc5,[]).
x_arg1Isa(x_permittedToDo,x_IntelligentAgent) :- x_cid(a65b127182fcc6).
xc_microtheory(a65b127182fcc6,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc6,182).
xc_kb_names(a65b127182fcc6,[]).
xc_mapping_rows(a65b127182fcc6,[]).
x_arg2Isa('x_forbiddenToDo-WRT',x_IntelligentAgent) :- x_cid(a65b127182fcc7).
xc_microtheory(a65b127182fcc7,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc7,183).
xc_kb_names(a65b127182fcc7,[]).
xc_mapping_rows(a65b127182fcc7,[]).
x_argIsa('x_ought-cc',2,x_IntelligentAgent) :- x_cid(a65b127182fcc8).
xc_microtheory(a65b127182fcc8,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc8,184).
xc_kb_names(a65b127182fcc8,[]).
xc_mapping_rows(a65b127182fcc8,[]).
x_argIsa('x_oughtToDo-WRT',2,x_IntelligentAgent) :- x_cid(a65b127182fcc9).
xc_microtheory(a65b127182fcc9,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcc9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcc9,185).
xc_kb_names(a65b127182fcc9,[]).
xc_mapping_rows(a65b127182fcc9,[]).
x_arg1Isa('x_permittedToDo-WRT',x_CodeOfConduct) :- x_cid(a65b127182fcca).
xc_microtheory(a65b127182fcca,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcca,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcca,186).
xc_kb_names(a65b127182fcca,[]).
xc_mapping_rows(a65b127182fcca,[]).
x_isa('x_ought-cc',x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fccb).
xc_microtheory(a65b127182fccb,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fccb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fccb,187).
xc_kb_names(a65b127182fccb,[]).
xc_mapping_rows(a65b127182fccb,[]).
x_arg3QuotedIsa('x_ought-cc-Dual','x_CycLSentence-Assertible') :- x_cid(a65b127182fccc).
xc_microtheory(a65b127182fccc,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fccc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fccc,188).
xc_kb_names(a65b127182fccc,[]).
xc_mapping_rows(a65b127182fccc,[]).
x_arg2Isa('x_ought-cc',x_IntelligentAgent) :- x_cid(a65b127182fccd).
xc_microtheory(a65b127182fccd,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fccd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fccd,189).
xc_kb_names(a65b127182fccd,[]).
xc_mapping_rows(a65b127182fccd,[]).
x_arg2Isa('x_oughtToDo-WRT',x_IntelligentAgent) :- x_cid(a65b127182fcce).
xc_microtheory(a65b127182fcce,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcce,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcce,190).
xc_kb_names(a65b127182fcce,[]).
xc_mapping_rows(a65b127182fcce,[]).
x_arg1Isa('x_oughtToDo-WRT',x_CodeOfConduct) :- x_cid(a65b127182fccf).
xc_microtheory(a65b127182fccf,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fccf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fccf,191).
xc_kb_names(a65b127182fccf,[]).
xc_mapping_rows(a65b127182fccf,[]).
x_argIsa('x_ought-cc-Dual',1,x_CodeOfConduct) :- x_cid(a65b127182fcd0).
xc_microtheory(a65b127182fcd0,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd0,192).
xc_kb_names(a65b127182fcd0,[]).
xc_mapping_rows(a65b127182fcd0,[]).
x_isa(x_forbiddenToDo,x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fcd1).
xc_microtheory(a65b127182fcd1,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd1,193).
xc_kb_names(a65b127182fcd1,[]).
xc_mapping_rows(a65b127182fcd1,[]).
x_comment('x_oughtToDo-WRT',"For each instance CODE of #$CodeOfConduct, each instance AGT \nof #$IntelligentAgent, (#$oughtToDo-WRT CODE AGT ___) is an instance \nof #$CommonUnaryModalOperator.  (#$oughtToDo-WRT CODE AGT PROP) means \nthat in accordance with CODE (an instance of #$CodeOfConduct), AGT \nought to bring it about that PROP.  Note that (#$oughtToDo-WRT CODE \nAGT PROP) is equivalent to (#$oughtToDo-WRT CODE AGT (#$bringsAbout \nPROP)) for every PROP, and that (#$oughtToDo-WRT CODE AGT PROP-1) is \nequivalent to (#$oughtToDo-WRT CODE AGT PROP-2) whenever PROP-1 is \nequivalent to PROP-2.  (#$oughtToDo-WRT CODE AGT ___) has two closely \nrelated operators:  (#$forbiddenToDo-WRT CODE AGT ___) and \n(#$permittedToDo-WRT CODE AGT ___).  For each PROP, \n \n(#$forbiddenToDo-WRT CODE AGT PROP) is equivalent to  \n(#$oughtToDo-WRT CODE AGT (#$refrainsFromBringingAbout AGT PROP)) \n \nand \n \n(#$permittedToDo-WRT CODE AGT PROP) is equivalent to  \n(#$not (#$oughtToDo-WRT CODE AGT (#$refrainsFromBringingAbout PROP))). \n \nGiven the relation between #$refrainsFromBringingAbout and \n#$bringsAbout, and given what we said above, it is easy to see that \nfor each PROP, \n \n(#$forbiddenToDo-WRT CODE AGT PROP) is equivalent to  \n(#$oughtToDo-WRT CODE AGT (#$not (#$bringsAbout AGT PROP))), and \n \n(#$permittedToDo-WRT CODE AGT PROP) is equivalent to  \n(#$not (#$oughtToDo-WRT CODE AGT (#$not (#$bringsAbout PROP)))). \n \n(Had we only allowed arg3 to be those formulas of the form \n(#$bringsAbout PROP'), we would have \n \n(#$permittedToDo-WRT CODE AGT ___) and  \n(#$oughtToDo-WRT CODE AGT ___) \n \nto be #$dualOperators.)") :- x_cid(a65b127182fcd2).
xc_microtheory(a65b127182fcd2,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd2,194).
xc_kb_names(a65b127182fcd2,[]).
xc_mapping_rows(a65b127182fcd2,[]).
x_argQuotedIsa('x_ought-c-Dual',2,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcd3).
xc_microtheory(a65b127182fcd3,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd3,232).
xc_kb_names(a65b127182fcd3,[]).
xc_mapping_rows(a65b127182fcd3,[]).
x_arg3QuotedIsa('x_oughtToDo-WRT','x_CycLSentence-Assertible') :- x_cid(a65b127182fcd4).
xc_microtheory(a65b127182fcd4,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd4,233).
xc_kb_names(a65b127182fcd4,[]).
xc_mapping_rows(a65b127182fcd4,[]).
x_isa('x_permittedToDo-WRT',x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fcd5).
xc_microtheory(a65b127182fcd5,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd5,234).
xc_kb_names(a65b127182fcd5,[]).
xc_mapping_rows(a65b127182fcd5,[]).
x_arg3QuotedIsa('x_ought-cc','x_CycLSentence-Assertible') :- x_cid(a65b127182fcd6).
xc_microtheory(a65b127182fcd6,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd6,235).
xc_kb_names(a65b127182fcd6,[]).
xc_mapping_rows(a65b127182fcd6,[]).
x_arg1Isa('x_ought-c-Dual',x_IntelligentAgent) :- x_cid(a65b127182fcd7).
xc_microtheory(a65b127182fcd7,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd7,236).
xc_kb_names(a65b127182fcd7,[]).
xc_mapping_rows(a65b127182fcd7,[]).
x_argIsa('x_ought-c-Dual',1,x_IntelligentAgent) :- x_cid(a65b127182fcd8).
xc_microtheory(a65b127182fcd8,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd8,237).
xc_kb_names(a65b127182fcd8,[]).
xc_mapping_rows(a65b127182fcd8,[]).
x_genlPreds('x_oughtToDo-WRT','x_permittedToDo-WRT') :- x_cid(a65b127182fcd9).
xc_microtheory(a65b127182fcd9,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcd9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcd9,238).
xc_kb_names(a65b127182fcd9,[]).
xc_mapping_rows(a65b127182fcd9,[]).
x_isa('x_forbiddenToDo-WRT',x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fcda).
xc_microtheory(a65b127182fcda,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcda,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcda,239).
xc_kb_names(a65b127182fcda,[]).
xc_mapping_rows(a65b127182fcda,[]).
x_comment('x_ought-c',"For each instance AGT of #$IntelligentAgent, and for each\ninstance PROP of #$ELSentence-Assertible, (#$ought-c AGT PROP) should\nbe read as `AGT weakly ought to bring it about that PROP'.  Here\n#$ought-c is a technical notion that ordinary OE or KE work should\navoid using (see #$oughtToDo etc. for constants used in ordinary OE or\nKE work).  (#$ought-c AGT PROP) is taken to mean, roughly, that either\nAGT ought to bring it about that PROP or it is settled that PROP.\nWhen (#$ought-c AGT PROP) is true, AGT may or may not intend to bring\nabout the fact described in PROP, neither must PROP be true.  Note\nthat (#$ought-c AGT PROP) is equivalent to (#$or (#$oughtToDo AGT\nPROP) (#$necessary-Historical PROP)) and each (#$ought-c AGT ___) is\nassigned as a normal D operator with some extra features.") :- x_cid(a65b127182fcdb).
xc_microtheory(a65b127182fcdb,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcdb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcdb,240).
xc_kb_names(a65b127182fcdb,[]).
xc_mapping_rows(a65b127182fcdb,[]).
x_comment('x_permittedToDo-WRT',"For each instance CODE of #$CodeOfConduct, each instance AGT of #$IntelligentAgent, (#$permittedToDo-WRT CODE AGT ___) is an instance of #$CommonUnaryModalOperator.  (permittedToDo-WRT CODE AGT PROP) means that in accordance with CODE (an instance of #$CodeOfConduct), AGT is permitted to bring it about that PROP.  Note that (#$permittedToDo-WRT CODE AGT PROP) is equivalent to (#$permittedToDo-WRT CODE AGT (#$bringsAbout PROP)) for every PROP, and that (#$permittedToDo-WRT CODE AGT PROP-1) is equivalent to (#$permittedToDo-WRT CODE AGT PROP-2) whenever PROP-1 is equivalent to PROP-2. (#$permittedToDo-WRT CODE AGT ___) has two closely related operators: (#$forbiddenToDo-WRT CODE AGT ___) and (#$oughtToDo-WRT CODE AGT ___).  For each PROP,\n\n(#$forbiddenToDo-WRT CODE AGT PROP) is equivalent to \n(#$not (#$permittedToDo-WRT CODE AGT PROP))\n\nand\n\n(#$oughtToDo-WRT CODE AGT PROP) is equivalent to \n(#$not (#$permittedToDo-WRT CODE AGT (#$refrainsFromBringingAbout PROP))).\n\nGiven the relation between #$refrainsFromBringingAbout and #$bringsAbout, and given what we said above, it is easy to see that for each PROP,\n\n(#$oughtToDo-WRT CODE AGT PROP) is equivalent to \n(#$not (#$permittedToDo-WRT CODE AGT (#$not (#$bringsAbout PROP)))).\n\n(Had we only allowed arg3 to be those formulas of the form (#$bringsAbout PROP'), we would have\n\n(#$permittedToDo-WRT CODE AGT ___) and \n(#$oughtToDo-WRT CODE AGT ___)\n\nto be #$dualOperators.)") :- x_cid(a65b127182fcdc).
xc_microtheory(a65b127182fcdc,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcdc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcdc,253).
xc_kb_names(a65b127182fcdc,[]).
xc_mapping_rows(a65b127182fcdc,[]).
x_negationPreds('x_permittedToDo-WRT','x_forbiddenToDo-WRT') :- x_cid(a65b127182fcdd).
xc_microtheory(a65b127182fcdd,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcdd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcdd,275).
xc_kb_names(a65b127182fcdd,[]).
xc_mapping_rows(a65b127182fcdd,[]).
x_isa(x_permittedToDo,x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fcde).
xc_microtheory(a65b127182fcde,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcde,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcde,276).
xc_kb_names(a65b127182fcde,[]).
xc_mapping_rows(a65b127182fcde,[]).
x_arg3QuotedIsa('x_forbiddenToDo-WRT','x_CycLSentence-Assertible') :- x_cid(a65b127182fcdf).
xc_microtheory(a65b127182fcdf,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcdf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcdf,277).
xc_kb_names(a65b127182fcdf,[]).
xc_mapping_rows(a65b127182fcdf,[]).
x_isa('x_oughtToDo-WRT',x_DeonticAndRelatedModalPredicate) :- x_cid(a65b127182fce0).
xc_microtheory(a65b127182fce0,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce0,278).
xc_kb_names(a65b127182fce0,[]).
xc_mapping_rows(a65b127182fce0,[]).
x_arg2QuotedIsa('x_ought-c','x_CycLSentence-Assertible') :- x_cid(a65b127182fce1).
xc_microtheory(a65b127182fce1,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce1,279).
xc_kb_names(a65b127182fce1,[]).
xc_mapping_rows(a65b127182fce1,[]).
x_argQuotedIsa('x_ought-cc-Dual',3,'x_CycLSentence-Assertible') :- x_cid(a65b127182fce2).
xc_microtheory(a65b127182fce2,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce2,280).
xc_kb_names(a65b127182fce2,[]).
xc_mapping_rows(a65b127182fce2,[]).
x_argIsa('x_forbiddenToDo-WRT',2,x_IntelligentAgent) :- x_cid(a65b127182fce3).
xc_microtheory(a65b127182fce3,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce3,281).
xc_kb_names(a65b127182fce3,[]).
xc_mapping_rows(a65b127182fce3,[]).
x_comment('x_ought-cc',"For each instance CODE of #$CodeOfConduct, each instance AGT\nof #$IntelligentAgent and each instance PROP of\n#$ELSentence-Assertible, (#$ought-cc CODE AGT PROP) should be read as\n`AGT weakly ought to, according to CODE, bring it about that PROP.'\n#$ought-cc is a technical notion that ordinary OE or KE work should\navoid using (see #$oughtToDo-WRT etc. for constants used in ordinary\nOE or KE work).  (#$ought-cc CODE AGT PROP) is taken to mean, roughly,\nthat in accordance with CODE (an instance of #$CodeOfConduct), AGT\nought to bring it about that PROP, or else it is settled that PROP.\nWhen (#$ought-cc AGT PROP) is true, AGT may or may not intend to bring\nabout the fact described in PROP, neither must PROP be true.  Note\nthat (#$ought-cc AGT PROP) is equivalent to (#$or (#$oughtToDo AGT\nPROP) (#$necessary-Historical PROP)) and each (#$ought-cc AGT ___) is\nassigned as a normal D operator with some extra features.") :- x_cid(a65b127182fce4).
xc_microtheory(a65b127182fce4,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce4,282).
xc_kb_names(a65b127182fce4,[]).
xc_mapping_rows(a65b127182fce4,[]).
x_isa(x_ModalOpSetFn('x_ought-c-Dual',x_IntelligentAgent),x_SetOfTypeFn(x_UnaryModalOperator)) :- x_cid(a65b127182fce5).
xc_microtheory(a65b127182fce5,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce5,297).
xc_kb_names(a65b127182fce5,[]).
xc_mapping_rows(a65b127182fce5,[]).
x_sharedNotes(x_oughtToDo,x_NoteOnDeonticToDoOperators) :- x_cid(a65b127182fce6).
xc_microtheory(a65b127182fce6,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce6,299).
xc_kb_names(a65b127182fce6,[]).
xc_mapping_rows(a65b127182fce6,[]).
x_arg1Isa(x_oughtToDo,x_IntelligentAgent) :- x_cid(a65b127182fce7).
xc_microtheory(a65b127182fce7,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce7,300).
xc_kb_names(a65b127182fce7,[]).
xc_mapping_rows(a65b127182fce7,[]).
x_genlPreds('x_ought-cc','x_ought-cc-Dual') :- x_cid(a65b127182fce8).
xc_microtheory(a65b127182fce8,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce8,301).
xc_kb_names(a65b127182fce8,[]).
xc_mapping_rows(a65b127182fce8,[]).
x_isa(x_ModalOpSetFn('x_ought-c',x_IntelligentAgent),x_SetOfTypeFn(x_CommonUnaryModalOperator)) :- x_cid(a65b127182fce9).
xc_microtheory(a65b127182fce9,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fce9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fce9,302).
xc_kb_names(a65b127182fce9,[]).
xc_mapping_rows(a65b127182fce9,[]).
x_arg1Isa('x_forbiddenToDo-WRT',x_CodeOfConduct) :- x_cid(a65b127182fcea).
xc_microtheory(a65b127182fcea,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcea,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcea,304).
xc_kb_names(a65b127182fcea,[]).
xc_mapping_rows(a65b127182fcea,[]).
x_comment('x_permittedToDoSit-WRT',"<code>(#$permittedToDoSit-WRT COC AGT SIT-TYPE)</code> holds just in case COC permits AGT to do (#$doneBy) instances of SIT-TYPE.  More precisely, it holds just in case (#$permittedToDo-WRT COC AGT SENT) where SENT is a sentence of the form (#$doneBy INS AGT) where INS is any suitable instance of SIT-TYPE.  Note: INS must be a \"suitable\" instance of SIT-TYPE.  By \"suitable\" we mean that INS is not also an instance of any collection of events that AGT is prohibited from performing.  For instance, Bob is a licensed driver so (#$permittedToDoSit-WRT USTrafficLaws Bob DrivingAnAutomobile) holds though Bob is not permitted to do any old instance of DrivingAnAutomobile.  Rather, Bob is permitted to do any instance that is not in conflict with any COC that Bob is subject to -- e.g. Bob is not permitted to perform \"DrivingAStolenAutomobile150MPHWhileTransportingAMinorAcrossStateLineForImmoralPurposes\" ") :- x_cid(a65b127182fceb).
xc_microtheory(a65b127182fceb,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fceb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fceb,305).
xc_kb_names(a65b127182fceb,[]).
xc_mapping_rows(a65b127182fceb,[]).
x_argQuotedIsa(x_forbiddenToDo,2,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcec).
xc_microtheory(a65b127182fcec,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcec,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcec,307).
xc_kb_names(a65b127182fcec,[]).
xc_mapping_rows(a65b127182fcec,[]).
x_argQuotedIsa('x_forbiddenToDo-WRT',3,'x_CycLSentence-Assertible') :- x_cid(a65b127182fced).
xc_microtheory(a65b127182fced,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fced,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fced,308).
xc_kb_names(a65b127182fced,[]).
xc_mapping_rows(a65b127182fced,[]).
x_argIsa(x_forbiddenToDo,1,x_IntelligentAgent) :- x_cid(a65b127182fcee).
xc_microtheory(a65b127182fcee,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcee,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcee,309).
xc_kb_names(a65b127182fcee,[]).
xc_mapping_rows(a65b127182fcee,[]).
x_argQuotedIsa('x_ought-c',2,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcef).
xc_microtheory(a65b127182fcef,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcef,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcef,310).
xc_kb_names(a65b127182fcef,[]).
xc_mapping_rows(a65b127182fcef,[]).
x_argQuotedIsa('x_ought-cc',3,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcf0).
xc_microtheory(a65b127182fcf0,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf0,311).
xc_kb_names(a65b127182fcf0,[]).
xc_mapping_rows(a65b127182fcf0,[]).
x_quotedIsa(x_NoteOnDeonticToDoOperators,x_SharedNote) :- x_cid(a65b127182fcf1).
xc_microtheory(a65b127182fcf1,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf1,312).
xc_kb_names(a65b127182fcf1,[]).
xc_mapping_rows(a65b127182fcf1,[]).
x_isa('x_ModalOpSet1-2Fn'('x_ought-cc-Dual',x_CodeOfConduct,x_IntelligentAgent),x_SetOfTypeFn(x_UnaryModalOperator)) :- x_cid(a65b127182fcf2).
xc_microtheory(a65b127182fcf2,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf2,313).
xc_kb_names(a65b127182fcf2,[]).
xc_mapping_rows(a65b127182fcf2,[]).
x_arg1Isa('x_ought-cc-Dual',x_CodeOfConduct) :- x_cid(a65b127182fcf3).
xc_microtheory(a65b127182fcf3,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf3,315).
xc_kb_names(a65b127182fcf3,[]).
xc_mapping_rows(a65b127182fcf3,[]).
x_arg2Isa('x_permittedToDo-WRT',x_IntelligentAgent) :- x_cid(a65b127182fcf4).
xc_microtheory(a65b127182fcf4,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf4,316).
xc_kb_names(a65b127182fcf4,[]).
xc_mapping_rows(a65b127182fcf4,[]).
x_negationPreds(x_forbiddenToDo,x_permittedToDo) :- x_cid(a65b127182fcf5).
xc_microtheory(a65b127182fcf5,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf5,317).
xc_kb_names(a65b127182fcf5,[]).
xc_mapping_rows(a65b127182fcf5,[]).
x_argIsa('x_permittedToDo-WRT',1,x_CodeOfConduct) :- x_cid(a65b127182fcf6).
xc_microtheory(a65b127182fcf6,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf6,318).
xc_kb_names(a65b127182fcf6,[]).
xc_mapping_rows(a65b127182fcf6,[]).
x_isa('x_ModalOpSet1-2Fn'('x_ought-cc',x_CodeOfConduct,x_IntelligentAgent),x_SetOfTypeFn(x_UnaryModalOperator)) :- x_cid(a65b127182fcf7).
xc_microtheory(a65b127182fcf7,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf7,319).
xc_kb_names(a65b127182fcf7,[]).
xc_mapping_rows(a65b127182fcf7,[]).
x_comment('x_ought-cc-Dual',"For each instance AGT in #$IntelligentAgent, (#$ought-cc-Dual\nAGT ___) is the #$dualOperator of (#$ought-cc AGT ___).  This is a\ntechnical notion that ordinary OE or KE work should avoid using.") :- x_cid(a65b127182fcf8).
xc_microtheory(a65b127182fcf8,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf8,321).
xc_kb_names(a65b127182fcf8,[]).
xc_mapping_rows(a65b127182fcf8,[]).
x_argIsa(x_oughtToDo,1,x_IntelligentAgent) :- x_cid(a65b127182fcf9).
xc_microtheory(a65b127182fcf9,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcf9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcf9,325).
xc_kb_names(a65b127182fcf9,[]).
xc_mapping_rows(a65b127182fcf9,[]).
x_argIsa(x_permittedToDo,1,x_IntelligentAgent) :- x_cid(a65b127182fcfa).
xc_microtheory(a65b127182fcfa,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcfa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcfa,326).
xc_kb_names(a65b127182fcfa,[]).
xc_mapping_rows(a65b127182fcfa,[]).
x_arg3QuotedIsa('x_permittedToDo-WRT','x_CycLSentence-Assertible') :- x_cid(a65b127182fcfb).
xc_microtheory(a65b127182fcfb,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcfb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcfb,327).
xc_kb_names(a65b127182fcfb,[]).
xc_mapping_rows(a65b127182fcfb,[]).
x_comment('x_ought-c-Dual',"For each instance AGT in #$IntelligentAgent, (#$ought-c-Dual\nAGT ___) is the #$dualOperator of (#$ought-c AGT ___).  This is a\ntechnical notion that ordinary OE or KE work should avoid using.") :- x_cid(a65b127182fcfc).
xc_microtheory(a65b127182fcfc,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcfc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcfc,328).
xc_kb_names(a65b127182fcfc,[]).
xc_mapping_rows(a65b127182fcfc,[]).
x_argIsa('x_ought-c',1,x_IntelligentAgent) :- x_cid(a65b127182fcfd).
xc_microtheory(a65b127182fcfd,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcfd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcfd,332).
xc_kb_names(a65b127182fcfd,[]).
xc_mapping_rows(a65b127182fcfd,[]).
x_comment(x_forbiddenToDo,"For each instance AGT of #$IntelligentAgent and each \ninstance PROP of #$ELSentence-Assertible, (#$forbiddenToDo AGT PROP) \nmeans that AGT is forbidden to bring it about that PROP.  Note that \n#$forbiddenToDo is not the same as #$forbiddenToBe.  Note also that \n(#$forbiddenToDo AGT PROP) is equivalent to (#$forbiddenToDo AGT \n(#$bringsAbout PROP)) for every PROP, and that (#$forbiddenToDo AGT \nPROP-1) is equivalent to (#$forbiddenToDo AGT PROP-2) whenever PROP-1 \nis equivalent to PROP-2.  (#$forbiddenToDo AGT ___) has two closely \nrelated operators: (#$permittedToDo AGT ___) and (#$oughtToDo CODE AGT \n___).  For each PROP, \n \n(#$permittedToDo AGT PROP) is equivalent to  \n(#$not (#$forbiddenToDo AGT PROP)) \n \nand \n \n(#$oughtToDo AGT PROP) is equivalent to  \n(#$forbiddenToDo AGT (#$refrainsFromBringingAbout PROP)). \n \nGiven the relation between #$refrainsFromBringingAbout and \n#$bringsAbout, and given what we said above, it is easy to see that \nfor each PROP, \n \n(#$oughtToDo AGT PROP) is equivalent to  \n(#$forbiddenToDo AGT (#$not (#$bringsAbout AGT PROP))).   \n \nFor forbidden-to-do operators with parameters, see \n#$forbiddenToDo-WRT.") :- x_cid(a65b127182fcfe).
xc_microtheory(a65b127182fcfe,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcfe,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcfe,333).
xc_kb_names(a65b127182fcfe,[]).
xc_mapping_rows(a65b127182fcfe,[]).
x_arg2QuotedIsa(x_oughtToDo,'x_CycLSentence-Assertible') :- x_cid(a65b127182fcff).
xc_microtheory(a65b127182fcff,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fcff,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fcff,362).
xc_kb_names(a65b127182fcff,[]).
xc_mapping_rows(a65b127182fcff,[]).
x_argQuotedIsa('x_oughtToDo-WRT',3,'x_CycLSentence-Assertible') :- x_cid(a65b127182fd00).
xc_microtheory(a65b127182fd00,'x_DeonticReasoningWithMultiFuture-LogicMt').
xc_source_file(a65b127182fd00,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoningWithMultiFuture-LogicMt.krf').
xc_source_line(a65b127182fd00,363).
xc_kb_names(a65b127182fd00,[]).
xc_mapping_rows(a65b127182fd00,[]).
kb_cache_footer(footer{count:88,digest:'3ec256aca1f4d9c19db937f92921e445ef5c38f1895c37b6dcebe94d855257b3',headerDigest:'016b8854743bde5c7d9667058b8e672438de84d45a80fadbb61bfc4dbc7368a1'}).
