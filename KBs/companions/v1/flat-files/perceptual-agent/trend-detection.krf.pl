:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:56,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:191,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'81f5d5ab16d6d2b4bfc684de2e06e155126d94b1ee2c2b685f3a20fe42b2f0f6',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:7962,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf',sourceHash:c6c674fc6237dd0fb4202692b7ab9a58eec8fd4eae0f5187cdf3f3a0c65cf8f5,warnings:[]}).
x_isa(x_linearTrend,x_Predicate) :- x_cid(a65b125e2ec876).
xc_microtheory(a65b125e2ec876,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec876,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec876,19).
xc_kb_names(a65b125e2ec876,[]).
xc_mapping_rows(a65b125e2ec876,[]).
x_arity(x_linearTrend,4) :- x_cid(a65b125e2ec877).
xc_microtheory(a65b125e2ec877,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec877,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec877,20).
xc_kb_names(a65b125e2ec877,[]).
xc_mapping_rows(a65b125e2ec877,[]).
x_arg1Isa(x_linearTrend,x_Microtheory) :- x_cid(a65b125e2ec878).
xc_microtheory(a65b125e2ec878,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec878,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec878,21).
xc_kb_names(a65b125e2ec878,[]).
xc_mapping_rows(a65b125e2ec878,[]).
x_arg2Isa(x_linearTrend,x_Quantity) :- x_cid(a65b125e2ec879).
xc_microtheory(a65b125e2ec879,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec879,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec879,22).
xc_kb_names(a65b125e2ec879,[]).
xc_mapping_rows(a65b125e2ec879,[]).
x_arg3Isa(x_linearTrend,x_Microtheory) :- x_cid(a65b125e2ec87a).
xc_microtheory(a65b125e2ec87a,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec87a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec87a,23).
xc_kb_names(a65b125e2ec87a,[]).
xc_mapping_rows(a65b125e2ec87a,[]).
x_arg4Isa(x_linearTrend,x_ScalarInterval) :- x_cid(a65b125e2ec87b).
xc_microtheory(a65b125e2ec87b,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec87b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec87b,24).
xc_kb_names(a65b125e2ec87b,[]).
xc_mapping_rows(a65b125e2ec87b,[]).
x_comment(x_linearTrend,"(linearTrend ?di-case ?quantity ?start-turn ?delta) identify a linear or constant trend in quantity value since ?start-turn.") :- x_cid(a65b125e2ec87c).
xc_microtheory(a65b125e2ec87c,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec87c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec87c,25).
xc_kb_names(a65b125e2ec87c,[]).
xc_mapping_rows(a65b125e2ec87c,[]).
'x_<=='(x_linearTrend(V1,V2,V3,V4),'x_ist-Information'(V1,x_localOnly(x_lookupOnly(x_numAnswers(1,x_quantityChange(V2,V4))))),x_trendSince(V1,V2,V5,V4),x_different(V5,V1),x_unifies(x_DICaseFn(V6,V3),V5)) :- x_cid(a65b125e2ec87d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e2ec87d,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec87d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec87d,27).
xc_kb_names(a65b125e2ec87d,["?di-case","?quantity","?starting-turn","?delta","?start-di-case","?mt"]).
xc_mapping_rows(a65b125e2ec87d,[]).
'x_<=='(x_linearTrend(V1,V2,V3,0),x_uninferredSentence('x_ist-Information'(V1,x_localOnly(x_lookupOnly(x_numAnswers(1,x_quantityChange(V2,V4)))))),x_trendSince(V1,V2,V5,0),x_different(V5,V1),x_unifies(x_DICaseFn(V6,V3),V5)) :- x_cid(a65b125e2ec87e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e2ec87e,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec87e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec87e,37).
xc_kb_names(a65b125e2ec87e,["?di-case","?quantity","?starting-turn","?delta","?start-di-case","?mt"]).
xc_mapping_rows(a65b125e2ec87e,[]).
x_isa(x_trendSince,x_QuaternaryPredicate) :- x_cid(a65b125e2ec87f).
xc_microtheory(a65b125e2ec87f,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec87f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec87f,48).
xc_kb_names(a65b125e2ec87f,[]).
xc_mapping_rows(a65b125e2ec87f,[]).
x_arity(x_trendSince,4) :- x_cid(a65b125e2ec880).
xc_microtheory(a65b125e2ec880,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec880,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec880,49).
xc_kb_names(a65b125e2ec880,[]).
xc_mapping_rows(a65b125e2ec880,[]).
x_arg1Isa(x_trendSince,x_Microtheory) :- x_cid(a65b125e2ec881).
xc_microtheory(a65b125e2ec881,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec881,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec881,50).
xc_kb_names(a65b125e2ec881,[]).
xc_mapping_rows(a65b125e2ec881,[]).
x_arg2Isa(x_trendSince,x_Quantity) :- x_cid(a65b125e2ec882).
xc_microtheory(a65b125e2ec882,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec882,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec882,51).
xc_kb_names(a65b125e2ec882,[]).
xc_mapping_rows(a65b125e2ec882,[]).
x_arg3Isa(x_trendSince,x_Microtheory) :- x_cid(a65b125e2ec883).
xc_microtheory(a65b125e2ec883,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec883,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec883,52).
xc_kb_names(a65b125e2ec883,[]).
xc_mapping_rows(a65b125e2ec883,[]).
x_arg4Isa(x_trendSince,x_ScalarInterval) :- x_cid(a65b125e2ec884).
xc_microtheory(a65b125e2ec884,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec884,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec884,53).
xc_kb_names(a65b125e2ec884,[]).
xc_mapping_rows(a65b125e2ec884,[]).
x_comment(x_trendSince,"(trendSince ?di-case ?quantity ?start-di-case ?delta) binds the starting di case given a concrete delta representing a change magnitude (which may be zero).") :- x_cid(a65b125e2ec885).
xc_microtheory(a65b125e2ec885,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec885,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec885,54).
xc_kb_names(a65b125e2ec885,[]).
xc_mapping_rows(a65b125e2ec885,[]).
'x_<=='(x_trendSince(V1,V2,V3,V4),x_priorDICase(V1,V5),'x_ist-Information'(V5,x_localOnly(x_lookupOnly(x_numAnswers(1,x_quantityChange(V2,V4))))),x_trendSince(V5,V2,V3,V4)) :- x_cid(a65b125e2ec886,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e2ec886,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec886,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec886,63).
xc_kb_names(a65b125e2ec886,["?di-case","?quantity","?start-di-case","?delta","?earlier-di-case"]).
xc_mapping_rows(a65b125e2ec886,[]).
'x_<=='(x_trendSince(V1,V2,V1,V3),x_uninferredSentence(x_priorDICase(V1,V4))) :- x_cid(a65b125e2ec887,V1,V2,V3,V4).
xc_microtheory(a65b125e2ec887,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec887,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec887,72).
xc_kb_names(a65b125e2ec887,["?di-case","?quantity","?delta","?earlier-di-case"]).
xc_mapping_rows(a65b125e2ec887,[]).
'x_<=='(x_trendSince(V1,V2,V3,0),x_priorDICase(V1,V4),x_uninferredSentence('x_ist-Information'(V4,x_localOnly(x_lookupOnly(x_numAnswers(1,x_quantityChange(V2,V5)))))),x_trendSince(V4,V2,V3,V5)) :- x_cid(a65b125e2ec888,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e2ec888,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec888,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec888,77).
xc_kb_names(a65b125e2ec888,["?di-case","?quantity","?start-di-case","?earlier-di-case","?delta"]).
xc_mapping_rows(a65b125e2ec888,[]).
'x_<=='(x_trendSince(V1,V2,V1,V3),x_different(V3,0),x_priorDICase(V1,V4),x_uninferredSentence('x_ist-Information'(V4,x_localOnly(x_lookupOnly(x_numAnswers(1,x_quantityChange(V2,V3))))))) :- x_cid(a65b125e2ec889,V1,V2,V3,V4).
xc_microtheory(a65b125e2ec889,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec889,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec889,87).
xc_kb_names(a65b125e2ec889,["?di-case","?quantity","?delta","?earlier-di-case"]).
xc_mapping_rows(a65b125e2ec889,[]).
x_isa(x_monotonicTrendFromTo,x_QuintaryPredicate) :- x_cid(a65b125e2ec88a).
xc_microtheory(a65b125e2ec88a,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec88a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec88a,99).
xc_kb_names(a65b125e2ec88a,[]).
xc_mapping_rows(a65b125e2ec88a,[]).
x_arity(x_monotonicTrendFromTo,5) :- x_cid(a65b125e2ec88b).
xc_microtheory(a65b125e2ec88b,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec88b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec88b,100).
xc_kb_names(a65b125e2ec88b,[]).
xc_mapping_rows(a65b125e2ec88b,[]).
x_arg1Isa(x_monotonicTrendFromTo,x_Microtheory) :- x_cid(a65b125e2ec88c).
xc_microtheory(a65b125e2ec88c,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec88c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec88c,101).
xc_kb_names(a65b125e2ec88c,[]).
xc_mapping_rows(a65b125e2ec88c,[]).
x_arg2Isa(x_monotonicTrendFromTo,x_Quantity) :- x_cid(a65b125e2ec88d).
xc_microtheory(a65b125e2ec88d,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec88d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec88d,102).
xc_kb_names(a65b125e2ec88d,[]).
xc_mapping_rows(a65b125e2ec88d,[]).
x_arg3Isa(x_monotonicTrendFromTo,x_TemporalThing) :- x_cid(a65b125e2ec88e).
xc_microtheory(a65b125e2ec88e,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec88e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec88e,103).
xc_kb_names(a65b125e2ec88e,[]).
xc_mapping_rows(a65b125e2ec88e,[]).
x_arg4Isa(x_monotonicTrendFromTo,x_TemporalThing) :- x_cid(a65b125e2ec88f).
xc_microtheory(a65b125e2ec88f,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec88f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec88f,104).
xc_kb_names(a65b125e2ec88f,[]).
xc_mapping_rows(a65b125e2ec88f,[]).
x_arg5Isa(x_monotonicTrendFromTo,x_UnaryPredicate) :- x_cid(a65b125e2ec890).
xc_microtheory(a65b125e2ec890,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec890,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec890,105).
xc_kb_names(a65b125e2ec890,[]).
xc_mapping_rows(a65b125e2ec890,[]).
x_comment(x_monotonicTrendFromTo,"(monotonicTrendFromTo ?mt ?quantity ?from ?to ?direction) succeeds if changes in ?quantity had the same sign throughout the interval.") :- x_cid(a65b125e2ec891).
xc_microtheory(a65b125e2ec891,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec891,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec891,106).
xc_kb_names(a65b125e2ec891,[]).
xc_mapping_rows(a65b125e2ec891,[]).
'x_<=='(x_monotonicTrendFromTo(V1,V2,V3,V4,V5),x_different(V3,V4),x_unifies(V6,x_DICaseFn(V1,V4)),'x_ist-Information'(V6,x_localOnly(x_lookupOnly(x_numAnswers(1,x_quantityChange(V2,V7))))),x_qualitativeDSValue(V7,V5),x_numAnswers(1,'x_ist-Information'(V1,x_followingTurn(V8,V4))),x_monotonicTrendFromTo(V1,V2,V3,V8,V5)) :- x_cid(a65b125e2ec892,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e2ec892,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec892,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec892,109).
xc_kb_names(a65b125e2ec892,["?mt","?quantity","?from","?to","?direction","?di-case","?delta","?prior"]).
xc_mapping_rows(a65b125e2ec892,[]).
'x_<=='(x_monotonicTrendFromTo(V1,V2,V3,V3,V4)) :- x_cid(a65b125e2ec893,V1,V2,V3,V4).
xc_microtheory(a65b125e2ec893,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec893,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec893,124).
xc_kb_names(a65b125e2ec893,["?mt","?quantity","?turn","?direction"]).
xc_mapping_rows(a65b125e2ec893,[]).
x_isa(x_bookendingDiscontinuities,x_QuintaryPredicate) :- x_cid(a65b125e2ec894).
xc_microtheory(a65b125e2ec894,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec894,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec894,127).
xc_kb_names(a65b125e2ec894,[]).
xc_mapping_rows(a65b125e2ec894,[]).
x_arity(x_bookendingDiscontinuities,5) :- x_cid(a65b125e2ec895).
xc_microtheory(a65b125e2ec895,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec895,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec895,128).
xc_kb_names(a65b125e2ec895,[]).
xc_mapping_rows(a65b125e2ec895,[]).
x_arg1Isa(x_bookendingDiscontinuities,x_Microtheory) :- x_cid(a65b125e2ec896).
xc_microtheory(a65b125e2ec896,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec896,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec896,129).
xc_kb_names(a65b125e2ec896,[]).
xc_mapping_rows(a65b125e2ec896,[]).
x_arg2Isa(x_bookendingDiscontinuities,x_Quantity) :- x_cid(a65b125e2ec897).
xc_microtheory(a65b125e2ec897,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec897,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec897,130).
xc_kb_names(a65b125e2ec897,[]).
xc_mapping_rows(a65b125e2ec897,[]).
x_arg3Isa(x_bookendingDiscontinuities,x_TemporalThing) :- x_cid(a65b125e2ec898).
xc_microtheory(a65b125e2ec898,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec898,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec898,131).
xc_kb_names(a65b125e2ec898,[]).
xc_mapping_rows(a65b125e2ec898,[]).
x_arg4Isa(x_bookendingDiscontinuities,x_TemporalThing) :- x_cid(a65b125e2ec899).
xc_microtheory(a65b125e2ec899,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec899,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec899,132).
xc_kb_names(a65b125e2ec899,[]).
xc_mapping_rows(a65b125e2ec899,[]).
x_arg5Isa(x_bookendingDiscontinuities,x_UnaryPredicate) :- x_cid(a65b125e2ec89a).
xc_microtheory(a65b125e2ec89a,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec89a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec89a,133).
xc_kb_names(a65b125e2ec89a,[]).
xc_mapping_rows(a65b125e2ec89a,[]).
x_comment(x_bookendingDiscontinuities,"(bookendingDiscontinuities ?mt ?quantity ?from ?to ?direction) means discontinuities at turn ?from and ?to surround a monotonicallly increasing or decreasing trend in ?quantity.") :- x_cid(a65b125e2ec89b).
xc_microtheory(a65b125e2ec89b,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec89b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec89b,134).
xc_kb_names(a65b125e2ec89b,[]).
xc_mapping_rows(a65b125e2ec89b,[]).
'x_<=='(x_bookendingDiscontinuities(V1,V2,V3,V4,V5),x_different(V3,V4),x_numAnswers(1,'x_ist-Information'(V1,x_followingTurn(V6,V4))),x_different(V6,V3),x_monotonicTrendFromTo(V1,V2,V3,V6,V5),x_groundExpression(V5),x_uninferredSentence(x_continuityWRT(V1,V2,V4,V5)),x_priorDiscontinuityWRT(V1,V2,V3,V5)) :- x_cid(a65b125e2ec89c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e2ec89c,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec89c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec89c,136).
xc_kb_names(a65b125e2ec89c,["?mt","?quantity","?from","?to","?direction","?prior"]).
xc_mapping_rows(a65b125e2ec89c,[]).
x_isa(x_continuityWRT,x_QuaternaryPredicate) :- x_cid(a65b125e2ec89d).
xc_microtheory(a65b125e2ec89d,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec89d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec89d,148).
xc_kb_names(a65b125e2ec89d,[]).
xc_mapping_rows(a65b125e2ec89d,[]).
x_arity(x_continuityWRT,4) :- x_cid(a65b125e2ec89e).
xc_microtheory(a65b125e2ec89e,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec89e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec89e,149).
xc_kb_names(a65b125e2ec89e,[]).
xc_mapping_rows(a65b125e2ec89e,[]).
x_arg1Isa(x_continuityWRT,x_Microtheory) :- x_cid(a65b125e2ec89f).
xc_microtheory(a65b125e2ec89f,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec89f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec89f,150).
xc_kb_names(a65b125e2ec89f,[]).
xc_mapping_rows(a65b125e2ec89f,[]).
x_arg2Isa(x_continuityWRT,x_Quantity) :- x_cid(a65b125e2ec8a0).
xc_microtheory(a65b125e2ec8a0,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a0,151).
xc_kb_names(a65b125e2ec8a0,[]).
xc_mapping_rows(a65b125e2ec8a0,[]).
x_arg3Isa(x_continuityWRT,x_TemporalThing) :- x_cid(a65b125e2ec8a1).
xc_microtheory(a65b125e2ec8a1,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a1,152).
xc_kb_names(a65b125e2ec8a1,[]).
xc_mapping_rows(a65b125e2ec8a1,[]).
x_arg4Isa(x_continuityWRT,x_UnaryPredicate) :- x_cid(a65b125e2ec8a2).
xc_microtheory(a65b125e2ec8a2,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a2,153).
xc_kb_names(a65b125e2ec8a2,[]).
xc_mapping_rows(a65b125e2ec8a2,[]).
x_comment(x_continuityWRT,"(continuityWRT ?mt ?quantity ?when ?direction) succeeds if there was a quantity change in direction ?direction in the turn ?when.") :- x_cid(a65b125e2ec8a3).
xc_microtheory(a65b125e2ec8a3,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a3,154).
xc_kb_names(a65b125e2ec8a3,[]).
xc_mapping_rows(a65b125e2ec8a3,[]).
'x_<=='(x_continuityWRT(V1,V2,V3,V4),x_groundExpression(V4),x_groundExpression(V3),x_unifies(V5,x_DICaseFn(V1,V3)),'x_ist-Information'(V5,x_localOnly(x_lookupOnly(x_numAnswers(1,x_quantityChange(V2,V6))))),x_qualitativeDSValue(V6,V4)) :- x_cid(a65b125e2ec8a4,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125e2ec8a4,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a4,156).
xc_kb_names(a65b125e2ec8a4,["?mt","?quantity","?when","?direction","?di-case","?delta"]).
xc_mapping_rows(a65b125e2ec8a4,[]).
x_isa(x_priorDiscontinuityWRT,x_QuaternaryPredicate) :- x_cid(a65b125e2ec8a5).
xc_microtheory(a65b125e2ec8a5,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a5,168).
xc_kb_names(a65b125e2ec8a5,[]).
xc_mapping_rows(a65b125e2ec8a5,[]).
x_arity(x_priorDiscontinuityWRT,4) :- x_cid(a65b125e2ec8a6).
xc_microtheory(a65b125e2ec8a6,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a6,169).
xc_kb_names(a65b125e2ec8a6,[]).
xc_mapping_rows(a65b125e2ec8a6,[]).
x_arg1Isa(x_priorDiscontinuityWRT,x_Microtheory) :- x_cid(a65b125e2ec8a7).
xc_microtheory(a65b125e2ec8a7,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a7,170).
xc_kb_names(a65b125e2ec8a7,[]).
xc_mapping_rows(a65b125e2ec8a7,[]).
x_arg2Isa(x_priorDiscontinuityWRT,x_Quantity) :- x_cid(a65b125e2ec8a8).
xc_microtheory(a65b125e2ec8a8,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a8,171).
xc_kb_names(a65b125e2ec8a8,[]).
xc_mapping_rows(a65b125e2ec8a8,[]).
x_arg3Isa(x_priorDiscontinuityWRT,x_TemporalThing) :- x_cid(a65b125e2ec8a9).
xc_microtheory(a65b125e2ec8a9,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8a9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8a9,172).
xc_kb_names(a65b125e2ec8a9,[]).
xc_mapping_rows(a65b125e2ec8a9,[]).
x_arg4Isa(x_priorDiscontinuityWRT,x_UnaryPredicate) :- x_cid(a65b125e2ec8aa).
xc_microtheory(a65b125e2ec8aa,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8aa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8aa,173).
xc_kb_names(a65b125e2ec8aa,[]).
xc_mapping_rows(a65b125e2ec8aa,[]).
x_comment(x_priorDiscontinuityWRT,"(priorDiscontinuityWRT ?mt ?quantity ?when ?direction) succeeds if there was no quantity change in direction ?direction in the turn prior to ?when (or no prior turn).") :- x_cid(a65b125e2ec8ab).
xc_microtheory(a65b125e2ec8ab,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8ab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8ab,174).
xc_kb_names(a65b125e2ec8ab,[]).
xc_mapping_rows(a65b125e2ec8ab,[]).
'x_<=='(x_priorDiscontinuityWRT(V1,V2,V3,V4),x_numAnswers(1,'x_ist-Information'(V1,x_followingTurn(V5,V3))),x_uninferredSentence(x_continuityWRT(V1,V2,V5,V4))) :- x_cid(a65b125e2ec8ac,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e2ec8ac,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8ac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8ac,176).
xc_kb_names(a65b125e2ec8ac,["?mt","?quantity","?when","?direction","?prior"]).
xc_mapping_rows(a65b125e2ec8ac,[]).
'x_<=='(x_priorDiscontinuityWRT(V1,V2,V3,V4),x_uninferredSentence('x_ist-Information'(V1,x_followingTurn(V5,V3)))) :- x_cid(a65b125e2ec8ad,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e2ec8ad,x_PerceptualAgentMt).
xc_source_file(a65b125e2ec8ad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/trend-detection.krf').
xc_source_line(a65b125e2ec8ad,184).
xc_kb_names(a65b125e2ec8ad,["?mt","?quantity","?when","?direction","?prior"]).
xc_mapping_rows(a65b125e2ec8ad,[]).
kb_cache_footer(footer{count:56,digest:'81f5d5ab16d6d2b4bfc684de2e06e155126d94b1ee2c2b685f3a20fe42b2f0f6',headerDigest:edfedf7af9974c9bc64696260d9f338e13010d445c62e12e0bfab70bb102ad74}).
