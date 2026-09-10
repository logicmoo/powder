:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:197,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:712,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'6cef2554c93d32f4fbc246eaf625c39de9fa8bf8387623693ae10e7d29573ff2',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:33081,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf',sourceHash:b07959b5ac10a8e98497b65eb47cfb0a1e05e0b1bae3e4c2d434db207702b327,warnings:[]}).
x_isa(x_explainEvent,x_ComplexActionPredicate) :- x_cid(a65b125de4aaa6).
xc_microtheory(a65b125de4aaa6,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaa6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaa6,22).
xc_kb_names(a65b125de4aaa6,[]).
xc_mapping_rows(a65b125de4aaa6,[]).
x_arity(x_explainEvent,4) :- x_cid(a65b125de4aaa7).
xc_microtheory(a65b125de4aaa7,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaa7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaa7,23).
xc_kb_names(a65b125de4aaa7,[]).
xc_mapping_rows(a65b125de4aaa7,[]).
x_arg1Isa(x_explainEvent,x_Microtheory) :- x_cid(a65b125de4aaa8).
xc_microtheory(a65b125de4aaa8,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaa8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaa8,24).
xc_kb_names(a65b125de4aaa8,[]).
xc_mapping_rows(a65b125de4aaa8,[]).
x_arg2Isa(x_explainEvent,x_Event) :- x_cid(a65b125de4aaa9).
xc_microtheory(a65b125de4aaa9,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaa9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaa9,25).
xc_kb_names(a65b125de4aaa9,[]).
xc_mapping_rows(a65b125de4aaa9,[]).
x_arg3Isa(x_explainEvent,x_Collection) :- x_cid(a65b125de4aaaa).
xc_microtheory(a65b125de4aaaa,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaaa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaaa,26).
xc_kb_names(a65b125de4aaaa,[]).
xc_mapping_rows(a65b125de4aaaa,[]).
x_arg4Isa(x_explainEvent,x_TimeInterval) :- x_cid(a65b125de4aaab).
xc_microtheory(a65b125de4aaab,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaab,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaab,27).
xc_kb_names(a65b125de4aaab,[]).
xc_mapping_rows(a65b125de4aaab,[]).
x_comment(x_explainEvent,"(explainEvent ?mt ?event ?event-type ?when) attempts to explain an asynchronous event with respect to a process limit point or prior action or event.") :- x_cid(a65b125de4aaac).
xc_microtheory(a65b125de4aaac,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaac,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaac,28).
xc_kb_names(a65b125de4aaac,[]).
xc_mapping_rows(a65b125de4aaac,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_explainEvent(V1,V2,V3,V4),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V1,x_explanationFailure(V3))),x_doAnnounce("Failure to explain ~a in ~a",[V2,V4]))))) :- x_cid(a65b125de4aaad,V1,V2,V3,V4).
xc_microtheory(a65b125de4aaad,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaad,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaad,30).
xc_kb_names(a65b125de4aaad,["?mt","?event","?event-type","?when"]).
xc_mapping_rows(a65b125de4aaad,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 37, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de4aaad,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 37, column 51), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_explainEvent(V1,V2,V3,V4),V5,V6),x_someArgumentHasPredicate(V6,x_doAnnounce)) :- x_cid(a65b125de4aaae,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125de4aaae,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaae,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaae,39).
xc_kb_names(a65b125de4aaae,["?mt","?event","?event-type","?when","?seq1","?seq2"]).
xc_mapping_rows(a65b125de4aaae,[]).
x_isa(x_hypothesizedProcessLimitFromAction,x_BinaryPredicate) :- x_cid(a65b125de4aaaf).
xc_microtheory(a65b125de4aaaf,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaaf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaaf,42).
xc_kb_names(a65b125de4aaaf,[]).
xc_mapping_rows(a65b125de4aaaf,[]).
x_arity(x_hypothesizedProcessLimitFromAction,2) :- x_cid(a65b125de4aab0).
xc_microtheory(a65b125de4aab0,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab0,43).
xc_kb_names(a65b125de4aab0,[]).
xc_mapping_rows(a65b125de4aab0,[]).
x_arg1Isa(x_hypothesizedProcessLimitFromAction,x_ActionPredicate) :- x_cid(a65b125de4aab1).
xc_microtheory(a65b125de4aab1,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab1,44).
xc_kb_names(a65b125de4aab1,[]).
xc_mapping_rows(a65b125de4aab1,[]).
x_arg2Isa(x_hypothesizedProcessLimitFromAction,x_Collection) :- x_cid(a65b125de4aab2).
xc_microtheory(a65b125de4aab2,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab2,45).
xc_kb_names(a65b125de4aab2,[]).
xc_mapping_rows(a65b125de4aab2,[]).
x_comment(x_hypothesizedProcessLimitFromAction,"(hypothesizedProcessLimitFromAction ?action-pred ?event-type) is a reifiable statement that indicates that ?event-type probably terminates a process started by ?action-pred.") :- x_cid(a65b125de4aab3).
xc_microtheory(a65b125de4aab3,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab3,46).
xc_kb_names(a65b125de4aab3,[]).
xc_mapping_rows(a65b125de4aab3,[]).
x_isa(x_ActionProcessTypeFn,'x_Function-Denotational') :- x_cid(a65b125de4aab4).
xc_microtheory(a65b125de4aab4,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab4,48).
xc_kb_names(a65b125de4aab4,[]).
xc_mapping_rows(a65b125de4aab4,[]).
x_isa(x_ActionProcessTypeFn,'x_AtomicAnalogyNAT-Function') :- x_cid(a65b125de4aab5).
xc_microtheory(a65b125de4aab5,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab5,49).
xc_kb_names(a65b125de4aab5,[]).
xc_mapping_rows(a65b125de4aab5,[]).
x_arity(x_ActionProcessTypeFn,1) :- x_cid(a65b125de4aab6).
xc_microtheory(a65b125de4aab6,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab6,50).
xc_kb_names(a65b125de4aab6,[]).
xc_mapping_rows(a65b125de4aab6,[]).
x_arg1Isa(x_ActionProcessTypeFn,x_ActionPredicate) :- x_cid(a65b125de4aab7).
xc_microtheory(a65b125de4aab7,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab7,51).
xc_kb_names(a65b125de4aab7,[]).
xc_mapping_rows(a65b125de4aab7,[]).
x_resultIsa(x_ActionProcessTypeFn,x_QPProcessType) :- x_cid(a65b125de4aab8).
xc_microtheory(a65b125de4aab8,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab8,52).
xc_kb_names(a65b125de4aab8,[]).
xc_mapping_rows(a65b125de4aab8,[]).
x_comment(x_ActionProcessTypeFn,"(ActionProcessTypeFn <action-pred>) denotes the process type initiated by actions of type <action-pred>.") :- x_cid(a65b125de4aab9).
xc_microtheory(a65b125de4aab9,x_PerceptualAgentMt).
xc_source_file(a65b125de4aab9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aab9,53).
xc_kb_names(a65b125de4aab9,[]).
xc_mapping_rows(a65b125de4aab9,[]).
x_isa(x_processDependentVariable,x_BinaryPredicate) :- x_cid(a65b125de4aaba).
xc_microtheory(a65b125de4aaba,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaba,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaba,57).
xc_kb_names(a65b125de4aaba,[]).
xc_mapping_rows(a65b125de4aaba,[]).
x_arity(x_processDependentVariable,2) :- x_cid(a65b125de4aabb).
xc_microtheory(a65b125de4aabb,x_PerceptualAgentMt).
xc_source_file(a65b125de4aabb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aabb,58).
xc_kb_names(a65b125de4aabb,[]).
xc_mapping_rows(a65b125de4aabb,[]).
x_arg1Isa(x_processDependentVariable,x_QPProcessType) :- x_cid(a65b125de4aabc).
xc_microtheory(a65b125de4aabc,x_PerceptualAgentMt).
xc_source_file(a65b125de4aabc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aabc,59).
xc_kb_names(a65b125de4aabc,[]).
xc_mapping_rows(a65b125de4aabc,[]).
x_arg2Isa(x_processDependentVariable,x_QuantityType) :- x_cid(a65b125de4aabd).
xc_microtheory(a65b125de4aabd,x_PerceptualAgentMt).
xc_source_file(a65b125de4aabd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aabd,60).
xc_kb_names(a65b125de4aabd,[]).
xc_mapping_rows(a65b125de4aabd,[]).
x_comment(x_processDependentVariable,"(processDependentVariable ?process-type ?quantity-type) associates a dependent quantity type with a process type.") :- x_cid(a65b125de4aabe).
xc_microtheory(a65b125de4aabe,x_PerceptualAgentMt).
xc_source_file(a65b125de4aabe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aabe,61).
xc_kb_names(a65b125de4aabe,[]).
xc_mapping_rows(a65b125de4aabe,[]).
x_isa(x_influenceDirection,x_TernaryPredicate) :- x_cid(a65b125de4aabf).
xc_microtheory(a65b125de4aabf,x_PerceptualAgentMt).
xc_source_file(a65b125de4aabf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aabf,63).
xc_kb_names(a65b125de4aabf,[]).
xc_mapping_rows(a65b125de4aabf,[]).
x_arity(x_influenceDirection,3) :- x_cid(a65b125de4aac0).
xc_microtheory(a65b125de4aac0,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac0,64).
xc_kb_names(a65b125de4aac0,[]).
xc_mapping_rows(a65b125de4aac0,[]).
x_arg1Isa(x_influenceDirection,x_QPProcessType) :- x_cid(a65b125de4aac1).
xc_microtheory(a65b125de4aac1,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac1,65).
xc_kb_names(a65b125de4aac1,[]).
xc_mapping_rows(a65b125de4aac1,[]).
x_arg2Isa(x_influenceDirection,x_QuantityType) :- x_cid(a65b125de4aac2).
xc_microtheory(a65b125de4aac2,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac2,66).
xc_kb_names(a65b125de4aac2,[]).
xc_mapping_rows(a65b125de4aac2,[]).
x_arg3Isa(x_influenceDirection,x_UnaryPredicate) :- x_cid(a65b125de4aac3).
xc_microtheory(a65b125de4aac3,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac3,67).
xc_kb_names(a65b125de4aac3,[]).
xc_mapping_rows(a65b125de4aac3,[]).
x_comment(x_influenceDirection,"(influenceDirection ?process-type ?quantity-type ?direction-pred) associates an influenced direction of a dependent quantity type with a process type.") :- x_cid(a65b125de4aac4).
xc_microtheory(a65b125de4aac4,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac4,68).
xc_kb_names(a65b125de4aac4,[]).
xc_mapping_rows(a65b125de4aac4,[]).
x_preconditionForMethod(x_and(x_uninferredSentence('x_ist-Information'(V1,x_explanationFailure(V2))),x_spatioTemporalCoincidence(V1,V3,V4,V5,V6,V7)),x_methodForAction(x_explainEvent(V1,V3,V2,V8),x_actionSequence(x_TheList(x_hypothesizeImmediateCause(V1,V3,V6,V7,V4,V5))))) :- x_cid(a65b125de4aac5,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125de4aac5,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac5,96).
xc_kb_names(a65b125de4aac5,["?mt","?event-type","?event","?added","?deleted","?cmd","?prior-action","?when"]).
xc_mapping_rows(a65b125de4aac5,[]).
'x_<=='(x_preferInContext(x_explainEvent(V1,V2,V3,V4),V5,V6),x_someArgumentHasPredicate(V5,x_hypothesizeImmediateCause)) :- x_cid(a65b125de4aac6,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125de4aac6,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac6,106).
xc_kb_names(a65b125de4aac6,["?mt","?event","?event-type","?when","?seq1","?seq2"]).
xc_mapping_rows(a65b125de4aac6,[]).
x_isa(x_hypothesizeImmediateCause,x_ComplexActionPredicate) :- x_cid(a65b125de4aac7).
xc_microtheory(a65b125de4aac7,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac7,109).
xc_kb_names(a65b125de4aac7,[]).
xc_mapping_rows(a65b125de4aac7,[]).
x_arity(x_hypothesizeImmediateCause,6) :- x_cid(a65b125de4aac8).
xc_microtheory(a65b125de4aac8,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac8,110).
xc_kb_names(a65b125de4aac8,[]).
xc_mapping_rows(a65b125de4aac8,[]).
x_arg1Isa(x_hypothesizeImmediateCause,x_Microtheory) :- x_cid(a65b125de4aac9).
xc_microtheory(a65b125de4aac9,x_PerceptualAgentMt).
xc_source_file(a65b125de4aac9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aac9,111).
xc_kb_names(a65b125de4aac9,[]).
xc_mapping_rows(a65b125de4aac9,[]).
x_arg2Isa(x_hypothesizeImmediateCause,x_Event) :- x_cid(a65b125de4aaca).
xc_microtheory(a65b125de4aaca,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaca,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaca,112).
xc_kb_names(a65b125de4aaca,[]).
xc_mapping_rows(a65b125de4aaca,[]).
x_arg3Isa(x_hypothesizeImmediateCause,x_PerceptualAgentCommand) :- x_cid(a65b125de4aacb).
xc_microtheory(a65b125de4aacb,x_PerceptualAgentMt).
xc_source_file(a65b125de4aacb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aacb,113).
xc_kb_names(a65b125de4aacb,[]).
xc_mapping_rows(a65b125de4aacb,[]).
x_arg4Isa(x_hypothesizeImmediateCause,x_CycLExpression) :- x_cid(a65b125de4aacc).
xc_microtheory(a65b125de4aacc,x_PerceptualAgentMt).
xc_source_file(a65b125de4aacc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aacc,114).
xc_kb_names(a65b125de4aacc,[]).
xc_mapping_rows(a65b125de4aacc,[]).
x_arg5Isa(x_hypothesizeImmediateCause,'x_Set-Mathematical') :- x_cid(a65b125de4aacd).
xc_microtheory(a65b125de4aacd,x_PerceptualAgentMt).
xc_source_file(a65b125de4aacd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aacd,115).
xc_kb_names(a65b125de4aacd,[]).
xc_mapping_rows(a65b125de4aacd,[]).
x_arg6Isa(x_hypothesizeImmediateCause,'x_Set-Mathematical') :- x_cid(a65b125de4aace).
xc_microtheory(a65b125de4aace,x_PerceptualAgentMt).
xc_source_file(a65b125de4aace,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aace,116).
xc_kb_names(a65b125de4aace,[]).
xc_mapping_rows(a65b125de4aace,[]).
x_comment(x_hypothesizeImmediateCause,"(hypothesizeImmediateCause ?mt ?event ?cmd ?prior-action ?added ?deleted) attempts to explain the cause of ?event in terms of the immediate effect of an action.") :- x_cid(a65b125de4aacf).
xc_microtheory(a65b125de4aacf,x_PerceptualAgentMt).
xc_source_file(a65b125de4aacf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aacf,117).
xc_kb_names(a65b125de4aacf,[]).
xc_mapping_rows(a65b125de4aacf,[]).
x_isa(x_hypothesizedCauseOfEvent,x_TernaryRelation) :- x_cid(a65b125de4aad0).
xc_microtheory(a65b125de4aad0,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad0,119).
xc_kb_names(a65b125de4aad0,[]).
xc_mapping_rows(a65b125de4aad0,[]).
x_arity(x_hypothesizedCauseOfEvent,3) :- x_cid(a65b125de4aad1).
xc_microtheory(a65b125de4aad1,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad1,120).
xc_kb_names(a65b125de4aad1,[]).
xc_mapping_rows(a65b125de4aad1,[]).
x_arg1Isa(x_hypothesizedCauseOfEvent,x_Event) :- x_cid(a65b125de4aad2).
xc_microtheory(a65b125de4aad2,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad2,121).
xc_kb_names(a65b125de4aad2,[]).
xc_mapping_rows(a65b125de4aad2,[]).
x_arg2Isa(x_hypothesizedCauseOfEvent,x_PerceptualAgentCommand) :- x_cid(a65b125de4aad3).
xc_microtheory(a65b125de4aad3,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad3,122).
xc_kb_names(a65b125de4aad3,[]).
xc_mapping_rows(a65b125de4aad3,[]).
x_arg3Isa(x_hypothesizedCauseOfEvent,x_CycLExpression) :- x_cid(a65b125de4aad4).
xc_microtheory(a65b125de4aad4,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad4,123).
xc_kb_names(a65b125de4aad4,[]).
xc_mapping_rows(a65b125de4aad4,[]).
x_comment("(hypothesizedCauseOfEvent ?e ?c ?exp) indicates that the event ?e is being \nhypothesized as the result of the command ?c, whose propositional content is ?exp") :- x_cid(a65b125de4aad5).
xc_microtheory(a65b125de4aad5,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad5,124).
xc_kb_names(a65b125de4aad5,[]).
xc_mapping_rows(a65b125de4aad5,[]).
x_isa('x_hypothesizedCauseOfEvent-TypeType',x_BinaryRelation) :- x_cid(a65b125de4aad6).
xc_microtheory(a65b125de4aad6,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad6,127).
xc_kb_names(a65b125de4aad6,[]).
xc_mapping_rows(a65b125de4aad6,[]).
x_arity('x_hypothesizedCauseOfEvent-TypeType',2) :- x_cid(a65b125de4aad7).
xc_microtheory(a65b125de4aad7,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad7,128).
xc_kb_names(a65b125de4aad7,[]).
xc_mapping_rows(a65b125de4aad7,[]).
x_arg1Isa('x_hypothesizedCauseOfEvent-TypeType',x_TemporalStuffType) :- x_cid(a65b125de4aad8).
xc_microtheory(a65b125de4aad8,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad8,129).
xc_kb_names(a65b125de4aad8,[]).
xc_mapping_rows(a65b125de4aad8,[]).
x_arg2Isa('x_hypothesizedCauseOfEvent-TypeType',x_ActionPredicate) :- x_cid(a65b125de4aad9).
xc_microtheory(a65b125de4aad9,x_PerceptualAgentMt).
xc_source_file(a65b125de4aad9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aad9,130).
xc_kb_names(a65b125de4aad9,[]).
xc_mapping_rows(a65b125de4aad9,[]).
x_comment("(hypothesizedCauseOfEvent-TypeType ?et ?ap) indicates that\n event types of ?et cause actions of type ?ap") :- x_cid(a65b125de4aada).
xc_microtheory(a65b125de4aada,x_PerceptualAgentMt).
xc_source_file(a65b125de4aada,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aada,131).
xc_kb_names(a65b125de4aada,[]).
xc_mapping_rows(a65b125de4aada,[]).
x_isa(x_eventDeletedProposition,x_BinaryPredicate) :- x_cid(a65b125de4aadb).
xc_microtheory(a65b125de4aadb,x_PerceptualAgentMt).
xc_source_file(a65b125de4aadb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aadb,134).
xc_kb_names(a65b125de4aadb,[]).
xc_mapping_rows(a65b125de4aadb,[]).
x_arity(x_eventDeletedProposition,2) :- x_cid(a65b125de4aadc).
xc_microtheory(a65b125de4aadc,x_PerceptualAgentMt).
xc_source_file(a65b125de4aadc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aadc,135).
xc_kb_names(a65b125de4aadc,[]).
xc_mapping_rows(a65b125de4aadc,[]).
x_arg1Isa(x_eventDeletedProposition,x_Event) :- x_cid(a65b125de4aadd).
xc_microtheory(a65b125de4aadd,x_PerceptualAgentMt).
xc_source_file(a65b125de4aadd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aadd,136).
xc_kb_names(a65b125de4aadd,[]).
xc_mapping_rows(a65b125de4aadd,[]).
x_arg2Isa(x_eventDeletedProposition,x_CycLExpression) :- x_cid(a65b125de4aade).
xc_microtheory(a65b125de4aade,x_PerceptualAgentMt).
xc_source_file(a65b125de4aade,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aade,137).
xc_kb_names(a65b125de4aade,[]).
xc_mapping_rows(a65b125de4aade,[]).
x_comment(x_eventDeletedProposition,"(eventDeletedProposition ?e ?exp) indicates that after event ?e, ?exp is no longer\n believed in this context.") :- x_cid(a65b125de4aadf).
xc_microtheory(a65b125de4aadf,x_PerceptualAgentMt).
xc_source_file(a65b125de4aadf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aadf,138).
xc_kb_names(a65b125de4aadf,[]).
xc_mapping_rows(a65b125de4aadf,[]).
x_isa(x_eventAddedProposition,x_BinaryPredicate) :- x_cid(a65b125de4aae0).
xc_microtheory(a65b125de4aae0,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae0,142).
xc_kb_names(a65b125de4aae0,[]).
xc_mapping_rows(a65b125de4aae0,[]).
x_arity(x_eventAddedProposition,2) :- x_cid(a65b125de4aae1).
xc_microtheory(a65b125de4aae1,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae1,143).
xc_kb_names(a65b125de4aae1,[]).
xc_mapping_rows(a65b125de4aae1,[]).
x_arg1Isa(x_eventAddedProposition,x_Event) :- x_cid(a65b125de4aae2).
xc_microtheory(a65b125de4aae2,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae2,144).
xc_kb_names(a65b125de4aae2,[]).
xc_mapping_rows(a65b125de4aae2,[]).
x_arg2Isa(x_eventAddedProposition,x_CycLExpression) :- x_cid(a65b125de4aae3).
xc_microtheory(a65b125de4aae3,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae3,145).
xc_kb_names(a65b125de4aae3,[]).
xc_mapping_rows(a65b125de4aae3,[]).
x_comment(x_eventAddedProposition,"(eventAddedProposition ?e ?exp) indicates that after event ?e, ?exp is newly\n believed in this context.") :- x_cid(a65b125de4aae4).
xc_microtheory(a65b125de4aae4,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae4,146).
xc_kb_names(a65b125de4aae4,[]).
xc_mapping_rows(a65b125de4aae4,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_currentDomain(V1)),x_unifies(V2,x_QualitativeModelMtFn(V1)),x_domainEntityType(V3,V4,V5),x_operatorFormulas(V6,V7)),x_methodForAction(x_hypothesizeImmediateCause(V3,V4,V8,V7,V9,V10),x_actionSequence(x_TheList(x_doAnnounce("Event ~a was probably caused by ~a",[V4,V7]),x_doRecord('x_ist-Information'(V3,x_hypothesizedCauseOfEvent(V4,V8,V7))),x_doForEach(V11,V9,x_doRecord('x_ist-Information'(V3,x_eventAddedProposition(V4,V11)))),x_doForEach(V12,V10,x_doRecord('x_ist-Information'(V3,x_eventDeletedProposition(V4,V12)))),x_doRecord('x_ist-Information'(V2,'x_hypothesizedCauseOfEvent-TypeType'(V5,V6))))))) :- x_cid(a65b125de4aae5,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12).
xc_microtheory(a65b125de4aae5,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae5,153).
xc_kb_names(a65b125de4aae5,["?domain","?lkmt","?mt","?event","?event-type","?action-pred","?action","?cmd","?added","?deleted","?addition","?deletion"]).
xc_mapping_rows(a65b125de4aae5,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 162, column 58), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de4aae5,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 162, column 58), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and(x_uninferredSentence('x_ist-Information'(V1,x_explanationFailure(V2))),x_precededByRelatedAction(V1,V3,V4,V5,V6,V7)),x_methodForAction(x_explainEvent(V1,V3,V2,V4),x_actionSequence(x_TheList(x_hypothesizeEventCause(V1,V3,V4,V5,V6,V7),x_hypothesizeEventMotivation(V1,V3,V4,V5,V6,V7))))) :- x_cid(a65b125de4aae6,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125de4aae6,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae6,180).
xc_kb_names(a65b125de4aae6,["?mt","?event-type","?event","?when","?command","?action","?action-turn"]).
xc_mapping_rows(a65b125de4aae6,[]).
x_isa(x_hypothesizeEventCause,x_ComplexActionPredicate) :- x_cid(a65b125de4aae7).
xc_microtheory(a65b125de4aae7,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae7,208).
xc_kb_names(a65b125de4aae7,[]).
xc_mapping_rows(a65b125de4aae7,[]).
x_arity(x_hypothesizeEventCause,6) :- x_cid(a65b125de4aae8).
xc_microtheory(a65b125de4aae8,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae8,209).
xc_kb_names(a65b125de4aae8,[]).
xc_mapping_rows(a65b125de4aae8,[]).
x_arg1Isa(x_hypothesizeEventCause,x_Microtheory) :- x_cid(a65b125de4aae9).
xc_microtheory(a65b125de4aae9,x_PerceptualAgentMt).
xc_source_file(a65b125de4aae9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aae9,210).
xc_kb_names(a65b125de4aae9,[]).
xc_mapping_rows(a65b125de4aae9,[]).
x_arg2Isa(x_hypothesizeEventCause,x_Event) :- x_cid(a65b125de4aaea).
xc_microtheory(a65b125de4aaea,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaea,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaea,211).
xc_kb_names(a65b125de4aaea,[]).
xc_mapping_rows(a65b125de4aaea,[]).
x_arg3Isa(x_hypothesizeEventCause,x_TemporalThing) :- x_cid(a65b125de4aaeb).
xc_microtheory(a65b125de4aaeb,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaeb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaeb,212).
xc_kb_names(a65b125de4aaeb,[]).
xc_mapping_rows(a65b125de4aaeb,[]).
x_arg4Isa(x_hypothesizeEventCause,x_PerceptualAgentCommand) :- x_cid(a65b125de4aaec).
xc_microtheory(a65b125de4aaec,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaec,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaec,213).
xc_kb_names(a65b125de4aaec,[]).
xc_mapping_rows(a65b125de4aaec,[]).
x_arg5Isa(x_hypothesizeEventCause,x_CycLExpression) :- x_cid(a65b125de4aaed).
xc_microtheory(a65b125de4aaed,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaed,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaed,214).
xc_kb_names(a65b125de4aaed,[]).
xc_mapping_rows(a65b125de4aaed,[]).
x_arg6Isa(x_hypothesizeEventCause,x_TemporalThing) :- x_cid(a65b125de4aaee).
xc_microtheory(a65b125de4aaee,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaee,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaee,215).
xc_kb_names(a65b125de4aaee,[]).
xc_mapping_rows(a65b125de4aaee,[]).
x_comment(x_hypothesizeEventCause,"(hypothesizeEventCause ?mt ?event ?when ?command ?action ?action-turn) attempts to explain the proximal or distal cause of ?event, hypothesizing either a process limit or cardinality action effect.") :- x_cid(a65b125de4aaef).
xc_microtheory(a65b125de4aaef,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaef,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaef,216).
xc_kb_names(a65b125de4aaef,[]).
xc_mapping_rows(a65b125de4aaef,[]).
x_preconditionForMethod(x_and(x_different(V1,V2),x_outsourcedOnly(x_currentDomain(V3)),x_unifies(V4,x_QualitativeModelMtFn(V3)),x_domainEntityType(V5,V6,V7),x_operatorFormulas(V8,V9)),x_methodForAction(x_hypothesizeEventCause(V5,V6,V1,V10,V9,V2),x_actionSequence(x_TheList(x_doAnnounce("Maybe event ~a is a process limit deriving from ~a in ~a",[V6,V9,V2]),x_doRecord('x_ist-Information'(V4,x_hypothesizedProcessLimitFromAction(V8,V7))),x_doAgentPlan(x_actionSequence(x_TheList(x_elaborateHypothesizedProcess(V5,V2,V1,V9,V6)))))))) :- x_cid(a65b125de4aaf0,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125de4aaf0,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf0,225).
xc_kb_names(a65b125de4aaf0,["?event-time","?action-time","?domain","?lkmt","?mt","?event","?event-type","?action-pred","?action","?command"]).
xc_mapping_rows(a65b125de4aaf0,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 235, column 80), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de4aaf0,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 235, column 80), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_and('x_ist-Information'(V1,x_isa(V2,x_CreationOrDestructionEvent)),x_operatorFormulas(V3,V4),x_evaluate(V5,x_TheClosedRetrievalSetOf(V6,x_cacheComplete(x_elementTypeCreated(V1,V2,V6)))),x_evaluate(V7,x_TheClosedRetrievalSetOf(V6,x_cacheComplete(x_elementTypeDestroyed(V1,V2,V6)))),x_evaluate(V8,x_SetOrCollectionUnion(V5,V7)),x_different(V8,x_TheSet),x_unifies(V9,x_IICaseFn(V1,V10,V11))),x_methodForAction(x_hypothesizeEventCause(V1,V2,V10,V11,V4,V10),x_actionSequence(x_TheList(x_doForEach(V12,V5,x_recordCardinalityInfluence(V1,V4,x_actionPositivelyAffectsQuantityType,V12,V9)),x_doForEach(V13,V7,x_recordCardinalityInfluence(V1,V4,x_actionNegativelyAffectsQuantityType,V13,V9)))))) :- x_cid(a65b125de4aaf1,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b125de4aaf1,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf1,246).
xc_kb_names(a65b125de4aaf1,["?mt","?event","?action-pred","?action","?element-types-created","?element-type","?element-types-consumed","?union","?casename","?when","?command","?pos-type","?neg-type"]).
xc_mapping_rows(a65b125de4aaf1,[]).
x_preconditionForMethod(x_and(x_uninferredSentence('x_ist-Information'(V1,x_isa(V2,x_CreationOrDestructionEvent))),x_localOnly('x_ist-Information'(V1,x_textMessageFor(V2,V3))),x_unifies(V4,x_IICaseFn(V1,V5,V6))),x_methodForAction(x_hypothesizeEventCause(V1,V2,V5,V6,V7,V5),x_actionSequence(x_TheList(x_doAnnounce("Maybe event message ~s is a simple announcement of ~s.",[V3,V7]))))) :- x_cid(a65b125de4aaf2,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125de4aaf2,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf2,269).
xc_kb_names(a65b125de4aaf2,["?mt","?event","?message","?casename","?when","?command","?action"]).
xc_mapping_rows(a65b125de4aaf2,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 281, column 78), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125de4aaf2,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 281, column 78), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_hypothesizeEventCause(V1,V2,V3,V4,V5,V6),x_actionSequence(x_TheList))) :- x_cid(a65b125de4aaf3,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125de4aaf3,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf3,284).
xc_kb_names(a65b125de4aaf3,["?mt","?event","?event-time","?command","?action","?action-time"]).
xc_mapping_rows(a65b125de4aaf3,[]).
'x_<=='(x_preferInContext(x_hypothesizeEventCause(V1,V2,V3,V4,V5,V6),V7,V8),x_different(V7,x_actionSequence(x_TheList))) :- x_cid(a65b125de4aaf4,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125de4aaf4,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf4,291).
xc_kb_names(a65b125de4aaf4,["?mt","?event","?event-time","?command","?action","?action-time","?seq1","?seq2"]).
xc_mapping_rows(a65b125de4aaf4,[]).
x_isa(x_elementTypeCreated,x_TernaryPredicate) :- x_cid(a65b125de4aaf5).
xc_microtheory(a65b125de4aaf5,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf5,294).
xc_kb_names(a65b125de4aaf5,[]).
xc_mapping_rows(a65b125de4aaf5,[]).
x_arity(x_elementTypeCreated,3) :- x_cid(a65b125de4aaf6).
xc_microtheory(a65b125de4aaf6,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf6,295).
xc_kb_names(a65b125de4aaf6,[]).
xc_mapping_rows(a65b125de4aaf6,[]).
x_arg1Isa(x_elementTypeCreated,x_Microtheory) :- x_cid(a65b125de4aaf7).
xc_microtheory(a65b125de4aaf7,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf7,296).
xc_kb_names(a65b125de4aaf7,[]).
xc_mapping_rows(a65b125de4aaf7,[]).
x_arg2Isa(x_elementTypeCreated,x_Event) :- x_cid(a65b125de4aaf8).
xc_microtheory(a65b125de4aaf8,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf8,297).
xc_kb_names(a65b125de4aaf8,[]).
xc_mapping_rows(a65b125de4aaf8,[]).
x_arg3Isa(x_elementTypeCreated,x_Collection) :- x_cid(a65b125de4aaf9).
xc_microtheory(a65b125de4aaf9,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaf9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaf9,298).
xc_kb_names(a65b125de4aaf9,[]).
xc_mapping_rows(a65b125de4aaf9,[]).
x_comment(x_elementTypeCreated,"(elementTypeCreated ?mt ?event ?type) binds ?type to the type of output created by ?event.") :- x_cid(a65b125de4aafa).
xc_microtheory(a65b125de4aafa,x_PerceptualAgentMt).
xc_source_file(a65b125de4aafa,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aafa,299).
xc_kb_names(a65b125de4aafa,[]).
xc_mapping_rows(a65b125de4aafa,[]).
'x_<=='(x_elementTypeCreated(V1,V2,V3),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(V1,x_isa(V2,V4)))),x_genls(V4,x_PhysicalCreationEvent),x_lookupOnly(x_numAnswers(1,'x_outputsCreated-TypeType'(V4,V3))),x_lookupOnly('x_ist-Information'(V1,x_cacheComplete(x_outputsCreated(V2,V5)))),'x_ist-Information'(V1,x_isa(V5,V3))) :- x_cid(a65b125de4aafb,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de4aafb,x_PerceptualAgentMt).
xc_source_file(a65b125de4aafb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aafb,301).
xc_kb_names(a65b125de4aafb,["?mt","?event","?obj-type","?event-type","?obj"]).
xc_mapping_rows(a65b125de4aafb,[]).
x_isa(x_elementTypeDestroyed,x_TernaryPredicate) :- x_cid(a65b125de4aafc).
xc_microtheory(a65b125de4aafc,x_PerceptualAgentMt).
xc_source_file(a65b125de4aafc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aafc,316).
xc_kb_names(a65b125de4aafc,[]).
xc_mapping_rows(a65b125de4aafc,[]).
x_arity(x_elementTypeDestroyed,3) :- x_cid(a65b125de4aafd).
xc_microtheory(a65b125de4aafd,x_PerceptualAgentMt).
xc_source_file(a65b125de4aafd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aafd,317).
xc_kb_names(a65b125de4aafd,[]).
xc_mapping_rows(a65b125de4aafd,[]).
x_arg1Isa(x_elementTypeDestroyed,x_Microtheory) :- x_cid(a65b125de4aafe).
xc_microtheory(a65b125de4aafe,x_PerceptualAgentMt).
xc_source_file(a65b125de4aafe,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aafe,318).
xc_kb_names(a65b125de4aafe,[]).
xc_mapping_rows(a65b125de4aafe,[]).
x_arg2Isa(x_elementTypeDestroyed,x_Event) :- x_cid(a65b125de4aaff).
xc_microtheory(a65b125de4aaff,x_PerceptualAgentMt).
xc_source_file(a65b125de4aaff,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4aaff,319).
xc_kb_names(a65b125de4aaff,[]).
xc_mapping_rows(a65b125de4aaff,[]).
x_arg3Isa(x_elementTypeDestroyed,x_Collection) :- x_cid(a65b125de4ab00).
xc_microtheory(a65b125de4ab00,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab00,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab00,320).
xc_kb_names(a65b125de4ab00,[]).
xc_mapping_rows(a65b125de4ab00,[]).
x_comment(x_elementTypeDestroyed,"(elementTypeDestroyed ?mt ?event ?type) binds ?type to the type of output created by ?event.") :- x_cid(a65b125de4ab01).
xc_microtheory(a65b125de4ab01,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab01,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab01,321).
xc_kb_names(a65b125de4ab01,[]).
xc_mapping_rows(a65b125de4ab01,[]).
'x_<=='(x_elementTypeDestroyed(V1,V2,V3),x_nonTransitiveInference(x_lookupOnly('x_ist-Information'(V1,x_isa(V2,V4)))),x_genls(V4,x_PhysicalDestructionEvent),x_lookupOnly(x_cacheComplete('x_inputsDestroyed-TypeType'(V4,V3))),x_lookupOnly('x_ist-Information'(V1,x_cacheComplete(x_inputsDestroyed(V2,V5)))),'x_ist-Information'(V1,x_isa(V5,V3))) :- x_cid(a65b125de4ab02,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de4ab02,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab02,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab02,323).
xc_kb_names(a65b125de4ab02,["?mt","?event","?obj-type","?event-type","?obj"]).
xc_mapping_rows(a65b125de4ab02,[]).
x_isa(x_elaborateHypothesizedProcess,x_ComplexActionPredicate) :- x_cid(a65b125de4ab03).
xc_microtheory(a65b125de4ab03,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab03,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab03,351).
xc_kb_names(a65b125de4ab03,[]).
xc_mapping_rows(a65b125de4ab03,[]).
x_arity(x_elaborateHypothesizedProcess,5) :- x_cid(a65b125de4ab04).
xc_microtheory(a65b125de4ab04,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab04,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab04,352).
xc_kb_names(a65b125de4ab04,[]).
xc_mapping_rows(a65b125de4ab04,[]).
x_arg1Isa(x_elaborateHypothesizedProcess,x_Microtheory) :- x_cid(a65b125de4ab05).
xc_microtheory(a65b125de4ab05,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab05,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab05,353).
xc_kb_names(a65b125de4ab05,[]).
xc_mapping_rows(a65b125de4ab05,[]).
x_arg2Isa(x_elaborateHypothesizedProcess,x_TemporalThing) :- x_cid(a65b125de4ab06).
xc_microtheory(a65b125de4ab06,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab06,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab06,354).
xc_kb_names(a65b125de4ab06,[]).
xc_mapping_rows(a65b125de4ab06,[]).
x_arg3Isa(x_elaborateHypothesizedProcess,x_TemporalThing) :- x_cid(a65b125de4ab07).
xc_microtheory(a65b125de4ab07,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab07,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab07,355).
xc_kb_names(a65b125de4ab07,[]).
xc_mapping_rows(a65b125de4ab07,[]).
x_arg4Isa(x_elaborateHypothesizedProcess,x_CycLExpression) :- x_cid(a65b125de4ab08).
xc_microtheory(a65b125de4ab08,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab08,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab08,356).
xc_kb_names(a65b125de4ab08,[]).
xc_mapping_rows(a65b125de4ab08,[]).
x_arg5Isa(x_elaborateHypothesizedProcess,x_Event) :- x_cid(a65b125de4ab09).
xc_microtheory(a65b125de4ab09,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab09,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab09,357).
xc_kb_names(a65b125de4ab09,[]).
xc_mapping_rows(a65b125de4ab09,[]).
x_comment(x_elaborateHypothesizedProcess,"(elaborateHypothesizedProcess ?mt ?action-time ?event-time ?action ?event) attempts to identify the relevant quantities, influences, and eventual effects involved in the hypothesized process.") :- x_cid(a65b125de4ab0a).
xc_microtheory(a65b125de4ab0a,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab0a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab0a,358).
xc_kb_names(a65b125de4ab0a,[]).
xc_mapping_rows(a65b125de4ab0a,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_elaborateHypothesizedProcess(V1,V2,V3,V4,V5),x_actionSequence(x_TheList))) :- x_cid(a65b125de4ab0b,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de4ab0b,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab0b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab0b,361).
xc_kb_names(a65b125de4ab0b,["?mt","?action-time","?event-time","?action","?event"]).
xc_mapping_rows(a65b125de4ab0b,[]).
'x_<=='(x_preferInContext(x_elaborateHypothesizedProcess(V1,V2,V3,V4,V5),V6,V7),x_different(V6,x_actionSequence(x_TheList))) :- x_cid(a65b125de4ab0c,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125de4ab0c,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab0c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab0c,368).
xc_kb_names(a65b125de4ab0c,["?mt","?action-time","?event-time","?action","?event","?seq1","?seq2"]).
xc_mapping_rows(a65b125de4ab0c,[]).
x_preconditionForMethod(x_and(x_formulaArgument(V1,1,V2),x_operatorFormulas(V3,V1),x_numAnswers(1,x_variablizedStatement(V3,V4)),x_anticipatedEffects(V5,V1,V4,V6),x_evaluate(V7,x_TheClosedRetrievalSetOf(V8,x_and('x_ist-Information'(V5,x_quantityMentions(V9,V2)),x_bookendingDiscontinuities(V5,V9,V10,V11,V12),x_unifies(V8,t(V9,V12))))),x_unifies(x_TheSet(t(V13,V14)),V7),x_unifies(t(V15,V2),V13),x_outsourcedOnly(x_currentDomain(V16)),x_unifies(V17,x_QualitativeModelMtFn(V16))),x_methodForAction(x_elaborateHypothesizedProcess(V5,V10,V11,V1,V18),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V17,x_processDependentVariable(x_ActionProcessTypeFn(V3),V15))),x_doRecord('x_ist-Information'(V17,x_influenceDirection(x_ActionProcessTypeFn(V3),V15,V14))))))) :- x_cid(a65b125de4ab0d,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13,V14,V15,V16,V17,V18).
xc_microtheory(a65b125de4ab0d,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab0d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab0d,378).
xc_kb_names(a65b125de4ab0d,["?action","?doer","?action-pred","?action-template","?mt","?effects","?pairs","?pair","?quant","?action-time","?event-time","?dir","?quantity","?direction","?qtype","?domain","?lkmt","?event"]).
xc_mapping_rows(a65b125de4ab0d,[]).
x_isa(x_anticipatedEffects,x_QuaternaryPredicate) :- x_cid(a65b125de4ab0e).
xc_microtheory(a65b125de4ab0e,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab0e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab0e,415).
xc_kb_names(a65b125de4ab0e,[]).
xc_mapping_rows(a65b125de4ab0e,[]).
x_arity(x_anticipatedEffects,4) :- x_cid(a65b125de4ab0f).
xc_microtheory(a65b125de4ab0f,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab0f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab0f,416).
xc_kb_names(a65b125de4ab0f,[]).
xc_mapping_rows(a65b125de4ab0f,[]).
x_arg1Isa(x_anticipatedEffects,x_Microtheory) :- x_cid(a65b125de4ab10).
xc_microtheory(a65b125de4ab10,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab10,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab10,417).
xc_kb_names(a65b125de4ab10,[]).
xc_mapping_rows(a65b125de4ab10,[]).
x_arg2Isa(x_anticipatedEffects,x_CycLExpression) :- x_cid(a65b125de4ab11).
xc_microtheory(a65b125de4ab11,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab11,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab11,418).
xc_kb_names(a65b125de4ab11,[]).
xc_mapping_rows(a65b125de4ab11,[]).
x_arg3Isa(x_anticipatedEffects,x_CycLExpression) :- x_cid(a65b125de4ab12).
xc_microtheory(a65b125de4ab12,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab12,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab12,419).
xc_kb_names(a65b125de4ab12,[]).
xc_mapping_rows(a65b125de4ab12,[]).
x_arg3Isa(x_anticipatedEffects,'x_Set-Mathematical') :- x_cid(a65b125de4ab13).
xc_microtheory(a65b125de4ab13,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab13,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab13,420).
xc_kb_names(a65b125de4ab13,[]).
xc_mapping_rows(a65b125de4ab13,[]).
x_comment(x_anticipatedEffects,"(anticipatedEffects ?mt ?action ?action-template ?proposition-set) reifies a set of instantiated propositional effects of ?action.") :- x_cid(a65b125de4ab14).
xc_microtheory(a65b125de4ab14,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab14,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab14,421).
xc_kb_names(a65b125de4ab14,[]).
xc_mapping_rows(a65b125de4ab14,[]).
'x_<=='(x_anticipatedEffects(V1,V2,V3,V4),'x_eventualEffectOfAction-Props'(V3,V5),x_instantiationOf('x_eventualEffectOfAction-Props'(V2,V6),'x_eventualEffectOfAction-Props'(V3,V5),'x_eventualEffectOfAction-Props'(V2,V7)),x_conjunctSet(V7,V8),x_evaluate(V4,x_TheClosedRetrievalSetOf(V9,x_and(x_lookupOnly(x_elementOf(V10,V8)),x_negationQuery(V10,V9),'x_ist-Information'(V1,V9))))) :- x_cid(a65b125de4ab15,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b125de4ab15,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab15,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab15,423).
xc_kb_names(a65b125de4ab15,["?mt","?action","?action-template","?effects-set","?effect-template","?props","?inst-props","?conj-set","?effect","?conj"]).
xc_mapping_rows(a65b125de4ab15,[]).
'x_<=='(x_anticipatedEffects(V1,V2,V3,x_TheSet),x_uninferredSentence('x_eventualEffectOfAction-Props'(V3,V4))) :- x_cid(a65b125de4ab16,V1,V2,V3,V4).
xc_microtheory(a65b125de4ab16,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab16,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab16,441).
xc_kb_names(a65b125de4ab16,["?mt","?action","?action-template","?effect-template"]).
xc_mapping_rows(a65b125de4ab16,[]).
x_isa(x_negationQuery,x_BinaryPredicate) :- x_cid(a65b125de4ab17).
xc_microtheory(a65b125de4ab17,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab17,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab17,446).
xc_kb_names(a65b125de4ab17,[]).
xc_mapping_rows(a65b125de4ab17,[]).
x_comment(x_negationQuery,"(negationQuery ?stmt ?query) converts (not <qry>) into (uninferredSentence <qry>)") :- x_cid(a65b125de4ab18).
xc_microtheory(a65b125de4ab18,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab18,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab18,447).
xc_kb_names(a65b125de4ab18,[]).
xc_mapping_rows(a65b125de4ab18,[]).
'x_<=='(x_negationQuery(V1,V1),x_operatorFormulas(V2,V1),x_different(V2,x_not)) :- x_cid(a65b125de4ab19,V1,V2).
xc_microtheory(a65b125de4ab19,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab19,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab19,449).
xc_kb_names(a65b125de4ab19,["?stmt","?pred"]).
xc_mapping_rows(a65b125de4ab19,[]).
'x_<=='(x_negationQuery(x_not(V1),x_uninferredSentence(V1))) :- x_cid(a65b125de4ab1a,V1).
xc_microtheory(a65b125de4ab1a,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab1a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab1a,453).
xc_kb_names(a65b125de4ab1a,["?qry"]).
xc_mapping_rows(a65b125de4ab1a,[]).
x_isa(x_hypothesizeEventMotivation,x_ComplexActionPredicate) :- x_cid(a65b125de4ab1b).
xc_microtheory(a65b125de4ab1b,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab1b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab1b,458).
xc_kb_names(a65b125de4ab1b,[]).
xc_mapping_rows(a65b125de4ab1b,[]).
x_arity(x_hypothesizeEventMotivation,6) :- x_cid(a65b125de4ab1c).
xc_microtheory(a65b125de4ab1c,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab1c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab1c,459).
xc_kb_names(a65b125de4ab1c,[]).
xc_mapping_rows(a65b125de4ab1c,[]).
x_arg1Isa(x_hypothesizeEventMotivation,x_Microtheory) :- x_cid(a65b125de4ab1d).
xc_microtheory(a65b125de4ab1d,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab1d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab1d,460).
xc_kb_names(a65b125de4ab1d,[]).
xc_mapping_rows(a65b125de4ab1d,[]).
x_arg2Isa(x_hypothesizeEventMotivation,x_Event) :- x_cid(a65b125de4ab1e).
xc_microtheory(a65b125de4ab1e,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab1e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab1e,461).
xc_kb_names(a65b125de4ab1e,[]).
xc_mapping_rows(a65b125de4ab1e,[]).
x_arg3Isa(x_hypothesizeEventMotivation,x_TemporalThing) :- x_cid(a65b125de4ab1f).
xc_microtheory(a65b125de4ab1f,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab1f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab1f,462).
xc_kb_names(a65b125de4ab1f,[]).
xc_mapping_rows(a65b125de4ab1f,[]).
x_arg4Isa(x_hypothesizeEventMotivation,x_PerceptualAgentCommand) :- x_cid(a65b125de4ab20).
xc_microtheory(a65b125de4ab20,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab20,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab20,463).
xc_kb_names(a65b125de4ab20,[]).
xc_mapping_rows(a65b125de4ab20,[]).
x_arg5Isa(x_hypothesizeEventMotivation,x_CycLExpression) :- x_cid(a65b125de4ab21).
xc_microtheory(a65b125de4ab21,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab21,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab21,464).
xc_kb_names(a65b125de4ab21,[]).
xc_mapping_rows(a65b125de4ab21,[]).
x_arg6Isa(x_hypothesizeEventMotivation,x_TemporalThing) :- x_cid(a65b125de4ab22).
xc_microtheory(a65b125de4ab22,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab22,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab22,465).
xc_kb_names(a65b125de4ab22,[]).
xc_mapping_rows(a65b125de4ab22,[]).
x_comment(x_hypothesizeEventMotivation,"(hypothesizeEventMotivation ?mt ?event ?when ?command ?action ?action-turn) attempts to explain why an event was a good thing by understanding how it serves the player's goals.") :- x_cid(a65b125de4ab23).
xc_microtheory(a65b125de4ab23,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab23,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab23,466).
xc_kb_names(a65b125de4ab23,[]).
xc_mapping_rows(a65b125de4ab23,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_hypothesizeEventMotivation(V1,V2,V3,V4,V5,V6),x_actionSequence(x_TheList))) :- x_cid(a65b125de4ab24,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125de4ab24,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab24,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab24,469).
xc_kb_names(a65b125de4ab24,["?mt","?event","?event-time","?command","?action","?action-time"]).
xc_mapping_rows(a65b125de4ab24,[]).
'x_<=='(x_preferInContext(x_hypothesizeEventMotivation(V1,V2,V3,V4,V5,V6),V7,V8),x_different(V7,x_actionSequence(x_TheList))) :- x_cid(a65b125de4ab25,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125de4ab25,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab25,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab25,476).
xc_kb_names(a65b125de4ab25,["?mt","?event","?event-time","?command","?action","?action-time","?seq1","?seq2"]).
xc_mapping_rows(a65b125de4ab25,[]).
x_preconditionForMethod(x_and(x_currentActivityMode(x_LearnByDemonstration),'x_ist-Information'(V1,x_isa(V2,x_PhysicalCreationEvent)),x_elementTypeCreated(V1,V2,V3),x_outsourcedOnly(x_currentDomain(V4)),x_unifies(V5,x_LearnedKnowledgeMtFn(V4))),x_methodForAction(x_hypothesizeEventMotivation(V5,V2,V6,V7,V8,V9),x_actionSequence(x_TheList(x_postAffordanceLearningGoal(V5,V3))))) :- x_cid(a65b125de4ab26,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125de4ab26,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab26,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab26,481).
xc_kb_names(a65b125de4ab26,["?mt","?event","?entity-type","?domain","?lkmt","?event-time","?command","?action","?action-time"]).
xc_mapping_rows(a65b125de4ab26,[]).
x_isa(x_spatioTemporalCoincidence,x_Predicate) :- x_cid(a65b125de4ab27).
xc_microtheory(a65b125de4ab27,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab27,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab27,501).
xc_kb_names(a65b125de4ab27,[]).
xc_mapping_rows(a65b125de4ab27,[]).
x_arity(x_spatioTemporalCoincidence,6) :- x_cid(a65b125de4ab28).
xc_microtheory(a65b125de4ab28,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab28,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab28,502).
xc_kb_names(a65b125de4ab28,[]).
xc_mapping_rows(a65b125de4ab28,[]).
x_comment(x_spatioTemporalCoincidence,"(spatioTemporalCoincidence ?mt ?event ?added ?deleted ?cmd ?prior-action)") :- x_cid(a65b125de4ab29).
xc_microtheory(a65b125de4ab29,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab29,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab29,503).
xc_kb_names(a65b125de4ab29,[]).
xc_mapping_rows(a65b125de4ab29,[]).
'x_<=='(x_spatioTemporalCoincidence(V1,V2,V3,V4,V5,V6),x_lookupOnly(x_localOnly(x_numAnswers(1,'x_ist-Information'(V1,x_eventOccursAt(V2,V7))))),x_currentAddList(V8),x_evaluate(V3,x_TheClosedRetrievalSetOf(V9,x_and(x_lookupOnly(x_elementOf(V9,V8)),x_formulaArgument(V9,V10,V7)))),x_currentDeleteList(V11),x_evaluate(V4,x_TheClosedRetrievalSetOf(V9,x_and(x_lookupOnly(x_elementOf(V9,V11)),x_formulaArgument(V9,V10,V7)))),x_priorCommand(V1,V2,V5),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_infoTransferred(V5,V6))))),x_actionRelevantToLocation(V1,V6,V7)) :- x_cid(a65b125de4ab2a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125de4ab2a,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab2a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab2a,507).
xc_kb_names(a65b125de4ab2a,["?mt","?event","?added","?deleted","?cmd","?prior-action","?location","?all-added-props","?stmt","?n","?all-deleted-props"]).
xc_mapping_rows(a65b125de4ab2a,[]).
x_isa(x_actionRelevantToLocation,x_TernaryPredicate) :- x_cid(a65b125de4ab2b).
xc_microtheory(a65b125de4ab2b,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab2b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab2b,532).
xc_kb_names(a65b125de4ab2b,[]).
xc_mapping_rows(a65b125de4ab2b,[]).
x_arity(x_actionRelevantToLocation,3) :- x_cid(a65b125de4ab2c).
xc_microtheory(a65b125de4ab2c,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab2c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab2c,533).
xc_kb_names(a65b125de4ab2c,[]).
xc_mapping_rows(a65b125de4ab2c,[]).
x_arg1Isa(x_actionRelevantToLocation,x_Microtheory) :- x_cid(a65b125de4ab2d).
xc_microtheory(a65b125de4ab2d,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab2d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab2d,534).
xc_kb_names(a65b125de4ab2d,[]).
xc_mapping_rows(a65b125de4ab2d,[]).
x_arg2Isa(x_actionRelevantToLocation,x_CycLExpression) :- x_cid(a65b125de4ab2e).
xc_microtheory(a65b125de4ab2e,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab2e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab2e,535).
xc_kb_names(a65b125de4ab2e,[]).
xc_mapping_rows(a65b125de4ab2e,[]).
x_arg3Isa(x_actionRelevantToLocation,x_CycLTerm) :- x_cid(a65b125de4ab2f).
xc_microtheory(a65b125de4ab2f,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab2f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab2f,536).
xc_kb_names(a65b125de4ab2f,[]).
xc_mapping_rows(a65b125de4ab2f,[]).
x_comment(x_actionRelevantToLocation,"(actionRelevantToLocation MT ACTION-EXPR LOCATION) means location is either an argument of the non-Davidsonian ACTION-EXPR, or is the is the location of one of the arguments.") :- x_cid(a65b125de4ab30).
xc_microtheory(a65b125de4ab30,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab30,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab30,537).
xc_kb_names(a65b125de4ab30,[]).
xc_mapping_rows(a65b125de4ab30,[]).
'x_<=='(x_actionRelevantToLocation(V1,V2,V3),x_formulaArgument(V2,V4,V3)) :- x_cid(a65b125de4ab31,V1,V2,V3,V4).
xc_microtheory(a65b125de4ab31,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab31,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab31,539).
xc_kb_names(a65b125de4ab31,["?mt","?action","?location","?n"]).
xc_mapping_rows(a65b125de4ab31,[]).
'x_<=='(x_actionRelevantToLocation(V1,V2,V3),x_formulaArgument(V2,1,V4),x_numAnswers(1,'x_ist-Information'(V1,x_objectFoundInLocation(V4,V3)))) :- x_cid(a65b125de4ab32,V1,V2,V3,V4).
xc_microtheory(a65b125de4ab32,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab32,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab32,542).
xc_kb_names(a65b125de4ab32,["?mt","?action","?location","?agent"]).
xc_mapping_rows(a65b125de4ab32,[]).
x_isa(x_precededByRelatedAction,x_Predicate) :- x_cid(a65b125de4ab33).
xc_microtheory(a65b125de4ab33,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab33,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab33,555).
xc_kb_names(a65b125de4ab33,[]).
xc_mapping_rows(a65b125de4ab33,[]).
x_arity(x_precededByRelatedAction,6) :- x_cid(a65b125de4ab34).
xc_microtheory(a65b125de4ab34,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab34,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab34,556).
xc_kb_names(a65b125de4ab34,[]).
xc_mapping_rows(a65b125de4ab34,[]).
x_arg1Isa(x_precededByRelatedAction,x_Microtheory) :- x_cid(a65b125de4ab35).
xc_microtheory(a65b125de4ab35,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab35,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab35,557).
xc_kb_names(a65b125de4ab35,[]).
xc_mapping_rows(a65b125de4ab35,[]).
x_arg2Isa(x_precededByRelatedAction,x_Event) :- x_cid(a65b125de4ab36).
xc_microtheory(a65b125de4ab36,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab36,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab36,558).
xc_kb_names(a65b125de4ab36,[]).
xc_mapping_rows(a65b125de4ab36,[]).
x_arg3Isa(x_precededByRelatedAction,x_TemporalThing) :- x_cid(a65b125de4ab37).
xc_microtheory(a65b125de4ab37,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab37,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab37,559).
xc_kb_names(a65b125de4ab37,[]).
xc_mapping_rows(a65b125de4ab37,[]).
x_arg4Isa(x_precededByRelatedAction,x_PerceptualAgentCommand) :- x_cid(a65b125de4ab38).
xc_microtheory(a65b125de4ab38,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab38,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab38,560).
xc_kb_names(a65b125de4ab38,[]).
xc_mapping_rows(a65b125de4ab38,[]).
x_arg5Isa(x_precededByRelatedAction,x_CycLExpression) :- x_cid(a65b125de4ab39).
xc_microtheory(a65b125de4ab39,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab39,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab39,561).
xc_kb_names(a65b125de4ab39,[]).
xc_mapping_rows(a65b125de4ab39,[]).
x_arg6Isa(x_precededByRelatedAction,x_TemporalThing) :- x_cid(a65b125de4ab3a).
xc_microtheory(a65b125de4ab3a,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab3a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab3a,562).
xc_kb_names(a65b125de4ab3a,[]).
xc_mapping_rows(a65b125de4ab3a,[]).
x_comment(x_precededByRelatedAction,"(precededByRelatedAction ?mt ?event ?event-time ?command ?action ?action-time)") :- x_cid(a65b125de4ab3b).
xc_microtheory(a65b125de4ab3b,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab3b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab3b,563).
xc_kb_names(a65b125de4ab3b,[]).
xc_mapping_rows(a65b125de4ab3b,[]).
'x_<=='(x_precededByRelatedAction(V1,V2,V3,V4,V5,V6),x_eventArguments(V1,V2,V7),x_priorCommand(V1,V2,V8),x_precededByRelatedCommand(V1,V3,V7,V8,V4,V5),x_lookupOnly(x_localOnly(x_numAnswers(1,'x_ist-Information'(V1,x_dateOfEvent(V4,V6)))))) :- x_cid(a65b125de4ab3c,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125de4ab3c,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab3c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab3c,565).
xc_kb_names(a65b125de4ab3c,["?mt","?event","?event-turn","?command","?action","?action-turn","?arguments","?cmd"]).
xc_mapping_rows(a65b125de4ab3c,[]).
x_isa(x_eventArguments,x_TernaryPredicate) :- x_cid(a65b125de4ab3d).
xc_microtheory(a65b125de4ab3d,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab3d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab3d,575).
xc_kb_names(a65b125de4ab3d,[]).
xc_mapping_rows(a65b125de4ab3d,[]).
x_arity(x_eventArguments,3) :- x_cid(a65b125de4ab3e).
xc_microtheory(a65b125de4ab3e,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab3e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab3e,576).
xc_kb_names(a65b125de4ab3e,[]).
xc_mapping_rows(a65b125de4ab3e,[]).
x_arg1Isa(x_eventArguments,x_Microtheory) :- x_cid(a65b125de4ab3f).
xc_microtheory(a65b125de4ab3f,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab3f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab3f,577).
xc_kb_names(a65b125de4ab3f,[]).
xc_mapping_rows(a65b125de4ab3f,[]).
x_arg2Isa(x_eventArguments,x_PerceptualAgentEvent) :- x_cid(a65b125de4ab40).
xc_microtheory(a65b125de4ab40,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab40,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab40,578).
xc_kb_names(a65b125de4ab40,[]).
xc_mapping_rows(a65b125de4ab40,[]).
x_arg3Isa(x_eventArguments,'x_Set-Mathematical') :- x_cid(a65b125de4ab41).
xc_microtheory(a65b125de4ab41,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab41,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab41,579).
xc_kb_names(a65b125de4ab41,[]).
xc_mapping_rows(a65b125de4ab41,[]).
x_comment(x_eventArguments,"(eventArguments ?mt ?event ?arguments) collects the values of the role-relations of ?events.") :- x_cid(a65b125de4ab42).
xc_microtheory(a65b125de4ab42,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab42,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab42,580).
xc_kb_names(a65b125de4ab42,[]).
xc_mapping_rows(a65b125de4ab42,[]).
'x_<=='(x_eventArguments(V1,V2,V3),x_not(x_matches(x_CommandFn(V1,V4),V2)),x_evaluate(V3,x_TheClosedRetrievalSetOf(V5,x_hasRoleRelationBinding(V1,V2,V5,V6)))) :- x_cid(a65b125de4ab43,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125de4ab43,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab43,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab43,582).
xc_kb_names(a65b125de4ab43,["?mt","?event","?arguments","?num","?thing","?role"]).
xc_mapping_rows(a65b125de4ab43,[]).
x_isa(x_precededByRelatedCommand,x_Predicate) :- x_cid(a65b125de4ab44).
xc_microtheory(a65b125de4ab44,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab44,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab44,588).
xc_kb_names(a65b125de4ab44,[]).
xc_mapping_rows(a65b125de4ab44,[]).
x_arity(x_precededByRelatedCommand,6) :- x_cid(a65b125de4ab45).
xc_microtheory(a65b125de4ab45,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab45,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab45,589).
xc_kb_names(a65b125de4ab45,[]).
xc_mapping_rows(a65b125de4ab45,[]).
x_arg1Isa(x_precededByRelatedCommand,x_Microtheory) :- x_cid(a65b125de4ab46).
xc_microtheory(a65b125de4ab46,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab46,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab46,590).
xc_kb_names(a65b125de4ab46,[]).
xc_mapping_rows(a65b125de4ab46,[]).
x_arg2Isa(x_precededByRelatedCommand,x_TemporalThing) :- x_cid(a65b125de4ab47).
xc_microtheory(a65b125de4ab47,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab47,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab47,591).
xc_kb_names(a65b125de4ab47,[]).
xc_mapping_rows(a65b125de4ab47,[]).
x_arg3Isa(x_precededByRelatedCommand,'x_Set-Mathematical') :- x_cid(a65b125de4ab48).
xc_microtheory(a65b125de4ab48,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab48,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab48,592).
xc_kb_names(a65b125de4ab48,[]).
xc_mapping_rows(a65b125de4ab48,[]).
x_arg4Isa(x_precededByRelatedCommand,x_PerceptualAgentCommand) :- x_cid(a65b125de4ab49).
xc_microtheory(a65b125de4ab49,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab49,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab49,593).
xc_kb_names(a65b125de4ab49,[]).
xc_mapping_rows(a65b125de4ab49,[]).
x_arg5Isa(x_precededByRelatedCommand,x_PerceptualAgentCommand) :- x_cid(a65b125de4ab4a).
xc_microtheory(a65b125de4ab4a,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab4a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab4a,594).
xc_kb_names(a65b125de4ab4a,[]).
xc_mapping_rows(a65b125de4ab4a,[]).
x_arg6Isa(x_precededByRelatedCommand,x_CycLExpression) :- x_cid(a65b125de4ab4b).
xc_microtheory(a65b125de4ab4b,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab4b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab4b,595).
xc_kb_names(a65b125de4ab4b,[]).
xc_mapping_rows(a65b125de4ab4b,[]).
x_comment(x_precededByRelatedCommand,"(precededByRelatedCommand ?mt ?event-turn ?arguments ?later-cmd ?earlier-cmd ?action) binds ?earlier-cmd and ?action to the most recent command starting at ?later-cmd whose ?action mentions at least one of the arguments.") :- x_cid(a65b125de4ab4c).
xc_microtheory(a65b125de4ab4c,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab4c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab4c,596).
xc_kb_names(a65b125de4ab4c,[]).
xc_mapping_rows(a65b125de4ab4c,[]).
'x_<=='(x_precededByRelatedCommand(V1,V2,V3,V4,V4,V5),x_numAnswers(1,x_relatedCommand(V1,V2,V4,V3,V5))) :- x_cid(a65b125de4ab4d,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de4ab4d,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab4d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab4d,599).
xc_kb_names(a65b125de4ab4d,["?mt","?event-turn","?arguments","?command","?action"]).
xc_mapping_rows(a65b125de4ab4d,[]).
'x_<=='(x_precededByRelatedCommand(V1,V2,V3,V4,V5,V6),x_uninferredSentence(x_relatedCommand(V1,V2,V4,V3,V6)),x_numAnswers(1,x_priorCommand(V1,V4,V7)),x_precededByRelatedCommand(V1,V2,V3,V7,V5,V6)) :- x_cid(a65b125de4ab4e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125de4ab4e,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab4e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab4e,603).
xc_kb_names(a65b125de4ab4e,["?mt","?event-turn","?arguments","?later-cmd","?earlier-cmd","?action","?command"]).
xc_mapping_rows(a65b125de4ab4e,[]).
x_isa(x_priorCommand,x_TernaryPredicate) :- x_cid(a65b125de4ab4f).
xc_microtheory(a65b125de4ab4f,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab4f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab4f,609).
xc_kb_names(a65b125de4ab4f,[]).
xc_mapping_rows(a65b125de4ab4f,[]).
x_arity(x_priorCommand,3) :- x_cid(a65b125de4ab50).
xc_microtheory(a65b125de4ab50,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab50,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab50,610).
xc_kb_names(a65b125de4ab50,[]).
xc_mapping_rows(a65b125de4ab50,[]).
x_arg1Isa(x_priorCommand,x_Microtheory) :- x_cid(a65b125de4ab51).
xc_microtheory(a65b125de4ab51,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab51,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab51,611).
xc_kb_names(a65b125de4ab51,[]).
xc_mapping_rows(a65b125de4ab51,[]).
x_arg2Isa(x_priorCommand,x_PerceptualAgentCommand) :- x_cid(a65b125de4ab52).
xc_microtheory(a65b125de4ab52,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab52,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab52,612).
xc_kb_names(a65b125de4ab52,[]).
xc_mapping_rows(a65b125de4ab52,[]).
x_arg3Isa(x_priorCommand,x_PerceptualAgentCommand) :- x_cid(a65b125de4ab53).
xc_microtheory(a65b125de4ab53,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab53,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab53,613).
xc_kb_names(a65b125de4ab53,[]).
xc_mapping_rows(a65b125de4ab53,[]).
x_comment(x_priorCommand,"(priorCommand ?mt ?later ?earlier) binds ?earlier to the most recent command before ?later.") :- x_cid(a65b125de4ab54).
xc_microtheory(a65b125de4ab54,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab54,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab54,614).
xc_kb_names(a65b125de4ab54,[]).
xc_mapping_rows(a65b125de4ab54,[]).
'x_<=='(x_priorCommand(V1,V2,V3),x_numAnswers(1,x_localOnly('x_ist-Information'(V1,x_followsInProgression(V2,x_CommandFn(V1,V4),V1)))),x_unifies(V3,x_CommandFn(V1,V4))) :- x_cid(a65b125de4ab55,V1,V2,V3,V4).
xc_microtheory(a65b125de4ab55,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab55,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab55,616).
xc_kb_names(a65b125de4ab55,["?mt","?later","?prior-command","?num"]).
xc_mapping_rows(a65b125de4ab55,[]).
'x_<=='(x_priorCommand(V1,V2,V3),x_numAnswers(1,x_localOnly('x_ist-Information'(V1,x_followsInProgression(V2,V4,V1)))),x_not(x_matches(x_CommandFn(V1,V5),V4)),x_numAnswers(1,x_priorCommand(V1,V4,V3))) :- x_cid(a65b125de4ab56,V1,V2,V3,V4,V5).
xc_microtheory(a65b125de4ab56,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab56,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab56,623).
xc_kb_names(a65b125de4ab56,["?mt","?later","?prior-command","?prior","?num"]).
xc_mapping_rows(a65b125de4ab56,[]).
x_isa(x_relatedCommand,x_QuintaryPredicate) :- x_cid(a65b125de4ab57).
xc_microtheory(a65b125de4ab57,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab57,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab57,631).
xc_kb_names(a65b125de4ab57,[]).
xc_mapping_rows(a65b125de4ab57,[]).
x_arity(x_relatedCommand,5) :- x_cid(a65b125de4ab58).
xc_microtheory(a65b125de4ab58,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab58,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab58,632).
xc_kb_names(a65b125de4ab58,[]).
xc_mapping_rows(a65b125de4ab58,[]).
x_arg1Isa(x_relatedCommand,x_Microtheory) :- x_cid(a65b125de4ab59).
xc_microtheory(a65b125de4ab59,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab59,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab59,633).
xc_kb_names(a65b125de4ab59,[]).
xc_mapping_rows(a65b125de4ab59,[]).
x_arg2Isa(x_relatedCommand,x_TemporalThing) :- x_cid(a65b125de4ab5a).
xc_microtheory(a65b125de4ab5a,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab5a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab5a,634).
xc_kb_names(a65b125de4ab5a,[]).
xc_mapping_rows(a65b125de4ab5a,[]).
x_arg3Isa(x_relatedCommand,x_PerceptualAgentCommand) :- x_cid(a65b125de4ab5b).
xc_microtheory(a65b125de4ab5b,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab5b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab5b,635).
xc_kb_names(a65b125de4ab5b,[]).
xc_mapping_rows(a65b125de4ab5b,[]).
x_arg4Isa(x_relatedCommand,'x_Set-Mathematical') :- x_cid(a65b125de4ab5c).
xc_microtheory(a65b125de4ab5c,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab5c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab5c,636).
xc_kb_names(a65b125de4ab5c,[]).
xc_mapping_rows(a65b125de4ab5c,[]).
x_arg5Isa(x_relatedCommand,'x_CycLSentence-Assertible') :- x_cid(a65b125de4ab5d).
xc_microtheory(a65b125de4ab5d,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab5d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab5d,637).
xc_kb_names(a65b125de4ab5d,[]).
xc_mapping_rows(a65b125de4ab5d,[]).
x_comment(x_relatedCommand,"(relatedCommand ?mt ?event-turn ?cmd ?arguments ?action) succeeds if given a command ?cmd, the corresponding ?action that is the infoTransferred mentions at least one of the ?arguments.") :- x_cid(a65b125de4ab5e).
xc_microtheory(a65b125de4ab5e,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab5e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab5e,638).
xc_kb_names(a65b125de4ab5e,[]).
xc_mapping_rows(a65b125de4ab5e,[]).
'x_<=='(x_relatedCommand(V1,V2,V3,V4,V5),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(V3,V2))))),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_infoTransferred(V3,V5))))),x_lookupOnly(x_elementOf(V6,V4)),x_containsPattern(V6,V5),x_operatorFormulas(V7,V5)) :- x_cid(a65b125de4ab5f,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125de4ab5f,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab5f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab5f,643).
xc_kb_names(a65b125de4ab5f,["?mt","?event-turn","?cmd","?arguments","?action","?thing","?action-pred"]).
xc_mapping_rows(a65b125de4ab5f,[]).
'x_<=='(x_relatedCommand(V1,V2,V3,V4,V5),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_dateOfEvent(V3,V6))))),x_different(V6,V2),x_numAnswers(1,x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_infoTransferred(V3,V5))))),x_operatorFormulas(V7,V5),x_lookupOnly(x_durativeAction(V7,V8)),x_formulaArgument(V5,V8,V9),x_lookupOnly(x_elementOf(V9,V4))) :- x_cid(a65b125de4ab60,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125de4ab60,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab60,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab60,660).
xc_kb_names(a65b125de4ab60,["?mt","?event-turn","?cmd","?arguments","?action","?command-turn","?action-pred","?argnum","?thing"]).
xc_mapping_rows(a65b125de4ab60,[]).
x_isa(x_hypothesizedProcess,x_BinaryRelation) :- x_cid(a65b125de4ab61).
xc_microtheory(a65b125de4ab61,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab61,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab61,682).
xc_kb_names(a65b125de4ab61,[]).
xc_mapping_rows(a65b125de4ab61,[]).
x_isa(x_eventInfluencesGoal,x_BinaryPredicate) :- x_cid(a65b125de4ab62).
xc_microtheory(a65b125de4ab62,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab62,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab62,683).
xc_kb_names(a65b125de4ab62,[]).
xc_mapping_rows(a65b125de4ab62,[]).
x_isa(x_enablesOrInitiates,x_BinaryPredicate) :- x_cid(a65b125de4ab63).
xc_microtheory(a65b125de4ab63,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab63,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab63,684).
xc_kb_names(a65b125de4ab63,[]).
xc_mapping_rows(a65b125de4ab63,[]).
x_isa(x_proximalCause,x_BinaryPredicate) :- x_cid(a65b125de4ab64).
xc_microtheory(a65b125de4ab64,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab64,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab64,685).
xc_kb_names(a65b125de4ab64,[]).
xc_mapping_rows(a65b125de4ab64,[]).
x_isa(x_distalCause,x_BinaryPredicate) :- x_cid(a65b125de4ab65).
xc_microtheory(a65b125de4ab65,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab65,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab65,686).
xc_kb_names(a65b125de4ab65,[]).
xc_mapping_rows(a65b125de4ab65,[]).
x_isa(x_rangeLimit,x_BinaryPredicate) :- x_cid(a65b125de4ab66).
xc_microtheory(a65b125de4ab66,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab66,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab66,688).
xc_kb_names(a65b125de4ab66,[]).
xc_mapping_rows(a65b125de4ab66,[]).
x_arity(x_rangeLimit,2) :- x_cid(a65b125de4ab67).
xc_microtheory(a65b125de4ab67,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab67,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab67,689).
xc_kb_names(a65b125de4ab67,[]).
xc_mapping_rows(a65b125de4ab67,[]).
x_arg1Isa(x_rangeLimit,x_Collection) :- x_cid(a65b125de4ab68).
xc_microtheory(a65b125de4ab68,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab68,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab68,690).
xc_kb_names(a65b125de4ab68,[]).
xc_mapping_rows(a65b125de4ab68,[]).
x_arg2Isa(x_rangeLimit,x_Integer) :- x_cid(a65b125de4ab69).
xc_microtheory(a65b125de4ab69,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab69,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab69,691).
xc_kb_names(a65b125de4ab69,[]).
xc_mapping_rows(a65b125de4ab69,[]).
x_comment(x_rangeLimit,"(rangeLimit ?agent ?integer-dist) was intended to be the parameter that would limit how far to send settlers.") :- x_cid(a65b125de4ab6a).
xc_microtheory(a65b125de4ab6a,x_PerceptualAgentMt).
xc_source_file(a65b125de4ab6a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/explain-event.krf').
xc_source_line(a65b125de4ab6a,692).
xc_kb_names(a65b125de4ab6a,[]).
xc_mapping_rows(a65b125de4ab6a,[]).
kb_cache_footer(footer{count:197,digest:'6cef2554c93d32f4fbc246eaf625c39de9fa8bf8387623693ae10e7d29573ff2',headerDigest:'0cd9cb62d83c6bdc79d5286575d66a03f3a30782ef1309c671f0c99ab5f8c89f'}).
