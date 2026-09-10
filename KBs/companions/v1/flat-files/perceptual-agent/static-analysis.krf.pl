:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:44,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:195,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:a77521cb1bb2daeea450707649385107eeb9b1bbf2d8d21c8073bd9dacc2a357,normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:8518,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf',sourceHash:'6969eaeee222de3f40afaf5ec462e3caf6f87912be8a7e3e8e31073a0bb573d6',warnings:[]}).
x_isa(x_performStaticAnalysis,x_ComplexActionPredicate) :- x_cid(a65b125e21150f).
xc_microtheory(a65b125e21150f,x_PerceptualAgentMt).
xc_source_file(a65b125e21150f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21150f,11).
xc_kb_names(a65b125e21150f,[]).
xc_mapping_rows(a65b125e21150f,[]).
x_arity(x_performStaticAnalysis,1) :- x_cid(a65b125e211510).
xc_microtheory(a65b125e211510,x_PerceptualAgentMt).
xc_source_file(a65b125e211510,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211510,12).
xc_kb_names(a65b125e211510,[]).
xc_mapping_rows(a65b125e211510,[]).
x_arg1Isa(x_performStaticAnalysis,x_CompanionsDomain) :- x_cid(a65b125e211511).
xc_microtheory(a65b125e211511,x_PerceptualAgentMt).
xc_source_file(a65b125e211511,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211511,13).
xc_kb_names(a65b125e211511,[]).
xc_mapping_rows(a65b125e211511,[]).
x_comment(x_performStaticAnalysis,"(performStaticAnalysis ?domain) analyzes the domain using the domain action preconditions and effects, and reifies the results.") :- x_cid(a65b125e211512).
xc_microtheory(a65b125e211512,x_PerceptualAgentMt).
xc_source_file(a65b125e211512,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211512,14).
xc_kb_names(a65b125e211512,[]).
xc_mapping_rows(a65b125e211512,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_performStaticAnalysis(V1),x_actionSequence(x_TheList(x_reifyFunctionalRoles(V1),x_doAgentPlan(x_reifyDomainPlanningGraph(V1)))))) :- x_cid(a65b125e211513,V1).
xc_microtheory(a65b125e211513,x_PerceptualAgentMt).
xc_source_file(a65b125e211513,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211513,17).
xc_kb_names(a65b125e211513,["?domain"]).
xc_mapping_rows(a65b125e211513,[]).
x_isa(x_reifyDomainPlanningGraph,x_ComplexActionPredicate) :- x_cid(a65b125e211514).
xc_microtheory(a65b125e211514,x_PerceptualAgentMt).
xc_source_file(a65b125e211514,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211514,27).
xc_kb_names(a65b125e211514,[]).
xc_mapping_rows(a65b125e211514,[]).
x_arity(x_reifyDomainPlanningGraph,1) :- x_cid(a65b125e211515).
xc_microtheory(a65b125e211515,x_PerceptualAgentMt).
xc_source_file(a65b125e211515,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211515,28).
xc_kb_names(a65b125e211515,[]).
xc_mapping_rows(a65b125e211515,[]).
x_arg1Isa(x_reifyDomainPlanningGraph,x_CompanionsDomain) :- x_cid(a65b125e211516).
xc_microtheory(a65b125e211516,x_PerceptualAgentMt).
xc_source_file(a65b125e211516,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211516,29).
xc_kb_names(a65b125e211516,[]).
xc_mapping_rows(a65b125e211516,[]).
x_comment(x_reifyDomainPlanningGraph,"(reifyDomainPlanningGraph ?domain) analyzes the domain using the domain action preconditions and effects, and reifies the results.") :- x_cid(a65b125e211517).
xc_microtheory(a65b125e211517,x_PerceptualAgentMt).
xc_source_file(a65b125e211517,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211517,30).
xc_kb_names(a65b125e211517,[]).
xc_mapping_rows(a65b125e211517,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_ActionModelMtFn(V2)),x_uninferredSentence(x_lookupOnly(x_kbOnly('x_ist-Information'(V1,x_enablementRelation(V3,V4,V5))))),x_evaluate(V6,x_TheClosedRetrievalSetOf(V7,x_and(x_outsourcedOnly(x_enablementRelation(V8,V4,V9)),x_unifies(V7,'x_ist-Information'(V1,x_enablementRelation(V8,V4,V9))))))),x_methodForAction(x_reifyDomainPlanningGraph(V2),x_actionSequence(x_TheList(x_doAnnounce("~%Reifying planning-graph in ~a",[V1]),x_doRecordMembers(V6))))) :- x_cid(a65b125e211518,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e211518,x_PerceptualAgentMt).
xc_source_file(a65b125e211518,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211518,33).
xc_kb_names(a65b125e211518,["?context","?domain","?p1","?prop","?p2","?planning-graph","?stmt","?pred1","?pred2"]).
xc_mapping_rows(a65b125e211518,[note("doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 51, column 54), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged.")]).
xc_notices(a65b125e211518,["doAnnounce argument 2 is preserved as recursive list data (descriptor at source line 51, column 54), retaining singleton/nested lists and normally encoded symbol markers. Other arguments and source bytes are unchanged."]).
x_preconditionForMethod(x_true,x_methodForAction(x_reifyDomainPlanningGraph(V1),x_actionSequence(x_TheList))) :- x_cid(a65b125e211519,V1).
xc_microtheory(a65b125e211519,x_PerceptualAgentMt).
xc_source_file(a65b125e211519,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211519,54).
xc_kb_names(a65b125e211519,["?domain"]).
xc_mapping_rows(a65b125e211519,[]).
'x_<=='(x_preferInContext(x_reifyDomainPlanningGraph(V1),V2,V3),x_different(V2,x_actionSequence(x_TheList))) :- x_cid(a65b125e21151a,V1,V2,V3).
xc_microtheory(a65b125e21151a,x_PerceptualAgentMt).
xc_source_file(a65b125e21151a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21151a,61).
xc_kb_names(a65b125e21151a,["?domain","?seq1","?seq2"]).
xc_mapping_rows(a65b125e21151a,[]).
x_isa(x_reifyFunctionalRoles,x_ComplexActionPredicate) :- x_cid(a65b125e21151b).
xc_microtheory(a65b125e21151b,x_PerceptualAgentMt).
xc_source_file(a65b125e21151b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21151b,64).
xc_kb_names(a65b125e21151b,[]).
xc_mapping_rows(a65b125e21151b,[]).
x_arity(x_reifyFunctionalRoles,1) :- x_cid(a65b125e21151c).
xc_microtheory(a65b125e21151c,x_PerceptualAgentMt).
xc_source_file(a65b125e21151c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21151c,65).
xc_kb_names(a65b125e21151c,[]).
xc_mapping_rows(a65b125e21151c,[]).
x_arg1Isa(x_reifyFunctionalRoles,x_CompanionsDomain) :- x_cid(a65b125e21151d).
xc_microtheory(a65b125e21151d,x_PerceptualAgentMt).
xc_source_file(a65b125e21151d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21151d,66).
xc_kb_names(a65b125e21151d,[]).
xc_mapping_rows(a65b125e21151d,[]).
x_comment(x_reifyFunctionalRoles,"(reifyFunctionalRoles ?domain) analyzes the domain w.r.t. type-level capabilities and reifies functional roles on that basis.") :- x_cid(a65b125e21151e).
xc_microtheory(a65b125e21151e,x_PerceptualAgentMt).
xc_source_file(a65b125e21151e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21151e,67).
xc_kb_names(a65b125e21151e,[]).
xc_mapping_rows(a65b125e21151e,[]).
x_preconditionForMethod(x_and(x_unifies(V1,x_StrategyModelMtFn(V2)),x_uninferredSentence(x_lookupOnly(x_kbOnly('x_ist-Information'(V1,x_capabilityRole(V3))))),x_domainActorType(V2,V4),x_evaluate(V5,x_TheClosedRetrievalSetOf(t(V6,V7),x_capabilityGroup(V4,V6,V7))),x_evaluate(V8,x_TheClosedRetrievalSetOf(t(V6,V7),x_typePartitionedGroups(V6,V7)))),x_methodForAction(x_reifyFunctionalRoles(V2),x_actionSequence(x_TheList(x_doForEach(t(V6,V7),V5,x_reifyFunctionalRole(V1,V6,V7)),x_doForEach(t(V6,V7),V8,x_reifyFunctionalRole(V1,V6,V7)))))) :- x_cid(a65b125e21151f,V1,V2,V3,V4,V5,V6,V7,V8).
xc_microtheory(a65b125e21151f,x_PerceptualAgentMt).
xc_source_file(a65b125e21151f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21151f,70).
xc_kb_names(a65b125e21151f,["?context","?domain","?r","?parent-type","?groups","?subtypes","?capabilities","?type-groups"]).
xc_mapping_rows(a65b125e21151f,[]).
x_preconditionForMethod(x_true,x_methodForAction(x_reifyFunctionalRoles(V1),x_actionSequence(x_TheList))) :- x_cid(a65b125e211520,V1).
xc_microtheory(a65b125e211520,x_PerceptualAgentMt).
xc_source_file(a65b125e211520,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211520,102).
xc_kb_names(a65b125e211520,["?domain"]).
xc_mapping_rows(a65b125e211520,[]).
'x_<=='(x_preferInContext(x_reifyFunctionalRoles(V1),V2,V3),x_different(V2,x_actionSequence(x_TheList))) :- x_cid(a65b125e211521,V1,V2,V3).
xc_microtheory(a65b125e211521,x_PerceptualAgentMt).
xc_source_file(a65b125e211521,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211521,109).
xc_kb_names(a65b125e211521,["?domain","?seq1","?seq2"]).
xc_mapping_rows(a65b125e211521,[]).
x_isa(x_reifyFunctionalRole,x_ComplexActionPredicate) :- x_cid(a65b125e211522).
xc_microtheory(a65b125e211522,x_PerceptualAgentMt).
xc_source_file(a65b125e211522,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211522,112).
xc_kb_names(a65b125e211522,[]).
xc_mapping_rows(a65b125e211522,[]).
x_arity(x_reifyFunctionalRole,3) :- x_cid(a65b125e211523).
xc_microtheory(a65b125e211523,x_PerceptualAgentMt).
xc_source_file(a65b125e211523,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211523,113).
xc_kb_names(a65b125e211523,[]).
xc_mapping_rows(a65b125e211523,[]).
x_arg1Isa(x_reifyFunctionalRole,x_Microtheory) :- x_cid(a65b125e211524).
xc_microtheory(a65b125e211524,x_PerceptualAgentMt).
xc_source_file(a65b125e211524,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211524,114).
xc_kb_names(a65b125e211524,[]).
xc_mapping_rows(a65b125e211524,[]).
x_arg2Isa(x_reifyFunctionalRole,'x_Set-Mathematical') :- x_cid(a65b125e211525).
xc_microtheory(a65b125e211525,x_PerceptualAgentMt).
xc_source_file(a65b125e211525,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211525,115).
xc_kb_names(a65b125e211525,[]).
xc_mapping_rows(a65b125e211525,[]).
x_arg3Isa(x_reifyFunctionalRole,'x_Set-Mathematical') :- x_cid(a65b125e211526).
xc_microtheory(a65b125e211526,x_PerceptualAgentMt).
xc_source_file(a65b125e211526,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211526,116).
xc_kb_names(a65b125e211526,[]).
xc_mapping_rows(a65b125e211526,[]).
x_comment(x_reifyFunctionalRole,"(reifyFunctionalRole ?context ?subtypes ?capabilities) reifies an individual capability role.") :- x_cid(a65b125e211527).
xc_microtheory(a65b125e211527,x_PerceptualAgentMt).
xc_source_file(a65b125e211527,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211527,117).
xc_kb_names(a65b125e211527,[]).
xc_mapping_rows(a65b125e211527,[]).
x_preconditionForMethod(x_and(x_outsourcedOnly(x_nextPersistentCounterValue(x_CapabilityRole,V1)),x_evaluate(V2,x_SymbolConcatenateFn(x_TheList(x_CapabilityRole,V1)))),x_methodForAction(x_reifyFunctionalRole(V3,V4,V5),x_actionSequence(x_TheList(x_doRecord('x_ist-Information'(V3,x_isa(V2,x_CapabilityRole))),x_doRecord('x_ist-Information'(V3,x_capabilityRole(V2))),x_doForEach(V6,V4,x_doRecord('x_ist-Information'(V3,x_roleMemberType(V6,V2)))),x_doForEach(V7,V5,x_doRecord('x_ist-Information'(V3,x_roleEntailsCapability(V2,V7)))))))) :- x_cid(a65b125e211528,V1,V2,V3,V4,V5,V6,V7).
xc_microtheory(a65b125e211528,x_PerceptualAgentMt).
xc_source_file(a65b125e211528,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211528,119).
xc_kb_names(a65b125e211528,["?r","?role","?context","?subtypes","?capabilities","?subtype","?capability"]).
xc_mapping_rows(a65b125e211528,[]).
x_isa(x_uniqueActionCapabilities,x_BinaryPredicate) :- x_cid(a65b125e211529).
xc_microtheory(a65b125e211529,x_PerceptualAgentMt).
xc_source_file(a65b125e211529,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211529,134).
xc_kb_names(a65b125e211529,[]).
xc_mapping_rows(a65b125e211529,[]).
x_arity(x_uniqueActionCapabilities,2) :- x_cid(a65b125e21152a).
xc_microtheory(a65b125e21152a,x_PerceptualAgentMt).
xc_source_file(a65b125e21152a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21152a,135).
xc_kb_names(a65b125e21152a,[]).
xc_mapping_rows(a65b125e21152a,[]).
x_arg1Isa(x_uniqueActionCapabilities,'x_Set-Mathematical') :- x_cid(a65b125e21152b).
xc_microtheory(a65b125e21152b,x_PerceptualAgentMt).
xc_source_file(a65b125e21152b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21152b,136).
xc_kb_names(a65b125e21152b,[]).
xc_mapping_rows(a65b125e21152b,[]).
x_arg2Isa(x_uniqueActionCapabilities,'x_Set-Mathematical') :- x_cid(a65b125e21152c).
xc_microtheory(a65b125e21152c,x_PerceptualAgentMt).
xc_source_file(a65b125e21152c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21152c,137).
xc_kb_names(a65b125e21152c,[]).
xc_mapping_rows(a65b125e21152c,[]).
x_comment(x_uniqueActionCapabilities,"(uniqueActionCapabilities ?subtypes ?capabilities) means actor types ?subtypes are uniquely capable of performing primitive actions in the set ?capabilities.") :- x_cid(a65b125e21152d).
xc_microtheory(a65b125e21152d,x_PerceptualAgentMt).
xc_source_file(a65b125e21152d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21152d,138).
xc_kb_names(a65b125e21152d,[]).
xc_mapping_rows(a65b125e21152d,[]).
'x_<=='(x_uniqueActionCapabilities(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_and(x_actionPrimitive(V5),x_arg1Isa(V5,V4)))),x_lookupOnly(x_elementOf(V6,V3)),x_uninferredSentence(x_someSatisfies(V7,V3,x_properSpecOf(V7,V6))),x_someSatisfies(V8,V3,x_properSpecOf(V6,V8)),x_evaluate(V2,x_TheClosedRetrievalSetOf(V5,x_and(x_actionPrimitive(V5),x_arg1Isa(V5,V6)))),x_evaluate(V1,x_TheClosedRetrievalSetOf(V9,x_genls(V9,V6)))) :- x_cid(a65b125e21152e,V1,V2,V3,V4,V5,V6,V7,V8,V9).
xc_microtheory(a65b125e21152e,x_PerceptualAgentMt).
xc_source_file(a65b125e21152e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21152e,140).
xc_kb_names(a65b125e21152e,["?subtypes","?capabilities","?actor-types","?actor-type","?pred","?subtype","?child","?parent","?spec"]).
xc_mapping_rows(a65b125e21152e,[]).
x_isa(x_properSpecOf,x_BinaryPredicate) :- x_cid(a65b125e21152f).
xc_microtheory(a65b125e21152f,x_PerceptualAgentMt).
xc_source_file(a65b125e21152f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21152f,157).
xc_kb_names(a65b125e21152f,[]).
xc_mapping_rows(a65b125e21152f,[]).
x_arity(x_properSpecOf,2) :- x_cid(a65b125e211530).
xc_microtheory(a65b125e211530,x_PerceptualAgentMt).
xc_source_file(a65b125e211530,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211530,158).
xc_kb_names(a65b125e211530,[]).
xc_mapping_rows(a65b125e211530,[]).
x_arg1Isa(x_properSpecOf,x_Collection) :- x_cid(a65b125e211531).
xc_microtheory(a65b125e211531,x_PerceptualAgentMt).
xc_source_file(a65b125e211531,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211531,159).
xc_kb_names(a65b125e211531,[]).
xc_mapping_rows(a65b125e211531,[]).
x_arg2Isa(x_properSpecOf,x_Collection) :- x_cid(a65b125e211532).
xc_microtheory(a65b125e211532,x_PerceptualAgentMt).
xc_source_file(a65b125e211532,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211532,160).
xc_kb_names(a65b125e211532,[]).
xc_mapping_rows(a65b125e211532,[]).
x_comment(x_properSpecOf,"(properSpecOf ?col1 ?col2) is the irreflexive version of genls.") :- x_cid(a65b125e211533).
xc_microtheory(a65b125e211533,x_PerceptualAgentMt).
xc_source_file(a65b125e211533,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211533,161).
xc_kb_names(a65b125e211533,[]).
xc_mapping_rows(a65b125e211533,[]).
'x_<=='(x_properSpecOf(V1,V2),x_genls(V1,V2),x_different(V1,V2)) :- x_cid(a65b125e211534,V1,V2).
xc_microtheory(a65b125e211534,x_PerceptualAgentMt).
xc_source_file(a65b125e211534,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211534,163).
xc_kb_names(a65b125e211534,["?child","?parent"]).
xc_mapping_rows(a65b125e211534,[]).
x_isa(x_typePartitionedGroups,x_BinaryPredicate) :- x_cid(a65b125e211535).
xc_microtheory(a65b125e211535,x_PerceptualAgentMt).
xc_source_file(a65b125e211535,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211535,167).
xc_kb_names(a65b125e211535,[]).
xc_mapping_rows(a65b125e211535,[]).
x_arity(x_typePartitionedGroups,2) :- x_cid(a65b125e211536).
xc_microtheory(a65b125e211536,x_PerceptualAgentMt).
xc_source_file(a65b125e211536,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211536,168).
xc_kb_names(a65b125e211536,[]).
xc_mapping_rows(a65b125e211536,[]).
x_arg1Isa(x_typePartitionedGroups,'x_Set-Mathematical') :- x_cid(a65b125e211537).
xc_microtheory(a65b125e211537,x_PerceptualAgentMt).
xc_source_file(a65b125e211537,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211537,169).
xc_kb_names(a65b125e211537,[]).
xc_mapping_rows(a65b125e211537,[]).
x_arg2Isa(x_typePartitionedGroups,'x_Set-Mathematical') :- x_cid(a65b125e211538).
xc_microtheory(a65b125e211538,x_PerceptualAgentMt).
xc_source_file(a65b125e211538,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211538,170).
xc_kb_names(a65b125e211538,[]).
xc_mapping_rows(a65b125e211538,[]).
x_comment(x_typePartitionedGroups,"(typePartitionedGroups ?subtypes ?capabilities) means actor types ?subtypes are a faceted partition of a parent collection.") :- x_cid(a65b125e211539).
xc_microtheory(a65b125e211539,x_PerceptualAgentMt).
xc_source_file(a65b125e211539,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e211539,171).
xc_kb_names(a65b125e211539,[]).
xc_mapping_rows(a65b125e211539,[]).
'x_<=='(x_typePartitionedGroups(V1,V2),x_evaluate(V3,x_TheClosedRetrievalSetOf(V4,x_and(x_actionPrimitive(V5),x_arg1Isa(V5,V4),x_partitionedInto(V4,V1)))),x_lookupOnly(x_elementOf(V4,V3)),x_partitionedInto(V4,V6),x_evaluate(V7,x_FormulaArgListFn(V6)),x_memberOfList(V8,V7),x_evaluate(V1,x_TheClosedRetrievalSetOf(V9,x_properSpecOf(V9,V8))),x_evaluate(V2,x_TheClosedRetrievalSetOf(V5,x_and(x_actionPrimitive(V5),x_arg1Isa(V5,V10),x_lookupOnly(x_elementOf(V10,x_TheSet(V4,V8))),x_everySatisfies(V11,V1,x_performableByType(V5,V11)))))) :- x_cid(a65b125e21153a,V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11).
xc_microtheory(a65b125e21153a,x_PerceptualAgentMt).
xc_source_file(a65b125e21153a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/perceptual-agent/static-analysis.krf').
xc_source_line(a65b125e21153a,173).
xc_kb_names(a65b125e21153a,["?subtypes","?capabilities","?actor-types","?actor-type","?pred","?intermediate-types","?partition-list","?intermediate-type","?spec","?type","?subtype"]).
xc_mapping_rows(a65b125e21153a,[]).
kb_cache_footer(footer{count:44,digest:a77521cb1bb2daeea450707649385107eeb9b1bbf2d8d21c8073bd9dacc2a357,headerDigest:'1535a3cc34efc8c6aa983532eda7f48ce153c073cb5b07b570ee42e88fc3fd96'}).
