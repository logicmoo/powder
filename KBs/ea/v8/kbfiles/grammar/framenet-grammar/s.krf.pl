:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:27,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:110,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:c174180e1bd3bad4e1de1f32bf6128f0c3b0a700b7e3d91ff53d8d24eb57a345,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3938,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf',sourceHash:'98749b6956ccbb080c8cf5b3d1d7823ef29735742cb0bc531a92278243230eed',warnings:[]}).
x_EAHeadFeaturesForNodeType(x_aux,x_TheList(x_agr)) :- x_cid(a65b12627f37b1).
xc_microtheory(a65b12627f37b1,x_EANulexGrammarMt).
xc_source_file(a65b12627f37b1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37b1,15).
xc_kb_names(a65b12627f37b1,[]).
xc_mapping_rows(a65b12627f37b1,[]).
xc_exclude_globals(a65b12627f37b1,true).
x_isa('x_-s->slp-stype-',x_EAGrammarRule) :- x_cid(a65b12627f37b2).
xc_microtheory(a65b12627f37b2,x_EANulexGrammarMt).
xc_source_file(a65b12627f37b2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37b2,25).
xc_kb_names(a65b12627f37b2,[]).
xc_mapping_rows(a65b12627f37b2,[]).
xc_exclude_globals(a65b12627f37b2,true).
x_comment('x_-s->slp-stype-',"pass up stype from the slp.") :- x_cid(a65b12627f37b3).
xc_microtheory(a65b12627f37b3,x_EANulexGrammarMt).
xc_source_file(a65b12627f37b3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37b3,26).
xc_kb_names(a65b12627f37b3,[]).
xc_mapping_rows(a65b12627f37b3,[]).
xc_exclude_globals(a65b12627f37b3,true).
x_probabilityEAGrammarRule('x_-s->slp-stype-',1.0) :- x_cid(a65b12627f37b4).
xc_microtheory(a65b12627f37b4,x_EANulexGrammarMt).
xc_source_file(a65b12627f37b4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37b4,27).
xc_kb_names(a65b12627f37b4,[]).
xc_mapping_rows(a65b12627f37b4,[]).
xc_exclude_globals(a65b12627f37b4,true).
x_grammarRule('x_-s->slp-stype-',x_EATermFn(x_s,x_TheList(x_var(V1),x_stype(V2),x_sem(V3))),x_TheList(x_EAHeadFn(x_EATermFn(x_slp,x_TheList(x_var(V1),x_sem(V3),x_stype(?('x_!stype','x_-'))))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex(?(x_l,'x_punc-period','x_punc-exclamation-mark','x_punc-question-mark')))))) :- x_cid(a65b12627f37b5,V1,V2,V3).
xc_microtheory(a65b12627f37b5,x_EANulexGrammarMt).
xc_source_file(a65b12627f37b5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37b5,28).
xc_kb_names(a65b12627f37b5,["?vars","?!stype","?sems"]).
xc_mapping_rows(a65b12627f37b5,[]).
xc_exclude_globals(a65b12627f37b5,true).
x_isa('x_-s->Sfin-',x_EAGrammarRule) :- x_cid(a65b12627f37b6).
xc_microtheory(a65b12627f37b6,x_EANulexGrammarMt).
xc_source_file(a65b12627f37b6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37b6,39).
xc_kb_names(a65b12627f37b6,[]).
xc_mapping_rows(a65b12627f37b6,[]).
xc_exclude_globals(a65b12627f37b6,true).
x_comment('x_-s->Sfin-',"An Sfin is by default a declarative.") :- x_cid(a65b12627f37b7).
xc_microtheory(a65b12627f37b7,x_EANulexGrammarMt).
xc_source_file(a65b12627f37b7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37b7,40).
xc_kb_names(a65b12627f37b7,[]).
xc_mapping_rows(a65b12627f37b7,[]).
xc_exclude_globals(a65b12627f37b7,true).
x_probabilityEAGrammarRule('x_-s->Sfin-',1.0) :- x_cid(a65b12627f37b8).
xc_microtheory(a65b12627f37b8,x_EANulexGrammarMt).
xc_source_file(a65b12627f37b8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37b8,41).
xc_kb_names(a65b12627f37b8,[]).
xc_mapping_rows(a65b12627f37b8,[]).
xc_exclude_globals(a65b12627f37b8,true).
x_grammarRule('x_-s->Sfin-',x_EATermFn(x_s,x_TheList(x_var(V1),x_stype(x_DeclarativeUtterance),x_sem(V2))),x_TheList(x_EAHeadFn(x_EATermFn(x_Sfin,x_TheList(x_var(V1),x_sem(V2),x_stype('x_-')))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex(?(x_l,'x_punc-period','x_punc-exclamation-mark')))))) :- x_cid(a65b12627f37b9,V1,V2).
xc_microtheory(a65b12627f37b9,x_EANulexGrammarMt).
xc_source_file(a65b12627f37b9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37b9,42).
xc_kb_names(a65b12627f37b9,["?vars","?sems"]).
xc_mapping_rows(a65b12627f37b9,[]).
xc_exclude_globals(a65b12627f37b9,true).
x_isa('x_-s->slp-declarative-',x_EAGrammarRule) :- x_cid(a65b12627f37ba).
xc_microtheory(a65b12627f37ba,x_EANulexGrammarMt).
xc_source_file(a65b12627f37ba,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37ba,52).
xc_kb_names(a65b12627f37ba,[]).
xc_mapping_rows(a65b12627f37ba,[]).
xc_exclude_globals(a65b12627f37ba,true).
x_comment('x_-s->slp-declarative-',"if the slp doesn't have an stype, use defaults.") :- x_cid(a65b12627f37bb).
xc_microtheory(a65b12627f37bb,x_EANulexGrammarMt).
xc_source_file(a65b12627f37bb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37bb,53).
xc_kb_names(a65b12627f37bb,[]).
xc_mapping_rows(a65b12627f37bb,[]).
xc_exclude_globals(a65b12627f37bb,true).
x_probabilityEAGrammarRule('x_-s->slp-declarative-',1.0) :- x_cid(a65b12627f37bc).
xc_microtheory(a65b12627f37bc,x_EANulexGrammarMt).
xc_source_file(a65b12627f37bc,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37bc,54).
xc_kb_names(a65b12627f37bc,[]).
xc_mapping_rows(a65b12627f37bc,[]).
xc_exclude_globals(a65b12627f37bc,true).
x_grammarRule('x_-s->slp-declarative-',x_EATermFn(x_s,x_TheList(x_var(V1),x_stype(x_DeclarativeUtterance),x_sem(V2))),x_TheList(x_EAHeadFn(x_EATermFn(x_slp,x_TheList(x_var(V1),x_sem(V2),x_stype('x_-')))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex(?(x_l,'x_punc-period','x_punc-exclamation-mark')))))) :- x_cid(a65b12627f37bd,V1,V2).
xc_microtheory(a65b12627f37bd,x_EANulexGrammarMt).
xc_source_file(a65b12627f37bd,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37bd,55).
xc_kb_names(a65b12627f37bd,["?vars","?sems"]).
xc_mapping_rows(a65b12627f37bd,[]).
xc_exclude_globals(a65b12627f37bd,true).
x_isa('x_-s->slp-question-',x_EAGrammarRule) :- x_cid(a65b12627f37be).
xc_microtheory(a65b12627f37be,x_EANulexGrammarMt).
xc_source_file(a65b12627f37be,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37be,65).
xc_kb_names(a65b12627f37be,[]).
xc_mapping_rows(a65b12627f37be,[]).
xc_exclude_globals(a65b12627f37be,true).
x_probabilityEAGrammarRule('x_-s->slp-question-',1.0) :- x_cid(a65b12627f37bf).
xc_microtheory(a65b12627f37bf,x_EANulexGrammarMt).
xc_source_file(a65b12627f37bf,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37bf,66).
xc_kb_names(a65b12627f37bf,[]).
xc_mapping_rows(a65b12627f37bf,[]).
xc_exclude_globals(a65b12627f37bf,true).
x_grammarRule('x_-s->slp-question-',x_EATermFn(x_s,x_TheList(x_var(V1),x_stype(x_InterrogativeUtterance),x_sem(V2))),x_TheList(x_EAHeadFn(x_EATermFn(x_slp,x_TheList(x_var(V1),x_sem(V2),x_stype('x_-')))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-question-mark'))))) :- x_cid(a65b12627f37c0,V1,V2).
xc_microtheory(a65b12627f37c0,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c0,67).
xc_kb_names(a65b12627f37c0,["?vars","?sems"]).
xc_mapping_rows(a65b12627f37c0,[]).
xc_exclude_globals(a65b12627f37c0,true).
x_isa('x_-s->Sfin-question-',x_EAGrammarRule) :- x_cid(a65b12627f37c1).
xc_microtheory(a65b12627f37c1,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c1,76).
xc_kb_names(a65b12627f37c1,[]).
xc_mapping_rows(a65b12627f37c1,[]).
xc_exclude_globals(a65b12627f37c1,true).
x_probabilityEAGrammarRule('x_-s->Sfin-question-',1.0) :- x_cid(a65b12627f37c2).
xc_microtheory(a65b12627f37c2,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c2,77).
xc_kb_names(a65b12627f37c2,[]).
xc_mapping_rows(a65b12627f37c2,[]).
xc_exclude_globals(a65b12627f37c2,true).
x_grammarRule('x_-s->Sfin-question-',x_EATermFn(x_s,x_TheList(x_var(V1),x_stype(x_InterrogativeUtterance),x_sem(V2))),x_TheList(x_EAHeadFn(x_EATermFn(x_Sfin,x_TheList(x_var(V1),x_sem(V2),x_stype('x_-')))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-question-mark'))))) :- x_cid(a65b12627f37c3,V1,V2).
xc_microtheory(a65b12627f37c3,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c3,78).
xc_kb_names(a65b12627f37c3,["?vars","?sems"]).
xc_mapping_rows(a65b12627f37c3,[]).
xc_exclude_globals(a65b12627f37c3,true).
x_isa('x_-s->slp-colon-',x_EAGrammarRule) :- x_cid(a65b12627f37c4).
xc_microtheory(a65b12627f37c4,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c4,87).
xc_kb_names(a65b12627f37c4,[]).
xc_mapping_rows(a65b12627f37c4,[]).
xc_exclude_globals(a65b12627f37c4,true).
x_comment('x_-s->slp-colon-',"no handling for colon/semicolon") :- x_cid(a65b12627f37c5).
xc_microtheory(a65b12627f37c5,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c5,88).
xc_kb_names(a65b12627f37c5,[]).
xc_mapping_rows(a65b12627f37c5,[]).
xc_exclude_globals(a65b12627f37c5,true).
x_probabilityEAGrammarRule('x_-s->slp-colon-',1.0) :- x_cid(a65b12627f37c6).
xc_microtheory(a65b12627f37c6,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c6,89).
xc_kb_names(a65b12627f37c6,[]).
xc_mapping_rows(a65b12627f37c6,[]).
xc_exclude_globals(a65b12627f37c6,true).
x_grammarRule('x_-s->slp-colon-',x_EATermFn(x_s,x_TheList(x_var(V1),x_sem(V2))),x_TheList(x_EAHeadFn(x_EATermFn(x_slp,x_TheList(x_var(V1),x_sem(V2)))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex(?(x_l,'x_punc-colon','x_punc-semicolon')))))) :- x_cid(a65b12627f37c7,V1,V2).
xc_microtheory(a65b12627f37c7,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c7,90).
xc_kb_names(a65b12627f37c7,["?vars","?sems"]).
xc_mapping_rows(a65b12627f37c7,[]).
xc_exclude_globals(a65b12627f37c7,true).
x_isa('x_-s->slp-quoted-',x_EAGrammarRule) :- x_cid(a65b12627f37c8).
xc_microtheory(a65b12627f37c8,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c8,97).
xc_kb_names(a65b12627f37c8,[]).
xc_mapping_rows(a65b12627f37c8,[]).
xc_exclude_globals(a65b12627f37c8,true).
x_comment('x_-s->slp-quoted-',"quoted text can have the punctuation inside") :- x_cid(a65b12627f37c9).
xc_microtheory(a65b12627f37c9,x_EANulexGrammarMt).
xc_source_file(a65b12627f37c9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37c9,98).
xc_kb_names(a65b12627f37c9,[]).
xc_mapping_rows(a65b12627f37c9,[]).
xc_exclude_globals(a65b12627f37c9,true).
x_probabilityEAGrammarRule('x_-s->slp-quoted-',1.0) :- x_cid(a65b12627f37ca).
xc_microtheory(a65b12627f37ca,x_EANulexGrammarMt).
xc_source_file(a65b12627f37ca,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37ca,99).
xc_kb_names(a65b12627f37ca,[]).
xc_mapping_rows(a65b12627f37ca,[]).
xc_exclude_globals(a65b12627f37ca,true).
x_grammarRule('x_-s->slp-quoted-',x_EATermFn(x_s,x_TheList(x_var(V1),x_stype(x_DeclarativeUtterance),x_sem(V2))),x_TheList(x_EAHeadFn(x_EATermFn(x_slp,x_TheList(x_var(V1),x_sem(V2),x_utterance('x_+')))))) :- x_cid(a65b12627f37cb,V1,V2).
xc_microtheory(a65b12627f37cb,x_EANulexGrammarMt).
xc_source_file(a65b12627f37cb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/s.krf').
xc_source_line(a65b12627f37cb,100).
xc_kb_names(a65b12627f37cb,["?vars","?sems"]).
xc_mapping_rows(a65b12627f37cb,[]).
xc_exclude_globals(a65b12627f37cb,true).
kb_cache_footer(footer{count:27,digest:c174180e1bd3bad4e1de1f32bf6128f0c3b0a700b7e3d91ff53d8d24eb57a345,headerDigest:'6d12adf1dffd3689cdd3485216281272c33db7cea1a9582a9d4c8666060b12ef'}).
