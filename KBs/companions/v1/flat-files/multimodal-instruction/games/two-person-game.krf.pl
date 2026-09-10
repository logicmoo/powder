:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:8,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:44,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:c0c929050efc8b759c790778dba9d4260836c6240c934a75c603a42a90c8d40a,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1141,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf',sourceHash:'398c4ecbb05a86a9bc6570bbed0587ff040b54a3fb8464463e3523254a7a0cc3',warnings:[]}).
x_genlMt(x_GameRulesMtFn(x_TwoPersonGame),x_FmiGamesMt) :- x_cid(a65b1329ff444c).
xc_microtheory(a65b1329ff444c,x_GameRulesMtFn(x_TwoPersonGame)).
xc_source_file(a65b1329ff444c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf').
xc_source_line(a65b1329ff444c,5).
xc_kb_names(a65b1329ff444c,[]).
xc_mapping_rows(a65b1329ff444c,[]).
x_isa(x_control,x_GamePredicate) :- x_cid(a65b1329ff444d).
xc_microtheory(a65b1329ff444d,x_GameRulesMtFn(x_TwoPersonGame)).
xc_source_file(a65b1329ff444d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf').
xc_source_line(a65b1329ff444d,14).
xc_kb_names(a65b1329ff444d,[]).
xc_mapping_rows(a65b1329ff444d,[]).
x_arity(x_control,1) :- x_cid(a65b1329ff444e).
xc_microtheory(a65b1329ff444e,x_GameRulesMtFn(x_TwoPersonGame)).
xc_source_file(a65b1329ff444e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf').
xc_source_line(a65b1329ff444e,15).
xc_kb_names(a65b1329ff444e,[]).
xc_mapping_rows(a65b1329ff444e,[]).
x_isa(x_opponent,x_GamePredicate) :- x_cid(a65b1329ff444f).
xc_microtheory(a65b1329ff444f,x_GameRulesMtFn(x_TwoPersonGame)).
xc_source_file(a65b1329ff444f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf').
xc_source_line(a65b1329ff444f,17).
xc_kb_names(a65b1329ff444f,[]).
xc_mapping_rows(a65b1329ff444f,[]).
x_arity(x_opponent,2) :- x_cid(a65b1329ff4450).
xc_microtheory(a65b1329ff4450,x_GameRulesMtFn(x_TwoPersonGame)).
xc_source_file(a65b1329ff4450,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf').
xc_source_line(a65b1329ff4450,18).
xc_kb_names(a65b1329ff4450,[]).
xc_mapping_rows(a65b1329ff4450,[]).
'x_<=='(x_next(x_control(V1)),x_currentlyTrue(x_control(V2)),x_numAnswers(1,x_gameDomain(V3)),x_allFactsAllowed(x_lookupOnly(x_localOnly(x_nonTransitiveInference('x_ist-Information'(x_GameRulesMtFn(V3),x_isa(V1,x_GameRole)))))),x_different(V1,V2)) :- x_cid(a65b1329ff4451,V1,V2,V3).
xc_microtheory(a65b1329ff4451,x_GameRulesMtFn(x_TwoPersonGame)).
xc_source_file(a65b1329ff4451,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf').
xc_source_line(a65b1329ff4451,23).
xc_kb_names(a65b1329ff4451,["?player","?other-player","?domain"]).
xc_mapping_rows(a65b1329ff4451,[]).
'x_<=='(x_terminalState,x_goalState(V1,100)) :- x_cid(a65b1329ff4452,V1).
xc_microtheory(a65b1329ff4452,x_GameRulesMtFn(x_TwoPersonGame)).
xc_source_file(a65b1329ff4452,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf').
xc_source_line(a65b1329ff4452,36).
xc_kb_names(a65b1329ff4452,["?player"]).
xc_mapping_rows(a65b1329ff4452,[]).
'x_<=='(x_terminalState,x_currentlyTrue(x_control(V1)),x_uninferredSentence(x_legal(V1,V2))) :- x_cid(a65b1329ff4453,V1,V2).
xc_microtheory(a65b1329ff4453,x_GameRulesMtFn(x_TwoPersonGame)).
xc_source_file(a65b1329ff4453,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/two-person-game.krf').
xc_source_line(a65b1329ff4453,39).
xc_kb_names(a65b1329ff4453,["?who","?action"]).
xc_mapping_rows(a65b1329ff4453,[]).
kb_cache_footer(footer{count:8,digest:c0c929050efc8b759c790778dba9d4260836c6240c934a75c603a42a90c8d40a,headerDigest:'12c8c41ae4c92df4424b6f204a00d56e9e357be23f9085c8761428eb9b0f08fd'}).
