:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:5,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:42,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'6271a734d52d5e58792437ba3158ec123b03777d28bd4e76edda033d7d6a94ad',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/measurement-plans.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:1838,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/measurement-plans.krf',sourceHash:'0c6486631b160a5ec1670619f2b8f099dd70bf3b518ea19001f2b3cd91c7f5e0',warnings:[]}).
x_isa(x_measureGoalInfluencers,x_ComplexActionPredicate) :- x_cid(a65b125dfe3d2f).
xc_microtheory(a65b125dfe3d2f,x_PerceptualAgentMt).
xc_source_file(a65b125dfe3d2f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/measurement-plans.krf').
xc_source_line(a65b125dfe3d2f,22).
xc_kb_names(a65b125dfe3d2f,[]).
xc_mapping_rows(a65b125dfe3d2f,[]).
x_arity(x_measureGoalInfluencers,1) :- x_cid(a65b125dfe3d30).
xc_microtheory(a65b125dfe3d30,x_PerceptualAgentMt).
xc_source_file(a65b125dfe3d30,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/measurement-plans.krf').
xc_source_line(a65b125dfe3d30,23).
xc_kb_names(a65b125dfe3d30,[]).
xc_mapping_rows(a65b125dfe3d30,[]).
x_arg1Isa(x_measureGoalInfluencers,x_Goal) :- x_cid(a65b125dfe3d31).
xc_microtheory(a65b125dfe3d31,x_PerceptualAgentMt).
xc_source_file(a65b125dfe3d31,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/measurement-plans.krf').
xc_source_line(a65b125dfe3d31,24).
xc_kb_names(a65b125dfe3d31,[]).
xc_mapping_rows(a65b125dfe3d31,[]).
x_comment(x_measureGoalInfluencers,"(measureGoalInfluencers ?goal) collects \nquantitative subgoals of ?goal and adds them to the measure-quantities of \nthe agent in order to reify their value measurements in the execution trace.") :- x_cid(a65b125dfe3d32).
xc_microtheory(a65b125dfe3d32,x_PerceptualAgentMt).
xc_source_file(a65b125dfe3d32,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/measurement-plans.krf').
xc_source_line(a65b125dfe3d32,25).
xc_kb_names(a65b125dfe3d32,[]).
xc_mapping_rows(a65b125dfe3d32,[]).
x_preconditionForMethod(x_and(x_influencingQuantities(V1,V2),x_currentMeasureQuantities(V3),x_evaluate(V4,x_SetOrCollectionUnion(V3,V2))),x_methodForAction(x_measureGoalInfluencers(V1),x_actionSequence(x_TheList(x_doSetMeasureQuantities(V4))))) :- x_cid(a65b125dfe3d33,V1,V2,V3,V4).
xc_microtheory(a65b125dfe3d33,x_PerceptualAgentMt).
xc_source_file(a65b125dfe3d33,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/measurement-plans.krf').
xc_source_line(a65b125dfe3d33,29).
xc_kb_names(a65b125dfe3d33,["?goal","?influencer-set","?initial-set","?quantity-set"]).
xc_mapping_rows(a65b125dfe3d33,[]).
kb_cache_footer(footer{count:5,digest:'6271a734d52d5e58792437ba3158ec123b03777d28bd4e76edda033d7d6a94ad',headerDigest:a9785ba7c20197677a192fddafa9057b922d2680bcb8967f49353609f044cc81}).
