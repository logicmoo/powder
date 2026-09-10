:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:7,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:61,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'35182da319fa476f00808b62f4f83e628b1d0e797d8f0263270558184271f2a9',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/reading-questions.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2605,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/reading-questions.krf',sourceHash:'53e86c33524139b39ed1eb4e19d5a9aa92694d1bf6919493ff1edcf90d527692',warnings:[]}).
x_isa(x_respondToQueryInSentence,x_ComplexActionPredicate) :- x_cid(a65b125d86da60).
xc_microtheory(a65b125d86da60,'x_Interaction-ManagerMt').
xc_source_file(a65b125d86da60,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/reading-questions.krf').
xc_source_line(a65b125d86da60,18).
xc_kb_names(a65b125d86da60,[]).
xc_mapping_rows(a65b125d86da60,[]).
x_arity(x_respondToQueryInSentence,3) :- x_cid(a65b125d86da61).
xc_microtheory(a65b125d86da61,'x_Interaction-ManagerMt').
xc_source_file(a65b125d86da61,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/reading-questions.krf').
xc_source_line(a65b125d86da61,19).
xc_kb_names(a65b125d86da61,[]).
xc_mapping_rows(a65b125d86da61,[]).
x_arg1Isa(x_respondToQueryInSentence,x_Microtheory) :- x_cid(a65b125d86da62).
xc_microtheory(a65b125d86da62,'x_Interaction-ManagerMt').
xc_source_file(a65b125d86da62,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/reading-questions.krf').
xc_source_line(a65b125d86da62,20).
xc_kb_names(a65b125d86da62,[]).
xc_mapping_rows(a65b125d86da62,[]).
x_arg2Isa(x_respondToQueryInSentence,x_CycLTerm) :- x_cid(a65b125d86da63).
xc_microtheory(a65b125d86da63,'x_Interaction-ManagerMt').
xc_source_file(a65b125d86da63,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/reading-questions.krf').
xc_source_line(a65b125d86da63,21).
xc_kb_names(a65b125d86da63,[]).
xc_mapping_rows(a65b125d86da63,[]).
x_comment(x_respondToQueryInSentence,"(respondToQueryInSentence ?context ?sentence-id) attempts\nto answer the question posed in ?sentence.") :- x_cid(a65b125d86da64).
xc_microtheory(a65b125d86da64,'x_Interaction-ManagerMt').
xc_source_file(a65b125d86da64,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/reading-questions.krf').
xc_source_line(a65b125d86da64,22).
xc_kb_names(a65b125d86da64,[]).
xc_mapping_rows(a65b125d86da64,[]).
x_preconditionForMethod(x_and(x_mostSpecificUtteranceType(V1,V2),x_genls(V2,'x_InformationRequest-IBT'),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_and('x_ist-Information'(V5,x_interpretationOf(V1,V6)),x_queryFormForInterpretation(V2,V1,V6,V7),x_unifies(V4,'x_ist-Information'(V5,x_sentenceQuery(V1,V6,V7))))))),x_methodForAction(x_respondToQueryInSentence(V5,V1),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V5,x_iteIllocutionaryForce(V1,x_Query))),x_doRecord('x_ist-Information'(V5,x_isa(V1,x_RequestingInformation))),x_doRecordMembers(V3),x_respondToQuestion(V5,V1,V2))))) :- x_cid(a65b125d86da65,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d86da65,'x_Interaction-ManagerMt').
xc_source_file(a65b125d86da65,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/reading-questions.krf').
xc_source_line(a65b125d86da65,25).
xc_kb_names(a65b125d86da65,["?sentence-id","?sentence-type","?stmts","?stmt","?context","?interpretation","?query"]).
xc_mapping_rows(a65b125d86da65,[]).
x_preconditionForMethod(x_and(x_mostSpecificUtteranceType(V1,V2),x_uninferredSentence(x_genls(V2,'x_InformationRequest-IBT'))),x_methodForAction(x_respondToQueryInSentence(V3,V1),x_actionSequence(x_TheList(x_doAnnounce("~a does not seem to be a question.",[V1]))))) :- x_cid(a65b125d86da66,V1,V2,V3).
xc_microtheory(a65b125d86da66,'x_Interaction-ManagerMt').
xc_source_file(a65b125d86da66,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/reading-questions.krf').
xc_source_line(a65b125d86da66,48).
xc_kb_names(a65b125d86da66,["?sentence-id","?sentence-type","?context"]).
xc_mapping_rows(a65b125d86da66,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 58, column 58), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d86da66,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 58, column 58), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:7,digest:'35182da319fa476f00808b62f4f83e628b1d0e797d8f0263270558184271f2a9',headerDigest:d2f1e4e14afabd63fbf0aee760872195ee97b3d160a3643f8be686872a901135}).
