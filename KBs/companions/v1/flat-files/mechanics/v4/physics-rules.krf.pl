:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:7,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:59,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'59e2a8310a98e34c205726994d90b0872acb1c7c03b66c25dfa64b5b931f672b',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/physics-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2582,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/physics-rules.krf',sourceHash:'2f6cbb5f5fcdb6a096e8020e4f567d8ef70c9741aee061391bf5ada5b94d4ccb',warnings:[]}).
'x_<=='(x_valueOf(x_MeasurementAtFn(t(x_QPQuantityFn(x_AccelerationDueToGravity),x_PlanetEarth),V1),V2),x_groundExpression(V1),x_localOnly(x_setOfPossibleAnswerValues(V3,V4)),x_containsPattern('x_G-AccelerationDueToEarthsGravity',V4),x_unifies(V2,'x_G-AccelerationDueToEarthsGravity')) :- x_cid(a65b125d9d77fb,V1,V2,V3,V4).
xc_microtheory(a65b125d9d77fb,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9d77fb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/physics-rules.krf').
xc_source_line(a65b125d9d77fb,22).
xc_kb_names(a65b125d9d77fb,["?event","?value","?problem","?answer-values"]).
xc_mapping_rows(a65b125d9d77fb,[]).
'x_<=='(x_assumeObjectInProjectileMotionAt(V1,V2),x_primaryObjectMoving(V2,V1),x_useTransitiveInference(x_localOnly(x_isa(V2,x_ProjectileMotion)))) :- x_cid(a65b125d9d77fc,V1,V2).
xc_microtheory(a65b125d9d77fc,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9d77fc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/physics-rules.krf').
xc_source_line(a65b125d9d77fc,32).
xc_kb_names(a65b125d9d77fc,["?obj","?time"]).
xc_mapping_rows(a65b125d9d77fc,[]).
x_isa(x_temporallyCooriginating,x_SymmetricBinaryPredicate) :- x_cid(a65b125d9d77fd).
xc_microtheory(a65b125d9d77fd,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9d77fd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/physics-rules.krf').
xc_source_line(a65b125d9d77fd,37).
xc_kb_names(a65b125d9d77fd,[]).
xc_mapping_rows(a65b125d9d77fd,[]).
'x_<=='(x_assumeObjectInProjectileMotionAt(V1,V2),x_primaryObjectMoving(V3,V1),x_temporallyCooriginating(V2,V3),x_useTransitiveInference(x_localOnly(x_isa(V3,x_ProjectileMotion)))) :- x_cid(a65b125d9d77fe,V1,V2,V3).
xc_microtheory(a65b125d9d77fe,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9d77fe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/physics-rules.krf').
xc_source_line(a65b125d9d77fe,39).
xc_kb_names(a65b125d9d77fe,["?obj","?time","?time-2"]).
xc_mapping_rows(a65b125d9d77fe,[]).
'x_<=='(x_temporallySubsumes(V1,x_TimeIntervalBetweenFn(V2,V3)),x_temporallySubsumes(V1,V2),x_temporallySubsumes(V1,V3)) :- x_cid(a65b125d9d77ff,V1,V2,V3).
xc_microtheory(a65b125d9d77ff,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9d77ff,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/physics-rules.krf').
xc_source_line(a65b125d9d77ff,47).
xc_kb_names(a65b125d9d77ff,["?temporal-event","?start-tp","?end-tp"]).
xc_mapping_rows(a65b125d9d77ff,[]).
'x_<=='(x_temporallySubsumes(V1,x_StartFn(V2)),x_equals(V1,V2)) :- x_cid(a65b125d9d7800,V1,V2).
xc_microtheory(a65b125d9d7800,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9d7800,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/physics-rules.krf').
xc_source_line(a65b125d9d7800,51).
xc_kb_names(a65b125d9d7800,["?temporal-event","?event"]).
xc_mapping_rows(a65b125d9d7800,[]).
'x_<=='(x_temporallySubsumes(V1,x_EndFn(V2)),x_equals(V1,V2)) :- x_cid(a65b125d9d7801,V1,V2).
xc_microtheory(a65b125d9d7801,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9d7801,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/physics-rules.krf').
xc_source_line(a65b125d9d7801,54).
xc_kb_names(a65b125d9d7801,["?temporal-event","?event"]).
xc_mapping_rows(a65b125d9d7801,[]).
kb_cache_footer(footer{count:7,digest:'59e2a8310a98e34c205726994d90b0872acb1c7c03b66c25dfa64b5b931f672b',headerDigest:'439fb741cc37a97a43913ac3a76762a05a256fcce0aa63607c636c3a0a764ea5'}).
