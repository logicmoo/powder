:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:10,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:125,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'8e3384892051a7a1512abeca2a116f5907074efe439029494b4bd170692d2226',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:4832,source:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf',sourceHash:'0af13ab2c4f643750562d69e0f9b0b24099efe397ce6fa0cffcd6df84f21eb83',warnings:[]}).
'x_<=='(x_enmeshed(V1,V2),x_groundExpression(V1),x_lookupOnly(x_wmOnly(x_isa(V1,x_Gear))),x_lookupOnly(x_wmOnly(x_hasRCC8Relation(x_GlyphFn(V1,V3),x_GlyphFn(V2,V3),'x_rcc8-PO'))),x_lookupOnly(x_wmOnly(x_isa(V2,x_Gear)))) :- x_cid(a65b125c71d7ff,V1,V2,V3).
xc_microtheory(a65b125c71d7ff,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d7ff,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d7ff,20).
xc_kb_names(a65b125c71d7ff,["?gear1","?gear2","?sketch-layer"]).
xc_mapping_rows(a65b125c71d7ff,[]).
xc_exclude_globals(a65b125c71d7ff,true).
'x_<=='(x_enmeshed(V1,V2),x_groundExpression(V1),x_lookupOnly(x_wmOnly(x_isa(V1,x_Gear))),x_lookupOnly(x_wmOnly(x_hasRCC8Relation(x_GlyphFn(V1,V3),x_GlyphFn(V2,V3),'x_rcc8-EC'))),x_lookupOnly(x_wmOnly(x_isa(V2,x_Gear)))) :- x_cid(a65b125c71d800,V1,V2,V3).
xc_microtheory(a65b125c71d800,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d800,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d800,28).
xc_kb_names(a65b125c71d800,["?gear1","?gear2","?sketch-layer"]).
xc_mapping_rows(a65b125c71d800,[]).
xc_exclude_globals(a65b125c71d800,true).
'x_<=='(x_rotConstraint(V1,V2),x_enmeshed(V1,V3),x_lookupOnly(x_wmOnly(x_isa(V1,x_FixedAxisObject))),x_lookupOnly(x_inverseRotDirection(V2,V4)),x_rotConstraint(V3,V4)) :- x_cid(a65b125c71d801,V1,V2,V3,V4).
xc_microtheory(a65b125c71d801,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d801,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d801,38).
xc_kb_names(a65b125c71d801,["?gear1","?rdir1","?gear2","?rdir2"]).
xc_mapping_rows(a65b125c71d801,[]).
xc_exclude_globals(a65b125c71d801,true).
'x_<=='(x_torqueAppliedToObj(V1,V2,V3),x_enmeshed(V1,V4),x_torqueAppliedToObj(V4,V5,V3),x_lookupOnly(x_inverseRotDirection(V5,V2))) :- x_cid(a65b125c71d802,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c71d802,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d802,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d802,46).
xc_kb_names(a65b125c71d802,["?gear1","?g1RotDir","?source","?gear2","?rotDir"]).
xc_mapping_rows(a65b125c71d802,[]).
xc_exclude_globals(a65b125c71d802,true).
'x_<=='(x_rotConstraint(V1,V2),x_enmeshed(V1,V3),x_lookupOnly(x_wmOnly(x_hasContactSurface(V1,V3,V4))),x_lookupOnly(x_wmOnly(x_surfaceNormal(V4,V5))),x_lookupOnly(x_inverseRotDirection(V2,V6)),x_rotConstraint(V3,V6),x_lookupOnly(x_rotate90(V5,V7,V2)),x_transConstraint(V3,V7),x_lookupOnly(x_rotate90(V5,V8,V6)),x_transConstraint(V1,V8)) :- x_cid(a65b125c71d803,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c71d803,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d803,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d803,74).
xc_kb_names(a65b125c71d803,["?gear1","?rdir1","?gear2","?surface","?surfNormal","?rdir2","?g2tdir","?g1tdir"]).
xc_mapping_rows(a65b125c71d803,[]).
xc_exclude_globals(a65b125c71d803,true).
'x_<=='(x_transConstraint(V1,V2),x_unknownSentence(x_transFreedom(V1,V2)),x_enmeshed(V1,V3),x_lookupOnly(x_wmOnly(x_hasContactSurface(V1,V3,V4))),x_lookupOnly(x_wmOnly(x_surfaceNormal(V4,V5))),x_lookupOnly(x_rotate90(V2,V5,V6)),x_rotConstraint(V3,V6),x_lookupOnly(x_inverseRotDirection(V6,V7)),x_rotConstraint(V1,V7),x_sufficientlyConstrained(V3,V8)) :- x_cid(a65b125c71d804,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c71d804,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d804,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d804,87).
xc_kb_names(a65b125c71d804,["?gear1","?g1tdir","?gear2","?surface","?surfNormal","?rdir","?invRdir","?g1tDir"]).
xc_mapping_rows(a65b125c71d804,[]).
xc_exclude_globals(a65b125c71d804,true).
'x_<=='(x_textureOfObject(V1,x_ToothedTexture),x_lookupOnly(x_wmOnly(x_isa(V1,x_Gear)))) :- x_cid(a65b125c71d805,V1).
xc_microtheory(a65b125c71d805,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d805,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d805,103).
xc_kb_names(a65b125c71d805,["?object"]).
xc_mapping_rows(a65b125c71d805,[]).
xc_exclude_globals(a65b125c71d805,true).
'x_<=='(x_rotationalOrigin(V1,V2),x_rotationalOriginByGear(V1,V2)) :- x_cid(a65b125c71d806,V1,V2).
xc_microtheory(a65b125c71d806,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d806,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d806,107).
xc_kb_names(a65b125c71d806,["?obj","?ori"]).
xc_mapping_rows(a65b125c71d806,[]).
xc_exclude_globals(a65b125c71d806,true).
'x_<=='(x_rotationalOriginByGear(V1,V2),x_lookupOnly(x_wmOnly(x_isa(V1,x_Gear))),x_unifies(V1,V2)) :- x_cid(a65b125c71d807,V1,V2).
xc_microtheory(a65b125c71d807,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d807,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d807,110).
xc_kb_names(a65b125c71d807,["?obj","?center"]).
xc_mapping_rows(a65b125c71d807,[]).
xc_exclude_globals(a65b125c71d807,true).
'x_<=='(x_textureOfSurface(V1,V2),x_lookupOnly(x_wmOnly(x_hasContactSurface(V3,V4,V1))),x_textureOfObject(V3,V2)) :- x_cid(a65b125c71d808,V1,V2,V3,V4).
xc_microtheory(a65b125c71d808,x_NuSketchQMRulesMt).
xc_source_file(a65b125c71d808,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-gear-rules.krf').
xc_source_line(a65b125c71d808,120).
xc_kb_names(a65b125c71d808,["?surface","?texture","?object","?x"]).
xc_mapping_rows(a65b125c71d808,[]).
xc_exclude_globals(a65b125c71d808,true).
kb_cache_footer(footer{count:10,digest:'8e3384892051a7a1512abeca2a116f5907074efe439029494b4bd170692d2226',headerDigest:'3af4064112e0f538abe166fdba89688cd8d1379ce79993b1a7dbf82903ffcc76'}).
