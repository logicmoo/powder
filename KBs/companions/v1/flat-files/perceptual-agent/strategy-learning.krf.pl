:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:16,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:168,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'7e1aa2a66553840cc3495198d3259818885cff0bbffd6d8806daa6c8248fefa3',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:7009,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf',sourceHash:'52bff5212861868bc4b514b49d25235bb310e5ff4a52f22b131b76b153dbdfc3',warnings:[]}).
x_preconditionForMethod(x_and('x_ist-Information'(V1,x_performanceGoalForGame(V1,V2)),'x_ist-Information'(V1,x_experimentCase(V1,V3)),x_experimentLearningGoal(V3,V4),x_numAnswers(1,x_currentDomain(V5))),x_methodForAction(x_runPostMortem(V1),x_actionSequence(x_TheList(x_doAnnounce("~%This is the post-mortem for ~s~%  whose performance goal is ~s~%  and learning goal is ~s",[V3,V2,V4]),x_doEndGame,x_designFollowupExperiments(V1,V5,V3,V4))))) :- x_cid(a65b125e284b11,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e284b11,x_PerceptualAgentMt).
xc_source_file(a65b125e284b11,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b11,25).
xc_kb_names(a65b125e284b11,["?ctxt","?goal","?expt","?learning-goal","?domain"]).
xc_mapping_rows(a65b125e284b11,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 35, column 21), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e284b11,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 35, column 21), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_explainStrategy,x_ComplexActionPredicate) :- x_cid(a65b125e284b12).
xc_microtheory(a65b125e284b12,x_PerceptualAgentMt).
xc_source_file(a65b125e284b12,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b12,73).
xc_kb_names(a65b125e284b12,[]).
xc_mapping_rows(a65b125e284b12,[]).
x_arity(x_explainStrategy,3) :- x_cid(a65b125e284b13).
xc_microtheory(a65b125e284b13,x_PerceptualAgentMt).
xc_source_file(a65b125e284b13,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b13,74).
xc_kb_names(a65b125e284b13,[]).
xc_mapping_rows(a65b125e284b13,[]).
x_arg1Isa(x_explainStrategy,x_Event) :- x_cid(a65b125e284b14).
xc_microtheory(a65b125e284b14,x_PerceptualAgentMt).
xc_source_file(a65b125e284b14,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b14,75).
xc_kb_names(a65b125e284b14,[]).
xc_mapping_rows(a65b125e284b14,[]).
x_arg2Isa(x_explainStrategy,x_CycLTerm) :- x_cid(a65b125e284b15).
xc_microtheory(a65b125e284b15,x_PerceptualAgentMt).
xc_source_file(a65b125e284b15,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b15,76).
xc_kb_names(a65b125e284b15,[]).
xc_mapping_rows(a65b125e284b15,[]).
x_arg3Isa(x_explainStrategy,x_TimeInterval) :- x_cid(a65b125e284b16).
xc_microtheory(a65b125e284b16,x_PerceptualAgentMt).
xc_source_file(a65b125e284b16,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b16,77).
xc_kb_names(a65b125e284b16,[]).
xc_mapping_rows(a65b125e284b16,[]).
x_comment(x_explainStrategy,"(explainStrategy ?event ?when) attempts to recognize strategies in user actions.") :- x_cid(a65b125e284b17).
xc_microtheory(a65b125e284b17,x_PerceptualAgentMt).
xc_source_file(a65b125e284b17,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b17,78).
xc_kb_names(a65b125e284b17,[]).
xc_mapping_rows(a65b125e284b17,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_explainStrategy(V1,V2,V3),x_actionSequence(x_TheList))) :- x_cid(a65b125e284b18,V1,V2,V3).
xc_microtheory(a65b125e284b18,x_PerceptualAgentMt).
xc_source_file(a65b125e284b18,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b18,81).
xc_kb_names(a65b125e284b18,["?event","?operator","?when"]).
xc_mapping_rows(a65b125e284b18,[]).
x_isa(x_pursueDecompositionLearningGoal,x_ComplexActionPredicate) :- x_cid(a65b125e284b19).
xc_microtheory(a65b125e284b19,x_PerceptualAgentMt).
xc_source_file(a65b125e284b19,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b19,157).
xc_kb_names(a65b125e284b19,[]).
xc_mapping_rows(a65b125e284b19,[]).
x_arity(x_pursueDecompositionLearningGoal,5) :- x_cid(a65b125e284b1a).
xc_microtheory(a65b125e284b1a,x_PerceptualAgentMt).
xc_source_file(a65b125e284b1a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b1a,158).
xc_kb_names(a65b125e284b1a,[]).
xc_mapping_rows(a65b125e284b1a,[]).
x_arg1Isa(x_pursueDecompositionLearningGoal,x_Microtheory) :- x_cid(a65b125e284b1b).
xc_microtheory(a65b125e284b1b,x_PerceptualAgentMt).
xc_source_file(a65b125e284b1b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b1b,159).
xc_kb_names(a65b125e284b1b,[]).
xc_mapping_rows(a65b125e284b1b,[]).
x_arg2Isa(x_pursueDecompositionLearningGoal,'x_Agent-Generic') :- x_cid(a65b125e284b1c).
xc_microtheory(a65b125e284b1c,x_PerceptualAgentMt).
xc_source_file(a65b125e284b1c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b1c,160).
xc_kb_names(a65b125e284b1c,[]).
xc_mapping_rows(a65b125e284b1c,[]).
x_arg3Isa(x_pursueDecompositionLearningGoal,x_Goal) :- x_cid(a65b125e284b1d).
xc_microtheory(a65b125e284b1d,x_PerceptualAgentMt).
xc_source_file(a65b125e284b1d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b1d,161).
xc_kb_names(a65b125e284b1d,[]).
xc_mapping_rows(a65b125e284b1d,[]).
x_arg4Isa(x_pursueDecompositionLearningGoal,x_List) :- x_cid(a65b125e284b1e).
xc_microtheory(a65b125e284b1e,x_PerceptualAgentMt).
xc_source_file(a65b125e284b1e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b1e,162).
xc_kb_names(a65b125e284b1e,[]).
xc_mapping_rows(a65b125e284b1e,[]).
x_arg5Isa(x_pursueDecompositionLearningGoal,x_List) :- x_cid(a65b125e284b1f).
xc_microtheory(a65b125e284b1f,x_PerceptualAgentMt).
xc_source_file(a65b125e284b1f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b1f,163).
xc_kb_names(a65b125e284b1f,[]).
xc_mapping_rows(a65b125e284b1f,[]).
x_comment(x_pursueDecompositionLearningGoal,"(pursueDecompositionLearningGoal ?mt ?actor ?goal (TheList) ?parent-goals) attempts to learn to pursue a goal by trying alternative decompositions.") :- x_cid(a65b125e284b20).
xc_microtheory(a65b125e284b20,x_PerceptualAgentMt).
xc_source_file(a65b125e284b20,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/strategy-learning.krf').
xc_source_line(a65b125e284b20,164).
xc_kb_names(a65b125e284b20,[]).
xc_mapping_rows(a65b125e284b20,[]).
kb_cache_footer(footer{count:16,digest:'7e1aa2a66553840cc3495198d3259818885cff0bbffd6d8806daa6c8248fefa3',headerDigest:'295d9d272fcf791d244703d3a3c211e126afff5a9758e0ad6002c7ab9bf96d1c'}).
