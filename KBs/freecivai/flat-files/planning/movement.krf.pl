:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:13,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:93,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:dca1db0ecc04356424380f5433a8c951b6fc829c62e1f2d49aeb348827e81a97,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3130,source:'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf',sourceHash:'08edd17c57a925b2da1fd5aa59efceb2512bd2a91c1534b57e53120e157c436f',warnings:[]}).
x_isa(x_simplestTravelPlan,x_ComplexActionPredicate) :- x_cid(a65b12827866e0).
xc_microtheory(a65b12827866e0,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e0,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e0,10).
xc_kb_names(a65b12827866e0,[]).
xc_mapping_rows(a65b12827866e0,[]).
x_arity(x_simplestTravelPlan,2) :- x_cid(a65b12827866e1).
xc_microtheory(a65b12827866e1,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e1,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e1,11).
xc_kb_names(a65b12827866e1,[]).
xc_mapping_rows(a65b12827866e1,[]).
x_arg1Isa(x_simplestTravelPlan,'x_FreeCiv-Unit') :- x_cid(a65b12827866e2).
xc_microtheory(a65b12827866e2,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e2,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e2,12).
xc_kb_names(a65b12827866e2,[]).
xc_mapping_rows(a65b12827866e2,[]).
x_arg2Isa(x_simplestTravelPlan,'x_SpatialThing-Localized') :- x_cid(a65b12827866e3).
xc_microtheory(a65b12827866e3,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e3,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e3,13).
xc_kb_names(a65b12827866e3,[]).
xc_mapping_rows(a65b12827866e3,[]).
x_comment(x_simplestTravelPlan,"(simplestTravelPlan ?unit ?dest) chooses between no-op, doMove and doGoToDest.") :- x_cid(a65b12827866e4).
xc_microtheory(a65b12827866e4,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e4,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e4,14).
xc_kb_names(a65b12827866e4,[]).
xc_mapping_rows(a65b12827866e4,[]).
'x_<=='(x_complexTaskAchieves(V1,x_AchieveFn(x_fcObjectAt(V1,V2)),x_simplestTravelPlan(V1,V2))) :- x_cid(a65b12827866e5,V1,V2).
xc_microtheory(a65b12827866e5,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e5,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e5,16).
xc_kb_names(a65b12827866e5,["?actor","?loc"]).
xc_mapping_rows(a65b12827866e5,[]).
'x_<=='(x_complexTaskAchieves(V1,x_AchieveFn(x_objectFoundInLocation(V1,V2)),x_achieve(x_objectFoundInLocation(V1,V2)))) :- x_cid(a65b12827866e6,V1,V2).
xc_microtheory(a65b12827866e6,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e6,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e6,26).
xc_kb_names(a65b12827866e6,["?actor","?place"]).
xc_mapping_rows(a65b12827866e6,[]).
x_preconditionForMethod(x_behaviorCapable(V1,x_doMove),x_methodForAction(x_achieve(x_objectFoundInLocation(V1,x_FreecivLocationFn(V2,V3))),x_actionSequence(x_TheList(x_simplestTravelPlan(V1,x_FreecivLocationFn(V2,V3)))))) :- x_cid(a65b12827866e7,V1,V2,V3).
xc_microtheory(a65b12827866e7,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e7,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e7,30).
xc_kb_names(a65b12827866e7,["?unit","?x","?y"]).
xc_mapping_rows(a65b12827866e7,[]).
x_preconditionForMethod(x_and(x_fcObjectAt(V1,V2),x_behaviorCapable(V3,x_doMove)),x_methodForAction(x_achieve(x_objectFoundInLocation(V3,V1)),x_actionSequence(x_TheList(x_simplestTravelPlan(V3,V2))))) :- x_cid(a65b12827866e8,V1,V2,V3).
xc_microtheory(a65b12827866e8,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e8,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e8,38).
xc_kb_names(a65b12827866e8,["?dest","?loc","?unit"]).
xc_mapping_rows(a65b12827866e8,[]).
'x_<=='(x_preferInContext(x_achieve(x_objectFoundInLocation(V1,V2)),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b12827866e9,V1,V2,V3,V4).
xc_microtheory(a65b12827866e9,x_FreecivPlanningDomain).
xc_source_file(a65b12827866e9,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866e9,47).
xc_kb_names(a65b12827866e9,["?unit","?loc","?seq1","?seq2"]).
xc_mapping_rows(a65b12827866e9,[]).
x_preconditionForMethod(x_and(x_fcExecutionContext(V1),'x_ist-Information'(V1,x_fcObjectAt(V2,V3)),x_equals(V3,V4)),x_methodForAction(x_simplestTravelPlan(V2,V4),x_actionSequence(x_TheList))) :- x_cid(a65b12827866ea,V1,V2,V3,V4).
xc_microtheory(a65b12827866ea,x_FreecivPlanningDomain).
xc_source_file(a65b12827866ea,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866ea,54).
xc_kb_names(a65b12827866ea,["?mt","?unit","?start","?dest"]).
xc_mapping_rows(a65b12827866ea,[]).
x_preconditionForMethod(x_and(x_fcExecutionContext(V1),'x_ist-Information'(V1,x_fcObjectAt(V2,V3)),'x_ist-Information'(V1,x_fcDistance(V3,V4,V5)),x_equals(V5,1),x_terrainAt(V4,V6),x_canTravelOn(V2,V6)),x_methodForAction(x_simplestTravelPlan(V2,V4),x_actionSequence(x_TheList(x_doMove(V2,V4))))) :- x_cid(a65b12827866eb,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12827866eb,x_FreecivPlanningDomain).
xc_source_file(a65b12827866eb,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866eb,64).
xc_kb_names(a65b12827866eb,["?mt","?unit","?start","?dest","?dist","?terrain"]).
xc_mapping_rows(a65b12827866eb,[]).
x_preconditionForMethod(x_and(x_fcExecutionContext(V1),'x_ist-Information'(V1,x_fcObjectAt(V2,V3)),'x_ist-Information'(V1,x_fcDistance(V3,V4,V5)),x_greaterThan(V5,1),x_pathFromTo(V2,V4,V6)),x_methodForAction(x_simplestTravelPlan(V2,V4),x_actionSequence(x_TheList(x_doGoToDest(V2,V4,V6),x_doWait(V2,x_fcObjectAt(V2,V4)))))) :- x_cid(a65b12827866ec,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12827866ec,x_FreecivPlanningDomain).
xc_source_file(a65b12827866ec,'c:/snet/petta/repos/openworld_dr/KBs/freecivai/flat-files/planning/movement.krf').
xc_source_line(a65b12827866ec,79).
xc_kb_names(a65b12827866ec,["?mt","?unit","?start","?dest","?dist","?plan"]).
xc_mapping_rows(a65b12827866ec,[]).
kb_cache_footer(footer{count:13,digest:dca1db0ecc04356424380f5433a8c951b6fc829c62e1f2d49aeb348827e81a97,headerDigest:d93f03b3e7c23362292ba563c1f4aa4d98cb1c5cb9c22575a5e393df431424d8}).
