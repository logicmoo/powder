:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:11,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:102,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'0b8693daf129fd66117eba1a055ac66bff77001a5273de513c941d832d5fc8cc',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3920,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf',sourceHash:'5ac655c30468327013a63ea5dff7a8a300f588b0e1cf54eb25e0e2d8c4340a01',warnings:[]}).
x_isa(x_findIndependentEquationFor,x_Predicate) :- x_cid(a65b125d9672d2).
xc_microtheory(a65b125d9672d2,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672d2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672d2,23).
xc_kb_names(a65b125d9672d2,[]).
xc_mapping_rows(a65b125d9672d2,[]).
x_arity(x_findIndependentEquationFor,4) :- x_cid(a65b125d9672d3).
xc_microtheory(a65b125d9672d3,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672d3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672d3,24).
xc_kb_names(a65b125d9672d3,[]).
xc_mapping_rows(a65b125d9672d3,[]).
'x_<=='(x_findIndependentEquationFor(V1,V2,V3,V4),x_localEquationMentioning(V1,V3),x_independentEquationFrom(V3,V2),x_evaluate(V4,x_SetAdjoinFn(V2,V3))) :- x_cid(a65b125d9672d4,V1,V2,V3,V4).
xc_microtheory(a65b125d9672d4,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672d4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672d4,26).
xc_kb_names(a65b125d9672d4,["?parameter","?equation-set","?new-equation","?new-equation-set"]).
xc_mapping_rows(a65b125d9672d4,[]).
'x_<=='(x_localEquationMentioning(V1,V2),x_availableEquation(V2),x_containsAlgebraParameter(V1,V2)) :- x_cid(a65b125d9672d5,V1,V2).
xc_microtheory(a65b125d9672d5,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672d5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672d5,33).
xc_kb_names(a65b125d9672d5,["?q","?eqn"]).
xc_mapping_rows(a65b125d9672d5,[]).
'x_<=='(x_unlikelySameEquations(V1,V2),x_algebraParametersOf(V1,V3),x_algebraParametersOf(V2,V4),x_evaluate(x_True,x_GreaterThanByFn(x_LengthOfListFn(x_SetToListFn(x_SetOrCollectionUnion(x_SetDifferenceFn(V3,V4),x_SetDifferenceFn(V4,V3)))),0,0.1))) :- x_cid(a65b125d9672d6,V1,V2,V3,V4).
xc_microtheory(a65b125d9672d6,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672d6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672d6,40).
xc_kb_names(a65b125d9672d6,["?eqn1","?eqn2","?parameters1","?parameters2"]).
xc_mapping_rows(a65b125d9672d6,[]).
'x_<=='(x_availableEquation(V1),x_wmOnly(x_mathEquals(V2,V3)),x_unifies(V1,x_mathEquals(V2,V3))) :- x_cid(a65b125d9672d7,V1,V2,V3).
xc_microtheory(a65b125d9672d7,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672d7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672d7,58).
xc_kb_names(a65b125d9672d7,["?eqn","?a","?b"]).
xc_mapping_rows(a65b125d9672d7,[]).
'x_<=='(x_availableEquation(V1),x_equationFromCIWithPreconditions(V2,V3,V4),x_wmOnly(x_candidateInferenceOf(V3,V5)),x_resolveEquationSkolems(V2,V5,V1),x_wmOnly(x_mappingOf(V5,V6)),x_skolemStepInformation(V4,V6,V7,V8),x_allEquationPreconditionsSatisfied(V8)) :- x_cid(a65b125d9672d8,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125d9672d8,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672d8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672d8,63).
xc_kb_names(a65b125d9672d8,["?equation2","?equation","?ci","?step","?mapping","?match","?type","?preconditions"]).
xc_mapping_rows(a65b125d9672d8,[]).
'x_<=='(x_availableEquation(V1),x_equivalentQuantities(V2,V3),x_groundExpression(V2),x_groundExpression(V3),x_unifies(V1,x_mathEquals(V2,V3))) :- x_cid(a65b125d9672d9,V1,V2,V3).
xc_microtheory(a65b125d9672d9,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672d9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672d9,71).
xc_kb_names(a65b125d9672d9,["?equation","?quantity","?equiv-quantity"]).
xc_mapping_rows(a65b125d9672d9,[]).
'x_<=='(x_availableEquation(V1),x_valuesUsefulAcrossEvents(V2,V3,V4),x_different(V3,V4),x_groundExpression(V2),x_groundExpression(V3),x_groundExpression(V4),x_unifies(V1,x_mathEquals(x_MeasurementAtFn(V2,V3),x_MeasurementAtFn(V2,V4)))) :- x_cid(a65b125d9672da,V1,V2,V3,V4).
xc_microtheory(a65b125d9672da,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672da,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672da,77).
xc_kb_names(a65b125d9672da,["?equation","?q","?e","?other-e"]).
xc_mapping_rows(a65b125d9672da,[]).
'x_<=='(x_equationFromCIWithPreconditions(V1,V2,V3),x_wmOnly(x_lookupOnly(x_candidateInferenceContent(V2,x_solutionStepResult(V3,x_equationFormFor(V4,V1)))))) :- x_cid(a65b125d9672db,V1,V2,V3,V4).
xc_microtheory(a65b125d9672db,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672db,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672db,89).
xc_kb_names(a65b125d9672db,["?equation","?ci","?step","?name"]).
xc_mapping_rows(a65b125d9672db,[]).
'x_<=='(x_equationFromCIWithPreconditions(V1,V2,V3),x_wmOnly(x_lookupOnly(x_candidateInferenceContent(V2,x_solutionStepResult(V3,x_equationForSolution(V4,V1)))))) :- x_cid(a65b125d9672dc,V1,V2,V3,V4).
xc_microtheory(a65b125d9672dc,x_EquationSolvingRulesMt).
xc_source_file(a65b125d9672dc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/mechanics/v4/equation-rules.krf').
xc_source_line(a65b125d9672dc,97).
xc_kb_names(a65b125d9672dc,["?equation","?ci","?step","?name"]).
xc_mapping_rows(a65b125d9672dc,[]).
kb_cache_footer(footer{count:11,digest:'0b8693daf129fd66117eba1a055ac66bff77001a5273de513c941d832d5fc8cc',headerDigest:'37fdcf84860021ad27508be8bc4924807fe481917822c1b839ad5c87eaa5c839'}).
