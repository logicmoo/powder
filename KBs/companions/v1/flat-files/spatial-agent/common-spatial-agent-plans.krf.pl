:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:7,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:51,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'0245812377bb4a55f8523be7c310f1fe1cc814881eabfc346ddcd6741458e6f0',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/spatial-agent/common-spatial-agent-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1765,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/spatial-agent/common-spatial-agent-plans.krf',sourceHash:'8271283cdd853ad7c9f4a457c77900f4f53bc735044f4ca870b22d08916751f5',warnings:[]}).
x_genlMt('x_Spatial-AgentMt',x_CompanionsMt) :- x_cid(a65b125e5f1022).
xc_microtheory(a65b125e5f1022,'x_Spatial-AgentMt').
xc_source_file(a65b125e5f1022,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/spatial-agent/common-spatial-agent-plans.krf').
xc_source_line(a65b125e5f1022,15).
xc_kb_names(a65b125e5f1022,[]).
xc_mapping_rows(a65b125e5f1022,[]).
x_isa(x_saveSketch,x_ComplexActionPredicate) :- x_cid(a65b125e5f1023).
xc_microtheory(a65b125e5f1023,'x_Spatial-AgentMt').
xc_source_file(a65b125e5f1023,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/spatial-agent/common-spatial-agent-plans.krf').
xc_source_line(a65b125e5f1023,19).
xc_kb_names(a65b125e5f1023,[]).
xc_mapping_rows(a65b125e5f1023,[]).
x_arity(x_saveSketch,1) :- x_cid(a65b125e5f1024).
xc_microtheory(a65b125e5f1024,'x_Spatial-AgentMt').
xc_source_file(a65b125e5f1024,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/spatial-agent/common-spatial-agent-plans.krf').
xc_source_line(a65b125e5f1024,20).
xc_kb_names(a65b125e5f1024,[]).
xc_mapping_rows(a65b125e5f1024,[]).
x_arg1Isa(x_saveSketch,'x_SketchAgent-CA') :- x_cid(a65b125e5f1025).
xc_microtheory(a65b125e5f1025,'x_Spatial-AgentMt').
xc_source_file(a65b125e5f1025,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/spatial-agent/common-spatial-agent-plans.krf').
xc_source_line(a65b125e5f1025,21).
xc_kb_names(a65b125e5f1025,[]).
xc_mapping_rows(a65b125e5f1025,[]).
x_comment(x_saveSketch,"(saveSketch ?sketch-agent) saves the sketch for the open\n                      sketch agent at its current location.") :- x_cid(a65b125e5f1026).
xc_microtheory(a65b125e5f1026,'x_Spatial-AgentMt').
xc_source_file(a65b125e5f1026,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/spatial-agent/common-spatial-agent-plans.krf').
xc_source_line(a65b125e5f1026,22).
xc_kb_names(a65b125e5f1026,[]).
xc_mapping_rows(a65b125e5f1026,[]).
x_preconditionForMethod(x_and(x_sessionContext(V1),'x_ist-Information'(V1,x_sketchAgentFileURL(V2,V3))),x_methodForAction(x_saveSketch(V2),x_actionSequence(x_TheList(x_doAnnounce("~% Saving sketch agent ~A~%   @URL: ~s",[V2,V3]),x_doSaveSketchAs(V2,V3))))) :- x_cid(a65b125e5f1027,V1,V2,V3).
xc_microtheory(a65b125e5f1027,'x_Spatial-AgentMt').
xc_source_file(a65b125e5f1027,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/spatial-agent/common-spatial-agent-plans.krf').
xc_source_line(a65b125e5f1027,28).
xc_kb_names(a65b125e5f1027,["?session-ctxt","?sketch-agent","?url"]).
xc_mapping_rows(a65b125e5f1027,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 36, column 58), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e5f1027,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 36, column 58), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_saveSketch(V1),x_actionSequence(x_TheList(x_doAnnounce("~% saveSketch: Default save location unknown for ~A.",[V1]))))) :- x_cid(a65b125e5f1028,V1).
xc_microtheory(a65b125e5f1028,'x_Spatial-AgentMt').
xc_source_file(a65b125e5f1028,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/spatial-agent/common-spatial-agent-plans.krf').
xc_source_line(a65b125e5f1028,39).
xc_kb_names(a65b125e5f1028,["?sketch-agent"]).
xc_mapping_rows(a65b125e5f1028,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 45, column 72), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e5f1028,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 45, column 72), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:7,digest:'0245812377bb4a55f8523be7c310f1fe1cc814881eabfc346ddcd6741458e6f0',headerDigest:d86516c2d6bb14270d74f64c71da7ced2bd8b6a26603bcfea19a2218beec6ddc}).
