:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:38,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:339,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'66df1fa71f1a29185f58d0fad4dded169a6eedc9f894feb27e6f1b9274070311',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:16618,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf',sourceHash:'28216a5158c3a3e1eeb30cbb895e181a5099edf668c5a73f07d6c2273b93fd8a',warnings:[]}).
x_isa(x_GeoscienceRulesMt,x_Microtheory) :- x_cid(a65b126a47d0b4).
xc_microtheory(a65b126a47d0b4,x_GeoscienceFactsMt).
xc_source_file(a65b126a47d0b4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0b4,15).
xc_kb_names(a65b126a47d0b4,[]).
xc_mapping_rows(a65b126a47d0b4,[]).
xc_exclude_globals(a65b126a47d0b4,true).
x_genlMt(x_GeoscienceRulesMt,x_GeoscienceFactsMt) :- x_cid(a65b126a47d0b5).
xc_microtheory(a65b126a47d0b5,x_GeoscienceFactsMt).
xc_source_file(a65b126a47d0b5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0b5,16).
xc_kb_names(a65b126a47d0b5,[]).
xc_mapping_rows(a65b126a47d0b5,[]).
xc_exclude_globals(a65b126a47d0b5,true).
x_isa(x_NuSketchGeoscienceMt,x_Microtheory) :- x_cid(a65b126a47d0b6).
xc_microtheory(a65b126a47d0b6,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0b6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0b6,20).
xc_kb_names(a65b126a47d0b6,[]).
xc_mapping_rows(a65b126a47d0b6,[]).
xc_exclude_globals(a65b126a47d0b6,true).
x_genlMt(x_NuSketchGeoscienceMt,x_GeoscienceRulesMt) :- x_cid(a65b126a47d0b7).
xc_microtheory(a65b126a47d0b7,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0b7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0b7,21).
xc_kb_names(a65b126a47d0b7,[]).
xc_mapping_rows(a65b126a47d0b7,[]).
xc_exclude_globals(a65b126a47d0b7,true).
'x_<=='(x_problemsForPossibleGPT(V1,V2,'x_deposition-GeologicalProcess'),x_propertyOfDepositedObject(V1,V2,V3,V4),x_spatialPositionOfDepositedObject(V1,V2,V3,V4),x_rccRelationOfDepositedObject(V1,V2,V3,V4),x_glyphRepresentsRelation(V5,'x_deposition-GeologicalProcess'),'x_deposition-GeologicalProcess'(V1,V2)) :- x_cid(a65b126a47d0b8,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0b8,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0b8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0b8,26).
xc_kb_names(a65b126a47d0b8,["?b","?a","?r1","?r2","?r-glyph"]).
xc_mapping_rows(a65b126a47d0b8,[]).
xc_exclude_globals(a65b126a47d0b8,true).
'x_<=='(x_propertyOfDepositedObject(V1,V2,V3,V4),'x_ist-Information'(V1,x_isa(V3,x_GeologicalRockUnit)),'x_ist-Information'(V2,x_isa(V3,x_GeologicalRockUnit)),'x_ist-Information'(V2,x_isa(V4,x_GeologicalRockUnit)),x_different(V3,V4)) :- x_cid(a65b126a47d0b9,V1,V2,V3,V4).
xc_microtheory(a65b126a47d0b9,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0b9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0b9,33).
xc_kb_names(a65b126a47d0b9,["?b","?a","?r1","?r2"]).
xc_mapping_rows(a65b126a47d0b9,[]).
xc_exclude_globals(a65b126a47d0b9,true).
'x_<=='(x_spatialPositionOfDepositedObject(V1,V2,V3,V4),x_uninferredSentence('x_ist-Information'(V1,x_isa(V4,x_GeologicalRockUnit))),x_uninferredSentence('x_ist-Information'(V1,x_above(V5,V3))),'x_ist-Information'(V2,x_above(V4,V3)),x_uninferredSentence('x_ist-Information'(V2,x_above(V6,V4)))) :- x_cid(a65b126a47d0ba,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126a47d0ba,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0ba,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0ba,39).
xc_kb_names(a65b126a47d0ba,["?b","?a","?r1","?r2","?r_b","?r_a"]).
xc_mapping_rows(a65b126a47d0ba,[]).
xc_exclude_globals(a65b126a47d0ba,true).
'x_<=='(x_rccRelationOfDepositedObject(V1,V2,V3,V4),'x_ist-Information'(V2,x_glyphRepresentsObject(V5,V3)),'x_ist-Information'(V2,x_glyphRepresentsObject(V6,V4)),x_or('x_ist-Information'(V2,'x_rcc8-PO'(V6,V5)),'x_ist-Information'(V2,'x_rcc8-EC'(V6,V5)))) :- x_cid(a65b126a47d0bb,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126a47d0bb,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0bb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0bb,45).
xc_kb_names(a65b126a47d0bb,["?b","?a","?r1","?r2","?r1-glyph","?r2-glyph"]).
xc_mapping_rows(a65b126a47d0bb,[]).
xc_exclude_globals(a65b126a47d0bb,true).
'x_<=='(x_existSeperatedRock(V1,V2),'x_ist-Information'(V1,x_nameString(V2,V3)),'x_ist-Information'(V1,x_nameString(V4,V5)),x_different(V2,V4),x_equalp(V3,V5)) :- x_cid(a65b126a47d0bc,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0bc,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0bc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0bc,51).
xc_kb_names(a65b126a47d0bc,["?s","?r","?name","?r2","?name2"]).
xc_mapping_rows(a65b126a47d0bc,[]).
xc_exclude_globals(a65b126a47d0bc,true).
'x_<=='(x_geologicalProcessLeadingTo(V1,V2),'x_ist-Information'(V1,x_isa(V3,x_SedimentaryRock)),x_uninferredSentence('x_ist-Information'(V1,x_above(V4,V3))),x_uninferredSentence(x_existSeperatedRock(V1,V3)),'x_ist-Information'(V1,x_glyphRepresentsObject(V5,V3)),x_uninferredSentence('x_ist-Information'(V1,x_blobIntersectsConvexHull(V6,V5))),'x_ist-Information'(V1,'x_q-2D-orientation'(V5,1,0)),x_evaluate(V7,x_TheClosedRetrievalSetOf(V8,x_and('x_ist-Information'(V1,x_isa(V8,x_GeologicalRockUnit)),'x_ist-Information'(V1,x_above(V3,V8)),x_rccRelationOfDepositedObject(V9,V1,V3,V8),'x_ist-Information'(V1,x_glyphRepresentsObject(V10,V8)),x_uninferredSentence('x_ist-Information'(V1,x_blobIntersectsConvexHull(V5,V10))),x_uninferredSentence('x_ist-Information'(V1,x_blobIntersectsConvexHull(V10,V5)))))),x_uninferredSentence(x_setEmpty(V7)),x_unifies(V2,'x_Deposition-GeoProcessFn'(V3,V7))) :- x_cid(a65b126a47d0bd,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b126a47d0bd,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0bd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0bd,58).
xc_kb_names(a65b126a47d0bd,["?after","?proc","?r","?r-no","?r-glyph","?rno-glyph","?set","?r-s","?b","?rs-glyph"]).
xc_mapping_rows(a65b126a47d0bd,[]).
xc_exclude_globals(a65b126a47d0bd,true).
'x_<=='(x_geologicalProcessCausing(V1,V2,V3),x_geologicalProcessLeadingTo(V2,V3),x_unifies(V3,'x_Deposition-GeoProcessFn'(V4,V5)),x_tell(x_uninferredSentence('x_ist-Information'(V1,x_isa(V4,x_SedimentaryRock)))),x_iterateSetElement(V5,V3,V1)) :- x_cid(a65b126a47d0be,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0be,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0be,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0be,79).
xc_kb_names(a65b126a47d0be,["?before","?after","?proc","?r","?set"]).
xc_mapping_rows(a65b126a47d0be,[]).
xc_exclude_globals(a65b126a47d0be,true).
'x_<=='(x_tellFacts(V1,V2,V3),x_unifies(V3,'x_Deposition-GeoProcessFn'(V4,V5)),x_tell('x_ist-Information'(V1,x_isa(V2,x_GeologicalRockUnit))),x_tell(x_uninferredSentence('x_ist-Information'(V1,x_above(V4,V2))))) :- x_cid(a65b126a47d0bf,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0bf,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0bf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0bf,86).
xc_kb_names(a65b126a47d0bf,["?before","?ele","?proc","?r","?set"]).
xc_mapping_rows(a65b126a47d0bf,[]).
xc_exclude_globals(a65b126a47d0bf,true).
'x_<=='(x_geologicalProcessCausingChanges(V1,V2,V3,V4),x_geologicalProcessLeadingTo(V2,V3),x_unifies(V3,'x_Deposition-GeoProcessFn'(V5,V6)),x_unifies(V4,x_TheSet(x_removeRock(V1,V5)))) :- x_cid(a65b126a47d0c0,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126a47d0c0,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c0,92).
xc_kb_names(a65b126a47d0c0,["?before","?after","?proc","?changes","?r","?set"]).
xc_mapping_rows(a65b126a47d0c0,[]).
xc_exclude_globals(a65b126a47d0c0,true).
'x_<=='(x_problemsForPossibleGPT(V1,V2,'x_faulting-GeologicalProcess'),x_propertyOfFaultingObject(V1,V2,V3,V4,V5),x_spatialPositionOfFaultingObject(V1,V2,V3,V4,V5),x_nameStringOfFaultingObject(V1,V2,V4,V5),x_glyphRepresentsRelation(V6,'x_faulting-GeologicalProcess'),'x_faulting-GeologicalProcess'(V1,V2)) :- x_cid(a65b126a47d0c1,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126a47d0c1,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c1,101).
xc_kb_names(a65b126a47d0c1,["?b","?a","?f","?r1","?r2","?r-glyph"]).
xc_mapping_rows(a65b126a47d0c1,[]).
xc_exclude_globals(a65b126a47d0c1,true).
'x_<=='(x_propertyOfFaultingObject(V1,V2,V3,V4,V5),'x_ist-Information'(V2,x_isa(V3,'x_Fault-Topographical')),x_uninferredSentence('x_ist-Information'(V1,x_isa(V3,'x_Fault-Topographical')))) :- x_cid(a65b126a47d0c2,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0c2,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c2,108).
xc_kb_names(a65b126a47d0c2,["?b","?a","?f","?r1","?r2"]).
xc_mapping_rows(a65b126a47d0c2,[]).
xc_exclude_globals(a65b126a47d0c2,true).
'x_<=='(x_spatialPositionOfFaultingObject(V1,V2,V3,V4,V5),'x_ist-Information'(V2,x_isa(V3,'x_Fault-Topographical')),'x_ist-Information'(V2,x_rightOf(V4,V3)),'x_ist-Information'(V2,x_rightOf(V3,V5))) :- x_cid(a65b126a47d0c3,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0c3,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c3,113).
xc_kb_names(a65b126a47d0c3,["?b","?a","?f","?r1","?r2"]).
xc_mapping_rows(a65b126a47d0c3,[]).
xc_exclude_globals(a65b126a47d0c3,true).
'x_<=='(x_nameStringOfFaultingObject(V1,V2,V3,V4),'x_ist-Information'(V1,x_isa(V5,x_GeologicalRockUnit)),'x_ist-Information'(V1,x_nameString(V5,V6)),'x_ist-Information'(V2,x_isa(V3,x_GeologicalRockUnit)),'x_ist-Information'(V2,x_isa(V4,x_GeologicalRockUnit)),'x_ist-Information'(V2,x_nameString(V3,V6)),'x_ist-Information'(V2,x_nameString(V4,V7)),x_equalp(V6,V7),x_different(V3,V4)) :- x_cid(a65b126a47d0c4,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b126a47d0c4,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c4,118).
xc_kb_names(a65b126a47d0c4,["?b","?a","?r1","?r2","?r","?name1","?name2"]).
xc_mapping_rows(a65b126a47d0c4,[]).
xc_exclude_globals(a65b126a47d0c4,true).
'x_<=='(x_geologicalProcessLeadingTo(V1,V2),'x_ist-Information'(V1,x_isa(V3,'x_Fault-Topographical')),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_and(x_separatedRocksByFaultOrRock(V1,V6,V7,V3),x_evaluate(V5,t(V6,V7))))),x_uninferredSentence(x_setEmpty(V4)),x_unifies(V2,'x_Faulting-GeoProcessFn'(V3,V4))) :- x_cid(a65b126a47d0c5,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b126a47d0c5,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c5,129).
xc_kb_names(a65b126a47d0c5,["?after","?proc","?f","?set","?r-set","?r1","?r2"]).
xc_mapping_rows(a65b126a47d0c5,[]).
xc_exclude_globals(a65b126a47d0c5,true).
'x_<=='(x_geologicalProcessCausing(V1,V2,V3),x_geologicalProcessLeadingTo(V2,V3),'x_ist-Information'(V2,x_nameString(V4,V5)),'x_ist-Information'(V2,x_nameString(V6,V7)),x_equalp(V5,V7),x_unifies(V3,'x_Faulting-GeoProcessFn'(V8,V9)),x_unifies(V1,x_StateBeforeFn(V2,'x_Faulting-GeoProcessFn'(V8,V9))),x_tell('x_ist-Information'(V1,x_isa(V10,x_SedimentaryRock))),x_tell('x_ist-Information'(V1,x_nameString(V10,V5)))) :- x_cid(a65b126a47d0c6,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b126a47d0c6,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c6,137).
xc_kb_names(a65b126a47d0c6,["?before","?after","?proc","?r1","?name1","?r2","?name2","?f","?set","?r"]).
xc_mapping_rows(a65b126a47d0c6,[]).
xc_exclude_globals(a65b126a47d0c6,true).
'x_<=='(x_geologicalProcessCausingChanges(V1,V2,V3,V4),x_geologicalProcessLeadingTo(V2,V3),x_unifies(V3,'x_Faulting-GeoProcessFn'(V5,V6)),x_unifies(V4,x_TheSet(x_removeFault(V1,V5),x_mergeRocks(V1,V6)))) :- x_cid(a65b126a47d0c7,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126a47d0c7,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c7,148).
xc_kb_names(a65b126a47d0c7,["?before","?after","?proc","?changes","?f","?set"]).
xc_mapping_rows(a65b126a47d0c7,[]).
xc_exclude_globals(a65b126a47d0c7,true).
'x_<=='(x_problemsForPossibleGPT(V1,V2,'x_tilting-GeologicalProcess'),'x_ist-Information'(V1,x_isa(V3,x_GeologicalRockUnit)),'x_ist-Information'(V2,x_isa(V3,x_GeologicalRockUnit)),x_existTiltingBetween(V3,V1,V2),x_glyphRepresentsRelation(V4,'x_tilting-GeologicalProcess'),'x_tilting-GeologicalProcess'(V1,V2)) :- x_cid(a65b126a47d0c8,V1,V2,V3,V4).
xc_microtheory(a65b126a47d0c8,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c8,157).
xc_kb_names(a65b126a47d0c8,["?b","?a","?obj","?r-glyph"]).
xc_mapping_rows(a65b126a47d0c8,[]).
xc_exclude_globals(a65b126a47d0c8,true).
'x_<=='(x_existTiltingBetween(V1,V2,V3),'x_ist-Information'(V2,x_glyphRepresentsObject(V4,V1)),'x_ist-Information'(V3,x_glyphRepresentsObject(V5,V1)),x_or(x_and('x_ist-Information'(V2,'x_q-2D-orientation'(V4,1,0)),'x_ist-Information'(V3,'x_q-2D-orientation'(V5,1,1))),x_and('x_ist-Information'(V2,'x_q-2D-orientation'(V4,1,0)),'x_ist-Information'(V3,'x_q-2D-orientation'(V5,1,-1))),x_and('x_ist-Information'(V2,'x_q-2D-orientation'(V4,1,1)),'x_ist-Information'(V3,'x_q-2D-orientation'(V5,1,0))),x_and('x_ist-Information'(V2,'x_q-2D-orientation'(V4,1,-1)),'x_ist-Information'(V3,'x_q-2D-orientation'(V5,1,0))),x_and('x_ist-Information'(V2,'x_q-2D-orientation'(V4,1,1)),'x_ist-Information'(V3,'x_q-2D-orientation'(V5,1,-1))),x_and('x_ist-Information'(V2,'x_q-2D-orientation'(V4,1,-1)),'x_ist-Information'(V3,'x_q-2D-orientation'(V5,1,1))))) :- x_cid(a65b126a47d0c9,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0c9,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0c9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0c9,164).
xc_kb_names(a65b126a47d0c9,["?obj","?b","?a","?objb-glyph","?obja-glyph"]).
xc_mapping_rows(a65b126a47d0c9,[]).
xc_exclude_globals(a65b126a47d0c9,true).
'x_<=='(x_geologicalProcessLeadingTo(V1,V2),'x_ist-Information'(V1,x_isa(V3,x_GeologicalRockUnit)),x_uninferredSentence('x_ist-Information'(V1,x_above(V4,V3))),'x_ist-Information'(V1,x_glyphRepresentsObject(V5,V3)),x_uninferredSentence('x_ist-Information'(V1,'x_q-2D-orientation'(V5,1,0))),'x_ist-Information'(V1,'x_q-2D-orientation'(V5,V6,V7)),x_evaluate(V8,x_TheClosedRetrievalSetOf(V9,x_and('x_ist-Information'(V1,x_isa(V9,x_GeologicalRockUnit)),'x_ist-Information'(V1,x_glyphRepresentsObject(V10,V9)),x_uninferredSentence('x_ist-Information'(V1,'x_q-2D-orientation'(V10,1,0))),'x_ist-Information'(V1,'x_q-2D-orientation'(V10,V6,V7))))),x_uninferredSentence(x_setEmpty(V8)),x_unifies(V2,'x_Tilting-GeoProcessFn'(V8,V6,V7))) :- x_cid(a65b126a47d0ca,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b126a47d0ca,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0ca,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0ca,181).
xc_kb_names(a65b126a47d0ca,["?after","?proc","?r","?r-no","?r-glyph","?x","?y","?set","?r-s","?rs-glyph"]).
xc_mapping_rows(a65b126a47d0ca,[]).
xc_exclude_globals(a65b126a47d0ca,true).
'x_<=='(x_geologicalProcessCausing(V1,V2,V3),x_geologicalProcessLeadingTo(V2,V3),x_unifies(V3,'x_Tilting-GeoProcessFn'(V4,V5,V6)),x_unifies(V1,x_StateBeforeFn(V2,'x_Tilting-GeoProcessFn'(V7,V5,V6))),x_tell('x_ist-Information'(V1,x_isa(V4,x_SedimentaryRock))),x_tell('x_ist-Information'(V1,x_glyphRepresentsObject(V8,V4))),x_tell('x_ist-Information'(V1,'x_q-2D-orientation'(V8,1,0)))) :- x_cid(a65b126a47d0cb,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b126a47d0cb,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0cb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0cb,196).
xc_kb_names(a65b126a47d0cb,["?before","?after","?proc","?r","?x","?y","?set","?rb-glyph"]).
xc_mapping_rows(a65b126a47d0cb,[]).
xc_exclude_globals(a65b126a47d0cb,true).
'x_<=='(x_geologicalProcessCausingChanges(V1,V2,V3,V4),x_geologicalProcessLeadingTo(V2,V3),x_unifies(V3,'x_Tilting-GeoProcessFn'(V5,V6,V7)),x_unifies(V4,x_TheSet(x_rotateRockToHorizon(V1,V5),x_reshapeRocks(V1,V5)))) :- x_cid(a65b126a47d0cc,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b126a47d0cc,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0cc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0cc,205).
xc_kb_names(a65b126a47d0cc,["?before","?after","?proc","?changes","?set","?x","?y"]).
xc_mapping_rows(a65b126a47d0cc,[]).
xc_exclude_globals(a65b126a47d0cc,true).
'x_<=='(x_problemsForPossibleGPT(V1,V2,'x_erosion-GeologicalProcess'),'x_ist-Information'(V1,x_isa(V3,x_GeologicalRockUnit)),'x_ist-Information'(V2,x_isa(V3,x_GeologicalRockUnit)),x_relativeSizeDecrease(V1,V2,V3),x_uninferredSentence('x_ist-Information'(V2,x_above(V4,V3))),x_glyphRepresentsRelation(V5,'x_erosion-GeologicalProcess'),'x_erosion-GeologicalProcess'(V1,V2)) :- x_cid(a65b126a47d0cd,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0cd,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0cd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0cd,214).
xc_kb_names(a65b126a47d0cd,["?b","?a","?obj","?obj_a","?r-glyph"]).
xc_mapping_rows(a65b126a47d0cd,[]).
xc_exclude_globals(a65b126a47d0cd,true).
'x_<=='(x_relativeSizeDecrease(V1,V2,V3),x_and('x_ist-Information'(V1,x_areaOfObject(V3,V4)),'x_ist-Information'(V1,x_evaluate(V5,x_ValueFromUnitsFn(V4)))),x_and('x_ist-Information'(V2,x_areaOfObject(V3,V6)),'x_ist-Information'(V2,x_evaluate(V7,x_ValueFromUnitsFn(V6)))),x_alphalessp(V7,V5)) :- x_cid(a65b126a47d0ce,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b126a47d0ce,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0ce,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0ce,222).
xc_kb_names(a65b126a47d0ce,["?b","?a","?obj","?val1","?area1","?val2","?area2"]).
xc_mapping_rows(a65b126a47d0ce,[]).
xc_exclude_globals(a65b126a47d0ce,true).
'x_<=='(x_geologicalProcessLeadingTo(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_and('x_ist-Information'(V1,x_isa(V4,x_GeologicalRockUnit)),x_uninferredSentence('x_ist-Information'(V1,x_above(V5,V4)))))),x_uninferredSentence(x_setEmpty(V3)),x_unifies(V2,'x_Erosion-GeoProcessFn'(V3))) :- x_cid(a65b126a47d0cf,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0cf,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0cf,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0cf,230).
xc_kb_names(a65b126a47d0cf,["?after","?proc","?set","?r-s","?r-no"]).
xc_mapping_rows(a65b126a47d0cf,[]).
xc_exclude_globals(a65b126a47d0cf,true).
'x_<=='(x_geologicalProcessCausingChanges(V1,V2,V3,V4),x_geologicalProcessLeadingTo(V2,V3),x_unifies(V3,'x_Erosion-GeoProcessFn'(V5)),x_unifies(V4,x_TheSet(x_increaseRockHeight(V1,V5)))) :- x_cid(a65b126a47d0d0,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0d0,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d0,247).
xc_kb_names(a65b126a47d0d0,["?before","?after","?proc","?changes","?set"]).
xc_mapping_rows(a65b126a47d0d0,[]).
xc_exclude_globals(a65b126a47d0d0,true).
'x_<=='(x_problemsForPossibleGPT(V1,V2,'x_intrusion-GeologicalProcess'),'x_ist-Information'(V2,x_isa(V3,x_IgneousRock)),x_uninferredSentence('x_ist-Information'(V1,x_isa(V3,x_IgneousRock))),x_existIntrusionIn(V3,V2),x_glyphRepresentsRelation(V4,'x_intrusion-GeologicalProcess'),'x_intrusion-GeologicalProcess'(V1,V2)) :- x_cid(a65b126a47d0d1,V1,V2,V3,V4).
xc_microtheory(a65b126a47d0d1,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d1,255).
xc_kb_names(a65b126a47d0d1,["?b","?a","?ir","?r-glyph"]).
xc_mapping_rows(a65b126a47d0d1,[]).
xc_exclude_globals(a65b126a47d0d1,true).
'x_<=='(x_existIntrusionIn(V1,V2),'x_ist-Information'(V2,x_isa(V3,x_GeologicalRockUnit)),'x_ist-Information'(V2,x_isa(V4,x_GeologicalRockUnit)),'x_ist-Information'(V2,x_nameString(V3,V5)),'x_ist-Information'(V2,x_nameString(V4,V6)),x_equalp(V5,V6),'x_ist-Information'(V2,x_rightOf(V3,V1)),'x_ist-Information'(V2,x_rightOf(V1,V4))) :- x_cid(a65b126a47d0d2,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126a47d0d2,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d2,262).
xc_kb_names(a65b126a47d0d2,["?ir","?s","?r1","?r2","?name1","?name2"]).
xc_mapping_rows(a65b126a47d0d2,[]).
xc_exclude_globals(a65b126a47d0d2,true).
'x_<=='(x_geologicalProcessLeadingTo(V1,V2),'x_ist-Information'(V1,x_isa(V3,x_IgneousRock)),'x_ist-Information'(V1,x_glyphRepresentsObject(V4,V3)),x_evaluate(V5,x_TheClosedRetrievalSetOf(V6,x_and('x_ist-Information'(V1,x_isa(V6,x_GeologicalRockUnit)),x_different(V3,V6),'x_ist-Information'(V1,x_glyphRepresentsObject(V7,V6)),'x_ist-Information'(V1,x_blobIntersectsConvexHull(V4,V7)),x_uninferredSentence(x_separatedRocksByFaultOrRock(V1,V6,V8,V3)),x_uninferredSentence(x_separatedRocksByFaultOrRock(V1,V9,V6,V3))))),x_uninferredSentence(x_setEmpty(V5)),x_unifies(V2,'x_Intrusion-GeoProcessFn'(V3,V5))) :- x_cid(a65b126a47d0d3,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b126a47d0d3,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d3,271).
xc_kb_names(a65b126a47d0d3,["?after","?proc","?r","?r-glyph","?set","?r-s","?rs-glyph","?r2","?r1"]).
xc_mapping_rows(a65b126a47d0d3,[]).
xc_exclude_globals(a65b126a47d0d3,true).
'x_<=='(x_geologicalProcessLeadingTo(V1,V2),'x_ist-Information'(V1,x_isa(V3,x_IgneousRock)),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_and(x_separatedRocksByFaultOrRock(V1,V6,V7,V3),x_evaluate(V5,t(V6,V7))))),x_uninferredSentence(x_setEmpty(V4)),x_unifies(V2,'x_Intrusion-GeoProcessFn'(V3,V4))) :- x_cid(a65b126a47d0d4,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b126a47d0d4,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d4,285).
xc_kb_names(a65b126a47d0d4,["?after","?proc","?r","?set","?r-set","?r1","?r2"]).
xc_mapping_rows(a65b126a47d0d4,[]).
xc_exclude_globals(a65b126a47d0d4,true).
'x_<=='(x_geologicalProcessCausingChanges(V1,V2,V3,V4),x_geologicalProcessLeadingTo(V2,V3),x_unifies(V3,'x_Intrusion-GeoProcessFn'(V5,V6)),x_unifies(V4,x_TheSet(x_removeRock(V1,V5),x_mergeRocks(V1,V6)))) :- x_cid(a65b126a47d0d5,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126a47d0d5,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d5,304).
xc_kb_names(a65b126a47d0d5,["?before","?after","?proc","?changes","?r","?set"]).
xc_mapping_rows(a65b126a47d0d5,[]).
xc_exclude_globals(a65b126a47d0d5,true).
'x_<=='(x_setEmpty(V1),x_evaluate(0,x_CardinalityFn(V1))) :- x_cid(a65b126a47d0d6,V1).
xc_microtheory(a65b126a47d0d6,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d6,312).
xc_kb_names(a65b126a47d0d6,["?x"]).
xc_mapping_rows(a65b126a47d0d6,[]).
xc_exclude_globals(a65b126a47d0d6,true).
'x_<=='(x_separatedRocksByFaultOrRock(V1,V2,V3,V4),'x_ist-Information'(V1,x_isa(V2,x_SedimentaryRock)),'x_ist-Information'(V1,x_isa(V3,x_SedimentaryRock)),'x_ist-Information'(V1,x_rightOf(V3,V4)),'x_ist-Information'(V1,x_rightOf(V4,V2)),'x_ist-Information'(V1,x_nameString(V2,V5)),'x_ist-Information'(V1,x_nameString(V3,V6)),x_equalp(V5,V6),x_different(V2,V3)) :- x_cid(a65b126a47d0d7,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126a47d0d7,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d7,315).
xc_kb_names(a65b126a47d0d7,["?after","?r1","?r2","?rf","?name1","?name2"]).
xc_mapping_rows(a65b126a47d0d7,[]).
xc_exclude_globals(a65b126a47d0d7,true).
'x_<=='(x_iterateSetElement(V1,V2,V3),x_equals(V1,x_TheSet)) :- x_cid(a65b126a47d0d8,V1,V2,V3).
xc_microtheory(a65b126a47d0d8,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d8,325).
xc_kb_names(a65b126a47d0d8,["?set","?proc","?before"]).
xc_mapping_rows(a65b126a47d0d8,[]).
xc_exclude_globals(a65b126a47d0d8,true).
'x_<=='(x_iterateSetElement(V1,V2,V3),x_different(V1,x_TheSet),x_natArgument(V1,1,V4),x_tellFacts(V3,V4,V2),x_evaluate(V5,x_SetMinusFn(V1,V4)),x_iterateSetElement(V5,V2,V3)) :- x_cid(a65b126a47d0d9,V1,V2,V3,V4,V5).
xc_microtheory(a65b126a47d0d9,x_GeoscienceRulesMt).
xc_source_file(a65b126a47d0d9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/NWU/geoscience/geo-rules.krf').
xc_source_line(a65b126a47d0d9,328).
xc_kb_names(a65b126a47d0d9,["?set","?proc","?before","?ele","?cdr"]).
xc_mapping_rows(a65b126a47d0d9,[]).
xc_exclude_globals(a65b126a47d0d9,true).
kb_cache_footer(footer{count:38,digest:'66df1fa71f1a29185f58d0fad4dded169a6eedc9f894feb27e6f1b9274070311',headerDigest:'1cdb9e02bab6329500e2baf7ca32456441ec7cfa74b3ea8987ef10296f25ec50'}).
