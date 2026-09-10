:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:93,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:852,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'9ff2dc150cf85a32cb98a0f7e9178089f23a58ed1299ba41568e228eb84e8751',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:33928,source:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf',sourceHash:'4c2d4df2453b1c07fcda0799d3477481a6743d71b5d1517442ea9dd2b22d505a',warnings:[]}).
x_isa(x_NuSketchQMRulesMt,x_Microtheory) :- x_cid(a65b125c7489ac).
xc_microtheory(a65b125c7489ac,x_NuSketchQMFactsMt).
xc_source_file(a65b125c7489ac,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ac,20).
xc_kb_names(a65b125c7489ac,[]).
xc_mapping_rows(a65b125c7489ac,[]).
xc_exclude_globals(a65b125c7489ac,true).
x_genlMt(x_NuSketchQMRulesMt,x_NuSketchQMFactsMt) :- x_cid(a65b125c7489ad).
xc_microtheory(a65b125c7489ad,x_NuSketchQMFactsMt).
xc_source_file(a65b125c7489ad,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ad,21).
xc_kb_names(a65b125c7489ad,[]).
xc_mapping_rows(a65b125c7489ad,[]).
xc_exclude_globals(a65b125c7489ad,true).
x_genlMt(x_NuSketchReasoningCollectorMt,x_NuSketchQMRulesMt) :- x_cid(a65b125c7489ae).
xc_microtheory(a65b125c7489ae,x_NuSketchQMFactsMt).
xc_source_file(a65b125c7489ae,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ae,22).
xc_kb_names(a65b125c7489ae,[]).
xc_mapping_rows(a65b125c7489ae,[]).
xc_exclude_globals(a65b125c7489ae,true).
x_comment(x_NuSketchQMRulesMt,"Contains the rule system for the NUSketch-specific implementation of \n   qualitative mechanics.") :- x_cid(a65b125c7489af).
xc_microtheory(a65b125c7489af,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489af,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489af,25).
xc_kb_names(a65b125c7489af,[]).
xc_mapping_rows(a65b125c7489af,[]).
xc_exclude_globals(a65b125c7489af,true).
'x_<=='(x_glyphRelevantToQM(V1),x_glyphAnnotatedBy(x_GlyphFn(V1,V2),x_AnnotationGlyphFn(V3,V2)),x_isa(V3,x_QualitativeMechanicsAnnotation)) :- x_cid(a65b125c7489b0,V1,V2,V3).
xc_microtheory(a65b125c7489b0,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b0,33).
xc_kb_names(a65b125c7489b0,["?glyph","?layer","?annotation"]).
xc_mapping_rows(a65b125c7489b0,[]).
xc_exclude_globals(a65b125c7489b0,true).
'x_<=='(x_glyphRelevantToQM(V1),x_touchesDirectly(V1,V2),x_glyphRelevantToQM(V2)) :- x_cid(a65b125c7489b1,V1,V2).
xc_microtheory(a65b125c7489b1,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b1,39).
xc_kb_names(a65b125c7489b1,["?glyph","?glyph2"]).
xc_mapping_rows(a65b125c7489b1,[]).
xc_exclude_globals(a65b125c7489b1,true).
'x_<=='('x_causes-SitSit'(V1,V2),'x_glyphRelation-arg'(V3,'x_causes-SitSit',1,x_GlyphFn(V4,V5)),'x_glyphRelation-arg'(V3,'x_causes-SitSit',2,x_GlyphFn(V6,V5)),x_subSketchGroupRepresentsObject(V4,V1),x_subSketchGroupRepresentsObject(V6,V2)) :- x_cid(a65b125c7489b2,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c7489b2,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b2,48).
xc_kb_names(a65b125c7489b2,["?case1","?case2","?rel-glyph","?bundle1","?metalyr","?bundle2"]).
xc_mapping_rows(a65b125c7489b2,[]).
xc_exclude_globals(a65b125c7489b2,true).
'x_<=='('x_connectedTo-Directly'(V1,V2),'x_glyphRelation-arg'(V3,'x_connectedTo-Directly',1,x_GlyphFn(V1,V4)),'x_glyphRelation-arg'(V3,'x_connectedTo-Directly',2,x_GlyphFn(V2,V4))) :- x_cid(a65b125c7489b3,V1,V2,V3,V4).
xc_microtheory(a65b125c7489b3,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b3,54).
xc_kb_names(a65b125c7489b3,["?obj1","?obj2","?rel-glyph","?l"]).
xc_mapping_rows(a65b125c7489b3,[]).
xc_exclude_globals(a65b125c7489b3,true).
'x_<=='(x_qvPoseVectorMapping(V1,V2,V3,V4),x_qvAxisAlignedSense(V5,V3,V6),x_qvPoseAxisMapping(V1,V2,V5,V7),x_qvAxisAlignedSense(V7,V4,V6)) :- x_cid(a65b125c7489b4,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c7489b4,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b4,78).
xc_kb_names(a65b125c7489b4,["?pose1","?pose2","?qv1","?qv2","?axis1","?sense","?axis2"]).
xc_mapping_rows(a65b125c7489b4,[]).
xc_exclude_globals(a65b125c7489b4,true).
'x_<=='(x_closedHalfPlane(V1,V2),x_lookupOnly(x_openHalfPlane(V1,V2))) :- x_cid(a65b125c7489b5,V1,V2).
xc_microtheory(a65b125c7489b5,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b5,86).
xc_kb_names(a65b125c7489b5,["?dir1","?dir2"]).
xc_mapping_rows(a65b125c7489b5,[]).
xc_exclude_globals(a65b125c7489b5,true).
'x_<=='(x_forceAssumed(V1,V2,V3),x_lookupOnly(x_glyphAnnotatedBy(x_GlyphFn(V1,V4),x_AnnotationGlyphFn(V3,V4))),x_lookupOnly(x_isa(V3,x_ForceArrow)),x_safeQualitativeVectorBetween(x_ArrowTailPointFn(V3),x_ArrowHeadPointFn(V3),V2)) :- x_cid(a65b125c7489b6,V1,V2,V3,V4).
xc_microtheory(a65b125c7489b6,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b6,101).
xc_kb_names(a65b125c7489b6,["?obj","?dir","?annotation","?layer"]).
xc_mapping_rows(a65b125c7489b6,[]).
xc_exclude_globals(a65b125c7489b6,true).
'x_<=='(x_velocityAssumed(V1,V2),x_glyphAnnotatedBy(x_GlyphFn(V1,V3),x_AnnotationGlyphFn(V4,V3)),x_lookupOnly(x_wmOnly(x_isa(V4,x_VelocityArrow))),x_safeQualitativeVectorBetween(x_ArrowTailPointFn(V4),x_ArrowHeadPointFn(V4),V2)) :- x_cid(a65b125c7489b7,V1,V2,V3,V4).
xc_microtheory(a65b125c7489b7,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b7,110).
xc_kb_names(a65b125c7489b7,["?obj","?dir","?layer","?annotation"]).
xc_mapping_rows(a65b125c7489b7,[]).
xc_exclude_globals(a65b125c7489b7,true).
'x_<=='(x_torqueAssumed(V1,x_CW,V2),x_glyphAnnotatedBy(x_GlyphFn(V1,V3),x_AnnotationGlyphFn(V2,V3)),x_lookupOnly(x_wmOnly(x_isa(V2,x_RotationalForceArrow))),x_rotationalOrigin(V1,V4),x_glyphRepresentsObject(V5,V4),x_safeToTheRightOf(V5,x_AnnotationGlyphFn(V2,V3)),x_rotationalModifiedTimes(V3,V1,V2,V4)) :- x_cid(a65b125c7489b8,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c7489b8,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b8,122).
xc_kb_names(a65b125c7489b8,["?obj","?annotation","?layer","?origin","?origin-glyph-fn"]).
xc_mapping_rows(a65b125c7489b8,[]).
xc_exclude_globals(a65b125c7489b8,true).
'x_<=='(x_torqueAssumed(V1,x_CCW,V2),x_glyphAnnotatedBy(x_GlyphFn(V1,V3),x_AnnotationGlyphFn(V2,V3)),x_lookupOnly(x_wmOnly(x_isa(V2,x_RotationalForceArrow))),x_rotationalOrigin(V1,V4),x_glyphRepresentsObject(V5,V4),x_safeToTheLeftOf(V5,x_AnnotationGlyphFn(V2,V3)),x_rotationalModifiedTimes(V3,V1,V2,V4)) :- x_cid(a65b125c7489b9,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c7489b9,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489b9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489b9,133).
xc_kb_names(a65b125c7489b9,["?obj","?annotation","?layer","?origin","?origin-glyph-fn"]).
xc_mapping_rows(a65b125c7489b9,[]).
xc_exclude_globals(a65b125c7489b9,true).
'x_<=='(x_rotationalModifiedTimes(V1,V2,V3,V4),x_different(V2,V4),x_groundExpression(t(V1,V2,V3,V4)),x_inkLastModifiedTime(x_GlyphFn(V2,V1),x_NuSketchSketchTimeFn(V5)),x_inkLastModifiedTime(x_AnnotationGlyphFn(V3,V1),x_NuSketchSketchTimeFn(V6)),x_inkLastModifiedTime(x_AnnotationGlyphFn(V4,V1),x_NuSketchSketchTimeFn(V7))) :- x_cid(a65b125c7489ba,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c7489ba,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489ba,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ba,146).
xc_kb_names(a65b125c7489ba,["?layer","?obj","?annotation","?origin","?time1","?time2","?time3"]).
xc_mapping_rows(a65b125c7489ba,[]).
xc_exclude_globals(a65b125c7489ba,true).
'x_<=='(x_rotationalModifiedTimes(V1,V2,V3,V4),x_groundExpression(t(V1,V2,V3,V4)),x_unifies(V4,V2),x_inkLastModifiedTime(x_GlyphFn(V2,V1),x_NuSketchSketchTimeFn(V5)),x_inkLastModifiedTime(x_AnnotationGlyphFn(V3,V1),x_NuSketchSketchTimeFn(V6))) :- x_cid(a65b125c7489bb,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c7489bb,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489bb,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489bb,155).
xc_kb_names(a65b125c7489bb,["?layer","?obj","?annotation","?origin","?time1","?time2"]).
xc_mapping_rows(a65b125c7489bb,[]).
xc_exclude_globals(a65b125c7489bb,true).
'x_<=='(x_isa(V1,x_FixedRigidObject),x_lookupOnly(x_wmOnly(x_isa(V1,x_FixedObject))),x_lookupOnly(x_wmOnly(x_isa(V1,x_RigidOb)))) :- x_cid(a65b125c7489bc,V1).
xc_microtheory(a65b125c7489bc,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489bc,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489bc,163).
xc_kb_names(a65b125c7489bc,["?obj"]).
xc_mapping_rows(a65b125c7489bc,[]).
xc_exclude_globals(a65b125c7489bc,true).
'x_<=='(x_touchesDirectly(V1,V2),x_wmOnly(x_hasRCC8Relation(x_GlyphFn(V1,V3),x_GlyphFn(V2,V3),'x_rcc8-EC')),x_unknownSentence(x_doesNotTouchDirectly(V1,V2)),x_unknownSentence(x_doesNotTouchDirectly(V2,V1))) :- x_cid(a65b125c7489bd,V1,V2,V3).
xc_microtheory(a65b125c7489bd,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489bd,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489bd,173).
xc_kb_names(a65b125c7489bd,["?obj1","?obj2","?sketch-layer"]).
xc_mapping_rows(a65b125c7489bd,[]).
xc_exclude_globals(a65b125c7489bd,true).
'x_<=='(x_touchesDirectly(V1,V2),x_wmOnly(x_hasRCC8Relation(x_GlyphFn(V1,V3),x_GlyphFn(V2,V3),'x_rcc8-PO')),x_unknownSentence(x_doesNotTouchDirectly(V1,V2)),x_unknownSentence(x_doesNotTouchDirectly(V2,V1))) :- x_cid(a65b125c7489be,V1,V2,V3).
xc_microtheory(a65b125c7489be,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489be,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489be,180).
xc_kb_names(a65b125c7489be,["?obj1","?obj2","?sketch-layer"]).
xc_mapping_rows(a65b125c7489be,[]).
xc_exclude_globals(a65b125c7489be,true).
'x_<=='(x_touchesDirectly(V1,V2),x_wmOnly(x_hasRCC8Relation(x_GlyphFn(V1,V3),x_GlyphFn(V2,V3),'x_rcc8-TPP')),x_unknownSentence(x_doesNotTouchDirectly(V1,V2)),x_unknownSentence(x_doesNotTouchDirectly(V2,V1))) :- x_cid(a65b125c7489bf,V1,V2,V3).
xc_microtheory(a65b125c7489bf,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489bf,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489bf,187).
xc_kb_names(a65b125c7489bf,["?obj1","?obj2","?sketch-layer"]).
xc_mapping_rows(a65b125c7489bf,[]).
xc_exclude_globals(a65b125c7489bf,true).
'x_<=='(x_touchesDirectly(V1,V2),x_wmOnly(x_hasRCC8Relation(x_GlyphFn(V1,V3),x_GlyphFn(V2,V3),'x_rcc8-TPPi')),x_unknownSentence(x_doesNotTouchDirectly(V1,V2)),x_unknownSentence(x_doesNotTouchDirectly(V2,V1))) :- x_cid(a65b125c7489c0,V1,V2,V3).
xc_microtheory(a65b125c7489c0,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c0,194).
xc_kb_names(a65b125c7489c0,["?obj1","?obj2","?sketch-layer"]).
xc_mapping_rows(a65b125c7489c0,[]).
xc_exclude_globals(a65b125c7489c0,true).
'x_<=='(x_doesNotTouchDirectly(V1,V2),x_uninferredSentence(x_touchesDirectly(V1,V2)),x_inkLastModifiedTime(x_GlyphFn(V1,V3),x_NuSketchSketchTimeFn(V4)),x_inkLastModifiedTime(x_GlyphFn(V2,V3),x_NuSketchSketchTimeFn(V5))) :- x_cid(a65b125c7489c1,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c7489c1,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c1,201).
xc_kb_names(a65b125c7489c1,["?obj1","?obj2","?layer","?time1","?time2"]).
xc_mapping_rows(a65b125c7489c1,[]).
xc_exclude_globals(a65b125c7489c1,true).
'x_<=='(x_forceAppliedToObj(V1,V2,V3),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V1,x_FixedObject)))),x_forceAssumed(V1,V2,V3)) :- x_cid(a65b125c7489c2,V1,V2,V3).
xc_microtheory(a65b125c7489c2,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c2,217).
xc_kb_names(a65b125c7489c2,["?obj","?fdir","?source"]).
xc_mapping_rows(a65b125c7489c2,[]).
xc_exclude_globals(a65b125c7489c2,true).
'x_<=='(x_forceAppliedToObj(V1,V2,V3),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V1,x_FixedObject)))),x_forceAssumed(V1,V4,V3),x_transConstraint(V1,V4),x_lookupOnly(x_openHalfPlane(V4,V2)),x_transFreedom(V1,V2)) :- x_cid(a65b125c7489c3,V1,V2,V3,V4).
xc_microtheory(a65b125c7489c3,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c3,224).
xc_kb_names(a65b125c7489c3,["?obj","?fdir","?source","?aDir"]).
xc_mapping_rows(a65b125c7489c3,[]).
xc_exclude_globals(a65b125c7489c3,true).
'x_<=='(x_forceAt(V1,V2,V3),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V3,x_FixedObject)))),x_lookupOnly(x_hasContactSurface(V3,V4,V1)),x_forceAppliedToObj(V3,V5,V6),x_surfaceNormal(V1,V2),x_lookupOnly(x_openHalfPlane(V2,V5))) :- x_cid(a65b125c7489c4,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c7489c4,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c4,232).
xc_kb_names(a65b125c7489c4,["?objSurf","?fAtdir","?obj","?forcee","?fdir","?source"]).
xc_mapping_rows(a65b125c7489c4,[]).
xc_exclude_globals(a65b125c7489c4,true).
'x_<=='(x_forceAt(V1,x_ZeroQVector,V2),x_lookupOnly(x_wmOnly(x_isa(V2,x_FixedObject)))) :- x_cid(a65b125c7489c5,V1,V2).
xc_microtheory(a65b125c7489c5,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c5,245).
xc_kb_names(a65b125c7489c5,["?objSurf","?obj"]).
xc_mapping_rows(a65b125c7489c5,[]).
xc_exclude_globals(a65b125c7489c5,true).
'x_<=='(x_forceAt(V1,x_ZeroQVector,V2),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V2,x_FixedObject)))),x_evaluate(x_TheSet,x_TheClosedRetrievalSetOf(V3,x_forceAppliedToObj(V2,V3,V4)))) :- x_cid(a65b125c7489c6,V1,V2,V3,V4).
xc_microtheory(a65b125c7489c6,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c6,248).
xc_kb_names(a65b125c7489c6,["?objSurf","?obj","?fdir","?source"]).
xc_mapping_rows(a65b125c7489c6,[]).
xc_exclude_globals(a65b125c7489c6,true).
'x_<=='(x_forceAppliedToSurf(V1,V2,V3),x_lookupOnly(x_hasContactSurface(V3,V4,V5)),x_surfaceContact(V5,V1),x_numAnswers(1,x_forceAt(V5,V2,V3)),x_different(V2,x_ZeroQVector)) :- x_cid(a65b125c7489c7,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c7489c7,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c7,255).
xc_kb_names(a65b125c7489c7,["?forceeSurf","?fdir","?forcer","?forcee","?forcerSurf"]).
xc_mapping_rows(a65b125c7489c7,[]).
xc_exclude_globals(a65b125c7489c7,true).
'x_<=='(x_forceAppliedToObj(V1,V2,V3),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V1,x_FixedObject)))),x_hasContactSurface(V1,V3,V4),x_forceAppliedToSurf(V4,V5,V3),x_unconstrainedForceDir(V1,V5,V2)) :- x_cid(a65b125c7489c8,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c7489c8,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c8,262).
xc_kb_names(a65b125c7489c8,["?obj","?fdir","?source","?objSurf","?sfdir"]).
xc_mapping_rows(a65b125c7489c8,[]).
xc_exclude_globals(a65b125c7489c8,true).
'x_<=='(x_unconstrainedForceDir(V1,V2,V3),x_transFreedom(V1,V2),x_unifies(V2,V3)) :- x_cid(a65b125c7489c9,V1,V2,V3).
xc_microtheory(a65b125c7489c9,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489c9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489c9,269).
xc_kb_names(a65b125c7489c9,["?obj","?sfdir","?fdir"]).
xc_mapping_rows(a65b125c7489c9,[]).
xc_exclude_globals(a65b125c7489c9,true).
'x_<=='(x_unconstrainedForceDir(V1,V2,V3),x_transConstraint(V1,V2),x_openHalfPlane(V2,V3),x_transFreedom(V1,V3)) :- x_cid(a65b125c7489ca,V1,V2,V3).
xc_microtheory(a65b125c7489ca,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489ca,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ca,273).
xc_kb_names(a65b125c7489ca,["?obj","?sfdir","?fdir"]).
xc_mapping_rows(a65b125c7489ca,[]).
xc_exclude_globals(a65b125c7489ca,true).
'x_<=='(x_netForce(V1,V2),x_numAnswers(1,x_netForceX(V1,V3)),x_numAnswers(1,x_netForceY(V1,V4)),x_lookupOnly(x_xSense(V2,V3)),x_lookupOnly(x_ySense(V2,V4))) :- x_cid(a65b125c7489cb,V1,V2,V3,V4).
xc_microtheory(a65b125c7489cb,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489cb,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489cb,297).
xc_kb_names(a65b125c7489cb,["?obj","?fdir","?xSense","?ySense"]).
xc_mapping_rows(a65b125c7489cb,[]).
xc_exclude_globals(a65b125c7489cb,true).
'x_<=='(x_netForceComponents(V1,V2,V3),x_forEffectOnly(x_forceAppliedToObj(V1,V4,V5)),x_evaluate(V2,x_SensePlusFn(x_TheClosedRetrievalSetOf(V6,x_and(x_lookupOnly(x_forceAppliedToObj(V1,V7,V5)),x_xSense(V7,V6))))),x_evaluate(V3,x_SensePlusFn(x_TheClosedRetrievalSetOf(V8,x_and(x_lookupOnly(x_forceAppliedToObj(V1,V7,V5)),x_ySense(V7,V8))))),x_forceLastModifiedTime(x_GlyphFn(V1,V9),V10)) :- x_cid(a65b125c7489cc,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125c7489cc,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489cc,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489cc,303).
xc_kb_names(a65b125c7489cc,["?obj","?xSense","?ySense","?dir","?source","?x","?fdir","?y","?layer","?time"]).
xc_mapping_rows(a65b125c7489cc,[]).
xc_exclude_globals(a65b125c7489cc,true).
'x_<=='(x_netForceX(V1,V2),x_numAnswers(1,x_netForceComponents(V1,V3,V4)),x_unifies(V2,V3)) :- x_cid(a65b125c7489cd,V1,V2,V3,V4).
xc_microtheory(a65b125c7489cd,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489cd,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489cd,317).
xc_kb_names(a65b125c7489cd,["?obj","?sense","?xSense","?ySense"]).
xc_mapping_rows(a65b125c7489cd,[]).
xc_exclude_globals(a65b125c7489cd,true).
'x_<=='(x_netForceY(V1,V2),x_numAnswers(1,x_netForceComponents(V1,V3,V4)),x_unifies(V2,V4)) :- x_cid(a65b125c7489ce,V1,V2,V3,V4).
xc_microtheory(a65b125c7489ce,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489ce,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ce,324).
xc_kb_names(a65b125c7489ce,["?obj","?sense","?xSense","?ySense"]).
xc_mapping_rows(a65b125c7489ce,[]).
xc_exclude_globals(a65b125c7489ce,true).
'x_<=='(x_netForce(V1,x_AmbigQVector),x_numAnswers(1,x_netForceX(V1,V2)),x_unifies(V2,x_Ambig)) :- x_cid(a65b125c7489cf,V1,V2).
xc_microtheory(a65b125c7489cf,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489cf,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489cf,332).
xc_kb_names(a65b125c7489cf,["?obj","?xSense"]).
xc_mapping_rows(a65b125c7489cf,[]).
xc_exclude_globals(a65b125c7489cf,true).
'x_<=='(x_netForce(V1,x_AmbigQVector),x_numAnswers(1,x_netForceY(V1,V2)),x_unifies(V2,x_Ambig)) :- x_cid(a65b125c7489d0,V1,V2).
xc_microtheory(a65b125c7489d0,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d0,336).
xc_kb_names(a65b125c7489d0,["?obj","?ySense"]).
xc_mapping_rows(a65b125c7489d0,[]).
xc_exclude_globals(a65b125c7489d0,true).
'x_<=='(x_possibleNetForce(V1,V2),x_numAnswers(1,x_netForce(V1,x_AmbigQVector)),x_numAnswers(1,x_netForceX(V1,x_Ambig)),x_numAnswers(1,x_netForceY(V1,V3)),x_different(V3,x_Ambig),x_ySense(V2,V3)) :- x_cid(a65b125c7489d1,V1,V2,V3).
xc_microtheory(a65b125c7489d1,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d1,340).
xc_kb_names(a65b125c7489d1,["?obj","?dir","?y"]).
xc_mapping_rows(a65b125c7489d1,[]).
xc_exclude_globals(a65b125c7489d1,true).
'x_<=='(x_possibleNetForce(V1,V2),x_numAnswers(1,x_netForce(V1,x_AmbigQVector)),x_numAnswers(1,x_netForceY(V1,x_Ambig)),x_numAnswers(1,x_netForceX(V1,V3)),x_different(V3,x_Ambig),x_xSense(V2,V3)) :- x_cid(a65b125c7489d2,V1,V2,V3).
xc_microtheory(a65b125c7489d2,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d2,347).
xc_kb_names(a65b125c7489d2,["?obj","?fdir","?x"]).
xc_mapping_rows(a65b125c7489d2,[]).
xc_exclude_globals(a65b125c7489d2,true).
'x_<=='(x_possibleNetForce(V1,V2),x_numAnswers(1,x_netForce(V1,x_AmbigQVector)),x_numAnswers(1,x_netForceY(V1,x_Ambig)),x_numAnswers(1,x_netForceX(V1,x_Ambig)),x_lookupOnly(x_isa(V2,x_2DQDirection))) :- x_cid(a65b125c7489d3,V1,V2).
xc_microtheory(a65b125c7489d3,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d3,354).
xc_kb_names(a65b125c7489d3,["?obj","?fdir"]).
xc_mapping_rows(a65b125c7489d3,[]).
xc_exclude_globals(a65b125c7489d3,true).
'x_<=='(x_possibleNetForce(V1,x_ZeroQVector),x_numAnswers(1,x_netForce(V1,x_AmbigQVector)),x_numAnswers(1,x_netForceY(V1,x_Ambig)),x_numAnswers(1,x_netForceX(V1,x_Ambig))) :- x_cid(a65b125c7489d4,V1).
xc_microtheory(a65b125c7489d4,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d4,360).
xc_kb_names(a65b125c7489d4,["?obj"]).
xc_mapping_rows(a65b125c7489d4,[]).
xc_exclude_globals(a65b125c7489d4,true).
'x_<=='(x_rotationalOrigin(V1,V2),x_rotationalOriginByAnnotation(V1,V2)) :- x_cid(a65b125c7489d5,V1,V2).
xc_microtheory(a65b125c7489d5,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d5,369).
xc_kb_names(a65b125c7489d5,["?obj","?ori"]).
xc_mapping_rows(a65b125c7489d5,[]).
xc_exclude_globals(a65b125c7489d5,true).
'x_<=='(x_rotationalOrigin(V1,V2),x_rotationalOriginByConnection(V1,V2)) :- x_cid(a65b125c7489d6,V1,V2).
xc_microtheory(a65b125c7489d6,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d6,372).
xc_kb_names(a65b125c7489d6,["?obj","?ori"]).
xc_mapping_rows(a65b125c7489d6,[]).
xc_exclude_globals(a65b125c7489d6,true).
'x_<=='(x_rotationalOrigin(V1,V2),x_qmUseDefaultRotOrigin(V1),x_unifies(V1,V2),x_forceLastModifiedTime(x_GlyphFn(V1,V3),V4)) :- x_cid(a65b125c7489d7,V1,V2,V3,V4).
xc_microtheory(a65b125c7489d7,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d7,375).
xc_kb_names(a65b125c7489d7,["?obj","?ori","?layer","?time"]).
xc_mapping_rows(a65b125c7489d7,[]).
xc_exclude_globals(a65b125c7489d7,true).
'x_<=='(x_qmUseDefaultRotOrigin(V1),x_uninferredSentence(x_rotationalOriginByAnnotation(V1,V2)),x_uninferredSentence(x_rotationalOriginByConnection(V1,V2)),x_uninferredSentence(x_rotationalOriginByGear(V1,V2)),x_uninferredSentence(x_rotationalOriginByCordConnection(V1,V2))) :- x_cid(a65b125c7489d8,V1,V2).
xc_microtheory(a65b125c7489d8,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d8,384).
xc_kb_names(a65b125c7489d8,["?obj","?ori"]).
xc_mapping_rows(a65b125c7489d8,[]).
xc_exclude_globals(a65b125c7489d8,true).
'x_<=='(x_rotationalOriginByAnnotation(V1,V2),x_glyphAnnotatedBy(x_GlyphFn(V1,V3),x_AnnotationGlyphFn(V2,V3)),x_lookupOnly(x_wmOnly(x_isa(V2,x_RotOrigin)))) :- x_cid(a65b125c7489d9,V1,V2,V3).
xc_microtheory(a65b125c7489d9,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489d9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489d9,390).
xc_kb_names(a65b125c7489d9,["?obj","?annotation","?layer"]).
xc_mapping_rows(a65b125c7489d9,[]).
xc_exclude_globals(a65b125c7489d9,true).
'x_<=='(x_rotationalOriginByConnection(V1,V2),'x_connectedTo-Directly'(V1,V3),x_different(V1,V3),x_numAnswers(1,x_rotationalOrigin(V3,V4)),x_unifies(V4,V2)) :- x_cid(a65b125c7489da,V1,V2,V3,V4).
xc_microtheory(a65b125c7489da,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489da,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489da,396).
xc_kb_names(a65b125c7489da,["?obj1","?ori","?obj2","?ori2"]).
xc_mapping_rows(a65b125c7489da,[]).
xc_exclude_globals(a65b125c7489da,true).
'x_<=='(x_torqueAppliedToObj(V1,V2,V3),x_torqueAssumed(V1,V2,V3)) :- x_cid(a65b125c7489db,V1,V2,V3).
xc_microtheory(a65b125c7489db,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489db,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489db,406).
xc_kb_names(a65b125c7489db,["?forcee","?rotDir","?source"]).
xc_mapping_rows(a65b125c7489db,[]).
xc_exclude_globals(a65b125c7489db,true).
'x_<=='(x_torqueAppliedToObj(V1,V2,V3),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V1,x_Gear)))),x_hasContactSurface(V1,V3,V4),x_hasContactSurface(V3,V1,V5),x_surfaceContact(V5,V4),x_numAnswers(1,x_forceAt(V5,V6,V3)),x_different(V6,x_ZeroQVector),x_numAnswers(1,x_rotationalOrigin(V1,V7)),x_safeQualitativeVectorBetween(V4,x_CentroidPointFn(V7),V8),x_surfaceNormal(V5,V9),x_openHalfPlane(V10,V8),x_rotate90(V9,V10,V2)) :- x_cid(a65b125c7489dc,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125c7489dc,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489dc,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489dc,410).
xc_kb_names(a65b125c7489dc,["?forcee","?rotDir","?forcer","?forceeSurf","?forcerSurf","?dir","?origin","?oriDir","?sn","?x"]).
xc_mapping_rows(a65b125c7489dc,[]).
xc_exclude_globals(a65b125c7489dc,true).
'x_<=='(x_torqueAppliedToObj(V1,V2,V3),x_forceAssumed(V1,V4,V3),x_isa(V1,x_FixedAxisObject),x_numAnswers(1,x_rotationalOrigin(V1,V5)),x_safeQualitativeVectorBetween(x_CentroidPointFn(V1),x_CentroidPointFn(V5),V6),x_openHalfPlane(V7,V6),x_rotate90(V4,V7,V2)) :- x_cid(a65b125c7489dd,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c7489dd,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489dd,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489dd,427).
xc_kb_names(a65b125c7489dd,["?forcee","?rotDir","?source","?fDir","?origin","?oriDir","?x"]).
xc_mapping_rows(a65b125c7489dd,[]).
xc_exclude_globals(a65b125c7489dd,true).
'x_<=='(x_torqueAppliedToObj(V1,V2,V3),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V1,x_Gear)))),x_lookupOnly(x_wmOnly(x_isa(V1,x_FixedAxisObject))),x_numAnswers(1,x_rotationalOrigin(V1,V4)),'x_connectedTo-Directly'(V1,V3),x_different(V1,V3),x_forceAppliedToObj(V3,V5,V6),x_notSufficientlyConstrained(V3,V5),x_safeQualitativeVectorBetween(x_CentroidPointFn(V3),x_CentroidPointFn(V4),V7),x_openHalfPlane(V8,V7),x_rotate90(V5,V8,V2)) :- x_cid(a65b125c7489de,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c7489de,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489de,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489de,438).
xc_kb_names(a65b125c7489de,["?forcee","?rotDir","?forcer","?origin","?forceDir","?source","?oriDir","?x"]).
xc_mapping_rows(a65b125c7489de,[]).
xc_exclude_globals(a65b125c7489de,true).
'x_<=='(x_netTorque(V1,V2),x_evaluate(V3,x_SensePlusFn(x_TheClosedRetrievalSetOf(V4,x_and(x_torqueAppliedToObj(V1,V5,V6),x_rotSense(V5,V4))))),x_rotSense(V2,V3),x_forceLastModifiedTime(x_GlyphFn(V1,V7),V8)) :- x_cid(a65b125c7489df,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c7489df,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489df,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489df,455).
xc_kb_names(a65b125c7489df,["?obj","?rDir","?sense","?s","?rotDir","?source","?layer","?time"]).
xc_mapping_rows(a65b125c7489df,[]).
xc_exclude_globals(a65b125c7489df,true).
'x_<=='(x_rotFreedom(V1,V2),x_glyphRepresentsObject(V3,V1),x_numAnswers(1,x_rotationalOrigin(V1,V4)),x_lookupOnly(x_isa(V2,x_RotDirection)),x_evaluate(V5,x_CardinalityFn(x_TheClosedRetrievalSetOf(V2,x_rotConstraint(V1,V2)))),x_equals(V5,0),x_inkLastModifiedTime(x_GlyphFn(V1,V6),x_NuSketchSketchTimeFn(V7))) :- x_cid(a65b125c7489e0,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125c7489e0,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e0,469).
xc_kb_names(a65b125c7489e0,["?obj","?rotDir","?glyphfn","?origin","?x","?layer","?time1"]).
xc_mapping_rows(a65b125c7489e0,[]).
xc_exclude_globals(a65b125c7489e0,true).
'x_<=='(x_transFreedom(V1,V2),x_uninferredSentence(x_transConstraint(V1,V2))) :- x_cid(a65b125c7489e1,V1,V2).
xc_microtheory(a65b125c7489e1,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e1,484).
xc_kb_names(a65b125c7489e1,["?obj","?dir"]).
xc_mapping_rows(a65b125c7489e1,[]).
xc_exclude_globals(a65b125c7489e1,true).
'x_<=='(x_transConstraint(V1,V2),x_unknownSentence(x_transFreedom(V1,V2)),x_wmOnly(x_isa(V1,x_FixedRigidObject)),x_lookupOnly(x_isa(V2,x_2DQDirection))) :- x_cid(a65b125c7489e2,V1,V2).
xc_microtheory(a65b125c7489e2,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e2,490).
xc_kb_names(a65b125c7489e2,["?obj","?dir"]).
xc_mapping_rows(a65b125c7489e2,[]).
xc_exclude_globals(a65b125c7489e2,true).
'x_<=='(x_transConstraint(V1,V2),x_unknownSentence(x_transFreedom(V1,V2)),x_lookupOnly(x_wmOnly(x_isa(V1,x_FixedAxisObject))),x_lookupOnly(x_isa(V2,x_2DQDirection))) :- x_cid(a65b125c7489e3,V1,V2).
xc_microtheory(a65b125c7489e3,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e3,495).
xc_kb_names(a65b125c7489e3,["?obj","?dir"]).
xc_mapping_rows(a65b125c7489e3,[]).
xc_exclude_globals(a65b125c7489e3,true).
'x_<=='(x_rotConstraint(V1,V2),x_lookupOnly(x_isa(V2,x_RotDirection)),x_different(V2,x_ZeroRot),x_wmOnly(x_isa(V1,x_FixedRigidObject))) :- x_cid(a65b125c7489e4,V1,V2).
xc_microtheory(a65b125c7489e4,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e4,501).
xc_kb_names(a65b125c7489e4,["?obj","?rotDir"]).
xc_mapping_rows(a65b125c7489e4,[]).
xc_exclude_globals(a65b125c7489e4,true).
'x_<=='(x_sufficientlyConstrained(V1,V2),x_unknownSentence(x_notSufficientlyConstrained(V1,V2)),x_lookupOnly(x_isa(V2,x_2DQDirection)),x_lookupOnly(x_rotate45(V2,V3,x_CW)),x_lookupOnly(x_rotate45(V2,V4,x_CCW)),x_cacheComplete(x_transConstraint(V1,V2)),x_cacheComplete(x_transConstraint(V1,V3)),x_cacheComplete(x_transConstraint(V1,V4))) :- x_cid(a65b125c7489e5,V1,V2,V3,V4).
xc_microtheory(a65b125c7489e5,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e5,524).
xc_kb_names(a65b125c7489e5,["?obj","?dir1","?dir2","?dir3"]).
xc_mapping_rows(a65b125c7489e5,[]).
xc_exclude_globals(a65b125c7489e5,true).
'x_<=='(x_notSufficientlyConstrained(V1,V2),x_honorTimestamps(x_uninferredSentence(x_sufficientlyConstrained(V1,V2))),x_inkLastModifiedTime(x_GlyphFn(V1,V3),x_NuSketchSketchTimeFn(V4))) :- x_cid(a65b125c7489e6,V1,V2,V3,V4).
xc_microtheory(a65b125c7489e6,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e6,534).
xc_kb_names(a65b125c7489e6,["?obj","?dir","?layer","?time"]).
xc_mapping_rows(a65b125c7489e6,[]).
xc_exclude_globals(a65b125c7489e6,true).
'x_<=='(x_rotationallyConstrainedAtSurface(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_uninferredSentence(x_isa(V1,x_FixedObject)),x_surfaceNormal(V2,V3),x_rotationalOrigin(V1,V4),x_safeQualitativeVectorBetween(V2,x_CentroidPointFn(V4),V5),x_rotate90(V3,V6,V7),x_openHalfPlane(V6,V5),x_rotConstraint(V8,V7)) :- x_cid(a65b125c7489e7,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c7489e7,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e7,544).
xc_kb_names(a65b125c7489e7,["?obj","?contactingSurface","?normal","?ori","?dirToOri","?90offNormal","?rotDir","?obj2"]).
xc_mapping_rows(a65b125c7489e7,[]).
xc_exclude_globals(a65b125c7489e7,true).
'x_<=='(x_rotationallyConstrainedAtSurface(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_uninferredSentence(x_isa(V1,x_FixedObject)),x_surfaceNormal(V2,V3),x_rotationalOrigin(V1,V4),x_safeQualitativeVectorBetween(V2,x_CentroidPointFn(V4),V5),x_qvAxisAligned(V3,V6),x_qvAxisAligned(V5,V6)) :- x_cid(a65b125c7489e8,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c7489e8,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e8,557).
xc_kb_names(a65b125c7489e8,["?obj","?contactingSurface","?normal","?ori","?dirToOri","?axis"]).
xc_mapping_rows(a65b125c7489e8,[]).
xc_exclude_globals(a65b125c7489e8,true).
'x_<=='(x_rotationallyConstrainedAtSurface(V1,V2),x_lookupOnly(x_isa(V1,x_FixedObject))) :- x_cid(a65b125c7489e9,V1,V2).
xc_microtheory(a65b125c7489e9,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489e9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489e9,569).
xc_kb_names(a65b125c7489e9,["?obj","?contactingSurface"]).
xc_mapping_rows(a65b125c7489e9,[]).
xc_exclude_globals(a65b125c7489e9,true).
'x_<=='(x_rotationallyConstrainedAtSurface(V1,V2),x_evaluate(x_TheSet,x_TheClosedRetrievalSetOf(V3,x_rotationalOrigin(V1,V3)))) :- x_cid(a65b125c7489ea,V1,V2,V3).
xc_microtheory(a65b125c7489ea,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489ea,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ea,573).
xc_kb_names(a65b125c7489ea,["?obj","?contactingSurface","?ori"]).
xc_mapping_rows(a65b125c7489ea,[]).
xc_exclude_globals(a65b125c7489ea,true).
'x_<=='(x_movable(V1),x_groundExpression(V1),x_lookupOnly(x_wmOnly(x_isa(V1,x_Physob))),x_isa(V2,x_2DQDirection),x_notSufficientlyConstrained(V1,V2)) :- x_cid(a65b125c7489eb,V1,V2).
xc_microtheory(a65b125c7489eb,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489eb,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489eb,579).
xc_kb_names(a65b125c7489eb,["?obj","?dir"]).
xc_mapping_rows(a65b125c7489eb,[]).
xc_exclude_globals(a65b125c7489eb,true).
'x_<=='(x_movable(V1),x_groundExpression(V1),x_lookupOnly(x_wmOnly(x_isa(V1,x_Physob))),x_rotFreedom(V1,V2)) :- x_cid(a65b125c7489ec,V1,V2).
xc_microtheory(a65b125c7489ec,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489ec,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ec,585).
xc_kb_names(a65b125c7489ec,["?obj","?dir"]).
xc_mapping_rows(a65b125c7489ec,[]).
xc_exclude_globals(a65b125c7489ec,true).
'x_<=='(x_rotatable(V1),x_groundExpression(V1),x_lookupOnly(x_wmOnly(x_isa(V1,x_Physob))),x_rotFreedom(V1,V2)) :- x_cid(a65b125c7489ed,V1,V2).
xc_microtheory(a65b125c7489ed,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489ed,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ed,590).
xc_kb_names(a65b125c7489ed,["?obj","?dir"]).
xc_mapping_rows(a65b125c7489ed,[]).
xc_exclude_globals(a65b125c7489ed,true).
'x_<=='(x_transConstraint(V1,V2),x_unknownSentence(x_transFreedom(V1,V2)),x_touchesDirectly(V1,V3),x_lookupOnly(x_wmOnly(x_isa(V3,x_RigidOb))),x_hasContactSurface(V1,V3,V4),x_surfaceNormal(V4,V5),x_allFactsAllowed(x_lookupOnly(x_openHalfPlane(V5,V2))),x_sufficientlyConstrained(V3,V5),x_rotationallyConstrainedAtSurface(V3,V4),x_inkLastModifiedTime(x_GlyphFn(V1,V6),x_NuSketchSketchTimeFn(V7)),x_inkLastModifiedTime(x_GlyphFn(V3,V6),x_NuSketchSketchTimeFn(V8))) :- x_cid(a65b125c7489ee,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c7489ee,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489ee,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ee,611).
xc_kb_names(a65b125c7489ee,["?obj1","?dir","?obj2","?obj1Surf","?normal","?layer","?time1","?time2"]).
xc_mapping_rows(a65b125c7489ee,[]).
xc_exclude_globals(a65b125c7489ee,true).
'x_<=='(x_rotConstraint(V1,V2),x_numAnswers(1,x_rotationalOrigin(V1,V3)),x_hasContactSurface(V1,V4,V5),x_surfaceNormal(V5,V6),x_inkLastModifiedTime(x_GlyphFn(V1,V7),x_NuSketchSketchTimeFn(V8)),x_inkLastModifiedTime(x_GlyphFn(V4,V7),x_NuSketchSketchTimeFn(V9)),x_uninferredSentence(x_enmeshed(V1,V4)),x_sufficientlyConstrained(V4,V6),x_rotationallyConstrainedAtSurface(V4,V5),x_safeQualitativeVectorBetween(V5,x_CentroidPointFn(V3),V10),x_rotate90(V6,V11,V2),x_openHalfPlane(V11,V10)) :- x_cid(a65b125c7489ef,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125c7489ef,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489ef,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ef,626).
xc_kb_names(a65b125c7489ef,["?obj1","?rotDir","?origin","?obj2","?surface","?surfNormal","?layer","?time1","?time2","?dirToOrigin","?surfNormalR90"]).
xc_mapping_rows(a65b125c7489ef,[]).
xc_exclude_globals(a65b125c7489ef,true).
'x_<=='(x_rotConstraint(V1,V2),x_numAnswers(1,x_rotationalOrigin(V1,V3)),x_hasContactSurface(V1,V4,V5),x_uninferredSentence(x_enmeshed(V1,V4)),x_surfaceContact(V5,V6),x_isa(V5,'x_Perceptual-Edge'),x_isa(V6,'x_Perceptual-Edge'),x_inkLastModifiedTime(x_GlyphFn(V1,V7),x_NuSketchSketchTimeFn(V8)),x_inkLastModifiedTime(x_GlyphFn(V4,V7),x_NuSketchSketchTimeFn(V9)),x_sufficientlyConstrained(V4,V10),x_rotationallyConstrainedAtSurface(V4,V11),x_safeQualitativeVectorBetween(V5,x_CentroidPointFn(V3),V12),x_surfaceNormal(V5,V13),x_inverseVector(V12,V13),x_isa(V2,x_RotDirection)) :- x_cid(a65b125c7489f0,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125c7489f0,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f0,647).
xc_kb_names(a65b125c7489f0,["?obj1","?rotDir","?origin","?obj2","?surface1","?surface2","?layer","?time1","?time2","?surfNormal","?surface","?dirToOrigin","?normal"]).
xc_mapping_rows(a65b125c7489f0,[]).
xc_exclude_globals(a65b125c7489f0,true).
'x_<=='(x_forceAppliedToObj(V1,V2,V3),'x_connectedTo-Directly'(V3,V1),x_different(V3,V1),x_lookupOnly(x_wmOnly(x_isa(V3,x_RigidOb))),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V3,x_Spring)))),x_lookupOnly(x_wmOnly(x_isa(V1,x_RigidOb))),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V1,x_Spring)))),x_forceAppliedToObj(V3,V2,V4),x_different(V1,V4)) :- x_cid(a65b125c7489f1,V1,V2,V3,V4).
xc_microtheory(a65b125c7489f1,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f1,684).
xc_kb_names(a65b125c7489f1,["?obj2","?fdir","?obj1","?source"]).
xc_mapping_rows(a65b125c7489f1,[]).
xc_exclude_globals(a65b125c7489f1,true).
'x_<=='(x_torqueAppliedToObj(V1,V2,V3),'x_connectedTo-Directly'(V3,V1),x_different(V3,V1),x_lookupOnly(x_wmOnly(x_isa(V3,x_RigidOb))),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V3,x_Spring)))),x_lookupOnly(x_wmOnly(x_isa(V1,x_RigidOb))),x_uninferredSentence(x_lookupOnly(x_wmOnly(x_isa(V1,x_Spring)))),x_torqueAppliedToObj(V3,V2,V4),x_different(V1,V4)) :- x_cid(a65b125c7489f2,V1,V2,V3,V4).
xc_microtheory(a65b125c7489f2,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f2,694).
xc_kb_names(a65b125c7489f2,["?obj2","?rotDir","?obj1","?source"]).
xc_mapping_rows(a65b125c7489f2,[]).
xc_exclude_globals(a65b125c7489f2,true).
'x_<=='(x_transConstraint(V1,V2),x_unknownSentence(x_transFreedom(V1,V2)),'x_connectedTo-Directly'(V3,V1),x_different(V3,V1),x_lookupOnly(x_wmOnly(x_isa(V3,x_RigidOb))),x_lookupOnly(x_wmOnly(x_isa(V1,x_RigidOb))),x_lookupOnly(x_isa(V2,x_2DQDirection)),x_transConstraint(V3,V2)) :- x_cid(a65b125c7489f3,V1,V2,V3).
xc_microtheory(a65b125c7489f3,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f3,705).
xc_kb_names(a65b125c7489f3,["?obj2","?dir","?obj1"]).
xc_mapping_rows(a65b125c7489f3,[]).
xc_exclude_globals(a65b125c7489f3,true).
'x_<=='(x_rotConstraint(V1,V2),'x_connectedTo-Directly'(V3,V1),x_different(V3,V1),x_lookupOnly(x_wmOnly(x_isa(V3,x_RigidOb))),x_lookupOnly(x_wmOnly(x_isa(V1,x_RigidOb))),x_rotConstraint(V3,V2)) :- x_cid(a65b125c7489f4,V1,V2,V3).
xc_microtheory(a65b125c7489f4,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f4,714).
xc_kb_names(a65b125c7489f4,["?obj2","?dir","?obj1"]).
xc_mapping_rows(a65b125c7489f4,[]).
xc_exclude_globals(a65b125c7489f4,true).
'x_<=='(x_transMotion(V1,V2),x_numAnswers(1,x_netForce(V1,V2)),x_lookupOnly(x_isa(V2,x_2DQDirection)),x_transFreedom(V1,V2)) :- x_cid(a65b125c7489f5,V1,V2).
xc_microtheory(a65b125c7489f5,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f5,730).
xc_kb_names(a65b125c7489f5,["?obj","?dir"]).
xc_mapping_rows(a65b125c7489f5,[]).
xc_exclude_globals(a65b125c7489f5,true).
'x_<=='(x_transMotion(V1,V2),x_numAnswers(1,x_netForce(V1,V3)),x_lookupOnly(x_isa(V3,x_2DQDirection)),x_transConstraint(V1,V3),x_lookupOnly(x_openHalfPlane(V3,V2)),x_transFreedom(V1,V2)) :- x_cid(a65b125c7489f6,V1,V2,V3).
xc_microtheory(a65b125c7489f6,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f6,735).
xc_kb_names(a65b125c7489f6,["?obj","?dir2","?dir1"]).
xc_mapping_rows(a65b125c7489f6,[]).
xc_exclude_globals(a65b125c7489f6,true).
'x_<=='(x_transMotion(V1,V2),x_velocityAssumed(V1,V2),x_different(V2,x_ZeroQVector),x_transFreedom(V1,V2)) :- x_cid(a65b125c7489f7,V1,V2).
xc_microtheory(a65b125c7489f7,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f7,743).
xc_kb_names(a65b125c7489f7,["?obj","?dir"]).
xc_mapping_rows(a65b125c7489f7,[]).
xc_exclude_globals(a65b125c7489f7,true).
'x_<=='(x_transMotion(V1,x_ZeroQVector),x_numAnswers(1,x_netForce(V1,x_ZeroQVector)),x_evaluate(x_TheSet,x_TheClosedRetrievalSetOf(V2,x_velocityAssumed(V1,V2))),x_inkLastModifiedTime(x_GlyphFn(V1,V3),x_NuSketchSketchTimeFn(V4))) :- x_cid(a65b125c7489f8,V1,V2,V3,V4).
xc_microtheory(a65b125c7489f8,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f8,748).
xc_kb_names(a65b125c7489f8,["?obj","?dir","?layer","?time"]).
xc_mapping_rows(a65b125c7489f8,[]).
xc_exclude_globals(a65b125c7489f8,true).
'x_<=='(x_transMotion(V1,x_ZeroQVector),x_numAnswers(1,x_netForce(V1,V2)),x_lookupOnly(x_isa(V2,x_2DQDirection)),x_sufficientlyConstrained(V1,V2),x_inkLastModifiedTime(x_GlyphFn(V1,V3),x_NuSketchSketchTimeFn(V4))) :- x_cid(a65b125c7489f9,V1,V2,V3,V4).
xc_microtheory(a65b125c7489f9,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489f9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489f9,757).
xc_kb_names(a65b125c7489f9,["?obj","?dir","?layer","?time"]).
xc_mapping_rows(a65b125c7489f9,[]).
xc_exclude_globals(a65b125c7489f9,true).
'x_<=='(x_transMotion(V1,x_AmbigQVector),x_numAnswers(1,x_netForceX(V1,V2)),x_unifies(V2,x_Ambig),x_lookupOnly(x_isa(V3,x_2DQDirection)),x_lookupOnly(x_ySense(V3,x_Zero)),x_notSufficientlyConstrained(V1,V3)) :- x_cid(a65b125c7489fa,V1,V2,V3).
xc_microtheory(a65b125c7489fa,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489fa,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489fa,763).
xc_kb_names(a65b125c7489fa,["?obj","?nfs","?dir"]).
xc_mapping_rows(a65b125c7489fa,[]).
xc_exclude_globals(a65b125c7489fa,true).
'x_<=='(x_transMotion(V1,x_AmbigQVector),x_numAnswers(1,x_netForceY(V1,V2)),x_unifies(V2,x_Ambig),x_lookupOnly(x_isa(V3,x_2DQDirection)),x_lookupOnly(x_xSense(V3,x_Zero)),x_notSufficientlyConstrained(V1,V3)) :- x_cid(a65b125c7489fb,V1,V2,V3).
xc_microtheory(a65b125c7489fb,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489fb,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489fb,770).
xc_kb_names(a65b125c7489fb,["?obj","?nfs","?dir"]).
xc_mapping_rows(a65b125c7489fb,[]).
xc_exclude_globals(a65b125c7489fb,true).
'x_<=='(x_rotMotion(V1,V2),x_numAnswers(1,x_netTorque(V1,V2)),x_lookupOnly(x_isa(V2,x_RotDirection)),x_rotFreedom(V1,V2)) :- x_cid(a65b125c7489fc,V1,V2).
xc_microtheory(a65b125c7489fc,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489fc,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489fc,782).
xc_kb_names(a65b125c7489fc,["?obj","?rotDir"]).
xc_mapping_rows(a65b125c7489fc,[]).
xc_exclude_globals(a65b125c7489fc,true).
'x_<=='(x_rotMotion(V1,x_ZeroRot),x_rotConstraint(V1,x_CW),x_rotConstraint(V1,x_CCW)) :- x_cid(a65b125c7489fd,V1).
xc_microtheory(a65b125c7489fd,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489fd,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489fd,787).
xc_kb_names(a65b125c7489fd,["?obj"]).
xc_mapping_rows(a65b125c7489fd,[]).
xc_exclude_globals(a65b125c7489fd,true).
'x_<=='(x_rotMotion(V1,x_ZeroRot),x_netTorque(V1,x_ZeroRot)) :- x_cid(a65b125c7489fe,V1).
xc_microtheory(a65b125c7489fe,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489fe,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489fe,791).
xc_kb_names(a65b125c7489fe,["?obj"]).
xc_mapping_rows(a65b125c7489fe,[]).
xc_exclude_globals(a65b125c7489fe,true).
'x_<=='(x_rotMotion(V1,x_ZeroRot),x_numAnswers(1,x_netTorque(V1,V2)),x_rotConstraint(V1,V2)) :- x_cid(a65b125c7489ff,V1,V2).
xc_microtheory(a65b125c7489ff,x_NuSketchQMRulesMt).
xc_source_file(a65b125c7489ff,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c7489ff,794).
xc_kb_names(a65b125c7489ff,["?obj","?rotDir"]).
xc_mapping_rows(a65b125c7489ff,[]).
xc_exclude_globals(a65b125c7489ff,true).
'x_<=='(x_rotMotion(V1,x_AmbigRot),x_netTorque(V1,x_AmbigRot),x_lookupOnly(x_isa(V2,x_RotDirection)),x_rotFreedom(V1,V2)) :- x_cid(a65b125c748a00,V1,V2).
xc_microtheory(a65b125c748a00,x_NuSketchQMRulesMt).
xc_source_file(a65b125c748a00,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c748a00,798).
xc_kb_names(a65b125c748a00,["?obj","?rotDir"]).
xc_mapping_rows(a65b125c748a00,[]).
xc_exclude_globals(a65b125c748a00,true).
'x_<=='(x_safeOverlappingParts(V1,V2,V3,V4),x_queryContext(V5),x_lookupOnly(x_wmOnly(x_isa(V5,x_NuSketchCase))),x_overlappingParts(V1,V2,V3,V4)) :- x_cid(a65b125c748a01,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c748a01,x_NuSketchQMRulesMt).
xc_source_file(a65b125c748a01,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c748a01,806).
xc_kb_names(a65b125c748a01,["?objA","?objA-part","?objB","?objB-part","?context"]).
xc_mapping_rows(a65b125c748a01,[]).
xc_exclude_globals(a65b125c748a01,true).
'x_<=='(x_safeOverlappingParts(V1,V2,V3,V4),x_queryContext(V5),x_uninferredSentence(x_isa(V5,x_NuSketchCase)),x_wmOnly(x_genlMt(V5,V6)),'x_ist-Information'(V6,x_safeOverlappingParts(V1,V2,V3,V4))) :- x_cid(a65b125c748a02,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125c748a02,x_NuSketchQMRulesMt).
xc_source_file(a65b125c748a02,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c748a02,811).
xc_kb_names(a65b125c748a02,["?objA","?objA-part","?objB","?objB-part","?context","?parentContext"]).
xc_mapping_rows(a65b125c748a02,[]).
xc_exclude_globals(a65b125c748a02,true).
'x_<=='(x_safeQualitativeVectorBetween(V1,V2,V3),x_queryContext(V4),x_lookupOnly(x_wmOnly(x_isa(V4,x_NuSketchCase))),x_qualitativeVectorBetween(V1,V2,V3)) :- x_cid(a65b125c748a03,V1,V2,V3,V4).
xc_microtheory(a65b125c748a03,x_NuSketchQMRulesMt).
xc_source_file(a65b125c748a03,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c748a03,817).
xc_kb_names(a65b125c748a03,["?ptA","?ptB","?dir","?context"]).
xc_mapping_rows(a65b125c748a03,[]).
xc_exclude_globals(a65b125c748a03,true).
'x_<=='(x_safeQualitativeVectorBetween(V1,V2,V3),x_queryContext(V4),x_uninferredSentence(x_isa(V4,x_NuSketchCase)),x_wmOnly(x_genlMt(V4,V5)),'x_ist-Information'(V5,x_qualitativeVectorBetween(V1,V2,V3))) :- x_cid(a65b125c748a04,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c748a04,x_NuSketchQMRulesMt).
xc_source_file(a65b125c748a04,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c748a04,822).
xc_kb_names(a65b125c748a04,["?ptA","?ptB","?dir","?context","?parentContext"]).
xc_mapping_rows(a65b125c748a04,[]).
xc_exclude_globals(a65b125c748a04,true).
'x_<=='(x_safeToTheLeftOf(V1,V2),x_queryContext(V3),x_lookupOnly(x_wmOnly(x_isa(V3,x_NuSketchCase))),x_toTheLeftOf(V1,V2)) :- x_cid(a65b125c748a05,V1,V2,V3).
xc_microtheory(a65b125c748a05,x_NuSketchQMRulesMt).
xc_source_file(a65b125c748a05,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c748a05,828).
xc_kb_names(a65b125c748a05,["?glyph1","?glyph2","?context"]).
xc_mapping_rows(a65b125c748a05,[]).
xc_exclude_globals(a65b125c748a05,true).
'x_<=='(x_safeToTheLeftOf(V1,V2),x_queryContext(V3),x_uninferredSentence(x_isa(V3,x_NuSketchCase)),x_wmOnly(x_genlMt(V3,V4)),'x_ist-Information'(V4,x_toTheLeftOf(V1,V2))) :- x_cid(a65b125c748a06,V1,V2,V3,V4).
xc_microtheory(a65b125c748a06,x_NuSketchQMRulesMt).
xc_source_file(a65b125c748a06,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c748a06,833).
xc_kb_names(a65b125c748a06,["?glyph1","?glyph2","?context","?parentContext"]).
xc_mapping_rows(a65b125c748a06,[]).
xc_exclude_globals(a65b125c748a06,true).
'x_<=='(x_safeToTheRightOf(V1,V2),x_queryContext(V3),x_lookupOnly(x_wmOnly(x_isa(V3,x_NuSketchCase))),x_toTheRightOf(V1,V2)) :- x_cid(a65b125c748a07,V1,V2,V3).
xc_microtheory(a65b125c748a07,x_NuSketchQMRulesMt).
xc_source_file(a65b125c748a07,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c748a07,839).
xc_kb_names(a65b125c748a07,["?glyph1","?glyph2","?context"]).
xc_mapping_rows(a65b125c748a07,[]).
xc_exclude_globals(a65b125c748a07,true).
'x_<=='(x_safeToTheRightOf(V1,V2),x_queryContext(V3),x_uninferredSentence(x_isa(V3,x_NuSketchCase)),x_wmOnly(x_genlMt(V3,V4)),'x_ist-Information'(V4,x_toTheRightOf(V1,V2))) :- x_cid(a65b125c748a08,V1,V2,V3,V4).
xc_microtheory(a65b125c748a08,x_NuSketchQMRulesMt).
xc_source_file(a65b125c748a08,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/QM/qm-rules.krf').
xc_source_line(a65b125c748a08,844).
xc_kb_names(a65b125c748a08,["?glyph1","?glyph2","?context","?parentContext"]).
xc_mapping_rows(a65b125c748a08,[]).
xc_exclude_globals(a65b125c748a08,true).
kb_cache_footer(footer{count:93,digest:'9ff2dc150cf85a32cb98a0f7e9178089f23a58ed1299ba41568e228eb84e8751',headerDigest:cd42d840640daa85b3b70ca40d3a123430ba5cb0d71dd6b1efc659a7114c59c6}).
