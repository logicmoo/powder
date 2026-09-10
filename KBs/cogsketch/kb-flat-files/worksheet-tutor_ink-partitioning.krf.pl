:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:55,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:391,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'443161d5eddb3a8ba409862aa370834fb009fd20fedc98e72062e9d13af62e2c',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:17063,source:'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf',sourceHash:'2ccd17bb57f71a797c8aee5f93ff7d0658ce6ee676769c820c4e6aa8d3344feb',warnings:[]}).
x_isa(x_inkPartitionWorksheetMatchConstraints,x_Relation) :- x_cid(a65b125cc4e3b1).
xc_microtheory(a65b125cc4e3b1,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3b1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3b1,19).
xc_kb_names(a65b125cc4e3b1,[]).
xc_mapping_rows(a65b125cc4e3b1,[]).
x_arity(x_inkPartitionWorksheetMatchConstraints,2) :- x_cid(a65b125cc4e3b2).
xc_microtheory(a65b125cc4e3b2,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3b2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3b2,20).
xc_kb_names(a65b125cc4e3b2,[]).
xc_mapping_rows(a65b125cc4e3b2,[]).
x_arg1Isa(x_inkPartitionWorksheetMatchConstraints,x_InkPartitionRegion) :- x_cid(a65b125cc4e3b3).
xc_microtheory(a65b125cc4e3b3,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3b3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3b3,21).
xc_kb_names(a65b125cc4e3b3,[]).
xc_mapping_rows(a65b125cc4e3b3,[]).
x_arg2Isa(x_inkPartitionWorksheetMatchConstraints,x_List) :- x_cid(a65b125cc4e3b4).
xc_microtheory(a65b125cc4e3b4,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3b4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3b4,22).
xc_kb_names(a65b125cc4e3b4,[]).
xc_mapping_rows(a65b125cc4e3b4,[]).
x_comment(x_inkPartitionWorksheetMatchConstraints,"(inkPartitionWorksheetMatchConstraints ?region ?constraints)\n    indicates that when creating an analogy between the facts about\n    the glyphs in the base and target ink partitioning regions (see \n    #$InkPartitionRegion), the match constraints bound to ?constraints \n    should be used.") :- x_cid(a65b125cc4e3b5).
xc_microtheory(a65b125cc4e3b5,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3b5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3b5,23).
xc_kb_names(a65b125cc4e3b5,[]).
xc_mapping_rows(a65b125cc4e3b5,[]).
x_notForAnalogy(x_inkPartitionWorksheetMatchConstraints) :- x_cid(a65b125cc4e3b6).
xc_microtheory(a65b125cc4e3b6,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3b6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3b6,29).
xc_kb_names(a65b125cc4e3b6,[]).
xc_mapping_rows(a65b125cc4e3b6,[]).
x_defSuggestion('x_TutoringSuggestionsOverallPlan-InkPartitioningRegions-1',x_generateSubsketchTutorSuggestions(V1,V2,V3),':test',x_and(x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_wmOnly(x_lookupOnly(x_glyphCreatedByInkPartitionRegion(V6,V1,V5))))),x_different(V4,x_TheSet),x_solutionForWorksheetStudentWorkspace(V1,V7),x_solutionCaseForWorksheetStudentWorkspace(V1,V8),x_evaluate(V9,x_TheClosedRetrievalSetOf(V10,x_wmOnly(x_lookupOnly('x_ist-Information'(V8,x_glyphCreatedByInkPartitionRegion(V6,V7,V10)))))),x_different(V9,x_TheSet)),':subgoals',t(x_sketchFor(V1,V11),x_tell(x_retractAllAnalogyResults(V11)),x_tell(x_computePositionalRelations(V1)),x_runQueryForQuestions(V1,x_queryForCogSketchWorksheetQuestions),x_suggestionsForStudentInkPartitionRegions(V1,V2,V3))) :- x_cid(a65b125cc4e3b7,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125cc4e3b7,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3b7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3b7,35).
xc_kb_names(a65b125cc4e3b7,["?student-subsketch","?suggestions","?glyph-correspondences","?student-glyphs-in-region","?student-glyph","?region","?solution-subsketch","?solution-case","?solution-glyphs-in-region","?solution-glyph","?sketch"]).
xc_mapping_rows(a65b125cc4e3b7,[]).
x_defSuggestion('x_TutoringSuggestionsOverallPlan-InkPartitioningRegions-2',x_generateSubsketchTutorSuggestions(V1,V2,V3),':test',x_and(x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_wmOnly(x_lookupOnly(x_glyphCreatedByInkPartitionRegion(V6,V1,V5))))),x_unifies(V4,x_TheSet),x_solutionForWorksheetStudentWorkspace(V1,V7),x_solutionCaseForWorksheetStudentWorkspace(V1,V8),x_evaluate(V9,x_TheClosedRetrievalSetOf(V10,x_wmOnly(x_lookupOnly('x_ist-Information'(V8,x_glyphCreatedByInkPartitionRegion(V6,V7,V10)))))),x_different(V9,x_TheSet)),':subgoals',t(x_sketchFor(V1,V11),x_tell(x_retractAllAnalogyResults(V11)),x_tell(x_computePositionalRelations(V1)),x_runQueryForQuestions(V1,x_queryForCogSketchWorksheetQuestions),x_suggestionsForStudentInkPartitionRegions(V1,V2,V3))) :- x_cid(a65b125cc4e3b8,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125cc4e3b8,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3b8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3b8,76).
xc_kb_names(a65b125cc4e3b8,["?student-subsketch","?suggestions","?glyph-correspondences","?student-glyphs-in-region","?student-glyph-1","?region","?solution-subsketch","?solution-case","?solution-glyphs-in-region","?solution-glyph","?sketch"]).
xc_mapping_rows(a65b125cc4e3b8,[]).
x_isa(x_suggestionsForStudentInkPartitionRegions,x_Relation) :- x_cid(a65b125cc4e3b9).
xc_microtheory(a65b125cc4e3b9,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3b9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3b9,120).
xc_kb_names(a65b125cc4e3b9,[]).
xc_mapping_rows(a65b125cc4e3b9,[]).
x_arity(x_suggestionsForStudentInkPartitionRegions,3) :- x_cid(a65b125cc4e3ba).
xc_microtheory(a65b125cc4e3ba,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3ba,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3ba,121).
xc_kb_names(a65b125cc4e3ba,[]).
xc_mapping_rows(a65b125cc4e3ba,[]).
x_arg1Isa(x_suggestionsForStudentInkPartitionRegions,x_NuSketchBundle) :- x_cid(a65b125cc4e3bb).
xc_microtheory(a65b125cc4e3bb,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3bb,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3bb,122).
xc_kb_names(a65b125cc4e3bb,[]).
xc_mapping_rows(a65b125cc4e3bb,[]).
x_arg2Isa(x_suggestionsForStudentInkPartitionRegions,x_List) :- x_cid(a65b125cc4e3bc).
xc_microtheory(a65b125cc4e3bc,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3bc,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3bc,123).
xc_kb_names(a65b125cc4e3bc,[]).
xc_mapping_rows(a65b125cc4e3bc,[]).
x_arg3Isa(x_suggestionsForStudentInkPartitionRegions,'x_Set-Mathematical') :- x_cid(a65b125cc4e3bd).
xc_microtheory(a65b125cc4e3bd,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3bd,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3bd,124).
xc_kb_names(a65b125cc4e3bd,[]).
xc_mapping_rows(a65b125cc4e3bd,[]).
x_notForAnalogy(x_suggestionsForStudentInkPartitionRegions) :- x_cid(a65b125cc4e3be).
xc_microtheory(a65b125cc4e3be,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3be,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3be,125).
xc_kb_names(a65b125cc4e3be,[]).
xc_mapping_rows(a65b125cc4e3be,[]).
x_defSuggestion(x_SuggestionsForStudentInkPartitionRegions,x_suggestionsForStudentInkPartitionRegions(V1,V2,V3),':subgoals',t(x_subSketchGroupRepresentsObject(V1,V4),x_solutionCaseForWorksheetStudentWorkspace(V1,V5),x_evaluate(V6,x_TheClosedRetrievalSetOf(V7,x_and(x_wmOnly(x_lookupOnly(x_nonTransitiveInference('x_ist-Information'(V5,x_isa(V8,x_InkPartitionRegion))))),x_wmOnly(x_lookupOnly('x_ist-Information'(V5,x_glyphRepresentsObject(V7,V8))))))),x_solveSequentially(V9,V6,x_suggestionsForStudentInkPartitionRegion(V1,V9,V10,V11)),x_consolidateInkPartitionRegionSuggestions(V1,V2,V3))) :- x_cid(a65b125cc4e3bf,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125cc4e3bf,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3bf,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3bf,128).
xc_kb_names(a65b125cc4e3bf,["?student-subsketch","?suggestions","?glyph-correspondences","?student-case","?solution-case","?regions","?region","?region-obj","?region2","?suggs2","?glyph-corrs2"]).
xc_mapping_rows(a65b125cc4e3bf,[]).
x_isa(x_consolidateInkPartitionRegionSuggestions,x_Relation) :- x_cid(a65b125cc4e3c0).
xc_microtheory(a65b125cc4e3c0,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c0,155).
xc_kb_names(a65b125cc4e3c0,[]).
xc_mapping_rows(a65b125cc4e3c0,[]).
x_arity(x_consolidateInkPartitionRegionSuggestions,3) :- x_cid(a65b125cc4e3c1).
xc_microtheory(a65b125cc4e3c1,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c1,156).
xc_kb_names(a65b125cc4e3c1,[]).
xc_mapping_rows(a65b125cc4e3c1,[]).
x_arg1Isa(x_consolidateInkPartitionRegionSuggestions,x_NuSketchBundle) :- x_cid(a65b125cc4e3c2).
xc_microtheory(a65b125cc4e3c2,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c2,157).
xc_kb_names(a65b125cc4e3c2,[]).
xc_mapping_rows(a65b125cc4e3c2,[]).
x_arg2Isa(x_consolidateInkPartitionRegionSuggestions,x_List) :- x_cid(a65b125cc4e3c3).
xc_microtheory(a65b125cc4e3c3,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c3,158).
xc_kb_names(a65b125cc4e3c3,[]).
xc_mapping_rows(a65b125cc4e3c3,[]).
x_arg3Isa(x_consolidateInkPartitionRegionSuggestions,'x_Set-Mathematical') :- x_cid(a65b125cc4e3c4).
xc_microtheory(a65b125cc4e3c4,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c4,159).
xc_kb_names(a65b125cc4e3c4,[]).
xc_mapping_rows(a65b125cc4e3c4,[]).
x_notForAnalogy(x_consolidateInkPartitionRegionSuggestions) :- x_cid(a65b125cc4e3c5).
xc_microtheory(a65b125cc4e3c5,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c5,160).
xc_kb_names(a65b125cc4e3c5,[]).
xc_mapping_rows(a65b125cc4e3c5,[]).
x_defSuggestion(x_ConsolidateInkPartitionRegionSuggestions,x_consolidateInkPartitionRegionSuggestions(V1,V2,V3),':subgoals',t(x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_and(x_wmOnly(x_lookupOnly(x_suggestionsForStudentInkPartitionRegion(V1,V6,V7,V8))),x_evaluate(V5,x_ListToSetFn(V7))))),x_evaluate(V9,x_SetOfSetsUnionFn(V4)),x_evaluate(V2,x_SetToListFn(V9)),x_evaluate(V10,x_TheClosedRetrievalSetOf(V11,x_wmOnly(x_lookupOnly(x_suggestionsForStudentInkPartitionRegion(V1,V12,V13,V11))))),x_evaluate(V3,x_SetOfSetsUnionFn(V10)))) :- x_cid(a65b125cc4e3c6,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125cc4e3c6,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c6,163).
xc_kb_names(a65b125cc4e3c6,["?student-subsketch","?suggestions","?glyph-correspondences","?suggs-sets","?suggs","?region1","?suggs-list1","?glyph-corrs1","?suggs-set","?corrs-sets","?glyph-corrs2","?region2","?suggs-list2"]).
xc_mapping_rows(a65b125cc4e3c6,[]).
x_isa(x_suggestionsForStudentInkPartitionRegion,x_Relation) :- x_cid(a65b125cc4e3c7).
xc_microtheory(a65b125cc4e3c7,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c7,189).
xc_kb_names(a65b125cc4e3c7,[]).
xc_mapping_rows(a65b125cc4e3c7,[]).
x_arity(x_suggestionsForStudentInkPartitionRegion,4) :- x_cid(a65b125cc4e3c8).
xc_microtheory(a65b125cc4e3c8,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c8,190).
xc_kb_names(a65b125cc4e3c8,[]).
xc_mapping_rows(a65b125cc4e3c8,[]).
x_arg1Isa(x_suggestionsForStudentInkPartitionRegion,x_NuSketchBundle) :- x_cid(a65b125cc4e3c9).
xc_microtheory(a65b125cc4e3c9,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3c9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3c9,191).
xc_kb_names(a65b125cc4e3c9,[]).
xc_mapping_rows(a65b125cc4e3c9,[]).
x_arg2Isa(x_suggestionsForStudentInkPartitionRegion,x_InkPartitionRegion) :- x_cid(a65b125cc4e3ca).
xc_microtheory(a65b125cc4e3ca,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3ca,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3ca,192).
xc_kb_names(a65b125cc4e3ca,[]).
xc_mapping_rows(a65b125cc4e3ca,[]).
x_arg3Isa(x_suggestionsForStudentInkPartitionRegion,x_List) :- x_cid(a65b125cc4e3cb).
xc_microtheory(a65b125cc4e3cb,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3cb,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3cb,193).
xc_kb_names(a65b125cc4e3cb,[]).
xc_mapping_rows(a65b125cc4e3cb,[]).
x_arg4Isa(x_suggestionsForStudentInkPartitionRegion,'x_Set-Mathematical') :- x_cid(a65b125cc4e3cc).
xc_microtheory(a65b125cc4e3cc,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3cc,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3cc,194).
xc_kb_names(a65b125cc4e3cc,[]).
xc_mapping_rows(a65b125cc4e3cc,[]).
x_notForAnalogy(x_suggestionsForStudentInkPartitionRegion) :- x_cid(a65b125cc4e3cd).
xc_microtheory(a65b125cc4e3cd,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3cd,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3cd,195).
xc_kb_names(a65b125cc4e3cd,[]).
xc_mapping_rows(a65b125cc4e3cd,[]).
x_defSuggestion(x_SuggestionsForStudentInkPartitionRegion,x_suggestionsForStudentInkPartitionRegion(V1,V2,V3,V4),':test',x_and(x_evaluate(V5,x_TheClosedRetrievalSetOf(V6,x_wmOnly(x_lookupOnly(x_glyphCreatedByInkPartitionRegion(V2,V1,V6))))),x_different(V5,x_TheSet)),':subgoals',t(x_bestMatchForStudentInkPartitionRegion(V1,V2,V7),x_suggestionsForStudentMatch(V1,V7,V8,V4),x_maybeAddShapeAndEdgeRepSuggestionsForGlyphCorrespondences(V1,V8,V4,V3))) :- x_cid(a65b125cc4e3ce,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125cc4e3ce,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3ce,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3ce,198).
xc_kb_names(a65b125cc4e3ce,["?student-subsketch","?region","?suggestions","?glyph-correspondences","?student-glyphs","?glyph","?match","?suggestions1"]).
xc_mapping_rows(a65b125cc4e3ce,[]).
x_defSuggestion(x_SuggestionsForStudentInkPartitionRegion_NoGlyphs,x_suggestionsForStudentInkPartitionRegion(V1,V2,V3,V4),':test',x_and(x_evaluate(V5,x_TheClosedRetrievalSetOf(V6,x_wmOnly(x_lookupOnly(x_glyphCreatedByInkPartitionRegion(V2,V1,V6))))),x_unifies(V5,x_TheSet)),':subgoals',t(x_suggestionsTextForMissingGlyphsInInkPartitionRegion(V1,V2,V7),x_unifies(V3,x_TheList(x_CogSketchMissingEntitySuggestionFn(V7,x_TheSet(V2),x_TheSet,x_TheSet))),x_unifies(V4,x_TheSet))) :- x_cid(a65b125cc4e3cf,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125cc4e3cf,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3cf,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3cf,216).
xc_kb_names(a65b125cc4e3cf,["?student-subsketch","?region","?suggestions","?glyph-correspondences","?student-glyphs","?glyph","?text"]).
xc_mapping_rows(a65b125cc4e3cf,[]).
x_isa(x_suggestionsTextForMissingGlyphsInInkPartitionRegion,x_Relation) :- x_cid(a65b125cc4e3d0).
xc_microtheory(a65b125cc4e3d0,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d0,239).
xc_kb_names(a65b125cc4e3d0,[]).
xc_mapping_rows(a65b125cc4e3d0,[]).
x_arity(x_suggestionsTextForMissingGlyphsInInkPartitionRegion,3) :- x_cid(a65b125cc4e3d1).
xc_microtheory(a65b125cc4e3d1,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d1,240).
xc_kb_names(a65b125cc4e3d1,[]).
xc_mapping_rows(a65b125cc4e3d1,[]).
x_arg1Isa(x_suggestionsTextForMissingGlyphsInInkPartitionRegion,x_NuSketchBundle) :- x_cid(a65b125cc4e3d2).
xc_microtheory(a65b125cc4e3d2,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d2,241).
xc_kb_names(a65b125cc4e3d2,[]).
xc_mapping_rows(a65b125cc4e3d2,[]).
x_arg2Isa(x_suggestionsTextForMissingGlyphsInInkPartitionRegion,x_InkPartitionRegion) :- x_cid(a65b125cc4e3d3).
xc_microtheory(a65b125cc4e3d3,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d3,242).
xc_kb_names(a65b125cc4e3d3,[]).
xc_mapping_rows(a65b125cc4e3d3,[]).
x_arg3Isa(x_suggestionsTextForMissingGlyphsInInkPartitionRegion,x_TextString) :- x_cid(a65b125cc4e3d4).
xc_microtheory(a65b125cc4e3d4,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d4,243).
xc_kb_names(a65b125cc4e3d4,[]).
xc_mapping_rows(a65b125cc4e3d4,[]).
x_notForAnalogy(x_suggestionsTextForMissingGlyphsInInkPartitionRegion) :- x_cid(a65b125cc4e3d5).
xc_microtheory(a65b125cc4e3d5,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d5,244).
xc_kb_names(a65b125cc4e3d5,[]).
xc_mapping_rows(a65b125cc4e3d5,[]).
x_defSuggestion(x_SuggestionsTextForMissingGlyphsInInkPartitionRegion,x_suggestionsTextForMissingGlyphsInInkPartitionRegion(V1,V2,V3),':test',x_and(x_solutionCaseForWorksheetStudentWorkspace(V1,V4),x_wmOnly(x_lookupOnly('x_ist-Information'(V4,x_glyphRepresentsObject(V2,V5)))),x_evaluate(V6,x_TheClosedRetrievalSetOf(V7,x_wmOnly(x_lookupOnly('x_ist-Information'(V4,x_nameString(V5,V7)))))),x_unifies(V6,x_TheSet)),':subgoals',t(x_evaluate(V3,"You haven't drawn any glyphs in this region yet."))) :- x_cid(a65b125cc4e3d6,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125cc4e3d6,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d6,247).
xc_kb_names(a65b125cc4e3d6,["?student-subsketch","?region","?text","?solution-case","?region-obj","?namestrings","?namestring"]).
xc_mapping_rows(a65b125cc4e3d6,[]).
x_defSuggestion(x_SuggestionsTextForMissingGlyphsInInkPartitionRegion_namestring,x_suggestionsTextForMissingGlyphsInInkPartitionRegion(V1,V2,V3),':test',x_and(x_solutionCaseForWorksheetStudentWorkspace(V1,V4),x_wmOnly(x_lookupOnly('x_ist-Information'(V4,x_glyphRepresentsObject(V2,V5)))),x_evaluate(V6,x_TheClosedRetrievalSetOf(V7,x_wmOnly(x_lookupOnly('x_ist-Information'(V4,x_nameString(V5,V7)))))),x_different(V6,x_TheSet)),':subgoals',t(x_wmOnly(x_lookupOnly('x_ist-Information'(V4,x_glyphRepresentsObject(V2,V5)))),x_wmOnly(x_lookupOnly('x_ist-Information'(V4,x_nameString(V5,V7)))),x_evaluate(V3,x_ConcatenateStringsFn("You haven't drawn any glyphs in ",V7," yet.")))) :- x_cid(a65b125cc4e3d7,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125cc4e3d7,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d7,268).
xc_kb_names(a65b125cc4e3d7,["?student-subsketch","?region","?text","?solution-case","?region-obj","?namestrings","?namestring"]).
xc_mapping_rows(a65b125cc4e3d7,[]).
x_isa(x_bestMatchForStudentInkPartitionRegion,x_Relation) :- x_cid(a65b125cc4e3d8).
xc_microtheory(a65b125cc4e3d8,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d8,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d8,301).
xc_kb_names(a65b125cc4e3d8,[]).
xc_mapping_rows(a65b125cc4e3d8,[]).
x_arity(x_bestMatchForStudentInkPartitionRegion,3) :- x_cid(a65b125cc4e3d9).
xc_microtheory(a65b125cc4e3d9,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3d9,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3d9,302).
xc_kb_names(a65b125cc4e3d9,[]).
xc_mapping_rows(a65b125cc4e3d9,[]).
x_arg1Isa(x_bestMatchForStudentInkPartitionRegion,x_CogSketchWorkspaceBundle) :- x_cid(a65b125cc4e3da).
xc_microtheory(a65b125cc4e3da,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3da,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3da,303).
xc_kb_names(a65b125cc4e3da,[]).
xc_mapping_rows(a65b125cc4e3da,[]).
x_arg2Isa(x_bestMatchForStudentInkPartitionRegion,x_InkPartitionRegion) :- x_cid(a65b125cc4e3db).
xc_microtheory(a65b125cc4e3db,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3db,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3db,304).
xc_kb_names(a65b125cc4e3db,[]).
xc_mapping_rows(a65b125cc4e3db,[]).
x_arg3Isa(x_bestMatchForStudentInkPartitionRegion,x_AnalogyMatch) :- x_cid(a65b125cc4e3dc).
xc_microtheory(a65b125cc4e3dc,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3dc,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3dc,305).
xc_kb_names(a65b125cc4e3dc,[]).
xc_mapping_rows(a65b125cc4e3dc,[]).
x_arg3Isa(x_bestMatchForStudentInkPartitionRegion,x_Match) :- x_cid(a65b125cc4e3dd).
xc_microtheory(a65b125cc4e3dd,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3dd,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3dd,306).
xc_kb_names(a65b125cc4e3dd,[]).
xc_mapping_rows(a65b125cc4e3dd,[]).
x_comment(x_bestMatchForStudentInkPartitionRegion,"(bestMatchForStudentInkPartitionRegion ?student-subsketch ?region ?match-id) \n   means that ?match-id is the best analogical match between the facts about\n   the glyphs in the student's #$InkPartitionRegion and those in the \n   corresponding #$InkPartitionRegion in the solution.") :- x_cid(a65b125cc4e3de).
xc_microtheory(a65b125cc4e3de,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3de,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3de,307).
xc_kb_names(a65b125cc4e3de,[]).
xc_mapping_rows(a65b125cc4e3de,[]).
x_notForAnalogy(x_bestMatchForStudentInkPartitionRegion) :- x_cid(a65b125cc4e3df).
xc_microtheory(a65b125cc4e3df,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3df,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3df,312).
xc_kb_names(a65b125cc4e3df,[]).
xc_mapping_rows(a65b125cc4e3df,[]).
x_defSuggestion(x_BestMatchForStudentInkPartitionRegion,x_bestMatchForStudentInkPartitionRegion(V1,V2,V3),':subgoals',t(x_solutionCaseForWorksheetStudentWorkspace(V1,V4),x_displayBusyMsgForInkPartitionRegion(V4,V2),x_subSketchGroupRepresentsObject(V1,V5),x_unifies(V6,x_CogSketchTutorInkPartitionRegionCaseFn(V4,V2)),x_unifies(V7,x_CogSketchTutorInkPartitionRegionCaseFn(V5,V2)),x_inkPartitionWorksheetMatchConstraints(V2,V8),x_tell(x_retractAnalogyResults(V6,V7)),x_matchBetween(V6,V7,V8,V9),x_quantitativelyConstrainedMatch(V9,V3))) :- x_cid(a65b125cc4e3e0,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125cc4e3e0,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3e0,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3e0,315).
xc_kb_names(a65b125cc4e3e0,["?student-subsketch","?region","?match","?solution-case","?student-case","?base","?target","?constraints","?match1"]).
xc_mapping_rows(a65b125cc4e3e0,[]).
x_isa(x_displayBusyMsgForInkPartitionRegion,x_Relation) :- x_cid(a65b125cc4e3e1).
xc_microtheory(a65b125cc4e3e1,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3e1,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3e1,334).
xc_kb_names(a65b125cc4e3e1,[]).
xc_mapping_rows(a65b125cc4e3e1,[]).
x_arity(x_displayBusyMsgForInkPartitionRegion,2) :- x_cid(a65b125cc4e3e2).
xc_microtheory(a65b125cc4e3e2,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3e2,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3e2,335).
xc_kb_names(a65b125cc4e3e2,[]).
xc_mapping_rows(a65b125cc4e3e2,[]).
x_arg1Isa(x_displayBusyMsgForInkPartitionRegion,x_Case) :- x_cid(a65b125cc4e3e3).
xc_microtheory(a65b125cc4e3e3,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3e3,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3e3,336).
xc_kb_names(a65b125cc4e3e3,[]).
xc_mapping_rows(a65b125cc4e3e3,[]).
x_arg2Isa(x_displayBusyMsgForInkPartitionRegion,x_InkPartitionRegion) :- x_cid(a65b125cc4e3e4).
xc_microtheory(a65b125cc4e3e4,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3e4,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3e4,337).
xc_kb_names(a65b125cc4e3e4,[]).
xc_mapping_rows(a65b125cc4e3e4,[]).
x_notForAnalogy(x_displayBusyMsgForInkPartitionRegion) :- x_cid(a65b125cc4e3e5).
xc_microtheory(a65b125cc4e3e5,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3e5,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3e5,338).
xc_kb_names(a65b125cc4e3e5,[]).
xc_mapping_rows(a65b125cc4e3e5,[]).
x_defSuggestion(x_DisplayBusyMsgForInkPartitionRegion_NoNamestring,x_displayBusyMsgForInkPartitionRegion(V1,V2),':test',x_and(x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_glyphRepresentsObject(V2,V3)))),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_nameString(V3,V5)))))),x_unifies(V4,x_TheSet)),':subgoals',t(x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_glyphRepresentsObject(V2,V3)))),x_forEffectOnly(x_tell(x_cogSketchBusyMsg("Comparing region ~A to solution ...",x_TheList(V3)))))) :- x_cid(a65b125cc4e3e6,V1,V2,V3,V4,V5).
xc_microtheory(a65b125cc4e3e6,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3e6,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3e6,341).
xc_kb_names(a65b125cc4e3e6,["?solution-case","?region","?region-obj","?namestrings","?namestring"]).
xc_mapping_rows(a65b125cc4e3e6,[]).
x_defSuggestion(x_DisplayBusyMsgForInkPartitionRegion_Namestring,x_displayBusyMsgForInkPartitionRegion(V1,V2),':test',x_and(x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_glyphRepresentsObject(V2,V3)))),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_nameString(V3,V5)))))),x_different(V4,x_TheSet)),':subgoals',t(x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_glyphRepresentsObject(V2,V3)))),x_wmOnly(x_lookupOnly('x_ist-Information'(V1,x_nameString(V3,V5)))),x_forEffectOnly(x_tell(x_cogSketchBusyMsg("Comparing ~A to solution ...",x_TheList(V5)))))) :- x_cid(a65b125cc4e3e7,V1,V2,V3,V4,V5).
xc_microtheory(a65b125cc4e3e7,x_ClassicWorksheetTutorSuggestionsMt).
xc_source_file(a65b125cc4e3e7,'c:/snet/petta/repos/openworld_dr/KBs/cogsketch/kb-flat-files/worksheet-tutor_ink-partitioning.krf').
xc_source_line(a65b125cc4e3e7,363).
xc_kb_names(a65b125cc4e3e7,["?solution-case","?region","?region-obj","?namestrings","?namestring"]).
xc_mapping_rows(a65b125cc4e3e7,[]).
kb_cache_footer(footer{count:55,digest:'443161d5eddb3a8ba409862aa370834fb009fd20fedc98e72062e9d13af62e2c',headerDigest:'7be3e584c14d6772ca74da82d8177f94ab75392229b2878e1805718d1fa1efa0'}).
