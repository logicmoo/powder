:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:9,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:54,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'90b4290b3fe967f5468f7ceea26340495b0e8919c22633872073b0d42483828f',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1421,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf',sourceHash:'6297b75236085f373feec70e4cbaa1d786a784259165a0d7dc9d44d754d5d646',warnings:[]}).
x_genlMt(x_GameRulesMtFn(x_MarkingGame),x_FmiGamesMt) :- x_cid(a65b1329f64979).
xc_microtheory(a65b1329f64979,x_GameRulesMtFn(x_MarkingGame)).
xc_source_file(a65b1329f64979,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf').
xc_source_line(a65b1329f64979,5).
xc_kb_names(a65b1329f64979,[]).
xc_mapping_rows(a65b1329f64979,[]).
x_spatialLocationPred(x_MarkingGame,x_cell,3) :- x_cid(a65b1329f6497a).
xc_microtheory(a65b1329f6497a,x_GameRulesMtFn(x_MarkingGame)).
xc_source_file(a65b1329f6497a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf').
xc_source_line(a65b1329f6497a,7).
xc_kb_names(a65b1329f6497a,[]).
xc_mapping_rows(a65b1329f6497a,[]).
x_isa(x_cell,x_GamePredicate) :- x_cid(a65b1329f6497b).
xc_microtheory(a65b1329f6497b,x_GameRulesMtFn(x_MarkingGame)).
xc_source_file(a65b1329f6497b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf').
xc_source_line(a65b1329f6497b,9).
xc_kb_names(a65b1329f6497b,[]).
xc_mapping_rows(a65b1329f6497b,[]).
x_arity(x_cell,3) :- x_cid(a65b1329f6497c).
xc_microtheory(a65b1329f6497c,x_GameRulesMtFn(x_MarkingGame)).
xc_source_file(a65b1329f6497c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf').
xc_source_line(a65b1329f6497c,10).
xc_kb_names(a65b1329f6497c,[]).
xc_mapping_rows(a65b1329f6497c,[]).
'x_<=='(x_next(x_cell(V1,V2,V3)),x_doesAction(V4,x_mark(V1,V2,V3))) :- x_cid(a65b1329f6497d,V1,V2,V3,V4).
xc_microtheory(a65b1329f6497d,x_GameRulesMtFn(x_MarkingGame)).
xc_source_file(a65b1329f6497d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf').
xc_source_line(a65b1329f6497d,30).
xc_kb_names(a65b1329f6497d,["?m","?n","?mark","?player"]).
xc_mapping_rows(a65b1329f6497d,[]).
'x_<=='(x_next(x_cell(V1,V2,V3)),x_currentlyTrue(x_cell(V1,V2,V3)),x_uninferredSentence(x_doesAction(V4,x_mark(V1,V2,V5)))) :- x_cid(a65b1329f6497e,V1,V2,V3,V4,V5).
xc_microtheory(a65b1329f6497e,x_GameRulesMtFn(x_MarkingGame)).
xc_source_file(a65b1329f6497e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf').
xc_source_line(a65b1329f6497e,35).
xc_kb_names(a65b1329f6497e,["?m","?n","?contents","?some-player","?anything"]).
xc_mapping_rows(a65b1329f6497e,[]).
'x_<=='(x_legal(V1,x_mark(V2,V3,V4)),x_currentlyTrue(x_cell(V2,V3,x_Empty)),x_currentlyTrue(x_control(V1)),x_allFactsAllowed(x_entityLabel(V1,V4))) :- x_cid(a65b1329f6497f,V1,V2,V3,V4).
xc_microtheory(a65b1329f6497f,x_GameRulesMtFn(x_MarkingGame)).
xc_source_file(a65b1329f6497f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf').
xc_source_line(a65b1329f6497f,42).
xc_kb_names(a65b1329f6497f,["?w","?x","?y","?mark"]).
xc_mapping_rows(a65b1329f6497f,[]).
'x_<=='(x_terminalState,x_uninferredSentence(x_currentlyTrue(x_cell(V1,V2,x_Empty)))) :- x_cid(a65b1329f64980,V1,V2).
xc_microtheory(a65b1329f64980,x_GameRulesMtFn(x_MarkingGame)).
xc_source_file(a65b1329f64980,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf').
xc_source_line(a65b1329f64980,48).
xc_kb_names(a65b1329f64980,["?m","?n"]).
xc_mapping_rows(a65b1329f64980,[]).
'x_<=='(x_terminalState,x_goalState(V1,100)) :- x_cid(a65b1329f64981,V1).
xc_microtheory(a65b1329f64981,x_GameRulesMtFn(x_MarkingGame)).
xc_source_file(a65b1329f64981,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/multimodal-instruction/games/marking-game.krf').
xc_source_line(a65b1329f64981,53).
xc_kb_names(a65b1329f64981,["?player"]).
xc_mapping_rows(a65b1329f64981,[]).
kb_cache_footer(footer{count:9,digest:'90b4290b3fe967f5468f7ceea26340495b0e8919c22633872073b0d42483828f',headerDigest:'20a47a9c8298be0d8f12ecf4b5d9d3776de1fe3724fbe82eb81dad4c2b060c49'}).
