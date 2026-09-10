:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:16,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:83,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'033d9fd25e4cbfa16266410778bb21492b251ab7f26b2bc10ab57f674767fa31',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3407,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf',sourceHash:'80a2b59cdafc2bf8504881ae34e6c3d3c259f6fc8b7dc8b3763572aeec53b74b',warnings:[]}).
x_isa(x_adHocEdge,x_Relation) :- x_cid(a65b126b95726e).
xc_microtheory(a65b126b95726e,x_AdHocGraphMt).
xc_source_file(a65b126b95726e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b95726e,20).
xc_kb_names(a65b126b95726e,[]).
xc_mapping_rows(a65b126b95726e,[]).
xc_exclude_globals(a65b126b95726e,true).
x_arity(x_adHocEdge,9) :- x_cid(a65b126b95726f).
xc_microtheory(a65b126b95726f,x_AdHocGraphMt).
xc_source_file(a65b126b95726f,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b95726f,21).
xc_kb_names(a65b126b95726f,[]).
xc_mapping_rows(a65b126b95726f,[]).
xc_exclude_globals(a65b126b95726f,true).
x_comment(x_adHocEdge,"(adHocEdge <graph-type> <origin-data> <terminus-data> <label> <data> <directed?> <color> <style> <width>)") :- x_cid(a65b126b957270).
xc_microtheory(a65b126b957270,x_AdHocGraphMt).
xc_source_file(a65b126b957270,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957270,22).
xc_kb_names(a65b126b957270,[]).
xc_mapping_rows(a65b126b957270,[]).
xc_exclude_globals(a65b126b957270,true).
x_isa(x_adHocVertex,x_Relation) :- x_cid(a65b126b957271).
xc_microtheory(a65b126b957271,x_AdHocGraphMt).
xc_source_file(a65b126b957271,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957271,24).
xc_kb_names(a65b126b957271,[]).
xc_mapping_rows(a65b126b957271,[]).
xc_exclude_globals(a65b126b957271,true).
x_arity(x_adHocVertex,5) :- x_cid(a65b126b957272).
xc_microtheory(a65b126b957272,x_AdHocGraphMt).
xc_source_file(a65b126b957272,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957272,25).
xc_kb_names(a65b126b957272,[]).
xc_mapping_rows(a65b126b957272,[]).
xc_exclude_globals(a65b126b957272,true).
x_comment(x_adHocVertex,"(adHocVertex <graph-type> <label> <data> <shape> <fill-color>)") :- x_cid(a65b126b957273).
xc_microtheory(a65b126b957273,x_AdHocGraphMt).
xc_source_file(a65b126b957273,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957273,26).
xc_kb_names(a65b126b957273,[]).
xc_mapping_rows(a65b126b957273,[]).
xc_exclude_globals(a65b126b957273,true).
'x_<=='(x_filteredFormula(V1,V2),x_uninferredSentence(x_unifies(V1,x_isa(V3,V4))),x_unifies(V2,V1)) :- x_cid(a65b126b957274,V1,V2,V3,V4).
xc_microtheory(a65b126b957274,x_AdHocGraphMt).
xc_source_file(a65b126b957274,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957274,35).
xc_kb_names(a65b126b957274,["?formula","?filtered","?inst","?coll"]).
xc_mapping_rows(a65b126b957274,[]).
xc_exclude_globals(a65b126b957274,true).
'x_<=='(x_filteredFormula(V1,V2),x_unifies(V1,x_isa(V3,V4)),x_unifies(V2,t(V4,V3))) :- x_cid(a65b126b957275,V1,V2,V3,V4).
xc_microtheory(a65b126b957275,x_AdHocGraphMt).
xc_source_file(a65b126b957275,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957275,39).
xc_kb_names(a65b126b957275,["?formula","?filtered","?inst","?coll"]).
xc_mapping_rows(a65b126b957275,[]).
xc_exclude_globals(a65b126b957275,true).
'x_<=='(x_topLevelCaseFormula(V1,V2),x_caseFact(V1,V3),x_filteredFormula(V3,V2)) :- x_cid(a65b126b957276,V1,V2,V3).
xc_microtheory(a65b126b957276,x_AdHocGraphMt).
xc_source_file(a65b126b957276,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957276,43).
xc_kb_names(a65b126b957276,["?case-term","?formula","?fact"]).
xc_mapping_rows(a65b126b957276,[]).
xc_exclude_globals(a65b126b957276,true).
'x_<=='(x_subFormula(V1,V2,V3),x_evaluate(V4,x_RestOfListFn(x_MakeListFn(V1))),x_evaluate(V5,x_ListToSetFn(V4)),x_elementOf(V6,V5),x_evaluate(V3,x_PositionInListFn(V6,V4)),x_filteredFormula(V6,V2)) :- x_cid(a65b126b957277,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b126b957277,x_AdHocGraphMt).
xc_source_file(a65b126b957277,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957277,47).
xc_kb_names(a65b126b957277,["?formula","?sub-formula","?arg-num","?arg-list","?arg-set","?arg"]).
xc_mapping_rows(a65b126b957277,[]).
xc_exclude_globals(a65b126b957277,true).
'x_<=='(x_formulaLabel(V1,V2),x_evaluate(V2,x_FirstInListFn(x_MakeListFn(V1)))) :- x_cid(a65b126b957278,V1,V2).
xc_microtheory(a65b126b957278,x_AdHocGraphMt).
xc_source_file(a65b126b957278,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957278,54).
xc_kb_names(a65b126b957278,["?formula","?label"]).
xc_mapping_rows(a65b126b957278,[]).
xc_exclude_globals(a65b126b957278,true).
'x_<=='(x_nestedCaseFormula(V1,V2),x_topLevelCaseFormula(V1,V3),x_subFormula(V3,V2,V4)) :- x_cid(a65b126b957279,V1,V2,V3,V4).
xc_microtheory(a65b126b957279,x_AdHocGraphMt).
xc_source_file(a65b126b957279,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b957279,57).
xc_kb_names(a65b126b957279,["?case-term","?formula","?top-level-formula","?arg"]).
xc_mapping_rows(a65b126b957279,[]).
xc_exclude_globals(a65b126b957279,true).
'x_<=='(x_nestedCaseFormula(V1,V2),x_nestedCaseFormula(V1,V3),x_subFormula(V3,V2,V4)) :- x_cid(a65b126b95727a,V1,V2,V3,V4).
xc_microtheory(a65b126b95727a,x_AdHocGraphMt).
xc_source_file(a65b126b95727a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b95727a,61).
xc_kb_names(a65b126b95727a,["?case-term","?formula","?super-formula","?arg"]).
xc_mapping_rows(a65b126b95727a,[]).
xc_exclude_globals(a65b126b95727a,true).
'x_<=='(x_adHocEdge(x_NestedRelationalGraph(V1),V2,V3,V4,V4,x_True,x_BlackColor,':solid',1),x_lookupOnly(x_adHocVertex(x_NestedRelationalGraph(V1),V5,V2,V6,V7)),x_lookupOnly(x_adHocVertex(x_NestedRelationalGraph(V1),V8,V3,V9,V10)),x_subFormula(V2,V3,V4)) :- x_cid(a65b126b95727b,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b126b95727b,x_AdHocGraphMt).
xc_source_file(a65b126b95727b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b95727b,66).
xc_kb_names(a65b126b95727b,["?case-term","?super-formula","?sub-formula","?arg","?label1","?shape1","?color1","?label2","?shape2","?color2"]).
xc_mapping_rows(a65b126b95727b,[]).
xc_exclude_globals(a65b126b95727b,true).
'x_<=='(x_adHocVertex(x_NestedRelationalGraph(V1),V2,V3,':ellipse',x_GreenColor),x_topLevelCaseFormula(V1,V3),x_formulaLabel(V3,V2)) :- x_cid(a65b126b95727c,V1,V2,V3).
xc_microtheory(a65b126b95727c,x_AdHocGraphMt).
xc_source_file(a65b126b95727c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b95727c,72).
xc_kb_names(a65b126b95727c,["?case-term","?label","?data"]).
xc_mapping_rows(a65b126b95727c,[]).
xc_exclude_globals(a65b126b95727c,true).
'x_<=='(x_adHocVertex(x_NestedRelationalGraph(V1),V2,V3,':ellipse',x_BlueColor),x_nestedCaseFormula(V1,V3),x_uninferredSentence(x_topLevelCaseFormula(V1,V3)),x_formulaLabel(V3,V2)) :- x_cid(a65b126b95727d,V1,V2,V3).
xc_microtheory(a65b126b95727d,x_AdHocGraphMt).
xc_source_file(a65b126b95727d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/ad-hoc-graphs.krf').
xc_source_line(a65b126b95727d,76).
xc_kb_names(a65b126b95727d,["?case-term","?label","?data"]).
xc_mapping_rows(a65b126b95727d,[]).
xc_exclude_globals(a65b126b95727d,true).
kb_cache_footer(footer{count:16,digest:'033d9fd25e4cbfa16266410778bb21492b251ab7f26b2bc10ab57f674767fa31',headerDigest:a934074428b1128390c987fb0f40d0ce2925014a3ddf5dd82b53773ca34739b7}).
