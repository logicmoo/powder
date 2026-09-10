:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:11,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:85,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:da350f2af53e9e579b4b3e964e02a803e68a51c0df02ed1fd8ec1e27bc56285d,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3091,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf',sourceHash:'908c31a767b4240c0875f224f523cd290398297ac8912003387190026671d11a',warnings:[]}).
x_genlMt(x_EATemporalRulesMt,x_EAStructuralRulesMt) :- x_cid(a65b1269deb878).
xc_microtheory(a65b1269deb878,x_EATemporalRulesMt).
xc_source_file(a65b1269deb878,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb878,14).
xc_kb_names(a65b1269deb878,[]).
xc_mapping_rows(a65b1269deb878,[]).
xc_exclude_globals(a65b1269deb878,true).
'x_<=='(x_startsDuring(V1,V2),x_discourseCaseForDrs(V3,V4),'x_ist-Information'(V3,'x_startsDuring-IP'(V4,V1,V2))) :- x_cid(a65b1269deb879,V1,V2,V3,V4).
xc_microtheory(a65b1269deb879,x_EATemporalRulesMt).
xc_source_file(a65b1269deb879,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb879,20).
xc_kb_names(a65b1269deb879,["?event","?sit","?dcase","?drs-id"]).
xc_mapping_rows(a65b1269deb879,[]).
xc_exclude_globals(a65b1269deb879,true).
'x_<=='('x_startsDuring-IP'(V1,V2,V3),x_verbForm(V2,x_past,'x_Non-Perfect',x_Progressive),x_leadsTo(V3,V2),x_verbForm(V3,x_past,'x_Non-Perfect','x_Non-Progressive')) :- x_cid(a65b1269deb87a,V1,V2,V3).
xc_microtheory(a65b1269deb87a,x_EATemporalRulesMt).
xc_source_file(a65b1269deb87a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb87a,24).
xc_kb_names(a65b1269deb87a,["?drs-id","?event","?progressive"]).
xc_mapping_rows(a65b1269deb87a,[]).
xc_exclude_globals(a65b1269deb87a,true).
'x_<=='(x_before(V1,V2),x_discourseCaseForDrs(V3),'x_ist-Information'(V3,x_sentenceAttachment(V4,V5)),'x_ist-Information'(x_SentenceCaseFn(V5),x_headEvent(V1)),'x_ist-Information'(x_SentenceCaseFn(V5),x_discourseVarVerbTense(V1,V6)),'x_ist-Information'(x_SentenceCaseFn(V5),x_uninferredSentence(x_discourseVarVerbProgressive(V1))),'x_ist-Information'(x_SentenceCaseFn(V4),x_headEvent(V2)),'x_ist-Information'(x_SentenceCaseFn(V4),x_discourseVarVerbTense(V2,V6)),'x_ist-Information'(x_SentenceCaseFn(V4),x_uninferredSentence(x_discourseVarVerbPerfect(V2)))) :- x_cid(a65b1269deb87b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269deb87b,x_EATemporalRulesMt).
xc_source_file(a65b1269deb87b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb87b,30).
xc_kb_names(a65b1269deb87b,["?prior-event","?event","?dcase","?sent-id","?attach-to-sent-id","?tense"]).
xc_mapping_rows(a65b1269deb87b,[]).
xc_exclude_globals(a65b1269deb87b,true).
'x_<=='(x_before(V1,V2),x_before(V1,V3),x_before(V3,V2)) :- x_cid(a65b1269deb87c,V1,V2,V3).
xc_microtheory(a65b1269deb87c,x_EATemporalRulesMt).
xc_source_file(a65b1269deb87c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb87c,56).
xc_kb_names(a65b1269deb87c,["?a","?c","?b"]).
xc_mapping_rows(a65b1269deb87c,[]).
xc_exclude_globals(a65b1269deb87c,true).
'x_<=='(x_startsBefore(V1,V2),x_before(V1,V2)) :- x_cid(a65b1269deb87d,V1,V2).
xc_microtheory(a65b1269deb87d,x_EATemporalRulesMt).
xc_source_file(a65b1269deb87d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb87d,64).
xc_kb_names(a65b1269deb87d,["?prior-event","?event"]).
xc_mapping_rows(a65b1269deb87d,[]).
xc_exclude_globals(a65b1269deb87d,true).
'x_<=='(x_startsBefore(V1,V2),x_startsDuring(V2,V1)) :- x_cid(a65b1269deb87e,V1,V2).
xc_microtheory(a65b1269deb87e,x_EATemporalRulesMt).
xc_source_file(a65b1269deb87e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb87e,67).
xc_kb_names(a65b1269deb87e,["?prior-event","?event"]).
xc_mapping_rows(a65b1269deb87e,[]).
xc_exclude_globals(a65b1269deb87e,true).
'x_<=='(x_startsDuring(V1,V2),x_temporallySubsumes(V2,V1)) :- x_cid(a65b1269deb87f,V1,V2).
xc_microtheory(a65b1269deb87f,x_EATemporalRulesMt).
xc_source_file(a65b1269deb87f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb87f,70).
xc_kb_names(a65b1269deb87f,["?starting-event","?event"]).
xc_mapping_rows(a65b1269deb87f,[]).
xc_exclude_globals(a65b1269deb87f,true).
'x_<=='(x_startsDuring(V1,V2),x_overlaps(V2,V1)) :- x_cid(a65b1269deb880,V1,V2).
xc_microtheory(a65b1269deb880,x_EATemporalRulesMt).
xc_source_file(a65b1269deb880,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb880,73).
xc_kb_names(a65b1269deb880,["?starting-event","?event"]).
xc_mapping_rows(a65b1269deb880,[]).
xc_exclude_globals(a65b1269deb880,true).
'x_<=='(x_endsDuring(V1,V2),x_temporallySubsumes(V2,V1)) :- x_cid(a65b1269deb881,V1,V2).
xc_microtheory(a65b1269deb881,x_EATemporalRulesMt).
xc_source_file(a65b1269deb881,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb881,76).
xc_kb_names(a65b1269deb881,["?ending-event","?event"]).
xc_mapping_rows(a65b1269deb881,[]).
xc_exclude_globals(a65b1269deb881,true).
'x_<=='(x_endsDuring(V1,V2),x_overlaps(V1,V2)) :- x_cid(a65b1269deb882,V1,V2).
xc_microtheory(a65b1269deb882,x_EATemporalRulesMt).
xc_source_file(a65b1269deb882,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/temporal-rules.krf').
xc_source_line(a65b1269deb882,79).
xc_kb_names(a65b1269deb882,["?ending-event","?event"]).
xc_mapping_rows(a65b1269deb882,[]).
xc_exclude_globals(a65b1269deb882,true).
kb_cache_footer(footer{count:11,digest:da350f2af53e9e579b4b3e964e02a803e68a51c0df02ed1fd8ec1e27bc56285d,headerDigest:'588cfc4dd3073ea0e4b2692294de4a3122c4d7aa5da5cfd52d3f58321e68164b'}).
