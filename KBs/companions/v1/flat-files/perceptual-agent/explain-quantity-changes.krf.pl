:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:68,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:333,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:cdfcbf73b314e8852d17df6f8f449bcb85219acb63317974bc58362cbfb3a595,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:14363,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf',sourceHash:aa9b16e5b1d84ca2036ba482da0587caa17298b5ea764ce7b41d4aae3d64e3cf,warnings:[]}).
x_isa(x_explainQuantityChanges,x_ComplexActionPredicate) :- x_cid(a65b125de8816e).
xc_microtheory(a65b125de8816e,x_PerceptualAgentMt).
xc_source_file(a65b125de8816e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8816e,26).
xc_kb_names(a65b125de8816e,[]).
xc_mapping_rows(a65b125de8816e,[]).
x_arity(x_explainQuantityChanges,5) :- x_cid(a65b125de8816f).
xc_microtheory(a65b125de8816f,x_PerceptualAgentMt).
xc_source_file(a65b125de8816f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8816f,27).
xc_kb_names(a65b125de8816f,[]).
xc_mapping_rows(a65b125de8816f,[]).
x_arg1Isa(x_explainQuantityChanges,x_Microtheory) :- x_cid(a65b125de88170).
xc_microtheory(a65b125de88170,x_PerceptualAgentMt).
xc_source_file(a65b125de88170,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88170,28).
xc_kb_names(a65b125de88170,[]).
xc_mapping_rows(a65b125de88170,[]).
x_arg2Isa(x_explainQuantityChanges,x_PerceptualAgentCommand) :- x_cid(a65b125de88171).
xc_microtheory(a65b125de88171,x_PerceptualAgentMt).
xc_source_file(a65b125de88171,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88171,29).
xc_kb_names(a65b125de88171,[]).
xc_mapping_rows(a65b125de88171,[]).
x_arg3Isa(x_explainQuantityChanges,x_CycLExpression) :- x_cid(a65b125de88172).
xc_microtheory(a65b125de88172,x_PerceptualAgentMt).
xc_source_file(a65b125de88172,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88172,30).
xc_kb_names(a65b125de88172,[]).
xc_mapping_rows(a65b125de88172,[]).
x_arg4Isa(x_explainQuantityChanges,'x_Set-Mathematical') :- x_cid(a65b125de88173).
xc_microtheory(a65b125de88173,x_PerceptualAgentMt).
xc_source_file(a65b125de88173,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88173,31).
xc_kb_names(a65b125de88173,[]).
xc_mapping_rows(a65b125de88173,[]).
x_arg5Isa(x_explainQuantityChanges,x_TimeInterval) :- x_cid(a65b125de88174).
xc_microtheory(a65b125de88174,x_PerceptualAgentMt).
xc_source_file(a65b125de88174,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88174,32).
xc_kb_names(a65b125de88174,[]).
xc_mapping_rows(a65b125de88174,[]).
x_comment(x_explainQuantityChanges,"(explainQuantityChanges ?mt ?cmd ?operator ?quantity-changes ?year) attempts to explain changes in buffered quantities.") :- x_cid(a65b125de88175).
xc_microtheory(a65b125de88175,x_PerceptualAgentMt).
xc_source_file(a65b125de88175,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88175,33).
xc_kb_names(a65b125de88175,[]).
xc_mapping_rows(a65b125de88175,[]).
x_preconditionForMethod(x_and(x_uninferredSentence(x_currentActivityMode(x_Experimentation)),x_unifies(V1,x_IICaseFn(V2,V3,V4)),x_outsourcedOnly(x_currentDomain(V5)),x_unifies(V6,x_QualitativeModelMtFn(V5)),x_unifies(V7,x_SpindleMtFn(V5,x_IndirectInfluences))),x_methodForAction(x_explainQuantityChanges(V2,V4,V8,V9,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V1,x_infoTransferred(V4,V8))),x_storeIICase(V2,V1,V9),x_recordActionEffects(V2,V8,V9,V1,V7),x_doAgentPlan(x_actionSequence(x_TheList(x_induceIIModel(V2,V9,V1,V7,V6)))),x_doAgentPlan(x_actionSequence(x_TheList(x_elaborateActionCaseForActiveGoals(V2,V4,V8,V3),x_reportNumHypotheses(V1,"indirect influences")))))))) :- x_cid(a65b125de88176,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125de88176,x_PerceptualAgentMt).
xc_source_file(a65b125de88176,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88176,37).
xc_kb_names(a65b125de88176,["?casename","?mt","?when","?cmd","?domain","?lkmt","?spindlename","?operator","?changes"]).
xc_mapping_rows(a65b125de88176,[]).
x_preconditionForMethod(x_and(x_currentActivityMode(x_Experimentation),x_unifies(V1,x_IICaseFn(V2,V3,V4)),x_outsourcedOnly(x_currentDomain(V5)),x_unifies(V6,x_QualitativeModelMtFn(V5)),x_unifies(V7,x_SpindleMtFn(V5,x_IndirectInfluences))),x_methodForAction(x_explainQuantityChanges(V2,V4,V8,V9,V3),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V1,x_infoTransferred(V4,V8))),x_storeIICase(V2,V1,V9),x_recordActionEffects(V2,V8,V9,V1,V7),x_doAgentPlan(x_actionSequence(x_TheList(x_induceIIModelForActiveGoals(V2,V9,V1,V7,V6)))),x_doAgentPlan(x_actionSequence(x_TheList(x_elaborateActionCaseForActiveGoals(V2,V4,V8,V3)))))))) :- x_cid(a65b125de88177,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125de88177,x_PerceptualAgentMt).
xc_source_file(a65b125de88177,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88177,65).
xc_kb_names(a65b125de88177,["?casename","?mt","?when","?cmd","?domain","?lkmt","?spindlename","?operator","?changes"]).
xc_mapping_rows(a65b125de88177,[]).
x_isa(x_induceIIModelForActiveGoals,x_ComplexActionPredicate) :- x_cid(a65b125de88178).
xc_microtheory(a65b125de88178,x_PerceptualAgentMt).
xc_source_file(a65b125de88178,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88178,95).
xc_kb_names(a65b125de88178,[]).
xc_mapping_rows(a65b125de88178,[]).
x_arity(x_induceIIModelForActiveGoals,5) :- x_cid(a65b125de88179).
xc_microtheory(a65b125de88179,x_PerceptualAgentMt).
xc_source_file(a65b125de88179,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88179,96).
xc_kb_names(a65b125de88179,[]).
xc_mapping_rows(a65b125de88179,[]).
x_arg1Isa(x_induceIIModelForActiveGoals,x_Microtheory) :- x_cid(a65b125de8817a).
xc_microtheory(a65b125de8817a,x_PerceptualAgentMt).
xc_source_file(a65b125de8817a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8817a,97).
xc_kb_names(a65b125de8817a,[]).
xc_mapping_rows(a65b125de8817a,[]).
x_arg2Isa(x_induceIIModelForActiveGoals,'x_Set-Mathematical') :- x_cid(a65b125de8817b).
xc_microtheory(a65b125de8817b,x_PerceptualAgentMt).
xc_source_file(a65b125de8817b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8817b,98).
xc_kb_names(a65b125de8817b,[]).
xc_mapping_rows(a65b125de8817b,[]).
x_arg3Isa(x_induceIIModelForActiveGoals,x_Microtheory) :- x_cid(a65b125de8817c).
xc_microtheory(a65b125de8817c,x_PerceptualAgentMt).
xc_source_file(a65b125de8817c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8817c,99).
xc_kb_names(a65b125de8817c,[]).
xc_mapping_rows(a65b125de8817c,[]).
x_arg4Isa(x_induceIIModelForActiveGoals,x_Microtheory) :- x_cid(a65b125de8817d).
xc_microtheory(a65b125de8817d,x_PerceptualAgentMt).
xc_source_file(a65b125de8817d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8817d,100).
xc_kb_names(a65b125de8817d,[]).
xc_mapping_rows(a65b125de8817d,[]).
x_arg5Isa(x_induceIIModelForActiveGoals,x_Microtheory) :- x_cid(a65b125de8817e).
xc_microtheory(a65b125de8817e,x_PerceptualAgentMt).
xc_source_file(a65b125de8817e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8817e,101).
xc_kb_names(a65b125de8817e,[]).
xc_mapping_rows(a65b125de8817e,[]).
x_comment(x_induceIIModelForActiveGoals,"(induceIIModelForActiveGoals ?mt ?changes ?casename ?ii-spindle ?lkmt) tries to explain quantity changes, but only on dependent quantities for which there is an active learning goal.") :- x_cid(a65b125de8817f).
xc_microtheory(a65b125de8817f,x_PerceptualAgentMt).
xc_source_file(a65b125de8817f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8817f,102).
xc_kb_names(a65b125de8817f,[]).
xc_mapping_rows(a65b125de8817f,[]).
x_preconditionForMethod(x_filterBy(V1,x_activeInfluenceGoalOn,V2),x_methodForAction(x_induceIIModelForActiveGoals(V3,V1,V4,V5,V6),x_actionSequence(x_TheList(x_doForEach(V7,V2,x_actionSequence(x_TheList(x_induceIndirectInfluences(V3,V7,V1,V4,V5),x_validateInfluencesFrom(V3,V7,V4,V5)))))))) :- x_cid(a65b125de88180,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125de88180,x_PerceptualAgentMt).
xc_source_file(a65b125de88180,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88180,105).
xc_kb_names(a65b125de88180,["?changes","?filtered-changes","?mt","?casename","?ii-spindle","?lkmt","?change"]).
xc_mapping_rows(a65b125de88180,[]).
x_isa(x_activeInfluenceGoalOn,x_UnaryPredicate) :- x_cid(a65b125de88181).
xc_microtheory(a65b125de88181,x_PerceptualAgentMt).
xc_source_file(a65b125de88181,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88181,117).
xc_kb_names(a65b125de88181,[]).
xc_mapping_rows(a65b125de88181,[]).
x_arity(x_activeInfluenceGoalOn,1) :- x_cid(a65b125de88182).
xc_microtheory(a65b125de88182,x_PerceptualAgentMt).
xc_source_file(a65b125de88182,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88182,118).
xc_kb_names(a65b125de88182,[]).
xc_mapping_rows(a65b125de88182,[]).
x_arg1Isa(x_activeInfluenceGoalOn,'x_CycLSentence-Assertible') :- x_cid(a65b125de88183).
xc_microtheory(a65b125de88183,x_PerceptualAgentMt).
xc_source_file(a65b125de88183,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88183,119).
xc_kb_names(a65b125de88183,[]).
xc_mapping_rows(a65b125de88183,[]).
x_comment(x_activeInfluenceGoalOn,"(activeInfluenceGoalOn ?changes) succeeds for just those quantity changes for which there is an active learning goal to learn influences on it.") :- x_cid(a65b125de88184).
xc_microtheory(a65b125de88184,x_PerceptualAgentMt).
xc_source_file(a65b125de88184,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88184,120).
xc_kb_names(a65b125de88184,[]).
xc_mapping_rows(a65b125de88184,[]).
'x_<=='(x_activeInfluenceGoalOn(x_quantityChange(t(V1,V2),V3)),x_activeLearningGoal(V1,x_DetectPotentialQualitativeInfluence(V1))) :- x_cid(a65b125de88185,V1,V2,V3).
xc_microtheory(a65b125de88185,x_PerceptualAgentMt).
xc_source_file(a65b125de88185,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88185,122).
xc_kb_names(a65b125de88185,["?qtype","?entity","?change-magnitude"]).
xc_mapping_rows(a65b125de88185,[]).
x_isa(x_induceIIModel,x_ComplexActionPredicate) :- x_cid(a65b125de88186).
xc_microtheory(a65b125de88186,x_PerceptualAgentMt).
xc_source_file(a65b125de88186,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88186,125).
xc_kb_names(a65b125de88186,[]).
xc_mapping_rows(a65b125de88186,[]).
x_arity(x_induceIIModel,5) :- x_cid(a65b125de88187).
xc_microtheory(a65b125de88187,x_PerceptualAgentMt).
xc_source_file(a65b125de88187,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88187,126).
xc_kb_names(a65b125de88187,[]).
xc_mapping_rows(a65b125de88187,[]).
x_arg1Isa(x_induceIIModel,x_Microtheory) :- x_cid(a65b125de88188).
xc_microtheory(a65b125de88188,x_PerceptualAgentMt).
xc_source_file(a65b125de88188,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88188,127).
xc_kb_names(a65b125de88188,[]).
xc_mapping_rows(a65b125de88188,[]).
x_arg2Isa(x_induceIIModel,'x_Set-Mathematical') :- x_cid(a65b125de88189).
xc_microtheory(a65b125de88189,x_PerceptualAgentMt).
xc_source_file(a65b125de88189,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88189,128).
xc_kb_names(a65b125de88189,[]).
xc_mapping_rows(a65b125de88189,[]).
x_arg3Isa(x_induceIIModel,x_Microtheory) :- x_cid(a65b125de8818a).
xc_microtheory(a65b125de8818a,x_PerceptualAgentMt).
xc_source_file(a65b125de8818a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8818a,129).
xc_kb_names(a65b125de8818a,[]).
xc_mapping_rows(a65b125de8818a,[]).
x_arg4Isa(x_induceIIModel,x_Microtheory) :- x_cid(a65b125de8818b).
xc_microtheory(a65b125de8818b,x_PerceptualAgentMt).
xc_source_file(a65b125de8818b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8818b,130).
xc_kb_names(a65b125de8818b,[]).
xc_mapping_rows(a65b125de8818b,[]).
x_arg5Isa(x_induceIIModel,x_Microtheory) :- x_cid(a65b125de8818c).
xc_microtheory(a65b125de8818c,x_PerceptualAgentMt).
xc_source_file(a65b125de8818c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8818c,131).
xc_kb_names(a65b125de8818c,[]).
xc_mapping_rows(a65b125de8818c,[]).
x_comment(x_induceIIModel,"(induceIIModel ?mt ?changes ?casename ?ii-spindle ?lkmt) tries to explain quantity changes, but only if there is no qualitative model stored in the learned knowledge microtheory.") :- x_cid(a65b125de8818d).
xc_microtheory(a65b125de8818d,x_PerceptualAgentMt).
xc_source_file(a65b125de8818d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8818d,132).
xc_kb_names(a65b125de8818d,[]).
xc_mapping_rows(a65b125de8818d,[]).
x_preconditionForMethod(x_uninferredSentence(x_lookupOnly(x_kbOnly('x_ist-Information'(V1,'x_qprop+TypeType'(V2,V3,V4,V5,V6))))),x_methodForAction(x_induceIIModel(V7,V8,V9,V10,V1),x_actionSequence(x_TheList(x_doAnnounce("~&Induce indirect influences in ~s.",[V9]),x_doForEach(V11,V8,x_actionSequence(x_TheList(x_induceIndirectInfluences(V7,V11,V8,V9,V10),x_validateInfluencesFrom(V7,V11,V9,V10)))))))) :- x_cid(a65b125de8818e,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125de8818e,x_PerceptualAgentMt).
xc_source_file(a65b125de8818e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8818e,135).
xc_kb_names(a65b125de8818e,["?lkmt","?dep-qtype","?indep-qtype","?col1","?col2","?rel","?mt","?changes","?casename","?ii-spindle","?change"]).
xc_mapping_rows(a65b125de8818e,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 145, column 59), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de8818e,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 145, column 59), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_induceIIModel(V1,V2,V3,V4,V5),x_actionSequence(x_TheList))) :- x_cid(a65b125de8818f,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de8818f,x_PerceptualAgentMt).
xc_source_file(a65b125de8818f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8818f,153).
xc_kb_names(a65b125de8818f,["?mt","?changes","?casename","?ii-spindle","?lkmt"]).
xc_mapping_rows(a65b125de8818f,[]).
'x_<=='(x_preferInContext(x_induceIIModel(V1,V2,V3,V4,V5),V6,V7),x_different(V6,x_actionSequence(x_TheList))) :- x_cid(a65b125de88190,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125de88190,x_PerceptualAgentMt).
xc_source_file(a65b125de88190,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88190,160).
xc_kb_names(a65b125de88190,["?mt","?changes","?casename","?ii-spindle","?lkmt","?seq1","?seq2"]).
xc_mapping_rows(a65b125de88190,[]).
x_isa(x_explainIncrementalQuantityChanges,x_ComplexActionPredicate) :- x_cid(a65b125de88191).
xc_microtheory(a65b125de88191,x_PerceptualAgentMt).
xc_source_file(a65b125de88191,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88191,169).
xc_kb_names(a65b125de88191,[]).
xc_mapping_rows(a65b125de88191,[]).
x_arity(x_explainIncrementalQuantityChanges,4) :- x_cid(a65b125de88192).
xc_microtheory(a65b125de88192,x_PerceptualAgentMt).
xc_source_file(a65b125de88192,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88192,170).
xc_kb_names(a65b125de88192,[]).
xc_mapping_rows(a65b125de88192,[]).
x_arg1Isa(x_explainIncrementalQuantityChanges,x_Microtheory) :- x_cid(a65b125de88193).
xc_microtheory(a65b125de88193,x_PerceptualAgentMt).
xc_source_file(a65b125de88193,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88193,171).
xc_kb_names(a65b125de88193,[]).
xc_mapping_rows(a65b125de88193,[]).
x_arg2Isa(x_explainIncrementalQuantityChanges,'x_Set-Mathematical') :- x_cid(a65b125de88194).
xc_microtheory(a65b125de88194,x_PerceptualAgentMt).
xc_source_file(a65b125de88194,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88194,172).
xc_kb_names(a65b125de88194,[]).
xc_mapping_rows(a65b125de88194,[]).
x_arg3Isa(x_explainIncrementalQuantityChanges,x_TimeInterval) :- x_cid(a65b125de88195).
xc_microtheory(a65b125de88195,x_PerceptualAgentMt).
xc_source_file(a65b125de88195,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88195,173).
xc_kb_names(a65b125de88195,[]).
xc_mapping_rows(a65b125de88195,[]).
x_arg4Isa(x_explainIncrementalQuantityChanges,x_TimeInterval) :- x_cid(a65b125de88196).
xc_microtheory(a65b125de88196,x_PerceptualAgentMt).
xc_source_file(a65b125de88196,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88196,174).
xc_kb_names(a65b125de88196,[]).
xc_mapping_rows(a65b125de88196,[]).
x_comment(x_explainIncrementalQuantityChanges,"(explainIncrementalQuantityChanges ?mt ?change-set ?before ?after) induces direct influences to account for diachronic changes.") :- x_cid(a65b125de88197).
xc_microtheory(a65b125de88197,x_PerceptualAgentMt).
xc_source_file(a65b125de88197,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88197,175).
xc_kb_names(a65b125de88197,[]).
xc_mapping_rows(a65b125de88197,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_currentDomain(V1)),x_unifies(V2,x_QualitativeModelMtFn(V1)),x_uninferredSentence(x_lookupOnly(x_kbOnly('x_ist-Information'(V2,'x_i+TypeType'(V3,V4,V5,V6,V7))))),x_unifies(V8,x_DICaseFn(V9,V10)),x_unifies(V11,x_IICaseFn(V9,V12,x_TurnFn(V12))),x_unifies(V13,x_SpindleMtFn(V1,x_DirectInfluences)),x_unifies(V14,x_SpindleMtFn(V1,x_IndirectInfluences))),x_methodForAction(x_explainIncrementalQuantityChanges(V9,V15,V10,V12),x_actionSequence(x_TheList(x_storeDICase(V9,V8,V15),x_storeIICase(V9,V11,V15),x_doAnnounce("~&Induce direct influences in ~s.",[V8]),x_doForEach(V16,V15,x_actionSequence(x_TheList(x_induceDirectInfluences(V9,V16,V8,V13)))),x_doAnnounce("~&Induce downstream indirect influences in ~s.",[V11]),x_doAgentPlan(x_actionSequence(x_TheList(x_induceDownstreamIndirectInfluences(V9,V15,V11,V14,V8,V13)))),x_doAgentPlan(x_actionSequence(x_TheList(x_reportNumHypotheses(V8,"direct influences"),x_reportNumHypotheses(V11,"indirect influences")))))))) :- x_cid(a65b125de88198,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16).
xc_microtheory(a65b125de88198,x_PerceptualAgentMt).
xc_source_file(a65b125de88198,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88198,177).
xc_kb_names(a65b125de88198,["?domain","?lkmt","?dep-qtype","?indep-qtype","?col1","?col2","?rel","?di-casename","?mt","?before","?ii-casename","?after","?di-spindle","?ii-spindle","?changes","?dep-change"]).
xc_mapping_rows(a65b125de88198,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 195, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 201, column 70), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de88198,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 195, column 57), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 201, column 70), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_explainIncrementalQuantityChanges(V1,V2,V3,V4),x_actionSequence(x_TheList))) :- x_cid(a65b125de88199,V1,V2,V3,V4).
xc_microtheory(a65b125de88199,x_PerceptualAgentMt).
xc_source_file(a65b125de88199,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de88199,213).
xc_kb_names(a65b125de88199,["?mt","?changes","?before","?after"]).
xc_mapping_rows(a65b125de88199,[]).
'x_<=='(x_preferInContext(x_explainIncrementalQuantityChanges(V1,V2,V3,V4),V5,V6),x_different(V5,x_actionSequence(x_TheList))) :- x_cid(a65b125de8819a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125de8819a,x_PerceptualAgentMt).
xc_source_file(a65b125de8819a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8819a,220).
xc_kb_names(a65b125de8819a,["?mt","?changes","?before","?after","?seq1","?seq2"]).
xc_mapping_rows(a65b125de8819a,[]).
x_isa(x_numHypotheses,x_BinaryPredicate) :- x_cid(a65b125de8819b).
xc_microtheory(a65b125de8819b,x_PerceptualAgentMt).
xc_source_file(a65b125de8819b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8819b,224).
xc_kb_names(a65b125de8819b,[]).
xc_mapping_rows(a65b125de8819b,[]).
x_arity(x_numHypotheses,2) :- x_cid(a65b125de8819c).
xc_microtheory(a65b125de8819c,x_PerceptualAgentMt).
xc_source_file(a65b125de8819c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8819c,225).
xc_kb_names(a65b125de8819c,[]).
xc_mapping_rows(a65b125de8819c,[]).
x_arg1Isa(x_numHypotheses,x_Microtheory) :- x_cid(a65b125de8819d).
xc_microtheory(a65b125de8819d,x_PerceptualAgentMt).
xc_source_file(a65b125de8819d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8819d,226).
xc_kb_names(a65b125de8819d,[]).
xc_mapping_rows(a65b125de8819d,[]).
x_arg2Isa(x_numHypotheses,x_Integer) :- x_cid(a65b125de8819e).
xc_microtheory(a65b125de8819e,x_PerceptualAgentMt).
xc_source_file(a65b125de8819e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8819e,227).
xc_kb_names(a65b125de8819e,[]).
xc_mapping_rows(a65b125de8819e,[]).
x_comment(x_numHypotheses,"(numHypotheses ?casename ?num) binds ?num to the number of hypothesis statements in the case.") :- x_cid(a65b125de8819f).
xc_microtheory(a65b125de8819f,x_PerceptualAgentMt).
xc_source_file(a65b125de8819f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de8819f,228).
xc_kb_names(a65b125de8819f,[]).
xc_mapping_rows(a65b125de8819f,[]).
'x_<=='(x_numHypotheses(V1,V2),x_evaluate(V2,x_CardinalityFn(x_TheClosedRetrievalSetOf(V3,x_lookupOnly(x_kbOnly('x_ist-Information'(V1,x_hypothesis(V3)))))))) :- x_cid(a65b125de881a0,V1,V2,V3).
xc_microtheory(a65b125de881a0,x_PerceptualAgentMt).
xc_source_file(a65b125de881a0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a0,230).
xc_kb_names(a65b125de881a0,["?casename","?num","?hyp"]).
xc_mapping_rows(a65b125de881a0,[]).
x_isa(x_numAmbiguousDirection,x_BinaryPredicate) :- x_cid(a65b125de881a1).
xc_microtheory(a65b125de881a1,x_PerceptualAgentMt).
xc_source_file(a65b125de881a1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a1,239).
xc_kb_names(a65b125de881a1,[]).
xc_mapping_rows(a65b125de881a1,[]).
x_arity(x_numAmbiguousDirection,2) :- x_cid(a65b125de881a2).
xc_microtheory(a65b125de881a2,x_PerceptualAgentMt).
xc_source_file(a65b125de881a2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a2,240).
xc_kb_names(a65b125de881a2,[]).
xc_mapping_rows(a65b125de881a2,[]).
x_arg1Isa(x_numAmbiguousDirection,x_Microtheory) :- x_cid(a65b125de881a3).
xc_microtheory(a65b125de881a3,x_PerceptualAgentMt).
xc_source_file(a65b125de881a3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a3,241).
xc_kb_names(a65b125de881a3,[]).
xc_mapping_rows(a65b125de881a3,[]).
x_arg2Isa(x_numAmbiguousDirection,x_Integer) :- x_cid(a65b125de881a4).
xc_microtheory(a65b125de881a4,x_PerceptualAgentMt).
xc_source_file(a65b125de881a4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a4,242).
xc_kb_names(a65b125de881a4,[]).
xc_mapping_rows(a65b125de881a4,[]).
x_comment(x_numAmbiguousDirection,"(numAmbiguousDirection ?casename ?num) binds ?num to the number of ambiguous hypotheses in the case.") :- x_cid(a65b125de881a5).
xc_microtheory(a65b125de881a5,x_PerceptualAgentMt).
xc_source_file(a65b125de881a5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a5,243).
xc_kb_names(a65b125de881a5,[]).
xc_mapping_rows(a65b125de881a5,[]).
'x_<=='(x_numAmbiguousDirection(V1,V2),x_evaluate(V2,x_CardinalityFn(x_TheClosedRetrievalSetOf(V3,x_lookupOnly(x_kbOnly('x_ist-Information'(V1,x_ambiguousInfluenceDirection(V3)))))))) :- x_cid(a65b125de881a6,V1,V2,V3).
xc_microtheory(a65b125de881a6,x_PerceptualAgentMt).
xc_source_file(a65b125de881a6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a6,245).
xc_kb_names(a65b125de881a6,["?casename","?num","?amb"]).
xc_mapping_rows(a65b125de881a6,[]).
x_isa(x_reportNumHypotheses,x_ComplexActionPredicate) :- x_cid(a65b125de881a7).
xc_microtheory(a65b125de881a7,x_PerceptualAgentMt).
xc_source_file(a65b125de881a7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a7,255).
xc_kb_names(a65b125de881a7,[]).
xc_mapping_rows(a65b125de881a7,[]).
x_arity(x_reportNumHypotheses,2) :- x_cid(a65b125de881a8).
xc_microtheory(a65b125de881a8,x_PerceptualAgentMt).
xc_source_file(a65b125de881a8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a8,256).
xc_kb_names(a65b125de881a8,[]).
xc_mapping_rows(a65b125de881a8,[]).
x_arg1Isa(x_reportNumHypotheses,x_Microtheory) :- x_cid(a65b125de881a9).
xc_microtheory(a65b125de881a9,x_PerceptualAgentMt).
xc_source_file(a65b125de881a9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881a9,257).
xc_kb_names(a65b125de881a9,[]).
xc_mapping_rows(a65b125de881a9,[]).
x_arg2Isa(x_reportNumHypotheses,x_CycLTerm) :- x_cid(a65b125de881aa).
xc_microtheory(a65b125de881aa,x_PerceptualAgentMt).
xc_source_file(a65b125de881aa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881aa,258).
xc_kb_names(a65b125de881aa,[]).
xc_mapping_rows(a65b125de881aa,[]).
x_preconditionForMethod(x_and(x_numHypotheses(V1,V2),x_greaterThan(V2,0),x_numAmbiguousDirection(V1,V3)),x_methodForAction(x_reportNumHypotheses(V1,V4),x_actionSequence(x_TheList(x_doAnnounce("~&Induced ~a possible ~a~[~:; and ~:*~a ambiguous influences~].",[V2,V4,V3]))))) :- x_cid(a65b125de881ab,V1,V2,V3,V4).
xc_microtheory(a65b125de881ab,x_PerceptualAgentMt).
xc_source_file(a65b125de881ab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881ab,260).
xc_kb_names(a65b125de881ab,["?casename","?num-hyps","?num-ambiguous","?type"]).
xc_mapping_rows(a65b125de881ab,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 269, column 11), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de881ab,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 269, column 11), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_numHypotheses(V1,0),x_numAmbiguousDirection(V1,V2),x_greaterThan(V2,0)),x_methodForAction(x_reportNumHypotheses(V1,V3),x_actionSequence(x_TheList(x_doAnnounce("Induced ~a ambiguous ~a.",[V2,V3]))))) :- x_cid(a65b125de881ac,V1,V2,V3).
xc_microtheory(a65b125de881ac,x_PerceptualAgentMt).
xc_source_file(a65b125de881ac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881ac,271).
xc_kb_names(a65b125de881ac,["?casename","?num-ambiguous","?type"]).
xc_mapping_rows(a65b125de881ac,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 280, column 11), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de881ac,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 280, column 11), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_numHypotheses(V1,0),x_numAmbiguousDirection(V1,0)),x_methodForAction(x_reportNumHypotheses(V1,V2),x_actionSequence(x_TheList(x_doAnnounce("~&Induced no new ~a.",[V2]))))) :- x_cid(a65b125de881ad,V1,V2).
xc_microtheory(a65b125de881ad,x_PerceptualAgentMt).
xc_source_file(a65b125de881ad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881ad,282).
xc_kb_names(a65b125de881ad,["?casename","?type"]).
xc_mapping_rows(a65b125de881ad,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 289, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de881ad,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 289, column 44), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_buildQualitativeModel,x_ComplexActionPredicate) :- x_cid(a65b125de881ae).
xc_microtheory(a65b125de881ae,x_PerceptualAgentMt).
xc_source_file(a65b125de881ae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881ae,295).
xc_kb_names(a65b125de881ae,[]).
xc_mapping_rows(a65b125de881ae,[]).
x_arity(x_buildQualitativeModel,0) :- x_cid(a65b125de881af).
xc_microtheory(a65b125de881af,x_PerceptualAgentMt).
xc_source_file(a65b125de881af,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881af,296).
xc_kb_names(a65b125de881af,[]).
xc_mapping_rows(a65b125de881af,[]).
x_comment(x_buildQualitativeModel,"(buildQualitativeModel) converts hypothesized influences in spindle cases to an actual, believed model in the domain's model microtheory.") :- x_cid(a65b125de881b0).
xc_microtheory(a65b125de881b0,x_PerceptualAgentMt).
xc_source_file(a65b125de881b0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881b0,297).
xc_kb_names(a65b125de881b0,[]).
xc_mapping_rows(a65b125de881b0,[]).
x_preconditionForMethod(x_and(x_currentDomain(V1),x_unifies(V2,x_QualitativeModelMtFn(V1)),x_unifies(V3,x_SpindleMtFn(V1,x_DirectInfluences)),x_unifies(V4,x_SpindleMtFn(V1,x_IndirectInfluences)),x_evaluate(V5,x_TheClosedRetrievalSetOf(V6,'x_ist-Information'(V3,x_hypothesis(V6)))),x_evaluate(V7,x_TheClosedRetrievalSetOf(V6,'x_ist-Information'(V4,x_hypothesis(V6)))),x_evaluate(V8,x_TheClosedRetrievalSetOf(x_actionPositivelyAffectsQuantityType(V9,V10,V11,V12,V13),'x_ist-Information'(V4,x_actionPositivelyAffectsQuantityType(V9,V10,V11,V12,V13)))),x_evaluate(V14,x_TheClosedRetrievalSetOf(x_actionNegativelyAffectsQuantityType(V9,V10,V11,V12,V13),'x_ist-Information'(V4,x_actionNegativelyAffectsQuantityType(V9,V10,V11,V12,V13))))),x_methodForAction(x_buildQualitativeModel,x_actionSequence(x_TheList(x_doRecordMembersInContext(V2,V5),x_doRecordMembersInContext(V2,V7),x_doRecordMembersInContext(V2,V8),x_doRecordMembersInContext(V2,V14))))) :- x_cid(a65b125de881b1,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14).
xc_microtheory(a65b125de881b1,x_PerceptualAgentMt).
xc_source_file(a65b125de881b1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-quantity-changes.krf').
xc_source_line(a65b125de881b1,299).
xc_kb_names(a65b125de881b1,["?domain","?lkmt","?di-spindle-mt","?ii-spindle-mt","?dis","?hyp","?iis","?pos-acts","?q","?p","?c","?n","?r","?neg-acts"]).
xc_mapping_rows(a65b125de881b1,[]).
kb_cache_footer(footer{count:68,digest:cdfcbf73b314e8852d17df6f8f449bcb85219acb63317974bc58362cbfb3a595,headerDigest:'9f3c7a667055a7956b81c3f6abd313c7abda658d75026d97e1ad71ec4a3ab3a0'}).
