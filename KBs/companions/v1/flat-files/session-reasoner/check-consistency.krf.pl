:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:9,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:63,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'6c2c020cd5969e09ee458657b9b3dd95c13a6f343b54ce5de64b09c925e8d90c',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2948,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf',sourceHash:'3d3984f4e0e337da64a599b71fda1608b56c6bd695b63666ce5f696b7badd028',warnings:[]}).
x_isa(x_checkConsistencyOfChoice,x_ComplexActionPredicate) :- x_cid(a65b125e42cdcc).
xc_microtheory(a65b125e42cdcc,'x_Session-ReasonerMt').
xc_source_file(a65b125e42cdcc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf').
xc_source_line(a65b125e42cdcc,19).
xc_kb_names(a65b125e42cdcc,[]).
xc_mapping_rows(a65b125e42cdcc,[]).
x_arity(x_checkConsistencyOfChoice,5) :- x_cid(a65b125e42cdcd).
xc_microtheory(a65b125e42cdcd,'x_Session-ReasonerMt').
xc_source_file(a65b125e42cdcd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf').
xc_source_line(a65b125e42cdcd,20).
xc_kb_names(a65b125e42cdcd,[]).
xc_mapping_rows(a65b125e42cdcd,[]).
x_arg1Isa(x_checkConsistencyOfChoice,x_Thing) :- x_cid(a65b125e42cdce).
xc_microtheory(a65b125e42cdce,'x_Session-ReasonerMt').
xc_source_file(a65b125e42cdce,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf').
xc_source_line(a65b125e42cdce,21).
xc_kb_names(a65b125e42cdce,[]).
xc_mapping_rows(a65b125e42cdce,[]).
x_arg2Isa(x_checkConsistencyOfChoice,x_Microtheory) :- x_cid(a65b125e42cdcf).
xc_microtheory(a65b125e42cdcf,'x_Session-ReasonerMt').
xc_source_file(a65b125e42cdcf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf').
xc_source_line(a65b125e42cdcf,22).
xc_kb_names(a65b125e42cdcf,[]).
xc_mapping_rows(a65b125e42cdcf,[]).
x_arg3Isa(x_checkConsistencyOfChoice,x_Microtheory) :- x_cid(a65b125e42cdd0).
xc_microtheory(a65b125e42cdd0,'x_Session-ReasonerMt').
xc_source_file(a65b125e42cdd0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf').
xc_source_line(a65b125e42cdd0,23).
xc_kb_names(a65b125e42cdd0,[]).
xc_mapping_rows(a65b125e42cdd0,[]).
x_arg4Isa(x_checkConsistencyOfChoice,x_AccessingAnIBT) :- x_cid(a65b125e42cdd1).
xc_microtheory(a65b125e42cdd1,'x_Session-ReasonerMt').
xc_source_file(a65b125e42cdd1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf').
xc_source_line(a65b125e42cdd1,24).
xc_kb_names(a65b125e42cdd1,[]).
xc_mapping_rows(a65b125e42cdd1,[]).
x_arg5Isa(x_checkConsistencyOfChoice,x_Thing) :- x_cid(a65b125e42cdd2).
xc_microtheory(a65b125e42cdd2,'x_Session-ReasonerMt').
xc_source_file(a65b125e42cdd2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf').
xc_source_line(a65b125e42cdd2,25).
xc_kb_names(a65b125e42cdd2,[]).
xc_mapping_rows(a65b125e42cdd2,[]).
x_comment(x_checkConsistencyOfChoice,"(checkConsistencyOfChoice ?choice ?mt-to-compare-against ?mt-of-contradictions-to-check-for  ?reading-name ?experiment-name)\n looks in ?mt-of-contradictions-to-check-for to get a list of contradiction types to check for. It then checks ?choice to see if there's any contradictions\nthere, using ?mt-to-compare-against as the universe of thingsit might be contradictory with.") :- x_cid(a65b125e42cdd3).
xc_microtheory(a65b125e42cdd3,'x_Session-ReasonerMt').
xc_source_file(a65b125e42cdd3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf').
xc_source_line(a65b125e42cdd3,26).
xc_kb_names(a65b125e42cdd3,[]).
xc_mapping_rows(a65b125e42cdd3,[]).
x_preconditionForMethod(x_evaluate(V1,x_TheClosedRetrievalSetOf(V2,'x_ist-Information'(V3,V2))),x_methodForAction(x_checkConsistencyOfChoice(V4,V5,V3,V6,V7),x_actionSequence(x_TheList(x_doForEach(V8,V1,x_checkChoiceForContradiction(V4,V8,V5,V6,V7)))))) :- x_cid(a65b125e42cdd4,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e42cdd4,'x_Session-ReasonerMt').
xc_source_file(a65b125e42cdd4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/check-consistency.krf').
xc_source_line(a65b125e42cdd4,31).
xc_kb_names(a65b125e42cdd4,["?contradictions-to-check-for","?contradiction","?mt-of-contradictions-to-check-for","?choice","?mt-to-compare-against","?reading-name","?experiment-name","?next-contradiction"]).
xc_mapping_rows(a65b125e42cdd4,[]).
kb_cache_footer(footer{count:9,digest:'6c2c020cd5969e09ee458657b9b3dd95c13a6f343b54ce5de64b09c925e8d90c',headerDigest:e589eb754acce3aa8e82e46856b07c60685d2a03bb757d1fdb0f094ac31b4128}).
