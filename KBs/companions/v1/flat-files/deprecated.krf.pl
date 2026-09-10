:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:5,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:49,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'326bd56402aad712dce799a3d9be19e25d2699619518d9cb27cf9a7bf654cf76',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/deprecated.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1372,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/deprecated.krf',sourceHash:'9e9f692cb94a89de46afe938f7a00e26bdca1a447c0d835c2dfa6d7ce2150d93',warnings:[]}).
x_isa(x_doListSequence,x_ComplexActionPredicate) :- x_cid(a65b125d1c871a).
xc_microtheory(a65b125d1c871a,x_CompanionsMt).
xc_source_file(a65b125d1c871a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/deprecated.krf').
xc_source_line(a65b125d1c871a,15).
xc_kb_names(a65b125d1c871a,[]).
xc_mapping_rows(a65b125d1c871a,[]).
x_arity(x_doListSequence,3) :- x_cid(a65b125d1c871b).
xc_microtheory(a65b125d1c871b,x_CompanionsMt).
xc_source_file(a65b125d1c871b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/deprecated.krf').
xc_source_line(a65b125d1c871b,16).
xc_kb_names(a65b125d1c871b,[]).
xc_mapping_rows(a65b125d1c871b,[]).
x_preconditionForMethod(x_and(x_operatorFormulas(x_TheSet,V1),x_evaluate(V2,x_SetToListFn(V1))),x_methodForAction(x_doListSequence(V3,V1,V4),x_actionSequence(x_TheList(x_doListSequence(V3,V2,V4))))) :- x_cid(a65b125d1c871c,V1,V2,V3,V4).
xc_microtheory(a65b125d1c871c,x_CompanionsMt).
xc_source_file(a65b125d1c871c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/deprecated.krf').
xc_source_line(a65b125d1c871c,19).
xc_kb_names(a65b125d1c871c,["?set","?list","?item-symbol","?sequence"]).
xc_mapping_rows(a65b125d1c871c,[]).
x_preconditionForMethod(x_and(x_operatorFormulas(x_TheList,V1),x_different(V1,x_TheList),x_evaluate(V2,x_FirstInListFn(V1)),x_evaluate(V3,x_RestOfListFn(V1)),x_evaluate(V4,x_SublisFn(x_TheSet(t(V5,V2)),V6))),x_methodForAction(x_doListSequence(V5,V1,V6),x_actionSequence(x_TheList(x_doAgentPlan(x_actionSequence(V4)),x_doListSequence(V5,V3,V6))))) :- x_cid(a65b125d1c871d,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b125d1c871d,x_CompanionsMt).
xc_source_file(a65b125d1c871d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/deprecated.krf').
xc_source_line(a65b125d1c871d,28).
xc_kb_names(a65b125d1c871d,["?list","?my-item","?rest-list","?subd-sequence","?item-symbol","?sequence"]).
xc_mapping_rows(a65b125d1c871d,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_doListSequence(V1,x_TheList,V2),x_actionSequence(x_TheList))) :- x_cid(a65b125d1c871e,V1,V2).
xc_microtheory(a65b125d1c871e,x_CompanionsMt).
xc_source_file(a65b125d1c871e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/deprecated.krf').
xc_source_line(a65b125d1c871e,42).
xc_kb_names(a65b125d1c871e,["?item-symbol","?sequence"]).
xc_mapping_rows(a65b125d1c871e,[]).
kb_cache_footer(footer{count:5,digest:'326bd56402aad712dce799a3d9be19e25d2699619518d9cb27cf9a7bf654cf76',headerDigest:'2223954813ab892905d9a43d421b9617cadf4e7dcf8c63531924acda09af362b'}).
