:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:18,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:59,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'0ade19b23f4bdee8ee7afe18c2f11561792e804ea76bab234e23996e3b521783',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2480,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf',sourceHash:'76187ff7bb14edd5ed83488d55b7bfcf47c8e1a055c30a4617f303b6e5ecb714',warnings:[]}).
x_isa(x_StructuredExplanationMt,x_Microtheory) :- x_cid(a65b128143ee35).
xc_microtheory(a65b128143ee35,'x_structured-explanationMt').
xc_source_file(a65b128143ee35,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee35,13).
xc_kb_names(a65b128143ee35,[]).
xc_mapping_rows(a65b128143ee35,[]).
x_isa(x_StrExType,x_Collection) :- x_cid(a65b128143ee36).
xc_microtheory(a65b128143ee36,x_StructuredExplanationMt).
xc_source_file(a65b128143ee36,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee36,20).
xc_kb_names(a65b128143ee36,[]).
xc_mapping_rows(a65b128143ee36,[]).
x_comment(x_StrExType,"StrExType is the collection of types of explanations.") :- x_cid(a65b128143ee37).
xc_microtheory(a65b128143ee37,x_StructuredExplanationMt).
xc_source_file(a65b128143ee37,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee37,21).
xc_kb_names(a65b128143ee37,[]).
xc_mapping_rows(a65b128143ee37,[]).
x_genls(x_StrExType,x_Thing) :- x_cid(a65b128143ee38).
xc_microtheory(a65b128143ee38,x_StructuredExplanationMt).
xc_source_file(a65b128143ee38,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee38,22).
xc_kb_names(a65b128143ee38,[]).
xc_mapping_rows(a65b128143ee38,[]).
x_isa(x_Inexplicable,x_StrExType) :- x_cid(a65b128143ee39).
xc_microtheory(a65b128143ee39,x_StructuredExplanationMt).
xc_source_file(a65b128143ee39,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee39,24).
xc_kb_names(a65b128143ee39,[]).
xc_mapping_rows(a65b128143ee39,[]).
x_comment(x_Inexplicable,"The instance of StrExType representing the absense of an explanation.  If\n   (strExTypeFor <expression> Inexplicable) then no explanation exists for \n   <expression>.") :- x_cid(a65b128143ee3a).
xc_microtheory(a65b128143ee3a,x_StructuredExplanationMt).
xc_source_file(a65b128143ee3a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee3a,25).
xc_kb_names(a65b128143ee3a,[]).
xc_mapping_rows(a65b128143ee3a,[]).
x_isa(x_strExFor,x_TernaryPredicate) :- x_cid(a65b128143ee3b).
xc_microtheory(a65b128143ee3b,x_StructuredExplanationMt).
xc_source_file(a65b128143ee3b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee3b,30).
xc_kb_names(a65b128143ee3b,[]).
xc_mapping_rows(a65b128143ee3b,[]).
x_comment(x_strExFor,"(strExFor <expression> <type> <supporting-expressions>) is true when the \n   <type> of explanation for <statement> consists of the list of statements\n   given.") :- x_cid(a65b128143ee3c).
xc_microtheory(a65b128143ee3c,x_StructuredExplanationMt).
xc_source_file(a65b128143ee3c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee3c,31).
xc_kb_names(a65b128143ee3c,[]).
xc_mapping_rows(a65b128143ee3c,[]).
x_arg1Isa(x_strExFor,x_CycLExpression) :- x_cid(a65b128143ee3d).
xc_microtheory(a65b128143ee3d,x_StructuredExplanationMt).
xc_source_file(a65b128143ee3d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee3d,35).
xc_kb_names(a65b128143ee3d,[]).
xc_mapping_rows(a65b128143ee3d,[]).
x_arg2Isa(x_strExFor,x_StrExType) :- x_cid(a65b128143ee3e).
xc_microtheory(a65b128143ee3e,x_StructuredExplanationMt).
xc_source_file(a65b128143ee3e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee3e,36).
xc_kb_names(a65b128143ee3e,[]).
xc_mapping_rows(a65b128143ee3e,[]).
x_arg3Isa(x_strExFor,x_List) :- x_cid(a65b128143ee3f).
xc_microtheory(a65b128143ee3f,x_StructuredExplanationMt).
xc_source_file(a65b128143ee3f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee3f,37).
xc_kb_names(a65b128143ee3f,[]).
xc_mapping_rows(a65b128143ee3f,[]).
x_isa(x_strExTypeFor,x_BinaryPredicate) :- x_cid(a65b128143ee40).
xc_microtheory(a65b128143ee40,x_StructuredExplanationMt).
xc_source_file(a65b128143ee40,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee40,39).
xc_kb_names(a65b128143ee40,[]).
xc_mapping_rows(a65b128143ee40,[]).
x_comment(x_strExTypeFor,"(strExTypeFor <expression> <type>) is true when explanation type <type>\n   applies to the expression given.  Systems should specify which types apply.\n   By default, none are given.  When none is found, Inexplicable is returned.") :- x_cid(a65b128143ee41).
xc_microtheory(a65b128143ee41,x_StructuredExplanationMt).
xc_source_file(a65b128143ee41,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee41,40).
xc_kb_names(a65b128143ee41,[]).
xc_mapping_rows(a65b128143ee41,[]).
'x_<=='(x_strExTypeFor(V1,x_Inexplicable),x_groundExpression(V1),x_variableExpression(V2),x_honorTimestamps(x_uninferredSentence(V1,V2))) :- x_cid(a65b128143ee42,V1,V2).
xc_microtheory(a65b128143ee42,x_StructuredExplanationMt).
xc_source_file(a65b128143ee42,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee42,45).
xc_kb_names(a65b128143ee42,["?statement","?type"]).
xc_mapping_rows(a65b128143ee42,[]).
x_isa(x_strExTypeForPred,x_BinaryPredicate) :- x_cid(a65b128143ee43).
xc_microtheory(a65b128143ee43,x_StructuredExplanationMt).
xc_source_file(a65b128143ee43,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee43,50).
xc_kb_names(a65b128143ee43,[]).
xc_mapping_rows(a65b128143ee43,[]).
x_comment(x_strExTypeForPred,"(strExTypeFor <predicate> <type>) is true when explanation type <type>\n   applies to the predicate given.  Note: if there is some type of statement \n   with the given predicate that is not explainable, this should not be true.") :- x_cid(a65b128143ee44).
xc_microtheory(a65b128143ee44,x_StructuredExplanationMt).
xc_source_file(a65b128143ee44,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee44,51).
xc_kb_names(a65b128143ee44,[]).
xc_mapping_rows(a65b128143ee44,[]).
x_arg1Isa(x_strExTypeForPred,x_Predicate) :- x_cid(a65b128143ee45).
xc_microtheory(a65b128143ee45,x_StructuredExplanationMt).
xc_source_file(a65b128143ee45,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee45,55).
xc_kb_names(a65b128143ee45,[]).
xc_mapping_rows(a65b128143ee45,[]).
x_arg2Isa(x_strExTypeForPred,x_StrExType) :- x_cid(a65b128143ee46).
xc_microtheory(a65b128143ee46,x_StructuredExplanationMt).
xc_source_file(a65b128143ee46,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/structured-explanation.krf').
xc_source_line(a65b128143ee46,56).
xc_kb_names(a65b128143ee46,[]).
xc_mapping_rows(a65b128143ee46,[]).
kb_cache_footer(footer{count:18,digest:'0ade19b23f4bdee8ee7afe18c2f11561792e804ea76bab234e23996e3b521783',headerDigest:'2c7083bf0196ed05a459d25268a42eb6fd2a0cc7ec6a9a68a8cef220ea3d91c9'}).
