:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:2,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:34,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'177293e978803819e6053219e99be4914c5a74c54942f661995ba63ef97c1447',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/wm-reminding/reminding-solve-suggestions.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1576,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/wm-reminding/reminding-solve-suggestions.krf',sourceHash:'09ce91f8eb3a7fe34119343755b92c617b9a6c8fd27e9b78602b5e468e9d5b76',warnings:[]}).
x_defSuggestion(x_FoundReminding,x_remindedOf(V1,V2,V3,V4,V5),':test',x_outsourcedOnly(x_sageWMSelect(V1,V2,V6,V7)),':subgoals',t(x_wmOnly(x_sageWMSelect(V1,V2,V6,V7)),x_unifies(V3,V6),x_unifies(V4,V7)),':documentation',"if a reminding exist for the given probe, it returns it") :- x_cid(a65b1281748101,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b1281748101,x_RemindingSuggestionsMt).
xc_source_file(a65b1281748101,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/wm-reminding/reminding-solve-suggestions.krf').
xc_source_line(a65b1281748101,15).
xc_kb_names(a65b1281748101,["?probe","?context","?reminding","?mapping","?sub-episode-id","?cand-reminding","?cand-mapping"]).
xc_mapping_rows(a65b1281748101,[]).
x_defSuggestion(x_NoRemindingFound,x_remindedOf(V1,V2,V3,V4,V5),':cost-function',2,':subgoals',t(x_unifies(V1,V3),x_unifies(V1,V4)),':documentation',"if a reminding can't be found return the probe itself as its reminding") :- x_cid(a65b1281748102,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281748102,x_RemindingSuggestionsMt).
xc_source_file(a65b1281748102,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/wm-reminding/reminding-solve-suggestions.krf').
xc_source_line(a65b1281748102,23).
xc_kb_names(a65b1281748102,["?probe","?context","?reminding","?mapping","?sub-episode-id"]).
xc_mapping_rows(a65b1281748102,[]).
kb_cache_footer(footer{count:2,digest:'177293e978803819e6053219e99be4914c5a74c54942f661995ba63ef97c1447',headerDigest:'7e26ec6194df6f2611fbc189311f5cdfca0799ea2757c866541f48fcfd63dbed'}).
