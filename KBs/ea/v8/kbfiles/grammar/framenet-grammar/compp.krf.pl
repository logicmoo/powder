:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:8,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:52,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:e13bf0b6a5d668ab748762ca983268a20ab8168adf55865f98f8dd36153468ef,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2402,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf',sourceHash:'90cefeeeb79df65b4416aefa99d032508933b24bdea80a17032f458773e4cc71',warnings:[]}).
x_isa('x_-compp->than-np-',x_EAGrammarRule) :- x_cid(a65b1262630132).
xc_microtheory(a65b1262630132,x_EANulexGrammarMt).
xc_source_file(a65b1262630132,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf').
xc_source_line(a65b1262630132,26).
xc_kb_names(a65b1262630132,[]).
xc_mapping_rows(a65b1262630132,[]).
xc_exclude_globals(a65b1262630132,true).
x_comment('x_-compp->than-np-',"'than the car', 'than a dog'") :- x_cid(a65b1262630133).
xc_microtheory(a65b1262630133,x_EANulexGrammarMt).
xc_source_file(a65b1262630133,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf').
xc_source_line(a65b1262630133,27).
xc_kb_names(a65b1262630133,[]).
xc_mapping_rows(a65b1262630133,[]).
xc_exclude_globals(a65b1262630133,true).
x_probabilityEAGrammarRule('x_-compp->than-np-',1.0) :- x_cid(a65b1262630134).
xc_microtheory(a65b1262630134,x_EANulexGrammarMt).
xc_source_file(a65b1262630134,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf').
xc_source_line(a65b1262630134,28).
xc_kb_names(a65b1262630134,[]).
xc_mapping_rows(a65b1262630134,[]).
xc_exclude_globals(a65b1262630134,true).
x_grammarRule('x_-compp->than-np-',x_EATermFn(x_compp,x_TheList(x_var(V1),x_sem(x_and(V2,x_isa(':ACTION',x_ComparisonEvent),x_comparer(':ACTION',':CONSTITUENT1'),x_comparee(':ACTION',':CONSTITUENT2'),x_comparativeRelation(':ACTION',':RELATION'))))),x_TheList(x_EATermFn(x_Conjunction,x_TheList(x_lex(x_than))),x_EAHeadFn(x_EATermFn(x_np,x_TheList(x_var(V1),x_sem(V2)))))) :- x_cid(a65b1262630135,V1,V2).
xc_microtheory(a65b1262630135,x_EANulexGrammarMt).
xc_source_file(a65b1262630135,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf').
xc_source_line(a65b1262630135,29).
xc_kb_names(a65b1262630135,["?varnp","?semnp"]).
xc_mapping_rows(a65b1262630135,[]).
xc_exclude_globals(a65b1262630135,true).
x_isa('x_-compp->than-vpinv-',x_EAGrammarRule) :- x_cid(a65b1262630136).
xc_microtheory(a65b1262630136,x_EANulexGrammarMt).
xc_source_file(a65b1262630136,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf').
xc_source_line(a65b1262630136,40).
xc_kb_names(a65b1262630136,[]).
xc_mapping_rows(a65b1262630136,[]).
xc_exclude_globals(a65b1262630136,true).
x_comment('x_-compp->than-vpinv-',"'than the box holds'") :- x_cid(a65b1262630137).
xc_microtheory(a65b1262630137,x_EANulexGrammarMt).
xc_source_file(a65b1262630137,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf').
xc_source_line(a65b1262630137,41).
xc_kb_names(a65b1262630137,[]).
xc_mapping_rows(a65b1262630137,[]).
xc_exclude_globals(a65b1262630137,true).
x_probabilityEAGrammarRule('x_-compp->than-vpinv-',1.0) :- x_cid(a65b1262630138).
xc_microtheory(a65b1262630138,x_EANulexGrammarMt).
xc_source_file(a65b1262630138,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf').
xc_source_line(a65b1262630138,42).
xc_kb_names(a65b1262630138,[]).
xc_mapping_rows(a65b1262630138,[]).
xc_exclude_globals(a65b1262630138,true).
x_grammarRule('x_-compp->than-vpinv-',x_EATermFn(x_compp,x_TheList(x_var(V1),x_sem(V2))),x_TheList(x_EATermFn(x_Conjunction,x_TheList(x_lex(x_than))),x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_inv('x_+'),x_link('x_-'),x_agr(V3),x_var(V1),x_sem(V2),'x_inv-subject'(V4)))))) :- x_cid(a65b1262630139,V1,V2,V3,V4).
xc_microtheory(a65b1262630139,x_EANulexGrammarMt).
xc_source_file(a65b1262630139,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/compp.krf').
xc_source_line(a65b1262630139,43).
xc_kb_names(a65b1262630139,["?varvp","?semvp","?a","?subvp"]).
xc_mapping_rows(a65b1262630139,[]).
xc_exclude_globals(a65b1262630139,true).
kb_cache_footer(footer{count:8,digest:e13bf0b6a5d668ab748762ca983268a20ab8168adf55865f98f8dd36153468ef,headerDigest:a4cd6d5ad5cc45c090b0ce7da1480e6d882f4cfb526b55c5d61c3ce55ebe9cdd}).
