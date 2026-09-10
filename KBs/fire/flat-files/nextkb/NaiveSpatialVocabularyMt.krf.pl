:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:20,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:36,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:b32674d1549caf2c98dc017bcf6edaf35f1cb3a1555f6c2845b10d6081a31590,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2518,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf',sourceHash:'1ed50d62048ae595ef32c072a7d1225dc434512c071b31dd0be1afbc0066410f',warnings:[]}).
x_negationPreds('x_above-Indirectly','x_above-Directly') :- x_cid(a65b12759b6810).
xc_microtheory(a65b12759b6810,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6810,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6810,3).
xc_kb_names(a65b12759b6810,[]).
xc_mapping_rows(a65b12759b6810,[]).
x_argFormat('x_touches-Externally',1,x_SetTheFormat) :- x_cid(a65b12759b6811).
xc_microtheory(a65b12759b6811,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6811,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6811,4).
xc_kb_names(a65b12759b6811,[]).
xc_mapping_rows(a65b12759b6811,[]).
x_argFormat('x_touches-Externally',2,x_SetTheFormat) :- x_cid(a65b12759b6812).
xc_microtheory(a65b12759b6812,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6812,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6812,5).
xc_kb_names(a65b12759b6812,[]).
xc_mapping_rows(a65b12759b6812,[]).
x_argFormat(x_sheetSurfaceConnected,1,x_SetTheFormat) :- x_cid(a65b12759b6813).
xc_microtheory(a65b12759b6813,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6813,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6813,6).
xc_kb_names(a65b12759b6813,[]).
xc_mapping_rows(a65b12759b6813,[]).
x_argFormat(x_sheetSurfaceConnected,2,x_SetTheFormat) :- x_cid(a65b12759b6814).
xc_microtheory(a65b12759b6814,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6814,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6814,7).
xc_kb_names(a65b12759b6814,[]).
xc_mapping_rows(a65b12759b6814,[]).
x_comment('x_nextToLike-Horizontally',"A #$RelativeLocationalPredicate and specialization of #$nextToLikeObjects (q.v.).  (#$nextToLike-Horizontally OBJ1 OBJ2 TYPE) is true just in case (#$nextToLikeObjects OBJ1 OBJ2 TYPE) and, additionally, the bottom of OBJ1 is not #$above-Generally the top of OBJ2, or vice versa.  In other words, OBJ1 and OBJ2 are members of an #$ArrangementOfLikeObjects (q.v.) whose elements are arranged along a roughly horizontal axis.") :- x_cid(a65b12759b6815).
xc_microtheory(a65b12759b6815,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6815,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6815,8).
xc_kb_names(a65b12759b6815,[]).
xc_mapping_rows(a65b12759b6815,[]).
x_comment(x_lateralShiftFootprintRegion,"A predicate relating an object to the space it would occupy\nif it shifted one entire footprint to the left or right.\n(#$lateralShiftRegion STHING DIRFN LAT-REGION) means that the\n#$GeographicalRegion LAT-REGION is adjacent to (#$FootprintOfObjectFn\nSTHING) in the direction denoted by (DIRFN STHING), and has the same\narea as (#$FootprintOfObjectFn STHING).  If STHING were to shift one\nfootprint in that direction, it would occupy LAT-REGION.") :- x_cid(a65b12759b6816).
xc_microtheory(a65b12759b6816,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6816,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6816,9).
xc_kb_names(a65b12759b6816,[]).
xc_mapping_rows(a65b12759b6816,[]).
x_comment(x_FootprintOfLateralShiftFn,"(#$FootprintOfLateralShiftFn STHING DIRFN) denotes the region\nLAT-REGION adjacent to the current (#$FootprintOfObjectFn STHING) in the direction denoted by (DIRFN ?STHING) by one footprint. For example,\n(#$FootprintOfLateralShiftFn #$TheWhiteHouse #$LeftwardsFn) denotes\nthe region to the left of the White House (where left is defined by\nthe White House's orientation), adjacent to the space currently\noccupied by the White House, and the same size as the currently\noccupied space.  It is the space the White House would occupy if it\nwere shifted one-whole-White-House-footprint to its left. The\npredicate corresponding to this function is #$lateralShiftFootprintRegion.") :- x_cid(a65b12759b6817).
xc_microtheory(a65b12759b6817,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6817,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6817,16).
xc_kb_names(a65b12759b6817,[]).
xc_mapping_rows(a65b12759b6817,[]).
x_genlPreds(x_alignedCylinderWithin,x_inRegion) :- x_cid(a65b12759b6818).
xc_microtheory(a65b12759b6818,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6818,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6818,25).
xc_kb_names(a65b12759b6818,[]).
xc_mapping_rows(a65b12759b6818,[]).
x_genlPreds(x_alignedCylinderWithin,x_aligned) :- x_cid(a65b12759b6819).
xc_microtheory(a65b12759b6819,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6819,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6819,26).
xc_kb_names(a65b12759b6819,[]).
xc_mapping_rows(a65b12759b6819,[]).
x_genlPreds(x_adjacentCylinderAligned,x_alignedAlong) :- x_cid(a65b12759b681a).
xc_microtheory(a65b12759b681a,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b681a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b681a,27).
xc_kb_names(a65b12759b681a,[]).
xc_mapping_rows(a65b12759b681a,[]).
x_genlPreds(x_spiralsAround,x_alignedAlongLength) :- x_cid(a65b12759b681b).
xc_microtheory(a65b12759b681b,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b681b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b681b,28).
xc_kb_names(a65b12759b681b,[]).
xc_mapping_rows(a65b12759b681b,[]).
x_genlPreds('x_onPath-Alongside',x_near) :- x_cid(a65b12759b681c).
xc_microtheory(a65b12759b681c,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b681c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b681c,29).
xc_kb_names(a65b12759b681c,[]).
xc_mapping_rows(a65b12759b681c,[]).
x_genlPreds(x_objectPerimeter,x_spatiallyRelated) :- x_cid(a65b12759b681d).
xc_microtheory(a65b12759b681d,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b681d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b681d,30).
xc_kb_names(a65b12759b681d,[]).
xc_mapping_rows(a65b12759b681d,[]).
x_genlPreds(x_xyCrossSectionShape,x_spatiallyRelated) :- x_cid(a65b12759b681e).
xc_microtheory(a65b12759b681e,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b681e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b681e,31).
xc_kb_names(a65b12759b681e,[]).
xc_mapping_rows(a65b12759b681e,[]).
x_genlPreds(x_yzCrossSectionShape,x_spatiallyRelated) :- x_cid(a65b12759b681f).
xc_microtheory(a65b12759b681f,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b681f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b681f,32).
xc_kb_names(a65b12759b681f,[]).
xc_mapping_rows(a65b12759b681f,[]).
x_genlPreds(x_xzCrossSectionShape,x_spatiallyRelated) :- x_cid(a65b12759b6820).
xc_microtheory(a65b12759b6820,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6820,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6820,33).
xc_kb_names(a65b12759b6820,[]).
xc_mapping_rows(a65b12759b6820,[]).
x_genlPreds(x_sameYlocation,x_spatiallyRelated) :- x_cid(a65b12759b6821).
xc_microtheory(a65b12759b6821,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6821,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6821,34).
xc_kb_names(a65b12759b6821,[]).
xc_mapping_rows(a65b12759b6821,[]).
x_genlPreds(x_frequentlyFoundInLocation,x_spatiallyRelated) :- x_cid(a65b12759b6822).
xc_microtheory(a65b12759b6822,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6822,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6822,35).
xc_kb_names(a65b12759b6822,[]).
xc_mapping_rows(a65b12759b6822,[]).
x_genlPreds('x_above-Indirectly','x_above-Generally') :- x_cid(a65b12759b6823).
xc_microtheory(a65b12759b6823,x_NaiveSpatialVocabularyMt).
xc_source_file(a65b12759b6823,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/NaiveSpatialVocabularyMt.krf').
xc_source_line(a65b12759b6823,36).
xc_kb_names(a65b12759b6823,[]).
xc_mapping_rows(a65b12759b6823,[]).
kb_cache_footer(footer{count:20,digest:b32674d1549caf2c98dc017bcf6edaf35f1cb3a1555f6c2845b10d6081a31590,headerDigest:'767fdb29902133f793a4e3f85adc4adb0de6a3167f3b7c7594cab4f3ab7ab817'}).
