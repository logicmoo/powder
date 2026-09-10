:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:97,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:732,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'1d401fc8ebb3e1c926ebc42bea6d4d4d23d0d2369e453c3c4d0906b6fe611e0c',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:25262,source:'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf',sourceHash:adb86810752e4cc38471adb9358245dbf1f7f288c31ae31733cba6ccb6853a65,warnings:[]}).
'x_<=='(x_drsPriorInDiscourse(V1,V2),x_drsEntailedBySentence(V1,V3),x_sentenceInDiscourse(V2,V4,V5),x_sentenceInDiscourse(V3,V6,V7),x_lessThan(V6,V4)) :- x_cid(a65b1269d6e5dc,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269d6e5dc,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5dc,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5dc,18).
xc_kb_names(a65b1269d6e5dc,["?drs-id","?sid","?prior-sid","?pos","?tokens","?prior-pos","?prior-tokens"]).
xc_mapping_rows(a65b1269d6e5dc,[]).
xc_exclude_globals(a65b1269d6e5dc,true).
'x_<=='(x_priorDrsInDiscourse(V1,V2),x_sentenceInDiscourse(V2,V3,V4),x_sentenceInDiscourse(V5,V6,V7),x_lessThan(V6,V3),x_drsEntailedBySentence(V1,V5)) :- x_cid(a65b1269d6e5dd,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269d6e5dd,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5dd,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5dd,25).
xc_kb_names(a65b1269d6e5dd,["?drs-id","?sid","?pos","?tokens","?prior-sid","?prior-pos","?prior-tokens"]).
xc_mapping_rows(a65b1269d6e5dd,[]).
xc_exclude_globals(a65b1269d6e5dd,true).
'x_<=='(x_sameSentence(V1,V2),x_drsEntailedBySentence(V1,V3),x_drsEntailedBySentence(V2,V3)) :- x_cid(a65b1269d6e5de,V1,V2,V3).
xc_microtheory(a65b1269d6e5de,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5de,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5de,31).
xc_kb_names(a65b1269d6e5de,["?drs-id1","?drs-id2","?sid"]).
xc_mapping_rows(a65b1269d6e5de,[]).
xc_exclude_globals(a65b1269d6e5de,true).
'x_<=='(x_priorSentenceInDiscourse(V1,V2),x_sentenceInDiscourse(V1,V3,V4),x_evaluate(V5,x_PlusFn(V3,-1)),x_sentenceInDiscourse(V2,V5,V6)) :- x_cid(a65b1269d6e5df,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269d6e5df,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5df,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5df,35).
xc_kb_names(a65b1269d6e5df,["?sid","?prior-sid","?pos","?tokens","?prior-pos","?prior-tokens"]).
xc_mapping_rows(a65b1269d6e5df,[]).
xc_exclude_globals(a65b1269d6e5df,true).
'x_<=='(x_sentencePriorInDiscourse(V1,V2),x_sentenceInDiscourse(V1,V3,V4),x_sentenceInDiscourse(V2,V5,V6),x_lessThan(V5,V3)) :- x_cid(a65b1269d6e5e0,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269d6e5e0,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e0,40).
xc_kb_names(a65b1269d6e5e0,["?sid","?prior-sid","?pos","?tokens","?prior-pos","?prior-tokens"]).
xc_mapping_rows(a65b1269d6e5e0,[]).
xc_exclude_globals(a65b1269d6e5e0,true).
'x_<=='(x_priorInHeadVar(x_cconj(V1,V2),V1)) :- x_cid(a65b1269d6e5e1,V1,V2).
xc_microtheory(a65b1269d6e5e1,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e1,49).
xc_kb_names(a65b1269d6e5e1,["?prior","?later"]).
xc_mapping_rows(a65b1269d6e5e1,[]).
xc_exclude_globals(a65b1269d6e5e1,true).
'x_<=='(x_priorInHeadVar(x_sconj(V1,x_when,V2),V1)) :- x_cid(a65b1269d6e5e2,V1,V2).
xc_microtheory(a65b1269d6e5e2,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e2,51).
xc_kb_names(a65b1269d6e5e2,["?prior","?later"]).
xc_mapping_rows(a65b1269d6e5e2,[]).
xc_exclude_globals(a65b1269d6e5e2,true).
'x_<=='(x_priorInHeadVar(x_sconj(V1,x_in,V2),V2)) :- x_cid(a65b1269d6e5e3,V1,V2).
xc_microtheory(a65b1269d6e5e3,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e3,53).
xc_kb_names(a65b1269d6e5e3,["?prior","?later"]).
xc_mapping_rows(a65b1269d6e5e3,[]).
xc_exclude_globals(a65b1269d6e5e3,true).
'x_<=='(x_priorInHeadVar(V1,V1),x_uninferredSentence(x_unifies(x_cconj(V2,V3),V1)),x_uninferredSentence(x_unifies(x_sconj(V2,V4,V3),V1))) :- x_cid(a65b1269d6e5e4,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e5e4,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e4,55).
xc_kb_names(a65b1269d6e5e4,["?prior","?p","?l","?sconj"]).
xc_mapping_rows(a65b1269d6e5e4,[]).
xc_exclude_globals(a65b1269d6e5e4,true).
'x_<=='(x_laterInHeadVar(x_cconj(V1,V2),V2)) :- x_cid(a65b1269d6e5e5,V1,V2).
xc_microtheory(a65b1269d6e5e5,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e5,59).
xc_kb_names(a65b1269d6e5e5,["?prior","?later"]).
xc_mapping_rows(a65b1269d6e5e5,[]).
xc_exclude_globals(a65b1269d6e5e5,true).
'x_<=='(x_laterInHeadVar(x_sconj(V1,x_when,V2),V2)) :- x_cid(a65b1269d6e5e6,V1,V2).
xc_microtheory(a65b1269d6e5e6,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e6,61).
xc_kb_names(a65b1269d6e5e6,["?prior","?later"]).
xc_mapping_rows(a65b1269d6e5e6,[]).
xc_exclude_globals(a65b1269d6e5e6,true).
'x_<=='(x_laterInHeadVar(x_sconj(V1,x_in,V2),V2)) :- x_cid(a65b1269d6e5e7,V1,V2).
xc_microtheory(a65b1269d6e5e7,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e7,63).
xc_kb_names(a65b1269d6e5e7,["?prior","?later"]).
xc_mapping_rows(a65b1269d6e5e7,[]).
xc_exclude_globals(a65b1269d6e5e7,true).
'x_<=='(x_elementInHeadVar(V1,V2),x_priorInHeadVar(V1,V2)) :- x_cid(a65b1269d6e5e8,V1,V2).
xc_microtheory(a65b1269d6e5e8,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e8,65).
xc_kb_names(a65b1269d6e5e8,["?hv","?elt"]).
xc_mapping_rows(a65b1269d6e5e8,[]).
xc_exclude_globals(a65b1269d6e5e8,true).
'x_<=='(x_elementInHeadVar(V1,V2),x_laterInHeadVar(V1,V2)) :- x_cid(a65b1269d6e5e9,V1,V2).
xc_microtheory(a65b1269d6e5e9,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5e9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5e9,68).
xc_kb_names(a65b1269d6e5e9,["?hv","?elt"]).
xc_mapping_rows(a65b1269d6e5e9,[]).
xc_exclude_globals(a65b1269d6e5e9,true).
'x_<=='(x_topicOfDrs(V1,V2),x_headVarForDrs(V3,V2),x_elementInHeadVar(V3,V1)) :- x_cid(a65b1269d6e5ea,V1,V2,V3).
xc_microtheory(a65b1269d6e5ea,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5ea,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5ea,71).
xc_kb_names(a65b1269d6e5ea,["?event","?drs-id","?hv"]).
xc_mapping_rows(a65b1269d6e5ea,[]).
xc_exclude_globals(a65b1269d6e5ea,true).
'x_<=='(x_pointOfActionInDrs(V1,V2),x_headVarForDrs(x_cconj(V1,V3),V2),x_verbForm(V4,x_past,'x_Non-Perfect','x_Non-Progressive')) :- x_cid(a65b1269d6e5eb,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e5eb,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5eb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5eb,77).
xc_kb_names(a65b1269d6e5eb,["?event","?drs-id","?other-event","?head"]).
xc_mapping_rows(a65b1269d6e5eb,[]).
xc_exclude_globals(a65b1269d6e5eb,true).
'x_<=='(x_variableQuantifiedFor(V1,V2,x_Clause),x_variableInUniverse(V1,V2,V3)) :- x_cid(a65b1269d6e5ec,V1,V2,V3).
xc_microtheory(a65b1269d6e5ec,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5ec,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5ec,87).
xc_kb_names(a65b1269d6e5ec,["?var","?drs-id","?type"]).
xc_mapping_rows(a65b1269d6e5ec,[]).
xc_exclude_globals(a65b1269d6e5ec,true).
'x_<=='(x_variableQuantifiedFor(V1,V2,x_Clause),x_drsEmbeddedInDrs(V2,V3),x_variableQuantifiedFor(V1,V3,x_Clause)) :- x_cid(a65b1269d6e5ed,V1,V2,V3).
xc_microtheory(a65b1269d6e5ed,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5ed,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5ed,90).
xc_kb_names(a65b1269d6e5ed,["?var","?drs-id","?parent"]).
xc_mapping_rows(a65b1269d6e5ed,[]).
xc_exclude_globals(a65b1269d6e5ed,true).
'x_<=='(x_variableQuantifiedFor(V1,V2,x_Clause),x_trueInDrs(V2,x_properNameReference(V1))) :- x_cid(a65b1269d6e5ee,V1,V2).
xc_microtheory(a65b1269d6e5ee,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5ee,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5ee,94).
xc_kb_names(a65b1269d6e5ee,["?var","?drs-id"]).
xc_mapping_rows(a65b1269d6e5ee,[]).
xc_exclude_globals(a65b1269d6e5ee,true).
'x_<=='(x_variableQuantifiedFor(V1,V2,x_Discourse),x_variableInOrLiftToUniverse(V1,V2)) :- x_cid(a65b1269d6e5ef,V1,V2).
xc_microtheory(a65b1269d6e5ef,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5ef,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5ef,97).
xc_kb_names(a65b1269d6e5ef,["?var","?drs-id"]).
xc_mapping_rows(a65b1269d6e5ef,[]).
xc_exclude_globals(a65b1269d6e5ef,true).
'x_<=='(x_variableQuantifiedFor(V1,V2,x_Discourse),x_drsEmbeddedInDrs(V2,V3),x_variableQuantifiedFor(V1,V3,x_Discourse)) :- x_cid(a65b1269d6e5f0,V1,V2,V3).
xc_microtheory(a65b1269d6e5f0,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f0,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f0,100).
xc_kb_names(a65b1269d6e5f0,["?var","?drs-id","?parent"]).
xc_mapping_rows(a65b1269d6e5f0,[]).
xc_exclude_globals(a65b1269d6e5f0,true).
'x_<=='(x_variableQuantifiedFor(V1,V2,x_Discourse),x_properNameReference(V1)) :- x_cid(a65b1269d6e5f1,V1,V2).
xc_microtheory(a65b1269d6e5f1,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f1,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f1,104).
xc_kb_names(a65b1269d6e5f1,["?var","?drs-id"]).
xc_mapping_rows(a65b1269d6e5f1,[]).
xc_exclude_globals(a65b1269d6e5f1,true).
'x_<=='(x_drsEmbeddedInDrs(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_drsEmbeddedInDrs(V1,V3),x_drsEmbeddedInDrs(V3,V2)) :- x_cid(a65b1269d6e5f2,V1,V2,V3).
xc_microtheory(a65b1269d6e5f2,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f2,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f2,109).
xc_kb_names(a65b1269d6e5f2,["?sub","?super","?other"]).
xc_mapping_rows(a65b1269d6e5f2,[]).
xc_exclude_globals(a65b1269d6e5f2,true).
'x_<=='(x_drsEmbeddedInOrEqualToDrs(V1,V1)) :- x_cid(a65b1269d6e5f3,V1).
xc_microtheory(a65b1269d6e5f3,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f3,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f3,116).
xc_kb_names(a65b1269d6e5f3,["?sub"]).
xc_mapping_rows(a65b1269d6e5f3,[]).
xc_exclude_globals(a65b1269d6e5f3,true).
'x_<=='(x_drsEmbeddedInOrEqualToDrs(V1,V2),x_drsEmbeddedInDrs(V1,V2)) :- x_cid(a65b1269d6e5f4,V1,V2).
xc_microtheory(a65b1269d6e5f4,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f4,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f4,118).
xc_kb_names(a65b1269d6e5f4,["?sub","?super"]).
xc_mapping_rows(a65b1269d6e5f4,[]).
xc_exclude_globals(a65b1269d6e5f4,true).
'x_<=='(x_nonModalEmbedding(V1,V2),x_causalEmbedding(V1,V3,V2)) :- x_cid(a65b1269d6e5f5,V1,V2,V3).
xc_microtheory(a65b1269d6e5f5,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f5,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f5,124).
xc_kb_names(a65b1269d6e5f5,["?grp-drs-id","?member-drs-id","?cause"]).
xc_mapping_rows(a65b1269d6e5f5,[]).
xc_exclude_globals(a65b1269d6e5f5,true).
'x_<=='(x_nonModalEmbedding(V1,V2),x_trueInDrs(V1,t(V3,V4,x_DrsCaseFn(V2)))) :- x_cid(a65b1269d6e5f6,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e5f6,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f6,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f6,127).
xc_kb_names(a65b1269d6e5f6,["?grp-drs-id","?member-drs-id","?embedding-fn","?ct"]).
xc_mapping_rows(a65b1269d6e5f6,[]).
xc_exclude_globals(a65b1269d6e5f6,true).
'x_<=='(x_nonModalEmbedding(V1,V1),x_equals(V1,V1)) :- x_cid(a65b1269d6e5f7,V1).
xc_microtheory(a65b1269d6e5f7,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f7,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f7,130).
xc_kb_names(a65b1269d6e5f7,["?drs-id"]).
xc_mapping_rows(a65b1269d6e5f7,[]).
xc_exclude_globals(a65b1269d6e5f7,true).
'x_<=='(x_causalEmbedding(V1,V2,V3),x_groundExpression(V1),x_trueInDrs(V1,'x_causes-ThingProp'(V2,x_DrsCaseFn(V3)))) :- x_cid(a65b1269d6e5f8,V1,V2,V3).
xc_microtheory(a65b1269d6e5f8,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f8,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f8,134).
xc_kb_names(a65b1269d6e5f8,["?drs-id","?thing","?emb-drs-id"]).
xc_mapping_rows(a65b1269d6e5f8,[]).
xc_exclude_globals(a65b1269d6e5f8,true).
'x_<=='(x_causalEmbedding(V1,V2,V3),x_groundExpression(V1),x_trueInDrs(V1,'x_causes-SitProp'(V2,x_DrsCaseFn(V3)))) :- x_cid(a65b1269d6e5f9,V1,V2,V3).
xc_microtheory(a65b1269d6e5f9,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5f9,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5f9,138).
xc_kb_names(a65b1269d6e5f9,["?drs-id","?sit","?emb-drs-id"]).
xc_mapping_rows(a65b1269d6e5f9,[]).
xc_exclude_globals(a65b1269d6e5f9,true).
'x_<=='(x_modalEmbedding(V1,V2),x_groundExpression(V1),x_trueInDrs(V1,x_willBe(x_DrsCaseFn(V2)))) :- x_cid(a65b1269d6e5fa,V1,V2).
xc_microtheory(a65b1269d6e5fa,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5fa,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5fa,142).
xc_kb_names(a65b1269d6e5fa,["?drs-id","?emb-drs-id"]).
xc_mapping_rows(a65b1269d6e5fa,[]).
xc_exclude_globals(a65b1269d6e5fa,true).
'x_<=='(x_modalEmbedding(V1,V2),x_groundExpression(V1),x_trueInDrs(V1,'x_possible-Historical'(x_DrsCaseFn(V2)))) :- x_cid(a65b1269d6e5fb,V1,V2).
xc_microtheory(a65b1269d6e5fb,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5fb,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5fb,146).
xc_kb_names(a65b1269d6e5fb,["?drs-id","?emb-drs-id"]).
xc_mapping_rows(a65b1269d6e5fb,[]).
xc_exclude_globals(a65b1269d6e5fb,true).
'x_<=='(x_isaInDrs(V1,V2,V3),x_groundExpression(V2),x_groundExpression(V1),x_variableExpression(V3),x_nonTransitiveInference(x_localOnly(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,V3)))))) :- x_cid(a65b1269d6e5fc,V1,V2,V3).
xc_microtheory(a65b1269d6e5fc,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5fc,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5fc,224).
xc_kb_names(a65b1269d6e5fc,["?dv","?drs","?col"]).
xc_mapping_rows(a65b1269d6e5fc,[]).
xc_exclude_globals(a65b1269d6e5fc,true).
'x_<=='(x_isaInDrs(V1,V2,V3),x_groundExpression(V2),x_groundExpression(V3),x_groundExpression(V1),x_wmOnly(x_localOnly(x_nonTransitiveInference('x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,V4))))),x_groundExpression(V4),x_atomicTerm(V4),x_genlsOrUnifies(V4,V3)) :- x_cid(a65b1269d6e5fd,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e5fd,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5fd,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5fd,232).
xc_kb_names(a65b1269d6e5fd,["?dv","?drs","?col","?dv-col"]).
xc_mapping_rows(a65b1269d6e5fd,[]).
xc_exclude_globals(a65b1269d6e5fd,true).
'x_<=='(x_genlsOrUnifies(V1,V2),x_allFactsAllowed(x_useTransitiveInference(x_genls(V1,V2)))) :- x_cid(a65b1269d6e5fe,V1,V2).
xc_microtheory(a65b1269d6e5fe,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5fe,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5fe,244).
xc_kb_names(a65b1269d6e5fe,["?dv-col","?col"]).
xc_mapping_rows(a65b1269d6e5fe,[]).
xc_exclude_globals(a65b1269d6e5fe,true).
'x_<=='(x_genlsOrUnifies(V1,V2),x_unifies(V1,V2)) :- x_cid(a65b1269d6e5ff,V1,V2).
xc_microtheory(a65b1269d6e5ff,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e5ff,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e5ff,248).
xc_kb_names(a65b1269d6e5ff,["?dv-col","?col"]).
xc_mapping_rows(a65b1269d6e5ff,[]).
xc_exclude_globals(a65b1269d6e5ff,true).
'x_<=='(x_isaInDrs(V1,V2,V3),x_groundExpression(V2),x_groundExpression(V3),x_wmOnly(x_localOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V2),x_isa(V1,t(V4,V5)))))),x_allFactsAllowed(x_resultGenl(V4,V5)),x_groundExpression(V5),x_allFactsAllowed(x_useTransitiveInference(x_genls(V5,V3)))) :- x_cid(a65b1269d6e600,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269d6e600,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e600,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e600,252).
xc_kb_names(a65b1269d6e600,["?dv","?drs","?col","?fn","?fn-col"]).
xc_mapping_rows(a65b1269d6e600,[]).
xc_exclude_globals(a65b1269d6e600,true).
'x_<=='(x_trueInDrs(V1,V2),'x_ist-Information'(x_DrsCaseFn(V1),V2)) :- x_cid(a65b1269d6e601,V1,V2).
xc_microtheory(a65b1269d6e601,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e601,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e601,269).
xc_kb_names(a65b1269d6e601,["?drs","?fact"]).
xc_mapping_rows(a65b1269d6e601,[]).
xc_exclude_globals(a65b1269d6e601,true).
x_isa(x_trueOrHoldsInDrs,x_Predicate) :- x_cid(a65b1269d6e602).
xc_microtheory(a65b1269d6e602,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e602,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e602,272).
xc_kb_names(a65b1269d6e602,[]).
xc_mapping_rows(a65b1269d6e602,[]).
xc_exclude_globals(a65b1269d6e602,true).
x_arity(x_trueOrHoldsInDrs,2) :- x_cid(a65b1269d6e603).
xc_microtheory(a65b1269d6e603,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e603,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e603,273).
xc_kb_names(a65b1269d6e603,[]).
xc_mapping_rows(a65b1269d6e603,[]).
xc_exclude_globals(a65b1269d6e603,true).
x_comment(x_trueOrHoldsInDrs,"(trueOrHoldsInDrs ?drs ?fact) \nchecks to see if (trueInDrs ?drs ?fact).") :- x_cid(a65b1269d6e604).
xc_microtheory(a65b1269d6e604,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e604,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e604,274).
xc_kb_names(a65b1269d6e604,[]).
xc_mapping_rows(a65b1269d6e604,[]).
xc_exclude_globals(a65b1269d6e604,true).
'x_<=='(x_trueOrHoldsInDrs(V1,V2),x_trueInDrs(V1,V2)) :- x_cid(a65b1269d6e605,V1,V2).
xc_microtheory(a65b1269d6e605,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e605,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e605,277).
xc_kb_names(a65b1269d6e605,["?drs","?fact"]).
xc_mapping_rows(a65b1269d6e605,[]).
xc_exclude_globals(a65b1269d6e605,true).
'x_<=='(x_lookupTrueInDrs(V1,V2),x_localOnly(x_lookupOnly('x_ist-Information'(x_DrsCaseFn(V1),V2)))) :- x_cid(a65b1269d6e606,V1,V2).
xc_microtheory(a65b1269d6e606,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e606,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e606,280).
xc_kb_names(a65b1269d6e606,["?drs","?fact"]).
xc_mapping_rows(a65b1269d6e606,[]).
xc_exclude_globals(a65b1269d6e606,true).
'x_<=='(x_properNameReference(V1),x_properNameReferenceInParseTree(V1,x_ParseTreeFn(V2,V3)),x_validParseTree(V3)) :- x_cid(a65b1269d6e607,V1,V2,V3).
xc_microtheory(a65b1269d6e607,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e607,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e607,303).
xc_kb_names(a65b1269d6e607,["?pname","?sid","?ptid"]).
xc_mapping_rows(a65b1269d6e607,[]).
xc_exclude_globals(a65b1269d6e607,true).
'x_<=='(x_validParseTree(V1),x_choice(V2,V3,V1),x_selectedChoice(V2,V3,V1)) :- x_cid(a65b1269d6e608,V1,V2,V3).
xc_microtheory(a65b1269d6e608,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e608,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e608,319).
xc_kb_names(a65b1269d6e608,["?ptid","?cs","?cid"]).
xc_mapping_rows(a65b1269d6e608,[]).
xc_exclude_globals(a65b1269d6e608,true).
'x_<=='(x_verbAside(V1,V2),x_verbAsideInParseTree(V1,V2,x_ParseTreeFn(V3,V4)),x_validParseTree(V4)) :- x_cid(a65b1269d6e609,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e609,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e609,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e609,330).
xc_kb_names(a65b1269d6e609,["?verb","?head","?sid","?ptid"]).
xc_mapping_rows(a65b1269d6e609,[]).
xc_exclude_globals(a65b1269d6e609,true).
'x_<=='(x_verbForm(V1,V2,V3,V4),x_verbFormInParseTree(V1,V2,V3,V4,x_ParseTreeFn(V5,V6)),x_validParseTree(V6)) :- x_cid(a65b1269d6e60a,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269d6e60a,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e60a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e60a,334).
xc_kb_names(a65b1269d6e60a,["?prior","?tense","?perfect","?progressive","?sid","?ptid"]).
xc_mapping_rows(a65b1269d6e60a,[]).
xc_exclude_globals(a65b1269d6e60a,true).
'x_<=='(x_choiceSetFromSentenceAll(V1,V2),x_choiceSetFromSentence(V1,V2)) :- x_cid(a65b1269d6e60b,V1,V2).
xc_microtheory(a65b1269d6e60b,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e60b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e60b,342).
xc_kb_names(a65b1269d6e60b,["?csid","?sid"]).
xc_mapping_rows(a65b1269d6e60b,[]).
xc_exclude_globals(a65b1269d6e60b,true).
'x_<=='(x_choiceSetFromSentenceAll(V1,V2),x_subSentence(V3,V2,V4),x_choiceSetFromSentence(V1,V3)) :- x_cid(a65b1269d6e60c,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e60c,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e60c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e60c,345).
xc_kb_names(a65b1269d6e60c,["?csid","?sid","?subsid","?subpos"]).
xc_mapping_rows(a65b1269d6e60c,[]).
xc_exclude_globals(a65b1269d6e60c,true).
'x_<=='(x_parentSentenceId(V1,V2),x_subSentence(V2,V1,V3)) :- x_cid(a65b1269d6e60d,V1,V2,V3).
xc_microtheory(a65b1269d6e60d,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e60d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e60d,349).
xc_kb_names(a65b1269d6e60d,["?parent-sid","?sid","?subpos"]).
xc_mapping_rows(a65b1269d6e60d,[]).
xc_exclude_globals(a65b1269d6e60d,true).
'x_<=='(x_parentSentenceId(V1,V1),x_uninferredSentence(x_subSentence(V1,V2,V3))) :- x_cid(a65b1269d6e60e,V1,V2,V3).
xc_microtheory(a65b1269d6e60e,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e60e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e60e,352).
xc_kb_names(a65b1269d6e60e,["?sid","?parent-sid","?subpos"]).
xc_mapping_rows(a65b1269d6e60e,[]).
xc_exclude_globals(a65b1269d6e60e,true).
'x_<=='(x_leadsTo(V1,V2),x_headVarForDrs(x_cconj(V1,V2),V3)) :- x_cid(a65b1269d6e60f,V1,V2,V3).
xc_microtheory(a65b1269d6e60f,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e60f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e60f,361).
xc_kb_names(a65b1269d6e60f,["?prior","?later","?drs-id"]).
xc_mapping_rows(a65b1269d6e60f,[]).
xc_exclude_globals(a65b1269d6e60f,true).
'x_<=='(x_leadsTo(V1,V2),x_verbAside(V1,V2),x_verbForm(V1,V3,'x_Non-Perfect',V4)) :- x_cid(a65b1269d6e610,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e610,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e610,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e610,365).
xc_kb_names(a65b1269d6e610,["?prior","?latter","?form","?progressive"]).
xc_mapping_rows(a65b1269d6e610,[]).
xc_exclude_globals(a65b1269d6e610,true).
'x_<=='(x_leadsTo(V1,V2),x_headVarForDrs(x_sconj(V1,x_when,V2),V3)) :- x_cid(a65b1269d6e611,V1,V2,V3).
xc_microtheory(a65b1269d6e611,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e611,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e611,370).
xc_kb_names(a65b1269d6e611,["?prior","?later","?drs-id"]).
xc_mapping_rows(a65b1269d6e611,[]).
xc_exclude_globals(a65b1269d6e611,true).
'x_<=='(x_leadsTo(V1,V2),x_groundExpression(V1),x_variableInUniverse(V1,V3,x_Clause),x_drsForSentence(V3,V4),x_placedAfter(x_ReferencePointFn(V4),V1),x_priorSentenceInDiscourse(V5,V4),x_drsForSentence(V6,V5),x_headVarForDrs(V7,V6),x_priorInHeadVar(V7,V2)) :- x_cid(a65b1269d6e612,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269d6e612,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e612,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e612,374).
xc_kb_names(a65b1269d6e612,["?prior","?later","?prior-sdrs-id","?prior-sid","?sid","?sdrs-id","?head-var"]).
xc_mapping_rows(a65b1269d6e612,[]).
xc_exclude_globals(a65b1269d6e612,true).
'x_<=='(x_leadsTo(V1,V2),x_groundExpression(V2),x_variableInUniverse(V2,V3,x_Clause),x_contextIndependentDrsFor(V3,V4),x_headVarForDrs(V5,V3),x_priorInHeadVar(V5,V2),x_priorSentenceInDiscourse(V4,V6),x_placedAfter(x_ReferencePointFn(V6),V1)) :- x_cid(a65b1269d6e613,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269d6e613,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e613,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e613,386).
xc_kb_names(a65b1269d6e613,["?prior","?later","?sdrs-id","?sid","?head-var","?prior-sid"]).
xc_mapping_rows(a65b1269d6e613,[]).
xc_exclude_globals(a65b1269d6e613,true).
'x_<=='(x_placedDuring(x_ReferencePointFn(V1),V2),x_contextIndependentDrsFor(V3,V1),x_headVarForDrs(V4,V3),x_trueInDrs(V3,x_isa(V4,x_BeginningAnActivity)),x_trueInDrs(V3,x_activityBegun(V4,x_DrsCaseFn(V5))),x_headVarForDrs(V2,V5)) :- x_cid(a65b1269d6e614,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269d6e614,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e614,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e614,402).
xc_kb_names(a65b1269d6e614,["?sid","?activity","?drs-id","?event","?activity-drs-id"]).
xc_mapping_rows(a65b1269d6e614,[]).
xc_exclude_globals(a65b1269d6e614,true).
'x_<=='(x_placedAfter(x_ReferencePointFn(V1),V2),x_contextIndependentDrsFor(V3,V1),x_headVarForDrs(V2,V3),x_isaInDrs(V2,V3,x_Event),x_verbForm(V2,x_past,V4,'x_Non-Progressive')) :- x_cid(a65b1269d6e615,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e615,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e615,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e615,410).
xc_kb_names(a65b1269d6e615,["?sid","?event","?drs-id","?perfect"]).
xc_mapping_rows(a65b1269d6e615,[]).
xc_exclude_globals(a65b1269d6e615,true).
'x_<=='(x_placedAfter(x_ReferencePointFn(V1),V2),x_contextIndependentDrsFor(V3,V1),x_headVarForDrs(x_cconj(V4,V2),V3),x_isaInDrs(V4,V3,x_Event),x_verbForm(V4,x_past,V5,'x_Non-Progressive'),x_isaInDrs(V2,V3,x_Event),x_verbForm(V2,x_past,V5,'x_Non-Progressive')) :- x_cid(a65b1269d6e616,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269d6e616,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e616,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e616,417).
xc_kb_names(a65b1269d6e616,["?sid","?latter","?drs-id","?former","?perfect"]).
xc_mapping_rows(a65b1269d6e616,[]).
xc_exclude_globals(a65b1269d6e616,true).
'x_<=='(x_placedAfter(x_ReferencePointFn(V1),V2),x_contextIndependentDrsFor(V3,V1),x_headVarForDrs(x_cconj(V4,V2),V3),x_isaInDrs(V4,V3,x_Situation),x_isaInDrs(V2,V3,x_Event),x_verbForm(V2,x_past,V5,'x_Non-Progressive')) :- x_cid(a65b1269d6e617,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269d6e617,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e617,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e617,425).
xc_kb_names(a65b1269d6e617,["?sid","?latter","?drs-id","?former","?perfect"]).
xc_mapping_rows(a65b1269d6e617,[]).
xc_exclude_globals(a65b1269d6e617,true).
'x_<=='(x_placedAfter(x_ReferencePointFn(V1),V2),x_contextIndependentDrsFor(V3,V1),x_headVarForDrs(x_sconj(V4,x_when,V2),V3),x_isaInDrs(V2,V3,x_Event),x_verbForm(V2,x_past,'x_Non-Perfect','x_Non-Progressive')) :- x_cid(a65b1269d6e618,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e618,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e618,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e618,433).
xc_kb_names(a65b1269d6e618,["?sid","?latter","?drs-id","?former"]).
xc_mapping_rows(a65b1269d6e618,[]).
xc_exclude_globals(a65b1269d6e618,true).
'x_<=='(x_isaInOrLiftToDrs(V1,V2,V3,V4),x_isaInDrs(V2,V3,V4)) :- x_cid(a65b1269d6e619,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e619,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e619,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e619,444).
xc_kb_names(a65b1269d6e619,["?sid","?var","?drs-id","?col"]).
xc_mapping_rows(a65b1269d6e619,[]).
xc_exclude_globals(a65b1269d6e619,true).
'x_<=='(x_isaInOrLiftToDrs(V1,V2,V3,V4),x_groundExpression(V2),x_groundExpression(V1),x_drsForDiscourse(V3),x_variableInUniverse(V2,V5,x_Clause),x_drsPriorInDiscourse(V5,V1),x_lookupOnly(x_numAnswers(1,'x_ist-Information'(x_DrsCaseFn(V5),x_isa(V2,V4)))),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V3),x_isa(V2,V4)),x_TheList(x_variableInUniverse(V2,V5,x_Clause),x_drsPriorInDiscourse(V5,V1),x_isaInDrs(V2,V5,V4))))) :- x_cid(a65b1269d6e61a,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269d6e61a,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e61a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e61a,447).
xc_kb_names(a65b1269d6e61a,["?sid","?var","?drs-id","?col","?sdrs-id"]).
xc_mapping_rows(a65b1269d6e61a,[]).
xc_exclude_globals(a65b1269d6e61a,true).
'x_<=='(x_isaInOrLiftToDrs(V1,V2,V3,V4),x_groundExpression(V1),x_groundExpression(V3),x_sourceDrsForDrs(V5,V3,V6),x_drsPriorInDiscourse(V5,V1),x_numAnswers(1,x_isaInDrs(V2,V5,V4)),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V3),x_isa(V2,V4)),x_TheList(x_sourceDrsForDrs(V5,V3,V6),x_drsPriorInDiscourse(V5,V1),x_isaInDrs(V2,V5,V4))))) :- x_cid(a65b1269d6e61b,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269d6e61b,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e61b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e61b,463).
xc_kb_names(a65b1269d6e61b,["?sid","?var","?drs-id","?col","?sdrs-id","?emb-expr"]).
xc_mapping_rows(a65b1269d6e61b,[]).
xc_exclude_globals(a65b1269d6e61b,true).
'x_<=='(x_isaInOrLiftToDrs(V1,V2,V3,V4),x_groundExpression(V2),x_groundExpression(V1),x_drsForDiscourse(V3),x_numAnswers(1,x_priorSentenceInDiscourse(V1,V5)),x_lookupOnly(x_wmOnly(x_referent(x_ReferenceInSentenceFn(V6,V5),x_ReferentInDrsFn(V2,V7)))),x_variableInUniverse(V6,V8,x_Clause),x_numAnswers(1,x_isaInDrs(V6,V8,V4)),x_forEffectOnly(x_justify('x_ist-Information'(x_DrsCaseFn(V3),x_isa(V2,V4)),x_TheList(x_referent(x_ReferenceInSentenceFn(V6,V5),x_ReferentInDrsFn(V2,V7)),x_priorSentenceInDiscourse(V1,V5),x_variableInUniverse(V6,V8,x_Clause),x_isaInDrs(V6,V8,V4))))) :- x_cid(a65b1269d6e61c,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1269d6e61c,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e61c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e61c,478).
xc_kb_names(a65b1269d6e61c,["?sid","?var","?drs-id","?col","?prior-sid","?reference","?referent-drs-id","?ref-drs-id"]).
xc_mapping_rows(a65b1269d6e61c,[]).
xc_exclude_globals(a65b1269d6e61c,true).
'x_<=='(x_variableInOrLiftToUniverse(V1,V2),x_variableInUniverse(V1,V2,x_Discourse)) :- x_cid(a65b1269d6e61d,V1,V2).
xc_microtheory(a65b1269d6e61d,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e61d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e61d,499).
xc_kb_names(a65b1269d6e61d,["?var","?drs-id"]).
xc_mapping_rows(a65b1269d6e61d,[]).
xc_exclude_globals(a65b1269d6e61d,true).
'x_<=='(x_variableInOrLiftToUniverse(V1,V2),x_sourceDrsForDrs(V3,V2,V4),x_variableInUniverse(V5,V3,x_Clause),x_resolveReference(x_ReferenceInSentenceFn(V5,V6),x_ReferentInDrsFn(V1,V2)),x_forEffectOnly(x_justify(x_variableInUniverse(V1,V2,x_Discourse),x_TheList(x_variableInUniverse(V5,V3,x_Clause),x_resolveReference(x_ReferenceInSentenceFn(V5,V6),x_ReferentInDrsFn(V1,V2)))))) :- x_cid(a65b1269d6e61e,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269d6e61e,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e61e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e61e,502).
xc_kb_names(a65b1269d6e61e,["?var","?drs-id","?sdrs-id","?emb-expr","?svar","?sid"]).
xc_mapping_rows(a65b1269d6e61e,[]).
xc_exclude_globals(a65b1269d6e61e,true).
'x_<=='(x_trueInOrLiftToDrs(V1,V2),x_not(x_variableExpression(V2)),x_localOnly(x_lookupOnly(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V1),V2))))) :- x_cid(a65b1269d6e61f,V1,V2).
xc_microtheory(a65b1269d6e61f,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e61f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e61f,514).
xc_kb_names(a65b1269d6e61f,["?drs-id","?fact"]).
xc_mapping_rows(a65b1269d6e61f,[]).
xc_exclude_globals(a65b1269d6e61f,true).
'x_<=='(x_trueInOrLiftToDrs(V1,V2),x_groundExpression(V1),x_not(x_variableExpression(V2)),x_not(x_matches(x_isa(V3,V4),x_fact)),x_uninferredSentence(x_localOnly(x_lookupOnly(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V1),V2))))),x_numAnswers(1,x_sourceDrsForDrs(V5,V1,V6)),x_drsEntailedBySentence(V5,V7),x_resolveToLocalForm(V1,V2,V7,V8),x_localOnly(x_lookupOnly(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),V8)))),x_resolveToGlobalForm(V1,V2,V7,V5,V8)) :- x_cid(a65b1269d6e620,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b1269d6e620,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e620,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e620,523).
xc_kb_names(a65b1269d6e620,["?drs-id","?fact","?v","?c","?sdrs-id","?emb-exp","?sid","?source-query"]).
xc_mapping_rows(a65b1269d6e620,[]).
xc_exclude_globals(a65b1269d6e620,true).
'x_<=='(x_trueInOrLiftToDrs(V1,V2),x_groundExpression(V1),x_not(x_variableExpression(V2)),x_unifies(x_isa(V3,V4),V2),x_drsForDiscourse(V1),x_variableInUniverse(V3,V5,x_Clause),x_drsEntailedBySentence(V5,V6),x_resolveToLocalForm(V1,x_isa(V3,V4),V6,V7),x_localOnly(x_lookupOnly(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),V7)))),x_resolveToGlobalForm(V1,x_isa(V3,V4),V6,V5,V7)) :- x_cid(a65b1269d6e621,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1269d6e621,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e621,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e621,547).
xc_kb_names(a65b1269d6e621,["?drs-id","?fact","?var","?col","?sdrs-id","?sid","?source-query"]).
xc_mapping_rows(a65b1269d6e621,[]).
xc_exclude_globals(a65b1269d6e621,true).
'x_<=='(x_resolveToLocalForm(V1,V2,V3,V4),x_groundExpression(V1),x_groundExpression(V3),x_not(x_variableExpresssion(V2)),x_evaluate(V5,x_SetToListFn(x_TheClosedRetrievalSetOf(V6,x_and(x_termFormulas(V2,V6),x_lookupOnly(x_wmOnly(x_variableInUniverse(V6,V7,x_Discourse))))))),x_evaluate(V8,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V9,V10),x_and(x_resolveReference(x_ReferenceInSentenceFn(V11,V3),x_ReferentInDrsFn(V9,V1)),x_unifies(V10,t(V9,V11))))))),x_evaluate(V4,x_SublisFn(V8,V2))) :- x_cid(a65b1269d6e622,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b1269d6e622,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e622,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e622,566).
xc_kb_names(a65b1269d6e622,["?ddrs-id","?global-form","?sid","?local-form","?dvars","?dvar","?drs","?blist","?dv","?binding","?inst-dv"]).
xc_mapping_rows(a65b1269d6e622,[]).
xc_exclude_globals(a65b1269d6e622,true).
'x_<=='(x_resolveToGlobalForm(V1,V2,V3,V4),x_groundExpression(V1),x_groundExpression(V3),x_not(x_variableExpression(V4)),x_evaluate(V5,x_SetToListFn(x_TheClosedRetrievalSetOf(V6,x_and(x_termFormulas(V4,V6),x_lookupOnly(x_wmOnly(x_variableInUniverse(V6,V7,x_Clause))))))),x_evaluate(V8,x_MapFunctionOverList(x_FunctionToArg(2,x_Kappa(t(V9,V10),x_and(x_resolveReference(x_ReferenceInSentenceFn(V9,V3),x_ReferentInDrsFn(V11,V1)),x_unifies(V10,t(V9,V11))))))),x_evaluate(V2,x_SublisFn(V8,V4))) :- x_cid(a65b1269d6e623,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b1269d6e623,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e623,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e623,588).
xc_kb_names(a65b1269d6e623,["?ddrs-id","?global-form","?sid","?local-form","?dvars","?dvar","?drs","?blist","?dv","?binding","?global-dv"]).
xc_mapping_rows(a65b1269d6e623,[]).
xc_exclude_globals(a65b1269d6e623,true).
'x_<=='(x_sourceDrsForDrs(V1,V2,V3),x_groundExpression(V1),x_groundExpression(V3),x_individualSatisfyingConditions(V2,x_DRS,x_TheSet(V3))) :- x_cid(a65b1269d6e624,V1,V2,V3).
xc_microtheory(a65b1269d6e624,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e624,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e624,616).
xc_kb_names(a65b1269d6e624,["?sdrs-id","?ddrs-id","?emb-expr"]).
xc_mapping_rows(a65b1269d6e624,[]).
xc_exclude_globals(a65b1269d6e624,true).
'x_<=='(x_spanAfterInSentence(V1,V2),x_dvSpan(V1,x_SpanFn(V3,V4)),x_dvSpan(V2,x_SpanFn(V5,V6)),x_greaterThan(V3,V6)) :- x_cid(a65b1269d6e625,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1269d6e625,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e625,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e625,627).
xc_kb_names(a65b1269d6e625,["?dv1","?dv2","?s1","?e1","?s2","?e2"]).
xc_mapping_rows(a65b1269d6e625,[]).
xc_exclude_globals(a65b1269d6e625,true).
'x_<=='(x_dvSpan(V1,x_SpanFn(V2,V3)),x_dvSpanInParseTree(V1,x_SpanFn(V2,V3),x_ParseTreeFn(V4,V5))) :- x_cid(a65b1269d6e626,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269d6e626,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e626,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e626,632).
xc_kb_names(a65b1269d6e626,["?dv","?s","?e","?sid","?ptid"]).
xc_mapping_rows(a65b1269d6e626,[]).
xc_exclude_globals(a65b1269d6e626,true).
'x_<=='(x_dvSpan(V1,x_SpanFn(V2,V3)),x_variableInUniverse(V1,V4,x_Clause),x_lookupOnly(x_localOnly(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V4),'x_implies-DrsDrs'(x_DrsCaseFn(V5),x_DrsCaseFn(V6)))))),x_lookupOnly(x_localOnly(x_wmOnly('x_ist-Information'(x_DrsCaseFn(V5),x_member(V7,V1))))),x_dvSpanInParseTree(V7,x_SpanFn(V2,V3),x_ParseTreeFn(V8,V9)),x_validParseTree(V9)) :- x_cid(a65b1269d6e627,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b1269d6e627,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e627,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e627,637).
xc_kb_names(a65b1269d6e627,["?dv","?s","?e","?drs-id","?ante-drs-id","?cons-drs-id","?elt","?sid","?ptid"]).
xc_mapping_rows(a65b1269d6e627,[]).
xc_exclude_globals(a65b1269d6e627,true).
'x_<=='(x_sentenceAdjunct(V1,V2),x_sentenceAdjunctAdverbial(x_ParseTreeFn(V1,V3),V2),x_validParseTree(V3)) :- x_cid(a65b1269d6e628,V1,V2,V3).
xc_microtheory(a65b1269d6e628,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e628,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e628,656).
xc_kb_names(a65b1269d6e628,["?sid","?adjunct","?ptid"]).
xc_mapping_rows(a65b1269d6e628,[]).
xc_exclude_globals(a65b1269d6e628,true).
'x_<=='(x_atLeastAmount(V1,V1)) :- x_cid(a65b1269d6e629,V1).
xc_microtheory(a65b1269d6e629,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e629,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e629,664).
xc_kb_names(a65b1269d6e629,["?x"]).
xc_mapping_rows(a65b1269d6e629,[]).
xc_exclude_globals(a65b1269d6e629,true).
'x_<=='(x_trueViaSpecPred(V1,V2,V3,V4),x_groundExpression(t(V2,V3,V4)),x_lookupOnly('x_ist-Information'(V1,t(V2,V3,V4)))) :- x_cid(a65b1269d6e62a,V1,V2,V3,V4).
xc_microtheory(a65b1269d6e62a,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e62a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e62a,666).
xc_kb_names(a65b1269d6e62a,["?context","?pred","?arg1","?arg2"]).
xc_mapping_rows(a65b1269d6e62a,[]).
xc_exclude_globals(a65b1269d6e62a,true).
'x_<=='(x_trueViaSpecPred(V1,V2,V3,V4),x_groundExpression(t(V2,V3,V4)),x_uninferredSentence(x_lookupOnly('x_ist-Information'(V1,t(V2,V3,V4)))),x_genlPreds(V5,V2),x_lookupOnly('x_ist-Information'(V1,t(V5,V3,V4)))) :- x_cid(a65b1269d6e62b,V1,V2,V3,V4,V5).
xc_microtheory(a65b1269d6e62b,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e62b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e62b,672).
xc_kb_names(a65b1269d6e62b,["?context","?pred","?arg1","?arg2","?specpred"]).
xc_mapping_rows(a65b1269d6e62b,[]).
xc_exclude_globals(a65b1269d6e62b,true).
x_isa(x_allCompatibleDrses,x_TernaryPredicate) :- x_cid(a65b1269d6e62c).
xc_microtheory(a65b1269d6e62c,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e62c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e62c,684).
xc_kb_names(a65b1269d6e62c,[]).
xc_mapping_rows(a65b1269d6e62c,[]).
xc_exclude_globals(a65b1269d6e62c,true).
x_arity(x_allCompatibleDrses,3) :- x_cid(a65b1269d6e62d).
xc_microtheory(a65b1269d6e62d,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e62d,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e62d,685).
xc_kb_names(a65b1269d6e62d,[]).
xc_mapping_rows(a65b1269d6e62d,[]).
xc_exclude_globals(a65b1269d6e62d,true).
x_arg1Isa(x_allCompatibleDrses,x_CycLTerm) :- x_cid(a65b1269d6e62e).
xc_microtheory(a65b1269d6e62e,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e62e,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e62e,686).
xc_kb_names(a65b1269d6e62e,[]).
xc_mapping_rows(a65b1269d6e62e,[]).
xc_exclude_globals(a65b1269d6e62e,true).
x_arg2Isa(x_allCompatibleDrses,x_CycLTerm) :- x_cid(a65b1269d6e62f).
xc_microtheory(a65b1269d6e62f,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e62f,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e62f,687).
xc_kb_names(a65b1269d6e62f,[]).
xc_mapping_rows(a65b1269d6e62f,[]).
xc_exclude_globals(a65b1269d6e62f,true).
x_arg3Isa(x_allCompatibleDrses,x_CycLTerm) :- x_cid(a65b1269d6e630).
xc_microtheory(a65b1269d6e630,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e630,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e630,688).
xc_kb_names(a65b1269d6e630,[]).
xc_mapping_rows(a65b1269d6e630,[]).
xc_exclude_globals(a65b1269d6e630,true).
x_comment(x_allCompatibleDrses,"(allCompatibleDrses ?sid ?drs1 ?drs2) binds drs2 to all the drses of ?sid that follow from the same parse tree as ?drs1.") :- x_cid(a65b1269d6e631).
xc_microtheory(a65b1269d6e631,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e631,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e631,689).
xc_kb_names(a65b1269d6e631,[]).
xc_mapping_rows(a65b1269d6e631,[]).
xc_exclude_globals(a65b1269d6e631,true).
'x_<=='(x_allCompatibleDrses(V1,V2,V3),x_groundExpression(V2),x_equal(V2,V3)) :- x_cid(a65b1269d6e632,V1,V2,V3).
xc_microtheory(a65b1269d6e632,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e632,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e632,691).
xc_kb_names(a65b1269d6e632,["?sid","?drs1","?drs2"]).
xc_mapping_rows(a65b1269d6e632,[]).
xc_exclude_globals(a65b1269d6e632,true).
'x_<=='(x_allCompatibleDrses(V1,V2,V3),x_groundExpression(V2),x_variableExpression(V3),x_drsEntailedBySentence(V3,V1),x_compatibleDrses(V2,V3)) :- x_cid(a65b1269d6e633,V1,V2,V3).
xc_microtheory(a65b1269d6e633,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e633,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e633,695).
xc_kb_names(a65b1269d6e633,["?sid","?drs1","?drs2"]).
xc_mapping_rows(a65b1269d6e633,[]).
xc_exclude_globals(a65b1269d6e633,true).
'x_<=='(x_allCompatibleDrses(V1,V2,V3),x_variableExpression(V2),x_groundExpression(V3),x_drsEntailedBySentence(V2,V1),x_compatibleDrses(V2,V3)) :- x_cid(a65b1269d6e634,V1,V2,V3).
xc_microtheory(a65b1269d6e634,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e634,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e634,701).
xc_kb_names(a65b1269d6e634,["?sid","?drs1","?drs2"]).
xc_mapping_rows(a65b1269d6e634,[]).
xc_exclude_globals(a65b1269d6e634,true).
x_isa(x_compatibleDrses,x_BinaryPredicate) :- x_cid(a65b1269d6e635).
xc_microtheory(a65b1269d6e635,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e635,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e635,707).
xc_kb_names(a65b1269d6e635,[]).
xc_mapping_rows(a65b1269d6e635,[]).
xc_exclude_globals(a65b1269d6e635,true).
x_arity(x_compatibleDrses,2) :- x_cid(a65b1269d6e636).
xc_microtheory(a65b1269d6e636,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e636,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e636,708).
xc_kb_names(a65b1269d6e636,[]).
xc_mapping_rows(a65b1269d6e636,[]).
xc_exclude_globals(a65b1269d6e636,true).
x_arg1Isa(x_compatibleDrses,x_CycLTerm) :- x_cid(a65b1269d6e637).
xc_microtheory(a65b1269d6e637,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e637,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e637,709).
xc_kb_names(a65b1269d6e637,[]).
xc_mapping_rows(a65b1269d6e637,[]).
xc_exclude_globals(a65b1269d6e637,true).
x_arg2Isa(x_compatibleDrses,x_CycLTerm) :- x_cid(a65b1269d6e638).
xc_microtheory(a65b1269d6e638,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e638,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e638,710).
xc_kb_names(a65b1269d6e638,[]).
xc_mapping_rows(a65b1269d6e638,[]).
xc_exclude_globals(a65b1269d6e638,true).
x_comment(x_compatibleDreses,"(compatibleDrses ?drs1 ?drs2) means ?drs1 and ?drs2 derive from the same parse tree.") :- x_cid(a65b1269d6e639).
xc_microtheory(a65b1269d6e639,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e639,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e639,711).
xc_kb_names(a65b1269d6e639,[]).
xc_mapping_rows(a65b1269d6e639,[]).
xc_exclude_globals(a65b1269d6e639,true).
'x_<=='(x_compatibleDrses(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_parseTreeIdForDrs(V1,V3),x_parseTreeIdForDrs(V2,V3)) :- x_cid(a65b1269d6e63a,V1,V2,V3).
xc_microtheory(a65b1269d6e63a,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e63a,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e63a,713).
xc_kb_names(a65b1269d6e63a,["?drs1","?drs2","?ptid"]).
xc_mapping_rows(a65b1269d6e63a,[]).
xc_exclude_globals(a65b1269d6e63a,true).
'x_<=='(x_compatibleDrses(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_uninferredSentence(x_parseTreeIdForDrs(V1,V3))) :- x_cid(a65b1269d6e63b,V1,V2,V3).
xc_microtheory(a65b1269d6e63b,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e63b,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e63b,719).
xc_kb_names(a65b1269d6e63b,["?drs1","?drs2","?ptid"]).
xc_mapping_rows(a65b1269d6e63b,[]).
xc_exclude_globals(a65b1269d6e63b,true).
'x_<=='(x_compatibleDrses(V1,V2),x_groundExpression(V1),x_groundExpression(V2),x_uninferredSentence(x_parseTreeIdForDrs(V2,V3))) :- x_cid(a65b1269d6e63c,V1,V2,V3).
xc_microtheory(a65b1269d6e63c,x_EAStructuralRulesMt).
xc_source_file(a65b1269d6e63c,'c:/snet/petta/repos/openworld_dr/KBs/ea/v8/kbfiles/structural-rules.krf').
xc_source_line(a65b1269d6e63c,725).
xc_kb_names(a65b1269d6e63c,["?drs1","?drs2","?ptid"]).
xc_mapping_rows(a65b1269d6e63c,[]).
xc_exclude_globals(a65b1269d6e63c,true).
kb_cache_footer(footer{count:97,digest:'1d401fc8ebb3e1c926ebc42bea6d4d4d23d0d2369e453c3c4d0906b6fe611e0c',headerDigest:'604775b56a7d948dde8824b45ba5fa16e47dd8c5136009c544b8b24886a60109'}).
