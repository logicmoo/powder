:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:208,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:1155,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:e1820b4d71ec36e6990296f7d8cd9273f726c0da57037f99d26f67a30ae8c8ee,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:47405,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf',sourceHash:cdb6bbde1abcb7e5fd19714ebe4c8168b0f29a4aa39cf5e83b1ff22ad3af1dbe,warnings:[]}).
x_EAHeadFeaturesForNodeType(x_vp,x_TheList(x_subcat,x_inf,x_lex,'x_object-be')) :- x_cid(a65b12628ef0ee).
xc_microtheory(a65b12628ef0ee,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0ee,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0ee,15).
xc_kb_names(a65b12628ef0ee,[]).
xc_mapping_rows(a65b12628ef0ee,[]).
xc_exclude_globals(a65b12628ef0ee,true).
x_isa('x_-vp->v-',x_EAGrammarRule) :- x_cid(a65b12628ef0ef).
xc_microtheory(a65b12628ef0ef,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0ef,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0ef,32).
xc_kb_names(a65b12628ef0ef,[]).
xc_mapping_rows(a65b12628ef0ef,[]).
xc_exclude_globals(a65b12628ef0ef,true).
x_comment('x_-vp->v-',"present, past, present participle, past participle: 'eat', 'ate', 'eating', 'eaten'") :- x_cid(a65b12628ef0f0).
xc_microtheory(a65b12628ef0f0,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f0,33).
xc_kb_names(a65b12628ef0f0,[]).
xc_mapping_rows(a65b12628ef0f0,[]).
xc_exclude_globals(a65b12628ef0f0,true).
x_probabilityEAGrammarRule('x_-vp->v-',1.0) :- x_cid(a65b12628ef0f1).
xc_microtheory(a65b12628ef0f1,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f1,34).
xc_kb_names(a65b12628ef0f1,[]).
xc_mapping_rows(a65b12628ef0f1,[]).
xc_exclude_globals(a65b12628ef0f1,true).
x_grammarRule('x_-vp->v-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_mwp('x_-'),x_intrans('x_+'),':ACTION'(V3),x_sem(x_thereExists(V4,V5)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_lex(?('x_!l',x_will)),x_agr(V1),x_vform(?(x_vform,x_pres,x_past,x_prespart,x_pastpart)),x_mwp('x_-'),x_var(V3),x_sem(V5)))))) :- x_cid(a65b12628ef0f2,V1,V2,V3,V4,V5).
xc_microtheory(a65b12628ef0f2,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f2,35).
xc_kb_names(a65b12628ef0f2,["?a","?vform","?varv","?varv","?semv"]).
xc_mapping_rows(a65b12628ef0f2,[]).
xc_exclude_globals(a65b12628ef0f2,true).
x_isa('x_-vp->mwpv-',x_EAGrammarRule) :- x_cid(a65b12628ef0f3).
xc_microtheory(a65b12628ef0f3,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f3,46).
xc_kb_names(a65b12628ef0f3,[]).
xc_mapping_rows(a65b12628ef0f3,[]).
xc_exclude_globals(a65b12628ef0f3,true).
x_comment('x_-vp->mwpv-',"like -vp->v- except supports multiword phrases, which won't have vforms or agreement.") :- x_cid(a65b12628ef0f4).
xc_microtheory(a65b12628ef0f4,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f4,47).
xc_kb_names(a65b12628ef0f4,[]).
xc_mapping_rows(a65b12628ef0f4,[]).
xc_exclude_globals(a65b12628ef0f4,true).
x_probabilityEAGrammarRule('x_-vp->mwpv-',1.0) :- x_cid(a65b12628ef0f5).
xc_microtheory(a65b12628ef0f5,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f5,48).
xc_kb_names(a65b12628ef0f5,[]).
xc_mapping_rows(a65b12628ef0f5,[]).
xc_exclude_globals(a65b12628ef0f5,true).
x_grammarRule('x_-vp->mwpv-',x_EATermFn(x_vp,x_TheList(x_agr(?(x_a,x_3s,x_3p)),x_var(V1),x_mwp('x_+'),x_intrans('x_+'),':ACTION'(V1),x_sem(x_thereExists(V2,V3)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_mwp('x_+'),x_var(V1),x_sem(V3)))))) :- x_cid(a65b12628ef0f6,V1,V2,V3).
xc_microtheory(a65b12628ef0f6,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f6,49).
xc_kb_names(a65b12628ef0f6,["?varv","?varv","?semv"]).
xc_mapping_rows(a65b12628ef0f6,[]).
xc_exclude_globals(a65b12628ef0f6,true).
x_isa('x_-vp->v-np-',x_EAGrammarRule) :- x_cid(a65b12628ef0f7).
xc_microtheory(a65b12628ef0f7,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f7,66).
xc_kb_names(a65b12628ef0f7,[]).
xc_mapping_rows(a65b12628ef0f7,[]).
xc_exclude_globals(a65b12628ef0f7,true).
x_comment('x_-vp->v-np-',"verb + direct object 'eat the fruit'") :- x_cid(a65b12628ef0f8).
xc_microtheory(a65b12628ef0f8,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f8,67).
xc_kb_names(a65b12628ef0f8,[]).
xc_mapping_rows(a65b12628ef0f8,[]).
xc_exclude_globals(a65b12628ef0f8,true).
x_probabilityEAGrammarRule('x_-vp->v-np-',1.0) :- x_cid(a65b12628ef0f9).
xc_microtheory(a65b12628ef0f9,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0f9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0f9,68).
xc_kb_names(a65b12628ef0f9,[]).
xc_mapping_rows(a65b12628ef0f9,[]).
xc_exclude_globals(a65b12628ef0f9,true).
x_grammarRule('x_-vp->v-np-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'('x_+'),'x_inv-subject'(V4),':ACTION'(V1),':OBJECT'(V5),x_sem(x_and(V6,V7)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_vform(?(x_vform,x_pres,x_past,x_prespart,x_pastpart)),x_agr(V3),x_var(V1),x_sem(V7),x_subcat(?(x_s,x_np,'x_np-pp','x_part-np')),'x_object-be'('x_-')))),x_EATermFn(x_np,x_TheList(x_var(V5),x_sem(V6),'x_inv-subject'(V4))))) :- x_cid(a65b12628ef0fa,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef0fa,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0fa,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0fa,69).
xc_kb_names(a65b12628ef0fa,["?varv","?vform","?a","?invsub","?varnp","?semnp","?semv"]).
xc_mapping_rows(a65b12628ef0fa,[]).
xc_exclude_globals(a65b12628ef0fa,true).
x_isa('x_-vp->v-nosubcat-np-',x_EAGrammarRule) :- x_cid(a65b12628ef0fb).
xc_microtheory(a65b12628ef0fb,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0fb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0fb,83).
xc_kb_names(a65b12628ef0fb,[]).
xc_mapping_rows(a65b12628ef0fb,[]).
xc_exclude_globals(a65b12628ef0fb,true).
x_comment('x_-vp->v-nosubcat-np-',"verb + direct object '(believe in) reincarnation' handles the case where the verb may be an MWW, and thereby have no subcat.") :- x_cid(a65b12628ef0fc).
xc_microtheory(a65b12628ef0fc,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0fc,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0fc,84).
xc_kb_names(a65b12628ef0fc,[]).
xc_mapping_rows(a65b12628ef0fc,[]).
xc_exclude_globals(a65b12628ef0fc,true).
x_probabilityEAGrammarRule('x_-vp->v-nosubcat-np-',1.0) :- x_cid(a65b12628ef0fd).
xc_microtheory(a65b12628ef0fd,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0fd,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0fd,85).
xc_kb_names(a65b12628ef0fd,[]).
xc_mapping_rows(a65b12628ef0fd,[]).
xc_exclude_globals(a65b12628ef0fd,true).
x_grammarRule('x_-vp->v-nosubcat-np-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(?(x_a,x_1s,x_1p,x_2s,x_2p,x_3s,x_3p)),'x_dir-obj'('x_+'),'x_inv-subject'(V3),':ACTION'(V1),':OBJECT'(V4),x_sem(x_and(V5,V6)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_vform(?('x_!vform',x_base)),x_var(V1),x_sem(V6),x_subcat('x_-'),'x_object-be'('x_-')))),x_EATermFn(x_np,x_TheList(x_var(V4),x_sem(V5),'x_inv-subject'(V3))))) :- x_cid(a65b12628ef0fe,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef0fe,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0fe,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0fe,86).
xc_kb_names(a65b12628ef0fe,["?varv","?!vform","?invsub","?varnp","?semnp","?semv"]).
xc_mapping_rows(a65b12628ef0fe,[]).
xc_exclude_globals(a65b12628ef0fe,true).
x_isa('x_-vp->vbase-np-',x_EAGrammarRule) :- x_cid(a65b12628ef0ff).
xc_microtheory(a65b12628ef0ff,x_EANulexGrammarMt).
xc_source_file(a65b12628ef0ff,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef0ff,107).
xc_kb_names(a65b12628ef0ff,[]).
xc_mapping_rows(a65b12628ef0ff,[]).
xc_exclude_globals(a65b12628ef0ff,true).
x_comment('x_-vp->vbase-np-',"verb + direct object 'eat the fruit'") :- x_cid(a65b12628ef100).
xc_microtheory(a65b12628ef100,x_EANulexGrammarMt).
xc_source_file(a65b12628ef100,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef100,108).
xc_kb_names(a65b12628ef100,[]).
xc_mapping_rows(a65b12628ef100,[]).
xc_exclude_globals(a65b12628ef100,true).
x_probabilityEAGrammarRule('x_-vp->vbase-np-',1.0) :- x_cid(a65b12628ef101).
xc_microtheory(a65b12628ef101,x_EANulexGrammarMt).
xc_source_file(a65b12628ef101,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef101,109).
xc_kb_names(a65b12628ef101,[]).
xc_mapping_rows(a65b12628ef101,[]).
xc_exclude_globals(a65b12628ef101,true).
x_grammarRule('x_-vp->vbase-np-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),'x_dir-obj'('x_+'),'x_inv-subject'(V3),':ACTION'(V1),':OBJECT'(V4),x_sem(x_and(V5,V6)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_vform(?(x_vb,x_base)),x_var(V1),x_sem(V6)))),x_EATermFn(x_np,x_TheList(x_var(V4),x_sem(V5),'x_inv-subject'(V3))))) :- x_cid(a65b12628ef102,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef102,x_EANulexGrammarMt).
xc_source_file(a65b12628ef102,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef102,110).
xc_kb_names(a65b12628ef102,["?varv","?vb","?invsub","?varnp","?semnp","?semv"]).
xc_mapping_rows(a65b12628ef102,[]).
xc_exclude_globals(a65b12628ef102,true).
x_isa('x_-vp->v-np-np-',x_EAGrammarRule) :- x_cid(a65b12628ef103).
xc_microtheory(a65b12628ef103,x_EANulexGrammarMt).
xc_source_file(a65b12628ef103,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef103,124).
xc_kb_names(a65b12628ef103,[]).
xc_mapping_rows(a65b12628ef103,[]).
xc_exclude_globals(a65b12628ef103,true).
x_comment('x_-v->v-np-np-',"Ditransitives take two objects, one direct and one indirect: 'sing you a song', 'teach him a game'") :- x_cid(a65b12628ef104).
xc_microtheory(a65b12628ef104,x_EANulexGrammarMt).
xc_source_file(a65b12628ef104,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef104,125).
xc_kb_names(a65b12628ef104,[]).
xc_mapping_rows(a65b12628ef104,[]).
xc_exclude_globals(a65b12628ef104,true).
x_probabilityEAGrammarRule('x_-vp->v-np-np-',1.0) :- x_cid(a65b12628ef105).
xc_microtheory(a65b12628ef105,x_EANulexGrammarMt).
xc_source_file(a65b12628ef105,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef105,126).
xc_kb_names(a65b12628ef105,[]).
xc_mapping_rows(a65b12628ef105,[]).
xc_exclude_globals(a65b12628ef105,true).
x_grammarRule('x_-vp->v-np-np-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'('x_+'),':ACTION'(V1),':OBJECT'(V4),':OBLIQUE-OBJECT'(V5),':NOUN'(':SUBJECT'),x_sem(x_and(V6,V7,V8)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_subcat(?(x_s,'x_np-pp','x_np-pp-pp','x_np-np-pp','x_np-dative-np')),x_vform(?(x_vform,x_pres,x_past,x_prespart,x_pastpart)),x_var(V1),x_agr(V3),x_sem(V6),x_aux('x_-'),x_modal('x_-'),x_negated('x_-')))),x_EATermFn(x_np,x_TheList(x_var(V4),x_sem(V7),x_inf('x_-'),x_ntime1('x_-'))),x_EATermFn(x_np,x_TheList(x_var(V5),x_sem(V8),x_inf('x_-'),x_ntime1('x_-'))))) :- x_cid(a65b12628ef106,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12628ef106,x_EANulexGrammarMt).
xc_source_file(a65b12628ef106,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef106,127).
xc_kb_names(a65b12628ef106,["?varv","?vform","?a","?varnp1","?varnp2","?semv","?semnp1","?semnp2"]).
xc_mapping_rows(a65b12628ef106,[]).
xc_exclude_globals(a65b12628ef106,true).
x_isa('x_-vp->v-np-adjp-',x_EAGrammarRule) :- x_cid(a65b12628ef107).
xc_microtheory(a65b12628ef107,x_EANulexGrammarMt).
xc_source_file(a65b12628ef107,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef107,145).
xc_kb_names(a65b12628ef107,[]).
xc_mapping_rows(a65b12628ef107,[]).
xc_exclude_globals(a65b12628ef107,true).
x_comment('x_-vp->v-np-adjp-',": 'Make me proud', 'Turned it upside-down' 'sanded the wood smooth'") :- x_cid(a65b12628ef108).
xc_microtheory(a65b12628ef108,x_EANulexGrammarMt).
xc_source_file(a65b12628ef108,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef108,146).
xc_kb_names(a65b12628ef108,[]).
xc_mapping_rows(a65b12628ef108,[]).
xc_exclude_globals(a65b12628ef108,true).
x_probabilityEAGrammarRule('x_-vp->v-np-adjp-',1.0) :- x_cid(a65b12628ef109).
xc_microtheory(a65b12628ef109,x_EANulexGrammarMt).
xc_source_file(a65b12628ef109,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef109,147).
xc_kb_names(a65b12628ef109,[]).
xc_mapping_rows(a65b12628ef109,[]).
xc_exclude_globals(a65b12628ef109,true).
x_grammarRule('x_-vp->v-np-adjp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'('x_+'),':ACTION'(V1),':OBJECT'(V4),':NOUN'(':SUBJECT'),x_sem(x_and(V5,V6,V7)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_subcat(?(x_s,'x_np-adj')),x_vform(?(x_vform,x_pres,x_past,x_prespart,x_pastpart)),x_var(V1),x_agr(V3),x_sem(V5),x_aux('x_-'),x_modal('x_-'),x_negated('x_-')))),x_EATermFn(x_np,x_TheList(x_var(V4),x_sem(V6))),x_EATermFn(x_adjp,x_TheList(x_var(V8),x_sem(V7))))) :- x_cid(a65b12628ef10a,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12628ef10a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef10a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef10a,148).
xc_kb_names(a65b12628ef10a,["?varv","?vform","?a","?varnp","?semv","?semnp","?semadjp","?varadjp"]).
xc_mapping_rows(a65b12628ef10a,[]).
xc_exclude_globals(a65b12628ef10a,true).
x_isa('x_-vp->vp-pp-',x_EAGrammarRule) :- x_cid(a65b12628ef10b).
xc_microtheory(a65b12628ef10b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef10b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef10b,181).
xc_kb_names(a65b12628ef10b,[]).
xc_mapping_rows(a65b12628ef10b,[]).
xc_exclude_globals(a65b12628ef10b,true).
x_comment('x_-vp->vp-pp-',"full vp + prep: 'drove the boy to the store'") :- x_cid(a65b12628ef10c).
xc_microtheory(a65b12628ef10c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef10c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef10c,182).
xc_kb_names(a65b12628ef10c,[]).
xc_mapping_rows(a65b12628ef10c,[]).
xc_exclude_globals(a65b12628ef10c,true).
x_probabilityEAGrammarRule('x_-vp->vp-pp-',1.0) :- x_cid(a65b12628ef10d).
xc_microtheory(a65b12628ef10d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef10d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef10d,183).
xc_kb_names(a65b12628ef10d,[]).
xc_mapping_rows(a65b12628ef10d,[]).
xc_exclude_globals(a65b12628ef10d,true).
x_grammarRule('x_-vp->vp-pp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(V4),':ACTION'(V1),':OBLIQUE-OBJECT'(V5),':NOUN'(':SUBJECT'),x_part('x_-'),'x_prep-lex'(V6),x_sem(x_and(V7,V8)))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_subcat(?(x_s,x_pp,'x_np-pp','x_part-pp','x_pp-pp','x_it-pp')),x_vform(V2),x_var(V1),x_agr(V3),x_sem(V7),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_intrans('x_-'),x_inv('x_-'),x_vpinf('x_-'),'x_dir-obj'(?('x_!dir-obj',x_invalid))))),x_EATermFn(x_pp,x_TheList(x_var(V5),x_sem(V8),'x_prep-lex'(?('x_!lexp',x_of)),'x_prep-lex'(V6))))) :- x_cid(a65b12628ef10e,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12628ef10e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef10e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef10e,184).
xc_kb_names(a65b12628ef10e,["?varv","?vform","?a","?!dir-obj","?varpp","?plex","?semv","?sempp"]).
xc_mapping_rows(a65b12628ef10e,[]).
xc_exclude_globals(a65b12628ef10e,true).
x_isa('x_-vp->v-pp-',x_EAGrammarRule) :- x_cid(a65b12628ef10f).
xc_microtheory(a65b12628ef10f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef10f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef10f,203).
xc_kb_names(a65b12628ef10f,[]).
xc_mapping_rows(a65b12628ef10f,[]).
xc_exclude_globals(a65b12628ef10f,true).
x_comment('x_-vp->v-pp-',"vp + prep: 'walked in an orchard'") :- x_cid(a65b12628ef110).
xc_microtheory(a65b12628ef110,x_EANulexGrammarMt).
xc_source_file(a65b12628ef110,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef110,204).
xc_kb_names(a65b12628ef110,[]).
xc_mapping_rows(a65b12628ef110,[]).
xc_exclude_globals(a65b12628ef110,true).
x_probabilityEAGrammarRule('x_-vp->v-pp-',1.0) :- x_cid(a65b12628ef111).
xc_microtheory(a65b12628ef111,x_EANulexGrammarMt).
xc_source_file(a65b12628ef111,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef111,205).
xc_kb_names(a65b12628ef111,[]).
xc_mapping_rows(a65b12628ef111,[]).
xc_exclude_globals(a65b12628ef111,true).
x_grammarRule('x_-vp->v-pp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(V4),':ACTION'(V1),':OBLIQUE-OBJECT'(V5),':NOUN'(':SUBJECT'),'x_prep-lex'(V6),x_sem(x_and(V7,V8)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_subcat(?(x_s,x_pp,x_np,'x_np-pp','x_part-pp','x_pp-pp')),x_vform(V2),x_var(V1),x_agr(V3),x_sem(V7),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-'),x_vpinf('x_-'),'x_dir-obj'(?('x_!dir-obj',x_invalid))))),x_EATermFn(x_pp,x_TheList(x_var(V5),x_sem(V8),'x_prep-lex'(?('x_!lexp',x_of)))))) :- x_cid(a65b12628ef112,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12628ef112,x_EANulexGrammarMt).
xc_source_file(a65b12628ef112,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef112,206).
xc_kb_names(a65b12628ef112,["?varv","?vform","?a","?!dir-obj","?varpp","?!lexp","?semv","?sempp"]).
xc_mapping_rows(a65b12628ef112,[]).
xc_exclude_globals(a65b12628ef112,true).
x_isa('x_-vp->v-of-',x_EAGrammarRule) :- x_cid(a65b12628ef113).
xc_microtheory(a65b12628ef113,x_EANulexGrammarMt).
xc_source_file(a65b12628ef113,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef113,221).
xc_kb_names(a65b12628ef113,[]).
xc_mapping_rows(a65b12628ef113,[]).
xc_exclude_globals(a65b12628ef113,true).
x_comment('x_-vp->v-of-',"full vp + of: 'he learned of the war', 'think of it', 'heard of him'") :- x_cid(a65b12628ef114).
xc_microtheory(a65b12628ef114,x_EANulexGrammarMt).
xc_source_file(a65b12628ef114,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef114,222).
xc_kb_names(a65b12628ef114,[]).
xc_mapping_rows(a65b12628ef114,[]).
xc_exclude_globals(a65b12628ef114,true).
x_probabilityEAGrammarRule('x_-vp->v-of-',1.0) :- x_cid(a65b12628ef115).
xc_microtheory(a65b12628ef115,x_EANulexGrammarMt).
xc_source_file(a65b12628ef115,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef115,223).
xc_kb_names(a65b12628ef115,[]).
xc_mapping_rows(a65b12628ef115,[]).
xc_exclude_globals(a65b12628ef115,true).
x_grammarRule('x_-vp->v-of-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(V4),':ACTION'(V1),':OBLIQUE-OBJECT'(V5),':NOUN'(':SUBJECT'),x_part('x_-'),'x_prep-lex'(V6),x_sem(x_and(V7,V8)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_vform(V2),x_subcat(?(x_s,'x_of-pp')),x_var(V1),x_agr(V3),x_sem(V7),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-'),x_vpinf('x_-'),'x_dir-obj'(?('x_!dir-obj',x_invalid))))),x_EATermFn(x_pp,x_TheList(x_var(V5),x_sem(V8),'x_prep-lex'(?(x_plex,x_of)))))) :- x_cid(a65b12628ef116,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12628ef116,x_EANulexGrammarMt).
xc_source_file(a65b12628ef116,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef116,224).
xc_kb_names(a65b12628ef116,["?varv","?vform","?a","?!dir-obj","?varpp","?plex","?semv","?sempp"]).
xc_mapping_rows(a65b12628ef116,[]).
xc_exclude_globals(a65b12628ef116,true).
x_isa('x_-vp->advp-vp-',x_EAGrammarRule) :- x_cid(a65b12628ef117).
xc_microtheory(a65b12628ef117,x_EANulexGrammarMt).
xc_source_file(a65b12628ef117,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef117,245).
xc_kb_names(a65b12628ef117,[]).
xc_mapping_rows(a65b12628ef117,[]).
xc_exclude_globals(a65b12628ef117,true).
x_comment('x_-vp->advp-vp-',"advp + vp 'quickly ran to the store'") :- x_cid(a65b12628ef118).
xc_microtheory(a65b12628ef118,x_EANulexGrammarMt).
xc_source_file(a65b12628ef118,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef118,246).
xc_kb_names(a65b12628ef118,[]).
xc_mapping_rows(a65b12628ef118,[]).
xc_exclude_globals(a65b12628ef118,true).
x_probabilityEAGrammarRule('x_-vp->advp-vp-',1.0) :- x_cid(a65b12628ef119).
xc_microtheory(a65b12628ef119,x_EANulexGrammarMt).
xc_source_file(a65b12628ef119,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef119,247).
xc_kb_names(a65b12628ef119,[]).
xc_mapping_rows(a65b12628ef119,[]).
xc_exclude_globals(a65b12628ef119,true).
x_grammarRule('x_-vp->advp-vp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),':ACTION'(V3),':NOUN'(':SUBJECT'),x_preavp('x_+'),x_sem(x_and(V4,V5)))),x_TheList(x_EATermFn(x_advp,x_TheList(x_sem(V4),x_lex(?('x_!advl',x_not,x_never)))),x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_lex(?('x_!l',x_will)),x_agr(V1),x_vform(?(x_vform,x_base,x_pres,x_past,x_prespart,x_pastpart)),x_var(V3),x_preavp('x_-'),x_sem(V5),x_lex(?('x_!advlex',x_when,x_where,x_how))))))) :- x_cid(a65b12628ef11a,V1,V2,V3,V4,V5).
xc_microtheory(a65b12628ef11a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef11a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef11a,248).
xc_kb_names(a65b12628ef11a,["?a","?vform","?varv","?sema","?semv"]).
xc_mapping_rows(a65b12628ef11a,[]).
xc_exclude_globals(a65b12628ef11a,true).
x_isa('x_-vp->vp-advp-',x_EAGrammarRule) :- x_cid(a65b12628ef11b).
xc_microtheory(a65b12628ef11b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef11b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef11b,265).
xc_kb_names(a65b12628ef11b,[]).
xc_mapping_rows(a65b12628ef11b,[]).
xc_exclude_globals(a65b12628ef11b,true).
x_comment('x_-vp->vp-advp-',"verb + advp 'wrote very quickly' We want to suppress this if the verb is a linking verb (ie, 'be') TRH changed this from a rule that only took a lexical verb to one taking a verb phrase.") :- x_cid(a65b12628ef11c).
xc_microtheory(a65b12628ef11c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef11c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef11c,266).
xc_kb_names(a65b12628ef11c,[]).
xc_mapping_rows(a65b12628ef11c,[]).
xc_exclude_globals(a65b12628ef11c,true).
x_probabilityEAGrammarRule('x_-vp->vp-advp-',1.0) :- x_cid(a65b12628ef11d).
xc_microtheory(a65b12628ef11d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef11d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef11d,267).
xc_kb_names(a65b12628ef11d,[]).
xc_mapping_rows(a65b12628ef11d,[]).
xc_exclude_globals(a65b12628ef11d,true).
x_grammarRule('x_-vp->vp-advp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),':ACTION'(V3),':NOUN'(':SUBJECT'),x_postavp('x_+'),x_sem(x_thereExists(V4,x_and(V5,V6))))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_modal('x_-'),x_agr(V1),x_link('x_-'),x_vform(?(x_vform,x_base,x_pres,x_past,x_prespart,x_pastpart)),x_var(V3),x_postavp('x_-'),x_sem(V6)))),x_EATermFn(x_advp,x_TheList(x_sem(V5),x_lex(?('x_!advlex',x_when,x_where,x_how)))))) :- x_cid(a65b12628ef11e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef11e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef11e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef11e,268).
xc_kb_names(a65b12628ef11e,["?a","?vform","?varv","?varv","?sema","?semv"]).
xc_mapping_rows(a65b12628ef11e,[]).
xc_exclude_globals(a65b12628ef11e,true).
x_isa('x_-vp->v-particle-',x_EAGrammarRule) :- x_cid(a65b12628ef11f).
xc_microtheory(a65b12628ef11f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef11f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef11f,298).
xc_kb_names(a65b12628ef11f,[]).
xc_mapping_rows(a65b12628ef11f,[]).
xc_exclude_globals(a65b12628ef11f,true).
x_comment('x_-vp->v-particle-',"v + prep: 'what did he [run into]?'") :- x_cid(a65b12628ef120).
xc_microtheory(a65b12628ef120,x_EANulexGrammarMt).
xc_source_file(a65b12628ef120,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef120,299).
xc_kb_names(a65b12628ef120,[]).
xc_mapping_rows(a65b12628ef120,[]).
xc_exclude_globals(a65b12628ef120,true).
x_probabilityEAGrammarRule('x_-vp->v-particle-',1.0) :- x_cid(a65b12628ef121).
xc_microtheory(a65b12628ef121,x_EANulexGrammarMt).
xc_source_file(a65b12628ef121,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef121,300).
xc_kb_names(a65b12628ef121,[]).
xc_mapping_rows(a65b12628ef121,[]).
xc_exclude_globals(a65b12628ef121,true).
x_grammarRule('x_-vp->v-particle-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),x_ACTION(V1),':NOUN'(':SUBJECT'),':POSSESSOR'(':NOUN'),'x_prep-lex'(V4),x_sem(x_and(V5,V6)),x_part('x_+'))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_subcat(?(x_s,x_pp,x_np,'x_np-pp','x_part-pp','x_pp-pp','x_it-pp')),x_vform(V2),x_var(V1),x_agr(V3),x_sem(V5),x_aux('x_-'),x_modal('x_-')))),x_EATermFn(x_Preposition,x_TheList(x_var(V7),x_sem(V6),x_lex(V4))))) :- x_cid(a65b12628ef122,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef122,x_EANulexGrammarMt).
xc_source_file(a65b12628ef122,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef122,301).
xc_kb_names(a65b12628ef122,["?varv","?vform","?a","?prep-lex","?semv","?semp","?varp"]).
xc_mapping_rows(a65b12628ef122,[]).
xc_exclude_globals(a65b12628ef122,true).
x_isa('x_-vp->v-advpart-',x_EAGrammarRule) :- x_cid(a65b12628ef123).
xc_microtheory(a65b12628ef123,x_EANulexGrammarMt).
xc_source_file(a65b12628ef123,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef123,316).
xc_kb_names(a65b12628ef123,[]).
xc_mapping_rows(a65b12628ef123,[]).
xc_exclude_globals(a65b12628ef123,true).
x_comment('x_-vp->v-advpart-',"verb + advpart: 'went up', 'looked down'") :- x_cid(a65b12628ef124).
xc_microtheory(a65b12628ef124,x_EANulexGrammarMt).
xc_source_file(a65b12628ef124,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef124,317).
xc_kb_names(a65b12628ef124,[]).
xc_mapping_rows(a65b12628ef124,[]).
xc_exclude_globals(a65b12628ef124,true).
x_probabilityEAGrammarRule('x_-vp->v-advpart-',0.8) :- x_cid(a65b12628ef125).
xc_microtheory(a65b12628ef125,x_EANulexGrammarMt).
xc_source_file(a65b12628ef125,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef125,318).
xc_kb_names(a65b12628ef125,[]).
xc_mapping_rows(a65b12628ef125,[]).
xc_exclude_globals(a65b12628ef125,true).
x_grammarRule('x_-vp->v-advpart-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_part('x_+'),x_sem(x_thereExists(V4,x_and(V5,V6))))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_lex(?('x_!l',x_will)),x_agr(V1),x_vform(V2),x_var(V3),x_sem(V6)))),x_EATermFn(x_Adverb,x_TheList(x_sem(V5),x_part('x_+'))))) :- x_cid(a65b12628ef126,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef126,x_EANulexGrammarMt).
xc_source_file(a65b12628ef126,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef126,319).
xc_kb_names(a65b12628ef126,["?a","?vform","?varv","?varv","?sema","?semv"]).
xc_mapping_rows(a65b12628ef126,[]).
xc_exclude_globals(a65b12628ef126,true).
x_isa('x_-vp->v-object-advpart-',x_EAGrammarRule) :- x_cid(a65b12628ef127).
xc_microtheory(a65b12628ef127,x_EANulexGrammarMt).
xc_source_file(a65b12628ef127,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef127,334).
xc_kb_names(a65b12628ef127,[]).
xc_mapping_rows(a65b12628ef127,[]).
xc_exclude_globals(a65b12628ef127,true).
x_comment('x_-vp->v-object-advpart-',"verb + direct object + advpart: 'bring the book back'") :- x_cid(a65b12628ef128).
xc_microtheory(a65b12628ef128,x_EANulexGrammarMt).
xc_source_file(a65b12628ef128,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef128,335).
xc_kb_names(a65b12628ef128,[]).
xc_mapping_rows(a65b12628ef128,[]).
xc_exclude_globals(a65b12628ef128,true).
x_probabilityEAGrammarRule('x_-vp->v-object-advpart-',0.9) :- x_cid(a65b12628ef129).
xc_microtheory(a65b12628ef129,x_EANulexGrammarMt).
xc_source_file(a65b12628ef129,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef129,336).
xc_kb_names(a65b12628ef129,[]).
xc_mapping_rows(a65b12628ef129,[]).
xc_exclude_globals(a65b12628ef129,true).
x_grammarRule('x_-vp->v-object-advpart-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),':OBJECT'(V4),x_part('x_+'),x_sem(x_thereExists(x_TheList(V3,V4),x_and(V5,V6,V7))))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_lex(?('x_!l',x_will)),x_agr(V1),x_vform(?(x_vform,x_base,x_pres,x_past,x_prespart,x_pastpart)),'x_object-be'('x_-'),x_var(V3),x_sem(V6)))),x_EATermFn(x_np,x_TheList(x_var(V4),x_sem(V7))),x_EATermFn(x_Adverb,x_TheList(x_sem(V5),x_part('x_+'))))) :- x_cid(a65b12628ef12a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef12a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef12a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef12a,337).
xc_kb_names(a65b12628ef12a,["?a","?vform","?varv","?varnp","?sema","?semv","?semnp"]).
xc_mapping_rows(a65b12628ef12a,[]).
xc_exclude_globals(a65b12628ef12a,true).
x_isa('x_-vp->v-object-be-advpart-',x_EAGrammarRule) :- x_cid(a65b12628ef12b).
xc_microtheory(a65b12628ef12b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef12b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef12b,353).
xc_kb_names(a65b12628ef12b,[]).
xc_mapping_rows(a65b12628ef12b,[]).
xc_exclude_globals(a65b12628ef12b,true).
x_comment('x_-vp->v-object-be-advpart-',"verb + direct object be + advpart 'Is the doctor in?.' (CJM)") :- x_cid(a65b12628ef12c).
xc_microtheory(a65b12628ef12c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef12c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef12c,354).
xc_kb_names(a65b12628ef12c,[]).
xc_mapping_rows(a65b12628ef12c,[]).
xc_exclude_globals(a65b12628ef12c,true).
x_probabilityEAGrammarRule('x_-vp->v-object-be-advpart-',1.0) :- x_cid(a65b12628ef12d).
xc_microtheory(a65b12628ef12d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef12d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef12d,355).
xc_kb_names(a65b12628ef12d,[]).
xc_mapping_rows(a65b12628ef12d,[]).
xc_exclude_globals(a65b12628ef12d,true).
x_grammarRule('x_-vp->v-object-be-advpart-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),':OBJECT'(V4),x_link(V3),x_vbe('x_+'),x_sem(x_thereExists(x_TheList(V3,V4),x_and(V5,V6,V7))))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_lex(?('x_!l',x_will)),x_agr(V1),x_vform(?(x_vform,x_base,x_pres,x_past,x_prespart,x_pastpart)),'x_object-be'('x_+'),x_var(V3),x_sem(V6)))),x_EATermFn(x_np,x_TheList(x_var(V4),x_sem(V7),x_inf('x_-'))),x_EATermFn(x_Adverb,x_TheList(x_sem(V5),x_part('x_+'))))) :- x_cid(a65b12628ef12e,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef12e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef12e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef12e,356).
xc_kb_names(a65b12628ef12e,["?a","?vform","?varv","?varnp","?sema","?semv","?semnp"]).
xc_mapping_rows(a65b12628ef12e,[]).
xc_exclude_globals(a65b12628ef12e,true).
x_isa('x_-vp->vp-mp-',x_EAGrammarRule) :- x_cid(a65b12628ef12f).
xc_microtheory(a65b12628ef12f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef12f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef12f,379).
xc_kb_names(a65b12628ef12f,[]).
xc_mapping_rows(a65b12628ef12f,[]).
xc_exclude_globals(a65b12628ef12f,true).
x_comment('x_-vp->vp-mp-',"vp + direct object (mp) 'move 1 inch/produce 3 food points'") :- x_cid(a65b12628ef130).
xc_microtheory(a65b12628ef130,x_EANulexGrammarMt).
xc_source_file(a65b12628ef130,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef130,380).
xc_kb_names(a65b12628ef130,[]).
xc_mapping_rows(a65b12628ef130,[]).
xc_exclude_globals(a65b12628ef130,true).
x_probabilityEAGrammarRule('x_-vp->vp-mp-',1.0) :- x_cid(a65b12628ef131).
xc_microtheory(a65b12628ef131,x_EANulexGrammarMt).
xc_source_file(a65b12628ef131,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef131,381).
xc_kb_names(a65b12628ef131,[]).
xc_mapping_rows(a65b12628ef131,[]).
xc_exclude_globals(a65b12628ef131,true).
x_grammarRule('x_-vp->vp-mp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'('x_+'),'x_inv-subject'(V4),':ACTION'(V1),':OBJECT'(V5),x_sem(x_and(V6,x_measure(V1,V7))))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(V2),x_agr(V3),x_var(V1),x_sem(V6),x_subcat(?(x_s,x_np,'x_np-pp','x_part-np')),'x_inv-subject'(V4),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-'),'x_dir-obj'('x_-'),x_link('x_-'),'x_prep-lex'('x_-')))),x_EATermFn(x_mp,x_TheList('x_prep-lex'('x_-'),x_var(V5),x_sem(V7))))) :- x_cid(a65b12628ef132,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef132,x_EANulexGrammarMt).
xc_source_file(a65b12628ef132,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef132,382).
xc_kb_names(a65b12628ef132,["?varv","?vform","?a","?invsub","?varmp","?semv","?semmp"]).
xc_mapping_rows(a65b12628ef132,[]).
xc_exclude_globals(a65b12628ef132,true).
x_isa('x_-vp->vp-mp-prep',x_EAGrammarRule) :- x_cid(a65b12628ef133).
xc_microtheory(a65b12628ef133,x_EANulexGrammarMt).
xc_source_file(a65b12628ef133,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef133,398).
xc_kb_names(a65b12628ef133,[]).
xc_mapping_rows(a65b12628ef133,[]).
xc_exclude_globals(a65b12628ef133,true).
x_comment('x_-vp->vp-mp-prep',"vp + direct object (mp) 'move 1 inch/produce 3 food points'") :- x_cid(a65b12628ef134).
xc_microtheory(a65b12628ef134,x_EANulexGrammarMt).
xc_source_file(a65b12628ef134,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef134,399).
xc_kb_names(a65b12628ef134,[]).
xc_mapping_rows(a65b12628ef134,[]).
xc_exclude_globals(a65b12628ef134,true).
x_probabilityEAGrammarRule('x_-vp->vp-mp-prep',1.0) :- x_cid(a65b12628ef135).
xc_microtheory(a65b12628ef135,x_EANulexGrammarMt).
xc_source_file(a65b12628ef135,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef135,400).
xc_kb_names(a65b12628ef135,[]).
xc_mapping_rows(a65b12628ef135,[]).
xc_exclude_globals(a65b12628ef135,true).
x_grammarRule('x_-vp->vp-mp-prep',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'('x_+'),'x_inv-subject'(V4),':ACTION'(V1),':OBJECT'(V5),'x_prep-lex'(x_per),x_sem(x_and(V6,V7)))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(V2),x_agr(V3),x_var(V1),x_sem(V6),x_subcat(?(x_s,x_np,'x_np-pp','x_part-np')),'x_inv-subject'(V4),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-'),'x_dir-obj'('x_-'),x_link('x_-'),'x_prep-lex'('x_-')))),x_EATermFn(x_mp,x_TheList('x_prep-lex'(x_per),x_var(V5),x_sem(V7))))) :- x_cid(a65b12628ef136,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef136,x_EANulexGrammarMt).
xc_source_file(a65b12628ef136,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef136,401).
xc_kb_names(a65b12628ef136,["?varv","?vform","?a","?invsub","?varmp","?semv","?semmp"]).
xc_mapping_rows(a65b12628ef136,[]).
xc_exclude_globals(a65b12628ef136,true).
x_isa('x_-vp->vp-vpto-',x_EAGrammarRule) :- x_cid(a65b12628ef137).
xc_microtheory(a65b12628ef137,x_EANulexGrammarMt).
xc_source_file(a65b12628ef137,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef137,433).
xc_kb_names(a65b12628ef137,[]).
xc_mapping_rows(a65b12628ef137,[]).
xc_exclude_globals(a65b12628ef137,true).
x_comment('x_-vp->vp-vpto-',"vp + to (purpose) + vp (infinitive): 'ate to survive'.  Note: This is *not* a gerund (it doesn't end in ing) There's an implied 'in order to' here, so we'll call it an npimpliedinf, and prohibit the infinitive subcat frame to avoid redundancy with vp->vp-npinf-.") :- x_cid(a65b12628ef138).
xc_microtheory(a65b12628ef138,x_EANulexGrammarMt).
xc_source_file(a65b12628ef138,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef138,434).
xc_kb_names(a65b12628ef138,[]).
xc_mapping_rows(a65b12628ef138,[]).
xc_exclude_globals(a65b12628ef138,true).
x_probabilityEAGrammarRule('x_-vp->vp-vpto-',1.0) :- x_cid(a65b12628ef139).
xc_microtheory(a65b12628ef139,x_EANulexGrammarMt).
xc_source_file(a65b12628ef139,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef139,435).
xc_kb_names(a65b12628ef139,[]).
xc_mapping_rows(a65b12628ef139,[]).
xc_exclude_globals(a65b12628ef139,true).
x_grammarRule('x_-vp->vp-vpto-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(x_invalid),':ACTION'(V1),'x_prep-lex'(x_to),x_sem(x_and(V4,x_purposeInEvent(':SUBJECT',V1,V5))))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(V2),x_var(V1),x_agr(V3),x_sem(V4),x_aux('x_-'),x_modal('x_-'),x_lex(?('x_!l',x_cause,x_make,x_caused,x_made,x_causes,x_makes,x_causing,x_making)),x_negated('x_-'),x_inv('x_-'),'x_dir-obj'(V6),x_vpinf('x_-'),x_link('x_-')))),x_EATermFn(x_VPto,x_TheList(x_var(V7),x_sem(V5))))) :- x_cid(a65b12628ef13a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef13a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef13a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef13a,436).
xc_kb_names(a65b12628ef13a,["?varv","?vform","?a","?semv","?semto","?dir-obj","?varto"]).
xc_mapping_rows(a65b12628ef13a,[]).
xc_exclude_globals(a65b12628ef13a,true).
x_isa('x_-vp->v-np-vpto-',x_EAGrammarRule) :- x_cid(a65b12628ef13b).
xc_microtheory(a65b12628ef13b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef13b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef13b,454).
xc_kb_names(a65b12628ef13b,[]).
xc_mapping_rows(a65b12628ef13b,[]).
xc_exclude_globals(a65b12628ef13b,true).
x_comment('x_-vp->v-np-vpto-',"vp-cause + to (purpose) +DO + vp (infinitive): 'cause the boy to survive'") :- x_cid(a65b12628ef13c).
xc_microtheory(a65b12628ef13c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef13c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef13c,455).
xc_kb_names(a65b12628ef13c,[]).
xc_mapping_rows(a65b12628ef13c,[]).
xc_exclude_globals(a65b12628ef13c,true).
x_probabilityEAGrammarRule('x_-vp->v-np-vpto-',1.0) :- x_cid(a65b12628ef13d).
xc_microtheory(a65b12628ef13d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef13d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef13d,456).
xc_kb_names(a65b12628ef13d,[]).
xc_mapping_rows(a65b12628ef13d,[]).
xc_exclude_globals(a65b12628ef13d,true).
x_grammarRule('x_-vp->v-np-vpto-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(x_invalid),':ACTION'(V1),':SUBJECT'(V4),'x_prep-lex'(x_to),x_sem(x_and(V5,V6,V7)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_vform(V2),x_var(V1),x_agr(V3),x_sem(V5),x_subcat(?(x_s,'x_that-s')),x_aux('x_-'),x_modal('x_-'),x_link('x_-')))),x_EATermFn(x_np,x_TheList(x_var(V4),x_sem(V6),x_agr(V8))),x_EATermFn(x_VPto,x_TheList(x_var(V9),x_sem(V7))))) :- x_cid(a65b12628ef13e,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12628ef13e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef13e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef13e,457).
xc_kb_names(a65b12628ef13e,["?varv","?vform","?a","?varnp","?semv","?semnp","?semto","?na","?varto"]).
xc_mapping_rows(a65b12628ef13e,[]).
xc_exclude_globals(a65b12628ef13e,true).
x_isa('x_-vp->vp-npinf-conditional-',x_EAGrammarRule) :- x_cid(a65b12628ef13f).
xc_microtheory(a65b12628ef13f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef13f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef13f,515).
xc_kb_names(a65b12628ef13f,[]).
xc_mapping_rows(a65b12628ef13f,[]).
xc_exclude_globals(a65b12628ef13f,true).
x_comment('x_-vp->vp-npinf-conditional-',"conditional infinitive: 'promised to help him if he would swim' (note that the promising is not conditional, which would be slp-sconj-slp)") :- x_cid(a65b12628ef140).
xc_microtheory(a65b12628ef140,x_EANulexGrammarMt).
xc_source_file(a65b12628ef140,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef140,516).
xc_kb_names(a65b12628ef140,[]).
xc_mapping_rows(a65b12628ef140,[]).
xc_exclude_globals(a65b12628ef140,true).
x_probabilityEAGrammarRule('x_-vp->vp-npinf-conditional-',1.0) :- x_cid(a65b12628ef141).
xc_microtheory(a65b12628ef141,x_EANulexGrammarMt).
xc_source_file(a65b12628ef141,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef141,517).
xc_kb_names(a65b12628ef141,[]).
xc_mapping_rows(a65b12628ef141,[]).
xc_exclude_globals(a65b12628ef141,true).
x_grammarRule('x_-vp->vp-npinf-conditional-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(x_invalid),x_vpinf('x_+'),':ACTION'(V1),':INF-COMP'(V4),':CLAUSE'(V5),x_sem(V6))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(V2),x_subcat(?(x_sc,'x_to-inf-sc','x_to-inf-rs')),x_agr(V3),x_var(V1),x_sem(V6),'x_dir-obj'('x_-'),x_modal('x_-'),x_vpinf('x_-')))),x_EATermFn(x_np,x_TheList(x_var(V7),x_sem(V4),x_inf('x_+'))),x_EATermFn(x_SubordinatingConjunction,x_TheList(x_lex(x_if))),x_EATermFn(x_slp,x_TheList(x_var(V8),x_sem(V5))))) :- x_cid(a65b12628ef142,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12628ef142,x_EANulexGrammarMt).
xc_source_file(a65b12628ef142,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef142,518).
xc_kb_names(a65b12628ef142,["?varv","?vform","?a","?semnp","?semslp","?semv","?varnp","?varslp"]).
xc_mapping_rows(a65b12628ef142,[]).
xc_exclude_globals(a65b12628ef142,true).
x_isa('x_-vp->vp-that-slp-',x_EAGrammarRule) :- x_cid(a65b12628ef143).
xc_microtheory(a65b12628ef143,x_EANulexGrammarMt).
xc_source_file(a65b12628ef143,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef143,536).
xc_kb_names(a65b12628ef143,[]).
xc_mapping_rows(a65b12628ef143,[]).
xc_exclude_globals(a65b12628ef143,true).
x_comment('x_-vp->vp-that-slp-',"parenthetical vp + that + slp: 'He believes that John ate the cake.'") :- x_cid(a65b12628ef144).
xc_microtheory(a65b12628ef144,x_EANulexGrammarMt).
xc_source_file(a65b12628ef144,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef144,537).
xc_kb_names(a65b12628ef144,[]).
xc_mapping_rows(a65b12628ef144,[]).
xc_exclude_globals(a65b12628ef144,true).
x_probabilityEAGrammarRule('x_-vp->vp-that-slp-',0.9) :- x_cid(a65b12628ef145).
xc_microtheory(a65b12628ef145,x_EANulexGrammarMt).
xc_source_file(a65b12628ef145,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef145,538).
xc_kb_names(a65b12628ef145,[]).
xc_mapping_rows(a65b12628ef145,[]).
xc_exclude_globals(a65b12628ef145,true).
x_grammarRule('x_-vp->vp-that-slp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(x_invalid),':ACTION'(V1),':CLAUSE'(V4),x_sem(V5))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(V2),x_var(V1),x_agr(V3),x_sem(V5),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-')))),x_EATermFn(x_SubordinatingConjunction,x_TheList(x_lex(x_that))),x_EATermFn(x_slp,x_TheList(x_var(V6),x_sem(V4))))) :- x_cid(a65b12628ef146,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef146,x_EANulexGrammarMt).
xc_source_file(a65b12628ef146,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef146,539).
xc_kb_names(a65b12628ef146,["?varvp","?vform","?a","?semslp","?semvp","?varslp"]).
xc_mapping_rows(a65b12628ef146,[]).
xc_exclude_globals(a65b12628ef146,true).
x_isa('x_-vp->vp-vpinv-',x_EAGrammarRule) :- x_cid(a65b12628ef147).
xc_microtheory(a65b12628ef147,x_EANulexGrammarMt).
xc_source_file(a65b12628ef147,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef147,553).
xc_kb_names(a65b12628ef147,[]).
xc_mapping_rows(a65b12628ef147,[]).
xc_exclude_globals(a65b12628ef147,true).
x_comment('x_-vp->vp-vpinv-',"parenthetical vp + inv 'saw the dog running'") :- x_cid(a65b12628ef148).
xc_microtheory(a65b12628ef148,x_EANulexGrammarMt).
xc_source_file(a65b12628ef148,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef148,554).
xc_kb_names(a65b12628ef148,[]).
xc_mapping_rows(a65b12628ef148,[]).
xc_exclude_globals(a65b12628ef148,true).
x_probabilityEAGrammarRule('x_-vp->vp-vpinv-',1.0) :- x_cid(a65b12628ef149).
xc_microtheory(a65b12628ef149,x_EANulexGrammarMt).
xc_source_file(a65b12628ef149,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef149,555).
xc_kb_names(a65b12628ef149,[]).
xc_mapping_rows(a65b12628ef149,[]).
xc_exclude_globals(a65b12628ef149,true).
x_grammarRule('x_-vp->vp-vpinv-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(x_invalid),':ACTION'(V1),':CLAUSE'(V4),x_sem(V5))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(V2),x_var(V1),x_agr(V3),x_sem(V5),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-'),'x_dir-obj'('x_-')))),x_EATermFn(x_vp,x_TheList(x_var(V6),x_sem(V4),x_inv('x_+'))))) :- x_cid(a65b12628ef14a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef14a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef14a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef14a,556).
xc_kb_names(a65b12628ef14a,["?varvp","?vform","?a","?semvp2","?semvp","?varvp2"]).
xc_mapping_rows(a65b12628ef14a,[]).
xc_exclude_globals(a65b12628ef14a,true).
x_isa('x_-vp->vp-if-slp-',x_EAGrammarRule) :- x_cid(a65b12628ef14b).
xc_microtheory(a65b12628ef14b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef14b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef14b,570).
xc_kb_names(a65b12628ef14b,[]).
xc_mapping_rows(a65b12628ef14b,[]).
xc_exclude_globals(a65b12628ef14b,true).
x_comment('x_-vp->vp-if-slp-',"subordinate if-clause 'discover if this is true', 'know if he came by'") :- x_cid(a65b12628ef14c).
xc_microtheory(a65b12628ef14c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef14c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef14c,571).
xc_kb_names(a65b12628ef14c,[]).
xc_mapping_rows(a65b12628ef14c,[]).
xc_exclude_globals(a65b12628ef14c,true).
x_probabilityEAGrammarRule('x_-vp->vp-if-slp-',0.9) :- x_cid(a65b12628ef14d).
xc_microtheory(a65b12628ef14d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef14d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef14d,572).
xc_kb_names(a65b12628ef14d,[]).
xc_mapping_rows(a65b12628ef14d,[]).
xc_exclude_globals(a65b12628ef14d,true).
x_grammarRule('x_-vp->vp-if-slp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(x_invalid),':ACTION'(V1),':CLAUSE'(V4),x_sem(V5))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(V2),x_var(V1),x_agr(V3),x_sem(V5),x_subcat('x_pp-how-to-inf'),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-')))),x_EATermFn(x_SubordinatingConjunction,x_TheList(x_lex(x_if))),x_EATermFn(x_slp,x_TheList(x_var(V6),x_sem(V4))))) :- x_cid(a65b12628ef14e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef14e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef14e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef14e,573).
xc_kb_names(a65b12628ef14e,["?varvp","?vform","?a","?semslp","?semvp","?varslp"]).
xc_mapping_rows(a65b12628ef14e,[]).
xc_exclude_globals(a65b12628ef14e,true).
x_isa('x_-vp->aux-vp-',x_EAGrammarRule) :- x_cid(a65b12628ef14f).
xc_microtheory(a65b12628ef14f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef14f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef14f,602).
xc_kb_names(a65b12628ef14f,[]).
xc_mapping_rows(a65b12628ef14f,[]).
xc_exclude_globals(a65b12628ef14f,true).
x_comment('x_-vp->aux-vp-',"perfect aspect: 'have eaten', 'being run', 'have not been eating', 'were being followed', 'is hurt'") :- x_cid(a65b12628ef150).
xc_microtheory(a65b12628ef150,x_EANulexGrammarMt).
xc_source_file(a65b12628ef150,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef150,603).
xc_kb_names(a65b12628ef150,[]).
xc_mapping_rows(a65b12628ef150,[]).
xc_exclude_globals(a65b12628ef150,true).
x_probabilityEAGrammarRule('x_-vp->aux-vp-',1.0) :- x_cid(a65b12628ef151).
xc_microtheory(a65b12628ef151,x_EANulexGrammarMt).
xc_source_file(a65b12628ef151,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef151,604).
xc_kb_names(a65b12628ef151,[]).
xc_mapping_rows(a65b12628ef151,[]).
xc_exclude_globals(a65b12628ef151,true).
x_grammarRule('x_-vp->aux-vp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_aux('x_+'),x_negated(V4),x_inv(V5),x_perfect('x_+'),x_sem(V6))),x_TheList(x_EATermFn(x_AuxVerb,x_TheList(x_agr(V1),x_vform(?('x_!vform',x_base)),x_sem(V7),x_var(V8),x_modal('x_-'))),x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_var(V3),x_vform(?('x_!vf',x_past,x_pres,x_base)),x_sem(V6),x_negated(V4),x_inv(V5)))),x_EATermFn('x_bind-active-vform',x_TheList('x_aux-vform'(V9),'x_active-vform'(V2))))) :- x_cid(a65b12628ef152,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12628ef152,x_EANulexGrammarMt).
xc_source_file(a65b12628ef152,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef152,605).
xc_kb_names(a65b12628ef152,["?a","?vform","?varv","?neg","?inv","?semv","?semaux","?varaux","?!vform"]).
xc_mapping_rows(a65b12628ef152,[]).
xc_exclude_globals(a65b12628ef152,true).
x_isa('x_-vp->will-vp-',x_EAGrammarRule) :- x_cid(a65b12628ef153).
xc_microtheory(a65b12628ef153,x_EANulexGrammarMt).
xc_source_file(a65b12628ef153,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef153,624).
xc_kb_names(a65b12628ef153,[]).
xc_mapping_rows(a65b12628ef153,[]).
xc_exclude_globals(a65b12628ef153,true).
x_comment('x_-vp->will-vp-',"future tense: 'will eat', 'will be eating', 'will have eaten', 'will have been eating'") :- x_cid(a65b12628ef154).
xc_microtheory(a65b12628ef154,x_EANulexGrammarMt).
xc_source_file(a65b12628ef154,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef154,625).
xc_kb_names(a65b12628ef154,[]).
xc_mapping_rows(a65b12628ef154,[]).
xc_exclude_globals(a65b12628ef154,true).
x_probabilityEAGrammarRule('x_-vp->will-vp-',1.0) :- x_cid(a65b12628ef155).
xc_microtheory(a65b12628ef155,x_EANulexGrammarMt).
xc_source_file(a65b12628ef155,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef155,626).
xc_kb_names(a65b12628ef155,[]).
xc_mapping_rows(a65b12628ef155,[]).
xc_exclude_globals(a65b12628ef155,true).
x_grammarRule('x_-vp->will-vp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(x_future),x_var(V2),x_modal('x_+'),x_negated(V3),x_inv(V4),x_aux('x_+'),x_sem(x_willBe(V5)))),x_TheList(x_EATermFn(x_AuxVerb,x_TheList(x_modal('x_+'),x_lex(x_will),x_agr(V1),x_vform(?(x_vf,x_pres)))),x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(?(x_vf,x_pres)),x_var(V2),x_sem(V5),x_negated(V3),x_inv(V4)))))) :- x_cid(a65b12628ef156,V1,V2,V3,V4,V5).
xc_microtheory(a65b12628ef156,x_EANulexGrammarMt).
xc_source_file(a65b12628ef156,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef156,627).
xc_kb_names(a65b12628ef156,["?a","?varv","?neg","?inv","?semv"]).
xc_mapping_rows(a65b12628ef156,[]).
xc_exclude_globals(a65b12628ef156,true).
x_isa('x_-vp->going-to-vp-',x_EAGrammarRule) :- x_cid(a65b12628ef157).
xc_microtheory(a65b12628ef157,x_EANulexGrammarMt).
xc_source_file(a65b12628ef157,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef157,640).
xc_kb_names(a65b12628ef157,[]).
xc_mapping_rows(a65b12628ef157,[]).
xc_exclude_globals(a65b12628ef157,true).
x_comment('x_-vp->going-to-vp-',"future tense: 'going to eat'") :- x_cid(a65b12628ef158).
xc_microtheory(a65b12628ef158,x_EANulexGrammarMt).
xc_source_file(a65b12628ef158,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef158,641).
xc_kb_names(a65b12628ef158,[]).
xc_mapping_rows(a65b12628ef158,[]).
xc_exclude_globals(a65b12628ef158,true).
x_probabilityEAGrammarRule('x_-vp->going-to-vp-',1.0) :- x_cid(a65b12628ef159).
xc_microtheory(a65b12628ef159,x_EANulexGrammarMt).
xc_source_file(a65b12628ef159,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef159,642).
xc_kb_names(a65b12628ef159,[]).
xc_mapping_rows(a65b12628ef159,[]).
xc_exclude_globals(a65b12628ef159,true).
x_grammarRule('x_-vp->going-to-vp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(?(x_vf1,x_prespart)),x_var(V2),x_modal('x_+'),x_negated(V3),x_inv(V4),x_sem(x_willBe(V5)))),x_TheList(x_EATermFn(x_Verb,x_TheList(x_lex(x_going))),x_EATermFn(x_Preposition,x_TheList(x_lex(x_to))),x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(?(x_vf2,x_pres)),x_var(V2),x_sem(V5),x_negated(V3),x_agr(V1),x_inv(V4)))))) :- x_cid(a65b12628ef15a,V1,V2,V3,V4,V5).
xc_microtheory(a65b12628ef15a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef15a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef15a,643).
xc_kb_names(a65b12628ef15a,["?a","?varv","?neg","?inv","?semv"]).
xc_mapping_rows(a65b12628ef15a,[]).
xc_exclude_globals(a65b12628ef15a,true).
x_isa('x_-vp->not-vp-',x_EAGrammarRule) :- x_cid(a65b12628ef15b).
xc_microtheory(a65b12628ef15b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef15b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef15b,657).
xc_kb_names(a65b12628ef15b,[]).
xc_mapping_rows(a65b12628ef15b,[]).
xc_exclude_globals(a65b12628ef15b,true).
x_comment('x_-vp->not-vp-',"negating a verb: 'He [never saw her again].'") :- x_cid(a65b12628ef15c).
xc_microtheory(a65b12628ef15c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef15c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef15c,658).
xc_kb_names(a65b12628ef15c,[]).
xc_mapping_rows(a65b12628ef15c,[]).
xc_exclude_globals(a65b12628ef15c,true).
x_probabilityEAGrammarRule('x_-vp->not-vp-',1.0) :- x_cid(a65b12628ef15d).
xc_microtheory(a65b12628ef15d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef15d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef15d,659).
xc_kb_names(a65b12628ef15d,[]).
xc_mapping_rows(a65b12628ef15d,[]).
xc_exclude_globals(a65b12628ef15d,true).
x_grammarRule('x_-vp->not-vp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_negated('x_+'),x_sem(V4),x_modal(V5))),x_TheList(x_EATermFn(x_Adverb,x_TheList(x_lex(?(x_l,x_not,x_never)))),x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(V2),x_agr(V1),x_var(V3),x_sem(V4),x_modal(V5)))))) :- x_cid(a65b12628ef15e,V1,V2,V3,V4,V5).
xc_microtheory(a65b12628ef15e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef15e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef15e,660).
xc_kb_names(a65b12628ef15e,["?a","?vform","?varv","?semv","?modal"]).
xc_mapping_rows(a65b12628ef15e,[]).
xc_exclude_globals(a65b12628ef15e,true).
x_isa('x_-vp->modal-vp-',x_EAGrammarRule) :- x_cid(a65b12628ef15f).
xc_microtheory(a65b12628ef15f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef15f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef15f,670).
xc_kb_names(a65b12628ef15f,[]).
xc_mapping_rows(a65b12628ef15f,[]).
xc_exclude_globals(a65b12628ef15f,true).
x_comment('x_-vp->modal-vp-',"case for non-negated vp: 'They [could eat salad].'") :- x_cid(a65b12628ef160).
xc_microtheory(a65b12628ef160,x_EANulexGrammarMt).
xc_source_file(a65b12628ef160,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef160,671).
xc_kb_names(a65b12628ef160,[]).
xc_mapping_rows(a65b12628ef160,[]).
xc_exclude_globals(a65b12628ef160,true).
x_probabilityEAGrammarRule('x_-vp->modal-vp-',1.0) :- x_cid(a65b12628ef161).
xc_microtheory(a65b12628ef161,x_EANulexGrammarMt).
xc_source_file(a65b12628ef161,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef161,672).
xc_kb_names(a65b12628ef161,[]).
xc_mapping_rows(a65b12628ef161,[]).
xc_exclude_globals(a65b12628ef161,true).
x_grammarRule('x_-vp->modal-vp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_modal('x_+'),x_negated('x_-'),x_inv(V4),x_aux('x_+'),x_link(V5),x_sem(x_possible(V6)))),x_TheList(x_EATermFn(x_AuxVerb,x_TheList(x_modal('x_+'),x_lex(?('x_!l',x_did,x_do,x_does,x_will)),x_sem(V7),x_var(V8),x_agr(V1),x_vform(?(x_vform,x_pres,x_past)))),x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(?(x_vf,x_pres)),x_var(V3),x_sem(V6),x_negated('x_-'),x_inv(V4),x_link(V5)))))) :- x_cid(a65b12628ef162,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12628ef162,x_EANulexGrammarMt).
xc_source_file(a65b12628ef162,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef162,673).
xc_kb_names(a65b12628ef162,["?a","?vform","?varv","?inv","?link","?semv","?semaux","?varaux"]).
xc_mapping_rows(a65b12628ef162,[]).
xc_exclude_globals(a65b12628ef162,true).
x_isa('x_-vp->modal-not-vp-',x_EAGrammarRule) :- x_cid(a65b12628ef163).
xc_microtheory(a65b12628ef163,x_EANulexGrammarMt).
xc_source_file(a65b12628ef163,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef163,688).
xc_kb_names(a65b12628ef163,[]).
xc_mapping_rows(a65b12628ef163,[]).
xc_exclude_globals(a65b12628ef163,true).
x_comment('x_-vp->modal-not-vp-',"case for negated vp (need to invert not/modal in the semantics)") :- x_cid(a65b12628ef164).
xc_microtheory(a65b12628ef164,x_EANulexGrammarMt).
xc_source_file(a65b12628ef164,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef164,689).
xc_kb_names(a65b12628ef164,[]).
xc_mapping_rows(a65b12628ef164,[]).
xc_exclude_globals(a65b12628ef164,true).
x_probabilityEAGrammarRule('x_-vp->modal-not-vp-',1.0) :- x_cid(a65b12628ef165).
xc_microtheory(a65b12628ef165,x_EANulexGrammarMt).
xc_source_file(a65b12628ef165,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef165,690).
xc_kb_names(a65b12628ef165,[]).
xc_mapping_rows(a65b12628ef165,[]).
xc_exclude_globals(a65b12628ef165,true).
x_grammarRule('x_-vp->modal-not-vp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_modal('x_+'),x_negated('x_+'),x_inv(V4),x_link(V5),x_sem(x_and(V6,V7)))),x_TheList(x_EATermFn(x_AuxVerb,x_TheList(x_modal('x_+'),x_lex(?('x_!l',x_did,x_do,x_does,x_will)),x_sem(V6),x_var(V8),x_agr(V1),x_vform(V2))),x_EATermFn(x_Adverb,x_TheList(x_lex(?(x_lexadv,x_not,x_never)))),x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(?(x_vf,x_pres)),x_var(V3),x_sem(V7),x_inv(V4),x_link(V5)))))) :- x_cid(a65b12628ef166,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b12628ef166,x_EANulexGrammarMt).
xc_source_file(a65b12628ef166,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef166,691).
xc_kb_names(a65b12628ef166,["?a","?vform","?varv","?inv","?link","?semaux","?semv","?varaux"]).
xc_mapping_rows(a65b12628ef166,[]).
xc_exclude_globals(a65b12628ef166,true).
x_isa('x_-vp->did-vp-',x_EAGrammarRule) :- x_cid(a65b12628ef167).
xc_microtheory(a65b12628ef167,x_EANulexGrammarMt).
xc_source_file(a65b12628ef167,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef167,707).
xc_kb_names(a65b12628ef167,[]).
xc_mapping_rows(a65b12628ef167,[]).
xc_exclude_globals(a65b12628ef167,true).
x_comment('x_-vp->did-vp-',"did/do are empty modals: 'I [did sing]'") :- x_cid(a65b12628ef168).
xc_microtheory(a65b12628ef168,x_EANulexGrammarMt).
xc_source_file(a65b12628ef168,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef168,708).
xc_kb_names(a65b12628ef168,[]).
xc_mapping_rows(a65b12628ef168,[]).
xc_exclude_globals(a65b12628ef168,true).
x_probabilityEAGrammarRule('x_-vp->did-vp-',1.0) :- x_cid(a65b12628ef169).
xc_microtheory(a65b12628ef169,x_EANulexGrammarMt).
xc_source_file(a65b12628ef169,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef169,709).
xc_kb_names(a65b12628ef169,[]).
xc_mapping_rows(a65b12628ef169,[]).
xc_exclude_globals(a65b12628ef169,true).
x_grammarRule('x_-vp->did-vp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_negated(V4),x_inv(V5),x_aux('x_+'),x_sem(V6),':SUBJECT'(V7))),x_TheList(x_EATermFn(x_AuxVerb,x_TheList(x_modal('x_+'),x_lex(?(x_l,x_did,x_do,x_does)),x_vform(?(x_vform,x_past,x_pres)),x_agr(V1))),x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_vform(?(x_vf,x_pres)),x_var(V3),x_sem(V6),':SUBJECT'(V7),x_modal('x_-'),x_negated(V4),x_inv(V5)))))) :- x_cid(a65b12628ef16a,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef16a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef16a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef16a,710).
xc_kb_names(a65b12628ef16a,["?a","?vform","?varv","?neg","?inv","?semv","?varnp"]).
xc_mapping_rows(a65b12628ef16a,[]).
xc_exclude_globals(a65b12628ef16a,true).
x_isa('x_-vp->did-not-',x_EAGrammarRule) :- x_cid(a65b12628ef16b).
xc_microtheory(a65b12628ef16b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef16b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef16b,725).
xc_kb_names(a65b12628ef16b,[]).
xc_mapping_rows(a65b12628ef16b,[]).
xc_exclude_globals(a65b12628ef16b,true).
x_comment('x_-vp->did-not-',"'did not', 'does not' with a verb gap") :- x_cid(a65b12628ef16c).
xc_microtheory(a65b12628ef16c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef16c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef16c,726).
xc_kb_names(a65b12628ef16c,[]).
xc_mapping_rows(a65b12628ef16c,[]).
xc_exclude_globals(a65b12628ef16c,true).
x_probabilityEAGrammarRule('x_-vp->did-not-',1.0) :- x_cid(a65b12628ef16d).
xc_microtheory(a65b12628ef16d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef16d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef16d,727).
xc_kb_names(a65b12628ef16d,[]).
xc_mapping_rows(a65b12628ef16d,[]).
xc_exclude_globals(a65b12628ef16d,true).
x_grammarRule('x_-vp->did-not-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_negated('x_+'),x_aux('x_+'),x_sem(x_thereExists(V4,V5)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_lex(?(x_l,x_did,x_do,x_does)),x_var(V3),x_agr(V1),x_vform(?(x_vform,x_pres,x_past)),x_sem(V5)))),x_EATermFn(x_Adverb,x_TheList(x_lex(x_not))))) :- x_cid(a65b12628ef16e,V1,V2,V3,V4,V5).
xc_microtheory(a65b12628ef16e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef16e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef16e,728).
xc_kb_names(a65b12628ef16e,["?a","?vform","?varv","?varv","?semv"]).
xc_mapping_rows(a65b12628ef16e,[]).
xc_exclude_globals(a65b12628ef16e,true).
x_isa('x_-vp->v-ntime-',x_EAGrammarRule) :- x_cid(a65b12628ef16f).
xc_microtheory(a65b12628ef16f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef16f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef16f,743).
xc_kb_names(a65b12628ef16f,[]).
xc_mapping_rows(a65b12628ef16f,[]).
xc_exclude_globals(a65b12628ef16f,true).
x_comment('x_-vp->v-ntime-',"verb + ntime: 'ate many times', 'went yesterday'") :- x_cid(a65b12628ef170).
xc_microtheory(a65b12628ef170,x_EANulexGrammarMt).
xc_source_file(a65b12628ef170,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef170,744).
xc_kb_names(a65b12628ef170,[]).
xc_mapping_rows(a65b12628ef170,[]).
xc_exclude_globals(a65b12628ef170,true).
x_probabilityEAGrammarRule('x_-vp->v-ntime-',1.0) :- x_cid(a65b12628ef171).
xc_microtheory(a65b12628ef171,x_EANulexGrammarMt).
xc_source_file(a65b12628ef171,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef171,745).
xc_kb_names(a65b12628ef171,[]).
xc_mapping_rows(a65b12628ef171,[]).
xc_exclude_globals(a65b12628ef171,true).
x_grammarRule('x_-vp->v-ntime-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),':ACTION'(V3),':NOUN'(':SUBJECT'),x_sem(x_and(x_thereExists(V4,V5),V6)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_lex(?('x_!l',x_will)),x_agr(V1),'x_object-be'('x_-'),x_vform(?(x_vform,x_base,x_pres,x_past,x_prespart,x_pastpart)),x_var(V3),x_sem(V5)))),x_EATermFn(x_np,x_TheList(x_var(V7),x_sem(V6),x_ntime1('x_+'),x_gap('x_-'))))) :- x_cid(a65b12628ef172,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef172,x_EANulexGrammarMt).
xc_source_file(a65b12628ef172,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef172,746).
xc_kb_names(a65b12628ef172,["?a","?vform","?varv","?varv","?semv","?semnp","?varnp"]).
xc_mapping_rows(a65b12628ef172,[]).
xc_exclude_globals(a65b12628ef172,true).
x_isa('x_-vp->say-slp-',x_EAGrammarRule) :- x_cid(a65b12628ef173).
xc_microtheory(a65b12628ef173,x_EANulexGrammarMt).
xc_source_file(a65b12628ef173,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef173,764).
xc_kb_names(a65b12628ef173,[]).
xc_mapping_rows(a65b12628ef173,[]).
xc_exclude_globals(a65b12628ef173,true).
x_comment('x_-vp->say-slp-',"'said/yelled/whispered/etc _'") :- x_cid(a65b12628ef174).
xc_microtheory(a65b12628ef174,x_EANulexGrammarMt).
xc_source_file(a65b12628ef174,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef174,765).
xc_kb_names(a65b12628ef174,[]).
xc_mapping_rows(a65b12628ef174,[]).
xc_exclude_globals(a65b12628ef174,true).
x_probabilityEAGrammarRule('x_-vp->say-slp-',0.9) :- x_cid(a65b12628ef175).
xc_microtheory(a65b12628ef175,x_EANulexGrammarMt).
xc_source_file(a65b12628ef175,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef175,766).
xc_kb_names(a65b12628ef175,[]).
xc_mapping_rows(a65b12628ef175,[]).
xc_exclude_globals(a65b12628ef175,true).
x_grammarRule('x_-vp->say-slp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(x_invalid),x_comp('x_+'),':ACTION'(V1),':OBLIQUE-OBJECT'(V4),x_sem(V5))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_agr(V3),x_subcat(?('x_np-to-be-adj','x_s-inf','x_that-s')),x_vform(V2),x_var(V1),x_sem(V5),x_aux('x_-'),x_modal('x_-'),x_negated('x_-')))),x_EATermFn(x_Sfin,x_TheList(x_var(V6),x_sem(V4))))) :- x_cid(a65b12628ef176,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef176,x_EANulexGrammarMt).
xc_source_file(a65b12628ef176,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef176,767).
xc_kb_names(a65b12628ef176,["?varvp","?vform","?a","?semslp","?semvp","?varslp"]).
xc_mapping_rows(a65b12628ef176,[]).
xc_exclude_globals(a65b12628ef176,true).
x_isa('x_-vp->say-that-slp-',x_EAGrammarRule) :- x_cid(a65b12628ef177).
xc_microtheory(a65b12628ef177,x_EANulexGrammarMt).
xc_source_file(a65b12628ef177,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef177,781).
xc_kb_names(a65b12628ef177,[]).
xc_mapping_rows(a65b12628ef177,[]).
xc_exclude_globals(a65b12628ef177,true).
x_comment('x_-vp->say-that-slp-',"'said/yelled/whispered/etc that _'") :- x_cid(a65b12628ef178).
xc_microtheory(a65b12628ef178,x_EANulexGrammarMt).
xc_source_file(a65b12628ef178,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef178,782).
xc_kb_names(a65b12628ef178,[]).
xc_mapping_rows(a65b12628ef178,[]).
xc_exclude_globals(a65b12628ef178,true).
x_probabilityEAGrammarRule('x_-vp->say-that-slp-',1.0) :- x_cid(a65b12628ef179).
xc_microtheory(a65b12628ef179,x_EANulexGrammarMt).
xc_source_file(a65b12628ef179,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef179,783).
xc_kb_names(a65b12628ef179,[]).
xc_mapping_rows(a65b12628ef179,[]).
xc_exclude_globals(a65b12628ef179,true).
x_grammarRule('x_-vp->say-that-slp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),'x_dir-obj'(x_invalid),x_comp('x_+'),':ACTION'(V1),':CLAUSE'(V4),x_sem(V5))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_agr(V3),x_subcat(?('x_that-s','x_pp-that-s','x_np-that','x_it-that')),x_vform(V2),x_var(V1),x_sem(V5),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-'),x_comp('x_-')))),x_EATermFn(x_SubordinatingConjunction,x_TheList(x_lex(x_that))),x_EATermFn(x_slp,x_TheList(x_var(V6),x_sem(V4))))) :- x_cid(a65b12628ef17a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef17a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef17a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef17a,784).
xc_kb_names(a65b12628ef17a,["?varvp","?vform","?a","?semslp","?semvp","?varslp"]).
xc_mapping_rows(a65b12628ef17a,[]).
xc_exclude_globals(a65b12628ef17a,true).
x_isa('x_-vp->said-comma-quote-s-quote-',x_EAGrammarRule) :- x_cid(a65b12628ef17b).
xc_microtheory(a65b12628ef17b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef17b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef17b,796).
xc_kb_names(a65b12628ef17b,[]).
xc_mapping_rows(a65b12628ef17b,[]).
xc_exclude_globals(a65b12628ef17b,true).
x_comment('x_-vp->said-comma-quote-s-quote-',"'said/yelled/whispered/etc _'") :- x_cid(a65b12628ef17c).
xc_microtheory(a65b12628ef17c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef17c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef17c,797).
xc_kb_names(a65b12628ef17c,[]).
xc_mapping_rows(a65b12628ef17c,[]).
xc_exclude_globals(a65b12628ef17c,true).
x_probabilityEAGrammarRule('x_-vp->said-comma-quote-s-quote-',1.0) :- x_cid(a65b12628ef17d).
xc_microtheory(a65b12628ef17d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef17d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef17d,798).
xc_kb_names(a65b12628ef17d,[]).
xc_mapping_rows(a65b12628ef17d,[]).
xc_exclude_globals(a65b12628ef17d,true).
x_grammarRule('x_-vp->said-comma-quote-s-quote-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),x_utterance('x_+'),':OBLIQUE-OBJECT'(V4),':ACTION'(V1),x_sem(V5))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_agr(V3),x_vform(?(x_vform,x_pres,x_past,x_future,x_prespart)),x_subcat('x_s-quote'),x_var(V1),x_sem(V5),x_aux('x_-'),x_modal('x_-')))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-comma'))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-double-quote'))),x_EATermFn(x_Sfin,x_TheList(x_sem(V6),x_var(V4))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex(?('x_!lex','x_punc-double-quote','x_punc-comma')))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-double-quote'))))) :- x_cid(a65b12628ef17e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef17e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef17e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef17e,799).
xc_kb_names(a65b12628ef17e,["?varvp","?vform","?a","?svar","?semvp","?sems"]).
xc_mapping_rows(a65b12628ef17e,[]).
xc_exclude_globals(a65b12628ef17e,true).
x_isa('x_-vp->said-np-comma-quote-s-quote-',x_EAGrammarRule) :- x_cid(a65b12628ef17f).
xc_microtheory(a65b12628ef17f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef17f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef17f,814).
xc_kb_names(a65b12628ef17f,[]).
xc_mapping_rows(a65b12628ef17f,[]).
xc_exclude_globals(a65b12628ef17f,true).
x_comment('x_-vp->said-np-comma-quote-s-quote-',"'said/yelled/whispered/etc <recipient> _'") :- x_cid(a65b12628ef180).
xc_microtheory(a65b12628ef180,x_EANulexGrammarMt).
xc_source_file(a65b12628ef180,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef180,815).
xc_kb_names(a65b12628ef180,[]).
xc_mapping_rows(a65b12628ef180,[]).
xc_exclude_globals(a65b12628ef180,true).
x_probabilityEAGrammarRule('x_-vp->said-np-comma-quote-s-quote-',1.0) :- x_cid(a65b12628ef181).
xc_microtheory(a65b12628ef181,x_EANulexGrammarMt).
xc_source_file(a65b12628ef181,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef181,816).
xc_kb_names(a65b12628ef181,[]).
xc_mapping_rows(a65b12628ef181,[]).
xc_exclude_globals(a65b12628ef181,true).
x_grammarRule('x_-vp->said-np-comma-quote-s-quote-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),x_utterance('x_+'),':CLAUSE'(V4),':ACTION'(V1),':OBJECT'(V5),x_sem(x_and(V6,V7)))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_agr(V3),x_subcat('x_s-quote'),x_vform(?(x_vform,x_pres,x_past,x_future,x_prespart)),x_var(V1),x_sem(V7),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-')))),x_EATermFn(x_np,x_TheList(x_var(V5),x_sem(V6))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-comma'))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-double-quote'))),x_EATermFn(x_s,x_TheList(x_sem(V4))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-double-quote'))))) :- x_cid(a65b12628ef182,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef182,x_EANulexGrammarMt).
xc_source_file(a65b12628ef182,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef182,817).
xc_kb_names(a65b12628ef182,["?varvp","?vform","?a","?sems","?varnp","?semnp","?semvp"]).
xc_mapping_rows(a65b12628ef182,[]).
xc_exclude_globals(a65b12628ef182,true).
x_isa('x_-vp->be-adjp-',x_EAGrammarRule) :- x_cid(a65b12628ef183).
xc_microtheory(a65b12628ef183,x_EANulexGrammarMt).
xc_source_file(a65b12628ef183,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef183,855).
xc_kb_names(a65b12628ef183,[]).
xc_mapping_rows(a65b12628ef183,[]).
xc_exclude_globals(a65b12628ef183,true).
x_comment('x_-vp->be-adjp-',"adjective complement modifies the subject: 'is green'.") :- x_cid(a65b12628ef184).
xc_microtheory(a65b12628ef184,x_EANulexGrammarMt).
xc_source_file(a65b12628ef184,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef184,856).
xc_kb_names(a65b12628ef184,[]).
xc_mapping_rows(a65b12628ef184,[]).
xc_exclude_globals(a65b12628ef184,true).
x_probabilityEAGrammarRule('x_-vp->be-adjp-',1.0) :- x_cid(a65b12628ef185).
xc_microtheory(a65b12628ef185,x_EANulexGrammarMt).
xc_source_file(a65b12628ef185,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef185,857).
xc_kb_names(a65b12628ef185,[]).
xc_mapping_rows(a65b12628ef185,[]).
xc_exclude_globals(a65b12628ef185,true).
x_grammarRule('x_-vp->be-adjp-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_link(V3),':NOUN'(':SUBJECT'),':ACTION'(V3),x_sem(x_thereExists(V4,V5)))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),'x_object-be'('x_+'),x_inv('x_-'),x_link('x_-'),x_aux('x_-'),x_negated('x_-')))),x_EATermFn(x_adjp,x_TheList(x_sem(V5),x_var(V6),x_participle('x_-'))))) :- x_cid(a65b12628ef186,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef186,x_EANulexGrammarMt).
xc_source_file(a65b12628ef186,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef186,858).
xc_kb_names(a65b12628ef186,["?a","?vform","?varvp","?varvp","?semadjp","?varadjp"]).
xc_mapping_rows(a65b12628ef186,[]).
xc_exclude_globals(a65b12628ef186,true).
x_isa('x_-vp->be-participle-',x_EAGrammarRule) :- x_cid(a65b12628ef187).
xc_microtheory(a65b12628ef187,x_EANulexGrammarMt).
xc_source_file(a65b12628ef187,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef187,871).
xc_kb_names(a65b12628ef187,[]).
xc_mapping_rows(a65b12628ef187,[]).
xc_exclude_globals(a65b12628ef187,true).
x_comment('x_-vp->be-participle-',"participle becomes head var") :- x_cid(a65b12628ef188).
xc_microtheory(a65b12628ef188,x_EANulexGrammarMt).
xc_source_file(a65b12628ef188,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef188,872).
xc_kb_names(a65b12628ef188,[]).
xc_mapping_rows(a65b12628ef188,[]).
xc_exclude_globals(a65b12628ef188,true).
x_probabilityEAGrammarRule('x_-vp->be-participle-',1.0) :- x_cid(a65b12628ef189).
xc_microtheory(a65b12628ef189,x_EANulexGrammarMt).
xc_source_file(a65b12628ef189,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef189,873).
xc_kb_names(a65b12628ef189,[]).
xc_mapping_rows(a65b12628ef189,[]).
xc_exclude_globals(a65b12628ef189,true).
x_grammarRule('x_-vp->be-participle-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_link(V4),':NOUN'(':SUBJECT'),':ACTION'(V3),x_sem(x_thereExists(V5,V6)))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V4),'x_object-be'('x_+'),x_inv('x_-'),x_link('x_-'),x_modal('x_-'),x_aux('x_-')))),x_EATermFn(x_adjp,x_TheList(x_sem(V6),x_var(V3),x_participle('x_+'))))) :- x_cid(a65b12628ef18a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef18a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef18a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef18a,874).
xc_kb_names(a65b12628ef18a,["?a","?vform","?varadjp","?varvp","?varvp","?semadjp"]).
xc_mapping_rows(a65b12628ef18a,[]).
xc_exclude_globals(a65b12628ef18a,true).
x_isa('x_-vp->be-participle-pass-',x_EAGrammarRule) :- x_cid(a65b12628ef18b).
xc_microtheory(a65b12628ef18b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef18b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef18b,892).
xc_kb_names(a65b12628ef18b,[]).
xc_mapping_rows(a65b12628ef18b,[]).
xc_exclude_globals(a65b12628ef18b,true).
x_comment('x_-vp->be-participle-pass-',"participle becomes head var, passive 'he became tired' 'The crowd turned ugly.'") :- x_cid(a65b12628ef18c).
xc_microtheory(a65b12628ef18c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef18c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef18c,893).
xc_kb_names(a65b12628ef18c,[]).
xc_mapping_rows(a65b12628ef18c,[]).
xc_exclude_globals(a65b12628ef18c,true).
x_probabilityEAGrammarRule('x_-vp->be-participle-pass-',1.0) :- x_cid(a65b12628ef18d).
xc_microtheory(a65b12628ef18d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef18d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef18d,894).
xc_kb_names(a65b12628ef18d,[]).
xc_mapping_rows(a65b12628ef18d,[]).
xc_exclude_globals(a65b12628ef18d,true).
x_grammarRule('x_-vp->be-participle-pass-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_link(V4),':NOUN'(':SUBJECT'),':ACTION'(V3),x_sem(x_thereExists(V5,V6)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_agr(V1),x_vform(V2),x_var(V4),x_subcat(x_adj)))),x_EATermFn(x_adjp,x_TheList(x_sem(V6),x_var(V3),x_participle('x_+'))))) :- x_cid(a65b12628ef18e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef18e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef18e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef18e,895).
xc_kb_names(a65b12628ef18e,["?a","?vform","?varadjp","?varvp","?varvp","?semadjp"]).
xc_mapping_rows(a65b12628ef18e,[]).
xc_exclude_globals(a65b12628ef18e,true).
x_isa('x_-vp->verb-participle-adj-pass-',x_EAGrammarRule) :- x_cid(a65b12628ef18f).
xc_microtheory(a65b12628ef18f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef18f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef18f,910).
xc_kb_names(a65b12628ef18f,[]).
xc_mapping_rows(a65b12628ef18f,[]).
xc_exclude_globals(a65b12628ef18f,true).
x_comment('x_-vp->verb-participle-adj-pass-',"participle, directly from adjective sense, becomes the head var, passive 'I grew impatient'") :- x_cid(a65b12628ef190).
xc_microtheory(a65b12628ef190,x_EANulexGrammarMt).
xc_source_file(a65b12628ef190,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef190,911).
xc_kb_names(a65b12628ef190,[]).
xc_mapping_rows(a65b12628ef190,[]).
xc_exclude_globals(a65b12628ef190,true).
x_probabilityEAGrammarRule('x_-vp->verb-participle-adj-pass-',1.0) :- x_cid(a65b12628ef191).
xc_microtheory(a65b12628ef191,x_EANulexGrammarMt).
xc_source_file(a65b12628ef191,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef191,912).
xc_kb_names(a65b12628ef191,[]).
xc_mapping_rows(a65b12628ef191,[]).
xc_exclude_globals(a65b12628ef191,true).
x_grammarRule('x_-vp->verb-participle-adj-pass-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),':NOUN'(':SUBJECT'),x_sem(x_thereExists(V4,V5)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_agr(V1),x_vform(V2),x_var(V6),x_subcat(x_adj)))),x_EATermFn(x_Adjective,x_TheList(x_sem(V5),x_var(V3))))) :- x_cid(a65b12628ef192,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef192,x_EANulexGrammarMt).
xc_source_file(a65b12628ef192,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef192,913).
xc_kb_names(a65b12628ef192,["?a","?vform","?varadj","?varvp","?semadj","?varvp"]).
xc_mapping_rows(a65b12628ef192,[]).
xc_exclude_globals(a65b12628ef192,true).
x_isa('x_-vp->be-np-',x_EAGrammarRule) :- x_cid(a65b12628ef193).
xc_microtheory(a65b12628ef193,x_EANulexGrammarMt).
xc_source_file(a65b12628ef193,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef193,928).
xc_kb_names(a65b12628ef193,[]).
xc_mapping_rows(a65b12628ef193,[]).
xc_exclude_globals(a65b12628ef193,true).
x_comment('x_-vp->be-np-',"subject complement reidentifies the subject: 'is a fish', 'Jeremiah [was a bullfrog].'") :- x_cid(a65b12628ef194).
xc_microtheory(a65b12628ef194,x_EANulexGrammarMt).
xc_source_file(a65b12628ef194,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef194,929).
xc_kb_names(a65b12628ef194,[]).
xc_mapping_rows(a65b12628ef194,[]).
xc_exclude_globals(a65b12628ef194,true).
x_probabilityEAGrammarRule('x_-vp->be-np-',1.0) :- x_cid(a65b12628ef195).
xc_microtheory(a65b12628ef195,x_EANulexGrammarMt).
xc_source_file(a65b12628ef195,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef195,930).
xc_kb_names(a65b12628ef195,[]).
xc_mapping_rows(a65b12628ef195,[]).
xc_exclude_globals(a65b12628ef195,true).
x_grammarRule('x_-vp->be-np-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_link(V3),':OBJECT'(V4),x_sem(x_and(V5,x_denotes(':SUBJECT',V4))))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),'x_object-be'('x_+')))),x_EATermFn(x_np,x_TheList(x_sem(V5),x_var(V4),x_gerund('x_-'),x_inf('x_-'))))) :- x_cid(a65b12628ef196,V1,V2,V3,V4,V5).
xc_microtheory(a65b12628ef196,x_EANulexGrammarMt).
xc_source_file(a65b12628ef196,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef196,931).
xc_kb_names(a65b12628ef196,["?a","?vform","?varvp","?varnp","?semnp"]).
xc_mapping_rows(a65b12628ef196,[]).
xc_exclude_globals(a65b12628ef196,true).
x_isa('x_-vp->be-pp-',x_EAGrammarRule) :- x_cid(a65b12628ef197).
xc_microtheory(a65b12628ef197,x_EANulexGrammarMt).
xc_source_file(a65b12628ef197,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef197,974).
xc_kb_names(a65b12628ef197,[]).
xc_mapping_rows(a65b12628ef197,[]).
xc_exclude_globals(a65b12628ef197,true).
x_comment('x_-vp->be-pp-',"prepositional complement: 'is in the room'. is-pp has a different substitution pattern than vp-pp.") :- x_cid(a65b12628ef198).
xc_microtheory(a65b12628ef198,x_EANulexGrammarMt).
xc_source_file(a65b12628ef198,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef198,975).
xc_kb_names(a65b12628ef198,[]).
xc_mapping_rows(a65b12628ef198,[]).
xc_exclude_globals(a65b12628ef198,true).
x_probabilityEAGrammarRule('x_-vp->be-pp-',1.0) :- x_cid(a65b12628ef199).
xc_microtheory(a65b12628ef199,x_EANulexGrammarMt).
xc_source_file(a65b12628ef199,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef199,976).
xc_kb_names(a65b12628ef199,[]).
xc_mapping_rows(a65b12628ef199,[]).
xc_exclude_globals(a65b12628ef199,true).
x_grammarRule('x_-vp->be-pp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),x_link(V1),':NOUN'(':SUBJECT'),x_sem(x_and(V4,V5)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_agr(V3),x_vform(V2),x_var(V1),x_sem(V4),'x_object-be'('x_+'),x_inv('x_-'),x_link('x_-'),'x_dir-obj'('x_-')))),x_EATermFn(x_pp,x_TheList(x_var(V6),x_sem(V5))))) :- x_cid(a65b12628ef19a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef19a,x_EANulexGrammarMt).
xc_source_file(a65b12628ef19a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef19a,977).
xc_kb_names(a65b12628ef19a,["?varv","?vform","?a","?semvp","?sempp","?varpp"]).
xc_mapping_rows(a65b12628ef19a,[]).
xc_exclude_globals(a65b12628ef19a,true).
x_isa('x_-vp->be-not-pp-',x_EAGrammarRule) :- x_cid(a65b12628ef19b).
xc_microtheory(a65b12628ef19b,x_EANulexGrammarMt).
xc_source_file(a65b12628ef19b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef19b,988).
xc_kb_names(a65b12628ef19b,[]).
xc_mapping_rows(a65b12628ef19b,[]).
xc_exclude_globals(a65b12628ef19b,true).
x_probabilityEAGrammarRule('x_-vp->be-not-pp-',1.0) :- x_cid(a65b12628ef19c).
xc_microtheory(a65b12628ef19c,x_EANulexGrammarMt).
xc_source_file(a65b12628ef19c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef19c,989).
xc_kb_names(a65b12628ef19c,[]).
xc_mapping_rows(a65b12628ef19c,[]).
xc_exclude_globals(a65b12628ef19c,true).
x_grammarRule('x_-vp->be-not-pp-',x_EATermFn(x_vp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),x_link(V1),':NOUN'(':SUBJECT'),x_sem(x_not(V4)))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_agr(V3),x_vform(V2),x_var(V1),'x_object-be'('x_+'),x_inv('x_-'),'x_dir-obj'('x_-')))),x_EATermFn(x_Adverb,x_TheList(x_lex(x_not))),x_EATermFn(x_pp,x_TheList(x_var(V5),x_sem(V4))))) :- x_cid(a65b12628ef19d,V1,V2,V3,V4,V5).
xc_microtheory(a65b12628ef19d,x_EANulexGrammarMt).
xc_source_file(a65b12628ef19d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef19d,990).
xc_kb_names(a65b12628ef19d,["?varv","?vform","?a","?sempp","?varpp"]).
xc_mapping_rows(a65b12628ef19d,[]).
xc_exclude_globals(a65b12628ef19d,true).
x_isa('x_-vp->be-not-np-',x_EAGrammarRule) :- x_cid(a65b12628ef19e).
xc_microtheory(a65b12628ef19e,x_EANulexGrammarMt).
xc_source_file(a65b12628ef19e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef19e,1002).
xc_kb_names(a65b12628ef19e,[]).
xc_mapping_rows(a65b12628ef19e,[]).
xc_exclude_globals(a65b12628ef19e,true).
x_comment('x_-vp->be-not-np-',"'The brick is not the apple.'") :- x_cid(a65b12628ef19f).
xc_microtheory(a65b12628ef19f,x_EANulexGrammarMt).
xc_source_file(a65b12628ef19f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef19f,1003).
xc_kb_names(a65b12628ef19f,[]).
xc_mapping_rows(a65b12628ef19f,[]).
xc_exclude_globals(a65b12628ef19f,true).
x_probabilityEAGrammarRule('x_-vp->be-not-np-',1.0) :- x_cid(a65b12628ef1a0).
xc_microtheory(a65b12628ef1a0,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a0,1004).
xc_kb_names(a65b12628ef1a0,[]).
xc_mapping_rows(a65b12628ef1a0,[]).
xc_exclude_globals(a65b12628ef1a0,true).
x_grammarRule('x_-vp->be-not-np-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_link(V3),x_sem(x_and(V4,x_not(x_denotes(':SUBJECT',V5)))))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),'x_object-be'('x_+'),x_link('x_-'),x_aux('x_-'),x_modal('x_-'),x_negated('x_-'),x_inv('x_-')))),x_EATermFn(x_Adverb,x_TheList(x_lex(x_not))),x_EATermFn(x_np,x_TheList(x_agr(V1),x_sem(V4),x_var(V5),x_gerund('x_-'),x_inf('x_-'))))) :- x_cid(a65b12628ef1a1,V1,V2,V3,V4,V5).
xc_microtheory(a65b12628ef1a1,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a1,1005).
xc_kb_names(a65b12628ef1a1,["?a","?vform","?varvp","?semnp","?varnp"]).
xc_mapping_rows(a65b12628ef1a1,[]).
xc_exclude_globals(a65b12628ef1a1,true).
x_isa('x_-vp->v-mp-object-be-',x_EAGrammarRule) :- x_cid(a65b12628ef1a2).
xc_microtheory(a65b12628ef1a2,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a2,1018).
xc_kb_names(a65b12628ef1a2,[]).
xc_mapping_rows(a65b12628ef1a2,[]).
xc_exclude_globals(a65b12628ef1a2,true).
x_comment('x_-vp->v-mp-object-be-',"subject complement with measure phrase: 'is 3 kilograms'") :- x_cid(a65b12628ef1a3).
xc_microtheory(a65b12628ef1a3,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a3,1019).
xc_kb_names(a65b12628ef1a3,[]).
xc_mapping_rows(a65b12628ef1a3,[]).
xc_exclude_globals(a65b12628ef1a3,true).
x_probabilityEAGrammarRule('x_-vp->v-mp-object-be-',1.0) :- x_cid(a65b12628ef1a4).
xc_microtheory(a65b12628ef1a4,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a4,1020).
xc_kb_names(a65b12628ef1a4,[]).
xc_mapping_rows(a65b12628ef1a4,[]).
xc_exclude_globals(a65b12628ef1a4,true).
x_grammarRule('x_-vp->v-mp-object-be-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_link(V3),x_sem(x_measure(':SUBJECT',V4)))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_sem(V5),'x_object-be'('x_+')))),x_EATermFn(x_mp,x_TheList(x_var(V6),x_sem(V4))))) :- x_cid(a65b12628ef1a5,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef1a5,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a5,1021).
xc_kb_names(a65b12628ef1a5,["?agr","?vform","?varv","?semmp","?semv","?varmp"]).
xc_mapping_rows(a65b12628ef1a5,[]).
xc_exclude_globals(a65b12628ef1a5,true).
x_isa('x_-vp->v-mp-pp-object-be-',x_EAGrammarRule) :- x_cid(a65b12628ef1a6).
xc_microtheory(a65b12628ef1a6,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a6,1032).
xc_kb_names(a65b12628ef1a6,[]).
xc_mapping_rows(a65b12628ef1a6,[]).
xc_exclude_globals(a65b12628ef1a6,true).
x_comment('x_-vp->v-mp-pp-object-be-',"'is 9 feet from the water'") :- x_cid(a65b12628ef1a7).
xc_microtheory(a65b12628ef1a7,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a7,1033).
xc_kb_names(a65b12628ef1a7,[]).
xc_mapping_rows(a65b12628ef1a7,[]).
xc_exclude_globals(a65b12628ef1a7,true).
x_probabilityEAGrammarRule('x_-vp->v-mp-pp-object-be-',1.0) :- x_cid(a65b12628ef1a8).
xc_microtheory(a65b12628ef1a8,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a8,1034).
xc_kb_names(a65b12628ef1a8,[]).
xc_mapping_rows(a65b12628ef1a8,[]).
xc_exclude_globals(a65b12628ef1a8,true).
x_grammarRule('x_-vp->v-mp-pp-object-be-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_link(V3),':NOUN'(':SUBJECT'),x_sem(x_and(V4,x_measure(V5,V6))))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_sem(V7),'x_object-be'('x_+')))),x_EATermFn(x_mp,x_TheList(x_var(V8),x_sem(V6))),x_EATermFn(x_pp,x_TheList(x_var(V9),x_sem(V4),'x_prep-var'(V5))))) :- x_cid(a65b12628ef1a9,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12628ef1a9,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1a9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1a9,1035).
xc_kb_names(a65b12628ef1a9,["?agr","?vform","?varv","?sempp","?prep-var","?semmp","?semv","?varmp","?varpp"]).
xc_mapping_rows(a65b12628ef1a9,[]).
xc_exclude_globals(a65b12628ef1a9,true).
x_isa('x_-vp->make-np-adjp-',x_EAGrammarRule) :- x_cid(a65b12628ef1aa).
xc_microtheory(a65b12628ef1aa,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1aa,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1aa,1049).
xc_kb_names(a65b12628ef1aa,[]).
xc_mapping_rows(a65b12628ef1aa,[]).
xc_exclude_globals(a65b12628ef1aa,true).
x_comment('x_-vp->make-np-adjp-',"'make the cat sick', 'made the area more accessible'") :- x_cid(a65b12628ef1ab).
xc_microtheory(a65b12628ef1ab,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1ab,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1ab,1050).
xc_kb_names(a65b12628ef1ab,[]).
xc_mapping_rows(a65b12628ef1ab,[]).
xc_exclude_globals(a65b12628ef1ab,true).
x_probabilityEAGrammarRule('x_-vp->make-np-adjp-',1.0) :- x_cid(a65b12628ef1ac).
xc_microtheory(a65b12628ef1ac,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1ac,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1ac,1051).
xc_kb_names(a65b12628ef1ac,[]).
xc_mapping_rows(a65b12628ef1ac,[]).
xc_exclude_globals(a65b12628ef1ac,true).
x_grammarRule('x_-vp->make-np-adjp-',x_EATermFn(x_vp,x_TheList(x_vform(V1),x_var(V2),x_agr(V3),':NOUN'(V4),':ACTION'(V2),':CLAUSE'(V5),x_sem(x_thereExists(V6,x_and(V7,V8))))),x_TheList(x_EAHeadFn(x_EATermFn(x_Verb,x_TheList(x_root(x_make2),x_var(V2),x_sem(V8),x_vform(?(x_v,x_pres,x_past))))),x_EATermFn(x_np,x_TheList(x_var(V4),x_sem(V7),x_agr(V3))),x_EATermFn(x_adjp,x_TheList(x_sem(V5),x_var(V9))))) :- x_cid(a65b12628ef1ad,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12628ef1ad,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1ad,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1ad,1052).
xc_kb_names(a65b12628ef1ad,["?v","?varvp","?a","?varnp","?semadjp","?varvp","?semnp","?semvp","?varadjp"]).
xc_mapping_rows(a65b12628ef1ad,[]).
xc_exclude_globals(a65b12628ef1ad,true).
x_isa('x_-vp->adj-that-slp-',x_EAGrammarRule) :- x_cid(a65b12628ef1ae).
xc_microtheory(a65b12628ef1ae,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1ae,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1ae,1069).
xc_kb_names(a65b12628ef1ae,[]).
xc_mapping_rows(a65b12628ef1ae,[]).
xc_exclude_globals(a65b12628ef1ae,true).
x_comment('x_-vp->adj-that-slp-',"adj + that phrase: 'sure that he is stupid', 'afraid that he is wrong'") :- x_cid(a65b12628ef1af).
xc_microtheory(a65b12628ef1af,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1af,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1af,1070).
xc_kb_names(a65b12628ef1af,[]).
xc_mapping_rows(a65b12628ef1af,[]).
xc_exclude_globals(a65b12628ef1af,true).
x_probabilityEAGrammarRule('x_-vp->adj-that-slp-',0.9) :- x_cid(a65b12628ef1b0).
xc_microtheory(a65b12628ef1b0,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b0,1071).
xc_kb_names(a65b12628ef1b0,[]).
xc_mapping_rows(a65b12628ef1b0,[]).
xc_exclude_globals(a65b12628ef1b0,true).
x_grammarRule('x_-vp->adj-that-slp-',x_EATermFn(x_adjp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),':CLAUSE'(V4),x_sem(V5))),x_TheList(x_EAHeadFn(x_EATermFn(x_Adjective,x_TheList(x_var(V6),x_sem(V5)))),x_EATermFn(x_SubordinatingConjunction,x_TheList(x_lex(x_that))),x_EATermFn(x_slp,x_TheList(x_var(V1),x_vform(V2),x_agr(V3),x_sem(V4))))) :- x_cid(a65b12628ef1b1,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b12628ef1b1,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b1,1072).
xc_kb_names(a65b12628ef1b1,["?varslp","?vform","?a","?semslp","?sema","?vara"]).
xc_mapping_rows(a65b12628ef1b1,[]).
xc_exclude_globals(a65b12628ef1b1,true).
x_isa('x_-vp->vp-cconj-vp-',x_EAGrammarRule) :- x_cid(a65b12628ef1b2).
xc_microtheory(a65b12628ef1b2,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b2,1085).
xc_kb_names(a65b12628ef1b2,[]).
xc_mapping_rows(a65b12628ef1b2,[]).
xc_exclude_globals(a65b12628ef1b2,true).
x_comment('x_-vp->vp-cconj-vp-',"coordinating conjunctions, without second subject (with and without comma)") :- x_cid(a65b12628ef1b3).
xc_microtheory(a65b12628ef1b3,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b3,1086).
xc_kb_names(a65b12628ef1b3,[]).
xc_mapping_rows(a65b12628ef1b3,[]).
xc_exclude_globals(a65b12628ef1b3,true).
x_probabilityEAGrammarRule('x_-vp->vp-cconj-vp-',1.0) :- x_cid(a65b12628ef1b4).
xc_microtheory(a65b12628ef1b4,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b4,1087).
xc_kb_names(a65b12628ef1b4,[]).
xc_mapping_rows(a65b12628ef1b4,[]).
xc_exclude_globals(a65b12628ef1b4,true).
x_grammarRule('x_-vp->vp-cconj-vp-',x_EATermFn(x_vp,x_TheList(x_var(x_cconj(V1,V2)),x_sem(x_and(V3,V4)),x_agr(V5),x_vform(V6),'x_dir-obj'(x_invalid),x_link(V7))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_var(V1),x_sem(V3),x_agr(V5),x_vform(?(x_vform,x_pres,x_past,x_future,x_prespart)),x_modal('x_-'),x_link(V7)))),x_EATermFn(x_Conjunction,x_TheList(x_var(V8),x_sem(V9),x_lex(V10))),x_EATermFn(x_vp,x_TheList(x_var(V2),x_sem(V4),x_agr(V5),x_vform(?(x_vform,x_pres,x_past,x_future,x_prespart)))))) :- x_cid(a65b12628ef1b5,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10).
xc_microtheory(a65b12628ef1b5,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b5,1088).
xc_kb_names(a65b12628ef1b5,["?varvp1","?varvp2","?semvp1","?semvp2","?a","?vform","?link","?varc","?semconj","?lexc"]).
xc_mapping_rows(a65b12628ef1b5,[]).
xc_exclude_globals(a65b12628ef1b5,true).
x_isa('x_-vp->vbe-called-quote-np-quote-',x_EAGrammarRule) :- x_cid(a65b12628ef1b6).
xc_microtheory(a65b12628ef1b6,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b6,1105).
xc_kb_names(a65b12628ef1b6,[]).
xc_mapping_rows(a65b12628ef1b6,[]).
xc_exclude_globals(a65b12628ef1b6,true).
x_comment('x_-vp->vbe-called-quote-np-quote-',"Further quoted name handling") :- x_cid(a65b12628ef1b7).
xc_microtheory(a65b12628ef1b7,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b7,1106).
xc_kb_names(a65b12628ef1b7,[]).
xc_mapping_rows(a65b12628ef1b7,[]).
xc_exclude_globals(a65b12628ef1b7,true).
x_probabilityEAGrammarRule('x_-vp->vbe-called-quote-np-quote-',1.0) :- x_cid(a65b12628ef1b8).
xc_microtheory(a65b12628ef1b8,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b8,1107).
xc_kb_names(a65b12628ef1b8,[]).
xc_mapping_rows(a65b12628ef1b8,[]).
xc_exclude_globals(a65b12628ef1b8,true).
x_grammarRule('x_-vp->vbe-called-quote-np-quote-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_link(V4),':NOUN'(':SUBJECT'),':ACTION'(V3),x_sem(x_thereExists(x_TheList(V4,V3),x_and(V5,x_nameForConcept(':SUBJECT',V6)))))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V4),'x_object-be'('x_+'),x_inv('x_-'),x_link('x_-'),x_modal('x_-'),x_aux('x_-')))),x_EATermFn(x_Verb,x_TheList(x_lex(x_called),x_vform(?(x_vf,x_pastpart)),x_sem(V5),x_var(V3))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-double-quote'))),x_EATermFn(x_np,x_TheList(x_var(V7))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-double-quote'))),x_EATermFn('x_bind-string',x_TheList(x_var(V7),x_lex(V6))))) :- x_cid(a65b12628ef1b9,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b12628ef1b9,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1b9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1b9,1108).
xc_kb_names(a65b12628ef1b9,["?a","?vform","?varadjp","?varvp","?semadjp","?namelex","?namevar"]).
xc_mapping_rows(a65b12628ef1b9,[]).
xc_exclude_globals(a65b12628ef1b9,true).
x_isa('x_-vp->vbe-called-det-quote-np-quote-',x_EAGrammarRule) :- x_cid(a65b12628ef1ba).
xc_microtheory(a65b12628ef1ba,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1ba,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1ba,1128).
xc_kb_names(a65b12628ef1ba,[]).
xc_mapping_rows(a65b12628ef1ba,[]).
xc_exclude_globals(a65b12628ef1ba,true).
x_comment('x_-vp->vbe-called-det-quote-np-quote-',"Quoted name handling with determiners") :- x_cid(a65b12628ef1bb).
xc_microtheory(a65b12628ef1bb,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1bb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1bb,1129).
xc_kb_names(a65b12628ef1bb,[]).
xc_mapping_rows(a65b12628ef1bb,[]).
xc_exclude_globals(a65b12628ef1bb,true).
x_probabilityEAGrammarRule('x_-vp->vbe-called-det-quote-np-quote-',1.0) :- x_cid(a65b12628ef1bc).
xc_microtheory(a65b12628ef1bc,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1bc,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1bc,1130).
xc_kb_names(a65b12628ef1bc,[]).
xc_mapping_rows(a65b12628ef1bc,[]).
xc_exclude_globals(a65b12628ef1bc,true).
x_grammarRule('x_-vp->vbe-called-det-quote-np-quote-',x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V3),x_link(V4),':NOUN'(':SUBJECT'),':ACTION'(V3),x_sem(x_thereExists(x_TheList(V4,V3),x_and(V5,x_nameForConcept(':SUBJECT',V6)))))),x_TheList(x_EAHeadFn(x_EATermFn(x_vp,x_TheList(x_agr(V1),x_vform(V2),x_var(V4),'x_object-be'('x_+'),x_inv('x_-'),x_link('x_-'),x_modal('x_-'),x_aux('x_-')))),x_EATermFn(x_Verb,x_TheList(x_lex(x_called),x_vform(?(x_vf,x_pastpart)),x_sem(V5),x_var(V3))),x_EATermFn(x_Determiner,x_TheList(x_agr(V1),x_var(V7),x_sem(V8))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-double-quote'))),x_EATermFn(x_np,x_TheList(x_var(V9))),x_EATermFn('x_Punctuation-SP',x_TheList(x_lex('x_punc-double-quote'))),x_EATermFn('x_bind-string',x_TheList(x_var(V9),x_lex(V6))))) :- x_cid(a65b12628ef1bd,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b12628ef1bd,x_EANulexGrammarMt).
xc_source_file(a65b12628ef1bd,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/grammar/framenet-grammar/vp.krf').
xc_source_line(a65b12628ef1bd,1131).
xc_kb_names(a65b12628ef1bd,["?a","?vform","?varadjp","?varvp","?semadjp","?namelex","?vardet","?semdet","?namevar"]).
xc_mapping_rows(a65b12628ef1bd,[]).
xc_exclude_globals(a65b12628ef1bd,true).
kb_cache_footer(footer{count:208,digest:e1820b4d71ec36e6990296f7d8cd9273f726c0da57037f99d26f67a30ae8c8ee,headerDigest:'829bc353c1bdcf4dec121327ceccc3c2471aabe26008543087554a1e167c50c7'}).
