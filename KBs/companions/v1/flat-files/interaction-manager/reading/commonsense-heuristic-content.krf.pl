:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:75,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:446,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'4a8d4e91e84350e7b4b229aec5d16339f5faf060da452835e621cc586f89bedc',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:25703,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf',sourceHash:'4391f452e81b505d4229905cf579da797e898cbcb21e0b573c13b3923b22f0e6',warnings:[]}).
x_genlMt('x_Interaction-ManagerMt',x_CommonSenseHeuristicMt) :- x_cid(a65b125d5eea6a).
xc_microtheory(a65b125d5eea6a,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea6a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea6a,14).
xc_kb_names(a65b125d5eea6a,[]).
xc_mapping_rows(a65b125d5eea6a,[]).
'x_<=='(x_gatherDiscourseFactsAndChoices(V1),x_outsourcedOnly(x_currentDiscourseId(V2)),x_wmOnly(x_evaluate(V3,x_TheClosedRetrievalSetOf(x_choice(V4,V5,V6),'x_ist-Information'(x_DiscourseCaseFn(V2),x_choice(V4,V5,V6))))),x_wmOnly(x_evaluate(V7,x_TheClosedRetrievalSetOf(x_isa(V8,V9),'x_ist-Information'(x_DrsCaseFn(V2),x_isa(V8,V9))))),x_evaluate(V1,x_SetOrCollectionUnionFn(V3,V7))) :- x_cid(a65b125d5eea6b,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125d5eea6b,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea6b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea6b,24).
xc_kb_names(a65b125d5eea6b,["?factsAndChoices","?discourse-id","?choices","?choice-set-id","?choice-id","?choice","?facts","?x","?y"]).
xc_mapping_rows(a65b125d5eea6b,[]).
'x_<=='(x_favorCommonsense(V1,x_ChoiceFavorFn(V2)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V3)),x_evaluate(V4,x_TheClosedRetrievalSetOf(V5,x_cacheComplete(x_makesNoCommonSense(V1,x_ChoiceFavorFn(V5))))),x_evaluate(V6,x_TheClosedRetrievalSetOf(V2,x_cacheComplete(x_makesCommonSense(V1,x_ChoiceFavorFn(V2))))),x_evaluate(V7,x_MakeFormulaFn(x_PlusFn,V6)),x_evaluate(V8,x_MakeFormulaFn(x_PlusFn,V4)),x_evaluate(V9,V7),x_evaluate(V10,V8),x_evaluate(V2,x_PlusFn(V9,V10))) :- x_cid(a65b125d5eea6c,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125d5eea6c,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea6c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea6c,63).
xc_kb_names(a65b125d5eea6c,["?choice","?f3","?factsAndChoices","?disfavors","?f2","?favors","?formula","?formula2","?f4","?f5"]).
xc_mapping_rows(a65b125d5eea6c,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_subexpressionMatching(x_performedBy(V2,V2),V1,V3)) :- x_cid(a65b125d5eea6d,V1,V2,V3).
xc_microtheory(a65b125d5eea6d,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea6d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea6d,83).
xc_kb_names(a65b125d5eea6d,["?choice","?var","?performsItself"]).
xc_mapping_rows(a65b125d5eea6d,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_subexpressionMatching(x_objectOfStateChange(V2,V2),V1,V3)) :- x_cid(a65b125d5eea6e,V1,V2,V3).
xc_microtheory(a65b125d5eea6e,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea6e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea6e,86).
xc_kb_names(a65b125d5eea6e,["?choice","?var","?performsItself"]).
xc_mapping_rows(a65b125d5eea6e,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-3)),x_or(x_subexpressionMatching(x_sons(V2,V3),V1,V4),x_subexpressionMatching(x_daughters(V2,V3),V1,V5),x_subexpressionMatching(x_children(V2,V3),V1,V6)),x_uninferredSentence(x_or(x_containedInASubChoice(V4,V1),x_containedInASubChoice(V5,V1),x_containedInASubChoice(V6,V1))),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V7)),x_or(x_subexpressionMatching(x_isa(V3,x_HumanMother),V7,V8),x_subexpressionMatching(x_isa(V3,x_HumanFather),V7,V9)),x_uninferredSentence(x_or(x_subexpressionMatching(x_isa(V2,x_HumanMother),V7,V10),x_subexpressionMatching(x_isa(V2,x_HumanFather),V7,V11)))) :- x_cid(a65b125d5eea6f,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125d5eea6f,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea6f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea6f,88).
xc_kb_names(a65b125d5eea6f,["?choice","?parent","?child","?sonStatement","?daughterStatement","?childStatement","?factsAndChoices","?motherStatement","?fatherStatement","?grandmother","?grandfather"]).
xc_mapping_rows(a65b125d5eea6f,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-1)),x_or(x_subexpressionMatching(x_sons(V2,V3),V1,V4),x_subexpressionMatching(x_daughters(V2,V3),V1,V5),x_subexpressionMatching(x_children(V2,V3),V1,V6)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V7)),x_subexpressionMatching(x_possessiveRelation(V3,V2),V7,V8)) :- x_cid(a65b125d5eea70,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d5eea70,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea70,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea70,103).
xc_kb_names(a65b125d5eea70,["?choice","?parent","?child","?sonStatement","?daughterStatement","?childStatement","?factsAndChoices","?possessiveStatement"]).
xc_mapping_rows(a65b125d5eea70,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-4)),x_or(x_subexpressionMatching(x_mother(V2,V2),V1,V3),x_subexpressionMatching(x_father(V4,V4),V1,V5),x_subexpressionMatching(x_sons(V6,V6),V1,V7),x_subexpressionMatching(x_daughters(V8,V8),V1,V9),x_subexpressionMatching(x_children(V10,V10),V1,V11))) :- x_cid(a65b125d5eea71,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125d5eea71,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea71,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea71,111).
xc_kb_names(a65b125d5eea71,["?choice","?mom","?momStmt","?dad","?dadStmt","?son","?sonStmt","?daught","?daugStmt","?par","?kidStmt"]).
xc_mapping_rows(a65b125d5eea71,[]).
'x_<=='(x_makesNoCommonSense(x_and(x_isa(V1,x_TakingCareOfSomething),x_beneficiary(V1,V1)),x_ChoiceFavorFn(-4))) :- x_cid(a65b125d5eea72,V1).
xc_microtheory(a65b125d5eea72,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea72,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea72,120).
xc_kb_names(a65b125d5eea72,["?mothering"]).
xc_mapping_rows(a65b125d5eea72,[]).
'x_<=='(x_makesNoCommonSense(x_mother(V1,V1),x_ChoiceFavorFn(-4))) :- x_cid(a65b125d5eea73,V1).
xc_microtheory(a65b125d5eea73,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea73,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea73,122).
xc_kb_names(a65b125d5eea73,["?mom"]).
xc_mapping_rows(a65b125d5eea73,[]).
'x_<=='(x_makesNoCommonSense(x_father(V1,V1),x_ChoiceFavorFn(-4))) :- x_cid(a65b125d5eea74,V1).
xc_microtheory(a65b125d5eea74,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea74,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea74,123).
xc_kb_names(a65b125d5eea74,["?dad"]).
xc_mapping_rows(a65b125d5eea74,[]).
'x_<=='(x_makesNoCommonSense(x_sons(V1,V1),x_ChoiceFavorFn(-4))) :- x_cid(a65b125d5eea75,V1).
xc_microtheory(a65b125d5eea75,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea75,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea75,124).
xc_kb_names(a65b125d5eea75,["?son"]).
xc_mapping_rows(a65b125d5eea75,[]).
'x_<=='(x_makesNoCommonSense(x_daughters(V1,V1),x_ChoiceFavorFn(-4))) :- x_cid(a65b125d5eea76,V1).
xc_microtheory(a65b125d5eea76,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea76,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea76,125).
xc_kb_names(a65b125d5eea76,["?daught"]).
xc_mapping_rows(a65b125d5eea76,[]).
'x_<=='(x_makesNoCommonSense(x_children(V1,V1),x_ChoiceFavorFn(-4))) :- x_cid(a65b125d5eea77,V1).
xc_microtheory(a65b125d5eea77,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea77,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea77,126).
xc_kb_names(a65b125d5eea77,["?par"]).
xc_mapping_rows(a65b125d5eea77,[]).
'x_<=='(x_makesCommonSense(x_possessiveRelation(V1,V2),x_ChoiceFavorFn(1)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V3)),x_subexpressionMatching(x_isa(V1,V4),V3,V5),x_subexpressionMatching(x_isa(V2,V6),V3,V7),x_possessionMakesSense(V1,V2)) :- x_cid(a65b125d5eea78,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d5eea78,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea78,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea78,133).
xc_kb_names(a65b125d5eea78,["?possessor","?possessed","?factsAndChoices","?orType","?possessorType","?edType","?possessedType"]).
xc_mapping_rows(a65b125d5eea78,[]).
'x_<=='(x_possessionMakesSense(V1,x_VisualDisplayScreen),x_genls(V1,x_PoweredDevice)) :- x_cid(a65b125d5eea79,V1).
xc_microtheory(a65b125d5eea79,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea79,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea79,139).
xc_kb_names(a65b125d5eea79,["?x"]).
xc_mapping_rows(a65b125d5eea79,[]).
'x_<=='(x_makesCommonSense(V1,x_ChoiceFavorFn(1)),x_subexpressionMatching(x_isa(V2,x_IncurringAnInjury),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V4)),x_or(x_subexpressionMatching(x_isa(V5,x_BruisedEye),V4,V6))) :- x_cid(a65b125d5eea7a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d5eea7a,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea7a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea7a,143).
xc_kb_names(a65b125d5eea7a,["?choice","?x","?somethingDeclared","?factsAndChoices","?y","?aBlackEye"]).
xc_mapping_rows(a65b125d5eea7a,[]).
'x_<=='(x_makesCommonSense(V1,x_ChoiceFavorFn(1)),x_subexpressionMatching(x_capitalCity(V2,V3),V1,V4),x_uninferredSentence(x_containedInASubChoice(V4,V1)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V5)),x_subexpressionMatching(x_isa(V3,x_CapitalCityOfRegion),V5,V6)) :- x_cid(a65b125d5eea7b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d5eea7b,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea7b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea7b,152).
xc_kb_names(a65b125d5eea7b,["?choice","?place","?capital","?match","?factsAndChoices","?otherMatch"]).
xc_mapping_rows(a65b125d5eea7b,[]).
'x_<=='(x_makesCommonSense(x_isa(V1,x_VisualDisplayScreen),x_ChoiceFavorFn(1)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V2)),x_splitOnOrPossessive(V1,V3,V2),x_subexpressionMatching(x_isa(V3,V4),V2,V5),x_genls(V4,x_PoweredDevice)) :- x_cid(a65b125d5eea7c,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eea7c,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea7c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea7c,159).
xc_kb_names(a65b125d5eea7c,["?screen","?factsAndChoices","?device","?deviceType","?screenType"]).
xc_mapping_rows(a65b125d5eea7c,[]).
'x_<=='(x_splitOnOrPossessive(V1,V2,V3),x_subexpressionMatching('x_on-UnderspecifiedSurface'(V1,V2),V3,V4)) :- x_cid(a65b125d5eea7d,V1,V2,V3,V4).
xc_microtheory(a65b125d5eea7d,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea7d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea7d,166).
xc_kb_names(a65b125d5eea7d,["?screen","?device","?factsAndChoices","?screenOwner"]).
xc_mapping_rows(a65b125d5eea7d,[]).
'x_<=='(x_splitOnOrPossessive(V1,V2,V3),x_subexpressionMatching(x_possessiveRelation(V2,V1),V3,V4)) :- x_cid(a65b125d5eea7e,V1,V2,V3,V4).
xc_microtheory(a65b125d5eea7e,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea7e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea7e,169).
xc_kb_names(a65b125d5eea7e,["?screen","?device","?factsAndChoices","?screenOwner2"]).
xc_mapping_rows(a65b125d5eea7e,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_subexpressionMatching(x_isa(V2,x_EquippingSomething),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_uninferredSentence(x_subexpressionMatching(x_objectActedOn(V2,V4),V1,V5))) :- x_cid(a65b125d5eea7f,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eea7f,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea7f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea7f,173).
xc_kb_names(a65b125d5eea7f,["?choice","?fit","?fitting","?equipped","?notEquipped"]).
xc_mapping_rows(a65b125d5eea7f,[]).
'x_<=='(x_makesCommonSense(t(V1,V2,V3),x_ChoiceFavorFn(V4)),x_different(V1,x_isa),x_different(V1,x_and),x_uninferredSentence(x_unifies(V2,x_DemonstrativeFn(V5))),'x_ist-Information'(x_UniversalVocabularyMt,x_lookupOnly(x_localOnly(x_isa(V1,x_CausationPredicate)))),x_favorSpecificity(V1,V6),x_evaluate(V4,x_PlusFn(0,V6))) :- x_cid(a65b125d5eea80,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d5eea80,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea80,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea80,183).
xc_kb_names(a65b125d5eea80,["?causalPred","?cause","?effect","?f","?this","?s"]).
xc_mapping_rows(a65b125d5eea80,[]).
'x_<=='(x_makesCommonSense(x_isa(V1,V2),x_ChoiceFavorFn(1)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V3)),x_subexpressionMatching(x_isa(V4,V2),V3,V5),x_different(V1,V4)) :- x_cid(a65b125d5eea81,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eea81,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea81,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea81,194).
xc_kb_names(a65b125d5eea81,["?x","?collection","?factsAndChoices","?z","?item"]).
xc_mapping_rows(a65b125d5eea81,[]).
'x_<=='(x_makesCommonSense(V1,x_ChoiceFavorFn(1)),x_subexpressionMatching(x_isa(V2,V3),V1,V4),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V5)),x_subexpressionMatching(x_isa(V6,V3),V5,V7),x_different(V2,V6)) :- x_cid(a65b125d5eea82,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d5eea82,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea82,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea82,200).
xc_kb_names(a65b125d5eea82,["?choice","?x","?collection","?introduced","?factsAndChoices","?z","?existing"]).
xc_mapping_rows(a65b125d5eea82,[]).
'x_<=='(x_containedInASubChoice(V1,V2),x_subexpressionMatching(x_thereExists(V3,V4),V2,V5),x_numAnswers(1,x_subexpressionMatching(V1,V4,V6))) :- x_cid(a65b125d5eea83,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d5eea83,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea83,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea83,211).
xc_kb_names(a65b125d5eea83,["?expr","?choice","?entities","?newChoices","?thereExists","?subexpr"]).
xc_mapping_rows(a65b125d5eea83,[]).
x_favorSpecificity(x_agentTypeCausesConditionType,2) :- x_cid(a65b125d5eea84).
xc_microtheory(a65b125d5eea84,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea84,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea84,217).
xc_kb_names(a65b125d5eea84,[]).
xc_mapping_rows(a65b125d5eea84,[]).
x_favorSpecificity('x_causes-EventEvent',2) :- x_cid(a65b125d5eea85).
xc_microtheory(a65b125d5eea85,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea85,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea85,218).
xc_kb_names(a65b125d5eea85,[]).
xc_mapping_rows(a65b125d5eea85,[]).
x_favorSpecificity('x_causes-PropProp',3) :- x_cid(a65b125d5eea86).
xc_microtheory(a65b125d5eea86,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea86,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea86,219).
xc_kb_names(a65b125d5eea86,[]).
xc_mapping_rows(a65b125d5eea86,[]).
x_favorSpecificity('x_causes-PropSit',2) :- x_cid(a65b125d5eea87).
xc_microtheory(a65b125d5eea87,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea87,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea87,220).
xc_kb_names(a65b125d5eea87,[]).
xc_mapping_rows(a65b125d5eea87,[]).
x_favorSpecificity('x_causes-SitProp',2) :- x_cid(a65b125d5eea88).
xc_microtheory(a65b125d5eea88,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea88,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea88,221).
xc_kb_names(a65b125d5eea88,[]).
xc_mapping_rows(a65b125d5eea88,[]).
x_favorSpecificity('x_causes-SitSit',2) :- x_cid(a65b125d5eea89).
xc_microtheory(a65b125d5eea89,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea89,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea89,222).
xc_kb_names(a65b125d5eea89,[]).
xc_mapping_rows(a65b125d5eea89,[]).
x_favorSpecificity('x_causes-SitSitType',1) :- x_cid(a65b125d5eea8a).
xc_microtheory(a65b125d5eea8a,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea8a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea8a,223).
xc_kb_names(a65b125d5eea8a,[]).
xc_mapping_rows(a65b125d5eea8a,[]).
x_favorSpecificity('x_causes-SitTypeProp',2) :- x_cid(a65b125d5eea8b).
xc_microtheory(a65b125d5eea8b,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea8b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea8b,224).
xc_kb_names(a65b125d5eea8b,[]).
xc_mapping_rows(a65b125d5eea8b,[]).
x_favorSpecificity('x_causes-SitTypeSitType',2) :- x_cid(a65b125d5eea8c).
xc_microtheory(a65b125d5eea8c,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea8c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea8c,225).
xc_kb_names(a65b125d5eea8c,[]).
xc_mapping_rows(a65b125d5eea8c,[]).
x_favorSpecificity('x_causes-ThingProp',1) :- x_cid(a65b125d5eea8d).
xc_microtheory(a65b125d5eea8d,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea8d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea8d,226).
xc_kb_names(a65b125d5eea8d,[]).
xc_mapping_rows(a65b125d5eea8d,[]).
x_favorSpecificity('x_causes-TypeSitType',2) :- x_cid(a65b125d5eea8e).
xc_microtheory(a65b125d5eea8e,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea8e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea8e,227).
xc_kb_names(a65b125d5eea8e,[]).
xc_mapping_rows(a65b125d5eea8e,[]).
x_favorSpecificity('x_causes-Underspecified',0) :- x_cid(a65b125d5eea8f).
xc_microtheory(a65b125d5eea8f,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea8f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea8f,228).
xc_kb_names(a65b125d5eea8f,[]).
xc_mapping_rows(a65b125d5eea8f,[]).
x_favorSpecificity(x_couldImpact,1) :- x_cid(a65b125d5eea90).
xc_microtheory(a65b125d5eea90,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea90,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea90,229).
xc_kb_names(a65b125d5eea90,[]).
xc_mapping_rows(a65b125d5eea90,[]).
x_favorSpecificity(x_eventTypeCausedDeathOf,3) :- x_cid(a65b125d5eea91).
xc_microtheory(a65b125d5eea91,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea91,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea91,230).
xc_kb_names(a65b125d5eea91,[]).
xc_mapping_rows(a65b125d5eea91,[]).
x_favorSpecificity(x_infectionCausedByOrganism,3) :- x_cid(a65b125d5eea92).
xc_microtheory(a65b125d5eea92,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea92,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea92,231).
xc_kb_names(a65b125d5eea92,[]).
xc_mapping_rows(a65b125d5eea92,[]).
x_favorSpecificity(x_infectionCausedByOrganismType,2) :- x_cid(a65b125d5eea93).
xc_microtheory(a65b125d5eea93,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea93,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea93,232).
xc_kb_names(a65b125d5eea93,[]).
xc_mapping_rows(a65b125d5eea93,[]).
x_favorSpecificity(x_parasiteCausesAilmentCondition,3) :- x_cid(a65b125d5eea94).
xc_microtheory(a65b125d5eea94,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea94,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea94,233).
xc_kb_names(a65b125d5eea94,[]).
xc_mapping_rows(a65b125d5eea94,[]).
x_favorSpecificity(x_pathogenCausesCondition,3) :- x_cid(a65b125d5eea95).
xc_microtheory(a65b125d5eea95,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea95,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea95,234).
xc_kb_names(a65b125d5eea95,[]).
xc_mapping_rows(a65b125d5eea95,[]).
x_favorSpecificity(x_pathogenCausesConditionType,2) :- x_cid(a65b125d5eea96).
xc_microtheory(a65b125d5eea96,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea96,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea96,235).
xc_kb_names(a65b125d5eea96,[]).
xc_mapping_rows(a65b125d5eea96,[]).
x_favorSpecificity(x_pathogenCausesEpidemicType,2) :- x_cid(a65b125d5eea97).
xc_microtheory(a65b125d5eea97,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea97,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea97,236).
xc_kb_names(a65b125d5eea97,[]).
xc_mapping_rows(a65b125d5eea97,[]).
x_favorSpecificity(x_pathogenSoleCauseOfInfectionType,2) :- x_cid(a65b125d5eea98).
xc_microtheory(a65b125d5eea98,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea98,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea98,237).
xc_kb_names(a65b125d5eea98,[]).
xc_mapping_rows(a65b125d5eea98,[]).
x_favorSpecificity(x_pathogenTypeCausesInfectionType,1) :- x_cid(a65b125d5eea99).
xc_microtheory(a65b125d5eea99,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea99,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea99,238).
xc_kb_names(a65b125d5eea99,[]).
xc_mapping_rows(a65b125d5eea99,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_cacheComplete(x_subexpressionMatching(x_isa(V2,x_SinkingEvent),V1,V3)),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_cacheComplete(x_subexpressionMatching(x_primaryObjectMoving(V2,V4),V1,V5)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V6)),x_subexpressionMatching(x_isa(V4,x_Sea),V6,V5)) :- x_cid(a65b125d5eea9a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d5eea9a,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea9a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea9a,245).
xc_kb_names(a65b125d5eea9a,["?choice","?x","?thatSinkingFeeling","?theSinker","?theSunken","?factsAndChoices"]).
xc_mapping_rows(a65b125d5eea9a,[]).
'x_<=='(x_makesNoCommonSense(x_toState(V1,V2),x_ChoiceFavorFn(-2)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V3)),x_subexpressionMatching(x_isa(V2,x_Sea),V3,V4),x_subexpressionMatching(x_isa(V1,x_SinkingEvent),V3,V5)) :- x_cid(a65b125d5eea9b,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eea9b,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea9b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea9b,254).
xc_kb_names(a65b125d5eea9b,["?sinking","?sea","?factsAndChoices","?theSunken","?theSinking"]).
xc_mapping_rows(a65b125d5eea9b,[]).
'x_<=='(x_makesCommonSense('x_in-UnderspecifiedContainer'(V1,V2),x_ChoiceFavorFn(2)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V3)),x_subexpressionMatching(x_isa(V2,x_Sea),V3,V4),x_subexpressionMatching(x_isa(V1,x_SinkingEvent),V3,V5)) :- x_cid(a65b125d5eea9c,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eea9c,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea9c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea9c,259).
xc_kb_names(a65b125d5eea9c,["?sinking","?sea","?factsAndChoices","?theSunken","?theSinking"]).
xc_mapping_rows(a65b125d5eea9c,[]).
'x_<=='(x_makesCommonSense(V1,x_ChoiceFavorFn(2)),x_cacheComplete(x_subexpressionMatching(x_isa(V2,x_IncurringAnInjury),V1,V3)),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_cacheComplete(x_subexpressionMatching(x_objectHarmed(V2,V4),V1,V5)),x_isa(V4,'x_Limb-AnimalBodyPart')) :- x_cid(a65b125d5eea9d,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eea9d,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea9d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea9d,266).
xc_kb_names(a65b125d5eea9d,["?choice","?injury","?theInjury","?limb","?theThingHarmed"]).
xc_mapping_rows(a65b125d5eea9d,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_cacheComplete(x_subexpressionMatching(x_isa(V2,x_IncurringAnInjury),V1,V3)),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_or(x_cacheComplete(x_subexpressionMatching(x_animalWoundedIn(V2,V4),V1,V5)),x_cacheComplete(x_subexpressionMatching(x_animalInjuredIn(V2,V4),V1,V5))),x_isa(V4,'x_Limb-AnimalBodyPart')) :- x_cid(a65b125d5eea9e,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eea9e,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea9e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea9e,272).
xc_kb_names(a65b125d5eea9e,["?choice","?injury","?theInjury","?limb","?theThingHarmed"]).
xc_mapping_rows(a65b125d5eea9e,[]).
'x_<=='(x_makesCommonSense(V1,x_ChoiceFavorFn(1)),x_subexpressionMatching(x_beneficiary(V2,V3),V1,V4),x_uninferredSentence(x_containedInASubChoice(V4,V1)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V5)),x_subexpressionMatching(x_isa(V2,x_Voting),V5,V6)) :- x_cid(a65b125d5eea9f,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d5eea9f,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eea9f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eea9f,281).
xc_kb_names(a65b125d5eea9f,["?choice","?vote","?person","?voting","?factsAndChoices","?itsAVote"]).
xc_mapping_rows(a65b125d5eea9f,[]).
'x_<=='(x_makesCommonSense(x_isa(V1,x_ExpiredAgreement),x_ChoiceFavorFn(1.5)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V2)),x_subexpressionMatching(x_isa(V1,V3),V2,V4),x_different(V3,x_ExpiredAgreement),x_genls(V3,x_Agreement)) :- x_cid(a65b125d5eeaa0,V1,V2,V3,V4).
xc_microtheory(a65b125d5eeaa0,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa0,287).
xc_kb_names(a65b125d5eeaa0,["?expired","?factsAndChoices","?type","?typeStmt"]).
xc_mapping_rows(a65b125d5eeaa0,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_cacheComplete(x_unifies(x_isa(V2,V3),V1)),x_uninferredSentence(x_genls(V3,x_OrganismPart)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V4)),x_subexpressionMatching(x_isa(V5,x_IncurringAnInjury),V4,V6),x_subexpressionMatching(x_objectHarmed(V5,V2),V4,V7)) :- x_cid(a65b125d5eeaa1,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d5eeaa1,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa1,295).
xc_kb_names(a65b125d5eeaa1,["?choice","?x","?y","?factsAndChoices","?injury","?weHaveAnInjury","?weAreHurt"]).
xc_mapping_rows(a65b125d5eeaa1,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_subexpressionMatching(x_isa(V2,'x_Dismissing-ExpellingFromMembership'),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_subexpressionMatching('x_from-Generic'(V2,V4),V1,V5),x_uninferredSentence(x_isa(V4,x_Organization))) :- x_cid(a65b125d5eeaa2,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eeaa2,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa2,303).
xc_kb_names(a65b125d5eeaa2,["?choice","?drop","?somethingDropped","?droppedFrom","?whenceDropping"]).
xc_mapping_rows(a65b125d5eeaa2,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_subexpressionMatching(x_isa(V2,x_ExpellingFromMembership),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_subexpressionMatching('x_from-Generic'(V2,V4),V1,V5),x_uninferredSentence(x_isa(V4,x_Organization))) :- x_cid(a65b125d5eeaa3,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eeaa3,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa3,310).
xc_kb_names(a65b125d5eeaa3,["?choice","?expel","?expelled","?expelledFrom","?whenceExpelled"]).
xc_mapping_rows(a65b125d5eeaa3,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_or(x_subexpressionMatching(x_isa(V2,x_LosingAConflict),V1,V3),x_subexpressionMatching(x_isa(V2,x_WinningAConflict),V1,V4)),x_subexpressionMatching(x_topicOfIndividual(V2,V5),V1,V6),x_uninferredSentence(x_containedInASubChoice(V6,V1)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V7)),x_subexpressionMatching(x_isa(V5,V8),V7,V9),x_genls(V8,x_Animal)) :- x_cid(a65b125d5eeaa4,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125d5eeaa4,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa4,317).
xc_kb_names(a65b125d5eeaa4,["?choice","?winLoss","?loss","?win","?topic","?conflictTopic","?factsAndChoices","?topicCat","?topicCategory"]).
xc_mapping_rows(a65b125d5eeaa4,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-3)),x_subexpressionMatching(x_isa(V2,x_CompetitionEventTypeFn(V3)),V1,V4),x_uninferredSentence(x_containedInASubChoice(V4,V1)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V5)),x_subexpressionMatching(x_isa(V6,V3),V5,V7),x_genls(V3,x_Animal)) :- x_cid(a65b125d5eeaa5,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d5eeaa5,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa5,327).
xc_kb_names(a65b125d5eeaa5,["?choice","?winLoss","?competitionType","?loss","?factsAndChoices","?topic","?topicCategory"]).
xc_mapping_rows(a65b125d5eeaa5,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-3)),x_subexpressionMatching(x_isa(V2,'x_FluidFlow-Translation'),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_subexpressionMatching(x_objectMoving(V2,V4),V1,V5),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V6)),x_subexpressionMatching(x_isa(V4,V7),V6,V8),x_uninferredSentence(x_genls(V7,x_LiquidTangibleThing))) :- x_cid(a65b125d5eeaa6,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d5eeaa6,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa6,335).
xc_kb_names(a65b125d5eeaa6,["?choice","?fluidFlow","?flow","?flowee","?flowing","?factsAndChoices","?floweeCategory","?whatIsFlowing"]).
xc_mapping_rows(a65b125d5eeaa6,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_subexpressionMatching(x_birthChild(V2,V3),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V4)),x_uninferredSentence(x_or(x_subexpressionMatching(x_isa(V3,x_HumanInfant),V4,V5),x_subexpressionMatching(x_isa(V3,x_NewbornAnimal),V4,V6)))) :- x_cid(a65b125d5eeaa7,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d5eeaa7,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa7,345).
xc_kb_names(a65b125d5eeaa7,["?choice","?have","?child","?factsAndChoices","?baby","?baby2"]).
xc_mapping_rows(a65b125d5eeaa7,[]).
'x_<=='(x_makesNoCommonSense(x_and(x_isa(V1,x_IntrinsicStateChangeEvent),x_performedBy(V1,V2),x_holdsIn(x_STIF(V1),x_localOrganizationOpennessState(V2,x_OpenForBusiness)),x_holdsIn(x_STIB(V1),x_not(x_localOrganizationOpennessState(V2,x_OpenForBusiness)))),x_ChoiceFavorFn(-2)),x_uninferredSentence(x_genls(V2,x_SingleSiteOrganization))) :- x_cid(a65b125d5eeaa8,V1,V2).
xc_microtheory(a65b125d5eeaa8,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa8,353).
xc_kb_names(a65b125d5eeaa8,["?open","?whoever"]).
xc_mapping_rows(a65b125d5eeaa8,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-1)),x_subexpressionMatching(x_isa(V2,x_Dying),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_subexpressionMatching(x_objectOfStateChange(V2,V4),V1,V5),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V6)),x_subexpressionMatching(x_isa(V4,V7),V6,V8),x_uninferredSentence(x_genls(V7,x_BiologicalLivingObject))) :- x_cid(a65b125d5eeaa9,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d5eeaa9,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaa9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaa9,365).
xc_kb_names(a65b125d5eeaa9,["?choice","?dying","?death","?dead","?deadThing","?factsAndChoices","?deadType","?deadTypeStatement"]).
xc_mapping_rows(a65b125d5eeaa9,[]).
'x_<=='(x_makesCommonSense(V1,x_ChoiceFavorFn(1)),x_subexpressionMatching(x_isa(V2,x_Dying),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_subexpressionMatching(x_objectOfStateChange(V2,V4),V1,V5),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V6)),x_subexpressionMatching(x_isa(V4,V7),V6,V8),x_genls(V7,x_BiologicalLivingObject)) :- x_cid(a65b125d5eeaaa,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d5eeaaa,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaaa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaaa,373).
xc_kb_names(a65b125d5eeaaa,["?choice","?dying","?death","?dead","?deadThing","?factsAndChoices","?deadType","?deadTypeStatement"]).
xc_mapping_rows(a65b125d5eeaaa,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-1)),x_subexpressionMatching(x_isa(V2,x_TurningOffPoweredDevice),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_subexpressionMatching(x_objectOfStateChange(V2,V4),V1,V5),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V6)),x_subexpressionMatching(x_isa(V4,V7),V6,V8),x_uninferredSentence(x_genls(V7,x_PoweredDevice))) :- x_cid(a65b125d5eeaab,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d5eeaab,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaab,381).
xc_kb_names(a65b125d5eeaab,["?choice","?dying","?death","?dead","?deadThing","?factsAndChoices","?deadType","?deadTypeStatement"]).
xc_mapping_rows(a65b125d5eeaab,[]).
'x_<=='(x_makesCommonSense(V1,x_ChoiceFavorFn(1)),x_subexpressionMatching(x_isa(V2,x_TurningOffPoweredDevice),V1,V3),x_uninferredSentence(x_containedInASubChoice(V3,V1)),x_subexpressionMatching(x_objectOfStateChange(V2,V4),V1,V5),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V6)),x_subexpressionMatching(x_isa(V4,V7),V6,V8),x_genls(V7,x_PoweredDevice)) :- x_cid(a65b125d5eeaac,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d5eeaac,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaac,389).
xc_kb_names(a65b125d5eeaac,["?choice","?dying","?death","?dead","?deadThing","?factsAndChoices","?deadType","?deadTypeStatement"]).
xc_mapping_rows(a65b125d5eeaac,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-2)),x_subexpressionMatching(x_agentsExistentialState(V2,x_MultiIndividualAgentNowDisbanded),V1,V3),x_cacheComplete(x_gatherDiscourseFactsAndChoices(V4)),x_subexpressionMatching(x_isa(V2,V5),V4,V6),x_uninferredSentence(x_subexpressionMatching(V6,V1,V6)),x_genls(V5,x_Organization)) :- x_cid(a65b125d5eeaad,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d5eeaad,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaad,397).
xc_kb_names(a65b125d5eeaad,["?choice","?closing","?disbanding","?factsAndChoices","?type","?closingType"]).
xc_mapping_rows(a65b125d5eeaad,[]).
'x_<=='(x_makesNoCommonSense(V1,x_ChoiceFavorFn(-1)),x_subexpressionMatching(x_isa(V2,x_ShuttingOffSomething),V1,V3),x_subexpressionMatching(x_objectActedOn(V2,V4),V1,V5),x_uninferredSentence(x_isa(V4,x_FluidFlowEvent))) :- x_cid(a65b125d5eeaae,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eeaae,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaae,405).
xc_kb_names(a65b125d5eeaae,["?choice","?shutoff","?shuttingOff","?thingShut","?actedOn"]).
xc_mapping_rows(a65b125d5eeaae,[]).
'x_<=='(x_makesCommonSense(x_isa(V1,x_Chef),x_ChoiceFavorFn(1))) :- x_cid(a65b125d5eeaaf,V1).
xc_microtheory(a65b125d5eeaaf,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeaaf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeaaf,416).
xc_kb_names(a65b125d5eeaaf,["?chef"]).
xc_mapping_rows(a65b125d5eeaaf,[]).
'x_<=='(x_makesCommonSense(x_isa(V1,x_Warranty),x_ChoiceFavorFn(0.1))) :- x_cid(a65b125d5eeab0,V1).
xc_microtheory(a65b125d5eeab0,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeab0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeab0,419).
xc_kb_names(a65b125d5eeab0,["?warranty"]).
xc_mapping_rows(a65b125d5eeab0,[]).
'x_<=='(x_makesNoCommonSense(x_isa(V1,x_WarrantyDocument),x_ChoiceFavorFn(-0.1))) :- x_cid(a65b125d5eeab1,V1).
xc_microtheory(a65b125d5eeab1,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeab1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeab1,420).
xc_kb_names(a65b125d5eeab1,["?warranty"]).
xc_mapping_rows(a65b125d5eeab1,[]).
'x_<=='(x_makesCommonSense(V1,x_ChoiceFavorFn(0.1)),x_uninferredSentence(x_unifies(V1,'x_Backreference-ClassA-NLAttr')),x_uninferredSentence(x_unifies(V1,'x_Demonstrative-ClassA-NLAttr')),x_uninferredSentence(x_unifies(V1,x_PronounFn(V2,V3,V4,V5)))) :- x_cid(a65b125d5eeab2,V1,V2,V3,V4,V5).
xc_microtheory(a65b125d5eeab2,x_CommonSenseHeuristicMt).
xc_source_file(a65b125d5eeab2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeab2,424).
xc_kb_names(a65b125d5eeab2,["?choice","?person","?singPlur","?gender","?type"]).
xc_mapping_rows(a65b125d5eeab2,[]).
x_genlMt('x_Interaction-ManagerMt',x_GRatedHeuristicMt) :- x_cid(a65b125d5eeab3).
xc_microtheory(a65b125d5eeab3,x_GRatedHeuristicMt).
xc_source_file(a65b125d5eeab3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeab3,434).
xc_kb_names(a65b125d5eeab3,[]).
xc_mapping_rows(a65b125d5eeab3,[]).
'x_<=='('x_favorG-Rated'(V1,x_ChoiceFavorFn(-3.0)),x_or(x_cacheComplete(x_subexpressionMatching(x_isa(V2,x_HavingAnOrgasm),V1,V3)),x_cacheComplete(x_subexpressionMatching(x_isa(V2,x_Semen),V1,V4)),x_cacheComplete(x_subexpressionMatching(x_isa(V2,x_Prostitute),V1,V5)),x_cacheComplete(x_subexpressionMatching(x_isa(V2,x_SexualCopulation),V1,V6)),x_cacheComplete(x_subexpressionMatching(x_isa(V2,x_Ovum),V1,V7)))) :- x_cid(a65b125d5eeab4,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d5eeab4,x_GRatedHeuristicMt).
xc_source_file(a65b125d5eeab4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/interaction-manager/reading/commonsense-heuristic-content.krf').
xc_source_line(a65b125d5eeab4,436).
xc_kb_names(a65b125d5eeab4,["?choice","?thing","?anOrgasm","?semen","?prostitute","?copulation","?egg"]).
xc_mapping_rows(a65b125d5eeab4,[]).
kb_cache_footer(footer{count:75,digest:'4a8d4e91e84350e7b4b229aec5d16339f5faf060da452835e621cc586f89bedc',headerDigest:'1d6d0c42cc2d4c8e2af43ca59a4538862fe2059ed5c9720b9b9d275eecfcc10e'}).
