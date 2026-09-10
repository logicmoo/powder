:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:190,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:1115,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:de581854723dd5a2e7fd9f6ec804cc2f23f1fad6ef86c29f54bc74b8f91bdbad,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:41626,source:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf',sourceHash:d0616eaf42eddc8c5209dc6aa6017380bfd5caa3520fe59c5e319aeaf953e230,warnings:[]}).
'x_<=='(x_executionContext(V1),x_fcExecutionContext(V1)) :- x_cid(a65b1281fa1768,V1).
xc_microtheory(a65b1281fa1768,x_FreecivMt).
xc_source_file(a65b1281fa1768,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1768,12).
xc_kb_names(a65b1281fa1768,["?mt"]).
xc_mapping_rows(a65b1281fa1768,[]).
'x_<=='(x_soleRemainingPlayer(V1),x_fcExecutionContext(V2),x_numAnswers(1,x_localOnly('x_ist-Information'(V2,x_opponentsInConflict(V1,V3,V2)))),x_evaluate(x_TheSet(V1),x_TheClosedRetrievalSetOf(V4,x_player(V4)))) :- x_cid(a65b1281fa1769,V1,V2,V3,V4).
xc_microtheory(a65b1281fa1769,x_FreecivMt).
xc_source_file(a65b1281fa1769,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1769,26).
xc_kb_names(a65b1281fa1769,["?current-player","?game","?adversary","?player"]).
xc_mapping_rows(a65b1281fa1769,[]).
'x_<=='(x_assignableActorOfType(V1,V2),x_numAnswers(1,x_currentPlayer(V3)),x_outsourcedOnly(x_unitOwner(V1,V3)),x_outsourcedOnly(x_unitType(V1,V2))) :- x_cid(a65b1281fa176a,V1,V2,V3).
xc_microtheory(a65b1281fa176a,x_FreecivMt).
xc_source_file(a65b1281fa176a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa176a,47).
xc_kb_names(a65b1281fa176a,["?entity","?type","?player"]).
xc_mapping_rows(a65b1281fa176a,[]).
'x_<=='(x_adversarialActorOfType(V1,V2),x_numAnswers(1,x_currentPlayer(V3)),x_outsourcedOnly(x_unitOwner(V1,V4)),x_different(V4,V3),x_outsourcedOnly(x_unitType(V1,V2))) :- x_cid(a65b1281fa176b,V1,V2,V3,V4).
xc_microtheory(a65b1281fa176b,x_FreecivMt).
xc_source_file(a65b1281fa176b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa176b,59).
xc_kb_names(a65b1281fa176b,["?entity","?type","?player","?other-player"]).
xc_mapping_rows(a65b1281fa176b,[]).
'x_<=='(x_busyActor(V1),x_outsourcedOnly(x_currentActivity(V1,V2)),x_isa(V2,x_AccomplishmentType),x_executionContext(V3),x_uninferredSentence('x_ist-Information'(V3,x_holdsIn(V4,x_defaultActivity(V1,V2))))) :- x_cid(a65b1281fa176c,V1,V2,V3,V4).
xc_microtheory(a65b1281fa176c,x_FreecivMt).
xc_source_file(a65b1281fa176c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa176c,76).
xc_kb_names(a65b1281fa176c,["?entity","?activity","?mt","?when"]).
xc_mapping_rows(a65b1281fa176c,[]).
'x_<=='(x_busyActor(V1),x_outsourcedOnly(x_hasOrders(V1))) :- x_cid(a65b1281fa176d,V1).
xc_microtheory(a65b1281fa176d,x_FreecivMt).
xc_source_file(a65b1281fa176d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa176d,85).
xc_kb_names(a65b1281fa176d,["?entity"]).
xc_mapping_rows(a65b1281fa176d,[]).
'x_<=='(x_busyActor(V1),x_outsourcedOnly(x_doneMoving(V1)),x_outsourcedOnly(x_currentActivity(V1,V2)),x_uninferredSentence('x_ist-Information'(V3,x_holdsIn(V4,x_defaultActivity(V1,V2))))) :- x_cid(a65b1281fa176e,V1,V2,V3,V4).
xc_microtheory(a65b1281fa176e,x_FreecivMt).
xc_source_file(a65b1281fa176e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa176e,90).
xc_kb_names(a65b1281fa176e,["?entity","?activity","?mt","?when"]).
xc_mapping_rows(a65b1281fa176e,[]).
'x_<=='(x_planningDate(V1,V2),x_currentYear(V2)) :- x_cid(a65b1281fa176f,V1,V2).
xc_microtheory(a65b1281fa176f,x_FreecivMt).
xc_source_file(a65b1281fa176f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa176f,104).
xc_kb_names(a65b1281fa176f,["?mt","?date"]).
xc_mapping_rows(a65b1281fa176f,[]).
'x_<=='(x_agentsExistentialStatus(V1,x_AgentNowTerminated),x_uninferredSentence(x_outsourcedOnly(x_unitType(V1,V2)))) :- x_cid(a65b1281fa1770,V1,V2).
xc_microtheory(a65b1281fa1770,x_FreecivMt).
xc_source_file(a65b1281fa1770,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1770,108).
xc_kb_names(a65b1281fa1770,["?unit","?anything"]).
xc_mapping_rows(a65b1281fa1770,[]).
'x_<=='(x_mapActivityToOperator(V1,V2,V3),x_indexedEffect(x_currentActivity(V4,V2),t(V5,V4)),x_unifies(V3,t(V5,V1))) :- x_cid(a65b1281fa1771,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281fa1771,x_FreecivMt).
xc_source_file(a65b1281fa1771,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1771,114).
xc_kb_names(a65b1281fa1771,["?actor","?activity","?operator","?var","?pred"]).
xc_mapping_rows(a65b1281fa1771,[]).
'x_<=='(x_mapActivityToOperator(V1,V2,V3),x_indexedEffect(x_currentActivity(V4,V2),V5),x_not(x_matches(t(V6,V7),V5)),x_operatorFormulas(V8,V5),x_evaluate(V3,x_MakeFormulaFn(V8,x_JoinListsFn(x_TheList(V1),x_RestOfListFn(x_FormulaArgListFn(V5)))))) :- x_cid(a65b1281fa1772,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1281fa1772,x_FreecivMt).
xc_source_file(a65b1281fa1772,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1772,118).
xc_kb_names(a65b1281fa1772,["?actor","?activity","?operator","?var","?gen-operator","?p","?v","?pred"]).
xc_mapping_rows(a65b1281fa1772,[]).
'x_<=='(x_subActorOf(V1,V1)) :- x_cid(a65b1281fa1773,V1).
xc_microtheory(a65b1281fa1773,x_FreecivMt).
xc_source_file(a65b1281fa1773,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1773,130).
xc_kb_names(a65b1281fa1773,["?player"]).
xc_mapping_rows(a65b1281fa1773,[]).
'x_<=='(x_subActorOf(V1,V2),x_cityOwner(V1,V2)) :- x_cid(a65b1281fa1774,V1,V2).
xc_microtheory(a65b1281fa1774,x_FreecivMt).
xc_source_file(a65b1281fa1774,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1774,131).
xc_kb_names(a65b1281fa1774,["?city","?player"]).
xc_mapping_rows(a65b1281fa1774,[]).
'x_<=='(x_subActorOf(V1,V2),x_unitOwner(V1,V2)) :- x_cid(a65b1281fa1775,V1,V2).
xc_microtheory(a65b1281fa1775,x_FreecivMt).
xc_source_file(a65b1281fa1775,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1775,133).
xc_kb_names(a65b1281fa1775,["?unit","?player"]).
xc_mapping_rows(a65b1281fa1775,[]).
'x_<=='(x_owns(V1,V2),x_cityOwner(V2,V1)) :- x_cid(a65b1281fa1776,V1,V2).
xc_microtheory(a65b1281fa1776,x_FreecivMt).
xc_source_file(a65b1281fa1776,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1776,136).
xc_kb_names(a65b1281fa1776,["?player","?obj"]).
xc_mapping_rows(a65b1281fa1776,[]).
'x_<=='(x_owns(V1,V2),x_unitOwner(V2,V1)) :- x_cid(a65b1281fa1777,V1,V2).
xc_microtheory(a65b1281fa1777,x_FreecivMt).
xc_source_file(a65b1281fa1777,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1777,139).
xc_kb_names(a65b1281fa1777,["?player","?obj"]).
xc_mapping_rows(a65b1281fa1777,[]).
'x_<=='(x_ownsCity(V1,V2),x_cityOwner(V2,V1)) :- x_cid(a65b1281fa1778,V1,V2).
xc_microtheory(a65b1281fa1778,x_FreecivMt).
xc_source_file(a65b1281fa1778,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1778,142).
xc_kb_names(a65b1281fa1778,["?player","?city"]).
xc_mapping_rows(a65b1281fa1778,[]).
'x_<=='(x_ownsUnit(V1,V2),x_unitOwner(V2,V1)) :- x_cid(a65b1281fa1779,V1,V2).
xc_microtheory(a65b1281fa1779,x_FreecivMt).
xc_source_file(a65b1281fa1779,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1779,145).
xc_kb_names(a65b1281fa1779,["?player","?unit"]).
xc_mapping_rows(a65b1281fa1779,[]).
'x_<=='(x_isa(V1,V2),x_outsourcedOnly(x_unitType(V1,V3)),x_genls(V3,V2)) :- x_cid(a65b1281fa177a,V1,V2,V3).
xc_microtheory(a65b1281fa177a,x_FreecivMt).
xc_source_file(a65b1281fa177a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa177a,148).
xc_kb_names(a65b1281fa177a,["?thing","?type","?subtype"]).
xc_mapping_rows(a65b1281fa177a,[]).
'x_<=='(x_isa(V1,'x_FreeCiv-City'),x_outsourcedOnly(x_cityOwner(V1,V2))) :- x_cid(a65b1281fa177b,V1,V2).
xc_microtheory(a65b1281fa177b,x_FreecivMt).
xc_source_file(a65b1281fa177b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa177b,153).
xc_kb_names(a65b1281fa177b,["?thing","?someone"]).
xc_mapping_rows(a65b1281fa177b,[]).
'x_<=='(x_isa(V1,'x_FreeCiv-Player'),x_outsourcedOnly(x_player(V1))) :- x_cid(a65b1281fa177c,V1).
xc_microtheory(a65b1281fa177c,x_FreecivMt).
xc_source_file(a65b1281fa177c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa177c,157).
xc_kb_names(a65b1281fa177c,["?thing"]).
xc_mapping_rows(a65b1281fa177c,[]).
'x_<=='(x_homeCityOf(V1,V2),x_unitHomeCity(V2,V1)) :- x_cid(a65b1281fa177d,V1,V2).
xc_microtheory(a65b1281fa177d,x_FreecivMt).
xc_source_file(a65b1281fa177d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa177d,161).
xc_kb_names(a65b1281fa177d,["?city","?unit"]).
xc_mapping_rows(a65b1281fa177d,[]).
'x_<=='(x_playerKnowsTech(V1,'x_FC-Tech-None'),x_currentPlayer(V1)) :- x_cid(a65b1281fa177e,V1).
xc_microtheory(a65b1281fa177e,x_FreecivMt).
xc_source_file(a65b1281fa177e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa177e,164).
xc_kb_names(a65b1281fa177e,["?player"]).
xc_mapping_rows(a65b1281fa177e,[]).
'x_<=='(x_userRole(V1),x_currentPlayer(V1)) :- x_cid(a65b1281fa177f,V1).
xc_microtheory(a65b1281fa177f,x_FreecivMt).
xc_source_file(a65b1281fa177f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa177f,169).
xc_kb_names(a65b1281fa177f,["?player"]).
xc_mapping_rows(a65b1281fa177f,[]).
'x_<=='(x_behaviorCapable(V1,x_doMove),x_unitType(V1,V2)) :- x_cid(a65b1281fa1780,V1,V2).
xc_microtheory(a65b1281fa1780,x_FreecivMt).
xc_source_file(a65b1281fa1780,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1780,173).
xc_kb_names(a65b1281fa1780,["?unit","?type"]).
xc_mapping_rows(a65b1281fa1780,[]).
'x_<=='(x_activeProcessTypeAssertion(x_currentActivity(V1,V2),V2)) :- x_cid(a65b1281fa1781,V1,V2).
xc_microtheory(a65b1281fa1781,x_FreecivMt).
xc_source_file(a65b1281fa1781,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1781,176).
xc_kb_names(a65b1281fa1781,["?unit","?process-type"]).
xc_mapping_rows(a65b1281fa1781,[]).
x_isa(x_objectProductionRequiresImprovement,x_BinaryPredicate) :- x_cid(a65b1281fa1782).
xc_microtheory(a65b1281fa1782,x_FreecivMt).
xc_source_file(a65b1281fa1782,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1782,179).
xc_kb_names(a65b1281fa1782,[]).
xc_mapping_rows(a65b1281fa1782,[]).
x_arity(x_objectProductionRequiresImprovement,2) :- x_cid(a65b1281fa1783).
xc_microtheory(a65b1281fa1783,x_FreecivMt).
xc_source_file(a65b1281fa1783,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1783,180).
xc_kb_names(a65b1281fa1783,[]).
xc_mapping_rows(a65b1281fa1783,[]).
x_arg1Isa(x_objectProductionRequiresImprovement,'x_FreeCiv-BuildableThing-Type') :- x_cid(a65b1281fa1784).
xc_microtheory(a65b1281fa1784,x_FreecivMt).
xc_source_file(a65b1281fa1784,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1784,181).
xc_kb_names(a65b1281fa1784,[]).
xc_mapping_rows(a65b1281fa1784,[]).
x_arg2Isa(x_objectProductionRequiresImprovement,'x_FreeCiv-BuildableThing-Type') :- x_cid(a65b1281fa1785).
xc_microtheory(a65b1281fa1785,x_FreecivMt).
xc_source_file(a65b1281fa1785,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1785,182).
xc_kb_names(a65b1281fa1785,[]).
xc_mapping_rows(a65b1281fa1785,[]).
x_comment(x_objectProductionRequiresImprovement,"(objectProductionRequiresImprovment ?obj ?improvement) means a city must have the improvement ?improvement in order to produce ?object.  This inference may bind to FC-Improvement-None.") :- x_cid(a65b1281fa1786).
xc_microtheory(a65b1281fa1786,x_FreecivMt).
xc_source_file(a65b1281fa1786,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1786,183).
xc_kb_names(a65b1281fa1786,[]).
xc_mapping_rows(a65b1281fa1786,[]).
'x_<=='(x_objectProductionRequiresImprovement(V1,V2),x_numAnswers(1,x_lookupOnly(x_objectProductionRequiresBuilding(V1,V2)))) :- x_cid(a65b1281fa1787,V1,V2).
xc_microtheory(a65b1281fa1787,x_FreecivMt).
xc_source_file(a65b1281fa1787,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1787,185).
xc_kb_names(a65b1281fa1787,["?obj","?building"]).
xc_mapping_rows(a65b1281fa1787,[]).
'x_<=='(x_objectProductionRequiresImprovement(V1,'x_FC-Improvement-None'),x_uninferredSentence(x_lookupOnly(x_objectProductionRequiresBuilding(V1,V2)))) :- x_cid(a65b1281fa1788,V1,V2).
xc_microtheory(a65b1281fa1788,x_FreecivMt).
xc_source_file(a65b1281fa1788,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1788,190).
xc_kb_names(a65b1281fa1788,["?obj","?building"]).
xc_mapping_rows(a65b1281fa1788,[]).
'x_<=='(x_reifyQuantity(V1,V2),x_performanceGoalForGame(V1,V3),x_goalQuantity(V3,V2)) :- x_cid(a65b1281fa1789,V1,V2,V3).
xc_microtheory(a65b1281fa1789,x_FreecivMt).
xc_source_file(a65b1281fa1789,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1789,200).
xc_kb_names(a65b1281fa1789,["?mt","?quantity","?goal"]).
xc_mapping_rows(a65b1281fa1789,[]).
'x_<=='(x_reifyQuantity(V1,V2),x_lookupOnly('x_ist-Information'(V1,x_reifyQuantities(V1,V3))),x_elementOf(V2,V3)) :- x_cid(a65b1281fa178a,V1,V2,V3).
xc_microtheory(a65b1281fa178a,x_FreecivMt).
xc_source_file(a65b1281fa178a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa178a,204).
xc_kb_names(a65b1281fa178a,["?mt","?quantity","?quantity-set"]).
xc_mapping_rows(a65b1281fa178a,[]).
x_isa(x_freecivCityNameFor,x_BinaryPredicate) :- x_cid(a65b1281fa178b).
xc_microtheory(a65b1281fa178b,x_FreecivMt).
xc_source_file(a65b1281fa178b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa178b,211).
xc_kb_names(a65b1281fa178b,[]).
xc_mapping_rows(a65b1281fa178b,[]).
x_arity(x_freecivCityNameFor,2) :- x_cid(a65b1281fa178c).
xc_microtheory(a65b1281fa178c,x_FreecivMt).
xc_source_file(a65b1281fa178c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa178c,212).
xc_kb_names(a65b1281fa178c,[]).
xc_mapping_rows(a65b1281fa178c,[]).
x_arg1Isa(x_freecivCityNameFor,x_CycLTerm) :- x_cid(a65b1281fa178d).
xc_microtheory(a65b1281fa178d,x_FreecivMt).
xc_source_file(a65b1281fa178d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa178d,213).
xc_kb_names(a65b1281fa178d,[]).
xc_mapping_rows(a65b1281fa178d,[]).
x_arg2Isa(x_freecivCityNameFor,'x_FreeCiv-City') :- x_cid(a65b1281fa178e).
xc_microtheory(a65b1281fa178e,x_FreecivMt).
xc_source_file(a65b1281fa178e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa178e,214).
xc_kb_names(a65b1281fa178e,[]).
xc_mapping_rows(a65b1281fa178e,[]).
x_commment(x_freecivCityNameFor,"(freecivCityNameFor ?raw-name ?fc-name) binds ?fc-name to the internal game-name of the city ?raw-name.  So, for example (freecivCityNameFor Babylon FC-City-Babylon)") :- x_cid(a65b1281fa178f).
xc_microtheory(a65b1281fa178f,x_FreecivMt).
xc_source_file(a65b1281fa178f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa178f,215).
xc_kb_names(a65b1281fa178f,[]).
xc_mapping_rows(a65b1281fa178f,[]).
x_isa(x_currentCivTaxPercent,x_UnaryPredicate) :- x_cid(a65b1281fa1790).
xc_microtheory(a65b1281fa1790,x_FreecivMt).
xc_source_file(a65b1281fa1790,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1790,217).
xc_kb_names(a65b1281fa1790,[]).
xc_mapping_rows(a65b1281fa1790,[]).
x_arity(x_currentCivTaxPercent,1) :- x_cid(a65b1281fa1791).
xc_microtheory(a65b1281fa1791,x_FreecivMt).
xc_source_file(a65b1281fa1791,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1791,218).
xc_kb_names(a65b1281fa1791,[]).
xc_mapping_rows(a65b1281fa1791,[]).
x_comment(x_currentCivTaxPercent,"(currentCivTaxPercent ?percent) exists to be embedded in a semtrans.  It curries the currentPlayer.") :- x_cid(a65b1281fa1792).
xc_microtheory(a65b1281fa1792,x_FreecivMt).
xc_source_file(a65b1281fa1792,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1792,219).
xc_kb_names(a65b1281fa1792,[]).
xc_mapping_rows(a65b1281fa1792,[]).
'x_<=='(x_currentCivTaxPercent(V1),x_currentPlayer(V2),x_currentTaxPercent(V2,V1)) :- x_cid(a65b1281fa1793,V1,V2).
xc_microtheory(a65b1281fa1793,x_FreecivMt).
xc_source_file(a65b1281fa1793,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1793,221).
xc_kb_names(a65b1281fa1793,["?pct","?player"]).
xc_mapping_rows(a65b1281fa1793,[]).
x_isa(x_currentCivSciencePercent,x_UnaryPredicate) :- x_cid(a65b1281fa1794).
xc_microtheory(a65b1281fa1794,x_FreecivMt).
xc_source_file(a65b1281fa1794,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1794,225).
xc_kb_names(a65b1281fa1794,[]).
xc_mapping_rows(a65b1281fa1794,[]).
x_arity(x_currentCivSciencePercent,1) :- x_cid(a65b1281fa1795).
xc_microtheory(a65b1281fa1795,x_FreecivMt).
xc_source_file(a65b1281fa1795,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1795,226).
xc_kb_names(a65b1281fa1795,[]).
xc_mapping_rows(a65b1281fa1795,[]).
x_comment(x_currentCivSciencePercent,"(currentCivSciencePercent ?percent) exists to be embedded in a semtrans.  It curries the currentPlayer.") :- x_cid(a65b1281fa1796).
xc_microtheory(a65b1281fa1796,x_FreecivMt).
xc_source_file(a65b1281fa1796,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1796,227).
xc_kb_names(a65b1281fa1796,[]).
xc_mapping_rows(a65b1281fa1796,[]).
'x_<=='(x_currentCivSciencePercent(V1),x_currentPlayer(V2),x_currentSciencePercent(V2,V1)) :- x_cid(a65b1281fa1797,V1,V2).
xc_microtheory(a65b1281fa1797,x_FreecivMt).
xc_source_file(a65b1281fa1797,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1797,229).
xc_kb_names(a65b1281fa1797,["?pct","?player"]).
xc_mapping_rows(a65b1281fa1797,[]).
x_isa(x_currentCivLuxuryPercent,x_UnaryPredicate) :- x_cid(a65b1281fa1798).
xc_microtheory(a65b1281fa1798,x_FreecivMt).
xc_source_file(a65b1281fa1798,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1798,233).
xc_kb_names(a65b1281fa1798,[]).
xc_mapping_rows(a65b1281fa1798,[]).
x_arity(x_currentCivLuxuryPercent,1) :- x_cid(a65b1281fa1799).
xc_microtheory(a65b1281fa1799,x_FreecivMt).
xc_source_file(a65b1281fa1799,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1799,234).
xc_kb_names(a65b1281fa1799,[]).
xc_mapping_rows(a65b1281fa1799,[]).
x_comment(x_currentCivLuxuryPercent,"(currentCivLuxuryPercent ?percent) exists to be embedded in a semtrans.  It curries the currentPlayer.") :- x_cid(a65b1281fa179a).
xc_microtheory(a65b1281fa179a,x_FreecivMt).
xc_source_file(a65b1281fa179a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa179a,235).
xc_kb_names(a65b1281fa179a,[]).
xc_mapping_rows(a65b1281fa179a,[]).
'x_<=='(x_currentCivLuxuryPercent(V1),x_currentPlayer(V2),x_currentLuxuryPercent(V2,V1)) :- x_cid(a65b1281fa179b,V1,V2).
xc_microtheory(a65b1281fa179b,x_FreecivMt).
xc_source_file(a65b1281fa179b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa179b,237).
xc_kb_names(a65b1281fa179b,["?pct","?player"]).
xc_mapping_rows(a65b1281fa179b,[]).
x_isa(x_currentCivGold,x_UnaryPredicate) :- x_cid(a65b1281fa179c).
xc_microtheory(a65b1281fa179c,x_FreecivMt).
xc_source_file(a65b1281fa179c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa179c,241).
xc_kb_names(a65b1281fa179c,[]).
xc_mapping_rows(a65b1281fa179c,[]).
x_arity(x_currentCivGold,1) :- x_cid(a65b1281fa179d).
xc_microtheory(a65b1281fa179d,x_FreecivMt).
xc_source_file(a65b1281fa179d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa179d,242).
xc_kb_names(a65b1281fa179d,[]).
xc_mapping_rows(a65b1281fa179d,[]).
x_comment(x_currentCivGold,"(currentCivGold ?gold) exists to be embedded in a semtrans.  It curries the currentPlayer.") :- x_cid(a65b1281fa179e).
xc_microtheory(a65b1281fa179e,x_FreecivMt).
xc_source_file(a65b1281fa179e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa179e,243).
xc_kb_names(a65b1281fa179e,[]).
xc_mapping_rows(a65b1281fa179e,[]).
'x_<=='(x_currentCivGold(V1),x_currentPlayer(V2),x_currentGold(V2,V1)) :- x_cid(a65b1281fa179f,V1,V2).
xc_microtheory(a65b1281fa179f,x_FreecivMt).
xc_source_file(a65b1281fa179f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa179f,245).
xc_kb_names(a65b1281fa179f,["?gold","?player"]).
xc_mapping_rows(a65b1281fa179f,[]).
'x_<=='(x_tradeRouteIncome(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(t(V4,V5),x_outsourcedOnly(x_tradeRoute(V1,V4,V5)))),x_totalTradeRevenue(V3,V2)) :- x_cid(a65b1281fa17a0,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281fa17a0,x_FreecivMt).
xc_source_file(a65b1281fa17a0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a0,249).
xc_kb_names(a65b1281fa17a0,["?city","?amt","?revenue-pairs","?partner","?revenue"]).
xc_mapping_rows(a65b1281fa17a0,[]).
x_isa(x_totalTradeRevenue,x_BinaryPredicate) :- x_cid(a65b1281fa17a1).
xc_microtheory(a65b1281fa17a1,x_FreecivMt).
xc_source_file(a65b1281fa17a1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a1,256).
xc_kb_names(a65b1281fa17a1,[]).
xc_mapping_rows(a65b1281fa17a1,[]).
x_isa(x_totalTradeRevenue,x_FunctionalPredicate) :- x_cid(a65b1281fa17a2).
xc_microtheory(a65b1281fa17a2,x_FreecivMt).
xc_source_file(a65b1281fa17a2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a2,257).
xc_kb_names(a65b1281fa17a2,[]).
xc_mapping_rows(a65b1281fa17a2,[]).
x_arity(x_totalTradeRevenue,2) :- x_cid(a65b1281fa17a3).
xc_microtheory(a65b1281fa17a3,x_FreecivMt).
xc_source_file(a65b1281fa17a3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a3,258).
xc_kb_names(a65b1281fa17a3,[]).
xc_mapping_rows(a65b1281fa17a3,[]).
x_arg1Isa(x_totalTradeRevenue,'x_Set-Mathematical') :- x_cid(a65b1281fa17a4).
xc_microtheory(a65b1281fa17a4,x_FreecivMt).
xc_source_file(a65b1281fa17a4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a4,259).
xc_kb_names(a65b1281fa17a4,[]).
xc_mapping_rows(a65b1281fa17a4,[]).
x_arg2Isa(x_totalTradeRevenue,x_MeasurableQuantity) :- x_cid(a65b1281fa17a5).
xc_microtheory(a65b1281fa17a5,x_FreecivMt).
xc_source_file(a65b1281fa17a5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a5,260).
xc_kb_names(a65b1281fa17a5,[]).
xc_mapping_rows(a65b1281fa17a5,[]).
'x_<=='(x_totalTradeRevenue(x_TheSet,x_TradePoints(0))) :- x_cid(a65b1281fa17a6).
xc_microtheory(a65b1281fa17a6,x_FreecivMt).
xc_source_file(a65b1281fa17a6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a6,262).
xc_kb_names(a65b1281fa17a6,[]).
xc_mapping_rows(a65b1281fa17a6,[]).
'x_<=='(x_totalTradeRevenue(V1,V2),x_different(V1,x_TheSet),x_evaluate(V2,x_PlusAll(V1,x_cadr))) :- x_cid(a65b1281fa17a7,V1,V2).
xc_microtheory(a65b1281fa17a7,x_FreecivMt).
xc_source_file(a65b1281fa17a7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a7,264).
xc_kb_names(a65b1281fa17a7,["?pairs","?revenue"]).
xc_mapping_rows(a65b1281fa17a7,[]).
'x_<=='(x_playsRole(V1,'x_SelfToken-Indexical',V2),x_fcExecutionContext(V1),x_currentPlayer(V2)) :- x_cid(a65b1281fa17a8,V1,V2).
xc_microtheory(a65b1281fa17a8,x_FreecivMt).
xc_source_file(a65b1281fa17a8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a8,268).
xc_kb_names(a65b1281fa17a8,["?ctxt","?role"]).
xc_mapping_rows(a65b1281fa17a8,[]).
'x_<=='(x_possessiveRelation(V1,V2),x_groundExpression(V1),x_groundExpression(V2)) :- x_cid(a65b1281fa17a9,V1,V2).
xc_microtheory(a65b1281fa17a9,x_FreecivMt).
xc_source_file(a65b1281fa17a9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17a9,276).
xc_kb_names(a65b1281fa17a9,["?player","?quantity"]).
xc_mapping_rows(a65b1281fa17a9,[]).
'x_<=='(x_freecivCityNameFor(V1,V2),x_evaluate(V2,x_SymbolConcatenateFn(x_TheList("FC-City-",V1))),x_nonTransitiveInference(x_isa(V2,'x_FreeCiv-City'))) :- x_cid(a65b1281fa17aa,V1,V2).
xc_microtheory(a65b1281fa17aa,x_FreecivMt).
xc_source_file(a65b1281fa17aa,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17aa,281).
xc_kb_names(a65b1281fa17aa,["?obj","?city"]).
xc_mapping_rows(a65b1281fa17aa,[]).
'x_<=='(x_pathPrefix(V1,V2,V3),x_groundExpression(V1),x_groundExpression(V2),x_evaluate(V4,x_LengthOfListFn(V1)),x_evaluate(V5,x_DifferenceFn(V4,V2)),x_greaterThan(V5,0),x_evaluate(V3,x_SublistFromToFn(V1,0,V5))) :- x_cid(a65b1281fa17ab,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281fa17ab,x_FreecivMt).
xc_source_file(a65b1281fa17ab,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ab,289).
xc_kb_names(a65b1281fa17ab,["?path-list","?remove-from-end","?truncated-path","?len","?new-end"]).
xc_mapping_rows(a65b1281fa17ab,[]).
'x_<=='(x_objectFoundInLocation(V1,x_FreecivLocationFn(V2,V3)),x_groundExpression(x_FreecivLocationFn(V2,V3)),x_not(x_matches(x_FreecivLocationFn(V4,V5),V1)),x_outsourcedOnly(x_fcObjectAt(V1,x_FreecivLocationFn(V2,V3)))) :- x_cid(a65b1281fa17ac,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281fa17ac,x_FreecivMt).
xc_source_file(a65b1281fa17ac,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ac,300).
xc_kb_names(a65b1281fa17ac,["?obj","?x","?y","?a","?b"]).
xc_mapping_rows(a65b1281fa17ac,[]).
'x_<=='(x_objectFoundInLocation(V1,V2),x_groundExpression(V1),x_variableExpression(V2),x_outsourcedOnly(x_fcObjectAt(V1,V2)),x_unifies(x_FreecivLocationFn(V3,V4),V2)) :- x_cid(a65b1281fa17ad,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17ad,x_FreecivMt).
xc_source_file(a65b1281fa17ad,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ad,305).
xc_kb_names(a65b1281fa17ad,["?obj","?where","?x","?y"]).
xc_mapping_rows(a65b1281fa17ad,[]).
'x_<=='(x_objectFoundInLocation(V1,V2),x_groundExpression(V2),x_not(x_matches(x_FreecivLocationFn(V3,V4),V2)),x_not(x_matches(x_FreecivLocationFn(V3,V4),V1)),x_isa(V2,x_Place),x_outsourcedOnly(x_fcObjectAt(V2,V5)),x_outsourcedOnly(x_fcObjectAt(V1,V5)),x_different(V1,V2)) :- x_cid(a65b1281fa17ae,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281fa17ae,x_FreecivMt).
xc_source_file(a65b1281fa17ae,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ae,311).
xc_kb_names(a65b1281fa17ae,["?obj","?where","?x","?y","?loc"]).
xc_mapping_rows(a65b1281fa17ae,[]).
'x_<=='(x_objectFoundInLocation(x_FreecivLocationFn(V1,V2),x_FreecivLocationFn(V1,V2))) :- x_cid(a65b1281fa17af,V1,V2).
xc_microtheory(a65b1281fa17af,x_FreecivMt).
xc_source_file(a65b1281fa17af,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17af,320).
xc_kb_names(a65b1281fa17af,["?x","?y"]).
xc_mapping_rows(a65b1281fa17af,[]).
'x_<=='(x_objectFoundInLocation(V1,V2),x_not(x_matches(x_FreecivLocationFn(V3,V4),V1)),x_groundExpression(V1),x_uninferredSentence(x_nonTransitiveInference(x_isa(V1,V5))),x_freecivCityNameFor(V1,V6),x_objectFoundInLocation(V6,V2)) :- x_cid(a65b1281fa17b0,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1281fa17b0,x_FreecivMt).
xc_source_file(a65b1281fa17b0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b0,323).
xc_kb_names(a65b1281fa17b0,["?obj","?where","?x","?y","?type","?city"]).
xc_mapping_rows(a65b1281fa17b0,[]).
'x_<=='(x_objectFoundInLocation(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_different(V1,V2),x_not(x_matches(x_FreecivLocationFn(V3,V4),V1)),x_not(x_matches(x_FreecivLocationFn(V3,V4),V2)),x_fcObjectAt(V1,V5),x_fcObjectAt(V2,V5)) :- x_cid(a65b1281fa17b1,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281fa17b1,x_FreecivMt).
xc_source_file(a65b1281fa17b1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b1,332).
xc_kb_names(a65b1281fa17b1,["?obj","?region","?x","?y","?loc"]).
xc_mapping_rows(a65b1281fa17b1,[]).
'x_<=='(x_does(V1,V2),x_outsourcedOnly(x_currentActivity(V3,V1))) :- x_cid(a65b1281fa17b2,V1,V2,V3).
xc_microtheory(a65b1281fa17b2,x_FreecivMt).
xc_source_file(a65b1281fa17b2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b2,349).
xc_kb_names(a65b1281fa17b2,["?activity","?actor","?agent"]).
xc_mapping_rows(a65b1281fa17b2,[]).
'x_<=='(x_knowsAbout(V1,V2),x_outsourcedOnly(x_playerKnowsTech(V1,V2))) :- x_cid(a65b1281fa17b3,V1,V2).
xc_microtheory(a65b1281fa17b3,x_FreecivMt).
xc_source_file(a65b1281fa17b3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b3,353).
xc_kb_names(a65b1281fa17b3,["?player","?tech"]).
xc_mapping_rows(a65b1281fa17b3,[]).
'x_<=='(x_researches(V1,V2),x_outsourcedOnly(x_currentlyResearching(V1,V2))) :- x_cid(a65b1281fa17b4,V1,V2).
xc_microtheory(a65b1281fa17b4,x_FreecivMt).
xc_source_file(a65b1281fa17b4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b4,357).
xc_kb_names(a65b1281fa17b4,["?player","?tech"]).
xc_mapping_rows(a65b1281fa17b4,[]).
'x_<=='(x_governmentType(V1,V2),x_outsourcedOnly(x_currentGovernment(V1,V2))) :- x_cid(a65b1281fa17b5,V1,V2).
xc_microtheory(a65b1281fa17b5,x_FreecivMt).
xc_source_file(a65b1281fa17b5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b5,361).
xc_kb_names(a65b1281fa17b5,["?player","?gov-type"]).
xc_mapping_rows(a65b1281fa17b5,[]).
'x_<=='(x_governmentType(V1,V2),x_outsourcedOnly(x_currentGovernment(V1,V3)),x_isa(V3,V2)) :- x_cid(a65b1281fa17b6,V1,V2,V3).
xc_microtheory(a65b1281fa17b6,x_FreecivMt).
xc_source_file(a65b1281fa17b6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b6,365).
xc_kb_names(a65b1281fa17b6,["?player","?gov-type","?what"]).
xc_mapping_rows(a65b1281fa17b6,[]).
'x_<=='(x_terrainType(V1,V2),x_outsourcedOnly(x_terrainAt(V1,V2))) :- x_cid(a65b1281fa17b7,V1,V2).
xc_microtheory(a65b1281fa17b7,x_FreecivMt).
xc_source_file(a65b1281fa17b7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b7,370).
xc_kb_names(a65b1281fa17b7,["?loc","?terrain-type"]).
xc_mapping_rows(a65b1281fa17b7,[]).
'x_<=='(x_areaOfRegion(x_TerritoryFn(V1),V2),x_player(V1),x_nationalTerritory(V1,V2)) :- x_cid(a65b1281fa17b8,V1,V2).
xc_microtheory(a65b1281fa17b8,x_FreecivMt).
xc_source_file(a65b1281fa17b8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b8,374).
xc_kb_names(a65b1281fa17b8,["?player","?area"]).
xc_mapping_rows(a65b1281fa17b8,[]).
'x_<=='(x_inRegion(V1,x_TerritoryFn(V2)),x_groundExpression(V1),x_groundExpression(V2),x_player(V2),x_fcObjectAt(V1,V3),x_locationInTerritory(V3,x_TerritoryFn(V2))) :- x_cid(a65b1281fa17b9,V1,V2,V3).
xc_microtheory(a65b1281fa17b9,x_FreecivMt).
xc_source_file(a65b1281fa17b9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17b9,378).
xc_kb_names(a65b1281fa17b9,["?object","?player","?location"]).
xc_mapping_rows(a65b1281fa17b9,[]).
'x_<=='(x_inRegion(V1,x_TerritoryFn(V2)),x_groundExpression(V1),x_groundExpression(V2),x_cityOwner(V2),x_fcObjectAt(V1,V3),x_inCityRegion(V2,V3)) :- x_cid(a65b1281fa17ba,V1,V2,V3).
xc_microtheory(a65b1281fa17ba,x_FreecivMt).
xc_source_file(a65b1281fa17ba,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ba,385).
xc_kb_names(a65b1281fa17ba,["?object","?city","?location"]).
xc_mapping_rows(a65b1281fa17ba,[]).
'x_<=='(x_distanceBetween(V1,V2,V3),x_numAnswers(1,x_objectFoundInLocation(V1,V4)),x_numAnswers(1,x_objectFoundInLocation(V2,V5)),x_numAnswers(1,x_fcDistance(V4,V5,V6)),x_unifies(V3,x_FreecivTileDistance(V6))) :- x_cid(a65b1281fa17bb,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1281fa17bb,x_FreecivMt).
xc_source_file(a65b1281fa17bb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17bb,399).
xc_kb_names(a65b1281fa17bb,["?from","?to","?distance","?loc1","?loc2","?num"]).
xc_mapping_rows(a65b1281fa17bb,[]).
'x_proximityConstraints-Type'(x_AttackOnTangible,x_performedBy,x_intendedMaleficiary,x_FreecivTileDistance(1)) :- x_cid(a65b1281fa17bc).
xc_microtheory(a65b1281fa17bc,x_FreecivMt).
xc_source_file(a65b1281fa17bc,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17bc,409).
xc_kb_names(a65b1281fa17bc,[]).
xc_mapping_rows(a65b1281fa17bc,[]).
'x_<=='(x_sovereignAllegianceOfOrg(V1,V2),x_groundExpression(V1),x_unitOwner(V1,V2)) :- x_cid(a65b1281fa17bd,V1,V2).
xc_microtheory(a65b1281fa17bd,x_FreecivMt).
xc_source_file(a65b1281fa17bd,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17bd,412).
xc_kb_names(a65b1281fa17bd,["?unit","?player"]).
xc_mapping_rows(a65b1281fa17bd,[]).
'x_<=='(x_sovereignAllegianceOfOrg(V1,V2),x_groundExpression(V2),x_unitOwner(V1,V2)) :- x_cid(a65b1281fa17be,V1,V2).
xc_microtheory(a65b1281fa17be,x_FreecivMt).
xc_source_file(a65b1281fa17be,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17be,416).
xc_kb_names(a65b1281fa17be,["?unit","?player"]).
xc_mapping_rows(a65b1281fa17be,[]).
'x_<=='(x_sovereignAllegianceOfOrg(V1,V2),x_groundExpression(V1),x_cityOwner(V1,V2)) :- x_cid(a65b1281fa17bf,V1,V2).
xc_microtheory(a65b1281fa17bf,x_FreecivMt).
xc_source_file(a65b1281fa17bf,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17bf,420).
xc_kb_names(a65b1281fa17bf,["?city","?player"]).
xc_mapping_rows(a65b1281fa17bf,[]).
'x_<=='(x_sovereignAllegianceOfOrg(V1,V2),x_groundExpression(V2),x_cityOwner(V1,V2)) :- x_cid(a65b1281fa17c0,V1,V2).
xc_microtheory(a65b1281fa17c0,x_FreecivMt).
xc_source_file(a65b1281fa17c0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c0,424).
xc_kb_names(a65b1281fa17c0,["?city","?player"]).
xc_mapping_rows(a65b1281fa17c0,[]).
'x_<=='(x_sovereignAllegianceOfOrg(V1,V1),x_groundExpression(V1),x_player(V1)) :- x_cid(a65b1281fa17c1,V1).
xc_microtheory(a65b1281fa17c1,x_FreecivMt).
xc_source_file(a65b1281fa17c1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c1,428).
xc_kb_names(a65b1281fa17c1,["?player"]).
xc_mapping_rows(a65b1281fa17c1,[]).
'x_<=='(x_gameTurn(V1),x_outsourcedOnly(x_currentYear(V1))) :- x_cid(a65b1281fa17c2,V1).
xc_microtheory(a65b1281fa17c2,x_FreecivMt).
xc_source_file(a65b1281fa17c2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c2,433).
xc_kb_names(a65b1281fa17c2,["?what"]).
xc_mapping_rows(a65b1281fa17c2,[]).
'x_<=='(x_knowsValue(V1,V2,V3),x_groundExpression(V3),x_outsourcedOnly(x_currentPlayer(V1)),x_cacheComplete(t(V3,V2,V4))) :- x_cid(a65b1281fa17c3,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17c3,x_FreecivMt).
xc_source_file(a65b1281fa17c3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c3,440).
xc_kb_names(a65b1281fa17c3,["?player","?obj","?binpred","?value"]).
xc_mapping_rows(a65b1281fa17c3,[]).
'x_<=='(x_tileWorkedByCity(V1,V2),x_cityWorkingTileAt(V2,V1)) :- x_cid(a65b1281fa17c4,V1,V2).
xc_microtheory(a65b1281fa17c4,x_FreecivMt).
xc_source_file(a65b1281fa17c4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c4,482).
xc_kb_names(a65b1281fa17c4,["?loc","?city"]).
xc_mapping_rows(a65b1281fa17c4,[]).
'x_<=='(x_currentQuantityValue(t(x_AggregateQuantityFn(x_cityPopulation),V1),V2),x_inferenceOnly(x_extent(V1,x_TheSet)),x_unifies(V2,x_FreeCivPopulationFn(0))) :- x_cid(a65b1281fa17c5,V1,V2).
xc_microtheory(a65b1281fa17c5,x_FreecivMt).
xc_source_file(a65b1281fa17c5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c5,492).
xc_kb_names(a65b1281fa17c5,["?set-or-coll","?value"]).
xc_mapping_rows(a65b1281fa17c5,[]).
'x_<=='(x_civPopulation(V1,V2),x_currentCitySet(V1,V3),x_different(V3,x_TheSet),x_evaluate(V2,x_PlusAll(V3,x_FunctionToArg(2,x_cityPopulation)))) :- x_cid(a65b1281fa17c6,V1,V2,V3).
xc_microtheory(a65b1281fa17c6,x_FreecivMt).
xc_source_file(a65b1281fa17c6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c6,498).
xc_kb_names(a65b1281fa17c6,["?player","?population","?citySet"]).
xc_mapping_rows(a65b1281fa17c6,[]).
'x_<=='(x_civPopulation(V1,x_FreeCivPopulationFn(0)),x_currentCitySet(V1,x_TheSet)) :- x_cid(a65b1281fa17c7,V1).
xc_microtheory(a65b1281fa17c7,x_FreecivMt).
xc_source_file(a65b1281fa17c7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c7,505).
xc_kb_names(a65b1281fa17c7,["?player"]).
xc_mapping_rows(a65b1281fa17c7,[]).
'x_<=='(x_civFoodSurplusTotal(V1,V2),x_currentCitySet(V1,V3),x_different(V3,x_TheSet),x_evaluate(V2,x_PlusAll(V3,x_FunctionToArg(2,x_cityFoodSurplus)))) :- x_cid(a65b1281fa17c8,V1,V2,V3).
xc_microtheory(a65b1281fa17c8,x_FreecivMt).
xc_source_file(a65b1281fa17c8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c8,508).
xc_kb_names(a65b1281fa17c8,["?player","?total","?citySet"]).
xc_mapping_rows(a65b1281fa17c8,[]).
'x_<=='(x_civProductionTotal(V1,V2),x_currentCitySet(V1,V3),x_different(V3,x_TheSet),x_evaluate(V2,x_PlusAll(V3,x_FunctionToArg(2,x_cityShieldSurplus)))) :- x_cid(a65b1281fa17c9,V1,V2,V3).
xc_microtheory(a65b1281fa17c9,x_FreecivMt).
xc_source_file(a65b1281fa17c9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17c9,541).
xc_kb_names(a65b1281fa17c9,["?player","?total","?city-set"]).
xc_mapping_rows(a65b1281fa17c9,[]).
'x_<=='(x_civProductionTotal(V1,x_ProductionPoints(0)),x_currentCitySet(V1,x_TheSet)) :- x_cid(a65b1281fa17ca,V1).
xc_microtheory(a65b1281fa17ca,x_FreecivMt).
xc_source_file(a65b1281fa17ca,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ca,548).
xc_kb_names(a65b1281fa17ca,["?player"]).
xc_mapping_rows(a65b1281fa17ca,[]).
'x_<=='(x_wonderExists(V1),x_genls(V1,'x_FreeCiv-Wonder'),x_cityHasImprovement(V2,V1)) :- x_cid(a65b1281fa17cb,V1,V2).
xc_microtheory(a65b1281fa17cb,x_FreecivMt).
xc_source_file(a65b1281fa17cb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17cb,551).
xc_kb_names(a65b1281fa17cb,["?obj","?anycity"]).
xc_mapping_rows(a65b1281fa17cb,[]).
'x_<=='(x_currentCitySet(V1,V2),x_currentPlayer(V1),x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,x_cityOwner(V3,V1)))) :- x_cid(a65b1281fa17cc,V1,V2,V3).
xc_microtheory(a65b1281fa17cc,x_FreecivMt).
xc_source_file(a65b1281fa17cc,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17cc,556).
xc_kb_names(a65b1281fa17cc,["?player","?citySet","?city"]).
xc_mapping_rows(a65b1281fa17cc,[]).
'x_<=='(x_numberOfCities(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_cityOwner(V4,V1))),x_evaluate(V2,x_CardinalityFn(V3))) :- x_cid(a65b1281fa17cd,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17cd,x_FreecivMt).
xc_source_file(a65b1281fa17cd,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17cd,564).
xc_kb_names(a65b1281fa17cd,["?player","?count","?citySet","?city"]).
xc_mapping_rows(a65b1281fa17cd,[]).
'x_<=='(x_numCities(V1,V2),x_currentPlayer(V1),x_evaluate(V2,x_CardinalityFn(x_TheClosedRetrievalSetOf(V3,x_cityOwner(V3,V1))))) :- x_cid(a65b1281fa17ce,V1,V2,V3).
xc_microtheory(a65b1281fa17ce,x_FreecivMt).
xc_source_file(a65b1281fa17ce,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ce,572).
xc_kb_names(a65b1281fa17ce,["?player","?num","?city"]).
xc_mapping_rows(a65b1281fa17ce,[]).
'x_<=='(x_hasFleet(V1,V2),x_currentPlayer(V1),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_and(x_unitOwner(V4,V1),x_unitType(V4,V5),x_genls(V5,'x_FreeCiv-SeaUnit')))),x_evaluate(V2,x_CardinalityFn(V3))) :- x_cid(a65b1281fa17cf,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281fa17cf,x_FreecivMt).
xc_source_file(a65b1281fa17cf,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17cf,580).
xc_kb_names(a65b1281fa17cf,["?player","?size","?boatSet","?unit","?type"]).
xc_mapping_rows(a65b1281fa17cf,[]).
'x_<=='(x_hasHut(V1),x_specialAt(V1,'x_FC-Special-Hut')) :- x_cid(a65b1281fa17d0,V1).
xc_microtheory(a65b1281fa17d0,x_FreecivMt).
xc_source_file(a65b1281fa17d0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d0,590).
xc_kb_names(a65b1281fa17d0,["?loc"]).
xc_mapping_rows(a65b1281fa17d0,[]).
x_isa(x_unitIsa,x_BinaryPredicate) :- x_cid(a65b1281fa17d1).
xc_microtheory(a65b1281fa17d1,x_FreecivMt).
xc_source_file(a65b1281fa17d1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d1,595).
xc_kb_names(a65b1281fa17d1,[]).
xc_mapping_rows(a65b1281fa17d1,[]).
x_arg1Isa(x_unitIsa,x_Individual) :- x_cid(a65b1281fa17d2).
xc_microtheory(a65b1281fa17d2,x_FreecivMt).
xc_source_file(a65b1281fa17d2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d2,596).
xc_kb_names(a65b1281fa17d2,[]).
xc_mapping_rows(a65b1281fa17d2,[]).
x_arg2Isa(x_unitIsa,x_Collection) :- x_cid(a65b1281fa17d3).
xc_microtheory(a65b1281fa17d3,x_FreecivMt).
xc_source_file(a65b1281fa17d3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d3,597).
xc_kb_names(a65b1281fa17d3,[]).
xc_mapping_rows(a65b1281fa17d3,[]).
x_comment(x_unitIsa,"(unitIsa ?unit ?unit-type) falls back on isa if there is no outsourced unitType predicate available.") :- x_cid(a65b1281fa17d4).
xc_microtheory(a65b1281fa17d4,x_FreecivMt).
xc_source_file(a65b1281fa17d4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d4,598).
xc_kb_names(a65b1281fa17d4,[]).
xc_mapping_rows(a65b1281fa17d4,[]).
'x_<=='(x_unitIsa(V1,V2),x_outsourcedOnly(x_unitType(V1,V2))) :- x_cid(a65b1281fa17d5,V1,V2).
xc_microtheory(a65b1281fa17d5,x_FreecivMt).
xc_source_file(a65b1281fa17d5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d5,601).
xc_kb_names(a65b1281fa17d5,["?unit","?type"]).
xc_mapping_rows(a65b1281fa17d5,[]).
'x_<=='(x_unitIsa(V1,V2),x_uninferredSentence(x_outsourcedOnly(x_unitType(V1,V2))),x_nonTransitiveInference(x_isa(V1,V2))) :- x_cid(a65b1281fa17d6,V1,V2).
xc_microtheory(a65b1281fa17d6,x_FreecivMt).
xc_source_file(a65b1281fa17d6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d6,605).
xc_kb_names(a65b1281fa17d6,["?unit","?type"]).
xc_mapping_rows(a65b1281fa17d6,[]).
'x_<=='(x_unitHasPopulationCost(V1,V2),x_numAnswers(1,x_unitIsa(V1,V3)),x_numAnswers(1,x_lookupOnly(x_unitTypeHasPopulationCost(V3,V2)))) :- x_cid(a65b1281fa17d7,V1,V2,V3).
xc_microtheory(a65b1281fa17d7,x_FreecivMt).
xc_source_file(a65b1281fa17d7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d7,612).
xc_kb_names(a65b1281fa17d7,["?unit","?cost","?type"]).
xc_mapping_rows(a65b1281fa17d7,[]).
'x_<=='(x_unitHasFoodUpkeep(V1,V2),x_numAnswers(1,x_unitHomeCity(V1,V3)),x_numAnswers(1,x_unitIsa(V1,V4)),x_numAnswers(1,x_lookupOnly(x_objectTypeHasUpkeepFoodCost(V4,V2)))) :- x_cid(a65b1281fa17d8,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17d8,x_FreecivMt).
xc_source_file(a65b1281fa17d8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d8,621).
xc_kb_names(a65b1281fa17d8,["?unit","?food-upkeep","?somewhere","?unittype"]).
xc_mapping_rows(a65b1281fa17d8,[]).
'x_<=='(x_unitHasFoodUpkeep(V1,x_FoodPoints(0)),x_uninferredSentence(x_unitHomeCity(V1,V2))) :- x_cid(a65b1281fa17d9,V1,V2).
xc_microtheory(a65b1281fa17d9,x_FreecivMt).
xc_source_file(a65b1281fa17d9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17d9,628).
xc_kb_names(a65b1281fa17d9,["?unit","?where"]).
xc_mapping_rows(a65b1281fa17d9,[]).
'x_<=='(x_unitHasShieldUpkeep(V1,V2),x_numAnswers(1,x_unitHomeCity(V1,V3)),x_numAnswers(1,x_unitType(V1,V4)),'x_ist-Information'('x_Freeciv-defaultMt',x_objectTypeHasUpkeepShieldEffect(V4,V2))) :- x_cid(a65b1281fa17da,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17da,x_FreecivMt).
xc_source_file(a65b1281fa17da,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17da,632).
xc_kb_names(a65b1281fa17da,["?unit","?shield-upkeep","?somewhere","?unittype"]).
xc_mapping_rows(a65b1281fa17da,[]).
'x_<=='(x_unitHasShieldUpkeep(V1,x_ProductionPoints(0)),x_uninferredSentence(x_unitHomeCity(V1,V2))) :- x_cid(a65b1281fa17db,V1,V2).
xc_microtheory(a65b1281fa17db,x_FreecivMt).
xc_source_file(a65b1281fa17db,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17db,638).
xc_kb_names(a65b1281fa17db,["?unit","?where"]).
xc_mapping_rows(a65b1281fa17db,[]).
'x_<=='(x_unitHasAttackStrength(V1,V2),x_numAnswers(1,x_unitType(V1,V3)),x_numAnswers(1,x_lookupOnly(x_unitTypeHasAttackStrength(V3,V2)))) :- x_cid(a65b1281fa17dc,V1,V2,V3).
xc_microtheory(a65b1281fa17dc,x_FreecivMt).
xc_source_file(a65b1281fa17dc,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17dc,643).
xc_kb_names(a65b1281fa17dc,["?unit","?strength","?type"]).
xc_mapping_rows(a65b1281fa17dc,[]).
'x_<=='(x_unitHasDefendStrength(V1,V2),x_numAnswers(1,x_unitIsa(V1,V3)),x_numAnswers(1,x_lookupOnly(x_unitTypeHasDefendStrength(V3,V2)))) :- x_cid(a65b1281fa17dd,V1,V2,V3).
xc_microtheory(a65b1281fa17dd,x_FreecivMt).
xc_source_file(a65b1281fa17dd,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17dd,650).
xc_kb_names(a65b1281fa17dd,["?unit","?strength","?type"]).
xc_mapping_rows(a65b1281fa17dd,[]).
'x_<=='(x_unitHasHitpoints(V1,V2),x_numAnswers(1,x_unitIsa(V1,V3)),x_numAnswers(1,x_lookupOnly(x_unitTypeHasHitpoints(V3,V2)))) :- x_cid(a65b1281fa17de,V1,V2,V3).
xc_microtheory(a65b1281fa17de,x_FreecivMt).
xc_source_file(a65b1281fa17de,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17de,657).
xc_kb_names(a65b1281fa17de,["?unit","?hitpoints","?type"]).
xc_mapping_rows(a65b1281fa17de,[]).
'x_<=='(x_unitHasFirepower(V1,V2),x_numAnswers(1,x_unitIsa(V1,V3)),x_numAnswers(1,x_lookupOnly(x_unitTypeHasFirepower(V3,V2)))) :- x_cid(a65b1281fa17df,V1,V2,V3).
xc_microtheory(a65b1281fa17df,x_FreecivMt).
xc_source_file(a65b1281fa17df,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17df,663).
xc_kb_names(a65b1281fa17df,["?unit","?firepower","?type"]).
xc_mapping_rows(a65b1281fa17df,[]).
'x_<=='(x_unitHasMoveRate(V1,V2),x_numAnswers(1,x_unitIsa(V1,V3)),x_numAnswers(1,x_lookupOnly(x_unitTypeHasMoveRate(V3,V2)))) :- x_cid(a65b1281fa17e0,V1,V2,V3).
xc_microtheory(a65b1281fa17e0,x_FreecivMt).
xc_source_file(a65b1281fa17e0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e0,670).
xc_kb_names(a65b1281fa17e0,["?unit","?rate","?type"]).
xc_mapping_rows(a65b1281fa17e0,[]).
'x_<=='(x_unitHasTransportCapacity(V1,V2),x_numAnswers(1,x_unitIsa(V1,V3)),x_numAnswers(1,x_lookupOnly(x_unitTypeHasTransportCapacity(V3,V2)))) :- x_cid(a65b1281fa17e1,V1,V2,V3).
xc_microtheory(a65b1281fa17e1,x_FreecivMt).
xc_source_file(a65b1281fa17e1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e1,677).
xc_kb_names(a65b1281fa17e1,["?unit","?capacity","?type"]).
xc_mapping_rows(a65b1281fa17e1,[]).
'x_<=='(x_unitHasFuelCapacity(V1,V2),x_numAnswers(1,x_unitIsa(V1,V3)),x_numAnswers(1,x_lookupOnly(x_unitTypeHasFuelCapacity(V3,V2)))) :- x_cid(a65b1281fa17e2,V1,V2,V3).
xc_microtheory(a65b1281fa17e2,x_FreecivMt).
xc_source_file(a65b1281fa17e2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e2,683).
xc_kb_names(a65b1281fa17e2,["?unit","?capacity","?type"]).
xc_mapping_rows(a65b1281fa17e2,[]).
'x_<=='(x_idleUnitOfType(V1,V2),x_idleUnit(V2),x_numAnswers(1,x_unitType(V2,V1))) :- x_cid(a65b1281fa17e3,V1,V2).
xc_microtheory(a65b1281fa17e3,x_FreecivMt).
xc_source_file(a65b1281fa17e3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e3,690).
xc_kb_names(a65b1281fa17e3,["?type","?unit"]).
xc_mapping_rows(a65b1281fa17e3,[]).
'x_<=='(x_idleUnitOfType(V1,V2),x_idleUnit(V2),x_numAnswers(1,x_unitType(V2,V3)),x_genls(V3,V1)) :- x_cid(a65b1281fa17e4,V1,V2,V3).
xc_microtheory(a65b1281fa17e4,x_FreecivMt).
xc_source_file(a65b1281fa17e4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e4,695).
xc_kb_names(a65b1281fa17e4,["?type","?unit","?subtype"]).
xc_mapping_rows(a65b1281fa17e4,[]).
'x_<=='(x_behaviorCapable(V1,V2,V3),x_numAnswers(1,x_unitType(V1,V4)),x_numAnswers(1,x_lookupOnly(t(x_TypeCapableFn(x_behaviorCapable),V4,V2,V3)))) :- x_cid(a65b1281fa17e5,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17e5,x_FreecivMt).
xc_source_file(a65b1281fa17e5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e5,701).
xc_kb_names(a65b1281fa17e5,["?agent","?activity-type","?role","?type"]).
xc_mapping_rows(a65b1281fa17e5,[]).
'x_<=='(t(x_TypeCapableFn(x_behaviorCapable),V1,x_AttackOnTangible,x_performedBy),x_lookupOnly(t(x_TypeCapableFn(x_behaviorCapable),V1,x_doAttack,x_performedBy))) :- x_cid(a65b1281fa17e6,V1).
xc_microtheory(a65b1281fa17e6,x_FreecivMt).
xc_source_file(a65b1281fa17e6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e6,707).
xc_kb_names(a65b1281fa17e6,["?type"]).
xc_mapping_rows(a65b1281fa17e6,[]).
'x_<=='(x_canTravelOn(V1,V2),x_numAnswers(1,x_unitType(V1,V3)),x_lookupOnly(x_genls(V3,'x_FreeCiv-LandUnit')),x_lookupOnly(x_isa(V2,'x_FreeCiv-LandTile'))) :- x_cid(a65b1281fa17e7,V1,V2,V3).
xc_microtheory(a65b1281fa17e7,x_FreecivMt).
xc_source_file(a65b1281fa17e7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e7,712).
xc_kb_names(a65b1281fa17e7,["?unit","?terrain","?unitType"]).
xc_mapping_rows(a65b1281fa17e7,[]).
'x_<=='(x_canTravelOn(V1,V2),x_numAnswers(1,x_unitType(V1,V3)),x_lookupOnly(x_genls(V3,'x_FreeCiv-SeaUnit')),x_lookupOnly(x_isa(V2,'x_FreeCiv-WaterTile'))) :- x_cid(a65b1281fa17e8,V1,V2,V3).
xc_microtheory(a65b1281fa17e8,x_FreecivMt).
xc_source_file(a65b1281fa17e8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e8,721).
xc_kb_names(a65b1281fa17e8,["?unit","?terrain","?unitType"]).
xc_mapping_rows(a65b1281fa17e8,[]).
'x_<=='(x_canTravelOn(V1,V2),x_unitType(V1,V3),x_genls(V3,'x_FreeCiv-AirUnit')) :- x_cid(a65b1281fa17e9,V1,V2,V3).
xc_microtheory(a65b1281fa17e9,x_FreecivMt).
xc_source_file(a65b1281fa17e9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17e9,730).
xc_kb_names(a65b1281fa17e9,["?unit","?terrain","?unitType"]).
xc_mapping_rows(a65b1281fa17e9,[]).
'x_<=='(x_canTravelOn(V1,V2),x_numAnswers(1,x_unitType(V1,V3)),x_lookupOnly(x_genls(V3,'x_FreeCiv-HeliUnit'))) :- x_cid(a65b1281fa17ea,V1,V2,V3).
xc_microtheory(a65b1281fa17ea,x_FreecivMt).
xc_source_file(a65b1281fa17ea,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ea,735).
xc_kb_names(a65b1281fa17ea,["?unit","?terrain","?unitType"]).
xc_mapping_rows(a65b1281fa17ea,[]).
'x_<=='(x_inFriendlyCity(V1,V2),x_numAnswers(1,x_currentPlayer(V3)),x_numAnswers(1,x_unitOwner(V1,V3)),x_fcObjectAt(V1,V4),x_fcObjectAt(V2,V4),x_numAnswers(1,x_cityOwner(V2,V3))) :- x_cid(a65b1281fa17eb,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17eb,x_FreecivMt).
xc_source_file(a65b1281fa17eb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17eb,741).
xc_kb_names(a65b1281fa17eb,["?unit","?city","?player","?loc"]).
xc_mapping_rows(a65b1281fa17eb,[]).
'x_<=='(x_idleUnit(V1),x_numAnswers(1,x_fcExecutionContext(V2)),x_numAnswers(1,x_currentPlayer(V3)),x_unitOwner(V1,V3),x_outsourcedOnly(x_currentActivity(V1,'x_FC-ActivityIdle')),x_uninferredSentence(x_outsourcedOnly(x_hasOrders(V1))),x_uninferredSentence(x_outsourcedOnly(x_doneMoving(V1))),x_uninferredSentence(x_outsourcedOnly(x_currentPlan(V1,V4))),x_uninferredSentence(x_allFactsAllowed('x_ist-Information'(V2,x_unitPlansCityAt(V1,V5))))) :- x_cid(a65b1281fa17ec,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281fa17ec,x_FreecivMt).
xc_source_file(a65b1281fa17ec,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ec,748).
xc_kb_names(a65b1281fa17ec,["?unit","?mt","?player","?plan","?loc"]).
xc_mapping_rows(a65b1281fa17ec,[]).
'x_<=='(x_idleUnitSet(V1),x_evaluate(V1,x_TheClosedRetrievalSetOf(V2,x_wmOnly(x_idleUnit(V2))))) :- x_cid(a65b1281fa17ed,V1,V2).
xc_microtheory(a65b1281fa17ed,x_FreecivMt).
xc_source_file(a65b1281fa17ed,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ed,769).
xc_kb_names(a65b1281fa17ed,["?unitSet","?unit"]).
xc_mapping_rows(a65b1281fa17ed,[]).
'x_<=='(x_cityPopulation(V1,V2),x_numAnswers(1,x_citySize(V1,V3)),x_unifies(t(V4,V5),V3),x_evaluate(V6,x_TimesFn(V5,x_PlusFn(V5,1),5000)),x_unifies(V2,x_FreeCivPopulationFn(V6))) :- x_cid(a65b1281fa17ee,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1281fa17ee,x_FreecivMt).
xc_source_file(a65b1281fa17ee,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ee,780).
xc_kb_names(a65b1281fa17ee,["?city","?population","?sz","?functor","?sz-int","?pop-int"]).
xc_mapping_rows(a65b1281fa17ee,[]).
'x_<=='(x_potentialCityAt(V1),x_groundExpression(V1),x_matches(x_FreecivLocationFn(V2,V3),V1),x_currentPlayer(V4),x_uninferredSentence(x_enemyTerritory(V1,V4)),x_uninferredSentence(x_outsourcedOnly(x_violatesCitySpacing(V1)))) :- x_cid(a65b1281fa17ef,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17ef,x_FreecivMt).
xc_source_file(a65b1281fa17ef,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ef,793).
xc_kb_names(a65b1281fa17ef,["?loc","?x","?y","?current-player"]).
xc_mapping_rows(a65b1281fa17ef,[]).
x_isa(x_enemyTerritory,x_BinaryPredicate) :- x_cid(a65b1281fa17f0).
xc_microtheory(a65b1281fa17f0,x_FreecivMt).
xc_source_file(a65b1281fa17f0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f0,808).
xc_kb_names(a65b1281fa17f0,[]).
xc_mapping_rows(a65b1281fa17f0,[]).
x_arity(x_enemyTerritory,2) :- x_cid(a65b1281fa17f1).
xc_microtheory(a65b1281fa17f1,x_FreecivMt).
xc_source_file(a65b1281fa17f1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f1,809).
xc_kb_names(a65b1281fa17f1,[]).
xc_mapping_rows(a65b1281fa17f1,[]).
x_arg1Isa(x_enemyTerritory,x_FreecivLocation) :- x_cid(a65b1281fa17f2).
xc_microtheory(a65b1281fa17f2,x_FreecivMt).
xc_source_file(a65b1281fa17f2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f2,810).
xc_kb_names(a65b1281fa17f2,[]).
xc_mapping_rows(a65b1281fa17f2,[]).
x_arg2Isa(x_enemyTerritory,'x_FreeCiv-Player') :- x_cid(a65b1281fa17f3).
xc_microtheory(a65b1281fa17f3,x_FreecivMt).
xc_source_file(a65b1281fa17f3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f3,811).
xc_kb_names(a65b1281fa17f3,[]).
xc_mapping_rows(a65b1281fa17f3,[]).
'x_<=='(x_enemyTerritory(V1,V2),x_locationInTerritory(V1,V3),x_unifies(x_TerritoryFn(V4),V3),x_different(V4,V2)) :- x_cid(a65b1281fa17f4,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17f4,x_FreecivMt).
xc_source_file(a65b1281fa17f4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f4,813).
xc_kb_names(a65b1281fa17f4,["?loc","?current-player","?territory","?player"]).
xc_mapping_rows(a65b1281fa17f4,[]).
x_isa(x_violatesCitySpacing,x_UnaryPredicate) :- x_cid(a65b1281fa17f5).
xc_microtheory(a65b1281fa17f5,x_FreecivMt).
xc_source_file(a65b1281fa17f5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f5,818).
xc_kb_names(a65b1281fa17f5,[]).
xc_mapping_rows(a65b1281fa17f5,[]).
x_arity(x_violatesCitySpacing,1) :- x_cid(a65b1281fa17f6).
xc_microtheory(a65b1281fa17f6,x_FreecivMt).
xc_source_file(a65b1281fa17f6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f6,819).
xc_kb_names(a65b1281fa17f6,[]).
xc_mapping_rows(a65b1281fa17f6,[]).
x_arg1Isa(x_violatesCitySpacing,x_FreecivLocation) :- x_cid(a65b1281fa17f7).
xc_microtheory(a65b1281fa17f7,x_FreecivMt).
xc_source_file(a65b1281fa17f7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f7,820).
xc_kb_names(a65b1281fa17f7,[]).
xc_mapping_rows(a65b1281fa17f7,[]).
x_comment(x_violatesCitySpacing,"(violatesCitySpacing ?loc) means there is a city withing 3 tiles of ?loc.") :- x_cid(a65b1281fa17f8).
xc_microtheory(a65b1281fa17f8,x_FreecivMt).
xc_source_file(a65b1281fa17f8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f8,821).
xc_kb_names(a65b1281fa17f8,[]).
xc_mapping_rows(a65b1281fa17f8,[]).
'x_<=='(x_cityImprovementsUpkeep(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_cityHasImprovement(V1,V4))),x_totalImprovementsUpkeep(V3,V2)) :- x_cid(a65b1281fa17f9,V1,V2,V3,V4).
xc_microtheory(a65b1281fa17f9,x_FreecivMt).
xc_source_file(a65b1281fa17f9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17f9,885).
xc_kb_names(a65b1281fa17f9,["?city","?upkeep","?improvements-set","?improvement"]).
xc_mapping_rows(a65b1281fa17f9,[]).
'x_<=='(x_totalImprovementsUpkeep(V1,V2),x_different(V1,x_TheSet),x_evaluate(V2,x_PlusAll(V1,x_FunctionToArg(2,x_objectTypeHasUpkeepGoldCost)))) :- x_cid(a65b1281fa17fa,V1,V2).
xc_microtheory(a65b1281fa17fa,x_FreecivMt).
xc_source_file(a65b1281fa17fa,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17fa,891).
xc_kb_names(a65b1281fa17fa,["?improvements-set","?upkeep"]).
xc_mapping_rows(a65b1281fa17fa,[]).
'x_<=='(x_totalImprovementsUpkeep(x_TheSet,x_GoldPoints(0))) :- x_cid(a65b1281fa17fb).
xc_microtheory(a65b1281fa17fb,x_FreecivMt).
xc_source_file(a65b1281fa17fb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17fb,899).
xc_kb_names(a65b1281fa17fb,[]).
xc_mapping_rows(a65b1281fa17fb,[]).
'x_<=='(x_requiresImprovement(V1,V2,V3),x_objectProductionRequiresBuilding(V2,V3),x_uninferredSentence(x_cityHasImprovement(V1,V3))) :- x_cid(a65b1281fa17fc,V1,V2,V3).
xc_microtheory(a65b1281fa17fc,x_FreecivMt).
xc_source_file(a65b1281fa17fc,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17fc,902).
xc_kb_names(a65b1281fa17fc,["?city","?objType","?improvement"]).
xc_mapping_rows(a65b1281fa17fc,[]).
'x_<=='(x_isObsolete(V1),x_lookupOnly(x_objectTypeObsoletes(V2,V1)),x_numAnswers(1,x_currentPlayer(V3)),x_canBuild(V3,V2)) :- x_cid(a65b1281fa17fd,V1,V2,V3).
xc_microtheory(a65b1281fa17fd,x_FreecivMt).
xc_source_file(a65b1281fa17fd,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17fd,906).
xc_kb_names(a65b1281fa17fd,["?objType","?otherType","?player"]).
xc_mapping_rows(a65b1281fa17fd,[]).
'x_<=='(x_roadBlockedByRiver(V1,V2),x_specialAt(V2,'x_FC-Special-River'),x_localOnly(x_uninferredSentence(x_playerKnowsTech(V1,'x_FC-Tech-BridgeBuilding')))) :- x_cid(a65b1281fa17fe,V1,V2).
xc_microtheory(a65b1281fa17fe,x_FreecivMt).
xc_source_file(a65b1281fa17fe,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17fe,913).
xc_kb_names(a65b1281fa17fe,["?player","?loc"]).
xc_mapping_rows(a65b1281fa17fe,[]).
x_isa(x_nextToWater,x_UnaryPredicate) :- x_cid(a65b1281fa17ff).
xc_microtheory(a65b1281fa17ff,x_FreecivMt).
xc_source_file(a65b1281fa17ff,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa17ff,919).
xc_kb_names(a65b1281fa17ff,[]).
xc_mapping_rows(a65b1281fa17ff,[]).
x_arity(x_nextToWater,1) :- x_cid(a65b1281fa1800).
xc_microtheory(a65b1281fa1800,x_FreecivMt).
xc_source_file(a65b1281fa1800,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1800,920).
xc_kb_names(a65b1281fa1800,[]).
xc_mapping_rows(a65b1281fa1800,[]).
x_arg1Isa(x_nextToWater,x_FreecivLocation) :- x_cid(a65b1281fa1801).
xc_microtheory(a65b1281fa1801,x_FreecivMt).
xc_source_file(a65b1281fa1801,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1801,921).
xc_kb_names(a65b1281fa1801,[]).
xc_mapping_rows(a65b1281fa1801,[]).
x_comment(x_nextToWater,"(nextToWater (FreecivLocationFn ?x ?y)) means location ?x ?y is cardinally adjacent to water, either the ocean, a river, or irrigation.") :- x_cid(a65b1281fa1802).
xc_microtheory(a65b1281fa1802,x_FreecivMt).
xc_source_file(a65b1281fa1802,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1802,922).
xc_kb_names(a65b1281fa1802,[]).
xc_mapping_rows(a65b1281fa1802,[]).
'x_<=='(x_nextToWater(V1),x_cardinallyAdjacentToPos('x_FreeCiv-WaterTile',V1)) :- x_cid(a65b1281fa1803,V1).
xc_microtheory(a65b1281fa1803,x_FreecivMt).
xc_source_file(a65b1281fa1803,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1803,924).
xc_kb_names(a65b1281fa1803,["?loc"]).
xc_mapping_rows(a65b1281fa1803,[]).
'x_<=='(x_nextToWater(V1),x_cardinallyAdjacentToPos('x_FC-Special-River',V1)) :- x_cid(a65b1281fa1804,V1).
xc_microtheory(a65b1281fa1804,x_FreecivMt).
xc_source_file(a65b1281fa1804,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1804,927).
xc_kb_names(a65b1281fa1804,["?loc"]).
xc_mapping_rows(a65b1281fa1804,[]).
'x_<=='(x_nextToWater(V1),x_specialAt(V1,'x_FC-Special-River')) :- x_cid(a65b1281fa1805,V1).
xc_microtheory(a65b1281fa1805,x_FreecivMt).
xc_source_file(a65b1281fa1805,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1805,930).
xc_kb_names(a65b1281fa1805,["?loc"]).
xc_mapping_rows(a65b1281fa1805,[]).
'x_<=='(x_nextToWater(V1),x_cardinallyAdjacentToPos('x_FC-Special-Irrigation',V1)) :- x_cid(a65b1281fa1806,V1).
xc_microtheory(a65b1281fa1806,x_FreecivMt).
xc_source_file(a65b1281fa1806,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1806,933).
xc_kb_names(a65b1281fa1806,["?loc"]).
xc_mapping_rows(a65b1281fa1806,[]).
'x_<=='(x_plansConstruction(V1,V2),x_currentPlayer(V3),x_numAnswers(1,x_cityOwner(V1,V3)),x_cityWorklist(V1,V4),x_formulaArgument(V4,V5,V2)) :- x_cid(a65b1281fa1807,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281fa1807,x_FreecivMt).
xc_source_file(a65b1281fa1807,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1807,937).
xc_kb_names(a65b1281fa1807,["?who","?item","?player","?worklist","?n"]).
xc_mapping_rows(a65b1281fa1807,[]).
'x_<=='(x_coastalCity(V1),x_fcObjectAt(V1,V2),x_adjacentToPos('x_FC-Terrain-Ocean',V2)) :- x_cid(a65b1281fa1808,V1,V2).
xc_microtheory(a65b1281fa1808,x_FreecivMt).
xc_source_file(a65b1281fa1808,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1808,945).
xc_kb_names(a65b1281fa1808,["?city","?loc"]).
xc_mapping_rows(a65b1281fa1808,[]).
'x_<=='(x_cityAt(V1,V2),x_fcObjectAt(V1,V2),x_numAnswers(1,x_cityOwner(V1,V3))) :- x_cid(a65b1281fa1809,V1,V2,V3).
xc_microtheory(a65b1281fa1809,x_FreecivMt).
xc_source_file(a65b1281fa1809,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1809,949).
xc_kb_names(a65b1281fa1809,["?city","?loc","?owner"]).
xc_mapping_rows(a65b1281fa1809,[]).
'x_<=='(x_citySpecialAt(V1,V2,V3),x_cityAt(V1,V4),x_different(V3,V4),x_cityWorkingTileAt(V1,V3),x_specialAt(V3,V2)) :- x_cid(a65b1281fa180a,V1,V2,V3,V4).
xc_microtheory(a65b1281fa180a,x_FreecivMt).
xc_source_file(a65b1281fa180a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa180a,956).
xc_kb_names(a65b1281fa180a,["?city","?special","?special-loc","?city-loc"]).
xc_mapping_rows(a65b1281fa180a,[]).
'x_<=='(x_citySpecialAt(V1,V2,V3),x_cityAt(V1,V4),x_different(V3,V4),x_cityWorkingTileAt(V1,V3),x_resourceAt(V3,V2)) :- x_cid(a65b1281fa180b,V1,V2,V3,V4).
xc_microtheory(a65b1281fa180b,x_FreecivMt).
xc_source_file(a65b1281fa180b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa180b,963).
xc_kb_names(a65b1281fa180b,["?city","?special","?special-loc","?city-loc"]).
xc_mapping_rows(a65b1281fa180b,[]).
'x_<=='(x_cityTerrainAt(V1,V2,V3),x_cityAt(V1,V4),x_different(V3,V4),x_cityWorkingTileAt(V1,V3),x_terrainAt(V3,V2)) :- x_cid(a65b1281fa180c,V1,V2,V3,V4).
xc_microtheory(a65b1281fa180c,x_FreecivMt).
xc_source_file(a65b1281fa180c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa180c,971).
xc_kb_names(a65b1281fa180c,["?city","?terrain","?terrain-loc","?city-loc"]).
xc_mapping_rows(a65b1281fa180c,[]).
'x_<=='(x_cityHappiness(V1,V2),x_happyCitizens(V1,V3),x_formulaArgument(V3,1,V4),x_contentCitizens(V1,V5),x_formulaArgument(V5,1,V6),x_unhappyCitizens(V1,V7),x_formulaArgument(V7,1,V8),x_angryCitizens(V1,V9),x_formulaArgument(V9,1,V10),x_evaluate(V11,x_QuotientFn(x_PlusFn(x_TimesFn(V4,4),x_TimesFn(V6,3),x_TimesFn(V8,2),x_TimesFn(V10,1)),x_PlusFn(V4,V6,V8,V10))),x_unifies(V2,x_FreeCivMoodFn(V11))) :- x_cid(a65b1281fa180d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b1281fa180d,x_FreecivMt).
xc_source_file(a65b1281fa180d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa180d,980).
xc_kb_names(a65b1281fa180d,["?city","?avg-happiness","?happy","?happy-val","?content","?content-val","?unhappy","?unhappy-val","?angry","?angry-val","?average-val"]).
xc_mapping_rows(a65b1281fa180d,[]).
'x_<=='(x_numEntertainers(V1,x_FreecivCitizenCountFn(V2)),x_numSpecialists(V1,'x_FC-Specialist-Elvis',x_FreecivCitizenCountFn(V2))) :- x_cid(a65b1281fa180e,V1,V2).
xc_microtheory(a65b1281fa180e,x_FreecivMt).
xc_source_file(a65b1281fa180e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa180e,1001).
xc_kb_names(a65b1281fa180e,["?city","?num"]).
xc_mapping_rows(a65b1281fa180e,[]).
'x_<=='(x_numScientists(V1,x_FreecivCitizenCountFn(V2)),x_numSpecialists(V1,'x_FC-Specialist-Scientist',x_FreecivCitizenCountFn(V2))) :- x_cid(a65b1281fa180f,V1,V2).
xc_microtheory(a65b1281fa180f,x_FreecivMt).
xc_source_file(a65b1281fa180f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa180f,1004).
xc_kb_names(a65b1281fa180f,["?city","?num"]).
xc_mapping_rows(a65b1281fa180f,[]).
'x_<=='(x_numTaxCollectors(V1,x_FreecivCitizenCountFn(V2)),x_numSpecialists(V1,'x_FC-Specialist-Taxman',x_FreecivCitizenCountFn(V2))) :- x_cid(a65b1281fa1810,V1,V2).
xc_microtheory(a65b1281fa1810,x_FreecivMt).
xc_source_file(a65b1281fa1810,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1810,1007).
xc_kb_names(a65b1281fa1810,["?city","?num"]).
xc_mapping_rows(a65b1281fa1810,[]).
'x_<=='(x_unitProducedThisTurn(V1,V2),x_fcExecutionContext(V3),x_currentYear(V4),x_unitHomeCity(V2,V1),x_startingDate(V2,V4)) :- x_cid(a65b1281fa1811,V1,V2,V3,V4).
xc_microtheory(a65b1281fa1811,x_FreecivMt).
xc_source_file(a65b1281fa1811,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1811,1013).
xc_kb_names(a65b1281fa1811,["?city","?unit","?mt","?year"]).
xc_mapping_rows(a65b1281fa1811,[]).
'x_<=='(x_mostNeededImprovementType(V1,V2),x_cityFoodSurplus(V1,V3),x_natArgument(V3,1,V4),x_cityShieldSurplus(V1,V5),x_natArgument(V5,1,V6),x_cityTradeSurplus(V1,V7),x_natArgument(V7,1,V8),x_minimumSurplusType(V4,V6,V8,V2)) :- x_cid(a65b1281fa1812,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1281fa1812,x_FreecivMt).
xc_source_file(a65b1281fa1812,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1812,1021).
xc_kb_names(a65b1281fa1812,["?city","?type","?foodFn","?food","?shieldsFn","?shields","?tradeFn","?trade"]).
xc_mapping_rows(a65b1281fa1812,[]).
'x_<=='(x_minimumSurplusType(V1,V2,V3,x_ImproveFood),x_lessThanOrEqualTo(V1,V2),x_lessThanOrEqualTo(V1,V3)) :- x_cid(a65b1281fa1813,V1,V2,V3).
xc_microtheory(a65b1281fa1813,x_FreecivMt).
xc_source_file(a65b1281fa1813,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1813,1030).
xc_kb_names(a65b1281fa1813,["?f","?p","?t"]).
xc_mapping_rows(a65b1281fa1813,[]).
'x_<=='(x_minimumSurplusType(V1,V2,V3,x_ImproveProduction),x_greaterThan(V1,V2),x_lessThanOrEqualTo(V2,V3)) :- x_cid(a65b1281fa1814,V1,V2,V3).
xc_microtheory(a65b1281fa1814,x_FreecivMt).
xc_source_file(a65b1281fa1814,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1814,1034).
xc_kb_names(a65b1281fa1814,["?f","?p","?t"]).
xc_mapping_rows(a65b1281fa1814,[]).
'x_<=='(x_minimumSurplusType(V1,V2,V3,x_ImproveTrade),x_greaterThan(V1,V3),x_greaterThan(V2,V3)) :- x_cid(a65b1281fa1815,V1,V2,V3).
xc_microtheory(a65b1281fa1815,x_FreecivMt).
xc_source_file(a65b1281fa1815,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1815,1038).
xc_kb_names(a65b1281fa1815,["?f","?p","?t"]).
xc_mapping_rows(a65b1281fa1815,[]).
'x_<=='(x_cityCannotGrow(V1),x_citySize(V1,x_FreecivCitizenCountFn(8)),x_uninferredSentence(x_cityHasImprovement(V1,'x_FC-Building-Aqueduct'))) :- x_cid(a65b1281fa1816,V1).
xc_microtheory(a65b1281fa1816,x_FreecivMt).
xc_source_file(a65b1281fa1816,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1816,1045).
xc_kb_names(a65b1281fa1816,["?city"]).
xc_mapping_rows(a65b1281fa1816,[]).
'x_<=='(x_cityCannotGrow(V1),x_citySize(V1,x_FreecivCitizenCountFn(12)),x_uninferredSentence(x_cityHasImprovement(V1,'x_FC-Building-SewerSystem'))) :- x_cid(a65b1281fa1817,V1).
xc_microtheory(a65b1281fa1817,x_FreecivMt).
xc_source_file(a65b1281fa1817,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1817,1050).
xc_kb_names(a65b1281fa1817,["?city"]).
xc_mapping_rows(a65b1281fa1817,[]).
x_isa(x_moveWorkerPermitted,x_UnaryPredicate) :- x_cid(a65b1281fa1818).
xc_microtheory(a65b1281fa1818,x_FreecivMt).
xc_source_file(a65b1281fa1818,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1818,1057).
xc_kb_names(a65b1281fa1818,[]).
xc_mapping_rows(a65b1281fa1818,[]).
x_arity(x_moveWorkerPermitted,1) :- x_cid(a65b1281fa1819).
xc_microtheory(a65b1281fa1819,x_FreecivMt).
xc_source_file(a65b1281fa1819,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1819,1058).
xc_kb_names(a65b1281fa1819,[]).
xc_mapping_rows(a65b1281fa1819,[]).
x_arg1Isa(x_moveWorkerPermitted,'x_FreeCiv-City') :- x_cid(a65b1281fa181a).
xc_microtheory(a65b1281fa181a,x_FreecivMt).
xc_source_file(a65b1281fa181a,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa181a,1059).
xc_kb_names(a65b1281fa181a,[]).
xc_mapping_rows(a65b1281fa181a,[]).
x_comment(x_moveWorkerPermitted,"(moveWorkerPermitted ?city) succeeds if it's ok to move a worker from one tile to another.") :- x_cid(a65b1281fa181b).
xc_microtheory(a65b1281fa181b,x_FreecivMt).
xc_source_file(a65b1281fa181b,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa181b,1060).
xc_kb_names(a65b1281fa181b,[]).
xc_mapping_rows(a65b1281fa181b,[]).
'x_<=='(x_moveWorkerPermitted(V1),x_numSpecialists(V1,'x_FC-Specialist-Elvis',V2),x_lessThan(V2,1)) :- x_cid(a65b1281fa181c,V1,V2).
xc_microtheory(a65b1281fa181c,x_FreecivMt).
xc_source_file(a65b1281fa181c,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa181c,1062).
xc_kb_names(a65b1281fa181c,["?city","?elvii"]).
xc_mapping_rows(a65b1281fa181c,[]).
'x_<=='(x_moveWorkerPermitted(V1),x_cityIsUnhappy(V1)) :- x_cid(a65b1281fa181d,V1).
xc_microtheory(a65b1281fa181d,x_FreecivMt).
xc_source_file(a65b1281fa181d,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa181d,1066).
xc_kb_names(a65b1281fa181d,["?city"]).
xc_mapping_rows(a65b1281fa181d,[]).
'x_<=='(x_citySupportsUnitOfType(V1,V2,V3),x_unitHomeCity(V3,V1),x_unitType(V3,V2)) :- x_cid(a65b1281fa181e,V1,V2,V3).
xc_microtheory(a65b1281fa181e,x_FreecivMt).
xc_source_file(a65b1281fa181e,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa181e,1069).
xc_kb_names(a65b1281fa181e,["?city","?unitType","?unit"]).
xc_mapping_rows(a65b1281fa181e,[]).
'x_<=='(x_numSupportedUnits(V1,x_FreecivUnitCountFn(V2)),x_evaluate(V2,x_CardinalityFn(x_TheClosedRetrievalSetOf(V3,x_unitHomeCity(V3,V1))))) :- x_cid(a65b1281fa181f,V1,V2,V3).
xc_microtheory(a65b1281fa181f,x_FreecivMt).
xc_source_file(a65b1281fa181f,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa181f,1073).
xc_kb_names(a65b1281fa181f,["?city","?num","?unit"]).
xc_mapping_rows(a65b1281fa181f,[]).
'x_<=='(x_supportedUnitsShieldUpkeep(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_unitHomeCity(V4,V1))),x_unitSetShieldUpkeep(V3,V2)) :- x_cid(a65b1281fa1820,V1,V2,V3,V4).
xc_microtheory(a65b1281fa1820,x_FreecivMt).
xc_source_file(a65b1281fa1820,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1820,1080).
xc_kb_names(a65b1281fa1820,["?city","?upkeep","?unit-set","?unit"]).
xc_mapping_rows(a65b1281fa1820,[]).
'x_<=='(x_unitSetShieldUpkeep(V1,V2),x_different(V1,x_TheSet),x_evaluate(V2,x_PlusAll(V1,x_FunctionToArg(2,x_unitHasShieldUpkeep)))) :- x_cid(a65b1281fa1821,V1,V2).
xc_microtheory(a65b1281fa1821,x_FreecivMt).
xc_source_file(a65b1281fa1821,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1821,1086).
xc_kb_names(a65b1281fa1821,["?unit-set","?shield-upkeep"]).
xc_mapping_rows(a65b1281fa1821,[]).
'x_<=='(x_unitSetShieldUpkeep(x_TheSet,x_ProductionPoints(0))) :- x_cid(a65b1281fa1822).
xc_microtheory(a65b1281fa1822,x_FreecivMt).
xc_source_file(a65b1281fa1822,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1822,1095).
xc_kb_names(a65b1281fa1822,[]).
xc_mapping_rows(a65b1281fa1822,[]).
'x_<=='(x_supportedUnitsFoodUpkeep(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_unitHomeCity(V4,V1))),x_unitSetFoodUpkeep(V3,V2)) :- x_cid(a65b1281fa1823,V1,V2,V3,V4).
xc_microtheory(a65b1281fa1823,x_FreecivMt).
xc_source_file(a65b1281fa1823,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1823,1097).
xc_kb_names(a65b1281fa1823,["?city","?upkeep","?unit-set","?unit"]).
xc_mapping_rows(a65b1281fa1823,[]).
'x_<=='(x_unitSetFoodUpkeep(V1,V2),x_different(V1,x_TheSet),x_evaluate(V2,x_PlusAll(V1,x_FunctionToArg(2,x_unitHasFoodUpkeep)))) :- x_cid(a65b1281fa1824,V1,V2).
xc_microtheory(a65b1281fa1824,x_FreecivMt).
xc_source_file(a65b1281fa1824,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1824,1103).
xc_kb_names(a65b1281fa1824,["?unit-set","?food-upkeep"]).
xc_mapping_rows(a65b1281fa1824,[]).
'x_<=='(x_unitSetFoodUpkeep(x_TheSet,x_FoodPoints(0))) :- x_cid(a65b1281fa1825).
xc_microtheory(a65b1281fa1825,x_FreecivMt).
xc_source_file(a65b1281fa1825,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/fc-inference.krf').
xc_source_line(a65b1281fa1825,1110).
xc_kb_names(a65b1281fa1825,[]).
xc_mapping_rows(a65b1281fa1825,[]).
kb_cache_footer(footer{count:190,digest:de581854723dd5a2e7fd9f6ec804cc2f23f1fad6ef86c29f54bc74b8f91bdbad,headerDigest:'18da929e696e605eafdafe881d0c1d3702d4b4ce50d911861fbcbec78653761a'}).
