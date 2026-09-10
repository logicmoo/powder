:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:54,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:162,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'41711bbb38ed868007d86a82b271b33d653c9657afe07457c30b81e6aac4d0cf',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:5419,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf',sourceHash:'75c88a5fe9c85a09b86935a09ca34f3e63b0ce7533417fa316d01464e807a74d',warnings:[]}).
x_genlMt(x_CompanionsMt,x_BFSMt) :- x_cid(a65b132d148567).
xc_microtheory(a65b132d148567,x_BFSMt).
xc_source_file(a65b132d148567,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148567,2).
xc_kb_names(a65b132d148567,[]).
xc_mapping_rows(a65b132d148567,[]).
x_isa(x_searchBFS,x_Predicate) :- x_cid(a65b132d148568).
xc_microtheory(a65b132d148568,x_BFSMt).
xc_source_file(a65b132d148568,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148568,4).
xc_kb_names(a65b132d148568,[]).
xc_mapping_rows(a65b132d148568,[]).
x_arity(x_searchBFS,5) :- x_cid(a65b132d148569).
xc_microtheory(a65b132d148569,x_BFSMt).
xc_source_file(a65b132d148569,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148569,5).
xc_kb_names(a65b132d148569,[]).
xc_mapping_rows(a65b132d148569,[]).
x_arg1Isa(x_searchBFS,x_SearchState) :- x_cid(a65b132d14856a).
xc_microtheory(a65b132d14856a,x_BFSMt).
xc_source_file(a65b132d14856a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14856a,6).
xc_kb_names(a65b132d14856a,[]).
xc_mapping_rows(a65b132d14856a,[]).
x_arg2Isa(x_searchBFS,x_ScalarInterval) :- x_cid(a65b132d14856b).
xc_microtheory(a65b132d14856b,x_BFSMt).
xc_source_file(a65b132d14856b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14856b,7).
xc_kb_names(a65b132d14856b,[]).
xc_mapping_rows(a65b132d14856b,[]).
x_arg3Isa(x_searchBFS,x_List) :- x_cid(a65b132d14856c).
xc_microtheory(a65b132d14856c,x_BFSMt).
xc_source_file(a65b132d14856c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14856c,8).
xc_kb_names(a65b132d14856c,[]).
xc_mapping_rows(a65b132d14856c,[]).
x_arg4Isa(x_searchBFS,x_ScalarInterval) :- x_cid(a65b132d14856d).
xc_microtheory(a65b132d14856d,x_BFSMt).
xc_source_file(a65b132d14856d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14856d,9).
xc_kb_names(a65b132d14856d,[]).
xc_mapping_rows(a65b132d14856d,[]).
x_arg5Isa(x_searchBFS,x_List) :- x_cid(a65b132d14856e).
xc_microtheory(a65b132d14856e,x_BFSMt).
xc_source_file(a65b132d14856e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14856e,10).
xc_kb_names(a65b132d14856e,[]).
xc_mapping_rows(a65b132d14856e,[]).
x_comment(x_searchBFS,"(searchBFS ?node ?cost ?path ?solution-cost ?solution-path) searches best-first for the least-cost path to a solution.") :- x_cid(a65b132d14856f).
xc_microtheory(a65b132d14856f,x_BFSMt).
xc_source_file(a65b132d14856f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14856f,11).
xc_kb_names(a65b132d14856f,[]).
xc_mapping_rows(a65b132d14856f,[]).
x_defSuggestion(x_TerminateSearch,x_searchBFS(V1,V2,V3,V4,V5),':cost-function',0,':test',x_goalState(V1),':subgoals',t(x_unifies(t(V5,V4),t(V3,V2)))) :- x_cid(a65b132d148570,V1,V2,V3,V4,V5).
xc_microtheory(a65b132d148570,x_BFSMt).
xc_source_file(a65b132d148570,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148570,13).
xc_kb_names(a65b132d148570,["?node","?cost","?path","?solution-cost","?solution-path"]).
xc_mapping_rows(a65b132d148570,[]).
x_defSuggestion(x_ExpandNode,x_searchBFS(V1,V2,V3,V4,V5),':cost-function',1,':test',x_uninferredSentence(x_goalState(V1)),':subgoals',t(x_solveOne(x_childBindings(V1,V2,V3,V6,V7,V8),x_searchBFS(V6,V7,V8,V4,V5)))) :- x_cid(a65b132d148571,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b132d148571,x_BFSMt).
xc_source_file(a65b132d148571,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148571,19).
xc_kb_names(a65b132d148571,["?node","?cost","?path","?solution-cost","?solution-path","?child","?child-cost","?child-path"]).
xc_mapping_rows(a65b132d148571,[]).
'x_<=='(x_childBindings(V1,V2,V3,V4,V5,V6),x_edgeCost(V1,V4,V7),x_evaluate(V5,x_PlusFn(V2,V7)),x_evaluate(V6,x_JoinListsFn(V3,x_TheList(V4)))) :- x_cid(a65b132d148572,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b132d148572,x_BFSMt).
xc_source_file(a65b132d148572,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148572,28).
xc_kb_names(a65b132d148572,["?node","?cost","?path","?child","?child-cost","?child-path","?edge-cost"]).
xc_mapping_rows(a65b132d148572,[]).
x_isa(x_edgeCost,x_TernaryPredicate) :- x_cid(a65b132d148573).
xc_microtheory(a65b132d148573,x_BFSMt).
xc_source_file(a65b132d148573,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148573,36).
xc_kb_names(a65b132d148573,[]).
xc_mapping_rows(a65b132d148573,[]).
x_arity(x_edgeCost,3) :- x_cid(a65b132d148574).
xc_microtheory(a65b132d148574,x_BFSMt).
xc_source_file(a65b132d148574,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148574,37).
xc_kb_names(a65b132d148574,[]).
xc_mapping_rows(a65b132d148574,[]).
x_arg1Isa(x_edgeCost,x_CycLTerm) :- x_cid(a65b132d148575).
xc_microtheory(a65b132d148575,x_BFSMt).
xc_source_file(a65b132d148575,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148575,38).
xc_kb_names(a65b132d148575,[]).
xc_mapping_rows(a65b132d148575,[]).
x_arg2Isa(x_edgeCost,x_CycLTerm) :- x_cid(a65b132d148576).
xc_microtheory(a65b132d148576,x_BFSMt).
xc_source_file(a65b132d148576,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148576,39).
xc_kb_names(a65b132d148576,[]).
xc_mapping_rows(a65b132d148576,[]).
x_arg3Isa(x_edgeCost,x_Integer) :- x_cid(a65b132d148577).
xc_microtheory(a65b132d148577,x_BFSMt).
xc_source_file(a65b132d148577,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148577,40).
xc_kb_names(a65b132d148577,[]).
xc_mapping_rows(a65b132d148577,[]).
x_comment(x_edgeCost,"(edgeCost ?from ?to ?cost) represents the traversal cost of the graph edge ?from -> ?to.") :- x_cid(a65b132d148578).
xc_microtheory(a65b132d148578,x_BFSMt).
xc_source_file(a65b132d148578,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148578,41).
xc_kb_names(a65b132d148578,[]).
xc_mapping_rows(a65b132d148578,[]).
x_isa(x_h,x_BinaryPredicate) :- x_cid(a65b132d148579).
xc_microtheory(a65b132d148579,x_BFSMt).
xc_source_file(a65b132d148579,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148579,43).
xc_kb_names(a65b132d148579,[]).
xc_mapping_rows(a65b132d148579,[]).
x_arity(x_h,2) :- x_cid(a65b132d14857a).
xc_microtheory(a65b132d14857a,x_BFSMt).
xc_source_file(a65b132d14857a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14857a,44).
xc_kb_names(a65b132d14857a,[]).
xc_mapping_rows(a65b132d14857a,[]).
x_arg1Isa(x_h,x_SearchNode) :- x_cid(a65b132d14857b).
xc_microtheory(a65b132d14857b,x_BFSMt).
xc_source_file(a65b132d14857b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14857b,45).
xc_kb_names(a65b132d14857b,[]).
xc_mapping_rows(a65b132d14857b,[]).
x_arg2Isa(x_h,x_ScalarInterval) :- x_cid(a65b132d14857c).
xc_microtheory(a65b132d14857c,x_BFSMt).
xc_source_file(a65b132d14857c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14857c,46).
xc_kb_names(a65b132d14857c,[]).
xc_mapping_rows(a65b132d14857c,[]).
x_comment(x_h,"(h ?node ?estimated-cost) represents the heuristic estimate of the cost from ?node to the goal.") :- x_cid(a65b132d14857d).
xc_microtheory(a65b132d14857d,x_BFSMt).
xc_source_file(a65b132d14857d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14857d,47).
xc_kb_names(a65b132d14857d,[]).
xc_mapping_rows(a65b132d14857d,[]).
x_edgeCost(x_s,x_a,2) :- x_cid(a65b132d14857e).
xc_microtheory(a65b132d14857e,x_BFSMt).
xc_source_file(a65b132d14857e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14857e,52).
xc_kb_names(a65b132d14857e,[]).
xc_mapping_rows(a65b132d14857e,[]).
x_edgeCost(x_a,x_b,2) :- x_cid(a65b132d14857f).
xc_microtheory(a65b132d14857f,x_BFSMt).
xc_source_file(a65b132d14857f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14857f,53).
xc_kb_names(a65b132d14857f,[]).
xc_mapping_rows(a65b132d14857f,[]).
x_edgeCost(x_b,x_c,2) :- x_cid(a65b132d148580).
xc_microtheory(a65b132d148580,x_BFSMt).
xc_source_file(a65b132d148580,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148580,54).
xc_kb_names(a65b132d148580,[]).
xc_mapping_rows(a65b132d148580,[]).
x_edgeCost(x_c,x_d,3) :- x_cid(a65b132d148581).
xc_microtheory(a65b132d148581,x_BFSMt).
xc_source_file(a65b132d148581,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148581,55).
xc_kb_names(a65b132d148581,[]).
xc_mapping_rows(a65b132d148581,[]).
x_edgeCost(x_d,x_t,3) :- x_cid(a65b132d148582).
xc_microtheory(a65b132d148582,x_BFSMt).
xc_source_file(a65b132d148582,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148582,56).
xc_kb_names(a65b132d148582,[]).
xc_mapping_rows(a65b132d148582,[]).
x_edgeCost(x_s,x_e,2) :- x_cid(a65b132d148583).
xc_microtheory(a65b132d148583,x_BFSMt).
xc_source_file(a65b132d148583,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148583,57).
xc_kb_names(a65b132d148583,[]).
xc_mapping_rows(a65b132d148583,[]).
x_edgeCost(x_e,x_f,5) :- x_cid(a65b132d148584).
xc_microtheory(a65b132d148584,x_BFSMt).
xc_source_file(a65b132d148584,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148584,58).
xc_kb_names(a65b132d148584,[]).
xc_mapping_rows(a65b132d148584,[]).
x_edgeCost(x_f,x_g,2) :- x_cid(a65b132d148585).
xc_microtheory(a65b132d148585,x_BFSMt).
xc_source_file(a65b132d148585,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148585,59).
xc_kb_names(a65b132d148585,[]).
xc_mapping_rows(a65b132d148585,[]).
x_edgeCost(x_g,x_t,2) :- x_cid(a65b132d148586).
xc_microtheory(a65b132d148586,x_BFSMt).
xc_source_file(a65b132d148586,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148586,60).
xc_kb_names(a65b132d148586,[]).
xc_mapping_rows(a65b132d148586,[]).
x_h(x_a,5) :- x_cid(a65b132d148587).
xc_microtheory(a65b132d148587,x_BFSMt).
xc_source_file(a65b132d148587,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148587,68).
xc_kb_names(a65b132d148587,[]).
xc_mapping_rows(a65b132d148587,[]).
x_h(x_b,4) :- x_cid(a65b132d148588).
xc_microtheory(a65b132d148588,x_BFSMt).
xc_source_file(a65b132d148588,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148588,69).
xc_kb_names(a65b132d148588,[]).
xc_mapping_rows(a65b132d148588,[]).
x_h(x_c,4) :- x_cid(a65b132d148589).
xc_microtheory(a65b132d148589,x_BFSMt).
xc_source_file(a65b132d148589,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148589,70).
xc_kb_names(a65b132d148589,[]).
xc_mapping_rows(a65b132d148589,[]).
x_h(x_d,3) :- x_cid(a65b132d14858a).
xc_microtheory(a65b132d14858a,x_BFSMt).
xc_source_file(a65b132d14858a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14858a,71).
xc_kb_names(a65b132d14858a,[]).
xc_mapping_rows(a65b132d14858a,[]).
x_h(x_e,7) :- x_cid(a65b132d14858b).
xc_microtheory(a65b132d14858b,x_BFSMt).
xc_source_file(a65b132d14858b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14858b,72).
xc_kb_names(a65b132d14858b,[]).
xc_mapping_rows(a65b132d14858b,[]).
x_h(x_f,4) :- x_cid(a65b132d14858c).
xc_microtheory(a65b132d14858c,x_BFSMt).
xc_source_file(a65b132d14858c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14858c,73).
xc_kb_names(a65b132d14858c,[]).
xc_mapping_rows(a65b132d14858c,[]).
x_h(x_g,2) :- x_cid(a65b132d14858d).
xc_microtheory(a65b132d14858d,x_BFSMt).
xc_source_file(a65b132d14858d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14858d,74).
xc_kb_names(a65b132d14858d,[]).
xc_mapping_rows(a65b132d14858d,[]).
x_h(x_t,0) :- x_cid(a65b132d14858e).
xc_microtheory(a65b132d14858e,x_BFSMt).
xc_source_file(a65b132d14858e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14858e,75).
xc_kb_names(a65b132d14858e,[]).
xc_mapping_rows(a65b132d14858e,[]).
x_goalState(x_t) :- x_cid(a65b132d14858f).
xc_microtheory(a65b132d14858f,x_BFSMt).
xc_source_file(a65b132d14858f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14858f,77).
xc_kb_names(a65b132d14858f,[]).
xc_mapping_rows(a65b132d14858f,[]).
x_genlMt(x_BFSMt,x_CompanionsMt) :- x_cid(a65b132d148590).
xc_microtheory(a65b132d148590,x_BFSMt).
xc_source_file(a65b132d148590,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148590,93).
xc_kb_names(a65b132d148590,[]).
xc_mapping_rows(a65b132d148590,[]).
x_isa(x_testSolveBFS,x_ComplexActionPredicate) :- x_cid(a65b132d148591).
xc_microtheory(a65b132d148591,x_BFSMt).
xc_source_file(a65b132d148591,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148591,96).
xc_kb_names(a65b132d148591,[]).
xc_mapping_rows(a65b132d148591,[]).
x_arity(x_testSolveBFS,3) :- x_cid(a65b132d148592).
xc_microtheory(a65b132d148592,x_BFSMt).
xc_source_file(a65b132d148592,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148592,97).
xc_kb_names(a65b132d148592,[]).
xc_mapping_rows(a65b132d148592,[]).
x_preconditionForMethod('x_ist-Information'(x_BFSMt,x_goalOfSolve(V1,x_searchBFS(V2,0,x_TheList,V3,V4))),x_methodForAction(x_testSolveBFS(V2,V5,V6),x_actionSequence(x_TheList(x_doChangeSolveMaxDepth(V1,V5),x_doRunToSolution(V1),x_doAgentPlan(x_evaluateSolveBFS(V1,1,V6,x_TheSet)))))) :- x_cid(a65b132d148593,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b132d148593,x_BFSMt).
xc_source_file(a65b132d148593,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148593,99).
xc_kb_names(a65b132d148593,["?solve","?start","?solution-cost","?solution-path","?depth","?num-answers"]).
xc_mapping_rows(a65b132d148593,[]).
x_isa(x_evaluateSolveBFS,x_ComplexActionPredicate) :- x_cid(a65b132d148594).
xc_microtheory(a65b132d148594,x_BFSMt).
xc_source_file(a65b132d148594,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148594,110).
xc_kb_names(a65b132d148594,[]).
xc_mapping_rows(a65b132d148594,[]).
x_arity(x_evaluateSolveBFS,4) :- x_cid(a65b132d148595).
xc_microtheory(a65b132d148595,x_BFSMt).
xc_source_file(a65b132d148595,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148595,111).
xc_kb_names(a65b132d148595,[]).
xc_mapping_rows(a65b132d148595,[]).
x_preconditionForMethod(x_and(x_evaluate(V1,x_TheClosedRetrievalSetOf(t(V2,V3),x_lookupOnly(x_wmOnly(x_searchBFS(V4,0,x_TheList,V2,V3))))),x_evaluate(V5,x_SetDifferenceFn(V1,V6)),x_unifies(x_TheSet(t(V7,V8)),V5),x_evaluate(V9,x_DifferenceFn(V10,1)),x_evaluate(V11,x_PlusFn(V12,1))),x_methodForAction(x_evaluateSolveBFS(V13,V12,V10,V6),x_actionSequence(x_TheList(x_doAnnounce("solution ~s = ~s with cost ~s",[V12,V8,V7]),x_doAgentPlan(x_nextSolveBFS(V13,V11,V9,V1)))))) :- x_cid(a65b132d148596,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V13).
xc_microtheory(a65b132d148596,x_BFSMt).
xc_source_file(a65b132d148596,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148596,115).
xc_kb_names(a65b132d148596,["?all-answers","?solution-cost","?solution-path","?start","?new-answers","?answers-so-far","?new-cost","?new-path","?remaining-answers","?num-answers","?next-answer","?answer-num","?solve"]).
xc_mapping_rows(a65b132d148596,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 129, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d148596,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 129, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_evaluateSolveBFS(V1,V2,V3,V4),x_actionSequence(x_TheList(x_doAnnounce("no more answers",[]))))) :- x_cid(a65b132d148597,V1,V2,V3,V4).
xc_microtheory(a65b132d148597,x_BFSMt).
xc_source_file(a65b132d148597,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148597,133).
xc_kb_names(a65b132d148597,["?solve","?answer-num","?num-answers","?answers-so-far"]).
xc_mapping_rows(a65b132d148597,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 139, column 39), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d148597,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 139, column 39), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
'x_<=='(x_preferInContext(x_evaluateSolveBFS(V1,V2,V3,V4),V5,V6),x_someArgumentHasPredicate(V5,x_doAgentPlan)) :- x_cid(a65b132d148598,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b132d148598,x_BFSMt).
xc_source_file(a65b132d148598,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148598,141).
xc_kb_names(a65b132d148598,["?solve","?answer-num","?num-answers","?answers-so-far","?seq1","?seq2"]).
xc_mapping_rows(a65b132d148598,[]).
x_isa(x_nextSolveBFS,x_ComplexActionPredicate) :- x_cid(a65b132d148599).
xc_microtheory(a65b132d148599,x_BFSMt).
xc_source_file(a65b132d148599,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d148599,144).
xc_kb_names(a65b132d148599,[]).
xc_mapping_rows(a65b132d148599,[]).
x_arity(x_nextSolveBFS,4) :- x_cid(a65b132d14859a).
xc_microtheory(a65b132d14859a,x_BFSMt).
xc_source_file(a65b132d14859a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14859a,145).
xc_kb_names(a65b132d14859a,[]).
xc_mapping_rows(a65b132d14859a,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_nextSolveBFS(V1,V2,0,V3),x_actionSequence(x_TheList(x_doAnnounce("That's all requested answers.",[]))))) :- x_cid(a65b132d14859b,V1,V2,V3).
xc_microtheory(a65b132d14859b,x_BFSMt).
xc_source_file(a65b132d14859b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14859b,147).
xc_kb_names(a65b132d14859b,["?solve","?answer-num","?all-answers"]).
xc_mapping_rows(a65b132d14859b,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 153, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b132d14859b,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 153, column 53), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_greaterThan(V1,0),x_methodForAction(x_nextSolveBFS(V2,V3,V1,V4),x_actionSequence(x_TheList(x_doRunToSolution(V2),x_doAgentPlan(x_evaluateSolveBFS(V2,V3,V1,V4)))))) :- x_cid(a65b132d14859c,V1,V2,V3,V4).
xc_microtheory(a65b132d14859c,x_BFSMt).
xc_source_file(a65b132d14859c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-sbfs.krf').
xc_source_line(a65b132d14859c,155).
xc_kb_names(a65b132d14859c,["?num-answers","?solve","?answer-num","?all-answers"]).
xc_mapping_rows(a65b132d14859c,[]).
kb_cache_footer(footer{count:54,digest:'41711bbb38ed868007d86a82b271b33d653c9657afe07457c30b81e6aac4d0cf',headerDigest:baeca0bfcb74775d908632a4fa19845cc73d5e1bff9799efacd47cd6bd2bf69f}).
