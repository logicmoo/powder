:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:6,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:103,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'14d0a4e192a00b472e463403b8bcb05d7f1a37d4ebbe90e04310b0cd526a3dc5',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/strategic-knowledge.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3817,source:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/strategic-knowledge.krf',sourceHash:'329170bd3c1c43a81300db447a740855fcde12aaf167720384a5807cd2d71ebe',warnings:[]}).
x_rangeLimit('x_FC-Unit-Settlers',8) :- x_cid(a65b134e0b97ac).
xc_microtheory(a65b134e0b97ac,x_StrategyModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e0b97ac,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/strategic-knowledge.krf').
xc_source_line(a65b134e0b97ac,10).
xc_kb_names(a65b134e0b97ac,[]).
xc_mapping_rows(a65b134e0b97ac,[]).
xc_exclude_globals(a65b134e0b97ac,true).
x_isa(x_doBuildCityFilter,x_BinaryPredicate) :- x_cid(a65b134e0b97ad).
xc_microtheory(a65b134e0b97ad,x_StrategyModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e0b97ad,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/strategic-knowledge.krf').
xc_source_line(a65b134e0b97ad,29).
xc_kb_names(a65b134e0b97ad,[]).
xc_mapping_rows(a65b134e0b97ad,[]).
xc_exclude_globals(a65b134e0b97ad,true).
'x_<=='(x_doBuildCityFilter(V1,V2),x_numAnswers(1,x_terrainAt(V1,V3)),x_potentialCityAt(V1),x_different(V3,'x_FC-Terrain-Ocean'),x_different(V3,'x_FC-Terrain-Lake'),x_different(V3,'x_FC-Terrain-DeepOcean'),x_executionContext(V4),x_uninferredSentence('x_ist-Information'(V4,x_intentForActor(V5,x_doBuildCity(V5,V1)))),x_unifies(V2,x_True)) :- x_cid(a65b134e0b97ae,V1,V2,V3,V4,V5).
xc_microtheory(a65b134e0b97ae,x_StrategyModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e0b97ae,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/strategic-knowledge.krf').
xc_source_line(a65b134e0b97ae,31).
xc_kb_names(a65b134e0b97ae,["?loc","?output","?terrain","?mt","?someone"]).
xc_mapping_rows(a65b134e0b97ae,[]).
xc_exclude_globals(a65b134e0b97ae,true).
x_legalityConditionFor(x_doBuildCity,x_doBuildCityFilter) :- x_cid(a65b134e0b97af).
xc_microtheory(a65b134e0b97af,x_StrategyModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e0b97af,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/strategic-knowledge.krf').
xc_source_line(a65b134e0b97af,43).
xc_kb_names(a65b134e0b97af,[]).
xc_mapping_rows(a65b134e0b97af,[]).
xc_exclude_globals(a65b134e0b97af,true).
x_preconditionForMethod(x_and(x_numAnswers(1,x_unitType(V1,'x_FC-Unit-Settlers')),x_numAnswers(1,x_currentPlayer(V2)),x_unitOwner(V1,V2),x_scanningConditionFor(x_doBuildCity,V3),x_fcObjectAt(V1,V4),x_closestLocationSatisfying(V4,0,8,V3,V5)),x_methodForAction(x_achieve(x_PreconditionOfFn(x_doBuildCity(V1,V5))),x_actionSequence(x_TheList(x_doRecordIntent(V1,x_doBuildCity(V1,V5)),x_simplestTravelPlan(V1,V5))))) :- x_cid(a65b134e0b97b0,V1,V2,V3,V4,V5).
xc_microtheory(a65b134e0b97b0,x_StrategyModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e0b97b0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/strategic-knowledge.krf').
xc_source_line(a65b134e0b97b0,46).
xc_kb_names(a65b134e0b97b0,["?arg1","?player","?condition","?start-binding","?loc"]).
xc_mapping_rows(a65b134e0b97b0,[]).
xc_exclude_globals(a65b134e0b97b0,true).
'x_<=='(x_doBuildCityScoring(V1,V2),x_doBuildCityFilter(V1,x_True),x_specialAt(V1,V3),x_isa(V3,'x_FreeCiv-GoodFood-Special'),x_terrainAt(V1,V4),x_terrainBaseFoodProduction(V4,V5),x_valueToMagnitude(V5,V2)) :- x_cid(a65b134e0b97b1,V1,V2,V3,V4,V5).
xc_microtheory(a65b134e0b97b1,x_StrategyModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e0b97b1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/strategic-knowledge.krf').
xc_source_line(a65b134e0b97b1,66).
xc_kb_names(a65b134e0b97b1,["?loc","?output","?special","?terrain","?food-prod"]).
xc_mapping_rows(a65b134e0b97b1,[]).
xc_exclude_globals(a65b134e0b97b1,true).
kb_cache_footer(footer{count:6,digest:'14d0a4e192a00b472e463403b8bcb05d7f1a37d4ebbe90e04310b0cd526a3dc5',headerDigest:'6433ccc12e1afe8c55b3bcd300d2cb28b2c53284106fe15a1ae41f8169c3d52f'}).
