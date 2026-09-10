:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:23,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:128,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:abd77c1c2594ffedcb4dae868690f3153fcb33dc8459132a43b7272b186a4faf,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:6026,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf',sourceHash:ce4eb540d8677ad69a7c4164580f51a5e95149b866cd61c8e83e1d9cf078b7c6,warnings:[]}).
x_isa('x_-mp->number-unit-',x_EAGrammarRule) :- x_cid(a65b12626ec547).
xc_microtheory(a65b12626ec547,x_EANulexGrammarMt).
xc_source_file(a65b12626ec547,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec547,20).
xc_kb_names(a65b12626ec547,[]).
xc_mapping_rows(a65b12626ec547,[]).
xc_exclude_globals(a65b12626ec547,true).
x_comment('x_-mp->number-unit-',"'one foot' '16 pounds' '23 inches per second' agreement is all jacked up: 'a 2 pound fish' vs. 'the fish is 2 pounds' could be split into two types of measure phrases") :- x_cid(a65b12626ec548).
xc_microtheory(a65b12626ec548,x_EANulexGrammarMt).
xc_source_file(a65b12626ec548,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec548,21).
xc_kb_names(a65b12626ec548,[]).
xc_mapping_rows(a65b12626ec548,[]).
xc_exclude_globals(a65b12626ec548,true).
x_probabilityEAGrammarRule('x_-mp->number-unit-',1.0) :- x_cid(a65b12626ec549).
xc_microtheory(a65b12626ec549,x_EANulexGrammarMt).
xc_source_file(a65b12626ec549,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec549,22).
xc_kb_names(a65b12626ec549,[]).
xc_mapping_rows(a65b12626ec549,[]).
xc_exclude_globals(a65b12626ec549,true).
x_grammarRule('x_-mp->number-unit-',x_EATermFn(x_mp,x_TheList(x_var(V1),x_agr(V2),':NUMBER'(V3),x_sem(t(x_ConceptForInstanceFn(V1,V4),V3)))),x_TheList(x_EATermFn('x_Number-SP',x_TheList(x_lex(V3))),x_EATermFn(x_cnp,x_TheList(x_unit('x_+'),x_var(V1),x_agr(V2),x_sem(V4))))) :- x_cid(a65b12626ec54a,V1,V2,V3,V4).
xc_microtheory(a65b12626ec54a,x_EANulexGrammarMt).
xc_source_file(a65b12626ec54a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec54a,23).
xc_kb_names(a65b12626ec54a,["?varunit","?a","?num","?semunit"]).
xc_mapping_rows(a65b12626ec54a,[]).
xc_exclude_globals(a65b12626ec54a,true).
x_isa('x_-mp->mp-per-np3',x_EAGrammarRule) :- x_cid(a65b12626ec54b).
xc_microtheory(a65b12626ec54b,x_EANulexGrammarMt).
xc_source_file(a65b12626ec54b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec54b,57).
xc_kb_names(a65b12626ec54b,[]).
xc_mapping_rows(a65b12626ec54b,[]).
xc_exclude_globals(a65b12626ec54b,true).
x_probabilityEAGrammarRule('x_-mp->mp-per-np3',1.0) :- x_cid(a65b12626ec54c).
xc_microtheory(a65b12626ec54c,x_EANulexGrammarMt).
xc_source_file(a65b12626ec54c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec54c,58).
xc_kb_names(a65b12626ec54c,[]).
xc_mapping_rows(a65b12626ec54c,[]).
xc_exclude_globals(a65b12626ec54c,true).
x_grammarRule('x_-mp->mp-per-np3',x_EATermFn(x_mp,x_TheList(x_var(V1),x_agr(V2),'x_prep-lex'(x_per),x_sem(x_and(V3,x_measure(':ACTION',t(x_PerFn(V4,x_ConceptForInstanceFn(V5,V3)),V6)))))),x_TheList(x_EAHeadFn(x_EATermFn(x_mp,x_TheList(x_sem(V7),x_var(V1),x_agr(V2),':NUMBER'(V8),x_sem(t(V4,V6))))),x_EATermFn(x_Preposition,x_TheList(x_var(V9),x_lex(x_per))),x_EATermFn(x_cnp,x_TheList(x_var(V5),x_sem(V3))))) :- x_cid(a65b12626ec54d,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12626ec54d,x_EANulexGrammarMt).
xc_source_file(a65b12626ec54d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec54d,59).
xc_kb_names(a65b12626ec54d,["?varmp","?a","?semnp","?semunit","?varnp","?semval","?semmp","?semcardinal","?varp"]).
xc_mapping_rows(a65b12626ec54d,[]).
xc_exclude_globals(a65b12626ec54d,true).
x_isa('x_-mp->cardinal-unit-',x_EAGrammarRule) :- x_cid(a65b12626ec54e).
xc_microtheory(a65b12626ec54e,x_EANulexGrammarMt).
xc_source_file(a65b12626ec54e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec54e,75).
xc_kb_names(a65b12626ec54e,[]).
xc_mapping_rows(a65b12626ec54e,[]).
xc_exclude_globals(a65b12626ec54e,true).
x_comment('x_-mp->cardinal-unit-',"'one foot' '16 pounds' '23 inches per second' agreement is all jacked up: 'a 2 pound fish' vs. 'the fish is 2 pounds' could be split into two types of measure phrases") :- x_cid(a65b12626ec54f).
xc_microtheory(a65b12626ec54f,x_EANulexGrammarMt).
xc_source_file(a65b12626ec54f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec54f,76).
xc_kb_names(a65b12626ec54f,[]).
xc_mapping_rows(a65b12626ec54f,[]).
xc_exclude_globals(a65b12626ec54f,true).
x_probabilityEAGrammarRule('x_-mp->cardinal-unit-',1.0) :- x_cid(a65b12626ec550).
xc_microtheory(a65b12626ec550,x_EANulexGrammarMt).
xc_source_file(a65b12626ec550,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec550,77).
xc_kb_names(a65b12626ec550,[]).
xc_mapping_rows(a65b12626ec550,[]).
xc_exclude_globals(a65b12626ec550,true).
x_grammarRule('x_-mp->cardinal-unit-',x_EATermFn(x_mp,x_TheList(x_var(V1),x_agr(V2),':NUMBER'(V3),x_sem(V4),x_semunit(t(x_ConceptForInstanceFn(V1,V4),V3)))),x_TheList(x_EATermFn(x_cardinal,x_TheList(x_sem(V3))),x_EATermFn(x_cnp,x_TheList(x_unit('x_+'),x_var(V1),x_agr(V2),x_sem(V4))))) :- x_cid(a65b12626ec551,V1,V2,V3,V4).
xc_microtheory(a65b12626ec551,x_EANulexGrammarMt).
xc_source_file(a65b12626ec551,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec551,78).
xc_kb_names(a65b12626ec551,["?varunit","?a","?semcardinal","?semunit"]).
xc_mapping_rows(a65b12626ec551,[]).
xc_exclude_globals(a65b12626ec551,true).
x_isa('x_-mp->a-few-cnp-',x_EAGrammarRule) :- x_cid(a65b12626ec552).
xc_microtheory(a65b12626ec552,x_EANulexGrammarMt).
xc_source_file(a65b12626ec552,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec552,89).
xc_kb_names(a65b12626ec552,[]).
xc_mapping_rows(a65b12626ec552,[]).
xc_exclude_globals(a65b12626ec552,true).
x_comment('x_-mp->a-few-cnp-',"Nonspecific measure phrase corresponding to 'a few' as in 'a few months'. Also handled in the 'Quantifying groups' section. (JLT)") :- x_cid(a65b12626ec553).
xc_microtheory(a65b12626ec553,x_EANulexGrammarMt).
xc_source_file(a65b12626ec553,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec553,90).
xc_kb_names(a65b12626ec553,[]).
xc_mapping_rows(a65b12626ec553,[]).
xc_exclude_globals(a65b12626ec553,true).
x_probabilityEAGrammarRule('x_-mp->a-few-cnp-',1.0) :- x_cid(a65b12626ec554).
xc_microtheory(a65b12626ec554,x_EANulexGrammarMt).
xc_source_file(a65b12626ec554,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec554,91).
xc_kb_names(a65b12626ec554,[]).
xc_mapping_rows(a65b12626ec554,[]).
xc_exclude_globals(a65b12626ec554,true).
x_grammarRule('x_-mp->a-few-cnp-',x_EATermFn(x_mp,x_TheList(x_var(':DEPSYM'('x_group-of-',V1)),x_arg(V2),x_sem(x_thereExists(':DEPSYM'('x_group-of-',V1),x_and(x_isa(':DEPSYM'('x_group-of-',V1),'x_Set-Mathematical'),x_qualitativeExtent(':DEPSYM'('x_group-of-',V1),'x_AFew-Quant'),x_forAll(V3,x_implies(x_member(V3,':DEPSYM'('x_group-of-',V3)),V4))))))),x_TheList(x_EATermFn(x_Noun,x_TheList(x_lex('x_a-few'))),x_EAHeadFn(x_EATermFn(x_cnp,x_TheList(x_unit('x_+'),x_var(V1),x_agr(V2),x_sem(V4)))))) :- x_cid(a65b12626ec555,V1,V2,V3,V4).
xc_microtheory(a65b12626ec555,x_EANulexGrammarMt).
xc_source_file(a65b12626ec555,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec555,92).
xc_kb_names(a65b12626ec555,["?varcnp","?a","?varcnp","?semcnp"]).
xc_mapping_rows(a65b12626ec555,[]).
xc_exclude_globals(a65b12626ec555,true).
x_isa('x_-mp->adv-mp',x_EAGrammarRule) :- x_cid(a65b12626ec556).
xc_microtheory(a65b12626ec556,x_EANulexGrammarMt).
xc_source_file(a65b12626ec556,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec556,110).
xc_kb_names(a65b12626ec556,[]).
xc_mapping_rows(a65b12626ec556,[]).
xc_exclude_globals(a65b12626ec556,true).
x_comment('x_-mp->adv-mp',"Approximate measure phrases e.g. 'about 600 miles' (JLT)") :- x_cid(a65b12626ec557).
xc_microtheory(a65b12626ec557,x_EANulexGrammarMt).
xc_source_file(a65b12626ec557,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec557,111).
xc_kb_names(a65b12626ec557,[]).
xc_mapping_rows(a65b12626ec557,[]).
xc_exclude_globals(a65b12626ec557,true).
x_probabilityEAGrammarRule('x_-mp->adv-mp',1.0) :- x_cid(a65b12626ec558).
xc_microtheory(a65b12626ec558,x_EANulexGrammarMt).
xc_source_file(a65b12626ec558,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec558,112).
xc_kb_names(a65b12626ec558,[]).
xc_mapping_rows(a65b12626ec558,[]).
xc_exclude_globals(a65b12626ec558,true).
x_grammarRule('x_-mp->adv-mp',x_EATermFn(x_mp,x_TheList(x_var(V1),x_agr(V2),x_sem(V3))),x_TheList(x_EATermFn(x_Adverb,x_TheList(x_var(V4),x_sem(V5))),x_EATermFn(x_mp,x_TheList(x_var(V1),x_sem(V3),x_agr(V2))))) :- x_cid(a65b12626ec559,V1,V2,V3,V4,V5).
xc_microtheory(a65b12626ec559,x_EANulexGrammarMt).
xc_source_file(a65b12626ec559,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec559,113).
xc_kb_names(a65b12626ec559,["?varmp","?a","?semmp","?vara","?sema"]).
xc_mapping_rows(a65b12626ec559,[]).
xc_exclude_globals(a65b12626ec559,true).
x_isa('x_-adjp->mp-adj-',x_EAGrammarRule) :- x_cid(a65b12626ec55a).
xc_microtheory(a65b12626ec55a,x_EANulexGrammarMt).
xc_source_file(a65b12626ec55a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec55a,118).
xc_kb_names(a65b12626ec55a,[]).
xc_mapping_rows(a65b12626ec55a,[]).
xc_exclude_globals(a65b12626ec55a,true).
x_comment('x_-adjp->mp-adj-',"'13 years old', '2 inches long'") :- x_cid(a65b12626ec55b).
xc_microtheory(a65b12626ec55b,x_EANulexGrammarMt).
xc_source_file(a65b12626ec55b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec55b,119).
xc_kb_names(a65b12626ec55b,[]).
xc_mapping_rows(a65b12626ec55b,[]).
xc_exclude_globals(a65b12626ec55b,true).
x_probabilityEAGrammarRule('x_-adjp->mp-adj-',1.0) :- x_cid(a65b12626ec55c).
xc_microtheory(a65b12626ec55c,x_EANulexGrammarMt).
xc_source_file(a65b12626ec55c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec55c,120).
xc_kb_names(a65b12626ec55c,[]).
xc_mapping_rows(a65b12626ec55c,[]).
xc_exclude_globals(a65b12626ec55c,true).
x_grammarRule('x_-adjp->mp-adj-',x_EATermFn(x_adjp,x_TheList(x_var(V1),':MEASURE'(V2),x_sem(V3))),x_TheList(x_EATermFn(x_mp,x_TheList(x_var(V1),x_sem(V2))),x_EAHeadFn(x_EATermFn(x_Adjective,x_TheList(x_var(V4),x_sem(V3)))))) :- x_cid(a65b12626ec55d,V1,V2,V3,V4).
xc_microtheory(a65b12626ec55d,x_EANulexGrammarMt).
xc_source_file(a65b12626ec55d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/mp.krf').
xc_source_line(a65b12626ec55d,121).
xc_kb_names(a65b12626ec55d,["?varmp","?semmp","?sema","?vara"]).
xc_mapping_rows(a65b12626ec55d,[]).
xc_exclude_globals(a65b12626ec55d,true).
kb_cache_footer(footer{count:23,digest:abd77c1c2594ffedcb4dae868690f3153fcb33dc8459132a43b7272b186a4faf,headerDigest:'5290bfb863191c4392890ad12e59da47cd152b844127c6b12bd1a75e9f1bdd42'}).
