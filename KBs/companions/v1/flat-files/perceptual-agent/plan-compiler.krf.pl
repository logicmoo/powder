:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:39,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:192,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'697091ab060befb7158e958520781f9d109bf3b4363f0c6e853a164e80723acf',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:7013,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf',sourceHash:'459c924a252c7ae8b15a66dbdd5be2ecf5f6758592b392014194f2e35ee2b336',warnings:[]}).
x_isa(x_translateConditionToTrigger,x_ComplexActionPredicate) :- x_cid(a65b125e0e7e07).
xc_microtheory(a65b125e0e7e07,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e07,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e07,26).
xc_kb_names(a65b125e0e7e07,[]).
xc_mapping_rows(a65b125e0e7e07,[]).
x_isa(x_translateSynchronizedTasksToEventTriggers,x_ComplexActionPredicate) :- x_cid(a65b125e0e7e08).
xc_microtheory(a65b125e0e7e08,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e08,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e08,31).
xc_kb_names(a65b125e0e7e08,[]).
xc_mapping_rows(a65b125e0e7e08,[]).
x_isa(x_fireProcessActivationPlan,x_ComplexActionPredicate) :- x_cid(a65b125e0e7e09).
xc_microtheory(a65b125e0e7e09,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e09,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e09,36).
xc_kb_names(a65b125e0e7e09,[]).
xc_mapping_rows(a65b125e0e7e09,[]).
x_isa(x_processSequence,x_BinaryPredicate) :- x_cid(a65b125e0e7e0a).
xc_microtheory(a65b125e0e7e0a,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e0a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e0a,66).
xc_kb_names(a65b125e0e7e0a,[]).
xc_mapping_rows(a65b125e0e7e0a,[]).
x_arg1Isa(x_processSequence,x_QPQuantityType) :- x_cid(a65b125e0e7e0b).
xc_microtheory(a65b125e0e7e0b,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e0b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e0b,67).
xc_kb_names(a65b125e0e7e0b,[]).
xc_mapping_rows(a65b125e0e7e0b,[]).
x_arg2Isa(x_processSequence,x_List) :- x_cid(a65b125e0e7e0c).
xc_microtheory(a65b125e0e7e0c,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e0c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e0c,68).
xc_kb_names(a65b125e0e7e0c,[]).
xc_mapping_rows(a65b125e0e7e0c,[]).
x_comment(x_processSequence,"(processSequence ?quantity-type ?sequence) identifies ordered phase changes of the quantity type in the form of a list of process types that must be passed through in sequence.") :- x_cid(a65b125e0e7e0d).
xc_microtheory(a65b125e0e7e0d,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e0d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e0d,69).
xc_kb_names(a65b125e0e7e0d,[]).
xc_mapping_rows(a65b125e0e7e0d,[]).
'x_<=='(x_processSequence(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(t(V4,V5,V6),x_and('x_consequenceOf-TypeType'(V4,'x_i+'(t(V1,V7),V8)),x_numAnswers(1,x_sequencedConditionBounds(V1,V4,V5,V6))))),x_evaluate(V9,x_SortFn(V3,x_Kappa(t(V10,V11),x_tripleBefore(V10,V11)),x_IdentityFn)),x_evaluate(V2,x_MapFunctionOverList(x_Arg0Fn,V9))) :- x_cid(a65b125e0e7e0e,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125e0e7e0e,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e0e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e0e,71).
xc_kb_names(a65b125e0e7e0e,["?qtype","?sequence","?process-bounds","?process","?lb","?ub","?role","?rate","?sorted-bounds","?a","?b"]).
xc_mapping_rows(a65b125e0e7e0e,[]).
x_isa(x_sequencedConditionBounds,x_QuaternaryPredicate) :- x_cid(a65b125e0e7e0f).
xc_microtheory(a65b125e0e7e0f,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e0f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e0f,83).
xc_kb_names(a65b125e0e7e0f,[]).
xc_mapping_rows(a65b125e0e7e0f,[]).
x_arity(x_sequencedConditionBounds,4) :- x_cid(a65b125e0e7e10).
xc_microtheory(a65b125e0e7e10,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e10,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e10,84).
xc_kb_names(a65b125e0e7e10,[]).
xc_mapping_rows(a65b125e0e7e10,[]).
'x_<=='(x_sequencedConditionBounds(V1,V2,V3,V4),x_numAnswers(1,x_lowerBoundFor(V1,V2,V3)),x_numAnswers(1,x_upperBoundFor(V1,V2,V4)),x_different(t(V3,V4),x_None(x_None))) :- x_cid(a65b125e0e7e11,V1,V2,V3,V4).
xc_microtheory(a65b125e0e7e11,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e11,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e11,86).
xc_kb_names(a65b125e0e7e11,["?qtype","?process","?lb","?ub"]).
xc_mapping_rows(a65b125e0e7e11,[]).
x_isa(x_lowerBoundFor,x_TernaryPredicate) :- x_cid(a65b125e0e7e12).
xc_microtheory(a65b125e0e7e12,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e12,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e12,91).
xc_kb_names(a65b125e0e7e12,[]).
xc_mapping_rows(a65b125e0e7e12,[]).
'x_<=='(x_lowerBoundFor(V1,V2,V3),x_conditionLowerBound(V1,V2,V3)) :- x_cid(a65b125e0e7e13,V1,V2,V3).
xc_microtheory(a65b125e0e7e13,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e13,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e13,93).
xc_kb_names(a65b125e0e7e13,["?qtype","?process","?lb"]).
xc_mapping_rows(a65b125e0e7e13,[]).
'x_<=='(x_lowerBoundFor(V1,V2,x_None),x_uninferredSentence(x_conditionLowerBound(V1,V2,V3))) :- x_cid(a65b125e0e7e14,V1,V2,V3).
xc_microtheory(a65b125e0e7e14,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e14,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e14,96).
xc_kb_names(a65b125e0e7e14,["?qtype","?process","?bound"]).
xc_mapping_rows(a65b125e0e7e14,[]).
x_isa(x_upperBoundFor,x_TernaryPredicate) :- x_cid(a65b125e0e7e15).
xc_microtheory(a65b125e0e7e15,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e15,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e15,100).
xc_kb_names(a65b125e0e7e15,[]).
xc_mapping_rows(a65b125e0e7e15,[]).
'x_<=='(x_upperBoundFor(V1,V2,V3),x_conditionUpperBound(V1,V2,V3)) :- x_cid(a65b125e0e7e16,V1,V2,V3).
xc_microtheory(a65b125e0e7e16,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e16,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e16,102).
xc_kb_names(a65b125e0e7e16,["?qtype","?process","?ub"]).
xc_mapping_rows(a65b125e0e7e16,[]).
'x_<=='(x_upperBoundFor(V1,V2,x_None),x_uninferredSentence(x_conditionUpperBound(V1,V2,V3))) :- x_cid(a65b125e0e7e17,V1,V2,V3).
xc_microtheory(a65b125e0e7e17,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e17,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e17,105).
xc_kb_names(a65b125e0e7e17,["?qtype","?process","?bound"]).
xc_mapping_rows(a65b125e0e7e17,[]).
x_isa(x_conditionLowerBound,x_TernaryPredicate) :- x_cid(a65b125e0e7e18).
xc_microtheory(a65b125e0e7e18,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e18,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e18,109).
xc_kb_names(a65b125e0e7e18,[]).
xc_mapping_rows(a65b125e0e7e18,[]).
'x_<=='(x_conditionLowerBound(V1,V2,V3),'x_conditionOf-TypeType'(V2,x_greaterThan(t(V1,V4),V3)),x_isConstant(V3)) :- x_cid(a65b125e0e7e19,V1,V2,V3,V4).
xc_microtheory(a65b125e0e7e19,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e19,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e19,111).
xc_kb_names(a65b125e0e7e19,["?qtype","?process","?bound","?role"]).
xc_mapping_rows(a65b125e0e7e19,[]).
'x_<=='(x_conditionLowerBound(V1,V2,V3),'x_conditionOf-TypeType'(V2,x_greaterThanOrEqualTo(t(V1,V4),V3)),x_isConstant(V3)) :- x_cid(a65b125e0e7e1a,V1,V2,V3,V4).
xc_microtheory(a65b125e0e7e1a,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e1a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e1a,115).
xc_kb_names(a65b125e0e7e1a,["?qtype","?process","?bound","?role"]).
xc_mapping_rows(a65b125e0e7e1a,[]).
'x_<=='(x_conditionLowerBound(V1,V2,V3),'x_conditionOf-TypeType'(V2,x_equals(t(V1,V4),V3)),x_isConstant(V3)) :- x_cid(a65b125e0e7e1b,V1,V2,V3,V4).
xc_microtheory(a65b125e0e7e1b,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e1b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e1b,119).
xc_kb_names(a65b125e0e7e1b,["?qtype","?process","?bound","?role"]).
xc_mapping_rows(a65b125e0e7e1b,[]).
x_isa(x_conditionUpperBound,x_TernaryPredicate) :- x_cid(a65b125e0e7e1c).
xc_microtheory(a65b125e0e7e1c,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e1c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e1c,123).
xc_kb_names(a65b125e0e7e1c,[]).
xc_mapping_rows(a65b125e0e7e1c,[]).
'x_<=='(x_conditionUpperBound(V1,V2,V3),'x_conditionOf-TypeType'(V2,x_lessThan(t(V1,V4),V3)),x_isConstant(V3)) :- x_cid(a65b125e0e7e1d,V1,V2,V3,V4).
xc_microtheory(a65b125e0e7e1d,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e1d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e1d,125).
xc_kb_names(a65b125e0e7e1d,["?qtype","?process","?bound","?role"]).
xc_mapping_rows(a65b125e0e7e1d,[]).
'x_<=='(x_conditionUpperBound(V1,V2,V3),'x_conditionOf-TypeType'(V2,x_lessThanOrEqualTo(t(V1,V4),V3)),x_isConstant(V3)) :- x_cid(a65b125e0e7e1e,V1,V2,V3,V4).
xc_microtheory(a65b125e0e7e1e,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e1e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e1e,129).
xc_kb_names(a65b125e0e7e1e,["?qtype","?process","?bound","?role"]).
xc_mapping_rows(a65b125e0e7e1e,[]).
'x_<=='(x_conditionUpperBound(V1,V2,V3),'x_conditionOf-TypeType'(V2,x_equals(t(V1,V4),V3)),x_isConstant(V3)) :- x_cid(a65b125e0e7e1f,V1,V2,V3,V4).
xc_microtheory(a65b125e0e7e1f,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e1f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e1f,133).
xc_kb_names(a65b125e0e7e1f,["?qtype","?process","?bound","?role"]).
xc_mapping_rows(a65b125e0e7e1f,[]).
x_isa(x_isConstant,x_UnaryPredicate) :- x_cid(a65b125e0e7e20).
xc_microtheory(a65b125e0e7e20,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e20,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e20,137).
xc_kb_names(a65b125e0e7e20,[]).
xc_mapping_rows(a65b125e0e7e20,[]).
x_arity(x_isConstant,1) :- x_cid(a65b125e0e7e21).
xc_microtheory(a65b125e0e7e21,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e21,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e21,138).
xc_kb_names(a65b125e0e7e21,[]).
xc_mapping_rows(a65b125e0e7e21,[]).
x_comment(x_isConstant,"(isConstant <thing>) means <thing> is either a number or a NAT with units and a value.") :- x_cid(a65b125e0e7e22).
xc_microtheory(a65b125e0e7e22,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e22,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e22,139).
xc_kb_names(a65b125e0e7e22,[]).
xc_mapping_rows(a65b125e0e7e22,[]).
'x_<=='(x_isConstant(V1),x_isa(V1,'x_Number-General')) :- x_cid(a65b125e0e7e23,V1).
xc_microtheory(a65b125e0e7e23,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e23,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e23,142).
xc_kb_names(a65b125e0e7e23,["?item"]).
xc_mapping_rows(a65b125e0e7e23,[]).
'x_<=='(x_isConstant(t(V1,V2)),x_groundExpression(t(V1,V2)),x_different(V1,x_MeasurableQuantityFn),x_different(V1,x_QPQuantityFn),x_isa(V2,'x_Number-General')) :- x_cid(a65b125e0e7e24,V1,V2).
xc_microtheory(a65b125e0e7e24,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e24,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e24,146).
xc_kb_names(a65b125e0e7e24,["?functor","?value"]).
xc_mapping_rows(a65b125e0e7e24,[]).
x_isa(x_tripleBefore,x_BinaryPredicate) :- x_cid(a65b125e0e7e25).
xc_microtheory(a65b125e0e7e25,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e25,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e25,156).
xc_kb_names(a65b125e0e7e25,[]).
xc_mapping_rows(a65b125e0e7e25,[]).
x_arity(x_tripleBefore,2) :- x_cid(a65b125e0e7e26).
xc_microtheory(a65b125e0e7e26,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e26,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e26,157).
xc_kb_names(a65b125e0e7e26,[]).
xc_mapping_rows(a65b125e0e7e26,[]).
x_arg1Isa(x_tripleBefore,x_CycLTerm) :- x_cid(a65b125e0e7e27).
xc_microtheory(a65b125e0e7e27,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e27,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e27,158).
xc_kb_names(a65b125e0e7e27,[]).
xc_mapping_rows(a65b125e0e7e27,[]).
x_arg2Isa(x_tripleBefore,x_CycLTerm) :- x_cid(a65b125e0e7e28).
xc_microtheory(a65b125e0e7e28,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e28,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e28,159).
xc_kb_names(a65b125e0e7e28,[]).
xc_mapping_rows(a65b125e0e7e28,[]).
x_comment(x_tripleBefore,"(tripleBefore ?triple1 ?triple2) is a convenience predicate for sorting.  Triples are of the form (<process-type> <lower-bound> <upper-bound>).") :- x_cid(a65b125e0e7e29).
xc_microtheory(a65b125e0e7e29,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e29,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e29,160).
xc_kb_names(a65b125e0e7e29,[]).
xc_mapping_rows(a65b125e0e7e29,[]).
'x_<=='(x_tripleBefore(V1,V2),x_unifies(t(V3,V4,V5),V1),x_unifies(t(V6,V7,V8),V2),x_groundExpression(V5),x_groundExpression(V7),x_different(V5,x_None),x_different(V7,x_None),x_effectivelyLess(V5,V7)) :- x_cid(a65b125e0e7e2a,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e0e7e2a,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e2a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e2a,162).
xc_kb_names(a65b125e0e7e2a,["?t1","?t2","?p1","?l1","?u1","?p2","?l2","?u2"]).
xc_mapping_rows(a65b125e0e7e2a,[]).
x_isa(x_effectivelyLess,x_BinaryPredicate) :- x_cid(a65b125e0e7e2b).
xc_microtheory(a65b125e0e7e2b,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e2b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e2b,171).
xc_kb_names(a65b125e0e7e2b,[]).
xc_mapping_rows(a65b125e0e7e2b,[]).
'x_<=='(x_effectivelyLess(V1,V2),x_unifies(t(V3,V4),V1),x_unifies(t(V3,V5),V2),x_lessThanOrEqualTo(V4,V5)) :- x_cid(a65b125e0e7e2c,V1,V2,V3,V4,V5).
xc_microtheory(a65b125e0e7e2c,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e2c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e2c,173).
xc_kb_names(a65b125e0e7e2c,["?lower","?upper","?functor","?lnum","?unum"]).
xc_mapping_rows(a65b125e0e7e2c,[]).
'x_<=='(x_effectivelyLess(V1,V2),x_lessThanOrEqualTo(V1,V2)) :- x_cid(a65b125e0e7e2d,V1,V2).
xc_microtheory(a65b125e0e7e2d,x_PerceptualAgentMt).
xc_source_file(a65b125e0e7e2d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/plan-compiler.krf').
xc_source_line(a65b125e0e7e2d,179).
xc_kb_names(a65b125e0e7e2d,["?lower","?upper"]).
xc_mapping_rows(a65b125e0e7e2d,[]).
kb_cache_footer(footer{count:39,digest:'697091ab060befb7158e958520781f9d109bf3b4363f0c6e853a164e80723acf',headerDigest:'9f809605b94861bd42aa8e7833c67aebb39c213b80cffd7f6708616ec18b9c17'}).
