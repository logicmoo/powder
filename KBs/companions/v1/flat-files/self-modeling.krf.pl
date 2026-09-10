:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:46,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:245,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:bb78bd5877191365f02fa006ee73ef22d24ff4d2030336188d2d32e4d46bc606,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:9708,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf',sourceHash:af59e0a3e8b1ad4842daaf56acaccd62c4b2b696b59360af689ceae481dbb979,warnings:[]}).
x_isa(x_setupSessionCase,x_ComplexActionPredicate) :- x_cid(a65b125e415049).
xc_microtheory(a65b125e415049,x_CompanionsMt).
xc_source_file(a65b125e415049,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415049,23).
xc_kb_names(a65b125e415049,[]).
xc_mapping_rows(a65b125e415049,[]).
x_arity(x_setupSessionCase,1) :- x_cid(a65b125e41504a).
xc_microtheory(a65b125e41504a,x_CompanionsMt).
xc_source_file(a65b125e41504a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41504a,24).
xc_kb_names(a65b125e41504a,[]).
xc_mapping_rows(a65b125e41504a,[]).
x_arg1Isa(x_setupSessionCase,x_CycLTerm) :- x_cid(a65b125e41504b).
xc_microtheory(a65b125e41504b,x_CompanionsMt).
xc_source_file(a65b125e41504b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41504b,25).
xc_kb_names(a65b125e41504b,[]).
xc_mapping_rows(a65b125e41504b,[]).
x_comment(x_setupSessionCase,"(setupSessionCase ?session-id) reifies the session context and does initial bookkeeping.") :- x_cid(a65b125e41504c).
xc_microtheory(a65b125e41504c,x_CompanionsMt).
xc_source_file(a65b125e41504c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41504c,26).
xc_kb_names(a65b125e41504c,[]).
xc_mapping_rows(a65b125e41504c,[]).
x_preconditionForMethod(x_and(x_currentTime(V1),x_currentDate(V2),x_sessionContext(V3),x_unifies(x_ContextFn(V4),V3),x_unifies(V5,x_MetadataContextFn(V4)),x_currentDomain(V6),x_currentUser(V7),x_userModelMtName(V7,V8),x_unifies(V9,x_CaseLibraryFn(x_CompanionsSessions))),x_methodForAction(x_setupSessionCase(V4),x_actionSequence(x_TheList(x_recordSelfHealth(V5,x_StartFn(V3)),x_ensureUserModelExists(V7),x_connectSequentialSessions(V3),x_doRecordMembers(x_TheSet('x_ist-Information'(V3,x_sessionDate(V2)),'x_ist-Information'(V3,x_sessionTime(V1)),'x_ist-Information'(V3,x_sessionUser(V4,V7)),'x_ist-Information'(V3,x_sessionDomain(V4,V6)),'x_ist-Information'(x_BaseKB,x_caseLibraryContains(V9,V3)))))))) :- x_cid(a65b125e41504d,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e41504d,x_CompanionsMt).
xc_source_file(a65b125e41504d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41504d,28).
xc_kb_names(a65b125e41504d,["?time","?date","?context","?session-id","?metadata-context","?domain","?user","?user-mt","?session-lib"]).
xc_mapping_rows(a65b125e41504d,[]).
x_isa(x_sessionPostMortem,x_ComplexActionPredicate) :- x_cid(a65b125e41504e).
xc_microtheory(a65b125e41504e,x_CompanionsMt).
xc_source_file(a65b125e41504e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41504e,60).
xc_kb_names(a65b125e41504e,[]).
xc_mapping_rows(a65b125e41504e,[]).
x_arity(x_sessionPostMortem,1) :- x_cid(a65b125e41504f).
xc_microtheory(a65b125e41504f,x_CompanionsMt).
xc_source_file(a65b125e41504f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41504f,61).
xc_kb_names(a65b125e41504f,[]).
xc_mapping_rows(a65b125e41504f,[]).
x_arg1Isa(x_sessionPostMortem,x_Microtheory) :- x_cid(a65b125e415050).
xc_microtheory(a65b125e415050,x_CompanionsMt).
xc_source_file(a65b125e415050,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415050,62).
xc_kb_names(a65b125e415050,[]).
xc_mapping_rows(a65b125e415050,[]).
x_comment(x_sessionPostMortem,"(sessionPostMortem ?session-context) summarizes the session and sets new learning goals.") :- x_cid(a65b125e415051).
xc_microtheory(a65b125e415051,x_CompanionsMt).
xc_source_file(a65b125e415051,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415051,63).
xc_kb_names(a65b125e415051,[]).
xc_mapping_rows(a65b125e415051,[]).
x_preconditionForMethod(x_and(x_lookupOnly('x_ist-Information'(V1,x_sessionTime(V2))),x_lookupOnly('x_ist-Information'(V1,x_sessionDate(V3))),x_currentTime(V4),x_currentDate(V5),'x_intervalDuration-Minutes'(V3,V2,V5,V4,V6),x_unifies(x_ContextFn(V7),V1),x_unifies(V8,x_MetadataContextFn(V7))),x_methodForAction(x_sessionPostMortem(V1),x_actionSequence(x_TheList(x_doAnnounce("session duration = ~a",[V6]),x_doRecord('x_ist-Information'(V1,x_sessionDuration(V6))),x_recordSelfHealth(V8,x_EndFn(V1)))))) :- x_cid(a65b125e415052,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e415052,x_CompanionsMt).
xc_source_file(a65b125e415052,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415052,67).
xc_kb_names(a65b125e415052,["?session-context","?start-time","?start-date","?end-time","?end-date","?duration","?session-id","?metadata-context"]).
xc_mapping_rows(a65b125e415052,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 81, column 45), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e415052,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 81, column 45), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_isa(x_ensureUserModelExists,x_ComplexActionPredicate) :- x_cid(a65b125e415053).
xc_microtheory(a65b125e415053,x_CompanionsMt).
xc_source_file(a65b125e415053,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415053,91).
xc_kb_names(a65b125e415053,[]).
xc_mapping_rows(a65b125e415053,[]).
x_arity(x_ensureUserModelExists,1) :- x_cid(a65b125e415054).
xc_microtheory(a65b125e415054,x_CompanionsMt).
xc_source_file(a65b125e415054,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415054,92).
xc_kb_names(a65b125e415054,[]).
xc_mapping_rows(a65b125e415054,[]).
x_arg1Isa(x_ensureUserModelExists,x_HumanCyclist) :- x_cid(a65b125e415055).
xc_microtheory(a65b125e415055,x_CompanionsMt).
xc_source_file(a65b125e415055,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415055,93).
xc_kb_names(a65b125e415055,[]).
xc_mapping_rows(a65b125e415055,[]).
x_comment(x_ensureUserModelExists,"(ensureUserModelExists ?HumanCyclist) creates a microtheory to hold the user model for ?HumanCyclist if necessary.") :- x_cid(a65b125e415056).
xc_microtheory(a65b125e415056,x_CompanionsMt).
xc_source_file(a65b125e415056,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415056,94).
xc_kb_names(a65b125e415056,[]).
xc_mapping_rows(a65b125e415056,[]).
x_preconditionForMethod(x_and(x_userModelMtName(V1,V2),x_genlMt(V2,x_UserModelMt)),x_methodForAction(x_ensureUserModelExists(V1),x_actionSequence(x_TheList))) :- x_cid(a65b125e415057,V1,V2).
xc_microtheory(a65b125e415057,x_CompanionsMt).
xc_source_file(a65b125e415057,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415057,96).
xc_kb_names(a65b125e415057,["?user","?mt"]).
xc_mapping_rows(a65b125e415057,[]).
x_preconditionForMethod(x_and(x_userModelMtName(V1,V2),x_uninferredSentence(x_genlMt(V2,x_UserModelMt))),x_methodForAction(x_ensureUserModelExists(V1),x_actionSequence(x_TheList(x_doRecordMembers(x_TheSet('x_ist-Information'(x_CyclistsMt,x_isa(V1,x_HumanCyclist)),'x_ist-Information'(x_BaseKB,x_isa(V2,x_Microtheory)),'x_ist-Information'(x_BaseKB,x_isa(V2,x_Individual)),'x_ist-Information'(x_BaseKB,x_genlMt(V2,x_UserModelMt)),'x_ist-Information'(x_BaseKB,x_modelMtOfUser(V2,V1)),'x_ist-Information'(V2,x_learnedModelTopic(V2,V1)))))))) :- x_cid(a65b125e415058,V1,V2).
xc_microtheory(a65b125e415058,x_CompanionsMt).
xc_source_file(a65b125e415058,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415058,107).
xc_kb_names(a65b125e415058,["?user","?mt"]).
xc_mapping_rows(a65b125e415058,[]).
'x_<=='(x_userModelMtName(V1,V2),x_groundExpression(V1),x_unifies(V2,x_UserModelMtFn(V1))) :- x_cid(a65b125e415059,V1,V2).
xc_microtheory(a65b125e415059,x_CompanionsMt).
xc_source_file(a65b125e415059,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415059,125).
xc_kb_names(a65b125e415059,["?user","?user-mt"]).
xc_mapping_rows(a65b125e415059,[]).
x_isa(x_latestSession,x_UnaryPredicate) :- x_cid(a65b125e41505a).
xc_microtheory(a65b125e41505a,x_CompanionsMt).
xc_source_file(a65b125e41505a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41505a,131).
xc_kb_names(a65b125e41505a,[]).
xc_mapping_rows(a65b125e41505a,[]).
x_arity(x_latestSession,1) :- x_cid(a65b125e41505b).
xc_microtheory(a65b125e41505b,x_CompanionsMt).
xc_source_file(a65b125e41505b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41505b,132).
xc_kb_names(a65b125e41505b,[]).
xc_mapping_rows(a65b125e41505b,[]).
x_arg1Isa(x_latestSession,x_Microtheory) :- x_cid(a65b125e41505c).
xc_microtheory(a65b125e41505c,x_CompanionsMt).
xc_source_file(a65b125e41505c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41505c,133).
xc_kb_names(a65b125e41505c,[]).
xc_mapping_rows(a65b125e41505c,[]).
x_comment(x_latestSession,"(latestSession ?session-context) reifies the most recent session context in SelfModelMt") :- x_cid(a65b125e41505d).
xc_microtheory(a65b125e41505d,x_CompanionsMt).
xc_source_file(a65b125e41505d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41505d,134).
xc_kb_names(a65b125e41505d,[]).
xc_mapping_rows(a65b125e41505d,[]).
x_isa(x_nextSession,x_BinaryPredicate) :- x_cid(a65b125e41505e).
xc_microtheory(a65b125e41505e,x_CompanionsMt).
xc_source_file(a65b125e41505e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41505e,136).
xc_kb_names(a65b125e41505e,[]).
xc_mapping_rows(a65b125e41505e,[]).
x_arity(x_nextSession,2) :- x_cid(a65b125e41505f).
xc_microtheory(a65b125e41505f,x_CompanionsMt).
xc_source_file(a65b125e41505f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41505f,137).
xc_kb_names(a65b125e41505f,[]).
xc_mapping_rows(a65b125e41505f,[]).
x_arg1Isa(x_nextSession,x_Microtheory) :- x_cid(a65b125e415060).
xc_microtheory(a65b125e415060,x_CompanionsMt).
xc_source_file(a65b125e415060,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415060,138).
xc_kb_names(a65b125e415060,[]).
xc_mapping_rows(a65b125e415060,[]).
x_arg2Isa(x_nextSession,x_Microtheory) :- x_cid(a65b125e415061).
xc_microtheory(a65b125e415061,x_CompanionsMt).
xc_source_file(a65b125e415061,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415061,139).
xc_kb_names(a65b125e415061,[]).
xc_mapping_rows(a65b125e415061,[]).
x_comment(x_nextSession,"(nextSession ?earlier-session ?later-session) reifies the sequence of sessions.") :- x_cid(a65b125e415062).
xc_microtheory(a65b125e415062,x_CompanionsMt).
xc_source_file(a65b125e415062,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415062,140).
xc_kb_names(a65b125e415062,[]).
xc_mapping_rows(a65b125e415062,[]).
x_isa(x_connectSequentialSessions,x_ComplexActionPredicate) :- x_cid(a65b125e415063).
xc_microtheory(a65b125e415063,x_CompanionsMt).
xc_source_file(a65b125e415063,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415063,142).
xc_kb_names(a65b125e415063,[]).
xc_mapping_rows(a65b125e415063,[]).
x_arity(x_connectSequentialSessions,1) :- x_cid(a65b125e415064).
xc_microtheory(a65b125e415064,x_CompanionsMt).
xc_source_file(a65b125e415064,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415064,143).
xc_kb_names(a65b125e415064,[]).
xc_mapping_rows(a65b125e415064,[]).
x_arg1Isa(x_connectSequentialSessions,x_Microtheory) :- x_cid(a65b125e415065).
xc_microtheory(a65b125e415065,x_CompanionsMt).
xc_source_file(a65b125e415065,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415065,144).
xc_kb_names(a65b125e415065,[]).
xc_mapping_rows(a65b125e415065,[]).
x_comment(x_connectSequentialSessions,"(connectSequentialSessions ?session-context) records a (nextSession ?previous ?next) statement in the self model context.") :- x_cid(a65b125e415066).
xc_microtheory(a65b125e415066,x_CompanionsMt).
xc_source_file(a65b125e415066,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415066,145).
xc_kb_names(a65b125e415066,[]).
xc_mapping_rows(a65b125e415066,[]).
x_preconditionForMethod(x_kbOnly(x_uninferredSentence('x_ist-Information'(x_SelfModelMt,x_latestSession(V1)))),x_methodForAction(x_connectSequentialSessions(V2),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(x_SelfModelMt,x_latestSession(V2))))))) :- x_cid(a65b125e415067,V1,V2).
xc_microtheory(a65b125e415067,x_CompanionsMt).
xc_source_file(a65b125e415067,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415067,147).
xc_kb_names(a65b125e415067,["?prior-session","?context"]).
xc_mapping_rows(a65b125e415067,[]).
x_preconditionForMethod(x_kbOnly('x_ist-Information'(x_SelfModelMt,x_latestSession(V1))),x_methodForAction(x_connectSequentialSessions(V2),x_actionSequence(x_TheList(x_doForget('x_ist-Information'(x_SelfModelMt,x_latestSession(V1))),x_doRecord('x_ist-Information'(x_SelfModelMt,x_latestSession(V2))),x_doRecord('x_ist-Information'(x_SelfModelMt,x_nextSession(V1,V2))))))) :- x_cid(a65b125e415068,V1,V2).
xc_microtheory(a65b125e415068,x_CompanionsMt).
xc_source_file(a65b125e415068,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415068,160).
xc_kb_names(a65b125e415068,["?prior-session","?context"]).
xc_mapping_rows(a65b125e415068,[]).
x_isa(x_recordSelfHealth,x_ComplexActionPredicate) :- x_cid(a65b125e415069).
xc_microtheory(a65b125e415069,x_CompanionsMt).
xc_source_file(a65b125e415069,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415069,180).
xc_kb_names(a65b125e415069,[]).
xc_mapping_rows(a65b125e415069,[]).
x_arity(x_recordSelfHealth,2) :- x_cid(a65b125e41506a).
xc_microtheory(a65b125e41506a,x_CompanionsMt).
xc_source_file(a65b125e41506a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41506a,181).
xc_kb_names(a65b125e41506a,[]).
xc_mapping_rows(a65b125e41506a,[]).
x_arg1Isa(x_recordSelfHealth,x_Microtheory) :- x_cid(a65b125e41506b).
xc_microtheory(a65b125e41506b,x_CompanionsMt).
xc_source_file(a65b125e41506b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41506b,182).
xc_kb_names(a65b125e41506b,[]).
xc_mapping_rows(a65b125e41506b,[]).
x_arg2Isa(x_recordSelfHealth,x_TimePoint) :- x_cid(a65b125e41506c).
xc_microtheory(a65b125e41506c,x_CompanionsMt).
xc_source_file(a65b125e41506c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41506c,183).
xc_kb_names(a65b125e41506c,[]).
xc_mapping_rows(a65b125e41506c,[]).
x_preconditionForMethod(x_currentAgents(V1),x_methodForAction(x_recordSelfHealth(V2,V3),x_actionSequence(x_TheList(x_doForEach(V4,V1,x_recordAgentHealth(V2,V4,V3)))))) :- x_cid(a65b125e41506d,V1,V2,V3,V4).
xc_microtheory(a65b125e41506d,x_CompanionsMt).
xc_source_file(a65b125e41506d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41506d,185).
xc_kb_names(a65b125e41506d,["?agents","?context","?when","?agent"]).
xc_mapping_rows(a65b125e41506d,[]).
x_isa(x_recordAgentHealth,x_ComplexActionPredicate) :- x_cid(a65b125e41506e).
xc_microtheory(a65b125e41506e,x_CompanionsMt).
xc_source_file(a65b125e41506e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41506e,193).
xc_kb_names(a65b125e41506e,[]).
xc_mapping_rows(a65b125e41506e,[]).
x_arity(x_recordAgentHealth,3) :- x_cid(a65b125e41506f).
xc_microtheory(a65b125e41506f,x_CompanionsMt).
xc_source_file(a65b125e41506f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e41506f,194).
xc_kb_names(a65b125e41506f,[]).
xc_mapping_rows(a65b125e41506f,[]).
x_arg1Isa(x_recordAgentHealth,x_Microtheory) :- x_cid(a65b125e415070).
xc_microtheory(a65b125e415070,x_CompanionsMt).
xc_source_file(a65b125e415070,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415070,195).
xc_kb_names(a65b125e415070,[]).
xc_mapping_rows(a65b125e415070,[]).
x_arg2Isa(x_recordAgentHealth,x_CompanionsAgent) :- x_cid(a65b125e415071).
xc_microtheory(a65b125e415071,x_CompanionsMt).
xc_source_file(a65b125e415071,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415071,196).
xc_kb_names(a65b125e415071,[]).
xc_mapping_rows(a65b125e415071,[]).
x_arg3Isa(x_recordAgentHealth,x_TimePoint) :- x_cid(a65b125e415072).
xc_microtheory(a65b125e415072,x_CompanionsMt).
xc_source_file(a65b125e415072,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415072,197).
xc_kb_names(a65b125e415072,[]).
xc_mapping_rows(a65b125e415072,[]).
x_comment(x_recordAgentHealth,"(recordAgentHealth ?context ?agent ?when) records stats about heap usage, uptime, etc. at time ?when, where ?when may profitably be (StartFn <session-context>) or (EndFn <session-context>) or the current-time.") :- x_cid(a65b125e415073).
xc_microtheory(a65b125e415073,x_CompanionsMt).
xc_source_file(a65b125e415073,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415073,198).
xc_kb_names(a65b125e415073,[]).
xc_mapping_rows(a65b125e415073,[]).
x_preconditionForMethod(x_and(x_currentHeapSpace(V1,V2,V3),x_numTMSNodes(V1,V4,V5),x_numSMEs(V1,V6),x_agentUptime(V1,V7),x_agentState(V1,V8,V9)),x_methodForAction(x_recordAgentHealth(V10,V1,V11),x_actionSequence(x_TheList(x_doAnnounce("~&Reifying health of ~a in context ~a",[V1,V10]),x_doRecord('x_ist-Information'(V10,x_holdsIn(V11,x_currentHeapSpace(V1,V2,V3)))),x_doRecord('x_ist-Information'(V10,x_holdsIn(V11,x_numTMSNodes(V1,V4,V5)))),x_doRecord('x_ist-Information'(V10,x_holdsIn(V11,x_numSMEs(V1,V6)))),x_doRecord('x_ist-Information'(V10,x_holdsIn(V11,x_agentUptime(V1,V7)))),x_doRecord('x_ist-Information'(V10,x_holdsIn(V11,x_agentState(V1,V8,V9)))))))) :- x_cid(a65b125e415074,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125e415074,x_CompanionsMt).
xc_source_file(a65b125e415074,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415074,200).
xc_kb_names(a65b125e415074,["?agent","?used","?avail","?nodes","?clauses","?num-smes","?uptime","?state","?how-long","?context","?when"]).
xc_mapping_rows(a65b125e415074,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 210, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e415074,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 210, column 61), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_recordAgentHealth(V1,V2,V3),x_actionSequence(x_TheList))) :- x_cid(a65b125e415075,V1,V2,V3).
xc_microtheory(a65b125e415075,x_CompanionsMt).
xc_source_file(a65b125e415075,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415075,234).
xc_kb_names(a65b125e415075,["?context","?agent","?when"]).
xc_mapping_rows(a65b125e415075,[]).
'x_<=='(x_preferInContext(x_recordAgentHealth(V1,V2,V3),V4,V5),x_different(V4,x_actionSequence(x_TheList))) :- x_cid(a65b125e415076,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e415076,x_CompanionsMt).
xc_source_file(a65b125e415076,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/self-modeling.krf').
xc_source_line(a65b125e415076,241).
xc_kb_names(a65b125e415076,["?context","?agent","?when","?seq1","?seq2"]).
xc_mapping_rows(a65b125e415076,[]).
kb_cache_footer(footer{count:46,digest:bb78bd5877191365f02fa006ee73ef22d24ff4d2030336188d2d32e4d46bc606,headerDigest:'266486597bc6d930e2ea3937009fdf47a6af87fc4f13979249b570da8abcd8ec'}).
