:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:7,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:51,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:c65483d611220331619a1e2f26ef50268c537a813fb97bedaeb70b19c5075568,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-blocks-world.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1736,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-blocks-world.krf',sourceHash:d96ab36db4cf1d3ce69b997b340d336f626d287e0d1cb2f32288e54693bc3984,warnings:[]}).
x_genlMt(x_CompanionsMt,x_BlocksWorldMt) :- x_cid(a65b1262320c4b).
xc_microtheory(a65b1262320c4b,x_BlocksWorldMt).
xc_source_file(a65b1262320c4b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-blocks-world.krf').
xc_source_line(a65b1262320c4b,2).
xc_kb_names(a65b1262320c4b,[]).
xc_mapping_rows(a65b1262320c4b,[]).
x_isa(x_solveBlocksWorldProblem,x_ComplexActionPredicate) :- x_cid(a65b1262320c4c).
xc_microtheory(a65b1262320c4c,x_BlocksWorldMt).
xc_source_file(a65b1262320c4c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-blocks-world.krf').
xc_source_line(a65b1262320c4c,9).
xc_kb_names(a65b1262320c4c,[]).
xc_mapping_rows(a65b1262320c4c,[]).
x_arity(x_solveBlocksWorldProblem,1) :- x_cid(a65b1262320c4d).
xc_microtheory(a65b1262320c4d,x_BlocksWorldMt).
xc_source_file(a65b1262320c4d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-blocks-world.krf').
xc_source_line(a65b1262320c4d,10).
xc_kb_names(a65b1262320c4d,[]).
xc_mapping_rows(a65b1262320c4d,[]).
x_preconditionForMethod(x_and(x_sessionContext(V1),x_evaluate(V2,x_TheClosedRetrievalSetOf(V3,x_and(x_lookupOnly(x_localOnly('x_ist-Information'(V4,x_goal(V5)))),x_unifies(V3,x_goal(V5)))))),x_methodForAction(x_solveBlocksWorldProblem(V4),x_actionSequence(x_TheList(x_doRecordPlans(V1,'x_ist-Information'(V4,V6),x_achieveGoals(V2),1),x_doAgentPlan(x_announcePlan(V1,V4)))))) :- x_cid(a65b1262320c4e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1262320c4e,x_BlocksWorldMt).
xc_source_file(a65b1262320c4e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-blocks-world.krf').
xc_source_line(a65b1262320c4e,12).
xc_kb_names(a65b1262320c4e,["?session-context","?goals","?goal","?scenario-mt","?stmt","?fact"]).
xc_mapping_rows(a65b1262320c4e,[]).
x_isa(x_announcePlan,x_ComplexActionPredicate) :- x_cid(a65b1262320c4f).
xc_microtheory(a65b1262320c4f,x_BlocksWorldMt).
xc_source_file(a65b1262320c4f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-blocks-world.krf').
xc_source_line(a65b1262320c4f,31).
xc_kb_names(a65b1262320c4f,[]).
xc_mapping_rows(a65b1262320c4f,[]).
x_arity(x_announcePlan,2) :- x_cid(a65b1262320c50).
xc_microtheory(a65b1262320c50,x_BlocksWorldMt).
xc_source_file(a65b1262320c50,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-blocks-world.krf').
xc_source_line(a65b1262320c50,32).
xc_kb_names(a65b1262320c50,[]).
xc_mapping_rows(a65b1262320c50,[]).
x_preconditionForMethod(x_and(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_planForTask(x_achieveGoals(V2),V3)))),x_evaluate(V4,x_MakeFormulaFn(x_and,x_TheClosedRetrievalSetOf(V5,x_and(x_elementOf(V6,V2),x_formulaArgument(V6,1,V5)))))),x_methodForAction(x_announcePlan(V1,V7),x_actionSequence(x_TheList(x_doAnnounce("Goals(~s): ~s",[V7,V4]),x_doAnnounce("Plan(~s): ~s",[V7,V3]))))) :- x_cid(a65b1262320c51,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1262320c51,x_BlocksWorldMt).
xc_source_file(a65b1262320c51,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-blocks-world.krf').
xc_source_line(a65b1262320c51,34).
xc_kb_names(a65b1262320c51,["?session-context","?goals","?plan","?goal-formula","?conj","?goal","?scenario-mt"]).
xc_mapping_rows(a65b1262320c51,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 48, column 37), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."),note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 49, column 36), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1262320c51,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 48, column 37), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.","doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 49, column 36), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:7,digest:c65483d611220331619a1e2f26ef50268c537a813fb97bedaeb70b19c5075568,headerDigest:'1119a88da52489323e9fbcd4045ad0f05f523346edc98e10813b68cff68dfbd0'}).
