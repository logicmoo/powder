:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:6,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:76,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'81a0c4f1546186a2613d6c4b747d97132f7bb98b108f173f4ac903d5d05e1c01',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/temporal-chainer.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3260,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/temporal-chainer.krf',sourceHash:'7c35af2f44f51326a5f49c1a1d82a03ae5f4899f20b5af3fa30f550a810a4e1c',warnings:[]}).
x_isa(x_relativeDate,x_BinaryPredicate) :- x_cid(a65b125d4c0f0b).
xc_microtheory(a65b125d4c0f0b,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4c0f0b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/temporal-chainer.krf').
xc_source_line(a65b125d4c0f0b,10).
xc_kb_names(a65b125d4c0f0b,[]).
xc_mapping_rows(a65b125d4c0f0b,[]).
'x_<=='(x_relativeDate(V1,V2),x_currentDate(V3),x_equals(V1,V3),x_unifies(V2,"earlier today")) :- x_cid(a65b125d4c0f0c,V1,V2,V3).
xc_microtheory(a65b125d4c0f0c,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4c0f0c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/temporal-chainer.krf').
xc_source_line(a65b125d4c0f0c,12).
xc_kb_names(a65b125d4c0f0c,["?date","?relative-expression","?now"]).
xc_mapping_rows(a65b125d4c0f0c,[]).
'x_<=='(x_relativeDate(V1,V2),x_currentDate(V3),x_different(V1,V3),x_uninferredSentence(x_inferenceOnly(x_yesterday(V1))),x_absoluteDate(V1,V4),x_formattedContentString("on ~a",x_TheList(V4),V2)) :- x_cid(a65b125d4c0f0d,V1,V2,V3,V4).
xc_microtheory(a65b125d4c0f0d,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4c0f0d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/temporal-chainer.krf').
xc_source_line(a65b125d4c0f0d,17).
xc_kb_names(a65b125d4c0f0d,["?date","?relative-expression","?now","?date-expression"]).
xc_mapping_rows(a65b125d4c0f0d,[]).
'x_<=='(x_relativeDate(V1,"yesterday"),x_inferenceOnly(x_yesterday(V1))) :- x_cid(a65b125d4c0f0e,V1).
xc_microtheory(a65b125d4c0f0e,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4c0f0e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/temporal-chainer.krf').
xc_source_line(a65b125d4c0f0e,26).
xc_kb_names(a65b125d4c0f0e,["?date"]).
xc_mapping_rows(a65b125d4c0f0e,[]).
x_isa(x_absoluteDate,x_BinaryPredicate) :- x_cid(a65b125d4c0f0f).
xc_microtheory(a65b125d4c0f0f,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4c0f0f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/temporal-chainer.krf').
xc_source_line(a65b125d4c0f0f,30).
xc_kb_names(a65b125d4c0f0f,[]).
xc_mapping_rows(a65b125d4c0f0f,[]).
'x_<=='(x_absoluteDate(V1,V2),x_destructuredCycDate(V1,V3,V4,V5),x_allFactsAllowed(x_numAnswers(1,x_localOnly('x_ist-Information'(x_CalendarsMt,x_calendarMonthIndex(x_GregorianMonthType,V6,V4))))),x_localOnly('x_ist-Information'(x_GeneralEnglishMt,x_nameString(V6,V7))),x_formattedContentString("~a ~a, ~a",x_TheList(V7,V5,V3),V2)) :- x_cid(a65b125d4c0f10,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d4c0f10,'x_Interaction-ManagerMt').
xc_source_file(a65b125d4c0f10,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/dialog/temporal-chainer.krf').
xc_source_line(a65b125d4c0f10,34).
xc_kb_names(a65b125d4c0f10,["?date","?date-expression","?year","?month-num","?day","?month","?month-name"]).
xc_mapping_rows(a65b125d4c0f10,[]).
kb_cache_footer(footer{count:6,digest:'81a0c4f1546186a2613d6c4b747d97132f7bb98b108f173f4ac903d5d05e1c01',headerDigest:d38ac93d8785feb1c0eefa20ae7f285a9c78ef9ecf549d1145c490d4f513ab88}).
