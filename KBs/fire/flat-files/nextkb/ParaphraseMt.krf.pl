:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:9,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:11,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'2ceb0555a9c12105822101228610c067620c959bab7c031e90274f0c3b4c91b4',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:2743,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf',sourceHash:a9dcf64a3c5f74389119b5d57e4d0ce6fef953d6f66c81a0d2e92c2eadfc47d9,warnings:[]}).
x_isa(x_generateArgWithOutsideScope,x_NLGenerationPredicate) :- x_cid(a65b1276122fc0).
xc_microtheory(a65b1276122fc0,x_ParaphraseMt).
xc_source_file(a65b1276122fc0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf').
xc_source_line(a65b1276122fc0,3).
xc_kb_names(a65b1276122fc0,[]).
xc_mapping_rows(a65b1276122fc0,[]).
x_isa(x_generateQuantOverArg,x_NLGenerationPredicate) :- x_cid(a65b1276122fc1).
xc_microtheory(a65b1276122fc1,x_ParaphraseMt).
xc_source_file(a65b1276122fc1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf').
xc_source_line(a65b1276122fc1,4).
xc_kb_names(a65b1276122fc1,[]).
xc_mapping_rows(a65b1276122fc1,[]).
x_arityMin(x_JoinListsFn,1) :- x_cid(a65b1276122fc2).
xc_microtheory(a65b1276122fc2,x_ParaphraseMt).
xc_source_file(a65b1276122fc2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf').
xc_source_line(a65b1276122fc2,5).
xc_kb_names(a65b1276122fc2,[]).
xc_mapping_rows(a65b1276122fc2,[]).
x_arityMin(x_and,1) :- x_cid(a65b1276122fc3).
xc_microtheory(a65b1276122fc3,x_ParaphraseMt).
xc_source_file(a65b1276122fc3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf').
xc_source_line(a65b1276122fc3,6).
xc_kb_names(a65b1276122fc3,[]).
xc_mapping_rows(a65b1276122fc3,[]).
x_comment(x_generateQuantOverArg,"(#$generateQuantOverArg PRED QUANT ARG) says that for any sentence S in which PRED is the arg0, the generation code should paraphrase S so as to use the #$NLQuantAttribute QUANT as a determinter for the NBar generated for the expression in arg place ARG.  For example, (#$generateQuantOverArg #$relationExistsAll #$Some-NLAttr 2) says that for any sentence S of the form (#$relationExistsAll REL ARG2 ARG3), the generation code should paraphrase S so as to include the string 'some X,' where 'X' is the NBar generated for the term appearing in the 2nd argument place.") :- x_cid(a65b1276122fc4).
xc_microtheory(a65b1276122fc4,x_ParaphraseMt).
xc_source_file(a65b1276122fc4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf').
xc_source_line(a65b1276122fc4,7).
xc_kb_names(a65b1276122fc4,[]).
xc_mapping_rows(a65b1276122fc4,[]).
x_comment(x_generateArgWithOutsideScope,"(#$generateArgWithOutsideScope PRED ARG) says that for any sentence S in which PRED is the arg0, NL generation should give the NL quantifier expression 'associated' with argument place ARG wide scope.  The 'association' relationship that matters here is the one identified in the relevant #$generateQuantOverArg assertion. So, for example, since (#$generateQuantOverArg #$relationAllExists #$Every-NLAttr 2), if we assert (#$generateArgWithOutsideScope #$relationAllExists 2), the paraprase code should generate any #$relationAllExists sentence with the universal quantifier outscoping the existential quantifier.") :- x_cid(a65b1276122fc5).
xc_microtheory(a65b1276122fc5,x_ParaphraseMt).
xc_source_file(a65b1276122fc5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf').
xc_source_line(a65b1276122fc5,8).
xc_kb_names(a65b1276122fc5,[]).
xc_mapping_rows(a65b1276122fc5,[]).
x_comment(x_relatedArgPositions,"(#$relatedArgPositions RMP N M) means that in RMP's #$expansion, the variable that with the argument position number N to RMP occupies argument number M in literals constructed out of predicates associated with RMP.  For example, the expansion of (#$relationAllExists #$loves #$Cat #$Dog) is such that a variable ranging over the position occupied by #$Cat appears in the first argument position of #$loves.  Since #$Cat is the second argument of #$relationAllExists, and a variable associated with #$Cat is in the first argument of #$loves, (#$relatedArgPositions #$relationAllExists 2 1).") :- x_cid(a65b1276122fc6).
xc_microtheory(a65b1276122fc6,x_ParaphraseMt).
xc_source_file(a65b1276122fc6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf').
xc_source_line(a65b1276122fc6,9).
xc_kb_names(a65b1276122fc6,[]).
xc_mapping_rows(a65b1276122fc6,[]).
x_comment(x_QuotedParaphraseFn,"(#$QuotedParaphraseFn PHRASE) denotes a 'quoted' form of PHRASE, printed out with quotes, designated with the speaker making quote signs with the index and middle fingers of each hand, speech-generated with 'open quote' and 'close quote', etc., depending on the paraphrase medium.") :- x_cid(a65b1276122fc7).
xc_microtheory(a65b1276122fc7,x_ParaphraseMt).
xc_source_file(a65b1276122fc7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf').
xc_source_line(a65b1276122fc7,10).
xc_kb_names(a65b1276122fc7,[]).
xc_mapping_rows(a65b1276122fc7,[]).
x_comment(x_RepeatForSubsequentArgsFn,"(#$RepeatForSubsequentArgsFn TEMPLATE PHRASE) denotes a sequence of sentential constituents, starting with PHRASE - which should reference TEMPLATE - and continuing for the rest of the arguments of the formula of which TEMPLATE denotes a top-level argument, substituting the subsequent arguments of that formula for TEMPLATE.") :- x_cid(a65b1276122fc8).
xc_microtheory(a65b1276122fc8,x_ParaphraseMt).
xc_source_file(a65b1276122fc8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/ParaphraseMt.krf').
xc_source_line(a65b1276122fc8,11).
xc_kb_names(a65b1276122fc8,[]).
xc_mapping_rows(a65b1276122fc8,[]).
kb_cache_footer(footer{count:9,digest:'2ceb0555a9c12105822101228610c067620c959bab7c031e90274f0c3b4c91b4',headerDigest:f6e770094ff16f804a5c375025d944c95c375f1196eb2be17394d39689734922}).
