:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:49,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:271,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'29819a3b7755575926f0450c96711dcc019309814c235358c5aa287a61833b90',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:11831,source:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf',sourceHash:'04f990a7d5886ed7f8dcdc71c99689b7f5dd4a512c8ffbe7159434bcaa775faa',warnings:[]}).
x_defSuggestion(x_ClassicWorksheetElaboration,x_runQueryForQuestions(V1,V2),':subgoals',t(x_worksheetElaborationQueries(V1,V2,V3),x_different(x_TheList,V3),x_solveSequentially(V4,V3,x_forEffectOnly(V4)))) :- x_cid(a65b125cc34d4d,V1,V2,V3,V4).
xc_microtheory(a65b125cc34d4d,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d4d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d4d,21).
xc_kb_names(a65b125cc34d4d,["?student-subsketch","?qfq-pred","?queries","?query"]).
xc_mapping_rows(a65b125cc34d4d,[]).
x_defSuggestion(x_ClassicWorksheetElaborationNotApplicable,x_runQueryForQuestions(V1,V2),':subgoals',t(x_worksheetElaborationQueries(V1,V2,V3),x_unifies(x_TheList,V3))) :- x_cid(a65b125cc34d4e,V1,V2,V3).
xc_microtheory(a65b125cc34d4e,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d4e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d4e,30).
xc_kb_names(a65b125cc34d4e,["?student-subsketch","?qfq-pred","?queries"]).
xc_mapping_rows(a65b125cc34d4e,[]).
x_isa(x_computeApplicableEdgeAndShapeRepsForSubsketch,x_Relation) :- x_cid(a65b125cc34d4f).
xc_microtheory(a65b125cc34d4f,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d4f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d4f,41).
xc_kb_names(a65b125cc34d4f,[]).
xc_mapping_rows(a65b125cc34d4f,[]).
x_arity(x_computeApplicableEdgeAndShapeRepsForSubsketch,1) :- x_cid(a65b125cc34d50).
xc_microtheory(a65b125cc34d50,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d50,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d50,42).
xc_kb_names(a65b125cc34d50,[]).
xc_mapping_rows(a65b125cc34d50,[]).
x_arg1Isa(x_computeApplicableEdgeAndShapeRepsForSubsketch,x_NuSketchBundle) :- x_cid(a65b125cc34d51).
xc_microtheory(a65b125cc34d51,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d51,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d51,43).
xc_kb_names(a65b125cc34d51,[]).
xc_mapping_rows(a65b125cc34d51,[]).
x_notForAnalogy(x_computeApplicableEdgeAndShapeRepsForSubsketch) :- x_cid(a65b125cc34d52).
xc_microtheory(a65b125cc34d52,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d52,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d52,44).
xc_kb_names(a65b125cc34d52,[]).
xc_mapping_rows(a65b125cc34d52,[]).
x_defSuggestion(x_EdgeAndShapeRepsForSubsketch,x_computeApplicableEdgeAndShapeRepsForSubsketch(V1),':subgoals',t(x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,x_and(x_subSketchGroupFor(V4,V1),x_subSketchFor(V3,V4),x_localOnly(x_lookupOnly(x_isa(V3,x_NuSketchGlyph)))))),x_computeApplicableEdgeAndShapeRepsForGlyphSet(V2))) :- x_cid(a65b125cc34d53,V1,V2,V3,V4).
xc_microtheory(a65b125cc34d53,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d53,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d53,46).
xc_kb_names(a65b125cc34d53,["?subsketch","?glyphs","?glyph1","?layer"]).
xc_mapping_rows(a65b125cc34d53,[]).
x_isa(x_computeApplicableEdgeAndShapeRepsForGlyphSet,x_Relation) :- x_cid(a65b125cc34d54).
xc_microtheory(a65b125cc34d54,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d54,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d54,58).
xc_kb_names(a65b125cc34d54,[]).
xc_mapping_rows(a65b125cc34d54,[]).
x_arity(x_computeApplicableEdgeAndShapeRepsForGlyphSet,1) :- x_cid(a65b125cc34d55).
xc_microtheory(a65b125cc34d55,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d55,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d55,59).
xc_kb_names(a65b125cc34d55,[]).
xc_mapping_rows(a65b125cc34d55,[]).
x_arg1Isa(x_computeApplicableEdgeAndShapeRepsForGlyphSet,'x_Set-Mathematical') :- x_cid(a65b125cc34d56).
xc_microtheory(a65b125cc34d56,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d56,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d56,60).
xc_kb_names(a65b125cc34d56,[]).
xc_mapping_rows(a65b125cc34d56,[]).
x_notForAnalogy(x_computeApplicableEdgeAndShapeRepsForGlyphSet) :- x_cid(a65b125cc34d57).
xc_microtheory(a65b125cc34d57,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d57,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d57,61).
xc_kb_names(a65b125cc34d57,[]).
xc_mapping_rows(a65b125cc34d57,[]).
x_defSuggestion(x_EdgeAndShapeRepsForGlyphSet,x_computeApplicableEdgeAndShapeRepsForGlyphSet(V1),':test',x_unifies(V1,x_TheSet),':subgoals',t(x_unifies(V1,V1))) :- x_cid(a65b125cc34d58,V1).
xc_microtheory(a65b125cc34d58,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d58,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d58,63).
xc_kb_names(a65b125cc34d58,["?glyphs"]).
xc_mapping_rows(a65b125cc34d58,[]).
x_defSuggestion(x_EdgeAndShapeRepsForGlyphSet_NA,x_computeApplicableEdgeAndShapeRepsForGlyphSet(V1),':test',x_different(V1,x_TheSet),':subgoals',t(x_solveSequentially(V2,V1,x_computeApplicableEdgeAndShapeRepsForGlyph(V2)))) :- x_cid(a65b125cc34d59,V1,V2).
xc_microtheory(a65b125cc34d59,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d59,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d59,69).
xc_kb_names(a65b125cc34d59,["?glyphs","?glyph2"]).
xc_mapping_rows(a65b125cc34d59,[]).
x_isa(x_computeApplicableEdgeAndShapeRepsForGlyph,x_Relation) :- x_cid(a65b125cc34d5a).
xc_microtheory(a65b125cc34d5a,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d5a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d5a,78).
xc_kb_names(a65b125cc34d5a,[]).
xc_mapping_rows(a65b125cc34d5a,[]).
x_arity(x_computeApplicableEdgeAndShapeRepsForGlyph,1) :- x_cid(a65b125cc34d5b).
xc_microtheory(a65b125cc34d5b,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d5b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d5b,79).
xc_kb_names(a65b125cc34d5b,[]).
xc_mapping_rows(a65b125cc34d5b,[]).
x_arg1Isa(x_computeApplicableEdgeAndShapeRepsForGlyph,x_NuSketchGlyph) :- x_cid(a65b125cc34d5c).
xc_microtheory(a65b125cc34d5c,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d5c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d5c,80).
xc_kb_names(a65b125cc34d5c,[]).
xc_mapping_rows(a65b125cc34d5c,[]).
x_notForAnalogy(x_computeApplicableEdgeAndShapeRepsForGlyph) :- x_cid(a65b125cc34d5d).
xc_microtheory(a65b125cc34d5d,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d5d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d5d,81).
xc_kb_names(a65b125cc34d5d,[]).
xc_mapping_rows(a65b125cc34d5d,[]).
x_defSuggestion(x_EdgeAndShapeRepsForGlyph_NA,x_computeApplicableEdgeAndShapeRepsForGlyph(V1),':test',x_honorTimestamps(x_uninferredSentence(x_computeECORepsForGlyph(V1,V2,V3))),':subgoals',t(x_unifies(V1,V1))) :- x_cid(a65b125cc34d5e,V1,V2,V3).
xc_microtheory(a65b125cc34d5e,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d5e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d5e,83).
xc_kb_names(a65b125cc34d5e,["?glyph","?eco-thresh1","?eco-thresh2"]).
xc_mapping_rows(a65b125cc34d5e,[]).
x_defSuggestion(x_ECO_RepsForGlyph,x_computeApplicableEdgeAndShapeRepsForGlyph(V1),':test',x_and(x_computeECORepsForGlyph(V1,V2,V3),x_honorTimestamps(x_uninferredSentence(x_computeEdgeCycleRepsForGlyph(V1,V4,V5)))),':subgoals',t(x_forEffectOnly(x_and(x_computeECORepsForGlyph(V1,V2,V3),x_ecoRepresentationsForGlyph(V1,V2,V3,V6,V7,V8))))) :- x_cid(a65b125cc34d5f,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125cc34d5f,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d5f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d5f,92).
xc_kb_names(a65b125cc34d5f,["?glyph","?eco-thresh1","?eco-thresh2","?cycle-thresh1","?cycle-thresh2","?eco-facts-mt","?ecos","?num-ecos"]).
xc_mapping_rows(a65b125cc34d5f,[]).
x_defSuggestion('x_ECO-EdgeCycle_RepsForGlyph',x_computeApplicableEdgeAndShapeRepsForGlyph(V1),':test',x_and(x_computeECORepsForGlyph(V1,V2,V3),x_computeEdgeCycleRepsForGlyph(V1,V4,V5),x_honorTimestamps(x_uninferredSentence(x_computeEdgeRepsForGlyph(V1,V6,V7)))),':subgoals',t(x_forEffectOnly(x_and(x_computeECORepsForGlyph(V1,V2,V3),x_computeEdgeCycleRepsForGlyph(V1,V4,V5),x_ecoRepresentationsForGlyph(V1,V2,V3,V8,V9,V10),x_elementOf(V11,V9),'x_ist-Information'(V8,x_edgeCycleRepresentationsFor(V11,V4,V5,V12,V13,V14)))))) :- x_cid(a65b125cc34d60,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b125cc34d60,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d60,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d60,103).
xc_kb_names(a65b125cc34d60,["?glyph","?eco-thresh1","?eco-thresh2","?cycle-thresh1","?cycle-thresh2","?edge-thresh1","?edge-thresh2","?eco-facts-mt","?ecos","?num-ecos","?eco","?edge-cycle-facts-mt","?edge-cycles","?num-edge-cycles"]).
xc_mapping_rows(a65b125cc34d60,[]).
x_defSuggestion('x_ECO-EdgeCycle-Edge_RepsForGlyph',x_computeApplicableEdgeAndShapeRepsForGlyph(V1),':test',x_and(x_computeECORepsForGlyph(V1,V2,V3),x_computeEdgeCycleRepsForGlyph(V1,V4,V5),x_computeEdgeRepsForGlyph(V1,V6,V7)),':subgoals',t(x_forEffectOnly(x_and(x_computeECORepsForGlyph(V1,V2,V3),x_computeEdgeCycleRepsForGlyph(V1,V4,V5),x_computeEdgeRepsForGlyph(V1,V6,V7),x_ecoRepresentationsForGlyph(V1,V2,V3,V8,V9,V10),x_elementOf(V11,V9),'x_ist-Information'(V8,x_edgeCycleRepresentationsFor(V11,V4,V5,V12,V13,V14)),x_elementOf(V15,V13),'x_ist-Information'(V12,x_boundingEdgeRepresentationsForEdgeCycle(V15,V6,V7,V16,V17,V18)))))) :- x_cid(a65b125cc34d61,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18).
xc_microtheory(a65b125cc34d61,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d61,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d61,122).
xc_kb_names(a65b125cc34d61,["?glyph","?eco-thresh1","?eco-thresh2","?cycle-thresh1","?cycle-thresh2","?edge-thresh1","?edge-thresh2","?eco-facts-mt","?ecos","?num-ecos","?eco","?edge-cycle-facts-mt","?edge-cycles","?num-edge-cycles","?edge-cycle","?edge-facts-mt","?edges","?num-edges"]).
xc_mapping_rows(a65b125cc34d61,[]).
x_isa(x_computeApplicableECOFactsForSubsketch,x_Relation) :- x_cid(a65b125cc34d62).
xc_microtheory(a65b125cc34d62,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d62,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d62,149).
xc_kb_names(a65b125cc34d62,[]).
xc_mapping_rows(a65b125cc34d62,[]).
x_arity(x_computeApplicableECOFactsForSubsketch,1) :- x_cid(a65b125cc34d63).
xc_microtheory(a65b125cc34d63,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d63,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d63,150).
xc_kb_names(a65b125cc34d63,[]).
xc_mapping_rows(a65b125cc34d63,[]).
x_arg1Isa(x_computeApplicableECOFactsForSubsketch,x_NuSketchBundle) :- x_cid(a65b125cc34d64).
xc_microtheory(a65b125cc34d64,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d64,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d64,151).
xc_kb_names(a65b125cc34d64,[]).
xc_mapping_rows(a65b125cc34d64,[]).
x_notForAnalogy(x_computeApplicableECOFactsForSubsketch) :- x_cid(a65b125cc34d65).
xc_microtheory(a65b125cc34d65,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d65,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d65,152).
xc_kb_names(a65b125cc34d65,[]).
xc_mapping_rows(a65b125cc34d65,[]).
x_isa(x_computeApplicableECOFactsForGlyphSet,x_Relation) :- x_cid(a65b125cc34d66).
xc_microtheory(a65b125cc34d66,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d66,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d66,154).
xc_kb_names(a65b125cc34d66,[]).
xc_mapping_rows(a65b125cc34d66,[]).
x_arity(x_computeApplicableECOFactsForGlyphSet,1) :- x_cid(a65b125cc34d67).
xc_microtheory(a65b125cc34d67,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d67,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d67,155).
xc_kb_names(a65b125cc34d67,[]).
xc_mapping_rows(a65b125cc34d67,[]).
x_arg1Isa(x_computeApplicableECOFactsForGlyphSet,'x_Set-Mathematical') :- x_cid(a65b125cc34d68).
xc_microtheory(a65b125cc34d68,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d68,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d68,156).
xc_kb_names(a65b125cc34d68,[]).
xc_mapping_rows(a65b125cc34d68,[]).
x_notForAnalogy(x_computeApplicableECOFactsForGlyphSet) :- x_cid(a65b125cc34d69).
xc_microtheory(a65b125cc34d69,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d69,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d69,157).
xc_kb_names(a65b125cc34d69,[]).
xc_mapping_rows(a65b125cc34d69,[]).
x_isa(x_computeApplicableECOFactsForGlyph,x_Relation) :- x_cid(a65b125cc34d6a).
xc_microtheory(a65b125cc34d6a,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d6a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d6a,159).
xc_kb_names(a65b125cc34d6a,[]).
xc_mapping_rows(a65b125cc34d6a,[]).
x_arity(x_computeApplicableECOFactsForGlyph,2) :- x_cid(a65b125cc34d6b).
xc_microtheory(a65b125cc34d6b,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d6b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d6b,160).
xc_kb_names(a65b125cc34d6b,[]).
xc_mapping_rows(a65b125cc34d6b,[]).
x_arg1Isa(x_computeApplicableECOFactsForGlyph,x_NuSketchGlyph) :- x_cid(a65b125cc34d6c).
xc_microtheory(a65b125cc34d6c,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d6c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d6c,161).
xc_kb_names(a65b125cc34d6c,[]).
xc_mapping_rows(a65b125cc34d6c,[]).
x_arg2Isa(x_computeApplicableECOFactsForGlyph,'x_Set-Mathematical') :- x_cid(a65b125cc34d6d).
xc_microtheory(a65b125cc34d6d,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d6d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d6d,162).
xc_kb_names(a65b125cc34d6d,[]).
xc_mapping_rows(a65b125cc34d6d,[]).
x_notForAnalogy(x_computeApplicableECOFactsForGlyph) :- x_cid(a65b125cc34d6e).
xc_microtheory(a65b125cc34d6e,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d6e,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d6e,163).
xc_kb_names(a65b125cc34d6e,[]).
xc_mapping_rows(a65b125cc34d6e,[]).
x_defSuggestion(x_ECOFactsForSubsketch,x_computeApplicableECOFactsForSubsketch(V1),':subgoals',t(x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,x_and(x_subSketchGroupFor(V4,V1),x_subSketchFor(V3,V4),x_localOnly(x_lookupOnly(x_isa(V3,x_NuSketchGlyph)))))),x_computeApplicableECOFactsForGlyphSet(V2))) :- x_cid(a65b125cc34d6f,V1,V2,V3,V4).
xc_microtheory(a65b125cc34d6f,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d6f,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d6f,167).
xc_kb_names(a65b125cc34d6f,["?subsketch","?glyphs","?glyph1","?layer"]).
xc_mapping_rows(a65b125cc34d6f,[]).
x_defSuggestion(x_ECOFactsForGlyphSet_NA,x_computeApplicableECOFactsForGlyphSet(V1),':test',x_unifies(V1,x_TheSet),':subgoals',t(x_unifies(V1,V1))) :- x_cid(a65b125cc34d70,V1).
xc_microtheory(a65b125cc34d70,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d70,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d70,179).
xc_kb_names(a65b125cc34d70,["?glyphs"]).
xc_mapping_rows(a65b125cc34d70,[]).
x_defSuggestion(x_ECOFactsForGlyphSet,x_computeApplicableECOFactsForGlyphSet(V1),':test',x_different(V1,x_TheSet),':subgoals',t(x_solveSequentially(V2,V1,x_computeApplicableECOFactsForGlyph(V2,V3)))) :- x_cid(a65b125cc34d71,V1,V2,V3).
xc_microtheory(a65b125cc34d71,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d71,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d71,185).
xc_kb_names(a65b125cc34d71,["?glyphs","?glyph","?ecos"]).
xc_mapping_rows(a65b125cc34d71,[]).
x_defSuggestion(x_ECOFactsForGlyph_NA,x_computeApplicableECOFactsForGlyph(V1,V2),':test',x_honorTimestamps(x_uninferredSentence(x_computeECORepsForGlyph(V1,V3,V4))),':subgoals',t(x_unifies(V2,x_TheSet))) :- x_cid(a65b125cc34d72,V1,V2,V3,V4).
xc_microtheory(a65b125cc34d72,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d72,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d72,194).
xc_kb_names(a65b125cc34d72,["?glyph","?ecos","?eco-thresh1","?eco-thresh2"]).
xc_mapping_rows(a65b125cc34d72,[]).
x_defSuggestion(x_ECOFactsForGlyph,x_computeApplicableECOFactsForGlyph(V1,V2),':test',x_computeECORepsForGlyph(V1,V3,V4),':subgoals',t(x_computeECORepsForGlyph(V1,V3,V4),x_ecoRepresentationsForGlyph(V1,V3,V4,V5,V2,V6))) :- x_cid(a65b125cc34d73,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125cc34d73,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d73,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d73,201).
xc_kb_names(a65b125cc34d73,["?glyph","?ecos","?eco-thresh1","?eco-thresh2","?eco-facts-mt","?num-ecos"]).
xc_mapping_rows(a65b125cc34d73,[]).
x_isa(x_computeApplicableEdgeCycleFactsForECO,x_Relation) :- x_cid(a65b125cc34d74).
xc_microtheory(a65b125cc34d74,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d74,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d74,212).
xc_kb_names(a65b125cc34d74,[]).
xc_mapping_rows(a65b125cc34d74,[]).
x_arity(x_computeApplicableEdgeCycleFactsForECO,3) :- x_cid(a65b125cc34d75).
xc_microtheory(a65b125cc34d75,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d75,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d75,213).
xc_kb_names(a65b125cc34d75,[]).
xc_mapping_rows(a65b125cc34d75,[]).
x_arg1Isa(x_computeApplicableEdgeCycleFactsForECO,x_NuSketchGlyph) :- x_cid(a65b125cc34d76).
xc_microtheory(a65b125cc34d76,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d76,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d76,214).
xc_kb_names(a65b125cc34d76,[]).
xc_mapping_rows(a65b125cc34d76,[]).
x_arg2Isa(x_computeApplicableEdgeCycleFactsForECO,x_PerceptualEdgeConnectedObject) :- x_cid(a65b125cc34d77).
xc_microtheory(a65b125cc34d77,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d77,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d77,215).
xc_kb_names(a65b125cc34d77,[]).
xc_mapping_rows(a65b125cc34d77,[]).
x_arg3Isa(x_computeApplicableEdgeCycleFactsForECO,'x_Set-Mathematical') :- x_cid(a65b125cc34d78).
xc_microtheory(a65b125cc34d78,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d78,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d78,216).
xc_kb_names(a65b125cc34d78,[]).
xc_mapping_rows(a65b125cc34d78,[]).
x_notForAnalogy(x_computeApplicableEdgeCycleFactsForECO) :- x_cid(a65b125cc34d79).
xc_microtheory(a65b125cc34d79,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d79,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d79,217).
xc_kb_names(a65b125cc34d79,[]).
xc_mapping_rows(a65b125cc34d79,[]).
x_defSuggestion(x_EdgeCycleFactsForECO_NA,x_computeApplicableEdgeCycleFactsForECO(V1,V2,V3),':test',x_honorTimestamps(x_uninferredSentence(x_computeEdgeCycleRepsForGlyph(V1,V4,V5))),':subgoals',t(x_unifies(V3,x_TheSet))) :- x_cid(a65b125cc34d7a,V1,V2,V3,V4,V5).
xc_microtheory(a65b125cc34d7a,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d7a,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d7a,220).
xc_kb_names(a65b125cc34d7a,["?glyph","?eco","?edge-cycles","?cycle-thresh1","?cycle-thresh2"]).
xc_mapping_rows(a65b125cc34d7a,[]).
x_defSuggestion(x_EdgeCycleFactsForECO,x_computeApplicableEdgeCycleFactsForECO(V1,V2,V3),':test',x_computeEdgeCycleRepsForGlyph(V1,V4,V5),':subgoals',t(x_computeEdgeCycleRepsForGlyph(V1,V4,V5),x_lookupOnly(x_ecoRepresentationsForGlyph(V1,V6,V7,V8,V9,V10)),x_elementOf(V2,V9),'x_ist-Information'(V8,x_edgeCycleRepresentationsFor(V2,V4,V5,V11,V3,V12)))) :- x_cid(a65b125cc34d7b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125cc34d7b,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d7b,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d7b,227).
xc_kb_names(a65b125cc34d7b,["?glyph","?eco","?edge-cycles","?cycle-thresh1","?cycle-thresh2","?eco-thresh1","?eco-thresh2","?eco-facts-mt","?ecos","?num-ecos","?edge-cycle-facts-mt","?num-edge-cycles"]).
xc_mapping_rows(a65b125cc34d7b,[]).
x_defSuggestion(x_EdgeFactsForEdgeCycle_NA,x_computeApplicableEdgeFactsForEdgeCycle(V1,V2,V3),':test',x_honorTimestamps(x_uninferredSentence(x_computeEdgeRepsForGlyph(V1,V4,V5))),':subgoals',t(x_unifies(V3,x_TheSet))) :- x_cid(a65b125cc34d7c,V1,V2,V3,V4,V5).
xc_microtheory(a65b125cc34d7c,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d7c,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d7c,245).
xc_kb_names(a65b125cc34d7c,["?glyph","?edge-cycle","?edges","?edge-thresh1","?edge-thresh2"]).
xc_mapping_rows(a65b125cc34d7c,[]).
x_defSuggestion(x_EdgeFactsForEdgeCycle,x_computeApplicableEdgeFactsForEdgeCycle(V1,V2,V3),':test',x_computeEdgeRepsForGlyph(V1,V4,V5),':subgoals',t(x_computeEdgeRepsForGlyph(V1,V4,V5),x_lookupOnly(x_ecoRepMtFor(V1,V6)),x_lookupOnly('x_ist-Information'(V6,x_edgeCycleRepresentationsFor(V7,V8,V9,V10,V11,V12))),x_elementOf(V2,V11),'x_ist-Information'(V10,x_boundingEdgeRepresentationsForEdgeCycle(V2,V4,V5,V13,V3,V14)))) :- x_cid(a65b125cc34d7d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b125cc34d7d,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc34d7d,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_elaboration.krf').
xc_source_line(a65b125cc34d7d,252).
xc_kb_names(a65b125cc34d7d,["?glyph","?edge-cycle","?edges","?edge-thresh1","?edge-thresh2","?eco-facts-mt","?eco","?cycle-thresh1","?cycle-thresh2","?edge-cycle-facts-mt","?edge-cycles","?num-edge-cycles","?edge-facts-mt","?num-edges"]).
xc_mapping_rows(a65b125cc34d7d,[]).
kb_cache_footer(footer{count:49,digest:'29819a3b7755575926f0450c96711dcc019309814c235358c5aa287a61833b90',headerDigest:'5f17a7104db2c55f42bd73b0ecf0e33b748a893cb16c23973235bc1d37dc7ffc'}).
