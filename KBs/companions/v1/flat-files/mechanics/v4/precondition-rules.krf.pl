:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:9,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:62,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'607bf2f3dffce13f4245678a1cb5fc528e646b9552aa739f71ab12f88f2a9013',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2530,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf',sourceHash:c11d72141b4c16b06825ac525c8ea1dc43416737a2a8234be18c04135be8f0a0,warnings:[]}).
'x_<=='(x_allEquationPreconditionsSatisfied(V1),x_allPreconditionsSatisfied(V1)) :- x_cid(a65b125d9e9c61,V1).
xc_microtheory(a65b125d9e9c61,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9e9c61,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf').
xc_source_line(a65b125d9e9c61,21).
xc_kb_names(a65b125d9e9c61,["?preconditions"]).
xc_mapping_rows(a65b125d9e9c61,[]).
x_isa(x_allPreconditionsSatisfied,x_Predicate) :- x_cid(a65b125d9e9c62).
xc_microtheory(a65b125d9e9c62,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9e9c62,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf').
xc_source_line(a65b125d9e9c62,24).
xc_kb_names(a65b125d9e9c62,[]).
xc_mapping_rows(a65b125d9e9c62,[]).
x_arity(x_allPreconditionsSatisfied,1) :- x_cid(a65b125d9e9c63).
xc_microtheory(a65b125d9e9c63,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9e9c63,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf').
xc_source_line(a65b125d9e9c63,25).
xc_kb_names(a65b125d9e9c63,[]).
xc_mapping_rows(a65b125d9e9c63,[]).
'x_<=='(x_allPreconditionsSatisfied(V1),x_everySatisfies(V2,V1,x_preconditionSatisfied(V2))) :- x_cid(a65b125d9e9c64,V1,V2).
xc_microtheory(a65b125d9e9c64,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9e9c64,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf').
xc_source_line(a65b125d9e9c64,27).
xc_kb_names(a65b125d9e9c64,["?conditions","?precondition"]).
xc_mapping_rows(a65b125d9e9c64,[]).
'x_<=='(x_preconditionSatisfied(V1),x_uninferredSentence(x_interestingPrecondition(V1))) :- x_cid(a65b125d9e9c65,V1).
xc_microtheory(a65b125d9e9c65,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9e9c65,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf').
xc_source_line(a65b125d9e9c65,31).
xc_kb_names(a65b125d9e9c65,["?fact"]).
xc_mapping_rows(a65b125d9e9c65,[]).
'x_<=='(x_preconditionSatisfied(V1),x_interestingPrecondition(V1),x_interestingPreconditionSatisfied(V1)) :- x_cid(a65b125d9e9c66,V1).
xc_microtheory(a65b125d9e9c66,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9e9c66,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf').
xc_source_line(a65b125d9e9c66,34).
xc_kb_names(a65b125d9e9c66,["?fact"]).
xc_mapping_rows(a65b125d9e9c66,[]).
'x_<=='(x_interestingPrecondition(V1),x_groundExpression(V1),x_subexpressionMatching(x_AnalogySkolemFn(V2),V1,V3),x_useTransitiveInference(x_isa(V2,x_PlanetaryBody))) :- x_cid(a65b125d9e9c67,V1,V2,V3).
xc_microtheory(a65b125d9e9c67,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9e9c67,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf').
xc_source_line(a65b125d9e9c67,42).
xc_kb_names(a65b125d9e9c67,["?fact","?base-item","?sub-exp"]).
xc_mapping_rows(a65b125d9e9c67,[]).
'x_<=='(x_interestingPrecondition(V1),x_unifies(V1,x_not(x_consistent(x_valueOf(V2,V3))))) :- x_cid(a65b125d9e9c68,V1,V2,V3).
xc_microtheory(a65b125d9e9c68,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9e9c68,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf').
xc_source_line(a65b125d9e9c68,47).
xc_kb_names(a65b125d9e9c68,["?fact","?quantity","?value"]).
xc_mapping_rows(a65b125d9e9c68,[]).
'x_<=='(x_interestingPreconditionSatisfied(V1),x_subexpressionMatching(x_AnalogySkolemFn(V2),V1,V3),x_useTransitiveInference(x_isa(V2,x_PlanetaryBody)),x_localOnly(x_useTransitiveInference(x_uninferredSentence(x_and(x_isa(V4,x_PlanetaryBody),x_different(V4,V2)))))) :- x_cid(a65b125d9e9c69,V1,V2,V3,V4).
xc_microtheory(a65b125d9e9c69,x_PhysicsProblemSolvingMt).
xc_source_file(a65b125d9e9c69,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/precondition-rules.krf').
xc_source_line(a65b125d9e9c69,54).
xc_kb_names(a65b125d9e9c69,["?fact","?base-planet","?sub-exp","?planetary-body"]).
xc_mapping_rows(a65b125d9e9c69,[]).
kb_cache_footer(footer{count:9,digest:'607bf2f3dffce13f4245678a1cb5fc528e646b9552aa739f71ab12f88f2a9013',headerDigest:'7eaedf93b2a797aed53f322485af5786782adf6b4d45462d876b88082f67a610'}).
