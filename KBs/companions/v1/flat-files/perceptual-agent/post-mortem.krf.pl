:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:8,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:99,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'2ef56e5d2e24c4cc1ce2fc4bee30c00b174fb72e7a9da52756f2c49c06cddd10',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3954,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf',sourceHash:ed09c2dbdd71fe5747385110cc387e3ac2928b4163bd7cd6c7c495e8d1cb7a7f,warnings:[]}).
x_isa(x_runPostMortem,x_ComplexActionPredicate) :- x_cid(a65b132a6e3a2b).
xc_microtheory(a65b132a6e3a2b,x_PerceptualAgentMt).
xc_source_file(a65b132a6e3a2b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf').
xc_source_line(a65b132a6e3a2b,15).
xc_kb_names(a65b132a6e3a2b,[]).
xc_mapping_rows(a65b132a6e3a2b,[]).
x_arity(x_runPostMortem,1) :- x_cid(a65b132a6e3a2c).
xc_microtheory(a65b132a6e3a2c,x_PerceptualAgentMt).
xc_source_file(a65b132a6e3a2c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf').
xc_source_line(a65b132a6e3a2c,16).
xc_kb_names(a65b132a6e3a2c,[]).
xc_mapping_rows(a65b132a6e3a2c,[]).
x_arg1Isa(x_runPostMortem,x_Microtheory) :- x_cid(a65b132a6e3a2d).
xc_microtheory(a65b132a6e3a2d,x_PerceptualAgentMt).
xc_source_file(a65b132a6e3a2d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf').
xc_source_line(a65b132a6e3a2d,17).
xc_kb_names(a65b132a6e3a2d,[]).
xc_mapping_rows(a65b132a6e3a2d,[]).
x_comment(x_runPostMortem,"(runPostMortem ?ctxt) analyzes results of an experiment after a game has completed.") :- x_cid(a65b132a6e3a2e).
xc_microtheory(a65b132a6e3a2e,x_PerceptualAgentMt).
xc_source_file(a65b132a6e3a2e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf').
xc_source_line(a65b132a6e3a2e,18).
xc_kb_names(a65b132a6e3a2e,[]).
xc_mapping_rows(a65b132a6e3a2e,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_runPostMortem(V1),x_actionSequence(x_TheList))) :- x_cid(a65b132a6e3a2f,V1).
xc_microtheory(a65b132a6e3a2f,x_PerceptualAgentMt).
xc_source_file(a65b132a6e3a2f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf').
xc_source_line(a65b132a6e3a2f,22).
xc_kb_names(a65b132a6e3a2f,["?ctxt"]).
xc_mapping_rows(a65b132a6e3a2f,[]).
'x_<=='(x_preferInContext(x_runPostMortem(V1),V2,V3),x_equals(V3,x_actionSequence(x_TheList))) :- x_cid(a65b132a6e3a30,V1,V2,V3).
xc_microtheory(a65b132a6e3a30,x_PerceptualAgentMt).
xc_source_file(a65b132a6e3a30,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf').
xc_source_line(a65b132a6e3a30,29).
xc_kb_names(a65b132a6e3a30,["?ctxt","?seq1","?seq2"]).
xc_mapping_rows(a65b132a6e3a30,[]).
x_preconditionForMethod(x_and(x_lookupOnly('x_ist-Information'(V1,x_interactionMode(V1,x_Experimentation)))),x_methodForAction(x_runPostMortem(V1),x_actionSequence(x_TheList(x_doAnnounce("~%PostMortem for experiment",[]))))) :- x_cid(a65b132a6e3a31,V1).
xc_microtheory(a65b132a6e3a31,x_PerceptualAgentMt).
xc_source_file(a65b132a6e3a31,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf').
xc_source_line(a65b132a6e3a31,51).
xc_kb_names(a65b132a6e3a31,["?ctxt"]).
xc_mapping_rows(a65b132a6e3a31,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 59, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132a6e3a31,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 59, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_currentDomain(V1),x_unifies(V2,x_LearnedKnowledgeMtFn(V1)),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_and(x_lookupOnly(x_localOnly('x_ist-Information'(V5,x_infoTransferred(x_CommandFn(V5,V6),V7)))),x_operatorFormulas(V4,V7)))),x_evaluate(V8,x_TheClosedRetrievalSetOf(V9,x_and(x_elementOf(V9,V3),x_variablizedStatement(V9,V10),x_uninferredSentence(x_lookupOnly(x_contextEnvAllowed('x_ist-Information'(x_SpindleMtFn(V1,x_ExecutionTraces),x_infoTransferred(V11,V10)))))))),x_different(V8,x_TheSet)),x_methodForAction(x_runPostMortem(V5),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V5,x_novelActionPreds(V8))),x_doForEach(V4,V8,x_postActionLearningGoal(V2,V4)))))) :- x_cid(a65b132a6e3a32,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b132a6e3a32,x_PerceptualAgentMt).
xc_source_file(a65b132a6e3a32,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/post-mortem.krf').
xc_source_line(a65b132a6e3a32,66).
xc_kb_names(a65b132a6e3a32,["?domain","?lkmt","?action-preds","?action-pred","?ctxt","?num","?action","?novel-action-preds","?novel-pred","?stmt","?cmd"]).
xc_mapping_rows(a65b132a6e3a32,[]).
kb_cache_footer(footer{count:8,digest:'2ef56e5d2e24c4cc1ce2fc4bee30c00b174fb72e7a9da52756f2c49c06cddd10',headerDigest:'749df21d777b8128de7aeece77b8fe2a3754129c898f80637f86a62c3016bd5f'}).
