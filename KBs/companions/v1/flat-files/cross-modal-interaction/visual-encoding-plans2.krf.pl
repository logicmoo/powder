:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:3,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:36,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'1793ee22e5df299b23744587ca384dee4f2f2440d2810ae9cdad3aaae81f4f6f',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans2.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1428,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans2.krf',sourceHash:dc9221d220559506f5a742e9664ac5d8f0f33dbfb0f17120693864ad8c9ae067,warnings:[]}).
'x_in-package'(':cl-user') :- x_cid(a65b125d1b5f0f).
xc_microtheory(a65b125d1b5f0f,'x_visual-encoding-plans2Mt').
xc_source_file(a65b125d1b5f0f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans2.krf').
xc_source_line(a65b125d1b5f0f,13).
xc_kb_names(a65b125d1b5f0f,[]).
xc_mapping_rows(a65b125d1b5f0f,[]).
x_isa(x_VisualEncodingPlansMt,x_ExperimentInfraStructureFn("Cross Modal Interaction")) :- x_cid(a65b125d1b5f10).
xc_microtheory(a65b125d1b5f10,x_VisualEncodingPlansMt).
xc_source_file(a65b125d1b5f10,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans2.krf').
xc_source_line(a65b125d1b5f10,17).
xc_kb_names(a65b125d1b5f10,[]).
xc_mapping_rows(a65b125d1b5f10,[]).
x_preconditionForMethod(x_and(x_sameVisualEncodedObject(V1,V2),x_lookupOnly(x_wmOnly('x_ist-Information'(x_EncodedCaseFn(V2,'x_SUB-EP-ID'),V3)))),x_methodForAction(x_encodeVisually(V1),x_actionSequence(x_TheList(x_doAnnounce("There is a prior encoding availabled for object ~A",[V1]),x_doTell(x_encodingForObject(V1,x_EncodedCaseFn(V2,'x_SUB-EP-ID'))))))) :- x_cid(a65b125d1b5f11,V1,V2,V3).
xc_microtheory(a65b125d1b5f11,x_VisualEncodingPlansMt).
xc_source_file(a65b125d1b5f11,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/cross-modal-interaction/visual-encoding-plans2.krf').
xc_source_line(a65b125d1b5f11,20).
xc_kb_names(a65b125d1b5f11,["?object","?same-object","?fact"]).
xc_mapping_rows(a65b125d1b5f11,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 28, column 71), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125d1b5f11,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 28, column 71), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
kb_cache_footer(footer{count:3,digest:'1793ee22e5df299b23744587ca384dee4f2f2440d2810ae9cdad3aaae81f4f6f',headerDigest:'0f0f1de3c0b3bda8f866ecaace553c6ad0395e793808e50848238bdc931db164'}).
