:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:8,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:81,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'496ddee27f3b80813479a61b7d0d7b62215e6ba5b0897844f94a4c96281793a5',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3024,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf',sourceHash:f9fc03ceef94e8c9df10dd9d723603376f9db927be71a58db276f8072da75bb4,warnings:[]}).
x_isa(x_inferDeeperMeaning,x_ComplexActionPredicate) :- x_cid(a65b125d3bf531).
xc_microtheory(a65b125d3bf531,'x_Interaction-ManagerMt').
xc_source_file(a65b125d3bf531,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf').
xc_source_line(a65b125d3bf531,10).
xc_kb_names(a65b125d3bf531,[]).
xc_mapping_rows(a65b125d3bf531,[]).
x_arity(x_inferDeeperMeaning,3) :- x_cid(a65b125d3bf532).
xc_microtheory(a65b125d3bf532,'x_Interaction-ManagerMt').
xc_source_file(a65b125d3bf532,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf').
xc_source_line(a65b125d3bf532,11).
xc_kb_names(a65b125d3bf532,[]).
xc_mapping_rows(a65b125d3bf532,[]).
x_comment(x_inferDeeperMeaning,"(inferDeeperMeaning ?context ?sid ?utterance-type) tries to uncover the motivation behind a question or statement.") :- x_cid(a65b125d3bf533).
xc_microtheory(a65b125d3bf533,'x_Interaction-ManagerMt').
xc_source_file(a65b125d3bf533,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf').
xc_source_line(a65b125d3bf533,12).
xc_kb_names(a65b125d3bf533,[]).
xc_mapping_rows(a65b125d3bf533,[]).
x_preconditionForMethod(x_uniqueInterpretation(V1,V2,V3),x_methodForAction(x_inferDeeperMeaning(V1,V2,x_DeclarativeUtterance),x_actionSequence(x_TheList(x_doAnnounce("~%Looking for deeper meaning in statement ~s.",[V3]))))) :- x_cid(a65b125d3bf534,V1,V2,V3).
xc_microtheory(a65b125d3bf534,'x_Interaction-ManagerMt').
xc_source_file(a65b125d3bf534,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf').
xc_source_line(a65b125d3bf534,18).
xc_kb_names(a65b125d3bf534,["?context","?sid","?interpretation"]).
xc_mapping_rows(a65b125d3bf534,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 24, column 69), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d3bf534,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 24, column 69), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_uniqueInterpretation(V1,V2,V3),x_methodForAction(x_inferDeeperMeaning(V1,V2,x_ImperativeUtterance),x_actionSequence(x_TheList(x_doAnnounce("~%Looking for deeper meaning in imperative ~s.",[V3]))))) :- x_cid(a65b125d3bf535,V1,V2,V3).
xc_microtheory(a65b125d3bf535,'x_Interaction-ManagerMt').
xc_source_file(a65b125d3bf535,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf').
xc_source_line(a65b125d3bf535,30).
xc_kb_names(a65b125d3bf535,["?context","?sid","?interpretation"]).
xc_mapping_rows(a65b125d3bf535,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 36, column 70), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d3bf535,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 36, column 70), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_different(V1,x_DeclarativeUtterance),x_different(V1,x_ImperativeUtterance),x_lookupOnly(x_localOnly('x_ist-Information'(V2,x_queryAnswer(V3,V4))))),x_methodForAction(x_inferDeeperMeaning(V2,V3,V1),x_actionSequence(x_TheList(x_doAnnounce("~%Looking for deeper meaning from (queryAnswer ~s ~s)",[V3,V4]))))) :- x_cid(a65b125d3bf536,V1,V2,V3,V4).
xc_microtheory(a65b125d3bf536,'x_Interaction-ManagerMt').
xc_source_file(a65b125d3bf536,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf').
xc_source_line(a65b125d3bf536,43).
xc_kb_names(a65b125d3bf536,["?type","?context","?sid","?answers"]).
xc_mapping_rows(a65b125d3bf536,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 59, column 77), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d3bf536,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 59, column 77), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_inferDeeperMeaning(V1,V2,V3),x_actionSequence(x_TheList))) :- x_cid(a65b125d3bf537,V1,V2,V3).
xc_microtheory(a65b125d3bf537,'x_Interaction-ManagerMt').
xc_source_file(a65b125d3bf537,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf').
xc_source_line(a65b125d3bf537,62).
xc_kb_names(a65b125d3bf537,["?context","?sid","?type"]).
xc_mapping_rows(a65b125d3bf537,[]).
'x_<=='(x_preferInContext(x_inferDeeperMeaning(V1,V2,V3),V4,V5),x_different(V4,x_actionSequence(x_TheList))) :- x_cid(a65b125d3bf538,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d3bf538,'x_Interaction-ManagerMt').
xc_source_file(a65b125d3bf538,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/intent-followup.krf').
xc_source_line(a65b125d3bf538,69).
xc_kb_names(a65b125d3bf538,["?context","?sid","?type","?seq1","?seq2"]).
xc_mapping_rows(a65b125d3bf538,[]).
kb_cache_footer(footer{count:8,digest:'496ddee27f3b80813479a61b7d0d7b62215e6ba5b0897844f94a4c96281793a5',headerDigest:'2b46793abd7176901538fd21928e4cb47a25b5afec8ab20c037bbe4576ab8876'}).
