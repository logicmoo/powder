:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:11,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:76,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:d26a526e918d47b4f36c2ab5a9e641ef8781fe5c8f0df8dd7c593b0dc0631d09,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:3585,source:'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf',sourceHash:'4f2b0d0cf1d300cfc53be831534cab2aaad0ae6e43156145ce54986c779140d3',warnings:[]}).
x_genlMt(x_CompanionsMt,x_AlgebraMt) :- x_cid(a65b125c513cc8).
xc_microtheory(a65b125c513cc8,x_AlgebraMt).
xc_source_file(a65b125c513cc8,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513cc8,15).
xc_kb_names(a65b125c513cc8,[]).
xc_mapping_rows(a65b125c513cc8,[]).
x_isa(x_solveEquationForNumericalValue,x_Predicate) :- x_cid(a65b125c513cc9).
xc_microtheory(a65b125c513cc9,x_AlgebraMt).
xc_source_file(a65b125c513cc9,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513cc9,20).
xc_kb_names(a65b125c513cc9,[]).
xc_mapping_rows(a65b125c513cc9,[]).
x_arity(x_solveEquationForNumericalValue,4) :- x_cid(a65b125c513cca).
xc_microtheory(a65b125c513cca,x_AlgebraMt).
xc_source_file(a65b125c513cca,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513cca,21).
xc_kb_names(a65b125c513cca,[]).
xc_mapping_rows(a65b125c513cca,[]).
x_defSuggestion(x_SolveEquationForNumericalValue,x_solveEquationForNumericalValue(V1,V2,V3,V4),':test',x_containsAlgebraParameter(V2,V1),':subgoals',t(x_otherParametersInEquation(V1,V2,V5),x_solveAll(x_elementOf(V6,V5),x_valueOf(V6,V7)),x_constructNumericalEquationViaSubstitutions(V1,V5,V8,V4),x_solveEquationFor(V8,V2,V3))) :- x_cid(a65b125c513ccb,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c513ccb,x_AlgebraMt).
xc_source_file(a65b125c513ccb,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513ccb,24).
xc_kb_names(a65b125c513ccb,["?equation","?parameter","?answer","?equation-set","?others","?other-parameter","?value","?final-equation"]).
xc_mapping_rows(a65b125c513ccb,[]).
x_isa(x_solveForNumericalValue,x_Predicate) :- x_cid(a65b125c513ccc).
xc_microtheory(a65b125c513ccc,x_AlgebraMt).
xc_source_file(a65b125c513ccc,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513ccc,35).
xc_kb_names(a65b125c513ccc,[]).
xc_mapping_rows(a65b125c513ccc,[]).
x_arity(x_solveForNumericalValue,3) :- x_cid(a65b125c513ccd).
xc_microtheory(a65b125c513ccd,x_AlgebraMt).
xc_source_file(a65b125c513ccd,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513ccd,36).
xc_kb_names(a65b125c513ccd,[]).
xc_mapping_rows(a65b125c513ccd,[]).
x_defSuggestion(x_SolveForNumericalValueViaValue,x_solveForNumericalValue(V1,V2,V3),':subgoals',t(x_valueOf(V1,V2),x_isa(V2,x_NumericalValueWithUnits))) :- x_cid(a65b125c513cce,V1,V2,V3).
xc_microtheory(a65b125c513cce,x_AlgebraMt).
xc_source_file(a65b125c513cce,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513cce,38).
xc_kb_names(a65b125c513cce,["?parameter","?value","?i-equation-set"]).
xc_mapping_rows(a65b125c513cce,[]).
x_defSuggestion(x_SolveEquationForSymbolicValue,x_solveEquationForSymbolicValue(V1,V2,V3,V4),':subgoals',t(x_otherParametersInEquation(V1,V2,V5),x_solveAll(x_elementOf(V6,V5),x_solveForSymbolicValue(V6,V7,V4)),x_constructSymbolicEquationViaSubstitutions(V1,V5,V8,V4),x_solveEquationFor(V8,V2,V3))) :- x_cid(a65b125c513ccf,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125c513ccf,x_AlgebraMt).
xc_source_file(a65b125c513ccf,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513ccf,46).
xc_kb_names(a65b125c513ccf,["?equation","?parameter","?answer","?equation-set","?others","?other-parameter","?value","?final-equation"]).
xc_mapping_rows(a65b125c513ccf,[]).
x_defSuggestion(x_SolveForSymbolicValueViaValue,x_solveForSymbolicValue(V1,V2,V3),':subgoals',t(x_valueOf(V1,V2))) :- x_cid(a65b125c513cd0,V1,V2,V3).
xc_microtheory(a65b125c513cd0,x_AlgebraMt).
xc_source_file(a65b125c513cd0,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513cd0,56).
xc_kb_names(a65b125c513cd0,["?parameter","?value","?i-equation-set"]).
xc_mapping_rows(a65b125c513cd0,[]).
x_defSuggestion(x_SolveForSymbolicValueViaSelf,x_solveForSymbolicValue(V1,V2,V3),':subgoals',t(x_acceptableSymbolicTermInAnswerForQuestion(V1,V4),x_unifies(V1,V2))) :- x_cid(a65b125c513cd1,V1,V2,V3,V4).
xc_microtheory(a65b125c513cd1,x_AlgebraMt).
xc_source_file(a65b125c513cd1,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513cd1,61).
xc_kb_names(a65b125c513cd1,["?parameter","?value","?i-equation-set","?question"]).
xc_mapping_rows(a65b125c513cd1,[]).
x_defSuggestion(x_SolveForSymbolicValueViaEquation,x_solveForSymbolicValue(V1,V2,V3),':subgoals',t(x_findIndependentEquationFor(V1,V3,V4,V5),x_solveEquationForSymbolicValue(V4,V1,V2,V5))) :- x_cid(a65b125c513cd2,V1,V2,V3,V4,V5).
xc_microtheory(a65b125c513cd2,x_AlgebraMt).
xc_source_file(a65b125c513cd2,'c:/snet/petta/repos/openworld_dr/KBs/algebra-library/equation-solving-suggestions.krf').
xc_source_line(a65b125c513cd2,67).
xc_kb_names(a65b125c513cd2,["?parameter","?value","?equation-set","?new-equation","?new-equation-set"]).
xc_mapping_rows(a65b125c513cd2,[]).
kb_cache_footer(footer{count:11,digest:d26a526e918d47b4f36c2ab5a9e641ef8781fe5c8f0df8dd7c593b0dc0631d09,headerDigest:ff8ea6a4c7b1bacb4c99d8e3e8422c41b2acb40678816853fe2546aab12b837f}).
