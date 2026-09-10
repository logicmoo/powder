:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:21,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:90,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'38cbf3c6337c82ed7b661996d64ed5b4b8b5dad95ddd995870f1937023ec892b',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:4060,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf',sourceHash:'18099e874565e4f509f23facd3a20d18f0ac3e4b970e8ad80f490dd0fcd806d1',warnings:[]}).
x_isa(x_Resource,x_Collection) :- x_cid(a65b125e1dadd2).
xc_microtheory(a65b125e1dadd2,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadd2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadd2,27).
xc_kb_names(a65b125e1dadd2,[]).
xc_mapping_rows(a65b125e1dadd2,[]).
x_genls(x_Resource,x_MeasurableQuantity) :- x_cid(a65b125e1dadd3).
xc_microtheory(a65b125e1dadd3,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadd3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadd3,28).
xc_kb_names(a65b125e1dadd3,[]).
xc_mapping_rows(a65b125e1dadd3,[]).
x_comment(x_Resource,"A Resource is an abstraction that treats a quantity as something that can be conserved, converted, produced, etc.  Almost always reified as the resultIsa of a ResourceFn NAT.") :- x_cid(a65b125e1dadd4).
xc_microtheory(a65b125e1dadd4,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadd4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadd4,29).
xc_kb_names(a65b125e1dadd4,[]).
xc_mapping_rows(a65b125e1dadd4,[]).
x_isa(x_ResourceFn,x_UnaryFunction) :- x_cid(a65b125e1dadd5).
xc_microtheory(a65b125e1dadd5,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadd5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadd5,31).
xc_kb_names(a65b125e1dadd5,[]).
xc_mapping_rows(a65b125e1dadd5,[]).
x_isa(x_ResourceFn,'x_AtomicAnalogyNAT-Function') :- x_cid(a65b125e1dadd6).
xc_microtheory(a65b125e1dadd6,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadd6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadd6,32).
xc_kb_names(a65b125e1dadd6,[]).
xc_mapping_rows(a65b125e1dadd6,[]).
x_arity(x_ResourceFn,1) :- x_cid(a65b125e1dadd7).
xc_microtheory(a65b125e1dadd7,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadd7,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadd7,33).
xc_kb_names(a65b125e1dadd7,[]).
xc_mapping_rows(a65b125e1dadd7,[]).
x_arg1Isa(x_ResourceFn,x_MeasurableQuantity) :- x_cid(a65b125e1dadd8).
xc_microtheory(a65b125e1dadd8,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadd8,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadd8,34).
xc_kb_names(a65b125e1dadd8,[]).
xc_mapping_rows(a65b125e1dadd8,[]).
x_resultIsa(x_ResourceFn,x_Resource) :- x_cid(a65b125e1dadd9).
xc_microtheory(a65b125e1dadd9,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadd9,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadd9,35).
xc_kb_names(a65b125e1dadd9,[]).
xc_mapping_rows(a65b125e1dadd9,[]).
x_comment(x_ResourceFn,"(ResourceFn ?quantity) translates ?quantity into some kind of resource that can be conserved or converted.") :- x_cid(a65b125e1dadda).
xc_microtheory(a65b125e1dadda,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadda,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadda,36).
xc_kb_names(a65b125e1dadda,[]).
xc_mapping_rows(a65b125e1dadda,[]).
x_isa(x_resourceType,x_BinaryPredicate) :- x_cid(a65b125e1daddb).
xc_microtheory(a65b125e1daddb,x_PerceptualAgentMt).
xc_source_file(a65b125e1daddb,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1daddb,39).
xc_kb_names(a65b125e1daddb,[]).
xc_mapping_rows(a65b125e1daddb,[]).
x_arity(x_resourceType,2) :- x_cid(a65b125e1daddc).
xc_microtheory(a65b125e1daddc,x_PerceptualAgentMt).
xc_source_file(a65b125e1daddc,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1daddc,40).
xc_kb_names(a65b125e1daddc,[]).
xc_mapping_rows(a65b125e1daddc,[]).
x_arg1Isa(x_resourceType,x_Resource) :- x_cid(a65b125e1daddd).
xc_microtheory(a65b125e1daddd,x_PerceptualAgentMt).
xc_source_file(a65b125e1daddd,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1daddd,41).
xc_kb_names(a65b125e1daddd,[]).
xc_mapping_rows(a65b125e1daddd,[]).
x_arg2Isa(x_resourceType,x_MeasurableQuantityType) :- x_cid(a65b125e1dadde).
xc_microtheory(a65b125e1dadde,x_PerceptualAgentMt).
xc_source_file(a65b125e1dadde,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dadde,42).
xc_kb_names(a65b125e1dadde,[]).
xc_mapping_rows(a65b125e1dadde,[]).
x_comment(x_resourceType,"(resourceType ?resource ?type) identifies the MeasurableQuantityType ?type with a particular resource.") :- x_cid(a65b125e1daddf).
xc_microtheory(a65b125e1daddf,x_PerceptualAgentMt).
xc_source_file(a65b125e1daddf,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1daddf,43).
xc_kb_names(a65b125e1daddf,[]).
xc_mapping_rows(a65b125e1daddf,[]).
'x_<=='(x_resourceType(x_ResourceFn(V1),V2),x_quantityType(V1,V2)) :- x_cid(a65b125e1dade0,V1,V2).
xc_microtheory(a65b125e1dade0,x_PerceptualAgentMt).
xc_source_file(a65b125e1dade0,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dade0,45).
xc_kb_names(a65b125e1dade0,["?quantity","?type"]).
xc_mapping_rows(a65b125e1dade0,[]).
x_isa(x_resourceConsumptionLowerBound,x_TernaryPredicate) :- x_cid(a65b125e1dade1).
xc_microtheory(a65b125e1dade1,x_PerceptualAgentMt).
xc_source_file(a65b125e1dade1,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dade1,52).
xc_kb_names(a65b125e1dade1,[]).
xc_mapping_rows(a65b125e1dade1,[]).
x_arity(x_resourceConsumptionLowerBound,3) :- x_cid(a65b125e1dade2).
xc_microtheory(a65b125e1dade2,x_PerceptualAgentMt).
xc_source_file(a65b125e1dade2,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dade2,53).
xc_kb_names(a65b125e1dade2,[]).
xc_mapping_rows(a65b125e1dade2,[]).
x_arg1Isa(x_resourceConsumptionLowerBound,'x_CycLSentence-Assertible') :- x_cid(a65b125e1dade3).
xc_microtheory(a65b125e1dade3,x_PerceptualAgentMt).
xc_source_file(a65b125e1dade3,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dade3,54).
xc_kb_names(a65b125e1dade3,[]).
xc_mapping_rows(a65b125e1dade3,[]).
x_arg2Isa(x_resourceConsumptionLowerBound,x_Resource) :- x_cid(a65b125e1dade4).
xc_microtheory(a65b125e1dade4,x_PerceptualAgentMt).
xc_source_file(a65b125e1dade4,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dade4,55).
xc_kb_names(a65b125e1dade4,[]).
xc_mapping_rows(a65b125e1dade4,[]).
x_arg3Isa(x_resourceConsumptionLowerBound,x_MeasurableQuantity) :- x_cid(a65b125e1dade5).
xc_microtheory(a65b125e1dade5,x_PerceptualAgentMt).
xc_source_file(a65b125e1dade5,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dade5,56).
xc_kb_names(a65b125e1dade5,[]).
xc_mapping_rows(a65b125e1dade5,[]).
x_comment(x_resourceConsumptionLowerBound,"(resourceConsumptionLowerBound ?plan ?resource ?amount) specifies a lower bound on the amount of ?resource that will be consumed (or required) by ?plan.") :- x_cid(a65b125e1dade6).
xc_microtheory(a65b125e1dade6,x_PerceptualAgentMt).
xc_source_file(a65b125e1dade6,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/resources.krf').
xc_source_line(a65b125e1dade6,57).
xc_kb_names(a65b125e1dade6,[]).
xc_mapping_rows(a65b125e1dade6,[]).
kb_cache_footer(footer{count:21,digest:'38cbf3c6337c82ed7b661996d64ed5b4b8b5dad95ddd995870f1937023ec892b',headerDigest:'4b7b75d7f49f113aa82f77f36db5a243ae97d289a4288c5d4d2a7def28e4becf'}).
