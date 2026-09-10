:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:19,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:97,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'3418d70ec76be1bb0122c7f28baf56856554c6bd7d7936fb69a49ef957568a57',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:4385,source:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf',sourceHash:'939653fa842883851bab5ec7a7a9445d623830f239a2b0c1cfb77b64299dd06f',warnings:[]}).
x_isa(x_VisualQuantitiesMt,x_Microtheory) :- x_cid(a65b125ca27d63).
xc_microtheory(a65b125ca27d63,'x_visual-quantitiesMt').
xc_source_file(a65b125ca27d63,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d63,13).
xc_kb_names(a65b125ca27d63,[]).
xc_mapping_rows(a65b125ca27d63,[]).
x_genlMt(x_NuSketchReasoningCollectorMt,x_VisualQuantitiesMt) :- x_cid(a65b125ca27d64).
xc_microtheory(a65b125ca27d64,'x_visual-quantitiesMt').
xc_source_file(a65b125ca27d64,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d64,14).
xc_kb_names(a65b125ca27d64,[]).
xc_mapping_rows(a65b125ca27d64,[]).
x_comment("This microtheory supports reasoning about visual quantities.  This includes\nreasoning about instances of #$VisualQuantity and inferring #$visualQuantityMeasurement facts.") :- x_cid(a65b125ca27d65).
xc_microtheory(a65b125ca27d65,'x_visual-quantitiesMt').
xc_source_file(a65b125ca27d65,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d65,15).
xc_kb_names(a65b125ca27d65,[]).
xc_mapping_rows(a65b125ca27d65,[]).
x_isa(x_MajorAxisAngleFn,x_ContinuousQuantityDenotingFn) :- x_cid(a65b125ca27d66).
xc_microtheory(a65b125ca27d66,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d66,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d66,24).
xc_kb_names(a65b125ca27d66,[]).
xc_mapping_rows(a65b125ca27d66,[]).
x_arg1Isa(x_MajorAxisAngleFn,x_NuSketchGlyph) :- x_cid(a65b125ca27d67).
xc_microtheory(a65b125ca27d67,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d67,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d67,27).
xc_kb_names(a65b125ca27d67,[]).
xc_mapping_rows(a65b125ca27d67,[]).
x_resultIsa(x_MajorAxisAngleFn,x_VisualQuantity) :- x_cid(a65b125ca27d68).
xc_microtheory(a65b125ca27d68,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d68,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d68,28).
xc_kb_names(a65b125ca27d68,[]).
xc_mapping_rows(a65b125ca27d68,[]).
x_comment(x_MajorAxisAngleFn,"Refers to the major axis angle of a glyph.  The major axis angle\nis the angle between the major axis of the glyph and the horizontal axis of the sketch.") :- x_cid(a65b125ca27d69).
xc_microtheory(a65b125ca27d69,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d69,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d69,29).
xc_kb_names(a65b125ca27d69,[]).
xc_mapping_rows(a65b125ca27d69,[]).
'x_<=='(x_visualQuantityMeasurement(x_MajorAxisAngleFn(V1),V2),x_lookupOnly(x_glyphRepresentsObject(V1,V3)),x_majorAxisAngle(V3,V4),x_different(V4,':rotational-symmetry'),x_evaluate(V2,x_QuantityConversionFn('x_Degree-UnitOfAngularMeasure',V4))) :- x_cid(a65b125ca27d6a,V1,V2,V3,V4).
xc_microtheory(a65b125ca27d6a,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d6a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d6a,33).
xc_kb_names(a65b125ca27d6a,["?glyph","?degrees","?object","?radians"]).
xc_mapping_rows(a65b125ca27d6a,[]).
x_isa(x_ArrowOrientationFn,x_ContinuousQuantityDenotingFn) :- x_cid(a65b125ca27d6b).
xc_microtheory(a65b125ca27d6b,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d6b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d6b,47).
xc_kb_names(a65b125ca27d6b,[]).
xc_mapping_rows(a65b125ca27d6b,[]).
x_arg1Isa(x_ArrowOrientationFn,x_NuSketchGlyph) :- x_cid(a65b125ca27d6c).
xc_microtheory(a65b125ca27d6c,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d6c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d6c,50).
xc_kb_names(a65b125ca27d6c,[]).
xc_mapping_rows(a65b125ca27d6c,[]).
x_resultIsa(x_ArrowOrientationFn,x_VisualQuantity) :- x_cid(a65b125ca27d6d).
xc_microtheory(a65b125ca27d6d,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d6d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d6d,51).
xc_kb_names(a65b125ca27d6d,[]).
xc_mapping_rows(a65b125ca27d6d,[]).
x_comment(x_ArrowOrientationFn,"Denotes the orientation of an angle in degrees.  For example, an arrow pointing right\nhas an orientation of 0 degrees, pointing up is 90 degrees, pointing left is 180 degrees\nand pointing down is 270 degrees.") :- x_cid(a65b125ca27d6e).
xc_microtheory(a65b125ca27d6e,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d6e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d6e,52).
xc_kb_names(a65b125ca27d6e,[]).
xc_mapping_rows(a65b125ca27d6e,[]).
'x_<=='(x_visualQuantityMeasurement(x_ArrowOrientationFn(V1),V2),x_lookupOnly(x_glyphRepresentsObject(V1,V3)),x_arrowOrientation(V1,V4),x_evaluate(V2,x_QuantityConversionFn('x_Degree-UnitOfAngularMeasure',V4))) :- x_cid(a65b125ca27d6f,V1,V2,V3,V4).
xc_microtheory(a65b125ca27d6f,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d6f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d6f,57).
xc_kb_names(a65b125ca27d6f,["?glyph","?degrees","?object","?radians"]).
xc_mapping_rows(a65b125ca27d6f,[]).
'x_<=='(x_visualQuantityMeasurement(x_ArrowOrientationFn(V1),t(V2,V3)),x_groundExpression(V2),x_lookupOnly(x_glyphRepresentsObject(V1,V4)),x_arrowOrientation(V1,V5),x_evaluate(V3,x_QuantityConversionFn(V2,V5))) :- x_cid(a65b125ca27d70,V1,V2,V3,V4,V5).
xc_microtheory(a65b125ca27d70,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d70,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d70,63).
xc_kb_names(a65b125ca27d70,["?glyph","?units","?value","?object","?radians"]).
xc_mapping_rows(a65b125ca27d70,[]).
x_isa(x_DirectionOfMovementFn,x_ContinuousQuantityDenotingFn) :- x_cid(a65b125ca27d71).
xc_microtheory(a65b125ca27d71,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d71,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d71,74).
xc_kb_names(a65b125ca27d71,[]).
xc_mapping_rows(a65b125ca27d71,[]).
x_arg1Isa(x_DirectionOfMovementFn,x_SpatialThing) :- x_cid(a65b125ca27d72).
xc_microtheory(a65b125ca27d72,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d72,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d72,77).
xc_kb_names(a65b125ca27d72,[]).
xc_mapping_rows(a65b125ca27d72,[]).
x_resultIsa(x_DirectionOfMovementFn,x_VisualQuantity) :- x_cid(a65b125ca27d73).
xc_microtheory(a65b125ca27d73,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d73,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d73,78).
xc_kb_names(a65b125ca27d73,[]).
xc_mapping_rows(a65b125ca27d73,[]).
x_comment(x_DirectionOfMovementFn,"Denotes the direction of movement of a spatial thing.  This is linked to the\n#$ArrowOrientationFn of a #$DirectionOfMovement annotation of that spatial thing.\nFor instance, if Object-1 is annotated by Object-2 and Object-2 is a direction of\nmovement annotation for Object-1, the (DirectionOfMovementFn Object-1) will be\nequal to (ArrowOrientationFn Object-2).") :- x_cid(a65b125ca27d74).
xc_microtheory(a65b125ca27d74,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d74,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d74,79).
xc_kb_names(a65b125ca27d74,[]).
xc_mapping_rows(a65b125ca27d74,[]).
'x_<=='(x_visualQuantityMeasurement(x_DirectionOfMovementFn(V1),V2),x_glyphRepresentsObject(V3,V1),x_lookupOnly(x_glyphAnnotatedBy(V3,V4)),x_annotationGlyphRepresentsObject(V4,V5),x_lookupOnly(x_isa(V5,x_DirectionOfMovement)),x_visualQuantityMeasurement(x_ArrowOrientationFn(V4),V2)) :- x_cid(a65b125ca27d75,V1,V2,V3,V4,V5).
xc_microtheory(a65b125ca27d75,x_VisualQuantitiesMt).
xc_source_file(a65b125ca27d75,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/nusketch/visual-quantities.krf').
xc_source_line(a65b125ca27d75,86).
xc_kb_names(a65b125ca27d75,["?object","?degrees","?glyph","?annotation-glyph","?annotation"]).
xc_mapping_rows(a65b125ca27d75,[]).
kb_cache_footer(footer{count:19,digest:'3418d70ec76be1bb0122c7f28baf56856554c6bd7d7936fb69a49ef957568a57',headerDigest:cef094ab6d71875c5924bf6e02a3a212815fd64d525009fe3c446e9e657331e2}).
