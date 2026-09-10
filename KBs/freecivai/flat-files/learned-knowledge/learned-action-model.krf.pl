:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:4,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:40,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8d684d6935bdfd1a96ace917766d4cdc8655433a4bec75cb26f65a4cc4a306af',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-action-model.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1781,source:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-action-model.krf',sourceHash:b2ea6ca4ef92a8e81b9c23b7f83fe7be5239ded2aeb89cea396fbe32eed5ffe1,warnings:[]}).
'x_<=='(x_complexTaskAchieves(V1,x_PreconditionOfFn(x_doBuildCity(V1,V2)),x_achieve(x_PreconditionOfFn(x_doBuildCity(V1,V2))))) :- x_cid(a65b134e02aeea,V1,V2).
xc_microtheory(a65b134e02aeea,x_ActionModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e02aeea,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-action-model.krf').
xc_source_line(a65b134e02aeea,7).
xc_kb_names(a65b134e02aeea,["?arg1","?arg2"]).
xc_mapping_rows(a65b134e02aeea,[]).
xc_exclude_globals(a65b134e02aeea,true).
'x_<=='(x_actionPositivelyAffectsQuantity(t(x_AggregateQuantityFn(x_cityPopulation),x_CollectionSubsetFn('x_FreeCiv-City',x_TheSetOf(V1,x_and(x_currentPlayer(V2),x_cityOwner(V1,V2))))),x_doBuildCity(V3,V4)),x_numAnswers(1,x_unitType(V3,'x_FC-Unit-Settlers')),x_numAnswers(1,x_currentPlayer(V5)),x_numAnswers(1,x_unitOwner(V3,V5)),x_numAnswers(1,x_fcObjectAt(V3,V4)),x_numAnswers(1,x_knowsValue(V5,V4,x_terrainAt)),x_numAnswers(1,x_terrainAt(V4,V6)),x_different(V6,'x_FC-Terrain-Ocean'),x_different(V6,'x_FC-Terrain-Lake'),x_different(V6,'x_FC-Terrain-DeepOcean'),x_potentialCityAt(V4)) :- x_cid(a65b134e02aeeb,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b134e02aeeb,x_ActionModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e02aeeb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-action-model.krf').
xc_source_line(a65b134e02aeeb,12).
xc_kb_names(a65b134e02aeeb,["?city","?player","?settler2164","?loc2162","?player2163","?terrain2161"]).
xc_mapping_rows(a65b134e02aeeb,[]).
xc_exclude_globals(a65b134e02aeeb,true).
'x_actionEntailsDecision-TypeType'(x_doChangeProduction,x_DecisionFn(x_currentlyBuilding)) :- x_cid(a65b134e02aeec).
xc_microtheory(a65b134e02aeec,x_ActionModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e02aeec,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-action-model.krf').
xc_source_line(a65b134e02aeec,30).
xc_kb_names(a65b134e02aeec,[]).
xc_mapping_rows(a65b134e02aeec,[]).
xc_exclude_globals(a65b134e02aeec,true).
'x_actionEntailsDecision-TypeType'(x_doResearch,x_DecisionFn(x_currentlyResearching)) :- x_cid(a65b134e02aeed).
xc_microtheory(a65b134e02aeed,x_ActionModelMtFn('x_Freeciv-TheGame')).
xc_source_file(a65b134e02aeed,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/learned-knowledge/learned-action-model.krf').
xc_source_line(a65b134e02aeed,32).
xc_kb_names(a65b134e02aeed,[]).
xc_mapping_rows(a65b134e02aeed,[]).
xc_exclude_globals(a65b134e02aeed,true).
kb_cache_footer(footer{count:4,digest:'8d684d6935bdfd1a96ace917766d4cdc8655433a4bec75cb26f65a4cc4a306af',headerDigest:fd57a444c6fa60a0f78b432a42217f179bb8016adcf2a78588f4356cc8abe96a}).
