:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:41,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:485,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'54bf27975254633f9784970b6799c2422dc3fa297693d28e951e954e6fdd13e1',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:22046,source:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf',sourceHash:'599681d6905d3648cb875a40e0b2a755802f012335959881fa09a49e8e25e1c1',warnings:[]}).
'x_<=='(x_connectedAtEnd(V1,V2),x_lookupOnly(x_wmOnly(x_edgeContactsNonTangentially(V2,V3))),x_lookupOnly(x_wmOnly(x_edgeRepresentsCordSegment(V3,V1)))) :- x_cid(a65b125c703194,V1,V2,V3).
xc_microtheory(a65b125c703194,x_NuSketchQMRulesMt).
xc_source_file(a65b125c703194,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c703194,27).
xc_kb_names(a65b125c703194,["?cordSeg","?obj","?edge"]).
xc_mapping_rows(a65b125c703194,[]).
xc_exclude_globals(a65b125c703194,true).
'x_<=='(x_cordSegEntersPulley(V1,V2),x_lookupOnly(x_wmOnly(x_isa(V2,x_Pulley))),x_lookupOnly(x_wmOnly(x_edgeContactsTangentially(V2,V3))),x_lookupOnly(x_wmOnly(x_edgeRepresentsCordSegment(V3,V1)))) :- x_cid(a65b125c703195,V1,V2,V3).
xc_microtheory(a65b125c703195,x_NuSketchQMRulesMt).
xc_source_file(a65b125c703195,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c703195,32).
xc_kb_names(a65b125c703195,["?cordSeg","?pulley","?edge"]).
xc_mapping_rows(a65b125c703195,[]).
xc_exclude_globals(a65b125c703195,true).
'x_<=='(x_qvFromCordConnection(V1,V2,V3),x_lookupOnly(x_wmOnly(x_qvOfEdgeContact(V2,V4,V5))),x_lookupOnly(x_wmOnly(x_edgeRepresentsCordSegment(V4,V1))),x_lookupOnly(x_inverseVector(V5,V3))) :- x_cid(a65b125c703196,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c703196,x_NuSketchQMRulesMt).
xc_source_file(a65b125c703196,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c703196,38).
xc_kb_names(a65b125c703196,["?cordSeg","?obj","?dir","?edge","?objToEdgeDir"]).
xc_mapping_rows(a65b125c703196,[]).
xc_exclude_globals(a65b125c703196,true).
'x_<=='(x_qvToCordConnection(V1,V2,V3),x_lookupOnly(x_wmOnly(x_qvFromCordConnection(V2,V1,V4))),x_lookupOnly(x_inverseVector(V4,V3))) :- x_cid(a65b125c703197,V1,V2,V3,V4).
xc_microtheory(a65b125c703197,x_NuSketchQMRulesMt).
xc_source_file(a65b125c703197,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c703197,44).
xc_kb_names(a65b125c703197,["?obj","?cordSeg","?dir","?dirInverse"]).
xc_mapping_rows(a65b125c703197,[]).
xc_exclude_globals(a65b125c703197,true).
'x_<=='(x_cordSegsConnectThroughPulley(V1,V2,V3),x_lookupOnly(x_cordSegsConnectThroughPulley(V2,V1,V3))) :- x_cid(a65b125c703198,V1,V2,V3).
xc_microtheory(a65b125c703198,x_NuSketchQMRulesMt).
xc_source_file(a65b125c703198,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c703198,50).
xc_kb_names(a65b125c703198,["?cordSegA","?cordSegB","?pulley"]).
xc_mapping_rows(a65b125c703198,[]).
xc_exclude_globals(a65b125c703198,true).
'x_<=='(x_cordSegsConnectThroughPulley(V1,V2,V3),x_cordSegEntersPulley(V1,V3),x_cordSegEntersPulley(V2,V3),x_different(V1,V2),x_cordSegmentOf(V1,V4),x_cordSegmentOf(V2,V4),x_evaluate(V5,x_CardinalityFn(x_TheClosedRetrievalSetOf(V6,x_and(x_cordSegEntersPulley(V6,V3),x_cordSegmentOf(V6,V4))))),x_equals(V5,2)) :- x_cid(a65b125c703199,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c703199,x_NuSketchQMRulesMt).
xc_source_file(a65b125c703199,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c703199,54).
xc_kb_names(a65b125c703199,["?cordSegA","?cordSegB","?pulley","?cord","?cordSegCount","?cordSeg"]).
xc_mapping_rows(a65b125c703199,[]).
xc_exclude_globals(a65b125c703199,true).
'x_<=='(x_cordSegsConnectThroughPulley(V1,V2,V3),x_cordSegEntersPulley(V1,V3),x_cordSegEntersPulley(V2,V3),x_different(V1,V2),x_evaluate(V4,x_CardinalityFn(x_TheClosedRetrievalSetOf(V5,x_cordSegEntersPulley(V5,V3)))),x_equals(V4,2)) :- x_cid(a65b125c70319a,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c70319a,x_NuSketchQMRulesMt).
xc_source_file(a65b125c70319a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c70319a,68).
xc_kb_names(a65b125c70319a,["?cordSegA","?cordSegB","?pulley","?cordSegCount","?cordSeg"]).
xc_mapping_rows(a65b125c70319a,[]).
xc_exclude_globals(a65b125c70319a,true).
'x_<=='(x_cordSegsConnectThroughPulley(V1,V2,V3),x_lookupOnly(x_wmOnly(x_isa(V3,x_Pulley))),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_cordSegEntersPulley(V5,V3))),x_evaluate(V6,x_CardinalityFn(V4)),x_equals(V6,4),x_cordSegEntersPulley(V7,V3),x_cordSegEntersPulley(V8,V3),x_different(V7,V8),x_cordSegmentOf(V7,V9),x_cordSegmentOf(V8,V9),x_cordSegEntersPulley(V1,V3),x_different(V1,V7),x_different(V1,V8),x_cordSegEntersPulley(V2,V3),x_different(V2,V1),x_different(V2,V7),x_different(V2,V8)) :- x_cid(a65b125c70319b,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125c70319b,x_NuSketchQMRulesMt).
xc_source_file(a65b125c70319b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c70319b,78).
xc_kb_names(a65b125c70319b,["?cordSegA","?cordSegB","?pulley","?cordSegs","?cordSeg","?cordSegCount","?cordSegC","?cordSegD","?cord"]).
xc_mapping_rows(a65b125c70319b,[]).
xc_exclude_globals(a65b125c70319b,true).
'x_<=='(x_normalOfInnerCord(V1,V2,V3,V4),x_lookupOnly(x_wmOnly(x_cordSegsConnectThroughPulley(V2,V3,V1))),x_lookupOnly(x_wmOnly(x_qvFromCordConnection(V2,V1,V5))),x_lookupOnly(x_wmOnly(x_qvFromCordConnection(V3,V1,V6))),x_unifies(V5,V6),x_inverseVector(V5,V4)) :- x_cid(a65b125c70319c,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c70319c,x_NuSketchQMRulesMt).
xc_source_file(a65b125c70319c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c70319c,107).
xc_kb_names(a65b125c70319c,["?pulley","?segA","?segB","?dir","?AToPulleyDir","?BToPulleyDir"]).
xc_mapping_rows(a65b125c70319c,[]).
xc_exclude_globals(a65b125c70319c,true).
'x_<=='(x_normalOfInnerCord(V1,V2,V3,V4),x_lookupOnly(x_wmOnly(x_cordSegsConnectThroughPulley(V2,V3,V1))),x_qvToCordConnection(V1,V2,V5),x_qvToCordConnection(V1,V3,V6),x_rotate45(V5,V6,V7),x_isa(V5,x_2DDiagonal),x_unifies(V5,V4)) :- x_cid(a65b125c70319d,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c70319d,x_NuSketchQMRulesMt).
xc_source_file(a65b125c70319d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c70319d,114).
xc_kb_names(a65b125c70319d,["?pulley","?segA","?segB","?dir","?pulleyToADir","?pulleyToBDir","?rotDir"]).
xc_mapping_rows(a65b125c70319d,[]).
xc_exclude_globals(a65b125c70319d,true).
'x_<=='(x_normalOfInnerCord(V1,V2,V3,V4),x_lookupOnly(x_wmOnly(x_cordSegsConnectThroughPulley(V2,V3,V1))),x_qvToCordConnection(V1,V2,V5),x_qvToCordConnection(V1,V3,V6),x_rotate45(V5,V6,V7),x_isa(V6,x_2DDiagonal),x_unifies(V6,V4)) :- x_cid(a65b125c70319e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c70319e,x_NuSketchQMRulesMt).
xc_source_file(a65b125c70319e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c70319e,122).
xc_kb_names(a65b125c70319e,["?pulley","?segA","?segB","?dir","?pulleyToADir","?pulleyToBDir","?rotDir"]).
xc_mapping_rows(a65b125c70319e,[]).
xc_exclude_globals(a65b125c70319e,true).
'x_<=='(x_normalOfInnerCord(V1,V2,V3,V4),x_lookupOnly(x_wmOnly(x_cordSegsConnectThroughPulley(V2,V3,V1))),x_qvToCordConnection(V1,V2,V5),x_qvToCordConnection(V1,V3,V6),x_rotate90(V5,V6,V7),x_rotate45(V5,V4,V7)) :- x_cid(a65b125c70319f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c70319f,x_NuSketchQMRulesMt).
xc_source_file(a65b125c70319f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c70319f,130).
xc_kb_names(a65b125c70319f,["?pulley","?segA","?segB","?dir","?pulleyToADir","?pulleyToBDir","?rotDir"]).
xc_mapping_rows(a65b125c70319f,[]).
xc_exclude_globals(a65b125c70319f,true).
'x_<=='(x_normalOfInnerCord(V1,V2,V3,V4),x_lookupOnly(x_wmOnly(x_cordSegsConnectThroughPulley(V2,V3,V1))),x_qvToCordConnection(V1,V2,V5),x_qvToCordConnection(V1,V3,V6),x_uninferredSentence(x_openHalfPlane(V5,V6)),x_rotate90(V5,V4,V7),x_inverseRotDirection(V7,V8),x_rotate45(V6,V4,V8),x_isa(V4,x_2DDiagonal)) :- x_cid(a65b125c7031a0,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c7031a0,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a0,137).
xc_kb_names(a65b125c7031a0,["?pulley","?segA","?segB","?dir","?pulleyToADir","?pulleyToBDir","?rotDir1","?rotDir2"]).
xc_mapping_rows(a65b125c7031a0,[]).
xc_exclude_globals(a65b125c7031a0,true).
'x_<=='(x_normalOfInnerCord(V1,V2,V3,V4),x_lookupOnly(x_wmOnly(x_cordSegsConnectThroughPulley(V2,V3,V1))),x_qvToCordConnection(V1,V2,V5),x_qvToCordConnection(V1,V3,V6),x_uninferredSentence(x_openHalfPlane(V5,V6)),x_rotate45(V5,V4,V7),x_inverseRotDirection(V7,V8),x_rotate90(V6,V4,V8),x_isa(V4,x_2DDiagonal)) :- x_cid(a65b125c7031a1,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c7031a1,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a1,147).
xc_kb_names(a65b125c7031a1,["?pulley","?segA","?segB","?dir","?pulleyToADir","?pulleyToBDir","?rotDir1","?rotDir2"]).
xc_mapping_rows(a65b125c7031a1,[]).
xc_exclude_globals(a65b125c7031a1,true).
'x_<=='(x_sameCord(V1,V2),x_lookupOnly(x_cordSegsConnectThroughPulley(V1,V2,V3))) :- x_cid(a65b125c7031a2,V1,V2,V3).
xc_microtheory(a65b125c7031a2,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a2,159).
xc_kb_names(a65b125c7031a2,["?cordSeg1","?cordSeg2","?pulley"]).
xc_mapping_rows(a65b125c7031a2,[]).
xc_exclude_globals(a65b125c7031a2,true).
'x_<=='(x_sameCord(V1,V2),x_lookupOnly(x_cordSegsConnectThroughPulley(V2,V1,V3))) :- x_cid(a65b125c7031a3,V1,V2,V3).
xc_microtheory(a65b125c7031a3,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a3,162).
xc_kb_names(a65b125c7031a3,["?cordSeg1","?cordSeg2","?pulley"]).
xc_mapping_rows(a65b125c7031a3,[]).
xc_exclude_globals(a65b125c7031a3,true).
'x_<=='(x_sameCord(V1,V2),x_cordSegmentOf(V1,V3),x_cordSegmentOf(V2,V3)) :- x_cid(a65b125c7031a4,V1,V2,V3).
xc_microtheory(a65b125c7031a4,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a4,166).
xc_kb_names(a65b125c7031a4,["?cordSeg1","?cordSeg2","?cord"]).
xc_mapping_rows(a65b125c7031a4,[]).
xc_exclude_globals(a65b125c7031a4,true).
'x_<=='(x_sameCord(V1,V2),x_lookupOnly(x_sameCord(V1,V3)),x_different(V1,V3),x_lookupOnly(x_sameCord(V2,V3)),x_different(V2,V3)) :- x_cid(a65b125c7031a5,V1,V2,V3).
xc_microtheory(a65b125c7031a5,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a5,170).
xc_kb_names(a65b125c7031a5,["?cordSeg1","?cordSeg2","?cordSeg3"]).
xc_mapping_rows(a65b125c7031a5,[]).
xc_exclude_globals(a65b125c7031a5,true).
'x_<=='(x_cordConnection(V1,V2,V3,V3),x_connectedAtEnd(V3,V1),x_connectedAtEnd(V3,V2),x_different(V1,V2)) :- x_cid(a65b125c7031a6,V1,V2,V3).
xc_microtheory(a65b125c7031a6,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a6,178).
xc_kb_names(a65b125c7031a6,["?objA","?objB","?cordSeg"]).
xc_mapping_rows(a65b125c7031a6,[]).
xc_exclude_globals(a65b125c7031a6,true).
'x_<=='(x_cordConnection(V1,V2,V3,V4),x_connectedAtEnd(V3,V1),x_connectedAtEnd(V4,V2),x_different(V1,V2),x_ignoreTimestamps(x_lookupOnly(x_sameCord(V3,V4)))) :- x_cid(a65b125c7031a7,V1,V2,V3,V4).
xc_microtheory(a65b125c7031a7,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a7,183).
xc_kb_names(a65b125c7031a7,["?objA","?objB","?cordSegA","?cordSegB"]).
xc_mapping_rows(a65b125c7031a7,[]).
xc_exclude_globals(a65b125c7031a7,true).
'x_<=='(x_cordConnection(V1,V2,V3,V4),x_groundExpression(V1),x_groundExpression(V2),x_groundExpression(V3),x_groundExpression(V4),x_cordConnection(V2,V1,V4,V3)) :- x_cid(a65b125c7031a8,V1,V2,V3,V4).
xc_microtheory(a65b125c7031a8,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a8,192).
xc_kb_names(a65b125c7031a8,["?objA","?objB","?cordSegA","?cordSegB"]).
xc_mapping_rows(a65b125c7031a8,[]).
xc_exclude_globals(a65b125c7031a8,true).
'x_<=='(x_kinematicCordConnection(V1,V2,V3,V4),x_cacheComplete(x_cordConnection(V1,V2,V3,V4)),x_evaluate(x_TheSet,x_TheClosedRetrievalSetOf(V5,x_movablePulleyOnCord(V3,V5)))) :- x_cid(a65b125c7031a9,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c7031a9,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031a9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031a9,216).
xc_kb_names(a65b125c7031a9,["?objA","?objB","?cordSegA","?cordSegB","?pulley"]).
xc_mapping_rows(a65b125c7031a9,[]).
xc_exclude_globals(a65b125c7031a9,true).
'x_<=='(x_movablePulleyOnCord(V1,V2),x_cacheComplete(x_sameCord(V3,V1)),x_cacheComplete(x_cordSegEntersPulley(V1,V2)),x_cacheComplete(x_normalOfInnerCord(V2,V1,V4,V5)),x_notSufficientlyConstrained(V2,V5)) :- x_cid(a65b125c7031aa,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c7031aa,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031aa,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031aa,222).
xc_kb_names(a65b125c7031aa,["?cordSeg","?pulley","?cordSegA","?cordSegC","?dir"]).
xc_mapping_rows(a65b125c7031aa,[]).
xc_exclude_globals(a65b125c7031aa,true).
'x_<=='(x_rotationalOriginByCordConnection(V1,V2),x_uninferredSentence(x_rotationalOriginByAnnotation(V1,V2)),x_kinematicCordConnection(V1,V3,V4,V5),x_cacheComplete(x_qvFromCordConnection(V6,V3,V7)),x_inverseVector(V7,V8),x_transConstraint(V3,V8),x_lookupOnly(x_glyphRepresentsObject(V9,V3)),x_cacheComplete(x_edgeRepresentsCordSegment(V10,V4)),x_lookupOnly(x_farEndOfContactEdge(V1,V10,V2))) :- x_cid(a65b125c7031ab,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125c7031ab,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031ab,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031ab,232).
xc_kb_names(a65b125c7031ab,["?obj","?ori","?objB","?cordSegA","?cordSegB","?cordSeg","?cordToBDir","?bToCordDir","?objB-glyph","?edge"]).
xc_mapping_rows(a65b125c7031ab,[]).
xc_exclude_globals(a65b125c7031ab,true).
'x_<=='(x_rotationalOrigin(V1,V2),x_rotationalOriginByCordConnection(V1,V2)) :- x_cid(a65b125c7031ac,V1,V2).
xc_microtheory(a65b125c7031ac,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031ac,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031ac,243).
xc_kb_names(a65b125c7031ac,["?obj","?ori"]).
xc_mapping_rows(a65b125c7031ac,[]).
xc_exclude_globals(a65b125c7031ac,true).
'x_<=='(x_rotationallyConstrainedAtCordSeg(V1,V2),x_uninferredSentence(x_lookupOnly(x_isa(V1,x_FixedObject))),x_cacheComplete(x_qvToCordConnection(V1,V2,V3)),x_rotationalOrigin(V1,V4),x_lookupOnly(x_closeEndOfContactEdge(V1,V5,V6)),x_safeQualitativeVectorBetween(x_CentroidPointFn(V6),x_CentroidPointFn(V4),V7),x_rotate90(V3,V8,V9),x_openHalfPlane(V8,V7),x_rotConstraint(V1,V9)) :- x_cid(a65b125c7031ad,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125c7031ad,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031ad,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031ad,251).
xc_kb_names(a65b125c7031ad,["?obj","?cordSeg","?dirToCord","?ori","?edge","?connection-point","?connectionToOriDir","?90offAxis","?rotDir"]).
xc_mapping_rows(a65b125c7031ad,[]).
xc_exclude_globals(a65b125c7031ad,true).
'x_<=='(x_rotationallyConstrainedAtCordSeg(V1,V2),x_uninferredSentence(x_lookupOnly(x_isa(V1,x_FixedObject))),x_cacheComplete(x_qvToCordConnection(V1,V2,V3)),x_rotationalOrigin(V1,V4),x_lookupOnly(x_closeEndOfContactEdge(V1,V5,V6)),x_safeQualitativeVectorBetween(x_CentroidPointFn(V6),x_CentroidPointFn(V4),V7),x_qvAxisAligned(V3,V8),x_qvAxisAligned(V7,V8)) :- x_cid(a65b125c7031ae,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c7031ae,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031ae,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031ae,265).
xc_kb_names(a65b125c7031ae,["?obj","?cordSeg","?dirToCord","?ori","?edge","?connection-point","?connectionToOriDir","?axis"]).
xc_mapping_rows(a65b125c7031ae,[]).
xc_exclude_globals(a65b125c7031ae,true).
'x_<=='(x_rotationallyConstrainedAtCordSeg(V1,V2),x_lookupOnly(x_isa(V1,x_FixedObject)),x_cacheComplete(x_connectedAtEnd(V2,V1))) :- x_cid(a65b125c7031af,V1,V2).
xc_microtheory(a65b125c7031af,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031af,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031af,278).
xc_kb_names(a65b125c7031af,["?obj","?cordSeg"]).
xc_mapping_rows(a65b125c7031af,[]).
xc_exclude_globals(a65b125c7031af,true).
'x_<=='(x_rotationallyConstrainedAtCordSeg(V1,V2),x_evaluate(x_TheSet,x_TheClosedRetrievalSetOf(V3,x_rotationalOrigin(V1,V3)))) :- x_cid(a65b125c7031b0,V1,V2,V3).
xc_microtheory(a65b125c7031b0,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b0,283).
xc_kb_names(a65b125c7031b0,["?obj","?cordSeg","?ori"]).
xc_mapping_rows(a65b125c7031b0,[]).
xc_exclude_globals(a65b125c7031b0,true).
'x_<=='(x_transConstraint(V1,V2),x_unknownSentence(x_transFreedom(V1,V2)),x_kinematicCordConnection(V1,V3,V4,V5),x_cacheComplete(x_qvFromCordConnection(V5,V3,V6)),x_inverseVector(V6,V7),x_sufficientlyConstrained(V3,V7),x_rotationallyConstrainedAtCordSeg(V3,V5),x_cacheComplete(x_qvFromCordConnection(V4,V1,V8)),x_openHalfPlane(V8,V2)) :- x_cid(a65b125c7031b1,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c7031b1,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b1,295).
xc_kb_names(a65b125c7031b1,["?obj","?dir","?objB","?cordSegA","?cordSegB","?cordToBDir","?bToCordDir","?cordToADir"]).
xc_mapping_rows(a65b125c7031b1,[]).
xc_exclude_globals(a65b125c7031b1,true).
'x_<=='(x_rotConstraint(V1,V2),x_cacheComplete(x_kinematicCordConnection(V1,V3,V4,V5)),x_numAnswers(1,x_rotationalOrigin(V6,V7)),x_cacheComplete(x_qvFromCordConnection(V5,V3,V8)),x_inverseVector(V8,V9),x_sufficientlyConstrained(V3,V9),x_rotationallyConstrainedAtCordSeg(V3,V5),x_cacheComplete(x_cordSegmentOf(V4,V10)),x_lookupOnly(x_glyphRepresentsObject(V11,V10)),x_lookupOnly(x_glyphRepresentsObject(V12,V1)),x_cacheComplete(x_qvFromCordConnection(V4,V1,V13)),x_safeOverlappingParts(V12,V14,V11,V15),x_safeQualitativeVectorBetween(V14,x_CentroidPointFn(V7),V16),x_rotate90(V13,V17,V2),x_openHalfPlane(V17,V16)) :- x_cid(a65b125c7031b2,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17).
xc_microtheory(a65b125c7031b2,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b2,306).
xc_kb_names(a65b125c7031b2,["?obj","?rotDir","?objB","?cordSegA","?cordSegB","?obj1","?origin","?cordToBDir","?bToCordDir","?cord","?cord-glyph","?obj-glyph","?cordToADir","?obj-part","?cord-part","?dirToOrigin","?surfNormalR90"]).
xc_mapping_rows(a65b125c7031b2,[]).
xc_exclude_globals(a65b125c7031b2,true).
'x_<=='(x_forceAppliedToObj(V1,V2,V3),x_kinematicCordConnection(V4,V1,V5,V6),x_cacheComplete(x_qvFromCordConnection(V5,V4,V7)),x_forceAppliedToObj(V4,V8,V3),x_openHalfPlane(V7,V8),x_cacheComplete(x_qvFromCordConnection(V6,V1,V9)),x_inverseVector(V9,V2),x_notSufficientlyConstrained(V1,V2)) :- x_cid(a65b125c7031b3,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125c7031b3,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b3,329).
xc_kb_names(a65b125c7031b3,["?obj","?dir","?source","?objA","?cordSegA","?cordSegB","?cordToADir","?sourceForceDir","?cordToBDir"]).
xc_mapping_rows(a65b125c7031b3,[]).
xc_exclude_globals(a65b125c7031b3,true).
'x_<=='(x_forceAppliedToObj(V1,x_AmbigQVector,V2),x_cacheComplete(x_wmOnly(x_cordConnection(V3,V1,V4,V5))),x_numAnswers(1,x_movablePulleyOnCord(V4,V6)),x_cacheComplete(x_qvFromCordConnection(V4,V3,V7)),x_forceAppliedToObj(V3,V8,V2),x_openHalfPlane(V7,V8),x_cacheComplete(x_qvFromCordConnection(V5,V1,V9)),x_inverseVector(V9,V10),x_notSufficientlyConstrained(V1,V10)) :- x_cid(a65b125c7031b4,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125c7031b4,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b4,340).
xc_kb_names(a65b125c7031b4,["?obj","?source","?objA","?cordSegA","?cordSegB","?pulley","?cordToADir","?sourceForceDir","?cordToBDir","?dir"]).
xc_mapping_rows(a65b125c7031b4,[]).
xc_exclude_globals(a65b125c7031b4,true).
'x_<=='(x_torqueAppliedToObj(V1,V2,V3),x_kinematicCordConnection(V4,V1,V5,V6),x_forceAppliedToObj(V4,V7,V3),x_cacheComplete(x_qvFromCordConnection(V5,V4,V8)),x_openHalfPlane(V8,V9),x_rotationalOrigin(V1,V10),x_cacheComplete(x_qvFromCordConnection(V6,V1,V11)),x_lookupOnly(x_edgeRepresentsCordSegment(V12,V13)),x_lookupOnly(x_closeEndOfContactEdge(V1,V12,V14)),x_safeQualitativeVectorBetween(x_CentroidPointFn(V14),x_CentroidPointFn(V10),V15),x_different(V15,V11),x_inverseVector(V11,V16),x_openHalfPlane(V17,V16),x_rotate90(V17,V15,V2)) :- x_cid(a65b125c7031b5,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17).
xc_microtheory(a65b125c7031b5,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b5,358).
xc_kb_names(a65b125c7031b5,["?obj","?rotDir","?source","?objA","?cordSegA","?cordSegB","?dir","?cordToADir","?sourceForceDir","?ori","?cordToBDir","?edge","?cordsegB","?connection-point","?connectionToOriDir","?bToCordDir","?forcePlaneDir"]).
xc_mapping_rows(a65b125c7031b5,[]).
xc_exclude_globals(a65b125c7031b5,true).
'x_<=='(x_torqueAppliedToObj(V1,V2,V3),x_rotationalOriginByCordConnection(V1,V4),x_kinematicCordConnection(V1,V5,V6,V7),x_forceAssumed(V1,V8,V3),x_cacheComplete(x_qvFromCordConnection(V6,V1,V9)),x_closedHalfPlane(V9,V8),x_cacheComplete(x_qvFromCordConnection(V7,V5,V10)),x_inverseVector(V10,V11),x_sufficientlyConstrained(V5,V11),x_rotationallyConstrainedAtCordSeg(V5,V7),x_openHalfPlane(V12,V8),x_rotate90(V9,V12,V2)) :- x_cid(a65b125c7031b6,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125c7031b6,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b6,381).
xc_kb_names(a65b125c7031b6,["?obj","?rotDir","?source","?ori","?objB","?cordSegA","?cordSegB","?sourceForceDir","?cordToADir","?cordToBDir","?bToCordDir","?forcePlaneDir"]).
xc_mapping_rows(a65b125c7031b6,[]).
xc_exclude_globals(a65b125c7031b6,true).
'x_<=='(x_forceAppliedToObj(V1,V2,V3),x_cacheComplete(x_connectedAtEnd(V4,V1)),x_cacheComplete(x_cordSegmentOf(V4,V5)),x_cacheComplete(x_qvFromCordConnection(V4,V1,V6)),x_forceAppliedToObj(V5,V7,V3),x_lookupOnly(x_inverseVector(V6,V2)),x_lookupOnly(x_openHalfPlane(V2,V7))) :- x_cid(a65b125c7031b7,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c7031b7,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b7,401).
xc_kb_names(a65b125c7031b7,["?obj","?dir","?source","?cordSeg","?cord","?cordToObjDir","?sourceDir"]).
xc_mapping_rows(a65b125c7031b7,[]).
xc_exclude_globals(a65b125c7031b7,true).
'x_<=='(x_forceAppliedToObj(V1,V2,V3),x_cacheComplete(x_cordSegmentOf(V1,V4)),x_forceAssumed(V4,V2,V3),x_cacheComplete(x_qvFromCordConnection(V1,V5,V6)),x_lookupOnly(x_qvAxisAligned(V2,V7)),x_lookupOnly(x_qvAxisAligned(V6,V7))) :- x_cid(a65b125c7031b8,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c7031b8,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b8,413).
xc_kb_names(a65b125c7031b8,["?cordseg","?dir","?source","?cord","?connected","?cordDir","?axis"]).
xc_mapping_rows(a65b125c7031b8,[]).
xc_exclude_globals(a65b125c7031b8,true).
'x_<=='(x_forceAppliedToObj(V1,V2,V3),x_lookupOnly(x_wmOnly(x_cordSegsConnectThroughPulley(V4,V1,V5))),x_forceAppliedToObj(V4,V6,V3),x_lookupOnly(x_wmOnly(x_qvFromCordConnection(V4,V5,V7))),x_lookupOnly(x_wmOnly(x_qvFromCordConnection(V1,V5,V8))),x_lookupOnly(x_inverseVector(V7,V9)),x_lookupOnly(x_openHalfPlane(V9,V6)),x_lookupOnly(x_unifies(V8,V2))) :- x_cid(a65b125c7031b9,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125c7031b9,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031b9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031b9,429).
xc_kb_names(a65b125c7031b9,["?cordB","?dir","?source","?cordA","?pulley","?sourceDir","?cordAToPulleyDir","?cordBToPulleyDir","?pulleyToCordADir"]).
xc_mapping_rows(a65b125c7031b9,[]).
xc_exclude_globals(a65b125c7031b9,true).
'x_<=='(x_forceAppliedToObj(V1,V2,V3),x_lookupOnly(x_wmOnly(x_cordSegsConnectThroughPulley(V4,V5,V1))),x_lookupOnly(x_wmOnly(x_normalOfInnerCord(V1,V4,V5,V2))),x_notSufficientlyConstrained(V1,V2),x_cacheComplete(x_movablePulleyCordTerminus(V1,V5,V6)),x_forceAppliedToObj(V4,V7,V3),x_lookupOnly(x_qvToCordConnection(V1,V4,V8)),x_closedHalfPlane(V8,V7)) :- x_cid(a65b125c7031ba,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c7031ba,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031ba,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031ba,455).
xc_kb_names(a65b125c7031ba,["?obj","?dir","?source","?segA","?segB","?terminus","?sourceDir","?pulleyToCordADir"]).
xc_mapping_rows(a65b125c7031ba,[]).
xc_exclude_globals(a65b125c7031ba,true).
'x_<=='(x_movablePulleyCordTerminus(V1,V2,V1),x_lookupOnly(x_sameCord(V2,V3)),x_lookupOnly(x_connectedAtEnd(V3,V1))) :- x_cid(a65b125c7031bb,V1,V2,V3).
xc_microtheory(a65b125c7031bb,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031bb,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031bb,471).
xc_kb_names(a65b125c7031bb,["?pulley","?pushingSeg","?cordSeg"]).
xc_mapping_rows(a65b125c7031bb,[]).
xc_exclude_globals(a65b125c7031bb,true).
'x_<=='(x_movablePulleyCordTerminus(V1,V2,V3),x_lookupOnly(x_sameCord(V2,V4)),x_lookupOnly(x_connectedAtEnd(V4,V3)),x_different(V3,V1),x_lookupOnly(x_qvToCordConnection(V3,V5,V6)),x_sufficientlyConstrained(V3,V6),x_rotationallyConstrainedAtCordSeg(V3,V4)) :- x_cid(a65b125c7031bc,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c7031bc,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7031bc,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-cord-rules.krf').
xc_source_line(a65b125c7031bc,475).
xc_kb_names(a65b125c7031bc,["?pulley","?pushingSeg","?constrainedObj","?cordSeg","?seg","?constrainedToSegDir"]).
xc_mapping_rows(a65b125c7031bc,[]).
xc_exclude_globals(a65b125c7031bc,true).
kb_cache_footer(footer{count:41,digest:'54bf27975254633f9784970b6799c2422dc3fa297693d28e951e954e6fdd13e1',headerDigest:'9b8297cbfdc2dd99079595b9a0a2b6806b6eb204a772bf8fd605b0b085826483'}).
