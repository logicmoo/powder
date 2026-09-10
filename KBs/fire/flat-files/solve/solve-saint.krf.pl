:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:32,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:228,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'333a08c4544f9e404f087b034b4d709b9d1c98a6fda52e0ebea4996dc73b9a5d',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:8033,source:'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf',sourceHash:'3d0a399c890122d4cf9fc82f7ba28f48bad14af6cccc8f78e41580a711aa8860',warnings:[]}).
x_defSuggestion(x_AtomicIdentity,x_simplify(V1,V2),':test',x_atomicTerm(V1),':subgoals',t(x_unifies(V2,V1))) :- x_cid(a65b1281417ce2,V1,V2).
xc_microtheory(a65b1281417ce2,x_SaintMt).
xc_source_file(a65b1281417ce2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ce2,28).
xc_kb_names(a65b1281417ce2,["?term1","?term2"]).
xc_mapping_rows(a65b1281417ce2,[]).
x_defSuggestion(x_ZeroAugendElimination,x_simplify('x_+'(0,V1),V2),':subgoals',t(x_unifies(V2,V1))) :- x_cid(a65b1281417ce3,V1,V2).
xc_microtheory(a65b1281417ce3,x_SaintMt).
xc_source_file(a65b1281417ce3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ce3,33).
xc_kb_names(a65b1281417ce3,["?expr","?sum"]).
xc_mapping_rows(a65b1281417ce3,[]).
x_defSuggestion(x_ZeroAddendElimination,x_simplify('x_+'(0,V1),V2),':subgoals',t(x_unifies(V2,V1))) :- x_cid(a65b1281417ce4,V1,V2).
xc_microtheory(a65b1281417ce4,x_SaintMt).
xc_source_file(a65b1281417ce4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ce4,37).
xc_kb_names(a65b1281417ce4,["?expr","?sum"]).
xc_mapping_rows(a65b1281417ce4,[]).
x_defSuggestion(x_ZeroSubtrahendElimination,x_simplify('x_-'(V1,0),V2),':subgoals',t(x_unifies(V2,V1))) :- x_cid(a65b1281417ce5,V1,V2).
xc_microtheory(a65b1281417ce5,x_SaintMt).
xc_source_file(a65b1281417ce5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ce5,41).
xc_kb_names(a65b1281417ce5,["?expr","?diff"]).
xc_mapping_rows(a65b1281417ce5,[]).
x_defSuggestion(x_ZeroMinuendElimination,x_simplify('x_-'(0,V1),V2),':subgoals',t(x_unifies(V2,'x_-'(V1)))) :- x_cid(a65b1281417ce6,V1,V2).
xc_microtheory(a65b1281417ce6,x_SaintMt).
xc_source_file(a65b1281417ce6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ce6,45).
xc_kb_names(a65b1281417ce6,["?expr","?diff"]).
xc_mapping_rows(a65b1281417ce6,[]).
x_defSuggestion(x_UnitFactor1Elimination,x_simplify('x_*'(1,V1),V2),':subgoals',t(x_unifies(V2,V1))) :- x_cid(a65b1281417ce7,V1,V2).
xc_microtheory(a65b1281417ce7,x_SaintMt).
xc_source_file(a65b1281417ce7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ce7,49).
xc_kb_names(a65b1281417ce7,["?expr","?prod"]).
xc_mapping_rows(a65b1281417ce7,[]).
x_defSuggestion(x_UnitFactor2Elimination,x_simplify('x_*'(V1,1),V2),':subgoals',t(x_unifies(V2,V1))) :- x_cid(a65b1281417ce8,V1,V2).
xc_microtheory(a65b1281417ce8,x_SaintMt).
xc_source_file(a65b1281417ce8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ce8,53).
xc_kb_names(a65b1281417ce8,["?expr","?prod"]).
xc_mapping_rows(a65b1281417ce8,[]).
x_defSuggestion(x_UnitDivisorElimination,x_simplify('x_/'(V1,1),V2),':subgoals',t(x_unifies(V2,V1))) :- x_cid(a65b1281417ce9,V1,V2).
xc_microtheory(a65b1281417ce9,x_SaintMt).
xc_source_file(a65b1281417ce9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ce9,57).
xc_kb_names(a65b1281417ce9,["?expr","?quot"]).
xc_mapping_rows(a65b1281417ce9,[]).
x_defSuggestion(x_RepeatedSubtractionElimination,x_simplify('x_-'('x_-'(V1)),V2),':subgoals',t(x_unifies(V2,V1))) :- x_cid(a65b1281417cea,V1,V2).
xc_microtheory(a65b1281417cea,x_SaintMt).
xc_source_file(a65b1281417cea,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cea,61).
xc_kb_names(a65b1281417cea,["?expr","?simp"]).
xc_mapping_rows(a65b1281417cea,[]).
x_defSuggestion(x_UnitRatioElimination,x_simplify('x_/'(V1,V2),V3),':test',x_and(x_equalSymbols(V1,V2),x_different(V2,0)),':subgoals',t(x_unifies(V3,1))) :- x_cid(a65b1281417ceb,V1,V2,V3).
xc_microtheory(a65b1281417ceb,x_SaintMt).
xc_source_file(a65b1281417ceb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ceb,65).
xc_kb_names(a65b1281417ceb,["?divisor","?quotient","?ratio"]).
xc_mapping_rows(a65b1281417ceb,[]).
x_defSuggestion(x_TrigIdentity,x_simplify('x_+'(x_sqr(x_sin(V1)),x_sqr(x_cos(V2))),V3),':test',x_equalSymbols(V1,V2),':subgoals',t(x_unifies(V3,1))) :- x_cid(a65b1281417cec,V1,V2,V3).
xc_microtheory(a65b1281417cec,x_SaintMt).
xc_source_file(a65b1281417cec,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cec,72).
xc_kb_names(a65b1281417cec,["?term1","?term2","?simp"]).
xc_mapping_rows(a65b1281417cec,[]).
x_defSuggestion(x_SimplifyIntegral,x_simplify(x_integral(V1,V2,V3),V4),':subgoals',t(x_simplify(V1,V5),x_integral(V5,V2,V4))) :- x_cid(a65b1281417ced,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281417ced,x_SaintMt).
xc_source_file(a65b1281417ced,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417ced,80).
xc_kb_names(a65b1281417ced,["?integrand","?var","?int","?simp","?simpint"]).
xc_mapping_rows(a65b1281417ced,[]).
x_defSuggestion(x_SimplifyIntegrand,x_integral(V1,V2,V3),':subgoals',t(x_simplify(V1,V4),x_integral(V4,V2,V3))) :- x_cid(a65b1281417cee,V1,V2,V3,V4).
xc_microtheory(a65b1281417cee,x_SaintMt).
xc_source_file(a65b1281417cee,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cee,90).
xc_kb_names(a65b1281417cee,["?integrand","?var","?int","?expr"]).
xc_mapping_rows(a65b1281417cee,[]).
x_defSuggestion(x_IntegralOfConstant,x_integral(V1,V2,V3),':test',x_and(x_different(V1,V2),x_not(x_termFormulas(V1,V2))),':subgoals',t(x_unifies(V3,'x_*'(V1,V2)))) :- x_cid(a65b1281417cef,V1,V2,V3).
xc_microtheory(a65b1281417cef,x_SaintMt).
xc_source_file(a65b1281417cef,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cef,95).
xc_kb_names(a65b1281417cef,["?const","?var","?int"]).
xc_mapping_rows(a65b1281417cef,[]).
x_defSuggestion(x_IntegralOfSelf,x_integral(V1,V2,V3),':test',x_equalSymbols(V1,V2),':subgoals',t(x_unifies(V3,'x_/'(x_expt(V2,2),2)))) :- x_cid(a65b1281417cf0,V1,V2,V3).
xc_microtheory(a65b1281417cf0,x_SaintMt).
xc_source_file(a65b1281417cf0,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf0,104).
xc_kb_names(a65b1281417cf0,["?expr","?term","?int"]).
xc_mapping_rows(a65b1281417cf0,[]).
x_defSuggestion(x_MoveConstantOutside,x_integral('x_*'(V1,V2),V3,V4),':test',x_and(x_not(x_termFormulas(V1,V3)),x_termFormulas(V2,V3)),':subgoals',t(x_integral(V2,V3,V5),x_unifies(V4,'x_*'(V1,V5)))) :- x_cid(a65b1281417cf1,V1,V2,V3,V4,V5).
xc_microtheory(a65b1281417cf1,x_SaintMt).
xc_source_file(a65b1281417cf1,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf1,109).
xc_kb_names(a65b1281417cf1,["?const","?nonconst","?var","?int","?subint"]).
xc_mapping_rows(a65b1281417cf1,[]).
x_defSuggestion(x_IntegralOfSum,x_integral('x_+'(V1,V2),V3,V4),':cost-function',2,':subgoals',t(x_integral(V1,V3,V5),x_integral(V2,V3,V6),x_unifies(V4,'x_+'(V5,V6)))) :- x_cid(a65b1281417cf2,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1281417cf2,x_SaintMt).
xc_source_file(a65b1281417cf2,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf2,116).
xc_kb_names(a65b1281417cf2,["?term1","?term2","?var","?int","?int1","?int2"]).
xc_mapping_rows(a65b1281417cf2,[]).
x_defSuggestion(x_IntegralOfUMinus,x_integral('x_-'(V1),V2,V3),':subgoals',t(x_integral(V1,V2,V4),x_unifies(V3,'x_-'(V4)))) :- x_cid(a65b1281417cf3,V1,V2,V3,V4).
xc_microtheory(a65b1281417cf3,x_SaintMt).
xc_source_file(a65b1281417cf3,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf3,125).
xc_kb_names(a65b1281417cf3,["?term","?var","?int","?subint"]).
xc_mapping_rows(a65b1281417cf3,[]).
x_defSuggestion(x_IntegralOfMinus,x_integral('x_-'(V1,V2),V3,V4),':subgoals',t(x_integral(V1,V3,V5),x_integral(V2,V3,V6),x_unifies(V4,'x_-'(V5,V6)))) :- x_cid(a65b1281417cf4,V1,V2,V3,V4,V5,V6).
xc_microtheory(a65b1281417cf4,x_SaintMt).
xc_source_file(a65b1281417cf4,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf4,130).
xc_kb_names(a65b1281417cf4,["?term1","?term2","?var","?int","?int1","?int2"]).
xc_mapping_rows(a65b1281417cf4,[]).
x_defSuggestion(x_IntegralOfSQR,x_integral(x_sqr(V1),V1,V2),':subgoals',t(x_unifies(V2,'x_/'(x_expt(V1,3),3)))) :- x_cid(a65b1281417cf5,V1,V2).
xc_microtheory(a65b1281417cf5,x_SaintMt).
xc_source_file(a65b1281417cf5,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf5,136).
xc_kb_names(a65b1281417cf5,["?var","?int"]).
xc_mapping_rows(a65b1281417cf5,[]).
x_defSuggestion(x_IntegralOfPolyterm,x_integral(x_expt(V1,V2),V1,V3),':test',x_isa(V2,x_PositiveInteger),':subgoals',t(x_unifies(V3,'x_/'(x_expt(V1,'x_+'(1,V2)),'x_+'(1,V2))))) :- x_cid(a65b1281417cf6,V1,V2,V3).
xc_microtheory(a65b1281417cf6,x_SaintMt).
xc_source_file(a65b1281417cf6,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf6,140).
xc_kb_names(a65b1281417cf6,["?var","?n","?int"]).
xc_mapping_rows(a65b1281417cf6,[]).
x_defSuggestion(x_SimpleEIntegral,x_integral(x_exp(V1),V1,V2),':subgoals',t(x_unifies(V2,x_exp(V1)))) :- x_cid(a65b1281417cf7,V1,V2).
xc_microtheory(a65b1281417cf7,x_SaintMt).
xc_source_file(a65b1281417cf7,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf7,145).
xc_kb_names(a65b1281417cf7,["?var","?int"]).
xc_mapping_rows(a65b1281417cf7,[]).
x_defSuggestion(x_EIntegral,x_integral(x_exp('x_*'(V1,V2)),V2,V3),':test',x_not(x_termFormulas(V1,V2)),':subgoals',t(x_unifies(V3,'x_/'(x_exp('x_*'(V1,V2)),V1)))) :- x_cid(a65b1281417cf8,V1,V2,V3).
xc_microtheory(a65b1281417cf8,x_SaintMt).
xc_source_file(a65b1281417cf8,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf8,149).
xc_kb_names(a65b1281417cf8,["?a","?var","?int"]).
xc_mapping_rows(a65b1281417cf8,[]).
x_defSuggestion(x_SimpleNonEPowerIntegral,x_integral(x_expt(V1,V2),V2,V3),':test',x_not(x_termFormulas(V1,V2)),':subgoals',t(x_unifies(V3,'x_/'(x_expt(V1,V2),x_log(V1))))) :- x_cid(a65b1281417cf9,V1,V2,V3).
xc_microtheory(a65b1281417cf9,x_SaintMt).
xc_source_file(a65b1281417cf9,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cf9,154).
xc_kb_names(a65b1281417cf9,["?b","?var","?int"]).
xc_mapping_rows(a65b1281417cf9,[]).
x_defSuggestion(x_NonEPowerIntegral,x_integral(x_expt(V1,'x_*'(V2,V3)),V3,V4),':test',x_and(x_not(x_termFormulas(V2,V3)),x_not(x_termFormulas(V1,V3))),':subgoals',t(x_unifies(V4,'x_/'(x_expt(V1,'x_*'(V2,V3)),'x_*'(V2,x_log(V1)))))) :- x_cid(a65b1281417cfa,V1,V2,V3,V4).
xc_microtheory(a65b1281417cfa,x_SaintMt).
xc_source_file(a65b1281417cfa,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cfa,159).
xc_kb_names(a65b1281417cfa,["?b","?a","?var","?int"]).
xc_mapping_rows(a65b1281417cfa,[]).
x_defSuggestion(x_LogIntegral,x_integral(x_log(V1),V1,V2),':subgoals',t(x_unifies(V2,'x_-'('x_*'(V1,x_log(V1)),V1)))) :- x_cid(a65b1281417cfb,V1,V2).
xc_microtheory(a65b1281417cfb,x_SaintMt).
xc_source_file(a65b1281417cfb,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cfb,165).
xc_kb_names(a65b1281417cfb,["?var","?int"]).
xc_mapping_rows(a65b1281417cfb,[]).
x_defSuggestion(x_SimpleSinIntegral,x_integral(x_sin(V1),V1,V2),':subgoals',t(x_unifies(V2,'x_-'(x_cos(V1))))) :- x_cid(a65b1281417cfc,V1,V2).
xc_microtheory(a65b1281417cfc,x_SaintMt).
xc_source_file(a65b1281417cfc,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cfc,169).
xc_kb_names(a65b1281417cfc,["?var","?int"]).
xc_mapping_rows(a65b1281417cfc,[]).
x_defSuggestion(x_SinIntegral,x_integral(x_sin('x_*'(V1,V2)),V2,V3),':test',x_not(x_termFormulas(V1,V2)),':subgoals',t(x_unifies(V3,'x_-'('x_/'(x_cos('x_*'(V1,V2)),V1))))) :- x_cid(a65b1281417cfd,V1,V2,V3).
xc_microtheory(a65b1281417cfd,x_SaintMt).
xc_source_file(a65b1281417cfd,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cfd,173).
xc_kb_names(a65b1281417cfd,["?a","?var","?int"]).
xc_mapping_rows(a65b1281417cfd,[]).
x_defSuggestion(x_SimpleCosIntegral,x_integral(x_cos(V1),V1,V2),':subgoals',t(x_unifies(V2,x_sin(V1)))) :- x_cid(a65b1281417cfe,V1,V2).
xc_microtheory(a65b1281417cfe,x_SaintMt).
xc_source_file(a65b1281417cfe,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cfe,178).
xc_kb_names(a65b1281417cfe,["?var","?int"]).
xc_mapping_rows(a65b1281417cfe,[]).
x_defSuggestion(x_CosIntegral,x_integral(x_cos('x_*'(V1,V2)),V2,V3),':test',x_not(x_termFormulas(V1,V2)),':subgoals',t(x_unifies(V3,'x_/'(x_sin('x_*'(V1,V2)),V1)))) :- x_cid(a65b1281417cff,V1,V2,V3).
xc_microtheory(a65b1281417cff,x_SaintMt).
xc_source_file(a65b1281417cff,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417cff,182).
xc_kb_names(a65b1281417cff,["?a","?var","?int"]).
xc_mapping_rows(a65b1281417cff,[]).
x_defSuggestion(x_SinSqrIntegral,x_integral(x_sqr(x_sin(V1)),V1,V2),':cost-function',2,':subgoals',t(x_unifies(V2,'x_-'('x_/'(V1,2),'x_/'(x_sin('x_*'(2,V1)),4))))) :- x_cid(a65b1281417d00,V1,V2).
xc_microtheory(a65b1281417d00,x_SaintMt).
xc_source_file(a65b1281417d00,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417d00,187).
xc_kb_names(a65b1281417d00,["?var","?int"]).
xc_mapping_rows(a65b1281417d00,[]).
x_defSuggestion(x_CosSqrIntegral,x_integral(x_sqr(x_cos(V1)),V1,V2),':cost-function',2,':subgoals',t(x_unifies(V2,'x_+'('x_/'(V1,2),'x_/'(x_sin('x_*'(2,V1)),4))))) :- x_cid(a65b1281417d01,V1,V2).
xc_microtheory(a65b1281417d01,x_SaintMt).
xc_source_file(a65b1281417d01,'c:/snet/petta/repos/openworld_dr/KBs/fire/flat-files/solve/solve-saint.krf').
xc_source_line(a65b1281417d01,192).
xc_kb_names(a65b1281417d01,["?var","?int"]).
xc_mapping_rows(a65b1281417d01,[]).
kb_cache_footer(footer{count:32,digest:'333a08c4544f9e404f087b034b4d709b9d1c98a6fda52e0ebea4996dc73b9a5d',headerDigest:'0c86338aa9697b764d065ae9706492d491e5c15a068c5f78e29170edabd8f3c6'}).
