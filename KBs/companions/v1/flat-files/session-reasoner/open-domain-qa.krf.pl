:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:14,dialect:krf,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:135,mappingHash:none,mtPolicy:filename_v1,normalizedDigest:'4d0e98048ded4385cb13040afa35107f87985144627a1db380a408644a5c48d6',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:4546,source:'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf',sourceHash:'526acf9c2c3c62a4767a655996b7dd39c061af18592eaa9ea906eb7c09799240',warnings:[]}).
x_defSuggestion(x_SharedFocusQuery,x_userQuery(V1),':cost-function',1,':subgoals',t(x_sessionContext(V2),'x_ist-Information'(V2,x_localOnly(x_sharedFocus(V2,V3))),x_focalQuery(V3,V1))) :- x_cid(a65b125e47b114,V1,V2,V3).
xc_microtheory(a65b125e47b114,x_CompanionsMt).
xc_source_file(a65b125e47b114,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b114,28).
xc_kb_names(a65b125e47b114,["?query","?sess-ctxt","?ctxt"]).
xc_mapping_rows(a65b125e47b114,[]).
x_defSuggestion(x_QueryInSessionContext,x_userQuery(V1),':cost-function',2,':subgoals',t(x_sessionContext(V2),'x_ist-Information'(V2,V1))) :- x_cid(a65b125e47b115,V1,V2).
xc_microtheory(a65b125e47b115,x_CompanionsMt).
xc_source_file(a65b125e47b115,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b115,36).
xc_kb_names(a65b125e47b115,["?qry","?sess-ctxt"]).
xc_mapping_rows(a65b125e47b115,[]).
x_defSuggestion(x_BackgroundKnowledgeQuery,x_userQuery(V1),':cost-function',3,':subgoals',t('x_ist-Information'('x_CurrentWorldDataCollectorMt-NonHomocentric',V1))) :- x_cid(a65b125e47b116,V1).
xc_microtheory(a65b125e47b116,x_CompanionsMt).
xc_source_file(a65b125e47b116,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b116,43).
xc_kb_names(a65b125e47b116,["?query"]).
xc_mapping_rows(a65b125e47b116,[]).
x_defSuggestion(x_RoleIndependentQuery,x_focalQuery(V1,V2),':subgoals',t('x_ist-Information'(V1,V2))) :- x_cid(a65b125e47b117,V1,V2).
xc_microtheory(a65b125e47b117,x_CompanionsMt).
xc_source_file(a65b125e47b117,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b117,49).
xc_kb_names(a65b125e47b117,["?ctxt","?query"]).
xc_mapping_rows(a65b125e47b117,[]).
x_defSuggestion(x_RoleRelativeQuery,x_focalQuery(V1,V2),':test',x_containsPattern('x_SelfToken-Indexical',V2),':subgoals',t(x_introspectiveQuery(V1,V2))) :- x_cid(a65b125e47b118,V1,V2).
xc_microtheory(a65b125e47b118,x_CompanionsMt).
xc_source_file(a65b125e47b118,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b118,53).
xc_kb_names(a65b125e47b118,["?ctxt","?query"]).
xc_mapping_rows(a65b125e47b118,[]).
x_defSuggestion(x_FocalIntrospection,x_introspectiveQuery(V1,V2),':subgoals',t('x_ist-Information'(V1,x_playsRole(V1,'x_SelfToken-Indexical',V3)),x_evaluate(V4,x_SublisFn(x_TheSet('x_SelfToken-Indexical'(V3)),V2)),'x_ist-Information'(V1,V4))) :- x_cid(a65b125e47b119,V1,V2,V3,V4).
xc_microtheory(a65b125e47b119,x_CompanionsMt).
xc_source_file(a65b125e47b119,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b119,60).
xc_kb_names(a65b125e47b119,["?ctxt","?query","?role","?new-query"]).
xc_mapping_rows(a65b125e47b119,[]).
x_defSuggestion(x_GenericIntrospection,x_introspectiveQuery(V1,V2),':subgoals',t('x_ist-Information'(x_SelfModelMt,V2))) :- x_cid(a65b125e47b11a,V1,V2).
xc_microtheory(a65b125e47b11a,x_CompanionsMt).
xc_source_file(a65b125e47b11a,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b11a,70).
xc_kb_names(a65b125e47b11a,["?ctxt","?query"]).
xc_mapping_rows(a65b125e47b11a,[]).
x_defSuggestion(x_SpecpredCountryOfCity,x_objectFoundInLocation(V1,V2),':test',x_and(x_variableExpression(V2),x_isa(V1,x_City)),':subgoals',t(x_countryOfCity(V3,V1)),':result-step',x_unifies(V2,x_TerritoryFn(V3))) :- x_cid(a65b125e47b11b,V1,V2,V3).
xc_microtheory(a65b125e47b11b,x_CompanionsMt).
xc_source_file(a65b125e47b11b,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b11b,86).
xc_kb_names(a65b125e47b11b,["?city","?loc","?country"]).
xc_mapping_rows(a65b125e47b11b,[]).
x_defSuggestion(x_SpecpredCityInState,x_objectFoundInLocation(V1,V2),':test',x_and(x_variableExpression(V2),x_isa(V1,x_City)),':subgoals',t(x_cityInState(V3,V1)),':result-step',x_unifies(V2,x_TerritoryFn(V3))) :- x_cid(a65b125e47b11c,V1,V2,V3).
xc_microtheory(a65b125e47b11c,x_CompanionsMt).
xc_source_file(a65b125e47b11c,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b11c,92).
xc_kb_names(a65b125e47b11c,["?city","?loc","?state"]).
xc_mapping_rows(a65b125e47b11c,[]).
x_defSuggestion(x_SpecpredPlaceInCity,x_objectFoundInLocation(V1,V2),':test',x_variableExpression(V2),':subgoals',t(x_placeInCity(V1,V3)),':result-step',x_unifies(V2,x_TerritoryFn(V3))) :- x_cid(a65b125e47b11d,V1,V2,V3).
xc_microtheory(a65b125e47b11d,x_CompanionsMt).
xc_source_file(a65b125e47b11d,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b11d,98).
xc_kb_names(a65b125e47b11d,["?obj","?loc","?city"]).
xc_mapping_rows(a65b125e47b11d,[]).
x_defSuggestion(x_TransitivityGeographicalSubRegions,x_objectFoundInLocation(V1,V2),':test',x_and(x_groundExpression(V1),x_groundExpression(V2)),':cost-function',2,':subgoals',t(x_objectFoundInLocation(V1,V3),x_geographicalSubRegions(V2,V3))) :- x_cid(a65b125e47b11e,V1,V2,V3).
xc_microtheory(a65b125e47b11e,x_CompanionsMt).
xc_source_file(a65b125e47b11e,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b11e,105).
xc_kb_names(a65b125e47b11e,["?obj","?loc","?where"]).
xc_mapping_rows(a65b125e47b11e,[]).
x_defSuggestion(x_SpecpredGeographicalSubRegionsOfContinent,x_objectFoundInLocation(V1,V2),':test',x_variableExpression(V2),':subgoals',t(x_geographicalSubRegionsOfContinent(V2,x_TerritoryFn(V1)))) :- x_cid(a65b125e47b11f,V1,V2).
xc_microtheory(a65b125e47b11f,x_CompanionsMt).
xc_source_file(a65b125e47b11f,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b11f,112).
xc_kb_names(a65b125e47b11f,["?obj","?loc"]).
xc_mapping_rows(a65b125e47b11f,[]).
x_defSuggestion(x_SpecpredEventOccursInCountry,x_eventOccursAt(V1,V2),':test',x_variableExpression(V2),':subgoals',t(x_eventOccursInCountry(V1,V3)),':result-step',x_unifies(V2,x_TerritoryFn(V3))) :- x_cid(a65b125e47b120,V1,V2,V3).
xc_microtheory(a65b125e47b120,x_CompanionsMt).
xc_source_file(a65b125e47b120,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b120,119).
xc_kb_names(a65b125e47b120,["?evt","?loc","?country"]).
xc_mapping_rows(a65b125e47b120,[]).
x_defSuggestion('x_SpecpredMotionPathway-Complete',x_eventOccursAt(V1,V2),':test',x_variableExpression(V2),':subgoals',t('x_motionPathway-Complete'(V1,V2))) :- x_cid(a65b125e47b121,V1,V2).
xc_microtheory(a65b125e47b121,x_CompanionsMt).
xc_source_file(a65b125e47b121,'c:/snet/petta/repos/openworld_dr/KBs/companions/v1/flat-files/session-reasoner/open-domain-qa.krf').
xc_source_line(a65b125e47b121,125).
xc_kb_names(a65b125e47b121,["?evt","?loc"]).
xc_mapping_rows(a65b125e47b121,[]).
kb_cache_footer(footer{count:14,digest:'4d0e98048ded4385cb13040afa35107f87985144627a1db380a408644a5c48d6',headerDigest:'2ba41203e90ed968862ddae8d7c10df9eeedf580f084883a1f48edba9b09688a'}).
