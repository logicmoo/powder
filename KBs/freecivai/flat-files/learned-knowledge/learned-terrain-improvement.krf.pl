:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:9,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:70,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:abad623991d2848f08bad574cef7df73134cbed9ffac96d28c1c49c845b2e3b9,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3248,source:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf',sourceHash:'33788a15a2d8f997560e921c324d2763101eafe53938a6fde2973eaa4c4a54b9',warnings:[]}).
x_preconditionForMethod(x_and(x_numAnswers(1,x_currentPlayer(V1)),x_numAnswers(1,x_unitOwner(V2,V1)),x_uninferredSentence(x_specialAt(V3,'x_FC-Special-Road')),x_numAnswers(1,x_terrainAt(V3,V4)),x_possibleToRoad(V4),x_uninferredSentence(x_cityAt(V5,V3)),x_uninferredSentence(x_roadBlockedByRiver(V1,V3)),x_isa(V2,'x_FreeCiv-LandUnit'),x_behaviorCapable(V2,'x_FC-ActivityRoad',x_performedBy)),x_methodForAction(x_achieveBy(V2,x_specialAt(V3,'x_FC-Special-Road')),x_actionSequence(x_TheList(x_simplestTravelPlan(V2,V3),x_doAgentPlan(x_actionSequence(x_TheList(x_doBuildRoad(V2,V3)))))))) :- x_cid(a65b134e06e96e,V1,V2,V3,V4,V5).
xc_microtheory(a65b134e06e96e,x_LearnedKnowledgeMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e06e96e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf').
xc_source_line(a65b134e06e96e,8).
xc_kb_names(a65b134e06e96e,["?player","?arg1","?loc","?terrain","?city"]).
xc_mapping_rows(a65b134e06e96e,[]).
xc_exclude_globals(a65b134e06e96e,true).
'x_<=='(x_complexTaskAchieves(V1,x_AchieveFn(x_specialAt(V2,'x_FC-Special-Road')),x_achieveBy(V1,x_specialAt(V2,'x_FC-Special-Road'))),x_isa(V1,'x_FreeCiv-LandUnit'),x_behaviorCapable(V1,'x_FC-ActivityRoad',x_performedBy)) :- x_cid(a65b134e06e96f,V1,V2).
xc_microtheory(a65b134e06e96f,x_LearnedKnowledgeMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e06e96f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf').
xc_source_line(a65b134e06e96f,22).
xc_kb_names(a65b134e06e96f,["?arg1","?loc"]).
xc_mapping_rows(a65b134e06e96f,[]).
xc_exclude_globals(a65b134e06e96f,true).
x_achievableByRole(x_CapabilityRole7,x_AchieveFn(x_specialAt(V1,'x_FC-Special-Road'))) :- x_cid(a65b134e06e970,V1).
xc_microtheory(a65b134e06e970,x_LearnedKnowledgeMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e06e970,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf').
xc_source_line(a65b134e06e970,26).
xc_kb_names(a65b134e06e970,["?loc"]).
xc_mapping_rows(a65b134e06e970,[]).
xc_exclude_globals(a65b134e06e970,true).
x_preconditionForMethod(x_and(x_numAnswers(1,x_currentPlayer(V1)),x_numAnswers(1,x_unitOwner(V2,V1)),x_uninferredSentence(x_specialAt(V3,'x_FC-Special-Mine')),x_numAnswers(1,x_terrainAt(V3,V4)),x_possibleToMine(V4),x_uninferredSentence(x_cityAt(V5,V3)),x_isa(V2,'x_FreeCiv-LandUnit'),x_behaviorCapable(V2,'x_FC-ActivityMine',x_performedBy)),x_methodForAction(x_achieveBy(V2,x_specialAt(V3,'x_FC-Special-Mine')),x_actionSequence(x_TheList(x_simplestTravelPlan(V2,V3),x_doAgentPlan(x_actionSequence(x_TheList(x_doMine(V2,V3)))))))) :- x_cid(a65b134e06e971,V1,V2,V3,V4,V5).
xc_microtheory(a65b134e06e971,x_LearnedKnowledgeMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e06e971,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf').
xc_source_line(a65b134e06e971,30).
xc_kb_names(a65b134e06e971,["?player","?arg1","?loc","?terrain","?city"]).
xc_mapping_rows(a65b134e06e971,[]).
xc_exclude_globals(a65b134e06e971,true).
'x_<=='(x_complexTaskAchieves(V1,x_AchieveFn(x_specialAt(V2,'x_FC-Special-Mine')),x_achieveBy(V1,x_specialAt(V2,'x_FC-Special-Mine'))),x_isa(V1,'x_FreeCiv-LandUnit'),x_behaviorCapable(V1,'x_FC-ActivityMine',x_performedBy)) :- x_cid(a65b134e06e972,V1,V2).
xc_microtheory(a65b134e06e972,x_LearnedKnowledgeMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e06e972,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf').
xc_source_line(a65b134e06e972,43).
xc_kb_names(a65b134e06e972,["?arg1","?loc"]).
xc_mapping_rows(a65b134e06e972,[]).
xc_exclude_globals(a65b134e06e972,true).
x_achievableByRole(x_CapabilityRole7,x_AchieveFn(x_specialAt(V1,'x_FC-Special-Mine'))) :- x_cid(a65b134e06e973,V1).
xc_microtheory(a65b134e06e973,x_LearnedKnowledgeMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e06e973,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf').
xc_source_line(a65b134e06e973,47).
xc_kb_names(a65b134e06e973,["?loc"]).
xc_mapping_rows(a65b134e06e973,[]).
xc_exclude_globals(a65b134e06e973,true).
x_preconditionForMethod(x_and(x_numAnswers(1,x_currentPlayer(V1)),x_numAnswers(1,x_unitOwner(V2,V1)),x_uninferredSentence(x_specialAt(V3,'x_FC-Special-Irrigation')),x_numAnswers(1,x_terrainAt(V3,V4)),x_possibleToIrrigate(V4),x_uninferredSentence(x_cityAt(V5,V3)),x_nextToWater(V3),x_isa(V2,'x_FreeCiv-LandUnit'),x_behaviorCapable(V2,'x_FC-ActivityIrrigate',x_performedBy)),x_methodForAction(x_achieveBy(V2,x_specialAt(V3,'x_FC-Special-Irrigation')),x_actionSequence(x_TheList(x_simplestTravelPlan(V2,V3),x_doAgentPlan(x_actionSequence(x_TheList(x_doIrrigate(V2,V3)))))))) :- x_cid(a65b134e06e974,V1,V2,V3,V4,V5).
xc_microtheory(a65b134e06e974,x_LearnedKnowledgeMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e06e974,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf').
xc_source_line(a65b134e06e974,51).
xc_kb_names(a65b134e06e974,["?player","?arg1","?loc","?terrain","?city"]).
xc_mapping_rows(a65b134e06e974,[]).
xc_exclude_globals(a65b134e06e974,true).
'x_<=='(x_complexTaskAchieves(V1,x_AchieveFn(x_specialAt(V2,'x_FC-Special-Irrigation')),x_achieveBy(V1,x_specialAt(V2,'x_FC-Special-Irrigation'))),x_isa(V1,'x_FreeCiv-LandUnit'),x_behaviorCapable(V1,'x_FC-ActivityIrrigate',x_performedBy)) :- x_cid(a65b134e06e975,V1,V2).
xc_microtheory(a65b134e06e975,x_LearnedKnowledgeMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e06e975,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf').
xc_source_line(a65b134e06e975,66).
xc_kb_names(a65b134e06e975,["?arg1","?loc"]).
xc_mapping_rows(a65b134e06e975,[]).
xc_exclude_globals(a65b134e06e975,true).
x_achievableByRole(x_CapabilityRole7,x_AchieveFn(x_specialAt(V1,'x_FC-Special-Irrigation'))) :- x_cid(a65b134e06e976,V1).
xc_microtheory(a65b134e06e976,x_LearnedKnowledgeMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e06e976,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-terrain-improvement.krf').
xc_source_line(a65b134e06e976,70).
xc_kb_names(a65b134e06e976,["?loc"]).
xc_mapping_rows(a65b134e06e976,[]).
xc_exclude_globals(a65b134e06e976,true).
kb_cache_footer(footer{count:9,digest:abad623991d2848f08bad574cef7df73134cbed9ffac96d28c1c49c845b2e3b9,headerDigest:'47b893450f0434e4f0d55a6c58dc44e7f2ca89a788bbf6675ea31031785d6584'}).
