:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:10,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:65,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'5c68f27ca34447037e91e15a65daabec38c2b20bd91ed2093e845518b106df78',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1623,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf',sourceHash:'7ce581d05389a07b8e6a91dbf3a576dbdeba70724b4d361a3022eb7f725b56d5',warnings:[]}).
x_isa(x_observation,x_BinaryPredicate) :- x_cid(a65b126230002d).
xc_microtheory(a65b126230002d,x_DiagnosisMt).
xc_source_file(a65b126230002d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b126230002d,8).
xc_kb_names(a65b126230002d,[]).
xc_mapping_rows(a65b126230002d,[]).
'x_<=='(x_symptom(V1,x_Fever),x_disease(V1,x_Flu)) :- x_cid(a65b126230002e,V1).
xc_microtheory(a65b126230002e,x_DiagnosisMt).
xc_source_file(a65b126230002e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b126230002e,13).
xc_kb_names(a65b126230002e,["?patient"]).
xc_mapping_rows(a65b126230002e,[]).
'x_<=='(x_symptom(V1,x_Spots),x_disease(V1,x_Measles)) :- x_cid(a65b126230002f,V1).
xc_microtheory(a65b126230002f,x_DiagnosisMt).
xc_source_file(a65b126230002f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b126230002f,17).
xc_kb_names(a65b126230002f,["?patient"]).
xc_mapping_rows(a65b126230002f,[]).
'x_<=='(x_symptom(V1,x_Cough),x_disease(V1,x_Strep)) :- x_cid(a65b1262300030,V1).
xc_microtheory(a65b1262300030,x_DiagnosisMt).
xc_source_file(a65b1262300030,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b1262300030,21).
xc_kb_names(a65b1262300030,["?patient"]).
xc_mapping_rows(a65b1262300030,[]).
'x_<=='(x_symptom(V1,x_Cough),x_disease(V1,x_Flu)) :- x_cid(a65b1262300031,V1).
xc_microtheory(a65b1262300031,x_DiagnosisMt).
xc_source_file(a65b1262300031,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b1262300031,25).
xc_kb_names(a65b1262300031,["?patient"]).
xc_mapping_rows(a65b1262300031,[]).
'x_<=='(x_diagnosis(V1,V2),x_withAbductivePolicy(x_MinimalAssumptions,x_withAbductivePredicates(x_disease,x_abductiveDiagnosis(V1,V3))),x_lookupOnly(x_disease(V1,V2))) :- x_cid(a65b1262300032,V1,V2,V3).
xc_microtheory(a65b1262300032,x_DiagnosisMt).
xc_source_file(a65b1262300032,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b1262300032,43).
xc_kb_names(a65b1262300032,["?patient","?disease","?symptom"]).
xc_mapping_rows(a65b1262300032,[]).
'x_<=='(x_abductiveDiagnosis(V1,V2),x_observation(V1,V2),x_symptom(V1,V2)) :- x_cid(a65b1262300033,V1,V2).
xc_microtheory(a65b1262300033,x_DiagnosisMt).
xc_source_file(a65b1262300033,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b1262300033,50).
xc_kb_names(a65b1262300033,["?patient","?symptom"]).
xc_mapping_rows(a65b1262300033,[]).
x_genlMt(x_PatientStatsMt,x_DiagnosisMt) :- x_cid(a65b1262300034).
xc_microtheory(a65b1262300034,x_PatientStatsMt).
xc_source_file(a65b1262300034,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b1262300034,56).
xc_kb_names(a65b1262300034,[]).
xc_mapping_rows(a65b1262300034,[]).
x_observation(x_Tom,x_Fever) :- x_cid(a65b1262300035).
xc_microtheory(a65b1262300035,x_PatientStatsMt).
xc_source_file(a65b1262300035,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b1262300035,58).
xc_kb_names(a65b1262300035,[]).
xc_mapping_rows(a65b1262300035,[]).
x_observation(x_Tom,x_Cough) :- x_cid(a65b1262300036).
xc_microtheory(a65b1262300036,x_PatientStatsMt).
xc_source_file(a65b1262300036,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-abductive-diagnosis.krf').
xc_source_line(a65b1262300036,59).
xc_kb_names(a65b1262300036,[]).
xc_mapping_rows(a65b1262300036,[]).
kb_cache_footer(footer{count:10,digest:'5c68f27ca34447037e91e15a65daabec38c2b20bd91ed2093e845518b106df78',headerDigest:ad6bcbc0a94b2b10bf846006ac3118b8135d1ec6a3e90803edff35995789c624}).
