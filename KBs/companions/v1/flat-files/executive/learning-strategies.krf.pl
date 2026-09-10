:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:9,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:278,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:ea09320dba8d0d978b00e9d767448135d77ac98ae759d790d038ba8998ec8a33,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:12537,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf',sourceHash:fc0f578bc64d7841d4b935b5f022485eb760bf48552d116c1866912fb0d23a9c,warnings:[]}).
x_preconditionForMethod(x_true,x_methodForAction(x_pursuePendingGoal(x_AssimilatePositiveSpatialExampleGoalFn(V1,V2,V3)),x_actionSequence(x_TheList(x_doAnnounce("~%I cannot pursue learning goal ~a~%   Because the information source ~a is not available in the current session",[[x_AssimilatePositiveSpatialExampleGoalFn,V1,V2,V3],V2]))))) :- x_cid(a65b125d29ef6a,V1,V2,V3).
xc_microtheory(a65b125d29ef6a,x_ExecutiveMt).
xc_source_file(a65b125d29ef6a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf').
xc_source_line(a65b125d29ef6a,156).
xc_kb_names(a65b125d29ef6a,["?example","?info-source","?concept"]).
xc_mapping_rows(a65b125d29ef6a,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 163, column 19), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d29ef6a,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 163, column 19), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_agentForOpenSketch(V1,V2),x_currentSessionReasoner(V3),x_currentTickler(V4),x_unifies(V5,x_AssimilatePositiveSpatialExampleGoalFn(V6,V1,V7)),x_unifies(V8,x_PerceptualEncodingGoalFn(V6,V1,V7)),x_unifies(V9,'x_AlignmentLearningClassificationGoalFn-Binary'(V6,V1,V7)),x_unifies(V10,'x_AlignmentLearningGoalFn-Positive'(V6,V1,V7))),x_methodForAction(x_pursuePendingGoal(x_AssimilatePositiveSpatialExampleGoalFn(V6,V1,V7)),x_actionSequence(x_TheList(x_setGoalStatus(V5,x_AwaitingSubordinates),x_postGoalForAgent(V8,V3),x_postGoalForAgent(V9,V4),x_postGoalForAgent(V10,V4),x_addSupportingGoals(V5,x_TheList(V8,V9,V10)),x_addPrecedingGoal(V9,V8),x_addPrecedingGoal(V10,V9),x_doAgentPlan(x_processGoals))))) :- x_cid(a65b125d29ef6b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125d29ef6b,x_ExecutiveMt).
xc_source_file(a65b125d29ef6b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf').
xc_source_line(a65b125d29ef6b,166).
xc_kb_names(a65b125d29ef6b,["?info-source","?agent","?sr","?tickler","?learning-goal","?example","?concept","?encoding-goal","?al-classify-goal","?assimilate-goal"]).
xc_mapping_rows(a65b125d29ef6b,[]).
'x_<=='(x_preferInContext(x_pursuePendingGoal(x_AssimilatePositiveSpatialExampleGoalFn(V1,V2,V3)),V4,V5),x_subexpressionMatching(x_setGoalStatus(V6,x_AwaitingSubordinates),V4,V7)) :- x_cid(a65b125d29ef6c,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d29ef6c,x_ExecutiveMt).
xc_source_file(a65b125d29ef6c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf').
xc_source_line(a65b125d29ef6c,192).
xc_kb_names(a65b125d29ef6c,["?example","?info-source","?concept","?seq1","?seq2","?learning-goal","?subex"]).
xc_mapping_rows(a65b125d29ef6c,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_pursuePendingGoal(x_AssimilateNegativeSpatialExampleGoalFn(V1,V2,V3)),x_actionSequence(x_TheList(x_doAnnounce("~%I cannot pursue learning goal ~a~%   Because the information source ~a is not available in the current session",[[x_AssimilateNegativeSpatialExampleGoalFn,V1,V2,V3],V2]))))) :- x_cid(a65b125d29ef6d,V1,V2,V3).
xc_microtheory(a65b125d29ef6d,x_ExecutiveMt).
xc_source_file(a65b125d29ef6d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf').
xc_source_line(a65b125d29ef6d,199).
xc_kb_names(a65b125d29ef6d,["?example","?info-source","?concept"]).
xc_mapping_rows(a65b125d29ef6d,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 206, column 19), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d29ef6d,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 206, column 19), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_agentForOpenSketch(V1,V2),x_currentSessionReasoner(V3),x_currentTickler(V4),x_unifies(V5,x_AssimilateNegativeSpatialExampleGoalFn(V6,V1,V7)),x_unifies(V8,x_PerceptualEncodingGoalFn(V6,V1,V7)),x_unifies(V9,'x_AlignmentLearningClassificationGoalFn-Binary'(V6,V1,V7)),x_unifies(V10,'x_AlignmentLearningGoalFn-Negative'(V6,V1,V7))),x_methodForAction(x_pursuePendingGoal(x_AssimilateNegativeSpatialExampleGoalFn(V6,V1,V7)),x_actionSequence(x_TheList(x_setGoalStatus(V5,x_AwaitingSubordinates),x_postGoalForAgent(V8,V3),x_postGoalForAgent(V9,V4),x_postGoalForAgent(V10,V4),x_addSupportingGoals(V5,x_TheList(V8,V9,V10)),x_addPrecedingGoal(V9,V8),x_addPrecedingGoal(V10,V9),x_doAgentPlan(x_processGoals))))) :- x_cid(a65b125d29ef6e,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125d29ef6e,x_ExecutiveMt).
xc_source_file(a65b125d29ef6e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf').
xc_source_line(a65b125d29ef6e,209).
xc_kb_names(a65b125d29ef6e,["?info-source","?agent","?sr","?tickler","?learning-goal","?example","?concept","?encoding-goal","?al-classify-goal","?assimilate-goal"]).
xc_mapping_rows(a65b125d29ef6e,[]).
'x_<=='(x_preferInContext(x_pursuePendingGoal(x_AssimilateNegativeSpatialExampleGoalFn(V1,V2,V3)),V4,V5),x_subexpressionMatching(x_setGoalStatus(V6,x_AwaitingSubordinates),V4,V7)) :- x_cid(a65b125d29ef6f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d29ef6f,x_ExecutiveMt).
xc_source_file(a65b125d29ef6f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf').
xc_source_line(a65b125d29ef6f,235).
xc_kb_names(a65b125d29ef6f,["?example","?info-source","?concept","?seq1","?seq2","?learning-goal","?subex"]).
xc_mapping_rows(a65b125d29ef6f,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_pursuePendingGoal(x_SpatialBinaryClassificationGoalFn(V1,V2,V3)),x_actionSequence(x_TheList(x_doAnnounce("~%I cannot pursue learning goal ~a~%   Because the information source ~a is not available in the current session",[[x_AssimilateNegativeSpatialExampleGoalFn,V1,V2,V3],V2]))))) :- x_cid(a65b125d29ef70,V1,V2,V3).
xc_microtheory(a65b125d29ef70,x_ExecutiveMt).
xc_source_file(a65b125d29ef70,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf').
xc_source_line(a65b125d29ef70,242).
xc_kb_names(a65b125d29ef70,["?example","?info-source","?concept"]).
xc_mapping_rows(a65b125d29ef70,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 249, column 19), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d29ef70,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 249, column 19), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_agentForOpenSketch(V1,V2),x_currentSessionReasoner(V3),x_currentTickler(V4),x_unifies(V5,x_SpatialBinaryClassificationGoalFn(V6,V1,V7)),x_unifies(V8,'x_PerceptualEncodingGoal-BestGuessFn'(V6,V1,V7)),x_unifies(V9,'x_AlignmentLearningClassificationGoalFn-Binary'(V6,V1,V7))),x_methodForAction(x_pursuePendingGoal(x_SpatialBinaryClassificationGoalFn(V6,V1,V7)),x_actionSequence(x_TheList(x_setGoalStatus(V5,x_AwaitingSubordinates),x_postGoalForAgent(V8,V3),x_postGoalForAgent(V9,V4),x_addSupportingGoals(V5,x_TheList(V8,V9)),x_addPrecedingGoal(V9,V8),x_doAgentPlan(x_processGoals))))) :- x_cid(a65b125d29ef71,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125d29ef71,x_ExecutiveMt).
xc_source_file(a65b125d29ef71,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf').
xc_source_line(a65b125d29ef71,252).
xc_kb_names(a65b125d29ef71,["?info-source","?agent","?sr","?tickler","?classify-goal","?example","?concept","?encoding-goal","?al-classify-goal"]).
xc_mapping_rows(a65b125d29ef71,[]).
'x_<=='(x_preferInContext(x_pursuePendingGoal(x_SpatialBinaryClassificationGoalFn(V1,V2,V3)),V4,V5),x_subexpressionMatching(x_setGoalStatus(V6,x_AwaitingSubordinates),V4,V7)) :- x_cid(a65b125d29ef72,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125d29ef72,x_ExecutiveMt).
xc_source_file(a65b125d29ef72,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/executive/learning-strategies.krf').
xc_source_line(a65b125d29ef72,272).
xc_kb_names(a65b125d29ef72,["?example","?info-source","?concept","?seq1","?seq2","?learning-goal","?subex"]).
xc_mapping_rows(a65b125d29ef72,[]).
kb_cache_footer(footer{count:9,digest:ea09320dba8d0d978b00e9d767448135d77ac98ae759d790d038ba8998ec8a33,headerDigest:cbb28ff1526f4e0ec5a62f4f429dec936eaa9aa27a224d2ff5b0640de02cac59}).
