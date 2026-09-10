:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:6,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:22,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:e592eb34d117434cc8a019d6a68f44c41928a48b02372b4609a29f810fe627c2,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoning-InferenceMt.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1922,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoning-InferenceMt.krf',sourceHash:'8bedab7e560f3e30fc5494dc0c96758bda66e4873d3cd499661cb85b487b1c8a',warnings:[]}).
x_isa(x_mtDeonAccessible,x_ModalReasoningMicrotheoryPredicate) :- x_cid(a65b12717e4e59).
xc_microtheory(a65b12717e4e59,'x_DeonticReasoning-InferenceMt').
xc_source_file(a65b12717e4e59,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoning-InferenceMt.krf').
xc_source_line(a65b12717e4e59,3).
xc_kb_names(a65b12717e4e59,[]).
xc_mapping_rows(a65b12717e4e59,[]).
x_isa(x_mtDeonIdeal,x_ModalReasoningMicrotheoryPredicate) :- x_cid(a65b12717e4e5a).
xc_microtheory(a65b12717e4e5a,'x_DeonticReasoning-InferenceMt').
xc_source_file(a65b12717e4e5a,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoning-InferenceMt.krf').
xc_source_line(a65b12717e4e5a,4).
xc_kb_names(a65b12717e4e5a,[]).
xc_mapping_rows(a65b12717e4e5a,[]).
x_comment('x_oughtTo-RoleInType',"An instance of #$TernaryPredicate, used for tersely expressing a certain class of deontic assertions.  #$oughtTo-RoleInType relates an instance of #$IntelligentAgent, a specialization of #$Event, and an instance of #$BinaryRolePredicate, so as to express the deontic requirement that the agent play that role in an event of that type.  For example, (#$oughtTo-RoleInType Person001 #$CharitableDonation #$giver) says that Person001 ought to make a donation to some charity.  (#$oughtTo-RoleInType AGENT EVENT-TYPE ROLE) expands into (#$oughtToDo AGENT (#$relationExistsInstance ROLE EVENT-TYPE AGENT)).") :- x_cid(a65b12717e4e5b).
xc_microtheory(a65b12717e4e5b,'x_DeonticReasoning-InferenceMt').
xc_source_file(a65b12717e4e5b,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoning-InferenceMt.krf').
xc_source_line(a65b12717e4e5b,5).
xc_kb_names(a65b12717e4e5b,[]).
xc_mapping_rows(a65b12717e4e5b,[]).
x_comment(x_mtDeonIdeal,"(#$mtDeonIdeal MT-0 MT-1) means that from the point of view\nof MT-0, MT-1 is considered deontically ideal --- everything ought to\nbe the case in MT-0 is in fact the case in MT-1, and everthing is in\nfact the case in MT-1 is permissible to be the case in MT-0.  That is\nto say, for each PROP, (#$oughtToBe PROP) holds in MT-0 only if PROP\nholds in MT-1, and PROP holds in MT-1 only if (#$permittedToBe PROP)\nholds in MT-0.") :- x_cid(a65b12717e4e5c).
xc_microtheory(a65b12717e4e5c,'x_DeonticReasoning-InferenceMt').
xc_source_file(a65b12717e4e5c,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoning-InferenceMt.krf').
xc_source_line(a65b12717e4e5c,6).
xc_kb_names(a65b12717e4e5c,[]).
xc_mapping_rows(a65b12717e4e5c,[]).
x_comment(x_mtDeonAccessible,"(#$mtDeonAccessible MT-0 MT-1) means that the contents in\nMT-1 are considered deontically possible from the point of view of\nMT-0.  This relation is used to carry out inference using\nmicrotheories in an application involving deontic to-be operators.\nFor each such application, #$mtDeonAccessible is a universal relation\namong relevant instances of #$DeonticReasoningMicrotheory.  Although\nsuch a universal relation determines a fixed set of microtheories, the\nreasoning we use such a relation is technical --- we want to take\nadvantage of the supported microtheory predicate #$mtConverts-Ops.") :- x_cid(a65b12717e4e5d).
xc_microtheory(a65b12717e4e5d,'x_DeonticReasoning-InferenceMt').
xc_source_file(a65b12717e4e5d,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoning-InferenceMt.krf').
xc_source_line(a65b12717e4e5d,13).
xc_kb_names(a65b12717e4e5d,[]).
xc_mapping_rows(a65b12717e4e5d,[]).
x_genlPreds(x_mtDeonIdeal,x_mtDeonAccessible) :- x_cid(a65b12717e4e5e).
xc_microtheory(a65b12717e4e5e,'x_DeonticReasoning-InferenceMt').
xc_source_file(a65b12717e4e5e,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/nextkb/DeonticReasoning-InferenceMt.krf').
xc_source_line(a65b12717e4e5e,22).
xc_kb_names(a65b12717e4e5e,[]).
xc_mapping_rows(a65b12717e4e5e,[]).
kb_cache_footer(footer{count:6,digest:e592eb34d117434cc8a019d6a68f44c41928a48b02372b4609a29f810fe627c2,headerDigest:'6d355e2f30f9d63d4dfda8157d8172ae157b05d25c521c908faeae6f36cc6f37'}).
