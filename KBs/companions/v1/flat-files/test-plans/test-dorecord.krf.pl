:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:11,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:63,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'9bdb90be36d3b0a80b7e32dba3860ac3e7cc26bb36bf4da474e4258a43dc70d2',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1609,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf',sourceHash:d9015c40a7bdf97bba1ee4c512ba4edce784791ef1dc64654065bc8efab88edf,warnings:[]}).
x_genlMt(x_TestPlanMt,x_CompanionsMt) :- x_cid(a65b1262340d5f).
xc_microtheory(a65b1262340d5f,x_TestPlanMt).
xc_source_file(a65b1262340d5f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d5f,12).
xc_kb_names(a65b1262340d5f,[]).
xc_mapping_rows(a65b1262340d5f,[]).
x_genlMt(x_CompanionsMt,x_TestPlanMt) :- x_cid(a65b1262340d60).
xc_microtheory(a65b1262340d60,x_TestPlanMt).
xc_source_file(a65b1262340d60,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d60,13).
xc_kb_names(a65b1262340d60,[]).
xc_mapping_rows(a65b1262340d60,[]).
x_isa(x_testDoRecord,x_ComplexActionPredicate) :- x_cid(a65b1262340d61).
xc_microtheory(a65b1262340d61,x_TestPlanMt).
xc_source_file(a65b1262340d61,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d61,15).
xc_kb_names(a65b1262340d61,[]).
xc_mapping_rows(a65b1262340d61,[]).
x_arity(x_testDoRecord,1) :- x_cid(a65b1262340d62).
xc_microtheory(a65b1262340d62,x_TestPlanMt).
xc_source_file(a65b1262340d62,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d62,16).
xc_kb_names(a65b1262340d62,[]).
xc_mapping_rows(a65b1262340d62,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_testDoRecord(V1),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V1,x_foo(x_bar))),x_doAgentPlan(x_actionSequence(x_TheList(x_testDoRecord1(V1)))),x_doAgentPlan(x_actionSequence(x_TheList(x_testDoRecord2(V1)))))))) :- x_cid(a65b1262340d63,V1).
xc_microtheory(a65b1262340d63,x_TestPlanMt).
xc_source_file(a65b1262340d63,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d63,18).
xc_kb_names(a65b1262340d63,["?context"]).
xc_mapping_rows(a65b1262340d63,[]).
x_isa(x_testDoRecord1,x_ComplexActionPredicate) :- x_cid(a65b1262340d64).
xc_microtheory(a65b1262340d64,x_TestPlanMt).
xc_source_file(a65b1262340d64,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d64,34).
xc_kb_names(a65b1262340d64,[]).
xc_mapping_rows(a65b1262340d64,[]).
x_arity(x_testDoRecord1,1) :- x_cid(a65b1262340d65).
xc_microtheory(a65b1262340d65,x_TestPlanMt).
xc_source_file(a65b1262340d65,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d65,35).
xc_kb_names(a65b1262340d65,[]).
xc_mapping_rows(a65b1262340d65,[]).
x_preconditionForMethod(x_lookupOnly(x_localOnly('x_ist-Information'(V1,x_foo(V2)))),x_methodForAction(x_testDoRecord1(V1),x_actionSequence(x_TheList(x_doForget('x_ist-Information'(V1,x_foo(V2))),x_doRecord('x_ist-Information'(V1,x_foo(x_baz))))))) :- x_cid(a65b1262340d66,V1,V2).
xc_microtheory(a65b1262340d66,x_TestPlanMt).
xc_source_file(a65b1262340d66,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d66,37).
xc_kb_names(a65b1262340d66,["?context","?what"]).
xc_mapping_rows(a65b1262340d66,[]).
x_isa(x_testDoRecord2,x_ComplexActionPredicate) :- x_cid(a65b1262340d67).
xc_microtheory(a65b1262340d67,x_TestPlanMt).
xc_source_file(a65b1262340d67,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d67,49).
xc_kb_names(a65b1262340d67,[]).
xc_mapping_rows(a65b1262340d67,[]).
x_arity(x_testDoRecord2,1) :- x_cid(a65b1262340d68).
xc_microtheory(a65b1262340d68,x_TestPlanMt).
xc_source_file(a65b1262340d68,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d68,50).
xc_kb_names(a65b1262340d68,[]).
xc_mapping_rows(a65b1262340d68,[]).
x_preconditionForMethod(x_lookupOnly(x_localOnly(x_wmOnly('x_ist-Information'(V1,x_foo(V2))))),x_methodForAction(x_testDoRecord2(V1),x_actionSequence(x_TheList(x_doAnnounce("found (foo ~s)",[V2]))))) :- x_cid(a65b1262340d69,V1,V2).
xc_microtheory(a65b1262340d69,x_TestPlanMt).
xc_source_file(a65b1262340d69,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/test-plans/test-dorecord.krf').
xc_source_line(a65b1262340d69,52).
xc_kb_names(a65b1262340d69,["?context","?what"]).
xc_mapping_rows(a65b1262340d69,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 62, column 38), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b1262340d69,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 62, column 38), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:11,digest:'9bdb90be36d3b0a80b7e32dba3860ac3e7cc26bb36bf4da474e4258a43dc70d2',headerDigest:'2b1dedb8a96e750110884c2ea124b26ef9ac640758c0dffb6bd6d1d82af3adc2'}).
