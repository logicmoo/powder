:- use_module('c:/snet/petta/repos/openworld_dr/prolog/ow_dr/kb_tail_loader.pl'),kb_tail_loader:load_remaining.
kb_cache_header(cache{converter:logos_compiler_v2,count:71,dialect:kif,implementationHash:'71cb72e234ed2804aaf2e92ed08acd8f3f696c91f9042960c275a96b3d9f69e0',lineCount:582,mappingHash:'5f1e628c0662dd5129c5deca3c808fbe74ebeea2c17071cda1656d04c12d674d',mtPolicy:filename_v1,normalizedDigest:'1acce446965ae1d388d020a96ab0e91d2756fd61dcf71919fba56316f6c4048a',normalizedFile:'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif.pl',options:[encoding(iso_latin_1),features([]),strict_mappings(false),sumo_mappings(auto)],schema:logos_cache_v1,sizeBytes:23952,source:'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif',sourceHash:ddcf4e2077f20ffff53acf4a1093ede09f20d963aa0531da51e1337b8a308e12,warnings:[]}).
x_comment(x_implies(x_and(x_hasMembers(x_LeagueOfArabStates,V1),x_hasMembers(x_LeagueOfArabStates,V2),x_hasPositionIn(V3,x_LeagueOfArabStates,'x_Envoy-Diplomatic'),x_opponentsInConflict(V1,V2,V4)),x_missionOfOrganization(x_LeagueOfArabStates,x_actsInCapacity(V3,x_performedBy,x_CollectionSubsetFn(x_ResolveByMediation,x_TheSetOf(V5,x_resolvedBy(V4,V5))),x_MainFunction))),"If an agent has aposition of envoy in the League of Arab States, then, according to \n          the mission statement of the League of Arab States, as a main\n          function of his position, this agent resolves through mediation disputes between\n          member countries of the League of Arab States.") :- x_cid(a65b1250ab8b98,V1,V2,V3,V4,V5).
xc_microtheory(a65b1250ab8b98,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8b98,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8b98,19).
xc_kb_names(a65b1250ab8b98,["?COUNTRY1","?COUNTRY2","?AGENT","?CONFLICT","?OBJ"]).
xc_mapping_rows(a65b1250ab8b98,['implication-implies']).
xc_direction(a65b1250ab8b98,':BACKWARD').
xc_monotonicity(a65b1250ab8b98,':DEFAULT').
xc_creator(a65b1250ab8b98,'Meyer').
xc_creation_date(a65b1250ab8b98,19990805).
x_implies(x_and(x_hasMembers(x_LeagueOfArabStates,V1),x_hasMembers(x_LeagueOfArabStates,V2),x_opponentsInConflict(V1,V2,V3),x_hasPositionIn(V4,x_LeagueOfArabStates,'x_Envoy-Diplomatic')),x_missionOfOrganization(x_LeagueOfArabStates,x_actsInCapacity(V4,x_performedBy,x_CollectionSubsetFn(x_ResolveByMediation,x_TheSetOf(V5,x_resolvedBy(V3,V5))),x_MainFunction))) :- x_cid(a65b1250ab8b99,V1,V2,V3,V4,V5).
xc_microtheory(a65b1250ab8b99,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8b99,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8b99,39).
xc_kb_names(a65b1250ab8b99,["?COUNTRY1","?COUNTRY2","?CONFLICT","?AGENT","?OBJ"]).
xc_mapping_rows(a65b1250ab8b99,['implication-implies']).
xc_direction(a65b1250ab8b99,':BACKWARD').
xc_monotonicity(a65b1250ab8b99,':DEFAULT').
xc_creator(a65b1250ab8b99,'Meyer').
xc_creation_date(a65b1250ab8b99,19990805).
x_comment(x_MissionStatementOfTheArabLeague,"The mission statement of the League of Arab States.") :- x_cid(a65b1250ab8b9a).
xc_microtheory(a65b1250ab8b9a,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8b9a,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8b9a,55).
xc_kb_names(a65b1250ab8b9a,[]).
xc_mapping_rows(a65b1250ab8b9a,[]).
xc_direction(a65b1250ab8b9a,':FORWARD').
xc_monotonicity(a65b1250ab8b9a,':DEFAULT').
xc_creator(a65b1250ab8b9a,'Meyer').
xc_creation_date(a65b1250ab8b9a,19990723).
x_isa(x_MissionStatementOfTheArabLeague,'x_MissionStatement-Organization') :- x_cid(a65b1250ab8b9b).
xc_microtheory(a65b1250ab8b9b,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8b9b,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8b9b,61).
xc_kb_names(a65b1250ab8b9b,[]).
xc_mapping_rows(a65b1250ab8b9b,[]).
xc_direction(a65b1250ab8b9b,':FORWARD').
xc_monotonicity(a65b1250ab8b9b,':MONOTONIC').
xc_creator(a65b1250ab8b9b,'Meyer').
xc_creation_date(a65b1250ab8b9b,19990723).
x_goals(x_Iran,x_thereExists(V1,'x_increases-Generic'(V1,x_OPEC,x_oilPriceCharged))) :- x_cid(a65b1250ab8b9c,V1).
xc_microtheory(a65b1250ab8b9c,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8b9c,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8b9c,67).
xc_kb_names(a65b1250ab8b9c,["?EVENT"]).
xc_mapping_rows(a65b1250ab8b9c,['exists-thereexists']).
xc_direction(a65b1250ab8b9c,':FORWARD').
xc_monotonicity(a65b1250ab8b9c,':DEFAULT').
x_goalCategoryForAgent(x_Iran,x_thereExists(V1,'x_increases-Generic'(V1,x_OPEC,x_oilPriceCharged)),x_StrategicNationalInterest) :- x_cid(a65b1250ab8b9d,V1).
xc_microtheory(a65b1250ab8b9d,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8b9d,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8b9d,76).
xc_kb_names(a65b1250ab8b9d,["?EVENT"]).
xc_mapping_rows(a65b1250ab8b9d,['exists-thereexists']).
xc_direction(a65b1250ab8b9d,':FORWARD').
xc_monotonicity(a65b1250ab8b9d,':DEFAULT').
xc_creator(a65b1250ab8b9d,'Watson').
xc_creation_date(a65b1250ab8b9d,19990323).
x_goals(x_Libya,x_thereExists(V1,'x_increases-Generic'(V1,x_OPEC,x_oilPriceCharged))) :- x_cid(a65b1250ab8b9e,V1).
xc_microtheory(a65b1250ab8b9e,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8b9e,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8b9e,85).
xc_kb_names(a65b1250ab8b9e,["?EVENT"]).
xc_mapping_rows(a65b1250ab8b9e,['exists-thereexists']).
xc_direction(a65b1250ab8b9e,':FORWARD').
xc_monotonicity(a65b1250ab8b9e,':DEFAULT').
x_goalCategoryForAgent(x_Libya,x_thereExists(V1,'x_increases-Generic'(V1,x_OPEC,x_oilPriceCharged)),x_StrategicNationalInterest) :- x_cid(a65b1250ab8b9f,V1).
xc_microtheory(a65b1250ab8b9f,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8b9f,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8b9f,94).
xc_kb_names(a65b1250ab8b9f,["?EVENT"]).
xc_mapping_rows(a65b1250ab8b9f,['exists-thereexists']).
xc_direction(a65b1250ab8b9f,':FORWARD').
xc_monotonicity(a65b1250ab8b9f,':DEFAULT').
xc_creator(a65b1250ab8b9f,'Watson').
xc_creation_date(a65b1250ab8b9f,19990323).
x_goals(x_Libya,x_thereExists(V1,'x_decreases-Generic'(V1,x_OPEC,x_oilExport))) :- x_cid(a65b1250ab8ba0,V1).
xc_microtheory(a65b1250ab8ba0,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba0,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba0,103).
xc_kb_names(a65b1250ab8ba0,["?EVENT"]).
xc_mapping_rows(a65b1250ab8ba0,['exists-thereexists']).
xc_direction(a65b1250ab8ba0,':FORWARD').
xc_monotonicity(a65b1250ab8ba0,':DEFAULT').
x_goalCategoryForAgent(x_Libya,x_thereExists(V1,'x_decreases-Generic'(V1,x_OPEC,x_oilExport)),x_StrategicNationalInterest) :- x_cid(a65b1250ab8ba1,V1).
xc_microtheory(a65b1250ab8ba1,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba1,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba1,112).
xc_kb_names(a65b1250ab8ba1,["?EVENT"]).
xc_mapping_rows(a65b1250ab8ba1,['exists-thereexists']).
xc_direction(a65b1250ab8ba1,':FORWARD').
xc_monotonicity(a65b1250ab8ba1,':DEFAULT').
xc_creator(a65b1250ab8ba1,'Watson').
xc_creation_date(a65b1250ab8ba1,19990323).
x_goals(x_Iran,x_thereExists(V1,'x_decreases-Generic'(V1,x_OPEC,x_oilExport))) :- x_cid(a65b1250ab8ba2,V1).
xc_microtheory(a65b1250ab8ba2,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba2,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba2,121).
xc_kb_names(a65b1250ab8ba2,["?EVENT"]).
xc_mapping_rows(a65b1250ab8ba2,['exists-thereexists']).
xc_direction(a65b1250ab8ba2,':FORWARD').
xc_monotonicity(a65b1250ab8ba2,':DEFAULT').
x_goalCategoryForAgent(x_Iran,x_thereExists(V1,'x_decreases-Generic'(V1,x_OPEC,x_oilExport)),x_StrategicNationalInterest) :- x_cid(a65b1250ab8ba3,V1).
xc_microtheory(a65b1250ab8ba3,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba3,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba3,130).
xc_kb_names(a65b1250ab8ba3,["?EVENT"]).
xc_mapping_rows(a65b1250ab8ba3,['exists-thereexists']).
xc_direction(a65b1250ab8ba3,':FORWARD').
xc_monotonicity(a65b1250ab8ba3,':DEFAULT').
xc_creator(a65b1250ab8ba3,'Watson').
xc_creation_date(a65b1250ab8ba3,19990323).
x_subOrganizations(x_OPEC,'x_MinisterialMonitoringSubcommittee-OPEC') :- x_cid(a65b1250ab8ba4).
xc_microtheory(a65b1250ab8ba4,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba4,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba4,139).
xc_kb_names(a65b1250ab8ba4,[]).
xc_mapping_rows(a65b1250ab8ba4,[]).
xc_direction(a65b1250ab8ba4,':FORWARD').
xc_monotonicity(a65b1250ab8ba4,':DEFAULT').
xc_creator(a65b1250ab8ba4,'KathyBurns').
xc_creation_date(a65b1250ab8ba4,19990310).
x_statementOfPurpose('x_MinisterialMonitoringSubcommittee-OPEC',"To monitor oil production and exports by #$OPEC member countries.") :- x_cid(a65b1250ab8ba5).
xc_microtheory(a65b1250ab8ba5,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba5,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba5,145).
xc_kb_names(a65b1250ab8ba5,[]).
xc_mapping_rows(a65b1250ab8ba5,[]).
xc_direction(a65b1250ab8ba5,':FORWARD').
xc_monotonicity(a65b1250ab8ba5,':DEFAULT').
xc_creator(a65b1250ab8ba5,'KathyBurns').
xc_creation_date(a65b1250ab8ba5,19990310).
x_statementOfPurpose(x_OPEC,"OPEC is a voluntary intergovernmental organization that coordinates and unifies the petroleum policies of its member countries. OPEC seeks to: (1) ensure the stabilization of oil prices in international oil markets with a view toward eliminating harmful and unnecessary fluctuations while minding the interests of producing nations, and especially their need to secure a steady income. (2) Ensure an efficient, economical, and regular supply of petroleum to consuming nations. (3) Ensure a fair return on capital to those investing in the petroleum industry.") :- x_cid(a65b1250ab8ba6).
xc_microtheory(a65b1250ab8ba6,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba6,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba6,151).
xc_kb_names(a65b1250ab8ba6,[]).
xc_mapping_rows(a65b1250ab8ba6,[]).
xc_direction(a65b1250ab8ba6,':FORWARD').
xc_monotonicity(a65b1250ab8ba6,':DEFAULT').
xc_creator(a65b1250ab8ba6,'KathyBurns').
xc_creation_date(a65b1250ab8ba6,19990310).
x_powerInOrganization(x_SaudiArabia,x_OPEC,x_HighToVeryHigh) :- x_cid(a65b1250ab8ba7).
xc_microtheory(a65b1250ab8ba7,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba7,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba7,157).
xc_kb_names(a65b1250ab8ba7,[]).
xc_mapping_rows(a65b1250ab8ba7,[]).
xc_direction(a65b1250ab8ba7,':FORWARD').
xc_monotonicity(a65b1250ab8ba7,':DEFAULT').
xc_creator(a65b1250ab8ba7,'KathyBurns').
xc_creation_date(a65b1250ab8ba7,19990310).
x_statementOfPurpose(x_IslamicSummitConference,"To define the strategy for achieving the goals of the #$OrganizationOfTheIslamicConference.") :- x_cid(a65b1250ab8ba8).
xc_microtheory(a65b1250ab8ba8,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba8,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba8,163).
xc_kb_names(a65b1250ab8ba8,[]).
xc_mapping_rows(a65b1250ab8ba8,[]).
xc_direction(a65b1250ab8ba8,':FORWARD').
xc_monotonicity(a65b1250ab8ba8,':DEFAULT').
xc_creator(a65b1250ab8ba8,'KathyBurns').
xc_creation_date(a65b1250ab8ba8,19990310).
x_controllingSuborganizations(x_OrganizationOfTheIslamicConference,x_IslamicSummitConference) :- x_cid(a65b1250ab8ba9).
xc_microtheory(a65b1250ab8ba9,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8ba9,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8ba9,169).
xc_kb_names(a65b1250ab8ba9,[]).
xc_mapping_rows(a65b1250ab8ba9,[]).
xc_direction(a65b1250ab8ba9,':FORWARD').
xc_monotonicity(a65b1250ab8ba9,':DEFAULT').
xc_creator(a65b1250ab8ba9,'KathyBurns').
xc_creation_date(a65b1250ab8ba9,19990310).
x_statementOfPurpose(x_OrganizationOfTheIslamicConference,"To promote Islamic solidarity in economic, social, cultural, and political affairs among the Islamic countries of the world.") :- x_cid(a65b1250ab8baa).
xc_microtheory(a65b1250ab8baa,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8baa,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8baa,175).
xc_kb_names(a65b1250ab8baa,[]).
xc_mapping_rows(a65b1250ab8baa,[]).
xc_direction(a65b1250ab8baa,':FORWARD').
xc_monotonicity(a65b1250ab8baa,':DEFAULT').
xc_creator(a65b1250ab8baa,'KathyBurns').
xc_creation_date(a65b1250ab8baa,19990310).
x_isa('x_MinisterialCouncil-OAPEC',x_IKBConstant) :- x_cid(a65b1250ab8bab).
xc_microtheory(a65b1250ab8bab,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bab,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bab,181).
xc_kb_names(a65b1250ab8bab,[]).
xc_mapping_rows(a65b1250ab8bab,[]).
xc_direction(a65b1250ab8bab,':FORWARD').
xc_monotonicity(a65b1250ab8bab,':MONOTONIC').
xc_creator(a65b1250ab8bab,'KathyBurns').
xc_creation_date(a65b1250ab8bab,19990310).
x_statementOfPurpose('x_JudicialTribunal-OAPEC',"To serve as a specialized Arab tribunal \nfor reconciling disputes over petroleum matters between members, or between any member and an oil company\noperating in the territory of the member Judgements of the tribunal are final and binding on the parties to the dispute and enforceable in the territory of the members.") :- x_cid(a65b1250ab8bac).
xc_microtheory(a65b1250ab8bac,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bac,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bac,187).
xc_kb_names(a65b1250ab8bac,[]).
xc_mapping_rows(a65b1250ab8bac,[]).
xc_direction(a65b1250ab8bac,':FORWARD').
xc_monotonicity(a65b1250ab8bac,':DEFAULT').
xc_creator(a65b1250ab8bac,'KathyBurns').
xc_creation_date(a65b1250ab8bac,19990310).
x_implies(x_and(x_isa(V1,x_DisputeEvent),'x_internationalOrg-MemberCountry'(x_OAPEC,V2),x_isa(V3,x_OilCompany),x_opponentsInConflict(V2,V3,V1)),x_capableOfDoing('x_JudicialTribunal-OAPEC',V1,x_judicialAgents)) :- x_cid(a65b1250ab8bad,V1,V2,V3).
xc_microtheory(a65b1250ab8bad,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bad,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bad,195).
xc_kb_names(a65b1250ab8bad,["?DISPUTE","?COUNTRY","?OPPONENT"]).
xc_mapping_rows(a65b1250ab8bad,['implication-implies']).
xc_direction(a65b1250ab8bad,':BACKWARD').
xc_monotonicity(a65b1250ab8bad,':DEFAULT').
xc_creator(a65b1250ab8bad,'KathyBurns').
xc_creation_date(a65b1250ab8bad,19990309).
x_implies(x_and(x_isa(V1,x_DisputeEvent),'x_internationalOrg-MemberCountry'(x_OAPEC,V2),x_isa(V3,x_IndependentCountry),x_opponentsInConflict(V2,V3,V1)),x_capableOfDoing('x_JudicialTribunal-OAPEC',V1,x_judicialAgents)) :- x_cid(a65b1250ab8bae,V1,V2,V3).
xc_microtheory(a65b1250ab8bae,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bae,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bae,207).
xc_kb_names(a65b1250ab8bae,["?DISPUTE","?COUNTRY","?OPPONENT"]).
xc_mapping_rows(a65b1250ab8bae,['implication-implies']).
xc_direction(a65b1250ab8bae,':BACKWARD').
xc_monotonicity(a65b1250ab8bae,':DEFAULT').
xc_creator(a65b1250ab8bae,'KathyBurns').
xc_creation_date(a65b1250ab8bae,19990309).
x_subOrganizations(x_OAPEC,'x_JudicialTribunal-OAPEC') :- x_cid(a65b1250ab8baf).
xc_microtheory(a65b1250ab8baf,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8baf,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8baf,219).
xc_kb_names(a65b1250ab8baf,[]).
xc_mapping_rows(a65b1250ab8baf,[]).
xc_direction(a65b1250ab8baf,':FORWARD').
xc_monotonicity(a65b1250ab8baf,':DEFAULT').
xc_creator(a65b1250ab8baf,'KathyBurns').
xc_creation_date(a65b1250ab8baf,19990309).
x_comment('x_JudicialTribunal-OAPEC',"The judicial unit of #$OAPEC.") :- x_cid(a65b1250ab8bb0).
xc_microtheory(a65b1250ab8bb0,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb0,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb0,225).
xc_kb_names(a65b1250ab8bb0,[]).
xc_mapping_rows(a65b1250ab8bb0,[]).
xc_direction(a65b1250ab8bb0,':FORWARD').
xc_monotonicity(a65b1250ab8bb0,':DEFAULT').
xc_creator(a65b1250ab8bb0,'KathyBurns').
xc_creation_date(a65b1250ab8bb0,19990309).
x_isa('x_JudicialTribunal-OAPEC',x_Tribunal) :- x_cid(a65b1250ab8bb1).
xc_microtheory(a65b1250ab8bb1,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb1,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb1,231).
xc_kb_names(a65b1250ab8bb1,[]).
xc_mapping_rows(a65b1250ab8bb1,[]).
xc_direction(a65b1250ab8bb1,':FORWARD').
xc_monotonicity(a65b1250ab8bb1,':MONOTONIC').
xc_creator(a65b1250ab8bb1,'KathyBurns').
xc_creation_date(a65b1250ab8bb1,19990309).
x_groupMemberType('x_JudicialTribunal-OAPEC',x_IntelligentAgent) :- x_cid(a65b1250ab8bb2).
xc_microtheory(a65b1250ab8bb2,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb2,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb2,237).
xc_kb_names(a65b1250ab8bb2,[]).
xc_mapping_rows(a65b1250ab8bb2,[]).
xc_direction(a65b1250ab8bb2,':FORWARD').
xc_monotonicity(a65b1250ab8bb2,':DEFAULT').
x_isa('x_JudicialTribunal-OAPEC',x_GroupFn(x_IntelligentAgent)) :- x_cid(a65b1250ab8bb3).
xc_microtheory(a65b1250ab8bb3,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb3,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb3,243).
xc_kb_names(a65b1250ab8bb3,[]).
xc_mapping_rows(a65b1250ab8bb3,[]).
xc_direction(a65b1250ab8bb3,':FORWARD').
xc_monotonicity(a65b1250ab8bb3,':MONOTONIC').
xc_creator(a65b1250ab8bb3,'KathyBurns').
xc_creation_date(a65b1250ab8bb3,19990309).
x_implies('x_internationalOrg-MemberCountry'(x_OAPEC,V1),x_trueFormula(x_thereExistExactly(1,V2,x_and(x_citizens(V1,V2),x_hasMembers('x_MinisterialCouncil-OAPEC',V2),x_isa(V2,x_PublicOfficial))))) :- x_cid(a65b1250ab8bb4,V1,V2).
xc_microtheory(a65b1250ab8bb4,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb4,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb4,250).
xc_kb_names(a65b1250ab8bb4,["?COUNTRY","?OFFICIAL"]).
xc_mapping_rows(a65b1250ab8bb4,['implication-implies']).
xc_direction(a65b1250ab8bb4,':BACKWARD').
xc_monotonicity(a65b1250ab8bb4,':DEFAULT').
xc_creator(a65b1250ab8bb4,'KathyBurns').
xc_creation_date(a65b1250ab8bb4,19990309).
x_implies('x_internationalOrg-MemberCountry'(x_OAPEC,V1),x_trueFormula(x_thereExistExactly(1,V2,x_and(x_citizens(V1,V2),x_hasMembers('x_MinisterialCouncil-OAPEC',V2),x_isa(V2,x_PublicOfficial))))) :- x_cid(a65b1250ab8bb5,V1,V2).
xc_microtheory(a65b1250ab8bb5,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb5,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb5,263).
xc_kb_names(a65b1250ab8bb5,["?COUNTRY","?OFFICIAL"]).
xc_mapping_rows(a65b1250ab8bb5,['implication-implies']).
xc_direction(a65b1250ab8bb5,':BACKWARD').
xc_monotonicity(a65b1250ab8bb5,':DEFAULT').
xc_creator(a65b1250ab8bb5,'KathyBurns').
xc_creation_date(a65b1250ab8bb5,19990309).
x_implies('x_internationalOrg-MemberCountry'(x_OAPEC,V1),x_trueFormula(x_thereExistExactly(1,V2,x_and(x_citizens(V1,V2),x_hasMembers('x_MinisterialCouncil-OAPEC',V2),x_isa(V2,x_PublicOfficial))))) :- x_cid(a65b1250ab8bb6,V1,V2).
xc_microtheory(a65b1250ab8bb6,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb6,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb6,276).
xc_kb_names(a65b1250ab8bb6,["?COUNTRY","?OFFICIAL"]).
xc_mapping_rows(a65b1250ab8bb6,['implication-implies']).
xc_direction(a65b1250ab8bb6,':BACKWARD').
xc_monotonicity(a65b1250ab8bb6,':DEFAULT').
xc_creator(a65b1250ab8bb6,'KathyBurns').
xc_creation_date(a65b1250ab8bb6,19990309).
x_arg2Isa('x_SKF-51271520',x_NonNegativeScalarInterval) :- x_cid(a65b1250ab8bb7).
xc_microtheory(a65b1250ab8bb7,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb7,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb7,289).
xc_kb_names(a65b1250ab8bb7,[]).
xc_mapping_rows(a65b1250ab8bb7,[]).
xc_direction(a65b1250ab8bb7,':FORWARD').
xc_monotonicity(a65b1250ab8bb7,':DEFAULT').
x_arg1Isa('x_SKF-51271520',x_Country) :- x_cid(a65b1250ab8bb8).
xc_microtheory(a65b1250ab8bb8,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb8,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb8,295).
xc_kb_names(a65b1250ab8bb8,[]).
xc_mapping_rows(a65b1250ab8bb8,[]).
xc_direction(a65b1250ab8bb8,':FORWARD').
xc_monotonicity(a65b1250ab8bb8,':DEFAULT').
x_resultIsa('x_SKF-51271520',x_PublicOfficial) :- x_cid(a65b1250ab8bb9).
xc_microtheory(a65b1250ab8bb9,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bb9,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bb9,301).
xc_kb_names(a65b1250ab8bb9,[]).
xc_mapping_rows(a65b1250ab8bb9,[]).
xc_direction(a65b1250ab8bb9,':FORWARD').
xc_monotonicity(a65b1250ab8bb9,':DEFAULT').
x_arity('x_SKF-51271520',2) :- x_cid(a65b1250ab8bba).
xc_microtheory(a65b1250ab8bba,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bba,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bba,307).
xc_kb_names(a65b1250ab8bba,[]).
xc_mapping_rows(a65b1250ab8bba,[]).
xc_direction(a65b1250ab8bba,':FORWARD').
xc_monotonicity(a65b1250ab8bba,':MONOTONIC').
x_isa('x_SKF-51271520',x_SkolemFuncN) :- x_cid(a65b1250ab8bbb).
xc_microtheory(a65b1250ab8bbb,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bbb,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bbb,313).
xc_kb_names(a65b1250ab8bbb,[]).
xc_mapping_rows(a65b1250ab8bbb,[]).
xc_direction(a65b1250ab8bbb,':FORWARD').
xc_monotonicity(a65b1250ab8bbb,':MONOTONIC').
x_controllingSuborganizations(x_OAPEC,'x_MinisterialCouncil-OAPEC') :- x_cid(a65b1250ab8bbc).
xc_microtheory(a65b1250ab8bbc,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bbc,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bbc,319).
xc_kb_names(a65b1250ab8bbc,[]).
xc_mapping_rows(a65b1250ab8bbc,[]).
xc_direction(a65b1250ab8bbc,':FORWARD').
xc_monotonicity(a65b1250ab8bbc,':DEFAULT').
xc_creator(a65b1250ab8bbc,'KathyBurns').
xc_creation_date(a65b1250ab8bbc,19990309).
x_statementOfPurpose('x_MinisterialCouncil-OAPEC',"To draw up #$OAPEC's general policy decisions, direct its activities, and make the rules that govern it.") :- x_cid(a65b1250ab8bbd).
xc_microtheory(a65b1250ab8bbd,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bbd,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bbd,325).
xc_kb_names(a65b1250ab8bbd,[]).
xc_mapping_rows(a65b1250ab8bbd,[]).
xc_direction(a65b1250ab8bbd,':FORWARD').
xc_monotonicity(a65b1250ab8bbd,':DEFAULT').
xc_creator(a65b1250ab8bbd,'KathyBurns').
xc_creation_date(a65b1250ab8bbd,19990309).
x_comment('x_MinisterialCouncil-OAPEC',"The leadership unit of #$OAPEC.") :- x_cid(a65b1250ab8bbe).
xc_microtheory(a65b1250ab8bbe,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bbe,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bbe,331).
xc_kb_names(a65b1250ab8bbe,[]).
xc_mapping_rows(a65b1250ab8bbe,[]).
xc_direction(a65b1250ab8bbe,':FORWARD').
xc_monotonicity(a65b1250ab8bbe,':DEFAULT').
xc_creator(a65b1250ab8bbe,'KathyBurns').
xc_creation_date(a65b1250ab8bbe,19990309).
x_isa('x_MinisterialCouncil-OAPEC',x_Organization) :- x_cid(a65b1250ab8bbf).
xc_microtheory(a65b1250ab8bbf,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bbf,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bbf,337).
xc_kb_names(a65b1250ab8bbf,[]).
xc_mapping_rows(a65b1250ab8bbf,[]).
xc_direction(a65b1250ab8bbf,':FORWARD').
xc_monotonicity(a65b1250ab8bbf,':MONOTONIC').
xc_creator(a65b1250ab8bbf,'KathyBurns').
xc_creation_date(a65b1250ab8bbf,19990309).
x_groupMemberType('x_MinisterialCouncil-OAPEC',x_IntelligentAgent) :- x_cid(a65b1250ab8bc0).
xc_microtheory(a65b1250ab8bc0,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc0,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc0,343).
xc_kb_names(a65b1250ab8bc0,[]).
xc_mapping_rows(a65b1250ab8bc0,[]).
xc_direction(a65b1250ab8bc0,':FORWARD').
xc_monotonicity(a65b1250ab8bc0,':DEFAULT').
x_isa('x_MinisterialCouncil-OAPEC',x_GroupFn(x_IntelligentAgent)) :- x_cid(a65b1250ab8bc1).
xc_microtheory(a65b1250ab8bc1,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc1,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc1,349).
xc_kb_names(a65b1250ab8bc1,[]).
xc_mapping_rows(a65b1250ab8bc1,[]).
xc_direction(a65b1250ab8bc1,':FORWARD').
xc_monotonicity(a65b1250ab8bc1,':MONOTONIC').
xc_creator(a65b1250ab8bc1,'KathyBurns').
xc_creation_date(a65b1250ab8bc1,19990309).
x_holdsIn(x_TimeIntervalInclusiveFn(x_YearFn(1968),x_YearFn(1986)),x_memberStatusInOrganization(x_Tunisia,x_OAPEC,x_CurrentMember)) :- x_cid(a65b1250ab8bc2).
xc_microtheory(a65b1250ab8bc2,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc2,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc2,356).
xc_kb_names(a65b1250ab8bc2,[]).
xc_mapping_rows(a65b1250ab8bc2,[]).
xc_direction(a65b1250ab8bc2,':FORWARD').
xc_monotonicity(a65b1250ab8bc2,':DEFAULT').
xc_creator(a65b1250ab8bc2,'KathyBurns').
xc_creation_date(a65b1250ab8bc2,19990309).
x_holdsIn(x_TimeIntervalInclusiveFn(x_YearFn(1986),x_Now),x_memberStatusInOrganization(x_Tunisia,x_OAPEC,x_NonMember)) :- x_cid(a65b1250ab8bc3).
xc_microtheory(a65b1250ab8bc3,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc3,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc3,366).
xc_kb_names(a65b1250ab8bc3,[]).
xc_mapping_rows(a65b1250ab8bc3,[]).
xc_direction(a65b1250ab8bc3,':FORWARD').
xc_monotonicity(a65b1250ab8bc3,':DEFAULT').
xc_creator(a65b1250ab8bc3,'KathyBurns').
xc_creation_date(a65b1250ab8bc3,19990309).
x_statementOfPurpose(x_OAPEC,"To promote cooperation and close ties between the member countries in economic activities related to the oil industry; to determine ways of safeguarding their legitimate interests, both individual and collective, in the oil industry; to unite their efforts so as to ensure the flow of oil to consumer markets on equitable and reasonable terms; and to create a favorable climate for the investment of capital and expertise in their petroleum industries.") :- x_cid(a65b1250ab8bc4).
xc_microtheory(a65b1250ab8bc4,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc4,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc4,375).
xc_kb_names(a65b1250ab8bc4,[]).
xc_mapping_rows(a65b1250ab8bc4,[]).
xc_direction(a65b1250ab8bc4,':FORWARD').
xc_monotonicity(a65b1250ab8bc4,':DEFAULT').
xc_creator(a65b1250ab8bc4,'KathyBurns').
xc_creation_date(a65b1250ab8bc4,19990309).
x_implies(x_and(x_headOfStateOf(V1,V2),'x_internationalOrg-MemberCountry'(x_GulfCooperationCouncil,V2)),x_hasMembers('x_SupremeCouncil-GCC',V1)) :- x_cid(a65b1250ab8bc5,V1,V2).
xc_microtheory(a65b1250ab8bc5,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc5,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc5,381).
xc_kb_names(a65b1250ab8bc5,["?PERSON","?COUNTRY"]).
xc_mapping_rows(a65b1250ab8bc5,['implication-implies']).
xc_direction(a65b1250ab8bc5,':BACKWARD').
xc_monotonicity(a65b1250ab8bc5,':DEFAULT').
xc_creator(a65b1250ab8bc5,'KathyBurns').
xc_creation_date(a65b1250ab8bc5,19990309).
x_powerInOrganization(x_SaudiArabia,x_GulfCooperationCouncil,x_HighToVeryHigh) :- x_cid(a65b1250ab8bc6).
xc_microtheory(a65b1250ab8bc6,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc6,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc6,391).
xc_kb_names(a65b1250ab8bc6,[]).
xc_mapping_rows(a65b1250ab8bc6,[]).
xc_direction(a65b1250ab8bc6,':FORWARD').
xc_monotonicity(a65b1250ab8bc6,':DEFAULT').
xc_creator(a65b1250ab8bc6,'KathyBurns').
xc_creation_date(a65b1250ab8bc6,19990309).
x_keyMembers(x_GulfCooperationCouncil,x_SaudiArabia) :- x_cid(a65b1250ab8bc7).
xc_microtheory(a65b1250ab8bc7,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc7,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc7,397).
xc_kb_names(a65b1250ab8bc7,[]).
xc_mapping_rows(a65b1250ab8bc7,[]).
xc_direction(a65b1250ab8bc7,':FORWARD').
xc_monotonicity(a65b1250ab8bc7,':DEFAULT').
xc_creator(a65b1250ab8bc7,'KathyBurns').
xc_creation_date(a65b1250ab8bc7,19990309).
x_controllingSuborganizations(x_GulfCooperationCouncil,'x_SupremeCouncil-GCC') :- x_cid(a65b1250ab8bc8).
xc_microtheory(a65b1250ab8bc8,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc8,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc8,403).
xc_kb_names(a65b1250ab8bc8,[]).
xc_mapping_rows(a65b1250ab8bc8,[]).
xc_direction(a65b1250ab8bc8,':FORWARD').
xc_monotonicity(a65b1250ab8bc8,':DEFAULT').
xc_creator(a65b1250ab8bc8,'KathyBurns').
xc_creation_date(a65b1250ab8bc8,19990309).
x_statementOfPurpose('x_SupremeCouncil-GCC',"To provide guidance and direction on decisions made by the #$GulfCooperationCouncil.") :- x_cid(a65b1250ab8bc9).
xc_microtheory(a65b1250ab8bc9,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bc9,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bc9,409).
xc_kb_names(a65b1250ab8bc9,[]).
xc_mapping_rows(a65b1250ab8bc9,[]).
xc_direction(a65b1250ab8bc9,':FORWARD').
xc_monotonicity(a65b1250ab8bc9,':DEFAULT').
xc_creator(a65b1250ab8bc9,'KathyBurns').
xc_creation_date(a65b1250ab8bc9,19990309).
x_statementOfPurpose(x_GulfCooperationCouncil,"To effect coordination, integration, and interconnection between member states in all fields in order to achieve unity between them; to deepen and strengthen relations, links, and scopes of cooperation prevailing between their people in various fields; to formulate similar regulations in various fields, including economic and financial affairs, agriculture, industry, commerce, customs, and communications, education and culture, social and health affairs, information and tourism, and legislative and administrative affairs; to stimulate scientific and technological progress in various fields; to establish scientific research centers and implement common projects; and to encourage cooperation by the private sector.") :- x_cid(a65b1250ab8bca).
xc_microtheory(a65b1250ab8bca,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bca,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bca,415).
xc_kb_names(a65b1250ab8bca,[]).
xc_mapping_rows(a65b1250ab8bca,[]).
xc_direction(a65b1250ab8bca,':FORWARD').
xc_monotonicity(a65b1250ab8bca,':DEFAULT').
xc_creator(a65b1250ab8bca,'KathyBurns').
xc_creation_date(a65b1250ab8bca,19990309).
x_behaviorCapable('x_JointDefenseCouncil-ArabLeague',x_PassingAResolution,x_performedBy) :- x_cid(a65b1250ab8bcb).
xc_microtheory(a65b1250ab8bcb,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bcb,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bcb,421).
xc_kb_names(a65b1250ab8bcb,[]).
xc_mapping_rows(a65b1250ab8bcb,[]).
xc_direction(a65b1250ab8bcb,':FORWARD').
xc_monotonicity(a65b1250ab8bcb,':DEFAULT').
xc_creator(a65b1250ab8bcb,'KathyBurns').
xc_creation_date(a65b1250ab8bcb,19990309).
x_implies(x_and(x_isa(V1,x_DisputeEvent),'x_internationalOrg-MemberCountry'(x_LeagueOfArabStates,V2),x_opponentsInConflict(V2,V3,V1)),x_capableOfDoing(x_CouncilOfTheArabLeague,V1,x_mediators)) :- x_cid(a65b1250ab8bcc,V1,V2,V3).
xc_microtheory(a65b1250ab8bcc,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bcc,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bcc,427).
xc_kb_names(a65b1250ab8bcc,["?DISPUTE","?COUNTRY","?COUNTRY-1"]).
xc_mapping_rows(a65b1250ab8bcc,['implication-implies']).
xc_direction(a65b1250ab8bcc,':BACKWARD').
xc_monotonicity(a65b1250ab8bcc,':DEFAULT').
xc_creator(a65b1250ab8bcc,'KathyBurns').
xc_creation_date(a65b1250ab8bcc,19990309).
x_implies(x_and(x_isa(V1,x_MilitaryAttack),x_maleficiary(V1,V2),'x_internationalOrg-MemberCountry'(x_LeagueOfArabStates,V2)),x_holdsIn(x_STIF(V1),x_givesSupportToAgent(x_LeagueOfArabStates,V2,x_HighAmountFn(x_MilitarySupport)))) :- x_cid(a65b1250ab8bcd,V1,V2).
xc_microtheory(a65b1250ab8bcd,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bcd,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bcd,438).
xc_kb_names(a65b1250ab8bcd,["?ATTACK","?COUNTRY"]).
xc_mapping_rows(a65b1250ab8bcd,['implication-implies']).
xc_direction(a65b1250ab8bcd,':BACKWARD').
xc_monotonicity(a65b1250ab8bcd,':DEFAULT').
xc_creator(a65b1250ab8bcd,'KathyBurns').
xc_creation_date(a65b1250ab8bcd,19990309).
x_implies(x_and('x_internationalOrg-MemberCountry'(x_LeagueOfArabStates,V1),x_hasPositionIn(V2,V1,x_MinisterOfForeignAffairs)),x_hasMembers('x_JointDefenseCouncil-ArabLeague',V2)) :- x_cid(a65b1250ab8bce,V1,V2).
xc_microtheory(a65b1250ab8bce,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bce,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bce,452).
xc_kb_names(a65b1250ab8bce,["?COUNTRY","?PERSON"]).
xc_mapping_rows(a65b1250ab8bce,['implication-implies']).
xc_direction(a65b1250ab8bce,':BACKWARD').
xc_monotonicity(a65b1250ab8bce,':DEFAULT').
xc_creator(a65b1250ab8bce,'KathyBurns').
xc_creation_date(a65b1250ab8bce,19990309).
x_implies(x_and('x_internationalOrg-MemberCountry'(x_LeagueOfArabStates,V1),x_hasPositionIn(V2,V1,x_MinisterOfDefense)),x_hasMembers('x_JointDefenseCouncil-ArabLeague',V2)) :- x_cid(a65b1250ab8bcf,V1,V2).
xc_microtheory(a65b1250ab8bcf,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bcf,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bcf,462).
xc_kb_names(a65b1250ab8bcf,["?COUNTRY","?PERSON"]).
xc_mapping_rows(a65b1250ab8bcf,['implication-implies']).
xc_direction(a65b1250ab8bcf,':BACKWARD').
xc_monotonicity(a65b1250ab8bcf,':DEFAULT').
xc_creator(a65b1250ab8bcf,'KathyBurns').
xc_creation_date(a65b1250ab8bcf,19990309).
x_subOrganizations(x_LeagueOfArabStates,'x_JointDefenseCouncil-ArabLeague') :- x_cid(a65b1250ab8bd0).
xc_microtheory(a65b1250ab8bd0,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd0,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd0,472).
xc_kb_names(a65b1250ab8bd0,[]).
xc_mapping_rows(a65b1250ab8bd0,[]).
xc_direction(a65b1250ab8bd0,':FORWARD').
xc_monotonicity(a65b1250ab8bd0,':DEFAULT').
xc_creator(a65b1250ab8bd0,'KathyBurns').
xc_creation_date(a65b1250ab8bd0,19990309).
x_implies('x_internationalOrg-MemberCountry'(x_LeagueOfArabStates,V1),x_agreeingAgents('x_JointDefenseAndEconomicCooperationTreaty-ArabLeague',V1)) :- x_cid(a65b1250ab8bd1,V1).
xc_microtheory(a65b1250ab8bd1,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd1,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd1,478).
xc_kb_names(a65b1250ab8bd1,["?COUNTRY"]).
xc_mapping_rows(a65b1250ab8bd1,['implication-implies']).
xc_direction(a65b1250ab8bd1,':BACKWARD').
xc_monotonicity(a65b1250ab8bd1,':DEFAULT').
xc_creator(a65b1250ab8bd1,'KathyBurns').
xc_creation_date(a65b1250ab8bd1,19990309).
x_startingDate('x_JointDefenseAndEconomicCooperationTreaty-ArabLeague',x_YearFn(1950)) :- x_cid(a65b1250ab8bd2).
xc_microtheory(a65b1250ab8bd2,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd2,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd2,486).
xc_kb_names(a65b1250ab8bd2,[]).
xc_mapping_rows(a65b1250ab8bd2,[]).
xc_direction(a65b1250ab8bd2,':FORWARD').
xc_monotonicity(a65b1250ab8bd2,':DEFAULT').
xc_creator(a65b1250ab8bd2,'KathyBurns').
xc_creation_date(a65b1250ab8bd2,19990309).
x_implies('x_internationalOrg-MemberCountry'(x_LeagueOfArabStates,V1),x_trueFormula(x_thereExistExactly(1,V2,x_and(x_citizens(V1,V2),x_hasMembers(x_CouncilOfTheArabLeague,V2))))) :- x_cid(a65b1250ab8bd3,V1,V2).
xc_microtheory(a65b1250ab8bd3,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd3,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd3,493).
xc_kb_names(a65b1250ab8bd3,["?COUNTRY","?REP"]).
xc_mapping_rows(a65b1250ab8bd3,['implication-implies']).
xc_direction(a65b1250ab8bd3,':BACKWARD').
xc_monotonicity(a65b1250ab8bd3,':DEFAULT').
xc_creator(a65b1250ab8bd3,'KathyBurns').
xc_creation_date(a65b1250ab8bd3,19990309).
x_implies('x_internationalOrg-MemberCountry'(x_LeagueOfArabStates,V1),x_trueFormula(x_thereExistExactly(1,V2,x_and(x_citizens(V1,V2),x_hasMembers(x_CouncilOfTheArabLeague,V2))))) :- x_cid(a65b1250ab8bd4,V1,V2).
xc_microtheory(a65b1250ab8bd4,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd4,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd4,505).
xc_kb_names(a65b1250ab8bd4,["?COUNTRY","?REP"]).
xc_mapping_rows(a65b1250ab8bd4,['implication-implies']).
xc_direction(a65b1250ab8bd4,':BACKWARD').
xc_monotonicity(a65b1250ab8bd4,':DEFAULT').
xc_creator(a65b1250ab8bd4,'KathyBurns').
xc_creation_date(a65b1250ab8bd4,19990309).
x_arg2Isa('x_SKF-57799934',x_NonNegativeScalarInterval) :- x_cid(a65b1250ab8bd5).
xc_microtheory(a65b1250ab8bd5,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd5,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd5,517).
xc_kb_names(a65b1250ab8bd5,[]).
xc_mapping_rows(a65b1250ab8bd5,[]).
xc_direction(a65b1250ab8bd5,':FORWARD').
xc_monotonicity(a65b1250ab8bd5,':DEFAULT').
x_arg1Isa('x_SKF-57799934',x_Country) :- x_cid(a65b1250ab8bd6).
xc_microtheory(a65b1250ab8bd6,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd6,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd6,523).
xc_kb_names(a65b1250ab8bd6,[]).
xc_mapping_rows(a65b1250ab8bd6,[]).
xc_direction(a65b1250ab8bd6,':FORWARD').
xc_monotonicity(a65b1250ab8bd6,':DEFAULT').
x_holdsIn(x_YearFn(1993),x_memberStatusInOrganization(x_Iraq,x_LeagueOfArabStates,x_SuspendedMember)) :- x_cid(a65b1250ab8bd7).
xc_microtheory(a65b1250ab8bd7,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd7,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd7,529).
xc_kb_names(a65b1250ab8bd7,[]).
xc_mapping_rows(a65b1250ab8bd7,[]).
xc_direction(a65b1250ab8bd7,':FORWARD').
xc_monotonicity(a65b1250ab8bd7,':DEFAULT').
xc_creator(a65b1250ab8bd7,'KathyBurns').
xc_creation_date(a65b1250ab8bd7,19990309).
x_implies(x_and('x_internationalOrg-MemberCountry'(x_LeagueOfArabStates,V1),x_different(V1,V2),'x_internationalOrg-MemberCountry'(x_LeagueOfArabStates,V2)),x_allies(V1,V2)) :- x_cid(a65b1250ab8bd8,V1,V2).
xc_microtheory(a65b1250ab8bd8,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd8,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd8,537).
xc_kb_names(a65b1250ab8bd8,["?NATION1","?NATION2"]).
xc_mapping_rows(a65b1250ab8bd8,['implication-implies']).
xc_direction(a65b1250ab8bd8,':BACKWARD').
xc_monotonicity(a65b1250ab8bd8,':DEFAULT').
xc_creator(a65b1250ab8bd8,'KathyBurns').
xc_creation_date(a65b1250ab8bd8,19990309).
x_statementOfPurpose(x_LeagueOfArabStates,"The League seeks to promote closer ties among member states and coordinate their policies and economic, cultural, and security plans with a view to developing collective cooperation, protecting national security, maintaining the independence and sovereignty of member states, and enhancing the potential for joint Arab action in all fields. In the political field, the League is entrusted with the tasks of defending the interests and national causes of the Arab world. The League is also entrusted with the task of examining whichever disputes may arise between member states and to adopt whichever resolutions and measures as may be deemed necessary to settle such disputes by peaceful means.") :- x_cid(a65b1250ab8bd9).
xc_microtheory(a65b1250ab8bd9,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bd9,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bd9,548).
xc_kb_names(a65b1250ab8bd9,[]).
xc_mapping_rows(a65b1250ab8bd9,[]).
xc_direction(a65b1250ab8bd9,':FORWARD').
xc_monotonicity(a65b1250ab8bd9,':DEFAULT').
xc_creator(a65b1250ab8bd9,'KathyBurns').
xc_creation_date(a65b1250ab8bd9,19990309).
x_statementOfPurpose(x_CouncilOfTheArabLeague,"The Council focuses on realizing the objectives of the League and implementing plans and programs that the member states adopt. The Coucil also acts to mediate disputes that threaten or lead to the eruption of hostilities between two of the member states or between a member state and a third party.") :- x_cid(a65b1250ab8bda).
xc_microtheory(a65b1250ab8bda,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bda,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bda,554).
xc_kb_names(a65b1250ab8bda,[]).
xc_mapping_rows(a65b1250ab8bda,[]).
xc_direction(a65b1250ab8bda,':FORWARD').
xc_monotonicity(a65b1250ab8bda,':DEFAULT').
xc_creator(a65b1250ab8bda,'KathyBurns').
xc_creation_date(a65b1250ab8bda,19990309).
x_controllingSuborganizations(x_LeagueOfArabStates,x_CouncilOfTheArabLeague) :- x_cid(a65b1250ab8bdb).
xc_microtheory(a65b1250ab8bdb,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bdb,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bdb,560).
xc_kb_names(a65b1250ab8bdb,[]).
xc_mapping_rows(a65b1250ab8bdb,[]).
xc_direction(a65b1250ab8bdb,':FORWARD').
xc_monotonicity(a65b1250ab8bdb,':DEFAULT').
xc_creator(a65b1250ab8bdb,'KathyBurns').
xc_creation_date(a65b1250ab8bdb,19990309).
x_isa('x_SKF-57799934',x_SkolemFuncN) :- x_cid(a65b1250ab8bdc).
xc_microtheory(a65b1250ab8bdc,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bdc,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bdc,566).
xc_kb_names(a65b1250ab8bdc,[]).
xc_mapping_rows(a65b1250ab8bdc,[]).
xc_direction(a65b1250ab8bdc,':FORWARD').
xc_monotonicity(a65b1250ab8bdc,':MONOTONIC').
x_arity('x_SKF-57799934',2) :- x_cid(a65b1250ab8bdd).
xc_microtheory(a65b1250ab8bdd,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bdd,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bdd,572).
xc_kb_names(a65b1250ab8bdd,[]).
xc_mapping_rows(a65b1250ab8bdd,[]).
xc_direction(a65b1250ab8bdd,':FORWARD').
xc_monotonicity(a65b1250ab8bdd,':MONOTONIC').
x_resultIsa('x_SKF-57799934',x_Person) :- x_cid(a65b1250ab8bde).
xc_microtheory(a65b1250ab8bde,x_RegionalOrganizationsInTheMiddleEastFactsheetMt).
xc_source_file(a65b1250ab8bde,'c:/snet/petta/repos/openworld_dr/KBs/ROITMEF.kif').
xc_source_line(a65b1250ab8bde,578).
xc_kb_names(a65b1250ab8bde,[]).
xc_mapping_rows(a65b1250ab8bde,[]).
xc_direction(a65b1250ab8bde,':FORWARD').
xc_monotonicity(a65b1250ab8bde,':DEFAULT').
kb_cache_footer(footer{count:71,digest:'1acce446965ae1d388d020a96ab0e91d2756fd61dcf71919fba56316f6c4048a',headerDigest:bac7ed6948a3ead0e7798c61cc0a9e03d5d1e4bbe92696591df6679f6f13d6b6}).
