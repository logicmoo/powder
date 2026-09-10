:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:69,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:349,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'97de8db4b6953600af2c825d662782848dc96ea310b4a8925186576da5fc60ee',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:12536,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf',sourceHash:'46728bacb4d15dc4dae7d03a8453afdd3a0a7b3ee7829dbaf9c47c46a615502f',warnings:[]}).
x_isa(x_postActionLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e11ee5d).
xc_microtheory(a65b125e11ee5d,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee5d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee5d,28).
xc_kb_names(a65b125e11ee5d,[]).
xc_mapping_rows(a65b125e11ee5d,[]).
x_arity(x_postActionLearningGoal,2) :- x_cid(a65b125e11ee5e).
xc_microtheory(a65b125e11ee5e,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee5e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee5e,29).
xc_kb_names(a65b125e11ee5e,[]).
xc_mapping_rows(a65b125e11ee5e,[]).
x_arg1Isa(x_postActionLearningGoal,x_Microtheory) :- x_cid(a65b125e11ee5f).
xc_microtheory(a65b125e11ee5f,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee5f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee5f,30).
xc_kb_names(a65b125e11ee5f,[]).
xc_mapping_rows(a65b125e11ee5f,[]).
x_arg2Isa(x_postActionLearningGoal,x_ActionPredicate) :- x_cid(a65b125e11ee60).
xc_microtheory(a65b125e11ee60,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee60,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee60,31).
xc_kb_names(a65b125e11ee60,[]).
xc_mapping_rows(a65b125e11ee60,[]).
x_comment(x_postActionLearningGoal,"(postActionLearningGoal ?lkmt ?action-pred) Assume ?lkmt is the learned knowledge microtheory for the domain.") :- x_cid(a65b125e11ee61).
xc_microtheory(a65b125e11ee61,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee61,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee61,32).
xc_kb_names(a65b125e11ee61,[]).
xc_mapping_rows(a65b125e11ee61,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_learningGoalForCompanion(x_LearnEffectOfActionFn(V2))),x_uninferredSentence(x_lookupOnly('x_ist-Information'(V3,V1))),x_unifies(t(V4,V5),V3)),x_methodForAction(x_postActionLearningGoal(V3,V2),x_actionSequence(x_TheList(x_doAnnounce("~&PostingGoal: ~s",[V1]),x_doRecord('x_ist-Information'(V3,V1)),x_doRecord('x_ist-Information'(V3,x_subgoalFor(x_LearnActionModelFn(V5),x_LearnEffectOfActionFn(V2)))))))) :- x_cid(a65b125e11ee62,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e11ee62,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee62,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee62,34).
xc_kb_names(a65b125e11ee62,["?goal-statement","?action-pred","?lkmt","?lkmt-functor","?domain"]).
xc_mapping_rows(a65b125e11ee62,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 46, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e11ee62,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 46, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_postActionLearningGoal(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee63,V1,V2).
xc_microtheory(a65b125e11ee63,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee63,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee63,54).
xc_kb_names(a65b125e11ee63,["?lkmt","?action-pred"]).
xc_mapping_rows(a65b125e11ee63,[]).
'x_<=='(x_preferInContext(x_postActionLearningGoal(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee64,V1,V2,V3,V4).
xc_microtheory(a65b125e11ee64,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee64,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee64,61).
xc_kb_names(a65b125e11ee64,["?lkmt","?action-pred","?seq1","?seq2"]).
xc_mapping_rows(a65b125e11ee64,[]).
x_isa(x_postOperatorEffectLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e11ee65).
xc_microtheory(a65b125e11ee65,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee65,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee65,65).
xc_kb_names(a65b125e11ee65,[]).
xc_mapping_rows(a65b125e11ee65,[]).
x_arity(x_postOperatorEffectLearningGoal,2) :- x_cid(a65b125e11ee66).
xc_microtheory(a65b125e11ee66,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee66,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee66,66).
xc_kb_names(a65b125e11ee66,[]).
xc_mapping_rows(a65b125e11ee66,[]).
x_arg1Isa(x_postOperatorEffectLearningGoal,x_Microtheory) :- x_cid(a65b125e11ee67).
xc_microtheory(a65b125e11ee67,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee67,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee67,67).
xc_kb_names(a65b125e11ee67,[]).
xc_mapping_rows(a65b125e11ee67,[]).
x_arg2Isa(x_postOperatorEffectLearningGoal,x_ActionPredicate) :- x_cid(a65b125e11ee68).
xc_microtheory(a65b125e11ee68,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee68,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee68,68).
xc_kb_names(a65b125e11ee68,[]).
xc_mapping_rows(a65b125e11ee68,[]).
x_comment(x_postOperatorEffectLearningGoal,"(postOperatorEffectLearningGoal ?lkmt ?operator) posts an action learning goal for the action-pred of ?operator.") :- x_cid(a65b125e11ee69).
xc_microtheory(a65b125e11ee69,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee69,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee69,69).
xc_kb_names(a65b125e11ee69,[]).
xc_mapping_rows(a65b125e11ee69,[]).
x_preconditionForMethod(x_operatorFormulas(V1,V2),x_methodForAction(x_postOperatorEffectLearningGoal(V3,V2),x_actionSequence(x_TheList(x_postActionLearningGoal(V3,V1))))) :- x_cid(a65b125e11ee6a,V1,V2,V3).
xc_microtheory(a65b125e11ee6a,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee6a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee6a,71).
xc_kb_names(a65b125e11ee6a,["?action-pred","?operator","?lkmt"]).
xc_mapping_rows(a65b125e11ee6a,[]).
x_isa(x_postEncodingLearningGoalForDecision,x_ComplexActionPredicate) :- x_cid(a65b125e11ee6b).
xc_microtheory(a65b125e11ee6b,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee6b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee6b,80).
xc_kb_names(a65b125e11ee6b,[]).
xc_mapping_rows(a65b125e11ee6b,[]).
x_arity(x_postEncodingLearningGoalForDecision,2) :- x_cid(a65b125e11ee6c).
xc_microtheory(a65b125e11ee6c,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee6c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee6c,81).
xc_kb_names(a65b125e11ee6c,[]).
xc_mapping_rows(a65b125e11ee6c,[]).
x_comment(x_postEncodingLearningGoalForDecision,"(postEncodingLearningGoalForDecision ?lkmt ?decision)") :- x_cid(a65b125e11ee6d).
xc_microtheory(a65b125e11ee6d,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee6d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee6d,82).
xc_kb_names(a65b125e11ee6d,[]).
xc_mapping_rows(a65b125e11ee6d,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_learningGoalForCompanion(x_LearnCaseEncodingFn(V2))),x_uninferredSentence(x_lookupOnly('x_ist-Information'(V3,V1)))),x_methodForAction(x_postEncodingLearningGoalForDecision(V3,V2),x_actionSequence(x_TheList(x_doAnnounce("~&Posting goal: ~s",[V1]),x_doRecord('x_ist-Information'(V3,V1)))))) :- x_cid(a65b125e11ee6e,V1,V2,V3).
xc_microtheory(a65b125e11ee6e,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee6e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee6e,84).
xc_kb_names(a65b125e11ee6e,["?goal-statement","?decision","?lkmt"]).
xc_mapping_rows(a65b125e11ee6e,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 95, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e11ee6e,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 95, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_postEncodingLearningGoalForDecision(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee6f,V1,V2).
xc_microtheory(a65b125e11ee6f,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee6f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee6f,100).
xc_kb_names(a65b125e11ee6f,["?lkmt","?decision"]).
xc_mapping_rows(a65b125e11ee6f,[]).
'x_<=='(x_preferInContext(x_postEncodingLearningGoalForDecision(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee70,V1,V2,V3,V4).
xc_microtheory(a65b125e11ee70,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee70,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee70,107).
xc_kb_names(a65b125e11ee70,["?lkmt","?decision","?seq1","?seq2"]).
xc_mapping_rows(a65b125e11ee70,[]).
x_isa(x_postDecisionLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e11ee71).
xc_microtheory(a65b125e11ee71,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee71,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee71,111).
xc_kb_names(a65b125e11ee71,[]).
xc_mapping_rows(a65b125e11ee71,[]).
x_arity(x_postDecisionLearningGoal,2) :- x_cid(a65b125e11ee72).
xc_microtheory(a65b125e11ee72,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee72,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee72,112).
xc_kb_names(a65b125e11ee72,[]).
xc_mapping_rows(a65b125e11ee72,[]).
x_comment(x_postDecisionLearningGoal,"(postDecisionLearningGoal ?lkmt (DecisionFn ?slot)) posts a goal to learn the ramifications of choosing the specified decision.") :- x_cid(a65b125e11ee73).
xc_microtheory(a65b125e11ee73,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee73,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee73,113).
xc_kb_names(a65b125e11ee73,[]).
xc_mapping_rows(a65b125e11ee73,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_learningGoalForCompanion(x_LearnDecisionFn(V2))),x_uninferredSentence(x_lookupOnly('x_ist-Information'(V3,V1))),x_unifies(t(V4,V5),V3)),x_methodForAction(x_postDecisionLearningGoal(V3,V2),x_actionSequence(x_TheList(x_doAnnounce("~&Posting goal: ~s",[V1]),x_doRecord('x_ist-Information'(V3,V1)),x_doRecord('x_ist-Information'(V3,x_subgoalFor(x_LearnActionModelFn(V5),x_LearnDecisionFn(V2)))))))) :- x_cid(a65b125e11ee74,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e11ee74,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee74,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee74,115).
xc_kb_names(a65b125e11ee74,["?goal-statement","?decision","?lkmt","?lkmt-functor","?domain"]).
xc_mapping_rows(a65b125e11ee74,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 127, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e11ee74,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 127, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_postDecisionLearningGoal(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee75,V1,V2).
xc_microtheory(a65b125e11ee75,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee75,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee75,134).
xc_kb_names(a65b125e11ee75,["?lkmt","?decision"]).
xc_mapping_rows(a65b125e11ee75,[]).
'x_<=='(x_preferInContext(x_postDecisionLearningGoal(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee76,V1,V2,V3,V4).
xc_microtheory(a65b125e11ee76,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee76,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee76,141).
xc_kb_names(a65b125e11ee76,["?lkmt","?decision","?seq1","?seq2"]).
xc_mapping_rows(a65b125e11ee76,[]).
x_isa(x_postInfluenceLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e11ee77).
xc_microtheory(a65b125e11ee77,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee77,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee77,144).
xc_kb_names(a65b125e11ee77,[]).
xc_mapping_rows(a65b125e11ee77,[]).
x_arity(x_postInfluenceLearningGoal,2) :- x_cid(a65b125e11ee78).
xc_microtheory(a65b125e11ee78,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee78,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee78,145).
xc_kb_names(a65b125e11ee78,[]).
xc_mapping_rows(a65b125e11ee78,[]).
x_comment(x_postInfluenceLearningGoal,"(postInfluenceLearningGoal ?lkmt ?quantity-type)") :- x_cid(a65b125e11ee79).
xc_microtheory(a65b125e11ee79,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee79,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee79,146).
xc_kb_names(a65b125e11ee79,[]).
xc_mapping_rows(a65b125e11ee79,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_learningGoalForCompanion(x_DetectPotentialQualitativeInfluence(V2))),x_uninferredSentence(x_lookupOnly('x_ist-Information'(V3,V1))),x_unifies(t(V4,V5),V3)),x_methodForAction(x_postInfluenceLearningGoal(V3,V2),x_actionSequence(x_TheList(x_doAnnounce("~&Posting goal: ~s",[V1]),x_doRecord('x_ist-Information'(V3,V1)),x_doRecord('x_ist-Information'(V3,x_subgoalFor(x_LearnQualitativeModelFn(V5),x_DetectPotentialQualitativeInfluence(V2)))))))) :- x_cid(a65b125e11ee7a,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e11ee7a,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee7a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee7a,148).
xc_kb_names(a65b125e11ee7a,["?goal-statement","?quantity-type","?lkmt","?lkmtmt-functor","?domain"]).
xc_mapping_rows(a65b125e11ee7a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 160, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e11ee7a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 160, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_postInfluenceLearningGoal(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee7b,V1,V2).
xc_microtheory(a65b125e11ee7b,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee7b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee7b,167).
xc_kb_names(a65b125e11ee7b,["?lkmt","?quantity-type"]).
xc_mapping_rows(a65b125e11ee7b,[]).
'x_<=='(x_preferInContext(x_postInfluenceLearningGoal(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee7c,V1,V2,V3,V4).
xc_microtheory(a65b125e11ee7c,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee7c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee7c,174).
xc_kb_names(a65b125e11ee7c,["?lkmt","?quantity-type","?seq1","?seq2"]).
xc_mapping_rows(a65b125e11ee7c,[]).
'x_<=='(x_preferInContext(x_postQuantityLearningGoalForSubgoal(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee7d,V1,V2,V3,V4).
xc_microtheory(a65b125e11ee7d,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee7d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee7d,180).
xc_kb_names(a65b125e11ee7d,["?lkmt","?goal","?seq1","?seq2"]).
xc_mapping_rows(a65b125e11ee7d,[]).
x_isa(x_postAffordanceLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e11ee7e).
xc_microtheory(a65b125e11ee7e,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee7e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee7e,184).
xc_kb_names(a65b125e11ee7e,[]).
xc_mapping_rows(a65b125e11ee7e,[]).
x_arity(x_postAffordanceLearningGoal,2) :- x_cid(a65b125e11ee7f).
xc_microtheory(a65b125e11ee7f,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee7f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee7f,185).
xc_kb_names(a65b125e11ee7f,[]).
xc_mapping_rows(a65b125e11ee7f,[]).
x_arg1Isa(x_postAffordanceLearningGoal,x_Microtheory) :- x_cid(a65b125e11ee80).
xc_microtheory(a65b125e11ee80,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee80,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee80,186).
xc_kb_names(a65b125e11ee80,[]).
xc_mapping_rows(a65b125e11ee80,[]).
x_arg2Isa(x_postAffordanceLearningGoal,x_Collection) :- x_cid(a65b125e11ee81).
xc_microtheory(a65b125e11ee81,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee81,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee81,187).
xc_kb_names(a65b125e11ee81,[]).
xc_mapping_rows(a65b125e11ee81,[]).
x_comment(x_postAffordanceLearningGoal,"(postAffordanceLearningGoal ?lkmt ?entity-type)") :- x_cid(a65b125e11ee82).
xc_microtheory(a65b125e11ee82,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee82,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee82,188).
xc_kb_names(a65b125e11ee82,[]).
xc_mapping_rows(a65b125e11ee82,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_learningGoalForCompanion(x_LearnAffordancesOfEntityFn(V2))),x_uninferredSentence(x_lookupOnly('x_ist-Information'(V3,V1)))),x_methodForAction(x_postAffordanceLearningGoal(V3,V2),x_actionSequence(x_TheList(x_doAnnounce("~&Posting goal: ~s",[V1]),x_doRecord('x_ist-Information'(V3,V1)))))) :- x_cid(a65b125e11ee83,V1,V2,V3).
xc_microtheory(a65b125e11ee83,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee83,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee83,191).
xc_kb_names(a65b125e11ee83,["?goal-statement","?entity-type","?lkmt"]).
xc_mapping_rows(a65b125e11ee83,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 202, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e11ee83,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 202, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_postAffordanceLearningGoal(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee84,V1,V2).
xc_microtheory(a65b125e11ee84,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee84,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee84,206).
xc_kb_names(a65b125e11ee84,["?lkmt","?goal"]).
xc_mapping_rows(a65b125e11ee84,[]).
'x_<=='(x_preferInContext(x_postAffordanceLearningGoal(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee85,V1,V2,V3,V4).
xc_microtheory(a65b125e11ee85,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee85,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee85,213).
xc_kb_names(a65b125e11ee85,["?lkmt","?goal","?seq1","?seq2"]).
xc_mapping_rows(a65b125e11ee85,[]).
x_isa(x_postDecompositionLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e11ee86).
xc_microtheory(a65b125e11ee86,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee86,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee86,216).
xc_kb_names(a65b125e11ee86,[]).
xc_mapping_rows(a65b125e11ee86,[]).
x_arity(x_postDecompositionLearningGoal,2) :- x_cid(a65b125e11ee87).
xc_microtheory(a65b125e11ee87,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee87,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee87,217).
xc_kb_names(a65b125e11ee87,[]).
xc_mapping_rows(a65b125e11ee87,[]).
x_comment(x_postDecompositionLearningGoal,"(postDecompositionLearningGoal ?lkmt ?goal)") :- x_cid(a65b125e11ee88).
xc_microtheory(a65b125e11ee88,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee88,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee88,218).
xc_kb_names(a65b125e11ee88,[]).
xc_mapping_rows(a65b125e11ee88,[]).
x_preconditionForMethod(x_and(x_liftedIndexicalGoal(V1,V2),x_unifies(V3,x_learningGoalForCompanion(x_LearnDecompositionFn(V2))),x_uninferredSentence(x_lookupOnly('x_ist-Information'(V4,V3)))),x_methodForAction(x_postDecompositionLearningGoal(V4,V1),x_actionSequence(x_TheList(x_doAnnounce("~&Posting goal: ~s",[V3]),x_doRecord('x_ist-Information'(V4,V3)))))) :- x_cid(a65b125e11ee89,V1,V2,V3,V4).
xc_microtheory(a65b125e11ee89,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee89,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee89,221).
xc_kb_names(a65b125e11ee89,["?goal","?lifted-goal","?goal-statement","?lkmt"]).
xc_mapping_rows(a65b125e11ee89,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 233, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e11ee89,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 233, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_postDecompositionLearningGoal(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee8a,V1,V2).
xc_microtheory(a65b125e11ee8a,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee8a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee8a,237).
xc_kb_names(a65b125e11ee8a,["?lkmt","?goal"]).
xc_mapping_rows(a65b125e11ee8a,[]).
'x_<=='(x_preferInContext(x_postDecompositionLearningGoal(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee8b,V1,V2,V3,V4).
xc_microtheory(a65b125e11ee8b,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee8b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee8b,244).
xc_kb_names(a65b125e11ee8b,["?lkmt","?goal","?seq1","?seq2"]).
xc_mapping_rows(a65b125e11ee8b,[]).
x_isa(x_liftedIndexicalGoal,x_BinaryPredicate) :- x_cid(a65b125e11ee8c).
xc_microtheory(a65b125e11ee8c,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee8c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee8c,247).
xc_kb_names(a65b125e11ee8c,[]).
xc_mapping_rows(a65b125e11ee8c,[]).
x_arity(x_liftedIndexicalGoal,2) :- x_cid(a65b125e11ee8d).
xc_microtheory(a65b125e11ee8d,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee8d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee8d,248).
xc_kb_names(a65b125e11ee8d,[]).
xc_mapping_rows(a65b125e11ee8d,[]).
x_comment(x_liftedIndexicalGoal,"(liftedIndexicalGoal ?goal ?lifted-goal) replaces occurences of currentRole with (IndexicalFn currentPlayer).") :- x_cid(a65b125e11ee8e).
xc_microtheory(a65b125e11ee8e,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee8e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee8e,249).
xc_kb_names(a65b125e11ee8e,[]).
xc_mapping_rows(a65b125e11ee8e,[]).
'x_<=='(x_liftedIndexicalGoal(V1,V2),x_currentPlayer(V3),x_evaluate(V2,x_SubstituteFormulaFn(x_IndexicalFn(x_currentRole),V3,V1))) :- x_cid(a65b125e11ee8f,V1,V2,V3).
xc_microtheory(a65b125e11ee8f,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee8f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee8f,252).
xc_kb_names(a65b125e11ee8f,["?goal","?lifted-goal","?who"]).
xc_mapping_rows(a65b125e11ee8f,[]).
x_isa(x_postOptimalityLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e11ee90).
xc_microtheory(a65b125e11ee90,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee90,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee90,258).
xc_kb_names(a65b125e11ee90,[]).
xc_mapping_rows(a65b125e11ee90,[]).
x_arity(x_postOptimalityLearningGoal,2) :- x_cid(a65b125e11ee91).
xc_microtheory(a65b125e11ee91,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee91,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee91,259).
xc_kb_names(a65b125e11ee91,[]).
xc_mapping_rows(a65b125e11ee91,[]).
x_comment(x_postOptimalityLearningGoal,"(postOptimalityLearningGoal ?lkmt ?action-pred)") :- x_cid(a65b125e11ee92).
xc_microtheory(a65b125e11ee92,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee92,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee92,260).
xc_kb_names(a65b125e11ee92,[]).
xc_mapping_rows(a65b125e11ee92,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_learningGoalForCompanion(x_LearnOptimalConditionFn(V2))),x_uninferredSentence(x_lookupOnly('x_ist-Information'(V3,V1)))),x_methodForAction(x_postOptimalityLearningGoal(V3,V2),x_actionSequence(x_TheList(x_doAnnounce("~&Posting goal: ~s",[V1]),x_doRecord('x_ist-Information'(V3,V1)))))) :- x_cid(a65b125e11ee93,V1,V2,V3).
xc_microtheory(a65b125e11ee93,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee93,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee93,262).
xc_kb_names(a65b125e11ee93,["?goal-statement","?action-pred","?lkmt"]).
xc_mapping_rows(a65b125e11ee93,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 273, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e11ee93,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 273, column 42), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_postOptimalityLearningGoal(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee94,V1,V2).
xc_microtheory(a65b125e11ee94,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee94,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee94,277).
xc_kb_names(a65b125e11ee94,["?lkmt","?goal"]).
xc_mapping_rows(a65b125e11ee94,[]).
'x_<=='(x_preferInContext(x_postOptimalityLearningGoal(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e11ee95,V1,V2,V3,V4).
xc_microtheory(a65b125e11ee95,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee95,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee95,284).
xc_kb_names(a65b125e11ee95,["?lkmt","?action-pred","?seq1","?seq2"]).
xc_mapping_rows(a65b125e11ee95,[]).
x_isa(x_postRefinementLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e11ee96).
xc_microtheory(a65b125e11ee96,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee96,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee96,289).
xc_kb_names(a65b125e11ee96,[]).
xc_mapping_rows(a65b125e11ee96,[]).
x_arity(x_postRefinementLearningGoal,2) :- x_cid(a65b125e11ee97).
xc_microtheory(a65b125e11ee97,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee97,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee97,290).
xc_kb_names(a65b125e11ee97,[]).
xc_mapping_rows(a65b125e11ee97,[]).
x_comment(x_postRefinementLearningGoal,"(postRefinementLearningGoal ?lkmt ?concept) posts a goal to refine a concept, \nwhich may be a NART indicating an independent or dependent variable or a definition of some kind.") :- x_cid(a65b125e11ee98).
xc_microtheory(a65b125e11ee98,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee98,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee98,291).
xc_kb_names(a65b125e11ee98,[]).
xc_mapping_rows(a65b125e11ee98,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_learningGoalForCompanion(x_RefineFn(V2)))),x_methodForAction(x_postRefinementLearningGoal(V3,V2),x_actionSequence(x_TheList(x_doAnnounce("~&PostingGoal: ~s",[V1]),x_doRecord('x_ist-Information'(V3,V1)))))) :- x_cid(a65b125e11ee99,V1,V2,V3).
xc_microtheory(a65b125e11ee99,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee99,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee99,294).
xc_kb_names(a65b125e11ee99,["?goal-statement","?concept","?lkmt"]).
xc_mapping_rows(a65b125e11ee99,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 302, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e11ee99,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 302, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_postPurposeLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e11ee9a).
xc_microtheory(a65b125e11ee9a,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee9a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee9a,312).
xc_kb_names(a65b125e11ee9a,[]).
xc_mapping_rows(a65b125e11ee9a,[]).
x_arity(x_postPurposeLearningGoal,2) :- x_cid(a65b125e11ee9b).
xc_microtheory(a65b125e11ee9b,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee9b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee9b,313).
xc_kb_names(a65b125e11ee9b,[]).
xc_mapping_rows(a65b125e11ee9b,[]).
x_arg1Isa(x_postPurposeLearningGoal,x_Microtheory) :- x_cid(a65b125e11ee9c).
xc_microtheory(a65b125e11ee9c,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee9c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee9c,314).
xc_kb_names(a65b125e11ee9c,[]).
xc_mapping_rows(a65b125e11ee9c,[]).
x_arg2Isa(x_postPurposeLearningGoal,x_ActionPredicate) :- x_cid(a65b125e11ee9d).
xc_microtheory(a65b125e11ee9d,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee9d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee9d,315).
xc_kb_names(a65b125e11ee9d,[]).
xc_mapping_rows(a65b125e11ee9d,[]).
x_comment(x_postPurposeLearningGoal,"(postPurposeLearningGoal ?lkmt ?action-pred) Assume ?lkmt is the learned knowledge microtheory for the domain.") :- x_cid(a65b125e11ee9e).
xc_microtheory(a65b125e11ee9e,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee9e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee9e,316).
xc_kb_names(a65b125e11ee9e,[]).
xc_mapping_rows(a65b125e11ee9e,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_learningGoalForCompanion(x_LearnPurposeOfActionFn(V2))),x_uninferredSentence(x_lookupOnly('x_ist-Information'(V3,V1))),x_unifies(t(V4,V5),V3)),x_methodForAction(x_postPurposeLearningGoal(V3,V2),x_actionSequence(x_TheList(x_doAnnounce("~&PostingGoal: ~s",[V1]),x_doRecord('x_ist-Information'(V3,V1)),x_doRecord('x_ist-Information'(V3,x_subgoalFor(x_LearnStrategicModelFn(V5),x_LearnPurposeOfActionFn(V2)))))))) :- x_cid(a65b125e11ee9f,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e11ee9f,x_PerceptualAgentMt).
xc_source_file(a65b125e11ee9f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11ee9f,318).
xc_kb_names(a65b125e11ee9f,["?goal-statement","?action-pred","?lkmt","?lkmt-functor","?domain"]).
xc_mapping_rows(a65b125e11ee9f,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 330, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e11ee9f,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 330, column 41), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_postPurposeLearningGoal(V1,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125e11eea0,V1,V2).
xc_microtheory(a65b125e11eea0,x_PerceptualAgentMt).
xc_source_file(a65b125e11eea0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11eea0,338).
xc_kb_names(a65b125e11eea0,["?lkmt","?action-pred"]).
xc_mapping_rows(a65b125e11eea0,[]).
'x_<=='(x_preferInContext(x_postPurposeLearningGoal(V1,V2),V3,V4),x_different(V3,x_actionSequence(x_TheList))) :- x_cid(a65b125e11eea1,V1,V2,V3,V4).
xc_microtheory(a65b125e11eea1,x_PerceptualAgentMt).
xc_source_file(a65b125e11eea1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/posting-goals.krf').
xc_source_line(a65b125e11eea1,345).
xc_kb_names(a65b125e11eea1,["?lkmt","?action-pred","?seq1","?seq2"]).
xc_mapping_rows(a65b125e11eea1,[]).
kb_cache_footer(footer{count:69,digest:'97de8db4b6953600af2c825d662782848dc96ea310b4a8925186576da5fc60ee',headerDigest:'765d4d74ca493fb5217ed2d86d50961fe7045e185e85aebe9017776271ea677e'}).
